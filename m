Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7C5CFC299
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 16:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B6210E8EA;
	Fri, 21 Nov 2025 16:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lVedXrto";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664D510E8E2
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 16:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763742339; x=1795278339;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=GgxvlR5H4EnE2W3lwYSdeqMnsqlrRCqVh9UyL6aE2i0=;
 b=lVedXrtoVLXow7rHIcSqO5n19LOcLegMSbsGDw+GJzvXBZFEEbosrWkz
 T3OdWz1bQZ/WSiprCwENT6kzGU/sOp8KjYLVIw571+Tpup4u1mMHiG/Z4
 awL6cla1k6W3mva8Y/Rt3l1NmmAZOnaMOX3/qQLtJRJq89pXkKn/B5fhw
 KLFZ9mBOS1EOZrdDAGtxudUT4jD42tU86A0a4Z1/f/B7jKo2fTpgMqZgD
 0Bh0r3gYiFsCBouWcdO6/mdZ11mr9qfnf6XbC9JqQ4w8m2H5+IsQmwEWx
 bOO8TURV2FQJy4SMMpAkURX202IAC71f8Zz9GV2bUYXEQWwVwLu0KUatK A==;
X-CSE-ConnectionGUID: 4vSjuHwyQTyvKXkpnFURKw==
X-CSE-MsgGUID: sLSYxd4UT9W1leA77MxvVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65029754"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="65029754"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 08:25:39 -0800
X-CSE-ConnectionGUID: DzLllsMfQD6LKhTmt/lmMA==
X-CSE-MsgGUID: to9BDRg5R8ixnHk60PSQxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="215096202"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..)
 ([10.1.40.114])
 by fmviesa002.fm.intel.com with ESMTP; 21 Nov 2025 08:25:38 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH i-g-t v8 10/10] tests/intel/xe_multi-gpusvm: Add SVM multi-GPU
 migration test
Date: Fri, 21 Nov 2025 16:25:37 +0000
Message-ID: <20251121162537.77551-11-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251121162537.77551-1-nishit.sharma@intel.com>
References: <20251121162537.77551-1-nishit.sharma@intel.com>
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
 tests/intel/xe_multi_gpusvm.c | 163 ++++++++++++++++++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index 068b9671b..19e977d55 100644
--- a/tests/intel/xe_multi_gpusvm.c
+++ b/tests/intel/xe_multi_gpusvm.c
@@ -119,6 +119,18 @@
  * Description:
  *	Test conflicting madvise operations with prefetch across multiple GPUs
  *
+ * SUBTEST: mgpu-migration-basic
+ * Description:
+ *	Test buffer migration across multiple GPUs and memory domains.
+ *	Validates that a shared buffer can migrate between system memory,
+ *	GPU1 VRAM, and GPU2 VRAM while maintaining data coherency.
+ *
+ * SUBTEST: mgpu-migration-prefetch
+ * Description:
+ *	Test buffer migration across multiple GPUs with explicit prefetch operations.
+ *	Similar to mgpu-migration-basic but uses XE_VM_PREFETCH_ASYNC to explicitly
+ *	trigger page migration before GPU access.
+ *
  */
 
 #define MAX_XE_REGIONS	8
@@ -143,6 +155,7 @@
 #define MULTIGPU_PFAULT_OP		BIT(8)
 #define MULTIGPU_CONC_ACCESS		BIT(9)
 #define MULTIGPU_CONFLICT		BIT(10)
+#define MULTIGPU_MIGRATE		BIT(11)
 
 struct xe_svm_gpu_info {
 	bool supports_faults;
@@ -208,6 +221,11 @@ static void gpu_conflict_test_wrapper(struct xe_svm_gpu_info *src,
 				      struct drm_xe_engine_class_instance *eci,
 				      unsigned int flags);
 
+static void gpu_migration_test_wrapper(struct xe_svm_gpu_info *src,
+				       struct xe_svm_gpu_info *dst,
+				       struct drm_xe_engine_class_instance *eci,
+				       unsigned int flags);
+
 static void
 create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct drm_xe_engine_class_instance *eci,
 		    uint32_t *vm, uint32_t *exec_queue)
@@ -1273,6 +1291,135 @@ conflicting_madvise(struct xe_svm_gpu_info *gpu1,
 	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]);
 }
 
