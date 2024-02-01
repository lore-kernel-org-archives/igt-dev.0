Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EC0C48286
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 20:03:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B982D10EC4B;
	Thu,  1 Feb 2024 20:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DqOjmwJt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0CB10EC4B
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 20:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706817816; x=1738353816;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L1JXT3cBb+GAxztblXQHoLnMYaBfFWg6pQovkDCMg70=;
 b=DqOjmwJtwHWFhTBu5A+DpEBxe+OiOPtMxKZCR7UrGN57R41e48ftD8QF
 fco6kqIY2c8P8iIT63yQX2cqnoZ7z4c6jYPFIezIhT+ycIx/TS+s/dClS
 3hQpy/kCHvoiCe17JaUBvbD4WGS7FiK1YyUlwl02wijJvOUoy/eiB31Lq
 PQGoVKuFo9AIWq6uUKCDJv29SiuzhlAsh+UNemunKdw9Dx0KLjsyYokLK
 YO2K5CpQaJq0LNju/lK035jZgvl222q+1S8wR3Zi24wj9uzq9GUr5h2eH
 8osXM1+7cLD1M85nJlLB5ccX9qRz45pJKlKL3HkCz5/eWt7ui8G5kaHe/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="191395"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="191395"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 12:03:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="4494216"
Received: from unknown (HELO localhost) ([10.245.85.128])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 12:03:34 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Karolina Drobnik <karolina.drobnik@intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH i-g-t v5 3/5] lib/intel_blt: Use object pitch and aligned
 height on png write
Date: Thu,  1 Feb 2024 21:03:10 +0100
Message-Id: <20240201200312.428474-4-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240201200312.428474-1-zbigniew.kempczynski@intel.com>
References: <20240201200312.428474-1-zbigniew.kempczynski@intel.com>
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

Pitch and buffer height on tiled surfaces might be bigger than
image width and height so dump memory to png using pitch size
instead width and aligned height instead height.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Karolina Drobnik <karolina.drobnik@intel.com>
Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
v4: Use original width/height in filename instead stride/aligned
    height to avoid png overwriting (Zbigniew)
---
 lib/intel_blt.c                | 13 ++++++++++---
 lib/intel_blt.h                |  2 +-
 tests/intel/gem_ccs.c          | 23 ++++++++++++-----------
 tests/intel/gem_exercise_blt.c | 16 ++++++++--------
 tests/intel/xe_ccs.c           | 23 ++++++++++++-----------
 tests/intel/xe_exercise_blt.c  | 16 ++++++++--------
 6 files changed, 51 insertions(+), 42 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 315ae86922..3c26faba2d 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -2077,21 +2077,28 @@ void blt_surface_info(const char *info, const struct blt_copy_object *obj)
  * @obj: blitter copy object (@blt_copy_object) to save to png
  * @width: width
  * @height: height
+ * @bpp: bits per pixel
  *
  * Function save surface to png file. Assumes ARGB format where A == 0xff.
  */
 void blt_surface_to_png(int fd, uint32_t run_id, const char *fileid,
 			const struct blt_copy_object *obj,
-			uint32_t width, uint32_t height)
+			uint32_t width, uint32_t height, uint32_t bpp)
 {
 	cairo_surface_t *surface;
 	cairo_status_t ret;
+	uint32_t dump_width = width, dump_height = height;
 	uint8_t *map = (uint8_t *) obj->ptr;
 	int format;
 	int stride = obj->tiling ? obj->pitch * 4 : obj->pitch;
 	char filename[FILENAME_MAX];
 	bool is_xe = is_xe_device(fd);
 
+	if (obj->tiling) {
+		dump_width = obj->pitch;
+		dump_height = blt_get_aligned_height(height, bpp, obj->tiling);
+	}
+
 	snprintf(filename, FILENAME_MAX-1, "%d-%s-%s-%ux%u-%s.png",
 		 run_id, fileid, blt_tiling_name(obj->tiling), width, height,
 		 obj->compression ? "compressed" : "uncompressed");
@@ -2104,8 +2111,8 @@ void blt_surface_to_png(int fd, uint32_t run_id, const char *fileid,
 							obj->size, PROT_READ);
 	}
 	format = CAIRO_FORMAT_RGB24;
