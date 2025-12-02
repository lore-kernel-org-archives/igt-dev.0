Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14356D11702
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 15:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F87B10E686;
	Tue,  2 Dec 2025 15:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YWfZzr14";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9344910E686
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 15:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764691193; x=1796227193;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=05SMv2/OsndKvBbh4c1o8t1UVBfzQe2c6QRue/I05Pc=;
 b=YWfZzr14tWoAYz8xpHZMXebS/bYFnMtUZZJjJrylZUu8yfOD9by/pbQL
 7cU8GowPiNpaEd1MbIffHyngY2tG9SU4A9wsCiirK6lLSFnyOHecjFFew
 saSFpOxgfb/FNokwkHc/HHkak8UZjWyoVAyPdzo378tUu+wQG8zhL5Tm/
 eKWBHUxFBTl44+Lx/6yI4qbEOKpSsnB10Fei25FSEj+7sa0lEq/VhJFm4
 JYVk0XG0J95nrc1wip91bjthiEsa5khM9Cfth7rIErymK/r6L/V5glf69
 5TW2duQrpSNoNhXGc7cCWqPhWP18OCYEP3kdCIyOy7ZMLPc7OkEYyXys4 Q==;
X-CSE-ConnectionGUID: JC9t8XyaQVS58tTHioMhEA==
X-CSE-MsgGUID: UdftynTeSiWyhWOdPw+L4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="84059542"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="84059542"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 07:59:52 -0800
X-CSE-ConnectionGUID: eyqP/albSi6gvmVh/qHoLA==
X-CSE-MsgGUID: mZJXmz59QdSxNVkRw4U4tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="198600793"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.43])
 by orviesa003.jf.intel.com with ESMTP; 02 Dec 2025 07:59:52 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Subject: [PATCH v10 09/10] tests/intel/xe_multigpu_svm: Add SVM multi-GPU
 conflicting madvise test
Date: Tue,  2 Dec 2025 15:59:50 +0000
Message-ID: <20251202155951.21369-10-nishit.sharma@intel.com>
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

This test calls madvise operations on GPU0 with the preferred location set
to GPU1 and vice versa. It reports conflicts when conflicting memory advice
is given for shared SVM buffers in a multi-GPU environment.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel/xe_multigpu_svm.c | 157 +++++++++++++++++++++++++---------
 1 file changed, 116 insertions(+), 41 deletions(-)

diff --git a/tests/intel/xe_multigpu_svm.c b/tests/intel/xe_multigpu_svm.c
index ccf05b05c..e412bbf3c 100644
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
@@ -480,15 +497,22 @@ store_dword_batch_init_1k(int fd, uint32_t vm, uint64_t src_addr,
 }
 
 static void
