Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E45D1F9A2
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 08:54:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60B810E8F2;
	Thu,  4 Dec 2025 08:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WjVpu1wE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026C310E8E2
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 08:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764838482; x=1796374482;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ovrMbuI62Ee111Fl000UcKRoyrpWXgpIIf47akVi4yg=;
 b=WjVpu1wE/YQY2eiclk+pJzL2u9L+m4mmXtqO+H1AgXOoAy03vjQWx7k6
 ri+l+Cbfmf3gTUsPx5VmbITuvbYpiy5bIVwVR4Yt6rcPZ+yikeZMRQWC5
 R2b0piOhb/WrfbBu0vX3vZu20fPbPtcXG0QSqBxEP3dDaTixZ8v6sWvck
 4v0epEn0Iva1j8RBvU/1adCQIFeEbHCWo4YwSyFIDIvh+lxGKs5cU0orK
 eYCr/Y5j/ELzbNLewgel7avu9b23vXhntyyG/cqeUlW9wzbPSSBzc7mgc
 +vT/R2kVdBX0fqOxqYeGmoB3q6JtAeDc0ezMMgm4dyf1EITfkmRHHCEv3 A==;
X-CSE-ConnectionGUID: hjJfXewHRziUNsveN7HWKw==
X-CSE-MsgGUID: zrgKfp0USRSck4hpsZ4M4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70703096"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="70703096"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 00:54:33 -0800
X-CSE-ConnectionGUID: WPP0tT2DQxGkBJdWBdXlQA==
X-CSE-MsgGUID: rRuDmDOpQTCSH81zpKm/GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="194744059"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.43])
 by orviesa009.jf.intel.com with ESMTP; 04 Dec 2025 00:54:33 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Subject: [PATCH v12 07/10] tests/intel/xe_multigpu_svm: Add SVM multi-GPU
 fault handling test
Date: Thu,  4 Dec 2025 08:54:28 +0000
Message-ID: <20251204085432.35023-8-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251204085432.35023-1-nishit.sharma@intel.com>
References: <20251204085432.35023-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel/xe_multigpu_svm.c | 143 ++++++++++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/tests/intel/xe_multigpu_svm.c b/tests/intel/xe_multigpu_svm.c
index 32c0d299f..a879bab79 100644
--- a/tests/intel/xe_multigpu_svm.c
+++ b/tests/intel/xe_multigpu_svm.c
@@ -15,6 +15,7 @@
 
 #include "time.h"
 
+#include "xe/xe_gt.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
@@ -89,6 +90,17 @@
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
@@ -108,6 +120,7 @@
 #define MULTIGPU_COH_FAIL		BIT(5)
 #define MULTIGPU_PERF_OP		BIT(6)
 #define MULTIGPU_PERF_REM_COPY		BIT(7)
+#define MULTIGPU_PFAULT_OP		BIT(8)
 
 #define INIT	2
 #define STORE	3
@@ -163,6 +176,11 @@ static void gpu_latency_test_wrapper(struct xe_svm_gpu_info *src,
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
@@ -924,6 +942,115 @@ latency_test_multigpu(struct xe_svm_gpu_info *gpu1,
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
+	uint64_t *sync_addr;
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
+	/* GPU1 --> Creating batch with value and executing STORE op */
+	gpu_batch_create(gpu1, vm[0], exec_queue[0], addr, 0,
+			 &batch_bo[0], &batch_addr[0], flags, DWORD);
+
+	/*GPU1: Madvise and Prefetch Ops */
+	gpu_madvise_exec_sync(gpu1, vm[0], exec_queue[0], addr, &batch_addr[0], flags, NULL);
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
+	/* === Phase 2: GPU2 reads from addr (cross-GPU access) === */
+	pf_count_gpu2_before = xe_gt_stats_get_count(gpu2->fd, eci->gt_id, pf_count_stat);
+
+	/* GPU2 --> Create batch for GPU2 to copy from addr (GPU1's memory) to verify_result */
+	gpu_batch_create(gpu2, vm[1], exec_queue[1], addr, addr1,
+			 &batch_bo[1], &batch_addr[1], flags, INIT);
+
+	/* Prefetch src buffer (addr) to avoid page faults */
+	xe_multigpu_madvise(gpu2->fd, vm[1], addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu2->fd, 0, gpu2->vram_regions[0], exec_queue[1]);
+
+	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
+	xe_multigpu_prefetch(gpu2->fd, vm[1], addr, SZ_4K, &sync,
+			     sync_addr, exec_queue[1], flags);
+
+	free(sync_addr);
+
+	/*GPU2: Madvise and Prefetch Ops */
+	gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], addr1, &batch_addr[1], flags, NULL);
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
@@ -972,6 +1099,18 @@ gpu_latency_test_wrapper(struct xe_svm_gpu_info *src,
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
@@ -985,6 +1124,8 @@ test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_coherecy_test_wrapper, flags);
 	if (flags & MULTIGPU_PERF_OP)
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_latency_test_wrapper, flags);
+	if (flags & MULTIGPU_PFAULT_OP)
+		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_fault_test_wrapper, flags);
 }
 
 struct section {
@@ -1020,6 +1161,8 @@ igt_main
 		{ "latency-prefetch", MULTIGPU_PREFETCH | MULTIGPU_PERF_OP },
 		{ "latency-copy-prefetch",
 		  MULTIGPU_PREFETCH | MULTIGPU_PERF_OP | MULTIGPU_PERF_REM_COPY },
+		{ "pagefault-basic", MULTIGPU_PFAULT_OP },
+		{ "pagefault-prefetch", MULTIGPU_PREFETCH | MULTIGPU_PFAULT_OP },
 		{ NULL },
 	};
 
-- 
2.48.1

