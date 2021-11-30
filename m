Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8E66EB9D
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Nov 2021 07:38:37 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Tue, 30 Nov 2021 09:38:01 +0200
Message-Id: <20211130073803.46388-2-jouni.hogander@intel.com>
In-Reply-To: <20211130073803.46388-1-jouni.hogander@intel.com>
References: <20211130073803.46388-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/kms_psr2_su: Add offset to drawn
 rectangle
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
List-ID: <igt-dev@lists.freedesktop.org>

Adding offset to drawn rectangle reveals better problems offset
configuration.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/i915/kms_psr2_su.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/tests/i915/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
index 91de9bad..16301031 100644
--- a/tests/i915/kms_psr2_su.c
+++ b/tests/i915/kms_psr2_su.c
@@ -33,7 +33,8 @@
 
 IGT_TEST_DESCRIPTION("Test PSR2 selective update");
 
-#define SQUARE_SIZE 100
+#define SQUARE_SIZE   100
+#define SQUARE_OFFSET 100
 /* each selective update block is 4 lines tall */
 #define EXPECTED_NUM_SU_BLOCKS ((SQUARE_SIZE / 4) + (SQUARE_SIZE % 4 ? 1 : 0))
 
@@ -128,7 +129,7 @@ static void prepare(data_t *data)
 
 		cr = igt_get_cairo_ctx(data->drm_fd, &data->fb[1]);
 		/* paint a white square */
-		igt_paint_color_alpha(cr, 0, 0, SQUARE_SIZE, SQUARE_SIZE,
+		igt_paint_color_alpha(cr, SQUARE_OFFSET, SQUARE_OFFSET, SQUARE_SIZE, SQUARE_SIZE,
 				      1.0, 1.0, 1.0, 1.0);
 		igt_put_cairo_ctx(cr);
 	} else if (data->op == FRONTBUFFER) {
@@ -152,8 +153,8 @@ static bool update_screen_and_test(data_t *data)
 		struct drm_mode_rect clip;
 		igt_plane_t *primary;
 
-		clip.x1 = clip.y1 = 0;
-		clip.x2 = clip.y2 = SQUARE_SIZE;
+		clip.x1 = clip.y1 = SQUARE_OFFSET;
+		clip.x2 = clip.y2 = SQUARE_OFFSET + SQUARE_SIZE;
 
 		primary = igt_output_get_plane_type(data->output,
 						    DRM_PLANE_TYPE_PRIMARY);
@@ -167,16 +168,18 @@ static bool update_screen_and_test(data_t *data)
 	case FRONTBUFFER: {
 		drmModeClip clip;
 
-		clip.x1 = clip.y1 = 0;
-		clip.x2 = clip.y2 = SQUARE_SIZE;
+		clip.x1 = clip.y1 = SQUARE_OFFSET;
+		clip.x2 = clip.y2 = SQUARE_OFFSET + SQUARE_SIZE;
 
 		if (data->screen_changes & 1) {
 			/* go back to all green frame with a square */
-			igt_paint_color_alpha(data->cr, 0, 0, SQUARE_SIZE,
+			igt_paint_color_alpha(data->cr, SQUARE_OFFSET,
+					      SQUARE_OFFSET, SQUARE_SIZE,
 					      SQUARE_SIZE, 1.0, 1.0, 1.0, 1.0);
 		} else {
 			/* go back to all green frame */
-			igt_paint_color_alpha(data->cr, 0, 0, SQUARE_SIZE,
+			igt_paint_color_alpha(data->cr, SQUARE_OFFSET,
+					      SQUARE_OFFSET, SQUARE_SIZE,
 					      SQUARE_SIZE, 0, 1.0, 0, 1.0);
 		}
 
-- 
2.25.1
