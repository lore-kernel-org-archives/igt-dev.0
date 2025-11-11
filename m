Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB15CD13D3
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 16:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A064510E60C;
	Tue, 11 Nov 2025 16:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PsrxmgyU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE92E10E60B
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 16:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762878899; x=1794414899;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Ve+fyqs2vClfEINml1DHFjNrvymlwb0SVJeRslKy0L4=;
 b=PsrxmgyUq5TbwVHzhpTIm6IxJ7++dmDbdBnUtiCTmcesvqYdZUMNMEh3
 JJeCCodOI/ew1r5+cvqydfKnosUxPawmwePd78aYwjCLIo9xKGLwJvYzL
 x3hzVLmdRWVn/S5HNzwPNO+m4JJHbWPPMbLKSptom/+g8bK8p7/m/oyvA
 fw9Mjb3ozOnUiTPWqXK6g4cS51vCNGSk6xQvRM14WA9vyd2ynd90ZScK4
 dZv118TgnxRitGZbwILNYq7AmwrAaON/sycRchJpxSZQNKjcJdBWHKq2I
 METpzcm5a1GMksIDJj9uuUP5VcGzNagsN0A8y+Q+QcIMcyyxySDIHGOnX A==;
X-CSE-ConnectionGUID: +5RHx5CdS82PGcRJEdtGTQ==
X-CSE-MsgGUID: tW+k4Ay7QWGfT1kxyzWgxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="68583962"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="68583962"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 08:34:58 -0800
X-CSE-ConnectionGUID: ujcKA8uYQEq9uQO28TzI5A==
X-CSE-MsgGUID: IXMQmZB2S3G31DrM4LNBuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="189734294"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.39])
 by fmviesa010.fm.intel.com with ESMTP; 11 Nov 2025 08:34:57 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v5 8/8] tests/intel/xe_multi-gpusvm.c: Add SVM multi-GPU
 migration test
Date: Tue, 11 Nov 2025 16:34:56 +0000
Message-ID: <20251111163456.496063-9-nishit.sharma@intel.com>
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

This test allocates a buffer in SVM, accesses it from GPU 1, then GPU 2
and then the CPU. It verifies that the buffer migrates correctly between
devices and remains accessible across all agents in a multi-GPU environment.
---
 tests/intel/xe_multi_gpusvm.c | 231 ++++++++++++++++++++++++++++++++++
 tests/intel/xe_multisvm.c     |   2 +
 2 files changed, 233 insertions(+)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index bb287c1d3..3159a4180 100644
--- a/tests/intel/xe_multi_gpusvm.c
+++ b/tests/intel/xe_multi_gpusvm.c
@@ -64,6 +64,11 @@
  * Description:
  * 	This test checks conflicting madvise by allocating shared buffer
  * 	prefetches from both and checks for migration conflicts
+ *
+ * SUBTEST: migrate-test-multi-gpu
+ * Description:
+ * 	This test allocates an SVM buffer, accesses it from GPU 1, GPU 2, and CPU,
+ * 	and verifies migration and accessibility between devices
  */
 
 #define MAX_XE_REGIONS	8
@@ -148,6 +153,11 @@ static void gpu_conflict_test_wrapper(struct xe_svm_gpu_info *src,
 				      struct drm_xe_engine_class_instance *eci,
 				      void *extra_args);
 
+static void gpu_migration_test_wrapper(struct xe_svm_gpu_info *src,
+				       struct xe_svm_gpu_info *dst,
+				       struct drm_xe_engine_class_instance *eci,
+				       void *extra_args);
+
 static void for_each_gpu_pair(int num_gpus, struct xe_svm_gpu_info *gpus,
 			      struct drm_xe_engine_class_instance *eci,
 			      gpu_pair_fn fn, void *extra_args)
@@ -1258,6 +1268,206 @@ multigpu_access_test(struct xe_svm_gpu_info *gpu0,
 	xe_vm_destroy(gpu1->fd, vm[1]);
 }
 
