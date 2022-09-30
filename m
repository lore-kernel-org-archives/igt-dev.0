Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7CC10EB09
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Sep 2022 03:58:28 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 30 Sep 2022 09:22:48 +0530
Message-Id: <20220930035249.6633-2-jeevan.b@intel.com>
In-Reply-To: <20220930035249.6633-1-jeevan.b@intel.com>
References: <20220930035249.6633-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 1/2] tests/i915/kms_psr2_sf: Convert
 tests to dynamic
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

Converting the existing subtests to dynamic subtests.
Adding support for each_pipe, currently PSR2 is supported on
few pipes so breaking the loop for other pipes currently.

v2: Check for pipe supporting PSR2 or not and then add to dynamic subtest.
v3: Check PSR2 support once in fixture then iterate pipes.
v4: Add output part into dynamic name.
v5: Add the missing code and increase pipes and outputs array size.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/i915/kms_psr2_sf.c | 293 ++++++++++++++++++++++++++-------------
 1 file changed, 196 insertions(+), 97 deletions(-)

diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index 6612587c..9f98d3fb 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -237,7 +237,7 @@ static void plane_move_setup_square(data_t *data, igt_fb_t *fb, uint32_t h,
 	set_clip(&data->plane_move_clip, x, y, SQUARE_SIZE, SQUARE_SIZE);
 }
 
-static void prepare(data_t *data)
+static void prepare(data_t *data, igt_output_t *output)
 {
 	igt_plane_t *primary, *sprite = NULL, *cursor = NULL;
 	int fb_w, fb_h, x, y, view_w, view_h;
@@ -262,12 +262,12 @@ static void prepare(data_t *data)
 			    0.0, 1.0, 0.0,
 			    &data->fb_primary);
 
