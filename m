Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53ABCD8CAC
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 17:05:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E01210E90F;
	Thu, 13 Nov 2025 17:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n+GOpbLB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A523F10E906
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 17:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763053498; x=1794589498;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=NPS7ZF/D9rlURik3N/T92IRbgqRIGPgikCjC5LhmJUk=;
 b=n+GOpbLB0rpHl9CEJb/zsKyChOJpn+4+h0NSrQGfS/9EfRse1HuAKbAR
 HqsohVLalubrfJpL39vwB5XdnNG3guzO5fbCviU1j2ilbhVWMBmz4Dxs6
 r/owEyHTxzcwSEWCCnxG75pNCm8yg/gM5ZZWdURVWp7d+9D6UxtftcLHI
 nxDSpD3cpayIpPC7CfE2PhmGfgyflDQt2pX74QEan0yhV7DJB6ZKYTesG
 EcgMEJ4IDK9gZ7QAEjW9TYZAuhTlQgI2Q2ejqD5kI4ClWNSDAcZZLHMm4
 dUl3a8cTy60dr3s56ieFqblXF3Xyc1/Ex9t1NJ+Hn0ehcn1hdUCy0HrrJ A==;
X-CSE-ConnectionGUID: fUYWBZKBRtiqBD9mmz4/hg==
X-CSE-MsgGUID: HrRuTDvYS+unnMsmRO+TVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76243688"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="76243688"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:04:57 -0800
X-CSE-ConnectionGUID: ZXJDOiLvT42BnVdWEQb1lg==
X-CSE-MsgGUID: qVn5qIZtQwGokUxOjcAnwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="193808121"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.39])
 by fmviesa005.fm.intel.com with ESMTP; 13 Nov 2025 09:04:56 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Subject: [PATCH i-g-t v7 06/10] tests/intel/xe_multi_gpusvm: Add SVM multi-GPU
 performance test
Date: Thu, 13 Nov 2025 17:04:53 +0000
Message-ID: <20251113170456.635343-7-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251113170456.635343-1-nishit.sharma@intel.com>
References: <20251113170456.635343-1-nishit.sharma@intel.com>
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
 tests/intel/xe_multi_gpusvm.c | 181 ++++++++++++++++++++++++++++++++++
 1 file changed, 181 insertions(+)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index 6792ef72c..2c8e62e34 100644
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
 static void
 create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct drm_xe_engine_class_instance *eci,
 		    uint32_t *vm, uint32_t *exec_queue)
@@ -197,6 +209,11 @@ static void for_each_gpu_pair(int num_gpus, struct xe_svm_gpu_info *gpus,
 
 static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
 
+static double time_diff(struct timespec *start, struct timespec *end)
+{
+    return (end->tv_sec - start->tv_sec) + (end->tv_nsec - start->tv_nsec) / 1e9;
+}
+
 static void
 atomic_batch_init(int fd, uint32_t vm, uint64_t src_addr,
 		  uint32_t *bo, uint64_t *addr)
@@ -549,6 +566,147 @@ coherency_test_multigpu(struct xe_svm_gpu_info *gpu0,
 	cleanup_vm_and_queue(gpu1, vm[1], exec_queue[1]);
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
+	create_vm_and_queue(gpu0, eci, &vm[0], &exec_queue[0]);
+	create_vm_and_queue(gpu1, eci, &vm[1], &exec_queue[1]);
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
+        /* GPU0(src_gpu) access */
+	xe_multigpu_madvise(gpu0->fd, vm[0], addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu0->fd, 0, gpu0->vram_regions[0], exec_queue[0],
+			    0, 0);
+
+	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
+	xe_multigpu_prefetch(gpu0->fd, vm[0], addr, SZ_4K, &sync,
+			     sync_addr, exec_queue[0], prefetch_req);
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
+        /* GPU1(dst_gpu) access */
+	xe_multigpu_madvise(gpu1->fd, vm[1], addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu1->fd, 0, gpu1->vram_regions[0], exec_queue[1],
+			    0, 0);
+
+	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
+	xe_multigpu_prefetch(gpu1->fd, vm[1], addr, SZ_4K, &sync,
+			     sync_addr, exec_queue[1], prefetch_req);
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
+	cleanup_vm_and_queue(gpu0, vm[0], exec_queue[0]);
+	cleanup_vm_and_queue(gpu1, vm[1], exec_queue[1]);
+}
+
 static void
 atomic_inc_op(struct xe_svm_gpu_info *gpu0,
 	      struct xe_svm_gpu_info *gpu1,
@@ -661,6 +819,19 @@ gpu_coherecy_test_wrapper(struct xe_svm_gpu_info *src,
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
@@ -718,6 +889,16 @@ igt_main
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

