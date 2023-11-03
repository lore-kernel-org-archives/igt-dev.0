Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C70610EA12
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:44:59 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:36 +0000
Message-Id: <20231103144359.7-42-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 41/64] xe: Be more specific on the VRAM
 selection
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

There are 2 main use cases:

1. A specific VRAM near a specific engine inside a GT.
2. Any VRAM in the device, for any kind of device memory
   access, but that not necessarily need to be near to any
   specific engine.

Let's split up these 2 cases, instead of randomly selecting
the gt0.

Although this might bring some questions if 'any_vram' is
the real right choice for some of the cases here, this patch
doesn't try to address that. There should be no functional
change with this patch applied.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 benchmarks/gem_wsim.c              |  2 +-
 lib/igt_draw.c                     |  4 +-
 lib/igt_fb.c                       |  6 +--
 lib/intel_batchbuffer.c            |  4 +-
 lib/xe/xe_query.c                  | 60 +++++++++++++++++++++++-------
 lib/xe/xe_query.h                  |  6 ++-
 lib/xe/xe_spin.c                   |  4 +-
 tests/intel/kms_big_fb.c           |  8 ++--
 tests/intel/kms_psr.c              |  2 +-
 tests/intel/xe_dma_buf_sync.c      |  2 +-
 tests/intel/xe_evict.c             | 12 +++---
 tests/intel/xe_evict_ccs.c         |  8 ++--
 tests/intel/xe_exec_balancer.c     |  6 +--
 tests/intel/xe_exec_basic.c        |  2 +-
 tests/intel/xe_exec_compute_mode.c |  2 +-
 tests/intel/xe_exec_fault_mode.c   |  4 +-
 tests/intel/xe_exec_reset.c        | 10 ++---
 tests/intel/xe_exec_store.c        |  4 +-
 tests/intel/xe_exec_threads.c      |  6 +--
 tests/intel/xe_guc_pc.c            |  2 +-
 tests/intel/xe_mmap.c              | 18 ++++-----
 tests/intel/xe_noexec_ping_pong.c  |  2 +-
 tests/intel/xe_perf_pmu.c          |  4 +-
 tests/intel/xe_pm.c                |  4 +-
 tests/intel/xe_pm_residency.c      |  2 +-
 tests/intel/xe_prime_self_import.c | 18 ++++-----
 tests/intel/xe_spin_batch.c        |  2 +-
 tests/intel/xe_vm.c                | 20 +++++-----
 tests/intel/xe_waitfence.c         | 14 +++----
 tests/kms_getfb.c                  |  2 +-
 30 files changed, 138 insertions(+), 102 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index d02f72087..5ba5f2e2c 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1735,7 +1735,7 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
 	int i;
 
 	w->bb_handle = xe_bo_create(fd, vm->id, PAGE_SIZE,
-				    vram_if_possible(fd, eq->eci_list[0].gt_id),
+				    vram_near_gt_if_possible(fd, eq->eci_list[0].gt_id),
 				    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	w->xe.data = xe_bo_map(fd, w->bb_handle, PAGE_SIZE);
 	w->xe.exec.address =
diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 1e0ff8707..87b40312f 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -643,7 +643,7 @@ static struct intel_buf *create_buf(int fd, struct buf_ops *bops,
 	struct intel_buf *buf;
 	enum intel_driver driver = buf_ops_get_driver(bops);
 	uint32_t handle, name, width, height;
-	uint64_t region = driver == INTEL_DRIVER_XE ? vram_if_possible(fd, 0) : -1;
+	uint64_t region = driver == INTEL_DRIVER_XE ? any_vram_if_possible(fd) : -1;
 	uint64_t size = from->size;
 
 	width = from->stride / (from->bpp / 8);
@@ -797,7 +797,7 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
 	else
 		tmp.handle = xe_bo_create(fd, 0,
 					  ALIGN(tmp.size, xe_get_default_alignment(fd)),
-					  vram_if_possible(fd, 0),
+					  any_vram_if_possible(fd),
 					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	tmp.stride = rect->w * pixel_size;
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 9c1257801..11b92f07b 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -1206,7 +1206,7 @@ static int create_bo_for_fb(struct igt_fb *fb, bool prefer_sysmem)
 			igt_assert(err == 0 || err == -EOPNOTSUPP);
 		} else if (is_xe_device(fd)) {
 			fb->gem_handle = xe_bo_create(fd, 0, fb->size,
-						      vram_if_possible(fd, 0),
+						      any_vram_if_possible(fd),
 						      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		} else if (is_vc4_device(fd)) {
 			fb->gem_handle = igt_vc4_create_bo(fd, fb->size);
@@ -2629,7 +2629,7 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 
 	/* For i915 region doesn't matter, for xe does */
 	region = buf_ops_get_driver(bops) == INTEL_DRIVER_XE ?
-				vram_if_possible(fd, 0) : -1;
+				any_vram_if_possible(fd) : -1;
 	buf = intel_buf_create_full(bops, handle,
 				    fb->width, fb->height,
 				    fb->plane_bpp[0], 0,
@@ -2896,7 +2896,7 @@ static void blitcopy(const struct igt_fb *dst_fb,
 		vm = xe_vm_create(dst_fb->fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 		exec_queue = xe_exec_queue_create(dst_fb->fd, vm, &inst, 0);
 		xe_ctx = intel_ctx_xe(dst_fb->fd, vm, exec_queue, 0, 0, 0);
-		mem_region = vram_if_possible(dst_fb->fd, 0);
+		mem_region = any_vram_if_possible(dst_fb->fd);
 
 		ahnd = intel_allocator_open_full(dst_fb->fd, xe_ctx->vm, 0, 0,
 						 INTEL_ALLOCATOR_SIMPLE,
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 947726caf..53d4f8626 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -945,7 +945,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 
 		ibb->alignment = xe_get_default_alignment(fd);
 		size = ALIGN(size, ibb->alignment);
-		ibb->handle = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0),
+		ibb->handle = xe_bo_create(fd, 0, size, any_vram_if_possible(fd),
 					   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 		/* Limit to 48-bit due to MI_* address limitation */
@@ -1406,7 +1406,7 @@ void intel_bb_reset(struct intel_bb *ibb, bool purge_objects_cache)
 		ibb->handle = gem_create(ibb->fd, ibb->size);
 	else
 		ibb->handle = xe_bo_create(ibb->fd, 0, ibb->size,
-					   vram_if_possible(ibb->fd, 0),
+					   any_vram_if_possible(ibb->fd),
 					   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	/* Reacquire offset for RELOC and SIMPLE */
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 04d73f405..14fabcd7f 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -114,7 +114,7 @@ static struct drm_xe_query_mem_regions *xe_query_mem_regions_new(int fd)
 	return mem_regions;
 }
 
-static uint64_t native_region_for_gt(const struct drm_xe_query_gt_list *gt_list, int gt)
+static uint64_t mem_region_near_gt(const struct drm_xe_query_gt_list *gt_list, int gt)
 {
 	uint64_t region;
 
@@ -128,7 +128,7 @@ static uint64_t native_region_for_gt(const struct drm_xe_query_gt_list *gt_list,
 static uint64_t gt_vram_size(const struct drm_xe_query_mem_regions *mem_regions,
 			     const struct drm_xe_query_gt_list *gt_list, int gt)
 {
-	int region_idx = ffs(native_region_for_gt(gt_list, gt)) - 1;
+	int region_idx = ffs(mem_region_near_gt(gt_list, gt)) - 1;
 
 	if (XE_IS_CLASS_VRAM(&mem_regions->regions[region_idx]))
 		return mem_regions->regions[region_idx].total_size;
@@ -139,7 +139,7 @@ static uint64_t gt_vram_size(const struct drm_xe_query_mem_regions *mem_regions,
 static uint64_t gt_visible_vram_size(const struct drm_xe_query_mem_regions *mem_regions,
 				     const struct drm_xe_query_gt_list *gt_list, int gt)
 {
-	int region_idx = ffs(native_region_for_gt(gt_list, gt)) - 1;
+	int region_idx = ffs(mem_region_near_gt(gt_list, gt)) - 1;
 
 	if (XE_IS_CLASS_VRAM(&mem_regions->regions[region_idx]))
 		return mem_regions->regions[region_idx].cpu_visible_size;
@@ -376,14 +376,34 @@ uint64_t system_memory(int fd)
 	return regions & 0x1;
 }
 
+
 /**
- * vram_memory:
+ * any_vram:
+ * @fd: xe device fd
+ *
+ * Returns memory bitmask for any valid vram region in the device.
+ */
+uint64_t any_vram(int fd)
+{
+	struct xe_device *xe_dev;
+
+	xe_dev = find_in_cache(fd);
+	igt_assert(xe_dev);
+
+	for (int i = 0; i < xe_dev->mem_regions->num_regions; i++)
+		if (XE_IS_CLASS_VRAM(&xe_dev->mem_regions->regions[i]))
+			return 1 << xe_dev->mem_regions->regions[i].instance;
+	return 0;
+}
+
+/**
+ * vram_near_gt:
  * @fd: xe device fd
  * @gt: gt id
  *
- * Returns vram memory bitmask for xe device @fd and @gt id.
+ * Returns memory bitmask for the vram region that is near the given @gt id.
  */
-uint64_t vram_memory(int fd, int gt)
+uint64_t vram_near_gt(int fd, int gt)
 {
 	struct xe_device *xe_dev;
 
@@ -391,20 +411,34 @@ uint64_t vram_memory(int fd, int gt)
 	igt_assert(xe_dev);
 	igt_assert(gt >= 0 && gt < xe_dev->gt_list->num_gt);
 
-	return xe_has_vram(fd) ? native_region_for_gt(xe_dev->gt_list, gt) : 0;
+	return xe_has_vram(fd) ? mem_region_near_gt(xe_dev->gt_list, gt) : 0;
+}
+
+/**
+ * any_vram_if_possible:
+ * @fd: xe device fd
+ *
+ * Returns a memory region bitmask. If possible, it returns a bitmask for any
+ * valid vram region in the device. Otherwise it returns a bitmask for a system
+ * memory region.
+ */
+uint64_t any_vram_if_possible(int fd)
+{
+	return any_vram(fd) ?: system_memory(fd);
 }
 
 /**
- * vram_if_possible:
+ * vram_near_gt_if_possible:
  * @fd: xe device fd
  * @gt: gt id
  *
- * Returns vram memory bitmask for xe device @fd and @gt id or system memory
- * if there's no vram memory available for @gt.
+ * Returns a memory region bitmask. If possible, it returns a bitmask for a
+ * vram region near the given @gt id. Otherwise it returns a bitmask for a
+ * system memory region.
  */
-uint64_t vram_if_possible(int fd, int gt)
+uint64_t vram_near_gt_if_possible(int fd, int gt)
 {
-	return vram_memory(fd, gt) ?: system_memory(fd);
+	return vram_near_gt(fd, gt) ?: system_memory(fd);
 }
 
 /**
@@ -581,7 +615,7 @@ uint64_t xe_vram_available(int fd, int gt)
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
 
-	region_idx = ffs(native_region_for_gt(xe_dev->gt_list, gt)) - 1;
+	region_idx = ffs(mem_region_near_gt(xe_dev->gt_list, gt)) - 1;
 	mem_region = &xe_dev->mem_regions->regions[region_idx];
 
 	if (XE_IS_CLASS_VRAM(mem_region)) {
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 0faa9c284..839ab548e 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -79,8 +79,10 @@ struct xe_device {
 unsigned int xe_number_gt(int fd);
 uint64_t all_memory_regions(int fd);
 uint64_t system_memory(int fd);
-uint64_t vram_memory(int fd, int gt);
-uint64_t vram_if_possible(int fd, int gt);
+uint64_t any_vram(int fd);
+uint64_t vram_near_gt(int fd, int gt);
+uint64_t any_vram_if_possible(int fd);
+uint64_t vram_near_gt_if_possible(int fd, int gt);
 struct drm_xe_query_engine_info *xe_engines(int fd);
 struct drm_xe_query_engine_info *xe_engine(int fd, int idx);
 struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region);
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 3641811d1..0aeddb9ac 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -221,7 +221,7 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
 	}
 
 	spin->handle = xe_bo_create(fd, spin->vm, bo_size,
-				    vram_if_possible(fd, 0),
+				    any_vram_if_possible(fd),
 				    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	xe_spin = xe_bo_map(fd, spin->handle, bo_size);
 	addr = intel_allocator_alloc_with_strategy(ahnd, spin->handle, bo_size, 0, ALLOC_STRATEGY_LOW_TO_HIGH);
@@ -301,7 +301,7 @@ void xe_cork_init(int fd, struct drm_xe_engine_class_instance *eci,
 
 	vm = xe_vm_create(fd, 0, 0);
 
-	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id),
+	bo = xe_bo_create(fd, vm, bo_size, vram_near_gt_if_possible(fd, eci->gt_id),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	spin = xe_bo_map(fd, bo, 0x1000);
 
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index fde73bac0..6e860dbe7 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -73,7 +73,7 @@ static struct intel_buf *init_buf(data_t *data,
 	enum intel_driver driver = buf_ops_get_driver(data->bops);
 	uint32_t name, handle, tiling, stride, width, height, bpp, size;
 	uint64_t region = driver == INTEL_DRIVER_XE ?
-				vram_if_possible(data->drm_fd, 0) : -1;
+				any_vram_if_possible(data->drm_fd) : -1;
 
 	igt_assert_eq(fb->offsets[0], 0);
 
@@ -780,7 +780,7 @@ test_size_overflow(data_t *data)
 		bo = xe_bo_create(data->drm_fd, 0,
 				  ALIGN(((1ULL << 32) - 4096),
 					xe_get_default_alignment(data->drm_fd)),
-				  vram_if_possible(data->drm_fd, 0), 0);
+				  any_vram_if_possible(data->drm_fd), 0);
 	igt_require(bo);
 
 	ret = __kms_addfb(data->drm_fd, bo,
@@ -840,7 +840,7 @@ test_size_offset_overflow(data_t *data)
 		bo = xe_bo_create(data->drm_fd, 0,
 				  ALIGN(((1ULL << 32) - 4096),
 					xe_get_default_alignment(data->drm_fd)),
-				  vram_if_possible(data->drm_fd, 0), 0);
+				  any_vram_if_possible(data->drm_fd), 0);
 	igt_require(bo);
 
 	offsets[0] = 0;
@@ -928,7 +928,7 @@ test_addfb(data_t *data)
 	else
 		bo = xe_bo_create(data->drm_fd, 0,
 				  ALIGN(size, xe_get_default_alignment(data->drm_fd)),
-				  vram_if_possible(data->drm_fd, 0), 0);
+				  any_vram_if_possible(data->drm_fd), 0);
 	igt_require(bo);
 
 	if (is_i915_device(data->drm_fd) && intel_display_ver(data->devid) < 4)
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index ffecc5222..36e3810ca 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -339,7 +339,7 @@ static struct intel_buf *create_buf_from_fb(data_t *data,
 	struct intel_buf *buf;
 	enum intel_driver driver = buf_ops_get_driver(data->bops);
 	uint64_t region = (driver == INTEL_DRIVER_XE) ?
-				vram_if_possible(data->drm_fd, 0) : -1;
+				any_vram_if_possible(data->drm_fd) : -1;
 
 	igt_assert_eq(fb->offsets[0], 0);
 
diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
index 2298bd84a..86441864e 100644
--- a/tests/intel/xe_dma_buf_sync.c
+++ b/tests/intel/xe_dma_buf_sync.c
@@ -120,7 +120,7 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *eci0,
 			xe_get_default_alignment(fd[0]));
 	for (i = 0; i < n_bo; ++i) {
 		bo[i] = xe_bo_create(fd[0], 0, bo_size,
-				     vram_if_possible(fd[0], eci0->gt_id),
+				     vram_near_gt_if_possible(fd[0], eci0->gt_id),
 				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		dma_buf_fd[i] = prime_handle_to_fd(fd[0], bo[i]);
 		import_bo[i] = prime_fd_to_handle(fd[1], dma_buf_fd[i]);
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index e30a03a2a..536c38bed 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -103,17 +103,17 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 			if (flags & MULTI_VM) {
 				__bo = bo[i] = xe_bo_create(fd, 0,
 							    bo_size,
-							    vram_memory(fd, eci->gt_id),
+							    vram_near_gt(fd, eci->gt_id),
 							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 			} else if (flags & THREADED) {
 				__bo = bo[i] = xe_bo_create(fd, vm,
 							    bo_size,
-							    vram_memory(fd, eci->gt_id),
+							    vram_near_gt(fd, eci->gt_id),
 							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 			} else {
 				__bo = bo[i] = xe_bo_create(fd, _vm,
 							    bo_size,
-							    vram_memory(fd, eci->gt_id) |
+							    vram_near_gt(fd, eci->gt_id) |
 							    system_memory(fd),
 							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 			}
@@ -283,17 +283,17 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 			if (flags & MULTI_VM) {
 				__bo = bo[i] = xe_bo_create(fd, 0,
 							    bo_size,
-							    vram_memory(fd, eci->gt_id),
+							    vram_near_gt(fd, eci->gt_id),
 							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 			} else if (flags & THREADED) {
 				__bo = bo[i] = xe_bo_create(fd, vm,
 							    bo_size,
-							    vram_memory(fd, eci->gt_id),
+							    vram_near_gt(fd, eci->gt_id),
 							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 			} else {
 				__bo = bo[i] = xe_bo_create(fd, _vm,
 							    bo_size,
-							    vram_memory(fd, eci->gt_id) |
+							    vram_near_gt(fd, eci->gt_id) |
 							    system_memory(fd),
 							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 			}
diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
index 4cafbf02e..1876d200c 100644
--- a/tests/intel/xe_evict_ccs.c
+++ b/tests/intel/xe_evict_ccs.c
@@ -82,7 +82,7 @@ static void copy_obj(struct blt_copy_data *blt,
 	w = src_obj->x2;
 	h = src_obj->y2;
 
-	bb = xe_bo_create(fd, 0, bb_size, vram_memory(fd, 0),
+	bb = xe_bo_create(fd, 0, bb_size, any_vram(fd),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	blt->color_depth = CD_32bit;
@@ -91,7 +91,7 @@ static void copy_obj(struct blt_copy_data *blt,
 	blt_set_copy_object(&blt->dst, dst_obj);
 	blt_set_object_ext(&ext.src, 0, w, h, SURFACE_TYPE_2D);
 	blt_set_object_ext(&ext.dst, 0, w, h, SURFACE_TYPE_2D);
-	blt_set_batch(&blt->bb, bb, bb_size, vram_if_possible(fd, 0));
+	blt_set_batch(&blt->bb, bb, bb_size, any_vram_if_possible(fd));
 	blt_block_copy(fd, ctx, NULL, ahnd, blt, &ext);
 	intel_ctx_xe_sync(ctx, true);
 
@@ -149,7 +149,7 @@ static struct object *create_obj(struct blt_copy_data *blt,
 				T_LINEAR, COMPRESSION_DISABLED,
 				COMPRESSION_TYPE_3D, true);
 
-	obj->blt_obj = blt_create_object(blt, vram_memory(fd, 0),
+	obj->blt_obj = blt_create_object(blt, any_vram(fd),
 					 w, h, 32, uc_mocs,
 					 T_LINEAR,
 					 disable_compression ? COMPRESSION_DISABLED :
@@ -276,7 +276,7 @@ static void evict_single(int fd, int child, const struct config *config)
 
 		if (config->flags & TEST_SIMPLE) {
 			big_obj = xe_bo_create(fd, vm, kb_left * SZ_1K,
-					       vram_memory(fd, 0), 0);
+					       any_vram(fd), 0);
 			break;
 		}
 
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 7d124fb67..e06414c14 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -72,7 +72,7 @@ static void test_all_active(int fd, int gt, int class)
 	bo_size = sizeof(*data) * num_placements;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt),
+	bo = xe_bo_create(fd, vm, bo_size, vram_near_gt_if_possible(fd, gt),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
@@ -229,7 +229,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		}
 		memset(data, 0, bo_size);
 	} else {
-		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt),
+		bo = xe_bo_create(fd, vm, bo_size, vram_near_gt_if_possible(fd, gt),
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
@@ -459,7 +459,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 			igt_assert(data);
 		}
 	} else {
-		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt),
+		bo = xe_bo_create(fd, vm, bo_size, vram_near_gt_if_possible(fd, gt),
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index 4a2dc1866..923e8d2db 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -143,7 +143,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			bo_flags |= DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING;
 
 		bo = xe_bo_create(fd, n_vm == 1 ? vm[0] : 0, bo_size,
-				  vram_if_possible(fd, eci->gt_id), bo_flags);
+				  vram_near_gt_if_possible(fd, eci->gt_id), bo_flags);
 		if (!(flags & DEFER_BIND))
 			data = xe_bo_map(fd, bo, bo_size);
 	}
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 35f9b555d..ba0f09104 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -143,7 +143,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		}
 	} else {
 		bo = xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0,
-				  bo_size, vram_if_possible(fd, eci->gt_id),
+				  bo_size, vram_near_gt_if_possible(fd, eci->gt_id),
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 14545973b..1b2024f38 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -154,11 +154,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		if (flags & PREFETCH)
 			bo = xe_bo_create(fd, 0, bo_size,
 					  all_memory_regions(fd) |
-					  vram_if_possible(fd, 0),
+					  any_vram_if_possible(fd),
 					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		else
 			bo = xe_bo_create(fd, 0, bo_size,
-					  vram_if_possible(fd, eci->gt_id),
+					  vram_near_gt_if_possible(fd, eci->gt_id),
 					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index d85734229..72a9d902d 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -53,7 +53,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 			xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_if_possible(fd, eci->gt_id),
+			  vram_near_gt_if_possible(fd, eci->gt_id),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	spin = xe_bo_map(fd, bo, bo_size);
 
@@ -186,7 +186,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt),
+	bo = xe_bo_create(fd, vm, bo_size, vram_near_gt_if_possible(fd, gt),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
@@ -376,7 +376,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 			xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_if_possible(fd, eci->gt_id),
+			  vram_near_gt_if_possible(fd, eci->gt_id),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
@@ -545,7 +545,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 			xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_if_possible(fd, eci->gt_id),
+			  vram_near_gt_if_possible(fd, eci->gt_id),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 	memset(data, 0, bo_size);
@@ -672,7 +672,7 @@ static void submit_jobs(struct gt_thread_data *t)
 	uint32_t bo;
 	uint32_t *data;
 
-	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0),
+	bo = xe_bo_create(fd, vm, bo_size, any_vram_if_possible(fd),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 	data[0] = MI_BATCH_BUFFER_END;
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 4a35e4e70..5c74e63a5 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -83,7 +83,7 @@ static void store(int fd)
 
 	engine = xe_engine(fd, 1);
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_if_possible(fd, engine->instance.gt_id),
+			  vram_near_gt_if_possible(fd, engine->instance.gt_id),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0, addr, bo_size, &sync, 1);
@@ -142,7 +142,7 @@ static void store_all(int fd, int gt, int class)
 			xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_if_possible(fd, 0),
+			  any_vram_if_possible(fd),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 9060d36e1..7ad2233dc 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -109,7 +109,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		}
 	} else {
 		bo = xe_bo_create(fd, vm, bo_size,
-				  vram_if_possible(fd, gt),
+				  vram_near_gt_if_possible(fd, gt),
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
@@ -312,7 +312,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		}
 	} else {
 		bo = xe_bo_create(fd, 0, bo_size,
-				  vram_if_possible(fd, eci->gt_id),
+				  vram_near_gt_if_possible(fd, eci->gt_id),
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
@@ -518,7 +518,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		}
 	} else {
 		bo = xe_bo_create(fd, vm, bo_size,
-				  vram_if_possible(fd, eci->gt_id),
+				  vram_near_gt_if_possible(fd, eci->gt_id),
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_guc_pc.c
index 210cc4aa4..b04a145be 100644
--- a/tests/intel/xe_guc_pc.c
+++ b/tests/intel/xe_guc_pc.c
@@ -68,7 +68,7 @@ static void exec_basic(int fd, struct drm_xe_engine_class_instance *eci,
 			xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_if_possible(fd, eci->gt_id),
+			  vram_near_gt_if_possible(fd, eci->gt_id),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index d6c8d5114..d7b87f295 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -74,7 +74,7 @@ static void test_bad_flags(int fd)
 	uint64_t size = xe_get_default_alignment(fd);
 	struct drm_xe_gem_mmap_offset mmo = {
 		.handle = xe_bo_create(fd, 0, size,
-				       vram_if_possible(fd, 0),
+				       any_vram_if_possible(fd),
 				       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM),
 		.flags = -1u,
 	};
@@ -95,7 +95,7 @@ static void test_bad_extensions(int fd)
 	struct xe_user_extension ext;
 	struct drm_xe_gem_mmap_offset mmo = {
 		.handle = xe_bo_create(fd, 0, size,
-				       vram_if_possible(fd, 0),
+				       any_vram_if_possible(fd),
 				       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM),
 	};
 
@@ -117,7 +117,7 @@ static void test_bad_object(int fd)
 	uint64_t size = xe_get_default_alignment(fd);
 	struct drm_xe_gem_mmap_offset mmo = {
 		.handle = xe_bo_create(fd, 0, size,
-				       vram_if_possible(fd, 0),
+				       any_vram_if_possible(fd),
 				       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM),
 	};
 
@@ -165,13 +165,13 @@ static void test_small_bar(int fd)
 
 	/* 2BIG invalid case */
 	igt_assert_neq(__xe_bo_create(fd, 0, visible_size + page_size,
-				      vram_memory(fd, 0),
+				      any_vram(fd),
 				      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
 				      &bo),
 		       0);
 
 	/* Normal operation */
-	bo = xe_bo_create(fd, 0, visible_size / 4, vram_memory(fd, 0),
+	bo = xe_bo_create(fd, 0, visible_size / 4, any_vram(fd),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	mmo = xe_bo_mmap_offset(fd, bo);
 	map = mmap(NULL, page_size, PROT_WRITE, MAP_SHARED, fd, mmo);
@@ -184,7 +184,7 @@ static void test_small_bar(int fd)
 
 	/* Normal operation with system memory spilling */
 	bo = xe_bo_create(fd, 0, visible_size,
-			  vram_memory(fd, 0) |
+			  any_vram(fd) |
 			  system_memory(fd),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	mmo = xe_bo_mmap_offset(fd, bo);
@@ -197,7 +197,7 @@ static void test_small_bar(int fd)
 	gem_close(fd, bo);
 
 	/* Bogus operation with SIGBUS */
-	bo = xe_bo_create(fd, 0, visible_size + page_size, vram_memory(fd, 0), 0);
+	bo = xe_bo_create(fd, 0, visible_size + page_size, any_vram(fd), 0);
 	mmo = xe_bo_mmap_offset(fd, bo);
 	map = mmap(NULL, page_size, PROT_WRITE, MAP_SHARED, fd, mmo);
 	igt_assert(map != MAP_FAILED);
@@ -217,11 +217,11 @@ igt_main
 		test_mmap(fd, system_memory(fd), 0);
 
 	igt_subtest("vram")
-		test_mmap(fd, vram_memory(fd, 0),
+		test_mmap(fd, any_vram(fd),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	igt_subtest("vram-system")
-		test_mmap(fd, vram_memory(fd, 0) | system_memory(fd),
+		test_mmap(fd, any_vram(fd) | system_memory(fd),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	igt_subtest("bad-flags")
diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
index 585af413d..8686206b4 100644
--- a/tests/intel/xe_noexec_ping_pong.c
+++ b/tests/intel/xe_noexec_ping_pong.c
@@ -71,7 +71,7 @@ static void test_ping_pong(int fd, struct drm_xe_query_engine_info *engine)
 				  (unsigned int) vm[i]);
 
 			bo[i][j] = xe_bo_create(fd, vm[i], bo_size,
-						vram_memory(fd, 0), 0);
+						any_vram(fd), 0);
 			xe_vm_bind(fd, vm[i], bo[i][j], 0, 0x40000 + j*bo_size,
 				   bo_size, NULL, 0);
 		}
diff --git a/tests/intel/xe_perf_pmu.c b/tests/intel/xe_perf_pmu.c
index e1863b35b..c267a464f 100644
--- a/tests/intel/xe_perf_pmu.c
+++ b/tests/intel/xe_perf_pmu.c
@@ -103,7 +103,7 @@ static void test_any_engine_busyness(int fd, struct drm_xe_engine_class_instance
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
+	bo = xe_bo_create(fd, vm, bo_size, any_vram_if_possible(fd), 0);
 	spin = xe_bo_map(fd, bo, bo_size);
 
 	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
@@ -223,7 +223,7 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 	bo_size = sizeof(*data) * num_placements;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
+	bo = xe_bo_create(fd, vm, bo_size, any_vram_if_possible(fd), 0);
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < num_placements; i++) {
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 1288e7b90..e4a410a8a 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -274,7 +274,7 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
 
 	bo = xe_bo_create(device.fd_xe, vm, bo_size,
-			  vram_if_possible(device.fd_xe, eci->gt_id),
+			  vram_near_gt_if_possible(device.fd_xe, eci->gt_id),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(device.fd_xe, bo, bo_size);
 
@@ -390,7 +390,7 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 
 	igt_require(xe_has_vram(device.fd_xe));
 
-	placement = vram_memory(device.fd_xe, 0);
+	placement = any_vram(device.fd_xe);
 	igt_require_f(placement, "Device doesn't support vram memory region\n");
 
 	igt_assert_eq(igt_ioctl(device.fd_xe, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index db58107ab..b5c304df3 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -102,7 +102,7 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *eci, unsigned
 	bo_size = xe_get_default_alignment(fd);
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_if_possible(fd, eci->gt_id),
+			  vram_near_gt_if_possible(fd, eci->gt_id),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 	syncobj = syncobj_create(fd, 0);
diff --git a/tests/intel/xe_prime_self_import.c b/tests/intel/xe_prime_self_import.c
index ad988ef3b..d40c897bc 100644
--- a/tests/intel/xe_prime_self_import.c
+++ b/tests/intel/xe_prime_self_import.c
@@ -113,7 +113,7 @@ static void test_with_fd_dup(void)
 
 	bo_size = get_min_bo_size(fd1, fd2);
 
-	handle = xe_bo_create(fd1, 0, bo_size, vram_if_possible(fd1, 0),
+	handle = xe_bo_create(fd1, 0, bo_size, any_vram_if_possible(fd1),
 			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	dma_buf_fd1 = prime_handle_to_fd(fd1, handle);
@@ -150,9 +150,9 @@ static void test_with_two_bos(void)
 
 	bo_size = get_min_bo_size(fd1, fd2);
 
-	handle1 = xe_bo_create(fd1, 0, bo_size, vram_if_possible(fd1, 0),
+	handle1 = xe_bo_create(fd1, 0, bo_size, any_vram_if_possible(fd1),
 			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-	handle2 = xe_bo_create(fd1, 0, bo_size, vram_if_possible(fd1, 0),
+	handle2 = xe_bo_create(fd1, 0, bo_size, any_vram_if_possible(fd1),
 			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	dma_buf_fd = prime_handle_to_fd(fd1, handle1);
@@ -192,7 +192,7 @@ static void test_with_one_bo_two_files(void)
 	bo_size = get_min_bo_size(fd1, fd2);
 
 	handle_orig = xe_bo_create(fd1, 0, bo_size,
-				   vram_if_possible(fd1, 0),
+				   any_vram_if_possible(fd1),
 				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	dma_buf_fd1 = prime_handle_to_fd(fd1, handle_orig);
 
@@ -228,7 +228,7 @@ static void test_with_one_bo(void)
 
 	bo_size = get_min_bo_size(fd1, fd2);
 
-	handle = xe_bo_create(fd1, 0, bo_size, vram_if_possible(fd1, 0),
+	handle = xe_bo_create(fd1, 0, bo_size, any_vram_if_possible(fd1),
 			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	dma_buf_fd = prime_handle_to_fd(fd1, handle);
@@ -319,7 +319,7 @@ static void *thread_fn_reimport_vs_close(void *p)
 	bo_size = xe_get_default_alignment(fds[0]);
 
 	handle = xe_bo_create(fds[0], 0, bo_size,
-			      vram_if_possible(fds[0], 0),
+			      any_vram_if_possible(fds[0]),
 			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	fds[1] = prime_handle_to_fd(fds[0], handle);
@@ -364,7 +364,7 @@ static void *thread_fn_export_vs_close(void *p)
 	igt_until_timeout(g_time_out) {
 		/* We want to race gem close against prime export on handle one.*/
 		handle = xe_bo_create(fd, 0, bo_size,
-				      vram_if_possible(fd, 0),
+				      any_vram_if_possible(fd),
 				      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		if (handle != 1)
 			gem_close(fd, handle);
@@ -462,7 +462,7 @@ static void test_llseek_size(void)
 		int bufsz = xe_get_default_alignment(fd) << i;
 
 		handle = xe_bo_create(fd, 0, bufsz,
-				      vram_if_possible(fd, 0),
+				      any_vram_if_possible(fd),
 				      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		dma_buf_fd = prime_handle_to_fd(fd, handle);
 
@@ -494,7 +494,7 @@ static void test_llseek_bad(void)
 
 	bo_size = 4 * xe_get_default_alignment(fd);
 	handle = xe_bo_create(fd, 0, bo_size,
-			      vram_if_possible(fd, 0),
+			      any_vram_if_possible(fd),
 			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
 
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 0314a1694..c6f851acc 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -170,7 +170,7 @@ static void xe_spin_fixed_duration(int fd)
 	exec_queue = xe_exec_queue_create_class(fd, vm, DRM_XE_ENGINE_CLASS_COPY);
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
 	bo_size = ALIGN(sizeof(*spin) + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
-	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
+	bo = xe_bo_create(fd, vm, bo_size, any_vram_if_possible(fd), 0);
 	spin = xe_bo_map(fd, bo, bo_size);
 	spin_addr = intel_allocator_alloc_with_strategy(ahnd, bo, bo_size, 0,
 							ALLOC_STRATEGY_LOW_TO_HIGH);
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index a1628fb21..edd48ee9b 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -52,7 +52,7 @@ write_dwords(int fd, uint32_t vm, int n_dwords, uint64_t *addrs)
 	batch_size = ALIGN(batch_size + xe_cs_prefetch_size(fd),
 			   xe_get_default_alignment(fd));
 	batch_bo = xe_bo_create(fd, vm, batch_size,
-				vram_if_possible(fd, 0),
+				any_vram_if_possible(fd),
 				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	batch_map = xe_bo_map(fd, batch_bo, batch_size);
 
@@ -117,7 +117,7 @@ __test_bind_one_bo(int fd, uint32_t vm, int n_addrs, uint64_t *addrs)
 		vms = malloc(sizeof(*vms) * n_addrs);
 		igt_assert(vms);
 	}
-	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0),
+	bo = xe_bo_create(fd, vm, bo_size, any_vram_if_possible(fd),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	map = xe_bo_map(fd, bo, bo_size);
 	memset(map, 0, bo_size);
@@ -279,7 +279,7 @@ static void unbind_all(int fd, int n_vmas)
 	};
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
-	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
+	bo = xe_bo_create(fd, vm, bo_size, any_vram_if_possible(fd), 0);
 
 	for (i = 0; i < n_vmas; ++i)
 		xe_vm_bind_async(fd, vm, 0, bo, 0, addr + i * bo_size,
@@ -384,7 +384,7 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 
 	for (i = 0; i < n_bo; ++i) {
 		bo[i] = xe_bo_create(fd, vm, bo_size,
-				     vram_if_possible(fd, eci->gt_id),
+				     vram_near_gt_if_possible(fd, eci->gt_id),
 				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data[i] = xe_bo_map(fd, bo[i], bo_size);
 	}
@@ -566,7 +566,7 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_if_possible(fd, eci->gt_id),
+			  vram_near_gt_if_possible(fd, eci->gt_id),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
@@ -750,7 +750,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 			xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_if_possible(fd, eci->gt_id),
+			  vram_near_gt_if_possible(fd, eci->gt_id),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
@@ -951,7 +951,7 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
 			    xe_visible_vram_size(fd, 0));
 
 		bo = xe_bo_create(fd, vm, bo_size,
-				  vram_if_possible(fd, eci->gt_id),
+				  vram_near_gt_if_possible(fd, eci->gt_id),
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		map = xe_bo_map(fd, bo, bo_size);
 	}
@@ -1247,7 +1247,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 		igt_assert(map != MAP_FAILED);
 	} else {
 		bo = xe_bo_create(fd, vm, bo_size,
-				  vram_if_possible(fd, eci->gt_id),
+				  vram_near_gt_if_possible(fd, eci->gt_id),
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		map = xe_bo_map(fd, bo, bo_size);
 	}
@@ -1552,9 +1552,9 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 		igt_assert(map0 != MAP_FAILED);
 		igt_assert(map1 != MAP_FAILED);
 	} else {
-		bo0 = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id), 0);
+		bo0 = xe_bo_create(fd, vm, bo_size, vram_near_gt_if_possible(fd, eci->gt_id), 0);
 		map0 = xe_bo_map(fd, bo0, bo_size);
-		bo1 = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id), 0);
+		bo1 = xe_bo_create(fd, vm, bo_size, vram_near_gt_if_possible(fd, eci->gt_id), 0);
 		map1 = xe_bo_map(fd, bo1, bo_size);
 	}
 	memset(map0, 0, bo_size);
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index fe033e987..0835a1ff1 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -64,19 +64,19 @@ waitfence(int fd, enum waittype wt)
 	int64_t timeout;
 
 	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
-	bo_1 = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
+	bo_1 = xe_bo_create(fd, vm, 0x40000, any_vram_if_possible(fd), 0);
 	do_bind(fd, vm, bo_1, 0, 0x200000, 0x40000, 1);
-	bo_2 = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
+	bo_2 = xe_bo_create(fd, vm, 0x40000, any_vram_if_possible(fd), 0);
 	do_bind(fd, vm, bo_2, 0, 0xc0000000, 0x40000, 2);
-	bo_3 = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
+	bo_3 = xe_bo_create(fd, vm, 0x40000, any_vram_if_possible(fd), 0);
 	do_bind(fd, vm, bo_3, 0, 0x180000000, 0x40000, 3);
-	bo_4 = xe_bo_create(fd, vm, 0x10000, vram_if_possible(fd, 0), 0);
+	bo_4 = xe_bo_create(fd, vm, 0x10000, any_vram_if_possible(fd), 0);
 	do_bind(fd, vm, bo_4, 0, 0x140000000, 0x10000, 4);
-	bo_5 = xe_bo_create(fd, vm, 0x100000, vram_if_possible(fd, 0), 0);
+	bo_5 = xe_bo_create(fd, vm, 0x100000, any_vram_if_possible(fd), 0);
 	do_bind(fd, vm, bo_5, 0, 0x100000000, 0x100000, 5);
-	bo_6 = xe_bo_create(fd, vm, 0x1c0000, vram_if_possible(fd, 0), 0);
+	bo_6 = xe_bo_create(fd, vm, 0x1c0000, any_vram_if_possible(fd), 0);
 	do_bind(fd, vm, bo_6, 0, 0xc0040000, 0x1c0000, 6);
-	bo_7 = xe_bo_create(fd, vm, 0x10000, vram_if_possible(fd, 0), 0);
+	bo_7 = xe_bo_create(fd, vm, 0x10000, any_vram_if_possible(fd), 0);
 	do_bind(fd, vm, bo_7, 0, 0xeffff0000, 0x10000, 7);
 
 	if (wt == RELTIME) {
diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index 6f8592d3a..ae3114585 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -149,7 +149,7 @@ static void get_ccs_fb(int fd, struct drm_mode_fb_cmd2 *ret)
 	if (is_i915_device(fd))
 		add.handles[0] = gem_buffer_create_fb_obj(fd, size);
 	else
-		add.handles[0] = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0), 0);
+		add.handles[0] = xe_bo_create(fd, 0, size, any_vram_if_possible(fd), 0);
 	igt_require(add.handles[0] != 0);
 
 	if (!HAS_FLATCCS(devid))
-- 
2.34.1
