Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E78CD13D2
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 16:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B1510E60B;
	Tue, 11 Nov 2025 16:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FdA/VlPi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9718D10E037
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 16:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762878899; x=1794414899;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=rFGhsLDmsH4Gll1NPnH7e8z1MhcGa9Sgj67m8O2W3Xo=;
 b=FdA/VlPiYf99pAluDkBrNlZMsSy6b94X3GQEXAYzQYj90o/A5uPensnW
 RnFbqMi4zY5J2rbQn0SZxIeV4nbwwjDnc1xcjPB3Cvfg6D6CCtdQlfQg0
 o8C6ksUW5/9pQFZc1FOkwIz+0OwT6yEya4B4Lif5J27T1ivZoTNE6BYm2
 KHcr4Gig9vqqHthl3oz/vxcrasLLKK/dfkC8HPZYPqlRDaDTdFMV5Ezr2
 oLVXz2BTpOzZJCBTAQ2CaC6cgmj3mCvHTDj3iAwNIQQwdOPOGDjDb+qP1
 pDGl9Sm1+s4D6JWn47zagqGDPOkCIqAqmky8yDNNlMF6nyhUOyvmnF7r7 w==;
X-CSE-ConnectionGUID: Th53ZPbsTzey5fd9Cf92Ow==
X-CSE-MsgGUID: gBHBsz5kRcWHBdJk5t2C2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="68583959"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="68583959"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 08:34:58 -0800
X-CSE-ConnectionGUID: SlTaJ1sDRkSSIsnuEfO/mQ==
X-CSE-MsgGUID: uOfHJQiGRd6rP5oji41h4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="189734283"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.39])
 by fmviesa010.fm.intel.com with ESMTP; 11 Nov 2025 08:34:57 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v5 5/8] tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU
 fault handling test
Date: Tue, 11 Nov 2025 16:34:53 +0000
Message-ID: <20251111163456.496063-6-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251111163456.496063-1-nishit.sharma@intel.com>
References: <20251111163456.496063-1-nishit.sharma@intel.com>
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

This test intentionally triggers page faults by accessing regions without
prefetch for both GPUs in a multi-GPU environment.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_multi_gpusvm.c | 128 +++++++++++++++++++++++++++++++++-
 1 file changed, 127 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index ea53bab3b..003d1c87b 100644
--- a/tests/intel/xe_multi_gpusvm.c
+++ b/tests/intel/xe_multi_gpusvm.c
@@ -15,6 +15,7 @@
 
 #include "time.h"
 
+#include "xe/xe_gt.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
@@ -48,6 +49,11 @@
  * Description:
  * 	This test measures and compares latency and bandwidth for buffer access
  * 	from CPU, local GPU, and remote GPU
+ *
+ * SUBTEST: pagefault-multi-gpu
+ * Description:
+ * 	This test intentionally triggers page faults by accessing unmapped SVM
+ * 	regions from both GPUs
  */
 
 #define MAX_XE_REGIONS	8
@@ -115,6 +121,11 @@ static void gpu_latency_test_wrapper(struct xe_svm_gpu_info *src,
 				     struct drm_xe_engine_class_instance *eci,
 				     void *extra_args);
 
+static void gpu_fault_test_wrapper(struct xe_svm_gpu_info *src,
+				   struct xe_svm_gpu_info *dst,
+				   struct drm_xe_engine_class_instance *eci,
+				   void *extra_args);
+
 static void for_each_gpu_pair(int num_gpus, struct xe_svm_gpu_info *gpus,
 			      struct drm_xe_engine_class_instance *eci,
 			      gpu_pair_fn fn, void *extra_args)
@@ -123,7 +134,6 @@ static void for_each_gpu_pair(int num_gpus, struct xe_svm_gpu_info *gpus,
 		for (int dst = 0; dst < num_gpus; dst++) {
 			if (src == dst)
 				continue;
-			igt_info("src :%d dst :%d\n", src, dst);
 			fn(&gpus[src], &gpus[dst], eci, extra_args);
 		}
 	}
@@ -724,6 +734,101 @@ latency_test_multigpu(struct xe_svm_gpu_info *gpu0,
         xe_vm_destroy(gpu1->fd, vm[1]);
 }
 
