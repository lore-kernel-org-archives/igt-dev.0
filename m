Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAAB210E298
 for <igt-dev@lists.freedesktop.org>; Wed, 18 May 2022 11:55:42 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 18 May 2022 14:55:04 +0300
Message-Id: <20220518115505.207813-3-jouni.hogander@intel.com>
In-Reply-To: <20220518115505.207813-1-jouni.hogander@intel.com>
References: <20220518115505.207813-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/3] tests/kms_psr2_sf: Add new move
 continuous testcases
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

Adding new continuous move testcases for cursor and overlay
planes. These new testcases are testing selective fetch when updated
plane is fully or partially out of visible area. This was found to
reveal bug in selective fetch area calculation:

https://gitlab.freedesktop.org/drm/intel/-/issues/5440

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/i915/kms_psr2_sf.c | 124 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 110 insertions(+), 14 deletions(-)

diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index 5024fb14..75232973 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -45,6 +45,8 @@ enum operations {
 	PLANE_UPDATE_CONTINUOUS,
 	PLANE_MOVE,
 	PLANE_MOVE_CONTINUOUS,
+	PLANE_MOVE_CONTINUOUS_EXCEED,
+	PLANE_MOVE_CONTINUOUS_EXCEED_FULLY,
 	OVERLAY_PRIM_UPDATE
 };
 
@@ -89,6 +91,9 @@ static const char *op_str(enum operations op)
 		[PLANE_UPDATE] = "plane-update",
 		[PLANE_UPDATE_CONTINUOUS] = "plane-update-continuous",
 		[PLANE_MOVE_CONTINUOUS] = "plane-move-continuous",
+		[PLANE_MOVE_CONTINUOUS_EXCEED] = "plane-move-continuous-exceed",
+		[PLANE_MOVE_CONTINUOUS_EXCEED_FULLY] =
+		"plane-move-continuous-exceed-fully",
 		[PLANE_MOVE] = "plane-move",
 		[OVERLAY_PRIM_UPDATE] = "overlay-primary-update",
 	};
@@ -417,43 +422,51 @@ static void plane_move_expected_output(enum plane_move_postion pos)
 static void plane_move_continuous_expected_output(data_t *data)
 {
 	char expected[128] = {};
+	int ret = 0;
 
 	switch (data->pos) {
 	case POS_TOP_LEFT:
-		sprintf(expected,
-			"screen Green with Blue box on top left corner");
+		ret = sprintf(expected,
+			      "screen Green with Blue box on top left corner");
 		break;
 	case POS_TOP_RIGHT:
-		sprintf(expected,
-			"screen Green with Blue box on top right corner");
+		ret = sprintf(expected,
+			      "screen Green with Blue box on top right corner");
 		break;
 	case POS_BOTTOM_LEFT:
-		sprintf(expected,
-			"screen Green with Blue box on bottom left corner");
+		ret = sprintf(expected,
+			      "screen Green with Blue box on bottom left corner");
 		break;
 	case POS_BOTTOM_RIGHT:
-		sprintf(expected,
-			"screen Green with Blue box on bottom right corner");
+		ret = sprintf(expected,
+			      "screen Green with Blue box on bottom right corner");
 		break;
 	case POS_CENTER:
-		sprintf(expected, "screen Green with Blue box on center");
+		ret = sprintf(expected, "screen Green with Blue box on center");
 		break;
 	case POS_TOP:
-		sprintf(expected, "screen Green with Blue box on top");
+		ret = sprintf(expected, "screen Green with Blue box on top");
 		break;
 	case POS_BOTTOM:
-		sprintf(expected, "screen Green with Blue box on bottom");
+		ret = sprintf(expected, "screen Green with Blue box on bottom");
 		break;
 	case POS_LEFT:
-		sprintf(expected, "screen Green with Blue box on left");
+		ret = sprintf(expected, "screen Green with Blue box on left");
 		break;
 	case POS_RIGHT:
-		sprintf(expected, "screen Green with Blue box on right");
+		ret = sprintf(expected, "screen Green with Blue box on right");
 		break;
 	default:
 		igt_assert(false);
 	}
 
+	if (ret) {
+		if (data->op == PLANE_MOVE_CONTINUOUS_EXCEED)
+			sprintf(expected + ret, "(partly exceeding area)");
+		else if (data->op == PLANE_MOVE_CONTINUOUS_EXCEED_FULLY)
+			sprintf(expected + ret, "(fully exceeding area)");
+	}
+
 	manual(expected);
 }
 
