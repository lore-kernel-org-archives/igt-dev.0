Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE94C71155
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 14:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C774D10E3C4;
	Mon, 16 Jun 2025 14:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fez9crCf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C928810E3B9
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 14:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750083788; x=1781619788;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4wb4tK0azp1VfYBhuIpoCLeq5moPsj1cbGGjtAPuo8I=;
 b=Fez9crCfR88Ky+ihXQfZdxL+eJ1Hck5lFVRFzGGhErppM4hhB2NTWrA9
 ZIoiTMBSdNJxhQvXnzMT28r2T+r8y/VHXyI+ck6ViWSxPuXLZdssaZkcB
 VdhVwQD1I44bVcPwUIAVxfhyRd5gk/+7tOQ/Lx0Hbl4O9OUdq9ZohcMGk
 ecViBnAnm/lfGmfm/dIxyEkYRKbmGfkS/GXHvFdFtmz+rrNhtX1m05Acf
 uGgtzxiUOe5A3pVvkaa4Lpdga4G4Kk3onaUu6BVDiA+bymZEoQRXuWIRa
 nieSA7aQTroBoYnDKr3zY8McvtYlkYvWfAPMujJf5Wgh0CHbymzzmYpn+ Q==;
X-CSE-ConnectionGUID: 2txIOICITRWLmeXlRNTpiQ==
X-CSE-MsgGUID: SP9RKG+gSJyffn70ubxiiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="54847196"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="54847196"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 07:23:07 -0700
X-CSE-ConnectionGUID: Eislo5dxS2GuoBPp8tNuGA==
X-CSE-MsgGUID: LIINAqvzTX6Yc8yA9SmiEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="152324562"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 07:23:06 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.auld@intel.com, kamil.konieczny@intel.com, lukasz.laguna@intel.com
Subject: [PATCH i-g-t v3 1/2] tests/intel/xe_*: Use NEEDS_VISIBLE_VRAM flag
 where it's missing
Date: Mon, 16 Jun 2025 16:22:58 +0200
Message-Id: <20250616142259.19124-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250616142259.19124-1-lukasz.laguna@intel.com>
References: <20250616142259.19124-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
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

Set DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM flag when creating BOs
that will be CPU-mapped, to ensure that the corresponding VRAM
allocation will use the CPU accessible part of VRAM.

