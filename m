Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75133CFC28C
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 16:25:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2567A10E8E5;
	Fri, 21 Nov 2025 16:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YfJG3WtQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E8C10E662
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 16:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763742339; x=1795278339;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=iMp+CAhvQ4M+roYHfArwBoGrYKpuiVbfYTfPL3v0UdY=;
 b=YfJG3WtQH1RUbY9sqhXd35fh5IYnwGK4V7fgCYOZx1GIxPMl5oD3R2Fj
 qpBrqfSQBDR8kJjdYK2MiUfxk05LlbHWiXS1AM3T19GQi5oZMO+R5K4hW
 rAqrg8FnRmvxvYGF2MvneoSivYD0ZWbF1Ytjhj9R3Oof+C3r0UdH2rEI+
 I7ZuhHy5BjFBRxyanWzsi15bjCHls1OGpwF6TRWB8rq6Uo2b6NuyAww5k
 OlaWbtVUbzrXmOKfKHfnszpcQQO3za4iYVVYHJVmL4tAgxCzUu722OCzP
 jPiQA/+PxDCCtce+1Krczavs3TWreEV9OSDFl2V3VCkuGez/NnrD1leJJ Q==;
X-CSE-ConnectionGUID: Kb76kiwXTHqXBznaY82MGA==
X-CSE-MsgGUID: A9dKr5zySZGZti4ovjRzAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65029750"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="65029750"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 08:25:38 -0800
X-CSE-ConnectionGUID: Jyc1GL3lRu+hGSDGE4K8Eg==
X-CSE-MsgGUID: zNTbbUqSQGSKdhYfHsK4lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="215096187"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..)
 ([10.1.40.114])
 by fmviesa002.fm.intel.com with ESMTP; 21 Nov 2025 08:25:38 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH i-g-t v8 06/10] tests/intel/xe_multi_gpusvm: Add SVM multi-GPU
 performance test
Date: Fri, 21 Nov 2025 16:25:33 +0000
Message-ID: <20251121162537.77551-7-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251121162537.77551-1-nishit.sharma@intel.com>
References: <20251121162537.77551-1-nishit.sharma@intel.com>
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
 tests/intel/xe_multi_gpusvm.c | 184 ++++++++++++++++++++++++++++++++++
 1 file changed, 184 insertions(+)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index 43a8e6f0b..9701ba92c 100644
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
@@ -64,6 +66,26 @@
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
@@ -81,6 +103,8 @@
 #define MULTIGPU_ATOMIC_OP		BIT(3)
 #define MULTIGPU_COH_OP			BIT(4)
 #define MULTIGPU_COH_FAIL		BIT(5)
