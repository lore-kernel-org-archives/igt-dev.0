Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8F910E2C6
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 15:18:01 +0000 (UTC)
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 29 May 2023 17:17:54 +0200
Message-Id: <20230529151754.322440-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3] lib/intel_bb: Enable custom engine
 support for xe
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

Currently the 'ctx' field in batch buffer creation is interpreted as
a vm id for xe. In i915 it is interpreted as a context id. Since a xe
engine more closely resembles an i915 context, change the current
behaviour and interpret the 'ctx' fied as an xe engine id. This also
allows us to use the compute engine on xe, which currently is not
possible, due to reliance on legacy i915 flags.

v2:
 - don't destroy user provided engine in 'intel_bb_destroy' (Zbigniew)
 - destroy internally created engine before creating a new one
v3:
 - introduce 'vm' parameter to be able to provide probler vm_id for
   custom xe engine (Dominik, Zbigniew)

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_draw.c                  |  2 +-
 lib/intel_batchbuffer.c         | 51 ++++++++++++++++++++-------------
 lib/intel_batchbuffer.h         | 16 ++++++-----
 lib/media_fill.c                |  2 +-
 tests/i915/api_intel_bb.c       | 14 ++++-----
 tests/i915/gem_ppgtt.c          |  2 +-
 tests/i915/gem_pxp.c            | 16 +++++------
 tests/i915/kms_fence_pin_leak.c |  2 +-
 tests/i915/perf.c               | 18 ++++++------
 tests/xe/xe_intel_bb.c          | 19 ++++++------
 10 files changed, 78 insertions(+), 64 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index d719b240..a5c0cbbf 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -807,7 +807,7 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
 
 	src = create_buf(fd, cmd_data->bops, &tmp, I915_TILING_NONE);
 	dst = create_buf(fd, cmd_data->bops, buf, tiling);
-	ibb = intel_bb_create_with_context(fd, cmd_data->ctx, NULL, PAGE_SIZE);
+	ibb = intel_bb_create_with_context(fd, cmd_data->ctx, 0, NULL, PAGE_SIZE);
 
 	rendercopy(ibb, src, 0, 0, rect->w, rect->h, dst, rect->x, rect->y);
 
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index dfccc4f4..fbd73a5d 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -837,7 +837,8 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
 /**
  * __intel_bb_create:
  * @fd: drm fd - i915 or xe
- * @ctx: context id
+ * @ctx: for i915 context id, for xe engine id
+ * @vm: for xe vm_id, unused for i915
  * @cfg: for i915 intel_ctx configuration, NULL for default context or legacy mode,
  *       unused for xe
  * @size: size of the batchbuffer
@@ -883,7 +884,7 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
  * Pointer the intel_bb, asserts on failure.
  */
 static struct intel_bb *
-__intel_bb_create(int fd, uint32_t ctx, const intel_ctx_cfg_t *cfg,
+__intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 		  uint32_t size, bool do_relocs,
 		  uint64_t start, uint64_t end,
 		  uint8_t allocator_type, enum allocator_strategy strategy)