-	surface = cairo_image_surface_create_for_data(map,
-						      format, width, height,
+	surface = cairo_image_surface_create_for_data(map, format,
+						      dump_width, dump_height,
 						      stride);
 	ret = cairo_surface_write_to_png(surface, filename);
 	if (ret)
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index e3084dc0cd..077283a088 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -315,7 +315,7 @@ void blt_surface_fill_rect(int fd, const struct blt_copy_object *obj,
 			   uint32_t width, uint32_t height);
 void blt_surface_to_png(int fd, uint32_t run_id, const char *fileid,
 			const struct blt_copy_object *obj,
-			uint32_t width, uint32_t height);
+			uint32_t width, uint32_t height, uint32_t bpp);
 void blt_dump_corruption_info_32b(const struct blt_copy_object *surf1,
 				  const struct blt_copy_object *surf2);
 
diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
index 80a29ecab7..e8f16d7d88 100644
--- a/tests/intel/gem_ccs.c
+++ b/tests/intel/gem_ccs.c
@@ -82,9 +82,9 @@ struct test_config {
 	if (param.print_surface_info) \
 		blt_surface_info((name), (obj)); } while (0)
 
-#define WRITE_PNG(fd, id, name, obj, w, h) do { \
+#define WRITE_PNG(fd, id, name, obj, w, h, bpp) do { \
 	if (param.write_png) \