+static void
+multigpu_migrate_test(struct xe_svm_gpu_info *gpu1,
+		      struct xe_svm_gpu_info *gpu2,
+		      struct drm_xe_engine_class_instance *eci,
+		      unsigned int flags)
+{
+	uint64_t addr;
+	uint32_t vm[2];
+	uint32_t exec_queue[2];
+	uint32_t batch1_bo[2];
+	uint64_t batch1_addr[2];
+	struct drm_xe_sync sync = {};
+	volatile uint64_t *sync_addr;
+	uint64_t *data;
+	uint32_t test_pattern_sys;
+	uint32_t test_pattern_gpu1;
+	uint32_t test_pattern_gpu2;
+	uint32_t cpu_pattern;
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
+	igt_info("=== Phase 1: System Memory → GPU1 VRAM ===\n");
+	/* CPU writes initial pattern in system memory */
+	*(uint32_t *)data = test_pattern_sys;
+	igt_info("CPU wrote 0x%x to system memory\n", test_pattern_sys);
+
+	/* Set preferred location to GPU1 VRAM */
+	xe_multigpu_madvise(gpu1->fd, vm[0], addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu1->fd, 0, gpu1->vram_regions[0], exec_queue[0]);
+
+	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
+	xe_multigpu_prefetch(gpu1->fd, vm[0], addr, SZ_4K, &sync,
+			     sync_addr, exec_queue[0], flags);
+	free((void *)sync_addr);
+
+	/* GPU1 writes new pattern - should happen in GPU1 VRAM */
+	store_dword_batch_init(gpu1->fd, vm[0], addr, &batch1_bo[0], &batch1_addr[0],
+			       test_pattern_gpu1);
+
+	sync_addr = (void *)((char *)batch1_addr[0] + SZ_4K);
+	sync.addr = to_user_pointer((uint64_t *)sync_addr);
+	sync.timeline_value = EXEC_SYNC_VAL;
+	sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
+	sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
+	*sync_addr = 0;
+
+	xe_exec_sync(gpu1->fd, exec_queue[0], batch1_addr[0], &sync, 1);
+	if (*sync_addr != EXEC_SYNC_VAL)
+		xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[0],
+			       NSEC_PER_SEC * 10);
+
+	/* Verify GPU1 wrote correctly (may cause migration back to system) */
+	igt_assert_eq_u32(*(uint32_t *)data, test_pattern_gpu1);
+	igt_info("GPU1 successfully wrote 0x%x\n", test_pattern_gpu1);
+
+	igt_info("=== Phase 2: GPU1 VRAM → GPU2 VRAM ===\n");
+
+	/* Change preferred location to GPU2 VRAM */
+	xe_multigpu_madvise(gpu2->fd, vm[1], addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu2->fd, 0, gpu2->vram_regions[0], exec_queue[1]);
+
+	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
+	xe_multigpu_prefetch(gpu2->fd, vm[1], addr, SZ_4K, &sync,
+			     sync_addr, exec_queue[1], flags);
+	free((void *)sync_addr);
+
+	/* GPU2 reads GPU1's value and writes new pattern */
+	store_dword_batch_init(gpu2->fd, vm[1], addr, &batch1_bo[1], &batch1_addr[1],
+			       test_pattern_gpu2);
+
+	sync_addr = (void *)((char *)batch1_addr[1] + SZ_4K);
+	sync.addr = to_user_pointer((uint64_t *)sync_addr);
+	sync.timeline_value = EXEC_SYNC_VAL;
+	*sync_addr = 0;
+
+	xe_exec_sync(gpu2->fd, exec_queue[1], batch1_addr[1], &sync, 1);
+	if (*sync_addr != EXEC_SYNC_VAL)
+		xe_wait_ufence(gpu2->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[1],
+			       NSEC_PER_SEC * 10);
+
+	/* Verify GPU2 wrote correctly */
+	igt_assert_eq_u32(*(uint32_t *)data, test_pattern_gpu2);
+	igt_info("GPU2 successfully wrote 0x%x\n", test_pattern_gpu2);
+
+	igt_info("=== Phase 3: GPU2 VRAM → System Memory ===\n");
+
+	/* Change back to system memory preference */
+	xe_vm_madvise(gpu1->fd, vm[0], addr, SZ_4K, 0,
+		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+		      DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0, 0);
+
+	/* CPU access should migrate back to system memory */
+	cpu_pattern = 0xABCDEF00;
+	*(uint32_t *)data = cpu_pattern;
+	igt_info("CPU wrote 0x%x after migration to system memory\n", cpu_pattern);
+
+	/* Verify CPU write was successful */
+	igt_assert_eq_u32(*(uint32_t *)data, cpu_pattern);
+
+	igt_info("Migration test completed successfully\n");
+
+	munmap((void *)batch1_addr[0], BATCH_SIZE(gpu1->fd));
+	munmap((void *)batch1_addr[1], BATCH_SIZE(gpu2->fd));
+	batch_fini(gpu1->fd, vm[0], batch1_bo[0], batch1_addr[0]);
+	batch_fini(gpu2->fd, vm[1], batch1_bo[1], batch1_addr[1]);
+	free(data);
+
+	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);
+	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]);
+}
+
 static void
 gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
 		       struct xe_svm_gpu_info *dst,
@@ -1357,6 +1504,18 @@ gpu_conflict_test_wrapper(struct xe_svm_gpu_info *src,
 	conflicting_madvise(src, dst, eci, flags);
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
@@ -1376,6 +1535,8 @@ test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_simult_test_wrapper, flags);
 	if (flags & MULTIGPU_CONFLICT)
 		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_conflict_test_wrapper, flags);
+	if (flags & MULTIGPU_MIGRATE)
+		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_migration_test_wrapper, flags);
 }
 
 struct section {
@@ -1415,6 +1576,8 @@ igt_main
 		{ "concurrent-access-prefetch", MULTIGPU_PREFETCH | MULTIGPU_CONC_ACCESS },
 		{ "conflicting-madvise-basic", MULTIGPU_BASIC | MULTIGPU_CONFLICT },
 		{ "conflicting-madvise-prefetch", MULTIGPU_PREFETCH | MULTIGPU_CONFLICT },
+		{ "migration-basic", MULTIGPU_BASIC | MULTIGPU_MIGRATE },
+		{ "migration-prefetch", MULTIGPU_PREFETCH | MULTIGPU_MIGRATE },
 		{ NULL },
 	};
 
-- 
2.48.1

