Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA70CCFA1A
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 16:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B333710E612;
	Tue, 11 Nov 2025 16:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+c0zo8h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BE510E60B
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 16:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762878899; x=1794414899;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ut1hgLvAmOQKcoyuYPy4tfEq15hROh7dx79XX0Y7i0Y=;
 b=T+c0zo8hS1XHCk83SG2Of7rtai9dovobpPa1YAw6eL2VKnHloMaJVF2k
 hc+mhrO3rgf0R/4PEKKGmxjJR2n7RqyTL0mJARUC2g98JuTZZ2KWkoKkr
 syDAg4NzyCJ80t5f4kKCG+ng3taR7yUe6MWTEzozwhMcPfMQsgwySGpD/
 nUeHPfJosa8T9l/Vk0A2UgQsbSBbkqan5/4e9O0SYYK6w25trkirH8dYP
 narKtd8tzpt20kDiVy1QC87X/oZMD6NsN4l09yWO82bhcOEDXZNM2pimh
 oJnE+LxSPEJOw/t5ylnby9XGSN7c2ljfj20hzFTgkU2lXP1sYuW6AvhyP A==;
X-CSE-ConnectionGUID: dH0yadkMTkeRois52VpnxQ==
X-CSE-MsgGUID: C/kENtzhQ2q8qeqxTJNptg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="68583958"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="68583958"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 08:34:58 -0800
X-CSE-ConnectionGUID: z/PjtilCTSyVGkinbqIkKA==
X-CSE-MsgGUID: DhS67DiJSryQEuiPSTmq9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="189734280"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.39])
 by fmviesa010.fm.intel.com with ESMTP; 11 Nov 2025 08:34:57 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v5 4/8] tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU
 performance test
Date: Tue, 11 Nov 2025 16:34:52 +0000
Message-ID: <20251111163456.496063-5-nishit.sharma@intel.com>
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

This test measures latency and bandwidth for buffer access from each GPU
and the CPU in a multi-GPU SVM environment. It compares performance for
local versus remote access using madvise and prefetch to control buffer
placement

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_multi_gpusvm.c | 221 ++++++++++++++++++++++++++++++++++
 1 file changed, 221 insertions(+)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index 468b50374..ea53bab3b 100644
--- a/tests/intel/xe_multi_gpusvm.c
+++ b/tests/intel/xe_multi_gpusvm.c
@@ -13,6 +13,8 @@
 #include "intel_mocs.h"
 #include "intel_reg.h"
 
+#include "time.h"
+
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
@@ -41,6 +43,11 @@
  * Description:
  * 	This test checks coherency in multi-gpu by writing from GPU0
  * 	reading from GPU1 and verify and repeating with CPU and both GPUs
+ *
+ * SUBTEST: latency-multi-gpu
+ * Description:
+ * 	This test measures and compares latency and bandwidth for buffer access
+ * 	from CPU, local GPU, and remote GPU
  */
 
 #define MAX_XE_REGIONS	8
@@ -103,6 +110,11 @@ static void gpu_coherecy_test_wrapper(struct xe_svm_gpu_info *src,
 				      struct drm_xe_engine_class_instance *eci,
 				      void *extra_args);
 
+static void gpu_latency_test_wrapper(struct xe_svm_gpu_info *src,
+				     struct xe_svm_gpu_info *dst,
+				     struct drm_xe_engine_class_instance *eci,
+				     void *extra_args);
+
 static void for_each_gpu_pair(int num_gpus, struct xe_svm_gpu_info *gpus,
 			      struct drm_xe_engine_class_instance *eci,
 			      gpu_pair_fn fn, void *extra_args)
