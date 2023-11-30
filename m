Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DDF10E764
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 18:45:52 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:45:18 +0000
Message-Id: <20231130184536.7-4-francois.dugast@intel.com>
In-Reply-To: <20231130184536.7-1-francois.dugast@intel.com>
References: <20231130184536.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v5 03/21] xe_ioctl: Rename *xe_bo_create_flags to
 simply xe_bo_create
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

Now that we have only one variant we can unify to the
simplest version.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 benchmarks/gem_wsim.c              |  4 +--
 lib/igt_draw.c                     |  2 +-
 lib/igt_fb.c                       |  4 +--
 lib/intel_batchbuffer.c            |  6 ++---
 lib/intel_blt.c                    |  2 +-
 lib/intel_bufops.c                 |  2 +-
 lib/xe/xe_ioctl.c                  | 12 ++++-----
 lib/xe/xe_ioctl.h                  |  4 +--
 lib/xe/xe_spin.c                   |  8 +++---
 tests/intel/api_intel_allocator.c  |  4 +--
 tests/intel/kms_big_fb.c           | 22 ++++++++--------
 tests/intel/kms_ccs.c              |  4 +--
 tests/intel/xe_ccs.c               | 12 ++++-----
 tests/intel/xe_copy_basic.c        |  8 +++---
 tests/intel/xe_dma_buf_sync.c      |  4 +--
 tests/intel/xe_drm_fdinfo.c        |  6 ++---
 tests/intel/xe_evict.c             | 40 +++++++++++++++---------------
 tests/intel/xe_evict_ccs.c         |  6 ++---
 tests/intel/xe_exec_balancer.c     |  6 ++---
 tests/intel/xe_exec_basic.c        |  3 +--
 tests/intel/xe_exec_compute_mode.c |  4 +--
 tests/intel/xe_exec_fault_mode.c   | 10 ++++----
 tests/intel/xe_exec_reset.c        | 16 ++++++------
 tests/intel/xe_exec_store.c        | 12 ++++-----
 tests/intel/xe_exec_threads.c      | 12 ++++-----
 tests/intel/xe_exercise_blt.c      |  4 +--
 tests/intel/xe_intel_bb.c          |  2 +-
 tests/intel/xe_mmap.c              | 32 ++++++++++++------------
 tests/intel/xe_noexec_ping_pong.c  |  4 +--
 tests/intel/xe_pat.c               |  2 +-
 tests/intel/xe_perf_pmu.c          |  4 +--
 tests/intel/xe_pm.c                |  6 ++---
 tests/intel/xe_pm_residency.c      |  4 +--
 tests/intel/xe_prime_self_import.c | 28 ++++++++++-----------
 tests/intel/xe_spin_batch.c        |  2 +-
 tests/intel/xe_vm.c                | 34 ++++++++++++-------------
 tests/intel/xe_waitfence.c         | 20 +++++++--------
 tests/kms_addfb_basic.c            |  2 +-
 tests/kms_getfb.c                  |  2 +-
 39 files changed, 179 insertions(+), 180 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index b60cde177..cb19ad505 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1745,8 +1745,8 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
 
 	w->bb_size = ALIGN(PAGE_SIZE + xe_cs_prefetch_size(fd),
 			   xe_get_default_alignment(fd));
-	w->bb_handle = xe_bo_create_flags(fd, vm->id, w->bb_size,
-				visible_vram_if_possible(fd, eq->hwe_list[0].gt_id));
+	w->bb_handle = xe_bo_create(fd, vm->id, w->bb_size,
+				    visible_vram_if_possible(fd, eq->hwe_list[0].gt_id));
 	w->xe.data = xe_bo_map(fd, w->bb_handle, w->bb_size);
 	w->xe.exec.address =
 		intel_allocator_alloc_with_strategy(vm->ahnd, w->bb_handle, w->bb_size,
diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 872658886..a1af55a9a 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -799,7 +799,7 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
 	if (is_i915_device(fd))
 		tmp.handle = gem_create(fd, tmp.size);
 	else
-		tmp.handle = xe_bo_create_flags(fd, 0,
+		tmp.handle = xe_bo_create(fd, 0,
 						ALIGN(tmp.size, xe_get_default_alignment(fd)),
 						visible_vram_if_possible(fd, 0) |
 						DRM_XE_GEM_CREATE_FLAG_SCANOUT);
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index d82be021f..886fef71f 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -1206,7 +1206,7 @@ static int create_bo_for_fb(struct igt_fb *fb, bool prefer_sysmem)
 			/* If we can't use fences, we won't use ggtt detiling later. */
 			igt_assert(err == 0 || err == -EOPNOTSUPP);
 		} else if (is_xe_device(fd)) {
-			fb->gem_handle = xe_bo_create_flags(fd, 0, fb->size,
+			fb->gem_handle = xe_bo_create(fd, 0, fb->size,
 							    visible_vram_if_possible(fd, 0) |
 							    DRM_XE_GEM_CREATE_FLAG_SCANOUT);
 		} else if (is_vc4_device(fd)) {
@@ -2907,7 +2907,7 @@ static void blitcopy(const struct igt_fb *dst_fb,
 
 		bb_size = ALIGN(bb_size + xe_cs_prefetch_size(dst_fb->fd),
 				xe_get_default_alignment(dst_fb->fd));
-		xe_bb = xe_bo_create_flags(dst_fb->fd, 0, bb_size, mem_region);
+		xe_bb = xe_bo_create(dst_fb->fd, 0, bb_size, mem_region);
 	}
 
 	for (int i = 0; i < dst_fb->num_planes - dst_cc; i++) {
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 4a12078cb..b9e83f8b9 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -958,7 +958,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 
 		ibb->alignment = alignment;
 		size = ALIGN(size, ibb->alignment);
-		ibb->handle = xe_bo_create_flags(fd, 0, size, visible_vram_if_possible(fd, 0));
+		ibb->handle = xe_bo_create(fd, 0, size, visible_vram_if_possible(fd, 0));
 
 		/* Limit to 48-bit due to MI_* address limitation */
 		ibb->gtt_size = 1ull << min_t(uint32_t, xe_va_bits(fd), 48);
@@ -1423,8 +1423,8 @@ void intel_bb_reset(struct intel_bb *ibb, bool purge_objects_cache)
 	if (ibb->driver == INTEL_DRIVER_I915)
 		ibb->handle = gem_create(ibb->fd, ibb->size);
 	else
-		ibb->handle = xe_bo_create_flags(ibb->fd, 0, ibb->size,
-						 visible_vram_if_possible(ibb->fd, 0));
+		ibb->handle = xe_bo_create(ibb->fd, 0, ibb->size,
+					   visible_vram_if_possible(ibb->fd, 0));
 
 	/* Reacquire offset for RELOC and SIMPLE */
 	if (ibb->allocator_type == INTEL_ALLOCATOR_SIMPLE ||
diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index e501acbc3..94e6afcd5 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1808,7 +1808,7 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
 			flags |= DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
 
 		size = ALIGN(size, xe_get_default_alignment(blt->fd));
-		handle = xe_bo_create_flags(blt->fd, 0, size, flags);
+		handle = xe_bo_create(blt->fd, 0, size, flags);
 	} else {
 		igt_assert(__gem_create_in_memory_regions(blt->fd, &handle,
 							  &size, region) == 0);
diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 2ab3844f5..b9dc0ab96 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -923,7 +923,7 @@ static void __intel_buf_init(struct buf_ops *bops,
 				igt_assert_eq(__gem_create(bops->fd, &size, &buf->handle), 0);
 		} else {
 			size = ALIGN(size, xe_get_default_alignment(bops->fd));
-			buf->handle = xe_bo_create_flags(bops->fd, 0, size, region);
+			buf->handle = xe_bo_create(bops->fd, 0, size, region);
 		}
 	}
 
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index a33a7dc91..69443cfd8 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -240,7 +240,7 @@ uint16_t __xe_default_cpu_caching_from_flags(int fd, uint32_t flags)
 	return DRM_XE_GEM_CPU_CACHING_WB;
 }
 
-static uint32_t ___xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags,
+static uint32_t ___xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t flags,
 				      uint16_t cpu_caching, uint32_t *handle)
 {
 	struct drm_xe_gem_create create = {
@@ -260,19 +260,19 @@ static uint32_t ___xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32
 
 }
 
-uint32_t __xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags,
+uint32_t __xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t flags,
 			      uint32_t *handle)
 {
 	uint16_t cpu_caching = __xe_default_cpu_caching_from_flags(fd, flags);
 
-	return ___xe_bo_create_flags(fd, vm, size, flags, cpu_caching, handle);
+	return ___xe_bo_create(fd, vm, size, flags, cpu_caching, handle);
 }
 
-uint32_t xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags)
+uint32_t xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t flags)
 {
 	uint32_t handle;
 
-	igt_assert_eq(__xe_bo_create_flags(fd, vm, size, flags, &handle), 0);
+	igt_assert_eq(__xe_bo_create(fd, vm, size, flags, &handle), 0);
 
 	return handle;
 }
