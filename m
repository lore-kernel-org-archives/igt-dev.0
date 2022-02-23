Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C95710F627
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Feb 2022 13:42:41 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Feb 2022 15:42:14 +0200
Message-Id: <20220223134214.3320181-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_psr2_sf: Add new testcases for
 moving plane without updates
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add new testcases which are moving cursor and overlay planes
without updating plane contents or setting any damage areas.

Cursor testcase is reproducing following bug:

https://gitlab.freedesktop.org/drm/intel/-/issues/5077

Current *-plane-move-sf-dmg-area is not suitable for this
purpose. It's blinking display on cleanup/prepare and also updating
contents of cursor plane. This makes it harder to observe possible
flickering. Patch is keeping original *-plane-move-sf-dmg-area as it
is and just adding a new testcase.

New testcase is moving the plane first inside pipe area. Then it's
moving it to x < 0 and last to y < 0. This is done step-by-step
because issue mentioned above is not triggered if the plane is just
moved to x < 0 or y < 0.

v2:
  - Keep PLANE_MOVE enum as it was
  - Remove changes to functions that are not really modified
  - Fix several copy paste errors

Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/i915/kms_psr2_sf.c | 129 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 128 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index 36f8a786..ab8fb560 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -44,6 +44,7 @@ enum operations {
 	PLANE_UPDATE,
 	PLANE_UPDATE_CONTINUOUS,
 	PLANE_MOVE,
+	PLANE_MOVE_NO_UPDATE,
 	OVERLAY_PRIM_UPDATE
 };
 
@@ -51,7 +52,9 @@ enum plane_move_postion {
 	POS_TOP_LEFT,
 	POS_TOP_RIGHT,
 	POS_BOTTOM_LEFT,
-	POS_BOTTOM_RIGHT
+	POS_BOTTOM_RIGHT,
+	POS_BOTTOM_LEFT_NEGATIVE,
+	POS_TOP_RIGHT_NEGATIVE,
 };
 
 typedef struct {
@@ -74,6 +77,7 @@ typedef struct {
 	igt_plane_t *test_plane;
 	cairo_t *cr;
 	uint32_t screen_changes;
+	int cur_x, cur_y;
 } data_t;
 
 static const char *op_str(enum operations op)
@@ -81,6 +85,7 @@ static const char *op_str(enum operations op)
 	static const char * const name[] = {
 		[PLANE_UPDATE] = "plane-update",
 		[PLANE_UPDATE_CONTINUOUS] = "plane-update-continuous",
+		[PLANE_MOVE_NO_UPDATE] = "plane-move-no-update",
 		[PLANE_MOVE] = "plane-move",
 		[OVERLAY_PRIM_UPDATE] = "overlay-primary-update",
 	};
@@ -335,6 +340,8 @@ static void prepare(data_t *data)
 		igt_assert(false);
 	}
 
+	data->cur_x = data->cur_y = 0;
+
 	igt_plane_set_fb(primary, &data->fb_primary);
 
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
@@ -406,6 +413,42 @@ static void plane_move_expected_output(enum plane_move_postion pos)
 	manual(expected);
 }
 
