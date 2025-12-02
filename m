Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A561CFD2F6
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 15:59:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB75B10E677;
	Tue,  2 Dec 2025 15:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cuQg2bgq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FBF310E677
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 15:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764691193; x=1796227193;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=gUTpEKULrMKXO83lOKZbA5TrQtrhvoC3rPwOtdrJqu4=;
 b=cuQg2bgqE4T7rg1Y6ZfezowucGkFnjY0CtxW+AITUMZlhvTTpqhe/2eO
 vDPnkOPKqybP+LEu1asN+/oynlZXyxUezTSQ2UugWCaFhd7xiNOT2hSyi
 hRjg/VR5UyaR//oFmm4rClgEp002NcHmOH3MZ7gBz/rETLwutHEMVEcgU
 FZM0IfnVkvuixKH2jHiXCTkk+7+5/FnNR2laEhiX/8Zgvapc5Wx2K1CbB
 lQenwkr5qw+ASKeEvmmYwJetFHO+pShTZv9BNI/71ZKMH2Z9QyCX7cpEi
 JIJVClOiqHXHV1eiPbJpdgRA6cRV7wvc4k/GSQM0+ohsVr556r+qe2x0v A==;
X-CSE-ConnectionGUID: IipKEpDrS+CSqxZeWQ0NnA==
X-CSE-MsgGUID: YQjuIIyHRiuLDPAgR++zHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="84059538"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="84059538"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 07:59:52 -0800
X-CSE-ConnectionGUID: BJgBf1G3RSm7KMCK140FoQ==
X-CSE-MsgGUID: 2Ll5SUnWTV+dy8YwSbvLCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="198600784"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.43])
 by orviesa003.jf.intel.com with ESMTP; 02 Dec 2025 07:59:52 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Subject: [PATCH v10 06/10] tests/intel/xe_multigpu_svm: Add SVM multi-GPU
 performance test
Date: Tue,  2 Dec 2025 15:59:47 +0000
Message-ID: <20251202155951.21369-7-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251202155951.21369-1-nishit.sharma@intel.com>
References: <20251202155951.21369-1-nishit.sharma@intel.com>
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
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel/xe_multigpu_svm.c | 249 +++++++++++++++++++++++++++++++++-
 1 file changed, 248 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_multigpu_svm.c b/tests/intel/xe_multigpu_svm.c
index b4125a5f8..60c33b64e 100644
--- a/tests/intel/xe_multigpu_svm.c
+++ b/tests/intel/xe_multigpu_svm.c
@@ -13,6 +13,8 @@
 #include "intel_mocs.h"
 #include "intel_reg.h"
 
+#include "time.h"
+
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
@@ -67,6 +69,26 @@
  *	Test concurrent write race conditions with prefetch to verify coherency
  *	behavior and memory migration when multiple GPUs compete for same location
  *
+ * SUBTEST: mgpu-latency-basic
+ * Description:
+ *	Measure basic cross-GPU memory access latency where one GPU writes
+ *	and another GPU reads without prefetch to evaluate remote access overhead
+ *
+ * SUBTEST: mgpu-latency-prefetch
+ * Description:
+ *	Measure cross-GPU memory access latency with explicit prefetch to
+ *	evaluate memory migration overhead and local access performance
+ *
+ * SUBTEST: mgpu-latency-copy-basic
+ * Description:
+ *	Measure latency of cross-GPU memory copy operations where one GPU
+ *	copies data from another GPU's memory without prefetch
+ *
+ * SUBTEST: mgpu-latency-copy-prefetch
+ * Description:
+ *	Measure latency of cross-GPU memory copy operations with prefetch
+ *	to evaluate copy performance with memory migration to local VRAM
+ *
  */
 
 #define MAX_XE_REGIONS	8
@@ -84,12 +106,16 @@
 #define MULTIGPU_ATOMIC_OP		BIT(3)
 #define MULTIGPU_COH_OP			BIT(4)
 #define MULTIGPU_COH_FAIL		BIT(5)
+#define MULTIGPU_PERF_OP		BIT(6)
+#define MULTIGPU_PERF_REM_COPY		BIT(7)
 
 #define INIT	2
 #define STORE	3
 #define ATOMIC	4
 #define DWORD	5
 
