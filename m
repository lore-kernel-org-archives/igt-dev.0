Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2184FF4956
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 08:01:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B85A10E349;
	Mon, 30 Mar 2026 08:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrOOZerY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747D810E346
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 08:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774857678; x=1806393678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=auCXB16X3fP+9URT5Dr/AQGBLHUfw3+iRj2iD9GIXLQ=;
 b=nrOOZerYhgqM+Bi2GUIhgV1UL0S97ychsjD+8rmkvshldmlTO7fPhFV1
 6x7LnCYOd8IvenKfm5VxoOvm4iWQv8x30s32+kie7katP4dXKgCFrQ35n
 af6TfEXOt9BVwgwifGM1d+iNldDfwEt9JDMjzowlBNOyF6HqYad+r/dNL
 wjRsWUP8R+Bss410AwyAN4KvfzsdAIE/HGsqoYS2u5GuDxPzntyOuibzn
 1tJVQX0nA2zAmyJIc6klrrR2pSaXGDAM3QCUyBEoKn8CZ+V1O7fE3yoK1
 x0HxAalvccL9OrjNKlD4yE0j7serf0qe47LzsMni1QyqO0Zmuu6Dv0cvF Q==;
X-CSE-ConnectionGUID: I/qhYipGT7SK854NQCvaHA==
X-CSE-MsgGUID: C3yxkGsfTR+8b1Gv1u2B3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79445532"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="79445532"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 01:01:18 -0700
X-CSE-ConnectionGUID: /6pvXtpGSjmTzle1UfVCGQ==
X-CSE-MsgGUID: ajKNNAx9TDKG0/EngkapBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="256495575"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 01:01:17 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, nishit.sharma@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v9 3/3] tests/intel/xe_vm: Add support for overcommit
 tests
Date: Mon, 30 Mar 2026 08:01:03 +0000
Message-ID: <20260330080104.2956810-4-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260330080104.2956810-1-sobin.thomas@intel.com>
References: <20260330080104.2956810-1-sobin.thomas@intel.com>
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

Current tests focus on VM creation with basic mode selection and do not
support overcommit scenarios.

This change adds tests to verify overcommit behavior across different VM
modes.

Non-fault mode tests:
 - vram-lr-defer: DEFER_BACKING rejects overcommit at bind time
 - vram-lr-external-nodefer: Long-running mode with external BO and
                             no defer backing
 - vram-no-lr: Non-LR mode

Fault mode tests:
 - vram-lr-fault: Fault handling allows graceful overcommit via page
   faults
 - vram-lr-fault-no-overcommit: Verifies NO_VM_OVERCOMMIT blocks same-VM
   BO eviction during VM_BIND while still allowing eviction during
   pagefault OOM

These tests validate that VMs handle memory pressure appropriately based
on their configuration—rejecting at bind, failing at exec, or handling
it gracefully via page faults.

v2 - Added Additional test cases for LR mode and No Overcommit.

v3 - Refactored into single api call  based on the VM / BO Flags.

v5 - Addressed review comments (reset sync objects and nits).
     Added check in cleanup
v6 - Replaced __xe_vm_bind with xe_vm_bind_lr_sync and refactored.
v7 - Add failable xe_vm_bind_lr_sync to handle the failure in the
     vm bind in case over commit happens.
v9 - Replaced xe_vm_bind_lr_sync_failable woth __xe_vm_bind_lr_sync

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_vm.c | 394 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 393 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index ccff8f804..47ab5f705 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -20,6 +20,7 @@
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
 #include <string.h>
+#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
 
 static uint32_t
 addr_low(uint64_t addr)
@@ -2376,6 +2377,386 @@ static void invalid_vm_id(int fd)
 	do_ioctl_err(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy, ENOENT);
 }
 