+static void plane_move_no_update_expected_output(enum plane_move_postion pos)
+{
+	char expected[73] = {};
+
+	switch (pos) {
+	case POS_TOP_LEFT:
+		sprintf(expected,
+			"screen Green with Blue box on top left corner");
+		break;
+	case POS_TOP_RIGHT:
+		sprintf(expected,
+			"screen Green with Blue box on top right corner");
+		break;
+	case POS_BOTTOM_LEFT:
+		sprintf(expected,
+			"screen Green with Blue box on bottom left corner");
+		break;
+	case POS_BOTTOM_RIGHT:
+		sprintf(expected,
+			"screen Green with Blue box on bottom right corner");
+		break;
+	case POS_BOTTOM_LEFT_NEGATIVE:
+		sprintf(expected,
+			"screen Green with Blue box on bottom left corner (partly exceeding area)");
+		break;
+	case POS_TOP_RIGHT_NEGATIVE:
+		sprintf(expected,
+			"screen Green with Blue box on top right corner (partly exceeding area)");
+		break;
+	default:
+		igt_assert(false);
+	}
+
+	manual(expected);
+}
+
 static void overlay_prim_update_expected_output(int box_count)
 {
 	char expected[64] = {};
@@ -424,6 +467,9 @@ static void expected_output(data_t *data)
 	case PLANE_MOVE:
 		plane_move_expected_output(data->pos);
 		break;
+	case PLANE_MOVE_NO_UPDATE:
+		plane_move_no_update_expected_output(data->pos);
+		break;
 	case PLANE_UPDATE:
 		plane_update_expected_output(data->test_plane_id,
 					     data->damage_area_count,
@@ -487,6 +533,59 @@ static void damaged_plane_move(data_t *data)
 	expected_output(data);
 }
 
+static void plane_move_no_update(data_t *data)
+{
+	int target_x, target_y;
+
+	switch (data->pos) {
+	case POS_TOP_LEFT:
+		target_x = 0;
+		target_y = 0;
+		break;
+	case POS_TOP_RIGHT:
+		target_x = data->mode->hdisplay - data->fb_test.width;
+		target_y = 0;
+		break;
+	case POS_TOP_RIGHT_NEGATIVE:
+		target_x = data->mode->hdisplay - data->fb_test.width;
+		target_y = -data->fb_test.width / 2;
+		break;
+	case POS_BOTTOM_LEFT:
+		target_x = 0;
+		target_y = data->mode->vdisplay - data->fb_test.height;
+		break;
+	case POS_BOTTOM_LEFT_NEGATIVE:
+	  target_x = -data->fb_test.width / 2;
+	  target_y = data->mode->vdisplay - data->fb_test.height;
+		break;
+	case POS_BOTTOM_RIGHT:
+	  target_x = data->mode->hdisplay - data->fb_test.width;
+	  target_y = data->mode->vdisplay - data->fb_test.height;
+		break;
+	default:
+		igt_assert(false);
+	}
+
+	while (data->cur_x != target_x || data->cur_y != target_y) {
+		if (data->cur_x < target_x)
+			data->cur_x += min(target_x - data->cur_x, 20);
+		else if (data->cur_x > target_x)
+			data->cur_x -= min(data->cur_x - target_x, 20);
+
+		if (data->cur_y < target_y)
+			data->cur_y += min(target_y - data->cur_y, 20);
+		else if (data->cur_y > target_y)
+			data->cur_y -= min(data->cur_y - target_y, 20);
+
+		igt_plane_set_position(data->test_plane, data->cur_x, data->cur_y);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	}
+
+	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2));
+
+	expected_output(data);
+}
+
 static void damaged_plane_update(data_t *data)
 {
 	igt_plane_t *test_plane = data->test_plane;
@@ -526,6 +625,8 @@ static void damaged_plane_update(data_t *data)
 
 static void run(data_t *data)
 {
+	int i;
+
 	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2));
 
 	data->screen_changes = 0;
@@ -545,6 +646,12 @@ static void run(data_t *data)
 	case PLANE_MOVE:
 		damaged_plane_move(data);
 		break;
+	case PLANE_MOVE_NO_UPDATE:
+		for (i = POS_TOP_LEFT; i <= POS_TOP_RIGHT_NEGATIVE; i++) {
+			data->pos = i;
+			plane_move_no_update(data);
+		}
+		break;
 	default:
 		igt_assert(false);
 	}
@@ -654,6 +761,16 @@ igt_main
 		cleanup(&data);
 	}
 
+	data.op = PLANE_MOVE_NO_UPDATE;
+	/* Verify cursor plane move */
+	igt_describe("Test that selective fetch works on moving cursor plane (no update)");
+	igt_subtest_f("cursor-%s-sf", op_str(data.op)) {
+		data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+		prepare(&data);
+		run(&data);
+		cleanup(&data);
+	}
+
 	/* Only for overlay plane */
 	data.op = PLANE_MOVE;
 	/* Verify overlay plane move selective fetch */
@@ -668,6 +785,16 @@ igt_main
 		}
 	}
 
+	data.op = PLANE_MOVE_NO_UPDATE;
+	/* Verify overlay plane move */
+	igt_describe("Test that selective fetch works on moving overlay plane (no update)");
+	igt_subtest_f("overlay-%s-sf", op_str(data.op)) {
+		data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+		prepare(&data);
+		run(&data);
+		cleanup(&data);
+	}
+
 	/* Verify primary plane selective fetch with overplay plane blended */
 	data.op = OVERLAY_PRIM_UPDATE;
 	igt_describe("Test that selective fetch works on primary plane "
-- 
2.25.1
