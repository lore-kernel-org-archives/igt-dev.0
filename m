Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2149C10E80A
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 15:51:48 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 24 Nov 2023 21:30:09 +0530
Message-Id: <20231124160009.2136382-3-jeevan.b@intel.com>
In-Reply-To: <20231124160009.2136382-1-jeevan.b@intel.com>
References: <20231124160009.2136382-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/intel/kms_psr2_sf: Add FBC
 support to PSR2 tests
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

For intel_display_ver 20, FBC can be enabled along with PSR2,
thereby adding FBC checks to validate this scenario.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_psr2_sf.c | 567 ++++++++++++++++++++------------------
 1 file changed, 296 insertions(+), 271 deletions(-)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index a597c8701..d935b0097 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -26,6 +26,7 @@
 #include "igt_sysfs.h"
 #include "igt_psr.h"
 #include "kms_dsc_helper.h"
+#include "i915/intel_fbc.h"
 #include <errno.h>
 #include <stdbool.h>
 #include <stdio.h>
@@ -157,9 +158,11 @@ typedef struct {
 	struct drm_mode_rect cursor_clip;
 	enum operations op;
 	enum plane_move_postion pos;
+	enum fbc_mode op_fbc_mode;
 	int test_plane_id;
 	igt_plane_t *test_plane;
 	bool big_fb_test;
+	bool fbc_flag;
 	cairo_t *cr;
 	uint32_t screen_changes;
 	int cur_x, cur_y;
@@ -865,6 +868,11 @@ static void run(data_t *data)
 
 	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2, NULL));
 