+struct timespec t_start, t_end;
+
 struct xe_svm_gpu_info {
 	bool supports_faults;
 	int vram_regions[MAX_XE_REGIONS];
@@ -134,6 +160,11 @@ static void gpu_coherecy_test_wrapper(struct xe_svm_gpu_info *src,
 				      struct drm_xe_engine_class_instance *eci,
 				      unsigned int flags);
 
+static void gpu_latency_test_wrapper(struct xe_svm_gpu_info *src,
+				     struct xe_svm_gpu_info *dst,
+				     struct drm_xe_engine_class_instance *eci,
+				     unsigned int flags);
+
 static void
 create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct drm_xe_engine_class_instance *eci,
 		    uint32_t *vm, uint32_t *exec_queue)
@@ -223,6 +254,11 @@ static void for_each_gpu_pair(int num_gpus, struct xe_svm_gpu_info *gpus,
 
 static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
 
+static double time_diff(struct timespec *start, struct timespec *end)
+{
+	return (end->tv_sec - start->tv_sec) + (end->tv_nsec - start->tv_nsec) / 1e9;
+}
+
 static void
 atomic_batch_init(int fd, uint32_t vm, uint64_t src_addr,
 		  uint32_t *bo, uint64_t *addr)
@@ -373,6 +409,39 @@ mgpu_check_fault_support(struct xe_svm_gpu_info *gpu1,
 	return ret;
 }
 
+static void
+store_dword_batch_init_1k(int fd, uint32_t vm, uint64_t src_addr,
+			  uint32_t *bo, uint64_t *addr, int value)
+{
+	int max_cmds = (4096 - sizeof(uint32_t)) / 16;
+	uint32_t batch_bo_size = BATCH_SIZE(fd);
+	uint32_t batch_bo;
+	uint64_t batch_addr;
+	void *batch;
+	uint32_t *cmd;
+	int i = 0;
+
+	batch_bo = xe_bo_create(fd, vm, batch_bo_size, vram_if_possible(fd, 0), 0);
+	batch = xe_bo_map(fd, batch_bo, batch_bo_size);
+	cmd = (uint32_t *)batch;
+
+	for (int j = 0; j < max_cmds; j++) {
+		uint64_t offset = src_addr + j * 4;
+
+		cmd[i++] = MI_STORE_DWORD_IMM_GEN4;
+		cmd[i++] = offset;
+		cmd[i++] = offset >> 32;
+		cmd[i++] = value;
+	}
+	cmd[i++] = MI_BATCH_BUFFER_END;
+
+	batch_addr = to_user_pointer(batch);
+
+	xe_vm_bind_lr_sync(fd, vm, batch_bo, 0, batch_addr, batch_bo_size, 0);
+	*bo = batch_bo;
+	*addr = batch_addr;
+}
+
 static void
 gpu_madvise_exec_sync(struct xe_svm_gpu_info *gpu, uint32_t vm, uint32_t exec_queue,
 		      uint64_t dst_addr, uint64_t *batch_addr, unsigned int flags)
@@ -394,10 +463,16 @@ gpu_madvise_exec_sync(struct xe_svm_gpu_info *gpu, uint32_t vm, uint32_t exec_qu
 	sync.timeline_value = EXEC_SYNC_VAL;
 	WRITE_ONCE(*sync_addr, 0);
 
+	if (flags & MULTIGPU_PERF_OP)
+		clock_gettime(CLOCK_MONOTONIC, &t_start);
+
 	xe_exec_sync(gpu->fd, exec_queue, *batch_addr, &sync, 1);
 	if (READ_ONCE(*sync_addr) != EXEC_SYNC_VAL)
 		xe_wait_ufence(gpu->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue,
 			       NSEC_PER_SEC * 10);
+
+	if (flags & MULTIGPU_PERF_OP)
+		clock_gettime(CLOCK_MONOTONIC, &t_end);
 }
 
 static void
@@ -414,7 +489,15 @@ gpu_batch_create(struct xe_svm_gpu_info *gpu, uint32_t vm, uint32_t exec_queue,
 		batch_init(gpu->fd, vm, src_addr, dst_addr, SZ_4K, batch_bo, batch_addr);
 		break;
 	case DWORD:
-		store_dword_batch_init(gpu->fd, vm, src_addr, batch_bo, batch_addr, BATCH_VALUE);
+		if (flags & MULTIGPU_PERF_OP) {
+			clock_gettime(CLOCK_MONOTONIC, &t_start);
+			store_dword_batch_init_1k(gpu->fd, vm, src_addr, batch_bo,
+						  batch_addr, BATCH_VALUE);
+			clock_gettime(CLOCK_MONOTONIC, &t_end);
+		}
+		else
+			store_dword_batch_init(gpu->fd, vm, src_addr, batch_bo,
+					       batch_addr, BATCH_VALUE);
 		break;
 	default:
 		igt_assert(!"Unknown batch op_type");
@@ -700,6 +783,150 @@ coherency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]);
 }
 