@@ -476,6 +489,8 @@ static void expected_output(data_t *data)
 		plane_move_expected_output(data->pos);
 		break;
 	case PLANE_MOVE_CONTINUOUS:
+	case PLANE_MOVE_CONTINUOUS_EXCEED:
+	case PLANE_MOVE_CONTINUOUS_EXCEED_FULLY:
 		plane_move_continuous_expected_output(data);
 		break;
 	case PLANE_UPDATE:
@@ -542,7 +557,7 @@ static void damaged_plane_move(data_t *data)
 }
 static void get_target_coords(data_t *data, int *x, int *y)
 {
-	int target_x, target_y;
+	int target_x, target_y, exceed_x, exceed_y;
 
 	switch (data->pos) {
 	case POS_TOP_LEFT:
@@ -585,6 +600,49 @@ static void get_target_coords(data_t *data, int *x, int *y)
 		igt_assert(false);
 	}
 
+	if (data->op == PLANE_MOVE_CONTINUOUS_EXCEED) {
+		exceed_x  = data->fb_test.width / 2;
+		exceed_y  = data->fb_test.height / 2;
+	} else if (data->op == PLANE_MOVE_CONTINUOUS_EXCEED_FULLY) {
+		exceed_x  = data->fb_test.width;
+		exceed_y  = data->fb_test.height;
+	}
+
+	if (data->op != PLANE_MOVE_CONTINUOUS) {
+		switch (data->pos) {
+		case POS_TOP_LEFT:
+			target_x -= exceed_x;
+			target_y -= exceed_y;
+			break;
+		case POS_TOP_RIGHT:
+			target_x += exceed_x;
+			target_y -= exceed_y;
+			break;
+		case POS_BOTTOM_LEFT:
+			target_x -= exceed_x;
+			target_y += exceed_y;
+			break;
+		case POS_BOTTOM_RIGHT:
+			target_x += exceed_x;
+			target_y += exceed_y;
+			break;
+		case POS_BOTTOM:
+			target_y += exceed_y;
+			break;
+		case POS_TOP:
+			target_y -= exceed_y;
+			break;
+		case POS_RIGHT:
+			target_x += exceed_x;
+			break;
+		case POS_LEFT:
+			target_x -= exceed_x;
+			break;
+		case POS_CENTER:
+			break;
+		}
+	}
+
 	*x = target_x;
 	*y = target_y;
 }
@@ -676,6 +734,8 @@ static void run(data_t *data)
 		damaged_plane_move(data);
 		break;
 	case PLANE_MOVE_CONTINUOUS:
+	case PLANE_MOVE_CONTINUOUS_EXCEED:
+	case PLANE_MOVE_CONTINUOUS_EXCEED_FULLY:
 		/*
 		 * Start from top left corner and keep plane position
 		 * over iterations.
@@ -804,6 +864,24 @@ igt_main
 		cleanup(&data);
 	}
 
+	data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
+	igt_describe("Test that selective fetch works on moving cursor plane exceeding partially visible area (no update)");
+	igt_subtest_f("cursor-%s-sf", op_str(data.op)) {
+		data.test_plane_id = DRM_PLANE_TYPE_CURSOR;
+		prepare(&data);
+		run(&data);
+		cleanup(&data);
+	}
+
+	data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
+	igt_describe("Test that selective fetch works on moving cursor plane exceeding fully visible area (no update)");
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
@@ -827,6 +905,24 @@ igt_main
 		cleanup(&data);
 	}
 
+	data.op = PLANE_MOVE_CONTINUOUS_EXCEED;
+	igt_describe("Test that selective fetch works on moving overlay plane partially exceeding visible area (no update)");
+	igt_subtest_f("overlay-%s-sf", op_str(data.op)) {
+		data.test_plane_id = DRM_PLANE_TYPE_OVERLAY;
+		prepare(&data);
+		run(&data);
+		cleanup(&data);
+	}
+
+	data.op = PLANE_MOVE_CONTINUOUS_EXCEED_FULLY;
+	igt_describe("Test that selective fetch works on moving overlay plane fully exceeding visible area (no update)");
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
