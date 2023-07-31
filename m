Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E0710E1C9
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Jul 2023 08:14:39 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 31 Jul 2023 13:48:40 +0530
Message-Id: <20230731081841.1139659-2-kunal1.joshi@intel.com>
In-Reply-To: <20230731081841.1139659-1-kunal1.joshi@intel.com>
References: <20230731081841.1139659-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_fb: add intel_blt for blitter
 path on xe
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add intel_btl functions for xe driver on blitter path in igt_fb.c.
This enables tiled framebuffers on xe driver.

v2: Addressed minor changes (Zbigniew)
    Added s-o-b (Kamil) and CC

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_fb.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 69 insertions(+), 7 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 17738d7f1..7d1337303 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2763,8 +2763,12 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
 
 	blt->plane_offset = fb->offsets[plane];
 
-	blt->ptr = gem_mmap__device_coherent(fb->fd, handle, 0, fb->size,
-					     PROT_READ | PROT_WRITE);
+	if (is_xe_device(fb->fd))
+		blt->ptr = xe_bo_mmap_ext(fb->fd, handle, fb->size,
+					  PROT_READ | PROT_WRITE);
+	else
+		blt->ptr = gem_mmap__device_coherent(fb->fd, handle, 0, fb->size,
+						     PROT_READ | PROT_WRITE);
 	return blt;
 }
 
@@ -2838,16 +2842,23 @@ static void blitcopy(const struct igt_fb *dst_fb,
 	uint64_t ahnd = 0;
 	const intel_ctx_t *ictx = NULL;
 	struct intel_execution_engine2 *e;
-	uint32_t bb;
+	uint32_t bb, xe_bb;
 	uint64_t bb_size = 4096;
 	struct blt_copy_data blt = {};
 	struct blt_copy_object *src, *dst;
 	struct blt_block_copy_data_ext ext = {}, *pext = NULL;
-	uint32_t mem_region = HAS_FLATCCS(intel_get_drm_devid(src_fb->fd))
-			   ? REGION_LMEM(0) : REGION_SMEM;
+	uint32_t mem_region;
 	/* To ignore CC plane */
 	uint32_t src_cc = src_fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ? 1 : 0;
 	uint32_t dst_cc = dst_fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ? 1 : 0;
+	intel_ctx_t *xe_ctx;
+	uint32_t vm, engine;
+	bool is_xe = is_xe_device(dst_fb->fd);
+	bool is_i915 = is_i915_device(dst_fb->fd);
+
+	struct drm_xe_engine_class_instance inst = {
+		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+	};
 
 	igt_assert_eq(dst_fb->fd, src_fb->fd);
 	igt_assert_eq(dst_fb->num_planes - dst_cc, src_fb->num_planes - src_cc);
@@ -2855,8 +2866,11 @@ static void blitcopy(const struct igt_fb *dst_fb,
 	src_tiling = igt_fb_mod_to_tiling(src_fb->modifier);
 	dst_tiling = igt_fb_mod_to_tiling(dst_fb->modifier);
 
-	if (is_i915_device(dst_fb->fd) && !gem_has_relocations(dst_fb->fd)) {
+	if (is_i915 && !gem_has_relocations(dst_fb->fd)) {
 		igt_require(gem_has_contexts(dst_fb->fd));
+		mem_region = HAS_FLATCCS(intel_get_drm_devid(src_fb->fd))
+			? REGION_LMEM(0) : REGION_SMEM;
+
 		ictx = intel_ctx_create_all_physical(src_fb->fd);
 		ctx = gem_context_create(dst_fb->fd);
 		ahnd = get_reloc_ahnd(dst_fb->fd, ctx);
@@ -2865,6 +2879,19 @@ static void blitcopy(const struct igt_fb *dst_fb,
 							  &bb,
 							  &bb_size,
 							  mem_region) == 0);
+	} else if (is_xe) {
+		vm = xe_vm_create(dst_fb->fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+		engine = xe_engine_create(dst_fb->fd, vm, &inst, 0);
+		xe_ctx = intel_ctx_xe(dst_fb->fd, vm, engine, 0, 0, 0);
+		mem_region = vram_if_possible(dst_fb->fd, 0);
+
+		ahnd = intel_allocator_open_full(dst_fb->fd, xe_ctx->vm, 0, 0,
+						 INTEL_ALLOCATOR_SIMPLE,
+						 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+
+		bb_size = ALIGN(bb_size + xe_cs_prefetch_size(dst_fb->fd),
+				xe_get_default_alignment(dst_fb->fd));
+		xe_bb = xe_bo_create_flags(dst_fb->fd, 0, bb_size, mem_region);
 	}
 
 	for (int i = 0; i < dst_fb->num_planes - dst_cc; i++) {
@@ -2872,7 +2899,34 @@ static void blitcopy(const struct igt_fb *dst_fb,
 		igt_assert_eq(dst_fb->plane_width[i], src_fb->plane_width[i]);
 		igt_assert_eq(dst_fb->plane_height[i], src_fb->plane_height[i]);
 
-		if (fast_blit_ok(src_fb) && fast_blit_ok(dst_fb)) {
+		if (is_xe) {
+			src = blt_fb_init(src_fb, i, mem_region);
+			dst = blt_fb_init(dst_fb, i, mem_region);
+
+			blt_copy_init(src_fb->fd, &blt);
+			blt.color_depth = blt_get_bpp(src_fb);
+			blt_set_copy_object(&blt.src, src);
+			blt_set_copy_object(&blt.dst, dst);
+
+			blt_set_object_ext(&ext.src,
+					   blt_compression_format(&blt, src_fb),
+					   src_fb->width, src_fb->height,
+					   SURFACE_TYPE_2D);
+
+			blt_set_object_ext(&ext.dst,
+					   blt_compression_format(&blt, dst_fb),
+					   dst_fb->width, dst_fb->height,
+					   SURFACE_TYPE_2D);
+
+			pext = &ext;
+
+			blt_set_batch(&blt.bb, xe_bb, bb_size, mem_region);
+
+			blt_block_copy(src_fb->fd, xe_ctx, NULL, ahnd, &blt, pext);
+
+			blt_destroy_object(src_fb->fd, src);
+			blt_destroy_object(dst_fb->fd, dst);
+		} else if (fast_blit_ok(src_fb) && fast_blit_ok(dst_fb)) {
 			igt_blitter_fast_copy__raw(dst_fb->fd,
 						   ahnd, ctx, NULL,
 						   src_fb->gem_handle,
@@ -2950,6 +3004,14 @@ static void blitcopy(const struct igt_fb *dst_fb,
 	if (ctx)
 		gem_context_destroy(dst_fb->fd, ctx);
 	put_ahnd(ahnd);
+
+	if(is_xe) {
+		gem_close(dst_fb->fd, xe_bb);
+		xe_engine_destroy(dst_fb->fd, engine);
+		xe_vm_destroy(dst_fb->fd, vm);
+		free(xe_ctx);
+	}
+
 	intel_ctx_destroy(src_fb->fd, ictx);
 }
 
-- 
2.25.1
