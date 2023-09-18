Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Sep 2023 15:42:50 +0200
Message-ID: <20230918134249.31645-19-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 00/17] Fix IGT Kunit implementation issues
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>,
 intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

v3: Also call igt_skip() on igt_ktest_init() failure (Mauro), but then,
    initialize local tst structure when declaring it to avoid freeing a
    random pointer from igt_ktest_fini() when only listing subtests,
  - call igt_ktest_end() from igt_fixture so it is not unnecessarily
    called when only listing subtests,
  - drop EINTR handling completely as not applicable since SIGINT default
    signal handler kills the whole process anyway,
  - update commit description to also mention read error handling fix,
  - interrupt blocking read() on modprobe failure.
v2: Fix incorrect and missing includes in the test source file,
  - add license and copyright clauses to the test source file.

Janusz Krzysztofik (17):
  lib/kunit: Drop unused file stream
  lib/kunit: Stop loading kunit module explicitly
  lib/kunit: Fix struct kmod_module kunit_kmod not freed
  lib/kunit: Optimize calls to igt_success/skip/fail()
  lib/kunit: Fix illegal igt_fail() calls inside subtest body
  lib/ktap: Make sure we fail on premature cancel
  lib/ktap: Drop checks for EINTR on read() failures
  lib/kunit: Cancel KTP parser on module load failure
  lib/ktap: Drop is_running flag
  lib/ktap: Read /dev/kmsg in blocking mode
  lib/kunit: Fail / skip on kernel taint
  lib/ktap: Use IGT linked lists for storing KTAP results
  lib/ktap: Reimplement KTAP parser
  lib/kunit: Load test modules in background
  lib/kunit: Parse KTAP report from the main process thread
  lib/kunit: Strip "_test" or "_kunit" suffix from subtest names
  lib/kunit: Omit suite name prefix if the same as subtest name

 lib/igt_kmod.c              | 320 ++++++++++----
 lib/igt_ktap.c              | 833 ++++++++++++------------------------
 lib/igt_ktap.h              |  28 +-
 lib/tests/igt_ktap_parser.c | 246 +++++++++++
 lib/tests/meson.build       |   1 +
 tests/drm_mm.c              |  42 +-
 6 files changed, 775 insertions(+), 695 deletions(-)
 create mode 100644 lib/tests/igt_ktap_parser.c

-- 
2.41.0
