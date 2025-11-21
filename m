Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586D3CFC294
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 16:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD9410E8E5;
	Fri, 21 Nov 2025 16:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQlu4UJe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DED10E662
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 16:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763742339; x=1795278339;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=B/ZIcwwc4I84ODQJRrhyHD7Vh9ckLtggblaCF6R6MT0=;
 b=RQlu4UJe6X8/Aj2Zujjo1Rjp1VUTBW1voszuBjQ5qbxdPEpoyecRQbVY
 vS+VoAJ6P4AKWAUiOkuLCL7RSLRfMAo3QbOo4IeOX7542nml6i90H7mD8
 hrlqchaBipaNQ7HqWCVHzHlVnVUH6OHHv14FdNXbeUdkD0HmFV1Wuyblo
 xR/z97skXwumSvCyrGFGjU929u3UwLwctoSsoZeOqkmZee6yCIOiAzNWt
 J+rwzLy6BO6IbOnFOL1WryE4oF4Km0VDO637uB9GHKNab01LCvB6TNi6J
 XMJ/pGjNxojQKhSMT1KufLP7sVk47pICCHjwuD/h0aTR06tAKQuBKpNX6 A==;
X-CSE-ConnectionGUID: N59fO71hQ3ODtmogd43Txg==
X-CSE-MsgGUID: qdqO3pNXS1iBvbA9FGoiNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65029748"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="65029748"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 08:25:38 -0800
X-CSE-ConnectionGUID: j3MHS7FtR2aJY6LyZ4kvqQ==
X-CSE-MsgGUID: QGtD4p1zTeiXqu8UDKIeSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="215096180"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..)
 ([10.1.40.114])
 by fmviesa002.fm.intel.com with ESMTP; 21 Nov 2025 08:25:38 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH i-g-t v8 04/10] tests/intel/xe_multi_gpusvm: Add SVM multi-GPU
 atomic operations
Date: Fri, 21 Nov 2025 16:25:31 +0000
Message-ID: <20251121162537.77551-5-nishit.sharma@intel.com>
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

This test performs atomic increment operation on a shared SVM buffer
from both GPUs and the CPU in a multi-GPU environment. It uses madvise
and prefetch to control buffer placement and verifies correctness and
ordering of atomic updates across agents.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_multi_gpusvm.c | 162 +++++++++++++++++++++++++++++++++-
 1 file changed, 160 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index 471be6449..4e817edf9 100644
--- a/tests/intel/xe_multi_gpusvm.c
+++ b/tests/intel/xe_multi_gpusvm.c
@@ -33,6 +33,17 @@
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
@@ -42,10 +53,12 @@
 #define BIND_SYNC_VAL 0x686868
 #define EXEC_SYNC_VAL 0x676767
 #define COPY_SIZE SZ_64M
+#define	ATOMIC_OP_VAL	56
 
 #define MULTIGPU_BASIC			BIT(0)
 #define MULTIGPU_PREFETCH		BIT(1)
 #define MULTIGPU_XGPU_ACCESS		BIT(2)
+#define MULTIGPU_ATOMIC_OP		BIT(3)
 
 struct xe_svm_gpu_info {
 	bool supports_faults;
@@ -60,6 +73,16 @@ typedef void (*gpu_pair_fn)(struct xe_svm_gpu_info *src,
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
@@ -71,7 +94,10 @@ static void gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
 				   struct drm_xe_engine_class_instance *eci,
 				   unsigned int flags);
 
-static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
+static void gpu_atomic_inc_wrapper(struct xe_svm_gpu_info *src,
+				   struct xe_svm_gpu_info *dst,
+				   struct drm_xe_engine_class_instance *eci,
+				   unsigned int flags);
 
 static void
 create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct drm_xe_engine_class_instance *eci,
@@ -162,6 +188,35 @@ static void for_each_gpu_pair(int num_gpus, struct xe_svm_gpu_info *gpus,
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
@@ -318,6 +373,93 @@ copy_src_dst(struct xe_svm_gpu_info *gpu1,
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
+	struct drm_xe_sync sync = {};
+	volatile uint64_t *sync_addr;
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
+	*(uint64_t *)addr = ATOMIC_OP_VAL - 1;
+
+	atomic_batch_init(gpu1->fd, vm[0], addr, &batch_bo[0], &batch_addr[0]);
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
+	/* Executing ATOMIC_INC on GPU1 */
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
+	igt_assert_eq(*(uint64_t *)addr, ATOMIC_OP_VAL);
+
+	atomic_batch_init(gpu2->fd, vm[1], addr, &batch_bo[1], &batch_addr[1]);
+
+	xe_multigpu_madvise(gpu2->fd, vm[1], addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu2->fd, 0, gpu2->vram_regions[0], exec_queue[0]);
+
+	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
+	xe_multigpu_prefetch(gpu2->fd, vm[1], addr, SZ_4K, &sync,
+			     sync_addr, exec_queue[1], flags);
+	free((void *)sync_addr);
+
+	/* Execute ATOMIC_INC on GPU2 */
+	sync_addr = (void *)((char *)batch_addr[1] + SZ_4K);
+	sync.addr = to_user_pointer((uint64_t *)sync_addr);
+	sync.timeline_value = EXEC_SYNC_VAL;
+	*sync_addr = 0;
+
+	xe_exec_sync(gpu2->fd, exec_queue[1], batch_addr[1], &sync, 1);
+	if (*sync_addr != EXEC_SYNC_VAL)
+		xe_wait_ufence(gpu2->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[1],
+			       NSEC_PER_SEC * 10);
+
+	igt_assert_eq(*(uint64_t *)addr, ATOMIC_OP_VAL + 1);
+
+	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
+	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
+	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
+	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[1]);
+	free(data);
+
+	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);
+	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]);
+}
+
 static void
 gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
 		       struct xe_svm_gpu_info *dst,
@@ -330,6 +472,18 @@ gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
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
@@ -337,6 +491,8 @@ test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
 {
 	if (flags & MULTIGPU_XGPU_ACCESS)
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_mem_access_wrapper, flags);
+	if (flags & MULTIGPU_ATOMIC_OP)
+		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_atomic_inc_wrapper, flags);
 }
 
 struct section {
@@ -357,6 +513,8 @@ igt_main
 	const struct section msections[] = {
 		{ "xgpu-access-basic", MULTIGPU_BASIC | MULTIGPU_XGPU_ACCESS },
 		{ "xgpu-access-prefetch", MULTIGPU_PREFETCH | MULTIGPU_XGPU_ACCESS },
+		{ "atomic-op-basic", MULTIGPU_BASIC | MULTIGPU_ATOMIC_OP },
+		{ "atomic-op-prefetch", MULTIGPU_PREFETCH | MULTIGPU_ATOMIC_OP },
 		{ NULL },
 	};
 
@@ -380,7 +538,7 @@ igt_main
 		}
 	}
 
-	igt_describe("gpu-gpu write-read");
+	igt_describe("multigpu svm operations");
 	for (const struct section *s = msections; s->name; s++) {
 		igt_subtest_f("mgpu-%s", s->name)
 			test_mgpu_exec(gpu_cnt, gpus, &eci, s->flags);
-- 
2.48.1