+	if (data->fbc_flag)
+		igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
+							  data->pipe),
+							  "FBC still disabled");
+
 	data->screen_changes = 0;
 
 	switch (data->op) {
@@ -967,10 +975,15 @@ igt_main
 {
 	data_t data = {};
 	igt_output_t *outputs[IGT_MAX_PIPES * IGT_MAX_PIPES];
-	int i, j, k;
+	int i, j, k, y;
 	int pipes[IGT_MAX_PIPES * IGT_MAX_PIPES];
 	int n_pipes = 0;
 	int coexist_features[IGT_MAX_PIPES * IGT_MAX_PIPES];
+	const char *append_fbc_subtest[2] = {
+                "",
+                "fbc_"
+        };
+	int fbc_status[] = {FBC_DISABLED, FBC_ENABLED};
 
 	igt_fixture {
 		drmModeResPtr res;
@@ -986,6 +999,11 @@ igt_main
 
 		display_init(&data);
 
+		if ((intel_display_ver(intel_get_drm_devid(data.drm_fd) == 20)) &&
+		    (intel_fbc_supported_on_chipset(data.drm_fd, data.pipe))) {
+			data.fbc_flag = true;
+		}
+
 		/* Test if PSR2 can be enabled */
 		igt_require_f(psr_enable(data.drm_fd,
 					 data.debugfs_fd, PSR_MODE_2_SEL_FETCH),
@@ -1020,54 +1038,116 @@ igt_main
 		}
 	}
 
-	/* Verify primary plane selective fetch */
-	igt_describe("Test that selective fetch works on primary plane");
-	igt_subtest_with_dynamic_f("primary-%s-sf-dmg-area", op_str(data.op)) {
-		for (i = 0; i < n_pipes; i++) {
-			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-				continue;
+	for (y = 0; y < ARRAY_SIZE(fbc_status); y++) {
 
-			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-				if (j != FEATURE_NONE && !(coexist_features[i] & j))
+		data.op_fbc_mode = fbc_status[y];
+		if (data.op_fbc_mode == FBC_DISABLED)
+			data.fbc_flag = false;
+
+		/* Verify primary plane selective fetch */
+		igt_describe("Test that selective fetch works on primary plane");
+		igt_subtest_with_dynamic_f("%sprimary-%s-sf-dmg-area", append_fbc_subtest[y], op_str(data.op)) {
+			for (i = 0; i < n_pipes; i++) {
+				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-					      igt_output_name(outputs[i]),
-					      coexist_feature_str(j)) {
-					data.pipe = pipes[i];
-					data.output = outputs[i];
-					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-					data.coexist_feature = j;
-					for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
-						data.damage_area_count = k;
-						prepare(&data);
-						run(&data);
-						cleanup(&data);
+
+				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
+					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+						continue;
+					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+						      igt_output_name(outputs[i]),
+						      coexist_feature_str(j)) {
+						data.pipe = pipes[i];
+						data.output = outputs[i];
+						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+						data.coexist_feature = j;
+						for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
+							data.damage_area_count = k;
+							prepare(&data);
+							run(&data);
+							cleanup(&data);
+						}
 					}
 				}
 			}
 		}
-	}
 
-	/* Verify primary plane selective fetch with big fb */
-	data.big_fb_test = 1;
-	igt_describe("Test that selective fetch works on primary plane with big fb");
-	igt_subtest_with_dynamic_f("primary-%s-sf-dmg-area-big-fb", op_str(data.op)) {
-		for (i = 0; i < n_pipes; i++) {
-			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-				continue;
+		/* Verify primary plane selective fetch with big fb */
+		data.big_fb_test = 1;
+		igt_describe("Test that selective fetch works on primary plane with big fb");
+		igt_subtest_with_dynamic_f("%sprimary-%s-sf-dmg-area-big-fb", append_fbc_subtest[y], op_str(data.op)) {
+			for (i = 0; i < n_pipes; i++) {
+				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
+					continue;
 
-			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-				if (j != FEATURE_NONE && !(coexist_features[i] & j))
+				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
+					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+						continue;
+					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+						      igt_output_name(outputs[i]),
+						      coexist_feature_str(j)) {
+						data.pipe = pipes[i];
+						data.output = outputs[i];
+						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+						data.coexist_feature = j;
+						for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
+							data.damage_area_count = k;
+							prepare(&data);
+							run(&data);
+							cleanup(&data);
+						}
+					}
+				}
+			}
+		}
+
+		data.big_fb_test = 0;
+		/* Verify overlay plane selective fetch */
+		igt_describe("Test that selective fetch works on overlay plane");
+		igt_subtest_with_dynamic_f("%soverlay-%s-sf-dmg-area", append_fbc_subtest[y], op_str(data.op)) {
+			for (i = 0; i < n_pipes; i++) {
+				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-					      igt_output_name(outputs[i]),
-					      coexist_feature_str(j)) {
-					data.pipe = pipes[i];
-					data.output = outputs[i];
-					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-					data.coexist_feature = j;
-					for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
-						data.damage_area_count = k;
+
+				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
+					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+						continue;
+					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+						      igt_output_name(outputs[i]),
+						      coexist_feature_str(j)) {
+						data.pipe = pipes[i];
+						data.output = outputs[i];
+						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+						data.coexist_feature = j;
+						for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
+							data.damage_area_count = k;
+							prepare(&data);
+							run(&data);
+							cleanup(&data);
+						}
+					}
+				}
+			}
+		}
+
+		data.damage_area_count = 1;
+		/* Verify cursor plane selective fetch */
+		igt_describe("Test that selective fetch works on cursor plane");
+		igt_subtest_with_dynamic_f("%scursor-%s-sf", append_fbc_subtest[y], op_str(data.op)) {
+			for (i = 0; i < n_pipes; i++) {
+				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
+					continue;
+
+				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
+					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+						continue;
+					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+						      igt_output_name(outputs[i]),
+						      coexist_feature_str(j)) {
+						data.pipe = pipes[i];
+						data.output = outputs[i];
+						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+						data.coexist_feature = j;
 						prepare(&data);
 						run(&data);
 						cleanup(&data);
@@ -1075,28 +1155,24 @@ igt_main
 				}
 			}
 		}
-	}
 
