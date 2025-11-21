Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907F3CFC28C
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 16:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CECB10E8E6;
	Fri, 21 Nov 2025 16:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DuTmURpk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF8110E662
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 16:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763742339; x=1795278339;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=0baHTdU8dkDgFagm8yZwlRjmbEo82uCc14Og+4nMeQM=;
 b=DuTmURpkzjZ5KBde86Mqs6v7ZNnV8lCTPEn0aTMjfW/GiFcW0oXqZyY9
 QUM+MhEhNN4ug0CmrOx/b3wiuzlUnt+QAdBLf/lOmpoXMyMJh6NoM2wrZ
 qzx/2rnvhkI1lNyXYJWmthPqD19qbsXO44I2/RAWnIgtT0zZ8kV5VoZzi
 bqG/6JvrDV7aB6pQYiOcfl/QTTQ1zutXwZjtWARbhBXs0/Lf3gNQgyUsT
 Jekt+Q0qhPhxlSql4vfnN7/ctF0sdr+b/a1OTm0xLwjAXeert5PjIOOdP
 LPmaLvTsavGaCD8mJU2xhqvez5IOmEqL+Qb+msbBt/EyCngssPblPeqIi Q==;
X-CSE-ConnectionGUID: 2n0UgjHAQmCWp2A/xwNiDA==
X-CSE-MsgGUID: VEXQPPgdQ0q4GFNxithwbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65029752"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="65029752"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 08:25:38 -0800
X-CSE-ConnectionGUID: +EzRPFbZRzeX3UBURLf75A==
X-CSE-MsgGUID: ueT2b0cdSAKusJHPDbin3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="215096193"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..)
 ([10.1.40.114])
 by fmviesa002.fm.intel.com with ESMTP; 21 Nov 2025 08:25:38 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH i-g-t v8 08/10] tests/intel/xe_multi_gpusvm: Add SVM multi-GPU
 simultaneous access test
Date: Fri, 21 Nov 2025 16:25:35 +0000
Message-ID: <20251121162537.77551-9-nishit.sharma@intel.com>
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

This test launches compute or copy workloads on both GPUs that access the same
SVM buffer, using synchronization primitives (fences/semaphores) to coordinate
access. It verifies data integrity and checks for the absence of race conditions
in a multi-GPU SVM environment.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_multi_gpusvm.c | 160 ++++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index 2f3caa8e7..7f3c5e63c 100644
--- a/tests/intel/xe_multi_gpusvm.c
+++ b/tests/intel/xe_multi_gpusvm.c
@@ -13,6 +13,7 @@
 #include "intel_mocs.h"
 #include "intel_reg.h"
 
+#include "intel_gpu_commands.h"
 #include "time.h"
 
 #include "xe/xe_gt.h"
@@ -98,6 +99,17 @@
  *	Test cross-GPU memory access with prefetch to verify page fault
  *	suppression when memory is pre-migrated to target GPU's VRAM
  *
+ * SUBTEST: mgpu-concurrent-access-basic
+ * Description:
+ *	Test concurrent atomic memory operations where multiple GPUs
+ *	simultaneously access and modify the same memory location without
+ *	prefetch to validate cross-GPU coherency and synchronization
+ *
+ * SUBTEST: mgpu-concurrent-access-prefetch
+ * Description:
+ *	Test concurrent atomic memory operations with prefetch where
+ *	multiple GPUs simultaneously access shared memory to validate
+ *	coherency with memory migration and local VRAM access
  */
 
 #define MAX_XE_REGIONS	8
@@ -118,6 +130,7 @@
 #define MULTIGPU_PERF_OP		BIT(6)
 #define MULTIGPU_PERF_REM_COPY		BIT(7)
 #define MULTIGPU_PFAULT_OP		BIT(8)
