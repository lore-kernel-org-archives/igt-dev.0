Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528CF10EA21
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:45:02 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:41 +0000
Message-Id: <20231103144359.7-47-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 46/64] drm-uapi/xe: Move memory_region masks
 from GT to engine
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

Align with kernel commit ("drm/xe/uapi: Move memory_region masks from GT to engine")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 benchmarks/gem_wsim.c              |  2 +-
 include/drm-uapi/xe_drm.h          | 27 ++++++++-------
 lib/xe/xe_query.c                  | 54 +++++++++++++++++++-----------
 lib/xe/xe_query.h                  |  8 +++--
 lib/xe/xe_spin.c                   |  2 +-
 tests/intel/xe_dma_buf_sync.c      |  2 +-
 tests/intel/xe_evict.c             | 12 +++----
 tests/intel/xe_exec_balancer.c     |  6 ++--
 tests/intel/xe_exec_basic.c        |  2 +-
 tests/intel/xe_exec_compute_mode.c |  2 +-
 tests/intel/xe_exec_fault_mode.c   |  2 +-
 tests/intel/xe_exec_reset.c        |  8 ++---
 tests/intel/xe_exec_store.c        |  2 +-
 tests/intel/xe_exec_threads.c      |  6 ++--
 tests/intel/xe_guc_pc.c            |  2 +-
 tests/intel/xe_pm.c                |  2 +-
 tests/intel/xe_pm_residency.c      |  2 +-
 tests/intel/xe_query.c             |  8 ++---
 tests/intel/xe_vm.c                | 14 ++++----
 19 files changed, 92 insertions(+), 71 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 5ba5f2e2c..5154974e3 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1735,7 +1735,7 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
 	int i;
 
 	w->bb_handle = xe_bo_create(fd, vm->id, PAGE_SIZE,
-				    vram_near_gt_if_possible(fd, eq->eci_list[0].gt_id),
+				    vram_near_eci_if_possible(fd, &eq->eci_list[0]),
 				    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	w->xe.data = xe_bo_map(fd, w->bb_handle, PAGE_SIZE);
 	w->xe.exec.address =
diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 9ec0506d5..aecd2d736 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -228,6 +228,20 @@ struct drm_xe_query_engine_info {
 	/** @instance: The @drm_xe_engine_class_instance */
 	struct drm_xe_engine_class_instance instance;
 
+	/**
+	 * @near_mem_regions: Bit mask of instances from
+	 * drm_xe_query_mem_regions that is near this engine.
+	 */
+	__u64 near_mem_regions;
+	/**
+	 * @far_mem_regions: Bit mask of instances from
+	 * drm_xe_query_mem_regions that is far from this engine.
+	 * In general, it has extra indirections when compared to the
+	 * @near_mem_regions. For a discrete device this could mean system
+	 * memory and memory living in a different Tile.
+	 */
+	__u64 far_mem_regions;
+
 	/** @reserved: Reserved */
 	__u64 reserved[3];
 };
@@ -401,19 +415,6 @@ struct drm_xe_query_gt {
 	__u16 gt_id;
 	/** @clock_freq: A clock frequency for timestamp */
 	__u32 clock_freq;
-	/**
-	 * @near_mem_regions: Bit mask of instances from
-	 * drm_xe_query_mem_regions that is near the current engines of this GT.
-	 */
-	__u64 near_mem_regions;
-	/**
-	 * @far_mem_regions: Bit mask of instances from
-	 * drm_xe_query_mem_regions that is far from the engines of this GT.
-	 * In general, it has extra indirections when compared to the
-	 * @near_mem_regions. For a discrete device this could mean system
-	 * memory and memory living in a different Tile.
-	 */
-	__u64 far_mem_regions;
 	/** @reserved: Reserved */
 	__u64 reserved[8];
 };
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index a9f4bbba1..267e538d0 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -114,12 +114,12 @@ static struct drm_xe_query_mem_regions *xe_query_mem_regions_new(int fd)
 	return mem_regions;
 }
 
