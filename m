Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527D110E6A8
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Nov 2023 07:08:54 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Nov 2023 12:46:23 +0530
Message-Id: <20231110071624.1365998-7-kunal1.joshi@intel.com>
In-Reply-To: <20231110071624.1365998-1-kunal1.joshi@intel.com>
References: <20231110071624.1365998-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/7] tests/intel/kms_psr: made test
 compaitable with pr
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Modified kms_psr to have support for PR.

v2: remove set_output and have outputs (Jouni)
v3: loop over connected outputs (Jouni)

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_psr.c | 387 +++++++++++++++++++++++++++++++-----------
 1 file changed, 290 insertions(+), 97 deletions(-)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 8485e9894..4a7c514e8 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -25,7 +25,7 @@
 /**
  * TEST: kms psr
  * Category: Display
- * Description: Tests behaviour of PSR & PSR2
+ * Description: Tests behaviour of PSR & PSR2 & PR
  */
 
 #include "igt.h"
@@ -39,14 +39,14 @@
 #include "xe/xe_query.h"
 
 /**
- * SUBTEST: basic
+ * SUBTEST: psr_basic
  * Description: Basic check for psr if it is detecting changes made in planes
  * Driver requirement: i915, xe
  * Functionality: psr
  * Mega feature: PSR
  * Test category: functionality test
  *
- * SUBTEST: %s_%s
+ * SUBTEST: psr_%s_%s
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on %arg[1]
  * Driver requirement: i915
@@ -67,7 +67,7 @@
  */
 
 /**
- * SUBTEST: sprite_plane_move
+ * SUBTEST: psr_sprite_plane_move
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on sprite planes
  * Driver requirement: i915, xe
@@ -75,7 +75,7 @@
  * Mega feature: PSR
  * Test category: functionality test
  *
- * SUBTEST: %s_%s
+ * SUBTEST: psr_%s_%s
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on %arg[1] planes
  * Driver requirement: i915, xe
@@ -96,7 +96,7 @@
  */
 
 /**
- * SUBTEST: primary_%s
+ * SUBTEST: psr_primary_%s
  * Description: Check if psr is detecting memory mapping, rendering and plane
  *              operations performed on %arg[1] planes
  * Driver requirement: i915, xe
@@ -111,7 +111,7 @@
  */
 
 /**
- * SUBTEST: dpms
+ * SUBTEST: psr_dpms
  * Description: Check if psr is detecting changes when rendering operation is
  *              performed  with dpms enabled or disabled
  * Driver requirement: i915, xe
@@ -119,14 +119,14 @@
  * Mega feature: PSR
  * Test category: functionality test
  *
- * SUBTEST: no_drrs
+ * SUBTEST: psr_no_drrs
  * Description: Check if psr is detecting changes when drrs is disabled
  * Driver requirement: i915, xe
  * Functionality: drrs, psr
  * Mega feature: PSR
  * Test category: functionality test
  *
- * SUBTEST: suspend
+ * SUBTEST: psr_suspend
  * Description: Check if psr is detecting changes when plane operation
  *              is performed with suspend resume cycles
  * Driver requirement: i915, xe
@@ -229,6 +229,112 @@
  * @plane_move:         Move plane position
  */
 
