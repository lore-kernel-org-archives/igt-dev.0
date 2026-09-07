Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEFDC79F89
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 08:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E440E10E6B7;
	Mon,  7 Sep 2026 08:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nSpcF0LK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1E910E2D1
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 08:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788769255; x=1820305255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hI5CIesdc/5J0Ud+jWrtFak3SIN16sAMoJC+JdLxZRs=;
 b=nSpcF0LKqWFIOSY4c9frtnoTNPKONEMKhbDtyLCaQzMy6+P/4od/j6Xw
 78bqwHYWmNF8cYz6rTgvL3PC1UCBbkMp73W7OARq5zJQRugOutP14epl9
 Cl0R0MuMNKO/wfC/EvWe7hMSEPF+uRjLCt4Uocu5cqkrmgg/4bLLAZWqu
 Hx1v5fC+GX0zZHVG4qa7Ant7MvQhlzoM/aM5uGc6SrtKWc3XWnip+jwjZ
 c5A7UaCdvx+WqOXcfMKnJXVx/wAZe79bm+BHMjiRp5Qrsn1uKzLOlQj3n
 fUGy5kylVV6mPJ5Dg32aaiW72jzfPfLfTuL/Ypw7DGrnOdJiCEc9A7++n w==;
X-CSE-ConnectionGUID: 6YEoTbmCREu5sIs21gLo6w==
X-CSE-MsgGUID: C8OGStFARSaluWNGgLfjKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="106685110"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="106685110"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:20:55 -0700
X-CSE-ConnectionGUID: J3ppgmoiTTSXuNQ/+fPQAg==
X-CSE-MsgGUID: 5/y8oWYhRMWcDD8vuVl0Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="272580385"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:20:54 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	matthew.brost@intel.com
Cc: nishit.sharma@intel.com, kamil.konieczny@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v4 1/2] tests/intel: add BO allocation stress coverage
Date: Mon,  7 Sep 2026 08:20:36 +0000
Message-ID: <20260907082039.2223531-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260907082039.2223531-1-sobin.thomas@intel.com>
References: <20260907082039.2223531-1-sobin.thomas@intel.com>
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

Add a BO allocation stress test that exercises concurrent
buffer allocation, VM binding for randomized and threaded
execution.

The test runs multiple workloads in parallel threads, forcing memory
pressure, verifies execution and validate result after execution.
This provide coverage for different BO allocation stress
scenarios

v3: renamed the sub test functions.
v4: Addressed nits (Kamil)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_bo_alloc.c | 1025 +++++++++++++++++++++++++++++++++++++
 tests/meson.build         |    1 +
 2 files changed, 1026 insertions(+)
 create mode 100644 tests/intel/xe_bo_alloc.c

diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
new file mode 100644
index 000000000..58380463c
--- /dev/null
+++ b/tests/intel/xe_bo_alloc.c
@@ -0,0 +1,1025 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: xe_bo_alloc
+ * Category: Core
+ * Mega feature: General
+ * Sub-category: Memory
+ * Functionality: BO allocation
+ * Description: Tests for buffer object allocation in Xe driver
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <sys/mman.h>
+
+#include "igt.h"
+
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+#include "xe_drm.h"
+#define BO_BIND_BASE_ADDR	0x1a0000ull
+#define THREAD_VA_STRIDE GB(1)
+#define SZ_4K_SHIFT	12
+#define MAX_ALLOCATIONS 50000
+
+/**
+ * SUBTEST: all-sizes-once
+ * Description: Test all BO allocations sizes in test table
+ * Test category: functionality test
+ *
+ * SUBTEST: rand-sizes-10
+ * Description: Test 10 random BO allocation sizes in test table
+ * Test category: functionality test
+ *
+ * SUBTEST: rand-sizes-100
+ * Description: Test 100 random BO allocation sizes in test table
+ * Test category: functionality test
+ *
+ * SUBTEST: rand-sizes-100-unaligned
+ * Description: Test 100 random BO allocation sizes in test table, unaligned bind addresses
+ * Test category: functionality test
+ *
+ * SUBTEST: array-binds-rand-sizes-10
+ * Description: Test 10 batches of 10 random BO allocation sizes each bound together as a
+ * single array of binds
+ * Test category: functionality test
+ *
+ * SUBTEST: array-binds-rand-sizes-10-unaligned
+ * Description: Test 10 batches of 10 random BO allocation sizes bound together as a single
+ * array of binds, unaligned bind addresses
+ * Test category: functionality test
+ *
+ * SUBTEST: threads-rand-sizes-50
+ * Description: Test 50 random bo allocation sizes in test table with a thread per engine
+ * test category: stress test
+ *
+ * SUBTEST: threads-rand-sizes-50-unaligned
+ * Description: Test 50 random bo allocation sizes in test table with a thread per engine,
+ * unaligned bind addresses
+ * test category: stress test
+ *
+ * SUBTEST: threads-leak-binding-rand-sizes-50
+ * Description: Test 50 random BO allocation sizes in test table with a thread per engine,
+ * leak the binding
+ * Test category: stress test
+ *
+ * SUBTEST: threads-leak-binding-rand-sizes-50-unaligned
+ * Description: Test 50 random BO allocation sizes in test table with a thread per engine,
+ * leak the binding, unaligned bind addresses
+ * Test category: stress test
+ */
+
+#define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
+#define MIN_BUFS_PER_PROC 2
+
+#define N_ALLOC_SIZES	256
+static uint64_t *alloc_sizes;
+
+/*
+ * Data-driven subtest matrix.
+ *
+ * TYPE_ALL_SIZES / TYPE_SINGLE / TYPE_ARRAY_BIND all exercise exactly one
+ * engine per invocation, so they're wired up as a dynamic child subtest
+ * per engine below (igt_subtest_with_dynamic_f() + igt_dynamic_f()).
+ *
+ * TYPE_THREAD are deliberately NOT split per engine here:
+ * threads() already do their own xe_for_each_engine() to spawn one
+ * thread per engine internally. Wrapping those in a second, outer
+ * per-engine loop would run the full all-engine fan-out
+ * once for every engine on the machine, multiplying the runtime by the
+ * engine count and re-exercising every engine N times over. So these
+ * stay flat, single subtests.
+ */
+enum test_type {
+	TYPE_ALL_SIZES,
+	TYPE_SINGLE,
+	TYPE_ARRAY_BIND,
+	TYPE_THREAD,
+};
+
+struct test_case {
+	const char *name;
+	int count; /* -1 means "until vram_per_process is hit" */
+	uint32_t flags;
+	enum test_type type;
+	bool requires_evict_ram;
+};
+
+#define LEAK_BINDING		(0x1 << 0)
+#define LEAK_BO			(0x1 << 1)
+#define EVICT			(0x1 << 2)
+#define UNALIGNED		(0x1 << 3)
+#define ARRAY_BIND    (0x1 << 4)
+
+/*
+ * Represents a single BO under test: its reserved VA range, the BO handle,
+ * the CPU mapping obtained after binding, and its size. The prepare / bind
+ * / execute steps below all operate on arrays of this struct so that the
+ * same code path drives both a single BO (the original subtests) and an
+ * "array of binds" of several BOs at once (the new array-binds subtests).
+ */
+struct bo_alloc {
+	void *va_reserve;	/* raw mmap() reservation, kept only so it can
+				 * be released again; never touched directly.
+				 */
+	size_t va_reserve_size;
+	void *va;		/* fixed CPU mapping address used by mmap */
+	uint64_t gpu_va;	/* GPU virtual address used by VM_BIND */
+	void *map;		/* CPU mapping of the BO, valid after bind */
+	uint64_t bo_size;
+	uint32_t bo;
+};
+
+struct bo_group {
+	struct bo_alloc *bos;
+	int n_bos;
+};
+
+/*
+ * Reserve a chunk of process address space to use as the VM bind address
+ * for a BO, and hand back a pointer inside it aligned either to bo_size
+ * ("aligned" case) or to 64K ("unaligned" case, i.e. deliberately not
+ * aligned to bo_size).
+ *
+ * This replaces the previous use of aligned_alloc(bo_size, bo_size):
+ * aligned_alloc() requires size to be a multiple of alignment, which
+ * doesn't hold for most entries in alloc_sizes[] (multiples of 64K, not
+ * generally powers of two), so the old "aligned" path was silently
+ * returning a mis-aligned pointer for the majority of sizes tested.
+ * Reserving with PROT_NONE also avoids committing real memory that just
+ * gets thrown away once xe_bo_map_fixed() replaces it with the BO mapping.
+ */
+static void bo_alloc_reserve_va(struct bo_alloc *b, uint32_t flags, uint64_t va_base)
+{
+	uint64_t align = (flags & UNALIGNED) ? SZ_64K : b->bo_size;
+	size_t reserve_size = b->bo_size + align;
+	uintptr_t addr;
+	uintptr_t aligned_addr;
+	void *reserve;
+
+	/*
+	 * Keep each BO reservation in the caller-selected VA window so threads
+	 * and per-process tests do not clash on random mmap addresses. The
+	 * unaligned case still uses a 64 KiB alignment while the fixed address is
+	 * only a hint to keep the ranges stable and non-overlapping.
+	 */
+	addr = ALIGN(va_base, align);
+	reserve = mmap((void *)addr, reserve_size, PROT_NONE,
+		       MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0);
+	if (reserve == MAP_FAILED) {
+		reserve = mmap(NULL, reserve_size, PROT_NONE,
+			       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+		igt_assert(reserve != MAP_FAILED);
+		addr = (uintptr_t)reserve;
+	}
+
+	b->va_reserve = reserve;
+	b->va_reserve_size = reserve_size;
+
+	addr = (uintptr_t)reserve;
+
+	/*
+	 * Round up to the next multiple of 'align'.
+	 * Works for arbitrary alignments, not just powers of two.
+	 */
+	aligned_addr = ((addr + align - 1) / align) * align;
+
+	b->va = (void *)aligned_addr;
+	b->gpu_va = to_user_pointer(b->va);
+
+	igt_debug("reserve=0x%llx align=0x%llx bo_size=0x%llx\n", (unsigned long long)addr,
+		  (unsigned long long)align, (unsigned long long)b->bo_size);
+
+	igt_assert_eq_u64(b->gpu_va % align, 0);
+}
+
+static int __xe_vm_bind_array(int fd, uint32_t vm,
+			      struct drm_xe_vm_bind_op *bind_ops,
+			      uint32_t num_bind, struct drm_xe_sync *sync,
+			      uint32_t num_syncs)
+{
+	struct drm_xe_vm_bind bind = {
+		.vm_id = vm,
+		.num_binds = num_bind,
+		.vector_of_binds = (uintptr_t)bind_ops,
+		.num_syncs = num_syncs,
+		.syncs = (uintptr_t)sync,
+		.exec_queue_id = 0,
+	};
+
+	igt_assert(num_bind > 0);
+
+	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind))
+		return -errno;
+
+	return 0;
+}
+
+static void alloc_sizes_init(void)
+{
+	int i;
+
+	alloc_sizes = malloc(sizeof(*alloc_sizes) * N_ALLOC_SIZES);
+
+	/* For now just do increments of 64k */
+	for (i = 0; i < N_ALLOC_SIZES; ++i)
+		alloc_sizes[i] = 0x10000ull * (i + 1);
+}
+
+static void alloc_sizes_fini(void)
+{
+	free(alloc_sizes);
+}
+
+struct batch_data {
+	uint32_t batch[16];
+	uint64_t pad;
+	uint32_t data;
+};
+
+static uint32_t wkey = 0xc0ffeeull;
+#define WRITE_VALUE(page)	(((wkey) << 8) | (page))
+
+static void check_exec_data(void *ptr, int n_pages)
+{
+	int i;
+
+	for (i = 0; i < n_pages; ++i) {
+		struct batch_data *data = ptr + i * SZ_4K;
+
+		igt_assert_eq(data->data, WRITE_VALUE(i));
+	}
+}
+
+static void bo_alloc_release_va(struct bo_alloc *b)
+{
+	if (!b->va_reserve || !b->va_reserve_size)
+		return;
+	munmap(b->va_reserve, b->va_reserve_size);
+	b->va_reserve = NULL;
+	b->va_reserve_size = 0;
+}
+
+/*
+ * PREPARE step: allocate the VA range and create the BO. Doesn't touch the
+ * GPU. vm is passed through unbound to xe_bo_create() exactly as before:
+ * non-evict BOs are created VM-private, evict BOs are created external so
+ * they can be freely rebound after being evicted.
+ */
+static void create_bo_arr(int fd, uint32_t vm, struct bo_alloc *bos,  int n_bos, uint16_t gt_id,
+			  uint32_t flags, uint64_t start_va)
+{
+	uint64_t alignment = xe_get_default_alignment(fd);
+	uint32_t create_flags;
+	int i;
+
+	igt_assert(n_bos > 0);
+	create_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
+
+	for (i = 0; i < n_bos; i++) {
+		igt_assert_f(bos[i].bo_size,
+			     "BO[%d] has zero size\n", i);
+
+		bos[i].bo_size = ALIGN(bos[i].bo_size, alignment);
+		bo_alloc_reserve_va(&bos[i], flags, start_va + (i * alignment));
+		bos[i].map = NULL;
+
+		bos[i].bo = xe_bo_create(fd, vm,
+					 bos[i].bo_size,
+					 vram_if_possible(fd, gt_id),
+					 create_flags);
+
+		igt_assert_f(bos[i].bo,
+			     "Failed to create BO[%d]: gt=%u size=%#llx gpu_va=%#llx\n",
+			     i, gt_id, (unsigned long long)bos[i].bo_size,
+			     (unsigned long long)bos[i].gpu_va);
+	}
+}
+
+/*
+ * BIND step: bind one or more BOs as a single array-of-binds ioctl call
+ * (see __xe_vm_bind_array() above), replacing the previous open-coded
+ * xe_vm_bind_sync() called once per BO.
+ */
+static int test_bind_individual(int fd, uint32_t vm, struct bo_alloc *bos, int n_bos)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = syncobj_create(fd, 0),
+	};
+	int i, ret, j;
+
+	for (i = 0; i < n_bos; i++) {
+		struct drm_xe_sync *bind_sync = NULL;
+		uint32_t num_syncs = 0;
+
+		igt_debug("bind[%d/%d] size=%llu MiB va=0x%llx bo=%u\n", i, n_bos,
+			  (unsigned long long)(bos[i].bo_size >> 20),
+			  (unsigned long long)bos[i].gpu_va,
+			  bos[i].bo);
+
+		/*
+		 * Signal only after the last async bind.
+		 * VM bind operations on the same VM are ordered.
+		 */
+		if (i == n_bos - 1) {
+			bind_sync = &sync;
+			num_syncs = 1;
+		}
+
+		ret = __xe_vm_bind(fd, vm, 0, bos[i].bo, 0, bos[i].gpu_va, bos[i].bo_size,
+				   DRM_XE_VM_BIND_OP_MAP, 0, bind_sync, num_syncs, 0,
+				   (uint8_t)-1, 0);
+		if (ret == -ENOMEM || ret == -ENOSPC) {
+			igt_debug("VM Bind failed at BO[%d]: ret=%d errno=%d (%s)\n",
+				  i, ret, errno, strerror(-ret));
+			for (j = 0; j < i; j++)
+				xe_vm_unbind_sync(fd, vm, 0, bos[j].gpu_va, bos[j].bo_size);
+			syncobj_destroy(fd, sync.handle);
+			return ret;
+		}
+		igt_assert_eq(ret, 0);
+	}
+
+	igt_assert_f(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL),
+		     "Timed out waiting for async VM binds\n");
+
+	syncobj_destroy(fd, sync.handle);
+
+	return 0;
+}
+
+static int test_bind_array(int fd, uint32_t vm,
+			   struct bo_alloc *bos, int n_bos)
+{
+	struct drm_xe_vm_bind_op *bind_ops;
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = syncobj_create(fd, 0),
+	};
+	int i, ret;
+
+	igt_assert(n_bos > 0);
+
+	bind_ops = calloc(n_bos, sizeof(*bind_ops));
+	igt_assert(bind_ops);
+
+	for (i = 0; i < n_bos; i++) {
+		igt_assert_f(bos[i].bo,
+			     "BO[%d] was not created before bind\n", i);
+
+		igt_assert_f(bos[i].bo_size,
+			     "BO[%d] has zero size\n", i);
+
+		bind_ops[i] = (struct drm_xe_vm_bind_op) {
+			.obj = bos[i].bo,
+			.obj_offset = 0,
+			.range = bos[i].bo_size,
+			.addr = bos[i].gpu_va,
+			.op = DRM_XE_VM_BIND_OP_MAP,
+			.flags = 0,
+		};
+
+		igt_debug("Bind op[%d]: bo=%u size=%#llx addr=%#llx\n",
+			  i,
+			  bos[i].bo,
+			  (unsigned long long)bos[i].bo_size,
+			  (unsigned long long)bos[i].gpu_va);
+	}
+
+	ret = __xe_vm_bind_array(fd, vm, bind_ops, n_bos, &sync, 1);
+	if (ret) {
+		if (ret == -ENOMEM || ret == -ENOSPC) {
+			syncobj_destroy(fd, sync.handle);
+			free(bind_ops);
+			return ret;
+		}
+
+		igt_assert_f(false, "Array VM_BIND failed: ret=%d errno=%d (%s)\n",
+			     ret, errno, strerror(errno));
+	}
+
+	igt_assert_f(syncobj_wait(fd, &sync.handle, 1,
+				  INT64_MAX, 0, NULL),
+		     "Timed out waiting for array VM_BIND\n");
+
+	syncobj_destroy(fd, sync.handle);
+	free(bind_ops);
+
+	return 0;
+}
+
+static int test_bind(int fd, uint32_t vm, struct bo_alloc *bos, int n_bos, uint32_t flags)
+{
+	if (flags & ARRAY_BIND)
+		return test_bind_array(fd, vm, bos, n_bos);
+	else
+		return test_bind_individual(fd, vm, bos, n_bos);
+}
+
+/*
+ * UNBIND step: unbind each BO synchronously.
+ * This path intentionally avoids array-unbind ioctls for stability.
+ * BO in the batch.
+ */
+static void test_unbind(int fd, uint32_t vm, struct bo_alloc *bos, int n_bos)
+{
+	int i;
+
+	igt_assert(n_bos > 0);
+
+	for (i = 0; i < n_bos; ++i)
+		xe_vm_unbind_sync(fd, vm, 0, bos[i].gpu_va, bos[i].bo_size);
+}
+
+/*
+ * Map every BO after binding.
+ *
+ * gpu_va is also used as the fixed CPU virtual address, following the
+ * original test design.
+ */
+static void test_map_bos(int fd, struct bo_alloc *bos, int n_bos)
+{
+	int i;
+
+	for (i = 0; i < n_bos; i++) {
+		bos[i].map = xe_bo_map_fixed(fd,
+					     bos[i].bo,
+					     bos[i].bo_size,
+					     bos[i].gpu_va);
+
+		igt_assert_f(bos[i].map != MAP_FAILED,
+			     "Failed to map BO[%d]: bo=%u size=%#llx address=%#llx\n",
+			     i, bos[i].bo,
+			     (unsigned long long)bos[i].bo_size,
+			     (unsigned long long)bos[i].gpu_va);
+	}
+}
+
+/*
+ * Build and submit one batch for every 4 KiB page of one BO.
+ */
+static void execute_bo(int fd, uint32_t exec_queue,
+		       struct bo_alloc *bo)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = syncobj_create(fd, 0),
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.exec_queue_id = exec_queue,
+		.num_syncs = 0,
+		.syncs = to_user_pointer(&sync),
+	};
+	const uint64_t batch_offset =
+		offsetof(struct batch_data, batch);
+	const uint64_t data_offset =
+		offsetof(struct batch_data, data);
+	int n_pages = bo->bo_size >> SZ_4K_SHIFT;
+	int i;
+
+	for (i = 0; i < n_pages; i++) {
+		struct batch_data *data;
+		uint64_t page_addr;
+		uint64_t batch_addr;
+		uint64_t data_addr;
+		int b = 0;
+
+		data = (void *)((char *)bo->map + i * SZ_4K);
+
+		page_addr = bo->gpu_va + (i * SZ_4K);
+		batch_addr = page_addr + batch_offset;
+		data_addr = page_addr + data_offset;
+
+		memset(data, 0, sizeof(*data));
+
+		data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+		data->batch[b++] = lower_32_bits(data_addr);
+		data->batch[b++] = upper_32_bits(data_addr);
+		data->batch[b++] = WRITE_VALUE(i);
+		data->batch[b++] = MI_BATCH_BUFFER_END;
+
+		igt_assert(b <= ARRAY_SIZE(data->batch));
+
+		exec.address = batch_addr;
+
+		/*
+		 * Signal only after the final page submission.
+		 */
+		exec.num_syncs = i == n_pages - 1 ? 1 : 0;
+
+		xe_exec(fd, &exec);
+	}
+
+	igt_assert_f(syncobj_wait(fd, &sync.handle, 1,
+				  INT64_MAX, 0, NULL),
+		     "Timed out waiting for BO execution\n");
+
+	check_exec_data(bo->map, n_pages);
+
+	syncobj_destroy(fd, sync.handle);
+}
+
+static void execute_multi_bos(int fd, uint32_t exec_queue,
+			      struct bo_alloc *bos, int n_bos)
+{
+	int i;
+
+	test_map_bos(fd, bos, n_bos);
+
+	for (i = 0; i < n_bos; i++)
+		execute_bo(fd, exec_queue, &bos[i]);
+}
+
+static void bo_release(int fd, struct bo_alloc *b)
+{
+	if (b->map)
+		munmap(b->map, b->bo_size);
+	if (b->bo)
+		gem_close(fd, b->bo);
+	bo_alloc_release_va(b);
+}
+
+/*
+ * Runs prepare + bind + execute for n_bos BOs at once (n_bos == 1
+ * reproduces the original single-BO behaviour). If LEAK_BINDING is not
+ * set, unbinds afterwards. If LEAK_BO is set, the BOs are left mapped and
+ * bound and returned to the caller (as an array the caller owns and must
+ * eventually pass to check_leak_multi_group()/free()); otherwise they're torn down
+ * immediately and NULL is returned.
+ */
+static struct bo_alloc *test_alloc_sizes(int fd, uint32_t vm, uint32_t exec_q,
+					 uint16_t gt_id, uint64_t *sizes,
+					 int n_bos, uint32_t flags,  uint64_t va_base)
+{
+	struct bo_alloc *bos;
+	int i, ret;
+
+	bos = calloc(n_bos, sizeof(*bos));
+	igt_assert(bos);
+
+	for (i = 0; i < n_bos; ++i)
+		bos[i].bo_size = sizes[i];
+
+	create_bo_arr(fd, vm, bos, n_bos, gt_id, flags, va_base);
+	ret = test_bind(fd, vm, bos, n_bos, flags);
+	if (ret == -ENOMEM || ret == -ENOSPC)
+		goto cleanup;
+
+	igt_assert_eq(ret, 0);
+	execute_multi_bos(fd, exec_q, bos, n_bos);
+
+	if (!(flags & LEAK_BINDING))
+		test_unbind(fd, vm, bos, n_bos);
+
+cleanup:
+
+	if (ret || !(flags & LEAK_BO)) {
+		for (i = 0; i < n_bos; ++i)
+			bo_release(fd, &bos[i]);
+		free(bos);
+		return NULL;
+	}
+
+	return bos;
+}
+
+/* Thin single-BO wrapper: keeps the existing call sites unchanged. */
+static struct bo_alloc *test_alloc_size(int fd, uint32_t vm, uint32_t q,
+					uint16_t gt_id, uint64_t bo_size,
+					uint32_t flags, uint64_t va_base)
+{
+	struct bo_alloc *bos = test_alloc_sizes(fd, vm, q, gt_id, &bo_size,
+						1, flags, va_base);
+
+	/* Caller only ever gets/frees a single struct, so unwrap it. */
+	if (bos) {
+		struct bo_alloc *b = malloc(sizeof(*b));
+
+		igt_assert(b);
+		*b = bos[0];
+		free(bos);
+		return b;
+	}
+
+	return NULL;
+}
+
+static void all_sizes_once(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	uint32_t vm, q;
+	int i;
+
+	vm = xe_vm_create(fd, 0, 0);
+	q =  xe_exec_queue_create(fd, vm, hwe, 0);
+
+	for (i = 0; i < N_ALLOC_SIZES; ++i)
+		test_alloc_size(fd, vm, q, hwe->gt_id, alloc_sizes[i], 0, BO_BIND_BASE_ADDR);
+
+	xe_exec_queue_destroy(fd, q);
+	xe_vm_destroy(fd, vm);
+}
+
+static void validate_bo_leak(int fd, uint32_t vm, struct bo_alloc *bos,
+			     int n_bos, uint32_t flags)
+{
+	int i;
+
+	for (i = 0; i < n_bos; ++i)
+		check_exec_data(bos[i].map, bos[i].bo_size >> SZ_4K_SHIFT);
+
+	/* Migrate the whole group back into VRAM, recheck */
+	if (flags & EVICT) {
+		igt_assert_eq(test_bind(fd, vm, bos, n_bos, flags), 0);
+
+		for (i = 0; i < n_bos; ++i)
+			check_exec_data(bos[i].map, bos[i].bo_size >> SZ_4K_SHIFT);
+
+		test_unbind(fd, vm, bos, n_bos);
+	}
+
+	for (i = 0; i < n_bos; ++i)
+		bo_release(fd, &bos[i]);
+}
+
+static void check_leak_multi_group(int fd, uint32_t vm, struct bo_group **groups,
+				   int count, uint32_t flags)
+{
+	int i;
+
+	for (i = 0; i < count; ++i) {
+		if (!groups[i])
+			continue;
+
+		validate_bo_leak(fd, vm, groups[i]->bos, groups[i]->n_bos, flags);
+		free(groups[i]);
+	}
+}
+
+static void alloc_rand_size_bos(int fd, struct drm_xe_engine_class_instance *hwe,
+				int count, uint64_t vram_per_process, pthread_barrier_t *barrier,
+				uint32_t flags)
+{
+	struct bo_group **leaks = NULL;
+	uint32_t vm, q, bo_size;
+	uint64_t vram_used = 0;
+	int i, max_batches = (count == -1) ? MAX_ALLOCATIONS : count;
+
+	igt_assert(count > 0 || (flags & EVICT && flags & LEAK_BO));
+	leaks = malloc(sizeof(*leaks) * max_batches);
+	igt_assert(leaks);
+
+	vm = xe_vm_create(fd, 0, 0);
+	q =  xe_exec_queue_create(fd, vm, hwe, 0);
+
+	for (i = 0; i < count || vram_used < vram_per_process; ++i) {
+		struct bo_alloc *bo;
+
+		bo_size = alloc_sizes[rand() % N_ALLOC_SIZES];
+
+		igt_assert(i < max_batches);
+		bo = test_alloc_size(fd, vm, q, hwe->gt_id, bo_size, flags,
+				     BO_BIND_BASE_ADDR);
+		if (bo) {
+			leaks[i] = malloc(sizeof(*leaks[i]));
+			igt_assert(leaks[i]);
+
+			leaks[i]->bos = bo;
+			leaks[i]->n_bos = 1;
+
+			vram_used += bo->bo_size;
+		} else {
+			leaks[i] = NULL;
+		}
+	}
+
+	if (barrier)
+		pthread_barrier_wait(barrier);
+	check_leak_multi_group(fd, vm, leaks, i, flags);
+
+	xe_exec_queue_destroy(fd, q);
+	xe_vm_destroy(fd, vm);
+	free(leaks);
+}
+
+/*
+ * Same idea as alloc_rand_size_bos(), but each iteration binds N_BOS_PER_BIND BOs
+ * together via a single array-of-binds call instead of one at a time.
+ * Used by the array-binds-* subtests, in particular the eviction stress
+ * test where several BOs need to be resident (or evicted) as a unit.
+ */
+#define N_BOS_PER_BIND	10
+
+static void alloc_random_size_bos_array_bind(int fd, struct drm_xe_engine_class_instance *hwe,
+					     int count, uint64_t vram_per_process,
+					     pthread_barrier_t *barrier, uint32_t flags,
+					     unsigned int *seed)
+{
+	struct bo_group **leaks = NULL;
+	uint32_t vm, exec_queue;
+	uint64_t vram_used = 0;
+	int i, max_batches = (count == -1) ? MAX_ALLOCATIONS : count;
+	int n_batches = 0;
+
+	igt_debug("count=%d max_batches=%d vram_per_process=%llu flags=%x\n",
+		  count, max_batches, (unsigned long long)vram_per_process, flags);
+
+	igt_assert(count > 0 || (flags & EVICT && flags & LEAK_BO));
+
+	leaks = malloc(sizeof(*leaks) * max_batches);
+	igt_assert(leaks);
+
+	vm = xe_vm_create(fd, 0, 0);
+	exec_queue =  xe_exec_queue_create(fd, vm, hwe, 0);
+
+	for (i = 0; i < count || vram_used < vram_per_process; ++i) {
+		uint64_t sizes[N_BOS_PER_BIND];
+		struct bo_alloc *bos;
+		int j;
+
+		for (j = 0; j < N_BOS_PER_BIND; ++j)
+			sizes[j] = alloc_sizes[rand_r(seed) % N_ALLOC_SIZES];
+
+		igt_assert_f(i < max_batches, "Failed to reach %llu bytes of VRAM pressure after "
+			   "%d batches (currently reached %llu bytes)\n",
+			   (unsigned long long)vram_per_process, max_batches,
+			   (unsigned long long)vram_used);
+
+		bos = test_alloc_sizes(fd, vm, exec_queue, hwe->gt_id, sizes,
+				       N_BOS_PER_BIND, flags, BO_BIND_BASE_ADDR);
+		if (bos) {
+			leaks[i] = malloc(sizeof(*leaks[i]));
+			igt_assert(leaks[i]);
+
+			leaks[i]->bos = bos;
+			leaks[i]->n_bos = N_BOS_PER_BIND;
+			n_batches++;
+
+			for (j = 0; j < N_BOS_PER_BIND; ++j)
+				vram_used += bos[j].bo_size;
+		} else {
+			leaks[i] = NULL;
+		}
+	}
+
+	if (barrier)
+		pthread_barrier_wait(barrier);
+
+	check_leak_multi_group(fd, vm, leaks, n_batches, flags);
+
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+	free(leaks);
+}
+
+struct thread_data {
+	uint64_t va_base;
+	pthread_t thread;
+	pthread_mutex_t *mutex;
+	pthread_cond_t *cond;
+	struct drm_xe_engine_class_instance *hwe;
+	int fd;
+	int count;
+	uint32_t vm;
+	uint32_t flags;
+	unsigned int seed;
+	bool *go;
+};
+
+static void *bo_alloc_thread_fn(void *data)
+{
+	struct thread_data *t = data;
+	uint32_t q;
+	int i;
+
+	igt_assert(!(t->flags & LEAK_BO));
+
+	pthread_mutex_lock(t->mutex);
+	while (!*t->go)
+		pthread_cond_wait(t->cond, t->mutex);
+	pthread_mutex_unlock(t->mutex);
+
+	q =  xe_exec_queue_create(t->fd, t->vm, t->hwe, 0);
+
+	for (i = 0; i < t->count; ++i)
+		test_alloc_size(t->fd, t->vm, q, t->hwe->gt_id,
+				alloc_sizes[rand() % N_ALLOC_SIZES],
+				t->flags, t->va_base);
+
+	xe_exec_queue_destroy(t->fd, q);
+
+	return NULL;
+}
+
+static void run_threaded_bo_alloc_test(int fd, int count, uint32_t flags)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	struct drm_xe_engine_class_instance **engines;
+	struct thread_data *threads_data;
+	pthread_mutex_t mutex;
+	pthread_cond_t cond;
+	bool begin_work = false;
+	int n_found = 0, n_threads = 0, i, ret;
+
+	xe_for_each_engine(fd, hwe)
+		n_found++;
+
+	igt_assert(n_found > 0);
+
+	engines = calloc(n_found, sizeof(*engines));
+	igt_assert(engines);
+
+	i = 0;
+	xe_for_each_engine(fd, hwe)
+		engines[i++] = hwe;
+
+	threads_data = calloc(n_found, sizeof(*threads_data));
+	igt_assert(threads_data);
+
+	pthread_mutex_init(&mutex, 0);
+	pthread_cond_init(&cond, 0);
+
+	for (i = 0; i < n_found; ++i) {
+		threads_data[i].mutex = &mutex;
+		threads_data[i].cond = &cond;
+		/* reuse engine 0 if only one exists */
+		threads_data[i].hwe = engines[i % n_found];
+		threads_data[i].fd = fd;
+		threads_data[i].count = count;
+		threads_data[i].vm = xe_vm_create(fd, 0, 0);
+		threads_data[i].flags = flags;
+		threads_data[i].go = &begin_work;
+		threads_data[i].seed = i + 1;
+		threads_data[i].va_base = BO_BIND_BASE_ADDR + (uint64_t)i * THREAD_VA_STRIDE;
+		ret = pthread_create(&threads_data[i].thread, 0, bo_alloc_thread_fn,
+				     &threads_data[i]);
+		if (ret)
+			break;
+		n_threads++;
+	}
+
+	ret = pthread_mutex_lock(&mutex);
+	igt_assert_eq(ret, 0);
+	begin_work = true;
+	ret = pthread_cond_broadcast(&cond);
+	igt_assert_eq(ret, 0);
+	ret = pthread_mutex_unlock(&mutex);
+	igt_assert_eq(ret, 0);
+
+	for (i = 0; i < n_threads; ++i) {
+		ret = pthread_join(threads_data[i].thread, NULL);
+		igt_assert_eq(ret, 0);
+	}
+
+	/* vm is created for every slot up to n_found regardless of thread creation success */
+	for (i = 0; i < n_found; ++i)
+		xe_vm_destroy(fd, threads_data[i].vm);
+
+	ret = pthread_cond_destroy(&cond);
+	igt_assert_eq(ret, 0);
+	ret = pthread_mutex_destroy(&mutex);
+	igt_assert_eq(ret, 0);
+	free(threads_data);
+	free(engines);
+}
+
+static void run_gt_dynamic_subtests(int fd, const struct test_case *t)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	uint16_t seen_gt[64];
+	int n_seen = 0, j;
+	bool dup;
+
+	if (t->requires_evict_ram) {
+		igt_require(xe_has_vram(fd));
+		igt_require(igt_get_avail_ram_mb() >=
+			    (xe_visible_vram_size(fd, 0) >> 20) / 2);
+	}
+
+	/*
+	 * These tests only care about which GT (and  therefore which VRAM region,
+	 * via gt_id -> vram_if_possible()) the BO ends up on, not which specific
+	 * engine issues the exec. So run once per distinct gt_id instead of once
+	 * per engine: on single-GT parts that's one dynamic child same as before,
+	 * and on multi-tile parts it exercises every tile's VRAM instead of silently
+	 * only ever hitting whichever GT the first engine happened to belong to
+	 */
+	xe_for_each_engine(fd, hwe) {
+		dup = false;
+
+		for (j = 0; j < n_seen; ++j) {
+			if (seen_gt[j] == hwe->gt_id) {
+				dup = true;
+				break;
+			}
+		}
+		if (dup)
+			continue;
+
+		igt_assert(n_seen < ARRAY_SIZE(seen_gt));
+		seen_gt[n_seen++] = hwe->gt_id;
+
+		igt_dynamic_f("gt%u", hwe->gt_id) {
+			switch (t->type) {
+			case TYPE_ALL_SIZES:
+				all_sizes_once(fd, hwe);
+				break;
+			case TYPE_SINGLE:
+				alloc_rand_size_bos(fd, hwe, t->count, 0, NULL, t->flags);
+				break;
+			case TYPE_ARRAY_BIND: {
+				unsigned int seed = hwe->gt_id + 1;
+
+				alloc_random_size_bos_array_bind(fd, hwe, t->count, 0, NULL,
+								 t->flags, &seed);
+				break;
+			}
+			default:
+				break;
+			}
+		}
+	}
+}
+
+/*
+ * Data-driven subtest matrix.
+ *
+ * TYPE_ALL_SIZES / TYPE_SINGLE / TYPE_ARRAY_BIND all exercise exactly one
+ * engine per invocation, so they're wired up as a dynamic child subtest
+ * per engine below (igt_subtest_with_dynamic_f() + igt_dynamic_f()).
+ *
+ * TYPE_THREAD / TYPE_PROCESS are deliberately NOT split per engine here:
+ * threads() and processes() already do their own xe_for_each_engine() to
+ * spawn one thread/process per engine internally. Wrapping those in a
+ * second, outer per-engine loop would run the full all-engine fan-out
+ * once for every engine on the machine, multiplying the runtime by the
+ * engine count and re-exercising every engine N times over. So these
+ * stay flat, single subtests.
+ */
+
+static const struct test_case test_matrix[] = {
+	{ "all-sizes-once", 0, 0, TYPE_ALL_SIZES, false },
+	{ "rand-sizes-10", 10, 0, TYPE_SINGLE, false },
+	{ "rand-sizes-100", 100, 0, TYPE_SINGLE, false },
+	{ "rand-sizes-100-unaligned", 100, UNALIGNED, TYPE_SINGLE, false },
+	{ "array-binds-rand-sizes-10", 10, ARRAY_BIND, TYPE_ARRAY_BIND, true },
+	{ "array-binds-rand-sizes-10-unaligned", 10,  ARRAY_BIND | UNALIGNED, TYPE_ARRAY_BIND,
+	  true },
+	{ "threads-rand-sizes-50", 50, 0, TYPE_THREAD, false },
+	{ "threads-rand-sizes-50-unaligned", 50, UNALIGNED, TYPE_THREAD,
+	  false },
+	{ "threads-leak-binding-rand-sizes-50", 50, LEAK_BINDING, TYPE_THREAD,
+	  false },
+	{ "threads-leak-binding-rand-sizes-50-unaligned", 50,
+	  LEAK_BINDING | UNALIGNED, TYPE_THREAD, false },
+};
+
+int igt_main()
+{
+	int fd, i;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_XE);
+		alloc_sizes_init();
+	}
+
+	for (i = 0; i < ARRAY_SIZE(test_matrix); ++i) {
+		const struct test_case *t = &test_matrix[i];
+
+		switch (t->type) {
+		case TYPE_THREAD:
+			igt_subtest_f("%s", t->name) {
+				if (t->requires_evict_ram) {
+					igt_require(xe_has_vram(fd));
+					igt_require(igt_get_avail_ram_mb() >=
+						    (xe_visible_vram_size(fd, 0) >> 20) / 2);
+				}
+
+				run_threaded_bo_alloc_test(fd, t->count, t->flags);
+			}
+			break;
+		case TYPE_ALL_SIZES:
+		case TYPE_SINGLE:
+		case TYPE_ARRAY_BIND:
+			igt_subtest_with_dynamic_f("%s", t->name)
+				run_gt_dynamic_subtests(fd, t);
+		}
+	}
+
+	igt_fixture() {
+		alloc_sizes_fini();
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 1ac89bab7..8c0db23c2 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -282,6 +282,7 @@ intel_kms_progs = [
 
 intel_xe_progs = [
 	'xe_wedged',
+        'xe_bo_alloc',
 	'xe_ccs',
 	'xe_create',
 	'xe_compute',
-- 
2.52.0

