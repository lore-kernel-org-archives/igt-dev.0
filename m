Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4396EA1A
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Nov 2021 09:50:22 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Wed, 24 Nov 2021 11:50:01 +0200
Message-Id: <20211124095002.130684-2-jouni.hogander@intel.com>
In-Reply-To: <20211124095002.130684-1-jouni.hogander@intel.com>
References: <20211124095002.130684-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/2] tests/kms_psr2_su: add biplanar
 selective update tests
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

Add biplanar formats (NV12, p010) into selective update test.
Use also offset for white rectangle as this reveals better
possible issues with offset calculation/configuration.

v2: Add back skipping of frontbuffer rendering tests
v3: Use hyphen instead of underscore in testnames

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/i915/kms_psr2_su.c | 91 +++++++++++++++++++++++++---------------
 1 file changed, 58 insertions(+), 33 deletions(-)

diff --git a/tests/i915/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
index 91de9bad..d79a1e58 100644
--- a/tests/i915/kms_psr2_su.c
+++ b/tests/i915/kms_psr2_su.c
@@ -33,7 +33,8 @@
 
 IGT_TEST_DESCRIPTION("Test PSR2 selective update");
 
-#define SQUARE_SIZE 100
+#define SQUARE_SIZE   100
+#define SQUARE_OFFSET 100
 /* each selective update block is 4 lines tall */
 #define EXPECTED_NUM_SU_BLOCKS ((SQUARE_SIZE / 4) + (SQUARE_SIZE % 4 ? 1 : 0))
 
@@ -50,6 +51,23 @@ enum operations {
 	LAST
 };
 
+static const uint32_t formats_page_flip[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_P010,
+	DRM_FORMAT_INVALID,
+};
+
+static const uint32_t formats_frontbuffer[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_INVALID,
+};
+
+static const uint32_t *formats[] = {
+				    [PAGE_FLIP] = formats_page_flip,
+				    [FRONTBUFFER] = formats_frontbuffer,
+};
+
 static const char *op_str(enum operations op)
 {
 	static const char * const name[] = {
@@ -68,6 +86,7 @@ typedef struct {
 	igt_output_t *output;
 	struct igt_fb fb[2];
 	enum operations op;
+	uint32_t format;
 	cairo_t *cr;
 	int change_screen_timerfd;
 	uint32_t screen_changes;
@@ -111,7 +130,7 @@ static void prepare(data_t *data)
 	/* all green frame */
 	igt_create_color_fb(data->drm_fd,
 			    data->mode->hdisplay, data->mode->vdisplay,
-			    DRM_FORMAT_XRGB8888,
+			    data->format,
 			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 1.0, 0.0,
 			    &data->fb[0]);
@@ -121,14 +140,14 @@ static void prepare(data_t *data)
 
 		igt_create_color_fb(data->drm_fd,
 				    data->mode->hdisplay, data->mode->vdisplay,
-				    DRM_FORMAT_XRGB8888,
+				    data->format,
 				    DRM_FORMAT_MOD_LINEAR,
 				    0.0, 1.0, 0.0,
 				    &data->fb[1]);
 
 		cr = igt_get_cairo_ctx(data->drm_fd, &data->fb[1]);
 		/* paint a white square */
-		igt_paint_color_alpha(cr, 0, 0, SQUARE_SIZE, SQUARE_SIZE,
+		igt_paint_color_alpha(cr, SQUARE_OFFSET, SQUARE_OFFSET, SQUARE_SIZE, SQUARE_SIZE,
 				      1.0, 1.0, 1.0, 1.0);
 		igt_put_cairo_ctx(cr);
 	} else if (data->op == FRONTBUFFER) {
@@ -152,8 +171,8 @@ static bool update_screen_and_test(data_t *data)
 		struct drm_mode_rect clip;
 		igt_plane_t *primary;
 
-		clip.x1 = clip.y1 = 0;
-		clip.x2 = clip.y2 = SQUARE_SIZE;
+		clip.x1 = clip.y1 = SQUARE_OFFSET;
+		clip.x2 = clip.y2 = SQUARE_OFFSET + SQUARE_SIZE;
 
 		primary = igt_output_get_plane_type(data->output,
 						    DRM_PLANE_TYPE_PRIMARY);
@@ -167,16 +186,18 @@ static bool update_screen_and_test(data_t *data)
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
 
@@ -261,6 +282,7 @@ igt_main
 					 data.debugfs_fd, PSR_MODE_2),
 			      "Error enabling PSR2\n");
 		data.op = FRONTBUFFER;
+		data.format = DRM_FORMAT_XRGB8888;
 		prepare(&data);
 		r = psr_wait_entry(data.debugfs_fd, PSR_MODE_2);
 		cleanup(&data);
@@ -281,31 +303,34 @@ igt_main
 	}
 
 	for (data.op = PAGE_FLIP; data.op < LAST; data.op++) {
-		igt_describe("Test that selective update works when screen changes");
-		igt_subtest_f("%s", op_str(data.op)) {
-
-			if (data.op == FRONTBUFFER &&
-			    intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 12) {
-				/*
-				 * FIXME: Display 12+ platforms now have PSR2
-				 * selective fetch enabled by default but we
-				 * still can't properly handle frontbuffer
-				 * rendering, so right it does full frame
-				 * fetches at every frontbuffer rendering.
-				 * So it is expected that this test will fail
-				 * in display 12+ platform fow now.
-				 */
-				igt_skip("PSR2 selective fetch is doing full frame fetches for frontbuffer rendering\n");
+		const uint32_t *format = formats[data.op];
+
+		while (*format != DRM_FORMAT_INVALID) {
+			data.format = *format++;
+			igt_describe("Test that selective update works when screen changes");
+			igt_subtest_f("%s-%s", op_str(data.op), igt_format_str(data.format)) {
+				if (data.op == FRONTBUFFER &&
+				    intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 12) {
+					/*
+					 * FIXME: Display 12+ platforms now have PSR2
+					 * selective fetch enabled by default but we
+					 * still can't properly handle frontbuffer
+					 * rendering, so right it does full frame
+					 * fetches at every frontbuffer rendering.
+					 * So it is expected that this test will fail
+					 * in display 12+ platform for now.
+					 */
+					igt_skip("PSR2 selective fetch is doing full frame fetches for frontbuffer rendering\n");
+				}
+				prepare(&data);
+				run(&data);
+				cleanup(&data);
 			}
-
-			prepare(&data);
-			run(&data);
-			cleanup(&data);
 		}
-	}
 
-	igt_fixture {
-		close(data.debugfs_fd);
-		display_fini(&data);
+		igt_fixture {
+			close(data.debugfs_fd);
+			display_fini(&data);
+		}
 	}
 }
-- 
2.25.1