@@ -946,15 +947,17 @@ __intel_bb_create(int fd, uint32_t ctx, const intel_ctx_cfg_t *cfg,
 		ibb->gtt_size = 1ull << min_t(uint32_t, xe_va_bits(fd), 48);
 		end = ibb->gtt_size;
 
-		if (!ctx)
-			ctx = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+		if (!vm) {
+			igt_assert_f(!ctx, "No vm provided for engine");
+			vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+		}
 
 		ibb->uses_full_ppgtt = true;
 		ibb->allocator_handle =
-			intel_allocator_open_full(fd, ctx, start, end,
+			intel_allocator_open_full(fd, vm, start, end,
 						  allocator_type, strategy,
 						  ibb->alignment);
-		ibb->vm_id = ctx;
+		ibb->vm_id = vm;
 		ibb->last_engine = ~0U;
 	}
 
@@ -1001,7 +1004,8 @@ __intel_bb_create(int fd, uint32_t ctx, const intel_ctx_cfg_t *cfg,
 /**
  * intel_bb_create_full:
  * @fd: drm fd - i915 or xe
- * @ctx: context
+ * @ctx: for i915 context id, for xe engine id
+ * @vm: for xe vm_id, unused for i915
  * @cfg: intel_ctx configuration, NULL for default context or legacy mode
  * @size: size of the batchbuffer
  * @start: allocator vm start address
@@ -1019,20 +1023,21 @@ __intel_bb_create(int fd, uint32_t ctx, const intel_ctx_cfg_t *cfg,
  *
  * Pointer the intel_bb, asserts on failure.
  */
-struct intel_bb *intel_bb_create_full(int fd, uint32_t ctx,
+struct intel_bb *intel_bb_create_full(int fd, uint32_t ctx, uint32_t vm,
 				      const intel_ctx_cfg_t *cfg, uint32_t size,
 				      uint64_t start, uint64_t end,
 				      uint8_t allocator_type,
 				      enum allocator_strategy strategy)
 {
-	return __intel_bb_create(fd, ctx, cfg, size, false, start, end,
+	return __intel_bb_create(fd, ctx, vm, cfg, size, false, start, end,
 				 allocator_type, strategy);
 }
 
 /**
  * intel_bb_create_with_allocator:
  * @fd: drm fd - i915 or xe
- * @ctx: context
+ * @ctx: for i915 context id, for xe engine id
+ * @vm: for xe vm_id, unused for i915
  * @cfg: intel_ctx configuration, NULL for default context or legacy mode
  * @size: size of the batchbuffer
  * @allocator_type: allocator type, SIMPLE, RANDOM, ...
@@ -1045,12 +1050,12 @@ struct intel_bb *intel_bb_create_full(int fd, uint32_t ctx,
  *
  * Pointer the intel_bb, asserts on failure.
  */
-struct intel_bb *intel_bb_create_with_allocator(int fd, uint32_t ctx,
+struct intel_bb *intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t vm,
 						const intel_ctx_cfg_t *cfg,
 						uint32_t size,
 						uint8_t allocator_type)
 {
-	return __intel_bb_create(fd, ctx, cfg, size, false, 0, 0,
+	return __intel_bb_create(fd, ctx, vm, cfg, size, false, 0, 0,
 				 allocator_type, ALLOC_STRATEGY_HIGH_TO_LOW);
 }
 
@@ -1088,7 +1093,7 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size)
 {
 	bool relocs = is_i915_device(fd) && gem_has_relocations(fd);
 
-	return __intel_bb_create(fd, 0, NULL, size,
+	return __intel_bb_create(fd, 0, 0, NULL, size,
 				 relocs && !aux_needs_softpin(fd), 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW);
@@ -1097,7 +1102,8 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size)
 /**
  * intel_bb_create_with_context:
  * @fd: drm fd - i915 or xe
- * @ctx: context id
+ * @ctx: for i915 context id, for xe engine id
+ * @vm: for xe vm_id, unused for i915
  * @cfg: intel_ctx configuration, NULL for default context or legacy mode
  * @size: size of the batchbuffer
  *
@@ -1109,12 +1115,12 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size)
  * Pointer the intel_bb, asserts on failure.
  */
 struct intel_bb *
-intel_bb_create_with_context(int fd, uint32_t ctx,
+intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 			     const intel_ctx_cfg_t *cfg, uint32_t size)
 {
 	bool relocs = is_i915_device(fd) && gem_has_relocations(fd);
 
-	return __intel_bb_create(fd, ctx, cfg, size,
+	return __intel_bb_create(fd, ctx, vm, cfg, size,
 				 relocs && !aux_needs_softpin(fd), 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW);
@@ -1136,7 +1142,7 @@ struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size)
 {
 	igt_require(is_i915_device(fd) && gem_has_relocations(fd));
 
-	return __intel_bb_create(fd, 0, NULL, size, true, 0, 0,
+	return __intel_bb_create(fd, 0, 0, NULL, size, true, 0, 0,
 				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE);
 }
 
@@ -1161,7 +1167,7 @@ intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
 {
 	igt_require(is_i915_device(fd) && gem_has_relocations(fd));
 
-	return __intel_bb_create(fd, ctx, cfg, size, true, 0, 0,
+	return __intel_bb_create(fd, ctx, 0, cfg, size, true, 0, 0,
 				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE);
 }
 
@@ -1181,7 +1187,7 @@ struct intel_bb *intel_bb_create_no_relocs(int fd, uint32_t size)
 {
 	igt_require(gem_uses_full_ppgtt(fd));
 
-	return __intel_bb_create(fd, 0, NULL, size, false, 0, 0,
+	return __intel_bb_create(fd, 0, 0, NULL, size, false, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW);
 }
@@ -2298,7 +2304,9 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 	igt_assert_eq(ibb->num_relocs, 0);
 	igt_assert_eq(ibb->xe_bound, false);
 
-	if (ibb->last_engine != engine) {
+	if (ibb->ctx) {
+		engine_id = ibb->ctx;
+	} else if (ibb->last_engine != engine) {
 		struct drm_xe_engine_class_instance inst = { };
 
 		inst.engine_instance =
@@ -2323,6 +2331,9 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 		}
 		igt_debug("Run on %s\n", xe_engine_class_string(inst.engine_class));
 
+		if (ibb->engine_id)
+			xe_engine_destroy(ibb->fd, ibb->engine_id);
+
 		ibb->engine_id = engine_id =
 			xe_engine_create(ibb->fd, ibb->vm_id, &inst, 0);
 	} else {
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 9a58fb78..bdb3b6a6 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -305,16 +305,18 @@ struct intel_bb {
 };
 
 struct intel_bb *
-intel_bb_create_full(int fd, uint32_t ctx, const intel_ctx_cfg_t *cfg,
-		     uint32_t size, uint64_t start, uint64_t end,
-		     uint8_t allocator_type, enum allocator_strategy strategy);
+intel_bb_create_full(int fd, uint32_t ctx, uint32_t vm,
+		     const intel_ctx_cfg_t *cfg, uint32_t size, uint64_t start,
+		     uint64_t end, uint8_t allocator_type,
+		     enum allocator_strategy strategy);
 struct intel_bb *
-intel_bb_create_with_allocator(int fd, uint32_t ctx, const intel_ctx_cfg_t *cfg,
-			       uint32_t size, uint8_t allocator_type);
+intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t vm,
+			       const intel_ctx_cfg_t *cfg, uint32_t size,
+			       uint8_t allocator_type);
 struct intel_bb *intel_bb_create(int fd, uint32_t size);
 struct intel_bb *
-intel_bb_create_with_context(int fd, uint32_t ctx, const intel_ctx_cfg_t *cfg,
-			     uint32_t size);
+intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
+			     const intel_ctx_cfg_t *cfg, uint32_t size);
 struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size);
 struct intel_bb *
 intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
diff --git a/lib/media_fill.c b/lib/media_fill.c
index 4f8b50e8..e80dae15 100644
--- a/lib/media_fill.c
+++ b/lib/media_fill.c
@@ -309,7 +309,7 @@ __gen11_media_vme_func(int i915,
 	struct intel_bb *ibb;
 	uint32_t curbe_buffer, interface_descriptor;
 
-	ibb = intel_bb_create_with_context(i915, ctx, NULL, PAGE_SIZE);
+	ibb = intel_bb_create_with_context(i915, ctx, 0, NULL, PAGE_SIZE);
 	intel_bb_add_intel_buf(ibb, dst, true);
 	intel_bb_add_intel_buf(ibb, src, false);
 
diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
index 38ffd763..85ca86ee 100644
--- a/tests/i915/api_intel_bb.c
+++ b/tests/i915/api_intel_bb.c
@@ -394,7 +394,7 @@ static void simple_bb(struct buf_ops *bops, bool use_context)
 	if (use_context)
 		gem_require_contexts(i915);
 
-	ibb = intel_bb_create_with_allocator(i915, ctx, NULL, PAGE_SIZE,
+	ibb = intel_bb_create_with_allocator(i915, ctx, 0, NULL, PAGE_SIZE,
 					     INTEL_ALLOCATOR_SIMPLE);
 	if (debug_bb)
 		intel_bb_set_debug(ibb, true);
@@ -413,7 +413,7 @@ static void simple_bb(struct buf_ops *bops, bool use_context)
 	if (use_context) {
 		ctx = gem_context_create(i915);
 		intel_bb_destroy(ibb);
-		ibb = intel_bb_create_with_context(i915, ctx, NULL, PAGE_SIZE);
+		ibb = intel_bb_create_with_context(i915, ctx, 0, NULL, PAGE_SIZE);
 		intel_bb_out(ibb, MI_BATCH_BUFFER_END);
 		intel_bb_ptr_align(ibb, 8);
 		intel_bb_exec(ibb, intel_bb_offset(ibb),
@@ -434,7 +434,7 @@ static void bb_with_allocator(struct buf_ops *bops)
 
 	igt_require(gem_uses_full_ppgtt(i915));
 
-	ibb = intel_bb_create_with_allocator(i915, ctx, NULL, PAGE_SIZE,
+	ibb = intel_bb_create_with_allocator(i915, ctx, 0, NULL, PAGE_SIZE,
 					     INTEL_ALLOCATOR_SIMPLE);
 	if (debug_bb)
 		intel_bb_set_debug(ibb, true);
@@ -768,7 +768,7 @@ static void object_noreloc(struct buf_ops *bops, enum obj_cache_ops cache_op,
 
 	igt_require(gem_uses_full_ppgtt(i915));
 
-	ibb = intel_bb_create_with_allocator(i915, 0, NULL, PAGE_SIZE, allocator_type);
+	ibb = intel_bb_create_with_allocator(i915, 0, 0, NULL, PAGE_SIZE, allocator_type);
 	if (debug_bb)
 		intel_bb_set_debug(ibb, true);
 
@@ -882,7 +882,7 @@ static void blit(struct buf_ops *bops,
 	if (do_relocs) {
 		ibb = intel_bb_create_with_relocs(i915, PAGE_SIZE);
 	} else {
-		ibb = intel_bb_create_with_allocator(i915, 0, NULL, PAGE_SIZE,
+		ibb = intel_bb_create_with_allocator(i915, 0, 0, NULL, PAGE_SIZE,
 						     allocator_type);
 		flags |= I915_EXEC_NO_RELOC;
 	}
@@ -1346,7 +1346,7 @@ static void delta_check(struct buf_ops *bops)
 	uint64_t delta = gem_detect_safe_alignment(i915) + 0x1000;
 	bool supports_48bit;
 
-	ibb = intel_bb_create_with_allocator(i915, 0, NULL, PAGE_SIZE,
+	ibb = intel_bb_create_with_allocator(i915, 0, 0, NULL, PAGE_SIZE,
 					     INTEL_ALLOCATOR_SIMPLE);
 	supports_48bit = ibb->supports_48b_address;
 	if (!supports_48bit)
@@ -1466,7 +1466,7 @@ static void misplaced_blitter(struct buf_ops *bops)
 	err = __intel_ctx_create(i915, &cfg, &ctx);
 	igt_assert_eq(err, 0);
 
-	ibb = intel_bb_create_with_context(i915, ctx->id, &ctx->cfg, PAGE_SIZE);
+	ibb = intel_bb_create_with_context(i915, ctx->id, 0, &ctx->cfg, PAGE_SIZE);
 
 	/* Prepare for blitter copy, done to verify we found the blitter engine */
 	src = intel_buf_create(bops, WIDTH, HEIGHT, 32, 0, I915_TILING_NONE,
diff --git a/tests/i915/gem_ppgtt.c b/tests/i915/gem_ppgtt.c
index 6a0512ab..9dc6ccfe 100644
--- a/tests/i915/gem_ppgtt.c
+++ b/tests/i915/gem_ppgtt.c
@@ -139,7 +139,7 @@ static void fork_rcs_copy(int timeout, uint32_t final,
 			ctx = gem_context_create(buf_ops_get_fd(dst[child]->bops));
 
 		ibb = intel_bb_create_with_context(buf_ops_get_fd(dst[child]->bops),
-						   ctx, NULL, 4096);
+						   ctx, 0, NULL, 4096);
 		i = 0;
 		igt_until_timeout(timeout) {
 			src = create_bo(dst[child]->bops,
diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 7668834d..167877d3 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -541,7 +541,7 @@ static void test_render_baseline(int i915)
 	/* Perform a regular 3d copy as a control checkpoint */
 	ret = create_ctx_with_params(i915, false, false, false, false, &ctx);
 	igt_assert_eq(ret, 0);
-	ibb = intel_bb_create_with_context(i915, ctx, NULL, 4096);
+	ibb = intel_bb_create_with_context(i915, ctx, 0, NULL, 4096);
 	igt_assert(ibb);
 
 	dstbo = alloc_and_fill_dest_buff(i915, false, TSTSURF_SIZE, TSTSURF_INITCOLOR1);
@@ -590,7 +590,7 @@ static void __test_render_pxp_src_to_protdest(int i915, uint32_t *outpixels, int
 	ret = create_ctx_with_params(i915, true, true, true, false, &ctx);
 	igt_assert_eq(ret, 0);
 	igt_assert_eq(get_ctx_protected_param(i915, ctx), 1);
-	ibb = intel_bb_create_with_context(i915, ctx, NULL, 4096);
+	ibb = intel_bb_create_with_context(i915, ctx, 0, NULL, 4096);
 	igt_assert(ibb);
 	intel_bb_set_pxp(ibb, true, DISPLAY_APPTYPE, I915_PROTECTED_CONTENT_DEFAULT_SESSION);
 
@@ -651,7 +651,7 @@ static void test_render_pxp_protsrc_to_protdest(int i915)
 	ret = create_ctx_with_params(i915, true, true, true, false, &ctx);
 	igt_assert_eq(ret, 0);
 	igt_assert_eq(get_ctx_protected_param(i915, ctx), 1);
-	ibb = intel_bb_create_with_context(i915, ctx, NULL, 4096);
+	ibb = intel_bb_create_with_context(i915, ctx, 0, NULL, 4096);
 	igt_assert(ibb);
 	intel_bb_set_pxp(ibb, true, DISPLAY_APPTYPE, I915_PROTECTED_CONTENT_DEFAULT_SESSION);
 
@@ -743,7 +743,7 @@ static void test_pxp_dmabuffshare_refcnt(int i915)
 		ret = create_ctx_with_params(fd[n], true, true, true, false, &ctx[n]);
 		igt_assert_eq(ret, 0);
 		igt_assert_eq(get_ctx_protected_param(fd[n], ctx[n]), 1);
-		ibb[n] = intel_bb_create_with_context(fd[n], ctx[n], NULL, 4096);
+		ibb[n] = intel_bb_create_with_context(fd[n], ctx[n], 0, NULL, 4096);
 		intel_bb_set_pxp(ibb[n], true, DISPLAY_APPTYPE,
 				 I915_PROTECTED_CONTENT_DEFAULT_SESSION);
 
@@ -905,7 +905,7 @@ static void prepare_exec_assets(int i915, struct simple_exec_assets *data, bool
 		ret = create_ctx_with_params(i915, false, false, false, false, &(data->ctx));
 	igt_assert_eq(ret, 0);
 	igt_assert_eq(get_ctx_protected_param(i915, data->ctx), ctx_pxp);
-	data->ibb = intel_bb_create_with_context(i915, data->ctx, NULL, 4096);
+	data->ibb = intel_bb_create_with_context(i915, data->ctx, 0, NULL, 4096);
 	igt_assert(data->ibb);
 
 	data->fencebo = alloc_and_fill_dest_buff(i915, buf_pxp, 4096, 0);
@@ -993,7 +993,7 @@ static void test_pxp_stale_buf_execution(int i915)
 	ret = create_ctx_with_params(i915, true, true, true, false, &ctx2);
 	igt_assert_eq(ret, 0);
 	igt_assert_eq(get_ctx_protected_param(i915, ctx2), 1);
-	ibb2 = intel_bb_create_with_context(i915, ctx2, NULL, 4096);
+	ibb2 = intel_bb_create_with_context(i915, ctx2, 0, NULL, 4096);
 	igt_assert(ibb2);
 	intel_bb_remove_intel_buf(data.ibb, data.fencebuf);
 	intel_bb_add_intel_buf(ibb2, data.fencebuf, true);
@@ -1094,7 +1094,7 @@ static void test_pxp_pwrcycle_staleasset_execution(int i915, struct powermgt_dat
 	ret = create_ctx_with_params(i915, true, true, true, false, &ctx2);
 	igt_assert_eq(ret, 0);
 	igt_assert_eq(get_ctx_protected_param(i915, ctx2), 1);
-	ibb2 = intel_bb_create_with_context(i915, ctx2, NULL, 4096);
+	ibb2 = intel_bb_create_with_context(i915, ctx2, 0, NULL, 4096);
 	igt_assert(ibb2);
 	intel_bb_remove_intel_buf(data[1].ibb, data[1].fencebuf);
 	intel_bb_add_intel_buf(ibb2, data[1].fencebuf, true);
@@ -1154,7 +1154,7 @@ static void setup_protected_fb(int i915, int width, int height, igt_fb_t *fb, ui
 					       fb->plane_bpp[0], 0,
 					       igt_fb_mod_to_tiling(fb->modifier), 0);
 
-	ibb = intel_bb_create_with_context(i915, ctx, NULL, 4096);
+	ibb = intel_bb_create_with_context(i915, ctx, 0, NULL, 4096);
 	igt_assert(ibb);
 
 	ibb->pxp.enabled = true;
diff --git a/tests/i915/kms_fence_pin_leak.c b/tests/i915/kms_fence_pin_leak.c
index 63657a74..127c01c1 100644
--- a/tests/i915/kms_fence_pin_leak.c
+++ b/tests/i915/kms_fence_pin_leak.c
@@ -62,7 +62,7 @@ static void exec_nop(data_t *data, struct igt_fb *fb, uint32_t ctx)
 	intel_buf_set_ownership(dst, true);
 
 	ibb = intel_bb_create_with_context(buf_ops_get_fd(data->bops),
-					   ctx, NULL, 4096);
+					   ctx, 0, NULL, 4096);
 
 	/* add the reloc to make sure the kernel will think we write to dst */
 	intel_bb_add_intel_buf(ibb, dst, true);
diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 9b1518d1..069ab8c0 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -2071,7 +2071,7 @@ static void load_helper_init(void)
 	lh.context_id = gem_context_create(drm_fd);
 	igt_assert_neq(lh.context_id, 0xffffffff);
 
-	lh.ibb = intel_bb_create_with_context(drm_fd, lh.context_id, NULL, BATCH_SZ);
+	lh.ibb = intel_bb_create_with_context(drm_fd, lh.context_id, 0, NULL, BATCH_SZ);
 
 	scratch_buf_init(lh.bops, &lh.dst, 1920, 1080, 0);
 	scratch_buf_init(lh.bops, &lh.src, 1920, 1080, 0);
@@ -3574,7 +3574,7 @@ gen12_test_mi_rpc(const struct intel_execution_engine2 *e)
 	igt_assert_neq(ctx_id, INVALID_CTX_ID);
 	properties[1] = ctx_id;
 
-	ibb = intel_bb_create_with_context(drm_fd, ctx_id, NULL, BATCH_SZ);
+	ibb = intel_bb_create_with_context(drm_fd, ctx_id, 0, NULL, BATCH_SZ);
 	buf = intel_buf_create(bops, 4096, 1, 8, 64,
 			       I915_TILING_NONE, I915_COMPRESSION_NONE);
 
@@ -3653,7 +3653,7 @@ test_mi_rpc(void)
 
 	ctx_id = gem_context_create(drm_fd);
 
-	ibb = intel_bb_create_with_context(drm_fd, ctx_id, NULL, BATCH_SZ);
+	ibb = intel_bb_create_with_context(drm_fd, ctx_id, 0, NULL, BATCH_SZ);
 	buf = intel_buf_create(bops, 4096, 1, 8, 64,
 			       I915_TILING_NONE, I915_COMPRESSION_NONE);
 
@@ -3780,8 +3780,8 @@ hsw_test_single_ctx_counters(void)
 		 */
 		context0_id = gem_context_create(drm_fd);
 		context1_id = gem_context_create(drm_fd);
-		ibb0 = intel_bb_create_with_context(drm_fd, context0_id, NULL, BATCH_SZ);
-		ibb1 = intel_bb_create_with_context(drm_fd, context1_id, NULL, BATCH_SZ);
+		ibb0 = intel_bb_create_with_context(drm_fd, context0_id, 0, NULL, BATCH_SZ);
+		ibb1 = intel_bb_create_with_context(drm_fd, context1_id, 0, NULL, BATCH_SZ);
 
 		igt_debug("submitting warm up render_copy\n");
 
@@ -4024,8 +4024,8 @@ gen8_test_single_ctx_render_target_writes_a_counter(void)
 
 			context0_id = gem_context_create(drm_fd);
 			context1_id = gem_context_create(drm_fd);
-			ibb0 = intel_bb_create_with_context(drm_fd, context0_id, NULL, BATCH_SZ);
-			ibb1 = intel_bb_create_with_context(drm_fd, context1_id, NULL, BATCH_SZ);
+			ibb0 = intel_bb_create_with_context(drm_fd, context0_id, 0, NULL, BATCH_SZ);
+			ibb1 = intel_bb_create_with_context(drm_fd, context1_id, 0, NULL, BATCH_SZ);
 
 			igt_debug("submitting warm up render_copy\n");
 
@@ -4435,8 +4435,8 @@ static void gen12_single_ctx_helper(const struct intel_execution_engine2 *e)
 
 	context0_id = gem_context_create(drm_fd);
 	context1_id = gem_context_create(drm_fd);
-	ibb0 = intel_bb_create_with_context(drm_fd, context0_id, NULL, BATCH_SZ);
-	ibb1 = intel_bb_create_with_context(drm_fd, context1_id, NULL, BATCH_SZ);
+	ibb0 = intel_bb_create_with_context(drm_fd, context0_id, 0, NULL, BATCH_SZ);
+	ibb1 = intel_bb_create_with_context(drm_fd, context1_id, 0, NULL, BATCH_SZ);
 
 	igt_debug("submitting warm up render_copy\n");
 
diff --git a/tests/xe/xe_intel_bb.c b/tests/xe/xe_intel_bb.c
index 4cdc0434..755cc530 100644
--- a/tests/xe/xe_intel_bb.c
+++ b/tests/xe/xe_intel_bb.c
@@ -176,9 +176,9 @@ static void simple_bb(struct buf_ops *bops, bool new_context)
 {
 	int xe = buf_ops_get_fd(bops);
 	struct intel_bb *ibb;
-	uint32_t ctx = 0;
+	uint32_t ctx = 0, vm = 0;
 
-	ibb = intel_bb_create_with_allocator(xe, ctx, NULL, PAGE_SIZE,
+	ibb = intel_bb_create_with_allocator(xe, 0, 0, NULL, PAGE_SIZE,
 					     INTEL_ALLOCATOR_SIMPLE);
 	if (debug_bb)
 		intel_bb_set_debug(ibb, true);
@@ -195,15 +195,17 @@ static void simple_bb(struct buf_ops *bops, bool new_context)
 	intel_bb_reset(ibb, true);
 
 	if (new_context) {
-		ctx = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+		vm = xe_vm_create(xe, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
+		ctx = xe_engine_create(xe, vm, xe_hw_engine(xe, 0), 0);
 		intel_bb_destroy(ibb);
-		ibb = intel_bb_create_with_context(xe, ctx, NULL, PAGE_SIZE);
+		ibb = intel_bb_create_with_context(xe, ctx, vm, NULL, PAGE_SIZE);
 		intel_bb_out(ibb, MI_BATCH_BUFFER_END);
 		intel_bb_ptr_align(ibb, 8);
 		intel_bb_exec(ibb, intel_bb_offset(ibb),
 			      I915_EXEC_DEFAULT | I915_EXEC_NO_RELOC,
 			      true);
-		xe_vm_destroy(xe, ctx);
+		xe_engine_destroy(xe, ctx);
+		xe_vm_destroy(xe, vm);
 	}
 
 	intel_bb_destroy(ibb);
@@ -220,9 +222,8 @@ static void bb_with_allocator(struct buf_ops *bops)
 	int xe = buf_ops_get_fd(bops);
 	struct intel_bb *ibb;
 	struct intel_buf *src, *dst;
-	uint32_t ctx = 0;
 
-	ibb = intel_bb_create_with_allocator(xe, ctx, NULL, PAGE_SIZE,
+	ibb = intel_bb_create_with_allocator(xe, 0, 0, NULL, PAGE_SIZE,
 					     INTEL_ALLOCATOR_SIMPLE);
 	if (debug_bb)
 		intel_bb_set_debug(ibb, true);
@@ -455,7 +456,7 @@ static void blit(struct buf_ops *bops, uint8_t allocator_type)
 	uint64_t poff_src, poff_dst;
 	uint64_t flags = 0;
 
-	ibb = intel_bb_create_with_allocator(xe, 0, NULL, PAGE_SIZE,
+	ibb = intel_bb_create_with_allocator(xe, 0, 0, NULL, PAGE_SIZE,
 					     allocator_type);
 	flags |= I915_EXEC_NO_RELOC;
 
@@ -892,7 +893,7 @@ static void delta_check(struct buf_ops *bops)
 	uint64_t obj_offset = (1ULL << 32) - xe_get_default_alignment(xe);
 	uint64_t delta = xe_get_default_alignment(xe) + 0x1000;
 
-	ibb = intel_bb_create_with_allocator(xe, 0, NULL, PAGE_SIZE,
+	ibb = intel_bb_create_with_allocator(xe, 0, 0, NULL, PAGE_SIZE,
 					     INTEL_ALLOCATOR_SIMPLE);
 	if (debug_bb)
 		intel_bb_set_debug(ibb, true);
-- 
2.40.1
