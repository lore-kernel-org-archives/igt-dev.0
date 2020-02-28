Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 28 Feb 2020 09:46:34 +0100
Message-Id: <20200228084636.30045-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH i-g-t v4 0/2] tests/gem_userptr_blits: Enhance
 invalid mapping exercise
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Attempts to create a userptr object on top of a GTT mapping to another
GEM object are currently expected to succeed.  However, attempts to pin
the object pages in memory are expected to fail with -EFAULT.

Having a closer look at the driver behavior we can see that the very
first operation which tries to set the object pages fails with -EAGAIN.
Moreover, if I915_USERPTR_UNSYNCHRONIZED flag has been used by object
creation, MMU notifier is activated for the object.  Consecutive
attempts may also fail with -EAGAIN while the driver tries to acquire
the pages in background, with the MMU notifier still possibly active,
but meanwhile, the background attempt to pin the pages in memory
finally fails, the notifier is deactivated, and all following set pages
operations fail with -EFAULT.
    
That behavior can be observed for userptr objects created on top of
any mapping types supported by MMAP_GTT API v4 aka MMAP_OFFSET.
    
A currently unavoidable lockdep loop related to userptr MMU notifier
exists inside the i915 driver.  The lockdep loop occurrence is believed
to be possible for a userptr object created on top of any type of
mmap-offset mapping.  For that to happen, userptr MMU notifier, which
is the source of the lockdep issue, must be activated for the object.
That is possible only if the object has been created without
I915_USERPTR_UNSYNCHRONIZED flag.

There is a subtests which already exercises the driver behavior for
userptr objects created on top of GTT mappings only.  Moreover, the
exercise is performed on userptr objects created only with the
I915_USERPTR_UNSYNCHRONIZED flag set, then, the MMU notifier is never
activated.

Extend the scope of the subtest by converting it to a set of dynamic
subtests which exercise each MMAP_OFFSET mapping type supported by
hardware.  Moreover, since the driver detailed behavior depends on the
I915_USERPTR_UNSYNCHRONIZED flag being requested or not by object
creation, move the subtest to a section where the state of the flag,
which now defaults to being set, is set explicitly.  Also, rename the
subtest to reflect that change.

Clone the subtest to a "-sync" variant so objects created without the
I915_USERPTR_UNSYNCHRONIZED flag are also exercised.  In that case, try
to anger lockdep, but since that seems hardly possible, also display a
warning for as long as we believe the lockdep splat is possible in that
scenario.  Also, don't fail but skip should the driver ever refuse to
create synchronized userptr objects on top of invalid mappings.

v2: For as long as the lockdep loop issue is not fixed, don't succeed
    if a preventive failure occurs but skip (Chris),
  - otherwise, warn about possible risk,
  - put a FIXME placeholder until we learn how to anger lockdep.
v3: Use dynamic subtests, with skips handled at mmap-offset attempt
    performed by the test anyway (Chris),
  - for better clarity of the patch, drop cosmetic only changes,
  - use more concise wording in subtest description.
v4: Split into two patches, with still unsuccessful lockdep loop
    trigger attempts separated from changes aimed at extending
    subtest coverage over new mapping types,
  - move the subtest to "unsynchronized" section,
  - as lockdep loop can happen only for userptr objects created without
    I915_USERPTR_UNSYNCHRONIZED flag, introduce a new "-sync" variant
    of the subtest which examines userptr objects created with the flag
    not set,
  - move lockdep loop trigger attempt to a separate function and call
    it only when the I915_USERPTR_UNSYNCHRONIZED flag is not set,
  - actually try to anger lockdep using gem_set_tiling() (Chris).
  - rebase on top of "lib/i915: Restrict mmap types to GTT if no
    MMAP_OFFSET support".

Janusz Krzysztofik (2):
  tests/gem_userptr_blits: Exercise new invalid mapping types
  tests/gem_userptr_blits: Try to anger lockdep with invalid mappings

 tests/i915/gem_userptr_blits.c | 91 +++++++++++++++++++++++++++-------
 1 file changed, 74 insertions(+), 17 deletions(-)

-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
