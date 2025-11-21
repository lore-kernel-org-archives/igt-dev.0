Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E992FCFC298
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 16:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7145410E8E9;
	Fri, 21 Nov 2025 16:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dbRsF5B7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE15B10E8E2
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 16:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763742339; x=1795278339;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+KEi8+YHnY2zx3EWZsJ1SHNozOB+SdGurRP5LhrYyec=;
 b=dbRsF5B7a5RTNm/YfA57ziQYqRBQN7bP/A4nHDzqo0eN/gt4AJVnA+/j
 j4K+Hy0c9EGbiQPay319DSHiuVL7sdmkYJEAdw2jrtQj3FtW8pcdSY8S4
 a4E3exwdaD6VeKjDMM8t5vWwKHtPZ1UPOEG/1nntvmqgWexCqkHeE2U9q
 Xt7EngxxJsmRGGHFDrHOlJ06Lkey+lKy/JW8jTrCE0v9NNc9WwPC2Sxtf
 0MF+O1qILcH50qHBWtPyh8gR1asO8FUzY6qdnJN+R9nFxxFV3AJaqQ4uG
 5LY5UVhzm86MVALxwU0lSkqa2d9fmXnTsIkGTJ0gweR+QDQkDNFEOTT+W g==;
X-CSE-ConnectionGUID: hg5ZTNNrRHuTZl7KwfD9UQ==
X-CSE-MsgGUID: 34dz+xJ+RYOBu7lCfJzXlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65029749"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="65029749"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 08:25:38 -0800
X-CSE-ConnectionGUID: E3ABX1xMSA219qMnhSmC1g==
X-CSE-MsgGUID: VypSM5mlRemTUQHe/iholg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="215096184"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..)
 ([10.1.40.114])
 by fmviesa002.fm.intel.com with ESMTP; 21 Nov 2025 08:25:38 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH i-g-t v8 05/10] tests/intel/xe_multi_gpusvm: Add SVM multi-GPU
 coherency test
Date: Fri, 21 Nov 2025 16:25:32 +0000
Message-ID: <20251121162537.77551-6-nishit.sharma@intel.com>
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

This test verifies memory coherency in a multi-GPU environment using SVM.
GPU 1 writes to a shared buffer, GPU 2 reads and checks for correct data
without explicit synchronization, and the test is repeated with CPU and
both GPUs to ensure consistent memory visibility across agents.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_multi_gpusvm.c | 255 ++++++++++++++++++++++++++++++++++
 1 file changed, 255 insertions(+)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index 4e817edf9..43a8e6f0b 100644
--- a/tests/intel/xe_multi_gpusvm.c
+++ b/tests/intel/xe_multi_gpusvm.c
@@ -44,6 +44,26 @@
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
@@ -59,6 +79,8 @@
 #define MULTIGPU_PREFETCH		BIT(1)
 #define MULTIGPU_XGPU_ACCESS		BIT(2)
 #define MULTIGPU_ATOMIC_OP		BIT(3)
