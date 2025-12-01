Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B698DD116F9
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 09:02:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D77410E345;
	Mon,  1 Dec 2025 09:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="njFPbVz7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB01D10E341
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 09:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764579722; x=1796115722;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4rd06otD74shs9U8Mjn9CvwkyHqUEcceHDHf3m/Q2QU=;
 b=njFPbVz7BqXlJy/1iHuJa93DTX3m+Ya1dxeSzKG+e7h5Y74EuX0TX7ld
 sm3Uv6VtsjcJNmCTQHc2gQUsJdm1DzB7q/gAhCPvG887YPCXM88lxnmJW
 6dXbJSUM1m/7O1V19Rjel13uGZ7taYrIfKUSxqVjFKF4D6ldAlXVKuXoj
 fIbORUvABxuh8XPmHrjy0G+/9QV0xSJZ5Sxgl9Y48PaH4xIrbsLy0cgNo
 uisQUVtOLuIQ5vJR4CH0t/XAWsH6ECmERKyG9eUCY4hybC/UFLfBqhDNV
 qyNRA9b7LzSvOqvdiD7eYeLofrnEjrfgWoWnbmooHAUZ4G9729QygP7Jf w==;
X-CSE-ConnectionGUID: xqMP2gWXRVSLYMegQ4VtZw==
X-CSE-MsgGUID: RIKSj9TISwanx/IxjixK4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77199399"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="77199399"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:02:02 -0800
X-CSE-ConnectionGUID: 3xNZSLGfR+WuU0puPGkb8Q==
X-CSE-MsgGUID: gysc8dVcT8mZU18w+xvGnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="198501546"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..)
 ([10.1.40.114])
 by orviesa004.jf.intel.com with ESMTP; 01 Dec 2025 01:02:03 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 thomas.hellstrom@intel.com, pravalika.gurram@intel.com
Subject: [PATCH i-g-t v9 09/10] tests/intel/xe_multi_gpusvm: Add SVM multi-GPU
 conflicting madvise test
Date: Mon,  1 Dec 2025 09:02:00 +0000
Message-ID: <20251201090201.326595-10-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251201090201.326595-1-nishit.sharma@intel.com>
References: <20251121162537.77551-1-nishit.sharma@intel.com>
 <20251201090201.326595-1-nishit.sharma@intel.com>
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
 tests/intel/xe_multi_gpusvm.c | 143 ++++++++++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index bdbaa7a16..688ee0757 100644
--- a/tests/intel/xe_multi_gpusvm.c
+++ b/tests/intel/xe_multi_gpusvm.c
@@ -110,6 +110,23 @@
  *	Test concurrent atomic memory operations with prefetch where
  *	multiple GPUs simultaneously access shared memory to validate
  *	coherency with memory migration and local VRAM access
+ *
+ * SUBTEST: mgpu-atomic-op-conflict
+ * Description:
+ *	Multi-GPU atomic operation with conflicting madvise regions
+ *
+ * SUBTEST: mgpu-coherency-conflict
+ * Description:
+ *	Multi-GPU coherency test with conflicting madvise regions
+ *
+ * SUBTEST: mgpu-concurrent-access-conflict
+ * Description:
+ *	Multi-GPU concurrent access with conflicting madvise regions
+ *
+ * SUBTEST: mgpu-pagefault-conflict
+ * Description:
+ *	Multi-GPU page fault test with conflicting madvise regions
+ *
  */
 
 #define MAX_XE_REGIONS	8
@@ -123,6 +140,9 @@
 #define BATCH_VALUE	60
 #define NUM_ITER	200
 
+#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
+#define FIVE_SEC                (5LL * NSEC_PER_SEC)
+
 #define MULTIGPU_PREFETCH		BIT(1)
 #define MULTIGPU_XGPU_ACCESS		BIT(2)
 #define MULTIGPU_ATOMIC_OP		BIT(3)
@@ -132,6 +152,7 @@
 #define MULTIGPU_PERF_REM_COPY		BIT(7)
 #define MULTIGPU_PFAULT_OP		BIT(8)
 #define MULTIGPU_CONC_ACCESS		BIT(9)
+#define MULTIGPU_CONFLICT		BIT(10)
 
 #define INIT	2
 #define STORE	3
@@ -199,6 +220,12 @@ static void gpu_simult_test_wrapper(struct xe_svm_gpu_info *src,
 				    struct drm_xe_engine_class_instance *eci,
 				    unsigned int flags);
 
