Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C0BCD8CAA
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 17:15:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5C210E10B;
	Thu, 13 Nov 2025 17:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZXTSAkgd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3349810E10B
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 17:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763054151; x=1794590151;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aNymC4cHsvz6xcEKcuWFq3tp0CyZXRFlzt0njimx6TI=;
 b=ZXTSAkgdlPd/9Us3wwFffPmWG9F0wLEDqf5JVW/dTwvxMTo6ctRpS/mC
 Nn3/kRIEc/65j1TZLJ/kJxHBqTihxSTqkpx3lR7EIco7iiDyeOlIA/+yh
 FxIuJsiE671dlxh0Qqat3rMY5m0BkFieOru4T3pY7R4G+xLtluUXp7WcF
 CUT0Bgg5FG29GQfk4J12ou2B0XRgwUA1g8dn3y8pEzUiiGqrfYkfA2A6r
 jXrPznImuVCJY3YtZNsT0osdbVfi+5yPzHKjLbWZLRVwXZX4O0gLx303d
 pWCHYaIoKScWycBuRJGMECdf1vupiPkej7gHg1vqikvosfpur4twCpUhL A==;
X-CSE-ConnectionGUID: oglmij5STbmr3X2DYMKQYw==
X-CSE-MsgGUID: eaRAK9RxRuq164gwNSAEMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="68993117"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="68993117"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:15:51 -0800
X-CSE-ConnectionGUID: qt/eESvkQea+fTvprXu92w==
X-CSE-MsgGUID: mh6jRz5eTpmo0aNc1BY6YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189817705"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.39])
 by fmviesa008.fm.intel.com with ESMTP; 13 Nov 2025 09:15:50 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v7 04/10] tests/intel/xe_multi_gpusvm: Add SVM multi-GPU
 atomic operations
Date: Thu, 13 Nov 2025 17:15:44 +0000
Message-ID: <20251113171549.635766-5-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251113171549.635766-1-nishit.sharma@intel.com>
References: <20251113171549.635766-1-nishit.sharma@intel.com>
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

This test performs atomic increment operation on a shared SVM buffer
from both GPUs and the CPU in a multi-GPU environment. It uses madvise
and prefetch to control buffer placement and verifies correctness and
ordering of atomic updates across agents.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_multi_gpusvm.c | 157 +++++++++++++++++++++++++++++++++-
 1 file changed, 156 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index 6614ea3d1..54e036724 100644
--- a/tests/intel/xe_multi_gpusvm.c
+++ b/tests/intel/xe_multi_gpusvm.c
@@ -31,6 +31,11 @@
  *      region both remotely and locally and copies to it. Reads back to
  *      system memory and checks the result.
  *
+ * SUBTEST: atomic-inc-gpu-op
+ * Description:
+ * 	This test does atomic operation in multi-gpu by executing atomic
+ *	operation on GPU1 and then atomic operation on GPU2 using same
+ *	adress
  */
 
 #define MAX_XE_REGIONS	8
@@ -40,6 +45,7 @@
 #define BIND_SYNC_VAL 0x686868
 #define EXEC_SYNC_VAL 0x676767
 #define COPY_SIZE SZ_64M
