Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E3F10E19E
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 04:38:51 +0000 (UTC)
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 10 Jul 2023 10:13:29 +0530
Message-Id: <20230710044330.770948-4-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230710044330.770948-1-himal.prasad.ghimiray@intel.com>
References: <20230710044330.770948-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v9 3/4] tests/xe/xe_guc_pc: Change the sysfs
 paths
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Upadhyay <tejas.upadhyay@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Changes to access sysfs entries under tile directory.
Access freq sysfs from /sys/class/drm/cardX/device/tileN/gtN
path.

v2:
- Use snprintf instead of sprintf and check error.
- Describe what changes are done. (Kamil)

v3:
- change order of gt and tile and drop passing tilecount.(Ashutosh)

v4:
- Rebase

v5:
- Drop usage of xe_for_each_gt_under_each_tile and use
  a function to return gt path. (Ashutosh)

v6:
- use gt_path instead of func call (Ashutosh)

v7:
- use new api's for gt sysfs access.

v8:
- Change assert condition. (Ashutosh)
- Rebase

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Upadhyay <tejas.upadhyay@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/xe/xe_guc_pc.c | 186 ++++++++++++++++++++++---------------------
 1 file changed, 97 insertions(+), 89 deletions(-)

diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
index fb3747f46..c34df8d60 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -133,25 +133,38 @@ static void exec_basic(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_destroy(fd, vm);
 }
 
-static int set_freq(int sysfs, int gt_id, const char *freq_name, uint32_t freq)
+static int set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq)
 {
 	int ret = -EAGAIN;
-	char path[32];
+	char freq_attr[16];
+	int gt_fd;
+
+	snprintf(freq_attr, sizeof(freq_attr), "freq_%s", freq_name);
+	gt_fd = xe_sysfs_gt_open(fd, gt_id);
+	igt_assert(gt_fd >= 0);
 
-	sprintf(path, "device/gt%d/freq_%s", gt_id, freq_name);
 	while (ret == -EAGAIN)
-		ret = igt_sysfs_printf(sysfs, path, "%u", freq);
+		ret = igt_sysfs_printf(gt_fd, freq_attr, "%u", freq);
+
+	close(gt_fd);
 	return ret;
 }
 
-static uint32_t get_freq(int sysfs, int gt_id, const char *freq_name)
+static uint32_t get_freq(int fd, int gt_id, const char *freq_name)
 {
 	uint32_t freq;
 	int err = -EAGAIN;
-	char path[32];
-	sprintf(path, "device/gt%d/freq_%s", gt_id, freq_name);
+	char freq_attr[16];
+	int gt_fd;
+
+	snprintf(freq_attr, sizeof(freq_attr), "freq_%s", freq_name);
+	gt_fd = xe_sysfs_gt_open(fd, gt_id);
+	igt_assert(gt_fd >= 0);
+
 	while (err == -EAGAIN)
-		err = igt_sysfs_scanf(sysfs, path, "%u", &freq);
+		err = igt_sysfs_scanf(gt_fd, freq_attr, "%u", &freq);
+
+	close(gt_fd);
 	return freq;
 }
 
@@ -162,37 +175,37 @@ static uint32_t get_freq(int sysfs, int gt_id, const char *freq_name)
  * Run type: BAT
  */
 
