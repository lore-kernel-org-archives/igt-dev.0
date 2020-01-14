Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A9F6E321
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2020 09:17:51 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 14 Jan 2020 11:17:44 +0200
Message-Id: <20200114091745.4555-3-petri.latvala@intel.com>
In-Reply-To: <20200114091745.4555-1-petri.latvala@intel.com>
References: <20200114091745.4555-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/4] runner_tests: Add new mockup test binary
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

'dynamic' is a new mockup test binary. It has one subtest with two
dynamic subtests, first of which will fail.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 runner/runner_tests.c       |  4 ++--
 runner/testdata/dynamic.c   | 12 ++++++++++++
 runner/testdata/meson.build |  1 +
 3 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 runner/testdata/dynamic.c

diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index 9bbc4252..a232aa2b 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -25,9 +25,9 @@ static const char testdatadir[] = TESTDATA_DIRECTORY;
  * that test binaries without subtests should still be counted as one
  * for this macro.
  */
-#define NUM_TESTDATA_SUBTESTS 5
+#define NUM_TESTDATA_SUBTESTS 6
 /* The total number of test binaries in runner/testdata/ */
-#define NUM_TESTDATA_BINARIES 3
+#define NUM_TESTDATA_BINARIES 4
 
 static void igt_assert_eqstr(const char *one, const char *two)
 {
diff --git a/runner/testdata/dynamic.c b/runner/testdata/dynamic.c
new file mode 100644
index 00000000..8e5de7d9
--- /dev/null
+++ b/runner/testdata/dynamic.c
@@ -0,0 +1,12 @@
+#include "igt.h"
+
+igt_main
+{
+	igt_subtest_with_dynamic("dynamic-subtest") {
+		igt_dynamic("failing")
+			igt_assert(false);
+
+		igt_dynamic("passing")
+			;
+	}
+}
diff --git a/runner/testdata/meson.build b/runner/testdata/meson.build
index 2456f82a..631ba5b9 100644
--- a/runner/testdata/meson.build
+++ b/runner/testdata/meson.build
@@ -2,6 +2,7 @@
 testdata_progs = [ 'successtest',
 		   'no-subtests',
 		   'skippers',
+		   'dynamic',
 		 ]
 
 testdata_executables = []
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
