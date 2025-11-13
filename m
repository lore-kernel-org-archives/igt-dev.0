Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D5BCD8CB0
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 17:16:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA4110E8F2;
	Thu, 13 Nov 2025 17:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UvhRk5g7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255A110E8EA
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 17:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763054183; x=1794590183;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Q+bjOaeXqoKDw4FHcqzmzxfIBPRa87dIFjY7S1nwd2Q=;
 b=UvhRk5g7kOdsfONN7K0KCrCwRCyOSxplwNnIF4k+ECfp39BRvkbsS36q
 C55BzjWUFu3Y55JHO09hwXSa4xoW0nbEHnYTFbi/QbgrYi6nlmQp/FgMq
 Hn7Y8TspLmvbMKqEppWT44QgGsKJ9k/Q/i504un3h2hEj8wzyfdS8S57X
 y/vewrLIe0bWBG+N22BCZrTdNE0q5OxfADD30aB+dTrGr0SHJLUeYXnXq
 bMuIaAGJToaeuvYraXyI7kuHB0qaDnCoSsBEXDcyxfErT00u/B1N6SZWd
 ADciuSrAdqeWijhP3DYUzT3+Dk2JIiNzoQZ2DqqSkjUIRLtfL2gknr9SE Q==;
X-CSE-ConnectionGUID: IIHPpFZNQ9yeeHShYhJhqQ==
X-CSE-MsgGUID: UuHZlKgyR9iS2R316/GS/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64345923"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="64345923"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:16:22 -0800
X-CSE-ConnectionGUID: p/6V5XjLQEeXdBSLJ+muLQ==
X-CSE-MsgGUID: 5Hvf2GkrRrq3tzYoCKQRTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="194705464"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.39])
 by orviesa005.jf.intel.com with ESMTP; 13 Nov 2025 09:16:22 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v7 05/10] tests/intel/xe_multi_gpusvm: Add SVM multi-GPU
 coherency test
Date: Thu, 13 Nov 2025 17:16:16 +0000
Message-ID: <20251113171621.635811-6-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251113171621.635811-1-nishit.sharma@intel.com>
References: <20251113171621.635811-1-nishit.sharma@intel.com>
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
 tests/intel/xe_multi_gpusvm.c | 203 +++++++++++++++++++++++++++++++++-
 1 file changed, 201 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index 54e036724..6792ef72c 100644
--- a/tests/intel/xe_multi_gpusvm.c
+++ b/tests/intel/xe_multi_gpusvm.c
@@ -34,8 +34,13 @@
  * SUBTEST: atomic-inc-gpu-op
  * Description:
  * 	This test does atomic operation in multi-gpu by executing atomic
- *	operation on GPU1 and then atomic operation on GPU2 using same
- *	adress
+ * 	operation on GPU1 and then atomic operation on GPU2 using same
+ * 	adress
+ *
+ * SUBTEST: coherency-multi-gpu
+ * Description:
+ * 	This test checks coherency in multi-gpu by writing from GPU0
+ * 	reading from GPU1 and verify and repeating with CPU and both GPUs
  */
 
 #define MAX_XE_REGIONS	8
@@ -93,6 +98,11 @@ static void gpu_atomic_inc_wrapper(struct xe_svm_gpu_info *src,
 				   struct drm_xe_engine_class_instance *eci,
 				   void *extra_args);
 
+static void gpu_coherecy_test_wrapper(struct xe_svm_gpu_info *src,
+				      struct xe_svm_gpu_info *dst,
+				      struct drm_xe_engine_class_instance *eci,
+				      void *extra_args);
+
 static void
 create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct drm_xe_engine_class_instance *eci,
 		    uint32_t *vm, uint32_t *exec_queue)
@@ -214,6 +224,35 @@ atomic_batch_init(int fd, uint32_t vm, uint64_t src_addr,
 	*addr = batch_addr;
 }
 