-	data.big_fb_test = 0;
-	/* Verify overlay plane selective fetch */
-	igt_describe("Test that selective fetch works on overlay plane");
-	igt_subtest_with_dynamic_f("overlay-%s-sf-dmg-area", op_str(data.op)) {
-		for (i = 0; i < n_pipes; i++) {
-			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-				continue;
-
-			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-				if (j != FEATURE_NONE && !(coexist_features[i] & j))
+		data.op = PLANE_MOVE_CONTINUOUS;
+		igt_describe("Test that selective fetch works on moving cursor plane (no update)");
+		igt_subtest_with_dynamic_f("%scursor-%s-sf", append_fbc_subtest[y], op_str(data.op)) {
+			for (i = 0; i < n_pipes; i++) {
+				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-					      igt_output_name(outputs[i]),
-					      coexist_feature_str(j)) {
-					data.pipe = pipes[i];
-					data.output = outputs[i];
-					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-					data.coexist_feature = j;
-					for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
-						data.damage_area_count = k;
+
+				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
+					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+						continue;
+					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+						      igt_output_name(outputs[i]),
+						      coexist_feature_str(j)) {
+						data.pipe = pipes[i];
+						data.output = outputs[i];
+						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+						data.coexist_feature = j;
 						prepare(&data);
 						run(&data);
 						cleanup(&data);
@@ -1104,130 +1180,129 @@ igt_main
 				}
 			}
 		}
-	}
-
-	data.damage_area_count = 1;
-	/* Verify cursor plane selective fetch */
-	igt_describe("Test that selective fetch works on cursor plane");
-	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
-		for (i = 0; i < n_pipes; i++) {
-			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-				continue;
 
-			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-				if (j != FEATURE_NONE && !(coexist_features[i] & j))
+		data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
+		igt_describe("Test that selective fetch works on moving cursor plane exceeding partially visible area (no update)");
+		igt_subtest_with_dynamic_f("%scursor-%s-sf", append_fbc_subtest[y], op_str(data.op)) {
+			for (i = 0; i < n_pipes; i++) {
+				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-					      igt_output_name(outputs[i]),
-					      coexist_feature_str(j)) {
-					data.pipe = pipes[i];
-					data.output = outputs[i];
-					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-					data.coexist_feature = j;
-					prepare(&data);
-					run(&data);
-					cleanup(&data);
+
+				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
+					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+						continue;
+					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+						      igt_output_name(outputs[i]),
+						      coexist_feature_str(j)) {
+						data.pipe = pipes[i];
+						data.output = outputs[i];
+						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+						data.coexist_feature = j;
+						prepare(&data);
+						run(&data);
+						cleanup(&data);
+					}
 				}
 			}
 		}
-	}
-
-	data.op = PLANE_MOVE_CONTINUOUS;
-	igt_describe("Test that selective fetch works on moving cursor plane (no update)");
-	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
-		for (i = 0; i < n_pipes; i++) {
-			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-				continue;
 
-			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-				if (j != FEATURE_NONE && !(coexist_features[i] & j))
+		data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
+		igt_describe("Test that selective fetch works on moving cursor plane exceeding fully visible area (no update)");
+		igt_subtest_with_dynamic_f("%scursor-%s-sf", append_fbc_subtest[y], op_str(data.op)) {
+			for (i = 0; i < n_pipes; i++) {
+				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-					      igt_output_name(outputs[i]),
-					      coexist_feature_str(j)) {
-					data.pipe = pipes[i];
-					data.output = outputs[i];
-					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-					data.coexist_feature = j;
-					prepare(&data);
-					run(&data);
-					cleanup(&data);
+
+				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
+					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+						continue;
+					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+						      igt_output_name(outputs[i]),
+						      coexist_feature_str(j)) {
+						data.pipe = pipes[i];
+						data.output = outputs[i];
+						data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+						data.coexist_feature = j;
+						prepare(&data);
+						run(&data);
+						cleanup(&data);
+					}
 				}
 			}
 		}
-	}
 
-	data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
-	igt_describe("Test that selective fetch works on moving cursor plane exceeding partially visible area (no update)");
-	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
-		for (i = 0; i < n_pipes; i++) {
-			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-				continue;
-
-			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-				if (j != FEATURE_NONE && !(coexist_features[i] & j))
+		/* Only for overlay plane */
+		data.op = PLANE_MOVE;
+		/* Verify overlay plane move selective fetch */
+		igt_describe("Test that selective fetch works on moving overlay plane");
+		igt_subtest_with_dynamic_f("%s%s-sf-dmg-area", append_fbc_subtest[y], op_str(data.op)) {
+			for (i = 0; i < n_pipes; i++) {
+				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-					      igt_output_name(outputs[i]),
-					      coexist_feature_str(j)) {
-					data.pipe = pipes[i];
-					data.output = outputs[i];
-					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-					data.coexist_feature = j;
-					prepare(&data);
-					run(&data);
-					cleanup(&data);
+
+				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
+					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+						continue;
+					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+						      igt_output_name(outputs[i]),
+						      coexist_feature_str(j)) {
+						data.pipe = pipes[i];
+						data.output = outputs[i];
+						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+						data.coexist_feature = j;
+						for (k = POS_TOP_LEFT; k <= POS_BOTTOM_RIGHT ; k++) {
+							data.pos = k;
+							prepare(&data);
+							run(&data);
+							cleanup(&data);
+						}
+					}
 				}
 			}
 		}