+static void
+latency_test_multigpu(struct xe_svm_gpu_info *gpu1,
+		      struct xe_svm_gpu_info *gpu2,
+		      struct drm_xe_engine_class_instance *eci,
+		      unsigned int flags)
+{
+	uint64_t addr;
+	uint32_t vm[2];
+	uint32_t exec_queue[2];
+	uint32_t batch_bo[2];
+	uint8_t *copy_dst;
+	uint64_t batch_addr[2];
+	struct test_exec_data *data;
+	double gpu1_latency, gpu2_latency;
+	double gpu1_bw, gpu2_bw;
+	uint32_t final_value;
+
+	/* Skip if either GPU doesn't support faults */
+	if (mgpu_check_fault_support(gpu1, gpu2))
+		return;
+
+	create_vm_and_queue(gpu1, eci, &vm[0], &exec_queue[0]);
+	create_vm_and_queue(gpu2, eci, &vm[1], &exec_queue[1]);
+
+	data = aligned_alloc(SZ_2M, SZ_4K);
+	igt_assert(data);
+	data[0].vm_sync = 0;
+	addr = to_user_pointer(data);
+
+	copy_dst = aligned_alloc(SZ_2M, SZ_4K);
+	igt_assert(copy_dst);
+
+	/* GPU1: Creating batch with predefined value */
+	gpu1_latency = time_diff(&t_start, &t_end);
+	gpu_batch_create(gpu1, vm[0], exec_queue[0], addr, 0,
+			 &batch_bo[0], &batch_addr[0], flags, DWORD);
+
+	/*GPU1: Madvise and Prefetch Ops */
+	gpu_madvise_exec_sync(gpu1, vm[0], exec_queue[0], addr, &batch_addr[0], flags);
+
+	gpu1_latency += time_diff(&t_start, &t_end);
+	gpu1_bw = (SZ_1K / (gpu1_latency / 1e9)) / (1024.0 * 1024.0); //Written 1k
+
+	igt_info("GPU1 write with %s: Latency %.3f us, Bandwidth %.2f MB/s\n",
+		 (flags & MULTIGPU_PREFETCH) ? "prefetch" : "noprefetch",
+		 gpu1_latency / 1000.0, gpu1_bw);
+
+	/* Validate GPU1 performance */
+	if (flags & MULTIGPU_PREFETCH) {
+		if (gpu1_latency / 1000.0 > 5.0)
+			igt_warn("GPU1 write with prefetch slower than expected (%.3f us > 5us)\n",
+				 gpu1_latency / 1000.0);
+	}
+
+	if (flags & MULTIGPU_PERF_REM_COPY) {
+		/*GPU2: Copy data from addr (written by GPU1) to its own buffer (copy_dst) */
+		gpu2_latency = time_diff(&t_start, &t_end);
+		gpu_batch_create(gpu2, vm[1], exec_queue[1], addr, to_user_pointer(copy_dst),
+				 &batch_bo[1], &batch_addr[1], flags, INIT);
+
+		/*GPU2: Madvise and Prefetch Ops */
+		gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(copy_dst),
+				      &batch_addr[1], flags);
+
+		gpu2_latency += time_diff(&t_start, &t_end);
+		gpu2_bw = (SZ_4K / (gpu2_latency / 1e9)) / (1024.0 * 1024.0);
+		final_value = *(uint32_t *)copy_dst;
+		igt_assert_eq(final_value, BATCH_VALUE);
+	} else {
+		/* GPU1 --> Creating batch with value and executing STORE op */
+		gpu_batch_create(gpu1, vm[0], exec_queue[0], addr, 0,
+				 &batch_bo[0], &batch_addr[0], flags, DWORD);
+
+		/*GPU1: Madvise and Prefetch Ops */
+		gpu_madvise_exec_sync(gpu1, vm[0], exec_queue[0], addr, &batch_addr[0], flags);
+
+		gpu2_latency = time_diff(&t_start, &t_end);
+
+		/*GPU2: Copy data from addr (written by GPU1) to its own buffer (copy_dst) */
+		gpu_batch_create(gpu2, vm[1], exec_queue[1], addr, to_user_pointer(copy_dst),
+				 &batch_bo[1], &batch_addr[1], flags, INIT);
+
+		/*GPU2: Madvise and Prefetch Ops */
+		gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(copy_dst),
+				      &batch_addr[1], flags);
+
+		gpu2_latency += time_diff(&t_start, &t_end);
+		gpu2_bw = (SZ_4K / (gpu2_latency / 1e9)) / (1024.0 * 1024.0);
+		final_value = READ_ONCE(*(uint32_t *)copy_dst);
+		igt_assert_eq(final_value, BATCH_VALUE);
+	}
+
+	igt_info("GPU2 %s copy: Latency %.3f us, Bandwidth %.2f MB/s\n",
+		 (flags & MULTIGPU_PERF_REM_COPY) ? "remote" : "local",
+		 gpu2_latency / 1000.0, gpu2_bw);
+
+	/* Validate GPU2 performance based on scenario */
+	if (flags & MULTIGPU_PERF_REM_COPY) {
+		if (flags & MULTIGPU_PREFETCH) {
+			/* Remote copy with prefetch: expect 0.2-1us */
+			if (gpu2_latency / 1000.0 > 1.0)
+				igt_warn("GPU2 remote copy with prefetch slower than expected (%.3f us > 1us)\n",
+					 gpu2_latency / 1000.0);
+		} else {
+			/* Remote copy without prefetch: expect 1-4us */
+			if (gpu2_latency / 1000.0 > 10.0)
+				igt_warn("GPU2 P2P remote copy is very slow (%.3f us > 10us)\n",
+					 gpu2_latency / 1000.0);
+		}
+	} else {
+		if (flags & MULTIGPU_PREFETCH) {
+			/* Local write with prefetch: expect 0.1-0.5us */
+			if (gpu2_latency / 1000.0 > 1.0)
+				igt_warn("GPU2 local write with prefetch slower than expected (%.3f us > 1us)\n",
+					 gpu2_latency / 1000.0);
+		}
+	}
+
+	/* Bandwidth comparison */
+	if (gpu2_bw > gpu1_bw)
+		igt_info("GPU2 has %.2fx better bandwidth than GPU1\n", gpu2_bw / gpu1_bw);
+	else
+		igt_info("GPU1 has %.2fx better bandwidth than GPU2\n", gpu1_bw / gpu2_bw);
+
+	/* Overall prefetch effectiveness check */
+	if (flags & MULTIGPU_PREFETCH) {
+		if ((gpu1_latency / 1000.0) < 5.0 && (gpu2_latency / 1000.0) < 5.0)
+			igt_info("Prefetch providing expected performance benefit\n");
+		else
+			igt_warn("Prefetch not providing expected performance benefit\n");
+	}
+
+	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
+	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
+
+	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
+	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[1]);
+	free(data);
+	free(copy_dst);
+
+	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);
+	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]);
+}
+
 static void
 gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
 		       struct xe_svm_gpu_info *dst,
