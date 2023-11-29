Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C3110E608
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 14:55:13 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Nov 2023 14:54:42 +0000
Message-Id: <20231129145457.7-6-francois.dugast@intel.com>
In-Reply-To: <20231129145457.7-1-francois.dugast@intel.com>
References: <20231129145457.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 05/20] xe_query: Kill visible_vram_if_possible
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

Let the caller set the flag and the xe_bo_query clear if
not needed.

Although the current helper makes the code cleaner, the
goal is to split the flags into placement and flags as two
different arguments on xe_bo_create. So, the flag decision
cannot be hidden under the helper.

v2: Fix one comment (Kamil Konieczny)

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 benchmarks/gem_wsim.c              |  3 ++-
 lib/igt_draw.c                     |  3 ++-
 lib/igt_fb.c                       |  3 ++-
 lib/intel_batchbuffer.c            |  6 ++++--
 lib/xe/xe_ioctl.c                  | 19 +++++++++++++++++++
 lib/xe/xe_query.c                  | 26 --------------------------
 lib/xe/xe_query.h                  |  1 -
 lib/xe/xe_spin.c                   |  7 ++++---
 tests/intel/kms_ccs.c              |  3 ++-
 tests/intel/xe_dma_buf_sync.c      |  3 ++-
 tests/intel/xe_exec_balancer.c     |  9 ++++++---
 tests/intel/xe_exec_basic.c        |  2 +-
 tests/intel/xe_exec_compute_mode.c |  3 ++-
 tests/intel/xe_exec_fault_mode.c   |  6 ++++--
 tests/intel/xe_exec_reset.c        | 14 +++++++++-----
 tests/intel/xe_exec_store.c        |  9 ++++++---
 tests/intel/xe_exec_threads.c      |  9 ++++++---
 tests/intel/xe_mmap.c              |  9 ++++++---
 tests/intel/xe_pm.c                |  3 ++-
 tests/intel/xe_pm_residency.c      |  3 ++-
 tests/intel/xe_prime_self_import.c | 27 ++++++++++++++++++---------
 tests/intel/xe_vm.c                | 21 ++++++++++++++-------
 22 files changed, 113 insertions(+), 76 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index cb19ad505..47692e94f 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1746,7 +1746,8 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
 	w->bb_size = ALIGN(PAGE_SIZE + xe_cs_prefetch_size(fd),
 			   xe_get_default_alignment(fd));
 	w->bb_handle = xe_bo_create(fd, vm->id, w->bb_size,
-				    visible_vram_if_possible(fd, eq->hwe_list[0].gt_id));
+				    vram_if_possible(fd, eq->hwe_list[0].gt_id) |
+				    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	w->xe.data = xe_bo_map(fd, w->bb_handle, w->bb_size);
 	w->xe.exec.address =
 		intel_allocator_alloc_with_strategy(vm->ahnd, w->bb_handle, w->bb_size,
diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index bad6f455a..4a8dd7bd9 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -797,7 +797,8 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
 	else
 		tmp.handle = xe_bo_create(fd, 0,
 					  ALIGN(tmp.size, xe_get_default_alignment(fd)),
-					  visible_vram_if_possible(fd, 0));
+					  vram_if_possible(fd, 0) |
+					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	tmp.stride = rect->w * pixel_size;
 	tmp.bpp = buf->bpp;
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index f96dca7a4..0a6aa27c8 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -1206,7 +1206,8 @@ static int create_bo_for_fb(struct igt_fb *fb, bool prefer_sysmem)
 			igt_assert(err == 0 || err == -EOPNOTSUPP);
 		} else if (is_xe_device(fd)) {
 			fb->gem_handle = xe_bo_create(fd, 0, fb->size,
-						      visible_vram_if_possible(fd, 0));
+						      vram_if_possible(fd, 0)
+						      | DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		} else if (is_vc4_device(fd)) {
 			fb->gem_handle = igt_vc4_create_bo(fd, fb->size);
 
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index c38eda771..ae7a43605 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -947,7 +947,8 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 
 		ibb->alignment = xe_get_default_alignment(fd);
 		size = ALIGN(size, ibb->alignment);
-		ibb->handle = xe_bo_create(fd, 0, size, visible_vram_if_possible(fd, 0));
+		ibb->handle = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0) |
+					   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 		/* Limit to 48-bit due to MI_* address limitation */
 		ibb->gtt_size = 1ull << min_t(uint32_t, xe_va_bits(fd), 48);
