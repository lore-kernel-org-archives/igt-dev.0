Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD9F10E6FD
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 13:13:10 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:50:49 +0530
Message-Id: <20231130132050.2132447-4-jeevan.b@intel.com>
In-Reply-To: <20231130132050.2132447-1-jeevan.b@intel.com>
References: <20231130132050.2132447-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] tests/intel/kms_psr: Add FBC support to
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
Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/igt_psr.h         |   5 +
 tests/intel/kms_psr.c | 322 ++++++++++++++++++++++++++++--------------
 2 files changed, 221 insertions(+), 106 deletions(-)

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
index 5bb4acb61..fa5333f9a 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -31,6 +31,7 @@
  * Test category: functionality test
  */
 
+#include "i915/intel_fbc.h"
 #include "igt.h"
 #include "igt_sysfs.h"
 #include "igt_psr.h"
@@ -47,24 +48,42 @@
  * Description: Basic check for %arg[1] if it is detecting changes made in planes
  * Functionality: %arg[1]
  *
+ * SUBTEST: fbc-%s-basic
+ * Description: Basic check for fbc with %arg[1] if it is detecting changes made in planes
+ * Functionality: %arg[1], fbc
+ *
  * SUBTEST: %s-dpms
  * Description: Check if %arg[1] is detecting changes when rendering operation
  *              is performed with dpms enabled or disabled
  * Functionality: %arg[1], dpms
  *
+ * SUBTEST: fbc-%s-dpms
+ * Description: Check if fbc with %arg[1] is detecting changes when rendering operation
+ *              is performed with dpms enabled or disabled
+ * Functionality: %arg[1], dpms, fbc
+ *
  * SUBTEST: %s-no-drrs
  * Description: Check if %arg[1] is detecting changes when drrs is disabled
  * Functionality: %arg[1], drrs
  *
+ * SUBTEST: fbc-%s-no-drrs
+ * Description: Check if fbc with %arg[1] is detecting changes when drrs is disabled
+ * Functionality: %arg[1], drrs, fbc
+ *
  * SUBTEST: %s-suspend
  * Description: Check if %arg[1] is detecting changes when plane operation is
  *              performed with suspend resume cycles
  * Functionality: %arg[1], suspend
  *
+ * SUBTEST: fbc-%s-suspend
+ * Description: Check if fbc with %arg[1] is detecting changes when plane operation is
+ *              performed with suspend resume cycles
+ * Functionality: %arg[1], suspend, fbc
+ *
  * arg[1]:
  *
