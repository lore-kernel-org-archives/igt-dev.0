Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A459D11704
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 15:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5504610E690;
	Tue,  2 Dec 2025 15:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RvNfUy1N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8B410E677
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 15:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764691193; x=1796227193;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=w5dF/X0HHzoxqUG6RJWFLger7gBEWICoz71EXJLA2H8=;
 b=RvNfUy1NaEfRZ7BAosa1Y7Wc7rIVXjpn//s+CuIoIWcaGGC6S5cCfqK2
 pbmIfWLYClCX85aqxY0ECi7EccU6U6m160sc0++nbREmcJv8nO0PirLg8
 4OCNpzfjZI62nPM6YSMOOp3GGP1pXE3GAjmyugd87iK77Ink6EAylkroV
 ebVmPVBQtY8Djdb2l+aktkV0oo0vxLQNasDzDtpHqNpZdk5NjbUForbgu
 t6Pbj5WjQw+ReAv5QgVO0onjBcMWw03a41JvrM47CUj/tqLKVdDiKVoSb
 x0CrBScwVMtkv4Jmi/wy/0YLXV9R+cFCIFG4zuPs8S1QwvrDD+HVeQQG4 A==;
X-CSE-ConnectionGUID: TuNG8X74TzGV9Eo9GOXA+g==
X-CSE-MsgGUID: MxPLjaMGRW+iNKr9Vc9Alg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="84059535"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="84059535"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 07:59:52 -0800
X-CSE-ConnectionGUID: oSFXitkMR8Gm3rl2m4GGDw==
X-CSE-MsgGUID: frdlBNi8R4G00ae1sJeNMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="198600778"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.43])
 by orviesa003.jf.intel.com with ESMTP; 02 Dec 2025 07:59:52 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Subject: [PATCH v10 04/10] tests/intel/xe_multigpu_svm: Add SVM multi-GPU
 atomic operations
Date: Tue,  2 Dec 2025 15:59:45 +0000
Message-ID: <20251202155951.21369-5-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251202155951.21369-1-nishit.sharma@intel.com>
References: <20251202155951.21369-1-nishit.sharma@intel.com>
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

This test performs atomic increment operation on a shared SVM buffer
from both GPUs and the CPU in a multi-GPU environment. It uses madvise
and prefetch to control buffer placement and verifies correctness and
ordering of atomic updates across agents.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel/xe_multigpu_svm.c | 205 +++++++++++++++++++++++++++++++++-
 1 file changed, 203 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_multigpu_svm.c b/tests/intel/xe_multigpu_svm.c
index 85fea72bb..4b0cacbf9 100644
--- a/tests/intel/xe_multigpu_svm.c
+++ b/tests/intel/xe_multigpu_svm.c
@@ -36,6 +36,17 @@
  * Description:
  *	Test cross-GPU memory access with prefetch in multi-GPU SVM configuration
  *
+ * SUBTEST: mgpu-atomic-op-basic
+ * Description:
+ *	Test basic cross-GPU atomic increment operations in multi-GPU SVM configuration
+ *	operation on GPU1 and then atomic operation on GPU2 using same
+ *	address
+ *
+ * SUBTEST: mgpu-atomic-op-prefetch
+ * Description:
+ *	Tests cross-GPU atomic increment operations with explicit memory prefetch
+ *	to validate SVM atomic operations in multi-GPU config
+ *
  */
 
 #define MAX_XE_REGIONS	8
@@ -45,9 +56,15 @@
 #define BIND_SYNC_VAL 0x686868
 #define EXEC_SYNC_VAL 0x676767
 #define COPY_SIZE SZ_64M
+#define	ATOMIC_OP_VAL	56
 
 #define MULTIGPU_PREFETCH		BIT(1)
 #define MULTIGPU_XGPU_ACCESS		BIT(2)
