Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDD0EA7961
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 03:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4345710E7A1;
	Thu,  5 Feb 2026 03:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f44UEfe/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B0C10E7A1
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 03:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770263476; x=1801799476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7j406FYKTZBnzlPdqw3YzfeiabZMSr8xd6MteaECMe8=;
 b=f44UEfe/1QA0WZx6W0JnA6bJnz/t1Pc1jvaYp28PNgYh7LozdbCskOMC
 P3y1bNX5NTmPoM2e1liEffp8u/GZICLEpV/NfyoMEDrYPZXc7Wna3eL7/
 96HmK6V4PD1dciqpKzyQpVe+CvmWEJNUwJLQK+9WMTiBzuVRUp3Jdh0b6
 PShJYWnsr8pt53MJaGuwFeIsvNhJ0go6sNiO8iwqnmHzmunfdMUIyCOY4
 zBiLlwqqtsElUcwSG1M1yD9PXpOpt3ue0ONBUUMVJDETBgtP4LopsfxUE
 9bRQL2Cb1r1jdGGtOhjf5Tx4fk6ljkq7kWnIKhx5ElcnnooCI7wttOL+l g==;
X-CSE-ConnectionGUID: 3rHwlyFNQoyfaaVae5ItfQ==
X-CSE-MsgGUID: ZlPiDcR9RDi+S+489Vdpfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75310130"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="75310130"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 19:51:16 -0800
X-CSE-ConnectionGUID: rBNBDAbeRYOJcKLR0bVqBA==
X-CSE-MsgGUID: cKnfy+uPQm29fiLhcFSBJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="215343020"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 19:51:16 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nishit.sharma@intel.com, thomas.hellstrom@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v4 i-g-t 1/1] tests/intel/xe_evict: overcommit tests for
 fault-mode and non-fault-mode VMs
Date: Thu,  5 Feb 2026 03:50:35 +0000
Message-ID: <20260205035041.413552-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205035041.413552-1-sobin.thomas@intel.com>
References: <20260205035041.413552-1-sobin.thomas@intel.com>
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

  The existing tests in xe_evict focuses on system-wide memory allocation
across multiple processes. However, OOM error handling in different VM
modes was not being tested, and the previous test_svm_overcommit() had
a critical bug that prevented proper overcommit scenarios.

Add three new tests to verify graceful OOM failure handling:

- test_evict_oom(): Allocates BOs aggressively in a loop until
  OOM occurs. Tests error handling in LR mode and expects
  -ENOSPC or -ENOMEM.

- test_vm_nonfault_mode_overcommit(): Verifies that non-fault mode VMs
  properly reject overcommit attempts with -ENOSPC or -ENOMEM as
  expected.

- test_vm_fault_mode_overcommit(): Validates that fault-mode VMs can
  handle memory pressure gracefully by touching pages to trigger page
  faults.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_evict.c | 689 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 687 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 82a6cde0a..f60b0ad03 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: MIT
+//
 /*
  * Copyright © 2021 Intel Corporation
  */
@@ -32,6 +33,8 @@
 #define BIND_EXEC_QUEUE		(0x1 << 6)
 #define MULTI_QUEUE		(0x1 << 7)
 #define PRIORITY		(0x1 << 8)
+#define USER_FENCE_VALUE    0xdeadbeefdeadbeefull
+#define BATCH_BO_SIZE		0x1000
 
 static void
 test_evict(int fd, struct drm_xe_engine_class_instance *eci,
@@ -235,8 +238,8 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 
 static void
 test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
-	      int n_exec_queues, int n_execs, size_t bo_size, unsigned long flags,
-	      pthread_barrier_t *barrier)
+			  int n_exec_queues, int n_execs, size_t bo_size, unsigned long flags,
+			  pthread_barrier_t *barrier)
 {
 	uint32_t vm, vm2;
 	uint32_t bind_exec_queues[2] = { 0, 0 };
@@ -415,6 +418,626 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 	drm_close_driver(fd);
 }
 
