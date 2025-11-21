Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A80CFC296
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 16:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0F710E8E7;
	Fri, 21 Nov 2025 16:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0r3u5Fx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526FB10E8E3
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 16:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763742339; x=1795278339;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=oLzCqy0PFe2+vWjPpJJeQIFGVHuq2aHPuXZcjV/Yw9w=;
 b=J0r3u5Fx3NhHVYka6IzHhxEL00e0cwSjO48hoEbECPyZdwS5Ndrq2YXM
 TA4dOKiWjT/TJ+hQlZgsn7aUJEFZvVtgYVUQmujs0V4lXUUFXs0s0MA1A
 K8FAtiUGPUS25PefhUfCAcuoCsLEsTDZjidMZYKhoc7Vf6toEJZ1jG139
 mpS7x/UnElbb5KplE2YTpzPaki0vaq+VW8sgjL9KxuKrXu1qIAdpnOHAv
 yeKjoYF3vnWNejoEDLIB8y5qDFrHe7pBeQTrPOQ6GqF5yAjdelFWZZxTw
 3RcEu6FMPNjTvJoHtYIBNC7wEKck+oe1ywxGRwGf/j08nhxaMFvTa/R4a Q==;
X-CSE-ConnectionGUID: fsEh2m0IQw+kOwD7RFcy+A==
X-CSE-MsgGUID: Wqtmv4JHT5iGkMFAd8WBnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65029753"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="65029753"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 08:25:39 -0800
X-CSE-ConnectionGUID: 4PYaaDy+T2CE1LVNKGK24Q==
X-CSE-MsgGUID: h4U5+00RTJKPAEWN0Ns66Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="215096198"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..)
 ([10.1.40.114])
 by fmviesa002.fm.intel.com with ESMTP; 21 Nov 2025 08:25:38 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH i-g-t v8 09/10] tests/intel/xe_multi_gpusvm: Add SVM multi-GPU
 conflicting madvise test
Date: Fri, 21 Nov 2025 16:25:36 +0000
Message-ID: <20251121162537.77551-10-nishit.sharma@intel.com>
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

This test calls madvise operations on GPU0 with the preferred location set
to GPU1 and vice versa. It reports conflicts when conflicting memory advice
is given for shared SVM buffers in a multi-GPU environment.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_multi_gpusvm.c | 125 ++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index 7f3c5e63c..068b9671b 100644
--- a/tests/intel/xe_multi_gpusvm.c
+++ b/tests/intel/xe_multi_gpusvm.c
@@ -110,6 +110,15 @@
  *	Test concurrent atomic memory operations with prefetch where
  *	multiple GPUs simultaneously access shared memory to validate
  *	coherency with memory migration and local VRAM access
+ *
+ * SUBTEST: mgpu-conflicting-madvise-basic
+ * Description:
+ *	Test conflicting madvise operations across multiple GPUs
+ *
+ * SUBTEST: mgpu-conflicting-madvise-prefetch
+ * Description:
+ *	Test conflicting madvise operations with prefetch across multiple GPUs
+ *
  */
 
 #define MAX_XE_REGIONS	8
@@ -120,6 +129,8 @@
 #define EXEC_SYNC_VAL 0x676767
 #define COPY_SIZE SZ_64M
 #define	ATOMIC_OP_VAL	56
+#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
+#define FIVE_SEC                (5LL * NSEC_PER_SEC)
 
 #define MULTIGPU_BASIC			BIT(0)
 #define MULTIGPU_PREFETCH		BIT(1)
@@ -131,6 +142,7 @@
 #define MULTIGPU_PERF_REM_COPY		BIT(7)
 #define MULTIGPU_PFAULT_OP		BIT(8)
 #define MULTIGPU_CONC_ACCESS		BIT(9)
+#define MULTIGPU_CONFLICT		BIT(10)
 
 struct xe_svm_gpu_info {
 	bool supports_faults;
@@ -191,6 +203,11 @@ static void gpu_simult_test_wrapper(struct xe_svm_gpu_info *src,
 				    struct drm_xe_engine_class_instance *eci,
 				    unsigned int flags);
 
+static void gpu_conflict_test_wrapper(struct xe_svm_gpu_info *src,
+				      struct xe_svm_gpu_info *dst,
+				      struct drm_xe_engine_class_instance *eci,
+				      unsigned int flags);
+
 static void
 create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct drm_xe_engine_class_instance *eci,
 		    uint32_t *vm, uint32_t *exec_queue)
@@ -1164,6 +1181,98 @@ multigpu_access_test(struct xe_svm_gpu_info *gpu1,
 	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]);
 }
 
