Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70491CD8CB1
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 17:10:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D8810E904;
	Thu, 13 Nov 2025 17:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="efd9d8i2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D2A10E8F3
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 17:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763053803; x=1794589803;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=TV4E+SM+A3sXPl7apo6LjJH26vdEN4lBLzNptQnC3no=;
 b=efd9d8i2v5LUa8+TMx3Nx+gOHN8SCwQayMAoGRH3RaBrZIoTLn9Rmq+V
 nss9hlG0A5xzBp8npDgmUa6wvMuy4+u3g3N+bxeIJZN67jewRqSnApy+i
 KvHQCVhWdhZ7bB4DJOTdMqdGxM6TbTcyDylzc12DxSkjUc7HEeNqMHPBC
 Jimjyzdce61SWF7erx4ZIMZKxbfxSAs5wvWFUG/xoabdQy/jfQXGso7B2
 YWV8bOcnTd/CVXDq3Pob/w+AroX5SxKaTFw8C0NNuBctqZ5p+dTFfch7D
 0p5F9n8nk/Qp2fSP6VrT0aDmU8ONiCVHUupzfBJZ3/z7fGtRXPT64ZftU w==;
X-CSE-ConnectionGUID: Z4eriphHQReum/zt0Zmmfg==
X-CSE-MsgGUID: fV67wosbSl2RWx9YOSTLyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64850233"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="64850233"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:10:03 -0800
X-CSE-ConnectionGUID: GOAXIJjQSFuIg8fr3DAndA==
X-CSE-MsgGUID: y4by5p9bSUiEYzIVCxz31Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189394620"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.39])
 by fmviesa006.fm.intel.com with ESMTP; 13 Nov 2025 09:10:02 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Subject: [PATCH i-g-t v7 08/10] tests/intel/xe_multi_gpusvm: Add SVM multi-GPU
 simultaneous access test
Date: Thu, 13 Nov 2025 17:10:00 +0000
Message-ID: <20251113171001.635563-9-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251113171001.635563-1-nishit.sharma@intel.com>
References: <20251113171001.635563-1-nishit.sharma@intel.com>
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

This test launches compute or copy workloads on both GPUs that access the same
SVM buffer, using synchronization primitives (fences/semaphores) to coordinate
access. It verifies data integrity and checks for the absence of race conditions
in a multi-GPU SVM environment.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_multi_gpusvm.c | 133 ++++++++++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index 6feb543ae..dc2a8f9c8 100644
--- a/tests/intel/xe_multi_gpusvm.c
+++ b/tests/intel/xe_multi_gpusvm.c
@@ -54,6 +54,11 @@
  * Description:
  * 	This test intentionally triggers page faults by accessing unmapped SVM
  * 	regions from both GPUs
+ *
+ * SUBTEST: concurrent-access-multi-gpu
+ * Description:
+ * 	This tests aunches simultaneous workloads on both GPUs accessing the
+ * 	same SVM buffer synchronizes with fences, and verifies data integrity
  */
 
 #define MAX_XE_REGIONS	8
@@ -126,6 +131,11 @@ static void gpu_fault_test_wrapper(struct xe_svm_gpu_info *src,
 				   struct drm_xe_engine_class_instance *eci,
 				   void *extra_args);
 
+static void gpu_simult_test_wrapper(struct xe_svm_gpu_info *src,
+				    struct xe_svm_gpu_info *dst,
+				    struct drm_xe_engine_class_instance *eci,
+				    void *extra_args);
+
 static void
 create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct drm_xe_engine_class_instance *eci,
 		    uint32_t *vm, uint32_t *exec_queue)
@@ -900,6 +910,108 @@ gpu_coherecy_test_wrapper(struct xe_svm_gpu_info *src,
 	coherency_test_multigpu(src, dst, eci, args->op_mod, args->prefetch_req);
 }
 
