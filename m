Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A85C2A07F
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 08:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE82010E3A9;
	Mon,  5 Jan 2026 08:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ckd+4tMb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F5C10E3AC
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 08:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767602872; x=1799138872;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=lTeWwDDnR3tiZCh6aXhJgLwEExEEX26XiFuK4PrvFN8=;
 b=ckd+4tMb35GLufiSOhGTAA5k/5bJFDYkmLT3eM1pWr/ahXIZIxTKAWR+
 fiPSYkQL7ST+Oe/2XpmEjnXbTyAsQG2V2qMWnFp+oFHGF6EGC6bFWlPqN
 YX+JweiymF57/bg9trsV2qZLw6y+lElLUSnwoQ4T6mmlDAmM9pNhQCtIS
 SpMUybizME1PWYq4KyCserIKDCmQHIsoTPIf5QxJlaa/aSqpLuKLt9uFE
 csf1KC1uxAQs2Do8ID3FmZ1cJ0dZzcG/GNeWJSw3/kHIUUIEnjCJ8QBDj
 Kc524Ehet2y3Enin/yQ2K4XnGp/AtdmXlk9SaVzXjPeJYbbSMU/PUzwze Q==;
X-CSE-ConnectionGUID: wYu4oz4LQva5qJIrQLdQCw==
X-CSE-MsgGUID: BIAl9dAKQmq/Xwwxt2Oz1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="72814614"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="72814614"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 00:47:52 -0800
X-CSE-ConnectionGUID: uz4Awp1ySRS+NpWEBKDKkw==
X-CSE-MsgGUID: 2aMKmt0lRNyjneUxwFnfEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="225873352"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.84.79])
 by fmviesa002.fm.intel.com with ESMTP; 05 Jan 2026 00:47:51 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t v14 10/11] tests/intel/xe_multigpu_svm: Add SVM
 multi-GPU conflicting madvise test
Date: Mon,  5 Jan 2026 08:47:49 +0000
Message-ID: <20260105084750.190346-11-nishit.sharma@intel.com>
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

This test calls madvise operations on GPU0 with the preferred location set
to GPU1 and vice versa. It reports conflicts when conflicting memory advice
is given for shared SVM buffers in a multi-GPU environment.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel/xe_multigpu_svm.c | 74 ++++++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 23 deletions(-)

diff --git a/tests/intel/xe_multigpu_svm.c b/tests/intel/xe_multigpu_svm.c
index 856af1615..832f0a729 100644
--- a/tests/intel/xe_multigpu_svm.c
+++ b/tests/intel/xe_multigpu_svm.c
@@ -113,6 +113,19 @@
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
+ * SUBTEST: mgpu-pagefault-conflict
+ * Description:
+ *	Multi-GPU page fault test with conflicting madvise regions
+ *
  */
 
 #define MAX_XE_REGIONS	8
@@ -126,6 +139,9 @@
 #define BATCH_VALUE	60
 #define NUM_ITER	200
 
+#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
+#define FIVE_SEC                (5LL * NSEC_PER_SEC)
+
 #define MULTIGPU_PREFETCH		BIT(1)
 #define MULTIGPU_XGPU_ACCESS		BIT(2)
 #define MULTIGPU_ATOMIC_OP		BIT(3)
@@ -135,6 +151,7 @@
 #define MULTIGPU_PERF_REM_COPY		BIT(7)
 #define MULTIGPU_PFAULT_OP		BIT(8)
 #define MULTIGPU_CONC_ACCESS		BIT(9)
+#define MULTIGPU_CONFLICT		BIT(10)
 
 #define INIT	2
 #define STORE	3
@@ -484,7 +501,8 @@ store_dword_batch_init_1k(int fd, uint32_t vm, uint64_t src_addr,
 }
 
 static void
