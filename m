Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC21CCFA06
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 14:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7947210E26E;
	Tue,  4 Nov 2025 14:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QGxv6GAW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477B410E625
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 14:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762266598; x=1793802598;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ITlB8J7lCaWbAjY6gTpolrhxv/6isAeZ5WZ5DWCTJnU=;
 b=QGxv6GAWdA9lBY8dMjlwEVpkx5XqbUFoOSmrdeMlUC3Oz8ahisKkUbnQ
 htr64h1vRrYrQw854ZEbw0XBLg2pZDL/QlT6r1bZEcWPWA9XjZB9K6uQ9
 DlWQ6IPKvzROf65ldaDrs4AHlS/jdbark6urDvyvkCEuMbWrG+dXj4w7O
 DRs3t65q7BivDduZy3jokO9qK8E14sZ62HpKz4zmc7VealzxEEUrFQNpZ
 SSXQXKXEC/A6iD1wmGdf2v8MaYUR/eilk7GopPfS/86kIL5J4lRzYLZd+
 7i57FUMgszel1yyG2ISOFf2PpRY2X3g0FW3A/1nOpd7u9SmK/2B5JGy7I w==;
X-CSE-ConnectionGUID: PZ3KTQytSLC0VB4nuObVcg==
X-CSE-MsgGUID: w2WsKVbRQOe2IQnrKPBhpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74966180"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="74966180"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 06:29:58 -0800
X-CSE-ConnectionGUID: FeNF+WCUQOW4I5xFnllFjg==
X-CSE-MsgGUID: HmS2JqMyShevloTTZe1iFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="192339883"
Received: from dut2943pvc.iind.intel.com ([10.190.215.39])
 by orviesa005.jf.intel.com with ESMTP; 04 Nov 2025 06:29:56 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH i-g-t v1 5/7] tests/intel/xe_multi-gpusvm.c: Add SVM multi-GPU
 fault handling test
Date: Tue,  4 Nov 2025 14:29:42 +0000
Message-ID: <20251104142947.51744-6-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104142947.51744-1-nishit.sharma@intel.com>
References: <20251104142947.51744-1-nishit.sharma@intel.com>
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

This test intentionally triggers page faults by accessing regions without
prefetch for both GPUs in a multi-GPU environment.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_multi_gpusvm.c | 226 ++++++++++++++++++++++++++++++++++
 1 file changed, 226 insertions(+)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index aa79c71bd..22b8ad95e 100644
--- a/tests/intel/xe_multi_gpusvm.c
+++ b/tests/intel/xe_multi_gpusvm.c
@@ -15,6 +15,7 @@
 
 #include "time.h"
 
+#include "xe/xe_gt.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
@@ -54,6 +55,11 @@
  * Description:
  * 	This test measures and compares latency and bandwidth for buffer access
  * 	from CPU, local GPU, and remote GPU
+ *
+ * SUBTEST: pagefault-multi-gpu
+ * Description:
+ * 	This test intentionally triggers page faults by accessing unmapped SVM
+ * 	regions from both GPUs
  */
 
 #define MAX_XE_REGIONS	8
@@ -661,6 +667,212 @@ latency_test_multigpu(struct xe_svm_gpu_info *gpu0,
         xe_vm_destroy(gpu1->fd, vm[1]);
 }
 
