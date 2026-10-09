Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811A0CA6019
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 10:33:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F40112047;
	Fri,  9 Oct 2026 10:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAENVPLt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381A0112048
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791541715; x=1823077715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RD3bsd+puN0krKs7rqABgoW+G7LbS3PFlX5lIT5Vv7E=;
 b=iAENVPLtbiTqTJ3v6jJR0XZJNEzsmQGL69gig8vDOWkpnY+jnq/3iuJ8
 6WRN+/rOg3bd3jMbfIJoYNWKHSjJ2/5w9Bc1yPWgv9VCyVxGgrGMFXRSx
 +LgOeooLPgDdDL+0TY0FwTpGi6MbHMCjbTXFs7j2hzDXiXMCIiPMi//KR
 FiO3JIuj6W96Uiqvk5SUxntqgrVeLZSUy/cFY5r0YYGi2fPe6MbR6Busc
 nuEcD3wZCUR1JU1+h6wd3ndOt/x7e5+makNQIc+j3mkgxtrYfQraCnqrv
 9OXBEqNoqvOwKAIBIKlDOaETsnQVKLyDhr633Hf8x8mPXsFVuBrDLMN2l A==;
X-CSE-ConnectionGUID: c3LGtTamTnuNu0E2e7soyQ==
X-CSE-MsgGUID: PniQ1fg8Rve9hoXiWuajcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="218777"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="218777"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:28:34 -0700
X-CSE-ConnectionGUID: y4wkVmDoQAuPsL8e8+lT7w==
X-CSE-MsgGUID: qftssinKRKGfnunl28STSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="621481"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by fmviesa006.fm.intel.com with ESMTP; 09 Oct 2026 03:28:34 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	matthew.brost@intel.com
Cc: nishit.sharma@intel.com,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t v6 1/5] tests/intel: Add BO allocation stress coverage
Date: Fri,  9 Oct 2026 10:28:28 +0000
Message-ID: <20261009102832.2839902-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009102832.2839902-1-sobin.thomas@intel.com>
References: <20261009102832.2839902-1-sobin.thomas@intel.com>
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

Add a new xe_bo_alloc test excercising BO allocation, VM bind, mapping
and execution across a range of BO sizes. The test runs once per GT
rather than once per engine, making sure that on multi-tile platforms
every GT/VRAM region is excercised. This stress test exercises
concurrent buffer allocation all the sizes at once.

This provide coverage for different BO allocation stress scenarios

v3: renamed the sub test functions.
v4: Addressed nits (kamil)
v6: removed overlapping Macros and structure (Priyanka)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_bo_alloc.c | 590 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 2 files changed, 591 insertions(+)
 create mode 100644 tests/intel/xe_bo_alloc.c

diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
new file mode 100644
index 000000000..9bf27813c
--- /dev/null
+++ b/tests/intel/xe_bo_alloc.c
@@ -0,0 +1,590 @@
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
+#define SZ_4K_SHIFT	12
+
+/**
+ * SUBTEST: all-sizes-once
+ * Description: Test all BO allocations sizes in test table
+ * Test category: functionality test
+ */
+
+#define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
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
+struct batch_data {
+	uint32_t batch[16];
+	uint64_t pad;
+	uint32_t data;
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
+static int test_bind(int fd, uint32_t vm, struct bo_alloc *bos, int n_bos, uint32_t flags)
+{
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
+			default:
+				break;
+
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
+		case TYPE_ALL_SIZES:
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
index eb9634891..82305afa6 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -283,6 +283,7 @@ intel_kms_progs = [
 
 intel_xe_progs = [
 	'xe_wedged',
+	'xe_bo_alloc',
 	'xe_ccs',
 	'xe_create',
 	'xe_compute',
-- 
2.55.0

