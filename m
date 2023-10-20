Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62BA10E587
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 05:57:29 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Oct 2023 11:35:03 +0530
Message-Id: <20231020060503.870173-6-kunal1.joshi@intel.com>
In-Reply-To: <20231020060503.870173-1-kunal1.joshi@intel.com>
References: <20231020060503.870173-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/5] tests/intel/kms_psr: made test
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

Modified kms_psr to have support for DP pr.

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_psr.c | 402 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 331 insertions(+), 71 deletions(-)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index ffecc5222..b14267dce 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -229,6 +229,102 @@
  * @plane_move:         Move plane position
  */
 
+/**
+ * SUBTEST: pr_dpms
+ * Description: Check if pr is detecting changes when rendering operation
+ *              is performed  with dpms enabled or disabled
+ * Driver requirement: i915, xe
+ * Functionality: dpms, pr
+ * Mega feature: Panel Replay
+ * Test category: functionality test
+ *
+ * SUBTEST: pr_no_drrs
+ * Description: Check if pr is detecting changes when drrs is disabled
+ * Driver requirement: i915, xe
+ * Functionality: drrs, pr
+ * Mega feature: Panel Replay
+ * Test category: functionality test
+ *
+ * SUBTEST: pr_suspend
+ * Description: Check if pr is detecting changes when plane operation is
+ *              performed with suspend resume cycles
+ * Driver requirement: i915, xe
+ * Functionality: pr, suspend
+ * Mega feature: Panel Replay
+ * Test category: functionality test
+ *
+ * SUBTEST: pr_basic
+ * Description: Basic check for pr if it is detecting changes made in planes
+ * Driver requirement: i915, xe
+ * Functionality: pr
+ * Mega feature: Panel Replay
+ * Test category: functionality test
+ *
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
+ *
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
@@ -272,6 +368,9 @@ typedef struct {
 	igt_output_t *output;
 	bool with_psr_disabled;
 	bool supports_psr2;
+        bool supports_psr;
+	bool supports_pr;
+	igt_output_t **pr_outputs;
 } data_t;
 
 static void create_cursor_fb(data_t *data)
@@ -316,7 +415,6 @@ static void setup_output(data_t *data)
 static void display_init(data_t *data)
 {
 	igt_display_require(&data->display, data->drm_fd);
-	setup_output(data);
 }
 
 static void display_fini(data_t *data)
@@ -444,6 +542,15 @@ static bool psr_wait_entry_if_enabled(data_t *data)
 	return psr_wait_entry(data->debugfs_fd, data->op_psr_mode);
 }
 
+static bool pr_wait_entry(data_t *data)
+{
+        if (data->with_psr_disabled)
+                return true;
+
+        return igt_wait(dp_pr_active_check(data->debugfs_fd,
+					   data->output), 500, 20);
+}
+
 static bool psr_wait_update_if_enabled(data_t *data)
 {
 	if (data->with_psr_disabled)
@@ -604,7 +711,10 @@ static void run_test(data_t *data)
 		expected = "screen GREEN";
 		break;
 	}
-	igt_assert(psr_wait_update_if_enabled(data));
+	if(strstr(data->output->name, "DP"))
+		igt_assert(pr_wait_entry(data));
+	else
+		igt_assert(psr_wait_update_if_enabled(data));
 	manual(expected);
 }
 
@@ -687,6 +797,7 @@ static void test_setup(data_t *data)
 {
 	drmModeConnectorPtr connector;
 	bool psr_entered = false;
+	bool pr_entered = false;
 
 	igt_require_f(data->output,
 		      "No available output found\n");
@@ -703,15 +814,23 @@ static void test_setup(data_t *data)
 		if (data->op_psr_mode == PSR_MODE_2)
 			igt_require(data->supports_psr2);
 
-		psr_enable_if_enabled(data);
-		setup_test_plane(data, data->test_plane_id);
-		if (psr_wait_entry_if_enabled(data)) {
-			psr_entered = true;
-			break;
+		if (strstr(data->output->name, "DP"))
+		{
+			setup_test_plane(data, data->test_plane_id);
+			pr_entered = pr_wait_entry(data);
+			if(pr_entered)
+				break;
+		}
+		else {
+			psr_enable_if_enabled(data);
+			setup_test_plane(data, data->test_plane_id);
+			if(psr_wait_entry_if_enabled(data)) {
+				psr_entered = true;
+				break;
+			}
 		}
 	}
-
-	igt_assert(psr_entered);
+	igt_assert(psr_entered || pr_entered);
 }
 
 static void dpms_off_on(data_t *data)
@@ -748,10 +867,15 @@ data_t data = {};
 igt_main_args("", long_options, help_str, opt_handler, &data)
 {
 	enum operations op;
-	const char *append_subtest_name[2] = {
+	const char *append_subtest_name[3] = {
 		"",
-		"psr2_"
+		"psr2_",
+		"pr_"
 	};
+	int pr_output_count;
+	igt_output_t *out;
+	int modes[] = {PSR_MODE_1, PSR_MODE_1, PR_MODE};
+	int z;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
@@ -759,103 +883,239 @@ igt_main_args("", long_options, help_str, opt_handler, &data)
 		kmstest_set_vt_graphics_mode();
 		data.devid = intel_get_drm_devid(data.drm_fd);
 
-		igt_require_f(sink_support(&data, PSR_MODE_1),
-			      "Sink does not support PSR\n");
-
+		pr_output_count = 0;
+		data.pr_outputs = (igt_output_t **)malloc(sizeof(igt_output_t *) * data.display.n_outputs);
+		for_each_connected_output(&data.display, out)
+			if(output_supports_pr(data.debugfs_fd, out))
+				data.pr_outputs[pr_output_count++] = out;
+		data.supports_psr = sink_support(&data, PSR_MODE_1);
 		data.supports_psr2 = sink_support(&data, PSR_MODE_2);
+		data.supports_pr = pr_output_count > 0 ? true : false;
+
+		igt_require_f(data.supports_psr || data.supports_pr,
+			      "Sink does not support PSR/PR\n");
 		data.bops = buf_ops_create(data.drm_fd);
 		display_init(&data);
 	}
 
-	for (data.op_psr_mode = PSR_MODE_1; data.op_psr_mode <= PSR_MODE_2;
-	     data.op_psr_mode++) {
-
+	for (z = 0; z < ARRAY_SIZE(modes); z++) {
+		data.op_psr_mode = modes[z];
 		igt_describe("Basic check for psr if it is detecting changes made in planes");
-		igt_subtest_f("%sbasic", append_subtest_name[data.op_psr_mode]) {
-			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-			test_setup(&data);
-			test_cleanup(&data);
+		igt_subtest_with_dynamic_f("%sbasic", append_subtest_name[z]) {
+			if (data.op_psr_mode == PR_MODE)
+			{
+				for(int k = 0; k < pr_output_count; k++) {
+					igt_dynamic_f("%s", data.pr_outputs[k]->name)
+					{
+						data.output = data.pr_outputs[k];
+						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+						test_setup(&data);
+						test_cleanup(&data);
+					}
+				}
+			}
+			else {
+				setup_output(&data);
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
+                        if (data.op_psr_mode == PR_MODE)
+                        {
+                                for(int k = 0; k < pr_output_count; k++) {
+                                        igt_dynamic_f("%s", data.pr_outputs[k]->name)
+                                        {
+						data.output = data.pr_outputs[k];
+						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+						test_setup(&data);
+						igt_assert(drrs_disabled(&data));
+						test_cleanup(&data);
+
+                                        }
+				}
+                        }
+			else {
+				setup_output(&data);
+				igt_dynamic_f("%s", data.output->name) {
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
+				if (data.op_psr_mode == PR_MODE)
+				{
+					for(int k = 0; k < pr_output_count; k++) {
+						igt_dynamic_f("%s", data.pr_outputs[k]->name)
+						{
+							data.output = data.pr_outputs[k];
+							data.op = op;
+							data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+							test_setup(&data);
+							run_test(&data);
+							test_cleanup(&data);
+						}
+					}
+				}
+				else {
+					setup_output(&data);
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
+				if (data.op_psr_mode == PR_MODE)
+				{
+					for(int k = 0; k < pr_output_count; k++) {
+						igt_dynamic_f("%s", data.pr_outputs[k]->name)
+						{
+							data.output = data.pr_outputs[k];
+							data.op = op;
+							data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+							test_setup(&data);
+							run_test(&data);
+							test_cleanup(&data);
+						}
+					}
+				}
+				else {
+					setup_output(&data);
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
-					"and plane operations performed on cursor planes");
-			igt_subtest_f("%scursor_%s",
-				      append_subtest_name[data.op_psr_mode],
-				      op_str(op)) {
+				     "and plane operations performed on cursor planes");
+			igt_subtest_with_dynamic_f("%scursor_%s",
+					           append_subtest_name[z],
+						   op_str(op)) {
 				igt_skip_on(is_xe_device(data.drm_fd) &&
-					    (op == MMAP_CPU || op == MMAP_GTT));
-
-				data.op = op;
-				data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-				test_setup(&data);
-				run_test(&data);
-				test_cleanup(&data);
+					   (op == MMAP_CPU || op == MMAP_GTT));
+				if (data.op_psr_mode == PR_MODE)
+				{
+					for(int k = 0; k < pr_output_count; k++) {
+						igt_dynamic_f("%s", data.pr_outputs[k]->name)
+						{
+							data.output = data.pr_outputs[k];
+							data.op = op;
+							data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+							test_setup(&data);
+							run_test(&data);
+							test_cleanup(&data);
+						}
+					}
+				}
+				else {
+					setup_output(&data);
+					igt_dynamic_f("%s", data.output->name) {
+						data.op = op;
+						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+						test_setup(&data);
+						run_test(&data);
+						test_cleanup(&data);
+					}
+				}
 			}
 		}
 
-		igt_describe("Check if psr is detecting changes when rendering operation is performed"
-				"  with dpms enabled or disabled");
-		igt_subtest_f("%sdpms", append_subtest_name[data.op_psr_mode]) {
-			data.op = RENDER;
-			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-			test_setup(&data);
-			dpms_off_on(&data);
-			run_test(&data);
-			test_cleanup(&data);
+		igt_describe("Check if psr is detecting changes when rendering operation is performed "
+			     "with dpms enabled or disabled");
+		igt_subtest_with_dynamic_f("%sdpms", append_subtest_name[z]) {
+			if (data.op_psr_mode == PR_MODE)
+			{
+				for(int k = 0; k < pr_output_count; k++) {
+					igt_dynamic_f("%s", data.pr_outputs[k]->name)
+					{
+						data.output = data.pr_outputs[k];
+						data.op = RENDER;
+						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+						test_setup(&data);
+						dpms_off_on(&data);
+						run_test(&data);
+						test_cleanup(&data);
+					}
+				}
+			}
+			else {
+				setup_output(&data);
+				igt_dynamic_f("%s", data.output->name) {
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
+			if (data.op_psr_mode == PR_MODE)
+			{
+				for(int k = 0; k < pr_output_count; k++) {
+					igt_dynamic_f("%s", data.pr_outputs[k]->name)
+					{
+						data.output = data.pr_outputs[k];
+						data.op = PLANE_ONOFF;
+						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+						test_setup(&data);
+						igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+									      SUSPEND_TEST_NONE);
+						igt_assert(pr_wait_entry(&data));
+						run_test(&data);
+						test_cleanup(&data);
+					}
+				}
+			}
+			else {
+				setup_output(&data);
+				igt_dynamic_f("%s", data.output->name) {
+					data.op = RENDER;
+					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+					test_setup(&data);
+					dpms_off_on(&data);
+					run_test(&data);
+					test_cleanup(&data);
+				}
+			}
 		}
 	}
 
-- 
2.25.1
