Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DCE10E6D2
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 09:38:11 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Nov 2023 15:15:56 +0530
Message-Id: <20231130094557.2124614-2-jeevan.b@intel.com>
In-Reply-To: <20231130094557.2124614-1-jeevan.b@intel.com>
References: <20231130094557.2124614-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/intel/kms_psr: Add FBC support to
 PSR/PSR2/PR tests
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

For LunarLake (intel_display_ver 20), FBC can be enabled along with
PSR/PSR2/PR, thereby adding FBC checks to validate this scenario.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_psr.h         |   5 +
 tests/intel/kms_psr.c | 459 ++++++++++++++++++++++++++++--------------
 2 files changed, 315 insertions(+), 149 deletions(-)

diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index a30330e6c..36711c0d4 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -40,6 +40,11 @@ enum psr_mode {
 	PSR_DISABLED,
 };
 
+enum fbc_mode {
+	FBC_DISABLED,
+	FBC_ENABLED,
+};
+
 bool psr_disabled_check(int debugfs_fd);
 bool psr2_selective_fetch_check(int debugfs_fd);
 bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 05bdd7b98..4401d52b6 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -35,6 +35,7 @@
 #include "igt_sysfs.h"
 #include "igt_psr.h"
 #include "intel_pat.h"
+#include "i915/intel_fbc.h"
 #include <errno.h>
 #include <stdbool.h>
 #include <stdio.h>
