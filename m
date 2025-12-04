Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50E6D1F9A3
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 08:54:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BFB10E8F3;
	Thu,  4 Dec 2025 08:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gHmzLdVH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D56D10E068
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 08:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764838481; x=1796374481;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=AUe4i3qItFdVA3ImW9BZYZwlRh5e2ts4DnMsjOGM9r4=;
 b=gHmzLdVHofiukpR7CVgAbj41xHWtGZplbCkHwCFWXG59J2Mf5Wb2dyef
 AqwDmKLkKVptREY2G9gq491HAeaDRTLo5Iw5KmTZ/xeIfkDgxLdaSzPdz
 yd4MZVIibnO6MKdPIejtKTtRNuU3m9DxijT+J4OWiaaxRB/Xv6pwJphHO
 ktedYfmYzFT7weMrnWHrtpxlmhNWIQW+4nXNy8M7UqEkSbd8rI4JhHta7
 fD4sWMRqpabNQC4GxDiVUB+kxfi2ijFpaGtgrsJ2iJSQnSfVmGthBKshz
 CW56d0fx/s/fAC/zXxI9OOj0R38zu4C80cAA07y1exjwNem7WD3BYfwEs Q==;
X-CSE-ConnectionGUID: ltJ/9IQ3QD6+lSgMhD8lNg==
X-CSE-MsgGUID: a2zfFNqJQn61L/k+JKX/fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70703094"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="70703094"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 00:54:33 -0800
X-CSE-ConnectionGUID: K3g/8M/AQ+OeIJqJNqKLTw==
X-CSE-MsgGUID: Wlq2GwTzQB2hvLup7b3lGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="194744053"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.43])
 by orviesa009.jf.intel.com with ESMTP; 04 Dec 2025 00:54:33 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Subject: [PATCH v12 05/10] tests/intel/xe_multigpu_svm: Add SVM multi-GPU
 coherency test
Date: Thu,  4 Dec 2025 08:54:26 +0000
Message-ID: <20251204085432.35023-6-nishit.sharma@intel.com>
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

This test verifies memory coherency in a multi-GPU environment using SVM.
GPU 1 writes to a shared buffer, GPU 2 reads and checks for correct data
without explicit synchronization, and the test is repeated with CPU and
both GPUs to ensure consistent memory visibility across agents.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel/xe_multigpu_svm.c | 217 ++++++++++++++++++++++++++++++++++
 1 file changed, 217 insertions(+)

diff --git a/tests/intel/xe_multigpu_svm.c b/tests/intel/xe_multigpu_svm.c
index cdc3f4747..b48c4dd2c 100644
--- a/tests/intel/xe_multigpu_svm.c
+++ b/tests/intel/xe_multigpu_svm.c
@@ -47,6 +47,26 @@
  *	Tests cross-GPU atomic increment operations with explicit memory prefetch
  *	to validate SVM atomic operations in multi-GPU config
  *
+ * SUBTEST: mgpu-coherency-basic
+ * Description:
+ *	Test basic cross-GPU memory coherency where one GPU writes data
+ *	and another GPU reads to verify coherent memory access without prefetch
+ *
+ * SUBTEST: mgpu-coherency-fail-basic
+ * Description:
+ *	Test concurrent write race conditions between GPUs to verify coherency
+ *	behavior when multiple GPUs write to the same memory location without prefetch
+ *
+ * SUBTEST: mgpu-coherency-prefetch
+ * Description:
+ *	Test cross-GPU memory coherency with explicit prefetch to validate
+ *	coherent memory access and migration across GPUs
+ *
+ * SUBTEST: mgpu-coherency-fail-prefetch
+ * Description:
+ *	Test concurrent write race conditions with prefetch to verify coherency
+ *	behavior and memory migration when multiple GPUs compete for same location
+ *
  */
 
 #define MAX_XE_REGIONS	8
