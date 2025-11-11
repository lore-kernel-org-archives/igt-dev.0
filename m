Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F13ACCFA1E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 16:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A069910E60D;
	Tue, 11 Nov 2025 16:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="klzlLk84";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5FB10E11C
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 16:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762878899; x=1794414899;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ohBJerWwoUMIkKDB7kdTKy7k3kWhv0XB1HrxLMTL2HM=;
 b=klzlLk84PYAc/rxZyVQEO/bI1NVTtU9XbsBYWtE44OVYciQWM1NCxtdn
 V8BMe9Dj46TfTjANsG8KknLcz+oIu/S/zrlOEIc/YSlthXNBLT2xdhC4c
 tz8OmiLVTo+rE4VdbtCU24uQSW9tINQacg6AsnFdlpEYwQ/WSqDxBKm0D
 cefqVObzZlXVmpTz4G+eVMSjNVHKtdElEwxekn1nMCLZbOuzAkqhGQ98f
 JROpTUOv2iKIWXH8+qv3N88v7YyHcZrdT/X9xeeZQODsncYEeLU49ikIF
 knC2GfVKEHSUWohna7mDP90552h/TSOiI8T9ZkTFAx5Y51e6diAVM5Rrz g==;
X-CSE-ConnectionGUID: lN1nOTaRSs6SM1H5CUsvUA==
X-CSE-MsgGUID: r3CHDYJOQfyN35XEHBIwrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="68583961"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="68583961"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 08:34:58 -0800
X-CSE-ConnectionGUID: v9oo9FRdSOme2yZYdXP1gA==
X-CSE-MsgGUID: jzeOBRoST7OzF+ur9CeUhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="189734290"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.39])
 by fmviesa010.fm.intel.com with ESMTP; 11 Nov 2025 08:34:57 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v5 7/8] tests/intel/xe_multi_gpusvm.c: Add SVM multi-GPU
 conflicting madvise test
Date: Tue, 11 Nov 2025 16:34:55 +0000
Message-ID: <20251111163456.496063-8-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251111163456.496063-1-nishit.sharma@intel.com>
References: <20251111163456.496063-1-nishit.sharma@intel.com>
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
---
 tests/intel/xe_multi_gpusvm.c | 161 ++++++++++++++++++++++++++++++++++
 1 file changed, 161 insertions(+)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index 5b41b1b93..bb287c1d3 100644
--- a/tests/intel/xe_multi_gpusvm.c
+++ b/tests/intel/xe_multi_gpusvm.c
@@ -59,6 +59,11 @@
  * Description:
  * 	This tests aunches simultaneous workloads on both GPUs accessing the
  * 	same SVM buffer synchronizes with fences, and verifies data integrity
+ *
+ * SUBTEST: conflicting-madvise-gpu
+ * Description:
+ * 	This test checks conflicting madvise by allocating shared buffer
+ * 	prefetches from both and checks for migration conflicts
  */
 
 #define MAX_XE_REGIONS	8
@@ -69,6 +74,8 @@
 #define EXEC_SYNC_VAL 0x676767
 #define COPY_SIZE SZ_64M
 #define	ATOMIC_OP_VAL	56
