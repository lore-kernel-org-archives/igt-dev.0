Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F351D11700
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 09:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC69410E359;
	Mon,  1 Dec 2025 09:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jdRQMUxr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC78810E342
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 09:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764579722; x=1796115722;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=XfQLewEbkhjIgmrFgjV8zklhxfkilxPQBUVtlDkhNjA=;
 b=jdRQMUxr1SV81JhLokK27g++MCXOM3uGWYxEKE3JSXBN4ytB+GIzO3w0
 f0jGcJFMl2ujku6EnB65ZD9/4orzuZSOqV+oeGysY+qx+CQr4uD3KYtGC
 M5Eqj4rCxhmfH+hrWJkaMpITlyeei1+A+oQOPUc32sqJQqz2AtGc+OeYF
 Dt7xMeoLgc1cn0YYrM06Pf2LrZ2ljv0mWHeMD0ieGQHYZY+9PvIgjPUFz
 2KWk5CWNSCRrJfTxq/S806Z5YQFRWVPQ95alZOEdeNoSvycd90uFiBlje
 K6nh6iUHTxme/YYuWFvUeOleDCPqrw8TeMgln3ZzIAxEmTQBPuEqsHgbN A==;
X-CSE-ConnectionGUID: 97CjWGMZTH2gAi5lPykNzA==
X-CSE-MsgGUID: f9Z+rWcjTjOAni6kEpmKeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77199401"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="77199401"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:02:02 -0800
X-CSE-ConnectionGUID: 4DfrpuOrSpWiXbcvCgfs+g==
X-CSE-MsgGUID: 7uD3SOn1QJG44TG/Ks1prQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="198501549"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..)
 ([10.1.40.114])
 by orviesa004.jf.intel.com with ESMTP; 01 Dec 2025 01:02:03 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 thomas.hellstrom@intel.com, pravalika.gurram@intel.com
Subject: [PATCH i-g-t v9 10/10] tests/intel/xe_multi-gpusvm: Add SVM multi-GPU
 migration test
Date: Mon,  1 Dec 2025 09:02:01 +0000
Message-ID: <20251201090201.326595-11-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251201090201.326595-1-nishit.sharma@intel.com>
References: <20251121162537.77551-1-nishit.sharma@intel.com>
 <20251201090201.326595-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
devices and remains accessible across all agents in a
multi-GPU environment.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_multi_gpusvm.c | 122 ++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index 688ee0757..d7d6ab116 100644
--- a/tests/intel/xe_multi_gpusvm.c
+++ b/tests/intel/xe_multi_gpusvm.c
@@ -127,6 +127,18 @@
  * Description:
  *	Multi-GPU page fault test with conflicting madvise regions
  *
+ * SUBTEST: mgpu-migration-basic
+ * Description:
+ *	Test buffer migration across multiple GPUs and memory domains
+ *	Validates that a shared buffer can migrate between system memory,
+ *	GPU1 VRAM, and GPU2 VRAM while maintaining data coherency.
+ *
+ * SUBTEST: mgpu-migration-prefetch
+ * Description:
+ *	Test buffer migration across multiple GPUs with explicit prefetch operations
+ *	Similar to mgpu-migration-basic but uses XE_VM_PREFETCH_ASYNC to explicitly
+ *	trigger page migration before GPU access
+ *
  */
 
 #define MAX_XE_REGIONS	8
@@ -153,6 +165,7 @@
 #define MULTIGPU_PFAULT_OP		BIT(8)
 #define MULTIGPU_CONC_ACCESS		BIT(9)
 #define MULTIGPU_CONFLICT		BIT(10)
+#define MULTIGPU_MIGRATE		BIT(11)
 
 #define INIT	2
 #define STORE	3
@@ -220,6 +233,10 @@ static void gpu_simult_test_wrapper(struct xe_svm_gpu_info *src,
 				    struct drm_xe_engine_class_instance *eci,
 				    unsigned int flags);
 
+static void gpu_migration_test_wrapper(struct xe_svm_gpu_info *src,
+				       struct xe_svm_gpu_info *dst,
+				       struct drm_xe_engine_class_instance *eci,
+				       unsigned int flags);
 static void
 conflicting_madvise(struct xe_svm_gpu_info *gpu1,
 		    struct xe_svm_gpu_info *gpu2,
@@ -1374,6 +1391,95 @@ conflicting_madvise(struct xe_svm_gpu_info *gpu1,
 	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]);
 }
 
