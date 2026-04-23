Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5860AFAD3FC
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 04:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2F410E2EB;
	Thu, 23 Apr 2026 04:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/utzTdS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D6010EEA7
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 04:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776917946; x=1808453946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H1jkeQSsANygvxIF+7iJSrVgevNvO8DbDo6CTILzRuw=;
 b=n/utzTdS5Fxi+4TqkECutsG9bWMY6Q/bcfsnTKTqSoi/V39obK617gCi
 m+4AdVDxXbmU/7ysgQnXDefmJjp77LbRJwiwyD63sIQsBA6lo9LqIjGnb
 LjydZfyffa2KEF+ydeQGxGRnxMqrU54FjqPiKcKWYjoYqT3ic4XjGsro3
 jD3AAWh5UVhNLe0nGj1amAlVX8StxDwhkYVBnluHZ3ECWR3vG5sHI6770
 3lI3jWLYfu8tfJ6MG7o00Ccq+U99falfzLxcT+e0EjpbPIv092rsoLaga
 ZlC/5qJrqECcWp+L741aUJrEYnu2EqpaJeih51b5PWRXtQOqY/BaTF03N g==;
X-CSE-ConnectionGUID: IDhBVjCISb6wkwAsY+aLtQ==
X-CSE-MsgGUID: cAcLByUbRNiMyvqHM9BY9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88186947"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="88186947"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 21:19:05 -0700
X-CSE-ConnectionGUID: zDVIQ89NSAae8oC1eb6BmQ==
X-CSE-MsgGUID: Fmn66THhRRuPtrM40of/og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="232855977"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 21:19:06 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Cc: nishit.sharma@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v12 2/2] tests/intel/xe_vm: Add support for overcommit
 tests
Date: Thu, 23 Apr 2026 04:18:54 +0000
Message-ID: <20260423041854.496640-3-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260423041854.496640-1-sobin.thomas@intel.com>
References: <20260423041854.496640-1-sobin.thomas@intel.com>
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
v9 - Replaced xe_vm_bind_lr_sync_failable with __xe_vm_bind_lr_sync
v10 - Add ENOSPC error, moved BO map after bind is completed.
      Removed special casing LR Mode.
v11 - Add stage checks for the over commits for different stages
     (bind / exec).
v12 - Removed bind user ptr exclusive for fault mode.
      Replaced igt_assert with igt_require for xe_visible_vram_size

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_vm.c | 391 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 390 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index d75b0730d..408bfdb71 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -20,6 +20,14 @@
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
 #include <string.h>
+#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
+
+enum overcommit_stage {
+	EXPECT_NONE,
+	EXPECT_CREATE,
+	EXPECT_BIND,
+	EXPECT_EXEC,
+};
 
 static uint32_t
 addr_low(uint64_t addr)
@@ -2376,6 +2384,376 @@ static void invalid_vm_id(int fd)
 	do_ioctl_err(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy, ENOENT);
 }
 
