Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDFCC2A07E
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 08:47:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB49A10E38B;
	Mon,  5 Jan 2026 08:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Na6BGuSn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7636810E395
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 08:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767602872; x=1799138872;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=SqqYGn2yn1RA6HXOuRUAiVVU/ieVoJk9W7iyq1G4EW4=;
 b=Na6BGuSnAqPtmKqqvEnoAj4fHn6dBm9iqKOVZTdK1zDVZAq4sLYSe1nv
 vM1t42d6EF+ij5Ab3RD5fRPDfxBz9xLeCqmevwSC3NwU0IcNbQn32fwWm
 cDonecJcNEiO6fcsxnM0TM9grychBVAOR/FDq1MV9bWOZsu0BF2sLecGe
 +9mBCROhjqoOnLJfd45obRvRdyUfdOB8QkxwAZNQ2Pw1Aiy1qz16gWVZe
 nF5PwoUL0aj3veF26DxGxcZBkf97OCRCV6ToxOETOCEMxXP50vvh1d8LX
 UejSpl/BD94h+46freVVmrW86ozNp8itd7lrB2MNz/0nAxt0dPGcsRk6L g==;
X-CSE-ConnectionGUID: YFqioY/dTaii3+0c+ltr0A==
X-CSE-MsgGUID: Ki8k8VpBSK+m/ahTYoKvxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="72814612"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="72814612"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 00:47:52 -0800
X-CSE-ConnectionGUID: f5CQ+77XQHCxo9TN3HDfpA==
X-CSE-MsgGUID: 33xKda5nRUSrQ8buth9QPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="225873346"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.84.79])
 by fmviesa002.fm.intel.com with ESMTP; 05 Jan 2026 00:47:51 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t v14 08/11] tests/intel/xe_multigpu_svm: Add SVM
 multi-GPU fault handling test
Date: Mon,  5 Jan 2026 08:47:47 +0000
Message-ID: <20260105084750.190346-9-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260105084750.190346-1-nishit.sharma@intel.com>
References: <20260105084750.190346-1-nishit.sharma@intel.com>
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
 tests/intel/xe_multigpu_svm.c | 145 ++++++++++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/tests/intel/xe_multigpu_svm.c b/tests/intel/xe_multigpu_svm.c
index 903ac636b..a38b29aab 100644
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
@@ -930,6 +948,117 @@ latency_test_multigpu(struct xe_svm_gpu_info *gpu1,
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
+		igt_debug("Pagefault count %s\n",
+			  pf_count_gpu1_after > pf_count_gpu1_before
+			  ? "increased"
+			  : "not increased");
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
+		igt_debug("Pagefault count %s\n",
+			  pf_count_gpu2_after > pf_count_gpu2_before
+			  ? "increased"
+			  : "not increased");
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
@@ -978,6 +1107,18 @@ gpu_latency_test_wrapper(struct xe_svm_gpu_info *src,
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
@@ -991,6 +1132,8 @@ test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_coherecy_test_wrapper, flags);
 	if (flags & MULTIGPU_PERF_OP)
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_latency_test_wrapper, flags);
+	if (flags & MULTIGPU_PFAULT_OP)
+		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_fault_test_wrapper, flags);
 }
 
 struct section {
@@ -1026,6 +1169,8 @@ int igt_main()
 		{ "latency-prefetch", MULTIGPU_PREFETCH | MULTIGPU_PERF_OP },
 		{ "latency-copy-prefetch",
 		  MULTIGPU_PREFETCH | MULTIGPU_PERF_OP | MULTIGPU_PERF_REM_COPY },
+		{ "pagefault-basic", MULTIGPU_PFAULT_OP },
+		{ "pagefault-prefetch", MULTIGPU_PREFETCH | MULTIGPU_PFAULT_OP },
 		{ NULL },
 	};
 
-- 
2.48.1