@@ -57,14 +77,18 @@
 #define EXEC_SYNC_VAL 0x676767
 #define COPY_SIZE SZ_64M
 #define	ATOMIC_OP_VAL	56
+#define BATCH_VALUE	60
 
 #define MULTIGPU_PREFETCH		BIT(1)
 #define MULTIGPU_XGPU_ACCESS		BIT(2)
 #define MULTIGPU_ATOMIC_OP		BIT(3)
+#define MULTIGPU_COH_OP			BIT(4)
+#define MULTIGPU_COH_FAIL		BIT(5)
 
 #define INIT	2
 #define STORE	3
 #define ATOMIC	4
+#define DWORD	5
 
 struct xe_svm_gpu_info {
 	bool supports_faults;
@@ -105,6 +129,11 @@ static void gpu_atomic_inc_wrapper(struct xe_svm_gpu_info *src,
 				   struct drm_xe_engine_class_instance *eci,
 				   unsigned int flags);
 
+static void gpu_coherecy_test_wrapper(struct xe_svm_gpu_info *src,
+				      struct xe_svm_gpu_info *dst,
+				      struct drm_xe_engine_class_instance *eci,
+				      unsigned int flags);
+
 static void
 create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct drm_xe_engine_class_instance *eci,
 		    uint32_t *vm, uint32_t *exec_queue)
@@ -221,6 +250,35 @@ atomic_batch_init(int fd, uint32_t vm, uint64_t src_addr,
 	*addr = batch_addr;
 }
 
+static void
+store_dword_batch_init(int fd, uint32_t vm, uint64_t src_addr,
+		       uint32_t *bo, uint64_t *addr, int value)
+{
+	uint32_t batch_bo_size = BATCH_SIZE(fd);
+	uint32_t batch_bo;
+	uint64_t batch_addr;
+	void *batch;
+	uint32_t *cmd;
+	int i = 0;
+
+	batch_bo = xe_bo_create(fd, vm, batch_bo_size, vram_if_possible(fd, 0), 0);
+	batch = xe_bo_map(fd, batch_bo, batch_bo_size);
+	cmd = (uint32_t *) batch;
+
+	cmd[i++] = MI_STORE_DWORD_IMM_GEN4;
+	cmd[i++] = src_addr;
+	cmd[i++] = src_addr >> 32;
+	cmd[i++] = value;
+	cmd[i++] = MI_BATCH_BUFFER_END;
+
+	batch_addr = to_user_pointer(batch);
+
+	/* Punch a gap in the SVM map where we map the batch_bo */
+	xe_vm_bind_lr_sync(fd, vm, batch_bo, 0, batch_addr, batch_bo_size, 0);
+	*bo = batch_bo;
+	*addr = batch_addr;
+}
+
 static void batch_init(int fd, uint32_t vm, uint64_t src_addr,
 		       uint64_t dst_addr, uint64_t copy_size,
 		       uint32_t *bo, uint64_t *addr)
@@ -356,6 +414,9 @@ gpu_batch_create(struct xe_svm_gpu_info *gpu, uint32_t vm, uint32_t exec_queue,
 	case INIT:
 		batch_init(gpu->fd, vm, src_addr, dst_addr, SZ_4K, batch_bo, batch_addr);
 		break;
+	case DWORD:
+		store_dword_batch_init(gpu->fd, vm, src_addr, batch_bo, batch_addr, BATCH_VALUE);
+		break;
 	default:
 		igt_assert(!"Unknown batch op_type");
 	}
@@ -504,6 +565,143 @@ atomic_inc_op(struct xe_svm_gpu_info *gpu1,
 	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]);
 }
 
