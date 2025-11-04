Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69B2CCF9E3
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 15:50:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B54C10E640;
	Tue,  4 Nov 2025 15:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Op2fMboA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAB910E63C
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 15:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762271415; x=1793807415;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=n4KVupD2ML36GL5WzF9HisXHph7b/WfiSlIDSgqGWa8=;
 b=Op2fMboA/CsbnDQEr1GXRc4/9pTxZizHCAe6QoGNemXSZKOiy7xpiYHe
 EGrGDzPaVveNsSZ3dh2Lu8BIGc3YEp6giON/3olpAQrD2nQXRn5R7mguE
 uBs0rex4Ey3uoCmdF4BOc/HIqRClANPKc9mpj7F1w/vIJtbIy4CvFnD5a
 WGijMKllXeWDhBVHXbetKvA5wLpHHQ1CcXtWLL6myDmiEG7QBiqZr7Da/
 ILh6Qr08S56RqaM/eP4xQFJX5sJPH2EsL4qrCCICyAonedxFxRBacLSU3
 DP+i+0WNQjtomgUxXzbO6W7gGPhzOqJkIOS7FeapyemlxFXCu2faUtlCT A==;
X-CSE-ConnectionGUID: S+IT7WdASbK3pQDCHF8BHA==
X-CSE-MsgGUID: jrbc38WGRoyvpzCRuCiNaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68206035"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="68206035"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 07:50:13 -0800
X-CSE-ConnectionGUID: ewvyIzDoTDymYC4u0uTtVQ==
X-CSE-MsgGUID: gbg8I9B+S2S9Tq6VPD3R7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="191542292"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.72])
 by orviesa004.jf.intel.com with ESMTP; 04 Nov 2025 07:50:13 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Subject: [PATCH i-g-t v3 7/7] tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU
 conflicting madvise test
Date: Tue,  4 Nov 2025 15:50:11 +0000
Message-ID: <20251104155012.679830-8-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251104155012.679830-1-nishit.sharma@intel.com>
References: <20251104155012.679830-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

This test calls madvise operations on GPU0 with the preferred location set
to GPU1 and vice versa. It reports conflicts when conflicting memory advice
is given for shared SVM buffers in a multi-GPU environment.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_multi_gpusvm.c | 206 ++++++----------------------------
 1 file changed, 36 insertions(+), 170 deletions(-)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index df4f972b2..5b2ee7afe 100644
--- a/tests/intel/xe_multi_gpusvm.c
+++ b/tests/intel/xe_multi_gpusvm.c
@@ -74,6 +74,8 @@
 #define EXEC_SYNC_VAL 0x676767
 #define COPY_SIZE SZ_64M
 #define	ATOMIC_OP_VAL	56
