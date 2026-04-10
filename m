Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3E9E99055
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 08:28:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA65510E87C;
	Fri, 10 Apr 2026 08:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CsQuPvFR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95E010E1B0
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 08:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775809681; x=1807345681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YWgyPotvWfqXF+A/93U3oMaQIrIeoiBgGL0C947nIfE=;
 b=CsQuPvFR8a6SXBSr73N2yCOTM5kJYVakPK4CrxqXVxh5hVIWENabYk+I
 F9fMr1ZCkBYAvSaox/tadhaegg+SN/K7zKcO0hKJGR/q8QNmhkVastGvT
 NiTEu9202HRch5LnBg/ujQzaqTV4LHy4xeX39TZ6Rw+BfGqalEx7qW8j5
 +GcmB4KAeU3KSCaltTmZDrlIpk3AVeWb+RHm/ZItN5fZF6zGUneZrvFTg
 WcVWw1yAqxcJuYCGc4ZpeXpCDig//g7CwmUToTxeq4Pr5EdDR+/dNdJr5
 VzjM1Xm2zZ3S+DoROEpRMiAKj3XIBQgLOX/7Ho//x2Er/piQFJ7s+dirj w==;
X-CSE-ConnectionGUID: WUhf0LzITEKDC9BQbKpIFQ==
X-CSE-MsgGUID: IBDrBRxGT2Cah8jL9qt6Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="64361544"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="64361544"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 01:28:01 -0700
X-CSE-ConnectionGUID: djjAMyJNQBGUo42acYFQbw==
X-CSE-MsgGUID: OopAuSwSQheoQ1RnzEeucg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="229301960"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 01:27:59 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v8 5/8] tests/intel/xe_madvise: Add dontneed-before-exec
 subtest
Date: Fri, 10 Apr 2026 13:57:22 +0530
Message-ID: <20260410082729.2383886-6-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410082729.2383886-1-arvind.yadav@intel.com>
References: <20260410082729.2383886-1-arvind.yadav@intel.com>
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

This test validates GPU execution behavior when a data BO is purged
before submission. The test creates a batch that writes to a data BO,
purges the data BO (while keeping the batch BO valid to avoid GPU
reset), then submits for execution. With VM_CREATE_FLAG_SCRATCH_PAGE,
the GPU write may succeed by landing on scratch memory instead of the
purged BO, demonstrating graceful handling of purged memory during
GPU operations.

v4:
  - Added proper resource cleanup before calling igt_skip(). (Nishit)

Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 148 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index 2d5acc347..b30290f27 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -19,7 +19,11 @@
 
 /* Purgeable test constants */
 #define PURGEABLE_ADDR		0x1a0000
+#define PURGEABLE_BATCH_ADDR	0x3c0000
 #define PURGEABLE_BO_SIZE	4096