+static void
+multigpu_access_test(struct xe_svm_gpu_info *gpu0,
+		     struct xe_svm_gpu_info *gpu1,
+		     struct drm_xe_engine_class_instance *eci,
+		     bool no_prefetch)
+{
+	uint64_t addr;
+	uint32_t vm[2];
+	uint32_t exec_queue[2];
+	uint32_t batch_bo[2];
+	struct test_exec_data *data;
+	uint64_t batch_addr[2];
+	struct drm_xe_sync sync[2] = {};
+	volatile uint64_t *sync_addr[2];
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
+	atomic_batch_init(gpu0->fd, vm[0], addr, &batch_bo[0], &batch_addr[0]);
+	*shared_val = ATOMIC_OP_VAL - 2;
+	atomic_batch_init(gpu1->fd, vm[1], addr, &batch_bo[1], &batch_addr[1]);
+
+	/* Place destination in an optionally remote location to test */
+	xe_multigpu_madvise(gpu0->fd, vm[0], addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu0->fd, 0, gpu0->vram_regions[0], exec_queue[0],
+			    0, 0);
+	xe_multigpu_madvise(gpu1->fd, vm[1], addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu1->fd, 0, gpu1->vram_regions[0], exec_queue[1],
+			    0, 0);
+
+	setup_sync(&sync[0], &sync_addr[0], BIND_SYNC_VAL);
+	setup_sync(&sync[1], &sync_addr[1], BIND_SYNC_VAL);
+
+	/* For simultaneous access need to call xe_wait_ufence for both gpus after prefetch */
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
+	for (int i = 0; i < 100; i++) {
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
+	igt_assert_eq(*(uint64_t *)addr, 254);
+
+	munmap((void *)batch_addr[0], BATCH_SIZE(gpu0->fd));
+	munmap((void *)batch_addr[1], BATCH_SIZE(gpu0->fd));
+	batch_fini(gpu0->fd, vm[0], batch_bo[0], batch_addr[0]);
+	batch_fini(gpu1->fd, vm[1], batch_bo[1], batch_addr[1]);
+	free(data);
+
+	cleanup_vm_and_queue(gpu0, vm[0], exec_queue[0]);
+	cleanup_vm_and_queue(gpu1, vm[1], exec_queue[1]);
+}
+
 static void
 gpu_latency_test_wrapper(struct xe_svm_gpu_info *src,
 			 struct xe_svm_gpu_info *dst,
@@ -926,6 +1038,19 @@ gpu_fault_test_wrapper(struct xe_svm_gpu_info *src,
         pagefault_test_multigpu(src, dst, eci, args->prefetch_req);
 }
 
+static void
+gpu_simult_test_wrapper(struct xe_svm_gpu_info *src,
+			struct xe_svm_gpu_info *dst,
+			struct drm_xe_engine_class_instance *eci,
+			void *extra_args)
+{
+	struct multigpu_ops_args *args = (struct multigpu_ops_args *)extra_args;
+	igt_assert(src);
+	igt_assert(dst);
+
+	multigpu_access_test(src, dst, eci, args->prefetch_req);
+}
+
 igt_main
 {
 	struct xe_svm_gpu_info gpus[MAX_XE_GPUS];
@@ -1001,6 +1126,14 @@ igt_main
 		for_each_gpu_pair(gpu_cnt, gpus, &eci, gpu_fault_test_wrapper, &fault_args);
 	}
 
+	igt_subtest("concurrent-access-multi-gpu") {
+		struct multigpu_ops_args simul_args;
+		simul_args.prefetch_req = 1;
+		for_each_gpu_pair(gpu_cnt, gpus, &eci, gpu_simult_test_wrapper, &simul_args);
+		simul_args.prefetch_req = 0;
+		for_each_gpu_pair(gpu_cnt, gpus, &eci, gpu_simult_test_wrapper, &simul_args);
+	}
+
 	igt_fixture {
 		int cnt;
 
-- 
2.48.1

