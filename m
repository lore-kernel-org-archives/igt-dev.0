Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FAACFC29B
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 16:25:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94F410E8EB;
	Fri, 21 Nov 2025 16:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I3lzDcfl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC3810E8E2
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 16:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763742339; x=1795278339;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=RqJdQEn6fw1M/0W331jmkrfdrX62OrAWFgZTaC3WogE=;
 b=I3lzDcflCQ+KCvYc+P0lmTlnLNeTFsB4fACWpeCW7Vm0YJHEhNSLBRMY
 xamu+jGUBIOo+6fTcxpdOiUHd38NAG7TOY9jz5U57LfqneQ8twdcwS0gy
 k0l1x/RZnLACQFSyBQMF29SZIRgy5HRI1X0uVHG4MoF96ulR0szl13UCX
 hFeAYH0eEA5Rc7ebNrMNX+Jh8NFxNJk5RwdK0TeoOu1+8BKyDBIZz6Bk4
 dq1mLrAaZXTXRuHbGL0mPqXI7owLwf5QAIhQYxn90I/BpUzOCBOzlza8D
 vz+uAQhg+Z5WjU/LyYr7c9IZuLVdl7g83MAVXzhk7bcIXWpwTH2y8a8Lh Q==;
X-CSE-ConnectionGUID: fWSlyMMWSHyIlDueJPMb7g==
X-CSE-MsgGUID: QX1thW2HTFGXFWfOUiNT5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65029751"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="65029751"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 08:25:38 -0800
X-CSE-ConnectionGUID: G9nSBNc3TGajMhnPc/UFjA==
X-CSE-MsgGUID: HYYG2HiIQYyKOXwecoi4xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="215096190"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..)
 ([10.1.40.114])
 by fmviesa002.fm.intel.com with ESMTP; 21 Nov 2025 08:25:38 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH i-g-t v8 07/10] tests/intel/xe_multi_gpusvm: Add SVM multi-GPU
 fault handling test
Date: Fri, 21 Nov 2025 16:25:34 +0000
Message-ID: <20251121162537.77551-8-nishit.sharma@intel.com>
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

This test intentionally triggers page faults by accessing regions without
prefetch for both GPUs in a multi-GPU environment.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_multi_gpusvm.c | 176 ++++++++++++++++++++++++++++++++++
 1 file changed, 176 insertions(+)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index 9701ba92c..2f3caa8e7 100644
--- a/tests/intel/xe_multi_gpusvm.c
+++ b/tests/intel/xe_multi_gpusvm.c
@@ -15,6 +15,7 @@
 
 #include "time.h"
 
+#include "xe/xe_gt.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
@@ -86,6 +87,17 @@
  *	Measure latency of cross-GPU memory copy operations with prefetch
  *	to evaluate copy performance with memory migration to local VRAM
  *
+ * SUBTEST: mgpu-pagefault-basic
+ * Description:
+ *	Test cross-GPU page fault handling where one GPU writes to memory
+ *	and another GPU reads, triggering page faults without prefetch to
+ *	validate on-demand page migration across GPUs
+ *
+ * SUBTEST: mgpu-pagefault-prefetch
+ * Description:
+ *	Test cross-GPU memory access with prefetch to verify page fault
+ *	suppression when memory is pre-migrated to target GPU's VRAM
+ *
  */
 
 #define MAX_XE_REGIONS	8
@@ -105,6 +117,7 @@
 #define MULTIGPU_COH_FAIL		BIT(5)
 #define MULTIGPU_PERF_OP		BIT(6)
 #define MULTIGPU_PERF_REM_COPY		BIT(7)
+#define MULTIGPU_PFAULT_OP		BIT(8)
 
 struct xe_svm_gpu_info {
 	bool supports_faults;
@@ -155,6 +168,11 @@ static void gpu_latency_test_wrapper(struct xe_svm_gpu_info *src,
 				     struct drm_xe_engine_class_instance *eci,
 				     unsigned int flags);
 
+static void gpu_fault_test_wrapper(struct xe_svm_gpu_info *src,
+				   struct xe_svm_gpu_info *dst,
+				   struct drm_xe_engine_class_instance *eci,
+				   unsigned int flags);
+
 static void
 create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct drm_xe_engine_class_instance *eci,
 		    uint32_t *vm, uint32_t *exec_queue)
@@ -860,6 +878,148 @@ latency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]);
 }
 