+static enum overcommit_stage create_data_bos(int fd, uint32_t vm, uint32_t *bos, int num_bos,
+					     uint64_t nf_bo_size, bool use_vram, uint64_t data_addr,
+					     uint32_t bo_flags, int gt_id, int *num_bound_out)
+{
+	uint32_t placement = use_vram ? vram_memory(fd, gt_id) : system_memory(fd);
+
+	*num_bound_out = 0;
+
+	for (int i = 0; i < num_bos; i++) {
+		int bind_err;
+		int create_ret = 0;
+
+		/* Create BO using the case's create function */
+		create_ret = __xe_bo_create(fd, vm, nf_bo_size, placement,
+					    bo_flags, NULL, &bos[i]);
+
+		if (create_ret) {
+			if (errno == ENOMEM || errno == ENOSPC) {
+				igt_debug("BO create failed at %d/%d with error %d (%s)\n",
+					  i, num_bos, errno, strerror(errno));
+				return EXPECT_CREATE;
+			}
+			igt_assert_f(0, "Unexpected BO create error %d (%s)\n", errno,
+				     strerror(errno));
+		}
+
+		bind_err = __xe_vm_bind_lr_sync(fd, vm, bos[i], 0, data_addr +
+						((uint64_t)i * nf_bo_size), nf_bo_size, 0);
+		if (bind_err) {
+			if (errno == ENOMEM || errno == ENOSPC) {
+				igt_debug("BO bind failed at %d/%d - error %d (%s), %d BOs bound\n",
+					  i, num_bos, errno, strerror(errno), i);
+				return EXPECT_BIND;
+			}
+			igt_assert_f(0, "Unexpected BO bind error %d (%s)\n", errno,
+				     strerror(errno));
+		}
+
+		*num_bound_out = i + 1;
+		igt_debug("Created and bound BO %d/%d at 0x%llx\n",
+			  i + 1, num_bos,
+			  (unsigned long long)(data_addr + ((uint64_t)i * nf_bo_size)));
+	}
+	return EXPECT_NONE;
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
+static void bind_userptr_sync(int fd, uint32_t vm, uint32_t bind_exec_queue, void *userptr,
+			      uint64_t addr, uint64_t size, struct drm_xe_sync *sync,
+			      uint64_t *sync_mem)
+{
+	*sync_mem = 0;
+
+	sync->addr = to_user_pointer(sync_mem);
+	xe_vm_bind_userptr_async(fd, vm, bind_exec_queue, to_user_pointer(userptr), addr, size,
+				 sync, 1);
+	xe_wait_ufence(fd, sync_mem, USER_FENCE_VALUE, bind_exec_queue, 20 * NSEC_PER_SEC);
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
+ * @vram-lr:VRAM with LR and fault mode, expects exec to pass
+ * @vram-lr-no-overcommit:VRAM with LR, fault and NO_VM_OVERCOMMIT; exec succeeds via migration
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
+ * @vram-lr-external-nodefer:VRAM with LR and external BO without defer, expects bind fail
+ * @vram-no-lr:VRAM without LR mode, expects exec to fail
+ */
+struct vm_overcommit_case {
+	const char *name;
+	uint32_t vm_flags;
+	uint32_t bo_flags;
+	bool use_vram;
+	uint64_t data_addr;
+	int overcommit_mult;
+	enum overcommit_stage expected_stage;
+};
+
+static const struct vm_overcommit_case overcommit_cases[] = {
+	/* DEFER_BACKING */
+	{
+		.name = "vram-lr-defer",
+		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE,
+		.bo_flags = DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
+			    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+		.use_vram = true,
+		.data_addr = 0x1a0000,
+		.overcommit_mult = 2,
+		.expected_stage = EXPECT_BIND,
+	},
+	/* External BO without defer backing */
+	{
+		.name = "vram-lr-external-nodefer",
+		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE,
+		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+		.use_vram = true,
+		.data_addr = 0x1a0000,
+		.overcommit_mult = 2,
+		.expected_stage = EXPECT_BIND,
+	},
+	/* LR + FAULT - should not fail on exec */
+	{
+		.name = "vram-lr",
+		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			    DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
+		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+		.use_vram = true,
+		.data_addr = 0x300000000,
+		.overcommit_mult = 2,
+		.expected_stage = EXPECT_NONE,
+	},
+	/* !LR - overcommit should fail on exec */
+	{
+		.name = "vram-no-lr",
+		.vm_flags = 0,
+		.bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+		.use_vram = true,
+		.data_addr = 0x300000000,
+		.overcommit_mult = 2,
+		.expected_stage = EXPECT_EXEC,
+	},
+	/* LR + FAULT + NO_VM_OVERCOMMIT */
+	{
+		.name = "vram-lr-no-overcommit",
+		.vm_flags = DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT | DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			    DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
+		.bo_flags = DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
+			    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+		.use_vram = true,
+		.data_addr = 0x300000000,
+		.overcommit_mult = 2,
+		/*
+		 * FAULT_MODE handles VRAM pressure via migration even with
+		 * NO_VM_OVERCOMMIT; DEFER_BACKING defers physical allocation
+		 * to fault time so bind-time rejection does not occur.
+		 */
+		.expected_stage = EXPECT_NONE,
+	},
+	{ }
+};
+
+static void
+test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
+		   const struct vm_overcommit_case *c,
+		   uint64_t system_size, uint64_t vram_size)
+{
+	uint32_t vm = 0, *bos, batch_bo = 0, exec_queue = 0, bind_exec_queue = 0;
+	uint64_t sync_addr = 0x1000000000, batch_addr = 0x200000000;
+	int i, num_bos, num_bound = 0, bind_err, create_ret, wait_ret;
+	size_t sync_size, nf_bo_size = 64 * 1024 * 1024;
+	enum overcommit_stage actual_stage = EXPECT_NONE;
+	uint64_t stride = 1024 * 1024, base_size;
+	uint64_t overcommit_size, off, data_addr;
+	int64_t timeout = 20 * NSEC_PER_SEC;
+	struct drm_xe_sync bind_sync[1] = {
+		{
+			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.timeline_value = USER_FENCE_VALUE
+		},
+	};
+	struct drm_xe_sync exec_sync[1] = {
+		{
+			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.timeline_value = USER_FENCE_VALUE,
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
+	base_size = c->use_vram ? vram_size : system_size;
+	overcommit_size = ALIGN((uint64_t)(base_size * c->overcommit_mult), 4096);
+
+	num_bos = (overcommit_size / nf_bo_size) + 1;
+	bos = calloc(num_bos, sizeof(*bos));
+	igt_assert(bos);
+
+	igt_debug("Overcommit test: allocating %d BOs of %llu MB each",
+		  num_bos, (unsigned long long)(nf_bo_size >> 20));
+	igt_debug("total=%llu MB, vram=%llu MB\n",
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
+	exec_sync->addr = to_user_pointer(&user_fence_sync[0]);
+
+	/* Create and bind data BOs */
+	actual_stage = create_data_bos(fd, vm, bos, num_bos, nf_bo_size, c->use_vram, data_addr,
+				       c->bo_flags, eci->gt_id, &num_bound);
+	/*
+	 * On EXPECT_CREATE nothing was bound so bail out entirely.
+	 * On EXPECT_BIND with no BOs bound there is nothing to execute either.
+	 * On EXPECT_BIND with some BOs bound, continue executing so that the
+	 * already-bound BOs can still be executed, verifying they are usable
+	 * after a partial bind failure.
+	 */
+	if (actual_stage == EXPECT_CREATE || (actual_stage == EXPECT_BIND && num_bound == 0))
+		goto check_and_cleanup;
+
+	/*
+	 * Create batch buffer first in SRAM as focus is to
+	 * check overcommit in VRAM
+	 */
+	create_ret = __xe_bo_create(fd, vm, 0x1000, system_memory(fd), 0, NULL, &batch_bo);
+	igt_assert_f(create_ret == 0, "Unexpected batch BO create error %d (%s)\n",
+		     create_ret, strerror(errno));
+
+	igt_debug("Mapping the created BO\n");
+	batch_data = xe_bo_map(fd, batch_bo, 0x1000);
+	igt_assert(batch_data);
+	memset(batch_data, 0, 0x1000);
+
+	bind_userptr_sync(fd, vm, bind_exec_queue, user_fence_sync, sync_addr, sync_size, bind_sync,
+			  &batch_data->vm_sync);
+	exec_sync->addr = sync_addr;
+	batch_data->vm_sync = 0;
+	bind_err = __xe_vm_bind_lr_sync(fd, vm, batch_bo, 0, batch_addr, 0x1000, 0);
+	if (bind_err) {
+		if (errno == ENOMEM || errno == ENOSPC) {
+			actual_stage = EXPECT_BIND;
+			goto check_and_cleanup;
+		} else { /* Assert on any unexpected bind error */
+			igt_assert_f(0, "Unexpected bind error %d (%s)\n", bind_err,
+				     strerror(errno));
+		}
+	}
+
+	igt_debug("VM binds done - batch_bo at 0x%llx\n", (unsigned long long)batch_addr);
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+
+	/* Use GPU to write to each successfully bound BO */
+	for (i = 0; i < num_bound; i++) {
+		igt_debug("Writing to BO %d/%d via GPU\n", i + 1, num_bos);
+		timeout = 20 * NSEC_PER_SEC;
+
+		for (off = 0; off < nf_bo_size; off += stride) {
+			uint64_t target_addr = data_addr + ((uint64_t)i * nf_bo_size) + off;
+			int b_idx = 0;
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
+			if (igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec)) {
+				if (errno == ENOMEM || errno == ENOSPC) {
+					igt_debug("Expected fault/error: %d (%s)\n",
+						  errno, strerror(errno));
+					actual_stage = EXPECT_EXEC;
+					goto check_and_cleanup;
+				}
+				igt_assert_f(0, "Unexpected exec error: %d\n", errno);
+			}
+			wait_ret = __xe_wait_ufence(fd, &user_fence_sync[0],
+						    USER_FENCE_VALUE, exec_queue, &timeout);
+			/*
+			 * EIO means the exec queue was banned due to VRAM
+			 * exhaustion in non-fault mode after partial bind.
+			 */
+			if (wait_ret == -EIO) {
+				igt_assert_f(c->expected_stage == EXPECT_BIND ||
+					     c->expected_stage == EXPECT_EXEC,
+					     "Unexpected queue reset\n");
+				actual_stage = EXPECT_EXEC;
+				goto check_and_cleanup;
+			}
+			igt_assert_eq(wait_ret, 0);
+			user_fence_sync[0] = 0;
+		}
+		igt_debug("Accessed BO %d/%d via GPU\n", i + 1, num_bos);
+	}
+	igt_debug("All batches submitted - waiting for GPU completion\n");
+
+	/* Verify GPU writes for bound BOs */
+	if (actual_stage == EXPECT_NONE || (actual_stage == EXPECT_BIND && num_bound > 0))
+		verify_bo(fd, bos, num_bound, nf_bo_size, stride);
+
+check_and_cleanup:
+	igt_assert_f(actual_stage == c->expected_stage, "Expected overcommit at stage %d, got %d\n",
+		     c->expected_stage, actual_stage);
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
+	if (user_fence_sync)
+		munmap(user_fence_sync, sync_size);
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
@@ -2385,7 +2763,6 @@ static void invalid_vm_id(int fd)
  */
 static void test_oom(int fd)
 {
-#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
 #define BO_SIZE xe_bb_size(fd, SZ_512M)
 #define MAX_BUFS ((int)(xe_visible_vram_size(fd, 0) / BO_SIZE))
 	uint64_t addr = 0x1a0000;
@@ -3115,6 +3492,18 @@ int igt_main()
 			test_get_property(fd, f->test);
 	}
 
+	for (int i = 0; overcommit_cases[i].name; i++) {
+		const struct vm_overcommit_case *c = &overcommit_cases[i];
+		const char *mode = (c->vm_flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) ?
+					"fault" : "nonfault";
+		igt_subtest_f("overcommit-%s-%s", mode, c->name) {
+			igt_require(xe_has_vram(fd));
+			igt_require(xe_visible_vram_size(fd, 0));
+			test_vm_overcommit(fd, hwe_non_copy, c, (igt_get_avail_ram_mb() << 20),
+					   xe_visible_vram_size(fd, 0));
+		}
+	}
+
 	igt_fixture()
 		drm_close_driver(fd);
 }
-- 
2.52.0