+#define	ATOMIC_OP_VAL	56
 
 struct xe_svm_gpu_info {
 	bool supports_faults;
@@ -49,6 +55,16 @@ struct xe_svm_gpu_info {
 	int fd;
 };
 
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
 struct multigpu_ops_args {
 	bool prefetch_req;
 	bool op_mod;
@@ -72,7 +88,10 @@ static void gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
 				   struct drm_xe_engine_class_instance *eci,
 				   void *extra_args);
 
-static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
+static void gpu_atomic_inc_wrapper(struct xe_svm_gpu_info *src,
+				   struct xe_svm_gpu_info *dst,
+				   struct drm_xe_engine_class_instance *eci,
+				   void *extra_args);
 
 static void
 create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct drm_xe_engine_class_instance *eci,
@@ -166,6 +185,35 @@ static void for_each_gpu_pair(int num_gpus, struct xe_svm_gpu_info *gpus,
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
@@ -325,6 +373,105 @@ gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
 	copy_src_dst(src, dst, eci, args->prefetch_req);
 }
 
+static void
+atomic_inc_op(struct xe_svm_gpu_info *gpu0,
+	      struct xe_svm_gpu_info *gpu1,
+	      struct drm_xe_engine_class_instance *eci,
+	      bool prefetch_req)
+{
+	uint64_t addr;
+	uint32_t vm[2];
+	uint32_t exec_queue[2];
+	uint32_t batch_bo;
+	struct test_exec_data *data;
+	uint64_t batch_addr;
+	struct drm_xe_sync sync = {};
+	volatile uint64_t *sync_addr;
+	volatile uint32_t *shared_val;
+
+	create_vm_and_queue(gpu0, eci, &vm[0], &exec_queue[0]);
+	create_vm_and_queue(gpu1, eci, &vm[1], &exec_queue[1]);
+
+	data = aligned_alloc(SZ_2M, SZ_4K);
+	igt_assert(data);
+	data[0].vm_sync = 0;
+	addr = to_user_pointer(data);
+
+	shared_val = (volatile uint32_t *)addr;
+	*shared_val = ATOMIC_OP_VAL - 1;
+
+	atomic_batch_init(gpu0->fd, vm[0], addr, &batch_bo, &batch_addr);
+
+	/* Place destination in an optionally remote location to test */
+	xe_multigpu_madvise(gpu0->fd, vm[0], addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu0->fd, 0, gpu0->vram_regions[0], exec_queue[0],
+			    0, 0);
+
+	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
+	xe_multigpu_prefetch(gpu0->fd, vm[0], addr, SZ_4K, &sync,
+			     sync_addr, exec_queue[0], prefetch_req);
+
+	sync_addr = (void *)((char *)batch_addr + SZ_4K);
+	sync.addr = to_user_pointer((uint64_t *)sync_addr);
+	sync.timeline_value = EXEC_SYNC_VAL;
+	*sync_addr = 0;
+
+	/* Executing ATOMIC_INC on GPU0. */
+	xe_exec_sync(gpu0->fd, exec_queue[0], batch_addr, &sync, 1);
+	if (*sync_addr != EXEC_SYNC_VAL)
+		xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[0],
+			       NSEC_PER_SEC * 10);
+
+	igt_assert_eq(*shared_val, ATOMIC_OP_VAL);
+
+	atomic_batch_init(gpu1->fd, vm[1], addr, &batch_bo, &batch_addr);
+
+	/* Place destination in an optionally remote location to test */
+	xe_multigpu_madvise(gpu1->fd, vm[1], addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu1->fd, 0, gpu1->vram_regions[0], exec_queue[0],
+			    0, 0);
+
+	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
+	xe_multigpu_prefetch(gpu1->fd, vm[1], addr, SZ_4K, &sync,
+			     sync_addr, exec_queue[1], prefetch_req);
+
+	sync_addr = (void *)((char *)batch_addr + SZ_4K);
+	sync.addr = to_user_pointer((uint64_t *)sync_addr);
+	sync.timeline_value = EXEC_SYNC_VAL;
+	*sync_addr = 0;
+
+	/* Execute ATOMIC_INC on GPU1 */
+	xe_exec_sync(gpu1->fd, exec_queue[1], batch_addr, &sync, 1);
+	if (*sync_addr != EXEC_SYNC_VAL)
+		xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[1],
+			       NSEC_PER_SEC * 10);
+
+	igt_assert_eq(*shared_val, ATOMIC_OP_VAL + 1);
+
+	munmap((void *)batch_addr, BATCH_SIZE(gpu0->fd));
+	batch_fini(gpu0->fd, vm[0], batch_bo, batch_addr);
+	batch_fini(gpu1->fd, vm[1], batch_bo, batch_addr);
+	free(data);
+
+	cleanup_vm_and_queue(gpu0, vm[0], exec_queue[0]);
+	cleanup_vm_and_queue(gpu1, vm[1], exec_queue[1]);
+}
+
+static void
+gpu_atomic_inc_wrapper(struct xe_svm_gpu_info *src,
+		       struct xe_svm_gpu_info *dst,
+		       struct drm_xe_engine_class_instance *eci,
+		       void *extra_args)
+{
+	struct multigpu_ops_args *args = (struct multigpu_ops_args *)extra_args;
+	igt_assert(src);
+	igt_assert(dst);
+
+	atomic_inc_op(src, dst, eci, args->prefetch_req);
+}
+
 igt_main
 {
 	struct xe_svm_gpu_info gpus[MAX_XE_GPUS];
@@ -364,6 +511,14 @@ igt_main
 		for_each_gpu_pair(gpu_cnt, gpus, &eci, gpu_mem_access_wrapper, &op_args);
 	}
 
+	igt_subtest("atomic-inc-gpu-op") {
+		struct multigpu_ops_args atomic_args;
+		atomic_args.prefetch_req = 1;
+		for_each_gpu_pair(gpu_cnt, gpus, &eci, gpu_atomic_inc_wrapper, &atomic_args);
+		atomic_args.prefetch_req = 0;
+		for_each_gpu_pair(gpu_cnt, gpus, &eci, gpu_atomic_inc_wrapper, &atomic_args);
+	}
+
 	igt_fixture {
 		int cnt;
 
-- 
2.48.1