-		blt_surface_to_png((fd), (id), (name), (obj), (w), (h)); } while (0)
+		blt_surface_to_png((fd), (id), (name), (obj), (w), (h), (bpp)); } while (0)
 
 static void surf_copy(int i915,
 		      const intel_ctx_t *ctx,
@@ -98,6 +98,7 @@ static void surf_copy(int i915,
 	struct blt_copy_data blt = {};
 	struct blt_block_copy_data_ext ext = {};
 	struct blt_ctrl_surf_copy_data surf = {};
+	const uint32_t bpp = 32;
 	uint32_t bb1, bb2, ccs, ccs2, *ccsmap, *ccsmap2;
 	uint64_t bb_size, ccssize = mid->size / CCS_RATIO(i915);
 	uint32_t *ccscopy;
@@ -172,7 +173,7 @@ static void surf_copy(int i915,
 	blt_set_batch(&blt.bb, bb2, bb_size, REGION_SMEM);
 	blt_block_copy(i915, ctx, e, ahnd, &blt, &ext);
 	gem_sync(i915, blt.dst.handle);
-	WRITE_PNG(i915, run_id, "corrupted", &blt.dst, dst->x2, dst->y2);
+	WRITE_PNG(i915, run_id, "corrupted", &blt.dst, dst->x2, dst->y2, bpp);
 	result = memcmp(src->ptr, dst->ptr, src->size);
 	igt_assert(result != 0);
 
@@ -182,7 +183,7 @@ static void surf_copy(int i915,
 
 	blt_block_copy(i915, ctx, e, ahnd, &blt, &ext);
 	gem_sync(i915, blt.dst.handle);
-	WRITE_PNG(i915, run_id, "corrected", &blt.dst, dst->x2, dst->y2);
+	WRITE_PNG(i915, run_id, "corrected", &blt.dst, dst->x2, dst->y2, bpp);
 	result = memcmp(src->ptr, dst->ptr, src->size);
 	if (result)
 		blt_dump_corruption_info_32b(src, dst);
@@ -346,7 +347,7 @@ static void block_copy(int i915,
 	PRINT_SURFACE_INFO("dst", dst);
 
 	blt_surface_fill_rect(i915, src, width, height);
-	WRITE_PNG(i915, run_id, "src", src, width, height);
+	WRITE_PNG(i915, run_id, "src", src, width, height, bpp);
 
 	blt.color_depth = CD_32bit;
 	blt.print_bb = param.print_bb;
@@ -363,7 +364,7 @@ static void block_copy(int i915,
 	if (mid->compression)
 		igt_assert(memcmp(src->ptr, mid->ptr, src->size) != 0);
 
-	WRITE_PNG(i915, run_id, "mid", &blt.dst, width, height);
+	WRITE_PNG(i915, run_id, "mid", &blt.dst, width, height, bpp);
 
 	if (config->surfcopy && pext) {
 		const intel_ctx_t *surf_ctx = ctx;
@@ -408,7 +409,7 @@ static void block_copy(int i915,
 	blt_set_batch(&blt.bb, bb, bb_size, region1);
 	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
 	gem_sync(i915, blt.dst.handle);
-	WRITE_PNG(i915, run_id, "dst", &blt.dst, width, height);
+	WRITE_PNG(i915, run_id, "dst", &blt.dst, width, height, bpp);
 
 	result = memcmp(src->ptr, blt.dst.ptr, src->size);
 
@@ -491,11 +492,11 @@ static void block_multicopy(int i915,
 	blt_block_copy3(i915, ctx, e, ahnd, &blt3, pext3);
 	gem_sync(i915, blt3.final.handle);
 
-	WRITE_PNG(i915, run_id, "src", &blt3.src, width, height);
+	WRITE_PNG(i915, run_id, "src", &blt3.src, width, height, bpp);
 	if (!config->inplace)
-		WRITE_PNG(i915, run_id, "mid", &blt3.mid, width, height);
-	WRITE_PNG(i915, run_id, "dst", &blt3.dst, width, height);
-	WRITE_PNG(i915, run_id, "final", &blt3.final, width, height);
+		WRITE_PNG(i915, run_id, "mid", &blt3.mid, width, height, bpp);
+	WRITE_PNG(i915, run_id, "dst", &blt3.dst, width, height, bpp);
+	WRITE_PNG(i915, run_id, "final", &blt3.final, width, height, bpp);
 
 	result = memcmp(src->ptr, blt3.final.ptr, src->size);
 
diff --git a/tests/intel/gem_exercise_blt.c b/tests/intel/gem_exercise_blt.c
index 7355eabbe9..4a9bc37298 100644
--- a/tests/intel/gem_exercise_blt.c
+++ b/tests/intel/gem_exercise_blt.c
@@ -50,9 +50,9 @@ static struct param {
 	if (param.print_surface_info) \
 		blt_surface_info((name), (obj)); } while (0)
 
-#define WRITE_PNG(fd, id, name, obj, w, h) do { \
+#define WRITE_PNG(fd, id, name, obj, w, h, bpp) do { \
 	if (param.write_png) \
-		blt_surface_to_png((fd), (id), (name), (obj), (w), (h)); } while (0)
+		blt_surface_to_png((fd), (id), (name), (obj), (w), (h), (bpp)); } while (0)
 
 struct blt_fast_copy_data {
 	int i915;
@@ -167,7 +167,7 @@ static void fast_copy_emit(int i915, const intel_ctx_t *ctx,
 	PRINT_SURFACE_INFO("dst", dst);
 
 	blt_surface_fill_rect(i915, src, width, height);
-	WRITE_PNG(i915, mid_tiling, "src", src, width, height);
+	WRITE_PNG(i915, mid_tiling, "src", src, width, height, bpp);
 
 	memset(&blt, 0, sizeof(blt));
 	blt.color_depth = CD_32bit;
@@ -180,8 +180,8 @@ static void fast_copy_emit(int i915, const intel_ctx_t *ctx,
 	fast_copy_one_bb(i915, ctx, e, ahnd, &blt);
 	gem_sync(i915, blt.dst.handle);
 
-	WRITE_PNG(i915, mid_tiling, "mid", &blt.mid, width, height);
-	WRITE_PNG(i915, mid_tiling, "dst", &blt.dst, width, height);
+	WRITE_PNG(i915, mid_tiling, "mid", &blt.mid, width, height, bpp);
+	WRITE_PNG(i915, mid_tiling, "dst", &blt.dst, width, height, bpp);
 
 	result = memcmp(src->ptr, blt.dst.ptr, src->size);
 
@@ -234,8 +234,8 @@ static void fast_copy(int i915, const intel_ctx_t *ctx,
 	blt_fast_copy(i915, ctx, e, ahnd, &blt);
 	gem_sync(i915, mid->handle);
 
-	WRITE_PNG(i915, mid_tiling, "src", &blt.src, width, height);
-	WRITE_PNG(i915, mid_tiling, "mid", &blt.dst, width, height);
+	WRITE_PNG(i915, mid_tiling, "src", &blt.src, width, height, bpp);
+	WRITE_PNG(i915, mid_tiling, "mid", &blt.dst, width, height, bpp);
 
 	blt_copy_init(i915, &blt);
 	blt.color_depth = CD_32bit;
@@ -247,7 +247,7 @@ static void fast_copy(int i915, const intel_ctx_t *ctx,
 	blt_fast_copy(i915, ctx, e, ahnd, &blt);
 	gem_sync(i915, blt.dst.handle);
 
-	WRITE_PNG(i915, mid_tiling, "dst", &blt.dst, width, height);
+	WRITE_PNG(i915, mid_tiling, "dst", &blt.dst, width, height, bpp);
 
 	result = memcmp(src->ptr, blt.dst.ptr, src->size);
 
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 7d0e8ed7a5..a7785edcb1 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -79,9 +79,9 @@ struct test_config {
 	if (param.print_surface_info) \
 		blt_surface_info((name), (obj)); } while (0)
 
-#define WRITE_PNG(fd, id, name, obj, w, h) do { \
+#define WRITE_PNG(fd, id, name, obj, w, h, bpp) do { \
 	if (param.write_png) \
-		blt_surface_to_png((fd), (id), (name), (obj), (w), (h)); } while (0)
+		blt_surface_to_png((fd), (id), (name), (obj), (w), (h), (bpp)); } while (0)
 
 static void surf_copy(int xe,
 		      intel_ctx_t *ctx,
@@ -94,6 +94,7 @@ static void surf_copy(int xe,
 	struct blt_copy_data blt = {};
 	struct blt_block_copy_data_ext ext = {};
 	struct blt_ctrl_surf_copy_data surf = {};
+	const uint32_t bpp = 32;
 	uint32_t bb1, bb2, ccs, ccs2, *ccsmap, *ccsmap2;
 	uint64_t bb_size, ccssize = mid->size / CCS_RATIO(xe);
 	uint64_t ccs_bo_size = xe_get_default_alignment(xe);
@@ -179,7 +180,7 @@ static void surf_copy(int xe,
 	blt_set_batch(&blt.bb, bb2, bb_size, sysmem);
 	blt_block_copy(xe, ctx, NULL, ahnd, &blt, &ext);
 	intel_ctx_xe_sync(ctx, true);
-	WRITE_PNG(xe, run_id, "corrupted", &blt.dst, dst->x2, dst->y2);
+	WRITE_PNG(xe, run_id, "corrupted", &blt.dst, dst->x2, dst->y2, bpp);
 	result = memcmp(src->ptr, dst->ptr, src->size);
 	igt_assert(result != 0);
 
@@ -189,7 +190,7 @@ static void surf_copy(int xe,
 
 	blt_block_copy(xe, ctx, NULL, ahnd, &blt, &ext);
 	intel_ctx_xe_sync(ctx, true);
-	WRITE_PNG(xe, run_id, "corrected", &blt.dst, dst->x2, dst->y2);
+	WRITE_PNG(xe, run_id, "corrected", &blt.dst, dst->x2, dst->y2, bpp);
 	result = memcmp(src->ptr, dst->ptr, src->size);
 	if (result)
 		blt_dump_corruption_info_32b(src, dst);
@@ -326,7 +327,7 @@ static void block_copy(int xe,
 	PRINT_SURFACE_INFO("dst", dst);
 
 	blt_surface_fill_rect(xe, src, width, height);
-	WRITE_PNG(xe, run_id, "src", src, width, height);
+	WRITE_PNG(xe, run_id, "src", src, width, height, bpp);
 
 	blt.color_depth = CD_32bit;
 	blt.print_bb = param.print_bb;
@@ -342,7 +343,7 @@ static void block_copy(int xe,
 	if (mid->compression)
 		igt_assert(memcmp(src->ptr, mid->ptr, src->size) != 0);
 
-	WRITE_PNG(xe, run_id, "mid", &blt.dst, width, height);
+	WRITE_PNG(xe, run_id, "mid", &blt.dst, width, height, bpp);
 
 	if (config->surfcopy && pext) {
 		struct drm_xe_engine_class_instance inst = {
@@ -393,7 +394,7 @@ static void block_copy(int xe,
 	blt_block_copy(xe, ctx, NULL, ahnd, &blt, pext);
 	intel_ctx_xe_sync(ctx, true);
 
-	WRITE_PNG(xe, run_id, "dst", &blt.dst, width, height);
+	WRITE_PNG(xe, run_id, "dst", &blt.dst, width, height, bpp);
 
 	result = memcmp(src->ptr, blt.dst.ptr, src->size);
 
@@ -486,11 +487,11 @@ static void block_multicopy(int xe,
 	blt_block_copy3(xe, ctx, ahnd, &blt3, pext3);
 	intel_ctx_xe_sync(ctx, true);
 
-	WRITE_PNG(xe, run_id, "src", &blt3.src, width, height);
+	WRITE_PNG(xe, run_id, "src", &blt3.src, width, height, bpp);
 	if (!config->inplace)
-		WRITE_PNG(xe, run_id, "mid", &blt3.mid, width, height);
-	WRITE_PNG(xe, run_id, "dst", &blt3.dst, width, height);
-	WRITE_PNG(xe, run_id, "final", &blt3.final, width, height);
+		WRITE_PNG(xe, run_id, "mid", &blt3.mid, width, height, bpp);
+	WRITE_PNG(xe, run_id, "dst", &blt3.dst, width, height, bpp);
+	WRITE_PNG(xe, run_id, "final", &blt3.final, width, height, bpp);
 
 	result = memcmp(src->ptr, blt3.final.ptr, src->size);
 
diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
index c908800cf4..ddf9d188a7 100644
--- a/tests/intel/xe_exercise_blt.c
+++ b/tests/intel/xe_exercise_blt.c
@@ -53,9 +53,9 @@ static struct param {
 	if (param.print_surface_info) \
 		blt_surface_info((name), (obj)); } while (0)
 
-#define WRITE_PNG(fd, id, name, obj, w, h) do { \
+#define WRITE_PNG(fd, id, name, obj, w, h, bpp) do { \
 	if (param.write_png) \
-		blt_surface_to_png((fd), (id), (name), (obj), (w), (h)); } while (0)
+		blt_surface_to_png((fd), (id), (name), (obj), (w), (h), (bpp)); } while (0)
 
 struct blt_fast_copy_data {
 	int xe;
@@ -141,7 +141,7 @@ static void fast_copy_emit(int xe, const intel_ctx_t *ctx,
 	PRINT_SURFACE_INFO("dst", dst);
 
 	blt_surface_fill_rect(xe, src, width, height);
-	WRITE_PNG(xe, mid_tiling, "src", src, width, height);
+	WRITE_PNG(xe, mid_tiling, "src", src, width, height, bpp);
 
 	memset(&blt, 0, sizeof(blt));
 	blt.color_depth = CD_32bit;
@@ -153,8 +153,8 @@ static void fast_copy_emit(int xe, const intel_ctx_t *ctx,
 
 	fast_copy_one_bb(xe, ctx, ahnd, &blt);
 
-	WRITE_PNG(xe, mid_tiling, "mid", &blt.mid, width, height);
-	WRITE_PNG(xe, mid_tiling, "dst", &blt.dst, width, height);
+	WRITE_PNG(xe, mid_tiling, "mid", &blt.mid, width, height, bpp);
+	WRITE_PNG(xe, mid_tiling, "dst", &blt.dst, width, height, bpp);
 
 	result = memcmp(src->ptr, blt.dst.ptr, src->size);
 
@@ -205,8 +205,8 @@ static void fast_copy(int xe, const intel_ctx_t *ctx,
 
 	blt_fast_copy(xe, ctx, NULL, ahnd, &blt);
 
-	WRITE_PNG(xe, mid_tiling, "src", &blt.src, width, height);
-	WRITE_PNG(xe, mid_tiling, "mid", &blt.dst, width, height);
+	WRITE_PNG(xe, mid_tiling, "src", &blt.src, width, height, bpp);
+	WRITE_PNG(xe, mid_tiling, "mid", &blt.dst, width, height, bpp);
 
 	blt_copy_init(xe, &blt);
 	blt.color_depth = CD_32bit;
@@ -217,7 +217,7 @@ static void fast_copy(int xe, const intel_ctx_t *ctx,
 
 	blt_fast_copy(xe, ctx, NULL, ahnd, &blt);
 
-	WRITE_PNG(xe, mid_tiling, "dst", &blt.dst, width, height);
+	WRITE_PNG(xe, mid_tiling, "dst", &blt.dst, width, height, bpp);
 
 	result = memcmp(src->ptr, blt.dst.ptr, src->size);
 
-- 
2.34.1