+#define MULTIGPU_CONC_ACCESS		BIT(9)
 
 struct xe_svm_gpu_info {
 	bool supports_faults;
@@ -173,6 +186,11 @@ static void gpu_fault_test_wrapper(struct xe_svm_gpu_info *src,
 				   struct drm_xe_engine_class_instance *eci,
 				   unsigned int flags);
 
+static void gpu_simult_test_wrapper(struct xe_svm_gpu_info *src,
+				    struct xe_svm_gpu_info *dst,
+				    struct drm_xe_engine_class_instance *eci,
+				    unsigned int flags);
+
 static void
 create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct drm_xe_engine_class_instance *eci,
 		    uint32_t *vm, uint32_t *exec_queue)
@@ -1020,6 +1038,132 @@ pagefault_test_multigpu(struct xe_svm_gpu_info *gpu1,
 	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]);
 }
 
+static void
+multigpu_access_test(struct xe_svm_gpu_info *gpu1,
+		     struct xe_svm_gpu_info *gpu2,
+		     struct drm_xe_engine_class_instance *eci,
+		     unsigned int flags)
+{
+	uint64_t addr;
+	uint32_t vm[2];
+	uint32_t exec_queue[2];
+	uint32_t batch_bo[2];
+	struct test_exec_data *data;
+	uint64_t batch_addr[2];
+	struct drm_xe_sync sync[2] = {};
+	volatile uint64_t *sync_addr[2];
+	uint32_t verify_batch_bo;
+	uint64_t verify_batch_addr;
+	uint64_t *verify_result;
+	uint32_t final_value;
+	const int num_iterations = 100;
+	uint64_t final_timeline;
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
+	*(uint64_t *)addr = 0;
+
+	atomic_batch_init(gpu1->fd, vm[0], addr, &batch_bo[0], &batch_addr[0]);
+	atomic_batch_init(gpu2->fd, vm[1], addr, &batch_bo[1], &batch_addr[1]);
+
+	xe_multigpu_madvise(gpu1->fd, vm[0], addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu1->fd, 0, gpu1->vram_regions[0], exec_queue[0]);
+
+	setup_sync(&sync[0], &sync_addr[0], BIND_SYNC_VAL);
+	xe_multigpu_prefetch(gpu1->fd, vm[0], addr, SZ_4K, &sync[0],
+			     sync_addr[0], exec_queue[0], flags);
+	free((void *)sync_addr[0]);
+
+	igt_info("Starting %d concurrent atomic increment iterations\n", num_iterations);
+	for (int i = 0; i < num_iterations; i++) {
+		sync_addr[0] = (void *)((char *)batch_addr[0] + SZ_4K);
+		sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[0].type = DRM_XE_SYNC_TYPE_USER_FENCE;
+		sync[0].addr = to_user_pointer((uint64_t *)sync_addr[0]);
+		sync[0].timeline_value = EXEC_SYNC_VAL + i;
+		*sync_addr[0] = 0;
+
+		sync_addr[1] = (void *)((char *)batch_addr[1] + SZ_4K);
+		sync[1].flags = DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].type = DRM_XE_SYNC_TYPE_USER_FENCE;
+		sync[1].addr = to_user_pointer((uint64_t *)sync_addr[1]);
+		sync[1].timeline_value = EXEC_SYNC_VAL + i;
+		*sync_addr[1] = 0;
+
+		/* === CONCURRENT EXECUTION: Launch both GPUs simultaneously === */
+		xe_exec_sync(gpu1->fd, exec_queue[0], batch_addr[0], &sync[0], 1);
+		xe_exec_sync(gpu2->fd, exec_queue[1], batch_addr[1], &sync[1], 1);
+	}
+
+	 /* NOW wait only for the last operations to complete */
+	final_timeline = EXEC_SYNC_VAL + num_iterations - 1;
+        if (*sync_addr[0] != final_timeline)
+		xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr[0], final_timeline,
+			       exec_queue[0], NSEC_PER_SEC * 30);
+
+        if (*sync_addr[1] != final_timeline)
+		xe_wait_ufence(gpu2->fd, (uint64_t *)sync_addr[1], final_timeline,
+			       exec_queue[1], NSEC_PER_SEC * 30);
+
+	igt_info("Both GPUs completed execution %#llx\n", (unsigned long long)*(uint64_t *)addr);
+
+	/* === Verification using GPU read (not CPU) === */
+	verify_result = aligned_alloc(SZ_2M, SZ_4K);
+	igt_assert(verify_result);
+	memset(verify_result, 0xDE, SZ_4K);
+
+	/* Use GPU1 to read final value */
+	batch_init(gpu1->fd, vm[0], addr, to_user_pointer(verify_result),
+		   SZ_4K, &verify_batch_bo, &verify_batch_addr);
+
+	sync_addr[0] = (void *)((char *)verify_batch_addr + SZ_4K);
+	sync[0].addr = to_user_pointer((uint64_t *)sync_addr[0]);
+	sync[0].timeline_value = EXEC_SYNC_VAL;
+	sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[0].type = DRM_XE_SYNC_TYPE_USER_FENCE;
+	*sync_addr[0] = 0;
+
+	xe_exec_sync(gpu1->fd, exec_queue[0], verify_batch_addr, &sync[0], 1);
+	if (*sync_addr[0] != EXEC_SYNC_VAL)
+		xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr[0], EXEC_SYNC_VAL,
+			       exec_queue[0], NSEC_PER_SEC * 10);
+
+	/* NOW CPU can read verify_result */
+	final_value = *(uint32_t *)verify_result;
+
+	igt_info("GPU verification batch copied value: %u\n", final_value);
+	igt_info("CPU direct read shows: %u\n", (unsigned int)*(uint64_t *)addr);
+
+        /* Expected: 0 + (100 iterations * 2 GPUs) = 200 */
+        igt_assert_f((final_value == 200),
+		     "Expected %u value, got %u\n",
+		     200, final_value);
+
+	munmap((void *)verify_batch_addr, BATCH_SIZE(gpu1->fd));
+	batch_fini(gpu1->fd, vm[0], verify_batch_bo, verify_batch_addr);
+	free(verify_result);
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
@@ -1080,6 +1224,18 @@ gpu_fault_test_wrapper(struct xe_svm_gpu_info *src,
 	pagefault_test_multigpu(src, dst, eci, flags);
 }
 