@@ -280,7 +280,7 @@ uint32_t xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags)
 uint32_t __xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t flags,
 				uint16_t cpu_caching, uint32_t *handle)
 {
-	return ___xe_bo_create_flags(fd, vm, size, flags, cpu_caching,
+	return ___xe_bo_create(fd, vm, size, flags, cpu_caching,
 				     handle);
 }
 
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index ff5d3d8fa..1d1cd2ced 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -64,9 +64,9 @@ void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t exec_queue,
 			    uint32_t bo, struct drm_xe_sync *sync,
 			    uint32_t num_syncs);
 void xe_vm_destroy(int fd, uint32_t vm);
-uint32_t __xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags,
+uint32_t __xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t flags,
 			      uint32_t *handle);
-uint32_t xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t flags);
+uint32_t xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t flags);
 uint32_t __xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t flags,
 				uint16_t cpu_caching, uint32_t *handle);
 uint32_t xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t flags,
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index cfc663acc..828938434 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -219,8 +219,8 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
 			spin->engine = xe_exec_queue_create_class(fd, spin->vm, DRM_XE_ENGINE_CLASS_COPY);
 	}
 
-	spin->handle = xe_bo_create_flags(fd, spin->vm, bo_size,
-					  visible_vram_if_possible(fd, 0));
+	spin->handle = xe_bo_create(fd, spin->vm, bo_size,
+				    visible_vram_if_possible(fd, 0));
 	xe_spin = xe_bo_map(fd, spin->handle, bo_size);
 	addr = intel_allocator_alloc_with_strategy(ahnd, spin->handle, bo_size, 0, ALLOC_STRATEGY_LOW_TO_HIGH);
 	xe_vm_bind_sync(fd, spin->vm, spin->handle, 0, addr, bo_size);
@@ -298,8 +298,8 @@ void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
 
 	vm = xe_vm_create(fd, 0, 0);
 
-	bo = xe_bo_create_flags(fd, vm, bo_size,
-				visible_vram_if_possible(fd, hwe->gt_id));
+	bo = xe_bo_create(fd, vm, bo_size,
+			  visible_vram_if_possible(fd, hwe->gt_id));
 	spin = xe_bo_map(fd, bo, 0x1000);
 
 	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
diff --git a/tests/intel/api_intel_allocator.c b/tests/intel/api_intel_allocator.c
index 8e13a8808..72285092a 100644
--- a/tests/intel/api_intel_allocator.c
+++ b/tests/intel/api_intel_allocator.c
@@ -470,8 +470,8 @@ static void __simple_allocs(int fd)
 
 		size = (rand() % 4 + 1) * 0x1000;
 		if (is_xe)
-			handles[i] = xe_bo_create_flags(fd, 0, size,
-							system_memory(fd));
+			handles[i] = xe_bo_create(fd, 0, size,
+						  system_memory(fd));
 		else
 			handles[i] = gem_create(fd, size);
 
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 2f418736a..1f48a0d7d 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -778,10 +778,10 @@ test_size_overflow(data_t *data)
 	if (is_i915_device(data->drm_fd))
 		bo = gem_buffer_create_fb_obj(data->drm_fd, (1ULL << 32) - 4096);
 	else
