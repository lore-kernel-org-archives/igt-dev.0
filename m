Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B808610E80D
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 15:56:31 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 24 Nov 2023 21:34:55 +0530
Message-Id: <20231124160456.2137059-2-jeevan.b@intel.com>
In-Reply-To: <20231124160456.2137059-1-jeevan.b@intel.com>
References: <20231124160456.2137059-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/intel/kms_psr: Add FBC support to
 PSR/PSR2 tests
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

For intel_display_ver 20, FBC can be enabled along with PSR/PSR2,
thereby adding FBC checks to validate this scenario.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_psr.h         |   5 +
 tests/intel/kms_psr.c | 240 ++++++++++++++++++++++++------------------
 2 files changed, 142 insertions(+), 103 deletions(-)

diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index a30330e6c..fee9df6b3 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -40,6 +40,11 @@ enum psr_mode {
 	PSR_DISABLED,
 };
 
+enum fbc_mode {
+	FBC_ENABLED,
+	FBC_DISABLED,
+};
+
 bool psr_disabled_check(int debugfs_fd);
 bool psr2_selective_fetch_check(int debugfs_fd);
 bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 6b80f6f4b..c1d987415 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -31,6 +31,7 @@
 #include "igt.h"
 #include "igt_sysfs.h"
 #include "igt_psr.h"
+#include "i915/intel_fbc.h"
 #include <errno.h>
 #include <stdbool.h>
 #include <stdio.h>
@@ -366,6 +367,7 @@ typedef struct {
 	enum operations op;
 	int test_plane_id;
 	enum psr_mode op_psr_mode;
+	enum fbc_mode op_fbc_mode;
 	uint32_t devid;
 	uint32_t crtc_id;
 	igt_display_t display;
@@ -376,6 +378,7 @@ typedef struct {
 	int mod_stride;
 	drmModeModeInfo *mode;
 	igt_output_t *output;
+	bool fbc_flag;
 } data_t;
 
 static void create_cursor_fb(data_t *data)
@@ -802,6 +805,11 @@ static void test_setup(data_t *data)
 			psr_entered = true;
 			break;
 		}
+
+		if (data->fbc_flag)
+			igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
+								  pipe),
+								  "FBC still disabled");
 	}
 
 	igt_assert(psr_entered);
@@ -819,14 +827,20 @@ data_t data = {};
 
 igt_main
 {
-	int z;
+	int z, y;
 	enum operations op;
+	enum pipe pipe;
 	const char *append_subtest_name[3] = {
 		"psr_",
 		"psr2_",
 		"pr_"
 	};
+	const char *append_fbc_subtest[2] = {
+		"",
+		"fbc_"
+	};
 	int modes[] = {PSR_MODE_1, PSR_MODE_2, PR_MODE};
+	int fbc_status[] = {FBC_ENABLED, FBC_DISABLED};
 	igt_output_t *output;
 
 	igt_fixture {
@@ -837,52 +851,42 @@ igt_main
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
+
+		data.op_fbc_mode = fbc_status[y];
+		if (data.op_fbc_mode == FBC_ENABLED)
+			data.fbc_flag = false;
+
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
+			igt_describe("Basic check for psr if it is detecting changes made in "
+				     "planes");
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
+			igt_subtest_with_dynamic_f("%s%sno_drrs", append_fbc_subtest[y],
+						   append_subtest_name[z]) {
 				for_each_connected_output(&data.display, output) {
 					if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
 							      data.op_psr_mode, output))
@@ -890,24 +894,94 @@ igt_main
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
+					     "mapping and rendering operations performed "
+					     "on primary planes");
+				igt_subtest_with_dynamic_f("%s%sprimary_%s",
+					      append_fbc_subtest[y],
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
+				igt_subtest_with_dynamic_f("%s%ssprite_%s",
+					      append_fbc_subtest[y],
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
+				igt_subtest_with_dynamic_f("%s%scursor_%s",
+					      append_fbc_subtest[y],
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
+					"is performed with dpms enabled or disabled");
+			igt_subtest_with_dynamic_f("%s%sdpms", append_fbc_subtest[y],
+						   append_subtest_name[z]) {
 				for_each_connected_output(&data.display, output) {
 					if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
 							      data.op_psr_mode, output))
@@ -915,22 +989,20 @@ igt_main
 					igt_display_reset(&data.display);
 					data.output = output;
 					igt_dynamic_f("%s", data.output->name) {
-						data.op = op;
-						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+						data.op = RENDER;
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
+					"performed with suspend resume cycles");
+			igt_subtest_with_dynamic_f("%s%ssuspend", append_fbc_subtest[y],
+						   append_subtest_name[z]) {
 				for_each_connected_output(&data.display, output) {
 					if (!psr_sink_support(data.drm_fd, data.debugfs_fd,
 							      data.op_psr_mode, output))
@@ -938,56 +1010,18 @@ igt_main
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
-					data.op = RENDER;
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
