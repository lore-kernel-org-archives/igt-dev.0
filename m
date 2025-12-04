Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CCDD1D86A
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 05:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEE310E841;
	Thu,  4 Dec 2025 05:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gg1Qmsj9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E6410E1B8
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 05:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764825053; x=1796361053;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=r5DBdV6Np22G/+qejhFhHsSmCxYRVVivDbDUka1i6kU=;
 b=Gg1Qmsj9OZW7Ywl+jaN4vF08NyiNhJbhAkS72pAAV3XPIL4pociO5vEd
 sKBEeYUPD6O82XISPlPtIKMhb7Dz1yF939S2dxbzbqD74oeXtb/IB6Tsv
 rvWLpGP+leOA9RDudS5p5z10bUdnLvJEnHraGw2dMgpOCbpQPc374RveU
 cAIvN87ybSntrBZjP+x8hdah0DEopTPOyyTyna3xWJf8JMXvHGGco3k7R
 S/2OFg1fwDDKzzpb+ERzwt/PfBr2LrbivZ0LpZn4Oq9DXdx4oVGf8DtC8
 NnpapPtkZcMzf7GSkjTLW1+h67qTimLtDiR8O04juXikQ8hzYZI10l1/A g==;
X-CSE-ConnectionGUID: n3BnysN4QZqR+naXv5mZ8A==
X-CSE-MsgGUID: lEhc+UyeR5ukGaGcjWSyfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="92314041"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="92314041"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 21:10:52 -0800
X-CSE-ConnectionGUID: MRZ6U3qeTkq1XuDhL3JP0g==
X-CSE-MsgGUID: R1Xt8sY5TTSg8HluJm4waw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="195678360"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.43])
 by fmviesa010.fm.intel.com with ESMTP; 03 Dec 2025 21:10:51 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH v11 08/10] tests/intel/xe_multigpu_svm: Add SVM multi-GPU
 simultaneous access test
Date: Thu,  4 Dec 2025 05:10:49 +0000
Message-ID: <20251204051051.27495-9-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251204051051.27495-1-nishit.sharma@intel.com>
References: <20251204051051.27495-1-nishit.sharma@intel.com>
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

This test launches atomic increment workloads on two GPUs in parallel,
both accessing the same SVM buffer. It verifies that concurrent atomic
operations from multiple GPUs produce the expected result, ensuring data
integrity and the absence of race conditions in a
multi-GPU SVM environment.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel/xe_multigpu_svm.c | 193 ++++++++++++++++++++++++++++++++++
 1 file changed, 193 insertions(+)

diff --git a/tests/intel/xe_multigpu_svm.c b/tests/intel/xe_multigpu_svm.c
index 4a0a28229..bf57fae7d 100644
--- a/tests/intel/xe_multigpu_svm.c
+++ b/tests/intel/xe_multigpu_svm.c
@@ -13,6 +13,7 @@
 #include "intel_mocs.h"
 #include "intel_reg.h"
 
+#include "intel_gpu_commands.h"
 #include "time.h"
 
 #include "xe/xe_gt.h"
@@ -101,6 +102,17 @@
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
@@ -112,6 +124,7 @@
 #define COPY_SIZE SZ_64M
 #define	ATOMIC_OP_VAL	56
 #define BATCH_VALUE	60
+#define NUM_ITER	200
 
 #define MULTIGPU_PREFETCH		BIT(1)
 #define MULTIGPU_XGPU_ACCESS		BIT(2)
@@ -121,6 +134,7 @@
 #define MULTIGPU_PERF_OP		BIT(6)
 #define MULTIGPU_PERF_REM_COPY		BIT(7)
 #define MULTIGPU_PFAULT_OP		BIT(8)
+#define MULTIGPU_CONC_ACCESS		BIT(9)
 
 #define INIT	2
 #define STORE	3
