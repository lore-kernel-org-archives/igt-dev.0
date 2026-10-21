Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67475606A319
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 17:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z0bHbKrp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC4510E353;
	Wed, 21 Oct 2026 17:45:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BF210E344
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 17:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792604442; x=1824140442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z9/kevoIEK+gqmdavybEYIHSBFneKRzliP9gl8MTv1Q=;
 b=Z0bHbKrp3QreLiGOFwLhjlcfNFU8fjezStYS/jmw8/nQj89RQsZtYB0z
 E5et2tYNE/R44v+lVmNAewAFeaO+NQIDmmpIDRaIDFgKA28qu2llLPzEq
 czZFiHFYV7dbaYDeUtnPlbc+EHL6hYJCHNM4oejSXKZSTTygTsWEN76QW
 KL8vX3bl0323ZFc6VpME2m61aN0PumrHGAOaFK/sSb/bYaju8cTUMQ7oP
 Up5LeOPUu/NaD+bISY4SpxY3seU9LHWleJpWpSht2iVYbUfUOx8+UJPH5
 SkgV9eFHrKW9WjflAvK3e0308oUiTG7bEmSXME046ryRO+jqvosiM6Z5A w==;
X-CSE-ConnectionGUID: zGFH/Ks2RHmYPqz3+o2Q4w==
X-CSE-MsgGUID: fpk8Zdp9RE2ThZgGXAOGUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1346947"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1346947"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 10:40:42 -0700
X-CSE-ConnectionGUID: mp00tPKtQMiMNSGDgmku+Q==
X-CSE-MsgGUID: asPylk1oSL+SkdfRLgYDaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="4942644"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 10:40:41 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Cc: priyanka.dandamudi@intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v7 1/5] tests/intel: Add BO allocation stress coverage
Date: Wed, 21 Oct 2026 17:40:27 +0000
Message-ID: <20261021174032.18337-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021174032.18337-1-sobin.thomas@intel.com>
References: <20261021174032.18337-1-sobin.thomas@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a new xe_bo_alloc test excercising BO allocation, VM bind, mapping
and execution across a range of BO sizes. The test runs once per GT
rather than once per engine, making sure that on multi-tile platforms
every GT/VRAM region is excercised. This stress test exercises
concurrent buffer allocation all the sizes at once.

This provide coverage for different BO allocation stress scenarios

v3: renamed the sub test functions.
v4: Addressed nits (kamil)
v6: removed overlapping Macros and structure (Priyanka)
v7: optimized redundant cases.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_bo_alloc.c | 563 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 2 files changed, 564 insertions(+)
 create mode 100644 tests/intel/xe_bo_alloc.c

diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
new file mode 100644
index 000000000..38d581d18
--- /dev/null
+++ b/tests/intel/xe_bo_alloc.c
@@ -0,0 +1,563 @@
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
+#define N_ALLOC_SIZES	256
+static uint64_t *alloc_sizes;
+
+/*
+ * Data-driven subtest matrix.
+ *
+ * Selects the test body run per GT for a test matrix entry.
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
+#define UNALIGNED		(0x1 << 3)
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
+	return test_bind_individual(fd, vm, bos, n_bos);
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
+				igt_assert_f(0, "Unhandled test type %d\n", t->type);
+
+			}
+		}
+	}
+}
+
+/*
+ * Data-driven subtest matrix.
+ *
+ * Each entry becomes a subtest with one dynamic child per GT.
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
+		igt_subtest_with_dynamic_f("%s", t->name)
+			run_gt_dynamic_subtests(fd, t);
+	}
+
+	igt_fixture() {
+		alloc_sizes_fini();
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 519a9e727..85fa27325 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -284,6 +284,7 @@ intel_kms_progs = [
 
 intel_xe_progs = [
 	'xe_wedged',
+	'xe_bo_alloc',
 	'xe_ccs',
 	'xe_create',
 	'xe_compute',
-- 
2.55.0

