Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120CA10F35F
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Aug 2022 10:27:52 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 16 Aug 2022 15:53:09 +0530
Message-Id: <20220816102309.30562-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_psr2_sf: Convert tests to
 dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: nidhi1.gupta@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Converting the existing subtests to dynamic subtests.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/i915/kms_psr2_sf.c | 262 +++++++++++++++++++++++++--------------
 1 file changed, 171 insertions(+), 91 deletions(-)

diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index 6612587c..ab30448c 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -237,10 +237,16 @@ static void plane_move_setup_square(data_t *data, igt_fb_t *fb, uint32_t h,
 	set_clip(&data->plane_move_clip, x, y, SQUARE_SIZE, SQUARE_SIZE);
 }
 
-static void prepare(data_t *data)
+static void prepare(data_t *data, enum pipe pipe)
 {
 	igt_plane_t *primary, *sprite = NULL, *cursor = NULL;
 	int fb_w, fb_h, x, y, view_w, view_h;
+	igt_output_t *output;
+	igt_display_t *display = &data->display;
+
+	igt_display_reset(display);
+	output = data->output;
+	igt_output_set_pipe(output, pipe);
 
 	if (data->big_fb_test) {
 		fb_w = data->big_fb_width;
@@ -842,6 +848,7 @@ igt_main
 {
 	data_t data = {};
 	int i;
+	enum pipe pipe;
 
 	igt_fixture {
 		drmModeResPtr res;
@@ -873,10 +880,14 @@ igt_main
 		data.big_fb_height = res->max_height;
 		igt_info("Big framebuffer size %dx%d\n",
 			 data.big_fb_width, data.big_fb_height);
-		prepare(&data);
-		r = psr_wait_entry(data.debugfs_fd, PSR_MODE_2);
-		if (!r)
-			psr_print_debugfs(data.debugfs_fd);
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (pipe != PIPE_A)
+				break;
+			prepare(&data, pipe);
+			r = psr_wait_entry(data.debugfs_fd, PSR_MODE_2);
+			if (!r)
+				psr_print_debugfs(data.debugfs_fd);
+		}
 
 		igt_require_f(psr2_selective_fetch_check(data.debugfs_fd),
 			      "PSR2 selective fetch not enabled\n");
@@ -888,147 +899,216 @@ igt_main
 
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
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (pipe != PIPE_A)
+                                break;
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+				for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
+					data.damage_area_count = i;
+					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+					prepare(&data, pipe);
+					run(&data);
+					cleanup(&data);
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
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (pipe != PIPE_A)
+                                break;
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+				for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
+					data.damage_area_count = i;
+					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+					prepare(&data, pipe);
+					run(&data);
+					cleanup(&data);
+				}
+			}
 		}
 	}
 	data.big_fb_test = 0;
 
-	/* Verify overlay plane selective fetch */
 	igt_describe("Test that selective fetch works on overlay plane");
-	igt_subtest_f("overlay-%s-sf-dmg-area", op_str(data.op)) {
-		for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
-			data.damage_area_count = i;
-			data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-			prepare(&data);
-			run(&data);
-			cleanup(&data);
+	igt_subtest_with_dynamic_f("overlay-%s-sf-dmg-area", op_str(data.op)) {
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (pipe != PIPE_A)
+                                break;
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+				for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
+					data.damage_area_count = i;
+					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+					prepare(&data, pipe);
+					run(&data);
+					cleanup(&data);
+				}
+			}
 		}
 	}
 
-	/* Verify overlay plane selective fetch */
 	igt_describe("Test that selective fetch works on cursor plane");
-	igt_subtest_f("cursor-%s-sf", op_str(data.op)) {
-		data.damage_area_count = 1;
-		data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
-		prepare(&data);
-		run(&data);
-		cleanup(&data);
+	igt_subtest_with_dynamic_f("cursor-%s-sf", op_str(data.op)) {
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (pipe != PIPE_A)
+                                break;
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+				data.damage_area_count = 1;
+				data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+				prepare(&data, pipe);
+				run(&data);
+				cleanup(&data);
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
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (pipe != PIPE_A)
+                                break;
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+				data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+				prepare(&data, pipe);
+				run(&data);
+				cleanup(&data);
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
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (pipe != PIPE_A)
+                                break;
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+				data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+				prepare(&data, pipe);
+				run(&data);
+				cleanup(&data);
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
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (pipe != PIPE_A)
+                                break;
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+				data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+				prepare(&data, pipe);
+				run(&data);
+				cleanup(&data);
+			}
+		}
 	}
 
-	/* Only for overlay plane */
 	data.op = PLANE_MOVE;
-	/* Verify overlay plane move selective fetch */
 	igt_describe("Test that selective fetch works on moving overlay plane");
-	igt_subtest_f("%s-sf-dmg-area", op_str(data.op)) {
-		for (i = POS_TOP_LEFT; i <= POS_BOTTOM_RIGHT ; i++) {
-			data.pos = i;
-			data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
-			prepare(&data);
-			run(&data);
-			cleanup(&data);
+	igt_subtest_with_dynamic_f("%s-sf-dmg-area", op_str(data.op)) {
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (pipe != PIPE_A)
+                                break;
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+				for (i = POS_TOP_LEFT; i <= POS_BOTTOM_RIGHT ; i++) {
+					data.pos = i;
+					data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+					prepare(&data, pipe);
+					run(&data);
+					cleanup(&data);
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
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (pipe != PIPE_A)
+                                break;
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+				data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+				prepare(&data, pipe);
+				run(&data);
+				cleanup(&data);
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
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (pipe != PIPE_A)
+                                break;
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+				data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+				prepare(&data, pipe);
+				run(&data);
+				cleanup(&data);
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
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (pipe != PIPE_A)
+                                break;
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+				data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+				prepare(&data, pipe);
+				run(&data);
+				cleanup(&data);
+			}
+		}
 	}
 
-	/* Verify primary plane selective fetch with overplay plane blended */
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
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (pipe != PIPE_A)
+                                break;
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+				for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
+					data.damage_area_count = i;
+					data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+					prepare(&data, pipe);
+					run(&data);
+					cleanup(&data);
+				}
+			}
 		}
 	}
 
-	/*
-	 * Verify overlay plane selective fetch using NV12 primary
-	 * plane and continuous updates.
-	 */
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
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (pipe != PIPE_A)
+                                break;
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+				data.damage_area_count = 1;
+				data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+				prepare(&data, pipe);
+				run(&data);
+				cleanup(&data);
+			}
+		}
 	}
 
 	igt_fixture {
-- 
2.36.0