@@ -1406,7 +1407,8 @@ void intel_bb_reset(struct intel_bb *ibb, bool purge_objects_cache)
 		ibb->handle = gem_create(ibb->fd, ibb->size);
 	else
 		ibb->handle = xe_bo_create(ibb->fd, 0, ibb->size,
-					   visible_vram_if_possible(ibb->fd, 0));
+					   vram_if_possible(ibb->fd, 0) |
+					   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	/* Reacquire offset for RELOC and SIMPLE */
 	if (ibb->allocator_type == INTEL_ALLOCATOR_SIMPLE ||
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 63fa2ae25..3b8d2e1e5 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -226,6 +226,18 @@ void xe_vm_destroy(int fd, uint32_t vm)
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy), 0);
 }
 
+static bool vram_selected(int fd, uint32_t selected_regions)
+{
+	uint64_t regions = all_memory_regions(fd) & selected_regions;
+	uint64_t region;
+
+	xe_for_each_mem_region(fd, regions, region)
+		if (xe_mem_region(fd, region)->mem_class == DRM_XE_MEM_REGION_CLASS_VRAM)
+			return true;
+
+	return false;
+}
+
 uint32_t __xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t flags,
 			uint32_t *handle)
 {
@@ -236,6 +248,13 @@ uint32_t __xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t flags,
 	};
 	int err;
 
+	/*
+	 * In case vram_if_possible returned system_memory,
+	 * visible VRAM cannot be requested through flags
+	 */
+	if (!vram_selected(fd, flags))
+		create.flags &= ~DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
+
 	err = igt_ioctl(fd, DRM_IOCTL_XE_GEM_CREATE, &create);
 	if (err)
 		return err;
diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index afd443be3..760a150db 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -442,32 +442,6 @@ uint64_t vram_if_possible(int fd, int gt)
 	return vram_memory(fd, gt) ?: system_memory(fd);
 }
 