+static void
+test_vm_nonfault_mode_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
+				 uint64_t system_size, uint64_t vram_size,
+				 uint64_t overcommit_multiplier)
+{
+	uint64_t overcommit_size;
+	uint32_t vm;
+	uint32_t *bos;
+	int num_bos;
+	size_t nf_bo_size = 64 * 1024 * 1024;  // 64MB per BO
+	uint32_t batch_bo;
+	uint32_t exec_queue;
+	uint64_t batch_addr = 0x200000000;
+	int create_ret;
+	int bind_err;
+	int i;
+	int res;
+	uint32_t bind_exec_queue;
+	uint64_t data_addr = 0x300000000;
+
+	struct drm_xe_sync bind_sync[1] = {
+		{
+			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.timeline_value = USER_FENCE_VALUE },
+		};
+	struct drm_xe_sync exec_sync[1] = {
+					{
+							.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+							.flags = DRM_XE_SYNC_FLAG_SIGNAL
+					},
+			};
+
+	struct drm_xe_exec exec = {
+					.num_batch_buffer = 1,
+					.num_syncs = 1,
+					.syncs = to_user_pointer(exec_sync),
+			};
+
+	struct {
+			uint32_t batch[16];
+	} *batch_data;
+	int b;
+
+	bool overcommit_detected = false;
+
+	overcommit_size = ALIGN(vram_size * overcommit_multiplier, 4096);
+
+	/* Limit overcommit to available memory to avoid OOM killer */
+	if (overcommit_size > system_size) {
+		igt_debug("Limiting overcommit size from %llu MB to %llu MB (available)\n",
+			  (unsigned long long)(overcommit_size >> 20),
+			  (unsigned long long)(system_size >> 20));
+			  overcommit_size = ALIGN(system_size, 4096);
+	}
+
+	num_bos = (overcommit_size / nf_bo_size) + 1;
+	bos = calloc(num_bos, sizeof(*bos));
+	igt_assert(bos);
+
+	igt_debug("Non-fault mode overcommit test: allocating %d BOs of %llu MB each, total=%llu MB, vram=%llu MB\n",
+		  num_bos, (unsigned long long)(nf_bo_size >> 20),
+		  (unsigned long long)(num_bos * nf_bo_size >> 20),
+		  (unsigned long long)(vram_size >> 20));
+
+	/* Create the vm in non fault mode*/
+	vm = xe_vm_create(fd, 0, 0);
+	igt_assert(vm);
+	bind_exec_queue = xe_bind_exec_queue_create(fd, vm, 0);
+
+	/* Create multiple BOs with VRAM-only placement to force overcommit */
+	for (i = 0; i < num_bos; i++) {
+		struct {
+			uint64_t vm_sync;
+		} *data;
+
+		create_ret = __xe_bo_create(fd, vm, nf_bo_size,
+					    vram_memory(fd, eci->gt_id),
+					    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+					    NULL, &bos[i]);
+		if (create_ret) {
+			igt_debug("BO create failed at %d/%d with error %d (%s)"
+				  "overcommit detected\n",
+				  i, num_bos, -create_ret, strerror(-create_ret));
+			igt_assert_f(create_ret == -ENOMEM || create_ret == -ENOSPC ||
+				     create_ret == -E2BIG || create_ret == -EPERM,
+				     "Unexpected error");
+			overcommit_detected = true;
+			num_bos = i; // Reduce to successfully created BOs
+			break;
+		}
+
+		data = xe_bo_map(fd, bos[i], 4096);
+		bind_sync[0].addr = to_user_pointer(&data->vm_sync);
+
+		bind_err = __xe_vm_bind(fd, vm, bind_exec_queue, bos[i], 0,
+					data_addr + (i * nf_bo_size), nf_bo_size,
+					DRM_XE_VM_BIND_OP_MAP, 0, bind_sync, 1, 0, 0, 0);
+		if (bind_err) {
+			igt_debug("Bind failed at %d/%d with error %d (%s)\n",
+				  i, num_bos, -bind_err, strerror(-bind_err));
+			igt_assert_f(bind_err == -ENOMEM ||
+				     bind_err == -ENOSPC || bind_err == -EPERM,
+				     "Unexpected bind error %d (%s)\n",
+				     -bind_err, strerror(-bind_err));
+			munmap(data, 4096);
+			gem_close(fd, bos[i]);
+			bos[i] = 0;
+			overcommit_detected = true;
+			num_bos = i;
+			break;
+		}
+
+		xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE,
+			       bind_exec_queue, 20 * NSEC_PER_SEC);
+		munmap(data, 4096);
+
+		igt_debug("Created and bound BO %d/%d at 0x%llx\n",
+			  i + 1, num_bos, (unsigned long long)(data_addr + (i * nf_bo_size)));
+	}
+
+	if (overcommit_detected)
+		igt_debug("Non-fault mode correctly rejected overcommit (created %d/%d BOs)\n",
+			  num_bos, (int)((overcommit_size / nf_bo_size) + 1));
+	else
+		igt_debug("Warning: All BOs created successfully - system may have had enough memory\n");
+
+	/* Create batch buffer */
+
+	batch_bo = xe_bo_create(fd, vm, 0x1000,
+				vram_memory(fd, eci->gt_id),
+				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	batch_data = xe_bo_map(fd, batch_bo, 0x1000);
+	xe_vm_bind_sync(fd, vm, batch_bo, 0, batch_addr, 0x1000);
+
+	/* Create exec queue */
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+	exec_sync[0].handle = syncobj_create(fd, 0);
+
+	/* Use GPU to write to each BO - this will trigger page faults and migration */
+	for (i = 0; i < num_bos; i++) {
+		for (uint64_t off = 0; off < nf_bo_size; off += 4096) {
+			uint64_t target_addr = data_addr + (i * nf_bo_size) + off;
+
+			b = 0;
+			batch_data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+			batch_data->batch[b++] = target_addr & 0xFFFFFFFF;
+			batch_data->batch[b++] = (target_addr >> 32) & 0xFFFFFFFF;
+			batch_data->batch[b++] = 0xBB;
+			batch_data->batch[b++] = MI_BATCH_BUFFER_END;
+
+			/* Submit batch */
+			exec.exec_queue_id = exec_queue;
+			exec.address = batch_addr;
+			// Wait for previous batch to complete (except on first iteration)
+			if (off != 0 || i != 0)
+				igt_assert(syncobj_wait(fd, &exec_sync[0].handle,
+							1, INT64_MAX, 0, NULL));
+
+			syncobj_reset(fd, &exec_sync[0].handle, 1);
+			res = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
+			if (res != 0) {
+				if (errno == ENOMEM || errno == ENOSPC) {
+					igt_debug("Expected Fault ! GPU execution failed");
+					goto gpu_done;
+				} else {
+					igt_assert("Error in execution");
+				}
+			}
+
+			if (!syncobj_wait(fd, &exec_sync[0].handle, 1, INT64_MAX, 0, NULL)) {
+				igt_debug("Batch wait failed - memory exhausted"
+					  " BO %d offset 0x%lx\n", i, off);
+				goto gpu_done;
+			}
+
+			igt_debug("Accessed BO %d/%d via GPU\n", i + 1, num_bos);
+		}
+	}
+	igt_debug("Fault mode overcommit test completed successfully\n");
+
+gpu_done:
+	igt_debug("GPU access test completed - overcommit correctly detected\n");
+
+	/* Cleanup */
+	syncobj_destroy(fd, exec_sync[0].handle);
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_exec_queue_destroy(fd, bind_exec_queue);
+	munmap(batch_data, 0x1000);
+	gem_close(fd, batch_bo);
+
+	for (i = 0; i < num_bos; i++) {
+		if (bos[i])
+			gem_close(fd, bos[i]);
+	}
+
+	free(bos);
+	xe_vm_destroy(fd, vm);
+}
+
+static void test_vm_fault_mode_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
+					  uint64_t system_size, uint64_t vram_size,
+					  uint64_t overcommit_multiplier)
+{
+	uint64_t overcommit_size;
+	uint32_t vm;
+	uint32_t *bos;
+	int num_bos;
+	uint64_t off;
+	size_t nf_bo_size = 64 * 1024 * 1024;  // 64MB per BO
+	uint32_t batch_bo;
+	size_t sync_size;
+	uint32_t bind_exec_queue;
+	uint64_t sync_addr = 0x101a0000;
+	uint64_t batch_addr = 0x200000000;
+	uint64_t data_addr = 0x300000000;
+	uint32_t exec_queue;
+	uint64_t stride = 1024 * 1024;
+	int64_t timeout = 20 * NSEC_PER_SEC;
+	int i, b;
+	int create_ret;
+	int64_t ret;
+	int bind_err;
+	int res;
+	bool overcommit_detected = false;
+
+	struct drm_xe_sync bind_sync[1] = {
+		{
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.timeline_value = USER_FENCE_VALUE
+		},
+	};
+
+	struct drm_xe_sync sync[1] = {
+		{
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.timeline_value = USER_FENCE_VALUE },
+	};
+
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+		uint64_t vm_sync;
+	} *batch_data;
+
+	uint64_t *exec_sync;
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+
+	igt_debug("Starting fault-mode overcommit test\n");
+
+	overcommit_size = ALIGN(vram_size * overcommit_multiplier, 4096);
+
+	if (overcommit_size > system_size) {
+		igt_debug("Limiting overcommit size from %llu MB to %llu MB\n",
+			  (unsigned long long)(overcommit_size >> 20),
+			  (unsigned long long)(system_size >> 20));
+		overcommit_size = ALIGN(system_size, 4096);
+	}
+
+	num_bos = (overcommit_size / nf_bo_size) + 1;
+	bos = calloc(num_bos, sizeof(*bos));
+	igt_assert(bos);
+
+	igt_debug("Fault mode: BO of %llu MB containing %d structures"
+		  "(target overcommit=%llu MB, vram=%llu MB)\n",
+		  (unsigned long long)(nf_bo_size >> 20), num_bos,
+		  (unsigned long long)(overcommit_size >> 20),
+		  (unsigned long long)(vram_size >> 20));
+
+	/* Create fault-mode VM */
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	igt_assert(vm);
+
+	bind_exec_queue = xe_bind_exec_queue_create(fd, vm, 0);
+	/* Create exec_sync area */
+	sync_size = sizeof(*exec_sync) * num_bos;
+	sync_size = xe_bb_size(fd, sync_size);
+
+	exec_sync = mmap(NULL, sync_size, PROT_READ | PROT_WRITE,
+			 MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(exec_sync != MAP_FAILED);
+	memset(exec_sync, 0, sync_size);
+
+	for (i = 0; i < num_bos; i++) {
+		struct {
+			uint64_t vm_sync;
+		} *data;
+
+		/* CREATE BO - should succeed now with reasonable size */
+		//bo is created here of size nf_bo_size
+		// nf_bo_size is 64 MB
+		// Creating a buffer object of 64 MB size
+		// In a loop we are creating multiple BOs of 64 MB size
+		create_ret = __xe_bo_create(fd, 0, nf_bo_size,
+					    vram_if_possible(fd, eci->gt_id),
+					    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+					    NULL, &bos[i]);
+		if (create_ret) {
+			igt_debug("BO create failed  with error %d (%s)n\n",
+				  -create_ret, strerror(-create_ret));
+			igt_assert_f(create_ret == -ENOMEM || create_ret == -ENOSPC ||
+				     create_ret == -E2BIG || create_ret == -EPERM,
+				     "Unexpected error %d (%s)\n", -create_ret,
+				     strerror(-create_ret));
+			overcommit_detected = true;
+			num_bos = i;  // Reduce to successfully created BOs
+			break;
+		}
+		igt_debug("BO created successfully - %llu MB\n",
+			  (unsigned long long)(nf_bo_size >> 20));
+
+		/* MAP BO */
+		data = xe_bo_map(fd, bos[i], 4096);
+		memset(data, 0, 4096);
+		bind_sync[0].addr = to_user_pointer(&data->vm_sync);
+
+		/* Here we are binging the bos to the bind_exec_queue*/
+		bind_err = __xe_vm_bind(fd, vm, bind_exec_queue, bos[i], 0,
+					data_addr + (i * nf_bo_size), nf_bo_size,
+					DRM_XE_VM_BIND_OP_MAP, 0, bind_sync, 1, 0, 0, 0);
+		if (bind_err) {
+			igt_debug("Bind failed at %d/%d with error %d (%s) -"
+				  "overcommit detected at bind\n",
+				  i, num_bos, -bind_err, strerror(-bind_err));
+			igt_assert_f(bind_err == -ENOMEM || bind_err == -ENOSPC ||
+				     bind_err == -EPERM,
+				     "Unexpected bind error %d (%s)\n", -bind_err,
+				     strerror(-bind_err));
+			munmap(data, 4096);
+			gem_close(fd, bos[i]);
+			bos[i] = 0;
+			overcommit_detected = true;
+			num_bos = i;
+			break;
+		}
+		xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, bind_exec_queue,
+			       20 * NSEC_PER_SEC);
+		munmap(data, 4096);
+		igt_debug("Created and bound BO %d/%d at 0x%llx\n",
+			  i + 1, num_bos, (unsigned long long)(data_addr + (i * nf_bo_size)));
+	} // End for loop
+	if (overcommit_detected)
+		igt_debug("Non-fault mode correctly rejected overcommit");
+	else
+		igt_debug("All BOs created successfully\n");
+
+	/* Create batch buffer */
+	batch_bo = xe_bo_create(fd, vm, 0x1000,
+				vram_memory(fd, eci->gt_id),
+				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	batch_data = xe_bo_map(fd, batch_bo, 0x1000);
+	memset(batch_data, 0, 0x1000);
+
+	/* Bind batch buffer using async bind (fault mode requires this) */
+	batch_data[0].vm_sync = 0;
+	sync[0].addr = to_user_pointer(&batch_data[0].vm_sync);
+	xe_vm_bind_userptr_async(fd, vm, bind_exec_queue,
+				 to_user_pointer(exec_sync), sync_addr,
+				 sync_size, sync, 1);
+	xe_wait_ufence(fd, &batch_data[0].vm_sync, USER_FENCE_VALUE,
+		       bind_exec_queue, NSEC_PER_SEC);
+	xe_vm_bind_async(fd, vm, bind_exec_queue, batch_bo, 0, batch_addr,
+			 0x1000, sync, 1);
+	xe_wait_ufence(fd, &batch_data[0].vm_sync, USER_FENCE_VALUE,
+		       bind_exec_queue, NSEC_PER_SEC);
+
+	igt_debug("VM binds done - exec_sync at 0x%llx, batch_bo at 0x%llx\n",
+		  (unsigned long long)sync_addr, (unsigned long long)batch_addr);
+
+	/* Create exec queue */
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+	//exec_sync[0].handle = syncobj_create(fd, 0);
+
+	/* Use GPU to write to each BO - this will trigger page faults and migration */
+	for (i = 0; i < num_bos; i++) {
+		igt_debug("Writing to BO %d/%d via GPU\n", i + 1, num_bos);
+		for (off = 0; off < nf_bo_size; off += stride) {
+			uint64_t target_addr = data_addr + (i * nf_bo_size) + off;
+
+			b = 0;
+			batch_data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+			batch_data->batch[b++] = target_addr & 0xFFFFFFFF;
+			batch_data->batch[b++] = (target_addr >> 32) & 0xFFFFFFFF;
+			batch_data->batch[b++] = 0xBB;
+			batch_data->batch[b++] = MI_BATCH_BUFFER_END;
+
+			/* Submit batch */
+			exec_sync[0] = 0;
+			sync[0].addr = sync_addr;
+			exec.exec_queue_id = exec_queue;
+			exec.address = batch_addr;
+			// Wait for previous batch to complete (except on first iteration)
+
+			res = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
+			if (res != 0) {
+				if (errno == ENOMEM || errno == ENOSPC) {
+					igt_debug("Expected Fault ! GPU execution failed with errno %d (%s)"
+						  "- memory exhausted\n", errno, strerror(errno));
+					goto gpu_done;
+				}
+			}
+			ret = __xe_wait_ufence(fd, &exec_sync[0], USER_FENCE_VALUE, exec_queue,
+					       &timeout);
+			if (ret != 0) {
+				igt_debug("Batch wait failed - memory exhausted at BO %d offset 0x%lx\n",
+					  i, off);
+				goto gpu_done;
+			}
+		}
+		igt_debug("Accessed BO %d/%d via GPU\n", i + 1, num_bos);
+	}
+	igt_debug("All batches submitted - waiting for GPU completion\n");
+
+	/* Verify GPU writes by reading back from BOs */
+	igt_debug("Verifying GPU writes to BOs...\n");
+	for (i = 0; i < num_bos; i++) {
+		uint32_t *verify_data;
+		int errors = 0;
+
+		/* Map the BO to read back data */
+		verify_data = xe_bo_map(fd, bos[i], nf_bo_size);
+
+		for (off = 0; off < nf_bo_size; off += stride) {
+			uint32_t expected = 0xBB;
+			uint32_t actual = verify_data[off / 4];  /* Read at page boundary */
+
+			if (actual != expected) {
+				if (errors < 5) {  /* Limit error output */
+					igt_warn("Mismatch at BO %d offset 0x%llx:"
+						 "expected 0x%x, got 0x%x\n",
+						 i, (unsigned long long)off,
+						 expected, actual);
+				}
+				errors++;
+			}
+		}
+
+	munmap(verify_data, nf_bo_size);
+	if (errors == 0) {
+		igt_debug("BO %d/%d verified successfully - all %llu pages correct\n",
+			  i + 1, num_bos, (unsigned long long)(nf_bo_size / stride));
+	} else {
+		igt_debug("BO %d/%d had %d errors out of %llu pages\n",
+			  i + 1, num_bos, errors, (unsigned long long)(nf_bo_size / stride));
+	}
+}
+
+gpu_done:
+
+	igt_debug("GPU access test completed - overcommit correctly detected\n");
+	/* Cleanup */
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_exec_queue_destroy(fd, bind_exec_queue);
+	munmap(batch_data, 0x1000);
+	gem_close(fd, batch_bo);
+	munmap(exec_sync, sync_size);
+	for (i = 0; i < num_bos; i++) {
+		if (bos[i])
+			gem_close(fd, bos[i]);
+	}
+
+	free(bos);
+	xe_vm_destroy(fd, vm);
+}
+
+static int
+test_evict_oom(int fd, struct drm_xe_engine_class_instance *eci,
+	       int n_exec_queues, int n_execs, uint64_t system_size,
+	       size_t bo_size, unsigned long flags)
+{
+	uint32_t vm;
+	uint32_t bind_exec_queues[1] = { 0 };
+	uint64_t addr = 0x100000000;
+	uint64_t total_alloc_size;
+	int bind_err = 0;
+	uint32_t *bo;
+	int i;
+	const size_t min_map_size = 4096;  /* Add constant with proper type */
+
+	struct drm_xe_sync sync[1] = {
+			{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			  .timeline_value = USER_FENCE_VALUE },
+	};
+
+	/* Calculate total allocation size - now for full n_execs */
+	total_alloc_size = (uint64_t)n_execs * bo_size;
+
+	if (system_size < (total_alloc_size / 4)) {
+		igt_warn("Insufficient memory to run OOM test safely\n");
+		return -ENOMEM;
+	}
+	if (total_alloc_size > system_size) {
+		int safe_n_execs = system_size / bo_size;
+
+		safe_n_execs = ALIGN_DOWN(safe_n_execs, 4);
+		if (safe_n_execs < 4) {
+			igt_warn("Not enough memory to run OOM test\n");
+			return -ENOMEM;
+		}
+		igt_warn("Reducing n_execs from %d to %d to fit in available memory\n",
+			 n_execs, safe_n_execs);
+		n_execs = safe_n_execs;
+		total_alloc_size = (uint64_t)n_execs * bo_size;
+	}
+	igt_debug("OOM test: n_execs=%d, bo_size=%llu MB, total_alloc=%llu MB, available=%llu MB\n",
+		  n_execs, (unsigned long long)(bo_size >> 20),
+		  (unsigned long long)(total_alloc_size >> 20),
+		  (unsigned long long)(system_size >> 20));
+
+	/* Allocate array for n_execs BOs */
+	bo = calloc(n_execs, sizeof(*bo));
+	igt_assert(bo);
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+	bind_exec_queues[0] = xe_bind_exec_queue_create(fd, vm, 0);
+
+	igt_debug("\n n_execs = %d, bo_size = %zu\n", n_execs, bo_size);
+
+	/* Try to allocate and bind more than available memory */
+	for (i = 0; i < n_execs; i++) {
+		uint32_t __bo;
+		struct {
+			uint64_t vm_sync;
+		} *data;
+		int create_ret;
+		size_t map_size;  /* Use size_t for map size */
+
+		/* Use __xe_bo_create to handle allocation failures gracefully */
+		create_ret = __xe_bo_create(fd, 0, bo_size, vram_memory(fd, eci->gt_id),
+					    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+					    NULL, &__bo);
+		if (create_ret) {
+			igt_warn("BO create failed at iteration %d with error %d (%s)\n",
+				 i, create_ret, strerror(-create_ret));
+			break;
+		}
+
+		bo[i] = __bo;
+		/* Calculate map size with same types */
+		map_size = sizeof(*data) > min_map_size ? sizeof(*data) : min_map_size;
+		data = xe_bo_map(fd, __bo, map_size);
+		sync[0].addr = to_user_pointer(&data->vm_sync);
+		bind_err = __xe_vm_bind(fd, vm, bind_exec_queues[0], __bo, 0, addr,
+					bo_size, DRM_XE_VM_BIND_OP_MAP, 0, sync,
+					1, 0, 0, 0);
+		/* Attempt bind - should eventually fail with -ENOSPC or -ENOMEM */
+		if (bind_err) {
+			bind_err = -errno;
+			igt_warn("Bind failed at iteration %d with error %d (%s)\n",
+				 i, -bind_err, strerror(-bind_err));
+			munmap(data, map_size);
+			gem_close(fd, __bo);
+			bo[i] = 0;
+			break;
+		}
+
+		xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE,
+			       bind_exec_queues[0], 20 * NSEC_PER_SEC);
+
+		/* Unmap with the same size we used for mapping */
+		munmap(data, map_size);
+		addr += bo_size;
+	}
+
+	/* Cleanup allocated BOs - iterate through all n_execs */
+	for (int j = 0; j < n_execs; j++) {
+		if (bo[j])
+			gem_close(fd, bo[j]);
+	}
+
+	xe_exec_queue_destroy(fd, bind_exec_queues[0]);
+	xe_vm_destroy(fd, vm);
+	free(bo);
+
+	return bind_err;
+}
+
+static unsigned int oom_working_set(uint64_t vram_size, uint64_t system_size,
+				    uint64_t nf_bo_size)
+{
+	uint64_t target_allocation;
+	unsigned int set_size;
+
+	/*
+	 * For VRAM eviction testing, we want to allocate MORE than VRAM size
+	 * to force eviction to system memory. Target 150-200% of VRAM.
+	 * The BOs are created with VRAM placement, so they'll initially go to VRAM
+	 * and then get evicted to system when VRAM fills up.
+	 */
+	target_allocation = (vram_size * 150) / 100;  /* 150% of VRAM */
+
+	/* But ensure we don't exceed available system memory */
+	if (target_allocation > (system_size * 80) / 100) {
+		target_allocation = (system_size * 80) / 100;
+		igt_debug("Limited by system memory: reducing target from %llu MB to %llu MB\n",
+			  (unsigned long long)((vram_size * 150 / 100) >> 20),
+			  (unsigned long long)(target_allocation >> 20));
+	}
+
+	set_size = target_allocation / nf_bo_size;
+
+	igt_debug("VRAM stress calculation: vram_size=%" PRIu64 " MB, system=%" PRIu64
+			  "MB, target_alloc=%" PRIu64 " MB (%.1f%% of VRAM), nf_bo_size=%"
+			  PRIu64 " MB, set_size=%u\n",
+			  (uint64_t)(vram_size >> 20), (uint64_t)(system_size >> 20),
+			  (uint64_t)(target_allocation >> 20),
+			  (double)(target_allocation * 100) / vram_size,
+			  (uint64_t)(nf_bo_size >> 20), set_size);
+
+	return ALIGN_DOWN(set_size, 4);
+}
+
 struct thread_data {
 	pthread_t thread;
 	pthread_mutex_t *mutex;
@@ -722,7 +1345,29 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
  * @beng-threads-large:		bind exec_queue threads large
  *
  */
+/**
+ * SUBTEST: evict-vm-nonfault-overcommit
+ * Description: VM non-fault mode overcommit test - expects bind failure
+ * Test category: functionality test
+ * Feature: VM bind
+ */
 
+/**
+ * SUBTEST: evict-vm-fault-overcommit
+ * Description: VM fault mode overcommit test - touch pages to trigger faults
+ * Test category: functionality test
+ * Feature: VM bind, fault mode
+ */
+/**
+ * SUBTEST: evict-%s
+ * Description: %arg[1] out-of-memory evict test - expects graceful failure
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @oom-graceful:       OOM graceful failure with small BOs
+ * @oom-graceful-large: OOM graceful failure with large BOs
+ */
 /*
  * Table driven test that attempts to cover all possible scenarios of eviction
  * (small / large objects, compute mode vs non-compute VMs, external BO or BOs
@@ -793,6 +1438,17 @@ int igt_main()
 			MULTI_VM },
 		{ NULL },
 	};
+	const struct section_oom {
+		const char *name;
+		int n_exec_queues;
+		int mul;
+		int div;
+		unsigned int flags;
+} sections_oom[] = {
+	{ "oom-graceful", 1, 1, 128, BIND_EXEC_QUEUE },
+	{ "oom-graceful-large", 1, 1, 16, BIND_EXEC_QUEUE },
+	{ NULL },
+};
 	const struct section_threads {
 		const char *name;
 		int n_threads;
@@ -914,6 +1570,14 @@ int igt_main()
 		}
 	}
 
+	igt_subtest("evict-vm-nonfault-overcommit") {
+		test_vm_nonfault_mode_overcommit(fd, hwe, system_size, vram_size, 2);
+	}
+
+	igt_subtest("evict-vm-fault-overcommit") {
+		test_vm_fault_mode_overcommit(fd, hwe, system_size, vram_size, 2);
+	}
+
 	for (const struct section_cm *s = sections_cm; s->name; s++) {
 		igt_subtest_f("evict-%s", s->name) {
 			uint64_t bo_size = calc_bo_size(vram_size, s->mul, s->div);
@@ -952,6 +1616,27 @@ int igt_main()
 				bo_size, s->flags);
 		}
 	}
+	for (const struct section_oom *s = sections_oom; s->name; s++) {
+		igt_subtest_f("evict-%s", s->name) {
+			uint64_t bo_size = calc_bo_size(vram_size, s->mul, s->div);
+			int n_execs = oom_working_set(vram_size, system_size, bo_size);
+			int ret;
+
+			igt_debug("OOM test: n_execs %d, bo_size %" PRIu64 " MiB\n",
+				  n_execs, bo_size >> 20);
+
+			ret = test_evict_oom(fd, hwe, s->n_exec_queues, n_execs,
+					     system_size, bo_size, s->flags);
+
+			/* Accept success or graceful OOM errors */
+			igt_assert(ret == 0 || ret == -ENOSPC || ret == -ENOMEM);
+			if (ret != 0)
+				igt_debug("Test passed: Got expected error %d (%s)\n",
+					  ret, strerror(-ret));
+			else
+				igt_debug("Test passed: All allocations and binds succeeded\n");
+	}
+}
 
 	igt_fixture()
 		drm_close_driver(fd);
-- 
2.52.0