+static void
+conflicting_madvise(struct xe_svm_gpu_info *gpu1,
+		    struct xe_svm_gpu_info *gpu2,
+		    struct drm_xe_engine_class_instance *eci,
+		    unsigned int flags)
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
+	addr = to_user_pointer(data);
+
+	store_dword_batch_init(gpu1->fd, vm[0], addr, &batch_bo[0], &batch_addr[0], 10);
+	store_dword_batch_init(gpu2->fd, vm[1], addr, &batch_bo[1], &batch_addr[1], 20);
+
+	xe_multigpu_madvise(gpu1->fd, vm[0], addr, SZ_4K,
+			    0, DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0, 0, exec_queue[0]);
+
+	igt_info("Testing GPU1 VM trying to prefer GPU2's VRAM (should fail)\n");
+
+	/* This SHOULD fail - GPU1's VM cannot prefer GPU2's VRAM */
+	xe_multigpu_madvise(gpu1->fd, vm[0], addr, SZ_4K,
+			    0, DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu2->fd, 0, gpu2->vram_regions[0], exec_queue[0]);
+
+	/* This SHOULD also fail - GPU2's VM cannot prefer GPU1's VRAM */
+	xe_multigpu_madvise(gpu2->fd, vm[1], addr, SZ_4K,
+			    0, DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu1->fd, 0, gpu1->vram_regions[0], exec_queue[0]);
+
+	setup_sync(&sync[0], &sync_addr[0], BIND_SYNC_VAL);
+	setup_sync(&sync[1], &sync_addr[1], BIND_SYNC_VAL);
+
+	/* For simultaneous access need to call xe_wait_ufence for both gpus after prefetch */
+	xe_multigpu_prefetch(gpu1->fd, vm[0], addr, SZ_4K, &sync[0],
+			     sync_addr[0], exec_queue[0], flags);
+	free((void *)sync_addr[0]);
+
+	xe_multigpu_prefetch(gpu2->fd, vm[1], addr, SZ_4K, &sync[1],
+			     sync_addr[1], exec_queue[1], flags);
+	free((void *)sync_addr[1]);
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
+		xe_exec_sync(gpu1->fd, exec_queue[0], batch_addr[0], &sync[0], 1);
+		if (*sync_addr[0] != EXEC_SYNC_VAL)
+			xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr[0], EXEC_SYNC_VAL,
+				       exec_queue[0], NSEC_PER_SEC * 10);
+		xe_exec_sync(gpu2->fd, exec_queue[1], batch_addr[1], &sync[1], 1);
+		if (*sync_addr[1] != EXEC_SYNC_VAL)
+			xe_wait_ufence(gpu2->fd, (uint64_t *)sync_addr[1], EXEC_SYNC_VAL,
+				       exec_queue[1], NSEC_PER_SEC * 10);
+	}
+
+	igt_assert_eq(*(uint64_t *)addr, 20);
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
@@ -1236,6 +1345,18 @@ gpu_simult_test_wrapper(struct xe_svm_gpu_info *src,
 	multigpu_access_test(src, dst, eci, flags);
 }
 
+static void
+gpu_conflict_test_wrapper(struct xe_svm_gpu_info *src,
+			  struct xe_svm_gpu_info *dst,
+			  struct drm_xe_engine_class_instance *eci,
+			  unsigned int flags)
+{
+	igt_assert(src);
+	igt_assert(dst);
+
+	conflicting_madvise(src, dst, eci, flags);
+}
+
 static void
 test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
 	       struct drm_xe_engine_class_instance *eci,
@@ -1253,6 +1374,8 @@ test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_fault_test_wrapper, flags);
 	if (flags & MULTIGPU_CONC_ACCESS)
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_simult_test_wrapper, flags);
+	if (flags & MULTIGPU_CONFLICT)
+		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_conflict_test_wrapper, flags);
 }
 
 struct section {
@@ -1290,6 +1413,8 @@ igt_main
 		{ "pagefault-prefetch", MULTIGPU_PREFETCH | MULTIGPU_PFAULT_OP },
 		{ "concurrent-access-basic", MULTIGPU_BASIC | MULTIGPU_CONC_ACCESS },
 		{ "concurrent-access-prefetch", MULTIGPU_PREFETCH | MULTIGPU_CONC_ACCESS },
+		{ "conflicting-madvise-basic", MULTIGPU_BASIC | MULTIGPU_CONFLICT },
+		{ "conflicting-madvise-prefetch", MULTIGPU_PREFETCH | MULTIGPU_CONFLICT },
 		{ NULL },
 	};
 
-- 
2.48.1

