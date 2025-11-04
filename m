Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33474CCF9E3
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 14:29:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AB710E614;
	Tue,  4 Nov 2025 14:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W4lwMBbM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9F910E26E
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 14:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762266595; x=1793802595;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=SXLBDXNJgM6q/WP9DhIRMS8W42xzZ9xIu1BtNB9EIbU=;
 b=W4lwMBbMr4BijKu0ykVBBfhETI1/fyMJXBkpEPmvs9rXbscv1O5n10y6
 wXXHCGz9scMOikSRKT/7ooaKBhBnAB+JNTmPbhhjo7EN1cwo+FFJR5Gdq
 O9pACnqMba3R/4p9BvscnzIndQ1liqlrqvqVRWz53j4huMpT3elv+pVrz
 +fSAu9JSRfF2Dj/WnEXE+jzzcs++TZ1qAsZV7IaX+dxFWTzP4yhNBg34N
 CrW/vha5idNXOM7Oew+gopsaLQ/OttH74bdJHeNHJnHxPMcteJvmX7rku
 tanse1vbwKQSO3horkSQ478Mzp/gCIfuS+F4i+Z3/D+8wP3udLhFPAExS w==;
X-CSE-ConnectionGUID: MhRt3zYBR9mAf3VpOTkPcg==
X-CSE-MsgGUID: WOoOdDZNTXCjI16XzuDeXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74966175"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="74966175"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 06:29:55 -0800
X-CSE-ConnectionGUID: FpDmYUVzTXS8yA5iv8pxFg==
X-CSE-MsgGUID: 45FAmy89R/ih5nR/wtOwPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="192339866"
Received: from dut2943pvc.iind.intel.com ([10.190.215.39])
 by orviesa005.jf.intel.com with ESMTP; 04 Nov 2025 06:29:53 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v1 3/7] tests/intel/xe_multi-gpusvm.c: Add SVM multi-GPU
 coherency test
Date: Tue,  4 Nov 2025 14:29:40 +0000
Message-ID: <20251104142947.51744-4-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104142947.51744-1-nishit.sharma@intel.com>
References: <20251104142947.51744-1-nishit.sharma@intel.com>
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

This test verifies memory coherency in a multi-GPU environment using SVM.
GPU 1 writes to a shared buffer, GPU 2 reads and checks for correct data
without explicit synchronization, and the test is repeated with CPU and
both GPUs to ensure consistent memory visibility across agents.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_multi_gpusvm.c | 222 +++++++++++++++++++++++++++++++++-
 1 file changed, 220 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index 71bf01ba8..2c64de209 100644
--- a/tests/intel/xe_multi_gpusvm.c
+++ b/tests/intel/xe_multi_gpusvm.c
@@ -34,8 +34,13 @@
  * SUBTEST: atomic-inc-gpu-op
  * Description:
  * 	This test does atomic operation in multi-gpu by executing atomic
- *	operation on GPU1 and then atomic operation on GPU2 using same
- *	adress
+ * 	operation on GPU1 and then atomic operation on GPU2 using same
+ * 	adress
+ *
+ * SUBTEST: coherency-multi-gpu
+ * Description:
+ * 	This test checks coherency in multi-gpu by writing from GPU0
+ * 	reading from GPU1 and verify and repeating with CPU and both GPUs
  */
 
 #define MAX_XE_REGIONS	8
@@ -94,6 +99,35 @@ atomic_batch_init(int fd, uint32_t vm, uint64_t src_addr,
 	*addr = batch_addr;
 }
 
+static void
+store_dword_batch_init(int fd, uint32_t vm, uint64_t src_addr,
+                       uint32_t *bo, uint64_t *addr, int value)
+{
+        uint32_t batch_bo_size = BATCH_SIZE(fd);
+        uint32_t batch_bo;
+        uint64_t batch_addr;
+        void *batch;
+        uint32_t *cmd;
+        int i = 0;
+
+        batch_bo = xe_bo_create(fd, vm, batch_bo_size, vram_if_possible(fd, 0), 0);
+        batch = xe_bo_map(fd, batch_bo, batch_bo_size);
+        cmd = (uint32_t *) batch;
+
+        cmd[i++] = MI_STORE_DWORD_IMM_GEN4;
+        cmd[i++] = src_addr;
+        cmd[i++] = src_addr >> 32;
+        cmd[i++] = value;
+        cmd[i++] = MI_BATCH_BUFFER_END;
+
+        batch_addr = to_user_pointer(batch);
+
+        /* Punch a gap in the SVM map where we map the batch_bo */
+        xe_vm_bind_lr_sync(fd, vm, batch_bo, 0, batch_addr, batch_bo_size, 0);
+        *bo = batch_bo;
+        *addr = batch_addr;
+}
+
 static void batch_init(int fd, uint32_t vm, uint64_t src_addr,
 		       uint64_t dst_addr, uint64_t copy_size,
 		       uint32_t *bo, uint64_t *addr)
@@ -265,6 +299,172 @@ gpu_mem_access(struct xe_svm_gpu_info *src_gpu,
 	copy_src_dst(src_gpu, dst_gpu, eci);
 }
 