+static void
+store_dword_batch_init(int fd, uint32_t vm, uint64_t src_addr,
+                       uint32_t *bo, uint64_t *addr, int value)
+{
+        uint32_t batch_bo_size = BATCH_SIZE(fd);
+        uint32_t batch_bo;
+        uint64_t batch_addr;
+        void *batch;
+        uint32_t *cmd;
+        int i = 0;
+
+        batch_bo = xe_bo_create(fd, vm, batch_bo_size, vram_if_possible(fd, 0), 0);
+        batch = xe_bo_map(fd, batch_bo, batch_bo_size);
+        cmd = (uint32_t *) batch;
+
+        cmd[i++] = MI_STORE_DWORD_IMM_GEN4;
+        cmd[i++] = src_addr;
+        cmd[i++] = src_addr >> 32;
+        cmd[i++] = value;
+        cmd[i++] = MI_BATCH_BUFFER_END;
+
+        batch_addr = to_user_pointer(batch);
+
+        /* Punch a gap in the SVM map where we map the batch_bo */
+        xe_vm_bind_lr_sync(fd, vm, batch_bo, 0, batch_addr, batch_bo_size, 0);
+        *bo = batch_bo;
+        *addr = batch_addr;
+}
+
 static void batch_init(int fd, uint32_t vm, uint64_t src_addr,
 		       uint64_t dst_addr, uint64_t copy_size,
 		       uint32_t *bo, uint64_t *addr)
@@ -373,6 +412,143 @@ gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
 	copy_src_dst(src, dst, eci, args->prefetch_req);
 }
 