+static void
+multigpu_migrate_test(struct xe_svm_gpu_info *gpu0,
+		      struct xe_svm_gpu_info *gpu1,
+		      struct drm_xe_engine_class_instance *eci,
+		      bool prefetch_req)
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
+        vm[0] = xe_vm_create(gpu0->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+        exec_queue[0] = xe_exec_queue_create(gpu0->fd, vm[0], eci, 0);
+        xe_vm_bind_lr_sync(gpu0->fd, vm[0], 0, 0, 0, 1ull <<  gpu0->va_bits, DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+
+        vm[1] = xe_vm_create(gpu1->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+        exec_queue[1] = xe_exec_queue_create(gpu1->fd, vm[1], eci, 0);
+        xe_vm_bind_lr_sync(gpu1->fd, vm[1], 0, 0, 0, 1ull <<  gpu1->va_bits, DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+
+        data1 = aligned_alloc(SZ_2M, SZ_4K);
+       	igt_assert(data1);
+	addr = to_user_pointer(data1);
+
+	copy_dst = aligned_alloc(SZ_2M, SZ_4K);
+	igt_assert(copy_dst);
+
+	xe_vm_madvise(gpu0->fd, vm[0], addr, SZ_4K, 0,
+		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+		      DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0, 0);
+
+        store_dword_batch_init(gpu0->fd, vm[0], addr, &batch1_bo[0], &batch1_addr[0], value);
+
+        /* Place destination in GPU0 local memory location to test */
+        xe_vm_madvise(gpu0->fd, vm[0], addr, SZ_4K, 0,
+                      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+                      gpu0->fd, 0, gpu0->vram_regions[0]);
+
+        sync_addr = malloc(sizeof(*sync_addr));
+        igt_assert(!!sync_addr);
+        sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+        sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = BIND_SYNC_VAL;
+        *sync_addr = 0;
+
+	/* prefetch full buffer for GPU0 */
+	if (prefetch_req) {
+		xe_vm_prefetch_async(gpu0->fd, vm[0], 0, 0, addr, SZ_4K, &sync, 1,
+				     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+		if (*sync_addr != BIND_SYNC_VAL)
+			xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, exec_queue[0],
+				       NSEC_PER_SEC * 10);
+	}
+        free((void *)sync_addr);
+
+        sync_addr = (void *)((char *)batch1_addr[0] + SZ_4K);
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = EXEC_SYNC_VAL;
+        *sync_addr = 0;
+
+        /* Execute STORE command on GPU0 */
+        xe_exec_sync(gpu0->fd, exec_queue[0], batch1_addr[0], &sync, 1);
+        if (*sync_addr != EXEC_SYNC_VAL)
+                xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[0],
+			       NSEC_PER_SEC * 10);
+
+        igt_assert_eq(*(uint64_t *)addr, value);
+
+	/* Creating batch for GPU1 using addr as Src which have value from GPU0 */
+        store_dword_batch_init(gpu1->fd, vm[1], addr, &batch1_bo[1], &batch1_addr[1], value + 10);
+
+        /* Place destination in GPU1 local memory location to test */
+        xe_vm_madvise(gpu1->fd, vm[1], addr, SZ_4K, 0,
+                      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+                      gpu1->fd, 0, gpu1->vram_regions[0]);
+
+        sync_addr = malloc(sizeof(*sync_addr));
+        igt_assert(!!sync_addr);
+        sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+        sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = BIND_SYNC_VAL;
+        *sync_addr = 0;
+
+	/* prefetch full buffer for GPU1 */
+	if (prefetch_req) {
+		xe_vm_prefetch_async(gpu1->fd, vm[1], 0, 0, addr,
+				     SZ_4K, &sync, 1,
+				     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+		if (*sync_addr != BIND_SYNC_VAL)
+			xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, exec_queue[1],
+				       NSEC_PER_SEC * 10);
+	}
+        free((void *)sync_addr);
+
+        sync_addr = (void *)((char *)batch1_addr[1] + SZ_4K);
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = EXEC_SYNC_VAL;
+        *sync_addr = 0;
+
+        /* Execute COPY command on GPU1 */
+        xe_exec_sync(gpu1->fd, exec_queue[1], batch1_addr[1], &sync, 1);
+        if (*sync_addr != EXEC_SYNC_VAL)
+                xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[1],
+			       NSEC_PER_SEC * 10);
+
+        igt_assert_eq(*(uint64_t *)addr, value + 10);
+
+        /* CPU writes 10, memset set bytes no integer hence memset fills 4 bytes with 0x0A */
+        memset((void *)(uintptr_t)addr, 10, sizeof(int));
+        igt_assert_eq(*(uint64_t *)addr, 0x0A0A0A0A);
+
+	/* Creating batch for GPU1 using addr as Src which have value from GPU0 */
+	batch_init(gpu1->fd, vm[1], addr, to_user_pointer(copy_dst),
+			SZ_4K, &batch1_bo[1], &batch1_addr[1]);
+	
+        /* Place destination in GPU1 local memory location to test */
+        xe_vm_madvise(gpu1->fd, vm[1], addr, SZ_4K, 0,
+                      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+                      gpu1->fd, 0, gpu1->vram_regions[0]);
+
+        sync_addr = malloc(sizeof(*sync_addr));
+        igt_assert(!!sync_addr);
+        sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+        sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = BIND_SYNC_VAL;
+        *sync_addr = 0;
+
+        /* prefetch full buffer for GPU1 */
+        if (prefetch_req) {
+                xe_vm_prefetch_async(gpu1->fd, vm[1], 0, 0, addr,
+                                     SZ_4K, &sync, 1,
+                                     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+                if (*sync_addr != BIND_SYNC_VAL)
+                        xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, exec_queue[1],
+                                       NSEC_PER_SEC * 10);
+        }
+        free((void *)sync_addr);
+
+        sync_addr = (void *)((char *)batch1_addr[1] + SZ_4K);
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = EXEC_SYNC_VAL;
+        *sync_addr = 0;
+
+        /* Execute COPY command on GPU1 */
+        xe_exec_sync(gpu1->fd, exec_queue[1], batch1_addr[1], &sync, 1);
+        if (*sync_addr != EXEC_SYNC_VAL)
+                xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[1],
+                               NSEC_PER_SEC * 10);
+
+        igt_assert_eq(*(uint64_t *)copy_dst, 0x0A0A0A0A);
+
+        munmap((void *)batch1_addr[0], BATCH_SIZE(gpu0->fd));
+        munmap((void *)batch1_addr[1], BATCH_SIZE(gpu1->fd));
+        batch_fini(gpu0->fd, vm[0], batch1_bo[0], batch1_addr[0]);
+        batch_fini(gpu1->fd, vm[1], batch1_bo[1], batch1_addr[1]);
+        free(data1);
+        free(copy_dst);
+
+        xe_vm_unbind_lr_sync(gpu0->fd, vm[0], 0, 0, 1ull << gpu0->va_bits);
+        xe_exec_queue_destroy(gpu0->fd, exec_queue[0]);
+        xe_vm_destroy(gpu0->fd, vm[0]);
+
+        xe_vm_unbind_lr_sync(gpu1->fd, vm[1], 0, 0, 1ull << gpu1->va_bits);
+        xe_exec_queue_destroy(gpu1->fd, exec_queue[1]);
+        xe_vm_destroy(gpu1->fd, vm[1]);
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
+static void
+gpu_coherecy_test(struct xe_svm_gpu_info *src_gpu,
+		  struct xe_svm_gpu_info *dst_gpu,
+		  struct drm_xe_engine_class_instance *eci,
+		  bool coh_fail,
+		  bool prefetch_req)
+{
+	igt_assert(src_gpu);
+	igt_assert(dst_gpu);
+
+        coherency_test_multigpu(src_gpu, dst_gpu, eci, coh_fail, prefetch_req);
+}
+
 static void
 gpu_conflict_test_wrapper(struct xe_svm_gpu_info *src,
 			  struct xe_svm_gpu_info *dst,
@@ -1310,6 +1520,19 @@ gpu_simult_test_wrapper(struct xe_svm_gpu_info *src,
 	multigpu_access_test(src, dst, eci, args->prefetch_req);
 }
 
+static void
+gpu_migration_test_wrapper(struct xe_svm_gpu_info *src,
+			   struct xe_svm_gpu_info *dst,
+			   struct drm_xe_engine_class_instance *eci,
+			   void *extra_args)
+{
+	struct multigpu_ops_args *args = (struct multigpu_ops_args *)extra_args;
+	igt_assert(src);
+	igt_assert(dst);
+
+       multigpu_migrate_test(src, dst, eci, args->prefetch_req);
+}
+
 igt_main
 {
 	struct xe_svm_gpu_info gpus[MAX_XE_GPUS];
@@ -1396,6 +1619,14 @@ igt_main
 		for_each_gpu_pair(gpu_cnt, gpus, &eci, gpu_simult_test_wrapper, &simul_args);
 	}
 
+	igt_subtest("migrate-test-multi-gpu") {
+		struct multigpu_ops_args migrate_args;
+		migrate_args.prefetch_req = 1;
+		for_each_gpu_pair(gpu_cnt, gpus, &eci, gpu_migration_test_wrapper, &migrate_args);
+		migrate_args.prefetch_req = 0;
+		for_each_gpu_pair(gpu_cnt, gpus, &eci, gpu_migration_test_wrapper, &migrate_args);
+	}
+
 	igt_fixture {
 		int cnt;
 
diff --git a/tests/intel/xe_multisvm.c b/tests/intel/xe_multisvm.c
index a57b3d62a..7bb41c62f 100644
--- a/tests/intel/xe_multisvm.c
+++ b/tests/intel/xe_multisvm.c
@@ -47,6 +47,7 @@ struct xe_svm_gpu_info {
 	int fd;
 };
 
+#if 0
 static void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 			       uint64_t addr, uint64_t size, uint32_t flags)
 {
@@ -84,6 +85,7 @@ static void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
 		xe_wait_ufence(fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, 0, NSEC_PER_SEC * 10);
 	free((void *)sync_addr);
 }
+#endif
 
 static void batch_init(int fd, uint32_t vm, uint64_t src_addr, uint64_t dst_addr,
 		       uint64_t copy_size, uint32_t *bo, uint64_t *addr)
-- 
2.48.1