+static void
+coherency_test_multigpu(struct xe_svm_gpu_info *gpu1,
+			struct xe_svm_gpu_info *gpu2,
+			struct drm_xe_engine_class_instance *eci,
+			unsigned int flags)
+{
+	uint64_t addr;
+	uint32_t vm[2];
+	uint32_t exec_queue[2];
+	uint32_t batch_bo[2], batch1_bo[2];
+	uint64_t batch_addr[2], batch1_addr[2];
+	uint64_t *data1;
+	void *copy_dst;
+	uint32_t final_value;
+
+	/* Skip if either GPU doesn't support faults */
+	if (mgpu_check_fault_support(gpu1, gpu2))
+		return;
+
+	create_vm_and_queue(gpu1, eci, &vm[0], &exec_queue[0]);
+	create_vm_and_queue(gpu2, eci, &vm[1], &exec_queue[1]);
+
+	data1 = aligned_alloc(SZ_2M, SZ_4K);
+	igt_assert(data1);
+	addr = to_user_pointer(data1);
+
+	copy_dst = aligned_alloc(SZ_2M, SZ_4K);
+	igt_assert(copy_dst);
+
+	/* GPU1: Creating batch with predefined value */
+	gpu_batch_create(gpu1, vm[0], exec_queue[0], addr, 0,
+			 &batch_bo[0], &batch_addr[0], flags, DWORD);
+
+	/*GPU1: Madvise and Prefetch Ops */
+	gpu_madvise_exec_sync(gpu1, vm[0], exec_queue[0], addr, &batch_addr[0],
+			      flags, NULL);
+
+	/* GPU2 --> copy from GPU1 */
+	gpu_batch_create(gpu2, vm[1], exec_queue[1], addr, to_user_pointer(copy_dst),
+			 &batch_bo[1], &batch_addr[1], flags, INIT);
+
+	/*GPU2: Madvise and Prefetch Ops */
+	gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(copy_dst),
+			      &batch_addr[1], flags, NULL);
+
+	/* verifying copy_dst (GPU2 INIT op) have correct value */
+	final_value = READ_ONCE(*(uint32_t *)copy_dst);
+	igt_assert_eq(final_value, BATCH_VALUE);
+
+	if (flags & MULTIGPU_COH_FAIL) {
+		struct drm_xe_sync sync0 = {}, sync1 = {};
+		uint64_t *result;
+		uint64_t coh_result;
+		uint64_t *sync_addr0, *sync_addr1;
+
+		igt_info("verifying concurrent write race\n");
+
+		WRITE_ONCE(*(uint64_t *)addr, 0);
+
+		store_dword_batch_init(gpu1->fd, vm[0], addr, &batch1_bo[0],
+				       &batch1_addr[0], BATCH_VALUE + 10);
+		store_dword_batch_init(gpu2->fd, vm[1], addr, &batch1_bo[1],
+				       &batch1_addr[1], BATCH_VALUE + 20);
+
+		/* Setup sync for GPU1 */
+		sync_addr0 = (void *)((char *)batch1_addr[0] + SZ_4K);
+		sync0.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+		sync0.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+		sync0.addr = to_user_pointer((uint64_t *)sync_addr0);
+		sync0.timeline_value = EXEC_SYNC_VAL;
+		WRITE_ONCE(*sync_addr0, 0);
+
+		/* Setup sync for GPU2 */
+		sync_addr1 = (void *)((char *)batch1_addr[1] + SZ_4K);
+		sync1.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+		sync1.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+		sync1.addr = to_user_pointer((uint64_t *)sync_addr1);
+		sync1.timeline_value = EXEC_SYNC_VAL;
+		WRITE_ONCE(*sync_addr1, 0);
+
+		/* Launch both concurrently - no wait between them */
+		xe_exec_sync(gpu1->fd, exec_queue[0], batch1_addr[0], &sync0, 1);
+		xe_exec_sync(gpu2->fd, exec_queue[1], batch1_addr[1], &sync1, 1);
+
+		/* Wait for both ops to complete */
+		if (READ_ONCE(*sync_addr0) != EXEC_SYNC_VAL)
+			xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr0, EXEC_SYNC_VAL,
+				       exec_queue[0], NSEC_PER_SEC * 10);
+		if (READ_ONCE(*sync_addr1) != EXEC_SYNC_VAL)
+			xe_wait_ufence(gpu2->fd, (uint64_t *)sync_addr1, EXEC_SYNC_VAL,
+				       exec_queue[1], NSEC_PER_SEC * 10);
+
+		/* Create result buffer for GPU to copy the final value */
+		result = aligned_alloc(SZ_2M, SZ_4K);
+		igt_assert(result);
+		WRITE_ONCE(*result, 0xDEADBEEF); // Initialize with known pattern
+
+		/* GPU2 --> copy from addr */
+		gpu_batch_create(gpu2, vm[1], exec_queue[1], addr, to_user_pointer(result),
+				 &batch_bo[1], &batch_addr[1], flags, INIT);
+
+		/*GPU2: Madvise and Prefetch Ops */
+		gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(result),
+				      &batch_addr[1], flags, NULL);
+
+		/* Check which write won (or if we got a mix) */
+		coh_result = READ_ONCE(*result);
+
+		if (coh_result == (BATCH_VALUE + 10))
+			igt_info("GPU1's write won the race\n");
+		else if (coh_result == (BATCH_VALUE + 20))
+			igt_info("GPU2's write won the race\n");
+		else if (coh_result == 0)
+			igt_warn("Both writes failed - coherency issue\n");
+		else
+			igt_warn("Unexpected value 0x%lx - possible coherency corruption\n",
+				 coh_result);
+
+		munmap((void *)batch1_addr[0], BATCH_SIZE(gpu1->fd));
+		munmap((void *)batch1_addr[1], BATCH_SIZE(gpu2->fd));
+
+		batch_fini(gpu1->fd, vm[0], batch1_bo[0], batch1_addr[0]);
+		batch_fini(gpu2->fd, vm[1], batch1_bo[1], batch1_addr[1]);
+		free(result);
+	}
+
+	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
+	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
+	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
+	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[1]);
+	free(data1);
+	free(copy_dst);
+
+	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);
+	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]);
+}
+
 static void
 gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
 		       struct xe_svm_gpu_info *dst,