@@ -43,16 +44,25 @@
 #include "xe/xe_query.h"
 
 /**
- * SUBTEST: psr_basic
+ * SUBTEST: psr-basic
  * Description: Basic check for psr if it is detecting changes made in planes
  * Functionality: psr1
  *
- * SUBTEST: psr_%s_%s
+ * SUBTEST: fbc-psr-basic
+ * Description: Basic check for psr if it is detecting changes made in planes
+ * Functionality: psr, fbc
+ *
+ * SUBTEST: psr-%s-%s
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on %arg[1]
  * Driver requirement: i915
  * Functionality: kms_core, plane, psr1
  *
+ * SUBTEST: fbc-psr-%s-%s
+ * Description: Check if fbc with psr is detecting memory mapping, rendering and plane
+ *              operations performed on %arg[1]
+ * Functionality: kms_core, plane, psr, fbc
+ *
  * arg[1]:
  *
  * @cursor:             Cursor plane
@@ -61,21 +71,31 @@
  *
  * arg[2]:
  *
- * @mmap_cpu:           MMAP CPU
- * @mmap_gtt:           MMAP GTT
+ * @mmap-cpu:           MMAP CPU
+ * @mmap-gtt:           MMAP GTT
  */
 
 /**
- * SUBTEST: psr_sprite_plane_move
+ * SUBTEST: psr-sprite-plane-move
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on sprite planes
  * Functionality: plane, psr1
  *
- * SUBTEST: psr_%s_%s
+ * SUBTEST: fbc-psr-sprite-plane-move
+ * Description: Check if fbc with psr is detecting memory mapping, rendering and plane
+ *              operations performed on sprite planes
+ * Functionality: plane, psr, fbc
+ *
+ * SUBTEST: psr-%s-%s
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on %arg[1] planes
  * Functionality: kms_core, plane, psr1
  *
+ * SUBTEST: fbc-psr-%s-%s
+ * Description: Check if fbc with psr is detecting memory mapping, rendering and plane
+ *              operations performed on %arg[1] planes
+ * Functionality: kms_core, plane, psr, fbc
+ *
  * arg[1]:
  *
  * @cursor:             Cursor plane
@@ -85,15 +105,20 @@
  *
  * @blt:                Blitter
  * @render:             Render
- * @plane_onoff:        Plane On off
+ * @plane-onoff:        Plane On off
  */
 
 /**
- * SUBTEST: psr_primary_%s
+ * SUBTEST: psr-primary-%s
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on %arg[1] planes
  * Functionality: kms_core, psr1
  *
+ * SUBTEST: fbc-psr-primary-%s
+ * Description: Check if fbc with psr is detecting memory mapping, rendering and plane
+ *              operations performed on %arg[1] planes
+ * Functionality: kms_core, psr, fbc
+ *
  * arg[1]:
  *
  * @blt:                Blitter
@@ -101,44 +126,81 @@
  */
 
 /**
- * SUBTEST: psr_dpms
+ * SUBTEST: psr-dpms
  * Description: Check if psr is detecting changes when rendering operation is
  *              performed  with dpms enabled or disabled
  * Functionality: dpms, psr1
  *
- * SUBTEST: psr_no_drrs
+ * SUBTEST: fbc-psr-dpms
+ * Description: Check if fbc with psr is detecting changes when rendering operation is
+ *              performed  with dpms enabled or disabled
+ * Functionality: dpms, psr, fbc
+ *
+ * SUBTEST: psr-no-drrs
  * Description: Check if psr is detecting changes when drrs is disabled
  * Functionality: drrs, psr1
  *
- * SUBTEST: psr_suspend
+ * SUBTEST: fbc-psr-no-drrs
+ * Description: Check if fbc with psr is detecting changes when drrs is disabled
+ * Functionality: drrs, psr, fbc
+ *
+ * SUBTEST: psr-suspend
  * Description: Check if psr is detecting changes when plane operation
  *              is performed with suspend resume cycles
  * Functionality: psr1, suspend
  *
- * SUBTEST: psr2_dpms
+ * SUBTEST: fbc-psr-suspend
+ * Description: Check if fbc with psr is detecting changes when plane operation
+ *              is performed with suspend resume cycles
+ * Functionality: psr, suspend, fbc
+ *
+ * SUBTEST: psr2-dpms
  * Description: Check if psr is detecting changes when rendering operation
  *              is performed  with dpms enabled or disabled
  * Functionality: dpms, psr2
  *
- * SUBTEST: psr2_no_drrs
+ * SUBTEST: fbc-psr2-dpms
+ * Description: Check if fbc with psr is detecting changes when rendering operation
+ *              is performed  with dpms enabled or disabled
+ * Functionality: dpms, psr, psr2, fbc
+ *
+ * SUBTEST: psr2-no-drrs
  * Description: Check if psr is detecting changes when drrs is disabled
  * Functionality: drrs, psr2
  *
- * SUBTEST: psr2_suspend
+ * SUBTEST: fbc-psr2-no-drrs
+ * Description: Check if fbc with psr is detecting changes when drrs is disabled
+ * Functionality: drrs, psr, psr2, fbc
+ *
+ * SUBTEST: psr2-suspend
  * Description: Check if psr is detecting changes when plane operation is
  *              performed with suspend resume cycles
  * Functionality: psr2, suspend
  *
- * SUBTEST: psr2_basic
+ * SUBTEST: fbc-psr2-suspend
+ * Description: Check if fbc with psr is detecting changes when plane operation is
+ *              performed with suspend resume cycles
+ * Functionality: psr, psr2, suspend, fbc
+ *
+ * SUBTEST: psr2-basic
  * Description: Basic check for psr if it is detecting changes made in planes
  * Functionality: psr2
  *
- * SUBTEST: psr2_%s_%s
+ * SUBTEST: fbc-psr2-basic
+ * Description: Basic check for fbc with psr if it is detecting changes made in planes
+ * Functionality: psr, psr2, fbc
+ *
+ * SUBTEST: psr2-%s-%s
  * Description: Check if psr2 is detecting memory mapping, rendering and plane
  *              operations performed on %arg[1] planes
  * Driver requirement: i915
  * Functionality: kms_core, plane, psr2
  *
+ * SUBTEST: fbc-psr2-%s-%s
+ * Description: Check if fbc with psr2 is detecting memory mapping, rendering and plane
+ *              operations performed on %arg[1] planes
+ * Functionality: kms_core, plane, psr, psr2, fbc
+ *
  * arg[1]:
  *
  * @cursor:             Cursor plane
@@ -147,21 +209,31 @@
  *
  * arg[2]:
  *
- * @mmap_cpu:           MMAP CPU
- * @mmap_gtt:           MMAP GTT
+ * @mmap-cpu:           MMAP CPU
+ * @mmap-gtt:           MMAP GTT
  */
 
 /**
- * SUBTEST: psr2_primary_page_flip
+ * SUBTEST: psr2-primary-page-flip
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on primary planes
  * Functionality: plane, psr2
  *
- * SUBTEST: psr2_primary_%s
+ * SUBTEST: fbc-psr2-primary-page-flip
+ * Description: Check if fbc with psr is detecting memory mapping, rendering and plane
+ *              operations performed on primary planes
+ * Functionality: plane, psr, psr2, fbc
+ *
+ * SUBTEST: psr2-primary-%s
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on primary planes
  * Functionality: kms_core, plane, psr2
  *
+ * SUBTEST: fbc-psr2-primary-%s
+ * Description: Check if fbc with psr is detecting memory mapping, rendering and plane
+ *              operations performed on primary planes
+ * Functionality: kms_core, plane, psr, psr2, fbc
+ *
  * arg[1]:
  *
  * @blt:                Blitter
@@ -169,11 +241,16 @@
  */
 
 /**
- * SUBTEST: psr2_%s_%s
+ * SUBTEST: psr2-%s-%s
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on %arg[1] planes
  * Functionality: kms_core, plane, psr2
  *
+ * SUBTEST: fbc-psr2-%s-%s
+ * Description: Check if psr is detecting memory mapping, rendering and plane
+ *              operations performed on %arg[1] planes
+ * Functionality: kms_core, plane, psr, psr2, fbc
+ *
  * arg[1]:
  *
  * @cursor:             Cursor plane
@@ -183,42 +260,67 @@
  *
  * @blt:                Blitter
  * @render:             Render
- * @plane_onoff:        Plane On off
- * @plane_move:         Move plane position
+ * @plane-onoff:        Plane On off
+ * @plane-move:         Move plane position
  */
 
 /**
- * SUBTEST: pr_dpms
+ * SUBTEST: pr-dpms
  * Description: Check if pr is detecting changes when rendering operation
  *              is performed with dpms enabled or disabled
  * Functionality: dpms, pr
  * Mega feature: Panel Replay
  *
- * SUBTEST: pr_no_drrs
+ * SUBTEST: fbc-pr-dpms
+ * Description: Check if fbc with pr is detecting changes when rendering operation
+ *              is performed with dpms enabled or disabled
+ * Functionality: dpms, pr, fbc
+ *
+ * SUBTEST: pr-no-drrs
  * Description: Check if pr is detecting changes when drrs is disabled
  * Functionality: drrs, pr
  * Mega feature: Panel Replay
  *
- * SUBTEST: pr_suspend
+ * SUBTEST: fbc-pr-no-drrs
+ * Description: Check if pr is detecting changes when drrs is disabled
+ * Functionality: drrs, pr, fbc
+ *
+ * SUBTEST: pr-suspend
  * Description: Check if pr is detecting changes when plane operation is
  *              performed with suspend resume cycles
  * Functionality: pr, suspend
  * Mega feature: Panel Replay
  *
- * SUBTEST: pr_basic
+ * SUBTEST: fbc-pr-suspend
+ * Description: Check if fbc with pr is detecting changes when plane operation is
+ *              performed with suspend resume cycles
+ * Functionality: pr, suspend, fbc
+ *
+ * SUBTEST: pr-basic
  * Description: Basic check for pr if it is detecting changes made in planes
  * Functionality: pr
  * Mega feature: Panel Replay
+ *
+ * SUBTEST: fbc-pr-basic
+ * Description: Basic check for fbc with pr if it is detecting changes made in planes
+ * Functionality: pr, fbc
  */
 
 /**
- * SUBTEST: pr_%s_%s
+ * SUBTEST: pr-%s-%s
  * Description: Check if pr is detecting memory mapping, rendering and plane
  *              operations performed on %arg[1] planes
  * Driver requirement: i915
  * Functionality: kms_core, plane, pr
  * Mega feature: Panel Replay
  *
+ * SUBTEST: fbc-pr-%s-%s
+ * Description: Check if fbc with pr is detecting memory mapping, rendering and plane
+ *              operations performed on %arg[1] planes
+ * Driver requirement: i915
+ * Functionality: kms_core, plane, pr, fbc
+ * Mega feature: Panel Replay, FBC
+ * Test category: functionality test
  * arg[1]:
  *
  * @cursor:             Cursor plane
@@ -227,23 +329,35 @@
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
  * Description: Check if pr is detecting memory mapping, rendering and plane
  *              operations performed on primary planes
  * Functionality: plane, pr
  * Mega feature: Panel Replay
  *
- * SUBTEST: pr_primary_%s
+ * SUBTEST: fbc-pr-primary-page-flip
+ * Description: Check if fbc with pr is detecting memory mapping, rendering and plane
+ *              operations performed on primary planes
+ * Functionality: plane, pr, fbc
+ * Mega feature: Panel Replay, FBC
+ *
+ * SUBTEST: pr-primary-%s
  * Description: Check if pr is detecting memory mapping, rendering and plane
  *              operations performed on primary planes
  * Functionality: kms_core, plane, pr
  * Mega feature: Panel Replay
  *
+ * SUBTEST: fbc-pr-primary-%s
+ * Description: Check if fbc with pr is detecting memory mapping, rendering and plane
+ *              operations performed on primary planes
+ * Functionality: kms_core, plane, pr, fbc
+ * Mega feature: Panel Replay, FBC
+ *
  * arg[1]:
  *
  * @blt:                Blitter
@@ -251,12 +365,18 @@
  */
 
 /**
- * SUBTEST: pr_%s_%s
+ * SUBTEST: pr-%s-%s
  * Description: Check if pr is detecting memory mapping, rendering and plane
  *              operations performed on %arg[1] planes
  * Functionality: kms_core, plane, pr
  * Mega feature: Panel Replay
  *
+ * SUBTEST: fbc-pr-%s-%s
+ * Description: Check if fbc with pr is detecting memory mapping, rendering and plane
+ *              operations performed on %arg[1] planes
+ * Functionality: kms_core, plane, pr, fbc
+ * Mega feature: Panel Replay, FBC
+ *
  * arg[1]:
  *
  * @cursor:             Cursor plane
@@ -266,25 +386,40 @@
  *
  * @blt:                Blitter
  * @render:             Render
- * @plane_onoff:        Plane On off
- * @plane_move:         Move plane position
+ * @plane-onoff:        Plane On off
+ * @plane-move:         Move plane position
  */
 
 /**
- * SUBTEST: psr_cursor_plane_move
+ * SUBTEST: psr-cursor-plane-move
  * Description: Check if psr is detecting the plane operations performed on
  *		cursor planes
  * Functionality: psr1
  *
- * SUBTEST: psr_primary_page_flip
+ * SUBTEST: fbc-psr-cursor-plane-move
+ * Description: Check if fbc with psr is detecting the plane operations performed on
+ *              cursor planes
+ * Functionality: psr1, fbc
+ *
+ * SUBTEST: psr-primary-page-flip
  * Description: Check if psr is detecting page-flipping operations performed
  *		on primary planes
  * Functionality: psr1
  *
- * SUBTEST: psr_sprite_plane_onoff
+ * SUBTEST: fbc-psr-primary-page-flip
+ * Description: Check if psr is detecting page-flipping operations performed
+ *              on primary planes
+ * Functionality: psr1, fbc
+ *
+ * SUBTEST: psr-sprite-plane-onoff
  * Description: Check if psr is detecting the plane operations performed on
  *		sprite planes
  * Functionality: psr1
+ *
+ * SUBTEST: fbc-psr-sprite-plane-onoff
+ * Description: Check if psr is detecting the plane operations performed on
+ *              sprite planes
+ * Functionality: psr1, fbc
  */
 
 enum operations {
@@ -300,13 +435,13 @@ enum operations {
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
@@ -318,6 +453,7 @@ typedef struct {
 	enum operations op;
 	int test_plane_id;
 	enum psr_mode op_psr_mode;
+	enum fbc_mode op_fbc_mode;
 	uint32_t devid;
 	uint32_t crtc_id;
 	igt_display_t display;
@@ -328,6 +464,7 @@ typedef struct {
 	int mod_stride;
 	drmModeModeInfo *mode;
 	igt_output_t *output;
+	bool fbc_flag;
 } data_t;
 
 static void create_cursor_fb(data_t *data)
@@ -725,10 +862,15 @@ static void test_setup(data_t *data)
 
 		psr_enable_if_enabled(data);
 		setup_test_plane(data, data->test_plane_id);
+		if (data->fbc_flag == true && data->op_fbc_mode == FBC_ENABLED)
+			igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
+								  pipe),
+								  "FBC still disabled");
 		if (psr_wait_entry_if_enabled(data)) {
 			psr_entered = true;
 			break;
 		}
+
 	}
 
 	igt_assert(psr_entered);
