Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E7410E585
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jul 2023 09:44:43 +0000 (UTC)
From: Badal Nilawar <badal.nilawar@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Jul 2023 15:20:41 +0530
Message-Id: <20230720095041.3599085-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6] tests/xe: Verify actual frequency on the
 basis of GT state
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

When GT is in RC6 actual frequency reported will be 0. So verify actual
on the basic of GT state.

v2:
  - Rebased
  - Move function xe_is_gt_in_c6, to check rc6 state, to igt_pm library
  - Assert if freq reported is not 0 when idle (Ashutosh)
v3:
  - Fix review comments (Ashutosh)
v4:
  - Move igt_require to igt_main under idle test cases (Ashutosh)
  - For idle case wait for C6 instead of usleep (Ashutosh)
v5:
  - Remove igt_require from test_freq_range
v6:
  - Move xe_is_gt_in_c6 to xe/xe_util.c (Anshuman)

Fixes: acaaca0bf317 ("tests/xe: Add Xe IGT tests")
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/xe/xe_util.c           | 21 +++++++++++++++++
 lib/xe/xe_util.h           |  2 ++
 tests/xe/xe_guc_pc.c       | 47 ++++++++++++++++++++++++++++++--------
 tests/xe/xe_pm_residency.c | 39 +++++++++++--------------------
 4 files changed, 73 insertions(+), 36 deletions(-)

diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 00506b5ad..2f9ffe2f1 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -5,6 +5,7 @@
 
 #include "igt.h"
 #include "igt_syncobj.h"
+#include "igt_sysfs.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
@@ -227,3 +228,23 @@ void xe_bind_unbind_async(int xe, uint32_t vm, uint32_t bind_engine,
 
 	free(bind_ops);
 }
+
+/**
+ * xe_is_gt_in_c6:
+ * @fd: pointer to xe drm fd
+ * @gt: gt number
+ *
+ * Check if GT is in C6 state
+ */
+bool xe_is_gt_in_c6(int fd, int gt)
+{
+	char gt_c_state[16];
+	int gt_fd;
+
+	gt_fd = xe_sysfs_gt_open(fd, gt);
+	igt_assert(gt_fd >= 0);
+	igt_assert(igt_sysfs_scanf(gt_fd, "gtidle/idle_status", "%s", gt_c_state) == 1);
+	close(gt_fd);
+
+	return strcmp(gt_c_state, "gt-c6") == 0;
+}
diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
index 61511dd97..e97d236b8 100644
--- a/lib/xe/xe_util.h
+++ b/lib/xe/xe_util.h
@@ -44,4 +44,6 @@ void xe_bind_unbind_async(int fd, uint32_t vm, uint32_t bind_engine,
 			  struct igt_list_head *obj_list,
 			  uint32_t sync_in, uint32_t sync_out);
 
+bool xe_is_gt_in_c6(int fd, int gt);
+
 #endif /* XE_UTIL_H */
diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
index c34df8d60..cb52a7520 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -18,6 +18,7 @@
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_util.h"
 
 #include <string.h>
 #include <sys/time.h>
@@ -218,7 +219,7 @@ static void test_freq_basic_api(int fd, int gt_id)
  * Run type: FULL
  */
 
-static void test_freq_fixed(int fd, int gt_id)
+static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 {
 	uint32_t rpn = get_freq(fd, gt_id, "rpn");
 	uint32_t rpe = get_freq(fd, gt_id, "rpe");
@@ -235,13 +236,26 @@ static void test_freq_fixed(int fd, int gt_id)
 	igt_assert(set_freq(fd, gt_id, "max", rpn) > 0);
 	usleep(ACT_FREQ_LATENCY_US);
 	igt_assert(get_freq(fd, gt_id, "cur") == rpn);
-	igt_assert(get_freq(fd, gt_id, "act") == rpn);
+
+	if (gt_idle) {
+		/* Wait for GT to go in C6 as previous get_freq wakes up GT*/
+		igt_assert(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10));
+		igt_assert(get_freq(fd, gt_id, "act") == 0);
+	} else {
+		igt_assert(get_freq(fd, gt_id, "act") == rpn);
+	}
 
 	igt_assert(set_freq(fd, gt_id, "min", rpe) > 0);
 	igt_assert(set_freq(fd, gt_id, "max", rpe) > 0);
 	usleep(ACT_FREQ_LATENCY_US);
 	igt_assert(get_freq(fd, gt_id, "cur") == rpe);
-	igt_assert(get_freq(fd, gt_id, "act") == rpe);
+
+	if (gt_idle) {
+		igt_assert(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10));
+		igt_assert(get_freq(fd, gt_id, "act") == 0);
+	} else {
+		igt_assert(get_freq(fd, gt_id, "act") == rpe);
+	}
 
 	igt_assert(set_freq(fd, gt_id, "min", rp0) > 0);
 	igt_assert(set_freq(fd, gt_id, "max", rp0) > 0);
@@ -253,6 +267,11 @@ static void test_freq_fixed(int fd, int gt_id)
 	 */
 	igt_assert(get_freq(fd, gt_id, "cur") == rp0);
 
+	if (gt_idle) {
+		igt_assert(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10));
+		igt_assert(get_freq(fd, gt_id, "act") == 0);
+	}
+
 	igt_debug("Finished testing fixed request\n");
 }
 
@@ -266,7 +285,7 @@ static void test_freq_fixed(int fd, int gt_id)
  * Run type: FULL
  */
 
