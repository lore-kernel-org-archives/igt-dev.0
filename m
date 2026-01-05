Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE50CD0423
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 23:46:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1A310E448;
	Mon,  5 Jan 2026 23:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jm7m9ARt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1841610E448
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 23:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767656782; x=1799192782;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YMfGi3tlp2PmgVhKeHGCiR8tkwm1yY7Hw0ZV+JlYkBc=;
 b=Jm7m9ARtjeBu1J45XEZETLR+6EEy0KBXQ0bv0rJkGjZYNKrJ9eiOg0Oo
 3OGstwBd1RZBOCVF+2T6uOZbG6FfuujWxObMxlGXO330BlsqVFXRTc56I
 11R7rdhT+Y75oQo+o1wXh1ZdNF/E0i7yFhlsU0jV1977txKTS8svqGlVQ
 pQ4Ul3zVbjKf9TIOoLmsmSWPI2Qe/LVscrFqprmLYQmvtC1qGdQdDJUb8
 fOvEftL7JOuzSdUQxZmqVl5RDAbIllygtfKZ5pXc05EzqzPLOwtOHUbVg
 kf+z3EOSKA6061ZXPL7VWyUsgkTmaNNiB6OI6Zt4lB5IOJQVLdxNMSyiI A==;
X-CSE-ConnectionGUID: APtfx5I+RCeauVJx9Kmg0g==
X-CSE-MsgGUID: CfCibYJzT+S059GYSFYiUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="86445088"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="86445088"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 15:46:22 -0800
X-CSE-ConnectionGUID: T50K2+agQaqNYP+vlQfl2A==
X-CSE-MsgGUID: an55PTimSXGc6k6TUe5zRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202564942"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by orviesa008.jf.intel.com with ESMTP; 05 Jan 2026 15:46:22 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>, Nishit Sharma <nishit.sharma@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] tests/intel/xe_multigpu_svm: fix 32-bit build error
Date: Mon,  5 Jan 2026 23:46:14 +0000
Message-ID: <20260105234615.284403-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
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

The test was treating several ioctl-style __u64 user pointer
fields as native pointers and doing pointer arithmetic /
dereferences / munmap() directly on the integer values. On 32-bit
this triggers -Werror=int-to-pointer-cast and can also truncate
addresses. In addition, splitting 64-bit addresses with 1UL << 32
is not safe on 32-bit.

Fixes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/pipelines/1577551

Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 tests/intel/xe_multigpu_svm.c | 69 ++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 34 deletions(-)

diff --git a/tests/intel/xe_multigpu_svm.c b/tests/intel/xe_multigpu_svm.c
index fee738035..5583d781a 100644
--- a/tests/intel/xe_multigpu_svm.c
+++ b/tests/intel/xe_multigpu_svm.c
@@ -3,6 +3,7 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include <inttypes.h>
 #include <unistd.h>
 
 #include "drmtest.h"
