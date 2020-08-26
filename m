Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76736E10A
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2020 11:17:42 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x7so1418736wro.3
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2020 04:17:42 -0700 (PDT)
Date: Wed, 26 Aug 2020 08:17:33 -0300
From: Melissa Wen <melissa.srw@gmail.com>
Message-ID: <20200826111733.v5dvx7oraip5va6d@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: refactoring
 cursor-alpha subtests
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
Cc: Petri Latvala <petri.latvala@intel.com>, kernel-usp@googlegroups.com, twoerner@gmail.com
List-ID: <igt-dev@lists.freedesktop.org>

Considering just a fully opaque or fully transparent cursor is not enough
to check the composition of an ARGB cursor plane. For example, the cairo
ARGB32 format uses pre-multiplied alpha, and this representation may only
be evident when testing a translucent cursor.

Therefore, this patch refactors the cursor-alpha-opaque and
cursor-alpha-transparent subtests into just one subtest (cursor-alpha)
that checks the alpha blending of a white cursor, with different alpha
values, in the primary plane. This refactoring also generates some setup
stuffs savings.

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 tests/kms_cursor_crc.c | 82 ++++++++++++++++++++----------------------
 1 file changed, 39 insertions(+), 43 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index e9491847..e200b0b5 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -478,65 +478,66 @@ static void prepare_crtc(data_t *data, igt_output_t *output,
 	igt_pipe_crc_start(data->pipe_crc);
 }
 
-static void test_cursor_alpha(data_t *data, double a)
+static void test_cursor_alpha(data_t *data)
 {
 	igt_display_t *display = &data->display;
 	igt_pipe_crc_t *pipe_crc = data->pipe_crc;
-	igt_crc_t crc, ref_crc;
+	igt_crc_t crc[5], ref_crc;
 	cairo_t *cr;
 	uint32_t fb_id;
 	int curw = data->curw;
 	int curh = data->curh;
+	int i;
+	double alpha;
 
-	/* Alpha cursor fb with white color */
+	/* Alpha cursor fb */
 	fb_id = igt_create_fb(data->drm_fd, curw, curh,
 				    DRM_FORMAT_ARGB8888,
 				    LOCAL_DRM_FORMAT_MOD_NONE,
 				    &data->fb);
 	igt_assert(fb_id);
+
+	/* 
+	 * Hardware Test
+	 * With the cursor enabled, get the PF CRCs from the composition with a
+	 * white cursor with different alpha values.
+	 */
 	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb);
-	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
-	igt_put_cairo_ctx(cr);
+	cairo_set_operator (cr, CAIRO_OPERATOR_SOURCE);
 
-	/* Hardware Test - enable cursor and get PF CRC */
 	cursor_enable(data);
-	igt_display_commit(display);
-	igt_wait_for_vblank(data->drm_fd,
-			display->pipes[data->pipe].crtc_offset);
-	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
+	for (i = 0, alpha = 1.0; alpha >= 0.0; alpha -= 0.25, i++) {
+		igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, alpha);
+
+		igt_display_commit(display);
+		igt_wait_for_vblank(data->drm_fd,
+				    display->pipes[data->pipe].crtc_offset);
+		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc[i]);
+	}
+	igt_put_cairo_ctx(cr);
 
 	cursor_disable(data);
 	igt_remove_fb(data->drm_fd, &data->fb);
 
-	/* Software Test - render cursor in software, drawn it directly on PF */
+	/* Software Test - render cursor in software, drawn it directly on PF*/
 	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
-	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
-	igt_put_cairo_ctx(cr);
 
-	igt_display_commit(display);
-	igt_wait_for_vblank(data->drm_fd,
-			display->pipes[data->pipe].crtc_offset);
-	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
+	for (i = 0, alpha = 1.0; alpha >= 0.0; alpha -= 0.25, i++) {
+		igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, alpha);
 
-	/* Compare CRC from Hardware/Software tests */
-	igt_assert_crc_equal(&crc, &ref_crc);
-
-	/*Clear Screen*/
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
-	igt_paint_color(cr, 0, 0, data->screenw, data->screenh,
-			0.0, 0.0, 0.0);
-	igt_put_cairo_ctx(cr);
-}
-
-static void test_cursor_transparent(data_t *data)
-{
-	test_cursor_alpha(data, 0.0);
+		igt_display_commit(display);
+		igt_wait_for_vblank(data->drm_fd,
+				display->pipes[data->pipe].crtc_offset);
+		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
 
-}
+		/* Compare CRC from Hardware/Software tests */
+		igt_assert_crc_equal(&crc[i], &ref_crc);
 
-static void test_cursor_opaque(data_t *data)
-{
-	test_cursor_alpha(data, 1.0);
+		/*Clear Screen*/
+		igt_paint_color(cr, 0, 0, data->screenw, data->screenh,
+				0.0, 0.0, 0.0);
+	}
+	igt_put_cairo_ctx(cr);
 }
 
 static void run_test(data_t *data, void (*testfunc)(data_t *), int cursor_w, int cursor_h)
@@ -705,15 +706,10 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
 		run_test(data, test_cursor_size,
 			 data->cursor_max_w, data->cursor_max_h);
 
-	igt_describe("Validates the composition of a fully opaque cursor "
-		     "plane, i.e., alpha channel equal to 1.0.");
-	igt_subtest_f("pipe-%s-cursor-alpha-opaque", kmstest_pipe_name(pipe))
-		run_test(data, test_cursor_opaque, data->cursor_max_w, data->cursor_max_h);
-
-	igt_describe("Validates the composition of a fully transparent cursor "
-		     "plane, i.e., alpha channel equal to 0.0.");
-	igt_subtest_f("pipe-%s-cursor-alpha-transparent", kmstest_pipe_name(pipe))
-		run_test(data, test_cursor_transparent, data->cursor_max_w, data->cursor_max_h);
+	igt_describe("Validates the composition of alpha cursor plane "
+		     "from fully opaque to fully transparent alpha range");
+	igt_subtest_f("pipe-%s-cursor-alpha", kmstest_pipe_name(pipe))
+		run_test(data, test_cursor_alpha, data->cursor_max_w, data->cursor_max_h);
 
 	igt_fixture
 		create_cursor_fb(data, data->cursor_max_w, data->cursor_max_h);
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
