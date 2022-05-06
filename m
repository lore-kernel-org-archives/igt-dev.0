Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDF411203C
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 07:11:26 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 May 2022 10:11:02 +0300
Message-Id: <20220506071104.2876292-2-jouni.hogander@intel.com>
In-Reply-To: <20220506071104.2876292-1-jouni.hogander@intel.com>
References: <20220506071104.2876292-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/kms_psr2_sf: Move continuous
 testcase preparation for new tests
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

Modify current move continuous testcase to ease up adding new
testcases.

Remove exceeding visible area as testcases to perform this are about
to be added as separate testcases.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/i915/kms_psr2_sf.c | 90 +++++++++++++++++++++++++++-------------
 1 file changed, 61 insertions(+), 29 deletions(-)

diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index d4cddb62..bf0eab23 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -53,8 +53,11 @@ enum plane_move_postion {
 	POS_TOP_RIGHT,
 	POS_BOTTOM_LEFT,
 	POS_BOTTOM_RIGHT,
-	POS_BOTTOM_LEFT_NEGATIVE,
-	POS_TOP_RIGHT_NEGATIVE,
+	POS_CENTER,
+	POS_TOP,
+	POS_BOTTOM,
+	POS_LEFT,
+	POS_RIGHT,
 };
 
 typedef struct {
@@ -411,34 +414,42 @@ static void plane_move_expected_output(enum plane_move_postion pos)
 	manual(expected);
 }
 
-static void plane_move_continuous_expected_output(enum plane_move_postion pos)
+static void plane_move_continuous_expected_output(data_t *data)
 {
 	char expected[128] = {};
+	int ret;
 
-	switch (pos) {
+	switch (data->pos) {
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
-	case POS_BOTTOM_LEFT_NEGATIVE:
-		sprintf(expected,
-			"screen Green with Blue box on bottom left corner (partly exceeding area)");
+	case POS_CENTER:
+		ret = sprintf(expected, "screen Green with Blue box on center");
 		break;
-	case POS_TOP_RIGHT_NEGATIVE:
-		sprintf(expected,
-			"screen Green with Blue box on top right corner (partly exceeding area)");
+	case POS_TOP:
+		ret = sprintf(expected, "screen Green with Blue box on top");
+		break;
+	case POS_BOTTOM:
+		ret = sprintf(expected, "screen Green with Blue box on bottom");
+		break;
+	case POS_LEFT:
+		ret = sprintf(expected, "screen Green with Blue box on left");
+		break;
+	case POS_RIGHT:
+		ret = sprintf(expected, "screen Green with Blue box on right");
 		break;
 	default:
 		igt_assert(false);
@@ -530,8 +541,7 @@ static void damaged_plane_move(data_t *data)
 
 	expected_output(data);
 }
-
-static void plane_move_continuous(data_t *data)
+static void get_target_coords(data_t *data, int *x, int *y)
 {
 	int target_x, target_y;
 
@@ -544,28 +554,50 @@ static void plane_move_continuous(data_t *data)
 		target_x = data->mode->hdisplay - data->fb_test.width;
 		target_y = 0;
 		break;
-	case POS_TOP_RIGHT_NEGATIVE:
-		target_x = data->mode->hdisplay - data->fb_test.width;
-		target_y = -data->fb_test.width / 2;
-		break;
 	case POS_BOTTOM_LEFT:
 		target_x = 0;
 		target_y = data->mode->vdisplay - data->fb_test.height;
 		break;
-	case POS_BOTTOM_LEFT_NEGATIVE:
-		target_x = -data->fb_test.width / 2;
-		target_y = data->mode->vdisplay - data->fb_test.height;
-		break;
 	case POS_BOTTOM_RIGHT:
 		target_x = data->mode->hdisplay - data->fb_test.width;
 		target_y = data->mode->vdisplay - data->fb_test.height;
 		break;
+	case POS_CENTER:
+		target_x = data->mode->hdisplay / 2;
+		target_y = data->mode->vdisplay / 2;
+		break;
+	case POS_BOTTOM:
+		target_x = data->mode->hdisplay / 2;
+		target_y = data->mode->vdisplay - data->fb_test.height;
+		break;
+	case POS_TOP:
+		target_x = data->mode->hdisplay / 2;
+		target_y = 0;
+		break;
+	case POS_RIGHT:
+		target_x = data->mode->hdisplay - data->fb_test.width;
+		target_y = data->mode->vdisplay / 2;
+		break;
+	case POS_LEFT:
+		target_x = 0;
+		target_y = data->mode->vdisplay / 2;
+		break;
 	default:
 		igt_assert(false);
 	}
 
+	*x = target_x;
+	*y = target_y;
+}
+
+static void plane_move_continuous(data_t *data)
+{
+	int target_x, target_y;
+
 	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2));
 
+	get_target_coords(data, &target_x, &target_y);
+
 	while (data->cur_x != target_x || data->cur_y != target_y) {
 		if (data->cur_x < target_x)
 			data->cur_x += min(target_x - data->cur_x, 20);
@@ -650,7 +682,7 @@ static void run(data_t *data)
 		 * over iterations.
 		 */
 		data->cur_x = data->cur_y = 0;
-		for (i = POS_TOP_LEFT; i <= POS_TOP_RIGHT_NEGATIVE; i++) {
+		for (i = POS_TOP_LEFT; i <= POS_RIGHT; i++) {
 			data->pos = i;
 			plane_move_continuous(data);
 		}
-- 
2.25.1