-gpu_madvise_exec_sync(struct xe_svm_gpu_info *gpu, uint32_t vm, uint32_t exec_queue,
+gpu_madvise_exec_sync(struct xe_svm_gpu_info *gpu, struct xe_svm_gpu_info *xgpu,
+		      uint32_t vm, uint32_t exec_queue,
 		      uint64_t dst_addr, uint64_t *batch_addr, unsigned int flags)
 {
 	struct drm_xe_sync sync = {};
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
@@ -640,38 +664,70 @@ atomic_inc_op(struct xe_svm_gpu_info *gpu1,
 			 &batch_bo[0], &batch_addr[0], flags, ATOMIC);
 
 	/*GPU1: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu1, vm[0], exec_queue[0], addr, &batch_addr[0], flags);
+	gpu_madvise_exec_sync(gpu1, gpu2, vm[0], exec_queue[0], addr, &batch_addr[0], flags);
 
-	/* GPU2 --> copy from GPU1 */
-	gpu_batch_create(gpu2, vm[1], exec_queue[1], addr, to_user_pointer(copy_dst),
-			 &batch_bo[1], &batch_addr[1], flags, INIT);
+	if (flags & MULTIGPU_CONFLICT) {
+		/* GPU2: Atomic Batch create */
+		gpu_batch_create(gpu2, vm[1], exec_queue[1], addr, 0,
+				 &batch_bo[1], &batch_addr[1], flags, ATOMIC);
 
-	/*GPU2: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(copy_dst),
-			      &batch_addr[1], flags);
+		gpu_madvise_exec_sync(gpu2, gpu1, vm[1], exec_queue[1], addr,
+				      &batch_addr[1], flags);
+	} else {
+		/* GPU2 --> copy from GPU1 */
+		gpu_batch_create(gpu2, vm[1], exec_queue[1], addr, to_user_pointer(copy_dst),
+				 &batch_bo[1], &batch_addr[1], flags, INIT);
 
-	/* NOW CPU can read copy_dst (GPU2 ATOMIC op) */
-	final_value = *(uint32_t *)copy_dst;
-	igt_assert_eq(final_value, ATOMIC_OP_VAL);
+		gpu_madvise_exec_sync(gpu2, gpu1, vm[1], exec_queue[1], to_user_pointer(copy_dst),
+				      &batch_addr[1], flags);
+	}
+
+	if (flags & MULTIGPU_CONFLICT) {
+		final_value = *(uint32_t *)addr;
+		/* NOW CPU can read copy_dst (GPU2 ATOMIC op) */
+		igt_assert_eq(final_value, ATOMIC_OP_VAL + 1);
+	} else {
+		final_value = *(uint32_t *)copy_dst;
+		/* NOW CPU can read copy_dst (GPU2 ATOMIC op) */
+		igt_assert_eq(final_value, ATOMIC_OP_VAL);
+	}
 
 	/* GPU2: Atomic Batch create */
-	gpu_batch_create(gpu2, vm[1], exec_queue[1], to_user_pointer(copy_dst), 0,
-			 &batch_bo[1], &batch_addr[1], flags, ATOMIC);
+	gpu_batch_create(gpu2, vm[1], exec_queue[1],
+			 (flags & MULTIGPU_CONFLICT) ? to_user_pointer(copy_dst) : addr,
+			 0, &batch_bo[1], &batch_addr[1], flags, ATOMIC);
 
 	/*GPU2: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(copy_dst),
+	gpu_madvise_exec_sync(gpu2, gpu1, vm[1], exec_queue[1],
+			      (flags & MULTIGPU_CONFLICT) ? to_user_pointer(copy_dst) : addr,
 			      &batch_addr[1], flags);
 
-	/* GPU1 --> copy from GPU2 */
-	gpu_batch_create(gpu1, vm[0], exec_queue[0], to_user_pointer(copy_dst), addr,
-			 &batch_bo[0], &batch_addr[0], flags, INIT);
+	if (flags & MULTIGPU_CONFLICT) {
+		/* GPU1: Atomic Batch create */
+		gpu_batch_create(gpu1, vm[0], exec_queue[0], addr,
+				 0, &batch_bo[0], &batch_addr[0], flags, ATOMIC);
 
-	/*GPU1: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu1, vm[0], exec_queue[1], addr, &batch_addr[0], flags);
+		gpu_madvise_exec_sync(gpu1, gpu2, vm[0], exec_queue[1], addr,
+				      &batch_addr[0], flags);
+	} else {
+		/* GPU1 --> copy from GPU2 */
+		gpu_batch_create(gpu1, vm[0], exec_queue[0], to_user_pointer(copy_dst), addr,
+				 &batch_bo[0], &batch_addr[0], flags, INIT);
+
+		/*GPU1: Madvise and Prefetch Ops */
+		gpu_madvise_exec_sync(gpu1, gpu2, vm[0], exec_queue[0], addr,
+				      &batch_addr[0], flags);
+	}
 
-	/* NOW CPU can read addr (GPU1 ATOMIC op) */
-	final_value = *(uint32_t *)addr;
-	igt_assert_eq(final_value, ATOMIC_OP_VAL + 1);
+	if (flags & MULTIGPU_CONFLICT) {
+		final_value = *(uint32_t *)addr;
+		/* NOW CPU can read copy_dst (GPU1 ATOMIC op) */
+		igt_assert_eq(final_value, ATOMIC_OP_VAL + 2);
+	} else {
+		final_value = *(uint32_t *)copy_dst;
+		/* NOW CPU can read copy_dst (GPU1 ATOMIC op) */
+		igt_assert_eq(final_value, ATOMIC_OP_VAL);
+	}
 
 	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
 	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
@@ -718,18 +774,33 @@ coherency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 			 &batch_bo[0], &batch_addr[0], flags, DWORD);
 
 	/*GPU1: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu1, vm[0], exec_queue[0], addr, &batch_addr[0], flags);
+	gpu_madvise_exec_sync(gpu1, gpu2, vm[0], exec_queue[0], addr, &batch_addr[0], flags);
 
-	/* GPU2 --> copy from GPU1 */
-	gpu_batch_create(gpu2, vm[1], exec_queue[1], addr, to_user_pointer(copy_dst),
-			 &batch_bo[1], &batch_addr[1], flags, INIT);
+	if (flags & MULTIGPU_CONFLICT) {
+		/* GPU2: Creating batch with DWORD + 10 */
+		gpu_batch_create(gpu2, vm[1], exec_queue[1], addr, 0,
+				 &batch_bo[1], &batch_addr[1], flags, DWORD);
+		gpu_madvise_exec_sync(gpu2, gpu1, vm[1], exec_queue[1], addr,
+				      &batch_addr[1], flags);
+	} else {
+		/* GPU2 --> copy from GPU1 */
+		gpu_batch_create(gpu2, vm[1], exec_queue[1], addr, to_user_pointer(copy_dst),
+				 &batch_bo[1], &batch_addr[1], flags, INIT);
 
-	/*GPU2: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(copy_dst),
-			      &batch_addr[1], flags);
+		/*GPU2: Madvise and Prefetch Ops */
+		gpu_madvise_exec_sync(gpu2, gpu1, vm[1], exec_queue[1], to_user_pointer(copy_dst),
+				      &batch_addr[1], flags);
+	}
+
+	if (flags & MULTIGPU_CONFLICT) {
+		/* verifying addr (GPU2 INIT op) have correct value */
+		final_value = READ_ONCE(*(uint32_t *)addr);
+
+	} else {
+		/* verifying copy_dst (GPU2 INIT op) have correct value */
+		final_value = READ_ONCE(*(uint32_t *)copy_dst);
+	}
 
-	/* verifying copy_dst (GPU2 INIT op) have correct value */
-	final_value = READ_ONCE(*(uint32_t *)copy_dst);
 	igt_assert_eq(final_value, BATCH_VALUE);
 
 	if (flags & MULTIGPU_COH_FAIL) {
@@ -785,7 +856,7 @@ coherency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 				 &batch_bo[1], &batch_addr[1], flags, INIT);
 
 		/*GPU2: Madvise and Prefetch Ops */
-		gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(result),
+		gpu_madvise_exec_sync(gpu2, gpu1, vm[1], exec_queue[1], to_user_pointer(result),
 				      &batch_addr[1], flags);
 
 		/* Check which write won (or if we got a mix) */
@@ -858,7 +929,7 @@ latency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 			 &batch_bo[0], &batch_addr[0], flags, DWORD);
 
 	/*GPU1: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu1, vm[0], exec_queue[0], addr, &batch_addr[0], flags);
+	gpu_madvise_exec_sync(gpu1, gpu2, vm[0], exec_queue[0], addr, &batch_addr[0], flags);
 
 	gpu1_latency += time_diff(&t_start, &t_end);
 	gpu1_bw = (SZ_1K / (gpu1_latency / 1e9)) / (1024.0 * 1024.0); //Written 1k
@@ -881,7 +952,7 @@ latency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 				 &batch_bo[1], &batch_addr[1], flags, INIT);
 
 		/*GPU2: Madvise and Prefetch Ops */
