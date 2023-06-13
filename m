Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE4010E25F
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 13:37:49 +0000 (UTC)
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Jun 2023 19:11:55 +0530
Message-Id: <20230613134156.3315199-4-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230613134156.3315199-1-himal.prasad.ghimiray@intel.com>
References: <20230613134156.3315199-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 3/4] tests/xe/xe_guc_pc: Change the sysfs paths.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Changes to access sysfs entries under tile directory.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/xe/xe_guc_pc.c | 199 ++++++++++++++++++++++---------------------
 1 file changed, 100 insertions(+), 99 deletions(-)

diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
index 5c71ae14..ff9ada44 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -133,23 +133,23 @@ static void exec_basic(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_destroy(fd, vm);
 }
 
-static int set_freq(int sysfs, int gt_id, const char *freq_name, uint32_t freq)
+static int set_freq(int sysfs, int tile_id, int gt_id, const char *freq_name, uint32_t freq)
 {
 	int ret = -EAGAIN;
 	char path[32];
 
-	sprintf(path, "device/gt%d/freq_%s", gt_id, freq_name);
+	sprintf(path, "device/tile%d/gt%d/freq_%s", tile_id, gt_id, freq_name);
 	while (ret == -EAGAIN)
 		ret = igt_sysfs_printf(sysfs, path, "%u", freq);
 	return ret;
 }
 
