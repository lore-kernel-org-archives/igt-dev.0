Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C4CCCFA0D
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 15:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D4A10E632;
	Tue,  4 Nov 2025 15:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ztdxv3Mt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128E710E630
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 15:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762270323; x=1793806323;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6AvX9bsn+iqf0RVa0wsLbhsX/z1rDXXwVAMf2ArwXPE=;
 b=Ztdxv3MtZNBnLGw4K8vLRCKQdo+3rgW82vMg5Jl/aV+eKpH75TH+5ffd
 iW8g+2Yw0HwCfpQeKsVmIqa/TNOk6CuYKaiujwyK8cbpHvG2car+t6brQ
 SaMZpzU3lGyQyQQ0cY3j383XEV7YpcNRFa7k5OWObf3TQZiyx1fuZ+/Xp
 I4f4I42MW/eEnh/kZJwMZ5lIw83cbyv1+axzCk8r1rVgswq/cwV7v2iSx
 t/CcN8M0MP26AFwGSHj4tXc5VblfTkzcj2DT+LJUiJ6gR2HJC3UgQgfR4
 gDU+fu/B/POUiBHfJK9EsK3Q0/Ah0HZsZWB69X8hnY1HfvU1cVXUeq1oU g==;
X-CSE-ConnectionGUID: tRaHVtnATkq1D3eF/w40Rw==
X-CSE-MsgGUID: //WExFiuTput0gDIwm8T0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64272374"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64272374"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 07:32:02 -0800
X-CSE-ConnectionGUID: ZU+aPafWQcmsZEhfUiregQ==
X-CSE-MsgGUID: rNYe1dUkTluiO7tsjS7m+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="186480281"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.72])
 by orviesa010.jf.intel.com with ESMTP; 04 Nov 2025 07:32:02 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Subject: [PATCH i-g-t v2 6/7] tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU
 simultaneous access test
Date: Tue,  4 Nov 2025 15:31:58 +0000
Message-ID: <20251104153201.677938-7-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

This test launches compute or copy workloads on both GPUs that access the same
SVM buffer, using synchronization primitives (fences/semaphores) to coordinate
access. It verifies data integrity and checks for the absence of race conditions
in a multi-GPU SVM environment.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_multi_gpusvm.c | 180 +++++++++++++++++++++++++++++++++-
 1 file changed, 177 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index 22b8ad95e..df4f972b2 100644
--- a/tests/intel/xe_multi_gpusvm.c
+++ b/tests/intel/xe_multi_gpusvm.c
@@ -49,7 +49,6 @@
  * Description:
  * 	This test checks conflicting madvise by allocating shared buffer
  * 	prefetches from both and checks for migration conflicts
- * 	This test checks conflicting madvise
  *
  * SUBTEST: latency-multi-gpu
  * Description:
@@ -60,6 +59,11 @@
  * Description:
  * 	This test intentionally triggers page faults by accessing unmapped SVM
  * 	regions from both GPUs
+ *
+ * SUBTEST: concurrent-access-multi-gpu
+ * Description:
+ * 	This tests aunches simultaneous workloads on both GPUs accessing the
+ * 	same SVM buffer synchronizes with fences, and verifies data integrity
  */
 
 #define MAX_XE_REGIONS	8