-static void test_freq_basic_api(int sysfs, int gt_id)
+static void test_freq_basic_api(int fd, int gt_id)
 {
-	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
-	uint32_t rpe = get_freq(sysfs, gt_id, "rpe");
-	uint32_t rp0 = get_freq(sysfs, gt_id, "rp0");
+	uint32_t rpn = get_freq(fd, gt_id, "rpn");
+	uint32_t rpe = get_freq(fd, gt_id, "rpe");
+	uint32_t rp0 = get_freq(fd, gt_id, "rp0");
 
 	/*
 	 * Negative bound tests
 	 * RPn is the floor
 	 * RP0 is the ceiling
 	 */
-	igt_assert(set_freq(sysfs, gt_id, "min", rpn - 1) < 0);
-	igt_assert(set_freq(sysfs, gt_id, "min", rp0 + 1) < 0);
-	igt_assert(set_freq(sysfs, gt_id, "max", rpn - 1) < 0);
-	igt_assert(set_freq(sysfs, gt_id, "max", rp0 + 1) < 0);
+	igt_assert(set_freq(fd, gt_id, "min", rpn - 1) < 0);
+	igt_assert(set_freq(fd, gt_id, "min", rp0 + 1) < 0);
+	igt_assert(set_freq(fd, gt_id, "max", rpn - 1) < 0);
+	igt_assert(set_freq(fd, gt_id, "max", rp0 + 1) < 0);
 
 	/* Assert min requests are respected from rp0 to rpn */
-	igt_assert(set_freq(sysfs, gt_id, "min", rp0) > 0);
-	igt_assert(get_freq(sysfs, gt_id, "min") == rp0);
-	igt_assert(set_freq(sysfs, gt_id, "min", rpe) > 0);
-	igt_assert(get_freq(sysfs, gt_id, "min") == rpe);
-	igt_assert(set_freq(sysfs, gt_id, "min", rpn) > 0);
-	igt_assert(get_freq(sysfs, gt_id, "min") == rpn);
+	igt_assert(set_freq(fd, gt_id, "min", rp0) > 0);
+	igt_assert(get_freq(fd, gt_id, "min") == rp0);
+	igt_assert(set_freq(fd, gt_id, "min", rpe) > 0);
+	igt_assert(get_freq(fd, gt_id, "min") == rpe);
+	igt_assert(set_freq(fd, gt_id, "min", rpn) > 0);
+	igt_assert(get_freq(fd, gt_id, "min") == rpn);
 
 	/* Assert max requests are respected from rpn to rp0 */
-	igt_assert(set_freq(sysfs, gt_id, "max", rpn) > 0);
-	igt_assert(get_freq(sysfs, gt_id, "max") == rpn);
-	igt_assert(set_freq(sysfs, gt_id, "max", rpe) > 0);
-	igt_assert(get_freq(sysfs, gt_id, "max") == rpe);
-	igt_assert(set_freq(sysfs, gt_id, "max", rp0) > 0);
-	igt_assert(get_freq(sysfs, gt_id, "max") == rp0);
+	igt_assert(set_freq(fd, gt_id, "max", rpn) > 0);
+	igt_assert(get_freq(fd, gt_id, "max") == rpn);
+	igt_assert(set_freq(fd, gt_id, "max", rpe) > 0);
+	igt_assert(get_freq(fd, gt_id, "max") == rpe);
+	igt_assert(set_freq(fd, gt_id, "max", rp0) > 0);
+	igt_assert(get_freq(fd, gt_id, "max") == rp0);
 }
 
 /**
@@ -205,11 +218,11 @@ static void test_freq_basic_api(int sysfs, int gt_id)
  * Run type: FULL
  */
 
-static void test_freq_fixed(int sysfs, int gt_id)
+static void test_freq_fixed(int fd, int gt_id)
 {
-	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
-	uint32_t rpe = get_freq(sysfs, gt_id, "rpe");
-	uint32_t rp0 = get_freq(sysfs, gt_id, "rp0");
+	uint32_t rpn = get_freq(fd, gt_id, "rpn");
+	uint32_t rpe = get_freq(fd, gt_id, "rpe");
+	uint32_t rp0 = get_freq(fd, gt_id, "rp0");
 
 	igt_debug("Starting testing fixed request\n");
 
@@ -218,27 +231,27 @@ static void test_freq_fixed(int sysfs, int gt_id)
 	 * Then we check if hardware is actually operating at the desired freq
 	 * And let's do this for all the 3 known Render Performance (RP) values.
 	 */
-	igt_assert(set_freq(sysfs, gt_id, "min", rpn) > 0);
-	igt_assert(set_freq(sysfs, gt_id, "max", rpn) > 0);
+	igt_assert(set_freq(fd, gt_id, "min", rpn) > 0);
+	igt_assert(set_freq(fd, gt_id, "max", rpn) > 0);
 	usleep(ACT_FREQ_LATENCY_US);
-	igt_assert(get_freq(sysfs, gt_id, "cur") == rpn);
-	igt_assert(get_freq(sysfs, gt_id, "act") == rpn);
+	igt_assert(get_freq(fd, gt_id, "cur") == rpn);
+	igt_assert(get_freq(fd, gt_id, "act") == rpn);
 
-	igt_assert(set_freq(sysfs, gt_id, "min", rpe) > 0);
-	igt_assert(set_freq(sysfs, gt_id, "max", rpe) > 0);
+	igt_assert(set_freq(fd, gt_id, "min", rpe) > 0);
+	igt_assert(set_freq(fd, gt_id, "max", rpe) > 0);
 	usleep(ACT_FREQ_LATENCY_US);
-	igt_assert(get_freq(sysfs, gt_id, "cur") == rpe);
-	igt_assert(get_freq(sysfs, gt_id, "act") == rpe);
+	igt_assert(get_freq(fd, gt_id, "cur") == rpe);
+	igt_assert(get_freq(fd, gt_id, "act") == rpe);
 
-	igt_assert(set_freq(sysfs, gt_id, "min", rp0) > 0);
-	igt_assert(set_freq(sysfs, gt_id, "max", rp0) > 0);
+	igt_assert(set_freq(fd, gt_id, "min", rp0) > 0);
+	igt_assert(set_freq(fd, gt_id, "max", rp0) > 0);
 	usleep(ACT_FREQ_LATENCY_US);
 	/*
 	 * It is unlikely that PCODE will *always* respect any request above RPe
 	 * So for this level let's only check if GuC PC is doing its job
 	 * and respecting our request, by propagating it to the hardware.
 	 */
-	igt_assert(get_freq(sysfs, gt_id, "cur") == rp0);
+	igt_assert(get_freq(fd, gt_id, "cur") == rp0);
 
 	igt_debug("Finished testing fixed request\n");
 }
