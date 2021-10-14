Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCBE6E1D6
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Oct 2021 17:39:45 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id r19so29215821lfe.10
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Oct 2021 10:39:45 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Thu, 14 Oct 2021 20:39:33 +0300
Message-Id: <20211014173934.12375-3-juhapekka.heikkila@gmail.com>
In-Reply-To: <20211014173934.12375-1-juhapekka.heikkila@gmail.com>
References: <20211014173934.12375-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/kms_cursor_crc: take alpha into
 use when draw cursor
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
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

Draw with alpha information included.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_cursor_crc.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 0648a8601..5d0fc513c 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -72,6 +72,7 @@ typedef struct {
 	cairo_surface_t *surface;
 	uint32_t devid;
 	bool hwimageistestimage;
+	double alpha;
 } data_t;
 
 #define TEST_DPMS (1<<0)
@@ -89,7 +90,7 @@ typedef struct {
 	int height;
 } cursorarea;
 
-static void draw_cursor(cairo_t *cr, cursorarea *cursor)
+static void draw_cursor(cairo_t *cr, cursorarea *cursor, double alpha)
 {
 	int wl, wr, ht, hb;
 
@@ -104,13 +105,13 @@ static void draw_cursor(cairo_t *cr, cursorarea *cursor)
 	    (cursor->y < SHRT_MIN) || (cursor->y > SHRT_MAX))
 		return;
 
-	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
+	cairo_set_operator(cr, CAIRO_OPERATOR_OVER);
 	cairo_set_antialias(cr, CAIRO_ANTIALIAS_NONE);
 	/* 4 color rectangles in the corners, RGBY */
-	igt_paint_color(cr, cursor->x, cursor->y, wl, ht, RED);
-	igt_paint_color(cr, cursor->x + wl, cursor->y, wr, ht, GREEN);
-	igt_paint_color(cr, cursor->x, cursor->y + ht, wl, hb, BLUE);
-	igt_paint_color(cr, cursor->x + wl, cursor->y + ht, wr, hb, WHITE);
+	igt_paint_color_alpha(cr, cursor->x, cursor->y, wl, ht, RED, alpha);
+	igt_paint_color_alpha(cr, cursor->x + wl, cursor->y, wr, ht, GREEN, alpha);
+	igt_paint_color_alpha(cr, cursor->x, cursor->y + ht, wl, hb, BLUE, alpha);
+	igt_paint_color_alpha(cr, cursor->x + wl, cursor->y + ht, wr, hb, WHITE, alpha);
 }
 
 static void cursor_enable(data_t *data)
@@ -173,7 +174,7 @@ static void restore_image(data_t *data, uint32_t buffer, cursorarea *cursor)
 	cairo_fill(cr);
 
 	if (cursor)
-		draw_cursor(cr, cursor);
+		draw_cursor(cr, cursor, data->alpha);
 
 	igt_put_cairo_ctx(cr);
 }
@@ -549,7 +550,7 @@ static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
 	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb);
 	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
 	igt_paint_color_alpha(cr, 0, 0, cur_w, cur_h, 0.0, 0.0, 0.0, 0.0);
-	draw_cursor(cr, &((cursorarea){0, 0, cur_w, cur_h}));
+	draw_cursor(cr, &((cursorarea){0, 0, cur_w, cur_h}), data->alpha);
 	igt_put_cairo_ctx(cr);
 }
 
@@ -828,6 +829,7 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
 		data->output = igt_get_single_output_for_pipe(&data->display, pipe);
 		igt_require(data->output);
 		data->hwimageistestimage = false;
+		data->alpha = 1.0;
 	}
 
 	igt_describe("Create a maximum size cursor, then change the size in "
-- 
2.28.0