+#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
+#define FIVE_SEC                (5LL * NSEC_PER_SEC)
 
 struct xe_svm_gpu_info {
         bool supports_faults;
@@ -877,32 +879,14 @@ pagefault_test_multigpu(struct xe_svm_gpu_info *gpu0,
         xe_vm_destroy(gpu1->fd, vm[1]);
 }
 
-int mem_region(int fd)
-{
-	uint64_t regions = all_memory_regions(fd);
-        uint64_t region = -1;
-
-	xe_for_each_mem_region(fd, regions, region) {
-                if (XE_IS_SYSMEM_MEMORY_REGION(fd, region)) {
-                        struct drm_xe_mem_region *mem_region =
-                                xe_mem_region(fd, 1ull << (region));
-                        region = mem_region->instance;
-			printf("region instance :%d region name :%s\n", region, xe_region_name(region));
-			break;
-                }
-        }
-
-	printf("returning region :%d\n", region);
-	return region;
-}
-
 #define	XE_BO_FLAG_SYSTEM	BIT(1)
 #define XE_BO_FLAG_CPU_ADDR_MIRROR      BIT(24)
 
 static void
 conflicting_madvise(struct xe_svm_gpu_info *gpu0,
 		    struct xe_svm_gpu_info *gpu1,
-		    struct drm_xe_engine_class_instance *eci)
+		    struct drm_xe_engine_class_instance *eci,
+		    bool prefetch_req)
 {
 
 	uint32_t vm[3];
@@ -914,12 +898,11 @@ conflicting_madvise(struct xe_svm_gpu_info *gpu0,
 	volatile uint64_t sync_val2 = 0;
 	volatile uint64_t *sync_addr;
 
-	// Define sync structures
 	struct drm_xe_sync sync1 = {
 		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
 		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
-		.addr = (uint64_t)(uintptr_t)&sync_val1, // user-space address
-		.timeline_value = USER_FENCE_VALUE, // or desired fence value
+		.addr = (uint64_t)(uintptr_t)&sync_val1,
+		.timeline_value = USER_FENCE_VALUE,
 	};
 
 	struct drm_xe_sync sync2 = {
@@ -931,7 +914,7 @@ conflicting_madvise(struct xe_svm_gpu_info *gpu0,
 
 #define QUARTER_SEC             (NSEC_PER_SEC / 4)
 	int64_t timeout = QUARTER_SEC;
-	data = aligned_alloc(SZ_64M, SZ_64M);
+	data = aligned_alloc(SZ_2M, SZ_4K);
 	igt_assert(data);
 
 	vm[0] = xe_vm_create(gpu0->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
@@ -944,69 +927,48 @@ conflicting_madvise(struct xe_svm_gpu_info *gpu0,
 
 	svm_addr = to_user_pointer(data);
 
-	xe_vm_madvise(gpu0->fd, vm[0], svm_addr, COPY_SIZE, 0,
+	xe_vm_madvise(gpu0->fd, vm[0], svm_addr, SZ_4K, 0,
 		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
 		      DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0, 0);
 
-	*(uint64_t *)svm_addr = 50;
-
-	atomic_batch_init(gpu0->fd, vm[0], svm_addr, &batch_bo[0], &batch_addr[0]);
-	atomic_batch_init(gpu1->fd, vm[1], svm_addr, &batch_bo[1], &batch_addr[1]);
-
-#if 0
-	xe_vm_madvise(gpu0->fd, vm[0], svm_addr, COPY_SIZE, 0,
-			DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
-			DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0, 0);
-	xe_vm_madvise(gpu1->fd, vm[0], svm_addr, COPY_SIZE, 0,
-			DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
-			DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0, 0);
-#endif
+	store_dword_batch_init(gpu0->fd, vm[0], svm_addr, &batch_bo[0], &batch_addr[0], 10);
+	store_dword_batch_init(gpu1->fd, vm[0], svm_addr, &batch_bo[1], &batch_addr[1], 10);
 
-#if 1
-	xe_vm_madvise(gpu0->fd, vm[0], svm_addr, BATCH_SIZE(gpu0->fd), 0,
+	xe_vm_madvise(gpu0->fd, vm[0], svm_addr, SZ_4K, 0,
 		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
 		      gpu1->fd, 0, gpu1->vram_regions[0]);
 
-	xe_vm_madvise(gpu1->fd, vm[0], svm_addr, BATCH_SIZE(gpu1->fd), 0,
-		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
-		      gpu0->fd, 0, gpu0->vram_regions[0]);
-#endif
-#if 0
-	xe_vm_madvise(gpu0->fd, vm[0], svm_addr, BATCH_SIZE(gpu0->fd), 0,
+	xe_vm_madvise(gpu1->fd, vm[0], svm_addr, SZ_4K, 0,
 		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
 		      gpu0->fd, 0, gpu0->vram_regions[0]);
 
-	xe_vm_madvise(gpu1->fd, vm[0], svm_addr, BATCH_SIZE(gpu1->fd), 0,
-		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
-		      gpu1->fd, 0, gpu1->vram_regions[0]);
-#endif
-
-	xe_vm_prefetch_async(gpu0->fd, vm[0], 0, 0, svm_addr,
-			     BATCH_SIZE(gpu0->fd), &sync1, 1,
-			     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
-
-	xe_vm_prefetch_async(gpu1->fd, vm[0], 0, 0, svm_addr,
-			     BATCH_SIZE(gpu1->fd), &sync2, 1,
-			     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
-	if (sync_val1 != BIND_SYNC_VAL)
-		__xe_wait_ufence(gpu0->fd, (uint64_t *)&sync1, BIND_SYNC_VAL, exec_queue[0],
-				&timeout);
-	if (sync_val2 != BIND_SYNC_VAL)
-		__xe_wait_ufence(gpu1->fd, (uint64_t *)&sync2, BIND_SYNC_VAL, exec_queue[1],
-				&timeout);
+	if (prefetch_req) {
+		xe_vm_prefetch_async(gpu0->fd, vm[0], 0, 0, svm_addr,
+				     SZ_4K, &sync1, 1,
+				     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+		xe_vm_prefetch_async(gpu1->fd, vm[0], 0, 0, svm_addr,
+				     SZ_4K, &sync2, 1,
+				     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+		if (sync_val1 != BIND_SYNC_VAL)
+			__xe_wait_ufence(gpu0->fd, (uint64_t *)&sync1, BIND_SYNC_VAL, exec_queue[0],
+					 &timeout);
+		if (sync_val2 != BIND_SYNC_VAL)
+			__xe_wait_ufence(gpu1->fd, (uint64_t *)&sync2, BIND_SYNC_VAL, exec_queue[1],
+					 &timeout);
+	}
 
 	sync_addr = (void *)((char *)batch_addr[0] + SZ_4K);
 	sync1.addr = to_user_pointer((uint64_t *)sync_addr);
-	//sync.timeline_value = EXEC_SYNC_VAL;
 	*sync_addr = 0;
 
-        /* Executing ATOMIC_INC on GPU0. */
+        /* Executing STORE on GPU0. */
         xe_exec_sync(gpu0->fd, exec_queue[0], batch_addr[0], &sync1, 1);
         if (*sync_addr != EXEC_SYNC_VAL)
                 __xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[0],
                                &timeout);
 
-	igt_assert_eq(*(uint64_t *)svm_addr, 51);
+	igt_assert_eq(*(uint64_t *)svm_addr, 10);
+
 	munmap((void *)batch_addr[0], BATCH_SIZE(gpu0->fd));
 	munmap((void *)batch_addr[1], BATCH_SIZE(gpu1->fd));
 	batch_fini(gpu0->fd, vm[0], batch_bo[0], batch_addr[0]);
@@ -1022,104 +984,6 @@ conflicting_madvise(struct xe_svm_gpu_info *gpu0,
 	xe_vm_destroy(gpu1->fd, vm[1]);
 }
 
-static void
-conflict_test_multigpu(struct xe_svm_gpu_info *gpu0,
-		       struct xe_svm_gpu_info *gpu1,
-		       struct drm_xe_engine_class_instance *eci)
-{
-	uint32_t vm[2];
-	uint32_t exec_queue[2];
-	uint32_t batch_bo, batch1_bo;
-	void *copy_src, *copy_dst;
-	uint64_t batch_addr, svm_addr;
-	int region;
-	struct drm_xe_sync sync = {};
-	volatile uint64_t *sync_addr;
-	void *batch, *cpu_ptr;
-	struct xe_svm_gpu_info gpu_mem[1];
-
-#if 1
-	vm[0] = xe_vm_create(gpu0->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
-	exec_queue[0] = xe_exec_queue_create(gpu0->fd, vm[0], eci, 0);
-	xe_vm_bind_lr_sync(gpu0->fd, vm[0], 0, 0, 0, 1ull <<  gpu0->va_bits, DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
-
-	vm[1] = xe_vm_create(gpu1->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
-	exec_queue[1] = xe_exec_queue_create(gpu1->fd, vm[1], eci, 0);
-	xe_vm_bind_lr_sync(gpu1->fd, vm[1], 0, 0, 0, 1ull <<  gpu1->va_bits, DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
-
-	region = mem_region(gpu0->fd);
-	int render_fd;
-	render_fd = drm_open_driver(DRIVER_XE);
-	printf("render_fd :%d gpu0->fd :%d gpu1->fd :%d\n",
-			render_fd, gpu0->fd, gpu0->fd);
-//	printf("region is :%d\n", region);
-	//batch_bo = xe_bo_create(render_fd, 0, BATCH_SIZE(render_fd), system_memory(render_fd), XE_BO_FLAG_SYSTEM);
-	batch_bo = xe_bo_create(gpu0->fd, vm[0], BATCH_SIZE(gpu0->fd), region, XE_BO_FLAG_SYSTEM);
-	batch = xe_bo_map(gpu0->fd, batch_bo, BATCH_SIZE(gpu0->fd));
-	//batch = xe_bo_map(render_fd, batch_bo, BATCH_SIZE(render_fd));
-	render_fd = open("/dev/dri/card0", O_RDWR);
-	if (render_fd <= 0) {
-	    perror("open error for card0");
-    // handle error
-	}
-	//render_fd = drm_open_driver(DRIVER_XE);
-	printf("render_fd :%d gpu0->fd :%d gpu1->fd :%d\n",
-			render_fd, gpu0->fd, gpu1->fd);
-	printf("region is :%d\n", region);
-	//batch_bo = xe_bo_create(render_fd, 0, COPY_SIZE, region, XE_BO_FLAG_SYSTEM);
-	batch_bo = xe_bo_create(gpu0->fd, 0, BATCH_SIZE(gpu0->fd), region, XE_BO_FLAG_SYSTEM);
-	batch = xe_bo_map(gpu0->fd, batch_bo, BATCH_SIZE(gpu0->fd));
-	//batch = xe_bo_map(render_fd, batch_bo, COPY_SIZE);
-	igt_assert(batch);
-
-	svm_addr = to_user_pointer(batch);
-
-	igt_info("Calling first bind\n");
-	xe_vm_bind_lr_sync(gpu0->fd, vm[0], batch_bo, 0, svm_addr, BATCH_SIZE(gpu0->fd), 0);
-	igt_info("Calling second bind\n");
-	//xe_vm_bind_lr_sync(gpu1->fd, vm[1], batch_bo, 0, svm_addr, BATCH_SIZE(gpu1->fd), 0);
-	//xe_vm_bind_lr_sync(gpu1->fd, vm[0], batch_bo, 0, svm_addr, BATCH_SIZE(gpu1->fd), 0);
-
-	xe_vm_madvise(gpu0->fd, vm[0], svm_addr, BATCH_SIZE(gpu0->fd), 0,
-		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
-		      gpu0->fd, 0, gpu0->vram_regions[0]);
-
-	xe_vm_madvise(gpu1->fd, vm[0], svm_addr, BATCH_SIZE(gpu1->fd), 0,
-		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
-		      gpu1->fd, 0, gpu1->vram_regions[0]);
-	xe_vm_madvise(gpu0->fd, vm[0], svm_addr, BATCH_SIZE(gpu1->fd), 0,
-		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
-		      gpu1->fd, 0, gpu1->vram_regions[0]);
-#if 0
-	xe_vm_madvise(gpu1->fd, vm[0], svm_addr, BATCH_SIZE(gpu1->fd), 0,
-		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
-		      gpu1->fd, 0, gpu1->vram_regions[0]);
-#endif
-
-	printf("1st Prefetch calling\n");
-	xe_vm_prefetch_async(gpu0->fd, vm[0], 0, 0, svm_addr,
-			     BATCH_SIZE(gpu0->fd), &sync, 1,
-			     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
-
-	printf("2nd Prefetch calling\n");
-	xe_vm_prefetch_async(gpu0->fd, vm[0], 0, 0, svm_addr,
-			     BATCH_SIZE(gpu1->fd), &sync, 1,
-			     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
-
-	munmap((void *)batch_addr, BATCH_SIZE(gpu0->fd));
-	batch_fini(gpu0->fd, vm[0], batch_bo, batch_addr);
-	xe_vm_unbind_lr_sync(gpu0->fd, vm[0], 0, 0, 1ull << gpu0->va_bits);
-	xe_exec_queue_destroy(gpu0->fd, exec_queue[0]);
-	xe_vm_destroy(gpu0->fd, vm[0]);
-
-	batch_fini(gpu1->fd, vm[1], batch_bo, batch_addr);
-	xe_vm_unbind_lr_sync(gpu1->fd, vm[1], 0, 0, 1ull << gpu1->va_bits);
-	xe_exec_queue_destroy(gpu1->fd, exec_queue[1]);
-	xe_vm_destroy(gpu1->fd, vm[1]);
-	drm_close_driver(render_fd);
-#endif
-}
-
 static void
 atomic_inc_op(struct xe_svm_gpu_info *gpu0,
 	      struct xe_svm_gpu_info *gpu1,
@@ -1399,13 +1263,13 @@ gpu_coherecy_test(struct xe_svm_gpu_info *src_gpu,
 static void
 gpu_conflict_madvise_test(struct xe_svm_gpu_info *src_gpu,
                           struct xe_svm_gpu_info *dst_gpu,
-			  struct drm_xe_engine_class_instance *eci)
+			  struct drm_xe_engine_class_instance *eci,
+			  bool prefetch_req)
 {
 	igt_assert(src_gpu);
 	igt_assert(dst_gpu);
 
-        //conflict_test_multigpu(src_gpu, dst_gpu, eci);
-        conflicting_madvise(src_gpu, dst_gpu, eci);
+        conflicting_madvise(src_gpu, dst_gpu, eci, prefetch_req);
 }
 
 static void
@@ -1488,8 +1352,10 @@ igt_main
 		gpu_coherecy_test(&gpus[0], &gpus[1], &eci, 1, 0);
 	}
 
-	igt_subtest("conflicting-madvise-gpu")
-		gpu_conflict_madvise_test(&gpus[0], &gpus[1], &eci);
+	igt_subtest("conflicting-madvise-gpu") {
+		gpu_conflict_madvise_test(&gpus[0], &gpus[1], &eci, 1);
+		gpu_conflict_madvise_test(&gpus[0], &gpus[1], &eci, 0);
+	}
 
 	igt_subtest("latency-multi-gpu") {
 		gpu_latency_test(&gpus[0], &gpus[1], &eci, 1, 1);
-- 
2.48.1