+#define MULTIGPU_ATOMIC_OP		BIT(3)
+
+#define INIT	2
+#define STORE	3
+#define ATOMIC	4
 
 struct xe_svm_gpu_info {
 	bool supports_faults;
@@ -62,6 +79,16 @@ typedef void (*gpu_pair_fn)(struct xe_svm_gpu_info *src,
 			    struct drm_xe_engine_class_instance *eci,
 			    unsigned int flags);
 
+struct test_exec_data {
+	uint32_t batch[32];
+	uint64_t pad;
+	uint64_t vm_sync;
+	uint64_t exec_sync;
+	uint32_t data;
+	uint32_t expected_data;
+	uint64_t batch_addr;
+};
+
 static void for_each_gpu_pair(int num_gpus,
 			      struct xe_svm_gpu_info *gpus,
 			      struct drm_xe_engine_class_instance *eci,
@@ -73,7 +100,10 @@ static void gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
 				   struct drm_xe_engine_class_instance *eci,
 				   unsigned int flags);
 
-static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
+static void gpu_atomic_inc_wrapper(struct xe_svm_gpu_info *src,
+				   struct xe_svm_gpu_info *dst,
+				   struct drm_xe_engine_class_instance *eci,
+				   unsigned int flags);
 
 static void
 create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct drm_xe_engine_class_instance *eci,
@@ -162,6 +192,35 @@ static void for_each_gpu_pair(int num_gpus, struct xe_svm_gpu_info *gpus,
 	}
 }
 
+static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
+
+static void
+atomic_batch_init(int fd, uint32_t vm, uint64_t src_addr,
+		  uint32_t *bo, uint64_t *addr)
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
+	cmd = (uint32_t *)batch;
+
+	cmd[i++] = MI_ATOMIC | MI_ATOMIC_INC;
+	cmd[i++] = src_addr;
+	cmd[i++] = src_addr >> 32;
+	cmd[i++] = MI_BATCH_BUFFER_END;
+
+	batch_addr = to_user_pointer(batch);
+	/* Punch a gap in the SVM map where we map the batch_bo */
+	xe_vm_bind_lr_sync(fd, vm, batch_bo, 0, batch_addr, batch_bo_size, 0);
+	*bo = batch_bo;
+	*addr = batch_addr;
+}
+
 static void batch_init(int fd, uint32_t vm, uint64_t src_addr,
 		       uint64_t dst_addr, uint64_t copy_size,
 		       uint32_t *bo, uint64_t *addr)
@@ -256,6 +315,51 @@ mgpu_check_fault_support(struct xe_svm_gpu_info *gpu1,
 	return ret;
 }
 
+static void
+gpu_madvise_exec_sync(struct xe_svm_gpu_info *gpu, uint32_t vm, uint32_t exec_queue,
+		      uint64_t dst_addr, uint64_t *batch_addr, unsigned int flags)
+{
+	struct drm_xe_sync sync = {};
+	uint64_t *sync_addr;
+
+	xe_multigpu_madvise(gpu->fd, vm, dst_addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu->fd, 0, gpu->vram_regions[0], exec_queue);
+
+	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
+	xe_multigpu_prefetch(gpu->fd, vm, dst_addr, SZ_4K, &sync,
+			     sync_addr, exec_queue, flags);
+	free(sync_addr);
+
+	sync_addr = (void *)((char *)*batch_addr + SZ_4K);
+	sync.addr = to_user_pointer((uint64_t *)sync_addr);
+	sync.timeline_value = EXEC_SYNC_VAL;
+	WRITE_ONCE(*sync_addr, 0);
+
+	xe_exec_sync(gpu->fd, exec_queue, *batch_addr, &sync, 1);
+	if (READ_ONCE(*sync_addr) != EXEC_SYNC_VAL)
+		xe_wait_ufence(gpu->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue,
+			       NSEC_PER_SEC * 10);
+}
+
+static void
+gpu_batch_create(struct xe_svm_gpu_info *gpu, uint32_t vm, uint32_t exec_queue,
+		 uint64_t src_addr, uint64_t dst_addr,
+		 uint32_t *batch_bo, uint64_t *batch_addr,
+		 unsigned int flags, int op_type)
+{
+	switch (op_type) {
+	case ATOMIC:
+		atomic_batch_init(gpu->fd, vm, src_addr, batch_bo, batch_addr);
+		break;
+	case INIT:
+		batch_init(gpu->fd, vm, src_addr, dst_addr, SZ_4K, batch_bo, batch_addr);
+		break;
+	default:
+		igt_assert(!"Unknown batch op_type");
+	}
+}
+
 static void
 copy_src_dst(struct xe_svm_gpu_info *gpu1,
 	     struct xe_svm_gpu_info *gpu2,
@@ -318,6 +422,87 @@ copy_src_dst(struct xe_svm_gpu_info *gpu1,
 	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);
 }
 
