Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866ADC5478C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 14:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4131D10E9F6;
	Wed, 28 Feb 2024 14:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dYsQewbP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA8610E9F6
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 14:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709132078; x=1740668078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QA6t++tGe0wjmMOKE4giEquHGTD51fIF8L8xWbhh6xk=;
 b=dYsQewbPIr4mm0ImYPDrHZzorwn4wyItFaZTAtpuVAwZFGhjRBEIMbb/
 Z1q4P0/r5L0uSKIv9yG812SJlgMvJKYAwd6KRuRDUd5y5D/0EGQ5xO7JS
 vDAIJUUnhi1zpxubXeKcbz73llktmksTfUGi1rnPsd0paFZHTCNECf7fd
 1uvHDdvd0frd2J4lQghq3KpyojGsHr5O3FWlxeclZqN8JJNsM5E9mvh97
 57sm467f4NSDXYz0GeNuckmtnEyEKdZWsEqYKnJBk10pW3bRP4m4mEHi8
 ABZBlbdzfPBix9EUYtttFYMtlBqTR3Smjf+98ZrkhXQLKdHqEB/4xFaXo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14952549"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="14952549"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:54:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="12121211"
Received: from wbosek-mobl.ger.corp.intel.com (HELO localhost) ([10.245.80.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:54:37 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t 5/7] lib/intel_bufops: Use common helper to fill buffer
 with pattern
Date: Wed, 28 Feb 2024 15:54:05 +0100
Message-Id: <20240228145407.370325-6-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
References: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Filling pattern is now common in different tests so extract it
to bufops dropping duplicates in few places.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 lib/intel_bufops.c            | 74 ++++++++++++++++++++++++++----
 lib/intel_bufops.h            |  4 ++
 tests/intel/api_intel_bb.c    | 84 ++++-------------------------------
 tests/intel/gem_render_copy.c | 68 +++-------------------------
 tests/intel/xe_intel_bb.c     | 78 +++-----------------------------
 5 files changed, 90 insertions(+), 218 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index ca026f7956..67254ec107 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -1338,6 +1338,71 @@ void intel_buf_write_aux_to_png(struct intel_buf *buf, const char *filename)
 	__intel_buf_write_to_png(buf->bops, buf, filename, true);
 }
 
+static void *alloc_aligned(uint64_t size)
+{
+	void *p;
+
+	igt_assert_eq(posix_memalign(&p, 16, size), 0);
+
+	return p;
+}
+
+void intel_buf_draw_pattern(struct buf_ops *bops, struct intel_buf *buf,
+			    int x, int y, int w, int h,
+			    int cx, int cy, int cw, int ch,
+			    bool use_alternate_colors)
+{
+	cairo_surface_t *surface;
+	cairo_pattern_t *pat;
+	cairo_t *cr;
+	void *linear;
+
+	linear = alloc_aligned(buf->surface[0].size);
+
+	surface = cairo_image_surface_create_for_data(linear,
+						      CAIRO_FORMAT_RGB24,
+						      intel_buf_width(buf),
+						      intel_buf_height(buf),
+						      buf->surface[0].stride);
+
+	cr = cairo_create(surface);
+
+	cairo_rectangle(cr, cx, cy, cw, ch);
+	cairo_clip(cr);
+
+	pat = cairo_pattern_create_mesh();
+	cairo_mesh_pattern_begin_patch(pat);
+	cairo_mesh_pattern_move_to(pat, x,   y);
+	cairo_mesh_pattern_line_to(pat, x+w, y);
+	cairo_mesh_pattern_line_to(pat, x+w, y+h);
+	cairo_mesh_pattern_line_to(pat, x,   y+h);
+	if (use_alternate_colors) {
+		cairo_mesh_pattern_set_corner_color_rgb(pat, 0, 0.0, 1.0, 1.0);
+		cairo_mesh_pattern_set_corner_color_rgb(pat, 1, 1.0, 0.0, 1.0);
+		cairo_mesh_pattern_set_corner_color_rgb(pat, 2, 1.0, 1.0, 0.0);
+		cairo_mesh_pattern_set_corner_color_rgb(pat, 3, 0.0, 0.0, 0.0);
+	} else {
+		cairo_mesh_pattern_set_corner_color_rgb(pat, 0, 1.0, 0.0, 0.0);
+		cairo_mesh_pattern_set_corner_color_rgb(pat, 1, 0.0, 1.0, 0.0);
+		cairo_mesh_pattern_set_corner_color_rgb(pat, 2, 0.0, 0.0, 1.0);
+		cairo_mesh_pattern_set_corner_color_rgb(pat, 3, 1.0, 1.0, 1.0);
+	}
+	cairo_mesh_pattern_end_patch(pat);
+
+	cairo_rectangle(cr, x, y, w, h);
+	cairo_set_source(cr, pat);
+	cairo_fill(cr);
+	cairo_pattern_destroy(pat);
+
+	cairo_destroy(cr);
+
+	cairo_surface_destroy(surface);
+
+	linear_to_intel_buf(bops, buf, linear);
+
+	free(linear);
+}
+
 #define DEFAULT_BUFOPS(__gen_start, __gen_end) \
 	.gen_start          = __gen_start, \
 	.gen_end            = __gen_end, \