This is essential for small-bar systems, where omitting the flag may
cause failures or SIGBUS crashes due to the CPU accessing non-visible
VRAM.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_ccs.c                      |  6 +++---
 tests/intel/xe_copy_basic.c               | 10 ++++++----
 tests/intel/xe_exercise_blt.c             |  4 ++--
 tests/intel/xe_pat.c                      |  3 ++-
 tests/intel/xe_spin_batch.c               |  3 ++-
 tests/intel/xe_sysfs_timeslice_duration.c |  6 ++++--
 tests/intel/xe_vm.c                       |  6 ++++--
 7 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index bff5b5772..61cf97d52 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -362,7 +362,7 @@ static void block_copy(int xe,
 	uint8_t uc_mocs = intel_get_uc_mocs_index(xe);
 	int result;
 
-	bb = xe_bo_create(xe, 0, bb_size, region1, 0);
+	bb = xe_bo_create(xe, 0, bb_size, region1, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	if (!blt_uses_extended_block_copy(xe))
 		pext = NULL;
@@ -497,7 +497,7 @@ static void block_multicopy(int xe,
 	uint8_t uc_mocs = intel_get_uc_mocs_index(xe);
 	int result;
 
-	bb = xe_bo_create(xe, 0, bb_size, region1, 0);
+	bb = xe_bo_create(xe, 0, bb_size, region1, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	if (!blt_uses_extended_block_copy(xe))
 		pext3 = NULL;
@@ -593,7 +593,7 @@ static void block_copy_large(int xe,
 	bool result = true;
 	int i;
 
-	bb = xe_bo_create(xe, 0, bb_size, region1, 0);
+	bb = xe_bo_create(xe, 0, bb_size, region1, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	if (!blt_uses_extended_block_copy(xe))
 		pext = NULL;
diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index ecd942ad0..5a050b82c 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -98,7 +98,7 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
 	igt_debug("size: %u, pitch: %u, width: %u, height: %u (type: %d, mode: %d)\n",
 		  size, pitch, width, height, type, mode);
 
-	bb = xe_bo_create(fd, 0, bb_size, region, 0);
+	bb = xe_bo_create(fd, 0, bb_size, region, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	blt_mem_copy_init(fd, &mem, mode, type);
 	mem.print_bb = param.print_bb;
@@ -185,7 +185,7 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
 	uint32_t bb;
 	uint8_t *result;
 
-	bb = xe_bo_create(fd, 0, bb_size, region, 0);
+	bb = xe_bo_create(fd, 0, bb_size, region, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	blt_mem_set_init(fd, &mem, TYPE_LINEAR);
 	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height, region,
 			   dst_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
@@ -217,8 +217,10 @@ static void copy_test(int fd, struct rect *rect, enum blt_cmd_type cmd, uint32_t
 	uint32_t bo_size = ALIGN(blocksize * rect->height, xe_get_default_alignment(fd));
 	intel_ctx_t *ctx;
 
-	src_handle = xe_bo_create(fd, 0, bo_size, region, 0);
-	dst_handle = xe_bo_create(fd, 0, bo_size, region, 0);
+	src_handle = xe_bo_create(fd, 0, bo_size, region,
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	dst_handle = xe_bo_create(fd, 0, bo_size, region,
+				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	vm = xe_vm_create(fd, 0, 0);
 	exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
 	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
index 4ce97044e..a545654d3 100644
--- a/tests/intel/xe_exercise_blt.c
+++ b/tests/intel/xe_exercise_blt.c
@@ -133,7 +133,7 @@ static void fast_copy_emit(int xe, const intel_ctx_t *ctx,
 	uint32_t bb;
 	int result;
 
-	bb = xe_bo_create(xe, 0, bb_size, region1, 0);
+	bb = xe_bo_create(xe, 0, bb_size, region1, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	blt_copy_init(xe, &bltinit);
 	src = blt_create_object(&bltinit, region1, width, height, bpp, 0,
@@ -192,7 +192,7 @@ static void fast_copy(int xe, const intel_ctx_t *ctx,
 	uint32_t bb;
 	int result;
 
-	bb = xe_bo_create(xe, 0, bb_size, region1, 0);
+	bb = xe_bo_create(xe, 0, bb_size, region1, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	blt_copy_init(xe, &blt);
 	src = blt_create_object(&blt, region1, width, height, bpp, 0,
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 88d8de9dd..8bb0ac167 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -582,7 +582,8 @@ static void prime_self_import_coh(void)
 	fd1 = drm_open_driver(DRIVER_XE);
 	fd2 = drm_open_driver(DRIVER_XE);
 
-	dst_handle = xe_bo_create_caching(fd1, 0, size, all_memory_regions(fd1), 0,
+	dst_handle = xe_bo_create_caching(fd1, 0, size, all_memory_regions(fd1),
+					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
 					  DRM_XE_GEM_CPU_CACHING_WC);
 
 	dma_buf_fd = prime_handle_to_fd(fd1, dst_handle);
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 21b08ba06..48a888e35 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -442,7 +442,8 @@ static void exec_store(int fd, struct drm_xe_engine_class_instance *eci,
 	vm = xe_vm_create(fd, 0, 0);
 	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
 	bb_size = xe_bb_size(fd, sizeof(*data));
-	bb = xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, eci->gt_id), 0);
+	bb = xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, eci->gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	bb_addr = intel_allocator_alloc_with_strategy(ahnd, bb, bb_size, 0,
 						      ALLOC_STRATEGY_LOW_TO_HIGH);
 	data = xe_bo_map(fd, bb, bb_size);
diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe_sysfs_timeslice_duration.c
index 752672691..456cb9a72 100644
--- a/tests/intel/xe_sysfs_timeslice_duration.c
+++ b/tests/intel/xe_sysfs_timeslice_duration.c
@@ -76,7 +76,8 @@ static uint64_t __test_timeout(int fd, int engine, unsigned int timeout, uint16_
 	exec_queues[0] = xe_exec_queue_create(fd, vm[0], hwe, 0);
 	exec_queues[1] = xe_exec_queue_create(fd, vm[1], hwe, 0);
 	bo_size = xe_bb_size(fd, sizeof(*spin));
-	bo[0] = xe_bo_create(fd, vm[0], bo_size, vram_if_possible(fd, 0), 0);
+	bo[0] = xe_bo_create(fd, vm[0], bo_size, vram_if_possible(fd, 0),
+			     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	spin[0] = xe_bo_map(fd, bo[0], bo_size);
 	xe_vm_bind_async(fd, vm[0], 0, bo[0], 0, addr1, bo_size, &sync, 1);
 	xe_spin_init_opts(spin[0], .addr = addr1, .preempt = false);
@@ -85,7 +86,8 @@ static uint64_t __test_timeout(int fd, int engine, unsigned int timeout, uint16_
 	xe_exec(fd, &exec);
 	xe_spin_wait_started(spin[0]);
 
-	bo[1] = xe_bo_create(fd, vm[1], bo_size, vram_if_possible(fd, 0), 0);
+	bo[1] = xe_bo_create(fd, vm[1], bo_size, vram_if_possible(fd, 0),
+			     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	spin[1] = xe_bo_map(fd, bo[1], bo_size);
 	xe_vm_bind_sync(fd, vm[1], bo[1], 0, addr2, bo_size);
 	xe_spin_init_opts(spin[1], .addr = addr2);
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 94cca13ba..c1abb08bb 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1997,9 +1997,11 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 		igt_assert(map0 != MAP_FAILED);
 		igt_assert(map1 != MAP_FAILED);
 	} else {
-		bo0 = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id), 0);
+		bo0 = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id),
+				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		map0 = xe_bo_map(fd, bo0, bo_size);
-		bo1 = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id), 0);
+		bo1 = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id),
+				   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		map1 = xe_bo_map(fd, bo1, bo_size);
 	}
 	memset(map0, 0, bo_size);
-- 
2.40.0

