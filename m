Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E4610EBE5
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 20:04:14 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 27 Apr 2023 22:02:58 +0200
Message-Id: <20230427200307.240349-8-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230427200307.240349-1-zbigniew.kempczynski@intel.com>
References: <20230427200307.240349-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 07/16] lib/intel_batchbuffer: Rename i915
 -> fd as preparation step for xe
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

Until now intel-bb was designed to handle i915 (relocations and
softpinning). We want to reuse it also for xe as softpinning
which requires allocator also unblocks this for vm_bind used
in xe.

This is preparation step which stops using i915 as internal fd
to avoid confusion.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/gpu_cmds.c           |   2 +-
 lib/intel_aux_pgtable.c  |   2 +-
 lib/intel_batchbuffer.c  | 116 +++++++++++++++++++--------------------
 lib/intel_batchbuffer.h  |  16 +++---
 tests/i915/gem_caching.c |   4 +-
 tests/i915/gem_pxp.c     |   2 +-
 6 files changed, 71 insertions(+), 71 deletions(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index cee81555d8..afb26d2990 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -251,7 +251,7 @@ gen7_fill_binding_table(struct intel_bb *ibb,
 {
 	uint32_t binding_table_offset;
 	uint32_t *binding_table;
-	uint32_t devid = intel_get_drm_devid(ibb->i915);
+	uint32_t devid = intel_get_drm_devid(ibb->fd);
 
 	intel_bb_ptr_align(ibb, 64);
 	binding_table_offset = intel_bb_offset(ibb);
diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
index 5205687080..946ca60b97 100644
--- a/lib/intel_aux_pgtable.c
+++ b/lib/intel_aux_pgtable.c
@@ -481,7 +481,7 @@ intel_aux_pgtable_create(struct intel_bb *ibb,
 	intel_bb_add_intel_buf_with_alignment(ibb, pgt->buf,
 					      pgt->max_align, false);
 
-	pgt_map(ibb->i915, pgt);
+	pgt_map(ibb->fd, pgt);
 	pgt_populate_entries(pgt, bufs, buf_count);
 	pgt_unmap(pgt);
 
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index a4eb4c2bbc..7dbd6dd582 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -828,7 +828,7 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
 
 /**
  * __intel_bb_create:
- * @i915: drm fd
+ * @fd: drm fd
  * @ctx: context id
  * @cfg: intel_ctx configuration, NULL for default context or legacy mode
  * @size: size of the batchbuffer
@@ -873,7 +873,7 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
  * Pointer the intel_bb, asserts on failure.
  */
 static struct intel_bb *
-__intel_bb_create(int i915, uint32_t ctx, const intel_ctx_cfg_t *cfg,
+__intel_bb_create(int fd, uint32_t ctx, const intel_ctx_cfg_t *cfg,
 		  uint32_t size, bool do_relocs,
 		  uint64_t start, uint64_t end,
 		  uint8_t allocator_type, enum allocator_strategy strategy)
@@ -883,8 +883,8 @@ __intel_bb_create(int i915, uint32_t ctx, const intel_ctx_cfg_t *cfg,
 
 	igt_assert(ibb);
 
-	ibb->uses_full_ppgtt = gem_uses_full_ppgtt(i915);
-	ibb->devid = intel_get_drm_devid(i915);
+	ibb->uses_full_ppgtt = gem_uses_full_ppgtt(fd);
+	ibb->devid = intel_get_drm_devid(fd);
 	ibb->gen = intel_gen(ibb->devid);
 
 	/*
@@ -900,16 +900,16 @@ __intel_bb_create(int i915, uint32_t ctx, const intel_ctx_cfg_t *cfg,
 	 * so we want kernel to not interfere with this.
 	 */
 	if (do_relocs)
-		ibb->allows_obj_alignment = gem_allows_obj_alignment(i915);
+		ibb->allows_obj_alignment = gem_allows_obj_alignment(fd);
 
 	/* Use safe start offset instead assuming 0x0 is safe */
-	start = max_t(uint64_t, start, gem_detect_safe_start_offset(i915));
+	start = max_t(uint64_t, start, gem_detect_safe_start_offset(fd));
 
 	/* if relocs are set we won't use an allocator */
 	if (do_relocs)
 		allocator_type = INTEL_ALLOCATOR_NONE;
 	else
-		ibb->allocator_handle = intel_allocator_open_full(i915, ctx,
+		ibb->allocator_handle = intel_allocator_open_full(fd, ctx,
 								  start, end,
 								  allocator_type,
 								  strategy, 0);
@@ -918,11 +918,11 @@ __intel_bb_create(int i915, uint32_t ctx, const intel_ctx_cfg_t *cfg,
 	ibb->allocator_start = start;
 	ibb->allocator_end = end;
 
-	ibb->i915 = i915;
+	ibb->fd = fd;
 	ibb->enforce_relocs = do_relocs;
-	ibb->handle = gem_create(i915, size);
+	ibb->handle = gem_create(fd, size);
 	ibb->size = size;
-	ibb->alignment = gem_detect_safe_alignment(i915);
+	ibb->alignment = gem_detect_safe_alignment(fd);
 	ibb->ctx = ctx;
 	ibb->vm_id = 0;
 	ibb->batch = calloc(1, size);
@@ -937,7 +937,7 @@ __intel_bb_create(int i915, uint32_t ctx, const intel_ctx_cfg_t *cfg,
 		memcpy(ibb->cfg, cfg, sizeof(*cfg));
 	}
 
-	ibb->gtt_size = gem_aperture_size(i915);
+	ibb->gtt_size = gem_aperture_size(fd);
 	if ((ibb->gtt_size - 1) >> 32)
 		ibb->supports_48b_address = true;
 
@@ -961,7 +961,7 @@ __intel_bb_create(int i915, uint32_t ctx, const intel_ctx_cfg_t *cfg,
 
 /**
  * intel_bb_create_full:
- * @i915: drm fd
+ * @fd: drm fd
  * @ctx: context
  * @cfg: intel_ctx configuration, NULL for default context or legacy mode
  * @size: size of the batchbuffer
@@ -980,19 +980,19 @@ __intel_bb_create(int i915, uint32_t ctx, const intel_ctx_cfg_t *cfg,
  *
  * Pointer the intel_bb, asserts on failure.
  */
-struct intel_bb *intel_bb_create_full(int i915, uint32_t ctx,
+struct intel_bb *intel_bb_create_full(int fd, uint32_t ctx,
 				      const intel_ctx_cfg_t *cfg, uint32_t size,
 				      uint64_t start, uint64_t end,
 				      uint8_t allocator_type,
 				      enum allocator_strategy strategy)
 {
-	return __intel_bb_create(i915, ctx, cfg, size, false, start, end,
+	return __intel_bb_create(fd, ctx, cfg, size, false, start, end,
 				 allocator_type, strategy);
 }
 
 /**
  * intel_bb_create_with_allocator:
- * @i915: drm fd
+ * @fd: drm fd
  * @ctx: context
  * @cfg: intel_ctx configuration, NULL for default context or legacy mode
  * @size: size of the batchbuffer
@@ -1006,18 +1006,18 @@ struct intel_bb *intel_bb_create_full(int i915, uint32_t ctx,
  *
  * Pointer the intel_bb, asserts on failure.
  */
-struct intel_bb *intel_bb_create_with_allocator(int i915, uint32_t ctx,
+struct intel_bb *intel_bb_create_with_allocator(int fd, uint32_t ctx,
 						const intel_ctx_cfg_t *cfg,
 						uint32_t size,
 						uint8_t allocator_type)
 {
-	return __intel_bb_create(i915, ctx, cfg, size, false, 0, 0,
+	return __intel_bb_create(fd, ctx, cfg, size, false, 0, 0,
 				 allocator_type, ALLOC_STRATEGY_HIGH_TO_LOW);
 }
 
-static bool aux_needs_softpin(int i915)
+static bool aux_needs_softpin(int fd)
 {
-	return intel_gen(intel_get_drm_devid(i915)) >= 12;
+	return intel_gen(intel_get_drm_devid(fd)) >= 12;
 }
 
 static bool has_ctx_cfg(struct intel_bb *ibb)
@@ -1027,7 +1027,7 @@ static bool has_ctx_cfg(struct intel_bb *ibb)
 
 /**
  * intel_bb_create:
- * @i915: drm fd
+ * @fd: drm fd
  * @size: size of the batchbuffer
  *
  * Creates bb with default context.
@@ -1045,19 +1045,19 @@ static bool has_ctx_cfg(struct intel_bb *ibb)
  * connection to it inside intel_bb is not valid anymore.
  * Trying to use it leads to catastrofic errors.
  */
-struct intel_bb *intel_bb_create(int i915, uint32_t size)
+struct intel_bb *intel_bb_create(int fd, uint32_t size)
 {
-	bool relocs = gem_has_relocations(i915);
+	bool relocs = gem_has_relocations(fd);
 
-	return __intel_bb_create(i915, 0, NULL, size,
-				 relocs && !aux_needs_softpin(i915), 0, 0,
+	return __intel_bb_create(fd, 0, NULL, size,
+				 relocs && !aux_needs_softpin(fd), 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW);
 }
 
 /**
  * intel_bb_create_with_context:
- * @i915: drm fd
+ * @fd: drm fd
  * @ctx: context id
  * @cfg: intel_ctx configuration, NULL for default context or legacy mode
  * @size: size of the batchbuffer
@@ -1070,20 +1070,20 @@ struct intel_bb *intel_bb_create(int i915, uint32_t size)
  * Pointer the intel_bb, asserts on failure.
  */
 struct intel_bb *
-intel_bb_create_with_context(int i915, uint32_t ctx,
+intel_bb_create_with_context(int fd, uint32_t ctx,
 			     const intel_ctx_cfg_t *cfg, uint32_t size)
 {
-	bool relocs = gem_has_relocations(i915);
+	bool relocs = gem_has_relocations(fd);
 
-	return __intel_bb_create(i915, ctx, cfg, size,
-				 relocs && !aux_needs_softpin(i915), 0, 0,
+	return __intel_bb_create(fd, ctx, cfg, size,
+				 relocs && !aux_needs_softpin(fd), 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW);
 }
 
 /**
  * intel_bb_create_with_relocs:
- * @i915: drm fd
+ * @fd: drm fd
  * @size: size of the batchbuffer
  *
  * Creates bb which will disable passing addresses.
@@ -1093,17 +1093,17 @@ intel_bb_create_with_context(int i915, uint32_t ctx,
  *
  * Pointer the intel_bb, asserts on failure.
  */
-struct intel_bb *intel_bb_create_with_relocs(int i915, uint32_t size)
+struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size)
 {
-	igt_require(gem_has_relocations(i915));
+	igt_require(gem_has_relocations(fd));
 
-	return __intel_bb_create(i915, 0, NULL, size, true, 0, 0,
+	return __intel_bb_create(fd, 0, NULL, size, true, 0, 0,
 				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE);
 }
 
 /**
  * intel_bb_create_with_relocs_and_context:
- * @i915: drm fd
+ * @fd: drm fd
  * @ctx: context
  * @cfg: intel_ctx configuration, NULL for default context or legacy mode
  * @size: size of the batchbuffer
@@ -1116,19 +1116,19 @@ struct intel_bb *intel_bb_create_with_relocs(int i915, uint32_t size)
  * Pointer the intel_bb, asserts on failure.
  */
 struct intel_bb *
-intel_bb_create_with_relocs_and_context(int i915, uint32_t ctx,
+intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
 					const intel_ctx_cfg_t *cfg,
 					uint32_t size)
 {
-	igt_require(gem_has_relocations(i915));
+	igt_require(gem_has_relocations(fd));
 
-	return __intel_bb_create(i915, ctx, cfg, size, true, 0, 0,
+	return __intel_bb_create(fd, ctx, cfg, size, true, 0, 0,
 				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE);
 }
 
 /**
  * intel_bb_create_no_relocs:
- * @i915: drm fd
+ * @fd: drm fd
  * @size: size of the batchbuffer
  *
  * Creates bb with disabled relocations.
@@ -1138,11 +1138,11 @@ intel_bb_create_with_relocs_and_context(int i915, uint32_t ctx,
  *
  * Pointer the intel_bb, asserts on failure.
  */
-struct intel_bb *intel_bb_create_no_relocs(int i915, uint32_t size)
+struct intel_bb *intel_bb_create_no_relocs(int fd, uint32_t size)
 {
-	igt_require(gem_uses_full_ppgtt(i915));
+	igt_require(gem_uses_full_ppgtt(fd));
 
-	return __intel_bb_create(i915, 0, NULL, size, false, 0, 0,
+	return __intel_bb_create(fd, 0, NULL, size, false, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW);
 }
@@ -1217,7 +1217,7 @@ void intel_bb_destroy(struct intel_bb *ibb)
 		intel_allocator_free(ibb->allocator_handle, ibb->handle);
 		intel_allocator_close(ibb->allocator_handle);
 	}
-	gem_close(ibb->i915, ibb->handle);
+	gem_close(ibb->fd, ibb->handle);
 
 	if (ibb->fence >= 0)
 		close(ibb->fence);
@@ -1277,8 +1277,8 @@ void intel_bb_reset(struct intel_bb *ibb, bool purge_objects_cache)
 		intel_bb_remove_object(ibb, ibb->handle, ibb->batch_offset,
 				       ibb->size);
 
-	gem_close(ibb->i915, ibb->handle);
-	ibb->handle = gem_create(ibb->i915, ibb->size);
+	gem_close(ibb->fd, ibb->handle);
+	ibb->handle = gem_create(ibb->fd, ibb->size);
 
 	/* Keep address for bb in reloc mode and RANDOM allocator */
 	if (ibb->allocator_type == INTEL_ALLOCATOR_SIMPLE)
@@ -1325,7 +1325,7 @@ int intel_bb_sync(struct intel_bb *ibb)
 void intel_bb_print(struct intel_bb *ibb)
 {
 	igt_info("drm fd: %d, gen: %d, devid: %u, debug: %d\n",
-		 ibb->i915, ibb->gen, ibb->devid, ibb->debug);
+		 ibb->fd, ibb->gen, ibb->devid, ibb->debug);
 	igt_info("handle: %u, size: %u, batch: %p, ptr: %p\n",
 		 ibb->handle, ibb->size, ibb->batch, ibb->ptr);
 	igt_info("gtt_size: %" PRIu64 ", supports 48bit: %d\n",
@@ -1350,7 +1350,7 @@ void intel_bb_dump(struct intel_bb *ibb, const char *filename)
 	FILE *out;
 	void *ptr;
 
-	ptr = gem_mmap__device_coherent(ibb->i915, ibb->handle, 0, ibb->size,
+	ptr = gem_mmap__device_coherent(ibb->fd, ibb->handle, 0, ibb->size,
 					PROT_READ);
 	out = fopen(filename, "wb");
 	igt_assert(out);
@@ -1524,7 +1524,7 @@ intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
 	igt_assert(is_power_of_two(alignment));
 
 	object = __add_to_cache(ibb, handle);
-	alignment = max_t(uint64_t, alignment, gem_detect_safe_alignment(ibb->i915));
+	alignment = max_t(uint64_t, alignment, gem_detect_safe_alignment(ibb->fd));
 	__add_to_objects(ibb, object);
 
 	/*
@@ -1999,7 +1999,7 @@ static void intel_bb_dump_execbuf(struct intel_bb *ibb,
 	uint64_t address;
 
 	igt_debug("execbuf [pid: %ld, fd: %d, ctx: %u]\n",
-		  (long) getpid(), ibb->i915, ibb->ctx);
+		  (long) getpid(), ibb->fd, ibb->ctx);
 	igt_debug("execbuf batch len: %u, start offset: 0x%x, "
 		  "DR1: 0x%x, DR4: 0x%x, "
 		  "num clip: %u, clipptr: 0x%llx, "
@@ -2160,7 +2160,7 @@ int __intel_bb_exec(struct intel_bb *ibb, uint32_t end_offset,
 	ibb->objects[0]->handle = ibb->handle;
 	ibb->objects[0]->offset = ibb->batch_offset;
 
-	gem_write(ibb->i915, ibb->handle, 0, ibb->batch, ibb->size);
+	gem_write(ibb->fd, ibb->handle, 0, ibb->batch, ibb->size);
 
 	memset(&execbuf, 0, sizeof(execbuf));
 	objects = create_objects_array(ibb);
@@ -2179,7 +2179,7 @@ int __intel_bb_exec(struct intel_bb *ibb, uint32_t end_offset,
 	/* For debugging on CI, remove in final series */
 	intel_bb_dump_execbuf(ibb, &execbuf);
 
-	ret = __gem_execbuf_wr(ibb->i915, &execbuf);
+	ret = __gem_execbuf_wr(ibb->fd, &execbuf);
 	if (ret) {
 		intel_bb_dump_execbuf(ibb, &execbuf);
 		free(objects);
@@ -2409,13 +2409,13 @@ uint32_t intel_bb_copy_data(struct intel_bb *ibb,
  */
 void intel_bb_blit_start(struct intel_bb *ibb, uint32_t flags)
 {
-	if (blt_has_xy_src_copy(ibb->i915))
+	if (blt_has_xy_src_copy(ibb->fd))
 		intel_bb_out(ibb, XY_SRC_COPY_BLT_CMD |
 			     XY_SRC_COPY_BLT_WRITE_ALPHA |
 			     XY_SRC_COPY_BLT_WRITE_RGB |
 			     flags |
 			     (6 + 2 * (ibb->gen >= 8)));
-	else if (blt_has_fast_copy(ibb->i915))
+	else if (blt_has_fast_copy(ibb->fd))
 		intel_bb_out(ibb, XY_FAST_COPY_BLT | flags);
 	else
 		igt_assert_f(0, "No supported blit command found\n");
@@ -2456,9 +2456,9 @@ void intel_bb_emit_blt_copy(struct intel_bb *ibb,
 
 	if (gen >= 4 && src->tiling != I915_TILING_NONE) {
 		src_pitch /= 4;
-		if (blt_has_xy_src_copy(ibb->i915))
+		if (blt_has_xy_src_copy(ibb->fd))
 			cmd_bits |= XY_SRC_COPY_BLT_SRC_TILED;
-		else if (blt_has_fast_copy(ibb->i915))
+		else if (blt_has_fast_copy(ibb->fd))
 			cmd_bits |= fast_copy_dword0(src->tiling, dst->tiling);
 		else
 			igt_assert_f(0, "No supported blit command found\n");
@@ -2466,7 +2466,7 @@ void intel_bb_emit_blt_copy(struct intel_bb *ibb,
 
 	if (gen >= 4 && dst->tiling != I915_TILING_NONE) {
 		dst_pitch /= 4;
-		if (blt_has_xy_src_copy(ibb->i915))
+		if (blt_has_xy_src_copy(ibb->fd))
 			cmd_bits |= XY_SRC_COPY_BLT_DST_TILED;
 		else
 			cmd_bits |= fast_copy_dword0(src->tiling, dst->tiling);
@@ -2480,7 +2480,7 @@ void intel_bb_emit_blt_copy(struct intel_bb *ibb,
 	CHECK_RANGE(src_pitch); CHECK_RANGE(dst_pitch);
 
 	br13_bits = 0;
-	if (blt_has_xy_src_copy(ibb->i915)) {
+	if (blt_has_xy_src_copy(ibb->fd)) {
 		switch (bpp) {
 		case 8:
 			break;
@@ -2496,7 +2496,7 @@ void intel_bb_emit_blt_copy(struct intel_bb *ibb,
 			igt_fail(IGT_EXIT_FAILURE);
 		}
 	} else {
-		br13_bits = fast_copy_dword1(ibb->i915, src->tiling, dst->tiling, bpp);
+		br13_bits = fast_copy_dword1(ibb->fd, src->tiling, dst->tiling, bpp);
 	}
 
 	if ((src->tiling | dst->tiling) >= I915_TILING_Y) {
@@ -2631,7 +2631,7 @@ static void __intel_bb_reinit_alloc(struct intel_bb *ibb)
 	if (ibb->allocator_type == INTEL_ALLOCATOR_NONE)
 		return;
 
-	ibb->allocator_handle = intel_allocator_open_full(ibb->i915, ibb->ctx,
+	ibb->allocator_handle = intel_allocator_open_full(ibb->fd, ibb->ctx,
 							  ibb->allocator_start, ibb->allocator_end,
 							  ibb->allocator_type,
 							  ibb->allocator_strategy,
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 10e4126606..4978b6fb29 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -246,7 +246,7 @@ struct intel_bb {
 	uint8_t allocator_type;
 	enum allocator_strategy allocator_strategy;
 
-	int i915;
+	int fd;
 	unsigned int gen;
 	bool debug;
 	bool dump_base64;
@@ -299,21 +299,21 @@ struct intel_bb {
 };
 
 struct intel_bb *
-intel_bb_create_full(int i915, uint32_t ctx, const intel_ctx_cfg_t *cfg,
+intel_bb_create_full(int fd, uint32_t ctx, const intel_ctx_cfg_t *cfg,
 		     uint32_t size, uint64_t start, uint64_t end,
 		     uint8_t allocator_type, enum allocator_strategy strategy);
 struct intel_bb *
-intel_bb_create_with_allocator(int i915, uint32_t ctx, const intel_ctx_cfg_t *cfg,
+intel_bb_create_with_allocator(int fd, uint32_t ctx, const intel_ctx_cfg_t *cfg,
 			       uint32_t size, uint8_t allocator_type);
-struct intel_bb *intel_bb_create(int i915, uint32_t size);
+struct intel_bb *intel_bb_create(int fd, uint32_t size);
 struct intel_bb *
-intel_bb_create_with_context(int i915, uint32_t ctx, const intel_ctx_cfg_t *cfg,
+intel_bb_create_with_context(int fd, uint32_t ctx, const intel_ctx_cfg_t *cfg,
 			     uint32_t size);
-struct intel_bb *intel_bb_create_with_relocs(int i915, uint32_t size);
+struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size);
 struct intel_bb *
-intel_bb_create_with_relocs_and_context(int i915, uint32_t ctx,
+intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
 					const intel_ctx_cfg_t *cfg, uint32_t size);
-struct intel_bb *intel_bb_create_no_relocs(int i915, uint32_t size);
+struct intel_bb *intel_bb_create_no_relocs(int fd, uint32_t size);
 void intel_bb_destroy(struct intel_bb *ibb);
 
 /* make it safe to use intel_allocator after failed test */
diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c
index b6ecd8346c..6e944f0acb 100644
--- a/tests/i915/gem_caching.c
+++ b/tests/i915/gem_caching.c
@@ -83,7 +83,7 @@ copy_bo(struct intel_bb *ibb, struct intel_buf *src, struct intel_buf *dst)
 	intel_bb_add_intel_buf(ibb, src, false);
 	intel_bb_add_intel_buf(ibb, dst, true);
 
-	if (blt_has_xy_src_copy(ibb->i915)) {
+	if (blt_has_xy_src_copy(ibb->fd)) {
 		intel_bb_out(ibb,
 			     XY_SRC_COPY_BLT_CMD |
 			     XY_SRC_COPY_BLT_WRITE_ALPHA |
@@ -93,7 +93,7 @@ copy_bo(struct intel_bb *ibb, struct intel_buf *src, struct intel_buf *dst)
 		intel_bb_out(ibb, (3 << 24) | /* 32 bits */
 			     (0xcc << 16) | /* copy ROP */
 			     4096);
-	} else if (blt_has_fast_copy(ibb->i915)) {
+	} else if (blt_has_fast_copy(ibb->fd)) {
 		intel_bb_out(ibb, XY_FAST_COPY_BLT);
 		intel_bb_out(ibb, XY_FAST_COPY_COLOR_DEPTH_32 | 4096);
 	} else {
diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index af657d0e1b..2f27abd582 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -809,7 +809,7 @@ static int gem_execbuf_flush_store_dw(int i915, struct intel_bb *ibb, uint32_t c
 	ret = __intel_bb_exec(ibb, intel_bb_offset(ibb),
 				  I915_EXEC_RENDER | I915_EXEC_NO_RELOC, false);
 	if (ret == 0) {
-		gem_sync(ibb->i915, fence->handle);
+		gem_sync(ibb->fd, fence->handle);
 		assert_pipectl_storedw_done(i915, fence->handle);
 	}
 	return ret;
-- 
2.34.1