+static void
+pagefault_test_multigpu(struct xe_svm_gpu_info *gpu1,
+			struct xe_svm_gpu_info *gpu2,
+			struct drm_xe_engine_class_instance *eci,
+			unsigned int flags)
+{
+	uint64_t addr;
+	uint64_t addr1;
+	uint32_t vm[2];
+	uint32_t exec_queue[2];
+	uint32_t batch_bo[2];
+	uint64_t batch_addr[2];
+	struct drm_xe_sync sync = {};
+	volatile uint64_t *sync_addr;
+	int value = 60;
+	void *data, *verify_result;
+	const char *pf_count_stat = "svm_pagefault_count";
+	int pf_count_gpu1_before, pf_count_gpu1_after;
+	int pf_count_gpu2_before, pf_count_gpu2_after;
+	bool prefetch_req = flags & MULTIGPU_PREFETCH;
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
+	memset(data, 0, SZ_4K);
+	addr = to_user_pointer(data);
+
+	/* Allocate verification buffer for GPU2 to copy into */
+	verify_result = aligned_alloc(SZ_2M, SZ_4K);
+	igt_assert(verify_result);
+	addr1 = to_user_pointer(verify_result);
+
+	/* === Phase 1: GPU1 writes to addr === */
+	pf_count_gpu1_before = xe_gt_stats_get_count(gpu1->fd, eci->gt_id, pf_count_stat);
+
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
+	/* GPU1 writes */
+	xe_exec_sync(gpu1->fd, exec_queue[0], batch_addr[0], &sync, 1);
+	if (*sync_addr != EXEC_SYNC_VAL)
+		xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[0],
+			       NSEC_PER_SEC * 10);
+
+	pf_count_gpu1_after = xe_gt_stats_get_count(gpu1->fd, eci->gt_id, pf_count_stat);
+
+	if (prefetch_req) {
+		/* With prefetch: expect NO page faults */
+		igt_assert_eq(pf_count_gpu1_after, pf_count_gpu1_before);
+		igt_info("GPU1 write with prefetch: No page faults (as expected)\n");
+	} else {
+		/* Without prefetch: expect page faults */
+		igt_warn_on_f(pf_count_gpu1_after > pf_count_gpu1_before,
+			      "%d page faults generated on GPU1\n",
+			      pf_count_gpu1_after - pf_count_gpu1_before);
+		igt_info("GPU1 write without prefetch: %d page faults\n",
+			 pf_count_gpu1_after - pf_count_gpu1_before);
+	}
+
+	igt_debug("GPU1 wrote :%#llx\n", (unsigned long long)*(uint64_t *)addr);
+
+	/* === Phase 2: GPU2 reads from addr (cross-GPU access) === */
+	pf_count_gpu2_before = xe_gt_stats_get_count(gpu2->fd, eci->gt_id, pf_count_stat);
+
+	/* Create batch for GPU2 to copy from addr (GPU1's memory) to verify_result */
+	batch_init(gpu2->fd, vm[1], addr, addr1,
+		   SZ_4K, &batch_bo[1], &batch_addr[1]);
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
+	/* Also prefetch destination buffer */
+	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
+	xe_multigpu_prefetch(gpu2->fd, vm[1], addr1, SZ_4K, &sync,
+			     sync_addr, exec_queue[1], flags);
+	free((void *)sync_addr);
+
+	sync_addr = (void *)((char *)batch_addr[1] + SZ_4K);
+	sync.addr = to_user_pointer((uint64_t *)sync_addr);
+	sync.timeline_value = EXEC_SYNC_VAL;
+	*sync_addr = 0;
+
+	/* GPU2 reads from GPU1's memory */
+	xe_exec_sync(gpu2->fd, exec_queue[1], batch_addr[1], &sync, 1);
+	if (*sync_addr != EXEC_SYNC_VAL)
+		xe_wait_ufence(gpu2->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL,
+			       exec_queue[1], NSEC_PER_SEC * 10);
+
+	pf_count_gpu2_after = xe_gt_stats_get_count(gpu2->fd, eci->gt_id, pf_count_stat);
+
+	if (prefetch_req) {
+		/* With prefetch: expect NO page faults on GPU2 */
+		igt_assert_eq(pf_count_gpu2_after, pf_count_gpu2_before);
+		igt_info("GPU2 cross-GPU read with prefetch: No page faults (as expected)\n");
+	} else {
+		/* Without prefetch: expect cross-GPU page faults */
+		igt_warn_on_f(pf_count_gpu2_after > pf_count_gpu2_before,
+			      "%d page faults generated on GPU2\n",
+			      pf_count_gpu2_after - pf_count_gpu2_before);
+		igt_info("GPU2 cross-GPU read without prefetch: %d page faults\n",
+			 pf_count_gpu2_after - pf_count_gpu2_before);
+	}
+
+	/* NOW CPU can safely read verify_result (not addr!) */
+	igt_assert_eq(*(uint64_t *)verify_result, value);
+
+	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
+	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
+	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
+	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[0]);
+	free(data);
+	free(verify_result);
+
+	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);
+	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]);
+}
+
 static void
 gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
 		       struct xe_svm_gpu_info *dst,
@@ -908,6 +1068,18 @@ gpu_latency_test_wrapper(struct xe_svm_gpu_info *src,
 	latency_test_multigpu(src, dst, eci, flags);
 }
 
+static void
+gpu_fault_test_wrapper(struct xe_svm_gpu_info *src,
+		       struct xe_svm_gpu_info *dst,
+		       struct drm_xe_engine_class_instance *eci,
+		       unsigned int flags)
+{
+	igt_assert(src);
+	igt_assert(dst);
+
+	pagefault_test_multigpu(src, dst, eci, flags);
+}
+
 static void
 test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
 	       struct drm_xe_engine_class_instance *eci,
@@ -921,6 +1093,8 @@ test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_coherecy_test_wrapper, flags);
 	if (flags & MULTIGPU_PERF_OP)
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_latency_test_wrapper, flags);
+	if (flags & MULTIGPU_PFAULT_OP)
+		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_fault_test_wrapper, flags);
 }
 
 struct section {
@@ -954,6 +1128,8 @@ igt_main
 		{ "latency-prefetch", MULTIGPU_PREFETCH | MULTIGPU_PERF_OP },
 		{ "latency-copy-prefetch",
 		  MULTIGPU_PREFETCH | MULTIGPU_PERF_OP | MULTIGPU_PERF_REM_COPY },
+		{ "pagefault-basic", MULTIGPU_BASIC | MULTIGPU_PFAULT_OP },
+		{ "pagefault-prefetch", MULTIGPU_PREFETCH | MULTIGPU_PFAULT_OP },
 		{ NULL },
 	};
 
-- 
2.48.1

