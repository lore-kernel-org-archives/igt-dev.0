Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937D310E7E5
 for <igt-dev@lists.freedesktop.org>; Fri, 20 May 2022 20:36:01 +0000 (UTC)
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 May 2022 17:35:30 -0300
Message-Id: <20220520203531.14394-2-andrealmeid@igalia.com>
In-Reply-To: <20220520203531.14394-1-andrealmeid@igalia.com>
References: <20220520203531.14394-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/2] lib/igt_fb: Add support for drawing
 rectangles with random colors
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, kernel-dev@igalia.com, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add support for drawing rectangles with random colors, useful for tests
that you don't mind which color will be used.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
---

Changes from v1:
- Fix function comment typo

 lib/igt_fb.c | 20 ++++++++++++++++++++
 lib/igt_fb.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index eafbe7fd..5c4648fe 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -1465,6 +1465,26 @@ void igt_paint_color(cairo_t *cr, int x, int y, int w, int h,
 	cairo_fill(cr);
 }
 
+/**
+ * igt_paint_color_rand:
+ * @cr: cairo drawing context
+ * @x: pixel x-coordination of the fill rectangle
+ * @y: pixel y-coordination of the fill rectangle
+ * @w: width of the fill rectangle
+ * @h: height of the fill rectangle
+ *
+ * This functions draws a solid rectangle with random colors using the drawing
+ * context @cr.
+ */
+void igt_paint_color_rand(cairo_t *cr, int x, int y, int w, int h)
+{
+	double r = rand() / (double)RAND_MAX;
+	double g = rand() / (double)RAND_MAX;
+	double b = rand() / (double)RAND_MAX;
+
+	igt_paint_color(cr, x, y, w, h, r, g, b);
+}
+
 /**
  *
  * igt_fill_cts_color_square_framebuffer:
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 623a8caa..b3f096fe 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -191,6 +191,7 @@ cairo_t *igt_get_cairo_ctx(int fd, struct igt_fb *fb);
 void igt_put_cairo_ctx(cairo_t *cr);
 void igt_paint_color(cairo_t *cr, int x, int y, int w, int h,
 			 double r, double g, double b);
+void igt_paint_color_rand(cairo_t *cr, int x, int y, int w, int h);
 void igt_paint_color_alpha(cairo_t *cr, int x, int y, int w, int h,
 			       double r, double g, double b, double a);
 void igt_paint_color_gradient(cairo_t *cr, int x, int y, int w, int h,
-- 
2.36.0