+static void
+conflicting_madvise(struct xe_svm_gpu_info *gpu1,
+		    struct xe_svm_gpu_info *gpu2,
+		    struct drm_xe_engine_class_instance *eci,
+		    unsigned int flags);
+
 static void
 create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct drm_xe_engine_class_instance *eci,
 		    uint32_t *vm, uint32_t *exec_queue)
@@ -616,6 +643,11 @@ atomic_inc_op(struct xe_svm_gpu_info *gpu1,
 	if (mgpu_check_fault_support(gpu1, gpu2))
 		return;
 
+	if (flags & MULTIGPU_CONFLICT) {
+		conflicting_madvise(gpu1, gpu2, eci, flags);
+		return;
+	}
+
 	create_vm_and_queue(gpu1, eci, &vm[0], &exec_queue[0]);
 	create_vm_and_queue(gpu2, eci, &vm[1], &exec_queue[1]);
 
@@ -697,6 +729,11 @@ coherency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 	if (mgpu_check_fault_support(gpu1, gpu2))
 		return;
 
+	if (flags & MULTIGPU_CONFLICT) {
+		conflicting_madvise(gpu1, gpu2, eci, flags);
+		return;
+	}
+
 	create_vm_and_queue(gpu1, eci, &vm[0], &exec_queue[0]);
 	create_vm_and_queue(gpu2, eci, &vm[1], &exec_queue[1]);
 
@@ -985,6 +1022,11 @@ pagefault_test_multigpu(struct xe_svm_gpu_info *gpu1,
 	if (mgpu_check_fault_support(gpu1, gpu2))
 		return;
 
+	if (flags & MULTIGPU_CONFLICT) {
+		conflicting_madvise(gpu1, gpu2, eci, flags);
+		return;
+	}
+
 	create_vm_and_queue(gpu1, eci, &vm[0], &exec_queue[0]);
 	create_vm_and_queue(gpu2, eci, &vm[1], &exec_queue[1]);
 
@@ -1101,6 +1143,11 @@ multigpu_access_test(struct xe_svm_gpu_info *gpu1,
 	if (mgpu_check_fault_support(gpu1, gpu2))
 		return;
 
+	if (flags & MULTIGPU_CONFLICT) {
+		conflicting_madvise(gpu1, gpu2, eci, flags);
+		return;
+	}
+
 	create_vm_and_queue(gpu1, eci, &vm[0], &exec_queue[0]);
 	create_vm_and_queue(gpu2, eci, &vm[1], &exec_queue[1]);
 
@@ -1235,6 +1282,98 @@ multigpu_access_test(struct xe_svm_gpu_info *gpu1,
 	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]);
 }
 
+static void
+conflicting_madvise(struct xe_svm_gpu_info *gpu1,
+		    struct xe_svm_gpu_info *gpu2,
+		    struct drm_xe_engine_class_instance *eci,
+		    unsigned int flags)
+{
+	uint64_t addr;
+	uint32_t vm[2];
+	uint32_t exec_queue[2];
+	uint32_t batch_bo[2];
+	void *data;
+	uint64_t batch_addr[2];
+	struct drm_xe_sync sync[2] = {};
+	uint64_t *sync_addr[2];
+
+	/* Skip if either GPU doesn't support faults */
+	if (!gpu1->supports_faults || !gpu2->supports_faults) {
+		igt_debug("Both GPUs must support page faults for this test\n");
+		return;
+	}
+
+	create_vm_and_queue(gpu1, eci, &vm[0], &exec_queue[0]);
+	create_vm_and_queue(gpu2, eci, &vm[1], &exec_queue[1]);
+
+	data = aligned_alloc(SZ_2M, SZ_4K);
+	igt_assert(data);
+	addr = to_user_pointer(data);
+
+	store_dword_batch_init(gpu1->fd, vm[0], addr, &batch_bo[0], &batch_addr[0], 10);
+	store_dword_batch_init(gpu2->fd, vm[1], addr, &batch_bo[1], &batch_addr[1], 20);
+
+	xe_multigpu_madvise(gpu1->fd, vm[0], addr, SZ_4K,
+			    0, DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0, 0, exec_queue[0]);
+
+	igt_info("Testing GPU1 VM trying to prefer GPU2's VRAM (should fail)\n");
+
+	/* This SHOULD fail - GPU1's VM cannot prefer GPU2's VRAM */
+	xe_multigpu_madvise(gpu1->fd, vm[0], addr, SZ_4K,
+			    0, DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu2->fd, 0, gpu2->vram_regions[0], exec_queue[0]);
+
+	/* This SHOULD also fail - GPU2's VM cannot prefer GPU1's VRAM */
+	xe_multigpu_madvise(gpu2->fd, vm[1], addr, SZ_4K,
+			    0, DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu1->fd, 0, gpu1->vram_regions[0], exec_queue[0]);
+
+	setup_sync(&sync[0], &sync_addr[0], BIND_SYNC_VAL);
+	setup_sync(&sync[1], &sync_addr[1], BIND_SYNC_VAL);
+
+	/* For simultaneous access need to call xe_wait_ufence for both gpus after prefetch */
+	xe_multigpu_prefetch(gpu1->fd, vm[0], addr, SZ_4K, &sync[0],
+			     sync_addr[0], exec_queue[0], flags);
+	free(sync_addr[0]);
+
+	xe_multigpu_prefetch(gpu2->fd, vm[1], addr, SZ_4K, &sync[1],
+			     sync_addr[1], exec_queue[1], flags);
+	free(sync_addr[1]);
+
+	for (int i = 0; i < NUM_ITER; i++) {
+		sync_addr[0] = (void *)((char *)batch_addr[0] + SZ_4K);
+		sync[0].addr = to_user_pointer((uint64_t *)sync_addr[0]);
+		sync[0].timeline_value = EXEC_SYNC_VAL;
+
+		sync_addr[1] = (void *)((char *)batch_addr[1] + SZ_4K);
+		sync[1].addr = to_user_pointer((uint64_t *)sync_addr[1]);
+		sync[1].timeline_value = EXEC_SYNC_VAL;
+		WRITE_ONCE(*sync_addr[0], 0);
+		WRITE_ONCE(*sync_addr[1], 0);
+
+		xe_exec_sync(gpu1->fd, exec_queue[0], batch_addr[0], &sync[0], 1);
+		if (READ_ONCE(*sync_addr[0]) != EXEC_SYNC_VAL)
+			xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr[0], EXEC_SYNC_VAL,
+				       exec_queue[0], NSEC_PER_SEC * 10);
+		xe_exec_sync(gpu2->fd, exec_queue[1], batch_addr[1], &sync[1], 1);
+		if (READ_ONCE(*sync_addr[1]) != EXEC_SYNC_VAL)
+			xe_wait_ufence(gpu2->fd, (uint64_t *)sync_addr[1], EXEC_SYNC_VAL,
+				       exec_queue[1], NSEC_PER_SEC * 10);
+	}
+
+	igt_assert_eq(READ_ONCE(*(uint64_t *)addr), 20);
+
+	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
+	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
+	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
+	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[1]);
+	free(data);
+
+	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);
+	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]);
+}
+
 static void
 gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
 		       struct xe_svm_gpu_info *dst,