-gpu_madvise_exec_sync(struct xe_svm_gpu_info *gpu, uint32_t vm, uint32_t exec_queue,
+gpu_madvise_exec_sync(struct xe_svm_gpu_info *gpu, struct xe_svm_gpu_info *xgpu,
+		      uint32_t vm, uint32_t exec_queue,
 		      uint64_t dst_addr, uint64_t *batch_addr, unsigned int flags,
 		      double *perf)
 {
@@ -492,9 +510,15 @@ gpu_madvise_exec_sync(struct xe_svm_gpu_info *gpu, uint32_t vm, uint32_t exec_qu
 	struct timespec t_start, t_end;
 	uint64_t *sync_addr;
 
-	xe_multigpu_madvise(gpu->fd, vm, dst_addr, SZ_4K, 0,
-			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
-			    gpu->fd, 0, gpu->vram_regions[0], exec_queue);
+	if (flags & MULTIGPU_CONFLICT) {
+		xe_multigpu_madvise(gpu->fd, vm, dst_addr, SZ_4K, 0,
+				    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+				    xgpu->fd, 0, xgpu->vram_regions[0], exec_queue);
+	} else {
+		xe_multigpu_madvise(gpu->fd, vm, dst_addr, SZ_4K, 0,
+				    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+				    gpu->fd, 0, gpu->vram_regions[0], exec_queue);
+	}
 
 	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
 	xe_multigpu_prefetch(gpu->fd, vm, dst_addr, SZ_4K, &sync,
@@ -646,17 +670,14 @@ atomic_inc_op(struct xe_svm_gpu_info *gpu1,
 			 &batch_bo[0], &batch_addr[0], flags, ATOMIC);
 
 	/*GPU1: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu1, vm[0], exec_queue[0], addr, &batch_addr[0], flags, NULL);
+	gpu_madvise_exec_sync(gpu1, gpu2, vm[0], exec_queue[0], addr, &batch_addr[0], flags, NULL);
 
-	/* GPU2 --> copy from GPU1 */
 	gpu_batch_create(gpu2, vm[1], exec_queue[1], addr, to_user_pointer(copy_dst),
 			 &batch_bo[1], &batch_addr[1], flags, INIT);
 
-	/*GPU2: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(copy_dst),
+	gpu_madvise_exec_sync(gpu2, gpu1, vm[1], exec_queue[1], to_user_pointer(copy_dst),
 			      &batch_addr[1], flags, NULL);
 
-	/* NOW CPU can read copy_dst (GPU2 ATOMIC op) */
 	final_value = *(uint32_t *)copy_dst;
 	igt_assert_eq(final_value, ATOMIC_OP_VAL);
 
@@ -665,7 +686,8 @@ atomic_inc_op(struct xe_svm_gpu_info *gpu1,
 			 &batch_bo[1], &batch_addr[1], flags, ATOMIC);
 
 	/*GPU2: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(copy_dst),
+	gpu_madvise_exec_sync(gpu2, gpu1, vm[1], exec_queue[1],
+			      to_user_pointer(copy_dst),
 			      &batch_addr[1], flags, NULL);
 
 	/* GPU1 --> copy from GPU2 */
@@ -673,10 +695,11 @@ atomic_inc_op(struct xe_svm_gpu_info *gpu1,
 			 &batch_bo[0], &batch_addr[0], flags, INIT);
 
 	/*GPU1: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu1, vm[0], exec_queue[1], addr, &batch_addr[0], flags, NULL);
+	gpu_madvise_exec_sync(gpu1, gpu2, vm[0], exec_queue[0], addr,
+			      &batch_addr[0], flags, NULL);
 
-	/* NOW CPU can read addr (GPU1 ATOMIC op) */
 	final_value = *(uint32_t *)addr;
+	/* NOW CPU can read copy_dst (GPU1 ATOMIC op) */
 	igt_assert_eq(final_value, ATOMIC_OP_VAL + 1);
 
 	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
@@ -724,7 +747,7 @@ coherency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 			 &batch_bo[0], &batch_addr[0], flags, DWORD);
 
 	/*GPU1: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu1, vm[0], exec_queue[0], addr, &batch_addr[0],
+	gpu_madvise_exec_sync(gpu1, gpu2, vm[0], exec_queue[0], addr, &batch_addr[0],
 			      flags, NULL);
 
 	/* GPU2 --> copy from GPU1 */
@@ -732,11 +755,11 @@ coherency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 			 &batch_bo[1], &batch_addr[1], flags, INIT);
 
 	/*GPU2: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(copy_dst),
+	gpu_madvise_exec_sync(gpu2, gpu1, vm[1], exec_queue[1], to_user_pointer(copy_dst),
 			      &batch_addr[1], flags, NULL);
 
-	/* verifying copy_dst (GPU2 INIT op) have correct value */
 	final_value = READ_ONCE(*(uint32_t *)copy_dst);
+	/* verifying copy_dst (GPU2 INIT op) have correct value */
 	igt_assert_eq(final_value, BATCH_VALUE);
 
 	if (flags & MULTIGPU_COH_FAIL) {
@@ -792,7 +815,7 @@ coherency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 				 &batch_bo[1], &batch_addr[1], flags, INIT);
 
 		/*GPU2: Madvise and Prefetch Ops */
-		gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(result),
+		gpu_madvise_exec_sync(gpu2, gpu1, vm[1], exec_queue[1], to_user_pointer(result),
 				      &batch_addr[1], flags, NULL);
 
 		/* Check which write won (or if we got a mix) */
@@ -864,7 +887,7 @@ latency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 			 &batch_bo[0], &batch_addr[0], flags, DWORD);
 
 	/*GPU1: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu1, vm[0], exec_queue[0], addr, &batch_addr[0],
+	gpu_madvise_exec_sync(gpu1, gpu2, vm[0], exec_queue[0], addr, &batch_addr[0],
 			      flags, &gpu1_latency);
 
 	gpu1_bw = (SZ_1K / (gpu1_latency / 1e9)) / (1024.0 * 1024.0); //Written 1k
@@ -886,7 +909,7 @@ latency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 				 &batch_bo[1], &batch_addr[1], flags, INIT);
 
 		/*GPU2: Madvise and Prefetch Ops */
-		gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(copy_dst),
+		gpu_madvise_exec_sync(gpu2, gpu1, vm[1], exec_queue[1], to_user_pointer(copy_dst),
 				      &batch_addr[1], flags, &gpu2_latency);
 
 		gpu2_bw = (SZ_1K / (gpu2_latency / 1e9)) / (1024.0 * 1024.0);
@@ -898,15 +921,15 @@ latency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 				 &batch_bo[0], &batch_addr[0], flags, DWORD);
 
 		/*GPU1: Madvise and Prefetch Ops */
