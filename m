Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069FB10E508
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jun 2023 09:31:51 +0000 (UTC)
From: Badal Nilawar <badal.nilawar@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Jun 2023 15:07:18 +0530
Message-Id: <20230622093718.1689978-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe: When GT is in RC6 donot assert if
 act freq is 0
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

When GT is in RC6 state actual frequency reported will be 0.
So during RC6 no need to assert if act freq is not equal to curr freq.

Fixes: acaaca0bf317 ("tests/xe: Add Xe IGT tests")
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 tests/xe/xe_guc_pc.c | 51 +++++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 24 deletions(-)

diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
index 60c93288b..a1cf2e039 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -30,6 +30,27 @@
  */
 #define ACT_FREQ_LATENCY_US 100000
 
+/**
+ * SUBTEST: rc6_on_idle
+ * Description: check if GPU is in RC6 on idle
+ * Run type: BAT
+ *
+ * SUBTEST: rc0_on_exec
+ * Description: check if GPU is in RC0 on when doing some work
+ * Run type: BAT
+ */
+
+static bool in_rc6(int sysfs, int gt_id)
+{
+	char path[32];
+	char rc[8];
+
+	sprintf(path, "device/gt%d/rc_status", gt_id);
+	if (igt_sysfs_scanf(sysfs, path, "%s", rc) < 0)
+		return false;
+	return strcmp(rc, "rc6") == 0;
+}
+
 static void exec_basic(int fd, struct drm_xe_engine_class_instance *eci,
 		       int n_engines, int n_execs)
 {
@@ -223,13 +244,15 @@ static void test_freq_fixed(int sysfs, int gt_id)
 	igt_assert(set_freq(sysfs, gt_id, "max", rpn) > 0);
 	usleep(ACT_FREQ_LATENCY_US);
 	igt_assert(get_freq(sysfs, gt_id, "cur") == rpn);
-	igt_assert(get_freq(sysfs, gt_id, "act") == rpn);
+	if (!in_rc6(sysfs, gt_id))
+		igt_assert(get_freq(sysfs, gt_id, "act") == rpn);
 
 	igt_assert(set_freq(sysfs, gt_id, "min", rpe) > 0);
 	igt_assert(set_freq(sysfs, gt_id, "max", rpe) > 0);
 	usleep(ACT_FREQ_LATENCY_US);
 	igt_assert(get_freq(sysfs, gt_id, "cur") == rpe);
-	igt_assert(get_freq(sysfs, gt_id, "act") == rpe);
+	if (!in_rc6(sysfs, gt_id))
+		igt_assert(get_freq(sysfs, gt_id, "act") == rpe);
 
 	igt_assert(set_freq(sysfs, gt_id, "min", rp0) > 0);
 	igt_assert(set_freq(sysfs, gt_id, "max", rp0) > 0);
@@ -269,7 +292,8 @@ static void test_freq_range(int sysfs, int gt_id)
 	cur = get_freq(sysfs, gt_id, "cur");
 	igt_assert(rpn <= cur && cur <= rpe);
 	act = get_freq(sysfs, gt_id, "act");
-	igt_assert(rpn <= act && act <= rpe);
+	if (!in_rc6(sysfs, gt_id))
+		igt_assert(rpn <= act && act <= rpe);
 
 	igt_debug("Finished testing range request\n");
 }
@@ -354,27 +378,6 @@ static void test_reset(int fd, int sysfs, int gt_id, int cycles)
 	}
 }
 
-
-/**
- * SUBTEST: rc6_on_idle
- * Description: check if GPU is in RC6 on idle
- * Run type: BAT
- *
- * SUBTEST: rc0_on_exec
- * Description: check if GPU is in RC0 on when doing some work
- * Run type: BAT
- */
-
-static bool in_rc6(int sysfs, int gt_id)
-{
-	char path[32];
-	char rc[8];
-	sprintf(path, "device/gt%d/rc_status", gt_id);
-	if (igt_sysfs_scanf(sysfs, path, "%s", rc) < 0)
-		return false;
-	return strcmp(rc, "rc6") == 0;
-}
-
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
-- 
2.25.1
