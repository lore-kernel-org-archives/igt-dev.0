Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BE9CCFA1A
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 03:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8786410E114;
	Mon, 10 Nov 2025 03:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K/WtDTNG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541EE10E114
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 03:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762747195; x=1794283195;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ohBsqUEXzXNZlsCwE9TgyglpedVvIPKpJWMcRy7ewLE=;
 b=K/WtDTNGu96/PEMyEBcVh4mZspLH/Fi7QqQWrGcBCFPdiWJVjwQmLMNv
 ge/MB/FnGNamBnekHfZb+VssManHEjfepHXjT33hRLTb2e+GB1rbdCUcS
 Z9+x75SP0gkX593wws2sKLPDG/TUdCg0jj6M96O4bsB3EvecWr042FBvV
 2bQROTW5FeJztIZTfzT6DVc1PMm6NboV16czKAbH4XH9BXPO07ITAGZcc
 L2eCQnG/6ZaoFXgSw0wtxvBpOFG3y2+p5r0uIVAjwbgFREezOYOscDgQQ
 q+tON8poIzpH8ew5ICcYl6GMO4Xf7JSRbP8KOEjXhFzwRz1HXcMkbg37A w==;
X-CSE-ConnectionGUID: biKWXIjLS4yiFvL7bvq3Yg==
X-CSE-MsgGUID: 5bNIbat8TfePi0eLQjrjmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64722976"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64722976"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2025 19:59:40 -0800
X-CSE-ConnectionGUID: yM5lbXYiTcibJGaUwWMq2g==
X-CSE-MsgGUID: U9fpJvf8RBu01DMC0KPXTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; d="scan'208";a="187818834"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.39])
 by orviesa006.jf.intel.com with ESMTP; 09 Nov 2025 19:59:40 -0800
From: Nishit Sharma <nishit.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v4 8/8] tests/intel/xe_multi-gpusvm.c: Add SVM multi-GPU
 migration test
Date: Mon, 10 Nov 2025 03:59:37 +0000
Message-ID: <20251110035939.222876-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251104153201.677938-1-nishit.sharma@intel.com>
References: <20251104153201.677938-1-nishit.sharma@intel.com>
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

This test allocates a buffer in SVM, accesses it from GPU 1, then GPU 2
and then the CPU. It verifies that the buffer migrates correctly between
devices and remains accessible across all agents in a multi-GPU environment.
---
 tests/intel/xe_multi_gpusvm.c | 197 ++++++++++++++++++++++++++++++++++
 tests/intel/xe_multisvm.c     |   2 +
 2 files changed, 199 insertions(+)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index a41c8b7ad..28d47f274 100644
--- a/tests/intel/xe_multi_gpusvm.c
+++ b/tests/intel/xe_multi_gpusvm.c
@@ -64,6 +64,11 @@
  * Description:
  * 	This tests aunches simultaneous workloads on both GPUs accessing the
  * 	same SVM buffer synchronizes with fences, and verifies data integrity
+ *
+ * SUBTEST: migrate-test-multi-gpu
+ * Description:
+ * 	This test allocates an SVM buffer, accesses it from GPU 1, GPU 2, and CPU,
+ * 	and verifies migration and accessibility between devices
  */
 
 #define MAX_XE_REGIONS	8
@@ -1255,6 +1260,181 @@ multigpu_access_test(struct xe_svm_gpu_info *gpu0,
 	xe_vm_destroy(gpu1->fd, vm[1]);
 }
 