@@ -746,14 +888,20 @@ data_t data = {};
 
 igt_main
 {
-	int z;
+	int z, y;
 	enum operations op;
+	enum pipe pipe;
 	const char *append_subtest_name[3] = {
-		"psr_",
-		"psr2_",
-		"pr_"
+		"psr-",
+		"psr2-",
+		"pr-"
+	};
+	const char *append_fbc_subtest[2] = {
+		"",
+		"fbc-"
 	};
 	int modes[] = {PSR_MODE_1, PSR_MODE_2, PR_MODE};
+	int fbc_status[] = {FBC_DISABLED, FBC_ENABLED};
 	igt_output_t *output;
 
 	igt_fixture {
@@ -764,52 +912,38 @@ igt_main
 		data.bops = buf_ops_create(data.drm_fd);
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require_f(output_supports_psr(&data), "Sink does not support PSR/PSR2/PR\n");
+		if ((intel_display_ver(intel_get_drm_devid(data.drm_fd) == 20)) &&
+		    (intel_fbc_supported_on_chipset(data.drm_fd, pipe))) {
+			data.fbc_flag = true;
+		}
 	}
 
-	for (z = 0; z < ARRAY_SIZE(modes); z++) {
-		data.op_psr_mode = modes[z];
-
-		igt_describe("Basic check for psr if it is detecting changes made in planes");
-		igt_subtest_with_dynamic_f("%sbasic", append_subtest_name[z]) {
-			for_each_connected_output(&data.display, output) {
-				if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
-						      data.op_psr_mode, output))
-					continue;
-				igt_display_reset(&data.display);
-				data.output = output;
-				igt_dynamic_f("%s", data.output->name) {
-					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-					test_setup(&data);
-					test_cleanup(&data);
-				}
-			}
-		}
+	for (y = 0; y < ARRAY_SIZE(fbc_status); y++) {
+		data.op_fbc_mode = fbc_status[y];
+		for (z = 0; z < ARRAY_SIZE(modes); z++) {
+			data.op_psr_mode = modes[z];
 
-		igt_describe("Check if psr is detecting changes when drrs is disabled");
-		igt_subtest_with_dynamic_f("%sno_drrs", append_subtest_name[z]) {
-			for_each_connected_output(&data.display, output) {
-				if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
-						      data.op_psr_mode, output))
-					continue;
-				igt_display_reset(&data.display);
-				data.output = output;
-				igt_dynamic_f("%s", data.output->name) {
-					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-					test_setup(&data);
-					igt_assert(drrs_disabled(&data));
-					test_cleanup(&data);
+			igt_describe("Basic check for psr if it is detecting changes made "
+				     "in planes");
+			igt_subtest_with_dynamic_f("%s%sbasic", append_fbc_subtest[y],
+						   append_subtest_name[z]) {
+				for_each_connected_output(&data.display, output) {
+					if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
+							      data.op_psr_mode, output))
+						continue;
+					igt_display_reset(&data.display);
+					data.output = output;
+					igt_dynamic_f("%s", data.output->name) {
+						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+						test_setup(&data);
+						test_cleanup(&data);
+					}
 				}
 			}
-		}
 