-		bo = xe_bo_create_flags(data->drm_fd, 0,
-					ALIGN(((1ULL << 32) - 4096),
-					      xe_get_default_alignment(data->drm_fd)),
-					vram_if_possible(data->drm_fd, 0));
+		bo = xe_bo_create(data->drm_fd, 0,
+				  ALIGN(((1ULL << 32) - 4096),
+					xe_get_default_alignment(data->drm_fd)),
+				  vram_if_possible(data->drm_fd, 0));
 	igt_require(bo);
 
 	ret = __kms_addfb(data->drm_fd, bo,
@@ -822,10 +822,10 @@ test_size_offset_overflow(data_t *data)
 	if (is_i915_device(data->drm_fd))
 		bo = gem_buffer_create_fb_obj(data->drm_fd, (1ULL << 32) - 4096);
 	else
-		bo = xe_bo_create_flags(data->drm_fd, 0,
-					ALIGN(((1ULL << 32) - 4096),
-					      xe_get_default_alignment(data->drm_fd)),
-					vram_if_possible(data->drm_fd, 0));
+		bo = xe_bo_create(data->drm_fd, 0,
+				  ALIGN(((1ULL << 32) - 4096),
+					xe_get_default_alignment(data->drm_fd)),
+				  vram_if_possible(data->drm_fd, 0));
 	igt_require(bo);
 
 	offsets[0] = 0;
@@ -887,9 +887,9 @@ test_addfb(data_t *data)
 	if (is_i915_device(data->drm_fd))
 		bo = gem_buffer_create_fb_obj(data->drm_fd, size);
 	else
-		bo = xe_bo_create_flags(data->drm_fd, 0,
-					ALIGN(size, xe_get_default_alignment(data->drm_fd)),
-					vram_if_possible(data->drm_fd, 0));
+		bo = xe_bo_create(data->drm_fd, 0,
+				  ALIGN(size, xe_get_default_alignment(data->drm_fd)),
+				  vram_if_possible(data->drm_fd, 0));
 	igt_require(bo);
 
 	if (is_i915_device(data->drm_fd) && intel_display_ver(data->devid) < 4)
diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 7a3fd7cf6..a5a8abb28 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -452,8 +452,8 @@ static void test_bad_ccs_plane(data_t *data, int width, int height, int ccs_plan
 	if (data->flags & TEST_BAD_CCS_HANDLE) {
 		bad_ccs_bo = is_i915_device(data->drm_fd) ?
 				gem_create(data->drm_fd, fb.size) :
-				xe_bo_create_flags(data->drm_fd, 0, fb.size,
-						   visible_vram_if_possible(data->drm_fd, 0));
+				xe_bo_create(data->drm_fd, 0, fb.size,
+					     visible_vram_if_possible(data->drm_fd, 0));
 		f.handles[ccs_plane] = bad_ccs_bo;
 	}
 
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 79ed8f9b7..7198d04a1 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -103,8 +103,8 @@ static void surf_copy(int xe,
 
 	igt_assert(mid->compression);
 	ccscopy = (uint32_t *) malloc(ccssize);
-	ccs = xe_bo_create_flags(xe, 0, ccssize, sysmem);
-	ccs2 = xe_bo_create_flags(xe, 0, ccssize, sysmem);
+	ccs = xe_bo_create(xe, 0, ccssize, sysmem);
+	ccs2 = xe_bo_create(xe, 0, ccssize, sysmem);
 
 	blt_ctrl_surf_copy_init(xe, &surf);
 	surf.print_bb = param.print_bb;
@@ -113,7 +113,7 @@ static void surf_copy(int xe,
 	blt_set_ctrl_surf_object(&surf.dst, ccs, sysmem, ccssize, uc_mocs,
 				 DEFAULT_PAT_INDEX, DIRECT_ACCESS);
 	bb_size = xe_get_default_alignment(xe);
-	bb1 = xe_bo_create_flags(xe, 0, bb_size, sysmem);
+	bb1 = xe_bo_create(xe, 0, bb_size, sysmem);
 	blt_set_batch(&surf.bb, bb1, bb_size, sysmem);
 	blt_ctrl_surf_copy(xe, ctx, NULL, ahnd, &surf);
 	intel_ctx_xe_sync(ctx, true);
@@ -168,7 +168,7 @@ static void surf_copy(int xe,
 	blt_set_copy_object(&blt.dst, dst);
 	blt_set_object_ext(&ext.src, mid->compression_type, mid->x2, mid->y2, SURFACE_TYPE_2D);
 	blt_set_object_ext(&ext.dst, 0, dst->x2, dst->y2, SURFACE_TYPE_2D);
-	bb2 = xe_bo_create_flags(xe, 0, bb_size, sysmem);
+	bb2 = xe_bo_create(xe, 0, bb_size, sysmem);
 	blt_set_batch(&blt.bb, bb2, bb_size, sysmem);
 	blt_block_copy(xe, ctx, NULL, ahnd, &blt, &ext);
 	intel_ctx_xe_sync(ctx, true);
@@ -299,7 +299,7 @@ static void block_copy(int xe,
 	uint8_t uc_mocs = intel_get_uc_mocs_index(xe);
 	int result;
 
-	bb = xe_bo_create_flags(xe, 0, bb_size, region1);
+	bb = xe_bo_create(xe, 0, bb_size, region1);
 
 	if (!blt_uses_extended_block_copy(xe))
 		pext = NULL;
@@ -421,7 +421,7 @@ static void block_multicopy(int xe,
 	uint8_t uc_mocs = intel_get_uc_mocs_index(xe);
 	int result;
 
-	bb = xe_bo_create_flags(xe, 0, bb_size, region1);
+	bb = xe_bo_create(xe, 0, bb_size, region1);
 
 	if (!blt_uses_extended_block_copy(xe))
 		pext3 = NULL;
diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index a8066932a..cbadf9f5c 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -53,7 +53,7 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
 	uint32_t bb;
 	int result;
 
-	bb = xe_bo_create_flags(fd, 0, bb_size, region);
+	bb = xe_bo_create(fd, 0, bb_size, region);
 
 	blt_mem_init(fd, &mem);
 	blt_set_mem_object(&mem.src, src_handle, size, 0, width, height,
@@ -105,7 +105,7 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
 	uint32_t bb;
 	uint8_t *result;
 
-	bb = xe_bo_create_flags(fd, 0, bb_size, region);
+	bb = xe_bo_create(fd, 0, bb_size, region);
 	blt_mem_init(fd, &mem);
 	blt_set_mem_object(&mem.dst, dst_handle, size, 0, width, height, region,
 			   dst_mocs, DEFAULT_PAT_INDEX, M_LINEAR, COMPRESSION_DISABLED);
@@ -135,8 +135,8 @@ static void copy_test(int fd, uint32_t size, enum blt_cmd_type cmd, uint32_t reg
 	uint32_t bo_size = ALIGN(size, xe_get_default_alignment(fd));
 	intel_ctx_t *ctx;
 
-	src_handle = xe_bo_create_flags(fd, 0, bo_size, region);
-	dst_handle = xe_bo_create_flags(fd, 0, bo_size, region);
+	src_handle = xe_bo_create(fd, 0, bo_size, region);
+	dst_handle = xe_bo_create(fd, 0, bo_size, region);
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
 	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
index 0d835dddb..ac9d9d767 100644
--- a/tests/intel/xe_dma_buf_sync.c
+++ b/tests/intel/xe_dma_buf_sync.c
@@ -119,8 +119,8 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd[0]),
 			xe_get_default_alignment(fd[0]));
 	for (i = 0; i < n_bo; ++i) {
-		bo[i] = xe_bo_create_flags(fd[0], 0, bo_size,
-					   visible_vram_if_possible(fd[0], hwe0->gt_id));
+		bo[i] = xe_bo_create(fd[0], 0, bo_size,
+				     visible_vram_if_possible(fd[0], hwe0->gt_id));
 		dma_buf_fd[i] = prime_handle_to_fd(fd[0], bo[i]);
 		import_bo[i] = prime_fd_to_handle(fd[1], dma_buf_fd[i]);
 
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 4ef30cf49..8f737a533 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -85,7 +85,7 @@ static void test_active(int fd, struct drm_xe_engine_class_instance *eci)
 		igt_assert_f(ret != 0, "failed with err:%d\n", errno);
 		pre_size = info.region_mem[memregion->instance + 1].active;
 
-		bo = xe_bo_create_flags(fd, vm, bo_size, region);
+		bo = xe_bo_create(fd, vm, bo_size, region);
 		data = xe_bo_map(fd, bo, bo_size);
 
 		for (i = 0; i < N_EXEC_QUEUES; i++) {
@@ -185,7 +185,7 @@ static void test_shared(int xe)
 		igt_assert_f(ret != 0, "failed with err:%d\n", errno);
 		pre_size = info.region_mem[memregion->instance + 1].shared;
 
-		bo = xe_bo_create_flags(xe, 0, BO_SIZE, region);
+		bo = xe_bo_create(xe, 0, BO_SIZE, region);
 
 		flink.handle = bo;
 		ret = igt_ioctl(xe, DRM_IOCTL_GEM_FLINK, &flink);
@@ -232,7 +232,7 @@ static void test_total_resident(int xe)
 		igt_assert_f(ret != 0, "failed with err:%d\n", errno);
 		pre_size = info.region_mem[memregion->instance + 1].shared;
 
-		handle = xe_bo_create_flags(xe, vm, BO_SIZE, region);
+		handle = xe_bo_create(xe, vm, BO_SIZE, region);
 		xe_vm_bind_sync(xe, vm, handle, 0, addr, BO_SIZE);
 
 		ret = igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0);
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 6d953e58b..a9d501d5f 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -99,18 +99,18 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
                                 i < n_execs / 8 ? 0 : vm;
 
 			if (flags & MULTI_VM) {
-				__bo = bo[i] = xe_bo_create_flags(fd, 0,
-								  bo_size,
-								  visible_vram_memory(fd, eci->gt_id));
+				__bo = bo[i] = xe_bo_create(fd, 0,
+							    bo_size,
+							    visible_vram_memory(fd, eci->gt_id));
 			} else if (flags & THREADED) {
-				__bo = bo[i] = xe_bo_create_flags(fd, vm,
-								  bo_size,
-								  visible_vram_memory(fd, eci->gt_id));
+				__bo = bo[i] = xe_bo_create(fd, vm,
+							    bo_size,
+							    visible_vram_memory(fd, eci->gt_id));
 			} else {
-				__bo = bo[i] = xe_bo_create_flags(fd, _vm,
-								  bo_size,
-								  visible_vram_memory(fd, eci->gt_id) |
-								  system_memory(fd));
+				__bo = bo[i] = xe_bo_create(fd, _vm,
+							    bo_size,
+							    visible_vram_memory(fd, eci->gt_id) |
+							    system_memory(fd));
 			}
 		} else {
 			__bo = bo[i % (n_execs / 2)];
@@ -275,18 +275,18 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
                                 i < n_execs / 8 ? 0 : vm;
 
 			if (flags & MULTI_VM) {
-				__bo = bo[i] = xe_bo_create_flags(fd, 0,
-								  bo_size,
-								  visible_vram_memory(fd, eci->gt_id));
+				__bo = bo[i] = xe_bo_create(fd, 0,
+							    bo_size,
+							    visible_vram_memory(fd, eci->gt_id));
 			} else if (flags & THREADED) {
-				__bo = bo[i] = xe_bo_create_flags(fd, vm,
-								  bo_size,
-								  visible_vram_memory(fd, eci->gt_id));
+				__bo = bo[i] = xe_bo_create(fd, vm,
+							    bo_size,
+							    visible_vram_memory(fd, eci->gt_id));
 			} else {
-				__bo = bo[i] = xe_bo_create_flags(fd, _vm,
-								  bo_size,
-								  visible_vram_memory(fd, eci->gt_id) |
-								  system_memory(fd));
+				__bo = bo[i] = xe_bo_create(fd, _vm,
+							    bo_size,
+							    visible_vram_memory(fd, eci->gt_id) |
+							    system_memory(fd));
 			}
 		} else {
 			__bo = bo[i % (n_execs / 2)];
diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
index d7244f620..35a588521 100644
--- a/tests/intel/xe_evict_ccs.c
+++ b/tests/intel/xe_evict_ccs.c
@@ -82,7 +82,7 @@ static void copy_obj(struct blt_copy_data *blt,
 	w = src_obj->x2;
 	h = src_obj->y2;
 
-	bb = xe_bo_create_flags(fd, 0, bb_size, visible_vram_memory(fd, 0));
+	bb = xe_bo_create(fd, 0, bb_size, visible_vram_memory(fd, 0));
 
 	blt->color_depth = CD_32bit;
 	blt->print_bb = params.print_bb;
@@ -274,8 +274,8 @@ static void evict_single(int fd, int child, const struct config *config)
 		}
 
 		if (config->flags & TEST_SIMPLE) {
-			big_obj = xe_bo_create_flags(fd, vm, kb_left * SZ_1K,
-						     vram_memory(fd, 0));
+			big_obj = xe_bo_create(fd, vm, kb_left * SZ_1K,
+					       vram_memory(fd, 0));
 			break;
 		}
 
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 8a0165b8c..da34e117d 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -70,7 +70,7 @@ static void test_all_active(int fd, int gt, int class)
 	bo_size = sizeof(*data) * num_placements;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 
-	bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
+	bo = xe_bo_create(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < num_placements; i++) {
@@ -224,7 +224,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		}
 		memset(data, 0, bo_size);
 	} else {
-		bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
+		bo = xe_bo_create(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 
@@ -452,7 +452,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 			igt_assert(data);
 		}
 	} else {
-		bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
+		bo = xe_bo_create(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index a401f0165..841696b68 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -140,8 +140,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		if (flags & DEFER_ALLOC)
 			bo_flags |= DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING;
 
-		bo = xe_bo_create_flags(fd, n_vm == 1 ? vm[0] : 0,
-					bo_size, bo_flags);
+		bo = xe_bo_create(fd, n_vm == 1 ? vm[0] : 0, bo_size, bo_flags);
 		if (!(flags & DEFER_BIND))
 			data = xe_bo_map(fd, bo, bo_size);
 	}
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 20d3fc6e8..beb962f79 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -141,8 +141,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			igt_assert(data);
 		}
 	} else {
-		bo = xe_bo_create_flags(fd, flags & VM_FOR_BO ? vm : 0,
-					bo_size, visible_vram_if_possible(fd, eci->gt_id));
+		bo = xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0,
+				  bo_size, visible_vram_if_possible(fd, eci->gt_id));
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 92d552f97..903ad430d 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -151,12 +151,12 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		}
 	} else {
 		if (flags & PREFETCH)
-			bo = xe_bo_create_flags(fd, 0, bo_size,
-						all_memory_regions(fd) |
-						visible_vram_if_possible(fd, 0));
+			bo = xe_bo_create(fd, 0, bo_size,
+					  all_memory_regions(fd) |
+					  visible_vram_if_possible(fd, 0));
 		else
-			bo = xe_bo_create_flags(fd, 0, bo_size,
-						visible_vram_if_possible(fd, eci->gt_id));
+			bo = xe_bo_create(fd, 0, bo_size,
+					  visible_vram_if_possible(fd, eci->gt_id));
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 195e62911..704690e83 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -50,8 +50,8 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create_flags(fd, vm, bo_size,
-				visible_vram_if_possible(fd, eci->gt_id));
+	bo = xe_bo_create(fd, vm, bo_size,
+			  visible_vram_if_possible(fd, eci->gt_id));
 	spin = xe_bo_map(fd, bo, bo_size);
 
 	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
@@ -181,7 +181,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
+	bo = xe_bo_create(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < n_exec_queues; i++) {
@@ -367,8 +367,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create_flags(fd, vm, bo_size,
-				visible_vram_if_possible(fd, eci->gt_id));
+	bo = xe_bo_create(fd, vm, bo_size,
+			  visible_vram_if_possible(fd, eci->gt_id));
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < n_exec_queues; i++) {
@@ -534,8 +534,8 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create_flags(fd, vm, bo_size,
-				visible_vram_if_possible(fd, eci->gt_id));
+	bo = xe_bo_create(fd, vm, bo_size,
+			  visible_vram_if_possible(fd, eci->gt_id));
 	data = xe_bo_map(fd, bo, bo_size);
 	memset(data, 0, bo_size);
 
@@ -661,7 +661,7 @@ static void submit_jobs(struct gt_thread_data *t)
 	uint32_t bo;
 	uint32_t *data;
 
-	bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, 0));
+	bo = xe_bo_create(fd, vm, bo_size, visible_vram_if_possible(fd, 0));
 	data = xe_bo_map(fd, bo, bo_size);
 	data[0] = MI_BATCH_BUFFER_END;
 
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 9c14bfd14..bcc4de8d0 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -81,8 +81,8 @@ static void store(int fd)
 			xe_get_default_alignment(fd));
 
 	hw_engine = xe_hw_engine(fd, 1);
-	bo = xe_bo_create_flags(fd, vm, bo_size,
-				visible_vram_if_possible(fd, hw_engine->gt_id));
+	bo = xe_bo_create(fd, vm, bo_size,
+			  visible_vram_if_possible(fd, hw_engine->gt_id));
 
 	xe_vm_bind_async(fd, vm, hw_engine->gt_id, bo, 0, addr, bo_size, &sync, 1);
 	data = xe_bo_map(fd, bo, bo_size);
@@ -150,8 +150,8 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
 	sync[0].handle = syncobj_create(fd, 0);
 
 	for (i = 0; i < count; i++) {
-		bo[i] = xe_bo_create_flags(fd, vm, bo_size,
-					       visible_vram_if_possible(fd, eci->gt_id));
+		bo[i] = xe_bo_create(fd, vm, bo_size,
+				     visible_vram_if_possible(fd, eci->gt_id));
 		bo_map[i] = xe_bo_map(fd, bo[i], bo_size);
 		dst_offset[i] = intel_allocator_alloc_with_strategy(ahnd, bo[i],
 								    bo_size, 0,
@@ -235,8 +235,8 @@ static void store_all(int fd, int gt, int class)
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create_flags(fd, vm, bo_size,
-				visible_vram_if_possible(fd, 0));
+	bo = xe_bo_create(fd, vm, bo_size,
+			  visible_vram_if_possible(fd, 0));
 	data = xe_bo_map(fd, bo, bo_size);
 
 	xe_for_each_hw_engine(fd, hwe) {
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index bb979b18c..a9b0c0b09 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -106,8 +106,8 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 			igt_assert(data);
 		}
 	} else {
-		bo = xe_bo_create_flags(fd, vm, bo_size,
-					visible_vram_if_possible(fd, gt));
+		bo = xe_bo_create(fd, vm, bo_size,
+				  visible_vram_if_possible(fd, gt));
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
@@ -307,8 +307,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 			igt_assert(data);
 		}
 	} else {
-		bo = xe_bo_create_flags(fd, 0, bo_size,
-					visible_vram_if_possible(fd, eci->gt_id));
+		bo = xe_bo_create(fd, 0, bo_size,
+				  visible_vram_if_possible(fd, eci->gt_id));
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
@@ -510,8 +510,8 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 			igt_assert(data);
 		}
 	} else {
-		bo = xe_bo_create_flags(fd, vm, bo_size,
-					visible_vram_if_possible(fd, eci->gt_id));
+		bo = xe_bo_create(fd, vm, bo_size,
+				  visible_vram_if_possible(fd, eci->gt_id));
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
index fd310138d..9c69be3ef 100644
--- a/tests/intel/xe_exercise_blt.c
+++ b/tests/intel/xe_exercise_blt.c
@@ -125,7 +125,7 @@ static void fast_copy_emit(int xe, const intel_ctx_t *ctx,
 	uint32_t bb, width = param.width, height = param.height;
 	int result;
 
-	bb = xe_bo_create_flags(xe, 0, bb_size, region1);
+	bb = xe_bo_create(xe, 0, bb_size, region1);
 
 	blt_copy_init(xe, &bltinit);
 	src = blt_create_object(&bltinit, region1, width, height, bpp, 0,
@@ -184,7 +184,7 @@ static void fast_copy(int xe, const intel_ctx_t *ctx,
 	uint32_t width = param.width, height = param.height;
 	int result;
 
-	bb = xe_bo_create_flags(xe, 0, bb_size, region1);
+	bb = xe_bo_create(xe, 0, bb_size, region1);
 
 	blt_copy_init(xe, &blt);
 	src = blt_create_object(&blt, region1, width, height, bpp, 0,
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index 36429590f..618e9ea77 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -397,7 +397,7 @@ static void create_in_region(struct buf_ops *bops, uint64_t region)
 		intel_bb_set_debug(ibb, true);
 
 	size = xe_min_page_size(xe, system_memory(xe));
-	handle = xe_bo_create_flags(xe, 0, size, system_memory(xe));
+	handle = xe_bo_create(xe, 0, size, system_memory(xe));
 	intel_buf_init_full(bops, handle, &buf,
 			    width/4, height, 32, 0,
 			    I915_TILING_NONE, 0,
diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index bd894f26f..f6b2833a7 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -52,7 +52,7 @@ test_mmap(int fd, uint32_t flags)
 
 	igt_require_f(flags, "Device doesn't support such memory region\n");
 
-	bo = xe_bo_create_flags(fd, 0, 4096, flags);
+	bo = xe_bo_create(fd, 0, 4096, flags);
 
 	map = xe_bo_map(fd, bo, 4096);
 	strcpy(map, "Write some data to the BO!");
@@ -72,8 +72,8 @@ static void test_bad_flags(int fd)
 {
 	uint64_t size = xe_get_default_alignment(fd);
 	struct drm_xe_gem_mmap_offset mmo = {
-		.handle = xe_bo_create_flags(fd, 0, size,
-					     visible_vram_if_possible(fd, 0)),
+		.handle = xe_bo_create(fd, 0, size,
+				       visible_vram_if_possible(fd, 0)),
 		.flags = -1u,
 	};
 
@@ -92,8 +92,8 @@ static void test_bad_extensions(int fd)
 	uint64_t size = xe_get_default_alignment(fd);
 	struct xe_user_extension ext;
 	struct drm_xe_gem_mmap_offset mmo = {
-		.handle = xe_bo_create_flags(fd, 0, size,
-					     visible_vram_if_possible(fd, 0)),
+		.handle = xe_bo_create(fd, 0, size,
+				       visible_vram_if_possible(fd, 0)),
 	};
 
 	mmo.extensions = to_user_pointer(&ext);
@@ -113,8 +113,8 @@ static void test_bad_object(int fd)
 {
 	uint64_t size = xe_get_default_alignment(fd);
 	struct drm_xe_gem_mmap_offset mmo = {
-		.handle = xe_bo_create_flags(fd, 0, size,
-					     visible_vram_if_possible(fd, 0)),
+		.handle = xe_bo_create(fd, 0, size,
+				       visible_vram_if_possible(fd, 0)),
 	};
 
 	mmo.handle = 0xdeadbeef;
@@ -159,13 +159,13 @@ static void test_small_bar(int fd)
 	uint32_t *map;
 
 	/* 2BIG invalid case */
-	igt_assert_neq(__xe_bo_create_flags(fd, 0, visible_size + 4096,
-					    visible_vram_memory(fd, 0), &bo),
+	igt_assert_neq(__xe_bo_create(fd, 0, visible_size + 4096,
+				      visible_vram_memory(fd, 0), &bo),
 		       0);
 
 	/* Normal operation */
-	bo = xe_bo_create_flags(fd, 0, visible_size / 4,
-				visible_vram_memory(fd, 0));
+	bo = xe_bo_create(fd, 0, visible_size / 4,
+			  visible_vram_memory(fd, 0));
 	mmo = xe_bo_mmap_offset(fd, bo);
 	map = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED, fd, mmo);
 	igt_assert(map != MAP_FAILED);
@@ -176,9 +176,9 @@ static void test_small_bar(int fd)
 	gem_close(fd, bo);
 
 	/* Normal operation with system memory spilling */
-	bo = xe_bo_create_flags(fd, 0, visible_size,
-				visible_vram_memory(fd, 0) |
-				system_memory(fd));
+	bo = xe_bo_create(fd, 0, visible_size,
+			  visible_vram_memory(fd, 0) |
+			  system_memory(fd));
 	mmo = xe_bo_mmap_offset(fd, bo);
 	map = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED, fd, mmo);
 	igt_assert(map != MAP_FAILED);
@@ -189,8 +189,8 @@ static void test_small_bar(int fd)
 	gem_close(fd, bo);
 
 	/* Bogus operation with SIGBUS */
-	bo = xe_bo_create_flags(fd, 0, visible_size + 4096,
-				vram_memory(fd, 0));
+	bo = xe_bo_create(fd, 0, visible_size + 4096,
+			  vram_memory(fd, 0));
 	mmo = xe_bo_mmap_offset(fd, bo);
 	map = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED, fd, mmo);
 	igt_assert(map != MAP_FAILED);
diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
index 9c2a70ff3..88ef39783 100644
--- a/tests/intel/xe_noexec_ping_pong.c
+++ b/tests/intel/xe_noexec_ping_pong.c
@@ -70,8 +70,8 @@ static void test_ping_pong(int fd, struct drm_xe_engine_class_instance *eci)
 				  (unsigned long) bo_size,
 				  (unsigned int) vm[i]);
 
-			bo[i][j] = xe_bo_create_flags(fd, vm[i], bo_size,
-						      vram_memory(fd, 0));
+			bo[i][j] = xe_bo_create(fd, vm[i], bo_size,
+						vram_memory(fd, 0));
 			xe_vm_bind(fd, vm[i], bo[i][j], 0, 0x40000 + j*bo_size,
 				   bo_size, NULL, 0);
 		}
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 78bd96d11..98bd5e471 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -239,7 +239,7 @@ static void pat_index_blt(struct xe_pat_param *p)
 					 p->size->alignment);
 
 	bb_size = xe_get_default_alignment(fd);
-	bb = xe_bo_create_flags(fd, 0, bb_size, system_memory(fd));
+	bb = xe_bo_create(fd, 0, bb_size, system_memory(fd));
 
 	size = width * height * bpp / 8;
 	stride = width * 4;
diff --git a/tests/intel/xe_perf_pmu.c b/tests/intel/xe_perf_pmu.c
index 196e4d2e6..9f1627727 100644
--- a/tests/intel/xe_perf_pmu.c
+++ b/tests/intel/xe_perf_pmu.c
@@ -103,7 +103,7 @@ static void test_any_engine_busyness(int fd, struct drm_xe_engine_class_instance
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create_flags(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id));
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id));
 	spin = xe_bo_map(fd, bo, bo_size);
 
 	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
@@ -223,7 +223,7 @@ static void test_engine_group_busyness(int fd, int gt, int class, const char *na
 	bo_size = sizeof(*data) * num_placements;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 
-	bo = xe_bo_create_flags(fd, vm, bo_size, vram_if_possible(fd, gt));
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt));
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < num_placements; i++) {
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 9423984cc..9bfe1acad 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -271,8 +271,8 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	if (check_rpm && runtime_usage_available(device.pci_xe))
 		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
 
-	bo = xe_bo_create_flags(device.fd_xe, vm, bo_size,
-				visible_vram_if_possible(device.fd_xe, eci->gt_id));
+	bo = xe_bo_create(device.fd_xe, vm, bo_size,
+			  visible_vram_if_possible(device.fd_xe, eci->gt_id));
 	data = xe_bo_map(device.fd_xe, bo, bo_size);
 
 	for (i = 0; i < n_exec_queues; i++) {
@@ -409,7 +409,7 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 	threshold = vram_used_mb + (SIZE / 1024 /1024);
 	igt_require(threshold < vram_total_mb);
 
-	bo = xe_bo_create_flags(device.fd_xe, 0, SIZE, flags);
+	bo = xe_bo_create(device.fd_xe, 0, SIZE, flags);
 	map = xe_bo_map(device.fd_xe, bo, SIZE);
 	memset(map, 0, SIZE);
 	munmap(map, SIZE);
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index c87eeef3c..cc133f5fb 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -100,8 +100,8 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned
 	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
 	bo_size = xe_get_default_alignment(fd);
 
-	bo = xe_bo_create_flags(fd, vm, bo_size,
-				visible_vram_if_possible(fd, hwe->gt_id));
+	bo = xe_bo_create(fd, vm, bo_size,
+			  visible_vram_if_possible(fd, hwe->gt_id));
 	data = xe_bo_map(fd, bo, bo_size);
 	syncobj = syncobj_create(fd, 0);
 
diff --git a/tests/intel/xe_prime_self_import.c b/tests/intel/xe_prime_self_import.c
index 536230f9f..378368eaa 100644
--- a/tests/intel/xe_prime_self_import.c
+++ b/tests/intel/xe_prime_self_import.c
@@ -105,7 +105,7 @@ static void test_with_fd_dup(void)
 	fd1 = drm_open_driver(DRIVER_XE);
 	fd2 = drm_open_driver(DRIVER_XE);
 
-	handle = xe_bo_create_flags(fd1, 0, bo_size, visible_vram_if_possible(fd1, 0));
+	handle = xe_bo_create(fd1, 0, bo_size, visible_vram_if_possible(fd1, 0));
 
 	dma_buf_fd1 = prime_handle_to_fd(fd1, handle);
 	gem_close(fd1, handle);
@@ -138,8 +138,8 @@ static void test_with_two_bos(void)
 	fd1 = drm_open_driver(DRIVER_XE);
 	fd2 = drm_open_driver(DRIVER_XE);
 
-	handle1 = xe_bo_create_flags(fd1, 0, bo_size, visible_vram_if_possible(fd1, 0));
-	handle2 = xe_bo_create_flags(fd1, 0, bo_size, visible_vram_if_possible(fd1, 0));
+	handle1 = xe_bo_create(fd1, 0, bo_size, visible_vram_if_possible(fd1, 0));
+	handle2 = xe_bo_create(fd1, 0, bo_size, visible_vram_if_possible(fd1, 0));
 
 	dma_buf_fd = prime_handle_to_fd(fd1, handle1);
 	handle_import = prime_fd_to_handle(fd2, dma_buf_fd);
@@ -174,8 +174,8 @@ static void test_with_one_bo_two_files(void)
 	fd1 = drm_open_driver(DRIVER_XE);
 	fd2 = drm_open_driver(DRIVER_XE);
 
-	handle_orig = xe_bo_create_flags(fd1, 0, bo_size,
-					 visible_vram_if_possible(fd1, 0));
+	handle_orig = xe_bo_create(fd1, 0, bo_size,
+				   visible_vram_if_possible(fd1, 0));
 	dma_buf_fd1 = prime_handle_to_fd(fd1, handle_orig);
 
 	flink_name = gem_flink(fd1, handle_orig);
@@ -207,7 +207,7 @@ static void test_with_one_bo(void)
 	fd1 = drm_open_driver(DRIVER_XE);
 	fd2 = drm_open_driver(DRIVER_XE);
 
-	handle = xe_bo_create_flags(fd1, 0, bo_size, visible_vram_if_possible(fd1, 0));
+	handle = xe_bo_create(fd1, 0, bo_size, visible_vram_if_possible(fd1, 0));
 
 	dma_buf_fd = prime_handle_to_fd(fd1, handle);
 	handle_import1 = prime_fd_to_handle(fd2, dma_buf_fd);
@@ -293,8 +293,8 @@ static void *thread_fn_reimport_vs_close(void *p)
 
 	fds[0] = drm_open_driver(DRIVER_XE);
 
-	handle = xe_bo_create_flags(fds[0], 0, bo_size,
-				    visible_vram_if_possible(fds[0], 0));
+	handle = xe_bo_create(fds[0], 0, bo_size,
+			      visible_vram_if_possible(fds[0], 0));
 
 	fds[1] = prime_handle_to_fd(fds[0], handle);
 	pthread_barrier_init(&g_barrier, NULL, num_threads);
@@ -336,8 +336,8 @@ static void *thread_fn_export_vs_close(void *p)
 
 	igt_until_timeout(g_time_out) {
 		/* We want to race gem close against prime export on handle one.*/
-		handle = xe_bo_create_flags(fd, 0, bo_size,
-					    visible_vram_if_possible(fd, 0));
+		handle = xe_bo_create(fd, 0, bo_size,
+				      visible_vram_if_possible(fd, 0));
 		if (handle != 1)
 			gem_close(fd, handle);
 
@@ -433,8 +433,8 @@ static void test_llseek_size(void)
 	for (i = 0; i < 10; i++) {
 		int bufsz = xe_get_default_alignment(fd) << i;
 
-		handle = xe_bo_create_flags(fd, 0, bufsz,
-					    visible_vram_if_possible(fd, 0));
+		handle = xe_bo_create(fd, 0, bufsz,
+				      visible_vram_if_possible(fd, 0));
 		dma_buf_fd = prime_handle_to_fd(fd, handle);
 
 		gem_close(fd, handle);
@@ -462,8 +462,8 @@ static void test_llseek_bad(void)
 
 	fd = drm_open_driver(DRIVER_XE);
 
-	handle = xe_bo_create_flags(fd, 0, bo_size,
-				    visible_vram_if_possible(fd, 0));
+	handle = xe_bo_create(fd, 0, bo_size,
+			      visible_vram_if_possible(fd, 0));
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
 
 	gem_close(fd, handle);
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 261fde9af..c1b161f9c 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -169,7 +169,7 @@ static void xe_spin_fixed_duration(int fd)
 	exec_queue = xe_exec_queue_create_class(fd, vm, DRM_XE_ENGINE_CLASS_COPY);
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
 	bo_size = ALIGN(sizeof(*spin) + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
-	bo = xe_bo_create_flags(fd, vm, bo_size, vram_if_possible(fd, 0));
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0));
 	spin = xe_bo_map(fd, bo, bo_size);
 	spin_addr = intel_allocator_alloc_with_strategy(ahnd, bo, bo_size, 0,
 							ALLOC_STRATEGY_LOW_TO_HIGH);
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index b7b297413..c9fb6c957 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -52,8 +52,8 @@ write_dwords(int fd, uint32_t vm, int n_dwords, uint64_t *addrs)
 	batch_size = (n_dwords * 4 + 1) * sizeof(uint32_t);
 	batch_size = ALIGN(batch_size + xe_cs_prefetch_size(fd),
 			   xe_get_default_alignment(fd));
-	batch_bo = xe_bo_create_flags(fd, vm, batch_size,
-				      visible_vram_if_possible(fd, 0));
+	batch_bo = xe_bo_create(fd, vm, batch_size,
+				visible_vram_if_possible(fd, 0));
 	batch_map = xe_bo_map(fd, batch_bo, batch_size);
 
 	for (i = 0; i < n_dwords; i++) {
@@ -117,7 +117,7 @@ __test_bind_one_bo(int fd, uint32_t vm, int n_addrs, uint64_t *addrs)
 		vms = malloc(sizeof(*vms) * n_addrs);
 		igt_assert(vms);
 	}
-	bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, 0));
+	bo = xe_bo_create(fd, vm, bo_size, visible_vram_if_possible(fd, 0));
 	map = xe_bo_map(fd, bo, bo_size);
 	memset(map, 0, bo_size);
 
@@ -268,7 +268,7 @@ static void test_partial_unbinds(int fd)
 {
 	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 	size_t bo_size = 3 * xe_get_default_alignment(fd);
-	uint32_t bo = xe_bo_create_flags(fd, vm, bo_size, vram_if_possible(fd, 0));
+	uint32_t bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0));
 	uint64_t unbind_size = bo_size / 3;
 	uint64_t addr = 0x1a0000;
 
@@ -317,7 +317,7 @@ static void unbind_all(int fd, int n_vmas)
 	};
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
-	bo = xe_bo_create_flags(fd, vm, bo_size, vram_if_possible(fd, 0));
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0));
 
 	for (i = 0; i < n_vmas; ++i)
 		xe_vm_bind_async(fd, vm, 0, bo, 0, addr + i * bo_size,
@@ -423,8 +423,8 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 		addr_stride = addr_stride + bo_size;
 
 	for (i = 0; i < n_bo; ++i) {
-		bo[i] = xe_bo_create_flags(fd, vm, bo_size,
-					   visible_vram_if_possible(fd, eci->gt_id));
+		bo[i] = xe_bo_create(fd, vm, bo_size,
+				     visible_vram_if_possible(fd, eci->gt_id));
 		data[i] = xe_bo_map(fd, bo[i], bo_size);
 	}
 
@@ -602,8 +602,8 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
 	bo_size = sizeof(*data) * N_EXEC_QUEUES;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
-	bo = xe_bo_create_flags(fd, vm, bo_size,
-				visible_vram_if_possible(fd, eci->gt_id));
+	bo = xe_bo_create(fd, vm, bo_size,
+			  visible_vram_if_possible(fd, eci->gt_id));
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < N_EXEC_QUEUES; i++) {
@@ -783,8 +783,8 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create_flags(fd, vm, bo_size,
-				visible_vram_if_possible(fd, eci->gt_id));
+	bo = xe_bo_create(fd, vm, bo_size,
+			  visible_vram_if_possible(fd, eci->gt_id));
 	data = xe_bo_map(fd, bo, bo_size);
 
 	if (flags & BIND_ARRAY_BIND_EXEC_QUEUE_FLAG)
@@ -982,8 +982,8 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
 		igt_skip_on(xe_visible_vram_size(fd, 0) && bo_size >
 			    xe_visible_vram_size(fd, 0));
 
-		bo = xe_bo_create_flags(fd, vm, bo_size,
-					visible_vram_if_possible(fd, eci->gt_id));
+		bo = xe_bo_create(fd, vm, bo_size,
+				  visible_vram_if_possible(fd, eci->gt_id));
 		map = xe_bo_map(fd, bo, bo_size);
 	}
 