+static void
+multigpu_migrate_test(struct xe_svm_gpu_info *gpu0,
+		      struct xe_svm_gpu_info *gpu1,
+		      struct drm_xe_engine_class_instance *eci,
+		      bool prefetch_req)
+{
+        uint64_t addr;
+        uint32_t vm[2];
+        uint32_t exec_queue[2];
+        uint32_t batch_bo, batch1_bo[2];
+        uint64_t batch_addr, batch1_addr[2];
+        struct drm_xe_sync sync = {};
+        volatile uint64_t *sync_addr;
+        int value = 60;
+	uint64_t *data1;
+	void *copy_dst;
+
+        vm[0] = xe_vm_create(gpu0->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+        exec_queue[0] = xe_exec_queue_create(gpu0->fd, vm[0], eci, 0);
+        xe_vm_bind_lr_sync(gpu0->fd, vm[0], 0, 0, 0, 1ull <<  gpu0->va_bits, DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+
+        vm[1] = xe_vm_create(gpu1->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+        exec_queue[1] = xe_exec_queue_create(gpu1->fd, vm[1], eci, 0);
+        xe_vm_bind_lr_sync(gpu1->fd, vm[1], 0, 0, 0, 1ull <<  gpu1->va_bits, DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+
+        data1 = aligned_alloc(SZ_2M, SZ_4K);
+       	igt_assert(data1);
+	addr = to_user_pointer(data1);
+
+	copy_dst = aligned_alloc(SZ_2M, SZ_4K);
+	igt_assert(copy_dst);
+
+	xe_vm_madvise(gpu0->fd, vm[0], addr, SZ_4K, 0,
+		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+		      DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0, 0);
+
+        store_dword_batch_init(gpu0->fd, vm[0], addr, &batch1_bo[0], &batch1_addr[0], value);
+
+        /* Place destination in GPU0 local memory location to test */
+        xe_vm_madvise(gpu0->fd, vm[0], addr, SZ_4K, 0,
+                      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+                      gpu0->fd, 0, gpu0->vram_regions[0]);
+
+        sync_addr = malloc(sizeof(*sync_addr));
+        igt_assert(!!sync_addr);
+        sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+        sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = BIND_SYNC_VAL;
+        *sync_addr = 0;
+
+	/* prefetch full buffer for GPU0 */
+	if (prefetch_req) {
+		xe_vm_prefetch_async(gpu0->fd, vm[0], 0, 0, addr, SZ_4K, &sync, 1,
+				     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+		if (*sync_addr != BIND_SYNC_VAL)
+			xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, exec_queue[0],
+				       NSEC_PER_SEC * 10);
+	}
+        free((void *)sync_addr);
+
+        sync_addr = (void *)((char *)batch1_addr[0] + SZ_4K);
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = EXEC_SYNC_VAL;
+        *sync_addr = 0;
+
+        /* Execute STORE command on GPU0 */
+        xe_exec_sync(gpu0->fd, exec_queue[0], batch1_addr[0], &sync, 1);
+        if (*sync_addr != EXEC_SYNC_VAL)
+                xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[0],
+			       NSEC_PER_SEC * 10);
+
+        igt_assert_eq(*(uint64_t *)addr, value);
+
+	/* Creating batch for GPU1 using addr as Src which have value from GPU0 */
+        store_dword_batch_init(gpu1->fd, vm[1], addr, &batch1_bo[1], &batch1_addr[1], value + 10);
+
+        /* Place destination in GPU1 local memory location to test */
+        xe_vm_madvise(gpu1->fd, vm[1], addr, SZ_4K, 0,
+                      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+                      gpu1->fd, 0, gpu1->vram_regions[0]);
+
+        sync_addr = malloc(sizeof(*sync_addr));
+        igt_assert(!!sync_addr);
+        sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+        sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = BIND_SYNC_VAL;
+        *sync_addr = 0;
+
+	/* prefetch full buffer for GPU1 */
+	if (prefetch_req) {
+		xe_vm_prefetch_async(gpu1->fd, vm[1], 0, 0, addr,
+				     SZ_4K, &sync, 1,
+				     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+		if (*sync_addr != BIND_SYNC_VAL)
+			xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, exec_queue[1],
+				       NSEC_PER_SEC * 10);
+	}
+        free((void *)sync_addr);
+
+        sync_addr = (void *)((char *)batch1_addr[1] + SZ_4K);
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = EXEC_SYNC_VAL;
+        *sync_addr = 0;
+
+        /* Execute COPY command on GPU1 */
+        xe_exec_sync(gpu1->fd, exec_queue[1], batch1_addr[1], &sync, 1);
+        if (*sync_addr != EXEC_SYNC_VAL)
+                xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[1],
+			       NSEC_PER_SEC * 10);
+
+        igt_assert_eq(*(uint64_t *)addr, value + 10);
+
+        /* CPU writes 10, memset set bytes no integer hence memset fills 4 bytes with 0x0A */
+        memset((void *)(uintptr_t)addr, 10, sizeof(int));
+        igt_assert_eq(*(uint64_t *)addr, 0x0A0A0A0A);
+
+	/* Creating batch for GPU1 using addr as Src which have value from GPU0 */
+	batch_init(gpu1->fd, vm[1], addr, to_user_pointer(copy_dst),
+			SZ_4K, &batch1_bo[1], &batch1_addr[1]);
+	
+        /* Place destination in GPU1 local memory location to test */
+        xe_vm_madvise(gpu1->fd, vm[1], addr, SZ_4K, 0,
+                      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+                      gpu1->fd, 0, gpu1->vram_regions[0]);
+
+        sync_addr = malloc(sizeof(*sync_addr));
+        igt_assert(!!sync_addr);
+        sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+        sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = BIND_SYNC_VAL;
+        *sync_addr = 0;
+
+        /* prefetch full buffer for GPU1 */
+        if (prefetch_req) {
+                xe_vm_prefetch_async(gpu1->fd, vm[1], 0, 0, addr,
+                                     SZ_4K, &sync, 1,
+                                     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+                if (*sync_addr != BIND_SYNC_VAL)
+                        xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, exec_queue[1],
+                                       NSEC_PER_SEC * 10);
+        }
+        free((void *)sync_addr);
+
+        sync_addr = (void *)((char *)batch1_addr[1] + SZ_4K);
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = EXEC_SYNC_VAL;
+        *sync_addr = 0;
+
+        /* Execute COPY command on GPU1 */
+        xe_exec_sync(gpu1->fd, exec_queue[1], batch1_addr[1], &sync, 1);
+        if (*sync_addr != EXEC_SYNC_VAL)
+                xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[1],
+                               NSEC_PER_SEC * 10);
+
+        igt_assert_eq(*(uint64_t *)copy_dst, 0x0A0A0A0A);
+
+        munmap((void *)batch1_addr[0], BATCH_SIZE(gpu0->fd));
+        munmap((void *)batch1_addr[1], BATCH_SIZE(gpu1->fd));
+        batch_fini(gpu0->fd, vm[0], batch1_bo[0], batch1_addr[0]);
+        batch_fini(gpu1->fd, vm[1], batch1_bo[1], batch1_addr[1]);
+        free(data1);
+        free(copy_dst);
+
+        xe_vm_unbind_lr_sync(gpu0->fd, vm[0], 0, 0, 1ull << gpu0->va_bits);
+        xe_exec_queue_destroy(gpu0->fd, exec_queue[0]);
+        xe_vm_destroy(gpu0->fd, vm[0]);
+
+        xe_vm_unbind_lr_sync(gpu1->fd, vm[1], 0, 0, 1ull << gpu1->va_bits);
+        xe_exec_queue_destroy(gpu1->fd, exec_queue[1]);
+        xe_vm_destroy(gpu1->fd, vm[1]);
+}
+
 static void
 gpu_atomic_inc(struct xe_svm_gpu_info *src_gpu,
 	       struct xe_svm_gpu_info *dst_gpu,
@@ -1328,6 +1508,18 @@ gpu_access_test(struct xe_svm_gpu_info *src_gpu,
 	multigpu_access_test(src_gpu, dst_gpu, eci, no_prefetch);
 }
 
+static void
+gpu_migrate_test(struct xe_svm_gpu_info *src_gpu,
+		 struct xe_svm_gpu_info *dst_gpu,
+		 struct drm_xe_engine_class_instance *eci,
+		 bool no_prefetch)
+{
+	igt_assert(src_gpu);
+	igt_assert(dst_gpu);
+
+	multigpu_migrate_test(src_gpu, dst_gpu, eci, no_prefetch);
+}
+
 igt_main
 {
 	struct xe_svm_gpu_info gpus[MAX_XE_GPUS];
@@ -1390,6 +1582,11 @@ igt_main
 		gpu_access_test(&gpus[0], &gpus[1], &eci, 1);
 	}
 
+	igt_subtest("migrate-test-multi-gpu") {
+		gpu_migrate_test(&gpus[0], &gpus[1], &eci, 0);
+		gpu_migrate_test(&gpus[0], &gpus[1], &eci, 1);
+	}
+
 	igt_fixture {
 		int cnt;
 
diff --git a/tests/intel/xe_multisvm.c b/tests/intel/xe_multisvm.c
index a57b3d62a..7bb41c62f 100644
--- a/tests/intel/xe_multisvm.c
+++ b/tests/intel/xe_multisvm.c
@@ -47,6 +47,7 @@ struct xe_svm_gpu_info {
 	int fd;
 };
 
+#if 0
 static void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 			       uint64_t addr, uint64_t size, uint32_t flags)
 {
@@ -84,6 +85,7 @@ static void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
 		xe_wait_ufence(fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, 0, NSEC_PER_SEC * 10);
 	free((void *)sync_addr);
 }
+#endif
 
 static void batch_init(int fd, uint32_t vm, uint64_t src_addr, uint64_t dst_addr,
 		       uint64_t copy_size, uint32_t *bo, uint64_t *addr)
-- 
2.48.1