- * @psr:             psr1
- * @psr2:            psr2
+ * @psr:		psr1
+ * @psr2:		psr2
  */
 
 /**
@@ -74,6 +93,12 @@
  * Driver requirement: i915
  * Functionality: %arg[1], plane
  *
+ * SUBTEST: fbc-%s-%s-%s
+ * Description: Check if fbc with %arg[1] is detecting memory mapping %arg[3] operations
+ *              performed on %arg[2] planes
+ * Driver requirement: i915
+ * Functionality: %arg[1], plane, fbc
+ *
  * arg[1]:
  *
  * @psr:		psr1
@@ -97,11 +122,21 @@
  * 		performed on primary plane
  * Functionality: %arg[1], plane
  *
+ * SUBTEST: fbc-%s-primary-page-flip
+ * Description: Check if fbc with %arg[1] is detecting page-flipping operation
+ *              performed on primary plane
+ * Functionality: %arg[1], plane, fbc
+ *
  * SUBTEST: %s-primary-%s
  * Description: Check if %arg[1] is detecting rendering operations %arg[2]
  * 		when performed on primary plane
  * Functionality: %arg[1], plane
  *
+ * SUBTEST: fbc-%s-primary-%s
+ * Description: Check if %arg[1] is detecting rendering operations %arg[2]
+ *              when performed on primary plane
+ * Functionality: %arg[1], plane, fbc
+ *
  * arg[1]:
  *
  * @psr:		psr1
@@ -119,6 +154,11 @@
  *              operations %arg[3] performed on %arg[2] planes
  * Functionality: %arg[1], plane
  *
+ * SUBTEST: fbc-%s-%s-%s
+ * Description: Check if fbc with %arg[1] is detecting rendering and plane
+ *              operations %arg[3] performed on %arg[2] planes
+ * Functionality: %arg[1], plane, fbc
+ *
  * arg[1]:
  *
  * @psr:		psr1
@@ -143,22 +183,44 @@
  * Functionality: pr
  * Mega feature: DP2.0
  *
+ * SUBTEST: fbc-pr-basic
+ * Description: Basic check for fbc with pr if it is detecting changes made in planes
+ * Functionality: pr, fbc
+ * Mega feature: DP2.0
+ *
  * SUBTEST: pr-dpms
  * Description: Check if pr is detecting changes when rendering operation
  *              is performed with dpms enabled or disabled
  * Functionality: pr, dpms
  * Mega feature: DP2.0
  *
- * SUBTEST: pr-no_drrs
+ * SUBTEST: fbc-pr-dpms
+ * Description: Check if fbc with pr is detecting changes when rendering operation
+ *              is performed with dpms enabled or disabled
+ * Functionality: pr, dpms, fbc
+ * Mega feature: DP2.0
+ *
+ * SUBTEST: pr-no-drrs
  * Description: Check if pr is detecting changes when drrs is disabled
  * Functionality: pr, drrs
  * Mega feature: DP2.0
  *
+ * SUBTEST: fbc-pr-no-drrs
+ * Description: Check if fbc with pr is detecting changes when drrs is disabled
+ * Functionality: pr, drrs, fbc
+ * Mega feature: DP2.0
+ *
  * SUBTEST: pr-suspend
  * Description: Check if pr is detecting changes when plane operation is
  *              performed with suspend resume cycles
  * Functionality: pr, suspend
  * Mega feature: DP2.0
+ *
+ * SUBTEST: fbc-pr-suspend
+ * Description: Check if fbc with pr is detecting changes when plane operation is
+ *              performed with suspend resume cycles
+ * Functionality: pr, suspend, fbc
+ * Mega feature: DP2.0
  */
 
 /**
@@ -169,6 +231,13 @@
  * Functionality: pr, plane
  * Mega feature: DP2.0
  *
+ * SUBTEST: fbc-pr-%s-%s
+ * Description: Check if fbc with pr is detecting memory mapping %arg[2] operations
+ *              performed on %arg[1] planes
+ * Driver requirement: i915
+ * Functionality: pr, plane, fbc
+ * Mega feature: DP2.0
+ *
  * arg[1]:
  *
  * @cursor:             Cursor plane
@@ -188,12 +257,24 @@
  * Functionality: pr, plane
  * Mega feature: DP2.0
  *
+ * SUBTEST: fbc-pr-primary-page-flip
+ * Description: Check if fbc with pr is detecting page-flipping operation
+ *              performed on primary plane
+ * Functionality: pr, plane, fbc
+ * Mega feature: DP2.0
+ *
  * SUBTEST: pr-primary-%s
  * Description: Check if pr is detecting rendering operations %arg[1]
  * 		when performed on primary plane
  * Functionality: pr, plane
  * Mega feature: DP2.0
  *
+ * SUBTEST: fbc-pr-primary-%s
+ * Description: Check if fbc with pr is detecting rendering operations %arg[1]
+ *              when performed on primary plane
+ * Functionality: pr, plane, fbc
+ * Mega feature: DP2.0
+ *
  * arg[1]:
  *
  * @blt:                Blitter
@@ -207,6 +288,12 @@
  * Functionality: pr, plane
  * Mega feature: DP2.0
  *
+ * SUBTEST: fbc-pr-%s-%s
+ * Description: Check if fbc with pr is detecting rendering and plane
+ *              operations %arg[2] performed on %arg[1] planes
+ * Functionality: pr, plane, fbc
+ * Mega feature: DP2.0
+ *
  * arg[1]:
  *
  * @cursor:             Cursor plane
@@ -217,7 +304,7 @@
  * @blt:                Blitter
  * @render:             Render
  * @plane-onoff:        Plane On off
- * @plane_move:         Move plane position
+ * @plane-move:         Move plane position
  */
 
 enum operations {
@@ -251,6 +338,7 @@ typedef struct {
 	enum operations op;
 	int test_plane_id;
 	enum psr_mode op_psr_mode;
+	enum fbc_mode op_fbc_mode;
 	uint32_t devid;
 	uint32_t crtc_id;
 	igt_display_t display;
@@ -261,6 +349,7 @@ typedef struct {
 	int mod_stride;
 	drmModeModeInfo *mode;
 	igt_output_t *output;
+	bool fbc_flag;
 } data_t;
 
 static void create_cursor_fb(data_t *data)
@@ -659,6 +748,10 @@ static void test_setup(data_t *data)
 		psr_enable_if_enabled(data);
 		setup_test_plane(data, data->test_plane_id);
 		if (psr_wait_entry_if_enabled(data)) {
+			if (data->fbc_flag == true && data->op_fbc_mode == FBC_ENABLED)
+				igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
+									  pipe),
+									  "FBC still disabled");
 			psr_entered = true;
 			break;
 		}