-/**
- * visible_vram_if_possible:
- * @fd: xe device fd
- * @gt: gt id
- *
- * Returns vram memory bitmask for xe device @fd and @gt id or system memory if
- * there's no vram memory available for @gt. Also attaches the
- * DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM to ensure that CPU access is possible
- * when using vram.
- */
-uint64_t visible_vram_if_possible(int fd, int gt)
-{
-	uint64_t regions = all_memory_regions(fd);
-	uint64_t system_memory = regions & 0x1;
-	uint64_t vram = regions & (0x2 << gt);
-
-	/*
-	 * TODO: Keep it backwards compat for now. Fixup once the kernel side
-	 * has landed.
-	 */
-	if (__xe_visible_vram_size(fd, gt))
-		return vram ? vram | DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM : system_memory;
-	else
-		return vram ? vram : system_memory; /* older kernel */
-}
-
 /**
  * xe_hw_engines:
  * @fd: xe device fd
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 7b3fc3100..4dd0ad573 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -82,7 +82,6 @@ uint64_t system_memory(int fd);
 uint64_t vram_memory(int fd, int gt);
 uint64_t visible_vram_memory(int fd, int gt);
 uint64_t vram_if_possible(int fd, int gt);
-uint64_t visible_vram_if_possible(int fd, int gt);
 struct drm_xe_engine_class_instance *xe_hw_engines(int fd);
 struct drm_xe_engine_class_instance *xe_hw_engine(int fd, int idx);
 struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region);
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 828938434..270b58bf5 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -220,7 +220,8 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
 	}
 
 	spin->handle = xe_bo_create(fd, spin->vm, bo_size,
-				    visible_vram_if_possible(fd, 0));
+				    vram_if_possible(fd, 0) |
+				    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	xe_spin = xe_bo_map(fd, spin->handle, bo_size);
 	addr = intel_allocator_alloc_with_strategy(ahnd, spin->handle, bo_size, 0, ALLOC_STRATEGY_LOW_TO_HIGH);
 	xe_vm_bind_sync(fd, spin->vm, spin->handle, 0, addr, bo_size);
@@ -298,8 +299,8 @@ void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
 
 	vm = xe_vm_create(fd, 0, 0);
 
-	bo = xe_bo_create(fd, vm, bo_size,
-			  visible_vram_if_possible(fd, hwe->gt_id));
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, hwe->gt_id) |
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	spin = xe_bo_map(fd, bo, 0x1000);
 
 	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index a5a8abb28..7a99da14e 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -453,7 +453,8 @@ static void test_bad_ccs_plane(data_t *data, int width, int height, int ccs_plan
 		bad_ccs_bo = is_i915_device(data->drm_fd) ?
 				gem_create(data->drm_fd, fb.size) :
 				xe_bo_create(data->drm_fd, 0, fb.size,
-					     visible_vram_if_possible(data->drm_fd, 0));
+					     vram_if_possible(data->drm_fd, 0) |
+					     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		f.handles[ccs_plane] = bad_ccs_bo;
 	}
 
diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
index ac9d9d767..9318647af 100644
--- a/tests/intel/xe_dma_buf_sync.c
+++ b/tests/intel/xe_dma_buf_sync.c
@@ -120,7 +120,8 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
 			xe_get_default_alignment(fd[0]));
 	for (i = 0; i < n_bo; ++i) {
 		bo[i] = xe_bo_create(fd[0], 0, bo_size,
-				     visible_vram_if_possible(fd[0], hwe0->gt_id));
+				     vram_if_possible(fd[0], hwe0->gt_id) |
+				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		dma_buf_fd[i] = prime_handle_to_fd(fd[0], bo[i]);
 		import_bo[i] = prime_fd_to_handle(fd[1], dma_buf_fd[i]);
 
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index da34e117d..388bb6185 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -70,7 +70,8 @@ static void test_all_active(int fd, int gt, int class)
 	bo_size = sizeof(*data) * num_placements;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt) |
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < num_placements; i++) {
@@ -224,7 +225,8 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		}
 		memset(data, 0, bo_size);
 	} else {
-		bo = xe_bo_create(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
+		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt) |
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 
@@ -452,7 +454,8 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 			igt_assert(data);
 		}
 	} else {
-		bo = xe_bo_create(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
+		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt) |
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index 841696b68..ca287b2e5 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -136,7 +136,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	} else {
 		uint32_t bo_flags;
 
-		bo_flags = visible_vram_if_possible(fd, eci->gt_id);
+		bo_flags = vram_if_possible(fd, eci->gt_id) | DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
 		if (flags & DEFER_ALLOC)
 			bo_flags |= DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING;
 
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index beb962f79..07a27fd29 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -142,7 +142,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		}
 	} else {
 		bo = xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0,
-				  bo_size, visible_vram_if_possible(fd, eci->gt_id));
+				  bo_size, vram_if_possible(fd, eci->gt_id) |
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 903ad430d..bfd61c4ea 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -153,10 +153,12 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		if (flags & PREFETCH)
 			bo = xe_bo_create(fd, 0, bo_size,
 					  all_memory_regions(fd) |
-					  visible_vram_if_possible(fd, 0));
+					  vram_if_possible(fd, 0) |
+					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		else
 			bo = xe_bo_create(fd, 0, bo_size,
-					  visible_vram_if_possible(fd, eci->gt_id));
+					  vram_if_possible(fd, eci->gt_id) |
+					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 704690e83..3affb19ae 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -51,7 +51,8 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 			xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  visible_vram_if_possible(fd, eci->gt_id));
+			  vram_if_possible(fd, eci->gt_id) |
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	spin = xe_bo_map(fd, bo, bo_size);
 
 	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
@@ -181,7 +182,8 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt) |
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < n_exec_queues; i++) {
@@ -368,7 +370,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 			xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  visible_vram_if_possible(fd, eci->gt_id));
+			  vram_if_possible(fd, eci->gt_id) | DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < n_exec_queues; i++) {
@@ -535,7 +537,8 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 			xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  visible_vram_if_possible(fd, eci->gt_id));
+			  vram_if_possible(fd, eci->gt_id) |
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 	memset(data, 0, bo_size);
 
@@ -661,7 +664,8 @@ static void submit_jobs(struct gt_thread_data *t)
 	uint32_t bo;
 	uint32_t *data;
 
-	bo = xe_bo_create(fd, vm, bo_size, visible_vram_if_possible(fd, 0));
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0) |
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 	data[0] = MI_BATCH_BUFFER_END;
 
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index bcc4de8d0..884183202 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -82,7 +82,8 @@ static void store(int fd)
 
 	hw_engine = xe_hw_engine(fd, 1);
 	bo = xe_bo_create(fd, vm, bo_size,
-			  visible_vram_if_possible(fd, hw_engine->gt_id));
+			  vram_if_possible(fd, hw_engine->gt_id) |
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	xe_vm_bind_async(fd, vm, hw_engine->gt_id, bo, 0, addr, bo_size, &sync, 1);
 	data = xe_bo_map(fd, bo, bo_size);
@@ -151,7 +152,8 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
 
 	for (i = 0; i < count; i++) {
 		bo[i] = xe_bo_create(fd, vm, bo_size,
-				     visible_vram_if_possible(fd, eci->gt_id));
+				     vram_if_possible(fd, eci->gt_id) |
+				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		bo_map[i] = xe_bo_map(fd, bo[i], bo_size);
 		dst_offset[i] = intel_allocator_alloc_with_strategy(ahnd, bo[i],
 								    bo_size, 0,
@@ -236,7 +238,8 @@ static void store_all(int fd, int gt, int class)
 			xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  visible_vram_if_possible(fd, 0));
+			  vram_if_possible(fd, 0) |
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
 	xe_for_each_hw_engine(fd, hwe) {
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index a9b0c0b09..ebc41dadd 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -107,7 +107,8 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		}
 	} else {
 		bo = xe_bo_create(fd, vm, bo_size,
-				  visible_vram_if_possible(fd, gt));
+				  vram_if_possible(fd, gt) |
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
@@ -308,7 +309,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		}
 	} else {
 		bo = xe_bo_create(fd, 0, bo_size,
-				  visible_vram_if_possible(fd, eci->gt_id));
+				  vram_if_possible(fd, eci->gt_id) |
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
@@ -511,7 +513,8 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		}
 	} else {
 		bo = xe_bo_create(fd, vm, bo_size,
-				  visible_vram_if_possible(fd, eci->gt_id));
+				  vram_if_possible(fd, eci->gt_id) |
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index a805eabda..a4b53ad48 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -73,7 +73,8 @@ static void test_bad_flags(int fd)
 	uint64_t size = xe_get_default_alignment(fd);
 	struct drm_xe_gem_mmap_offset mmo = {
 		.handle = xe_bo_create(fd, 0, size,
-				       visible_vram_if_possible(fd, 0)),
+				       vram_if_possible(fd, 0) |
+				       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM),
 		.flags = -1u,
 	};
 
@@ -93,7 +94,8 @@ static void test_bad_extensions(int fd)
 	struct xe_user_extension ext;
 	struct drm_xe_gem_mmap_offset mmo = {
 		.handle = xe_bo_create(fd, 0, size,
-				       visible_vram_if_possible(fd, 0)),
+				       vram_if_possible(fd, 0) |
+				       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM),
 	};
 
 	mmo.extensions = to_user_pointer(&ext);
@@ -114,7 +116,8 @@ static void test_bad_object(int fd)
 	uint64_t size = xe_get_default_alignment(fd);
 	struct drm_xe_gem_mmap_offset mmo = {
 		.handle = xe_bo_create(fd, 0, size,
-				       visible_vram_if_possible(fd, 0)),
+				       vram_if_possible(fd, 0) |
+				       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM),
 	};
 
 	mmo.handle = 0xdeadbeef;
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 9bfe1acad..9fd3527f7 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -272,7 +272,8 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
 
 	bo = xe_bo_create(device.fd_xe, vm, bo_size,
-			  visible_vram_if_possible(device.fd_xe, eci->gt_id));
+			  vram_if_possible(device.fd_xe, eci->gt_id) |
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(device.fd_xe, bo, bo_size);
 
 	for (i = 0; i < n_exec_queues; i++) {
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index cc133f5fb..40a1693b8 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -101,7 +101,8 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned
 	bo_size = xe_get_default_alignment(fd);
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  visible_vram_if_possible(fd, hwe->gt_id));
+			  vram_if_possible(fd, hwe->gt_id) |
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 	syncobj = syncobj_create(fd, 0);
 
diff --git a/tests/intel/xe_prime_self_import.c b/tests/intel/xe_prime_self_import.c
index 378368eaa..2c2f2898c 100644
--- a/tests/intel/xe_prime_self_import.c
+++ b/tests/intel/xe_prime_self_import.c
@@ -105,7 +105,8 @@ static void test_with_fd_dup(void)
 	fd1 = drm_open_driver(DRIVER_XE);
 	fd2 = drm_open_driver(DRIVER_XE);
 
-	handle = xe_bo_create(fd1, 0, bo_size, visible_vram_if_possible(fd1, 0));
+	handle = xe_bo_create(fd1, 0, bo_size, vram_if_possible(fd1, 0) |
+			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	dma_buf_fd1 = prime_handle_to_fd(fd1, handle);
 	gem_close(fd1, handle);
@@ -138,8 +139,10 @@ static void test_with_two_bos(void)
 	fd1 = drm_open_driver(DRIVER_XE);
 	fd2 = drm_open_driver(DRIVER_XE);
 
-	handle1 = xe_bo_create(fd1, 0, bo_size, visible_vram_if_possible(fd1, 0));
-	handle2 = xe_bo_create(fd1, 0, bo_size, visible_vram_if_possible(fd1, 0));
+	handle1 = xe_bo_create(fd1, 0, bo_size, vram_if_possible(fd1, 0) |
+			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	handle2 = xe_bo_create(fd1, 0, bo_size, vram_if_possible(fd1, 0) |
+			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	dma_buf_fd = prime_handle_to_fd(fd1, handle1);
 	handle_import = prime_fd_to_handle(fd2, dma_buf_fd);
@@ -175,7 +178,8 @@ static void test_with_one_bo_two_files(void)
 	fd2 = drm_open_driver(DRIVER_XE);
 
 	handle_orig = xe_bo_create(fd1, 0, bo_size,
-				   visible_vram_if_possible(fd1, 0));
+				   vram_if_possible(fd1, 0) |
+				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	dma_buf_fd1 = prime_handle_to_fd(fd1, handle_orig);
 
 	flink_name = gem_flink(fd1, handle_orig);
@@ -207,7 +211,8 @@ static void test_with_one_bo(void)
 	fd1 = drm_open_driver(DRIVER_XE);
 	fd2 = drm_open_driver(DRIVER_XE);
 
-	handle = xe_bo_create(fd1, 0, bo_size, visible_vram_if_possible(fd1, 0));
+	handle = xe_bo_create(fd1, 0, bo_size, vram_if_possible(fd1, 0) |
+			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	dma_buf_fd = prime_handle_to_fd(fd1, handle);
 	handle_import1 = prime_fd_to_handle(fd2, dma_buf_fd);
@@ -294,7 +299,8 @@ static void *thread_fn_reimport_vs_close(void *p)
 	fds[0] = drm_open_driver(DRIVER_XE);
 
 	handle = xe_bo_create(fds[0], 0, bo_size,
-			      visible_vram_if_possible(fds[0], 0));
+			      vram_if_possible(fds[0], 0) |
+			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	fds[1] = prime_handle_to_fd(fds[0], handle);
 	pthread_barrier_init(&g_barrier, NULL, num_threads);
@@ -337,7 +343,8 @@ static void *thread_fn_export_vs_close(void *p)
 	igt_until_timeout(g_time_out) {
 		/* We want to race gem close against prime export on handle one.*/
 		handle = xe_bo_create(fd, 0, bo_size,
-				      visible_vram_if_possible(fd, 0));
+				      vram_if_possible(fd, 0) |
+				      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		if (handle != 1)
 			gem_close(fd, handle);
 