+static void
+coherency_test_multigpu(struct xe_svm_gpu_info *gpu0,
+			struct xe_svm_gpu_info *gpu1,
+			struct drm_xe_engine_class_instance *eci,
+			bool coh_fail_set,
+			bool prefetch_req)
+{
+        uint64_t addr;
+        uint32_t vm[2];
+        uint32_t exec_queue[2];
+        uint32_t batch_bo, batch1_bo[2];
+        uint64_t batch_addr, batch1_addr[2];
+        struct drm_xe_sync sync = {};
+        volatile uint64_t *sync_addr;
+        int value = 60;
+	uint64_t *data1;
+	void *copy_dst;
+
+	create_vm_and_queue(gpu0, eci, &vm[0], &exec_queue[0]);
+	create_vm_and_queue(gpu1, eci, &vm[1], &exec_queue[1]);
+
+        data1 = aligned_alloc(SZ_2M, SZ_4K);
+	igt_assert(data1);
+	addr = to_user_pointer(data1);
+
+	copy_dst = aligned_alloc(SZ_2M, SZ_4K);
+	igt_assert(copy_dst);
+
+        store_dword_batch_init(gpu0->fd, vm[0], addr, &batch_bo, &batch_addr, value);
+
+        /* Place destination in GPU0 local memory location to test */
+	xe_multigpu_madvise(gpu0->fd, vm[0], addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu0->fd, 0, gpu0->vram_regions[0], exec_queue[0],
+			    0, 0);
+
+	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
+	xe_multigpu_prefetch(gpu0->fd, vm[0], addr, SZ_4K, &sync,
+			     sync_addr, exec_queue[0], prefetch_req);
+
+        sync_addr = (void *)((char *)batch_addr + SZ_4K);
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = EXEC_SYNC_VAL;
+        *sync_addr = 0;
+
+        /* Execute STORE command on GPU0 */
+        xe_exec_sync(gpu0->fd, exec_queue[0], batch_addr, &sync, 1);
+        if (*sync_addr != EXEC_SYNC_VAL)
+                xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[0],
+			       NSEC_PER_SEC * 10);
+
+        igt_assert_eq(*(uint64_t *)addr, value);
+
+	/* Creating batch for GPU1 using addr as Src which have value from GPU0 */
+	batch_init(gpu1->fd, vm[1], addr, to_user_pointer(copy_dst),
+		   SZ_4K, &batch_bo, &batch_addr);
+
+        /* Place destination in GPU1 local memory location to test */
+	xe_multigpu_madvise(gpu1->fd, vm[1], addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu1->fd, 0, gpu1->vram_regions[0], exec_queue[1],
+			    0, 0);
+
+	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
+	xe_multigpu_prefetch(gpu1->fd, vm[1], addr, SZ_4K, &sync,
+			     sync_addr, exec_queue[1], prefetch_req);
+
+        sync_addr = (void *)((char *)batch_addr + SZ_4K);
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = EXEC_SYNC_VAL;
+        *sync_addr = 0;
+
+        /* Execute COPY command on GPU1 */
+        xe_exec_sync(gpu1->fd, exec_queue[1], batch_addr, &sync, 1);
+        if (*sync_addr != EXEC_SYNC_VAL)
+                xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[1],
+			       NSEC_PER_SEC * 10);
+
+        igt_assert_eq(*(uint64_t *)copy_dst, value);
+
+        /* CPU writes 10, memset set bytes no integer hence memset fills 4 bytes with 0x0A */
+        memset((void *)(uintptr_t)addr, 10, sizeof(int));
+        igt_assert_eq(*(uint64_t *)addr, 0x0A0A0A0A);
+
+	if (coh_fail_set) {
+		igt_info("coherency fail impl\n");
+
+		/* Coherency fail scenario */
+		store_dword_batch_init(gpu0->fd, vm[0], addr, &batch1_bo[0], &batch1_addr[0], value + 10);
+		store_dword_batch_init(gpu1->fd, vm[1], addr, &batch1_bo[1], &batch1_addr[1], value + 20);
+
+		sync_addr = (void *)((char *)batch1_addr[0] + SZ_4K);
+		sync.addr = to_user_pointer((uint64_t *)sync_addr);
+		sync.timeline_value = EXEC_SYNC_VAL;
+		*sync_addr = 0;
+
+		/* Execute STORE command on GPU1 */
+		xe_exec_sync(gpu0->fd, exec_queue[0], batch1_addr[0], &sync, 1);
+		if (*sync_addr != EXEC_SYNC_VAL)
+			xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[0],
+				       NSEC_PER_SEC * 10);
+
+		sync_addr = (void *)((char *)batch1_addr[1] + SZ_4K);
+		sync.addr = to_user_pointer((uint64_t *)sync_addr);
+		sync.timeline_value = EXEC_SYNC_VAL;
+		*sync_addr = 0;
+
+		/* Execute STORE command on GPU2 */
+		xe_exec_sync(gpu1->fd, exec_queue[1], batch1_addr[1], &sync, 1);
+		if (*sync_addr != EXEC_SYNC_VAL)
+			xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[1],
+				       NSEC_PER_SEC * 10);
+
+		igt_warn_on_f(*(uint64_t *)addr != (value + 10),
+			      "GPU2(dst_gpu] has overwritten value at addr\n");
+
+		munmap((void *)batch1_addr[0], BATCH_SIZE(gpu0->fd));
+		munmap((void *)batch1_addr[1], BATCH_SIZE(gpu1->fd));
+
+		batch_fini(gpu0->fd, vm[0], batch1_bo[0], batch1_addr[0]);
+		batch_fini(gpu1->fd, vm[1], batch1_bo[1], batch1_addr[1]);
+	}
+
+        /* CPU writes 11, memset set bytes no integer hence memset fills 4 bytes with 0x0B */
+        memset((void *)(uintptr_t)addr, 11, sizeof(int));
+        igt_assert_eq(*(uint64_t *)addr, 0x0B0B0B0B);
+
+        munmap((void *)batch_addr, BATCH_SIZE(gpu0->fd));
+        batch_fini(gpu0->fd, vm[0], batch_bo, batch_addr);
+        batch_fini(gpu1->fd, vm[1], batch_bo, batch_addr);
+        free(data1);
+	free(copy_dst);
+
+	cleanup_vm_and_queue(gpu0, vm[0], exec_queue[0]);
+	cleanup_vm_and_queue(gpu1, vm[1], exec_queue[1]);
+}
+
 static void
 atomic_inc_op(struct xe_svm_gpu_info *gpu0,
 	      struct xe_svm_gpu_info *gpu1,
@@ -472,6 +648,19 @@ gpu_atomic_inc_wrapper(struct xe_svm_gpu_info *src,
 	atomic_inc_op(src, dst, eci, args->prefetch_req);
 }
 
+static void
+gpu_coherecy_test_wrapper(struct xe_svm_gpu_info *src,
+			  struct xe_svm_gpu_info *dst,
+			  struct drm_xe_engine_class_instance *eci,
+			  void *extra_args)
+{
+	struct multigpu_ops_args *args = (struct multigpu_ops_args *)extra_args;
+	igt_assert(src);
+	igt_assert(dst);
+
+	coherency_test_multigpu(src, dst, eci, args->op_mod, args->prefetch_req);
+}
+
 igt_main
 {
 	struct xe_svm_gpu_info gpus[MAX_XE_GPUS];
@@ -519,6 +708,16 @@ igt_main
 		for_each_gpu_pair(gpu_cnt, gpus, &eci, gpu_atomic_inc_wrapper, &atomic_args);
 	}
 
+	igt_subtest("coherency-multi-gpu") {
+		struct multigpu_ops_args coh_args;
+		coh_args.prefetch_req = 1;
+		coh_args.op_mod = 0;
+		for_each_gpu_pair(gpu_cnt, gpus, &eci, gpu_coherecy_test_wrapper, &coh_args);
+		coh_args.prefetch_req = 0;
+		coh_args.op_mod = 1;
+		for_each_gpu_pair(gpu_cnt, gpus, &eci, gpu_coherecy_test_wrapper, &coh_args);
+	}
+
 	igt_fixture {
 		int cnt;
 
-- 
2.48.1