@@ -1408,15 +1473,6 @@ end:
 	return is_set;
 }
 
-static void *alloc_aligned(uint64_t size)
-{
-	void *p;
-
-	igt_assert_eq(posix_memalign(&p, 16, size), 0);
-
-	return p;
-}
-
 /*
  * Simple idempotency test between HW -> SW and SW -> HW BO.
  */
diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index cd0aebdab1..75e0ec2c44 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -221,6 +221,10 @@ const char *intel_buf_set_name(struct intel_buf *buf, const char *name);
 
 void intel_buf_write_to_png(struct intel_buf *buf, const char *filename);
 void intel_buf_write_aux_to_png(struct intel_buf *buf, const char *filename);
+void intel_buf_draw_pattern(struct buf_ops *bops, struct intel_buf *buf,
+			    int x, int y, int w, int h,
+			    int cx, int cy, int cw, int ch,
+			    bool use_alternate_colors);
 
 static inline enum intel_buf_mocs intel_buf_get_mocs(const struct intel_buf *buf)
 {
diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
index 59ed244f05..8a210f2ab7 100644
--- a/tests/intel/api_intel_bb.c
+++ b/tests/intel/api_intel_bb.c
@@ -279,15 +279,6 @@ static bool buf_info = false;
 static bool print_base64 = false;
 static int crc_n = 19;
 
-static void *alloc_aligned(uint64_t size)
-{
-	void *p;
-
-	igt_assert_eq(posix_memalign(&p, 16, size), 0);
-
-	return p;
-}
-
 static void fill_buf(struct intel_buf *buf, uint8_t color)
 {
 	uint8_t *ptr;
@@ -1005,63 +996,6 @@ static void scratch_buf_init(struct buf_ops *bops,
 	igt_assert(intel_buf_height(buf) == height);
 }
 
-static void scratch_buf_draw_pattern(struct buf_ops *bops,
-				     struct intel_buf *buf,
-				     int x, int y, int w, int h,
-				     int cx, int cy, int cw, int ch,
-				     bool use_alternate_colors)
-{
-	cairo_surface_t *surface;
-	cairo_pattern_t *pat;
-	cairo_t *cr;
-	void *linear;
-
-	linear = alloc_aligned(buf->surface[0].size);
-
-	surface = cairo_image_surface_create_for_data(linear,
-						      CAIRO_FORMAT_RGB24,
-						      intel_buf_width(buf),
-						      intel_buf_height(buf),
-						      buf->surface[0].stride);
-
-	cr = cairo_create(surface);
-
-	cairo_rectangle(cr, cx, cy, cw, ch);
-	cairo_clip(cr);
-
-	pat = cairo_pattern_create_mesh();
-	cairo_mesh_pattern_begin_patch(pat);
-	cairo_mesh_pattern_move_to(pat, x,   y);
-	cairo_mesh_pattern_line_to(pat, x+w, y);
-	cairo_mesh_pattern_line_to(pat, x+w, y+h);
-	cairo_mesh_pattern_line_to(pat, x,   y+h);
-	if (use_alternate_colors) {
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 0, 0.0, 1.0, 1.0);
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 1, 1.0, 0.0, 1.0);
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 2, 1.0, 1.0, 0.0);
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 3, 0.0, 0.0, 0.0);
-	} else {
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 0, 1.0, 0.0, 0.0);
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 1, 0.0, 1.0, 0.0);
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 2, 0.0, 0.0, 1.0);
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 3, 1.0, 1.0, 1.0);
-	}
-	cairo_mesh_pattern_end_patch(pat);
-
-	cairo_rectangle(cr, x, y, w, h);
-	cairo_set_source(cr, pat);
-	cairo_fill(cr);
-	cairo_pattern_destroy(pat);
-
-	cairo_destroy(cr);
-
-	cairo_surface_destroy(surface);
-
-	linear_to_intel_buf(bops, buf, linear);
-
-	free(linear);
-}
-
 #define GROUP_SIZE 4096
 static int compare_detail(const uint32_t *ptr1, uint32_t *ptr2,
 			  uint32_t size)