+#define MULTIGPU_PERF_OP		BIT(6)
+#define MULTIGPU_PERF_REM_COPY		BIT(7)
 
 struct xe_svm_gpu_info {
 	bool supports_faults;
@@ -126,6 +150,11 @@ static void gpu_coherecy_test_wrapper(struct xe_svm_gpu_info *src,
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
@@ -217,6 +246,11 @@ static void for_each_gpu_pair(int num_gpus, struct xe_svm_gpu_info *gpus,
 
 static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
 
+static double time_diff(struct timespec *start, struct timespec *end)
+{
+	return (end->tv_sec - start->tv_sec) + (end->tv_nsec - start->tv_nsec) / 1e9;
+}
+
 static void
 atomic_batch_init(int fd, uint32_t vm, uint64_t src_addr,
 		  uint32_t *bo, uint64_t *addr)
@@ -696,6 +730,136 @@ coherency_test_multigpu(struct xe_svm_gpu_info *gpu1,
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
+	struct drm_xe_sync sync = {};
+	volatile uint64_t *sync_addr;
+	int value = 60;
+	struct test_exec_data *data;
+	struct timespec t_start, t_end;
+	double gpu1_latency, gpu2_latency;
+	double gpu1_bw, gpu2_bw;
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
+	/*** GPU1 writes at addr ***/
+	store_dword_batch_init(gpu1->fd, vm[0], addr, &batch_bo[0], &batch_addr[0], value);
+
+	xe_multigpu_madvise(gpu1->fd, vm[0], addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu1->fd, 0, gpu1->vram_regions[0], exec_queue[0]);
+
+	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
+	xe_multigpu_prefetch(gpu1->fd, vm[0], addr, SZ_4K, &sync,
+			     sync_addr, exec_queue[0], flags);
+	free((void *)sync_addr);
+
+	sync_addr = (void *)((char *)batch_addr[0] + SZ_4K);
+	sync.addr = to_user_pointer((uint64_t *)sync_addr);
+	sync.timeline_value = EXEC_SYNC_VAL;
+	*sync_addr = 0;
+
+	/* START TIMING: GPU1 execution */
+	clock_gettime(CLOCK_MONOTONIC, &t_start);
+
+	xe_exec_sync(gpu1->fd, exec_queue[0], batch_addr[0], &sync, 1);
+	if (*sync_addr != EXEC_SYNC_VAL)
+		xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[0],
+			       NSEC_PER_SEC * 10);
+
+	clock_gettime(CLOCK_MONOTONIC, &t_end);
+	/* END TIMING */
+
+	gpu1_latency = time_diff(&t_start, &t_end);
+	gpu1_bw = (SZ_4K / (gpu1_latency / 1e9)) / (1024.0 * 1024.0);
+
+	igt_info("GPU1 write: Latency %.3f us, Bandwidth %.2f MB/s\n",
+		 gpu1_latency / 1000.0, gpu1_bw);
+
+	igt_assert_eq(*(uint64_t *)addr, value);
+
+	*(uint64_t *)addr = 50;
+
+	if (flags & MULTIGPU_PERF_REM_COPY) {
+		batch_init(gpu2->fd, vm[1], addr, to_user_pointer(copy_dst),
+			   SZ_4K, &batch_bo[1], &batch_addr[1]);
+	} else {
+		store_dword_batch_init(gpu2->fd, vm[1], addr, &batch_bo[1],
+				       &batch_addr[1], value + 10);
+	}
+
+	xe_multigpu_madvise(gpu2->fd, vm[1], addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu2->fd, 0, gpu2->vram_regions[0], exec_queue[1]);
+
+	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
+	xe_multigpu_prefetch(gpu2->fd, vm[1], addr, SZ_4K, &sync,
+			     sync_addr, exec_queue[1], flags);
+	free((void *)sync_addr);
+
+	sync_addr = (void *)((char *)batch_addr[1] + SZ_4K);
+	sync.addr = to_user_pointer((uint64_t *)sync_addr);
+	sync.timeline_value = EXEC_SYNC_VAL;
+	*sync_addr = 0;
+
+	/* START TIMING : GPU2 execution */
+	clock_gettime(CLOCK_MONOTONIC, &t_start);
+
+	xe_exec_sync(gpu2->fd, exec_queue[1], batch_addr[1], &sync, 1);
+	if (*sync_addr != EXEC_SYNC_VAL)
+		xe_wait_ufence(gpu2->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[1],
+			       NSEC_PER_SEC * 10);
+
+	clock_gettime(CLOCK_MONOTONIC, &t_end);
+	/* END TIMING */
+
+	gpu2_latency = time_diff(&t_start, &t_end);
+	gpu2_bw = (SZ_4K / (gpu2_latency / 1e9)) / (1024.0 * 1024.0);
+
+	igt_info("GPU2 %s copy: Latency %.3f us, Bandwidth %.2f MB/s\n",
+		 (flags & MULTIGPU_PERF_REM_COPY) ? "remote" : "local",
+		 gpu2_latency / 1000.0, gpu2_bw);
+
+	if (!(flags & MULTIGPU_PERF_REM_COPY))
+		igt_assert_eq(*(uint64_t *)addr, value + 10);
+	else
+		igt_assert_eq(*(uint64_t *)copy_dst, 50);
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
@@ -732,6 +896,18 @@ gpu_coherecy_test_wrapper(struct xe_svm_gpu_info *src,
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
@@ -743,6 +919,8 @@ test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_atomic_inc_wrapper, flags);
 	if (flags & MULTIGPU_COH_OP)
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_coherecy_test_wrapper, flags);
+	if (flags & MULTIGPU_PERF_OP)
+		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_latency_test_wrapper, flags);
 }
 
 struct section {
@@ -770,6 +948,12 @@ igt_main
 		{ "coherency-prefetch", MULTIGPU_PREFETCH | MULTIGPU_COH_OP },
 		{ "coherency-fail-prefetch",
 		  MULTIGPU_PREFETCH | MULTIGPU_COH_OP | MULTIGPU_COH_FAIL},
+		{ "latency-basic", MULTIGPU_BASIC | MULTIGPU_PERF_OP },
+		{ "latency-copy-basic",
+		  MULTIGPU_BASIC | MULTIGPU_PERF_OP | MULTIGPU_PERF_REM_COPY },
+		{ "latency-prefetch", MULTIGPU_PREFETCH | MULTIGPU_PERF_OP },
+		{ "latency-copy-prefetch",
+		  MULTIGPU_PREFETCH | MULTIGPU_PERF_OP | MULTIGPU_PERF_REM_COPY },
 		{ NULL },
 	};
 
-- 
2.48.1

