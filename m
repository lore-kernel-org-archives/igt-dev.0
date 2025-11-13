Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4B0CD8C9D
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 17:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A206310E8EB;
	Thu, 13 Nov 2025 17:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MVV98xNB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2CC10E8F8
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 17:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763053278; x=1794589278;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jkFyrqOxp1Se00aXNv7FRfazdypS2aW8c0TPd4BM2hw=;
 b=MVV98xNB34aTgsOS8pM2VYJy3H3fG+TaRPNcA5oLNwh7lTcwu7HpQ0be
 dWjuFPVHuKti+DLYS62pC08V0KoL2+5pDluzzSCZWWw5brnbEdx/Ti4p6
 M4R3uFvxLYw40UjbrMuZ3lFDzlTJqxo36MiQbatxZE/lOsgXgCveBFo1c
 Z6D20j12h4C5zJIM9uRzAElo/FGgY7hbJcoSXh85/oo9lz8VCxPq9Hg7X
 WBEOsZjle2aUXy0GIQ+YOwzBk5Omj3ibbDbQYK9Ca9Py6JRSV/X4ZYUlv
 zsXQ9u3bNDIkUOahoHom1VDeE6Rg1+kun61m92FcDvvpsEwXBS6YcWlQG Q==;
X-CSE-ConnectionGUID: tylIcYb3SCK7X51mAywmJg==
X-CSE-MsgGUID: MCdM++vWQjWV68THdTyX2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75456361"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="75456361"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:01:17 -0800
X-CSE-ConnectionGUID: g7rwF4JKQc60161MySXgZw==
X-CSE-MsgGUID: JEC8hvMLSOauYahxfcOxxA==
X-ExtLoop1: 1
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.40.39])
 by fmviesa003.fm.intel.com with ESMTP; 13 Nov 2025 09:01:16 -0800
From: Nishit Sharma <nishit.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v7 10/10] tests/intel/xe_multi-gpusvm: Add SVM multi-GPU
 migration test
Date: Thu, 13 Nov 2025 17:00:55 +0000
Message-ID: <20251113170112.635182-11-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251113170112.635182-1-nishit.sharma@intel.com>
References: <20251104153201.677938-1-nishit.sharma@intel.com>
 <20251113170112.635182-1-nishit.sharma@intel.com>
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

This test allocates a buffer in SVM, accesses it from GPU 1, then GPU 2
and then the CPU. It verifies that the buffer migrates correctly between
devices and remains accessible across all agents in a multi-GPU environment.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_multi_gpusvm.c | 155 ++++++++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/tests/intel/xe_multi_gpusvm.c b/tests/intel/xe_multi_gpusvm.c
index afbf010e6..a4acb2455 100644
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
 static void
 create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct drm_xe_engine_class_instance *eci,
 		    uint32_t *vm, uint32_t *exec_queue)
@@ -1134,6 +1144,130 @@ multigpu_access_test(struct xe_svm_gpu_info *gpu0,
 	cleanup_vm_and_queue(gpu1, vm[1], exec_queue[1]);
 }
 
