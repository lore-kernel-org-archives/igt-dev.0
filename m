Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091BCCCFA13
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 15:50:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A5710E63E;
	Tue,  4 Nov 2025 15:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OXgLGfBw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714C310E639
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 15:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762271414; x=1793807414;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JgKIbic5Yo4xndx96aNIvMKx8F6inKmaNZphkV1TLtI=;
 b=OXgLGfBwUkrOkvyXka9/NqcxEZiYPa430Kr03PLxZas2P8wyEKjE6mBj
 mxvqCaxuDslWpQ7sIXKH1ejNl56QihUVguMaND6tVtUC9SvE71/Xhoas+
 E/mqDFKiLnCXAxASGxN1VOXxQXbfUzPehWdKpG8eS/AWcgQbtWvUbTtR9
 vRouPB9AGNnIyIgDkXR1okbx/g+kvH955VvGu+/aYJR4zc+992DSabvLQ
 W/NgYq133cFQs7CQV3gqoaw01cP9zdI6KakgT4yLvFNLBnbJv8G/jhiR8
 Vug3DGqv9rYHPqKi3eFZx2iDceNHPOO9tU9CpxH1sktgIvEERRxp86Pj1 Q==;
X-CSE-ConnectionGUID: iWpbDjdaQa+epTj2FYku/A==
X-CSE-MsgGUID: WAPP5eBMT8aRBekpTCN8hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68206028"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="68206028"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 07:50:13 -0800
X-CSE-ConnectionGUID: dk3WbCsoQRuwRPTbSGgfnw==
X-CSE-MsgGUID: oZ4W6gRtTnSuUcVJgrme/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="191542276"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.72])
 by orviesa004.jf.intel.com with ESMTP; 04 Nov 2025 07:50:13 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Subject: [PATCH i-g-t v3 2/7] tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU
 atomic operations
Date: Tue,  4 Nov 2025 15:50:06 +0000
Message-ID: <20251104155012.679830-3-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251104155012.679830-1-nishit.sharma@intel.com>
References: <20251104155012.679830-1-nishit.sharma@intel.com>
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
 tests/intel/xe_multi_gpusvm.c | 186 ++++++++++++++++++++++++++++++++++
 1 file changed, 186 insertions(+)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index a88b46323..71bf01ba8 100644
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
@@ -49,8 +55,45 @@ struct xe_svm_gpu_info {
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
 static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
 
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
@@ -222,6 +265,144 @@ gpu_mem_access(struct xe_svm_gpu_info *src_gpu,
 	copy_src_dst(src_gpu, dst_gpu, eci);
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
+	vm[0] = xe_vm_create(gpu0->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			     DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	exec_queue[0] = xe_exec_queue_create(gpu0->fd, vm[0], eci, 0);
+	xe_vm_bind_lr_sync(gpu0->fd, vm[0], 0, 0, 0, 1ull <<  gpu0->va_bits,
+			   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+
+	vm[1] = xe_vm_create(gpu1->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			     DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	exec_queue[1] = xe_exec_queue_create(gpu1->fd, vm[1], eci, 0);
+	xe_vm_bind_lr_sync(gpu1->fd, vm[1], 0, 0, 0, 1ull <<  gpu1->va_bits,
+			   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
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
+	xe_vm_madvise(gpu0->fd, vm[0], addr, SZ_4K, 0,
+		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+		      gpu0->fd, 0, gpu0->vram_regions[0]);
+
+	sync_addr = malloc(sizeof(*sync_addr));
+	igt_assert(!!sync_addr);
+	sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+	sync.addr = to_user_pointer((uint64_t *)sync_addr);
+	sync.timeline_value = BIND_SYNC_VAL;
+	*sync_addr = 0;
+
+	if (prefetch_req) {
+		xe_vm_prefetch_async(gpu0->fd, vm[0], 0, 0, addr,
+				     SZ_4K, &sync, 1,
+				     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+		if (*sync_addr != BIND_SYNC_VAL)
+			xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr, BIND_SYNC_VAL,
+				       exec_queue[0], NSEC_PER_SEC * 10);
+	}
+	free((void *)sync_addr);
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
+	xe_vm_madvise(gpu1->fd, vm[1], addr, SZ_4K, 0,
+		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+		      gpu1->fd, 0, gpu1->vram_regions[0]);
+
+	sync_addr = malloc(sizeof(*sync_addr));
+	igt_assert(!!sync_addr);
+	sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+	sync.addr = to_user_pointer((uint64_t *)sync_addr);
+	sync.timeline_value = BIND_SYNC_VAL;
+	*sync_addr = 0;
+
+	if (prefetch_req) {
+		xe_vm_prefetch_async(gpu1->fd, vm[1], 0, 0, addr,
+				     SZ_4K, &sync, 1,
+				     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+		if (*sync_addr != BIND_SYNC_VAL)
+			xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, BIND_SYNC_VAL,
+				       exec_queue[1], NSEC_PER_SEC * 10);
+	}
+	free((void *)sync_addr);
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
+	xe_vm_unbind_lr_sync(gpu0->fd, vm[0], 0, 0, 1ull << gpu0->va_bits);
+	xe_exec_queue_destroy(gpu0->fd, exec_queue[0]);
+	xe_vm_destroy(gpu0->fd, vm[0]);
+
+	xe_vm_unbind_lr_sync(gpu1->fd, vm[1], 0, 0, 1ull << gpu1->va_bits);
+	xe_exec_queue_destroy(gpu1->fd, exec_queue[1]);
+	xe_vm_destroy(gpu1->fd, vm[1]);
+}
+
+static void
+gpu_atomic_inc(struct xe_svm_gpu_info *src_gpu,
+	       struct xe_svm_gpu_info *dst_gpu,
+	       struct drm_xe_engine_class_instance *eci,
+	       bool prefetch_req)
+{
+	igt_assert(src_gpu);
+	igt_assert(dst_gpu);
+
+	atomic_inc_op(src_gpu, dst_gpu, eci, prefetch_req);
+}
+
 igt_main
 {
 	struct xe_svm_gpu_info gpus[MAX_XE_GPUS];
@@ -256,6 +437,11 @@ igt_main
 	igt_subtest("cross-gpu-mem-access")
 		gpu_mem_access(&gpus[0], &gpus[1], &eci);
 
+	igt_subtest("atomic-inc-gpu-op") {
+		gpu_atomic_inc(&gpus[0], &gpus[1], &eci, 1);
+		gpu_atomic_inc(&gpus[0], &gpus[1], &eci, 0);
+	}
+
 	igt_fixture {
 		int cnt;
 
-- 
2.48.1