-	}
-
-	data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
-	igt_describe("Test that selective fetch works on moving cursor plane exceeding fully visible area (no update)");
-	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
-		for (i = 0; i < n_pipes; i++) {
-			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-				continue;
 
-			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-				if (j != FEATURE_NONE && !(coexist_features[i] & j))
+		data.op = PLANE_MOVE_CONTINUOUS;
+		igt_describe("Test that selective fetch works on moving overlay plane (no update)");
+		igt_subtest_with_dynamic_f("%soverlay-%s-sf", append_fbc_subtest[y], op_str(data.op)) {
+			for (i = 0; i < n_pipes; i++) {
+				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-					      igt_output_name(outputs[i]),
-					      coexist_feature_str(j)) {
+
+				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
+					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+						continue;
+					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+						      igt_output_name(outputs[i]),
+						      coexist_feature_str(j)) {
 					data.pipe = pipes[i];
 					data.output = outputs[i];
-					data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 					data.coexist_feature = j;
 					prepare(&data);
 					run(&data);
 					cleanup(&data);
+					}
 				}
 			}
 		}
-	}
 
-	/* Only for overlay plane */
-	data.op = PLANE_MOVE;
-	/* Verify overlay plane move selective fetch */
-	igt_describe("Test that selective fetch works on moving overlay plane");
-	igt_subtest_with_dynamic_f("%s-sf-dmg-area", op_str(data.op)) {
-		for (i = 0; i < n_pipes; i++) {
-			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-				continue;
-
-			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-				if (j != FEATURE_NONE && !(coexist_features[i] & j))
+		data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
+		igt_describe("Test that selective fetch works on moving overlay plane partially exceeding visible area (no update)");
+		igt_subtest_with_dynamic_f("%soverlay-%s-sf", append_fbc_subtest[y], op_str(data.op)) {
+			for (i = 0; i < n_pipes; i++) {
+				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-					      igt_output_name(outputs[i]),
-					      coexist_feature_str(j)) {
-					data.pipe = pipes[i];
-					data.output = outputs[i];
-					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-					data.coexist_feature = j;
-					for (k = POS_TOP_LEFT; k <= POS_BOTTOM_RIGHT ; k++) {
-						data.pos = k;
+
+				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
+					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+						continue;
+					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+						      igt_output_name(outputs[i]),
+						      coexist_feature_str(j)) {
+						data.pipe = pipes[i];
+						data.output = outputs[i];
+						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+						data.coexist_feature = j;
 						prepare(&data);
 						run(&data);
 						cleanup(&data);
@@ -1235,103 +1310,84 @@ igt_main
 				}
 			}
 		}
-	}
-
-	data.op = PLANE_MOVE_CONTINUOUS;
-	igt_describe("Test that selective fetch works on moving overlay plane (no update)");
-	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
-		for (i = 0; i < n_pipes; i++) {
-			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-				continue;
 
-			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-				if (j != FEATURE_NONE && !(coexist_features[i] & j))
+		data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
+		igt_describe("Test that selective fetch works on moving overlay plane fully exceeding visible area (no update)");
+		igt_subtest_with_dynamic_f("%soverlay-%s-sf", append_fbc_subtest[y], op_str(data.op)) {
+			for (i = 0; i < n_pipes; i++) {
+				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-					      igt_output_name(outputs[i]),
-					      coexist_feature_str(j)) {
-				data.pipe = pipes[i];
-				data.output = outputs[i];
-				data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-				data.coexist_feature = j;
-				prepare(&data);
-				run(&data);
-				cleanup(&data);
-				}
-			}
-		}
-	}
 
-	data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
-	igt_describe("Test that selective fetch works on moving overlay plane partially exceeding visible area (no update)");
-	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
-		for (i = 0; i < n_pipes; i++) {
-			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-				continue;
-
-			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-				if (j != FEATURE_NONE && !(coexist_features[i] & j))
-					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-					      igt_output_name(outputs[i]),
-					      coexist_feature_str(j)) {
-					data.pipe = pipes[i];
-					data.output = outputs[i];
-					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-					data.coexist_feature = j;
-					prepare(&data);
-					run(&data);
-					cleanup(&data);
+				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
+					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+						continue;
+					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+						      igt_output_name(outputs[i]),
+						      coexist_feature_str(j)) {
+						data.pipe = pipes[i];
+						data.output = outputs[i];
+						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+						data.coexist_feature = j;
+						prepare(&data);
+						run(&data);
+						cleanup(&data);
+					}
 				}
 			}
 		}