+static void
+gpu_simult_test_wrapper(struct xe_svm_gpu_info *src,
+			struct xe_svm_gpu_info *dst,
+			struct drm_xe_engine_class_instance *eci,
+			unsigned int flags)
+{
+	igt_assert(src);
+	igt_assert(dst);
+
+	multigpu_access_test(src, dst, eci, flags);
+}
+
 static void
 test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
 	       struct drm_xe_engine_class_instance *eci,
@@ -1095,6 +1251,8 @@ test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_latency_test_wrapper, flags);
 	if (flags & MULTIGPU_PFAULT_OP)
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_fault_test_wrapper, flags);
+	if (flags & MULTIGPU_CONC_ACCESS)
+		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_simult_test_wrapper, flags);
 }
 
 struct section {
@@ -1130,6 +1288,8 @@ igt_main
 		  MULTIGPU_PREFETCH | MULTIGPU_PERF_OP | MULTIGPU_PERF_REM_COPY },
 		{ "pagefault-basic", MULTIGPU_BASIC | MULTIGPU_PFAULT_OP },
 		{ "pagefault-prefetch", MULTIGPU_PREFETCH | MULTIGPU_PFAULT_OP },
+		{ "concurrent-access-basic", MULTIGPU_BASIC | MULTIGPU_CONC_ACCESS },
+		{ "concurrent-access-prefetch", MULTIGPU_PREFETCH | MULTIGPU_CONC_ACCESS },
 		{ NULL },
 	};
 
-- 
2.48.1

