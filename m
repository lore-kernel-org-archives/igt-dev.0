Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445CC10E510
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Nov 2023 11:48:56 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Nov 2023 11:48:14 +0000
Message-ID: <20231107114816.190793-14-matthew.auld@intel.com>
In-Reply-To: <20231107114816.190793-1-matthew.auld@intel.com>
References: <20231107114816.190793-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v8 13/15] lib/intel_batchbuffer: extend to
 include optional alignment
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

Extend intel_bb_create_full() to support specifying the alignment for
the allocator. This will be useful in some upcoming test.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_batchbuffer.c | 30 +++++++++++++++++++-----------
 lib/intel_batchbuffer.h |  2 +-
 2 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 16ce7c62a..01d80c841 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -894,7 +894,7 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
 static struct intel_bb *
 __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 		  uint32_t size, bool do_relocs,
-		  uint64_t start, uint64_t end,
+		  uint64_t start, uint64_t end, uint64_t alignment,
 		  uint8_t allocator_type, enum allocator_strategy strategy)
 {
 	struct drm_i915_gem_exec_object2 *object;
@@ -918,7 +918,11 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 	 */
 	if (ibb->driver == INTEL_DRIVER_I915) {
 		ibb->uses_full_ppgtt = gem_uses_full_ppgtt(fd);
-		ibb->alignment = gem_detect_safe_alignment(fd);
+
+		if (!alignment)
+			alignment = gem_detect_safe_alignment(fd);
+
+		ibb->alignment = alignment;
 		ibb->gtt_size = gem_aperture_size(fd);
 		ibb->handle = gem_create(fd, size);
 
@@ -947,7 +951,10 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 	} else {
 		igt_assert(!do_relocs);
 
-		ibb->alignment = xe_get_default_alignment(fd);
+		if (!alignment)
+			alignment = xe_get_default_alignment(fd);
+
+		ibb->alignment = alignment;
 		size = ALIGN(size, ibb->alignment);
 		ibb->handle = xe_bo_create_flags(fd, 0, size, visible_vram_if_possible(fd, 0));
 
@@ -1018,6 +1025,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
  * @size: size of the batchbuffer
  * @start: allocator vm start address
  * @end: allocator vm start address
+ * @alignment: alignment to use for allocator, zero for default
  * @allocator_type: allocator type, SIMPLE, RELOC, ...
  * @strategy: allocation strategy
  *
@@ -1034,11 +1042,11 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 struct intel_bb *intel_bb_create_full(int fd, uint32_t ctx, uint32_t vm,
 				      const intel_ctx_cfg_t *cfg, uint32_t size,
 				      uint64_t start, uint64_t end,
-				      uint8_t allocator_type,
+				      uint64_t alignment, uint8_t allocator_type,
 				      enum allocator_strategy strategy)
 {
 	return __intel_bb_create(fd, ctx, vm, cfg, size, false, start, end,
-				 allocator_type, strategy);
+				 alignment, allocator_type, strategy);
 }
 
 /**
@@ -1063,7 +1071,7 @@ struct intel_bb *intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t v
 						uint32_t size,
 						uint8_t allocator_type)
 {
-	return __intel_bb_create(fd, ctx, vm, cfg, size, false, 0, 0,
+	return __intel_bb_create(fd, ctx, vm, cfg, size, false, 0, 0, 0,
 				 allocator_type, ALLOC_STRATEGY_HIGH_TO_LOW);
 }
 
@@ -1102,7 +1110,7 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size)
 	bool relocs = is_i915_device(fd) && gem_has_relocations(fd);
 
 	return __intel_bb_create(fd, 0, 0, NULL, size,
-				 relocs && !aux_needs_softpin(fd), 0, 0,
+				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW);
 }
@@ -1129,7 +1137,7 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 	bool relocs = is_i915_device(fd) && gem_has_relocations(fd);
 
 	return __intel_bb_create(fd, ctx, vm, cfg, size,
-				 relocs && !aux_needs_softpin(fd), 0, 0,
+				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW);
 }
@@ -1150,7 +1158,7 @@ struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size)
 {
 	igt_require(is_i915_device(fd) && gem_has_relocations(fd));
 
-	return __intel_bb_create(fd, 0, 0, NULL, size, true, 0, 0,
+	return __intel_bb_create(fd, 0, 0, NULL, size, true, 0, 0, 0,
 				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE);
 }
 
@@ -1175,7 +1183,7 @@ intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
 {
 	igt_require(is_i915_device(fd) && gem_has_relocations(fd));
 
-	return __intel_bb_create(fd, ctx, 0, cfg, size, true, 0, 0,
+	return __intel_bb_create(fd, ctx, 0, cfg, size, true, 0, 0, 0,
 				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE);
 }
 
@@ -1195,7 +1203,7 @@ struct intel_bb *intel_bb_create_no_relocs(int fd, uint32_t size)
 {
 	igt_require(gem_uses_full_ppgtt(fd));
 
-	return __intel_bb_create(fd, 0, 0, NULL, size, false, 0, 0,
+	return __intel_bb_create(fd, 0, 0, NULL, size, false, 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW);
 }
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index bdb3b6a67..8738cb5c4 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -307,7 +307,7 @@ struct intel_bb {
 struct intel_bb *
 intel_bb_create_full(int fd, uint32_t ctx, uint32_t vm,
 		     const intel_ctx_cfg_t *cfg, uint32_t size, uint64_t start,
-		     uint64_t end, uint8_t allocator_type,
+		     uint64_t end, uint64_t alignment, uint8_t allocator_type,
 		     enum allocator_strategy strategy);
 struct intel_bb *
 intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t vm,
-- 
2.41.0