+static void
+multigpu_migrate_test(struct xe_svm_gpu_info *gpu0,
+		      struct xe_svm_gpu_info *gpu1,
+		      struct drm_xe_engine_class_instance *eci,
+		      bool prefetch_req)
+{
+	uint64_t addr;
+	uint32_t vm[2];
+	uint32_t exec_queue[2];
+	uint32_t batch1_bo[2];
+	uint64_t batch1_addr[2];
+	struct drm_xe_sync sync = {};
+	volatile uint64_t *sync_addr;
+	int value = 60;
+	uint64_t *data1;
+	void *copy_dst;
+
+	create_vm_and_queue(gpu0, eci, &vm[0], &exec_queue[0]);
+	create_vm_and_queue(gpu1, eci, &vm[1], &exec_queue[1]);
+
+	data1 = aligned_alloc(SZ_2M, SZ_4K);
+	igt_assert(data1);
+	addr = to_user_pointer(data1);
+
+	copy_dst = aligned_alloc(SZ_2M, SZ_4K);
+	igt_assert(copy_dst);
+
+	xe_vm_madvise(gpu0->fd, vm[0], addr, SZ_4K, 0,
+		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+		      DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM, 0, 0);
+
+	store_dword_batch_init(gpu0->fd, vm[0], addr, &batch1_bo[0], &batch1_addr[0], value);
+
+	/* Place destination in GPU0 local memory location to test */
+	xe_multigpu_madvise(gpu0->fd, vm[0], addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu0->fd, 0, gpu0->vram_regions[0], exec_queue[0],
+			    0, 0);
+
+	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
+	xe_multigpu_prefetch(gpu0->fd, vm[0], addr, SZ_4K, &sync,
+			     sync_addr, exec_queue[0], prefetch_req);
+
+	sync_addr = (void *)((char *)batch1_addr[0] + SZ_4K);
+	sync.addr = to_user_pointer((uint64_t *)sync_addr);
+	sync.timeline_value = EXEC_SYNC_VAL;
+	*sync_addr = 0;
+
+	/* Execute STORE command on GPU0 */
+	xe_exec_sync(gpu0->fd, exec_queue[0], batch1_addr[0], &sync, 1);
+	if (*sync_addr != EXEC_SYNC_VAL)
+		xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[0],
+			       NSEC_PER_SEC * 10);
+
+	igt_assert_eq(*(uint64_t *)addr, value);
+
+	/* Creating batch for GPU1 using addr as Src which have value from GPU0 */
+	store_dword_batch_init(gpu1->fd, vm[1], addr, &batch1_bo[1], &batch1_addr[1], value + 10);
+
+	/* Place destination in GPU1 local memory location to test */
+	xe_multigpu_madvise(gpu1->fd, vm[1], addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu1->fd, 0, gpu1->vram_regions[0], exec_queue[1],
+			    0, 0);
+
+	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
+	xe_multigpu_prefetch(gpu1->fd, vm[1], addr, SZ_4K, &sync,
+			     sync_addr, exec_queue[1], prefetch_req);
+
+	sync_addr = (void *)((char *)batch1_addr[1] + SZ_4K);
+	sync.addr = to_user_pointer((uint64_t *)sync_addr);
+	sync.timeline_value = EXEC_SYNC_VAL;
+	*sync_addr = 0;
+
+	/* Execute COPY command on GPU1 */
+	xe_exec_sync(gpu1->fd, exec_queue[1], batch1_addr[1], &sync, 1);
+	if (*sync_addr != EXEC_SYNC_VAL)
+		xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[1],
+			       NSEC_PER_SEC * 10);
+
+	igt_assert_eq(*(uint64_t *)addr, value + 10);
+
+	/* CPU writes 10, memset set bytes no integer hence memset fills 4 bytes with 0x0A */
+	memset((void *)(uintptr_t)addr, 10, sizeof(int));
+	igt_assert_eq(*(uint64_t *)addr, 0x0A0A0A0A);
+
+	/* Creating batch for GPU1 using addr as Src which have value from GPU0 */
+	batch_init(gpu1->fd, vm[1], addr, to_user_pointer(copy_dst),
+		   SZ_4K, &batch1_bo[1], &batch1_addr[1]);
+
+	/* Place destination in GPU1 local memory location to test */
+	xe_multigpu_madvise(gpu1->fd, vm[0], addr, SZ_4K, 0,
+			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
+			    gpu1->fd, 0, gpu1->vram_regions[0], exec_queue[0],
+			    0, 0);
+
+	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
+	xe_multigpu_prefetch(gpu0->fd, vm[0], addr, SZ_4K, &sync,
+			     sync_addr, exec_queue[0], prefetch_req);
+
+	sync_addr = (void *)((char *)batch1_addr[1] + SZ_4K);
+	sync.addr = to_user_pointer((uint64_t *)sync_addr);
+	sync.timeline_value = EXEC_SYNC_VAL;
+	*sync_addr = 0;
+
+	/* Execute COPY command on GPU1 */
+	xe_exec_sync(gpu1->fd, exec_queue[1], batch1_addr[1], &sync, 1);
+	if (*sync_addr != EXEC_SYNC_VAL)
+		xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue[1],
+			       NSEC_PER_SEC * 10);
+
+	igt_assert_eq(*(uint64_t *)copy_dst, 0x0A0A0A0A);
+
+	munmap((void *)batch1_addr[0], BATCH_SIZE(gpu0->fd));
+	munmap((void *)batch1_addr[1], BATCH_SIZE(gpu1->fd));
+	batch_fini(gpu0->fd, vm[0], batch1_bo[0], batch1_addr[0]);
+	batch_fini(gpu1->fd, vm[1], batch1_bo[1], batch1_addr[1]);
+	free(data1);
+	free(copy_dst);
+
+	cleanup_vm_and_queue(gpu0, vm[0], exec_queue[0]);
+	cleanup_vm_and_queue(gpu1, vm[1], exec_queue[1]);
+}
+
 static void
 gpu_conflict_test_wrapper(struct xe_svm_gpu_info *src,
 			  struct xe_svm_gpu_info *dst,
@@ -1186,6 +1320,19 @@ gpu_simult_test_wrapper(struct xe_svm_gpu_info *src,
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
@@ -1277,6 +1424,14 @@ igt_main
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
 
-- 
2.48.1