+#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
+#define FIVE_SEC                (5LL * NSEC_PER_SEC)
 
 struct xe_svm_gpu_info {
         bool supports_faults;
@@ -136,6 +143,11 @@ static void gpu_simult_test_wrapper(struct xe_svm_gpu_info *src,
 				    struct drm_xe_engine_class_instance *eci,
 				    void *extra_args);
 
+static void gpu_conflict_test_wrapper(struct xe_svm_gpu_info *src,
+				      struct xe_svm_gpu_info *dst,
+				      struct drm_xe_engine_class_instance *eci,
+				      void *extra_args);
+
 static void for_each_gpu_pair(int num_gpus, struct xe_svm_gpu_info *gpus,
 			      struct drm_xe_engine_class_instance *eci,
 			      gpu_pair_fn fn, void *extra_args)
@@ -839,6 +851,134 @@ pagefault_test_multigpu(struct xe_svm_gpu_info *gpu0,
         xe_vm_destroy(gpu1->fd, vm[1]);
 }
 
+#define	XE_BO_FLAG_SYSTEM	BIT(1)
+#define XE_BO_FLAG_CPU_ADDR_MIRROR      BIT(24)
+
+static void
+conflicting_madvise(struct xe_svm_gpu_info *gpu0,
+		    struct xe_svm_gpu_info *gpu1,
+		    struct drm_xe_engine_class_instance *eci,
+		    bool no_prefetch)
+{
+	uint64_t addr;
+	uint32_t vm[2];
+	uint32_t exec_queue[2];
+	uint32_t batch_bo[2];
+	void *data;
+	uint64_t batch_addr[2];
+	struct drm_xe_sync sync[2] = {};
+	volatile uint64_t *sync_addr[2];
+
+	vm[0] = xe_vm_create(gpu0->fd,
+			     DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	exec_queue[0] = xe_exec_queue_create(gpu0->fd, vm[0], eci, 0);
+	xe_vm_bind_lr_sync(gpu0->fd, vm[0], 0, 0, 0, 1ull <<  gpu0->va_bits,
+			   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+
+	vm[1] = xe_vm_create(gpu1->fd,
+			     DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	exec_queue[1] = xe_exec_queue_create(gpu1->fd, vm[1], eci, 0);
+	xe_vm_bind_lr_sync(gpu1->fd, vm[1], 0, 0, 0, 1ull <<  gpu1->va_bits,
+			   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+
+	data = aligned_alloc(SZ_2M, SZ_4K);
+	igt_assert(data);
+	addr = to_user_pointer(data);
+
+	xe_vm_madvise(gpu0->fd, vm[0], addr, SZ_4K, 0,
+		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+		      DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0, 0);
+
+	store_dword_batch_init(gpu0->fd, vm[0], addr, &batch_bo[0], &batch_addr[0], 10);
+	store_dword_batch_init(gpu1->fd, vm[0], addr, &batch_bo[1], &batch_addr[1], 20);
+
+	/* Place destination in an optionally remote location to test */
+	xe_vm_madvise(gpu0->fd, vm[0], addr, SZ_4K, 0,
+		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+		      gpu1->fd, 0, gpu1->vram_regions[0]);
+
+	xe_vm_madvise(gpu1->fd, vm[1], addr, SZ_4K, 0,
+		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+		      gpu0->fd, 0, gpu0->vram_regions[0]);
+
+	sync_addr[0] = malloc(sizeof(*sync_addr));
+	sync_addr[1] = malloc(sizeof(*sync_addr));
+	igt_assert(!!sync_addr[0]);
+	igt_assert(!!sync_addr[1]);
+
+	sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[0].type = DRM_XE_SYNC_TYPE_USER_FENCE;
+	sync[0].addr = to_user_pointer((uint64_t *)sync_addr[0]);
+	sync[0].timeline_value = BIND_SYNC_VAL;
+	sync[1].flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].type = DRM_XE_SYNC_TYPE_USER_FENCE;
+	sync[1].addr = to_user_pointer((uint64_t *)sync_addr[1]);
+	sync[1].timeline_value = BIND_SYNC_VAL;
+	*sync_addr[0] = 0;
+	*sync_addr[1] = 0;
+
+	if(!no_prefetch) {
+		xe_vm_prefetch_async(gpu0->fd, vm[0], 0, 0, addr,
+				     SZ_4K, &sync[0], 1,
+				     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+
+		xe_vm_prefetch_async(gpu1->fd, vm[1], 0, 0, addr,
+				     SZ_4K, &sync[1], 1,
+				     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+
+		if (*sync_addr[0] != BIND_SYNC_VAL)
+			xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr[0], BIND_SYNC_VAL, exec_queue[0],
+				       NSEC_PER_SEC * 10);
+		free((void *)sync_addr[0]);
+		if (*sync_addr[1] != BIND_SYNC_VAL)
+			xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr[1], BIND_SYNC_VAL, exec_queue[1],
+				       NSEC_PER_SEC * 10);
+		free((void *)sync_addr[1]);
+	}
+
+	if (no_prefetch) {
+		free((void *)sync_addr[0]);
+		free((void *)sync_addr[1]);
+	}
+
+	for (int i = 0; i < 1; i++) {
+		sync_addr[0] = (void *)((char *)batch_addr[0] + SZ_4K);
+		sync[0].addr = to_user_pointer((uint64_t *)sync_addr[0]);
+		sync[0].timeline_value = EXEC_SYNC_VAL;
+
+		sync_addr[1] = (void *)((char *)batch_addr[1] + SZ_4K);
+		sync[1].addr = to_user_pointer((uint64_t *)sync_addr[1]);
+		sync[1].timeline_value = EXEC_SYNC_VAL;
+		*sync_addr[0] = 0;
+		*sync_addr[1] = 0;
+
+		xe_exec_sync(gpu0->fd, exec_queue[0], batch_addr[0], &sync[0], 1);
+		if (*sync_addr[0] != EXEC_SYNC_VAL)
+			xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr[0], EXEC_SYNC_VAL, exec_queue[0],
+				       NSEC_PER_SEC * 10);
+		xe_exec_sync(gpu1->fd, exec_queue[1], batch_addr[1], &sync[1], 1);
+		if (*sync_addr[1] != EXEC_SYNC_VAL)
+			xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr[1], EXEC_SYNC_VAL, exec_queue[1],
+				       NSEC_PER_SEC * 10);
+	}
+
+	igt_assert_eq(*(uint64_t *)addr, 20);
+
+	munmap((void *)batch_addr[0], BATCH_SIZE(gpu0->fd));
+	munmap((void *)batch_addr[1], BATCH_SIZE(gpu0->fd));
+	batch_fini(gpu0->fd, vm[0], batch_bo[0], batch_addr[0]);
+	batch_fini(gpu1->fd, vm[1], batch_bo[1], batch_addr[1]);
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
 static void
 atomic_inc_op(struct xe_svm_gpu_info *gpu0,
 	      struct xe_svm_gpu_info *gpu1,
@@ -1118,6 +1258,19 @@ multigpu_access_test(struct xe_svm_gpu_info *gpu0,
 	xe_vm_destroy(gpu1->fd, vm[1]);
 }
 
+static void
+gpu_conflict_test_wrapper(struct xe_svm_gpu_info *src,
+			  struct xe_svm_gpu_info *dst,
+			  struct drm_xe_engine_class_instance *eci,
+			  void *extra_args)
+{
+	struct multigpu_ops_args *args = (struct multigpu_ops_args *)extra_args;
+	igt_assert(src);
+	igt_assert(dst);
+
+        conflicting_madvise(src, dst, eci, args->prefetch_req);
+}
+
 static void
 gpu_latency_test_wrapper(struct xe_svm_gpu_info *src,
 			 struct xe_svm_gpu_info *dst,
@@ -1209,6 +1362,14 @@ igt_main
 		for_each_gpu_pair(gpu_cnt, gpus, &eci, gpu_coherecy_test_wrapper, &coh_args);
 	}
 
+	igt_subtest("conflicting-madvise-gpu") {
+		struct multigpu_ops_args conflict_args;
+		conflict_args.prefetch_req = 1;
+		for_each_gpu_pair(gpu_cnt, gpus, &eci, gpu_conflict_test_wrapper, &conflict_args);
+		conflict_args.prefetch_req = 0;
+		for_each_gpu_pair(gpu_cnt, gpus, &eci, gpu_conflict_test_wrapper, &conflict_args);
+	}
+
 	igt_subtest("latency-multi-gpu") {
 		struct multigpu_ops_args latency_args;
 		latency_args.prefetch_req = 1;
-- 
2.48.1