@@ -434,7 +441,8 @@ static void test_llseek_size(void)
 		int bufsz = xe_get_default_alignment(fd) << i;
 
 		handle = xe_bo_create(fd, 0, bufsz,
-				      visible_vram_if_possible(fd, 0));
+				      vram_if_possible(fd, 0) |
+				      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		dma_buf_fd = prime_handle_to_fd(fd, handle);
 
 		gem_close(fd, handle);
@@ -463,7 +471,8 @@ static void test_llseek_bad(void)
 	fd = drm_open_driver(DRIVER_XE);
 
 	handle = xe_bo_create(fd, 0, bo_size,
-			      visible_vram_if_possible(fd, 0));
+			      vram_if_possible(fd, 0) |
+			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
 
 	gem_close(fd, handle);
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 52241314c..7db15d4e9 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -52,7 +52,8 @@ write_dwords(int fd, uint32_t vm, int n_dwords, uint64_t *addrs)
 	batch_size = ALIGN(batch_size + xe_cs_prefetch_size(fd),
 			   xe_get_default_alignment(fd));
 	batch_bo = xe_bo_create(fd, vm, batch_size,
-				visible_vram_if_possible(fd, 0));
+				vram_if_possible(fd, 0) |
+				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	batch_map = xe_bo_map(fd, batch_bo, batch_size);
 
 	for (i = 0; i < n_dwords; i++) {
@@ -116,7 +117,8 @@ __test_bind_one_bo(int fd, uint32_t vm, int n_addrs, uint64_t *addrs)
 		vms = malloc(sizeof(*vms) * n_addrs);
 		igt_assert(vms);
 	}