@@ -908,6 +912,7 @@ conflicting_madvise(struct xe_svm_gpu_info *gpu0,
 	struct test_exec_data *data;
 	volatile uint64_t sync_val1 = 0;
 	volatile uint64_t sync_val2 = 0;
+	volatile uint64_t *sync_addr;
 
 	// Define sync structures
 	struct drm_xe_sync sync1 = {
@@ -966,6 +971,15 @@ conflicting_madvise(struct xe_svm_gpu_info *gpu0,
 		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
 		      gpu0->fd, 0, gpu0->vram_regions[0]);
 #endif
+#if 0
+	xe_vm_madvise(gpu0->fd, vm[0], svm_addr, BATCH_SIZE(gpu0->fd), 0,
+		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+		      gpu0->fd, 0, gpu0->vram_regions[0]);
+
+	xe_vm_madvise(gpu1->fd, vm[0], svm_addr, BATCH_SIZE(gpu1->fd), 0,
+		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+		      gpu1->fd, 0, gpu1->vram_regions[0]);
+#endif
 
 	xe_vm_prefetch_async(gpu0->fd, vm[0], 0, 0, svm_addr,
 			     BATCH_SIZE(gpu0->fd), &sync1, 1,
@@ -981,13 +995,31 @@ conflicting_madvise(struct xe_svm_gpu_info *gpu0,
 		__xe_wait_ufence(gpu1->fd, (uint64_t *)&sync2, BIND_SYNC_VAL, exec_queue[1],
 				&timeout);
 
+	sync_addr = (void *)((char *)batch_addr[0] + SZ_4K);
+	sync1.addr = to_user_pointer((uint64_t *)sync_addr);
+	//sync.timeline_value = EXEC_SYNC_VAL;
+	*sync_addr = 0;
+
         /* Executing ATOMIC_INC on GPU0. */
         xe_exec_sync(gpu0->fd, exec_queue[0], batch_addr[0], &sync1, 1);
-        if (sync_val1 != EXEC_SYNC_VAL)
-                __xe_wait_ufence(gpu0->fd, (uint64_t *)sync_val1, EXEC_SYNC_VAL, exec_queue[0],
+        if (*sync_addr != EXEC_SYNC_VAL)
+                __xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[0],
                                &timeout);
 
+	igt_assert_eq(*(uint64_t *)svm_addr, 51);
+	munmap((void *)batch_addr[0], BATCH_SIZE(gpu0->fd));
+	munmap((void *)batch_addr[1], BATCH_SIZE(gpu1->fd));
+	batch_fini(gpu0->fd, vm[0], batch_bo[0], batch_addr[0]);
+	batch_fini(gpu1->fd, vm[1], batch_bo[1], batch_addr[1]);
+	free(data);
 
+	xe_vm_unbind_lr_sync(gpu0->fd, vm[0], 0, 0, 1ull << gpu0->va_bits);
+	xe_exec_queue_destroy(gpu0->fd, exec_queue[0]);
+	xe_vm_destroy(gpu0->fd, vm[0]);
+
+	xe_vm_unbind_lr_sync(gpu1->fd, vm[1], 0, 0, 1ull << gpu1->va_bits);
+	xe_exec_queue_destroy(gpu1->fd, exec_queue[1]);
+	xe_vm_destroy(gpu1->fd, vm[1]);
 }
 
 static void
@@ -1214,6 +1246,131 @@ atomic_inc_op(struct xe_svm_gpu_info *gpu0,
 	xe_vm_destroy(gpu1->fd, vm[1]);
 }
 
+static void
+multigpu_access_test(struct xe_svm_gpu_info *gpu0,
+		struct xe_svm_gpu_info *gpu1,
+		struct drm_xe_engine_class_instance *eci,
+		bool no_prefetch)
+{
+	uint64_t addr;
+	uint32_t vm[2];
+	uint32_t exec_queue[2];
+	uint32_t batch_bo[2];
+	struct test_exec_data *data;
+	uint64_t batch_addr[2];
+	struct drm_xe_sync sync[2] = {};
+	volatile uint64_t *sync_addr[2];
+	volatile uint32_t *shared_val;
+#define QUARTER_SEC             (NSEC_PER_SEC / 4)
+        int64_t timeout = QUARTER_SEC;
+
+	vm[0] = xe_vm_create(gpu0->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	exec_queue[0] = xe_exec_queue_create(gpu0->fd, vm[0], eci, 0);
+	xe_vm_bind_lr_sync(gpu0->fd, vm[0], 0, 0, 0, 1ull <<  gpu0->va_bits, DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+
+	vm[1] = xe_vm_create(gpu1->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	exec_queue[1] = xe_exec_queue_create(gpu1->fd, vm[1], eci, 0);
+	xe_vm_bind_lr_sync(gpu1->fd, vm[1], 0, 0, 0, 1ull <<  gpu1->va_bits, DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+
+	data = aligned_alloc(xe_get_default_alignment(gpu0->fd), SZ_64M);
+	igt_assert(data);
+	data[0].vm_sync = 0;
+	addr = to_user_pointer(data);
+
+	shared_val = (volatile uint32_t *)addr;
+	*shared_val = ATOMIC_OP_VAL - 1;
+
+	atomic_batch_init(gpu0->fd, vm[0], addr, &batch_bo[0], &batch_addr[0]);
+	*shared_val = ATOMIC_OP_VAL - 2;
+	atomic_batch_init(gpu1->fd, vm[1], addr, &batch_bo[1], &batch_addr[1]);
+
+	/* Place destination in an optionally remote location to test */
+	xe_vm_madvise(gpu0->fd, vm[0], addr, COPY_SIZE, 0,
+		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+		      gpu0->fd, 0, gpu0->vram_regions[0]);
+
+	xe_vm_madvise(gpu1->fd, vm[1], addr, COPY_SIZE, 0,
+		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+		      gpu1->fd, 0, gpu1->vram_regions[0]);
+
+	sync_addr[0] = malloc(sizeof(*sync_addr));
+	sync_addr[1] = malloc(sizeof(*sync_addr));
+	igt_assert(!!sync_addr[0]);
+	igt_assert(!!sync_addr[1]);
+
+	sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[0].type = DRM_XE_SYNC_TYPE_USER_FENCE;
+	sync[0].addr = to_user_pointer((uint64_t *)sync_addr[0]);
+	sync[0].timeline_value = BIND_SYNC_VAL;
+	sync[1].flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].type = DRM_XE_SYNC_TYPE_USER_FENCE;
+	sync[1].addr = to_user_pointer((uint64_t *)sync_addr[1]);
+	sync[1].timeline_value = BIND_SYNC_VAL;
+	*sync_addr[0] = 0;
+	*sync_addr[1] = 0;
+
+	if(!no_prefetch) {
+		xe_vm_prefetch_async(gpu0->fd, vm[0], 0, 0, addr,
+				COPY_SIZE / 2, &sync[0], 1,
+				DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+
+		xe_vm_prefetch_async(gpu1->fd, vm[1], 0, 0, addr,
+				COPY_SIZE / 2, &sync[1], 1,
+				DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+
+		if (*sync_addr[0] != BIND_SYNC_VAL)
+			xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr[0], BIND_SYNC_VAL, exec_queue[0],
+					NSEC_PER_SEC * 10);
+		free((void *)sync_addr[0]);
+		if (*sync_addr[1] != BIND_SYNC_VAL)
+			xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr[1], BIND_SYNC_VAL, exec_queue[1],
+					NSEC_PER_SEC * 10);
+		free((void *)sync_addr[1]);
+	}
+
+	if (no_prefetch) {
+		free((void *)sync_addr[0]);
+		free((void *)sync_addr[1]);
+	}
+
+	for (int i = 0; i < 100; i++) {
+		sync_addr[0] = (void *)((char *)batch_addr[0] + SZ_4K);
+		sync[0].addr = to_user_pointer((uint64_t *)sync_addr[0]);
+		sync[0].timeline_value = EXEC_SYNC_VAL;
+
+		sync_addr[1] = (void *)((char *)batch_addr[1] + SZ_4K);
+		sync[1].addr = to_user_pointer((uint64_t *)sync_addr[1]);
+		sync[1].timeline_value = EXEC_SYNC_VAL;
+		*sync_addr[0] = 0;
+		*sync_addr[1] = 0;
+
+		xe_exec_sync(gpu0->fd, exec_queue[0], batch_addr[0], &sync[0], 1);
+		if (*sync_addr[0] != EXEC_SYNC_VAL)
+			xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr[0], EXEC_SYNC_VAL, exec_queue[0],
+					NSEC_PER_SEC * 10);
+		xe_exec_sync(gpu1->fd, exec_queue[1], batch_addr[1], &sync[1], 1);
+		if (*sync_addr[1] != EXEC_SYNC_VAL)
+			xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr[1], EXEC_SYNC_VAL, exec_queue[1],
+					NSEC_PER_SEC * 10);
+	}
+
+	igt_assert_eq(*(uint64_t *)addr, 254);
+
+	munmap((void *)batch_addr[0], BATCH_SIZE(gpu0->fd));
+	munmap((void *)batch_addr[1], BATCH_SIZE(gpu0->fd));
+	batch_fini(gpu0->fd, vm[0], batch_bo[0], batch_addr[0]);
+	batch_fini(gpu1->fd, vm[1], batch_bo[1], batch_addr[1]);
+	free(data);
+
+	xe_vm_unbind_lr_sync(gpu0->fd, vm[0], 0, 0, 1ull << gpu0->va_bits);
+	xe_exec_queue_destroy(gpu0->fd, exec_queue[0]);
+	xe_vm_destroy(gpu0->fd, vm[0]);
+
+	xe_vm_unbind_lr_sync(gpu1->fd, vm[1], 0, 0, 1ull << gpu1->va_bits);
+	xe_exec_queue_destroy(gpu1->fd, exec_queue[1]);
+	xe_vm_destroy(gpu1->fd, vm[1]);
+}
+
 static void
 gpu_atomic_inc(struct xe_svm_gpu_info *src_gpu,
 	       struct xe_svm_gpu_info *dst_gpu,
@@ -1275,6 +1432,18 @@ gpu_pagefault_test(struct xe_svm_gpu_info *src_gpu,
         pagefault_test_multigpu(src_gpu, dst_gpu, eci);
 }
 
+static void
+gpu_access_test(struct xe_svm_gpu_info *src_gpu,
+		struct xe_svm_gpu_info *dst_gpu,
+		struct drm_xe_engine_class_instance *eci,
+		bool no_prefetch)
+{
+	igt_assert(src_gpu);
+	igt_assert(dst_gpu);
+
+	multigpu_access_test(src_gpu, dst_gpu, eci, no_prefetch);
+}
+
 igt_main
 {
 	struct xe_svm_gpu_info gpus[MAX_XE_GPUS];
@@ -1330,6 +1499,11 @@ igt_main
 	igt_subtest("pagefault-multi-gpu")
 		gpu_pagefault_test(&gpus[0], &gpus[1], &eci);
 
+	igt_subtest("concurrent-access-multi-gpu") {
+		gpu_access_test(&gpus[0], &gpus[1], &eci, 0);
+		gpu_access_test(&gpus[0], &gpus[1], &eci, 1);
+	}
+
 	igt_fixture {
 		int cnt;
 
-- 
2.48.1