@@ -119,6 +131,11 @@ static void for_each_gpu_pair(int num_gpus, struct xe_svm_gpu_info *gpus,
 
 static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
 
+static double time_diff(struct timespec *start, struct timespec *end)
+{
+    return (end->tv_sec - start->tv_sec) + (end->tv_nsec - start->tv_nsec) / 1e9;
+}
+
 static void
 atomic_batch_init(int fd, uint32_t vm, uint64_t src_addr,
 		  uint32_t *bo, uint64_t *addr)
@@ -526,6 +543,187 @@ coherency_test_multigpu(struct xe_svm_gpu_info *gpu0,
         xe_vm_destroy(gpu1->fd, vm[1]);
 }
 
+static void
+latency_test_multigpu(struct xe_svm_gpu_info *gpu0,
+		      struct xe_svm_gpu_info *gpu1,
+		      struct drm_xe_engine_class_instance *eci,
+		      bool remote_copy,
+		      bool prefetch_req)
+{
+        uint64_t addr;
+        uint32_t vm[2];
+        uint32_t exec_queue[2];
+        uint32_t batch_bo;
+        uint8_t *copy_dst;
+        uint64_t batch_addr;
+        struct drm_xe_sync sync = {};
+        volatile uint64_t *sync_addr;
+        int value = 60;
+        int shared_val[4];
+        struct test_exec_data *data;
+	struct timespec t_start, t_end;
+	double cpu_latency, gpu1_latency, gpu2_latency;
+	double cpu_bw, gpu1_bw, gpu2_bw;
+
+
+        vm[0] = xe_vm_create(gpu0->fd,
+			     DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+        exec_queue[0] = xe_exec_queue_create(gpu0->fd, vm[0], eci, 0);
+        xe_vm_bind_lr_sync(gpu0->fd, vm[0], 0, 0, 0, 1ull <<  gpu0->va_bits,
+			   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+
+        vm[1] = xe_vm_create(gpu1->fd,
+			     DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+        exec_queue[1] = xe_exec_queue_create(gpu1->fd, vm[1], eci, 0);
+        xe_vm_bind_lr_sync(gpu1->fd, vm[1], 0, 0, 0, 1ull <<  gpu1->va_bits,
+			   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+
+        data = aligned_alloc(SZ_2M, SZ_4K);
+        igt_assert(data);
+        data[0].vm_sync = 0;
+        addr = to_user_pointer(data);
+
+        copy_dst = aligned_alloc(SZ_2M, SZ_4K);
+        igt_assert(copy_dst);
+
+        store_dword_batch_init(gpu0->fd, vm[0], addr, &batch_bo, &batch_addr, value);
+
+	/* Measure GPU0 access latency/bandwidth */
+	clock_gettime(CLOCK_MONOTONIC, &t_start);
+
+        /* GPU0 access */
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
+	if (prefetch_req) {
+		xe_vm_prefetch_async(gpu0->fd, vm[0], 0, 0, addr, SZ_4K, &sync, 1,
+				     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+		if (*sync_addr != BIND_SYNC_VAL)
+			xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, exec_queue[0],
+				       NSEC_PER_SEC * 10);
+	}
+        free((void *)sync_addr);
+
+	clock_gettime(CLOCK_MONOTONIC, &t_end);
+	gpu1_latency = time_diff(&t_start, &t_end);
+	gpu1_bw = COPY_SIZE / gpu1_latency / (1024 * 1024); // MB/s
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
+	memcpy(shared_val, (void *)addr, 4);
+	igt_assert_eq(shared_val[0], value);
+
+        /* CPU writes 10, memset set bytes no integer hence memset fills 4 bytes with 0x0A */
+        memset((void *)(uintptr_t)addr, 10, sizeof(int));
+        memcpy(shared_val, (void *)(uintptr_t)addr, sizeof(shared_val));
+        igt_assert_eq(shared_val[0], 0x0A0A0A0A);
+
+	*(uint64_t *)addr = 50;
+
+	if(remote_copy) {
+		igt_info("creating batch for COPY_CMD on GPU1\n");
+		batch_init(gpu1->fd, vm[1], addr, to_user_pointer(copy_dst),
+			   SZ_4K, &batch_bo, &batch_addr);
+	} else {
+		igt_info("creating batch for STORE_CMD on GPU1\n");
+		store_dword_batch_init(gpu1->fd, vm[1], addr, &batch_bo, &batch_addr, value + 10);
+	}
+
+	/* Measure GPU1 access latency/bandwidth */
+	clock_gettime(CLOCK_MONOTONIC, &t_start);
+
+        /* GPU1 access */
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
+	clock_gettime(CLOCK_MONOTONIC, &t_end);
+	gpu2_latency = time_diff(&t_start, &t_end);
+	gpu2_bw = COPY_SIZE / gpu2_latency / (1024 * 1024); // MB/s
+
+        sync_addr = (void *)((char *)batch_addr + SZ_4K);
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = EXEC_SYNC_VAL;
+        *sync_addr = 0;
+
+        /* Execute COPY/STORE command on GPU1 */
+        xe_exec_sync(gpu1->fd, exec_queue[1], batch_addr, &sync, 1);
+        if (*sync_addr != EXEC_SYNC_VAL)
+                xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[1],
+			       NSEC_PER_SEC * 10);
+
+	if (!remote_copy)
+		igt_assert_eq(*(uint64_t *)addr, value + 10);
+	else
+		igt_assert_eq(*(uint64_t *)copy_dst, 50);
+
+        /* CPU writes 11, memset set bytes no integer hence memset fills 4 bytes with 0x0B */
+	/* Measure CPU access latency/bandwidth */
+	clock_gettime(CLOCK_MONOTONIC, &t_start);
+        memset((void *)(uintptr_t)addr, 11, sizeof(int));
+        memcpy(shared_val, (void *)(uintptr_t)addr, sizeof(shared_val));
+	clock_gettime(CLOCK_MONOTONIC, &t_end);
+	cpu_latency = time_diff(&t_start, &t_end);
+	cpu_bw = COPY_SIZE / cpu_latency / (1024 * 1024); // MB/s
+
+        igt_assert_eq(shared_val[0], 0x0B0B0B0B);
+
+	/* Print results */
+	igt_info("CPU: Latency %.6f s, Bandwidth %.2f MB/s\n", cpu_latency, cpu_bw);
+	igt_info("GPU: Latency %.6f s, Bandwidth %.2f MB/s\n", gpu1_latency, gpu1_bw);
+	igt_info("GPU: Latency %.6f s, Bandwidth %.2f MB/s\n", gpu2_latency, gpu2_bw);
+
+        munmap((void *)batch_addr, BATCH_SIZE(gpu0->fd));
+        batch_fini(gpu0->fd, vm[0], batch_bo, batch_addr);
+        batch_fini(gpu1->fd, vm[1], batch_bo, batch_addr);
+        free(data);
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
 atomic_inc_op(struct xe_svm_gpu_info *gpu0,
 	      struct xe_svm_gpu_info *gpu1,
@@ -678,6 +876,19 @@ gpu_coherecy_test_wrapper(struct xe_svm_gpu_info *src,
 	coherency_test_multigpu(src, dst, eci, args->op_mod, args->prefetch_req);
 }
 
+static void
+gpu_latency_test_wrapper(struct xe_svm_gpu_info *src,
+			 struct xe_svm_gpu_info *dst,
+			 struct drm_xe_engine_class_instance *eci,
+			 void *extra_args)
+{
+	struct multigpu_ops_args *args = (struct multigpu_ops_args *)extra_args;
+	igt_assert(src);
+	igt_assert(dst);
+
+	latency_test_multigpu(src, dst, eci, args->op_mod, args->prefetch_req);
+}
+
 igt_main
 {
 	struct xe_svm_gpu_info gpus[MAX_XE_GPUS];
@@ -730,6 +941,16 @@ igt_main
 		for_each_gpu_pair(gpu_cnt, gpus, &eci, gpu_coherecy_test_wrapper, &coh_args);
 	}
 
+	igt_subtest("latency-multi-gpu") {
+		struct multigpu_ops_args latency_args;
+		latency_args.prefetch_req = 1;
+		latency_args.op_mod = 1;
+		for_each_gpu_pair(gpu_cnt, gpus, &eci, gpu_latency_test_wrapper, &latency_args);
+		latency_args.prefetch_req = 0;
+		latency_args.op_mod = 0;
+		for_each_gpu_pair(gpu_cnt, gpus, &eci, gpu_latency_test_wrapper, &latency_args);
+	}
+
 	igt_fixture {
 		int cnt;
 
-- 
2.48.1