+static void
+pagefault_test_multigpu(struct xe_svm_gpu_info *gpu0,
+			struct xe_svm_gpu_info *gpu1,
+			struct drm_xe_engine_class_instance *eci,
+			bool prefetch_req)
+{
+        uint64_t addr;
+        uint32_t vm[2];
+        uint32_t exec_queue[2];
+        uint32_t batch_bo;
+        uint64_t batch_addr;
+        struct drm_xe_sync sync = {};
+        volatile uint64_t *sync_addr;
+        int value = 60, pf_count_1, pf_count_2;
+        void *data;
+	const char *pf_count_stat = "svm_pagefault_count";
+
+        vm[0] = xe_vm_create(gpu0->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+        exec_queue[0] = xe_exec_queue_create(gpu0->fd, vm[0], eci, 0);
+        xe_vm_bind_lr_sync(gpu0->fd, vm[0], 0, 0, 0, 1ull <<  gpu0->va_bits, DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+
+        vm[1] = xe_vm_create(gpu1->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+        exec_queue[1] = xe_exec_queue_create(gpu1->fd, vm[1], eci, 0);
+        xe_vm_bind_lr_sync(gpu1->fd, vm[1], 0, 0, 0, 1ull <<  gpu1->va_bits, DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+
+        data = aligned_alloc(SZ_2M, SZ_4K);
+        igt_assert(data);
+        addr = to_user_pointer(data);
+
+	pf_count_1 = xe_gt_stats_get_count(gpu0->fd, eci->gt_id, pf_count_stat);
+
+	/* checking pagefault count on GPU */
+        store_dword_batch_init(gpu0->fd, vm[0], addr, &batch_bo, &batch_addr, value);
+
+	if (prefetch_req) {
+		xe_vm_madvise(gpu0->fd, vm[0], addr, SZ_4K, 0,
+			      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			      gpu0->fd, 0, gpu0->vram_regions[0]);
+	}
+
+        sync_addr = malloc(sizeof(*sync_addr));
+        igt_assert(!!sync_addr);
+        sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+        sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = BIND_SYNC_VAL;
+        *sync_addr = 0;
+
+	if (prefetch_req) {
+		xe_vm_prefetch_async(gpu0->fd, vm[0], 0, 0, addr, SZ_4K, &sync, 1,
+				     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+
+		if (*sync_addr != BIND_SYNC_VAL)
+			xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, exec_queue[0],
+				       NSEC_PER_SEC * 10);
+	}
+	free((void *)sync_addr);
+
+        sync_addr = (void *)((char *)batch_addr + SZ_4K);
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = EXEC_SYNC_VAL;
+        *sync_addr = 0;
+
+	/* Execute STORE command on GPU */
+        xe_exec_sync(gpu0->fd, exec_queue[0], batch_addr, &sync, 1);
+        if (*sync_addr != EXEC_SYNC_VAL)
+                xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[0],
+			       NSEC_PER_SEC * 10);
+
+	pf_count_2 = xe_gt_stats_get_count(gpu0->fd, eci->gt_id, pf_count_stat);
+
+	if (pf_count_2 != pf_count_1) {
+		igt_warn("GPU pf: pf_count_2(%d) != pf_count_1(%d) prefetch_req :%d\n",
+			 pf_count_2, pf_count_1, prefetch_req);
+	}
+
+        igt_assert_eq(*(uint64_t *)addr, value);
+
+        /* CPU writes 11, memset set bytes no integer hence memset fills 4 bytes with 0x0B */
+        memset((void *)(uintptr_t)addr, 11, sizeof(int));
+        igt_assert_eq(*(uint64_t *)addr, 0x0B0B0B0B);
+
+        munmap((void *)batch_addr, BATCH_SIZE(gpu0->fd));
+        batch_fini(gpu0->fd, vm[0], batch_bo, batch_addr);
+        free(data);
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
@@ -889,6 +994,19 @@ gpu_latency_test_wrapper(struct xe_svm_gpu_info *src,
 	latency_test_multigpu(src, dst, eci, args->op_mod, args->prefetch_req);
 }
 
+static void
+gpu_fault_test_wrapper(struct xe_svm_gpu_info *src,
+		       struct xe_svm_gpu_info *dst,
+		       struct drm_xe_engine_class_instance *eci,
+		       void *extra_args)
+{
+	struct multigpu_ops_args *args = (struct multigpu_ops_args *)extra_args;
+	igt_assert(src);
+	igt_assert(dst);
+
+        pagefault_test_multigpu(src, dst, eci, args->prefetch_req);
+}
+
 igt_main
 {
 	struct xe_svm_gpu_info gpus[MAX_XE_GPUS];
@@ -951,6 +1069,14 @@ igt_main
 		for_each_gpu_pair(gpu_cnt, gpus, &eci, gpu_latency_test_wrapper, &latency_args);
 	}
 
+	igt_subtest("pagefault-multi-gpu") {
+		struct multigpu_ops_args fault_args;
+		fault_args.prefetch_req = 1;
+		for_each_gpu_pair(gpu_cnt, gpus, &eci, gpu_fault_test_wrapper, &fault_args);
+		fault_args.prefetch_req = 0;
+		for_each_gpu_pair(gpu_cnt, gpus, &eci, gpu_fault_test_wrapper, &fault_args);
+	}
+
 	igt_fixture {
 		int cnt;
 
-- 
2.48.1

