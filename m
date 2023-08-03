Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C0510E596
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Aug 2023 05:44:09 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  3 Aug 2023 11:18:10 +0530
Message-Id: <20230803054810.2842880-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe: Add a test to toggle GT C states
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add a test that toggles GT C states by checking if GT is in C0 when
forcewake is acquired and in C6 once released.

v2: change test name (Suja, Anshuman)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/xe/xe_pm_residency.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/xe/xe_pm_residency.c b/tests/xe/xe_pm_residency.c
index 4936de166..1c12113bc 100644
--- a/tests/xe/xe_pm_residency.c
+++ b/tests/xe/xe_pm_residency.c
@@ -38,6 +38,10 @@ const double tolerance = 0.1;
  * Description: basic residency test to validate idle residency
  *		measured over a time interval is within the tolerance
  * Run type: FULL
+ *
+ * SUBTEST: toggle-gt-c6
+ * Description: Toggle GT C states by acquiring/releasing forcewake
+ * Run type: FULL
  */
 IGT_TEST_DESCRIPTION("Tests for gtidle properties");
 
@@ -85,6 +89,24 @@ static void test_idle_residency(int fd, int gt)
 	assert_within_epsilon(residency_end - residency_start, elapsed_ms, tolerance);
 }
 
+static void toggle_gt_c6(int fd, int n)
+{
+	int handle, gt;
+
+	while (n--) {
+		handle = igt_debugfs_open(fd, "forcewake_all", O_WRONLY);
+		igt_assert(handle >= 0);
+		/* check if all gts are in C0 after forcewake is acquired */
+		xe_for_each_gt(fd, gt)
+			igt_assert_f(!xe_is_gt_in_c6(fd, gt), "GT in C6\n");
+		close(handle);
+		/* check if all gts are in C6 after forcewake is released */
+		xe_for_each_gt(fd, gt)
+			igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1),
+				     "GT is not in C6\n");
+	}
+}
+
 igt_main
 {
 	int fd, gt;
@@ -104,6 +126,10 @@ igt_main
 		xe_for_each_gt(fd, gt)
 			test_idle_residency(fd, gt);
 
+	igt_describe("Toggle GT C states by acquiring/releasing forcewake");
+	igt_subtest("toggle-gt-c6")
+		toggle_gt_c6(fd, 16);
+
 	igt_fixture {
 		close(fd);
 	}
-- 
2.40.0
