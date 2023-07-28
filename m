Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D49310E64F
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jul 2023 06:05:15 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Jul 2023 11:39:06 +0530
Message-Id: <20230728060906.2047834-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] RFC tests/xe: Stress test GT C states
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

stress test GT C states by checking if GT is in C0 when
forcewake is acquired and in C6 once released.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/xe/xe_pm_residency.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/xe/xe_pm_residency.c b/tests/xe/xe_pm_residency.c
index 4936de166..9713e61cd 100644
--- a/tests/xe/xe_pm_residency.c
+++ b/tests/xe/xe_pm_residency.c
@@ -85,6 +85,29 @@ static void test_idle_residency(int fd, int gt)
 	assert_within_epsilon(residency_end - residency_start, elapsed_ms, tolerance);
 }
 
+/**
+ * SUBTEST: stress-gt-c6
+ * Description: stress test GT C states by acquiring/releasing forcewake
+ * Run type: FULL
+ */
+static void stress_c6(int fd, int n)
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
@@ -104,6 +127,10 @@ igt_main
 		xe_for_each_gt(fd, gt)
 			test_idle_residency(fd, gt);
 
+	igt_describe("stress test GT C states by acquiring/releasing forcewake");
+	igt_subtest("stress-gt-c6")
+		stress_c6(fd, 16);
+
 	igt_fixture {
 		close(fd);
 	}
-- 
2.40.0
