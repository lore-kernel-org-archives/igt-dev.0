Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7F3D111A8
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 01:03:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CA610E109;
	Fri, 28 Nov 2025 01:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MMIKQ97y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5C910E777
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 01:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764291783; x=1795827783;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=0/Ybdo/4z8wRCBOe6lzoVnHv9ZWlmAwWxWo0iuveDaE=;
 b=MMIKQ97y6tRUjclVv/DmWStn2qv01eK+fJt/Fhdiwd1cc4LZZ3zhgLnN
 L7Ggfz5dbe7AknE86Aduoi8l9kkAn/lHG6G4BQ7Mqn+q9olmwrKpcivPB
 3kQemjyyimyf0pGpoEwYHwRHKlJNpHtisat7FI7tvNYwPlhEgXzzQ1Ui/
 h2TiLsSMtX6A7G7lOptZ1oCbc99jYsnHqMK7YPrha1ojsLi5i6k8WpvXr
 JK4PTZU4xk+IU9R2ZaBkwA47vEK3psMf79mlVBz+f2N4NpZ5aFompyUty
 GlBJ9J2ZsHjK0jNeneCvJ8EuPmOwjB1ofLlEy9GhkaQ/fN/CxWxVm3TwP g==;
X-CSE-ConnectionGUID: 3LmTL3AWRyGqzQNB5SFPcQ==
X-CSE-MsgGUID: X5gX3e2xQAW75Qd4WLT5fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="53897941"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="53897941"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 17:03:03 -0800
X-CSE-ConnectionGUID: +0qGrJeoTWuuEU1Gf7UePg==
X-CSE-MsgGUID: 1PRKX5iKQEiCV2kZ8VzA0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="193439679"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.140])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 17:03:01 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/3] intel/xe: Allocate batch buffers from system RAM
Date: Fri, 28 Nov 2025 03:02:50 +0200
Message-ID: <20251128010251.18988-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251128010251.18988-1-ville.syrjala@linux.intel.com>
References: <20251128010251.18988-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

I have no idea why we're allocating batch buffers from VRAM.
Just stick them into system memory like a normal person and
let the GPU DMA them in.

The helps small BAR systems because we often forget to specify
that we need CPU visible VRAM if the batch resides in VRAM.

This more or less cover all the simple blit type cases where
the bo contains nothing but the batch. There are a lot of
exec tests and tests using the spinner that also allocate
batches from VRAM. But those would need a more thorough
analysis since they tend to pack other stuff besides the
batch into the same bo.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 benchmarks/gem_wsim.c         |  4 +---
 benchmarks/xe_blt.c           |  2 +-
 benchmarks/xe_exec_ctx.c      |  6 +-----
 lib/igt_fb.c                  |  3 +--
 lib/intel_batchbuffer.c       | 14 ++++++--------
 tests/intel/xe_ccs.c          |  6 +++---
 tests/intel/xe_copy_basic.c   |  4 ++--
 tests/intel/xe_evict_ccs.c    |  3 +--
 tests/intel/xe_exercise_blt.c |  4 ++--
 tests/intel/xe_peer2peer.c    |  4 ++--
 tests/kms_prime.c             |  3 +--
 tools/intel_tiling_detect.c   |  2 +-
 12 files changed, 22 insertions(+), 33 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index bebb59f283bb..0d515c3c20de 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1790,9 +1790,7 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
 	int i;
 
 	w->bb_size = xe_bb_size(fd, PAGE_SIZE);
