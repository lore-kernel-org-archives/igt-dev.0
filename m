Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8408D10EC52
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jan 2022 06:52:44 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 25 Jan 2022 07:52:30 +0100
Message-Id: <20220125065231.16986-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220125065231.16986-1-zbigniew.kempczynski@intel.com>
References: <20220125065231.16986-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] lib/intel_bufops: Add tile/linear
 argument during dumping to png
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Dumping to png is useful feature, especially when surface must be
inspected. intel_buf_write_to_png() does detiling automatically what
sometimes is problematic, especially when we need to take a look to
surface manually in tiled form.

Lets add an argument which will allow to select in which form (tiled /
linear) we want to  write to png file.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/intel_bufops.c           | 28 ++++++++++++++++++----------
 lib/intel_bufops.h           |  3 ++-
 tests/i915/api_intel_bb.c    | 20 ++++++++++----------
 tests/i915/gem_render_copy.c | 16 +++++++++-------
 4 files changed, 39 insertions(+), 28 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index e8160c823..c0ffd9f3a 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -1133,15 +1133,21 @@ const char *intel_buf_set_name(struct intel_buf *buf, const char *name)
 static void __intel_buf_write_to_png(struct buf_ops *bops,
 				     struct intel_buf *buf,
 				     const char *filename,
-				     bool write_ccs)
+				     bool write_ccs,
+				     bool dump_tiled)
 {
 	cairo_surface_t *surface;
 	cairo_status_t ret;
-	void *linear;
+	void *map;
 	int format, width, height, stride, offset;
 	int gen = bops->intel_gen;
 
-	igt_assert_eq(posix_memalign(&linear, 16, intel_buf_size(buf)), 0);
+	if (!dump_tiled) {
+		igt_assert_eq(posix_memalign(&map, 16, intel_buf_size(buf)), 0);
+		intel_buf_to_linear(bops, buf, map);
+	} else {
+		map = intel_buf_device_map(buf, false);
+	}
 
 	format = write_ccs ? CAIRO_FORMAT_A8 : CAIRO_FORMAT_RGB24;
 	width = write_ccs ? intel_buf_ccs_width(gen, buf) : intel_buf_width(buf);
@@ -1149,28 +1155,30 @@ static void __intel_buf_write_to_png(struct buf_ops *bops,
 	stride = write_ccs ? buf->ccs[0].stride : buf->surface[0].stride;
 	offset = write_ccs ? buf->ccs[0].offset : 0;
 
-	intel_buf_to_linear(bops, buf, linear);
-
-	surface = cairo_image_surface_create_for_data((uint8_t *) linear + offset,
+	surface = cairo_image_surface_create_for_data((uint8_t *) map + offset,
 						      format, width, height,
 						      stride);
 	ret = cairo_surface_write_to_png(surface, filename);
 	igt_assert(ret == CAIRO_STATUS_SUCCESS);
 	cairo_surface_destroy(surface);
 
-	free(linear);
+	if (!dump_tiled)
+		free(map);
+	else
+		intel_buf_unmap(buf);
 }
 
-void intel_buf_write_to_png(struct intel_buf *buf, const char *filename)
+void intel_buf_write_to_png(struct intel_buf *buf, const char *filename,
+			    bool dump_tiled)
 {
-	__intel_buf_write_to_png(buf->bops, buf, filename, false);
+	__intel_buf_write_to_png(buf->bops, buf, filename, false, dump_tiled);
 }
 
 void intel_buf_write_aux_to_png(struct intel_buf *buf, const char *filename)
 {
 	igt_assert(buf->compression);
 
-	__intel_buf_write_to_png(buf->bops, buf, filename, true);
+	__intel_buf_write_to_png(buf->bops, buf, filename, true, false);
 }
 
 #define DEFAULT_BUFOPS(__gen_start, __gen_end) \
diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index 25b430739..21432a1a2 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -187,7 +187,8 @@ void intel_buf_print(const struct intel_buf *buf);
 void intel_buf_dump(const struct intel_buf *buf, const char *filename);
 const char *intel_buf_set_name(struct intel_buf *buf, const char *name);
 
-void intel_buf_write_to_png(struct intel_buf *buf, const char *filename);
+void intel_buf_write_to_png(struct intel_buf *buf, const char *filename,
+			    bool dump_tiled);
 void intel_buf_write_aux_to_png(struct intel_buf *buf, const char *filename);
 
 #endif
diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
index 5c996f644..b46908e8c 100644
--- a/tests/i915/api_intel_bb.c
+++ b/tests/i915/api_intel_bb.c
@@ -1002,9 +1002,9 @@ static int __do_intel_bb_blit(struct buf_ops *bops, uint32_t tiling)
 	if (write_png) {
 		snprintf(name, sizeof(name) - 1,
 			 "bb_blit_dst_tiling_%d.png", tiling);
-		intel_buf_write_to_png(&src, "bb_blit_src_tiling_none.png");
-		intel_buf_write_to_png(&dst, name);
-		intel_buf_write_to_png(&final, "bb_blit_final_tiling_none.png");
+		intel_buf_write_to_png(&src, "bb_blit_src_tiling_none.png", false);
+		intel_buf_write_to_png(&dst, name, false);
+		intel_buf_write_to_png(&final, "bb_blit_final_tiling_none.png", false);
 	}
 
 	/* We'll fail on src <-> final compare so just warn */
@@ -1263,9 +1263,9 @@ static int render(struct buf_ops *bops, uint32_t tiling, bool do_reloc,
 	if (write_png) {
 		snprintf(name, sizeof(name) - 1,
 			 "render_dst_tiling_%d.png", tiling);
-		intel_buf_write_to_png(&src, "render_src_tiling_none.png");
-		intel_buf_write_to_png(&dst, name);
-		intel_buf_write_to_png(&final, "render_final_tiling_none.png");
+		intel_buf_write_to_png(&src, "render_src_tiling_none.png", false);
+		intel_buf_write_to_png(&dst, name, false);
+		intel_buf_write_to_png(&final, "render_final_tiling_none.png", false);
 	}
 
 	/* We'll fail on src <-> final compare so just warn */
@@ -1376,12 +1376,12 @@ static void render_ccs(struct buf_ops *bops)
 	igt_debug("fails: %u, compressed: %u\n", fails, compressed);
 
 	if (write_png) {
-		intel_buf_write_to_png(&src, "render-ccs-src.png");
-		intel_buf_write_to_png(&dst, "render-ccs-dst.png");
-		intel_buf_write_to_png(&dst2, "render-ccs-dst2.png");
+		intel_buf_write_to_png(&src, "render-ccs-src.png", false);
+		intel_buf_write_to_png(&dst, "render-ccs-dst.png", false);
+		intel_buf_write_to_png(&dst2, "render-ccs-dst2.png", false);
 		intel_buf_write_aux_to_png(&dst, "render-ccs-dst-aux.png");
 		intel_buf_write_aux_to_png(&dst2, "render-ccs-dst2-aux.png");
-		intel_buf_write_to_png(&final, "render-ccs-final.png");
+		intel_buf_write_to_png(&final, "render-ccs-final.png", false);
 	}
 
 	intel_buf_close(bops, &src);
diff --git a/tests/i915/gem_render_copy.c b/tests/i915/gem_render_copy.c
index d485e3415..3a40a2b1f 100644
--- a/tests/i915/gem_render_copy.c
+++ b/tests/i915/gem_render_copy.c
@@ -443,12 +443,12 @@ static void test(data_t *data, uint32_t src_tiling, uint32_t dst_tiling,
 	if (opt_dump_png) {
 		for (int i = 0; i < num_src; i++)
 			intel_buf_write_to_png(&src[i].buf,
-					       make_filename(src[i].filename));
+					       make_filename(src[i].filename), false);
 		if (!src_mixed_tiled)
 			intel_buf_write_to_png(&src_tiled,
-					       make_filename("source-tiled.png"));
-		intel_buf_write_to_png(&dst, make_filename("destination.png"));
-		intel_buf_write_to_png(&ref, make_filename("reference.png"));
+					       make_filename("source-tiled.png"), false);
+		intel_buf_write_to_png(&dst, make_filename("destination.png"), false);
+		intel_buf_write_to_png(&ref, make_filename("reference.png"), false);
 	}
 
 	/* This will copy the src to the mid point of the dst buffer. Presumably
@@ -539,16 +539,18 @@ static void test(data_t *data, uint32_t src_tiling, uint32_t dst_tiling,
 	}
 
 	if (opt_dump_png){
-		intel_buf_write_to_png(&dst, make_filename("result.png"));
+		intel_buf_write_to_png(&dst, make_filename("result.png"), false);
 		if (src_compressed) {
 			intel_buf_write_to_png(&src_ccs,
-					       make_filename("compressed-src.png"));
+					       make_filename("compressed-src.png"),
+					       false);
 			intel_buf_write_aux_to_png(&src_ccs,
 						   "compressed-src-ccs.png");
 		}
 		if (dst_compressed) {
 			intel_buf_write_to_png(&dst_ccs,
-					       make_filename("compressed-dst.png"));
+					       make_filename("compressed-dst.png"),
+					       false);
 			intel_buf_write_aux_to_png(&dst_ccs,
 						   "compressed-dst-ccs.png");
 		}
-- 
2.32.0