-static void test_freq_range(int fd, int gt_id)
+static void test_freq_range(int fd, int gt_id, bool gt_idle)
 {
 	uint32_t rpn = get_freq(fd, gt_id, "rpn");
 	uint32_t rpe = get_freq(fd, gt_id, "rpe");
@@ -279,8 +298,14 @@ static void test_freq_range(int fd, int gt_id)
 	usleep(ACT_FREQ_LATENCY_US);
 	cur = get_freq(fd, gt_id, "cur");
 	igt_assert(rpn <= cur && cur <= rpe);
-	act = get_freq(fd, gt_id, "act");
-	igt_assert(rpn <= act && act <= rpe);
+
+	if (gt_idle) {
+		igt_assert(igt_wait(xe_is_gt_in_c6(fd, gt_id), 1000, 10));
+		igt_assert(get_freq(fd, gt_id, "act") == 0);
+	} else {
+		act = get_freq(fd, gt_id, "act");
+		igt_assert(rpn <= act && act <= rpe);
+	}
 
 	igt_debug("Finished testing range request\n");
 }
@@ -385,7 +410,8 @@ igt_main
 
 	igt_subtest("freq_fixed_idle") {
 		xe_for_each_gt(fd, gt) {
-			test_freq_fixed(fd, gt);
+			igt_require(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 10));
+			test_freq_fixed(fd, gt, true);
 		}
 	}
 
@@ -398,14 +424,15 @@ igt_main
 					igt_debug("Execution Finished\n");
 				}
 			/* While exec in threads above, let's check the freq */
-			test_freq_fixed(fd, gt);
+			test_freq_fixed(fd, gt, false);
 			igt_waitchildren();
 		}
 	}
 
 	igt_subtest("freq_range_idle") {
 		xe_for_each_gt(fd, gt) {
-			test_freq_range(fd, gt);
+			igt_require(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 10));
+			test_freq_range(fd, gt, true);
 		}
 	}
 
@@ -418,7 +445,7 @@ igt_main
 					igt_debug("Execution Finished\n");
 				}
 			/* While exec in threads above, let's check the freq */
-			test_freq_range(fd, gt);
+			test_freq_range(fd, gt, false);
 			igt_waitchildren();
 		}
 	}
diff --git a/tests/xe/xe_pm_residency.c b/tests/xe/xe_pm_residency.c
index a20c4449c..4936de166 100644
--- a/tests/xe/xe_pm_residency.c
+++ b/tests/xe/xe_pm_residency.c
@@ -15,6 +15,7 @@
 #include "igt_sysfs.h"
 
 #include "xe/xe_query.h"
+#include "xe/xe_util.h"
 
 #define SLEEP_DURATION 3000 /* in milliseconds */
 
@@ -28,6 +29,16 @@ const double tolerance = 0.1;
 		     (tol) * 100.0, (tol) * 100.0, \
 		     (double)(ref))
 
+/**
+ * SUBTEST: gt-c6-on-idle
+ * Description: Validate GT C6 state on idle
+ * Run type: BAT
+ *
+ * SUBTEST: idle-residency
+ * Description: basic residency test to validate idle residency
+ *		measured over a time interval is within the tolerance
+ * Run type: FULL
+ */
 IGT_TEST_DESCRIPTION("Tests for gtidle properties");
 
 static unsigned int measured_usleep(unsigned int usec)
@@ -45,24 +56,6 @@ static unsigned int measured_usleep(unsigned int usec)
 	return igt_nsec_elapsed(&ts) / 1000;
 }
 
-/**
- * SUBTEST: gt-c6-on-idle
- * Description: Validate GT C6 state on idle
- * Run type: BAT
- */
-static bool is_gt_in_c6(int fd, int gt)
-{
-	char gt_c_state[16];
-	int gt_fd;
-
-	gt_fd = xe_sysfs_gt_open(fd, gt);
-	igt_assert(gt_fd >= 0);
-	igt_assert(igt_sysfs_scanf(gt_fd, "gtidle/idle_status", "%s", gt_c_state) == 1);
-	close(gt_fd);
-
-	return strcmp(gt_c_state, "gt-c6") == 0;
-}
-
 static unsigned long read_idle_residency(int fd, int gt)
 {
 	unsigned long residency = 0;
@@ -76,17 +69,11 @@ static unsigned long read_idle_residency(int fd, int gt)
 	return residency;
 }
 
-/**
- * SUBTEST: idle-residency
- * Description: basic residency test to validate idle residency
- *		measured over a time interval is within the tolerance
- * Run type: FULL
- */
 static void test_idle_residency(int fd, int gt)
 {
 	unsigned long elapsed_ms, residency_start, residency_end;
 
-	igt_assert_f(igt_wait(is_gt_in_c6(fd, gt), 1000, 1), "GT not in C6\n");
+	igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1), "GT not in C6\n");
 
 	residency_start = read_idle_residency(fd, gt);
 	elapsed_ms = measured_usleep(SLEEP_DURATION * 1000) / 1000;
@@ -110,7 +97,7 @@ igt_main
 	igt_describe("Validate GT C6 on idle");
 	igt_subtest("gt-c6-on-idle")
 		xe_for_each_gt(fd, gt)
-			igt_assert_f(igt_wait(is_gt_in_c6(fd, gt), 1000, 1), "GT not in C6\n");
+			igt_assert_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 1), "GT not in C6\n");
 
 	igt_describe("Validate idle residency measured over a time interval is within the tolerance");
 	igt_subtest("idle-residency")
-- 
2.25.1