@@ -1276,8 +1276,8 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 			    MAP_ANONYMOUS, -1, 0);
 		igt_assert(map != MAP_FAILED);
 	} else {
-		bo = xe_bo_create_flags(fd, vm, bo_size,
-					visible_vram_if_possible(fd, eci->gt_id));
+		bo = xe_bo_create(fd, vm, bo_size,
+				  visible_vram_if_possible(fd, eci->gt_id));
 		map = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(map, 0, bo_size);
@@ -1580,9 +1580,9 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 		igt_assert(map0 != MAP_FAILED);
 		igt_assert(map1 != MAP_FAILED);
 	} else {
-		bo0 = xe_bo_create_flags(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id));
+		bo0 = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id));
 		map0 = xe_bo_map(fd, bo0, bo_size);
-		bo1 = xe_bo_create_flags(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id));
+		bo1 = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id));
 		map1 = xe_bo_map(fd, bo1, bo_size);
 	}
 	memset(map0, 0, bo_size);
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index 08d588add..eaef0185f 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -96,19 +96,19 @@ waitfence(int fd, enum waittype wt)
 	int64_t timeout;
 
 	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
-	bo_1 = xe_bo_create_flags(fd, vm, 0x40000, MY_FLAG);
+	bo_1 = xe_bo_create(fd, vm, 0x40000, MY_FLAG);
 	do_bind(fd, vm, bo_1, 0, 0x200000, 0x40000, 1);
