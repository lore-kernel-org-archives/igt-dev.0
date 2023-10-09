Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Oct 2023 14:27:51 +0200
Message-ID: <20231009122750.519112-13-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 00/11] Kunit fixes and improvements
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
  lib/kunit: Fix handling of potential errors from F_GETFL
  lib/kunit: Be more verbose on errors
  lib/kunit: Fix misplaced igt_kunit() doc
  lib/kunit: Parse KTAP report from the main process thread
  lib/kunit: Omit suite name prefix if the same as subtest name
  tests/kms_selftest: Let subtest names match suite names
  lib/ktap: Drop workaround for missing top level KTAP headers
  lib/kunit: Provide all results cleanup helper
  lib/kunit: Prepare for KTAP parsing after modprobe completed
  lib/kunit: Fetch a list of test cases in advance
  lib/kunit: Execute kunit test cases only when needed

 lib/igt_kmod.c              | 418 ++++++++++++++++++++++----
 lib/igt_ktap.c              | 580 ------------------------------------
 lib/igt_ktap.h              |  22 --
 lib/tests/igt_ktap_parser.c |   3 +-
 tests/kms_selftest.c        |  37 +--
 5 files changed, 374 insertions(+), 686 deletions(-)

-- 
2.42.0
