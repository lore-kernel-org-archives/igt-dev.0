Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985D8112041
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 07:11:33 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 May 2022 10:11:04 +0300
Message-Id: <20220506071104.2876292-4-jouni.hogander@intel.com>
In-Reply-To: <20220506071104.2876292-1-jouni.hogander@intel.com>
References: <20220506071104.2876292-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/i915/kms_psr2_sf: add sel
 fetch/big fb test
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

Add new testcase for testing selective fetch using big framebuffer.
New testcase is using much bigger fb than what is the visible area
and setting visible offset to half of the width and the height.
This reveals issues in selective fetch area calculation:

https://gitlab.freedesktop.org/drm/intel/-/issues/5440

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/i915/kms_psr2_sf.c | 152 ++++++++++++++++++++++++++++-----------
 1 file changed, 109 insertions(+), 43 deletions(-)

diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index 07dc770b..5f3dccaf 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -73,6 +73,7 @@ typedef struct {
 	struct igt_fb *fb_continuous;
 	uint32_t primary_format;
 	int damage_area_count;
+	int big_fb_width, big_fb_height;
 	struct drm_mode_rect plane_update_clip[MAX_DAMAGE_AREAS];
 	struct drm_mode_rect plane_move_clip;
 	struct drm_mode_rect cursor_clip;
@@ -80,6 +81,7 @@ typedef struct {
 	enum plane_move_postion pos;
 	int test_plane_id;
 	igt_plane_t *test_plane;
+	bool big_fb_test;
 	cairo_t *cr;
 	uint32_t screen_changes;
 	int cur_x, cur_y;
@@ -152,7 +154,7 @@ static void set_clip(struct drm_mode_rect *clip, int x, int y, int width,
 }
 
 static void plane_update_setup_squares(data_t *data, igt_fb_t *fb, uint32_t h,
-				       uint32_t v)
+				       uint32_t v, int pos_x, int pos_y)
 {
 	int x, y;
 	int width = SQUARE_SIZE;
@@ -161,36 +163,36 @@ static void plane_update_setup_squares(data_t *data, igt_fb_t *fb, uint32_t h,
 	switch (data->damage_area_count) {
 	case 5:
 		/*Bottom right corner*/
-		x = h - SQUARE_SIZE;
-		y = v - SQUARE_SIZE;
+		x = pos_x + h - SQUARE_SIZE;
+		y = pos_y + v - SQUARE_SIZE;
 
 		draw_rect(data, fb, x, y, width, height, 1.0, 1.0, 1.0, 1.0);
 		set_clip(&data->plane_update_clip[4], x, y, width, height);
 	case 4:
 		/*Bottom left corner*/
-		x = 0;
-		y = v - SQUARE_SIZE;
+		x = pos_x;
+		y = pos_y + v - SQUARE_SIZE;
 
 		draw_rect(data, fb, x, y, width, height, 1.0, 1.0, 1.0, 1.0);
 		set_clip(&data->plane_update_clip[3], x, y, width, height);
 	case 3:
 		/*Top right corner*/
-		x = h - SQUARE_SIZE;
-		y = 0;
+		x = pos_x + h - SQUARE_SIZE;
+		y = pos_y;
 
 		draw_rect(data, fb, x, y, width, height, 1.0, 1.0, 1.0, 1.0);
 		set_clip(&data->plane_update_clip[2], x, y, width, height);
 	case 2:
 		/*Top left corner*/
-		x = 0;
-		y = 0;
+		x = pos_x;
+		y = pos_y;
 
 		draw_rect(data, fb, x, y, width, height, 1.0, 1.0, 1.0, 1.0);
 		set_clip(&data->plane_update_clip[1], x, y, width, height);
 	case 1:
 		/*Center*/
-		x = h/2 - SQUARE_SIZE/2;
-		y = v/2 - SQUARE_SIZE/2;
+		x = pos_x + h / 2 - SQUARE_SIZE / 2;
+		y = pos_y + v / 2 - SQUARE_SIZE / 2;
 
 		draw_rect(data, fb, x, y, width, height, 1.0, 1.0, 1.0, 1.0);
 		set_clip(&data->plane_update_clip[0], x, y, width, height);
@@ -201,30 +203,30 @@ static void plane_update_setup_squares(data_t *data, igt_fb_t *fb, uint32_t h,
 }
 
 static void plane_move_setup_square(data_t *data, igt_fb_t *fb, uint32_t h,
-				       uint32_t v)
+				    uint32_t v, int pos_x, int pos_y)
 {
 	int x = 0, y = 0;
 
 	switch (data->pos) {
 	case POS_TOP_LEFT:
 		/*Bottom right corner*/
-		x = h - SQUARE_SIZE;
-		y = v - SQUARE_SIZE;
+		x = pos_x + h - SQUARE_SIZE;
+		y = pos_y + v - SQUARE_SIZE;
 		break;
 	case POS_TOP_RIGHT:
 		/*Bottom left corner*/
-		x = 0;
-		y = v - SQUARE_SIZE;
+		x = pos_x;
+		y = pos_y + v - SQUARE_SIZE;
 		break;
 	case POS_BOTTOM_LEFT:
 		/*Top right corner*/
-		x = h - SQUARE_SIZE;
-		y = 0;
+		x = pos_x + h - SQUARE_SIZE;
+		y = pos_y + 0;
 		break;
 	case POS_BOTTOM_RIGHT:
 		/*Top left corner*/
-		x = 0;
-		y = 0;
+		x = pos_x;
+		y = pos_y;
 		break;
 	default:
 		igt_assert(false);
@@ -238,10 +240,23 @@ static void plane_move_setup_square(data_t *data, igt_fb_t *fb, uint32_t h,
 static void prepare(data_t *data)
 {
 	igt_plane_t *primary, *sprite = NULL, *cursor = NULL;
+	int fb_w, fb_h, x, y, view_w, view_h;
+
+	if (data->big_fb_test) {
+		fb_w = data->big_fb_width;
+		fb_h = data->big_fb_height;
+		x = fb_w / 2;
+		y = fb_h / 2;
+		view_w = data->mode->hdisplay;
+		view_h = data->mode->vdisplay;
+	} else {
+		fb_w = view_w = data->mode->hdisplay;
+		fb_h = view_h = data->mode->vdisplay;
+		x = y = 0;
+	}
 
 	/* all green frame */
-	igt_create_color_fb(data->drm_fd,
-			    data->mode->hdisplay, data->mode->vdisplay,
+	igt_create_color_fb(data->drm_fd, fb_w, fb_h,
 			    data->primary_format,
 			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 1.0, 0.0,
@@ -256,16 +271,14 @@ static void prepare(data_t *data)
 						   DRM_PLANE_TYPE_OVERLAY);
 		/*All blue plane*/
 		igt_create_color_fb(data->drm_fd,
-				    data->mode->hdisplay/2,
-				    data->mode->vdisplay/2,
+				    fb_w / 2, fb_h / 2,
 				    DRM_FORMAT_XRGB8888,
 				    DRM_FORMAT_MOD_LINEAR,
 				    0.0, 0.0, 1.0,
 				    &data->fb_overlay);
 
 		igt_create_color_fb(data->drm_fd,
-				    data->mode->hdisplay/2,
-				    data->mode->vdisplay/2,
+				    fb_w / 2, fb_h / 2,
 				    DRM_FORMAT_XRGB8888,
 				    DRM_FORMAT_MOD_LINEAR,
 				    0.0, 0.0, 1.0,
@@ -275,30 +288,32 @@ static void prepare(data_t *data)
 
 		if (data->op == PLANE_MOVE) {
 			plane_move_setup_square(data, &data->fb_test,
-					   data->mode->hdisplay/2,
-					   data->mode->vdisplay/2);
+						view_w / 2, view_h / 2,
+						x, y);
 
 		} else {
 			plane_update_setup_squares(data, &data->fb_test,
-					   data->mode->hdisplay/2,
-					   data->mode->vdisplay/2);
+						   view_w / 2, view_h / 2,
+						   x, y);
 		}
 
 		igt_plane_set_fb(sprite, &data->fb_overlay);
+		igt_fb_set_position(&data->fb_overlay, sprite, x, y);
+		igt_fb_set_size(&data->fb_overlay, primary, view_w / 2,
+				view_h / 2);
+		igt_plane_set_size(sprite, view_w / 2, view_h / 2);
 		data->test_plane = sprite;
 		break;
 
 	case DRM_PLANE_TYPE_PRIMARY:
-		igt_create_color_fb(data->drm_fd,
-			    data->mode->hdisplay, data->mode->vdisplay,
-			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_LINEAR,
-			    0.0, 1.0, 0.0,
-			    &data->fb_test);
+		igt_create_color_fb(data->drm_fd, fb_w, fb_h,
+				    DRM_FORMAT_XRGB8888,
+				    DRM_FORMAT_MOD_LINEAR,
+				    0.0, 1.0, 0.0,
+				    &data->fb_test);
 
 		plane_update_setup_squares(data, &data->fb_test,
-					   data->mode->hdisplay,
-					   data->mode->vdisplay);
+					   view_w, view_h, x, y);
 		data->fb_continuous = &data->fb_primary;
 		data->test_plane = primary;
 
@@ -306,15 +321,17 @@ static void prepare(data_t *data)
 			sprite = igt_output_get_plane_type(data->output,
 						   DRM_PLANE_TYPE_OVERLAY);
 
-			igt_create_color_fb(data->drm_fd,
-					    data->mode->hdisplay,
-					    data->mode->vdisplay,
+			igt_create_color_fb(data->drm_fd, fb_w, fb_h,
 					    DRM_FORMAT_XRGB8888,
 					    DRM_FORMAT_MOD_LINEAR,
 					    0.0, 0.0, 1.0,
 					    &data->fb_overlay);
 
 			igt_plane_set_fb(sprite, &data->fb_overlay);
+			igt_fb_set_position(&data->fb_overlay, sprite, x, y);
+			igt_fb_set_size(&data->fb_overlay, primary, view_w,
+					view_h);
+			igt_plane_set_size(sprite, view_w, view_h);
 			igt_plane_set_prop_value(sprite, IGT_PLANE_ALPHA,
 						 0x6060);
 		}
@@ -349,7 +366,11 @@ static void prepare(data_t *data)
 	}
 
 	igt_plane_set_fb(primary, &data->fb_primary);
-
+	igt_fb_set_position(&data->fb_primary, primary, x, y);
+	igt_fb_set_size(&data->fb_overlay, primary, view_w,
+			view_h);
+	igt_plane_set_size(primary, view_w, view_h);
+	igt_plane_set_position(primary, 0, 0);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
@@ -515,14 +536,27 @@ static void damaged_plane_move(data_t *data)
 	igt_plane_t *test_plane = data->test_plane;
 	uint32_t h = data->mode->hdisplay;
 	uint32_t v = data->mode->vdisplay;
+	int x, y;
 
-	igt_plane_set_fb(test_plane, &data->fb_test);
+	if (data->big_fb_test) {
+		x = data->big_fb_width / 2;
+		y = data->big_fb_height / 2;
+	} else {
+		x = y = 0;
+	}
 
 	if (data->test_plane_id == DRM_PLANE_TYPE_OVERLAY) {
 		h = h/2;
 		v = v/2;
 	}
 
+	igt_plane_set_fb(test_plane, &data->fb_test);
+
+	igt_fb_set_position(&data->fb_test, test_plane, x,
+			    y);
+	igt_fb_set_size(&data->fb_test, test_plane, h, v);
+	igt_plane_set_size(test_plane, h, v);
+
 	igt_plane_replace_prop_blob(test_plane, IGT_PLANE_FB_DAMAGE_CLIPS,
 				    &data->plane_move_clip,
 				    sizeof(struct drm_mode_rect));
@@ -677,6 +711,14 @@ static void damaged_plane_update(data_t *data)
 	igt_plane_t *test_plane = data->test_plane;
 	uint32_t h = data->mode->hdisplay;
 	uint32_t v = data->mode->vdisplay;
+	int x, y;
+
+	if (data->big_fb_test) {
+		x = data->big_fb_width / 2;
+		y = data->big_fb_height / 2;
+	} else {
+		x = y = 0;
+	}
 
 	if (data->test_plane_id == DRM_PLANE_TYPE_OVERLAY) {
 		h = h/2;
@@ -701,6 +743,9 @@ static void damaged_plane_update(data_t *data)
 						    data->damage_area_count);
 	}
 
+	igt_fb_set_position(data->fb_continuous, test_plane, x, y);
+	igt_fb_set_size(data->fb_continuous, test_plane, h, v);
+	igt_plane_set_size(test_plane, h, v);
 	igt_plane_set_position(data->test_plane, 0, 0);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
@@ -786,6 +831,7 @@ igt_main
 	int i;
 
 	igt_fixture {
+		drmModeResPtr res;
 		int r;
 
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
@@ -807,6 +853,12 @@ igt_main
 		data.op = PLANE_UPDATE;
 		data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
 		data.primary_format = DRM_FORMAT_XRGB8888;
+
+		res = drmModeGetResources(data.drm_fd);
+		data.big_fb_width = res->max_width;
+		data.big_fb_height = res->max_height;
+		igt_info("Big framebuffer size %dx%d\n",
+			 data.big_fb_width, data.big_fb_height);
 		prepare(&data);
 		r = psr_wait_entry(data.debugfs_fd, PSR_MODE_2);
 		if (!r)
@@ -832,6 +884,20 @@ igt_main
 		}
 	}
 
+	/* Verify primary plane selective fetch with big fb */
+	data.big_fb_test = 1;
+	igt_describe("Test that selective fetch works on primary plane with big fb");
+	igt_subtest_f("primary-%s-sf-dmg-area-big-fb", op_str(data.op)) {
+		for (i = 1; i <= MAX_DAMAGE_AREAS; i++) {
+			data.damage_area_count = i;
+			data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+			prepare(&data);
+			run(&data);
+			cleanup(&data);
+		}
+	}
+	data.big_fb_test = 0;
+
 	/* Verify overlay plane selective fetch */
 	igt_describe("Test that selective fetch works on overlay plane");
 	igt_subtest_f("overlay-%s-sf-dmg-area", op_str(data.op)) {
-- 
2.25.1