-	bo = xe_bo_create(fd, vm, bo_size, visible_vram_if_possible(fd, 0));
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0) |
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	map = xe_bo_map(fd, bo, bo_size);
 	memset(map, 0, bo_size);
 
@@ -422,7 +424,8 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 
 	for (i = 0; i < n_bo; ++i) {
 		bo[i] = xe_bo_create(fd, vm, bo_size,
-				     visible_vram_if_possible(fd, eci->gt_id));
+				     vram_if_possible(fd, eci->gt_id) |
+				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		data[i] = xe_bo_map(fd, bo[i], bo_size);
 	}
 
@@ -601,7 +604,8 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 	bo = xe_bo_create(fd, vm, bo_size,
-			  visible_vram_if_possible(fd, eci->gt_id));
+			  vram_if_possible(fd, eci->gt_id) |
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < N_EXEC_QUEUES; i++) {
@@ -782,7 +786,8 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 			xe_get_default_alignment(fd));
 
 	bo = xe_bo_create(fd, vm, bo_size,
-			  visible_vram_if_possible(fd, eci->gt_id));
+			  vram_if_possible(fd, eci->gt_id) |
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	data = xe_bo_map(fd, bo, bo_size);
 
 	if (flags & BIND_ARRAY_BIND_EXEC_QUEUE_FLAG)
@@ -980,7 +985,8 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
 			    xe_visible_vram_size(fd, 0));
 
 		bo = xe_bo_create(fd, vm, bo_size,
-				  visible_vram_if_possible(fd, eci->gt_id));
+				  vram_if_possible(fd, eci->gt_id) |
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		map = xe_bo_map(fd, bo, bo_size);
 	}
 
@@ -1274,7 +1280,8 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 		igt_assert(map != MAP_FAILED);
 	} else {
 		bo = xe_bo_create(fd, vm, bo_size,
-				  visible_vram_if_possible(fd, eci->gt_id));
+				  vram_if_possible(fd, eci->gt_id) |
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		map = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(map, 0, bo_size);
-- 
2.34.1