+static void
+multigpu_migrate_test(struct xe_svm_gpu_info *gpu1,
+		      struct xe_svm_gpu_info *gpu2,
+		      struct drm_xe_engine_class_instance *eci,
+		      unsigned int flags)
+{
+	uint64_t addr;
+	uint32_t vm[2], exec_queue[2], batch1_bo[2];
+	uint64_t batch1_addr[2];
+	uint64_t *data;
+	uint32_t test_pattern_sys, test_pattern_gpu1, test_pattern_gpu2;
+	void *copy_dst;
+	uint32_t final_value;
+
+	test_pattern_sys = 0x12345678;
+	test_pattern_gpu1 = 0xDEADBEEF;
+	test_pattern_gpu2 = 0xCAFEBABE;
+
+	/* Skip if either GPU doesn't support faults */
+	if (!gpu1->supports_faults || !gpu2->supports_faults) {
+		igt_debug("Both GPUs must support page faults for this test\n");
+		return;
+	}
+
+	create_vm_and_queue(gpu1, eci, &vm[0], &exec_queue[0]);
+	create_vm_and_queue(gpu2, eci, &vm[1], &exec_queue[1]);
+
+	data = aligned_alloc(SZ_2M, SZ_4K);
+	igt_assert(data);
+	memset(data, 0, SZ_4K);
+	addr = to_user_pointer(data);
+
+	copy_dst = aligned_alloc(SZ_2M, SZ_4K);
+	igt_assert(copy_dst);
+
+	igt_info("=== Phase 1: System Memory → GPU1 VRAM ===\n");
+
+	/* CPU writes initial pattern in system memory */
+	WRITE_ONCE(*(uint32_t *)data, test_pattern_sys);
+	igt_info("CPU wrote 0x%x to system memory\n", test_pattern_sys);
+
+	/* GPU1 writes new pattern - should happen in GPU1 VRAM */
+	store_dword_batch_init(gpu1->fd, vm[0], addr, &batch1_bo[0], &batch1_addr[0],
+			       test_pattern_gpu1);
+
+	/*GPU1: Madvise and Prefetch Ops with preferred location GPU1 VRAM */
+	gpu_madvise_sync(gpu1, vm[0], exec_queue[0], addr, &batch1_addr[0], flags);
+
+	igt_info("=== Phase 2: GPU1 VRAM → GPU2 VRAM ===\n");
+
+	/* GPU2: copy GPU1's value */
+	gpu_batch_create(gpu2, vm[1], exec_queue[1], addr, to_user_pointer(copy_dst),
+			 &batch1_bo[1], &batch1_addr[1], flags, INIT);
+
+	/*GPU2: Madvise and Prefetch Ops with preferred location GPU2 VRAM */
+	gpu_madvise_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(copy_dst),
+			 &batch1_addr[1], flags);
+
+	/* Verify GPU1 wrote correctly */
+	final_value = *(uint32_t *)copy_dst;
+	//igt_assert_eq_u32(READ_ONCE(*(uint32_t *)copy_dst), test_pattern_gpu1);
+	igt_assert_eq_u32(final_value, test_pattern_gpu1);
+
+	igt_info("=== Phase 3: GPU2 VRAM → System Memory ===\n");
+
+	/* GPU1 writes new pattern - should happen in GPU1 VRAM */
+	store_dword_batch_init(gpu2->fd, vm[1], to_user_pointer(copy_dst),
+			       &batch1_bo[1], &batch1_addr[1], test_pattern_gpu2);
+
+	/*GPU2: Madvise and Prefetch Ops with preferred location GPU2 VRAM */
+	gpu_madvise_sync(gpu2, vm[1], exec_queue[1], to_user_pointer(copy_dst),
+			 &batch1_addr[1], flags);
+
+	/* CPU access should migrate back to system memory */
+	igt_assert_eq_u32(READ_ONCE(*(uint32_t *)copy_dst), test_pattern_gpu2);
+
+	igt_info("Migration test completed successfully\n");
+
+	munmap((void *)batch1_addr[0], BATCH_SIZE(gpu1->fd));
+	munmap((void *)batch1_addr[1], BATCH_SIZE(gpu2->fd));
+	batch_fini(gpu1->fd, vm[0], batch1_bo[0], batch1_addr[0]);
+	batch_fini(gpu2->fd, vm[1], batch1_bo[1], batch1_addr[1]);
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
@@ -1446,6 +1552,18 @@ gpu_simult_test_wrapper(struct xe_svm_gpu_info *src,
 	multigpu_access_test(src, dst, eci, flags);
 }
 
+static void
+gpu_migration_test_wrapper(struct xe_svm_gpu_info *src,
+			   struct xe_svm_gpu_info *dst,
+			   struct drm_xe_engine_class_instance *eci,
+			   unsigned int flags)
+{
+	igt_assert(src);
+	igt_assert(dst);
+
+	multigpu_migrate_test(src, dst, eci, flags);
+}
+
 static void
 test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
 	       struct drm_xe_engine_class_instance *eci,
@@ -1463,6 +1581,8 @@ test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_fault_test_wrapper, flags);
 	if (flags & MULTIGPU_CONC_ACCESS)
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_simult_test_wrapper, flags);
+	if (flags & MULTIGPU_MIGRATE)
+		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_migration_test_wrapper, flags);
 }
 
 struct section {
@@ -1504,6 +1624,8 @@ igt_main
 		{ "concurrent-access-basic", MULTIGPU_CONC_ACCESS },
 		{ "concurrent-access-prefetch", MULTIGPU_PREFETCH | MULTIGPU_CONC_ACCESS },
 		{ "concurrent-access-conflict", MULTIGPU_CONFLICT | MULTIGPU_CONC_ACCESS },
+		{ "migration-basic", MULTIGPU_MIGRATE },
+		{ "migration-prefetch", MULTIGPU_PREFETCH | MULTIGPU_MIGRATE },
 		{ NULL },
 	};
 
-- 
2.48.1

