Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Dale B Stimson <dale.b.stimson@intel.com>
Date: Fri, 14 Feb 2020 18:33:29 -0800
Message-Id: <20200215023331.41469-1-dale.b.stimson@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 0/2] mmio_base via debugfs infrastructure
 + gem_ctx_isolation
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
To: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

v4:
Functionally identical to V3.
- Commentary - name of potential future method for getting info from sysfs
  changed from _mmio_base_info_get_via_sysfs() to
  _gem_engine_mmio_base_info_get_sysfs().

- Patches squashed in order to avoid compilation break in between, from:
    i915/gem_ctx_isolation: Check engine relative registers
    i915/gem_ctx_isolation: Check engine relative registers - Part 2
to:
    i915/gem_ctx_isolation: Check engine relative registers (revised)

- The narrative below has been modified.

For the record, a separate patch exists that provides support for
the proposed sysfs source of mmio_base information via new function
_gem_engine_mmio_base_info_get_sysfs().  It depends on this patch series.
It is planned to send it to the ML separately.
    lib/i915/gem_mmio_base.c - add support for mmio_base via sysfs

v3:
- Remove v2 early-exit patches (previous 4/5 and 5/5).  The underlying
  issue was addressed via a separately-submitted patch.

v2:
- Introduce and use igt_exit_early() so that a failed initialization
  (in igt_fixture) will not attempt to invoke the per-engine loop.
- Initialize mmio_base db inside initial igt_fixture instead of after.
- Some additional functions handle NULL input mmio_base db pointer.
- Variables mbp and mmio_base initialized to NULL/0 so their values will
  not be uninitialized for --list-subtests.
- Failure to obtain an mmio_base db is now igt_debug instead of
  igt_warn.

This patch series provides infrastructure to allow determination of i915
per-engine mmio_base (which is otherwise sometimes hard to get).  The provided
method uses debugfs mmio_base information if present.  Otherwise, a default
determination is provided when possible.  Also, gem_ctx_isolation is modified
to use the new infrastructure.

For example, on TGL, gem_ctx_isolation (without these or similar changes)
will fail for subtests that use engine vcs1.

On 2020-01-27 (most recently), Chris Wilson sent this patch series to the ML:
  [igt-dev] [PATCH i-g-t 1/5] i915: Start putting the mmio_base to wider use
  [igt-dev] [PATCH i-g-t 2/5] i915/gem_ctx_isolation: Check engine relative registers
plus the following, which are not addressed here:
  [igt-dev] [PATCH i-g-t 3/5] i915: Exercise preemption timeout controls in sysfs
  [igt-dev] [PATCH i-g-t 4/5] i915: Exercise sysfs heartbeat controls
  [igt-dev] [PATCH i-g-t 5/5] i915: Exercise timeslice sysfs property

This patch series is:
  i915/gem_mmio_base.c - get mmio_base from debugfs (if possible)
  i915/gem_ctx_isolation: Check engine relative registers (revised)

The first patch of the earlier series obtains mmio_base information
via sysfs, and depends on a proposed kernel change that would provide
the mmio_base information via sysfs.

The mmio_base information used by this patch series is available
through debugfs now (as of kernel 5.4).  If the per-engine mmio_base
information is ever added to sysfs, a patch is already available
to plug that into the infrastructure proposed here as an additional
higher-priority source of that information.

As compared to the original patch series, this submission replaces
the first patch and retains the second patch with modifications to
support the changed API.

Some differences from the 2020-01-27 patches:

The mmio_base information is fetched once into local data structures, and
is obtained from them thereafter instead of being fetched from the kernel
everytime it is wanted.

The function that obtains the mmio_base information is called by a particular
test that wants it, and returns a handle through which the mmio_base can be
requested for any particular engine.

These patches introduce new source files lib/i915/gem_mmio_base.c
and lib/i915/gem_mmio_base.h.

The 2020-01-27 patch series define function gem_engine_mmio_base()
with its first parameter as "fd".  The new patch series replace the
first parameter with the mmio_base object handle.

Chris Wilson (1):
  i915/gem_ctx_isolation: Check engine relative registers (revised)

Dale B Stimson (1):
  i915/gem_mmio_base.c - get mmio_base from debugfs (if possible)

 lib/Makefile.sources           |   2 +
 lib/i915/gem_mmio_base.c       | 354 +++++++++++++++++++++++++++++++++
 lib/i915/gem_mmio_base.h       |  19 ++
 lib/igt.h                      |   1 +
 lib/meson.build                |   1 +
 tests/i915/gem_ctx_isolation.c | 229 ++++++++++++---------
 6 files changed, 514 insertions(+), 92 deletions(-)
 create mode 100644 lib/i915/gem_mmio_base.c
 create mode 100644 lib/i915/gem_mmio_base.h

-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