@@ -1346,9 +1485,11 @@ igt_main
 		{ "xgpu-access-prefetch", MULTIGPU_PREFETCH | MULTIGPU_XGPU_ACCESS },
 		{ "atomic-op-basic", MULTIGPU_ATOMIC_OP },
 		{ "atomic-op-prefetch", MULTIGPU_PREFETCH | MULTIGPU_ATOMIC_OP },
+		{ "atomic-op-conflict", MULTIGPU_CONFLICT | MULTIGPU_ATOMIC_OP },
 		{ "coherency-basic", MULTIGPU_COH_OP },
 		{ "coherency-fail-basic", MULTIGPU_COH_OP | MULTIGPU_COH_FAIL },
 		{ "coherency-prefetch", MULTIGPU_PREFETCH | MULTIGPU_COH_OP },
+		{ "coherency-conflict", MULTIGPU_CONFLICT | MULTIGPU_COH_OP },
 		{ "coherency-fail-prefetch",
 		  MULTIGPU_PREFETCH | MULTIGPU_COH_OP | MULTIGPU_COH_FAIL},
 		{ "latency-basic", MULTIGPU_PERF_OP },
@@ -1359,8 +1500,10 @@ igt_main
 		  MULTIGPU_PREFETCH | MULTIGPU_PERF_OP | MULTIGPU_PERF_REM_COPY },
 		{ "pagefault-basic", MULTIGPU_PFAULT_OP },
 		{ "pagefault-prefetch", MULTIGPU_PREFETCH | MULTIGPU_PFAULT_OP },
+		{ "pagefault-conflict", MULTIGPU_CONFLICT | MULTIGPU_PFAULT_OP },
 		{ "concurrent-access-basic", MULTIGPU_CONC_ACCESS },
 		{ "concurrent-access-prefetch", MULTIGPU_PREFETCH | MULTIGPU_CONC_ACCESS },
+		{ "concurrent-access-conflict", MULTIGPU_CONFLICT | MULTIGPU_CONC_ACCESS },
 		{ NULL },
 	};
 
-- 
2.48.1