@@ -1192,9 +1126,9 @@ static int __do_intel_bb_blit(struct buf_ops *bops, uint32_t tiling)
 		intel_buf_print(&dst);
 	}
 
-	scratch_buf_draw_pattern(bops, &src,
-				 0, 0, width, height,
-				 0, 0, width, height, 0);
+	intel_buf_draw_pattern(bops, &src,
+			       0, 0, width, height,
+			       0, 0, width, height, 0);
 
 	intel_bb_blt_copy(ibb,
 			  &src, 0, 0, src.surface[0].stride,
@@ -1534,9 +1468,9 @@ static int render(struct buf_ops *bops, uint32_t tiling, bool do_reloc,
 	scratch_buf_init(bops, &final, width, height, I915_TILING_NONE,
 			 I915_COMPRESSION_NONE);
 
-	scratch_buf_draw_pattern(bops, &src,
-				 0, 0, width, height,
-				 0, 0, width, height, 0);
+	intel_buf_draw_pattern(bops, &src,
+			       0, 0, width, height,
+			       0, 0, width, height, 0);
 
 	render_copy = igt_get_render_copyfunc(devid);
 	igt_assert(render_copy);
@@ -1640,9 +1574,9 @@ static void render_ccs(struct buf_ops *bops)
 	render_copy = igt_get_render_copyfunc(devid);
 	igt_assert(render_copy);
 
-	scratch_buf_draw_pattern(bops, &src,
-				 0, 0, width, height,
-				 0, 0, width, height, 0);
+	intel_buf_draw_pattern(bops, &src,
+			       0, 0, width, height,
+			       0, 0, width, height, 0);
 
 	render_copy(ibb,
 		    &src,
diff --git a/tests/intel/gem_render_copy.c b/tests/intel/gem_render_copy.c
index 406c309152..57ca2c9ec1 100644
--- a/tests/intel/gem_render_copy.c
+++ b/tests/intel/gem_render_copy.c
@@ -237,62 +237,6 @@ static void *linear_copy_ccs(data_t *data, struct intel_buf *buf)
 	return ccs_data;
 }
 
-static void scratch_buf_draw_pattern(data_t *data, struct intel_buf *buf,
-				     int x, int y, int w, int h,
-				     int cx, int cy, int cw, int ch,
-				     bool use_alternate_colors)
-{
-	cairo_surface_t *surface;
-	cairo_pattern_t *pat;
-	cairo_t *cr;
-	void *linear;
-
-	linear = alloc_aligned(buf->surface[0].size);
-
-	surface = cairo_image_surface_create_for_data(linear,
-						      CAIRO_FORMAT_RGB24,
-						      intel_buf_width(buf),
-						      intel_buf_height(buf),
-						      buf->surface[0].stride);
-
-	cr = cairo_create(surface);
-
-	cairo_rectangle(cr, cx, cy, cw, ch);
-	cairo_clip(cr);
-
-	pat = cairo_pattern_create_mesh();
-	cairo_mesh_pattern_begin_patch(pat);
-	cairo_mesh_pattern_move_to(pat, x,   y);
-	cairo_mesh_pattern_line_to(pat, x+w, y);
-	cairo_mesh_pattern_line_to(pat, x+w, y+h);
-	cairo_mesh_pattern_line_to(pat, x,   y+h);
-	if (use_alternate_colors) {
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 0, 0.0, 1.0, 1.0);
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 1, 1.0, 0.0, 1.0);
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 2, 1.0, 1.0, 0.0);
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 3, 0.0, 0.0, 0.0);
-	} else {
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 0, 1.0, 0.0, 0.0);
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 1, 0.0, 1.0, 0.0);
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 2, 0.0, 0.0, 1.0);
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 3, 1.0, 1.0, 1.0);
-	}
-	cairo_mesh_pattern_end_patch(pat);
-
-	cairo_rectangle(cr, x, y, w, h);
-	cairo_set_source(cr, pat);
-	cairo_fill(cr);
-	cairo_pattern_destroy(pat);
-
-	cairo_destroy(cr);
-
-	cairo_surface_destroy(surface);
-
-	linear_to_intel_buf(data->bops, buf, linear);
-
-	free(linear);
-}
-
 static void
 scratch_buf_copy(data_t *data,
 		 struct intel_buf *src, int sx, int sy, int w, int h,
@@ -541,13 +485,13 @@ static void test(data_t *data, uint32_t src_tiling, uint32_t dst_tiling,
 			 I915_COMPRESSION_NONE, region);
 
 	for (int i = 0; i < num_src; i++)
-		scratch_buf_draw_pattern(data, &src[i].buf,
-					 0, 0, WIDTH, HEIGHT,
-					 0, 0, WIDTH, HEIGHT, (i % 2));
+		intel_buf_draw_pattern(data->bops, &src[i].buf,
+				       0, 0, WIDTH, HEIGHT,
+				       0, 0, WIDTH, HEIGHT, (i % 2));
 
-	scratch_buf_draw_pattern(data, &dst,
-				 0, 0, WIDTH, HEIGHT,
-				 0, 0, WIDTH, HEIGHT, false);
+	intel_buf_draw_pattern(data->bops, &dst,
+			       0, 0, WIDTH, HEIGHT,
+			       0, 0, WIDTH, HEIGHT, false);
 
 	scratch_buf_copy(data,
 			 &dst, 0, 0, WIDTH, HEIGHT,
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index 161f766a05..ef12715dea 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -50,15 +50,6 @@ static bool write_png;
 static bool buf_info;
 static bool print_base64;
 
-static void *alloc_aligned(uint64_t size)
-{
-	void *p;
-
-	igt_assert_eq(posix_memalign(&p, 16, size), 0);
-
-	return p;
-}
-
 static void fill_buf(struct intel_buf *buf, uint8_t color)
 {
 	uint8_t *ptr;
@@ -521,63 +512,6 @@ static void scratch_buf_init(struct buf_ops *bops,
 	igt_assert(intel_buf_height(buf) == height);
 }
 
-static void scratch_buf_draw_pattern(struct buf_ops *bops,
-				     struct intel_buf *buf,
-				     int x, int y, int w, int h,
-				     int cx, int cy, int cw, int ch,
-				     bool use_alternate_colors)
-{
-	cairo_surface_t *surface;
-	cairo_pattern_t *pat;
-	cairo_t *cr;
-	void *linear;
-
-	linear = alloc_aligned(buf->surface[0].size);
-
-	surface = cairo_image_surface_create_for_data(linear,
-						      CAIRO_FORMAT_RGB24,
-						      intel_buf_width(buf),
-						      intel_buf_height(buf),
-						      buf->surface[0].stride);
-
-	cr = cairo_create(surface);
-
-	cairo_rectangle(cr, cx, cy, cw, ch);
-	cairo_clip(cr);
-
-	pat = cairo_pattern_create_mesh();
-	cairo_mesh_pattern_begin_patch(pat);
-	cairo_mesh_pattern_move_to(pat, x,   y);
-	cairo_mesh_pattern_line_to(pat, x+w, y);
-	cairo_mesh_pattern_line_to(pat, x+w, y+h);
-	cairo_mesh_pattern_line_to(pat, x,   y+h);
-	if (use_alternate_colors) {
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 0, 0.0, 1.0, 1.0);
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 1, 1.0, 0.0, 1.0);
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 2, 1.0, 1.0, 0.0);
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 3, 0.0, 0.0, 0.0);
-	} else {
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 0, 1.0, 0.0, 0.0);
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 1, 0.0, 1.0, 0.0);
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 2, 0.0, 0.0, 1.0);
-		cairo_mesh_pattern_set_corner_color_rgb(pat, 3, 1.0, 1.0, 1.0);
-	}
-	cairo_mesh_pattern_end_patch(pat);
-
-	cairo_rectangle(cr, x, y, w, h);
-	cairo_set_source(cr, pat);
-	cairo_fill(cr);
-	cairo_pattern_destroy(pat);
-
-	cairo_destroy(cr);
-
-	cairo_surface_destroy(surface);
-
-	linear_to_intel_buf(bops, buf, linear);
-
-	free(linear);
-}
-
 #define GROUP_SIZE 4096
 static int compare_detail(const uint32_t *ptr1, uint32_t *ptr2,
 			  uint32_t size)
@@ -704,9 +638,9 @@ static int __do_intel_bb_blit(struct buf_ops *bops, uint32_t tiling)
 		intel_buf_print(&dst);
 	}
 
-	scratch_buf_draw_pattern(bops, &src,
-				 0, 0, width, height,
-				 0, 0, width, height, 0);
+	intel_buf_draw_pattern(bops, &src,
+			       0, 0, width, height,
+			       0, 0, width, height, 0);
 
 	intel_bb_blt_copy(ibb,
 			  &src, 0, 0, src.surface[0].stride,
@@ -954,9 +888,9 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 	scratch_buf_init(bops, &final, width, height, I915_TILING_NONE,
 			 I915_COMPRESSION_NONE);
 
-	scratch_buf_draw_pattern(bops, &src,
-				 0, 0, width, height,
-				 0, 0, width, height, 0);
+	intel_buf_draw_pattern(bops, &src,
+			       0, 0, width, height,
+			       0, 0, width, height, 0);
 
 	render_copy = igt_get_render_copyfunc(devid);
 	igt_assert(render_copy);
-- 
2.34.1