@@ -181,6 +195,11 @@ static void gpu_fault_test_wrapper(struct xe_svm_gpu_info *src,
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
@@ -1051,6 +1070,164 @@ pagefault_test_multigpu(struct xe_svm_gpu_info *gpu1,
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
+	uint64_t *sync_addr[2];
+	uint32_t verify_batch_bo;
+	uint64_t verify_batch_addr;
+	uint64_t *verify_result;
+	uint32_t final_value;
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
+	WRITE_ONCE(*(uint64_t *)addr, 0);
+
+	/* GPU1: Atomic Batch create */
+	gpu_batch_create(gpu1, vm[0], exec_queue[0], addr, 0,
+			 &batch_bo[0], &batch_addr[0], flags, ATOMIC);
+	/* GPU2: Atomic Batch create */
+	gpu_batch_create(gpu2, vm[1], exec_queue[1], addr, 0,
+			 &batch_bo[1], &batch_addr[1], flags, ATOMIC);
+
+	/* gpu_madvise_sync calls xe_exec() also, here intention is different */
+	xe_multigpu_madvise(gpu1->fd, vm[0], addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_ATOMIC,
+			    DRM_XE_ATOMIC_GLOBAL, 0, 0, exec_queue[0]);
+
+	xe_multigpu_madvise(gpu1->fd, vm[0], addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu1->fd, 0, gpu1->vram_regions[0], exec_queue[0]);
+
+	xe_multigpu_madvise(gpu2->fd, vm[1], addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_ATOMIC,
+			    DRM_XE_ATOMIC_GLOBAL, 0, 0, exec_queue[1]);
+
+	xe_multigpu_madvise(gpu2->fd, vm[1], addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu2->fd, 0, gpu2->vram_regions[0], exec_queue[1]);
+
+	setup_sync(&sync[0], &sync_addr[0], BIND_SYNC_VAL);
+	setup_sync(&sync[1], &sync_addr[1], BIND_SYNC_VAL);
+
+	xe_multigpu_prefetch(gpu1->fd, vm[0], addr, SZ_4K, &sync[0],
+			     sync_addr[0], exec_queue[0], flags);
+
+	xe_multigpu_prefetch(gpu2->fd, vm[1], addr, SZ_4K, &sync[1],
+			     sync_addr[1], exec_queue[1], flags);
+
+	free(sync_addr[0]);
+	free(sync_addr[1]);
+
+	igt_info("Starting %d concurrent atomic increment iterations\n", NUM_ITER);
+	for (int i = 0; i < NUM_ITER; i++) {
+		bool last = (i == NUM_ITER - 1);
+
+		if (last) {
+			sync_addr[0] = (void *)((char *)batch_addr[0] + SZ_4K);
+			sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
+			sync[0].type = DRM_XE_SYNC_TYPE_USER_FENCE;
+			sync[0].addr = to_user_pointer((uint64_t *)sync_addr[0]);
+			sync[0].timeline_value = EXEC_SYNC_VAL + i;
+			WRITE_ONCE(*sync_addr[0], 0);
+
+			sync_addr[1] = (void *)((char *)batch_addr[1] + SZ_4K);
+			sync[1].flags = DRM_XE_SYNC_FLAG_SIGNAL;
+			sync[1].type = DRM_XE_SYNC_TYPE_USER_FENCE;
+			sync[1].addr = to_user_pointer((uint64_t *)sync_addr[1]);
+			sync[1].timeline_value = EXEC_SYNC_VAL + i;
+			WRITE_ONCE(*sync_addr[1], 0);
+		}
+
+		/* === CONCURRENT EXECUTION: Launch both GPUs simultaneously === */
+		xe_exec_sync(gpu1->fd, exec_queue[0], batch_addr[0],
+			     last ? &sync[0] : NULL, last ? 1 : 0);
+
+		xe_exec_sync(gpu2->fd, exec_queue[1], batch_addr[1],
+			     last ? &sync[1] : NULL, last ? 1 : 0);
+	}
+
+	 /* NOW wait only for the last operations to complete */
+	final_timeline = EXEC_SYNC_VAL + NUM_ITER - 1;
+	if (NUM_ITER > 0) {
+		if (READ_ONCE(*sync_addr[0]) != final_timeline)
+			xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr[0], final_timeline,
+				       exec_queue[0], NSEC_PER_SEC * 30);
+
+		if (READ_ONCE(*sync_addr[1]) != final_timeline)
+			xe_wait_ufence(gpu2->fd, (uint64_t *)sync_addr[1], final_timeline,
+				       exec_queue[1], NSEC_PER_SEC * 30);
+	}
+
+	igt_info("Both GPUs completed execution %u\n", READ_ONCE(*(uint32_t *)addr));
+
+	/* === Verification using GPU read (not CPU) === */
+	verify_result = aligned_alloc(SZ_2M, SZ_4K);
+	igt_assert(verify_result);
+	memset(verify_result, 0xDE, SZ_4K);
+
+	/* Use GPU1 to read final value */
+	gpu_batch_create(gpu1, vm[0], exec_queue[0], addr, to_user_pointer(verify_result),
+			 &verify_batch_bo, &verify_batch_addr, flags, INIT);
+
+	sync_addr[0] = (void *)((char *)verify_batch_addr + SZ_4K);
+	sync[0].addr = to_user_pointer((uint64_t *)sync_addr[0]);
+	sync[0].timeline_value = EXEC_SYNC_VAL;
+	sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[0].type = DRM_XE_SYNC_TYPE_USER_FENCE;
+	WRITE_ONCE(*sync_addr[0], 0);
+
+	xe_exec_sync(gpu1->fd, exec_queue[0], verify_batch_addr, &sync[0], 1);
+	if (READ_ONCE(*sync_addr[0]) != EXEC_SYNC_VAL)
+		xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr[0], EXEC_SYNC_VAL,
+			       exec_queue[0], NSEC_PER_SEC * 10);
+
+	/* NOW CPU can read verify_result */
+	final_value = READ_ONCE(*(uint32_t *)verify_result);
+
+	igt_info("GPU verification batch copied value: %u\n", final_value);
+	igt_info("CPU direct read shows: %u\n", (unsigned int)*(uint64_t *)addr);
+
+	/* Expected: 0 + (NUM_ITER * 2 GPUs) = 400 */
+	igt_assert_f((final_value == 2 * NUM_ITER),
+		     "Expected %u value, got %u\n",
+		     2 * NUM_ITER, final_value);
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
@@ -1111,6 +1288,18 @@ gpu_fault_test_wrapper(struct xe_svm_gpu_info *src,
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
@@ -1126,6 +1315,8 @@ test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_latency_test_wrapper, flags);
 	if (flags & MULTIGPU_PFAULT_OP)
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_fault_test_wrapper, flags);
+	if (flags & MULTIGPU_CONC_ACCESS)
+		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_simult_test_wrapper, flags);
 }
 
 struct section {
@@ -1163,6 +1354,8 @@ igt_main
 		  MULTIGPU_PREFETCH | MULTIGPU_PERF_OP | MULTIGPU_PERF_REM_COPY },
 		{ "pagefault-basic", MULTIGPU_PFAULT_OP },
 		{ "pagefault-prefetch", MULTIGPU_PREFETCH | MULTIGPU_PFAULT_OP },
+		{ "concurrent-access-basic", MULTIGPU_CONC_ACCESS },
+		{ "concurrent-access-prefetch", MULTIGPU_PREFETCH | MULTIGPU_CONC_ACCESS },
 		{ NULL },
 	};
 
-- 
2.48.1

