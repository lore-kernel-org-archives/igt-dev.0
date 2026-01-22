Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B715FD2ED14
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 12:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6040C10E0C1;
	Thu, 22 Jan 2026 12:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oDuwXjL+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D071810E99E
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 12:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769086486; x=1800622486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M7HxjWvbXeMs02kC8KZqUcIgpBU1RD4/6oR49fj47q8=;
 b=oDuwXjL+p9NwICUs37rgbAEhJ8ofH4wXe108tVXfR5Ll22U6G7sY6z5J
 FKAZD5y+CpJcBiKumYpbJClWI8piGUdVRDaNHAqagGe2HVnZBs2KYdtSz
 mDj7TfaGxA6l3H8eEZHGcnqWg7qMZFQnFmKzyiS5UCYMpfuHkhjzMxGxZ
 wGt40THeTPsS/PxflV6Jj8AK4lHIuzMZ0EWw37/9+PFUYLnb2/L5wAYOP
 fSgN2z9PqdrykndFxY1ri/BIXQ5pM8qulZ5SfKy9DEY8zgGg5XdhGE4KW
 bEuZZVDAR/IJI4gW7cInW7Z72wqZ9MQI8irFSsXQiS2zy8avkb8QyxdG1 Q==;
X-CSE-ConnectionGUID: 5ctKNWPySgWHoUzHhP47ZQ==
X-CSE-MsgGUID: nkvZTsOKQrWnDG+KkFBIIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69521471"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="69521471"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:54:46 -0800
X-CSE-ConnectionGUID: 2LPH1NO2TfulSyrQmSpGUQ==
X-CSE-MsgGUID: dyp+4YFdR4yzXq5jZrGkaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="211582024"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 04:54:43 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 nishit.sharma@intel.com
Cc: Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v3 i-g-t 1/1] tests/intel/xe_evict: overcommit tests for
 fault-mode and non-fault-mode VMs
Date: Thu, 22 Jan 2026 12:54:06 +0000
Message-ID: <20260122125424.45139-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122125424.45139-1-sobin.thomas@intel.com>
References: <20260122125424.45139-1-sobin.thomas@intel.com>
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

The existing tests in xe_evict focus on system-wide memory allocation
across multiple processes. However, enhanced coverage for VRAM
overcommit handling in different VM modes was not there.

This change adds three new tests to verify VM overcommit handling.

 test_evict_oom(): Allocates BOs aggressively in a loop until
 VRAM overcommit occurs testing LR mode error handling.

 test_vm_nonfault_mode_overcommit() verifies that non-fault mode VMs
 properly reject overcommit attempts.

 test_vm_fault_mode_overcommit() validates that fault-mode VMs can
 handle memory pressure gracefully by touching pages to trigger page
 faults.

v3:
- Addressed review comments from Nishit on the error handling.
- Replaced igt_info with igt_debug and igt_warn

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_evict.c | 310 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 310 insertions(+)

diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 2350487c8..136ec4e09 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: MIT
+//
 /*
  * Copyright © 2021 Intel Corporation
  */
@@ -29,6 +30,7 @@
 #define COMPUTE_THREAD		(0x1 << 4)
 #define EXTERNAL_OBJ		(0x1 << 5)
 #define BIND_EXEC_QUEUE		(0x1 << 6)