+static void
+pagefault_test_multigpu(struct xe_svm_gpu_info *gpu0,
+			struct xe_svm_gpu_info *gpu1,
+			struct drm_xe_engine_class_instance *eci)
+{
+        uint64_t addr;
+        uint32_t vm[2];
+        uint32_t exec_queue[2];
+        uint32_t batch_bo;
+        uint8_t *copy_dst;
+        uint64_t batch_addr;
+        struct drm_xe_sync sync = {};
+        volatile uint64_t *sync_addr;
+        int value = 60, pf_count_1, pf_count_2;
+	int pf_count_madvise_1, pf_count_madvise_2;
+        int shared_val[4];
+        struct test_exec_data *data;
+	const char *pf_count_stat = "svm_pagefault_count";
+
+        vm[0] = xe_vm_create(gpu0->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+        exec_queue[0] = xe_exec_queue_create(gpu0->fd, vm[0], eci, 0);
+        xe_vm_bind_lr_sync(gpu0->fd, vm[0], 0, 0, 0, 1ull <<  gpu0->va_bits, DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+
+        vm[1] = xe_vm_create(gpu1->fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+        exec_queue[1] = xe_exec_queue_create(gpu1->fd, vm[1], eci, 0);
+        xe_vm_bind_lr_sync(gpu1->fd, vm[1], 0, 0, 0, 1ull <<  gpu1->va_bits, DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
+
+        data = aligned_alloc(xe_get_default_alignment(gpu0->fd), SZ_64M);
+        igt_assert(data);
+        data[0].vm_sync = 0;
+        addr = to_user_pointer(data);
+
+        copy_dst = aligned_alloc(xe_get_default_alignment(gpu1->fd), SZ_64M);
+        igt_assert(copy_dst);
+
+	pf_count_1 = xe_gt_stats_get_count(gpu0->fd, eci->gt_id, pf_count_stat);
+	igt_info("pf_count before trigerring xe_exec on gpu1 without madvise :%d\n",
+		 pf_count_1);
+
+	/* checking pagefault count for gpu1 */
+        store_dword_batch_init(gpu0->fd, vm[0], addr, &batch_bo, &batch_addr, value);
+
+        sync_addr = malloc(sizeof(*sync_addr));
+        igt_assert(!!sync_addr);
+        sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+        sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = BIND_SYNC_VAL;
+        *sync_addr = 0;
+        sync_addr = (void *)((char *)batch_addr + SZ_4K);
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = EXEC_SYNC_VAL;
+        *sync_addr = 0;
+
+	/* Execute STORE command on GPU1 */
+        xe_exec_sync(gpu0->fd, exec_queue[0], batch_addr, &sync, 1);
+        if (*sync_addr != EXEC_SYNC_VAL)
+                xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[0],
+			       NSEC_PER_SEC * 10);
+
+	pf_count_2 = xe_gt_stats_get_count(gpu0->fd, eci->gt_id, pf_count_stat);
+	igt_info("pf_count after trigerring xe_exec on gpu1 without madvise :%d\n",
+		 pf_count_2 - pf_count_1);
+
+	memcpy(shared_val, (void *)addr, 4);
+        igt_assert_eq(shared_val[0], value);
+
+        /* CPU writes 10, memset set bytes no integer hence memset fills 4 bytes with 0x0A */
+        memset((void *)(uintptr_t)addr, 10, sizeof(int));
+        memcpy(shared_val, (void *)(uintptr_t)addr, sizeof(shared_val));
+        igt_assert_eq(shared_val[0], 0x0A0A0A0A);
+
+	pf_count_1 = xe_gt_stats_get_count(gpu1->fd, eci->gt_id, pf_count_stat);
+	igt_info("pf_count before trigerring xe_exec on gpu2 without madvise :%d\n",
+		 pf_count_1);
+
+	/* checking pagefault count for gpu2 */
+        store_dword_batch_init(gpu1->fd, vm[1], addr, &batch_bo, &batch_addr, value + 10);
+
+        sync_addr = malloc(sizeof(*sync_addr));
+        igt_assert(!!sync_addr);
+        sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+        sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = BIND_SYNC_VAL;
+        *sync_addr = 0;
+        sync_addr = (void *)((char *)batch_addr + SZ_4K);
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = EXEC_SYNC_VAL;
+        *sync_addr = 0;
+
+        /* Execute STORE command on GPU2 */
+        xe_exec_sync(gpu1->fd, exec_queue[1], batch_addr, &sync, 1);
+        if (*sync_addr != EXEC_SYNC_VAL)
+                xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[1],
+			       NSEC_PER_SEC * 10);
+
+	pf_count_2 = xe_gt_stats_get_count(gpu1->fd, eci->gt_id, pf_count_stat);
+	igt_info("pf_count after trigerring xe_exec on gpu2 without madvise :%d\n",
+		 pf_count_2 - pf_count_1);
+
+        memcpy(shared_val, (void *)addr, 4);
+        igt_assert_eq(shared_val[0], value + 10);
+
+	pf_count_madvise_1 = xe_gt_stats_get_count(gpu0->fd, eci->gt_id, pf_count_stat);
+	igt_info("pf_count before madvise on gpu1 :%d\n", pf_count_madvise_1);
+
+        store_dword_batch_init(gpu0->fd, vm[0], addr, &batch_bo, &batch_addr, value + 10);
+
+        /* Place destination in an optionally remote location to test */
+        xe_vm_madvise(gpu0->fd, vm[0], addr, COPY_SIZE, 0,
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
+        /* Prefetch half of destination */
+        xe_vm_prefetch_async(gpu0->fd, vm[0], 0, 0, addr, COPY_SIZE / 2, &sync, 1,
+                             DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+
+        if (*sync_addr != BIND_SYNC_VAL)
+                xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, exec_queue[0],
+			       NSEC_PER_SEC * 10);
+        free((void *)sync_addr);
+
+        sync_addr = (void *)((char *)batch_addr + SZ_4K);
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = EXEC_SYNC_VAL;
+        *sync_addr = 0;
+
+        /* Execute STORE command on GPU1 */
+        xe_exec_sync(gpu0->fd, exec_queue[0], batch_addr, &sync, 1);
+        if (*sync_addr != EXEC_SYNC_VAL)
+                xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[0],
+			       NSEC_PER_SEC * 10);
+
+	pf_count_madvise_2 = xe_gt_stats_get_count(gpu0->fd, eci->gt_id, pf_count_stat);
+	if (pf_count_madvise_2 != pf_count_madvise_1)
+		igt_warn("pf_count_madvise_2(%d) != pf_count_madvise_1(%d)\n",
+			 pf_count_madvise_2, pf_count_madvise_1);
+
+        memcpy(shared_val, (void *)addr, 4);
+        igt_assert_eq(shared_val[0], value + 10);
+
+        /* CPU writes 10, memset set bytes no integer hence memset fills 4 bytes with 0x0A */
+        memset((void *)(uintptr_t)addr, 10, sizeof(int));
+        memcpy(shared_val, (void *)(uintptr_t)addr, sizeof(shared_val));
+        igt_assert_eq(shared_val[0], 0x0A0A0A0A);
+
+        store_dword_batch_init(gpu1->fd, vm[1], addr, &batch_bo, &batch_addr, value + 10);
+
+        sync_addr = malloc(sizeof(*sync_addr));
+        igt_assert(!!sync_addr);
+        sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+        sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = BIND_SYNC_VAL;
+        *sync_addr = 0;
+
+        /* Prefetch half of destination */
+        xe_vm_prefetch_async(gpu1->fd, vm[1], 0, 0, addr,
+			     COPY_SIZE / 2, &sync, 1,
+			     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
+        if (*sync_addr != BIND_SYNC_VAL)
+                xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, BIND_SYNC_VAL, exec_queue[1],
+			       NSEC_PER_SEC * 10);
+        free((void *)sync_addr);
+
+        sync_addr = (void *)((char *)batch_addr + SZ_4K);
+        sync.addr = to_user_pointer((uint64_t *)sync_addr);
+        sync.timeline_value = EXEC_SYNC_VAL;
+        *sync_addr = 0;
+
+        /* Execute STORE command on GPU2 */
+        xe_exec_sync(gpu1->fd, exec_queue[1], batch_addr, &sync, 1);
+        if (*sync_addr != EXEC_SYNC_VAL)
+                xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[1],
+			       NSEC_PER_SEC * 10);
+
+        memcpy(shared_val, (void *)addr, 4);
+        igt_assert_eq(shared_val[0], value + 10);
+
+        /* CPU writes 11, memset set bytes no integer hence memset fills 4 bytes with 0x0B */
+        memset((void *)(uintptr_t)addr, 11, sizeof(int));
+        memcpy(shared_val, (void *)(uintptr_t)addr, sizeof(shared_val));
+        igt_assert_eq(shared_val[0], 0x0B0B0B0B);
+
+        munmap((void *)batch_addr, BATCH_SIZE(gpu0->fd));
+        batch_fini(gpu0->fd, vm[0], batch_bo, batch_addr);
+        free(data);
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
 int mem_region(int fd)
 {
 	uint64_t regions = all_memory_regions(fd);
@@ -1052,6 +1264,17 @@ gpu_latency_test(struct xe_svm_gpu_info *src_gpu,
         latency_test_multigpu(src_gpu, dst_gpu, eci, remote_copy, prefetch_req);
 }
 
+static void
+gpu_pagefault_test(struct xe_svm_gpu_info *src_gpu,
+		   struct xe_svm_gpu_info *dst_gpu,
+		   struct drm_xe_engine_class_instance *eci)
+{
+	igt_assert(src_gpu);
+	igt_assert(dst_gpu);
+
+        pagefault_test_multigpu(src_gpu, dst_gpu, eci);
+}
+
 igt_main
 {
 	struct xe_svm_gpu_info gpus[MAX_XE_GPUS];
@@ -1104,6 +1327,9 @@ igt_main
 		gpu_latency_test(&gpus[0], &gpus[1], &eci, 0, 0);
 	}
 
+	igt_subtest("pagefault-multi-gpu")
+		gpu_pagefault_test(&gpus[0], &gpus[1], &eci);
+
 	igt_fixture {
 		int cnt;
 
-- 
2.48.1