-	}
-
-	data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
-	igt_describe("Test that selective fetch works on moving overlay plane fully exceeding visible area (no update)");
-	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
-		for (i = 0; i < n_pipes; i++) {
-			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-				continue;
 
-			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-				if (j != FEATURE_NONE && !(coexist_features[i] & j))
+		/* Verify primary plane selective fetch with overplay plane blended */
+		data.op = OVERLAY_PRIM_UPDATE;
+		igt_describe("Test that selective fetch works on primary plane "
+			     "with blended overlay plane");
+		igt_subtest_with_dynamic_f("%s%s-sf-dmg-area", append_fbc_subtest[y], op_str(data.op)) {
+			for (i = 0; i < n_pipes; i++) {
+				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-					      igt_output_name(outputs[i]),
-					      coexist_feature_str(j)) {
-					data.pipe = pipes[i];
-					data.output = outputs[i];
-					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-					data.coexist_feature = j;
-					prepare(&data);
-					run(&data);
-					cleanup(&data);
+
+				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
+					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+						continue;
+					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+						      igt_output_name(outputs[i]),
+						      coexist_feature_str(j)) {
+						data.pipe = pipes[i];
+						data.output = outputs[i];
+						for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
+							data.damage_area_count = k;
+							data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+							data.coexist_feature = j;
+							prepare(&data);
+							run(&data);
+							cleanup(&data);
+						}
+					}
 				}
 			}
 		}
-	}
 
-	/* Verify primary plane selective fetch with overplay plane blended */
-	data.op = OVERLAY_PRIM_UPDATE;
-	igt_describe("Test that selective fetch works on primary plane "
-		     "with blended overlay plane");
-	igt_subtest_with_dynamic_f("%s-sf-dmg-area", op_str(data.op)) {
-		for (i = 0; i < n_pipes; i++) {
-			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-				continue;
-
-			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-				if (j != FEATURE_NONE && !(coexist_features[i] & j))
+		/*
+		 * Verify overlay plane selective fetch using NV12 primary
+		 * plane and continuous updates.
+		 */
+		data.op = PLANE_UPDATE_CONTINUOUS;
+		data.primary_format = DRM_FORMAT_NV12;
+		igt_describe("Test that selective fetch works on overlay plane");
+		igt_subtest_with_dynamic_f("%soverlay-%s-sf", append_fbc_subtest[y], op_str(data.op)) {
+			for (i = 0; i < n_pipes; i++) {
+				if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-					      igt_output_name(outputs[i]),
-					      coexist_feature_str(j)) {
-					data.pipe = pipes[i];
-					data.output = outputs[i];
-					for (k = 1; k <= MAX_DAMAGE_AREAS; k++) {
-						data.damage_area_count = k;
-						data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+
+				for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
+					if (j != FEATURE_NONE && !(coexist_features[i] & j))
+						continue;
+					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+						      igt_output_name(outputs[i]),
+						      coexist_feature_str(j)) {
+						data.pipe = pipes[i];
+						data.output = outputs[i];
+						data.damage_area_count = 1;
+						data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
 						data.coexist_feature = j;
 						prepare(&data);
 						run(&data);
@@ -1342,37 +1398,6 @@ igt_main
 		}
 	}
 
-	/*
-	 * Verify overlay plane selective fetch using NV12 primary
-	 * plane and continuous updates.
-	 */
-	data.op = PLANE_UPDATE_CONTINUOUS;
-	data.primary_format = DRM_FORMAT_NV12;
-	igt_describe("Test that selective fetch works on overlay plane");
-	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
-		for (i = 0; i < n_pipes; i++) {
-			if (!pipe_output_combo_valid(&data.display, pipes[i], outputs[i]))
-				continue;
-
-			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
-				if (j != FEATURE_NONE && !(coexist_features[i] & j))
-					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
-					      igt_output_name(outputs[i]),
-					      coexist_feature_str(j)) {
-					data.pipe = pipes[i];
-					data.output = outputs[i];
-					data.damage_area_count = 1;
-					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-					data.coexist_feature = j;
-					prepare(&data);
-					run(&data);
-					cleanup(&data);
-				}
-			}
-		}
-	}
-
 	igt_fixture {
 		close(data.debugfs_fd);
 		display_fini(&data);
-- 
2.25.1