-	primary = igt_output_get_plane_type(data->output,
+	primary = igt_output_get_plane_type(output,
 			DRM_PLANE_TYPE_PRIMARY);
 
 	switch (data->test_plane_id) {
 	case DRM_PLANE_TYPE_OVERLAY:
-		sprite = igt_output_get_plane_type(data->output,
+		sprite = igt_output_get_plane_type(output,
 						   DRM_PLANE_TYPE_OVERLAY);
 		/*All blue plane*/
 		igt_create_color_fb(data->drm_fd,
@@ -318,7 +318,7 @@ static void prepare(data_t *data)
 		data->test_plane = primary;
 
 		if (data->op == OVERLAY_PRIM_UPDATE) {
-			sprite = igt_output_get_plane_type(data->output,
+			sprite = igt_output_get_plane_type(output,
 						   DRM_PLANE_TYPE_OVERLAY);
 
 			igt_create_color_fb(data->drm_fd, fb_w, fb_h,
@@ -338,7 +338,7 @@ static void prepare(data_t *data)
 		break;
 
 	case DRM_PLANE_TYPE_CURSOR:
-		cursor = igt_output_get_plane_type(data->output,
+		cursor = igt_output_get_plane_type(output,
 						   DRM_PLANE_TYPE_CURSOR);
 		igt_plane_set_position(cursor, 0, 0);
 
@@ -808,12 +808,12 @@ static void run(data_t *data)
 	}
 }
 
-static void cleanup(data_t *data)
+static void cleanup(data_t *data, igt_output_t *output)
 {
 	igt_plane_t *primary;
 	igt_plane_t *sprite;
 
-	primary = igt_output_get_plane_type(data->output,
+	primary = igt_output_get_plane_type(output,
 					    DRM_PLANE_TYPE_PRIMARY);
 
 	igt_plane_set_fb(primary, NULL);
@@ -824,7 +824,7 @@ static void cleanup(data_t *data)
 	}
 
 	if (data->op == OVERLAY_PRIM_UPDATE) {
-		sprite = igt_output_get_plane_type(data->output,
+		sprite = igt_output_get_plane_type(output,
 				DRM_PLANE_TYPE_OVERLAY);
 		igt_plane_set_position(sprite, 0, 0);
 		igt_plane_set_fb(sprite, NULL);
@@ -838,14 +838,35 @@ static void cleanup(data_t *data)
 	igt_remove_fb(data->drm_fd, &data->fb_test);
 }
 
+static int check_psr2_support(data_t *data, enum pipe pipe)
+{
+	int status;
+
+	igt_output_t *output;
+	igt_display_t *display = &data->display;
+
+	igt_display_reset(display);
+	output = data->output;
+	igt_output_set_pipe(output, pipe);
+
+	prepare(data, output);
+	status = psr_wait_entry(data->debugfs_fd, PSR_MODE_2);
+	cleanup(data, output);
+
+	return status;
+}
+
 igt_main
 {
 	data_t data = {};
-	int i;
+	igt_output_t *outputs[IGT_MAX_PIPES * IGT_MAX_PIPES];
+	int i, j;
+	enum pipe pipe;
+	int pipes[IGT_MAX_PIPES * IGT_MAX_PIPES];
+	int n_pipes = 0;
 
 	igt_fixture {
 		drmModeResPtr res;
-		int r;
 
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
@@ -873,146 +894,218 @@ igt_main
 		data.big_fb_height = res->max_height;
 		igt_info("Big framebuffer size %dx%d\n",
 			 data.big_fb_width, data.big_fb_height);
-		prepare(&data);
-		r = psr_wait_entry(data.debugfs_fd, PSR_MODE_2);
-		if (!r)
-			psr_print_debugfs(data.debugfs_fd);
 
 		igt_require_f(psr2_selective_fetch_check(data.debugfs_fd),
 			      "PSR2 selective fetch not enabled\n");
-		cleanup(&data);
-		if (!r)
-			psr_print_debugfs(data.debugfs_fd);
-		igt_require_f(r, "PSR2 can not be enabled\n");
+
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (check_psr2_support(&data, pipe)) {
+				pipes[n_pipes] = pipe;
+				outputs[n_pipes] = data.output;
+				n_pipes++;
+			}
+		}
 	}
 
 	/* Verify primary plane selective fetch */
 	igt_describe("Test that selective fetch works on primary plane");
-	igt_subtest_f("primary-%s-sf-dmg-area", op_str(data.op)) {
-		for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
-			data.damage_area_count = i;
-			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-			prepare(&data);
-			run(&data);
-			cleanup(&data);
+	igt_subtest_with_dynamic_f("primary-%s-sf-dmg-area", op_str(data.op)) {
+		for (i = 0; i < n_pipes; i++) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
+					igt_output_name(outputs[i])) {
+				igt_output_set_pipe(outputs[i], pipes[i]);
+				for (j = 1; j <= MAX_DAMAGE_AREAS; j++) {
+					data.damage_area_count = j;
+					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+					prepare(&data, outputs[i]);
+					run(&data);
+					cleanup(&data, outputs[i]);
+				}
+			}
 		}
 	}
 
 	/* Verify primary plane selective fetch with big fb */
 	data.big_fb_test = 1;
 	igt_describe("Test that selective fetch works on primary plane with big fb");
-	igt_subtest_f("primary-%s-sf-dmg-area-big-fb", op_str(data.op)) {
-		for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
-			data.damage_area_count = i;
-			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-			prepare(&data);
-			run(&data);
-			cleanup(&data);
+	igt_subtest_with_dynamic_f("primary-%s-sf-dmg-area-big-fb", op_str(data.op)) {
+		for (i = 0; i < n_pipes; i++) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
+					igt_output_name(outputs[i])) {
+				igt_output_set_pipe(outputs[i], pipes[i]);
+				for (j = 1; j <= MAX_DAMAGE_AREAS; j++) {
+					data.damage_area_count = j;
+					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+					prepare(&data, outputs[i]);
+					run(&data);
+					cleanup(&data, outputs[i]);
+				}
+			}
 		}
 	}
-	data.big_fb_test = 0;
 
+	data.big_fb_test = 0;
 	/* Verify overlay plane selective fetch */
 	igt_describe("Test that selective fetch works on overlay plane");
-	igt_subtest_f("overlay-%s-sf-dmg-area", op_str(data.op)) {
-		for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
-			data.damage_area_count = i;
-			data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-			prepare(&data);
-			run(&data);
-			cleanup(&data);
+	igt_subtest_with_dynamic_f("overlay-%s-sf-dmg-area", op_str(data.op)) {
+		for (i = 0; i < n_pipes; i++) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
+					igt_output_name(outputs[i])) {
+				igt_output_set_pipe(outputs[i], pipes[i]);
+				for (j = 1; j <= MAX_DAMAGE_AREAS; j++) {
+					data.damage_area_count = j;
+					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+					prepare(&data, outputs[i]);
+					run(&data);
+					cleanup(&data, outputs[i]);
+				}
+			}
 		}
 	}
 
-	/* Verify overlay plane selective fetch */
+	data.damage_area_count = 1;
+	/* Verify cursor plane selective fetch */
 	igt_describe("Test that selective fetch works on cursor plane");
-	igt_subtest_f("cursor-%s-sf", op_str(data.op)) {
-		data.damage_area_count = 1;
-		data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-		prepare(&data);
-		run(&data);
-		cleanup(&data);
+	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
+		for (i = 0; i < n_pipes; i++) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
+					igt_output_name(outputs[i])) {
+				igt_output_set_pipe(outputs[i], pipes[i]);
+				data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+				prepare(&data, outputs[i]);
+				run(&data);
+				cleanup(&data, outputs[i]);
+			}
+		}
 	}
 
 	data.op = PLANE_MOVE_CONTINUOUS;
 	igt_describe("Test that selective fetch works on moving cursor plane (no update)");
-	igt_subtest_f("cursor-%s-sf", op_str(data.op)) {
-		data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-		prepare(&data);
-		run(&data);
-		cleanup(&data);
+	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
+		for (i = 0; i < n_pipes; i++) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
+					igt_output_name(outputs[i])) {
+				igt_output_set_pipe(outputs[i], pipes[i]);
+				data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+				prepare(&data, outputs[i]);
+				run(&data);
+				cleanup(&data, outputs[i]);
+			}
+		}
 	}
 
 	data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
 	igt_describe("Test that selective fetch works on moving cursor plane exceeding partially visible area (no update)");
-	igt_subtest_f("cursor-%s-sf", op_str(data.op)) {
-		data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-		prepare(&data);
-		run(&data);
-		cleanup(&data);
+	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
+		for (i = 0; i < n_pipes; i++) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
+					igt_output_name(outputs[i])) {
+				igt_output_set_pipe(outputs[i], pipes[i]);
+				data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+				prepare(&data, outputs[i]);
+				run(&data);
+				cleanup(&data, outputs[i]);
+			}
+		}
 	}
 
 	data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
 	igt_describe("Test that selective fetch works on moving cursor plane exceeding fully visible area (no update)");
