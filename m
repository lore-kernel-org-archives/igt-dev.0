Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5F411203F
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 07:11:32 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 May 2022 10:11:03 +0300
Message-Id: <20220506071104.2876292-3-jouni.hogander@intel.com>
In-Reply-To: <20220506071104.2876292-1-jouni.hogander@intel.com>
References: <20220506071104.2876292-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/kms_psr2_sf: Add new move
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
 tests/i915/kms_psr2_sf.c | 98 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 2 deletions(-)

diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index bf0eab23..07dc770b 100644
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
@@ -455,6 +460,12 @@ static void plane_move_continuous_expected_output(data_t *data)
 		igt_assert(false);
 	}
 
+	if (ret) {
+		if (data->op == PLANE_MOVE_CONTINUOUS_EXCEED)
+			sprintf(expected + ret, "(partly exceeding area)");
+		else if (data->op == PLANE_MOVE_CONTINUOUS_EXCEED_FULLY)
+			sprintf(expected + ret, "(fully exceeding area)");
+	}
 	manual(expected);
 }
 
@@ -477,7 +488,9 @@ static void expected_output(data_t *data)
 		plane_move_expected_output(data->pos);
 		break;
 	case PLANE_MOVE_CONTINUOUS:
-		plane_move_continuous_expected_output(data->pos);
+	case PLANE_MOVE_CONTINUOUS_EXCEED:
+	case PLANE_MOVE_CONTINUOUS_EXCEED_FULLY:
+		plane_move_continuous_expected_output(data);
 		break;
 	case PLANE_UPDATE:
 		plane_update_expected_output(data->test_plane_id,
@@ -543,7 +556,7 @@ static void damaged_plane_move(data_t *data)
 }
 static void get_target_coords(data_t *data, int *x, int *y)
 {
-	int target_x, target_y;
+	int target_x, target_y, exceed_x, exceed_y;
 
 	switch (data->pos) {
 	case POS_TOP_LEFT:
@@ -586,6 +599,49 @@ static void get_target_coords(data_t *data, int *x, int *y)
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
@@ -677,6 +733,8 @@ static void run(data_t *data)
 		damaged_plane_move(data);
 		break;
 	case PLANE_MOVE_CONTINUOUS:
+	case PLANE_MOVE_CONTINUOUS_EXCEED:
+	case PLANE_MOVE_CONTINUOUS_EXCEED_FULLY:
 		/*
 		 * Start from top left corner and keep plane position
 		 * over iterations.
@@ -805,6 +863,24 @@ igt_main
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
@@ -828,6 +904,24 @@ igt_main
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