+static void xe_async_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
+			     uint64_t offset, uint64_t addr, uint64_t size,
+			     struct drm_xe_sync *sync, uint32_t num_syncs, bool *overcommit)
+{
+	int bind_err = 0;
+
+	bind_err = __xe_vm_bind(fd, vm, exec_queue, bo, offset, addr, size,
+				DRM_XE_VM_BIND_OP_MAP, 0, sync, num_syncs, 0,
+				DEFAULT_PAT_INDEX, 0);
+	if (bind_err) {
+		if (bind_err == -ENOMEM) {
+			igt_debug("\n Setting overcommit to true");
+			*overcommit = true;
+		} else {
+			igt_assert_f(0, "Unexpected bind error %d (%s)\n", -bind_err,
+				     strerror(-bind_err));
+		}
+	}
+}
+
+static void create_data_bos(int fd, uint32_t vm, uint32_t bind_exec_queue,
+			    uint32_t *bos, int num_bos, uint64_t nf_bo_size,
+			    bool use_vram, uint64_t data_addr,
+			    bool *overcommit_detected, struct drm_xe_sync *bind_sync,
+			    uint32_t bo_flags, int gt_id)
+{
+	uint32_t create_ret = 0;
+	uint32_t placement = use_vram ? vram_memory(fd, gt_id) : system_memory(fd);
+
+	for (int i = 0; i < num_bos; i++) {
+		struct {
+			uint64_t vm_sync;
+		} *data;
+
+		/* Create BO using the case's create function */
+		create_ret = __xe_bo_create(fd, vm, nf_bo_size, placement,
+					    bo_flags, NULL, &bos[i]);
+
+		if (create_ret) {
+			if (create_ret == -ENOMEM) {
+				*overcommit_detected = true;
+				igt_debug("BO create failed at %d/%d with error %d (%s) - overcommit detected\n",
+					  i, num_bos, -create_ret, strerror(-create_ret));
+				break;
+			}
+			igt_assert_f(0, "Unexpected BO create error %d (%s)\n", -create_ret,
+				     strerror(-create_ret));
+		}
+
+		/* Map and bind BO */
+		data = xe_bo_map(fd, bos[i], nf_bo_size);
+		igt_assert(data);
+		memset(data, 0, nf_bo_size);
+
+		bind_sync[0].addr = to_user_pointer(&data->vm_sync);
+		xe_async_vm_bind(fd, vm, bind_exec_queue, bos[i], 0, data_addr + (i * nf_bo_size),
+				 nf_bo_size, bind_sync, 1, overcommit_detected);
+
+		if (*overcommit_detected) {
+			munmap(data, nf_bo_size);
+			igt_debug("Overcommit detected while vm bind\n");
+			break;
+		}
+
+		if (data->vm_sync != USER_FENCE_VALUE)
+			xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE,
+				       bind_exec_queue, 20 * NSEC_PER_SEC);
+		data->vm_sync = 0;
+		munmap(data, nf_bo_size);
+
+		igt_debug("Created and bound BO %d/%d at 0x%llx\n",
+			  i + 1, num_bos,
+			  (unsigned long long)(data_addr + (i * nf_bo_size)));
+	}
+}
+
+static void verify_bo(int fd, uint32_t *bos, int num_bos, uint64_t nf_bo_size, uint64_t stride)
+{
+	for (int i = 0; i < num_bos; i++) {
+		uint32_t *verify_data;
+		int errors = 0;
+
+		verify_data = xe_bo_map(fd, bos[i], nf_bo_size);
+		igt_assert(verify_data);
+
+		for (int off = 0; off < nf_bo_size; off += stride) {
+			uint32_t expected = 0xBB;
+			uint32_t actual = *(uint32_t *)((char *)verify_data + off);
+
+			if (actual != expected) {
+				if (errors < 5)
+					igt_debug("Mismatch at BO %d offset 0x%llx",
+						  i, (unsigned long long)off);
+				errors++;
+			}
+		}
+
+		munmap(verify_data, nf_bo_size);
+		igt_assert_f(errors == 0, "Data verification failed for BO %d with %d errors\n",
+			     i, errors);
+	}
+}
+
+/**
+ * SUBTEST: overcommit-fault-%s
+ * Description: Test VM overcommit behavior in fault mode with %arg[1] configuration
+ * Functionality: overcommit
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @vram-lr-fault:VRAM with LR and fault mode, expects exec to pass
+ * @vram-lr-fault-no-overcommit:VRAM with LR, fault and NO_VM_OVERCOMMIT, expects bind rejection
+ */
+
+/**
+ * SUBTEST: overcommit-nonfault-%s
+ * Description: Test VM overcommit behavior in nonfault mode with %arg[1] configuration
+ * Functionality: overcommit
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @vram-lr-defer:VRAM with LR and defer backing, expects bind rejection
+ * @vram-lr-external-nodefer:VRAM with LR and external BO without defer, expects exec fail
+ * @vram-no-lr:VRAM without LR mode, expects exec to fail
+ */
+struct vm_overcommit_case {
+	const char *name;
+	uint32_t vm_flags;
+	uint32_t bo_flags;
+	bool use_vram;
+	uint64_t data_addr;
+	uint32_t pat_index;
+	int overcommit_mult;
+};
+
+static const struct vm_overcommit_case overcommit_cases[] = {
+	/* Case 1: DEFER_BACKING */
+	{
+		.name = "vram-lr-defer",
+		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE,
+		.bo_flags = DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
+			    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+		.use_vram = true,
+		.data_addr = 0x1a0000,
+		.overcommit_mult = 2,
+	},
+	/* Case 1b: External BO without defer backing */
+	{
+		.name = "vram-lr-external-nodefer",
+		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE,
+		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+		.use_vram = true,
+		.data_addr = 0x1a0000,
+		.overcommit_mult = 2,
+	},
+	/* Case 2: LR + FAULT - should not fail on exec */
+	{
+		.name = "vram-lr-fault",
+		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			    DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
+		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+		.use_vram = true,
+		.data_addr = 0x300000000,
+		.overcommit_mult = 2,
+	},
+	/* Case 3: !LR - overcommit should fail on exec */
+	{
+		.name = "vram-no-lr",
+		.vm_flags = 0,
+		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+		.use_vram = true,
+		.data_addr = 0x300000000,
+		.overcommit_mult = 2,
+	},
+	/* Case 4: LR + FAULT + NO_VM_OVERCOMMIT */
+	{
+		.name = "vram-lr-fault-no-overcommit",
+		.vm_flags = DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT | DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			    DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
+		.bo_flags = DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
+			    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+		.use_vram = true,
+		.data_addr = 0x300000000,
+		.overcommit_mult = 2,
+	},
+	{ }
+};
+
+static void
+test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
+		   const struct vm_overcommit_case *c,
+		   uint64_t system_size, uint64_t vram_size)
+{
+	uint32_t vm = 0, *bos, batch_bo = 0, exec_queue = 0, bind_exec_queue;
+	bool is_fault_mode = (c->vm_flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) != 0;
+	bool is_lr_mode = (c->vm_flags & DRM_XE_VM_CREATE_FLAG_LR_MODE) != 0;
+	uint64_t sync_addr = 0x101a0000, batch_addr = 0x200000000;
+	uint64_t overcommit_size, off, data_addr;
+	size_t sync_size, nf_bo_size = 64 * 1024 * 1024;
+	uint64_t stride = 1024 * 1024, base_size;
+	int64_t timeout = 20 * NSEC_PER_SEC;
+	int i, num_bos, bind_err;
+	bool overcommit_detected = false;
+	struct drm_xe_sync bind_sync[1] = {
+		{
+			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.timeline_value = USER_FENCE_VALUE
+		},
+	};
+
+	/* For fault mode: user fence, for non-fault mode: syncobj */
+	struct drm_xe_sync exec_sync[1] = {
+		{
+			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.timeline_value = USER_FENCE_VALUE,
+			.handle = 0,
+		},
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(exec_sync),
+	};
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+		uint64_t vm_sync;
+	} *batch_data = NULL;
+	uint64_t *user_fence_sync = NULL;
+
+	data_addr = c->data_addr;
+
+	base_size = c->use_vram ? vram_size : system_size;
+	overcommit_size = ALIGN((uint64_t)(base_size * c->overcommit_mult), 4096);
+
+	num_bos = (overcommit_size / nf_bo_size) + 1;
+	bos = calloc(num_bos, sizeof(*bos));
+	igt_assert(bos);
+
+	igt_debug("Overcommit test: allocating %d BOs of %llu MB each",
+		  num_bos, (unsigned long long)(nf_bo_size >> 20));
+	igt_debug(" total=%llu MB, vram=%llu MB\n",
+		  (unsigned long long)(num_bos * nf_bo_size >> 20),
+		  (unsigned long long)(vram_size >> 20));
+	/* Create VM with appropriate flags */
+	vm = xe_vm_create(fd, c->vm_flags, 0);
+	igt_assert(vm);
+
+	bind_exec_queue = xe_bind_exec_queue_create(fd, vm, 0);
+	sync_size = xe_bb_size(fd, sizeof(uint64_t) * num_bos);
+	user_fence_sync = mmap(NULL, sync_size, PROT_READ | PROT_WRITE,
+			       MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(user_fence_sync != MAP_FAILED);
+	memset(user_fence_sync, 0, sync_size);
+
+	/* Create and bind data BOs */
+	create_data_bos(fd, vm, bind_exec_queue, bos, num_bos,
+			nf_bo_size, c->use_vram, data_addr,
+			&overcommit_detected, bind_sync, c->bo_flags, eci->gt_id);
+
+	if (overcommit_detected) {
+		igt_debug("Overcommit correctly rejected at BO creation/bind (created %d BOs)\n",
+			  num_bos);
+		goto cleanup;
+	}
+
+	 /*
+	  * Create batch buffer first in SRAM as focus is on data bo present in VRAM
+	  */
+	batch_bo = xe_bo_create(fd, vm, 0x1000, system_memory(fd), 0);
+
+	igt_debug("Mapping the created BO");
+	batch_data = xe_bo_map(fd, batch_bo, 0x1000);
+	igt_assert(batch_data);
+	memset(batch_data, 0, 0x1000);
+
+	/* Bind batch buffer and sync areas */
+	if (is_fault_mode) {
+		batch_data->vm_sync = 0;
+		bind_sync->addr = to_user_pointer(&batch_data->vm_sync);
+
+		xe_vm_bind_userptr_async(fd, vm, bind_exec_queue, to_user_pointer(user_fence_sync),
+					 sync_addr, sync_size, bind_sync, 1);
+		if (batch_data->vm_sync != USER_FENCE_VALUE)
+			xe_wait_ufence(fd, &batch_data->vm_sync, USER_FENCE_VALUE,
+				       bind_exec_queue, NSEC_PER_SEC);
+	}
+	batch_data->vm_sync = 0;
+	bind_err = __xe_vm_bind_lr_sync(fd, vm, batch_bo, 0, batch_addr, 0x1000, 0);
+	if (bind_err) {
+		if (bind_err == -ENOMEM) {
+			igt_debug("Setting overcommit to true\n");
+			overcommit_detected = true;
+			goto cleanup;
+		} else { /* Assert any bind error other than -ENOMEM */
+			igt_assert_f(0, "Unexpected bind error %d (%s)\n", -bind_err,
+				     strerror(-bind_err));
+		}
+	}
+
+	igt_debug("VM binds done - batch_bo at 0x%llx\n", (unsigned long long)batch_addr);
+	/* Create exec queue */
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+
+	/* Setup sync for exec */
+	if (is_fault_mode) {
+		exec_sync->addr = sync_addr;
+	} else if (is_lr_mode) {
+		/* LR mode - use batch_data->vm_sync (GPU accessible memory) */
+		batch_data->vm_sync = 0;
+		exec_sync->addr = to_user_pointer(&batch_data->vm_sync);
+	}
+
+	/* Use GPU to write to each BO */
+	for (i = 0; i < num_bos; i++) {
+		igt_debug("Writing to BO %d/%d via GPU\n", i + 1, num_bos);
+
+		for (off = 0; off < nf_bo_size; off += stride) {
+			uint64_t target_addr = data_addr + (i * nf_bo_size) + off;
+			int b_idx = 0, res = 0;
+
+			batch_data->batch[b_idx++] = MI_STORE_DWORD_IMM_GEN4;
+			batch_data->batch[b_idx++] = target_addr & 0xFFFFFFFF;
+			batch_data->batch[b_idx++] = (target_addr >> 32) & 0xFFFFFFFF;
+			batch_data->batch[b_idx++] = 0xBB;
+			batch_data->batch[b_idx++] = MI_BATCH_BUFFER_END;
+
+			/* Submit batch */
+			exec.exec_queue_id = exec_queue;
+			exec.address = batch_addr;
+
+			res = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
+			if (res != 0) {
+				if (errno == ENOMEM || errno == ENOSPC) {
+					igt_debug("Expected fault/error: %d (%s)\n",
+						  errno, strerror(errno));
+					goto cleanup;
+				}
+				igt_assert_f(0, "Unexpected exec error: %d\n", errno);
+			}
+			xe_wait_ufence(fd, &user_fence_sync[0], USER_FENCE_VALUE, exec_queue,
+				       timeout);
+			user_fence_sync[0] = 0;
+		}
+		igt_debug("Accessed BO %d/%d via GPU\n", i + 1, num_bos);
+	}
+	igt_debug("All batches submitted - waiting for GPU completion\n");
+
+	/* Verify GPU writes */
+	verify_bo(fd, bos, num_bos, nf_bo_size, stride);
+
+cleanup:
+	/* Cleanup */
+	if (exec_queue)
+		xe_exec_queue_destroy(fd, exec_queue);
+	if (bind_exec_queue)
+		xe_exec_queue_destroy(fd, bind_exec_queue);
+	if (batch_data)
+		munmap(batch_data, 0x1000);
+	if (batch_bo)
+		gem_close(fd, batch_bo);
+
+	munmap(user_fence_sync, sync_size);
+
+	if (bos) {
+		for (i = 0; i < num_bos; i++) {
+			if (bos[i])
+				gem_close(fd, bos[i]);
+		}
+		free(bos);
+	}
+	if (vm > 0)
+		xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: out-of-memory
  * Description: Test if vm_bind ioctl results in oom
@@ -2385,7 +2766,6 @@ static void invalid_vm_id(int fd)
  */
 static void test_oom(int fd)
 {
-#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
 #define BO_SIZE xe_bb_size(fd, SZ_512M)
 #define MAX_BUFS ((int)(xe_visible_vram_size(fd, 0) / BO_SIZE))
 	uint64_t addr = 0x1a0000;
@@ -2850,6 +3230,18 @@ int igt_main()
 		test_oom(fd);
 	}
 
+	for (int i = 0; overcommit_cases[i].name; i++) {
+		const struct vm_overcommit_case *c = &overcommit_cases[i];
+		const char *mode = (c->vm_flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) ?
+					"fault" : "nonfault";
+		igt_subtest_f("overcommit-%s-%s", mode, c->name) {
+			igt_require(xe_has_vram(fd));
+			igt_assert(xe_visible_vram_size(fd, 0));
+			test_vm_overcommit(fd, hwe, c, (igt_get_avail_ram_mb() << 20),
+					   xe_visible_vram_size(fd, 0));
+		}
+	}
+
 	igt_fixture()
 		drm_close_driver(fd);
 }
-- 
2.52.0

