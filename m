Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FEC6EA1A
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Nov 2021 09:50:36 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Wed, 24 Nov 2021 11:50:02 +0200
Message-Id: <20211124095002.130684-3-jouni.hogander@intel.com>
In-Reply-To: <20211124095002.130684-1-jouni.hogander@intel.com>
References: <20211124095002.130684-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_psr2_sf: Add new subtest for
 biplanar format
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Add new testcase which uses NV12 format for primary plane. It is
continuously updating overlay plane. It is also sending damaged
area only on every second flip.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/i915/kms_psr2_sf.c | 92 +++++++++++++++++++++++++++++++---------
 1 file changed, 73 insertions(+), 19 deletions(-)

diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index a50c3e14..8a29f354 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -38,8 +38,11 @@ IGT_TEST_DESCRIPTION("Tests to varify PSR2 selective fetch by sending multiple"
 #define CUR_SIZE 64
 #define MAX_DAMAGE_AREAS 5
 
+#define MAX_SCREEN_CHANGES 5
+
 enum operations {
 	PLANE_UPDATE,
+	PLANE_UPDATE_CONTINUOUS,
 	PLANE_MOVE,
 	OVERLAY_PRIM_UPDATE
 };
@@ -59,6 +62,8 @@ typedef struct {
 	igt_output_t *output;
 	struct igt_fb fb_primary, fb_overlay, fb_cursor;
 	struct igt_fb fb_test;
+	struct igt_fb *fb_continuous;
+	uint32_t primary_format;
 	int damage_area_count;
 	struct drm_mode_rect plane_update_clip[MAX_DAMAGE_AREAS];
 	struct drm_mode_rect plane_move_clip;
@@ -68,12 +73,14 @@ typedef struct {
 	int test_plane_id;
 	igt_plane_t *test_plane;
 	cairo_t *cr;
+	uint32_t screen_changes;
 } data_t;
 
 static const char *op_str(enum operations op)
 {
 	static const char * const name[] = {
 		[PLANE_UPDATE] = "plane-update",
+		[PLANE_UPDATE_CONTINUOUS] = "plane-update-continuous",
 		[PLANE_MOVE] = "plane-move",
 		[OVERLAY_PRIM_UPDATE] = "overlay-primary-update",
 	};
@@ -222,7 +229,7 @@ static void prepare(data_t *data)
 	/* all green frame */
 	igt_create_color_fb(data->drm_fd,
 			    data->mode->hdisplay, data->mode->vdisplay,
-			    DRM_FORMAT_XRGB8888,
+			    data->primary_format,
 			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 1.0, 0.0,
 			    &data->fb_primary);
@@ -251,6 +258,8 @@ static void prepare(data_t *data)
 				    0.0, 0.0, 1.0,
 				    &data->fb_test);
 
+		data->fb_continuous = &data->fb_overlay;
+
 		if (data->op == PLANE_MOVE) {
 			plane_move_setup_square(data, &data->fb_test,
 					   data->mode->hdisplay/2,
@@ -277,6 +286,7 @@ static void prepare(data_t *data)
 		plane_update_setup_squares(data, &data->fb_test,
 					   data->mode->hdisplay,
 					   data->mode->vdisplay);
+		data->fb_continuous = &data->fb_primary;
 		data->test_plane = primary;
 
 		if (data->op == OVERLAY_PRIM_UPDATE) {
@@ -312,6 +322,7 @@ static void prepare(data_t *data)
 		igt_create_fb(data->drm_fd, CUR_SIZE, CUR_SIZE,
 			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
 			      &data->fb_test);
+		data->fb_continuous = &data->fb_cursor;
 
 		draw_rect(data, &data->fb_test, 0, 0, CUR_SIZE, CUR_SIZE,
 			    1.0, 1.0, 1.0, 1.0);
@@ -334,7 +345,8 @@ static inline void manual(const char *expected)
 	igt_debug_manual_check("all", expected);
 }
 
-static void plane_update_expected_output(int plane_type, int box_count)
+static void plane_update_expected_output(int plane_type, int box_count,
+					 int screen_changes)
 {
 	char expected[64] = {};
 
@@ -344,9 +356,16 @@ static void plane_update_expected_output(int plane_type, int box_count)
 			box_count);
 		break;
 	case DRM_PLANE_TYPE_OVERLAY:
-		sprintf(expected,
-			"screen Green with Blue box and %d White box(es)",
-			box_count);
+		/*
+		 * Continuous updates only for DRM_PLANE_TYPE_OVERLAY
+		 * for now.
+		 */
+		if (screen_changes & 1)
+			sprintf(expected,
+				"screen Green with Blue box and %d White box(es)",
+				box_count);
+		else
+			sprintf(expected, "screen Green with Blue box");
 		break;
 	case DRM_PLANE_TYPE_CURSOR:
 		sprintf(expected, "screen Green with %d White box(es)",
@@ -407,7 +426,13 @@ static void expected_output(data_t *data)
 		break;
 	case PLANE_UPDATE:
 		plane_update_expected_output(data->test_plane_id,
-					     data->damage_area_count);
+					     data->damage_area_count,
+					     data->screen_changes);
+		break;
+	case PLANE_UPDATE_CONTINUOUS:
+		plane_update_expected_output(data->test_plane_id,
+					     data->damage_area_count,
+					     data->screen_changes);
 		break;
 	case OVERLAY_PRIM_UPDATE:
 		overlay_prim_update_expected_output(data->damage_area_count);
@@ -468,24 +493,28 @@ static void damaged_plane_update(data_t *data)
 	uint32_t h = data->mode->hdisplay;
 	uint32_t v = data->mode->vdisplay;
 
-	igt_plane_set_fb(test_plane, &data->fb_test);
-
 	if (data->test_plane_id == DRM_PLANE_TYPE_OVERLAY) {
 		h = h/2;
 		v = v/2;
 	}
 
-	if (data->test_plane_id == DRM_PLANE_TYPE_CURSOR)
-		igt_plane_replace_prop_blob(test_plane,
-					    IGT_PLANE_FB_DAMAGE_CLIPS,
-					    &data->cursor_clip,
-					    sizeof(struct drm_mode_rect));
-	else
-		igt_plane_replace_prop_blob(test_plane,
-					    IGT_PLANE_FB_DAMAGE_CLIPS,
-					    &data->plane_update_clip,
-					    sizeof(struct drm_mode_rect)*
-					    data->damage_area_count);
+	if (data->screen_changes & 1) {
+		igt_plane_set_fb(test_plane, &data->fb_test);
+	} else {
+		igt_plane_set_fb(test_plane, data->fb_continuous);
+
+		if (data->test_plane_id == DRM_PLANE_TYPE_CURSOR)
+			igt_plane_replace_prop_blob(test_plane,
+						    IGT_PLANE_FB_DAMAGE_CLIPS,
+						    &data->cursor_clip,
+						    sizeof(struct drm_mode_rect));
+		else
+			igt_plane_replace_prop_blob(test_plane,
+						    IGT_PLANE_FB_DAMAGE_CLIPS,
+						    &data->plane_update_clip,
+						    sizeof(struct drm_mode_rect)*
+						    data->damage_area_count);
+	}
 
 	igt_plane_set_position(data->test_plane, 0, 0);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
@@ -499,11 +528,20 @@ static void run(data_t *data)
 {
 	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2));
 
+	data->screen_changes = 0;
+
 	switch (data->op) {
 	case PLANE_UPDATE:
 	case OVERLAY_PRIM_UPDATE:
 		damaged_plane_update(data);
 		break;
+	case PLANE_UPDATE_CONTINUOUS:
+		for (data->screen_changes = 0;
+		     data->screen_changes < MAX_SCREEN_CHANGES;
+		     data->screen_changes++) {
+			damaged_plane_update(data);
+		}
+		break;
 	case PLANE_MOVE:
 		damaged_plane_move(data);
 		break;
@@ -568,6 +606,7 @@ igt_main
 		data.damage_area_count = MAX_DAMAGE_AREAS;
 		data.op = PLANE_UPDATE;
 		data.test_plane_id = DRM_PLANE_TYPE_PRIMARY;
+		data.primary_format = DRM_FORMAT_XRGB8888;
 		prepare(&data);
 		r = psr_wait_entry(data.debugfs_fd, PSR_MODE_2);
 		if (!r)
@@ -643,6 +682,21 @@ igt_main
 		}
 	}
 
+	/*
+	 * Verify overlay plane selective fetch using NV12 primary
+	 * plane and continuous updates.
+	 */
+	data.op = PLANE_UPDATE_CONTINUOUS;
+	data.primary_format = DRM_FORMAT_NV12;
+	igt_describe("Test that selective fetch works on overlay plane");
+	igt_subtest_f("overlay-%s-sf", op_str(data.op)) {
+			data.damage_area_count = 1;
+			data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+			prepare(&data);
+			run(&data);
+			cleanup(&data);
+	}
+
 	igt_fixture {
 		close(data.debugfs_fd);
 		display_fini(&data);
-- 
2.25.1
