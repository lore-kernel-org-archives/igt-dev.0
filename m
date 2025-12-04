Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04876D1D86C
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 05:10:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AB210E840;
	Thu,  4 Dec 2025 05:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dbLbpHqE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E8210E83C
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 05:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764825053; x=1796361053;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MFhNhxAUR68FGLRqnztrpHxf8nkxzTvbXLYMjtKAll4=;
 b=dbLbpHqE5+nkxr1qGzGz55pbzVZXTFRGskGmKiSsekuNJhnpvzRRmxfV
 n82YYN+VB3rfKmAlkLpkpm+nVdC/tIv+r9CvjiN08/fDYph3nmlN6jero
 w8gr08DERsNI1X1ylbcqcOSaPcVKBf5VPhEpGs9STcqKmTB2xs0ZOmaVd
 byUq7/Z/v2rI9g84XCpfDicJPpfMb3UQufZTj85Y0Bej7f7PTxXXcH5fv
 ElKWSaFWoMq4py4K6vrrkMCBsxeb27LQ/PrqWGHGyYctSKKJoCb+HENZz
 pJB4jkezFXXxMQmG/7J/Au2lNAjWXha5o1HsLRzLdbPD9EroolMDPWs4K w==;
X-CSE-ConnectionGUID: R2jfuBs9TLepcZy7bnQecA==
X-CSE-MsgGUID: nmLN9svlS8GvBNcNKhO2HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="92314042"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="92314042"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 21:10:52 -0800
X-CSE-ConnectionGUID: NNPpN8beQkWrscr/GcEpPA==
X-CSE-MsgGUID: R9tdKCMPT1qknba7caoYwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="195678364"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.43])
 by fmviesa010.fm.intel.com with ESMTP; 03 Dec 2025 21:10:51 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH v11 09/10] tests/intel/xe_multigpu_svm: Add SVM multi-GPU
 conflicting madvise test
Date: Thu,  4 Dec 2025 05:10:50 +0000
Message-ID: <20251204051051.27495-10-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251204051051.27495-1-nishit.sharma@intel.com>
References: <20251204051051.27495-1-nishit.sharma@intel.com>
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

This test calls madvise operations on GPU0 with the preferred location set
to GPU1 and vice versa. It reports conflicts when conflicting memory advice
is given for shared SVM buffers in a multi-GPU environment.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel/xe_multigpu_svm.c | 91 +++++++++++++++++++++++++----------
 1 file changed, 65 insertions(+), 26 deletions(-)

diff --git a/tests/intel/xe_multigpu_svm.c b/tests/intel/xe_multigpu_svm.c
index bf57fae7d..0ad4b336d 100644
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
@@ -478,7 +495,8 @@ store_dword_batch_init_1k(int fd, uint32_t vm, uint64_t src_addr,
 }
 
 static void
