Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C301410EF58
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Mar 2022 06:50:58 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Mar 2022 08:50:34 +0200
Message-Id: <20220310065034.3277320-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4] tests/kms_psr2_sf: Add new testcases for
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
v3:
  - Use INTERACTIVE_PLANE_MOVE instead of PLANE_MOVE_NO_UPDATE
  - Fix coding style errors
  - Move psr_wait_entry before moving the plane
  - Cur_x/cur_y usage made more clear
v4:
  - Use PLANE_MOVE_CONTINUOUS instead of INTERACTIVE_PLANE_MOVE
  - Use 128 bytes for expected output string
  - Drop unnecessary comments

Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 tests/i915/kms_psr2_sf.c | 130 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 129 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index 36f8a786..d4cddb62 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -44,6 +44,7 @@ enum operations {
 	PLANE_UPDATE,
 	PLANE_UPDATE_CONTINUOUS,
 	PLANE_MOVE,
+	PLANE_MOVE_CONTINUOUS,
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
+		[PLANE_MOVE_CONTINUOUS] = "plane-move-continuous",
 		[PLANE_MOVE] = "plane-move",
 		[OVERLAY_PRIM_UPDATE] = "overlay-primary-update",
 	};
@@ -406,6 +411,42 @@ static void plane_move_expected_output(enum plane_move_postion pos)
 	manual(expected);
 }
 
+static void plane_move_continuous_expected_output(enum plane_move_postion pos)
+{
+	char expected[128] = {};
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
@@ -424,6 +465,9 @@ static void expected_output(data_t *data)
 	case PLANE_MOVE:
 		plane_move_expected_output(data->pos);
 		break;
+	case PLANE_MOVE_CONTINUOUS:
+		plane_move_continuous_expected_output(data->pos);
+		break;
 	case PLANE_UPDATE:
 		plane_update_expected_output(data->test_plane_id,
 					     data->damage_area_count,
@@ -487,6 +531,59 @@ static void damaged_plane_move(data_t *data)
 	expected_output(data);
 }
 
+static void plane_move_continuous(data_t *data)
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
+		target_x = -data->fb_test.width / 2;
+		target_y = data->mode->vdisplay - data->fb_test.height;
+		break;
+	case POS_BOTTOM_RIGHT:
+		target_x = data->mode->hdisplay - data->fb_test.width;
+		target_y = data->mode->vdisplay - data->fb_test.height;
+		break;
+	default:
+		igt_assert(false);
+	}
+
+	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2));
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
+	expected_output(data);
+}
+
 static void damaged_plane_update(data_t *data)
 {
 	igt_plane_t *test_plane = data->test_plane;
@@ -526,6 +623,8 @@ static void damaged_plane_update(data_t *data)
 
 static void run(data_t *data)
 {
+	int i;
+
 	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2));
 
 	data->screen_changes = 0;
@@ -545,6 +644,17 @@ static void run(data_t *data)
 	case PLANE_MOVE:
 		damaged_plane_move(data);
 		break;
+	case PLANE_MOVE_CONTINUOUS:
+		/*
+		 * Start from top left corner and keep plane position
+		 * over iterations.
+		 */
+		data->cur_x = data->cur_y = 0;
+		for (i = POS_TOP_LEFT; i <= POS_TOP_RIGHT_NEGATIVE; i++) {
+			data->pos = i;
+			plane_move_continuous(data);
+		}
+		break;
 	default:
 		igt_assert(false);
 	}
@@ -654,6 +764,15 @@ igt_main
 		cleanup(&data);
 	}
 
+	data.op = PLANE_MOVE_CONTINUOUS;
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
@@ -668,6 +787,15 @@ igt_main
 		}
 	}
 
+	data.op = PLANE_MOVE_CONTINUOUS;
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