@@ -528,6 +726,18 @@ gpu_atomic_inc_wrapper(struct xe_svm_gpu_info *src,
 	atomic_inc_op(src, dst, eci, flags);
 }
 
+static void
+gpu_coherecy_test_wrapper(struct xe_svm_gpu_info *src,
+			  struct xe_svm_gpu_info *dst,
+			  struct drm_xe_engine_class_instance *eci,
+			  unsigned int flags)
+{
+	igt_assert(src);
+	igt_assert(dst);
+
+	coherency_test_multigpu(src, dst, eci, flags);
+}
+
 static void
 test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
 	       struct drm_xe_engine_class_instance *eci,
@@ -537,6 +747,8 @@ test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_mem_access_wrapper, flags);
 	if (flags & MULTIGPU_ATOMIC_OP)
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_atomic_inc_wrapper, flags);
+	if (flags & MULTIGPU_COH_OP)
+		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_coherecy_test_wrapper, flags);
 }
 
 struct section {
@@ -561,6 +773,11 @@ igt_main
 		{ "xgpu-access-prefetch", MULTIGPU_PREFETCH | MULTIGPU_XGPU_ACCESS },
 		{ "atomic-op-basic", MULTIGPU_ATOMIC_OP },
 		{ "atomic-op-prefetch", MULTIGPU_PREFETCH | MULTIGPU_ATOMIC_OP },
+		{ "coherency-basic", MULTIGPU_COH_OP },
+		{ "coherency-fail-basic", MULTIGPU_COH_OP | MULTIGPU_COH_FAIL },
+		{ "coherency-prefetch", MULTIGPU_PREFETCH | MULTIGPU_COH_OP },
+		{ "coherency-fail-prefetch",
+		  MULTIGPU_PREFETCH | MULTIGPU_COH_OP | MULTIGPU_COH_FAIL},
 		{ NULL },
 	};
 
-- 
2.48.1