@@ -407,10 +408,10 @@ static void batch_init(int fd, uint32_t vm, uint64_t src_addr,
 	cmd[i++] = height - 1;
 	cmd[i++] = width - 1;
 	cmd[i++] = width - 1;
-	cmd[i++] = src_addr & ((1UL << 32) - 1);
-	cmd[i++] = src_addr >> 32;
-	cmd[i++] = dst_addr & ((1UL << 32) - 1);
-	cmd[i++] = dst_addr >> 32;
+	cmd[i++] = lower_32_bits(src_addr);
+	cmd[i++] = upper_32_bits(src_addr);
+	cmd[i++] = lower_32_bits(dst_addr);
+	cmd[i++] = upper_32_bits(dst_addr);
 	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0)) {
 		cmd[i++] = mocs_index << XE2_MEM_COPY_SRC_MOCS_SHIFT | mocs_index;
 	} else {
@@ -542,7 +543,7 @@ gpu_madvise_exec_sync(struct xe_svm_gpu_info *gpu, struct xe_svm_gpu_info *xgpu,
 			     sync_addr, exec_queue, flags);
 	free(sync_addr);
 
-	sync_addr = (void *)((char *)*batch_addr + SZ_4K);
+	sync_addr = (uint64_t *)((char *)from_user_pointer(*batch_addr) + SZ_4K);
 	sync.addr = to_user_pointer((uint64_t *)sync_addr);
 	sync.timeline_value = EXEC_SYNC_VAL;
 	WRITE_ONCE(*sync_addr, 0);
@@ -630,7 +631,7 @@ copy_src_dst(struct xe_svm_gpu_info *gpu1,
 			     sync_addr, exec_queue[0], flags);
 	free(sync_addr);
 
-	sync_addr = (void *)((char *)batch_addr + SZ_4K);
+	sync_addr = (uint64_t *)((char *)from_user_pointer(batch_addr) + SZ_4K);
 	sync.addr = to_user_pointer((uint64_t *)sync_addr);
 	sync.timeline_value = EXEC_SYNC_VAL;
 	WRITE_ONCE(*sync_addr, 0);
@@ -645,7 +646,7 @@ copy_src_dst(struct xe_svm_gpu_info *gpu1,
 
 	free(copy_dst);
 	free(copy_src);
-	munmap((void *)batch_addr, BATCH_SIZE(gpu1->fd));
+	munmap(from_user_pointer(batch_addr), BATCH_SIZE(gpu1->fd));
 	batch_fini(gpu1->fd, vm[0], batch_bo, batch_addr);
 	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);
 }
@@ -680,7 +681,7 @@ atomic_inc_op(struct xe_svm_gpu_info *gpu1,
 	copy_dst = aligned_alloc(SZ_2M, SZ_4K);
 	igt_assert(copy_dst);
 
-	WRITE_ONCE(*(uint64_t *)addr, ATOMIC_OP_VAL - 1);
+	WRITE_ONCE(*(uint64_t *)from_user_pointer(addr), ATOMIC_OP_VAL - 1);
 
 	/* GPU1: Atomic Batch create */
 	gpu_batch_create(gpu1, vm[0], exec_queue[0], addr, 0,
@@ -715,12 +716,12 @@ atomic_inc_op(struct xe_svm_gpu_info *gpu1,
 	gpu_madvise_exec_sync(gpu1, gpu2, vm[0], exec_queue[0], addr,
 			      &batch_addr[0], flags, NULL);
 
-	final_value = *(uint32_t *)addr;
+	final_value = *(uint32_t *)from_user_pointer(addr);
 	/* NOW CPU can read copy_dst (GPU1 ATOMIC op) */
 	igt_assert_eq(final_value, ATOMIC_OP_VAL + 1);
 
-	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
-	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
+	munmap(from_user_pointer(batch_addr[0]), BATCH_SIZE(gpu1->fd));
+	munmap(from_user_pointer(batch_addr[1]), BATCH_SIZE(gpu2->fd));
 	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
 	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[1]);
 	free(data);
@@ -787,7 +788,7 @@ coherency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 
 		igt_info("verifying concurrent write race\n");
 
-		WRITE_ONCE(*(uint64_t *)addr, 0);
+		WRITE_ONCE(*(uint64_t *)from_user_pointer(addr), 0);
 
 		store_dword_batch_init(gpu1->fd, vm[0], addr, &batch1_bo[0],
 				       &batch1_addr[0], BATCH_VALUE + 10);
@@ -795,7 +796,7 @@ coherency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 				       &batch1_addr[1], BATCH_VALUE + 20);
 
 		/* Setup sync for GPU1 */
-		sync_addr0 = (void *)((char *)batch1_addr[0] + SZ_4K);
+		sync_addr0 = (uint64_t *)((char *)from_user_pointer(batch1_addr[0]) + SZ_4K);
 		sync0.flags = DRM_XE_SYNC_FLAG_SIGNAL;
 		sync0.type = DRM_XE_SYNC_TYPE_USER_FENCE;
 		sync0.addr = to_user_pointer((uint64_t *)sync_addr0);
@@ -803,7 +804,7 @@ coherency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 		WRITE_ONCE(*sync_addr0, 0);
 
 		/* Setup sync for GPU2 */
-		sync_addr1 = (void *)((char *)batch1_addr[1] + SZ_4K);
+		sync_addr1 = (uint64_t *)((char *)from_user_pointer(batch1_addr[1]) + SZ_4K);
 		sync1.flags = DRM_XE_SYNC_FLAG_SIGNAL;
 		sync1.type = DRM_XE_SYNC_TYPE_USER_FENCE;
 		sync1.addr = to_user_pointer((uint64_t *)sync_addr1);
@@ -845,19 +846,19 @@ coherency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 		else if (coh_result == 0)
 			igt_warn("Both writes failed - coherency issue\n");
 		else
-			igt_warn("Unexpected value 0x%lx - possible coherency corruption\n",
+			igt_warn("Unexpected value 0x%" PRIx64 " - possible coherency corruption\n",
 				 coh_result);
 
-		munmap((void *)batch1_addr[0], BATCH_SIZE(gpu1->fd));
-		munmap((void *)batch1_addr[1], BATCH_SIZE(gpu2->fd));
+		munmap(from_user_pointer(batch1_addr[0]), BATCH_SIZE(gpu1->fd));
+		munmap(from_user_pointer(batch1_addr[1]), BATCH_SIZE(gpu2->fd));
 
 		batch_fini(gpu1->fd, vm[0], batch1_bo[0], batch1_addr[0]);
 		batch_fini(gpu2->fd, vm[1], batch1_bo[1], batch1_addr[1]);
 		free(result);
 	}
 
-	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
-	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
+	munmap(from_user_pointer(batch_addr[0]), BATCH_SIZE(gpu1->fd));
+	munmap(from_user_pointer(batch_addr[1]), BATCH_SIZE(gpu2->fd));
 	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
 	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[1]);
 	free(data1);