@@ -679,14 +772,20 @@ data_t data = {};
 
 igt_main
 {
-	int z;
+	int z, y;
 	enum operations op;
+	enum pipe pipe;
 	const char *append_subtest_name[3] = {
 		"psr-",
 		"psr2-",
 		"pr-"
 	};
+	const char *append_fbc_subtest[2] = {
+		"",
+		"fbc-"
+	};
 	int modes[] = {PSR_MODE_1, PSR_MODE_2, PR_MODE};
+	int fbc_status[] = {FBC_DISABLED, FBC_ENABLED};
 	igt_output_t *output;
 
 	igt_fixture {
@@ -697,52 +796,38 @@ igt_main
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
-		igt_subtest_with_dynamic_f("%sno-drrs", append_subtest_name[z]) {
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
-			igt_subtest_with_dynamic_f("%sprimary-%s",
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
@@ -750,24 +835,88 @@ igt_main
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
+
+			for (op = PAGE_FLIP; op <= RENDER; op++) {
+				igt_describe("Check if psr is detecting page-flipping,memory "
+					     "mapping and rendering operations performed on "
+					     "primary planes");
+				igt_subtest_with_dynamic_f("%s%sprimary-%s", append_fbc_subtest[y],
+						      append_subtest_name[z], op_str(op)) {
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
+							   append_subtest_name[z], op_str(op)) {
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
+					      append_subtest_name[z], op_str(op)) {
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
 		}
 
-		for (op = MMAP_GTT; op <= PLANE_ONOFF; op++) {
-			igt_describe("Check if psr is detecting memory mapping,rendering "
-					"and plane operations performed on sprite planes");
-			igt_subtest_with_dynamic_f("%ssprite-%s",
-				      append_subtest_name[z],
-				      op_str(op)) {
-				igt_skip_on(is_xe_device(data.drm_fd) &&
-					    (op == MMAP_CPU || op == MMAP_GTT));
+			igt_describe("Check if psr is detecting changes when rendering operation "
+				     "is performed with dpms enabled or disabled");
+			igt_subtest_with_dynamic_f("%s%sdpms", append_fbc_subtest[y],
+						   append_subtest_name[z]) {
 				for_each_connected_output(&data.display, output) {
 					if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
 							      data.op_psr_mode, output))
@@ -775,22 +924,21 @@ igt_main
 					igt_display_reset(&data.display);
 					data.output = output;
 					igt_dynamic_f("%s", data.output->name) {
-						data.op = op;
-						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+						data.op = igt_get_render_copyfunc(data.devid) ?
+										  RENDER : BLT;
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
-			igt_subtest_with_dynamic_f("%scursor-%s",
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
@@ -798,56 +946,18 @@ igt_main
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