-	igt_subtest_f("cursor-%s-sf", op_str(data.op)) {
-		data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-		prepare(&data);
-		run(&data);
-		cleanup(&data);
+	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
+		for (i = 0; i < n_pipes; i++) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
+					igt_output_name(outputs[i])) {
+				igt_output_set_pipe(outputs[i], pipes[i]);
+				data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+				prepare(&data, outputs[i]);
+				run(&data);
+				cleanup(&data, outputs[i]);
+			}
+		}
 	}
 
 	/* Only for overlay plane */
 	data.op = PLANE_MOVE;
 	/* Verify overlay plane move selective fetch */
 	igt_describe("Test that selective fetch works on moving overlay plane");
-	igt_subtest_f("%s-sf-dmg-area", op_str(data.op)) {
-		for (i = POS_TOP_LEFT; i <= POS_BOTTOM_RIGHT ; i++) {
-			data.pos = i;
-			data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-			prepare(&data);
-			run(&data);
-			cleanup(&data);
+	igt_subtest_with_dynamic_f("%s-sf-dmg-area", op_str(data.op)) {
+		for (i = 0; i < n_pipes; i++) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
+					igt_output_name(outputs[i])) {
+				igt_output_set_pipe(outputs[i], pipes[i]);
+				for (j = POS_TOP_LEFT; j <= POS_BOTTOM_RIGHT ; j++) {
+					data.pos = j;
+					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+					prepare(&data, outputs[i]);
+					run(&data);
+					cleanup(&data, outputs[i]);
+				}
+			}
 		}
 	}
 
 	data.op = PLANE_MOVE_CONTINUOUS;
 	igt_describe("Test that selective fetch works on moving overlay plane (no update)");