+#define PURGEABLE_FENCE_VAL	0xbeef
+#define PURGEABLE_TEST_PATTERN	0xc0ffee
+#define PURGEABLE_DEAD_PATTERN	0xdead
 
 static bool xe_has_purgeable_support(int fd)
 {
@@ -196,6 +200,62 @@ static void test_purged_mmap_blocked(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * purgeable_setup_batch_and_data - Setup VM with batch and data BOs for GPU exec
+ * @fd: DRM file descriptor
+ * @vm: Output VM handle
+ * @bind_engine: Output bind engine handle
+ * @batch_bo: Output batch BO handle
+ * @data_bo: Output data BO handle
+ * @batch: Output batch buffer pointer
+ * @data: Output data buffer pointer
+ * @batch_addr: Batch virtual address
+ * @data_addr: Data virtual address
+ * @batch_size: Batch buffer size
+ * @data_size: Data buffer size
+ *
+ * Helper to create VM, bind engine, batch and data BOs, and bind them.
+ */
+static void purgeable_setup_batch_and_data(int fd, uint32_t *vm,
+					   uint32_t *bind_engine,
+					   uint32_t *batch_bo,
+					   uint32_t *data_bo,
+					   uint32_t **batch,
+					   uint32_t **data,
+					   uint64_t batch_addr,
+					   uint64_t data_addr,
+					   size_t batch_size,
+					   size_t data_size)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.timeline_value = PURGEABLE_FENCE_VAL,
+	};
+	uint64_t vm_sync = 0;
+
+	*vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
+	*bind_engine = xe_bind_exec_queue_create(fd, *vm, 0);
+
+	/* Create and bind batch BO */
+	*batch_bo = xe_bo_create(fd, *vm, batch_size, vram_if_possible(fd, 0),
+				 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	*batch = xe_bo_map(fd, *batch_bo, batch_size);
+
+	sync.addr = to_user_pointer(&vm_sync);
+	xe_vm_bind_async(fd, *vm, *bind_engine, *batch_bo, 0, batch_addr, batch_size, &sync, 1);
+	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0, NSEC_PER_SEC);
+
+	/* Create and bind data BO */
+	*data_bo = xe_bo_create(fd, *vm, data_size, vram_if_possible(fd, 0),
+				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	*data = xe_bo_map(fd, *data_bo, data_size);
+
+	vm_sync = 0;
+	xe_vm_bind_async(fd, *vm, *bind_engine, *data_bo, 0, data_addr, data_size, &sync, 1);
+	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0, NSEC_PER_SEC);
+}
+
 /**
  * SUBTEST: dontneed-before-mmap
  * Description: Mark BO as DONTNEED before mmap, verify mmap() fails with -EBUSY
@@ -292,6 +352,88 @@ static void test_dontneed_after_mmap(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: dontneed-before-exec
+ * Description: Mark BO as DONTNEED before GPU exec, verify GPU behavior with SCRATCH_PAGE
+ * Test category: functionality test
+ */
+static void test_dontneed_before_exec(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	uint32_t vm, exec_queue, bo, batch_bo, bind_engine;
+	uint64_t data_addr = PURGEABLE_ADDR;
+	uint64_t batch_addr = PURGEABLE_BATCH_ADDR;
+	size_t data_size = PURGEABLE_BO_SIZE;
+	size_t batch_size = PURGEABLE_BO_SIZE;
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = PURGEABLE_FENCE_VAL },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+	uint32_t *data, *batch;
+	uint64_t vm_sync = 0;
+	int b, ret;
+
+	purgeable_setup_batch_and_data(fd, &vm, &bind_engine, &batch_bo,
+				       &bo, &batch, &data, batch_addr,
+				       data_addr, batch_size, data_size);
+
+	/* Prepare batch */
+	b = 0;
+	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	batch[b++] = data_addr;
+	batch[b++] = data_addr >> 32;
+	batch[b++] = PURGEABLE_DEAD_PATTERN;
+	batch[b++] = MI_BATCH_BUFFER_END;
+
+	/* Phase 1: Purge data BO, batch BO still valid */
+	if (!purgeable_mark_and_verify_purged(fd, vm, data_addr, data_size)) {
+		munmap(data, data_size);
+		munmap(batch, batch_size);
+		gem_close(fd, bo);
+		gem_close(fd, batch_bo);
+		xe_exec_queue_destroy(fd, bind_engine);
+		xe_vm_destroy(fd, vm);
+		igt_skip("Unable to induce purge on this platform/config");
+	}
+
+	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
+	exec.exec_queue_id = exec_queue;
+	exec.address = batch_addr;
+
+	vm_sync = 0;
+	sync[0].addr = to_user_pointer(&vm_sync);
+
+	/*
+	 * VM has SCRATCH_PAGE — exec may succeed with the GPU write
+	 * landing on scratch instead of the purged data BO.
+	 */
+	ret = __xe_exec(fd, &exec);
+	if (ret == 0) {
+		int64_t timeout = NSEC_PER_SEC;
+
+		__xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL,
+				 exec_queue, &timeout);
+	}
+
+	/*
+	 * Don't purge the batch BO — GPU would fetch zeroed scratch
+	 * instructions and trigger an engine reset.
+	 */
+
+	munmap(data, data_size);
+	munmap(batch, batch_size);
+	gem_close(fd, bo);
+	gem_close(fd, batch_bo);
+	xe_exec_queue_destroy(fd, bind_engine);
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -322,6 +464,12 @@ int igt_main()
 			break;
 		}
 
+	igt_subtest("dontneed-before-exec")
+		xe_for_each_engine(fd, hwe) {
+			test_dontneed_before_exec(fd, hwe);
+			break;
+		}
+
 	igt_fixture() {
 		xe_device_put(fd);
 		drm_close_driver(fd);
-- 
2.43.0

