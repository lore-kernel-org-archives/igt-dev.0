Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691F910E2DD
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 10:24:21 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Jun 2023 15:56:55 +0530
Message-Id: <20230627102656.475578-2-riana.tauro@intel.com>
In-Reply-To: <20230627102656.475578-1-riana.tauro@intel.com>
References: <20230627102656.475578-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/xe/xe_guc_pc: Remove rc6 tests
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

Remove these tests as sysfs paths have been changed and
a generic naming used

These tests will be moved to a different file

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/xe/xe_guc_pc.c | 44 --------------------------------------------
 1 file changed, 44 deletions(-)

diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
index 89d5ae9e..79359942 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -348,27 +348,6 @@ static void test_reset(int fd, int sysfs, int gt_id, int cycles)
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
@@ -460,29 +439,6 @@ igt_main
 		}
 	}
 
-	igt_subtest("rc6_on_idle") {
-		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
-		xe_for_each_gt(fd, gt) {
-			assert(igt_wait(in_rc6(sysfs, gt), 1000, 1));
-		}
-	}
-
-	igt_subtest("rc0_on_exec") {
-		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
-		xe_for_each_gt(fd, gt) {
-			assert(igt_wait(in_rc6(sysfs, gt), 1000, 1));
-			xe_for_each_hw_engine(fd, hwe)
-				igt_fork(child, ncpus) {
-					igt_debug("Execution Started\n");
-					exec_basic(fd, hwe, MAX_N_ENGINES, 16);
-					igt_debug("Execution Finished\n");
-				}
-			/* While exec in threads above, let's check rc_status */
-			assert(igt_wait(!in_rc6(sysfs, gt), 1000, 1));
-			igt_waitchildren();
-		}
-	}
-
 	igt_fixture {
 		xe_for_each_gt(fd, gt) {
 			set_freq(sysfs, gt, "min", stash_min);
-- 
2.40.0