-		for (op = PAGE_FLIP; op <= RENDER; op++) {
-			igt_describe("Check if psr is detecting page-flipping,memory mapping and "
-					"rendering operations performed on primary planes");
-			igt_subtest_with_dynamic_f("%sprimary_%s",
-				      append_subtest_name[z],
-				      op_str(op)) {
-				igt_skip_on(is_xe_device(data.drm_fd) &&
-					    (op == MMAP_CPU || op == MMAP_GTT));
+			igt_describe("Check if psr is detecting changes when drrs is disabled");
+			igt_subtest_with_dynamic_f("%s%sno-drrs", append_fbc_subtest[y],
+						   append_subtest_name[z]) {
 				for_each_connected_output(&data.display, output) {
 					if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
 							      data.op_psr_mode, output))
@@ -817,24 +951,91 @@ igt_main
 					igt_display_reset(&data.display);
 					data.output = output;
 					igt_dynamic_f("%s", data.output->name) {
-						data.op = op;
 						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 						test_setup(&data);
-						run_test(&data);
+						igt_assert(drrs_disabled(&data));
 						test_cleanup(&data);
 					}
 				}
 			}
-		}
 
-		for (op = MMAP_GTT; op <= PLANE_ONOFF; op++) {
-			igt_describe("Check if psr is detecting memory mapping,rendering "
-					"and plane operations performed on sprite planes");
-			igt_subtest_with_dynamic_f("%ssprite_%s",
-				      append_subtest_name[z],
-				      op_str(op)) {
-				igt_skip_on(is_xe_device(data.drm_fd) &&
-					    (op == MMAP_CPU || op == MMAP_GTT));
+			for (op = PAGE_FLIP; op <= RENDER; op++) {
+				igt_describe("Check if psr is detecting page-flipping,memory "
+					     "mapping and rendering operations performed on "
+					     "primary planes");
+				igt_subtest_with_dynamic_f("%s%sprimary-%s", append_fbc_subtest[y],
+					      append_subtest_name[z],
+					      op_str(op)) {
+					igt_skip_on(is_xe_device(data.drm_fd) &&
+						    (op == MMAP_CPU || op == MMAP_GTT));
+					for_each_connected_output(&data.display, output) {
+						if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
+								      data.op_psr_mode, output))
+							continue;
+						igt_display_reset(&data.display);
+						data.output = output;
+						igt_dynamic_f("%s", data.output->name) {
+							data.op = op;
+							data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+							test_setup(&data);
+							run_test(&data);
+							test_cleanup(&data);
+						}
+					}
+				}
+			}
+
+			for (op = MMAP_GTT; op <= PLANE_ONOFF; op++) {
+				igt_describe("Check if psr is detecting memory mapping,rendering "
+						"and plane operations performed on sprite planes");
+				igt_subtest_with_dynamic_f("%s%ssprite-%s", append_fbc_subtest[y],
+					      append_subtest_name[z],
+					      op_str(op)) {
+					igt_skip_on(is_xe_device(data.drm_fd) &&
+						    (op == MMAP_CPU || op == MMAP_GTT));
+					for_each_connected_output(&data.display, output) {
+						if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
+								      data.op_psr_mode, output))
+							continue;
+						igt_display_reset(&data.display);
+						data.output = output;
+						igt_dynamic_f("%s", data.output->name) {
+							data.op = op;
+							data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+							test_setup(&data);
+							run_test(&data);
+							test_cleanup(&data);
+						}
+					}
+				}
+
+				igt_describe("Check if psr is detecting memory mapping, rendering "
+						"and plane operations performed on cursor planes");
+				igt_subtest_with_dynamic_f("%s%scursor-%s", append_fbc_subtest[y],
+							   append_subtest_name[z],
+							   op_str(op)) {
+					igt_skip_on(is_xe_device(data.drm_fd) &&
+						    (op == MMAP_CPU || op == MMAP_GTT));
+					for_each_connected_output(&data.display, output) {
+						if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
+								      data.op_psr_mode, output))
+							continue;
+						igt_display_reset(&data.display);
+						data.output = output;
+						igt_dynamic_f("%s", data.output->name) {
+							data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+							test_setup(&data);
+							run_test(&data);
+							test_cleanup(&data);
+						}
+					}
+				}
+			}
+
+			igt_describe("Check if psr is detecting changes when rendering operation "
+				     "is performed  with dpms enabled or disabled");
+			igt_subtest_with_dynamic_f("%s%sdpms", append_fbc_subtest[y],
+						   append_subtest_name[z]) {
 				for_each_connected_output(&data.display, output) {
 					if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
 							      data.op_psr_mode, output))