+/**
+ * SUBTEST: pr_dpms
+ * Description: Check if pr is detecting changes when rendering operation
+ *              is performed with dpms enabled or disabled
+ * Driver requirement: i915, xe
+ * Functionality: dpms, pr
+ * Mega feature: Panel Replay
+ * Test category: functionality test
+ */
+
+/**
+ * SUBTEST: pr_no_drrs
+ * Description: Check if pr is detecting changes when drrs is disabled
+ * Driver requirement: i915, xe
+ * Functionality: drrs, pr
+ * Mega feature: Panel Replay
+ * Test category: functionality test
+ */
+
+/**
+ * SUBTEST: pr_suspend
+ * Description: Check if pr is detecting changes when plane operation is
+ *              performed with suspend resume cycles
+ * Driver requirement: i915, xe
+ * Functionality: pr, suspend
+ * Mega feature: Panel Replay
+ * Test category: functionality test
+ */
+
+/**
+ * SUBTEST: pr_basic
+ * Description: Basic check for pr if it is detecting changes made in planes
+ * Driver requirement: i915, xe
+ * Functionality: pr
+ * Mega feature: Panel Replay
+ * Test category: functionality test
+ */
+
+/**
+ * SUBTEST: pr_%s_%s
+ * Description: Check if pr is detecting memory mapping, rendering and plane
+ *              operations performed on %arg[1] planes
+ * Driver requirement: i915
+ * Functionality: kms_core, plane, pr
+ * Mega feature: Panel Replay
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @cursor:             Cursor plane
+ * @primary:            Primary plane
+ * @sprite:             Sprite plane
+ *
+ * arg[2]:
+ *
+ * @mmap_cpu:           MMAP CPU
+ * @mmap_gtt:           MMAP GTT
+ */
+
+/**
+ * SUBTEST: pr_primary_page_flip
+ * Description: Check if pr is detecting memory mapping, rendering and plane
+ *              operations performed on primary planes
+ * Driver requirement: i915, xe
+ * Functionality: plane, pr
+ * Mega feature: Panel Replay
+ * Test category: functionality test
+ */
+
+/**
+ * SUBTEST: pr_primary_%s
+ * Description: Check if pr is detecting memory mapping, rendering and plane
+ *              operations performed on primary planes
+ * Driver requirement: i915, xe
+ * Functionality: kms_core, plane, pr
+ * Mega feature: Panel Replay
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @blt:                Blitter
+ * @render:             Render
+ */
+
+/**
+ * SUBTEST: pr_%s_%s
+ * Description: Check if pr is detecting memory mapping, rendering and plane
+ *              operations performed on %arg[1] planes
+ * Driver requirement: i915, xe
+ * Functionality: kms_core, plane, pr
+ * Mega feature: Panel Replay
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @cursor:             Cursor plane
+ * @sprite:             Sprite plane
+ *
+ * arg[2]:
+ *
+ * @blt:                Blitter
+ * @render:             Render
+ * @plane_onoff:        Plane On off
+ * @plane_move:         Move plane position
+ */
+
 enum operations {
 	PAGE_FLIP,
 	MMAP_GTT,
@@ -271,7 +377,9 @@ typedef struct {
 	drmModeModeInfo *mode;
 	igt_output_t *output;
 	bool with_psr_disabled;
+	bool supports_psr;
 	bool supports_psr2;
+	bool supports_pr;
 } data_t;
 
 static void create_cursor_fb(data_t *data)
@@ -289,34 +397,38 @@ static void create_cursor_fb(data_t *data)
 	igt_put_cairo_ctx(cr);
 }
 