-static uint64_t mem_region_near_gt(const struct drm_xe_query_gt_list *gt_list, int gt)
+static uint64_t mem_region_near_engine(struct drm_xe_query_engine_info *engine)
 {
 	uint64_t region;
 
-	igt_assert(gt_list->num_gt > gt);
-	region = gt_list->gt_list[gt].near_mem_regions;
+	igt_assert(engine);
+	region = engine->near_mem_regions;
 	igt_assert(region);
 
 	return region;
@@ -365,21 +365,33 @@ uint64_t any_vram(int fd)
 }
 
 /**
- * vram_near_gt:
+ * vram_near_eci:
  * @fd: xe device fd
- * @gt: gt id
+ * @eci: engine class instance
  *
- * Returns memory bitmask for the vram region that is near the given @gt id.
+ * Returns memory bitmask for the vram region that is near the given @eci.
  */
-uint64_t vram_near_gt(int fd, int gt)
+uint64_t vram_near_eci(int fd, struct drm_xe_engine_class_instance *eci)
 {
 	struct xe_device *xe_dev;
+	struct drm_xe_query_engine_info *engine;
+	struct drm_xe_engine_class_instance *eci1;
+
+	if (!xe_has_vram(fd))
+		return 0;
 
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
-	igt_assert(gt >= 0 && gt < xe_dev->gt_list->num_gt);
 
-	return xe_has_vram(fd) ? mem_region_near_gt(xe_dev->gt_list, gt) : 0;
+	xe_for_each_engine(fd, engine) {
+		eci1 = &engine->instance;
+		if (eci1->engine_class == eci->engine_class &&
+		    eci1->engine_instance == eci->engine_instance &&
+		    eci1->gt_id == eci->gt_id)
+			return mem_region_near_engine(engine);
+	}
+
+	return 0;
 }
 
 /**
@@ -396,17 +408,17 @@ uint64_t any_vram_if_possible(int fd)
 }
 
 /**
- * vram_near_gt_if_possible:
+ * vram_near_eci_if_possible:
  * @fd: xe device fd
- * @gt: gt id
+ * @eci: engine class instance
  *
  * Returns a memory region bitmask. If possible, it returns a bitmask for a
- * vram region near the given @gt id. Otherwise it returns a bitmask for a
+ * vram region near the given @eci. Otherwise it returns a bitmask for a
  * system memory region.
  */