@@ -253,20 +266,20 @@ static void test_freq_fixed(int sysfs, int gt_id)
  * Run type: FULL
  */
 
-static void test_freq_range(int sysfs, int gt_id)
+static void test_freq_range(int fd, int gt_id)
 {
-	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
-	uint32_t rpe = get_freq(sysfs, gt_id, "rpe");
+	uint32_t rpn = get_freq(fd, gt_id, "rpn");
+	uint32_t rpe = get_freq(fd, gt_id, "rpe");
 	uint32_t cur, act;
 
 	igt_debug("Starting testing range request\n");
 
-	igt_assert(set_freq(sysfs, gt_id, "min", rpn) > 0);
-	igt_assert(set_freq(sysfs, gt_id, "max", rpe) > 0);
+	igt_assert(set_freq(fd, gt_id, "min", rpn) > 0);
+	igt_assert(set_freq(fd, gt_id, "max", rpe) > 0);
 	usleep(ACT_FREQ_LATENCY_US);
-	cur = get_freq(sysfs, gt_id, "cur");
+	cur = get_freq(fd, gt_id, "cur");
 	igt_assert(rpn <= cur && cur <= rpe);
-	act = get_freq(sysfs, gt_id, "act");
+	act = get_freq(fd, gt_id, "act");
 	igt_assert(rpn <= act && act <= rpe);
 
 	igt_debug("Finished testing range request\n");
@@ -278,20 +291,20 @@ static void test_freq_range(int sysfs, int gt_id)
  * Run type: FULL
  */
 
-static void test_freq_low_max(int sysfs, int gt_id)
+static void test_freq_low_max(int fd, int gt_id)
 {
-	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
-	uint32_t rpe = get_freq(sysfs, gt_id, "rpe");
+	uint32_t rpn = get_freq(fd, gt_id, "rpn");
+	uint32_t rpe = get_freq(fd, gt_id, "rpe");
 
 	/*
 	 *  When max request < min request, max is ignored and min works like
 	 * a fixed one. Let's assert this assumption
 	 */
-	igt_assert(set_freq(sysfs, gt_id, "min", rpe) > 0);
-	igt_assert(set_freq(sysfs, gt_id, "max", rpn) > 0);
+	igt_assert(set_freq(fd, gt_id, "min", rpe) > 0);
+	igt_assert(set_freq(fd, gt_id, "max", rpn) > 0);
 	usleep(ACT_FREQ_LATENCY_US);
-	igt_assert(get_freq(sysfs, gt_id, "cur") == rpe);
-	igt_assert(get_freq(sysfs, gt_id, "act") == rpe);
+	igt_assert(get_freq(fd, gt_id, "cur") == rpe);
+	igt_assert(get_freq(fd, gt_id, "act") == rpe);
 }
 
 /**
@@ -300,20 +313,20 @@ static void test_freq_low_max(int sysfs, int gt_id)
  * Run type: FULL
  */
 
-static void test_suspend(int sysfs, int gt_id)
+static void test_suspend(int fd, int gt_id)
 {
-	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
+	uint32_t rpn = get_freq(fd, gt_id, "rpn");
 
-	igt_assert(set_freq(sysfs, gt_id, "min", rpn) > 0);
-	igt_assert(set_freq(sysfs, gt_id, "max", rpn) > 0);
+	igt_assert(set_freq(fd, gt_id, "min", rpn) > 0);
+	igt_assert(set_freq(fd, gt_id, "max", rpn) > 0);
 	usleep(ACT_FREQ_LATENCY_US);
-	igt_assert(get_freq(sysfs, gt_id, "cur") == rpn);
+	igt_assert(get_freq(fd, gt_id, "cur") == rpn);
 
 	igt_system_suspend_autoresume(SUSPEND_STATE_S3,
 				      SUSPEND_TEST_NONE);
 
-	igt_assert(get_freq(sysfs, gt_id, "min") == rpn);
-	igt_assert(get_freq(sysfs, gt_id, "max") == rpn);
+	igt_assert(get_freq(fd, gt_id, "min") == rpn);
+	igt_assert(get_freq(fd, gt_id, "max") == rpn);
 }
 
 /**
@@ -326,24 +339,24 @@ static void test_suspend(int sysfs, int gt_id)
  * Run type: FULL
  */
 
-static void test_reset(int fd, int sysfs, int gt_id, int cycles)
+static void test_reset(int fd, int gt_id, int cycles)
 {
-	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
+	uint32_t rpn = get_freq(fd, gt_id, "rpn");
 
 	for (int i = 0; i < cycles; i++) {
-		igt_assert_f(set_freq(sysfs, gt_id, "min", rpn) > 0,
+		igt_assert_f(set_freq(fd, gt_id, "min", rpn) > 0,
 			     "Failed after %d good cycles\n", i);
-		igt_assert_f(set_freq(sysfs, gt_id, "max", rpn) > 0,
+		igt_assert_f(set_freq(fd, gt_id, "max", rpn) > 0,
 			     "Failed after %d good cycles\n", i);
 		usleep(ACT_FREQ_LATENCY_US);
-		igt_assert_f(get_freq(sysfs, gt_id, "cur") == rpn,
+		igt_assert_f(get_freq(fd, gt_id, "cur") == rpn,
 			     "Failed after %d good cycles\n", i);
 
 		xe_force_gt_reset(fd, gt_id);
 
-		igt_assert_f(get_freq(sysfs, gt_id, "min") == rpn,
+		igt_assert_f(get_freq(fd, gt_id, "min") == rpn,
 			     "Failed after %d good cycles\n", i);
-		igt_assert_f(get_freq(sysfs, gt_id, "max") == rpn,
+		igt_assert_f(get_freq(fd, gt_id, "max") == rpn,
 			     "Failed after %d good cycles\n", i);
 	}
 }
@@ -353,7 +366,6 @@ igt_main
 	struct drm_xe_engine_class_instance *hwe;
 	int fd;
 	int gt;
-	static int sysfs = -1;
 	int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	uint32_t stash_min;
 	uint32_t stash_max;
@@ -361,22 +373,19 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 
-		sysfs = igt_sysfs_open(fd);
-		igt_assert(sysfs != -1);
-
 		/* The defaults are the same. Stashing the gt0 is enough */
-		stash_min = get_freq(sysfs, 0, "min");
-		stash_max = get_freq(sysfs, 0, "max");
+		stash_min = get_freq(fd, 0, "min");
+		stash_max = get_freq(fd, 0, "max");
 	}
 
 	igt_subtest("freq_basic_api") {
 		xe_for_each_gt(fd, gt)
-			test_freq_basic_api(sysfs, gt);
+			test_freq_basic_api(fd, gt);
 	}
 
 	igt_subtest("freq_fixed_idle") {
 		xe_for_each_gt(fd, gt) {
-			test_freq_fixed(sysfs, gt);
+			test_freq_fixed(fd, gt);
 		}
 	}
 
@@ -389,14 +398,14 @@ igt_main
 					igt_debug("Execution Finished\n");
 				}
 			/* While exec in threads above, let's check the freq */
-			test_freq_fixed(sysfs, gt);
+			test_freq_fixed(fd, gt);
 			igt_waitchildren();
 		}
 	}
 
 	igt_subtest("freq_range_idle") {
 		xe_for_each_gt(fd, gt) {
-			test_freq_range(sysfs, gt);
+			test_freq_range(fd, gt);
 		}
 	}
 
@@ -409,41 +418,40 @@ igt_main
 					igt_debug("Execution Finished\n");
 				}
 			/* While exec in threads above, let's check the freq */
-			test_freq_range(sysfs, gt);
+			test_freq_range(fd, gt);
 			igt_waitchildren();
 		}
 	}
 
 	igt_subtest("freq_low_max") {
 		xe_for_each_gt(fd, gt) {
-			test_freq_low_max(sysfs, gt);
+			test_freq_low_max(fd, gt);
 		}
 	}
 
 	igt_subtest("freq_suspend") {
 		xe_for_each_gt(fd, gt) {
-			test_suspend(sysfs, gt);
+			test_suspend(fd, gt);
 		}
 	}
 
 	igt_subtest("freq_reset") {
 		xe_for_each_gt(fd, gt) {
-			test_reset(fd, sysfs, gt, 1);
+			test_reset(fd, gt, 1);
 		}
 	}
 
 	igt_subtest("freq_reset_multiple") {
 		xe_for_each_gt(fd, gt) {
-			test_reset(fd, sysfs, gt, 50);
+			test_reset(fd, gt, 50);
 		}
 	}
 
 	igt_fixture {
 		xe_for_each_gt(fd, gt) {
-			set_freq(sysfs, gt, "min", stash_min);
-			set_freq(sysfs, gt, "max", stash_max);
+			set_freq(fd, gt, "min", stash_min);
+			set_freq(fd, gt, "max", stash_max);
 		}
-		close(sysfs);
 		drm_close_driver(fd);
 	}
 }
-- 
2.25.1