-		gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(copy_dst),
+		gpu_madvise_exec_sync(gpu2, gpu1, vm[1], exec_queue[1], to_user_pointer(copy_dst),
 				      &batch_addr[1], flags);
 
 		gpu2_latency += time_diff(&t_start, &t_end);
@@ -894,7 +965,8 @@ latency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 				 &batch_bo[0], &batch_addr[0], flags, DWORD);
 
 		/*GPU1: Madvise and Prefetch Ops */
-		gpu_madvise_exec_sync(gpu1, vm[0], exec_queue[0], addr, &batch_addr[0], flags);
+		gpu_madvise_exec_sync(gpu1, gpu2, vm[0], exec_queue[0], addr,
+				      &batch_addr[0], flags);
 
 		gpu2_latency = time_diff(&t_start, &t_end);
 
@@ -903,7 +975,7 @@ latency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 				 &batch_bo[1], &batch_addr[1], flags, INIT);
 
 		/*GPU2: Madvise and Prefetch Ops */
-		gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(copy_dst),
+		gpu_madvise_exec_sync(gpu2, gpu1, vm[1], exec_queue[1], to_user_pointer(copy_dst),
 				      &batch_addr[1], flags);
 
 		gpu2_latency += time_diff(&t_start, &t_end);
@@ -1010,7 +1082,7 @@ pagefault_test_multigpu(struct xe_svm_gpu_info *gpu1,
 			 &batch_bo[0], &batch_addr[0], flags, DWORD);
 
 	/*GPU1: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu1, vm[0], exec_queue[0], addr, &batch_addr[0], flags);
+	gpu_madvise_exec_sync(gpu1, gpu2, vm[0], exec_queue[0], addr, &batch_addr[0], flags);
 
 	pf_count_gpu1_after = xe_gt_stats_get_count(gpu1->fd, eci->gt_id, pf_count_stat);
 
@@ -1049,7 +1121,7 @@ pagefault_test_multigpu(struct xe_svm_gpu_info *gpu1,
 	free(sync_addr);
 
 	/*GPU2: Madvise and Prefetch Ops */
-	gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], addr1, &batch_addr[1], flags);
+	gpu_madvise_exec_sync(gpu2, gpu1, vm[1], exec_queue[1], addr1, &batch_addr[1], flags);
 
 	pf_count_gpu2_after = xe_gt_stats_get_count(gpu2->fd, eci->gt_id, pf_count_stat);
 
@@ -1348,9 +1420,11 @@ igt_main
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
@@ -1361,6 +1435,7 @@ igt_main
 		  MULTIGPU_PREFETCH | MULTIGPU_PERF_OP | MULTIGPU_PERF_REM_COPY },
 		{ "pagefault-basic", MULTIGPU_PFAULT_OP },
 		{ "pagefault-prefetch", MULTIGPU_PREFETCH | MULTIGPU_PFAULT_OP },
+		{ "pagefault-conflict", MULTIGPU_CONFLICT | MULTIGPU_PFAULT_OP },
 		{ "concurrent-access-basic", MULTIGPU_CONC_ACCESS },
 		{ "concurrent-access-prefetch", MULTIGPU_PREFETCH | MULTIGPU_CONC_ACCESS },
 		{ NULL },
-- 
2.48.1