-uint64_t vram_near_gt_if_possible(int fd, int gt)
+uint64_t vram_near_eci_if_possible(int fd, struct drm_xe_engine_class_instance *eci)
 {
-	return vram_near_gt(fd, gt) ?: system_memory(fd);
+	return vram_near_eci(fd, eci) ?: system_memory(fd);
 }
 
 /**
@@ -562,15 +574,19 @@ uint64_t xe_vram_size_any_region(int fd)
 uint64_t xe_vram_size_region_near_gt(int fd, int gt)
 {
 	struct xe_device *xe_dev;
+	struct drm_xe_query_engine_info *engine;
 
 	xe_dev = find_in_cache(fd);
 	igt_assert(xe_dev);
 
-	for (int i = 0; i < xe_dev->mem_regions->num_regions; i++)
-		if (XE_IS_CLASS_VRAM(&xe_dev->mem_regions->regions[i]) &&
-		    ((1 << xe_dev->mem_regions->regions[i].instance) &
-		     mem_region_near_gt(xe_dev->gt_list, gt)))
-			return xe_dev->mem_regions->regions[i].total_size;
+	xe_for_each_engine(fd, engine) {
+		if (gt == engine->instance.gt_id)
+			for (int i = 0; i < xe_dev->mem_regions->num_regions; i++)
+				if (XE_IS_CLASS_VRAM(&xe_dev->mem_regions->regions[i]) &&
+				    ((1 << xe_dev->mem_regions->regions[i].instance) &
+				     mem_region_near_engine(engine)))
+					return xe_dev->mem_regions->regions[i].total_size;
+	}
 
 	return 0;
 }
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index bec2a7ed6..3eee75ff4 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -54,6 +54,9 @@ struct xe_device {
 	uint16_t dev_id;
 };
 
+#define xe_for_each_engine(__fd, __engine) \
+	for (int __i = 0; __i < xe_number_engines(__fd) && \
+	     (__engine = xe_engine(__fd, __i)); ++__i)
 #define xe_for_each_engine_instance(__fd, __eci) \
 	for (int __i = 0; __i < xe_number_engines(__fd) && \
 	     (__eci = &xe_engine(__fd, __i)->instance); ++__i)
@@ -74,9 +77,9 @@ unsigned int xe_number_gt(int fd);
 uint64_t all_memory_regions(int fd);
 uint64_t system_memory(int fd);
 uint64_t any_vram(int fd);
-uint64_t vram_near_gt(int fd, int gt);
+uint64_t vram_near_eci(int fd, struct drm_xe_engine_class_instance *eci);
 uint64_t any_vram_if_possible(int fd);
-uint64_t vram_near_gt_if_possible(int fd, int gt);
+uint64_t vram_near_eci_if_possible(int fd, struct drm_xe_engine_class_instance *eci);
 struct drm_xe_query_engine_info *xe_engines(int fd);
 struct drm_xe_query_engine_info *xe_engine(int fd, int idx);
 struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region);
@@ -90,6 +93,7 @@ uint64_t xe_vram_size_any_region(int fd);
 uint64_t xe_vram_size_region_near_gt(int fd, int gt);
 uint64_t xe_visible_vram_size_any_region(int fd);
 uint64_t xe_vram_available_any_region(int fd);
+uint64_t xe_visible_vram_size_region_near_gt(int fd, int gt);
 uint32_t xe_get_default_alignment(int fd);
 uint32_t xe_va_bits(int fd);
 uint16_t xe_dev_id(int fd);
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 0aeddb9ac..506ddc090 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -301,7 +301,7 @@ void xe_cork_init(int fd, struct drm_xe_engine_class_instance *eci,
 
 	vm = xe_vm_create(fd, 0, 0);
 
-	bo = xe_bo_create(fd, vm, bo_size, vram_near_gt_if_possible(fd, eci->gt_id),
+	bo = xe_bo_create(fd, vm, bo_size, vram_near_eci_if_possible(fd, eci),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	spin = xe_bo_map(fd, bo, 0x1000);
 
diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
index 86441864e..9a42f8e35 100644
--- a/tests/intel/xe_dma_buf_sync.c
+++ b/tests/intel/xe_dma_buf_sync.c
@@ -120,7 +120,7 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *eci0,
 			xe_get_default_alignment(fd[0]));
 	for (i = 0; i < n_bo; ++i) {
 		bo[i] = xe_bo_create(fd[0], 0, bo_size,
-				     vram_near_gt_if_possible(fd[0], eci0->gt_id),
+				     vram_near_eci_if_possible(fd[0], eci0),
 				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		dma_buf_fd[i] = prime_handle_to_fd(fd[0], bo[i]);
 		import_bo[i] = prime_fd_to_handle(fd[1], dma_buf_fd[i]);
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 1c8d52358..2a667a679 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -103,17 +103,17 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 			if (flags & MULTI_VM) {
 				__bo = bo[i] = xe_bo_create(fd, 0,
 							    bo_size,
-							    vram_near_gt(fd, eci->gt_id),
+							    vram_near_eci(fd, eci),
 							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 			} else if (flags & THREADED) {
 				__bo = bo[i] = xe_bo_create(fd, vm,
 							    bo_size,
-							    vram_near_gt(fd, eci->gt_id),
+							    vram_near_eci(fd, eci),
 							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 			} else {
 				__bo = bo[i] = xe_bo_create(fd, _vm,
 							    bo_size,
-							    vram_near_gt(fd, eci->gt_id) |
+							    vram_near_eci(fd, eci) |
 							    system_memory(fd),
 							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 			}
@@ -283,17 +283,17 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 			if (flags & MULTI_VM) {
 				__bo = bo[i] = xe_bo_create(fd, 0,
 							    bo_size,
-							    vram_near_gt(fd, eci->gt_id),
+							    vram_near_eci(fd, eci),
 							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 			} else if (flags & THREADED) {
 				__bo = bo[i] = xe_bo_create(fd, vm,
 							    bo_size,
-							    vram_near_gt(fd, eci->gt_id),
+							    vram_near_eci(fd, eci),
 							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 			} else {
 				__bo = bo[i] = xe_bo_create(fd, _vm,
 							    bo_size,
-							    vram_near_gt(fd, eci->gt_id) |
+							    vram_near_eci(fd, eci) |
 							    system_memory(fd),
 							    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 			}
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index e06414c14..22fce66f7 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -72,7 +72,7 @@ static void test_all_active(int fd, int gt, int class)
 	bo_size = sizeof(*data) * num_placements;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, vm, bo_size, vram_near_gt_if_possible(fd, gt),
+	bo = xe_bo_create(fd, vm, bo_size, vram_near_eci_if_possible(fd, &eci_list[0]),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
@@ -229,7 +229,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		}
 		memset(data, 0, bo_size);
 	} else {
-		bo = xe_bo_create(fd, vm, bo_size, vram_near_gt_if_possible(fd, gt),
+		bo = xe_bo_create(fd, vm, bo_size, vram_near_eci_if_possible(fd, &eci_list[0]),
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
@@ -459,7 +459,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 			igt_assert(data);
 		}
 	} else {
-		bo = xe_bo_create(fd, vm, bo_size, vram_near_gt_if_possible(fd, gt),
+		bo = xe_bo_create(fd, vm, bo_size, vram_near_eci_if_possible(fd, &eci_list[0]),
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index 923e8d2db..5b1fe6469 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -143,7 +143,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			bo_flags |= DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING;
 
 		bo = xe_bo_create(fd, n_vm == 1 ? vm[0] : 0, bo_size,
-				  vram_near_gt_if_possible(fd, eci->gt_id), bo_flags);
+				  vram_near_eci_if_possible(fd, eci), bo_flags);
 		if (!(flags & DEFER_BIND))
 			data = xe_bo_map(fd, bo, bo_size);
 	}
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index ba0f09104..91c2319e7 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -143,7 +143,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		}
 	} else {
 		bo = xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0,
-				  bo_size, vram_near_gt_if_possible(fd, eci->gt_id),
+				  bo_size, vram_near_eci_if_possible(fd, eci),
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 1b2024f38..7f5ad8701 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -158,7 +158,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		else
 			bo = xe_bo_create(fd, 0, bo_size,
-					  vram_near_gt_if_possible(fd, eci->gt_id),
+					  vram_near_eci_if_possible(fd, eci),
 					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 72a9d902d..119356338 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -53,7 +53,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 			xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_near_gt_if_possible(fd, eci->gt_id),
+			  vram_near_eci_if_possible(fd, eci),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	spin = xe_bo_map(fd, bo, bo_size);
 
@@ -186,7 +186,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, vm, bo_size, vram_near_gt_if_possible(fd, gt),
+	bo = xe_bo_create(fd, vm, bo_size, vram_near_eci_if_possible(fd, &eci_list[0]),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
@@ -376,7 +376,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 			xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_near_gt_if_possible(fd, eci->gt_id),
+			  vram_near_eci_if_possible(fd, eci),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
@@ -545,7 +545,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 			xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_near_gt_if_possible(fd, eci->gt_id),
+			  vram_near_eci_if_possible(fd, eci),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 	memset(data, 0, bo_size);
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 5c74e63a5..1c99e7569 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -83,7 +83,7 @@ static void store(int fd)
 
 	engine = xe_engine(fd, 1);
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_near_gt_if_possible(fd, engine->instance.gt_id),
+			  vram_near_eci_if_possible(fd, &engine->instance),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0, addr, bo_size, &sync, 1);
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 7ad2233dc..fa8ef8645 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -109,7 +109,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		}
 	} else {
 		bo = xe_bo_create(fd, vm, bo_size,
-				  vram_near_gt_if_possible(fd, gt),
+				  vram_near_eci_if_possible(fd, &eci_list[0]),
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
@@ -312,7 +312,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		}
 	} else {
 		bo = xe_bo_create(fd, 0, bo_size,
-				  vram_near_gt_if_possible(fd, eci->gt_id),
+				  vram_near_eci_if_possible(fd, eci),
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
@@ -518,7 +518,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		}
 	} else {
 		bo = xe_bo_create(fd, vm, bo_size,
-				  vram_near_gt_if_possible(fd, eci->gt_id),
+				  vram_near_eci_if_possible(fd, eci),
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_guc_pc.c
index b04a145be..a36f6542b 100644
--- a/tests/intel/xe_guc_pc.c
+++ b/tests/intel/xe_guc_pc.c
@@ -68,7 +68,7 @@ static void exec_basic(int fd, struct drm_xe_engine_class_instance *eci,
 			xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_near_gt_if_possible(fd, eci->gt_id),
+			  vram_near_eci_if_possible(fd, eci),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index e4a410a8a..3c0aed4f9 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -274,7 +274,7 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
 
 	bo = xe_bo_create(device.fd_xe, vm, bo_size,
-			  vram_near_gt_if_possible(device.fd_xe, eci->gt_id),
+			  vram_near_eci_if_possible(device.fd_xe, eci),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(device.fd_xe, bo, bo_size);
 
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index b5c304df3..f701696ac 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -102,7 +102,7 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *eci, unsigned
 	bo_size = xe_get_default_alignment(fd);
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_near_gt_if_possible(fd, eci->gt_id),
+			  vram_near_eci_if_possible(fd, eci),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 	syncobj = syncobj_create(fd, 0);
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index de3b66564..9111e2a08 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -206,6 +206,10 @@ test_query_engines(int fd)
 			 xe_engine_class_string(eci->engine_class),
 			 eci->engine_instance,
 			 eci->gt_id);
+		igt_info("near_mem_regions: 0x%016llx\n",
+			 engines[i].near_mem_regions);
+		igt_info("far_mem_regions: 0x%016llx\n",
+			 engines[i].far_mem_regions);
 	}
 
 	igt_assert(i > 0);
@@ -302,10 +306,6 @@ test_query_gt_list(int fd)
 		igt_info("type: %d\n", gt_list->gt_list[i].type);
 		igt_info("gt_id: %d\n", gt_list->gt_list[i].gt_id);
 		igt_info("clock_freq: %u\n", gt_list->gt_list[i].clock_freq);
-		igt_info("near_mem_regions: 0x%016llx\n",
-		       gt_list->gt_list[i].near_mem_regions);
-		igt_info("far_mem_regions: 0x%016llx\n",
-		       gt_list->gt_list[i].far_mem_regions);
 	}
 }
 
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 9fc61c179..7dd0ec5f2 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -384,7 +384,7 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 
 	for (i = 0; i < n_bo; ++i) {
 		bo[i] = xe_bo_create(fd, vm, bo_size,
-				     vram_near_gt_if_possible(fd, eci->gt_id),
+				     vram_near_eci_if_possible(fd, eci),
 				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data[i] = xe_bo_map(fd, bo[i], bo_size);
 	}
@@ -566,7 +566,7 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_near_gt_if_possible(fd, eci->gt_id),
+			  vram_near_eci_if_possible(fd, eci),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
@@ -750,7 +750,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 			xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  vram_near_gt_if_possible(fd, eci->gt_id),
+			  vram_near_eci_if_possible(fd, eci),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
@@ -951,7 +951,7 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
 			    xe_visible_vram_size_any_region(fd));
 
 		bo = xe_bo_create(fd, vm, bo_size,
-				  vram_near_gt_if_possible(fd, eci->gt_id),
+				  vram_near_eci_if_possible(fd, eci),
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		map = xe_bo_map(fd, bo, bo_size);
 	}
@@ -1247,7 +1247,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 		igt_assert(map != MAP_FAILED);
 	} else {
 		bo = xe_bo_create(fd, vm, bo_size,
-				  vram_near_gt_if_possible(fd, eci->gt_id),
+				  vram_near_eci_if_possible(fd, eci),
 				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		map = xe_bo_map(fd, bo, bo_size);
 	}
@@ -1552,9 +1552,9 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 		igt_assert(map0 != MAP_FAILED);
 		igt_assert(map1 != MAP_FAILED);
 	} else {
-		bo0 = xe_bo_create(fd, vm, bo_size, vram_near_gt_if_possible(fd, eci->gt_id), 0);
+		bo0 = xe_bo_create(fd, vm, bo_size, vram_near_eci_if_possible(fd, eci), 0);
 		map0 = xe_bo_map(fd, bo0, bo_size);
-		bo1 = xe_bo_create(fd, vm, bo_size, vram_near_gt_if_possible(fd, eci->gt_id), 0);
+		bo1 = xe_bo_create(fd, vm, bo_size, vram_near_eci_if_possible(fd, eci), 0);
 		map1 = xe_bo_map(fd, bo1, bo_size);
 	}
 	memset(map0, 0, bo_size);
-- 
2.34.1