-	bo_2 = xe_bo_create_flags(fd, vm, 0x40000, MY_FLAG);
+	bo_2 = xe_bo_create(fd, vm, 0x40000, MY_FLAG);
 	do_bind(fd, vm, bo_2, 0, 0xc0000000, 0x40000, 2);
-	bo_3 = xe_bo_create_flags(fd, vm, 0x40000, MY_FLAG);
+	bo_3 = xe_bo_create(fd, vm, 0x40000, MY_FLAG);
 	do_bind(fd, vm, bo_3, 0, 0x180000000, 0x40000, 3);
-	bo_4 = xe_bo_create_flags(fd, vm, 0x10000, MY_FLAG);
+	bo_4 = xe_bo_create(fd, vm, 0x10000, MY_FLAG);
 	do_bind(fd, vm, bo_4, 0, 0x140000000, 0x10000, 4);
-	bo_5 = xe_bo_create_flags(fd, vm, 0x100000, MY_FLAG);
+	bo_5 = xe_bo_create(fd, vm, 0x100000, MY_FLAG);
 	do_bind(fd, vm, bo_5, 0, 0x100000000, 0x100000, 5);
-	bo_6 = xe_bo_create_flags(fd, vm, 0x1c0000, MY_FLAG);
+	bo_6 = xe_bo_create(fd, vm, 0x1c0000, MY_FLAG);
 	do_bind(fd, vm, bo_6, 0, 0xc0040000, 0x1c0000, 6);