@@ -995,8 +996,8 @@ latency_test_multigpu(struct xe_svm_gpu_info *gpu1,
 			igt_warn("Prefetch not providing expected performance benefit\n");
 	}
 
-	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
-	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
+	munmap(from_user_pointer(batch_addr[0]), BATCH_SIZE(gpu1->fd));
+	munmap(from_user_pointer(batch_addr[1]), BATCH_SIZE(gpu2->fd));
 
 	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
 	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[1]);
@@ -1109,8 +1110,8 @@ pagefault_test_multigpu(struct xe_svm_gpu_info *gpu1,
 			 pf_count_gpu2_after - pf_count_gpu2_before);
 	}
 
-	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
-	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
+	munmap(from_user_pointer(batch_addr[0]), BATCH_SIZE(gpu1->fd));
+	munmap(from_user_pointer(batch_addr[1]), BATCH_SIZE(gpu2->fd));
 	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
 	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[0]);
 	free(data);
@@ -1152,7 +1153,7 @@ multigpu_access_test(struct xe_svm_gpu_info *gpu1,
 	data[0].vm_sync = 0;
 	addr = to_user_pointer(data);
 
-	WRITE_ONCE(*(uint64_t *)addr, 0);
+	WRITE_ONCE(*(uint64_t *)from_user_pointer(addr), 0);
 
 	/* GPU1: Atomic Batch create */
 	gpu_batch_create(gpu1, vm[0], exec_queue[0], addr, 0,
@@ -1195,14 +1196,14 @@ multigpu_access_test(struct xe_svm_gpu_info *gpu1,
 		bool last = (i == NUM_ITER - 1);
 
 		if (last) {
-			sync_addr[0] = (void *)((char *)batch_addr[0] + SZ_4K);
+			sync_addr[0] = (uint64_t *)((char *)from_user_pointer(batch_addr[0]) + SZ_4K);
 			sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
 			sync[0].type = DRM_XE_SYNC_TYPE_USER_FENCE;
 			sync[0].addr = to_user_pointer((uint64_t *)sync_addr[0]);
 			sync[0].timeline_value = EXEC_SYNC_VAL + i;
 			WRITE_ONCE(*sync_addr[0], 0);
 
-			sync_addr[1] = (void *)((char *)batch_addr[1] + SZ_4K);
+			sync_addr[1] = (uint64_t *)((char *)from_user_pointer(batch_addr[1]) + SZ_4K);
 			sync[1].flags = DRM_XE_SYNC_FLAG_SIGNAL;
 			sync[1].type = DRM_XE_SYNC_TYPE_USER_FENCE;
 			sync[1].addr = to_user_pointer((uint64_t *)sync_addr[1]);
@@ -1230,7 +1231,7 @@ multigpu_access_test(struct xe_svm_gpu_info *gpu1,
 				       exec_queue[1], NSEC_PER_SEC * 30);
 	}
 
-	igt_info("Both GPUs completed execution %u\n", READ_ONCE(*(uint32_t *)addr));
+	igt_info("Both GPUs completed execution %u\n", READ_ONCE(*(uint32_t *)from_user_pointer(addr)));
 
 	/* === Verification using GPU read (not CPU) === */
 	verify_result = aligned_alloc(SZ_2M, SZ_4K);
@@ -1241,7 +1242,7 @@ multigpu_access_test(struct xe_svm_gpu_info *gpu1,
 	gpu_batch_create(gpu1, vm[0], exec_queue[0], addr, to_user_pointer(verify_result),
 			 &verify_batch_bo, &verify_batch_addr, flags, INIT);
 
-	sync_addr[0] = (void *)((char *)verify_batch_addr + SZ_4K);
+	sync_addr[0] = (uint64_t *)((char *)from_user_pointer(verify_batch_addr) + SZ_4K);
 	sync[0].addr = to_user_pointer((uint64_t *)sync_addr[0]);
 	sync[0].timeline_value = EXEC_SYNC_VAL;
 	sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
@@ -1257,19 +1258,19 @@ multigpu_access_test(struct xe_svm_gpu_info *gpu1,
 	final_value = READ_ONCE(*(uint32_t *)verify_result);
 
 	igt_info("GPU verification batch copied value: %u\n", final_value);
-	igt_info("CPU direct read shows: %u\n", (unsigned int)*(uint64_t *)addr);
+	igt_info("CPU direct read shows: %u\n", (unsigned int)*(uint64_t *)from_user_pointer(addr));
 
 	/* Expected: 0 + (NUM_ITER * 2 GPUs) = 400 */
 	igt_assert_f((final_value == 2 * NUM_ITER),
 		     "Expected %u value, got %u\n",
 		     2 * NUM_ITER, final_value);
 
-	munmap((void *)verify_batch_addr, BATCH_SIZE(gpu1->fd));
+	munmap(from_user_pointer(verify_batch_addr), BATCH_SIZE(gpu1->fd));
 	batch_fini(gpu1->fd, vm[0], verify_batch_bo, verify_batch_addr);
 	free(verify_result);
 
-	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
-	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
+	munmap(from_user_pointer(batch_addr[0]), BATCH_SIZE(gpu1->fd));
+	munmap(from_user_pointer(batch_addr[1]), BATCH_SIZE(gpu2->fd));
 	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
 	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[1]);
 	free(data);
@@ -1356,8 +1357,8 @@ multigpu_migrate_test(struct xe_svm_gpu_info *gpu1,
 
 	igt_info("Migration test completed successfully\n");
 
-	munmap((void *)batch1_addr[0], BATCH_SIZE(gpu1->fd));
-	munmap((void *)batch1_addr[1], BATCH_SIZE(gpu2->fd));
+	munmap(from_user_pointer(batch1_addr[0]), BATCH_SIZE(gpu1->fd));
+	munmap(from_user_pointer(batch1_addr[1]), BATCH_SIZE(gpu2->fd));
 	batch_fini(gpu1->fd, vm[0], batch1_bo[0], batch1_addr[0]);
 	batch_fini(gpu2->fd, vm[1], batch1_bo[1], batch1_addr[1]);
 	free(data);
-- 
2.43.0

