Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212336EA46
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2020 10:38:07 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u26so6429098wmn.1
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2020 03:38:07 -0700 (PDT)
Date: Thu, 25 Jun 2020 07:37:58 -0300
From: Melissa Wen <melissa.srw@gmail.com>
Message-ID: <e1b9c469820c9625b0723680b76784f312564b4e.1592991729.git.melissa.srw@gmail.com>
References: <cover.1592991729.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1592991729.git.melissa.srw@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 2/2] test/kms_cursor_crc: update subtests
 descriptions and some comments
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: kernel-usp@googlegroups.com, aurabindo.pillai@amd.com, twoerner@gmail.com
List-ID: <igt-dev@lists.freedesktop.org>

Add descriptions for some subtests and detail a little more the comments in
test_cursor_alpha.

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 tests/kms_cursor_crc.c | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index f105e295..4dba1471 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -31,12 +31,13 @@
 
 
 IGT_TEST_DESCRIPTION(
-   "Use the display CRC support to validate cursor plane functionality. "
-   "The test will position the cursor plane either fully onscreen, "
-   "partially onscreen, or fully offscreen, using either a fully opaque "
-   "or fully transparent surface. In each case it then reads the PF CRC "
-   "and compares it with the CRC value obtained when the cursor plane "
-   "was disabled.");
+   "Use the display CRC support to validate cursor plane functionality. "\
+   "The test will position the cursor plane either fully onscreen, "\
+   "partially onscreen, or fully offscreen, using either a fully opaque "\
+   "or fully transparent surface. In each case, it enables the cursor plane "\
+   "and then reads the PF CRC (hardware test) and compares it with the CRC "\
+   "value obtained when the cursor plane was disabled and its drawing is "
+   "directly inserted on the PF by software.");
 
 #ifndef DRM_CAP_CURSOR_WIDTH
 #define DRM_CAP_CURSOR_WIDTH 0x8
@@ -485,7 +486,7 @@ static void test_cursor_alpha(data_t *data, double a)
 	int curw = data->curw;
 	int curh = data->curh;
 
-	/*alpha cursor fb*/
+	/*Alpha cursor fb with white color*/
 	fb_id = igt_create_fb(data->drm_fd, curw, curh,
 				    DRM_FORMAT_ARGB8888,
 				    LOCAL_DRM_FORMAT_MOD_NONE,
@@ -495,22 +496,24 @@ static void test_cursor_alpha(data_t *data, double a)
 	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
 	igt_put_cairo_ctx(data->drm_fd, &data->fb, cr);
 
-	/*Hardware Test*/
+	/*Hardware Test - enable cursor and get PF CRC*/
 	cursor_enable(data);
 	igt_display_commit(display);
 	igt_wait_for_vblank(data->drm_fd, data->pipe);
 	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
+
 	cursor_disable(data);
 	igt_remove_fb(data->drm_fd, &data->fb);
 
-	/*Software Test*/
+	/*Software Test - render cursor in software, drawn it directly on PF*/
 	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
 	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
 	igt_put_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER], cr);
-
 	igt_display_commit(display);
 	igt_wait_for_vblank(data->drm_fd, data->pipe);
 	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
+
+	/*Compare CRC from Hardware/Software tests*/
 	igt_assert_crc_equal(&crc, &ref_crc);
 
 	/*Clear Screen*/
@@ -688,13 +691,19 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
 		igt_require(data->output);
 	}
 
+        igt_describe("Create a maximum size cursor, then change the size in "\
+        "flight to smaller ones to see that the size is applied correctly.");
 	igt_subtest_f("pipe-%s-cursor-size-change", kmstest_pipe_name(pipe))
 		run_test(data, test_cursor_size,
 			 data->cursor_max_w, data->cursor_max_h);
 
+	igt_describe("Validates the composition of a fully opaque cursor "\
+	"plane, i.e., alpha channel equal to 1.0.");
 	igt_subtest_f("pipe-%s-cursor-alpha-opaque", kmstest_pipe_name(pipe))
 		run_test(data, test_cursor_opaque, data->cursor_max_w, data->cursor_max_h);
 
+	igt_describe("Validates the composition of a fully transparent cursor "\
+	"plane, i.e., alpha channel equal to 0.0.");
 	igt_subtest_f("pipe-%s-cursor-alpha-transparent", kmstest_pipe_name(pipe))
 		run_test(data, test_cursor_transparent, data->cursor_max_w, data->cursor_max_h);
 
@@ -728,15 +737,24 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
 		}
 
 		/* Using created cursor FBs to test cursor support */
+		igt_describe("Check if a given-size cursor is well-positioned inside the screen.");
 		igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen", kmstest_pipe_name(pipe), w, h)
 			run_test(data, test_crc_onscreen, w, h);
+
+		igt_describe("Check if a given-size cursor is well-positioned outside the screen.");
 		igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen", kmstest_pipe_name(pipe), w, h)
 			run_test(data, test_crc_offscreen, w, h);
+
+		igt_describe("Check the smooth and pixel-by-pixel given-size cursor movements on"\
+		"horizontal, vertical and diagonal.");
 		igt_subtest_f("pipe-%s-cursor-%dx%d-sliding", kmstest_pipe_name(pipe), w, h)
 			run_test(data, test_crc_sliding, w, h);
+
+		igt_describe("Check random placement of a cursor with given size.");
 		igt_subtest_f("pipe-%s-cursor-%dx%d-random", kmstest_pipe_name(pipe), w, h)
 			run_test(data, test_crc_random, w, h);
 
+		igt_describe("Check the rapid update of given-size cursor movements.");
 		igt_subtest_f("pipe-%s-cursor-%dx%d-rapid-movement", kmstest_pipe_name(pipe), w, h) {
 			run_test(data, test_rapid_movement, w, h);
 		}
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