-	igt_subtest_f("overlay-%s-sf", op_str(data.op)) {
-		data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-		prepare(&data);
-		run(&data);
-		cleanup(&data);
+	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
+		for (i = 0; i < n_pipes; i++) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
+					igt_output_name(outputs[i])) {
+				igt_output_set_pipe(outputs[i], pipes[i]);
+				data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+				prepare(&data, outputs[i]);
+				run(&data);
+				cleanup(&data, outputs[i]);
+			}
+		}
 	}
 
 	data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
 	igt_describe("Test that selective fetch works on moving overlay plane partially exceeding visible area (no update)");
-	igt_subtest_f("overlay-%s-sf", op_str(data.op)) {
-		data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-		prepare(&data);
-		run(&data);
-		cleanup(&data);
+	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
+		for (i = 0; i < n_pipes; i++) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
+					igt_output_name(outputs[i])) {
+				igt_output_set_pipe(outputs[i], pipes[i]);
+				data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+				prepare(&data, outputs[i]);
+				run(&data);
+				cleanup(&data, outputs[i]);
+			}
+		}
 	}
 
 	data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
 	igt_describe("Test that selective fetch works on moving overlay plane fully exceeding visible area (no update)");
-	igt_subtest_f("overlay-%s-sf", op_str(data.op)) {
-		data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-		prepare(&data);
-		run(&data);
-		cleanup(&data);
+	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
+		for (i = 0; i < n_pipes; i++) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
+					igt_output_name(outputs[i])) {
+				igt_output_set_pipe(outputs[i], pipes[i]);
+				data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+				prepare(&data, outputs[i]);
+				run(&data);
+				cleanup(&data, outputs[i]);
+			}
+		}
 	}
 
 	/* Verify primary plane selective fetch with overplay plane blended */
 	data.op = OVERLAY_PRIM_UPDATE;
 	igt_describe("Test that selective fetch works on primary plane "
 		     "with blended overlay plane");
-	igt_subtest_f("%s-sf-dmg-area", op_str(data.op)) {
-		for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
-			data.damage_area_count = i;
-			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
-			prepare(&data);
-			run(&data);
-			cleanup(&data);
+	igt_subtest_with_dynamic_f("%s-sf-dmg-area", op_str(data.op)) {
+		for (i = 0; i < n_pipes; i++) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
+					igt_output_name(outputs[i])) {
+				igt_output_set_pipe(outputs[i], pipes[i]);
+				for (j = 1; j <= MAX_DAMAGE_AREAS; j++) {
+					data.damage_area_count = j;
+					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+					prepare(&data, outputs[i]);
+					run(&data);
+					cleanup(&data, outputs[i]);
+				}
+			}
 		}
 	}
 
@@ -1023,12 +1116,18 @@ igt_main
 	data.op = PLANE_UPDATE_CONTINUOUS;
 	data.primary_format = DRM_FORMAT_NV12;
 	igt_describe("Test that selective fetch works on overlay plane");
-	igt_subtest_f("overlay-%s-sf", op_str(data.op)) {
-			data.damage_area_count = 1;
-			data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-			prepare(&data);
-			run(&data);
-			cleanup(&data);
+	igt_subtest_with_dynamic_f("overlay-%s-sf", op_str(data.op)) {
+		for (i = 0; i < n_pipes; i++) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
+					igt_output_name(outputs[i])) {
+				igt_output_set_pipe(outputs[i], pipes[i]);
+				data.damage_area_count = 1;
+				data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+				prepare(&data, outputs[i]);
+				run(&data);
+				cleanup(&data, outputs[i]);
+			}
+		}
 	}
 
 	igt_fixture {
-- 
2.36.0
