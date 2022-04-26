Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2088.outbound.protection.outlook.com [40.107.96.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE3B10E07C
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Apr 2022 14:29:36 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 26 Apr 2022 10:29:03 -0400
Message-ID: <20220426142906.1016713-2-dingchen.zhang@amd.com>
In-Reply-To: <20220426142906.1016713-1-dingchen.zhang@amd.com>
References: <20220426142906.1016713-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v5 1/4] tests/amdgpu/amd_psr: add helper to draw
 cursor pattern
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

[why & how]
For amdgpu PSR-SU validation, we'd create and test cursor update
use case as well. To emulate a mouse-like cursor movement, we'd
define a helper to draw a cursor pattern.

- helper draw the cursor pattern as an 45-degrees rotated arrow
- for the region of arrow, set alpha to 1 to make cursor foreground
  and always on the top
- for rest of the non-arrow region, set alpha to 0 to make it as
  background

Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Jay Pillai <aurabindo.pillai@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 tests/amdgpu/amd_psr.c | 47 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index d4bfb7bb..e3a2cb4a 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -81,6 +81,53 @@ static void draw_color_alpha(igt_fb_t *fb, int x, int y, int w, int h,
 	igt_put_cairo_ctx(cr);
 }
 
+/* draw a cursor pattern assuming the FB given is square w/ FORMAT ARGB */
+static void draw_color_cursor(igt_fb_t *fb, int size, double r, double g, double b)
+{
+	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
+	int x, y, line_w;
+
+	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
+
+	/*
+	 * draw cursor
+	 * recall that alpha blending value:
+	 * - 0, output pixel is the background
+	 * - 1, output pixel is simply the foreground
+	 * - (0, 1), mix of background + foreground
+	 */
+
+	/* set cursor FB to background first */
+	igt_paint_color_alpha(cr, 0, 0, size, size, 1.0, 1.0, 1.0, .0);
+
+	/*
+	 * draw cursur pattern w/ alpha set to 1
+	 * - 1. draw triangle part
+	 * - 2. draw rectangle part
+	 */
+	for (x = y = 0, line_w = size / 2; line_w > 0; ++y, --line_w)
+		igt_paint_color_alpha(cr, x, y, line_w, 1, r, g, b, 1.0);
+
+	/*
+	 * draw rectangle part, split into three geometry parts
+	 * - triangle
+	 * - rhombus
+	 * - reversed triangle
+	 */
+	for (x = size * 3 / 8, y = size / 8, line_w = 1; y < size * 3 / 8; --x, ++y, line_w += 2)
+		igt_paint_color_alpha(cr, x, y, line_w, 1, r, g, b, 1.0);
+
+	for (x = size / 8, y = size * 3 / 8; y < size * 3 / 4; ++x, ++y)
+		igt_paint_color_alpha(cr, x, y, line_w, 1, r, g, b, 1.0);
+
+	for (; line_w > 0; ++x, ++y, line_w -= 2)
+		igt_paint_color_alpha(cr, x, y, line_w, 1, r, g, b, 1.0);
+
+	cairo_set_operator(cr, CAIRO_OPERATOR_OVER);
+
+	igt_put_cairo_ctx(cr);
+}
+
 /* Common test setup. */
 static void test_init(data_t *data)
 {
-- 
2.25.1