-static void setup_output(data_t *data)
+static bool output_supports_psr(data_t *data)
 {
-	igt_display_t *display = &data->display;
 	igt_output_t *output;
-	enum pipe pipe;
-
-	for_each_pipe_with_valid_output(display, pipe, output) {
-		drmModeConnectorPtr c = output->config.connector;
-
-		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
-			continue;
-
-		igt_display_reset(display);
-		igt_output_set_pipe(output, pipe);
-		if (!i915_pipe_output_combo_valid(display))
-			continue;
-
-		data->crtc_id = output->config.crtc->crtc_id;
-		data->output = output;
-
-		return;
+	bool supports_psr;
+
+	supports_psr = false;
+	for_each_connected_output(&data->display, output) {
+                if(psr_sink_support(data->drm_fd, data->debugfs_fd,
+                                    PSR_MODE_2, output))
+                {
+			supports_psr = true;
+                        data->supports_psr2 = true;
+                        igt_debug("PSR_2 supported on %s\n", output->name);
+                }
+		else if(psr_sink_support(data->drm_fd, data->debugfs_fd,
+				    PSR_MODE_1, output))
+		{
+			supports_psr = true;
+			data->supports_psr = true;
+			igt_debug("PSR_1 supported on %s\n", output->name);
+		}
+		else if(psr_sink_support(data->drm_fd, data->debugfs_fd,
+                                    PR_MODE, output))
+                {
+			supports_psr = true;
+                        data->supports_pr = true;
+			igt_debug("PR supported on %s\n", output->name);
+                }
+		else
+			igt_debug("PSR/PSR2/PR not supported on %s\n", output->name);
 	}
-}
-
-static void display_init(data_t *data)
-{
-	igt_display_require(&data->display, data->drm_fd);
-	setup_output(data);
+	return supports_psr;
 }
 
 static void display_fini(data_t *data)
@@ -502,7 +614,7 @@ static void fb_dirty_fb_ioctl(data_t *data, struct igt_fb *fb)
 }
 
 /**
- * SUBTEST: cursor_plane_move
+ * SUBTEST: psr_cursor_plane_move
  * Description: Check if psr is detecting the plane operations performed on
  *		cursor planes
  * Driver requirement: i915, xe
@@ -510,7 +622,7 @@ static void fb_dirty_fb_ioctl(data_t *data, struct igt_fb *fb)
  * Functionality: psr
  * Mega feature: PSR
  *
- * SUBTEST: primary_page_flip
+ * SUBTEST: psr_primary_page_flip
  * Description: Check if psr is detecting page-flipping operations performed
  *		on primary planes
  * Driver requirement: i915, xe
@@ -518,7 +630,7 @@ static void fb_dirty_fb_ioctl(data_t *data, struct igt_fb *fb)
  * Functionality: psr
  * Mega feature: PSR
  *
- * SUBTEST: sprite_plane_onoff
+ * SUBTEST: psr_sprite_plane_onoff
  * Description: Check if psr is detecting the plane operations performed on
  *		sprite planes
  * Driver requirement: i915, xe
@@ -683,14 +795,35 @@ static void setup_test_plane(data_t *data, int test_plane)
 	igt_display_commit(&data->display);
 }
 
+static enum pipe get_pipe_for_output(igt_display_t *display,
+				     igt_output_t *output)
+{
+        enum pipe pipe;
+
+        for_each_pipe(display, pipe) {
+                if (igt_pipe_connector_valid(pipe, output)) {
+                        return pipe;
+                }
+        }
+
+        igt_assert_f(false, "No pipe found for output %s\n",
+                     igt_output_name(output));
+}
+
 static void test_setup(data_t *data)
 {
+	enum pipe pipe;
 	drmModeConnectorPtr connector;
 	bool psr_entered = false;
 
 	igt_require_f(data->output,
 		      "No available output found\n");
 
+        pipe = get_pipe_for_output(&data->display, data->output);
+        igt_output_set_pipe(data->output, pipe);
+        igt_require_f(i915_pipe_output_combo_valid(&data->display),
+                      "output pipe combo not valid\n");
+	data->crtc_id = data->output->config.crtc->crtc_id;
 	connector = data->output->config.connector;
 
 	for (int i = 0; i < connector->count_modes; i++) {
@@ -747,115 +880,175 @@ data_t data = {};
 
 igt_main_args("", long_options, help_str, opt_handler, &data)
 {
+	int z;
 	enum operations op;
-	const char *append_subtest_name[2] = {
-		"",
-		"psr2_"
+	const char *append_subtest_name[3] = {
+		"psr_",
+		"psr2_",
+		"pr_"
 	};
+	int modes[] = {PSR_MODE_1, PSR_MODE_2, PR_MODE};
+	igt_output_t *output;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
 		data.devid = intel_get_drm_devid(data.drm_fd);
-
-		igt_require_f(sink_support(&data, PSR_MODE_1),
-			      "Sink does not support PSR\n");
-
-		data.supports_psr2 = sink_support(&data, PSR_MODE_2);
 		data.bops = buf_ops_create(data.drm_fd);
-		display_init(&data);
+		igt_display_require(&data.display, data.drm_fd);
+		data.supports_psr2 = data.supports_psr2 | sink_support(&data, PSR_MODE_2);
+                igt_require_f(output_supports_psr(&data), "Sink does not support PSR/PSR2/PR\n");
 	}
 
-	for (data.op_psr_mode = PSR_MODE_1; data.op_psr_mode <= PSR_MODE_2;
-	     data.op_psr_mode++) {
+	for (z = 0; z < ARRAY_SIZE(modes); z++) {
+		data.op_psr_mode = modes[z];
 
 		igt_describe("Basic check for psr if it is detecting changes made in planes");
-		igt_subtest_f("%sbasic", append_subtest_name[data.op_psr_mode]) {
-			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-			test_setup(&data);
-			test_cleanup(&data);
+		igt_subtest_with_dynamic_f("%sbasic", append_subtest_name[z]) {
+			for_each_connected_output(&data.display, output) {
+				if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
+						      data.op_psr_mode, output))
+					continue;
+				igt_display_reset(&data.display);
+				data.output = output;
+				igt_dynamic_f("%s", data.output->name) {
+					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+					test_setup(&data);
+					test_cleanup(&data);
+				}
+			}
 		}
 
 		igt_describe("Check if psr is detecting changes when drrs is disabled");
-		igt_subtest_f("%sno_drrs", append_subtest_name[data.op_psr_mode]) {
-			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-			test_setup(&data);
-			igt_assert(drrs_disabled(&data));
-			test_cleanup(&data);
+		igt_subtest_with_dynamic_f("%sno_drrs", append_subtest_name[z]) {
+			for_each_connected_output(&data.display, output) {
+				if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
+						      data.op_psr_mode, output))
+					continue;
+                                igt_display_reset(&data.display);
+                                data.output = output;
+                                igt_dynamic_f("%s", data.output->name) {
+					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+					test_setup(&data);
+					igt_assert(drrs_disabled(&data));
+					test_cleanup(&data);
+				}
+			}
 		}
 
 		for (op = PAGE_FLIP; op <= RENDER; op++) {
 			igt_describe("Check if psr is detecting page-flipping,memory mapping and "
 					"rendering operations performed on primary planes");
-			igt_subtest_f("%sprimary_%s",
-				      append_subtest_name[data.op_psr_mode],
+			igt_subtest_with_dynamic_f("%sprimary_%s",
+				      append_subtest_name[z],
 				      op_str(op)) {
 				igt_skip_on(is_xe_device(data.drm_fd) &&
 					    (op == MMAP_CPU || op == MMAP_GTT));
-
-				data.op = op;
-				data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-				test_setup(&data);
-				run_test(&data);
-				test_cleanup(&data);
+				for_each_connected_output(&data.display, output) {
+					if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
+							      data.op_psr_mode, output))
+						continue;
+					igt_display_reset(&data.display);
+					data.output = output;
+					igt_dynamic_f("%s", data.output->name) {
+						data.op = op;
+						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+						test_setup(&data);
+						run_test(&data);
+						test_cleanup(&data);
+					}
+				}
 			}
 		}
 
 		for (op = MMAP_GTT; op <= PLANE_ONOFF; op++) {
 			igt_describe("Check if psr is detecting memory mapping,rendering "
 					"and plane operations performed on sprite planes");
-			igt_subtest_f("%ssprite_%s",
-				      append_subtest_name[data.op_psr_mode],
+			igt_subtest_with_dynamic_f("%ssprite_%s",
+				      append_subtest_name[z],
 				      op_str(op)) {
 				igt_skip_on(is_xe_device(data.drm_fd) &&
 					    (op == MMAP_CPU || op == MMAP_GTT));
-
-				data.op = op;
-				data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-				test_setup(&data);
-				run_test(&data);
-				test_cleanup(&data);
+				for_each_connected_output(&data.display, output) {
+					if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
+							      data.op_psr_mode, output))
+						continue;
+					igt_display_reset(&data.display);
+					data.output = output;
+					igt_dynamic_f("%s", data.output->name) {
+						data.op = op;
+						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+						test_setup(&data);
+						run_test(&data);
+						test_cleanup(&data);
+					}
+				}
 			}
 
 			igt_describe("Check if psr is detecting memory mapping, rendering "
 					"and plane operations performed on cursor planes");
-			igt_subtest_f("%scursor_%s",
-				      append_subtest_name[data.op_psr_mode],
+			igt_subtest_with_dynamic_f("%scursor_%s",
+				      append_subtest_name[z],
 				      op_str(op)) {
 				igt_skip_on(is_xe_device(data.drm_fd) &&
 					    (op == MMAP_CPU || op == MMAP_GTT));
-
-				data.op = op;
-				data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-				test_setup(&data);
-				run_test(&data);
-				test_cleanup(&data);
+				for_each_connected_output(&data.display, output) {
+					if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
+							      data.op_psr_mode, output))
+						continue;
+					igt_display_reset(&data.display);
+					data.output = output;
+					igt_dynamic_f("%s", data.output->name) {
+						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+						test_setup(&data);
+						run_test(&data);
+						test_cleanup(&data);
+					}
+				}
 			}
 		}
 
 		igt_describe("Check if psr is detecting changes when rendering operation is performed"
 				"  with dpms enabled or disabled");
-		igt_subtest_f("%sdpms", append_subtest_name[data.op_psr_mode]) {
-			data.op = RENDER;
-			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-			test_setup(&data);
-			dpms_off_on(&data);
-			run_test(&data);
-			test_cleanup(&data);
+		igt_subtest_with_dynamic_f("%sdpms", append_subtest_name[z]) {
+			for_each_connected_output(&data.display, output) {
+				if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
+						      data.op_psr_mode, output))
+					continue;
+                                igt_display_reset(&data.display);
+                                data.output = output;
+                                igt_dynamic_f("%s", data.output->name) {
+					data.op = RENDER;
+					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+					test_setup(&data);
+					dpms_off_on(&data);
+					run_test(&data);
+					test_cleanup(&data);
+				}
+			}
 		}
 
 		igt_describe("Check if psr is detecting changes when plane operation is performed "
 				"with suspend resume cycles");
-		igt_subtest_f("%ssuspend", append_subtest_name[data.op_psr_mode]) {
-			data.op = PLANE_ONOFF;
-			data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-			test_setup(&data);
-			igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
-						      SUSPEND_TEST_NONE);
-			igt_assert(psr_wait_entry_if_enabled(&data));
-			run_test(&data);
-			test_cleanup(&data);
+		igt_subtest_with_dynamic_f("%ssuspend", append_subtest_name[z]) {
+			for_each_connected_output(&data.display, output) {
+				if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
+						      data.op_psr_mode, output))
+					continue;
+                                igt_display_reset(&data.display);
+                                data.output = output;
+                                igt_dynamic_f("%s", data.output->name) {
+					data.op = PLANE_ONOFF;
+					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+					test_setup(&data);
+					igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+								      SUSPEND_TEST_NONE);
+					igt_assert(psr_wait_entry_if_enabled(&data));
+					run_test(&data);
+					test_cleanup(&data);
+				}
+			}
 		}
 	}
 
-- 
2.25.1