-gpu_madvise_exec_sync(struct xe_svm_gpu_info *gpu, uint32_t vm, uint32_t exec_queue,
+gpu_madvise_exec_sync(struct xe_svm_gpu_info *gpu, struct xe_svm_gpu_info *xgpu,
+		      uint32_t vm, uint32_t exec_queue,
 		      uint64_t dst_addr, uint64_t *batch_addr, unsigned int flags,
 		      void *perf)
 {
@@ -486,9 +504,15 @@ gpu_madvise_exec_sync(struct xe_svm_gpu_info *gpu, uint32_t vm, uint32_t exec_qu
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
@@ -640,26 +664,27 @@ atomic_inc_op(struct xe_svm_gpu_info *gpu1,
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
-	igt_assert_eq(final_value, ATOMIC_OP_VAL);
+	if ((flags & MULTIGPU_CONFLICT))
+		igt_info("Buffer inaccesible in conflict madvise\n");
+	else
+		igt_assert_eq(final_value, ATOMIC_OP_VAL);
 
 	/* GPU2: Atomic Batch create */
 	gpu_batch_create(gpu2, vm[1], exec_queue[1], to_user_pointer(copy_dst), 0,
 			 &batch_bo[1], &batch_addr[1], flags, ATOMIC);
 
 	/*GPU2: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(copy_dst),
+	gpu_madvise_exec_sync(gpu2, gpu1, vm[1], exec_queue[1],
+			      to_user_pointer(copy_dst),
 			      &batch_addr[1], flags, NULL);
 
 	/* GPU1 --> copy from GPU2 */
@@ -667,11 +692,16 @@ atomic_inc_op(struct xe_svm_gpu_info *gpu1,
 			 &batch_bo[0], &batch_addr[0], flags, INIT);
 
 	/*GPU1: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu1, vm[0], exec_queue[1], addr, &batch_addr[0], flags, NULL);
+	gpu_madvise_exec_sync(gpu1, gpu2, vm[0], exec_queue[0], addr,
+			      &batch_addr[0], flags, NULL);
 
-	/* NOW CPU can read addr (GPU1 ATOMIC op) */
 	final_value = *(uint32_t *)addr;
-	igt_assert_eq(final_value, ATOMIC_OP_VAL + 1);
+	if ((flags & MULTIGPU_CONFLICT)) {
+		igt_info("Buffer inaccesible in conflict madvise\n");
+	} else {
+		/* NOW CPU can read copy_dst (GPU1 ATOMIC op) */
+		igt_assert_eq(final_value, ATOMIC_OP_VAL + 1);
+	}
 
 	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
 	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
@@ -718,7 +748,7 @@ coherency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 			 &batch_bo[0], &batch_addr[0], flags, DWORD);
 
 	/*GPU1: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu1, vm[0], exec_queue[0], addr, &batch_addr[0],
+	gpu_madvise_exec_sync(gpu1, gpu2, vm[0], exec_queue[0], addr, &batch_addr[0],
 			      flags, NULL);
 
 	/* GPU2 --> copy from GPU1 */
@@ -726,12 +756,16 @@ coherency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 			 &batch_bo[1], &batch_addr[1], flags, INIT);
 
 	/*GPU2: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(copy_dst),
+	gpu_madvise_exec_sync(gpu2, gpu1, vm[1], exec_queue[1], to_user_pointer(copy_dst),
 			      &batch_addr[1], flags, NULL);
 
-	/* verifying copy_dst (GPU2 INIT op) have correct value */
 	final_value = READ_ONCE(*(uint32_t *)copy_dst);
-	igt_assert_eq(final_value, BATCH_VALUE);
+	if (flags & MULTIGPU_CONFLICT) {
+		igt_info("Buffer not accessible in conflict madvise\n");
+	} else {
+		/* verifying copy_dst (GPU2 INIT op) have correct value */
+		igt_assert_eq(final_value, BATCH_VALUE);
+	}
 
 	if (flags & MULTIGPU_COH_FAIL) {
 		struct drm_xe_sync sync0 = {}, sync1 = {};
@@ -786,7 +820,7 @@ coherency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 				 &batch_bo[1], &batch_addr[1], flags, INIT);
 
 		/*GPU2: Madvise and Prefetch Ops */
-		gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(result),
+		gpu_madvise_exec_sync(gpu2, gpu1, vm[1], exec_queue[1], to_user_pointer(result),
 				      &batch_addr[1], flags, NULL);
 
 		/* Check which write won (or if we got a mix) */
@@ -858,7 +892,7 @@ latency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 			 &batch_bo[0], &batch_addr[0], flags, DWORD);
 
 	/*GPU1: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu1, vm[0], exec_queue[0], addr, &batch_addr[0],
+	gpu_madvise_exec_sync(gpu1, gpu2, vm[0], exec_queue[0], addr, &batch_addr[0],
 			      flags, &gpu1_latency);
 
 	gpu1_bw = (SZ_1K / (gpu1_latency / 1e9)) / (1024.0 * 1024.0); //Written 1k
@@ -880,7 +914,7 @@ latency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 				 &batch_bo[1], &batch_addr[1], flags, INIT);
 
 		/*GPU2: Madvise and Prefetch Ops */
-		gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(copy_dst),
+		gpu_madvise_exec_sync(gpu2, gpu1, vm[1], exec_queue[1], to_user_pointer(copy_dst),
 				      &batch_addr[1], flags, &gpu2_latency);
 
 		gpu2_bw = (SZ_1K / (gpu2_latency / 1e9)) / (1024.0 * 1024.0);
@@ -892,15 +926,15 @@ latency_test_multigpu(struct xe_svm_gpu_info *gpu1,
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
@@ -1006,7 +1040,8 @@ pagefault_test_multigpu(struct xe_svm_gpu_info *gpu1,
 			 &batch_bo[0], &batch_addr[0], flags, DWORD);
 
 	/*GPU1: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu1, vm[0], exec_queue[0], addr, &batch_addr[0], flags, NULL);
+	gpu_madvise_exec_sync(gpu1, gpu2, vm[0], exec_queue[0], addr, &batch_addr[0],
+			      flags, NULL);
 
 	pf_count_gpu1_after = xe_gt_stats_get_count(gpu1->fd, eci->gt_id, pf_count_stat);
 
@@ -1042,7 +1077,8 @@ pagefault_test_multigpu(struct xe_svm_gpu_info *gpu1,
 	free(sync_addr);
 
 	/*GPU2: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], addr1, &batch_addr[1], flags, NULL);
+	gpu_madvise_exec_sync(gpu2, gpu1, vm[1], exec_queue[1], addr1, &batch_addr[1],
+			      flags, NULL);
 
 	pf_count_gpu2_after = xe_gt_stats_get_count(gpu2->fd, eci->gt_id, pf_count_stat);
 
@@ -1341,9 +1377,11 @@ igt_main
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
@@ -1354,6 +1392,7 @@ igt_main
 		  MULTIGPU_PREFETCH | MULTIGPU_PERF_OP | MULTIGPU_PERF_REM_COPY },
 		{ "pagefault-basic", MULTIGPU_PFAULT_OP },
 		{ "pagefault-prefetch", MULTIGPU_PREFETCH | MULTIGPU_PFAULT_OP },
+		{ "pagefault-conflict", MULTIGPU_CONFLICT | MULTIGPU_PFAULT_OP },
 		{ "concurrent-access-basic", MULTIGPU_CONC_ACCESS },
 		{ "concurrent-access-prefetch", MULTIGPU_PREFETCH | MULTIGPU_CONC_ACCESS },
 		{ NULL },
-- 
2.48.1

