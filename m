Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8A4C47258
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jan 2024 13:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7EE310E24D;
	Wed, 31 Jan 2024 13:26:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF5610E24D
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2024 13:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706707576; x=1738243576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PJ9iZ9t3rkSY9fiiR6u3M7jwuhrEkQGJ8TwxZ7Oyfbg=;
 b=kEG6lQJbW9dv4ByQL7wqBgF370op/d8Mtan3FIJi0rPtHuUN0d+8QjRr
 Nj5vZfhtdXcVb7SdicDwLGjkZkHJcAFed5lvYU8tahRamUpNRWk8R67rP
 eJzmo/ouV6wV2kjNeizcixCPlo3Z7oOjK1Vqi1KQHptPP26mZfsFAPMEV
 ROP5JT2JXNIfuuuOyzCe7xa+pwXRlXTJUPxnYupk7dm2eLk9sHJvcpqlc
 wddVD/jVeY3YLXxHgfQf6e5kufVNAWBl4sNSVFgVskQ/W35Heiu1W6j25
 1i2Cyq4w/AdX0Az/gbOxk3OrH//KX4Thoxi9yd7Xaae69X+g+PPdrJ3yy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="25075087"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="25075087"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 05:26:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="4093594"
Received: from mmackowi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.246.18.126])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 05:26:14 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 3/4] lib/intel_blt: Use object pitch and aligned
 height on png write
Date: Wed, 31 Jan 2024 14:25:57 +0100
Message-Id: <20240131132558.208971-4-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240131132558.208971-1-zbigniew.kempczynski@intel.com>
References: <20240131132558.208971-1-zbigniew.kempczynski@intel.com>
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
Cc: Karolina Drobnik <karolina.drobnik@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Pitch and buffer height on tiled surfaces might be bigger than
image width and height so dump memory to png using pitch size
instead width and aligned height instead height.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Karolina Drobnik <karolina.drobnik@intel.com>
---
 lib/intel_blt.c                |  8 +++++++-
 lib/intel_blt.h                |  2 +-
 tests/intel/gem_ccs.c          | 23 ++++++++++++-----------
 tests/intel/gem_exercise_blt.c | 16 ++++++++--------
 tests/intel/xe_ccs.c           | 23 ++++++++++++-----------
 tests/intel/xe_exercise_blt.c  | 16 ++++++++--------
 6 files changed, 48 insertions(+), 40 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 2076cb56c4..5ed98293f9 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -2075,12 +2075,13 @@ void blt_surface_info(const char *info, const struct blt_copy_object *obj)
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
@@ -2090,6 +2091,11 @@ void blt_surface_to_png(int fd, uint32_t run_id, const char *fileid,
 	char filename[FILENAME_MAX];
 	bool is_xe = is_xe_device(fd);
 
+	if (obj->tiling) {
+		width = obj->pitch;
+		height = blt_get_aligned_height(height, bpp, obj->tiling);
+	}
+
 	snprintf(filename, FILENAME_MAX-1, "%d-%s-%s-%ux%u-%s.png",
 		 run_id, fileid, blt_tiling_name(obj->tiling), width, height,
 		 obj->compression ? "compressed" : "uncompressed");
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index d9be22fdf4..59382f8f71 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -311,7 +311,7 @@ void blt_surface_fill_rect(int fd, const struct blt_copy_object *obj,
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