-	bo_7 = xe_bo_create_flags(fd, vm, 0x10000, MY_FLAG);
+	bo_7 = xe_bo_create(fd, vm, 0x10000, MY_FLAG);
 	do_bind(fd, vm, bo_7, 0, 0xeffff0000, 0x10000, 7);
 
 	if (wt == RELTIME) {
@@ -173,7 +173,7 @@ invalid_flag(int fd)
 
 	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 
-	bo = xe_bo_create_flags(fd, vm, 0x40000, MY_FLAG);
+	bo = xe_bo_create(fd, vm, 0x40000, MY_FLAG);
 
 	do_bind(fd, vm, bo, 0, 0x200000, 0x40000, 1);
 
@@ -198,7 +198,7 @@ invalid_ops(int fd)
 
 	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 
-	bo = xe_bo_create_flags(fd, vm, 0x40000, MY_FLAG);
+	bo = xe_bo_create(fd, vm, 0x40000, MY_FLAG);
 
 	do_bind(fd, vm, bo, 0, 0x200000, 0x40000, 1);
 
@@ -223,7 +223,7 @@ invalid_engine(int fd)
 
 	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
 
-	bo = xe_bo_create_flags(fd, vm, 0x40000, MY_FLAG);
+	bo = xe_bo_create(fd, vm, 0x40000, MY_FLAG);
 
 	do_bind(fd, vm, bo, 0, 0x200000, 0x40000, 1);
 
diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 337fef77e..1e34eaa54 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -307,7 +307,7 @@ static void invalid_tests(int fd)
 			handle = gem_create_in_memory_regions(fd, size, REGION_SMEM);
 		} else {
 			igt_require(xe_has_vram(fd));
-			handle = xe_bo_create_flags(fd, 0, size, system_memory(fd));
+			handle = xe_bo_create(fd, 0, size, system_memory(fd));
 		}
 
 		f.handles[0] = handle;
diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index e6b8dd873..2d93a032d 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -210,7 +210,7 @@ static void get_ccs_fb(int fd, struct drm_mode_fb_cmd2 *ret)
 	if (is_i915_device(fd))
 		add.handles[0] = gem_buffer_create_fb_obj(fd, size);
 	else
-		add.handles[0] = xe_bo_create_flags(fd, 0, size, vram_if_possible(fd, 0));
+		add.handles[0] = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0));
 	igt_require(add.handles[0] != 0);
 
 	if (!HAS_FLATCCS(devid))
-- 
2.34.1
