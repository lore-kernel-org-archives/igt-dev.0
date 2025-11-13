Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750FBCD8C9D
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 16:50:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2122A10E8DA;
	Thu, 13 Nov 2025 16:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a8DJEU0N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42AB10E8D5
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 16:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763052605; x=1794588605;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=eAve/ix5zWXG03KUsyEcCRqMHGtaRWVZ8HFmxglZr3E=;
 b=a8DJEU0NIve4bUxkMbeX4Ujx+7Qq4RHyNtghQwsCOmDD18uMYzwvZgSc
 u+ZcMupbuQYfHhwHh0ubIAEnZB2guXuXnctiSFwPuXNGdyZgIq10zpoKE
 MwVH0NJlguaQCKh+RlYT44vOmeLH9j68FQMMpJOpuImCvlG6b9BLCUOp0
 BOzrtSpIf9LRK+qaEtQohATxqUh7AKIF+YZIhWKXOvyQwa7iHufefvHrv
 H3Uxm+kV3Qx00H6AohdfcgkVgFnK0scCnCpbSbYtaby6qOS5vF3Q35pSB
 GY79mI4KGTE3YWPloPyjatGwWQaGQWpQShKZ8MjgiTnoeQQRMtk14ggQu g==;
X-CSE-ConnectionGUID: NOL2WxurQvihTNP4DXPE8Q==
X-CSE-MsgGUID: D0lPyRsyS0KfH8ET+YEbtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65178601"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="65178601"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:50:04 -0800
X-CSE-ConnectionGUID: UTyxFNkLSVu6byMr3ovawg==
X-CSE-MsgGUID: E2Fdzzs9TVOlTqD1bNXMkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="193804347"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.39])
 by fmviesa005.fm.intel.com with ESMTP; 13 Nov 2025 08:50:03 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Subject: [PATCH i-g-t v7 07/10] tests/intel/xe_multi_gpusvm: Add SVM multi-GPU
 fault handling test
Date: Thu, 13 Nov 2025 16:50:01 +0000
Message-ID: <20251113165003.634708-8-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251113165003.634708-1-nishit.sharma@intel.com>
References: <20251113165003.634708-1-nishit.sharma@intel.com>
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
 tests/intel/xe_multi_gpusvm.c | 102 ++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index 2c8e62e34..6feb543ae 100644
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
 static void
 create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct drm_xe_engine_class_instance *eci,
 		    uint32_t *vm, uint32_t *exec_queue)
@@ -707,6 +718,76 @@ latency_test_multigpu(struct xe_svm_gpu_info *gpu0,
 	cleanup_vm_and_queue(gpu1, vm[1], exec_queue[1]);
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
+	create_vm_and_queue(gpu0, eci, &vm[0], &exec_queue[0]);
+	create_vm_and_queue(gpu1, eci, &vm[1], &exec_queue[1]);
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
+	xe_multigpu_madvise(gpu0->fd, vm[0], addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu0->fd, 0, gpu0->vram_regions[0], exec_queue[0],
+			    0, 0);
+
+	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
+	xe_multigpu_prefetch(gpu0->fd, vm[0], addr, SZ_4K, &sync,
+			     sync_addr, exec_queue[0], prefetch_req);
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
+	cleanup_vm_and_queue(gpu0, vm[0], exec_queue[0]);
+	cleanup_vm_and_queue(gpu1, vm[1], exec_queue[1]);
+}
+
 static void
 atomic_inc_op(struct xe_svm_gpu_info *gpu0,
 	      struct xe_svm_gpu_info *gpu1,
@@ -832,6 +913,19 @@ gpu_latency_test_wrapper(struct xe_svm_gpu_info *src,
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
@@ -899,6 +993,14 @@ igt_main
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