@@ -842,22 +1043,20 @@ igt_main
 					igt_display_reset(&data.display);
 					data.output = output;
 					igt_dynamic_f("%s", data.output->name) {
-						data.op = op;
-						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+						data.op = igt_get_render_copyfunc(data.devid) ? RENDER : BLT;
+						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 						test_setup(&data);
+						dpms_off_on(&data);
 						run_test(&data);
 						test_cleanup(&data);
 					}
 				}
 			}
 
-			igt_describe("Check if psr is detecting memory mapping, rendering "
-					"and plane operations performed on cursor planes");
-			igt_subtest_with_dynamic_f("%scursor_%s",
-				      append_subtest_name[z],
-				      op_str(op)) {
-				igt_skip_on(is_xe_device(data.drm_fd) &&
-					    (op == MMAP_CPU || op == MMAP_GTT));
+			igt_describe("Check if psr is detecting changes when plane operation is "
+				     "performed with suspend resume cycles");
+			igt_subtest_with_dynamic_f("%s%ssuspend", append_fbc_subtest[y],
+						   append_subtest_name[z]) {
 				for_each_connected_output(&data.display, output) {
 					if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
 							      data.op_psr_mode, output))
@@ -865,56 +1064,18 @@ igt_main
 					igt_display_reset(&data.display);
 					data.output = output;
 					igt_dynamic_f("%s", data.output->name) {
+						data.op = PLANE_ONOFF;
 						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
 						test_setup(&data);
+						igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+									      SUSPEND_TEST_NONE);
+						igt_assert(psr_wait_entry_if_enabled(&data));
 						run_test(&data);
 						test_cleanup(&data);
 					}
 				}
 			}
 		}