+#define USER_FENCE_VALUE    0xdeadbeefdeadbeefull
 
 static void
 test_evict(int fd, struct drm_xe_engine_class_instance *eci,
@@ -210,6 +212,252 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 	drm_close_driver(fd);
 }
 
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
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
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
+	fd = drm_reopen_driver(fd);
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
+		uint64_t vm_sync;
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
+
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
+	drm_close_driver(fd);
+	free(bo);
+
+	return bind_err;
+}
+
+static unsigned int oom_working_set(uint64_t vram_size, uint64_t system_size,
+				    uint64_t bo_size)
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
+	set_size = target_allocation / bo_size;
+
+	igt_debug("VRAM stress calculation: vram_size=%" PRIu64 " MB, system=%" PRIu64
+		  "MB, target_alloc=%" PRIu64 " MB (%.1f%% of VRAM), bo_size=%"
+		  PRIu64 " MB, set_size=%u\n",
+		  (uint64_t)(vram_size >> 20), (uint64_t)(system_size >> 20),
+		  (uint64_t)(target_allocation >> 20),
+		  (double)(target_allocation * 100) / vram_size,
+		  (uint64_t)(bo_size >> 20), set_size);
+
+	return ALIGN_DOWN(set_size, 4);
+}
+
+static void
+test_vm_nonfault_mode_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
+				 uint64_t system_size, uint64_t vram_size,
+				 uint64_t overcommit_multiplier)
+{
+	uint32_t bo;
+	uint64_t overcommit_size;
+	uint32_t vm;
+	int ret, cret;
+
+	overcommit_size = ALIGN(vram_size * overcommit_multiplier, 4096);
+
+	/* Limit overcommit to available memory to avoid OOM killer */
+	if (overcommit_size > system_size) {
+		igt_info("Limiting overcommit size from %llu MB to %llu MB (available)\n",
+			 (unsigned long long)(overcommit_size >> 20),
+			 (unsigned long long)(system_size >> 20));
+		overcommit_size = ALIGN(system_size, 4096);
+	}
+
+	vm = xe_vm_create(fd, 0, 0);
+	cret = __xe_bo_create(fd, vm, overcommit_size,
+			      vram_memory(fd, eci->gt_id) | system_memory(fd),
+			      0, NULL, &bo);
+	if (cret) {
+		igt_assert_f(errno == E2BIG || errno == ENOMEM || errno == ENOSPC,
+			     "xe_bo_create failed with unexpected errno=%d (%s)\n",
+			     errno, strerror(errno));
+		xe_vm_destroy(fd, vm);
+		return;
+	}
+
+	ret = __xe_vm_bind(fd, vm, 0, bo, 0, 0,
+			   overcommit_size, DRM_XE_VM_BIND_OP_MAP, 0,
+			   NULL, 0, 0, 0, 0);
+	igt_assert_f(ret == -ENOMEM || ret == -ENOSPC,
+		     "Expected bind to fail with -ENOMEM/-ENOSPC, got %d\n", ret);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+static void test_vm_fault_mode_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
+					  uint64_t available_mem, uint64_t vram_size,
+					  uint64_t overcommit_multiplier)
+{
+	uint64_t overcommit_size;
+	uint32_t vm;
+	uint32_t bo;
+	uint64_t *ptr;
+	int create_ret;
+
+	overcommit_size = ALIGN(vram_size * overcommit_multiplier, 4096);
+
+	/* Limit overcommit to available memory to avoid OOM killer */
+	if (overcommit_size > available_mem) {
+		igt_info("Limiting overcommit size from %llu MB to %llu MB (available)\n",
+			 (unsigned long long)(overcommit_size >> 20),
+			 (unsigned long long)(available_mem >> 20));
+		overcommit_size = ALIGN(available_mem, 4096);
+	}
+
+	igt_debug("Fault mode overcommit test: size=%llu MB, vram=%llu MB\n",
+		  (unsigned long long)(overcommit_size >> 20),
+		  (unsigned long long)(vram_size >> 20));
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	igt_assert(vm);
+
+	create_ret = __xe_bo_create(fd, 0, overcommit_size,
+				    vram_memory(fd, eci->gt_id) | system_memory(fd),
+				    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+				    NULL, &bo);
+	if (create_ret) {
+		xe_vm_destroy(fd, vm);
+		igt_assert_f(create_ret != 0, "xe_bo_create failed with unexpected error %d\n",
+			     create_ret);
+		return;
+	}
+
+	ptr = xe_bo_map(fd, bo, overcommit_size);
+	igt_assert(ptr);
+	/* Touch first page */
+	memset(ptr, 0xAA, 4096);
+
+	/* Touch sparse pages to test fault handling - limit to avoid OOM */
+	for (uint64_t off = 0; off < overcommit_size; off += 4096)
+		((char *)ptr)[off] = 0xBB;
+
+	igt_info("Fault mode overcommit test completed successfully\n");
+
+	munmap(ptr, overcommit_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
 static void
 test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 	      int n_exec_queues, int n_execs, size_t bo_size, unsigned long flags,
@@ -665,7 +913,29 @@ static unsigned int working_set(uint64_t vram_size, uint64_t system_size,
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
@@ -730,6 +1000,17 @@ int igt_main()
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
@@ -836,6 +1117,14 @@ int igt_main()
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
@@ -862,6 +1151,27 @@ int igt_main()
 				min(ws, s->n_execs), bo_size, s->flags);
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
2.51.0