+#define MULTIGPU_COH_OP			BIT(4)
+#define MULTIGPU_COH_FAIL		BIT(5)
 
 struct xe_svm_gpu_info {
 	bool supports_faults;
@@ -99,6 +121,11 @@ static void gpu_atomic_inc_wrapper(struct xe_svm_gpu_info *src,
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
@@ -217,6 +244,35 @@ atomic_batch_init(int fd, uint32_t vm, uint64_t src_addr,
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
@@ -460,6 +516,186 @@ atomic_inc_op(struct xe_svm_gpu_info *gpu1,
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
+	struct drm_xe_sync sync = {};
+	volatile uint64_t *sync_addr;
+	int value = 60;
+	uint64_t *data1;
+	void *copy_dst;
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
+	/* Execute STORE command on GPU1 */
+	sync_addr = (void *)((char *)batch_addr[0] + SZ_4K);
+	sync.addr = to_user_pointer((uint64_t *)sync_addr);
+	sync.timeline_value = EXEC_SYNC_VAL;
+	*sync_addr = 0;
+
+	xe_exec_sync(gpu1->fd, exec_queue[0], batch_addr[0], &sync, 1);
+	if (*sync_addr != EXEC_SYNC_VAL)
+		xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[0],
+			       NSEC_PER_SEC * 10);
+
+	igt_debug("GPU1 wrote, add value: 0x%lx\n", *(uint64_t *)addr);
+
+	/* Creating batch for GPU2 using addr as Src which have value from GPU1 */
+	batch_init(gpu2->fd, vm[1], addr, to_user_pointer(copy_dst), SZ_4K,
+		   &batch_bo[1], &batch_addr[1]);
+
+	xe_multigpu_madvise(gpu2->fd, vm[1], to_user_pointer(copy_dst), SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu2->fd, 0, gpu2->vram_regions[0], exec_queue[1]);
+
+	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
+	xe_multigpu_prefetch(gpu2->fd, vm[1], to_user_pointer(copy_dst), SZ_4K, &sync,
+			     sync_addr, exec_queue[1], flags);
+	free((void *)sync_addr);
+
+	sync_addr = (void *)((char *)batch_addr[1] + SZ_4K);
+	sync.addr = to_user_pointer((uint64_t *)sync_addr);
+	sync.timeline_value = EXEC_SYNC_VAL;
+	*sync_addr = 0;
+
+	/* GPU2 copies from addr (GPU1's write) to copy_dst */
+	xe_exec_sync(gpu2->fd, exec_queue[1], batch_addr[1], &sync, 1);
+	if (*sync_addr != EXEC_SYNC_VAL)
+		xe_wait_ufence(gpu2->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[1],
+			       NSEC_PER_SEC * 10);
+
+	igt_assert_eq(*(uint64_t *)copy_dst, value);
+
+	if (flags & MULTIGPU_COH_FAIL) {
+		struct drm_xe_sync sync0 = {}, sync1 = {}, sync_read = {};
+		uint32_t batch_read_bo;
+		uint64_t batch_read_addr;
+		uint64_t *result;
+		volatile uint64_t *sync_addr0, *sync_addr1, *sync_addr_read;
+
+		igt_info("verifying concurrent write race\n");
+
+		*(uint64_t *)addr = 0;
+
+		store_dword_batch_init(gpu1->fd, vm[0], addr, &batch1_bo[0],
+				       &batch1_addr[0], value + 10);
+		store_dword_batch_init(gpu2->fd, vm[1], addr, &batch1_bo[1],
+				       &batch1_addr[1], value + 20);
+
+		/* Setup sync for GPU1 */
+		sync_addr0 = (void *)((char *)batch1_addr[0] + SZ_4K);
+		sync0.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+		sync0.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+		sync0.addr = to_user_pointer((uint64_t *)sync_addr0);
+		sync0.timeline_value = EXEC_SYNC_VAL;
+		*sync_addr0 = 0;
+
+		/* Setup sync for GPU2 */
+		sync_addr1 = (void *)((char *)batch1_addr[1] + SZ_4K);
+		sync1.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+		sync1.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+		sync1.addr = to_user_pointer((uint64_t *)sync_addr1);
+		sync1.timeline_value = EXEC_SYNC_VAL;
+		*sync_addr1 = 0;
+
+		/* Launch both concurrently - no wait between them */
+		xe_exec_sync(gpu1->fd, exec_queue[0], batch1_addr[0], &sync0, 1);
+		xe_exec_sync(gpu2->fd, exec_queue[1], batch1_addr[1], &sync1, 1);
+
+		/* Wait for both ito complete */
+		if (*sync_addr0 != EXEC_SYNC_VAL)
+			xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr0, EXEC_SYNC_VAL,
+				       exec_queue[0], NSEC_PER_SEC * 10);
+		if (*sync_addr1 != EXEC_SYNC_VAL)
+			xe_wait_ufence(gpu2->fd, (uint64_t *)sync_addr1, EXEC_SYNC_VAL,
+				       exec_queue[1], NSEC_PER_SEC * 10);
+
+		/* Create result buffer for GPU to copy the final value */
+		result = aligned_alloc(SZ_2M, SZ_4K);
+		igt_assert(result);
+		*result = 0xDEADBEEF; // Initialize with known pattern
+
+		usleep(100000); // 100ms to let writes settle
+
+		/* Create a batch buffer that copies from addr to result */
+		batch_init(gpu2->fd, vm[1], addr, to_user_pointer(result),
+			   SZ_4K, &batch_read_bo, &batch_read_addr);
+
+		/* Setup sync for read operation */
+		sync_addr_read = (void *)((char *)batch_read_addr + SZ_4K);
+		sync_read.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+		sync_read.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+		sync_read.addr = to_user_pointer((uint64_t *)sync_addr_read);
+		sync_read.timeline_value = EXEC_SYNC_VAL;
+		*sync_addr_read = 0;
+
+		/* Execute the read/copy batch */
+		xe_exec_sync(gpu2->fd, exec_queue[1], batch_read_addr, &sync_read, 1);
+		if (*sync_addr_read != EXEC_SYNC_VAL)
+			xe_wait_ufence(gpu2->fd, (uint64_t *)sync_addr_read, EXEC_SYNC_VAL,
+				       exec_queue[1], NSEC_PER_SEC * 10);
+
+		/* Check which write won (or if we got a mix) */
+		if (*result == (value + 10))
+			igt_info("GPU1's write won the race\n");
+		else if (*result == (value + 20))
+			igt_info("GPU2's write won the race\n");
+		else if (*result == 0)
+			igt_warn("Both writes failed - coherency issue\n");
+		else
+			igt_warn("Unexpected value 0x%lx - possible coherency corruption\n",
+				 *result);
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
@@ -484,6 +720,18 @@ gpu_atomic_inc_wrapper(struct xe_svm_gpu_info *src,
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
@@ -493,6 +741,8 @@ test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_mem_access_wrapper, flags);
 	if (flags & MULTIGPU_ATOMIC_OP)
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_atomic_inc_wrapper, flags);
+	if (flags & MULTIGPU_COH_OP)
+		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_coherecy_test_wrapper, flags);
 }
 
 struct section {
@@ -515,6 +765,11 @@ igt_main
 		{ "xgpu-access-prefetch", MULTIGPU_PREFETCH | MULTIGPU_XGPU_ACCESS },
 		{ "atomic-op-basic", MULTIGPU_BASIC | MULTIGPU_ATOMIC_OP },
 		{ "atomic-op-prefetch", MULTIGPU_PREFETCH | MULTIGPU_ATOMIC_OP },
+		{ "coherency-basic", MULTIGPU_BASIC | MULTIGPU_COH_OP },
+		{ "coherency-fail-basic", MULTIGPU_BASIC | MULTIGPU_COH_OP | MULTIGPU_COH_FAIL },
+		{ "coherency-prefetch", MULTIGPU_PREFETCH | MULTIGPU_COH_OP },
+		{ "coherency-fail-prefetch",
+		  MULTIGPU_PREFETCH | MULTIGPU_COH_OP | MULTIGPU_COH_FAIL},
 		{ NULL },
 	};
 
-- 
2.48.1