+static void
+atomic_inc_op(struct xe_svm_gpu_info *gpu1,
+	      struct xe_svm_gpu_info *gpu2,
+	      struct drm_xe_engine_class_instance *eci,
+	      unsigned int flags)
+{
+	uint64_t addr;
+	uint32_t vm[2];
+	uint32_t exec_queue[2];
+	uint32_t batch_bo[2];
+	struct test_exec_data *data;
+	uint64_t batch_addr[2];
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
+	data = aligned_alloc(SZ_2M, SZ_4K);
+	igt_assert(data);
+	data[0].vm_sync = 0;
+	addr = to_user_pointer(data);
+
+	copy_dst = aligned_alloc(SZ_2M, SZ_4K);
+	igt_assert(copy_dst);
+
+	WRITE_ONCE(*(uint64_t *)addr, ATOMIC_OP_VAL - 1);
+
+	/* GPU1: Atomic Batch create */
+	gpu_batch_create(gpu1, vm[0], exec_queue[0], addr, 0,
+			 &batch_bo[0], &batch_addr[0], flags, ATOMIC);
+
+	/*GPU1: Madvise and Prefetch Ops */
+	gpu_madvise_exec_sync(gpu1, vm[0], exec_queue[0], addr, &batch_addr[0], flags);
+
+	/* GPU2 --> copy from GPU1 */
+	gpu_batch_create(gpu2, vm[1], exec_queue[1], addr, to_user_pointer(copy_dst),
+			 &batch_bo[1], &batch_addr[1], flags, INIT);
+
+	/*GPU2: Madvise and Prefetch Ops */
+	gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(copy_dst),
+			      &batch_addr[1], flags);
+
+	/* NOW CPU can read copy_dst (GPU2 ATOMIC op) */
+	final_value = *(uint32_t *)copy_dst;
+	igt_assert_eq(final_value, ATOMIC_OP_VAL);
+
+	/* GPU2: Atomic Batch create */
+	gpu_batch_create(gpu2, vm[1], exec_queue[1], to_user_pointer(copy_dst), 0,
+			 &batch_bo[1], &batch_addr[1], flags, ATOMIC);
+
+	/*GPU2: Madvise and Prefetch Ops */
+	gpu_madvise_exec_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(copy_dst),
+			      &batch_addr[1], flags);
+
+	/* GPU1 --> copy from GPU2 */
+	gpu_batch_create(gpu1, vm[0], exec_queue[0], to_user_pointer(copy_dst), addr,
+			 &batch_bo[0], &batch_addr[0], flags, INIT);
+
+	/*GPU1: Madvise and Prefetch Ops */
+	gpu_madvise_exec_sync(gpu1, vm[0], exec_queue[1], addr, &batch_addr[0], flags);
+
+	/* NOW CPU can read addr (GPU1 ATOMIC op) */
+	final_value = *(uint32_t *)addr;
+	igt_assert_eq(final_value, ATOMIC_OP_VAL + 1);
+
+	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
+	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
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
@@ -330,6 +515,18 @@ gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
 	copy_src_dst(src, dst, eci, flags);
 }
 
+static void
+gpu_atomic_inc_wrapper(struct xe_svm_gpu_info *src,
+		       struct xe_svm_gpu_info *dst,
+		       struct drm_xe_engine_class_instance *eci,
+		       unsigned int flags)
+{
+	igt_assert(src);
+	igt_assert(dst);
+
+	atomic_inc_op(src, dst, eci, flags);
+}
+
 static void
 test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
 	       struct drm_xe_engine_class_instance *eci,
@@ -337,6 +534,8 @@ test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
 {
 	if (flags & MULTIGPU_XGPU_ACCESS)
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_mem_access_wrapper, flags);
+	if (flags & MULTIGPU_ATOMIC_OP)
+		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_atomic_inc_wrapper, flags);
 }
 
 struct section {
@@ -359,6 +558,8 @@ igt_main
 	const struct section msections[] = {
 		{ "xgpu-access-basic", MULTIGPU_XGPU_ACCESS },
 		{ "xgpu-access-prefetch", MULTIGPU_PREFETCH | MULTIGPU_XGPU_ACCESS },
+		{ "atomic-op-basic", MULTIGPU_ATOMIC_OP },
+		{ "atomic-op-prefetch", MULTIGPU_PREFETCH | MULTIGPU_ATOMIC_OP },
 		{ NULL },
 	};
 
@@ -382,7 +583,7 @@ igt_main
 		}
 	}
 
-	igt_describe("gpu-gpu write-read");
+	igt_describe("multigpu svm operations");
 	for (const struct section *s = msections; s->name; s++) {
 		igt_subtest_f("mgpu-%s", s->name)
 			test_mgpu_exec(gpu_cnt, gpus, &eci, s->flags);
-- 
2.48.1

