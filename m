Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Oct 2023 16:17:35 +0200
Message-ID: <20231011141734.590321-13-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 00/11] Kunit fixes and improvements
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

v3: Preserve backward compatibility with older kernels:
    - drop "lib/ktap: Drop workaround for missing top level KTAP headers",
      add "lib/ktap: Improve TODO workaround description" instead,
    - keep legacy processing patch when obtainig a list of test cases from
      kunit modules occurs not supported,
  - print debug message on pthread_kill() error once per loop (Mauro),
  - move "parent" field of the structure near other pthread_* type fields
    (Kamil),
  - drop unneeded explicit return from noop void function (Kamil),
  - if (!err) looks strange, add a comment (Kamil),
  - preserve a link to KTAP standard in a comment above the winning
    implementation of KTAP parser (Kamil).
v2: Add a new patch that provides all results cleanup helper,
  - split out changes in handling of modprobe errors and kernel taints from
    "Fetch a list of test cases in advance" to separate patches (Kamil),
  - prepare for KTAP parsing after modprobe completed in a separate
    patch,
  - drop other modprobe and kernel taint related changes from the series,
  - fix some string duplicates referenced from filtered out test cases not
    freed,
  - always pass last result to next dynamic sub-subtest, fetch first
    result right after loading the kunit test module for execution,
  - still break the loop of test cases on unexpected return codes from
    kunit_kmsg_get_result(),
  - fix typos (Kamil),
  - update commit descriptions.

Janusz Krzysztofik (11):
  lib/ktap: Improve TODO workaround description
  lib/kunit: Fix handling of potential errors from F_GETFL
  lib/kunit: Be more verbose on errors
  lib/kunit: Fix misplaced igt_kunit() doc
  lib/kunit: Parse KTAP report from the main process thread
  lib/kunit: Omit suite name prefix if the same as subtest name
  tests/kms_selftest: Let subtest names match suite names
  lib/kunit: Provide all results cleanup helper
  lib/kunit: Prepare for KTAP parsing after modprobe completed
  lib/kunit: Fetch a list of test cases in advance
  lib/kunit: Execute kunit test cases only when needed

 lib/igt_kmod.c       | 571 +++++++++++++++++++++++++++++++++++++-----
 lib/igt_ktap.c       | 582 +------------------------------------------
 lib/igt_ktap.h       |  22 --
 tests/kms_selftest.c |  37 ++-
 4 files changed, 540 insertions(+), 672 deletions(-)

-- 
2.42.0