-	w->bb_handle = xe_bo_create(fd, vm->id, w->bb_size,
-				    vram_if_possible(fd, eq->hwe_list[0].gt_id),
-				    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	w->bb_handle = xe_bo_create(fd, vm->id, w->bb_size, system_memory(fd), 0);
 	w->xe.data = xe_bo_map(fd, w->bb_handle, w->bb_size);
 	w->xe.exec.address =
 		intel_allocator_alloc_with_strategy(vm->ahnd, w->bb_handle, w->bb_size,
diff --git a/benchmarks/xe_blt.c b/benchmarks/xe_blt.c
index 4830cae3cbc5..f06e4177ad0c 100644
--- a/benchmarks/xe_blt.c
+++ b/benchmarks/xe_blt.c
@@ -134,7 +134,7 @@ static int src_copy(int xe, const intel_ctx_t *ctx,
 	uint32_t bb;
 	int ret = 0;
 
-	bb = xe_bo_create(xe, 0, bb_size, region1, 0);
+	bb = xe_bo_create(xe, 0, bb_size, system_memory(xe), 0);
 	blt_copy_init(xe, &blt);
 	src = blt_create_object(&blt, region1, width, height, bpp, 0,
 				T_LINEAR, COMPRESSION_DISABLED, 0, true);
diff --git a/benchmarks/xe_exec_ctx.c b/benchmarks/xe_exec_ctx.c
index d08c974022ee..f58dafd9b0c7 100644
--- a/benchmarks/xe_exec_ctx.c
+++ b/benchmarks/xe_exec_ctx.c
@@ -45,7 +45,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t bind_syncobjs[MAX_N_EXEC_QUEUES];
 	struct drm_gem_flink flink;
 	struct drm_gem_open open_struct;
-	uint32_t bo_flags;
 	size_t bo_size;
 	uint32_t bo = 0;
 	struct {
@@ -71,10 +70,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		sparse_addr[i] = sparse_addr[i - 1] + (0x1ull << 32);
 	}
 
-	bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
-
-	bo = xe_bo_create(fd, n_vm == 1 ? vm[0] : 0, bo_size,
-			  vram_if_possible(fd, 0), bo_flags);
+	bo = xe_bo_create(fd, n_vm == 1 ? vm[0] : 0, bo_size, system_memory(fd), 0);
 
 	flink.handle = bo;
 	ret = igt_ioctl(fd, DRM_IOCTL_GEM_FLINK, &flink);
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 2b4d50531e70..78d49aed8283 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -3029,8 +3029,7 @@ static void setup_context_and_memory_region(const struct igt_fb *fb, uint32_t *c
 						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
 
 		*bb_size = xe_bb_size(fb->fd, *bb_size);
-		*bb = xe_bo_create(fb->fd, 0, *bb_size, *mem_region,
-				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		*bb = xe_bo_create(fb->fd, 0, *bb_size, system_memory(fb->fd), 0);
 	}
 }
 
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 4bc1cf5b65c1..839e237cf76a 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -964,8 +964,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 
 		ibb->alignment = alignment;
 		size = ALIGN(size + xe_cs_prefetch_size(fd), ibb->alignment);
-		ibb->handle = xe_bo_create(fd, 0, size, region,
-					   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		ibb->handle = xe_bo_create(fd, 0, size, system_memory(fd), 0);
 
 		/* Limit to 48-bit due to MI_* address limitation */
 		ibb->gtt_size = 1ull << min_t(uint32_t, xe_va_bits(fd), 48);
@@ -1084,7 +1083,7 @@ struct intel_bb *intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t v
 {
 	return __intel_bb_create(fd, ctx, vm, cfg, size, false, 0, 0, 0,
 				 allocator_type, ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915_device(fd) ? REGION_SMEM : system_memory(fd));
 }
 
 static bool aux_needs_softpin(int fd)
@@ -1126,7 +1125,7 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size)
 				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915 ? REGION_SMEM : system_memory(fd));
 }
 
 /**
@@ -1155,7 +1154,7 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915 ? REGION_SMEM : system_memory(fd));
 }
 
 /**
@@ -1254,7 +1253,7 @@ struct intel_bb *intel_bb_create_no_relocs(int fd, uint32_t size)
 	return __intel_bb_create(fd, 0, 0, NULL, size, false, 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915 ? REGION_SMEM : system_memory(fd));
 }
 
 static void __intel_bb_destroy_relocations(struct intel_bb *ibb)
@@ -1484,8 +1483,7 @@ void intel_bb_reset(struct intel_bb *ibb, bool purge_objects_cache)
 		ibb->handle = gem_create(ibb->fd, ibb->size);
 	else
 		ibb->handle = xe_bo_create(ibb->fd, 0, ibb->size,
-					   vram_if_possible(ibb->fd, 0),
-					   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+					   system_memory(ibb->fd), 0);
 
 	/* Reacquire offset for RELOC and SIMPLE */
 	if (ibb->allocator_type == INTEL_ALLOCATOR_SIMPLE ||
diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index e15cc24468f4..92e451c1e722 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -362,7 +362,7 @@ static void block_copy(int xe,
 	uint8_t uc_mocs = intel_get_uc_mocs_index(xe);
 	int result;
 
-	bb = xe_bo_create(xe, 0, bb_size, region1, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	bb = xe_bo_create(xe, 0, bb_size, system_memory(xe), 0);
 
 	if (!blt_uses_extended_block_copy(xe))
 		pext = NULL;
@@ -497,7 +497,7 @@ static void block_multicopy(int xe,
 	uint8_t uc_mocs = intel_get_uc_mocs_index(xe);
 	int result;
 
-	bb = xe_bo_create(xe, 0, bb_size, region1, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	bb = xe_bo_create(xe, 0, bb_size, system_memory(xe), 0);
 
 	if (!blt_uses_extended_block_copy(xe))
 		pext3 = NULL;
@@ -593,7 +593,7 @@ static void block_copy_large(int xe,
 	bool result = true;
 	int i;
 
-	bb = xe_bo_create(xe, 0, bb_size, region1, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	bb = xe_bo_create(xe, 0, bb_size, system_memory(xe), 0);
 
 	if (!blt_uses_extended_block_copy(xe))
 		pext = NULL;
diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index e24216ee18e4..7b944370a1c5 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -98,7 +98,7 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
 	igt_debug("size: %u, pitch: %u, width: %u, height: %u (type: %d, mode: %d)\n",
 		  size, pitch, width, height, type, mode);
 
-	bb = xe_bo_create(fd, 0, bb_size, region, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	bb = xe_bo_create(fd, 0, bb_size, system_memory(fd), 0);
 
 	blt_mem_copy_init(fd, &mem, mode, type);
 	mem.print_bb = param.print_bb;
@@ -185,7 +185,7 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
 	uint32_t bb;
 	uint8_t *result;
 
-	bb = xe_bo_create(fd, 0, bb_size, region, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	bb = xe_bo_create(fd, 0, bb_size, system_memory(fd), 0);
 	blt_mem_set_init(fd, &mem, TYPE_LINEAR);
 	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height, region,
 			   dst_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
diff --git a/tests/intel/xe_evict_ccs.c b/tests/intel/xe_evict_ccs.c
index 175461a4f5d8..828ddd2cf3a1 100644
--- a/tests/intel/xe_evict_ccs.c
+++ b/tests/intel/xe_evict_ccs.c
@@ -85,8 +85,7 @@ static void copy_obj(struct blt_copy_data *blt,
 	w = src_obj->x2;
 	h = src_obj->y2;
 
-	bb = xe_bo_create(fd, 0, bb_size, vram_memory(fd, 0),
-			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	bb = xe_bo_create(fd, 0, bb_size, system_memory(fd), 0);
 
 	blt->color_depth = CD_32bit;
 	blt->print_bb = params.print_bb;
diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
index 211605a8b399..e6aaa8a80d74 100644
--- a/tests/intel/xe_exercise_blt.c
+++ b/tests/intel/xe_exercise_blt.c
@@ -141,7 +141,7 @@ static void fast_copy_emit(int xe, const intel_ctx_t *ctx,
 	uint32_t bb;
 	int result;
 
-	bb = xe_bo_create(xe, 0, bb_size, region1, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	bb = xe_bo_create(xe, 0, bb_size, system_memory(xe), 0);
 
 	blt_copy_init(xe, &bltinit);
 	src = blt_create_object(&bltinit, region1, width, height, bpp, 0,
@@ -200,7 +200,7 @@ static void fast_copy(int xe, const intel_ctx_t *ctx,
 	uint32_t bb;
 	int result;
 
-	bb = xe_bo_create(xe, 0, bb_size, region1, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	bb = xe_bo_create(xe, 0, bb_size, system_memory(xe), 0);
 
 	blt_copy_init(xe, &blt);
 	src = blt_create_object(&blt, region1, width, height, bpp, 0,
diff --git a/tests/intel/xe_peer2peer.c b/tests/intel/xe_peer2peer.c
index 5cfb986c194e..f5ebfeaa591c 100644
--- a/tests/intel/xe_peer2peer.c
+++ b/tests/intel/xe_peer2peer.c
@@ -160,7 +160,7 @@ static void test_read(struct gpu_info *ex_gpu, struct gpu_info *im_gpu,
 	blt_set_copy_object(&im_blt.src, im_src);
 	blt_set_copy_object(&im_blt.dst, dst);
 
-	bb = xe_bo_create(im_xe, 0, im_bb_size, im_reg, 0);
+	bb = xe_bo_create(im_xe, 0, im_bb_size, system_memory(im_xe), 0);
 	blt_set_batch(&im_blt.bb, bb, im_bb_size);
 
 	blt_fast_copy(im_xe, ctx, NULL, ahnd, &im_blt);
@@ -249,7 +249,7 @@ static void test_write(struct gpu_info *ex_gpu, struct gpu_info *im_gpu,
 	blt_set_copy_object(&im_blt.src, src);
 	blt_set_copy_object(&im_blt.dst, im_dst);
 
-	bb = xe_bo_create(im_xe, 0, im_bb_size, im_reg, 0);
+	bb = xe_bo_create(im_xe, 0, im_bb_size, system_memory(im_xe), 0);
 	blt_set_batch(&im_blt.bb, bb, im_bb_size);
 
 	blt_fast_copy(im_xe, ctx, NULL, ahnd, &im_blt);
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 2f77b5073017..3ce5535b5904 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -319,8 +319,7 @@ static void import_fb(int importer_fd, struct igt_fb *fb,
 			blt_set_copy_object(&blt.dst, dst);
 
 			xe_bb = xe_bo_create(importer_fd, 0, bb_size,
-					     vram_if_possible(importer_fd, 0),
-					     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+					     system_memory(importer_fd), 0);
 
 			blt_set_batch(&blt.bb, xe_bb, bb_size);
 			blt_fast_copy(importer_fd, xe_ctx, NULL, ahnd, &blt);
diff --git a/tools/intel_tiling_detect.c b/tools/intel_tiling_detect.c
index 0bc1e202d33c..a72999057088 100644
--- a/tools/intel_tiling_detect.c
+++ b/tools/intel_tiling_detect.c
@@ -112,7 +112,7 @@ static void blt_copy(int fd,
 		bb_size = xe_bb_size(fd, SZ_4K);
 		src_region = system_memory(fd);
 		dst_region = vram_if_possible(fd, 0);
-		bb = xe_bo_create(fd, 0, bb_size, src_region, 0);
+		bb = xe_bo_create(fd, 0, bb_size, system_memory(fd), 0);
 	} else {
 		bb_size = SZ_4K;
 		src_region = REGION_SMEM;
-- 
2.51.2