-
-		igt_describe("Check if psr is detecting changes when rendering operation is performed"
-				"  with dpms enabled or disabled");
-		igt_subtest_with_dynamic_f("%sdpms", append_subtest_name[z]) {
-			for_each_connected_output(&data.display, output) {
-				if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
-						      data.op_psr_mode, output))
-					continue;
-				igt_display_reset(&data.display);
-				data.output = output;
-				igt_dynamic_f("%s", data.output->name) {
-					data.op = igt_get_render_copyfunc(data.devid) ? RENDER : BLT;
-					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-					test_setup(&data);
-					dpms_off_on(&data);
-					run_test(&data);
-					test_cleanup(&data);
-				}
-			}
-		}
-
-		igt_describe("Check if psr is detecting changes when plane operation is performed "
-				"with suspend resume cycles");
-		igt_subtest_with_dynamic_f("%ssuspend", append_subtest_name[z]) {
-			for_each_connected_output(&data.display, output) {
-				if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
-						      data.op_psr_mode, output))
-					continue;
-				igt_display_reset(&data.display);
-				data.output = output;
-				igt_dynamic_f("%s", data.output->name) {
-					data.op = PLANE_ONOFF;
-					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-					test_setup(&data);
-					igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
-								      SUSPEND_TEST_NONE);
-					igt_assert(psr_wait_entry_if_enabled(&data));
-					run_test(&data);
-					test_cleanup(&data);
-				}
-			}
-		}
 	}
 
 	igt_fixture {
-- 
2.25.1