-static uint32_t get_freq(int sysfs, int gt_id, const char *freq_name)
+static uint32_t get_freq(int sysfs, int tile_id, int gt_id, const char *freq_name)
 {
 	uint32_t freq;
 	int err = -EAGAIN;
 	char path[32];
-	sprintf(path, "device/gt%d/freq_%s", gt_id, freq_name);
+	sprintf(path, "device/tile%d/gt%d/freq_%s", tile_id, gt_id, freq_name);
 	while (err == -EAGAIN)
 		err = igt_sysfs_scanf(sysfs, path, "%u", &freq);
 	return freq;
@@ -162,37 +162,37 @@ static uint32_t get_freq(int sysfs, int gt_id, const char *freq_name)
  * Run type: BAT
  */
 
-static void test_freq_basic_api(int sysfs, int gt_id)
+static void test_freq_basic_api(int sysfs, int tile_id, int gt_id)
 {
-	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
-	uint32_t rpe = get_freq(sysfs, gt_id, "rpe");
-	uint32_t rp0 = get_freq(sysfs, gt_id, "rp0");
+	uint32_t rpn = get_freq(sysfs, tile_id, gt_id, "rpn");
+	uint32_t rpe = get_freq(sysfs, tile_id, gt_id, "rpe");
+	uint32_t rp0 = get_freq(sysfs, tile_id, gt_id, "rp0");
 
 	/*
 	 * Negative bound tests
 	 * RPn is the floor
 	 * RP0 is the ceiling
 	 */
-	igt_assert(set_freq(sysfs, gt_id, "min", rpn - 1) < 0);
-	igt_assert(set_freq(sysfs, gt_id, "min", rp0 + 1) < 0);
-	igt_assert(set_freq(sysfs, gt_id, "max", rpn - 1) < 0);
-	igt_assert(set_freq(sysfs, gt_id, "max", rp0 + 1) < 0);
+	igt_assert(set_freq(sysfs, tile_id, gt_id, "min", rpn - 1) < 0);
+	igt_assert(set_freq(sysfs, tile_id, gt_id, "min", rp0 + 1) < 0);
+	igt_assert(set_freq(sysfs, tile_id, gt_id, "max", rpn - 1) < 0);
+	igt_assert(set_freq(sysfs, tile_id, gt_id, "max", rp0 + 1) < 0);
 
 	/* Assert min requests are respected from rp0 to rpn */
-	igt_assert(set_freq(sysfs, gt_id, "min", rp0) > 0);
-	igt_assert(get_freq(sysfs, gt_id, "min") == rp0);
-	igt_assert(set_freq(sysfs, gt_id, "min", rpe) > 0);
-	igt_assert(get_freq(sysfs, gt_id, "min") == rpe);
-	igt_assert(set_freq(sysfs, gt_id, "min", rpn) > 0);
-	igt_assert(get_freq(sysfs, gt_id, "min") == rpn);
+	igt_assert(set_freq(sysfs, tile_id, gt_id, "min", rp0) > 0);
+	igt_assert(get_freq(sysfs, tile_id, gt_id, "min") == rp0);
+	igt_assert(set_freq(sysfs, tile_id, gt_id, "min", rpe) > 0);
+	igt_assert(get_freq(sysfs, tile_id, gt_id, "min") == rpe);
+	igt_assert(set_freq(sysfs, tile_id, gt_id, "min", rpn) > 0);
+	igt_assert(get_freq(sysfs, tile_id, gt_id, "min") == rpn);
 
 	/* Assert max requests are respected from rpn to rp0 */
-	igt_assert(set_freq(sysfs, gt_id, "max", rpn) > 0);
-	igt_assert(get_freq(sysfs, gt_id, "max") == rpn);
-	igt_assert(set_freq(sysfs, gt_id, "max", rpe) > 0);
-	igt_assert(get_freq(sysfs, gt_id, "max") == rpe);
-	igt_assert(set_freq(sysfs, gt_id, "max", rp0) > 0);
-	igt_assert(get_freq(sysfs, gt_id, "max") == rp0);
+	igt_assert(set_freq(sysfs, tile_id, gt_id, "max", rpn) > 0);
+	igt_assert(get_freq(sysfs, tile_id, gt_id, "max") == rpn);
+	igt_assert(set_freq(sysfs, tile_id, gt_id, "max", rpe) > 0);
+	igt_assert(get_freq(sysfs, tile_id, gt_id, "max") == rpe);
+	igt_assert(set_freq(sysfs, tile_id, gt_id, "max", rp0) > 0);
+	igt_assert(get_freq(sysfs, tile_id, gt_id, "max") == rp0);
 }
 
 /**
@@ -206,11 +206,11 @@ static void test_freq_basic_api(int sysfs, int gt_id)
  * TODO: change ``'Run type' == FULL`` to a better category
  */
 
-static void test_freq_fixed(int sysfs, int gt_id)
+static void test_freq_fixed(int sysfs, int tile_id, int gt_id)
 {
-	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
-	uint32_t rpe = get_freq(sysfs, gt_id, "rpe");
-	uint32_t rp0 = get_freq(sysfs, gt_id, "rp0");
+	uint32_t rpn = get_freq(sysfs, tile_id, gt_id, "rpn");
+	uint32_t rpe = get_freq(sysfs, tile_id, gt_id, "rpe");
+	uint32_t rp0 = get_freq(sysfs, tile_id, gt_id, "rp0");
 
 	igt_debug("Starting testing fixed request\n");
 
@@ -219,27 +219,27 @@ static void test_freq_fixed(int sysfs, int gt_id)
 	 * Then we check if hardware is actually operating at the desired freq
 	 * And let's do this for all the 3 known Render Performance (RP) values.
 	 */
-	igt_assert(set_freq(sysfs, gt_id, "min", rpn) > 0);
-	igt_assert(set_freq(sysfs, gt_id, "max", rpn) > 0);
+	igt_assert(set_freq(sysfs, tile_id, gt_id, "min", rpn) > 0);
+	igt_assert(set_freq(sysfs, tile_id, gt_id, "max", rpn) > 0);
 	usleep(ACT_FREQ_LATENCY_US);
-	igt_assert(get_freq(sysfs, gt_id, "cur") == rpn);
-	igt_assert(get_freq(sysfs, gt_id, "act") == rpn);
+	igt_assert(get_freq(sysfs, tile_id, gt_id, "cur") == rpn);
+	igt_assert(get_freq(sysfs, tile_id, gt_id, "act") == rpn);
 
-	igt_assert(set_freq(sysfs, gt_id, "min", rpe) > 0);
-	igt_assert(set_freq(sysfs, gt_id, "max", rpe) > 0);
+	igt_assert(set_freq(sysfs, tile_id, gt_id, "min", rpe) > 0);
+	igt_assert(set_freq(sysfs, tile_id, gt_id, "max", rpe) > 0);
 	usleep(ACT_FREQ_LATENCY_US);
-	igt_assert(get_freq(sysfs, gt_id, "cur") == rpe);
-	igt_assert(get_freq(sysfs, gt_id, "act") == rpe);
+	igt_assert(get_freq(sysfs, tile_id, gt_id, "cur") == rpe);
+	igt_assert(get_freq(sysfs, tile_id, gt_id, "act") == rpe);
 
-	igt_assert(set_freq(sysfs, gt_id, "min", rp0) > 0);
-	igt_assert(set_freq(sysfs, gt_id, "max", rp0) > 0);
+	igt_assert(set_freq(sysfs, tile_id, gt_id, "min", rp0) > 0);
+	igt_assert(set_freq(sysfs, tile_id, gt_id, "max", rp0) > 0);
 	usleep(ACT_FREQ_LATENCY_US);
 	/*
 	 * It is unlikely that PCODE will *always* respect any request above RPe
 	 * So for this level let's only check if GuC PC is doing its job
 	 * and respecting our request, by propagating it to the hardware.
 	 */
-	igt_assert(get_freq(sysfs, gt_id, "cur") == rp0);
+	igt_assert(get_freq(sysfs, tile_id, gt_id, "cur") == rp0);
 
 	igt_debug("Finished testing fixed request\n");
 }
@@ -255,20 +255,20 @@ static void test_freq_fixed(int sysfs, int gt_id)
  * TODO: change ``'Run type' == FULL`` to a better category
  */
 
-static void test_freq_range(int sysfs, int gt_id)
+static void test_freq_range(int sysfs, int tile_id, int gt_id)
 {
-	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
-	uint32_t rpe = get_freq(sysfs, gt_id, "rpe");
+	uint32_t rpn = get_freq(sysfs, tile_id, gt_id, "rpn");
+	uint32_t rpe = get_freq(sysfs, tile_id, gt_id, "rpe");
 	uint32_t cur, act;
 
 	igt_debug("Starting testing range request\n");
 
-	igt_assert(set_freq(sysfs, gt_id, "min", rpn) > 0);
-	igt_assert(set_freq(sysfs, gt_id, "max", rpe) > 0);
+	igt_assert(set_freq(sysfs, tile_id, gt_id, "min", rpn) > 0);
+	igt_assert(set_freq(sysfs, tile_id, gt_id, "max", rpe) > 0);
 	usleep(ACT_FREQ_LATENCY_US);
-	cur = get_freq(sysfs, gt_id, "cur");
+	cur = get_freq(sysfs, tile_id, gt_id, "cur");
 	igt_assert(rpn <= cur && cur <= rpe);
-	act = get_freq(sysfs, gt_id, "act");
+	act = get_freq(sysfs, tile_id, gt_id, "act");
 	igt_assert(rpn <= act && act <= rpe);
 
 	igt_debug("Finished testing range request\n");
@@ -281,20 +281,20 @@ static void test_freq_range(int sysfs, int gt_id)
  * TODO: change ``'Run type' == FULL`` to a better category
  */
 
-static void test_freq_low_max(int sysfs, int gt_id)
+static void test_freq_low_max(int sysfs, int tile_id, int gt_id)
 {
-	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
-	uint32_t rpe = get_freq(sysfs, gt_id, "rpe");
+	uint32_t rpn = get_freq(sysfs, tile_id, gt_id, "rpn");
+	uint32_t rpe = get_freq(sysfs, tile_id, gt_id, "rpe");
 
 	/*
 	 *  When max request < min request, max is ignored and min works like
 	 * a fixed one. Let's assert this assumption
 	 */
-	igt_assert(set_freq(sysfs, gt_id, "min", rpe) > 0);
-	igt_assert(set_freq(sysfs, gt_id, "max", rpn) > 0);
+	igt_assert(set_freq(sysfs, tile_id, gt_id, "min", rpe) > 0);
+	igt_assert(set_freq(sysfs, tile_id, gt_id, "max", rpn) > 0);
 	usleep(ACT_FREQ_LATENCY_US);
-	igt_assert(get_freq(sysfs, gt_id, "cur") == rpe);
-	igt_assert(get_freq(sysfs, gt_id, "act") == rpe);
+	igt_assert(get_freq(sysfs, tile_id, gt_id, "cur") == rpe);
+	igt_assert(get_freq(sysfs, tile_id, gt_id, "act") == rpe);
 }
 
 /**
@@ -304,20 +304,20 @@ static void test_freq_low_max(int sysfs, int gt_id)
  * TODO: change ``'Run type' == FULL`` to a better category
  */
 
-static void test_suspend(int sysfs, int gt_id)
+static void test_suspend(int sysfs, int tile_id, int gt_id)
 {
-	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
+	uint32_t rpn = get_freq(sysfs, tile_id, gt_id, "rpn");
 
-	igt_assert(set_freq(sysfs, gt_id, "min", rpn) > 0);
-	igt_assert(set_freq(sysfs, gt_id, "max", rpn) > 0);
+	igt_assert(set_freq(sysfs, tile_id, gt_id, "min", rpn) > 0);
+	igt_assert(set_freq(sysfs, tile_id, gt_id, "max", rpn) > 0);
 	usleep(ACT_FREQ_LATENCY_US);
-	igt_assert(get_freq(sysfs, gt_id, "cur") == rpn);
+	igt_assert(get_freq(sysfs, tile_id, gt_id, "cur") == rpn);
 
 	igt_system_suspend_autoresume(SUSPEND_STATE_S3,
 				      SUSPEND_TEST_NONE);
 
-	igt_assert(get_freq(sysfs, gt_id, "min") == rpn);
-	igt_assert(get_freq(sysfs, gt_id, "max") == rpn);
+	igt_assert(get_freq(sysfs, tile_id, gt_id, "min") == rpn);
+	igt_assert(get_freq(sysfs, tile_id, gt_id, "max") == rpn);
 }
 
 /**
@@ -332,24 +332,24 @@ static void test_suspend(int sysfs, int gt_id)
  * TODO: change ``'Run type' == FULL`` to a better category
  */
 
-static void test_reset(int fd, int sysfs, int gt_id, int cycles)
+static void test_reset(int fd, int sysfs, int tile_id, int gt_id, int cycles)
 {
-	uint32_t rpn = get_freq(sysfs, gt_id, "rpn");
+	uint32_t rpn = get_freq(sysfs, tile_id, gt_id, "rpn");
 
 	for (int i = 0; i < cycles; i++) {
-		igt_assert_f(set_freq(sysfs, gt_id, "min", rpn) > 0,
+		igt_assert_f(set_freq(sysfs, tile_id, gt_id, "min", rpn) > 0,
 			     "Failed after %d good cycles\n", i);
-		igt_assert_f(set_freq(sysfs, gt_id, "max", rpn) > 0,
+		igt_assert_f(set_freq(sysfs, tile_id, gt_id, "max", rpn) > 0,
 			     "Failed after %d good cycles\n", i);
 		usleep(ACT_FREQ_LATENCY_US);
-		igt_assert_f(get_freq(sysfs, gt_id, "cur") == rpn,
+		igt_assert_f(get_freq(sysfs, tile_id, gt_id, "cur") == rpn,
 			     "Failed after %d good cycles\n", i);
 
 		xe_force_gt_reset(fd, gt_id);
 
-		igt_assert_f(get_freq(sysfs, gt_id, "min") == rpn,
+		igt_assert_f(get_freq(sysfs, tile_id, gt_id, "min") == rpn,
 			     "Failed after %d good cycles\n", i);
-		igt_assert_f(get_freq(sysfs, gt_id, "max") == rpn,
+		igt_assert_f(get_freq(sysfs, tile_id, gt_id, "max") == rpn,
 			     "Failed after %d good cycles\n", i);
 	}
 }
@@ -365,11 +365,11 @@ static void test_reset(int fd, int sysfs, int gt_id, int cycles)
  * Run type: BAT
  */
 
-static bool in_rc6(int sysfs, int gt_id)
+static bool in_rc6(int sysfs, int tile_id, int gt_id)
 {
-	char path[32];
+	char path[40];
 	char rc[8];
-	sprintf(path, "device/gt%d/rc_status", gt_id);
+	sprintf(path, "device/tile%d/gt%d/rc_status", tile_id, gt_id);
 	if (igt_sysfs_scanf(sysfs, path, "%s", rc) < 0)
 		return false;
 	return strcmp(rc, "rc6") == 0;
@@ -379,6 +379,7 @@ igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
 	int fd;
+	int tile;
 	int gt;
 	static int sysfs = -1;
 	int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
@@ -392,24 +393,24 @@ igt_main
 		sysfs = igt_sysfs_open(fd);
 		igt_assert(sysfs != -1);
 
-		/* The defaults are the same. Stashing the gt0 is enough */
-		stash_min = get_freq(sysfs, 0, "min");
-		stash_max = get_freq(sysfs, 0, "max");
+		/* The defaults are the same. Stashing the gt0 in tile0 is enough */
+		stash_min = get_freq(sysfs, 0, 0, "min");
+		stash_max = get_freq(sysfs, 0, 0, "max");
 	}
 
 	igt_subtest("freq_basic_api") {
-		xe_for_each_gt(fd, gt)
-			test_freq_basic_api(sysfs, gt);
+		xe_for_each_gt_under_each_tile(fd, tile, gt)
+			test_freq_basic_api(sysfs, tile, gt);
 	}
 
 	igt_subtest("freq_fixed_idle") {
-		xe_for_each_gt(fd, gt) {
-			test_freq_fixed(sysfs, gt);
+		xe_for_each_gt_under_each_tile(fd, tile, gt) {
+			test_freq_fixed(sysfs, tile, gt);
 		}
 	}
 
 	igt_subtest("freq_fixed_exec") {
-		xe_for_each_gt(fd, gt) {
+		xe_for_each_gt_under_each_tile(fd, tile, gt) {
 			xe_for_each_hw_engine(fd, hwe)
 				igt_fork(child, ncpus) {
 					igt_debug("Execution Started\n");
@@ -417,19 +418,19 @@ igt_main
 					igt_debug("Execution Finished\n");
 				}
 			/* While exec in threads above, let's check the freq */
-			test_freq_fixed(sysfs, gt);
+			test_freq_fixed(sysfs, tile, gt);
 			igt_waitchildren();
 		}
 	}
 
 	igt_subtest("freq_range_idle") {
-		xe_for_each_gt(fd, gt) {
-			test_freq_range(sysfs, gt);
+		xe_for_each_gt_under_each_tile(fd, tile, gt) {
+			test_freq_range(sysfs, tile, gt);
 		}
 	}
 
 	igt_subtest("freq_range_exec") {
-		xe_for_each_gt(fd, gt) {
+		xe_for_each_gt_under_each_tile(fd, tile, gt) {
 			xe_for_each_hw_engine(fd, hwe)
 				igt_fork(child, ncpus) {
 					igt_debug("Execution Started\n");
@@ -437,46 +438,46 @@ igt_main
 					igt_debug("Execution Finished\n");
 				}
 			/* While exec in threads above, let's check the freq */
-			test_freq_range(sysfs, gt);
+			test_freq_range(sysfs, tile, gt);
 			igt_waitchildren();
 		}
 	}
 
 	igt_subtest("freq_low_max") {
-		xe_for_each_gt(fd, gt) {
-			test_freq_low_max(sysfs, gt);
+		xe_for_each_gt_under_each_tile(fd, tile, gt) {
+			test_freq_low_max(sysfs, tile, gt);
 		}
 	}
 
 	igt_subtest("freq_suspend") {
-		xe_for_each_gt(fd, gt) {
-			test_suspend(sysfs, gt);
+		xe_for_each_gt_under_each_tile(fd, tile, gt) {
+			test_suspend(sysfs, tile, gt);
 		}
 	}
 
 	igt_subtest("freq_reset") {
-		xe_for_each_gt(fd, gt) {
-			test_reset(fd, sysfs, gt, 1);
+		xe_for_each_gt_under_each_tile(fd, tile, gt) {
+			test_reset(fd, sysfs, tile, gt, 1);
 		}
 	}
 
 	igt_subtest("freq_reset_multiple") {
-		xe_for_each_gt(fd, gt) {
-			test_reset(fd, sysfs, gt, 50);
+		xe_for_each_gt_under_each_tile(fd, tile, gt) {
+			test_reset(fd, sysfs, tile, gt, 50);
 		}
 	}
 
 	igt_subtest("rc6_on_idle") {
 		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
-		xe_for_each_gt(fd, gt) {
-			assert(igt_wait(in_rc6(sysfs, gt), 1000, 1));
+		xe_for_each_gt_under_each_tile(fd, tile, gt) {
+			assert(igt_wait(in_rc6(sysfs, tile, gt), 1000, 1));
 		}
 	}
 
 	igt_subtest("rc0_on_exec") {
 		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
-		xe_for_each_gt(fd, gt) {
-			assert(igt_wait(in_rc6(sysfs, gt), 1000, 1));
+		xe_for_each_gt_under_each_tile(fd, tile, gt) {
+			assert(igt_wait(in_rc6(sysfs, tile, gt), 1000, 1));
 			xe_for_each_hw_engine(fd, hwe)
 				igt_fork(child, ncpus) {
 					igt_debug("Execution Started\n");
@@ -484,15 +485,15 @@ igt_main
 					igt_debug("Execution Finished\n");
 				}
 			/* While exec in threads above, let's check rc_status */
-			assert(igt_wait(!in_rc6(sysfs, gt), 1000, 1));
+			assert(igt_wait(!in_rc6(sysfs, tile, gt), 1000, 1));
 			igt_waitchildren();
 		}
 	}
 
 	igt_fixture {
-		xe_for_each_gt(fd, gt) {
-			set_freq(sysfs, gt, "min", stash_min);
-			set_freq(sysfs, gt, "max", stash_max);
+		xe_for_each_gt_under_each_tile(fd, tile, gt) {
+			set_freq(sysfs, tile, gt, "min", stash_min);
+			set_freq(sysfs, tile, gt, "max", stash_max);
 		}
 		close(sysfs);
 		xe_device_put(fd);
-- 
2.25.1