@@ -736,6 +963,18 @@ gpu_coherecy_test_wrapper(struct xe_svm_gpu_info *src,
 	coherency_test_multigpu(src, dst, eci, flags);
 }
 
+static void
+gpu_latency_test_wrapper(struct xe_svm_gpu_info *src,
+			 struct xe_svm_gpu_info *dst,
+			 struct drm_xe_engine_class_instance *eci,
+			 unsigned int flags)
+{
+	igt_assert(src);
+	igt_assert(dst);
+
+	latency_test_multigpu(src, dst, eci, flags);
+}
+
 static void
 test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
 	       struct drm_xe_engine_class_instance *eci,
@@ -747,6 +986,8 @@ test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_atomic_inc_wrapper, flags);
 	if (flags & MULTIGPU_COH_OP)
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_coherecy_test_wrapper, flags);
+	if (flags & MULTIGPU_PERF_OP)
+		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_latency_test_wrapper, flags);
 }
 
 struct section {
@@ -776,6 +1017,12 @@ igt_main
 		{ "coherency-prefetch", MULTIGPU_PREFETCH | MULTIGPU_COH_OP },
 		{ "coherency-fail-prefetch",
 		  MULTIGPU_PREFETCH | MULTIGPU_COH_OP | MULTIGPU_COH_FAIL},
+		{ "latency-basic", MULTIGPU_PERF_OP },
+		{ "latency-copy-basic",
+		  MULTIGPU_PERF_OP | MULTIGPU_PERF_REM_COPY },
+		{ "latency-prefetch", MULTIGPU_PREFETCH | MULTIGPU_PERF_OP },
+		{ "latency-copy-prefetch",
+		  MULTIGPU_PREFETCH | MULTIGPU_PERF_OP | MULTIGPU_PERF_REM_COPY },
 		{ NULL },
 	};
 
-- 
2.48.1