-		gpu_madvise_exec_sync(gpu1, vm[0], exec_queue[0], addr, &batch_addr[0],
-				      flags, &gpu1_latency);
+		gpu_madvise_exec_sync(gpu1, gpu2, vm[0], exec_queue[0], addr,
+				      &batch_addr[0], flags, &gpu1_latency);
 
 		/*GPU2: Copy data from addr (written by GPU1) to its own buffer (copy_dst) */
 		gpu_batch_create(gpu2, vm[1], exec_queue[1], addr, to_user_pointer(copy_dst),
 				 &batch_bo[1], &batch_addr[1], flags, INIT);
 
 		/*GPU2: Madvise and Prefetch Ops */
-		gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(copy_dst),
+		gpu_madvise_exec_sync(gpu2, gpu1, vm[1], exec_queue[1], to_user_pointer(copy_dst),
 				      &batch_addr[1], flags, &gpu2_latency);
 
 		gpu2_latency += gpu1_latency;
@@ -1012,7 +1035,8 @@ pagefault_test_multigpu(struct xe_svm_gpu_info *gpu1,
 			 &batch_bo[0], &batch_addr[0], flags, DWORD);
 
 	/*GPU1: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu1, vm[0], exec_queue[0], addr, &batch_addr[0], flags, NULL);
+	gpu_madvise_exec_sync(gpu1, gpu2, vm[0], exec_queue[0], addr, &batch_addr[0],
+			      flags, NULL);
 
 	pf_count_gpu1_after = xe_gt_stats_get_count(gpu1->fd, eci->gt_id, pf_count_stat);
 
@@ -1049,7 +1073,8 @@ pagefault_test_multigpu(struct xe_svm_gpu_info *gpu1,
 	free(sync_addr);
 
 	/*GPU2: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], addr1, &batch_addr[1], flags, NULL);
+	gpu_madvise_exec_sync(gpu2, gpu1, vm[1], exec_queue[1], addr1, &batch_addr[1],
+			      flags, NULL);
 
 	pf_count_gpu2_after = xe_gt_stats_get_count(gpu2->fd, eci->gt_id, pf_count_stat);
 
@@ -1349,9 +1374,11 @@ int igt_main()
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
@@ -1362,6 +1389,7 @@ int igt_main()
 		  MULTIGPU_PREFETCH | MULTIGPU_PERF_OP | MULTIGPU_PERF_REM_COPY },
 		{ "pagefault-basic", MULTIGPU_PFAULT_OP },
 		{ "pagefault-prefetch", MULTIGPU_PREFETCH | MULTIGPU_PFAULT_OP },
+		{ "pagefault-conflict", MULTIGPU_CONFLICT | MULTIGPU_PFAULT_OP },
 		{ "concurrent-access-basic", MULTIGPU_CONC_ACCESS },
 		{ "concurrent-access-prefetch", MULTIGPU_PREFETCH | MULTIGPU_CONC_ACCESS },
 		{ NULL },
-- 
2.48.1

