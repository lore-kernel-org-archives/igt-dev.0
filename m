Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D4810E2CB
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 09:52:12 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  4 Dec 2023 15:29:47 +0530
Message-Id: <20231204095949.2233063-3-jeevan.b@intel.com>
In-Reply-To: <20231204095949.2233063-1-jeevan.b@intel.com>
References: <20231204095949.2233063-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] tests/intel/kms_psr: fix subtest naming
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

update subtest naming from sub_test to sub-test.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_psr.c | 72 +++++++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 31d6f779c..aea8b0b3f 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -43,20 +43,20 @@
 #include "xe/xe_query.h"
 
 /**
- * SUBTEST: %s_basic
+ * SUBTEST: %s-basic
  * Description: Basic check for %arg[1] if it is detecting changes made in planes
  * Functionality: %arg[1]
  *
- * SUBTEST: %s_dpms
+ * SUBTEST: %s-dpms
  * Description: Check if %arg[1] is detecting changes when rendering operation
  *              is performed with dpms enabled or disabled
  * Functionality: %arg[1], dpms
  *
- * SUBTEST: %s_no_drrs
+ * SUBTEST: %s-no-drrs
  * Description: Check if %arg[1] is detecting changes when drrs is disabled
  * Functionality: %arg[1], drrs
  *
- * SUBTEST: %s_suspend
+ * SUBTEST: %s-suspend
  * Description: Check if %arg[1] is detecting changes when plane operation is
  *              performed with suspend resume cycles
  * Functionality: %arg[1], suspend
@@ -68,7 +68,7 @@
  */
 
 /**
- * SUBTEST: %s_%s_%s
+ * SUBTEST: %s-%s-%s
  * Description: Check if %arg[1] is detecting memory mapping %arg[3] operations
  * 		performed on %arg[2] planes
  * Driver requirement: i915
@@ -87,17 +87,17 @@
  *
  * arg[3]:
  *
- * @mmap_cpu:           MMAP CPU
- * @mmap_gtt:           MMAP GTT
+ * @mmap-cpu:           MMAP CPU
+ * @mmap-gtt:           MMAP GTT
  */
 
 /**
- * SUBTEST: %s_primary_page_flip
+ * SUBTEST: %s-primary-page-flip
  * Description: Check if %arg[1] is detecting page-flipping operation
  * 		performed on primary plane
  * Functionality: %arg[1], plane
  *
- * SUBTEST: %s_primary_%s
+ * SUBTEST: %s-primary-%s
  * Description: Check if %arg[1] is detecting rendering operations %arg[2]
  * 		when performed on primary plane
  * Functionality: %arg[1], plane
@@ -114,7 +114,7 @@
  */
 
 /**
- * SUBTEST: %s_%s_%s
+ * SUBTEST: %s-%s-%s
  * Description: Check if %arg[1] is detecting rendering and plane
  *              operations %arg[3] performed on %arg[2] planes
  * Functionality: %arg[1], plane
@@ -133,28 +133,28 @@
  *
  * @blt:                Blitter
  * @render:             Render
- * @plane_onoff:        Plane On off
- * @plane_move:         Move plane position
+ * @plane-onoff:        Plane On off
+ * @plane-move:         Move plane position
  */
 
 /**
- * SUBTEST: pr_basic
+ * SUBTEST: pr-basic
  * Description: Basic check for pr if it is detecting changes made in planes
  * Functionality: pr
  * Mega feature: DP2.0
  *
- * SUBTEST: pr_dpms
+ * SUBTEST: pr-dpms
  * Description: Check if pr is detecting changes when rendering operation
  *              is performed with dpms enabled or disabled
  * Functionality: pr, dpms
  * Mega feature: DP2.0
  *
- * SUBTEST: pr_no_drrs
+ * SUBTEST: pr-no-drrs
  * Description: Check if pr is detecting changes when drrs is disabled
  * Functionality: pr, drrs
  * Mega feature: DP2.0
  *
- * SUBTEST: pr_suspend
+ * SUBTEST: pr-suspend
  * Description: Check if pr is detecting changes when plane operation is
  *              performed with suspend resume cycles
  * Functionality: pr, suspend
@@ -162,7 +162,7 @@
  */
 
 /**
- * SUBTEST: pr_%s_%s
+ * SUBTEST: pr-%s-%s
  * Description: Check if pr is detecting memory mapping %arg[2] operations
  * 		performed on %arg[1] planes
  * Driver requirement: i915
@@ -177,18 +177,18 @@
  *
  * arg[2]:
  *
- * @mmap_cpu:           MMAP CPU
- * @mmap_gtt:           MMAP GTT
+ * @mmap-cpu:           MMAP CPU
+ * @mmap-gtt:           MMAP GTT
  */
 
 /**
- * SUBTEST: pr_primary_page_flip
+ * SUBTEST: pr-primary-page-flip
  * Description: Check if pr is detecting page-flipping operation
  * 		performed on primary plane
  * Functionality: pr, plane
  * Mega feature: DP2.0
  *
- * SUBTEST: pr_primary_%s
+ * SUBTEST: pr-primary-%s
  * Description: Check if pr is detecting rendering operations %arg[1]
  * 		when performed on primary plane
  * Functionality: pr, plane
@@ -201,7 +201,7 @@
  */
 
 /**
- * SUBTEST: pr_%s_%s
+ * SUBTEST: pr-%s-%s
  * Description: Check if pr is detecting rendering and plane
  *              operations %arg[2] performed on %arg[1] planes
  * Functionality: pr, plane
@@ -216,8 +216,8 @@
  *
  * @blt:                Blitter
  * @render:             Render
- * @plane_onoff:        Plane On off
- * @plane_move:         Move plane position
+ * @plane-onoff:        Plane On off
+ * @plane-move:         Move plane position
  */
 
 enum operations {
@@ -233,13 +233,13 @@ enum operations {
 static const char *op_str(enum operations op)
 {
 	static const char * const name[] = {
-		[PAGE_FLIP] = "page_flip",
-		[MMAP_GTT] = "mmap_gtt",
-		[MMAP_CPU] = "mmap_cpu",
+		[PAGE_FLIP] = "page-flip",
+		[MMAP_GTT] = "mmap-gtt",
+		[MMAP_CPU] = "mmap-cpu",
 		[BLT] = "blt",
 		[RENDER] = "render",
-		[PLANE_MOVE] = "plane_move",
-		[PLANE_ONOFF] = "plane_onoff",
+		[PLANE_MOVE] = "plane-move",
+		[PLANE_ONOFF] = "plane-onoff",
 	};
 
 	return name[op];
@@ -682,9 +682,9 @@ igt_main
 	int z;
 	enum operations op;
 	const char *append_subtest_name[3] = {
-		"psr_",
-		"psr2_",
-		"pr_"
+		"psr-",
+		"psr2-",
+		"pr-"
 	};
 	int modes[] = {PSR_MODE_1, PSR_MODE_2, PR_MODE};
 	igt_output_t *output;
@@ -719,7 +719,7 @@ igt_main
 		}
 
 		igt_describe("Check if psr is detecting changes when drrs is disabled");
-		igt_subtest_with_dynamic_f("%sno_drrs", append_subtest_name[z]) {
+		igt_subtest_with_dynamic_f("%sno-drrs", append_subtest_name[z]) {
 			for_each_connected_output(&data.display, output) {
 				if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
 						      data.op_psr_mode, output))
@@ -738,7 +738,7 @@ igt_main
 		for (op = PAGE_FLIP; op <= RENDER; op++) {
 			igt_describe("Check if psr is detecting page-flipping,memory mapping and "
 					"rendering operations performed on primary planes");
-			igt_subtest_with_dynamic_f("%sprimary_%s",
+			igt_subtest_with_dynamic_f("%sprimary-%s",
 				      append_subtest_name[z],
 				      op_str(op)) {
 				igt_skip_on(is_xe_device(data.drm_fd) &&
@@ -763,7 +763,7 @@ igt_main
 		for (op = MMAP_GTT; op <= PLANE_ONOFF; op++) {
 			igt_describe("Check if psr is detecting memory mapping,rendering "
 					"and plane operations performed on sprite planes");
-			igt_subtest_with_dynamic_f("%ssprite_%s",
+			igt_subtest_with_dynamic_f("%ssprite-%s",
 				      append_subtest_name[z],
 				      op_str(op)) {
 				igt_skip_on(is_xe_device(data.drm_fd) &&
@@ -786,7 +786,7 @@ igt_main
 
 			igt_describe("Check if psr is detecting memory mapping, rendering "
 					"and plane operations performed on cursor planes");
-			igt_subtest_with_dynamic_f("%scursor_%s",
+			igt_subtest_with_dynamic_f("%scursor-%s",
 				      append_subtest_name[z],
 				      op_str(op)) {
 				igt_skip_on(is_xe_device(data.drm_fd) &&
-- 
2.25.1