+static void
+coherency_test_multigpu(struct xe_svm_gpu_info *gpu0,
+			struct xe_svm_gpu_info *gpu1,
+			struct drm_xe_engine_class_instance *eci,
+			bool coh_fail_set,
+			bool prefetch_req)
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
+        store_dword_batch_init(gpu0->fd, vm[0], addr, &batch_bo, &batch_addr, value);
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
+        sync_addr = (void *)((char *)batch_addr + SZ_4K);
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = EXEC_SYNC_VAL;
+        *sync_addr = 0;
+
+        /* Execute STORE command on GPU0 */
+        xe_exec_sync(gpu0->fd, exec_queue[0], batch_addr, &sync, 1);
+        if (*sync_addr != EXEC_SYNC_VAL)
+                xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[0],
+			       NSEC_PER_SEC * 10);
+
+        igt_assert_eq(*(uint64_t *)addr, value);
+
+	/* Creating batch for GPU1 using addr as Src which have value from GPU0 */
+	batch_init(gpu1->fd, vm[1], addr, to_user_pointer(copy_dst),
+			SZ_4K, &batch_bo, &batch_addr);
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
+        sync_addr = (void *)((char *)batch_addr + SZ_4K);
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = EXEC_SYNC_VAL;
+        *sync_addr = 0;
+
+        /* Execute COPY command on GPU1 */
+        xe_exec_sync(gpu1->fd, exec_queue[1], batch_addr, &sync, 1);
+        if (*sync_addr != EXEC_SYNC_VAL)
+                xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[1],
+			       NSEC_PER_SEC * 10);
+
+        igt_assert_eq(*(uint64_t *)copy_dst, value);
+
+        /* CPU writes 10, memset set bytes no integer hence memset fills 4 bytes with 0x0A */
+        memset((void *)(uintptr_t)addr, 10, sizeof(int));
+        igt_assert_eq(*(uint64_t *)addr, 0x0A0A0A0A);
+
+	/* Coherency fail scenario */
+        store_dword_batch_init(gpu0->fd, vm[0], addr, &batch1_bo[0], &batch1_addr[0], value + 10);
+        store_dword_batch_init(gpu1->fd, vm[1], addr, &batch1_bo[1], &batch1_addr[1], value + 20);
+
+	if (coh_fail_set) {
+		igt_info("coherency fail impl\n");
+
+		sync_addr = (void *)((char *)batch1_addr[0] + SZ_4K);
+		sync.addr = to_user_pointer((uint64_t *)sync_addr);
+		sync.timeline_value = EXEC_SYNC_VAL;
+		*sync_addr = 0;
+
+		/* Execute STORE command on GPU1 */
+		xe_exec_sync(gpu0->fd, exec_queue[0], batch1_addr[0], &sync, 1);
+		if (*sync_addr != EXEC_SYNC_VAL)
+			xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[0],
+					NSEC_PER_SEC * 10);
+
+		sync_addr = (void *)((char *)batch1_addr[1] + SZ_4K);
+		sync.addr = to_user_pointer((uint64_t *)sync_addr);
+		sync.timeline_value = EXEC_SYNC_VAL;
+		*sync_addr = 0;
+
+		/* Execute STORE command on GPU2 */
+		xe_exec_sync(gpu1->fd, exec_queue[1], batch1_addr[1], &sync, 1);
+		if (*sync_addr != EXEC_SYNC_VAL)
+			xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[1],
+					NSEC_PER_SEC * 10);
+
+		igt_assert_f(*(uint64_t *)addr == (value + 10),
+				"GPU2 has overwritten value at addr\n");
+	}
+
+        /* CPU writes 11, memset set bytes no integer hence memset fills 4 bytes with 0x0B */
+        memset((void *)(uintptr_t)addr, 11, sizeof(int));
+        igt_assert_eq(*(uint64_t *)addr, 0x0B0B0B0B);
+
+        munmap((void *)batch_addr, BATCH_SIZE(gpu0->fd));
+        batch_fini(gpu0->fd, vm[0], batch_bo, batch_addr);
+        free(data1);
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
 atomic_inc_op(struct xe_svm_gpu_info *gpu0,
 	      struct xe_svm_gpu_info *gpu1,
@@ -403,6 +603,19 @@ gpu_atomic_inc(struct xe_svm_gpu_info *src_gpu,
 	atomic_inc_op(src_gpu, dst_gpu, eci, prefetch_req);
 }
 
+static void
+gpu_coherecy_test(struct xe_svm_gpu_info *src_gpu,
+		  struct xe_svm_gpu_info *dst_gpu,
+		  struct drm_xe_engine_class_instance *eci,
+		  bool coh_fail,
+		  bool prefetch_req)
+{
+	igt_assert(src_gpu);
+	igt_assert(dst_gpu);
+
+        coherency_test_multigpu(src_gpu, dst_gpu, eci, coh_fail, prefetch_req);
+}
+
 igt_main
 {
 	struct xe_svm_gpu_info gpus[MAX_XE_GPUS];
@@ -442,6 +655,11 @@ igt_main
 		gpu_atomic_inc(&gpus[0], &gpus[1], &eci, 0);
 	}
 
+	igt_subtest("coherency-multi-gpu") {
+		gpu_coherecy_test(&gpus[0], &gpus[1], &eci, 0, 1);
+		gpu_coherecy_test(&gpus[0], &gpus[1], &eci, 1, 0);
+	}
+
 	igt_fixture {
 		int cnt;
 
-- 
2.48.1

