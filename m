Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E271EC5AC7A
	for <igt-dev@archiver.kernel.org>; Fri,  7 Aug 2026 09:13:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CE910E3FF;
	Fri,  7 Aug 2026 09:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LMkaM5Bu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B576510E3FF
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Aug 2026 09:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786093955; x=1817629955;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JBEmsXHzcOjjVrdcYf0uFBca3XpiXqYOcE4i/ROx02Y=;
 b=LMkaM5BuQs84sRg4v4uQPEULW25D0QhOkg3HGZppt0SNQ3S97hiaWiff
 DlCekLG89fmXWmjjwNrkvYubLlXP2N9pk+ibjN6O1g0/aIORmD7sfWb/4
 zU3FF4TYVZFHVZWMIqrvNEJg3DbMeL7Fep7DkAbAgNnbWQglrhEnSDcTx
 fXg0Bito6kNIK+Kw9sgZfVCzglSjH/BvzL6wLTH2NqjA+IjqBXxs0BcmP
 +xawYDcmV9qP3jwIxagnoXrc366YLTd9fzaTnCCXrMAYCiKbuNnslE4ro
 0UIhuUa1At4NCy+/9LLOfHr6B8VY49ZKm/w9sxrG040/Wxq9ofZl+6gjc A==;
X-CSE-ConnectionGUID: JgC60vnkRICMDVnCqRRZfA==
X-CSE-MsgGUID: jVsai/6eS9CdgwnVeS3m1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="98211228"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="98211228"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 02:12:32 -0700
X-CSE-ConnectionGUID: F4D9BMuvRn21DxGWKgpGtg==
X-CSE-MsgGUID: g6QIqEZcQYKREXCvFy6FMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="259020681"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by fmviesa007.fm.intel.com with ESMTP; 07 Aug 2026 02:12:07 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	matthew.brost@intel.com
Cc: nishit.sharma@intel.com
Subject: [PATCH i-g-t v1] tests/intel: add BO allocation oversubscription
 stress coverage
Date: Fri,  7 Aug 2026 09:12:07 +0000
Message-ID: <20260807091207.530104-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
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

Add a BO allocation stress test that exercises concurrent
buffer allocation, VM binding, and execution while oversubscribing
VRAM.

The test runs multiple processes in parallel, forcing memory
pressure, verifies execution and validate result after execution.
This provide coverage for oversubscription, eviction and migration
scenarios on platforms that supports them.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_bo_alloc.c | 1418 +++++++++++++++++++++++++++++++++++++
 tests/meson.build         |    1 +
 2 files changed, 1419 insertions(+)
 create mode 100644 tests/intel/xe_bo_alloc.c

diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
new file mode 100644
index 000000000..2246dc587
--- /dev/null
+++ b/tests/intel/xe_bo_alloc.c
@@ -0,0 +1,1418 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
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
+#include <fcntl.h>
+#include <errno.h>
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
+#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
+#define SZ_4K_SHIFT	12
+#define BO_BIND_BASE_ADDR	0x1a0000ull
+#define THREAD_VA_STRIDE GB(1)
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
+ * Description: Test 10 random BO allocation sizes bound together as a single array of binds
+ * Test category: functionality test
+ *
+ * SUBTEST: array-binds-rand-sizes-10-unaligned
+ * Description: Test 10 random BO allocation sizes bound together as a single array of binds,
+ * unaligned bind addresses
+ * Test category: functionality test
+ *
+ * SUBTEST: threads-rand-sizes-50
+ * Description: test 50 random bo allocation sizes in test table with a thread per engine
+ * test category: stress test
+ *
+ * SUBTEST: threads-rand-sizes-50-unaligned
+ * Description: test 50 random bo allocation sizes in test table with a thread per engine,
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
+ *
+ * SUBTEST: test_vm_oversubscribe_concurrent_bind
+ * Description: Test enough random BO allocation sizes, bound as arrays of binds, to trigger
+ * evictions with 2 processes per engine, leak the BO munmap / gem close, unaligned bind addresses
+ * Test category: stress test
+ */
+
+#define SZ_4K_SHIFT	12
+#define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
+#define MIN_BUFS_PER_PROC 2
+#define MAX_PROCS 20
+#define MAX_SRAM_TEST_SIZE GB(32)
+#define TIMEOUT_NS (30ULL * 1000000000ULL)
+#define INT_ADD_CNT 4
+#define GPR_RX_ADDR(x)		(0x600 + (x) * 8)
+
+#define N_ALLOC_SIZES	256
+static uint64_t *alloc_sizes;
+
+struct gem_bo {
+	uint32_t handle;
+	uint64_t size;
+	uint32_t *ptr;
+	uint64_t addr;
+};
+
+struct xe_oversubscribe_ctx {
+	uint32_t vm_id;
+	uint32_t exec_queue_id;
+};
+
+struct mem_bind_sync {
+	struct gem_bo *bufs;
+	int n_bufs;
+	uint64_t *binds_ufence;
+};
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
+	TYPE_OVERSUBSCRIBE,
+};
+
+struct test_case {
+	const char *name;
+	int count; /* -1 means "until vram_per_process is hit" */
+	uint32_t flags;
+	enum test_type type;
+	bool array_binds;
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
+static void bo_alloc_reserve_va(struct bo_alloc *b, uint32_t flags)
+{
+	uint64_t align = (flags & UNALIGNED) ? SZ_64K : b->bo_size;
+	size_t reserve_size = b->bo_size + align;
+	uintptr_t addr;
+	uintptr_t aligned_addr;
+	void *reserve;
+
+	reserve = mmap(NULL, reserve_size, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	igt_assert(reserve != MAP_FAILED);
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
+static void create_exec_queue(int fd, struct xe_oversubscribe_ctx *ctx)
+{
+	ctx->exec_queue_id = xe_exec_queue_create(fd, ctx->vm_id,
+						  &xe_engine(fd, 0)->instance, 0);
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
+static uint64_t *
+vm_bind_bo_batch(int fd, struct xe_oversubscribe_ctx *ctx, struct gem_bo *bos, int size,
+		 int *out_err)
+{
+	uint64_t *ufence;
+	struct drm_xe_sync bind_sync;
+	struct drm_xe_vm_bind_op *binds;
+	int i;
+
+	binds = calloc(size, sizeof(*binds));
+	igt_assert(binds);
+
+	ufence = calloc(1, sizeof(*ufence));
+	igt_assert(ufence);
+	bind_sync = (struct drm_xe_sync) {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.addr = to_user_pointer(ufence),
+		.timeline_value = 1,
+	};
+
+	for (i = 0; i < size; i++) {
+		binds[i] = (struct drm_xe_vm_bind_op) {
+			.obj = bos[i].handle,
+			.obj_offset = 0,
+			.range = bos[i].size,
+			.addr = bos[i].addr,
+			.op = DRM_XE_VM_BIND_OP_MAP,
+			.flags = 0,
+		};
+	}
+	*out_err = __xe_vm_bind_array(fd, ctx->vm_id, binds, size, &bind_sync, 1);
+	free(binds);
+	return ufence;
+}
+
+static int build_add_batch(struct gem_bo *batch_bo, struct gem_bo *integers_bo,
+			   struct gem_bo *result_bo, int ints_to_add)
+{
+	int pos = 0;
+	int i;
+	uint64_t tmp_addr;
+
+	batch_bo->ptr[pos++] = MI_LOAD_REGISTER_MEM_CMD | MI_LRI_LRM_CS_MMIO | 2;
+	batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
+	tmp_addr = integers_bo->addr + 0 * sizeof(uint32_t);
+	batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
+	batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
+	for (i = 1; i < ints_to_add; i++) {
+		/* r1 = integers_bo[i] */
+		batch_bo->ptr[pos++] = MI_LOAD_REGISTER_MEM_CMD | MI_LRI_LRM_CS_MMIO | 2;
+		batch_bo->ptr[pos++] = GPR_RX_ADDR(1);
+		tmp_addr = integers_bo->addr + i * sizeof(uint32_t);
+		batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
+		batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
+		/* r0 = r0 + r1 */
+		batch_bo->ptr[pos++] = MI_MATH(4);
+		batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(0));
+		batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(1));
+		batch_bo->ptr[pos++] = MI_MATH_ADD;
+		batch_bo->ptr[pos++] = MI_MATH_STORE(MI_MATH_REG(0), MI_MATH_REG_ACCU);
+	}
+	/* result_bo[0] = r0 */
+	batch_bo->ptr[pos++] = MI_STORE_REGISTER_MEM_GEN8 | MI_LRI_LRM_CS_MMIO;
+	batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
+	tmp_addr = result_bo->addr + 0 * sizeof(uint32_t);
+	batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
+	batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
+
+	batch_bo->ptr[pos++] = MI_BATCH_BUFFER_END;
+	while (pos % 4 != 0)
+		batch_bo->ptr[pos++] = MI_NOOP;
+	return pos;
+}
+
+static int create_test_bos(int fd, struct xe_oversubscribe_ctx *ctx,
+			   struct mem_bind_sync *bind, uint32_t placement,
+			   uint64_t *addr)
+{
+	const char *mem_type = (placement & vram_memory(fd, 0)) ? "VRAM" : "SRAM";
+	int ret;
+
+	for (int i = 0; i < bind->n_bufs; i++) {
+		struct gem_bo *bo = &bind->bufs[i];
+
+		bo->size = GB(1);
+		ret = __xe_bo_create_caching(fd, ctx->vm_id, bo->size, placement, 0,
+					     DRM_XE_GEM_CPU_CACHING_WC, &bo->handle);
+		if (ret) {
+			int saved_errno = errno; /* capture before anything can clobber it */
+
+			bind->n_bufs = i;
+			if (saved_errno == ENOMEM || saved_errno == ENOSPC) {
+				/* Continue on OOM, expected when oversubscribing the VM */
+				igt_debug("%s allocation failed at buffer %d (OOM)\n", mem_type, i);
+				break;
+			}
+			/* We are returning as this is a fail scenario */
+			igt_warn("%s allocation failed at buffer %d: %s\n",
+				 mem_type, i, strerror(saved_errno));
+			return -saved_errno;
+		}
+		bo->ptr = NULL;
+		bo->addr = *addr;
+		*addr += bo->size;
+		igt_debug("%s buffer %d created at 0x%016lx\n", mem_type, i, bo->addr);
+	}
+	return 0;
+}
+
+static int fill_random_integers(struct gem_bo *int_bo, int ints_to_add)
+{
+	uint32_t expected_result = 0;
+	char expr[256];
+	int len = 0;
+
+	for (int i = 0; i < ints_to_add; i++) {
+		uint32_t random_int = rand() % 8;
+
+		int_bo->ptr[i] = random_int;
+		expected_result += random_int;
+
+		len += snprintf(expr + len, sizeof(expr) - len, "%s%u",
+				i ? " + " : "", random_int);
+	}
+	igt_debug("%s = %u\n", expr, expected_result);
+	return expected_result;
+}
+
+static void cleanup_bo_resources(int fd, struct gem_bo *bo)
+{
+	if (bo->ptr) {
+		igt_assert_eq(munmap(bo->ptr, bo->size), 0);
+		bo->ptr = NULL;
+	}
+	if (bo->handle)
+		gem_close(fd, bo->handle);
+}
+
+static void cleanup_sram_vram_objs(int fd, struct mem_bind_sync *vram_bind,
+				   struct mem_bind_sync *sram_bind)
+{
+	for (int i = 0; i < vram_bind->n_bufs; i++)
+		gem_close(fd, vram_bind->bufs[i].handle);
+	for (int i = 0; i < sram_bind->n_bufs; i++)
+		gem_close(fd, sram_bind->bufs[i].handle);
+	free(vram_bind->bufs);
+	free(sram_bind->bufs);
+	if (vram_bind->binds_ufence)
+		free(vram_bind->binds_ufence);
+	if (sram_bind->binds_ufence)
+		free(sram_bind->binds_ufence);
+}
+
+struct process_data {
+	pthread_mutex_t mutex;
+	pthread_cond_t cond;
+	pthread_barrier_t barrier;
+	bool go;
+};
+
+static void init_pdata(struct process_data *pdata)
+{
+	pthread_mutexattr_t mattr;
+	pthread_condattr_t cattr;
+
+	pthread_mutexattr_init(&mattr);
+	pthread_mutexattr_setpshared(&mattr, PTHREAD_PROCESS_SHARED);
+	pthread_mutex_init(&pdata->mutex, &mattr);
+	pthread_mutexattr_destroy(&mattr);
+
+	pthread_condattr_init(&cattr);
+	pthread_condattr_setpshared(&cattr, PTHREAD_PROCESS_SHARED);
+	pthread_cond_init(&pdata->cond, &cattr);
+	pthread_condattr_destroy(&cattr);
+
+	pdata->go = false;
+}
+
+static void wait_pdata(struct process_data *pdata)
+{
+	pthread_mutex_lock(&pdata->mutex);
+	while (!pdata->go)
+		pthread_cond_wait(&pdata->cond, &pdata->mutex);
+	pthread_mutex_unlock(&pdata->mutex);
+}
+
+static void signal_pdata(struct process_data *pdata)
+{
+	pthread_mutex_lock(&pdata->mutex);
+	pdata->go = true;
+	pthread_cond_broadcast(&pdata->cond);
+	pthread_mutex_unlock(&pdata->mutex);
+}
+
+static void test_vm_oversubscribe_concurrent_bind(int fd)
+{
+	int n_proc = 0, n_vram_bufs = 0, n_sram_bufs = 0;
+	uint64_t max_by_mem;
+	uint64_t total_vram_demand = 0;
+	uint64_t vram_size = xe_visible_available_vram_size(fd, 0);
+	uint64_t sram_avail = (uint64_t)igt_get_avail_ram_mb() << 20;
+	uint64_t target_vram = vram_size * 2;
+	uint64_t target_sram, total_vram_bufs, total_sram_bufs;
+	struct process_data *pdata;
+
+	/*
+	 * Dynamically cap VRAM oversubscription so the overflow into system
+	 * RAM stays within 25% of available RAM. On small-VRAM platforms
+	 * (e.g. BMG) the 2x target fits within the cap and behavior is
+	 * unchanged; on large-VRAM platforms (e.g. PVC) this prevents OOM.
+	 */
+	target_vram = min(target_vram, vram_size + sram_avail / 4);
+	target_sram = min_t(uint64_t, sram_avail * 50 / 100,
+			    MAX_SRAM_TEST_SIZE);
+
+	total_vram_bufs = target_vram / GB(1);
+	total_sram_bufs = target_sram / GB(1);
+
+	/* determine concurrency from memory pressure */
+
+	max_by_mem = min(total_vram_bufs / MIN_BUFS_PER_PROC,
+			 total_sram_bufs / MIN_BUFS_PER_PROC);
+	n_proc = min_t(int, max_by_mem, MAX_PROCS);
+	igt_require_f(n_proc > 0, "Not enough VRAM/RAM for oversubscription test\n");
+
+	n_vram_bufs = max_t(int, 2, total_vram_bufs / n_proc);
+	n_sram_bufs = max_t(int, 2, total_sram_bufs / n_proc);
+	total_vram_demand = (uint64_t)n_proc * n_vram_bufs * GB(1);
+
+	igt_debug("VRAM size: %" PRIu64 "MB, System RAM available: %" PRIu64 "MB\n",
+		  vram_size >> 20, sram_avail >> 20);
+
+	igt_debug("n_proc = %d\n", n_proc);
+	igt_debug("VRAM: %" PRIu64 "GB\n", vram_size >> 30);
+	igt_debug("VRAM demand: %" PRIu64 "MB (%.2fx oversubscription)\n",
+		  total_vram_demand >> 20, (double)total_vram_demand / vram_size);
+	igt_debug("Processes=%d VRAM_bufs=%d SRAM_bufs=%d\n", n_proc,
+		  n_vram_bufs, n_sram_bufs);
+
+	pdata = mmap(NULL, sizeof(*pdata), PROT_READ | PROT_WRITE,
+		     MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(pdata != MAP_FAILED);
+	init_pdata(pdata);
+
+	igt_fork(child, n_proc) {
+		struct xe_oversubscribe_ctx ctx = {0};
+		int rc, ret;
+		uint64_t addr = 0x40000000;
+		uint32_t expected_result = 0;
+		struct gem_bo integers_bo = {0}, result_bo = {0}, batch_bo = {0};
+		struct gem_bo *vram_bufs, *sram_bufs;
+		int pos = 0;
+		struct mem_bind_sync vram_bind = {0};
+		struct mem_bind_sync sram_bind = {0};
+		struct drm_xe_sync batch_syncs[1];
+		struct drm_xe_exec exec;
+		struct gem_bo ufence_bo = {0};
+		int vram_bind_err = 0, sram_bind_err = 0;
+
+		vram_bufs = calloc(n_vram_bufs, sizeof(*vram_bufs));
+		sram_bufs = calloc(n_sram_bufs, sizeof(*sram_bufs));
+		srand(child);
+
+		igt_assert(vram_bufs && sram_bufs);
+
+		ctx.vm_id = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
+		create_exec_queue(fd, &ctx);
+		vram_bind.bufs = vram_bufs;
+		vram_bind.n_bufs = n_vram_bufs;
+		sram_bind.bufs = sram_bufs;
+		sram_bind.n_bufs = n_sram_bufs;
+
+		ret = create_test_bos(fd, &ctx, &vram_bind, vram_memory(fd, 0), &addr);
+		if (ret)
+			goto cleanup;
+
+		ret = create_test_bos(fd, &ctx, &sram_bind, system_memory(fd), &addr);
+		if (ret)
+			goto cleanup;
+
+		wait_pdata(pdata);
+
+		if (!vram_bind.n_bufs || !sram_bind.n_bufs) {
+			igt_debug("No BOs allocated; VRAM/SRAM unavailable, skipping\n");
+			goto cleanup;
+		}
+
+		if (vram_bind.n_bufs) {
+			vram_bind.binds_ufence =
+				vm_bind_bo_batch(fd, &ctx, vram_bufs,
+						 vram_bind.n_bufs, &vram_bind_err);
+			if (vram_bind_err) {
+				igt_assert_f(vram_bind_err == -ENOMEM || vram_bind_err == -ENOSPC,
+					     "Unexpected VRAM bind error: %d (%s)\n",
+					     vram_bind_err, strerror(-vram_bind_err));
+				igt_debug("VRAM bind failed with expected OOM (%s), skipping exec\n",
+					  strerror(-vram_bind_err));
+				goto cleanup;
+			}
+			xe_wait_ufence(fd, vram_bind.binds_ufence, 1, 0, TIMEOUT_NS);
+		}
+
+		if (sram_bind.n_bufs) {
+			sram_bind.binds_ufence =
+				vm_bind_bo_batch(fd, &ctx, sram_bufs,
+						 sram_bind.n_bufs, &sram_bind_err);
+			/* Assert if there is any bind error in SRAM */
+			if (sram_bind_err)
+				igt_assert_f(0, "Unexpected SRAM bind error: %d", sram_bind_err);
+			xe_wait_ufence(fd, sram_bind.binds_ufence, 1, 0, TIMEOUT_NS);
+	}
+
+		integers_bo.size = ALIGN(sizeof(int) * INT_ADD_CNT, 4096);
+		integers_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, integers_bo.size,
+							  system_memory(fd), 0,
+							  DRM_XE_GEM_CPU_CACHING_WC);
+		integers_bo.ptr = xe_bo_map(fd, integers_bo.handle, integers_bo.size);
+		integers_bo.addr = 0x100000;
+
+		expected_result = fill_random_integers(&integers_bo, INT_ADD_CNT);
+		igt_debug("%d\n", expected_result);
+
+		result_bo.size = ALIGN(sizeof(int), 4096);
+		result_bo.handle  = xe_bo_create_caching(fd, ctx.vm_id, result_bo.size,
+							 system_memory(fd), 0,
+							 DRM_XE_GEM_CPU_CACHING_WC);
+		result_bo.ptr = NULL;
+		result_bo.addr = 0x200000;
+
+		batch_bo.size = 4096;
+		batch_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, batch_bo.size,
+						       system_memory(fd), 0,
+						       DRM_XE_GEM_CPU_CACHING_WC);
+
+		batch_bo.ptr = xe_bo_map(fd, batch_bo.handle, batch_bo.size);
+		batch_bo.addr = 0x300000;
+
+		pos = build_add_batch(&batch_bo, &integers_bo, &result_bo, INT_ADD_CNT);
+
+		igt_assert(pos * sizeof(int) <= batch_bo.size);
+
+		xe_vm_bind_lr_sync(fd, ctx.vm_id, integers_bo.handle, 0, integers_bo.addr,
+				   integers_bo.size, 0);
+		xe_vm_bind_lr_sync(fd, ctx.vm_id, result_bo.handle, 0, result_bo.addr,
+				   result_bo.size, 0);
+		xe_vm_bind_lr_sync(fd, ctx.vm_id, batch_bo.handle, 0, batch_bo.addr,
+				   batch_bo.size, 0);
+
+		ufence_bo.size = 4096;
+		ufence_bo.handle = xe_bo_create_caching(fd, ctx.vm_id, ufence_bo.size,
+							system_memory(fd), 0,
+							DRM_XE_GEM_CPU_CACHING_WC);
+		ufence_bo.ptr = xe_bo_map(fd, ufence_bo.handle, ufence_bo.size);
+		ufence_bo.addr = 0x400000;
+		memset(ufence_bo.ptr, 0, ufence_bo.size);
+		xe_vm_bind_lr_sync(fd, ctx.vm_id, ufence_bo.handle, 0, ufence_bo.addr,
+				   ufence_bo.size, 0);
+
+		batch_syncs[0] = (struct drm_xe_sync){
+			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+			.addr = ufence_bo.addr,
+			.timeline_value = USER_FENCE_VALUE,
+		};
+
+		exec = (struct drm_xe_exec) {
+			.exec_queue_id = ctx.exec_queue_id,
+			.num_syncs = 1,
+			.syncs = (uintptr_t)batch_syncs,
+			.address = batch_bo.addr,
+			.num_batch_buffer = 1,
+		};
+
+		rc = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
+		igt_assert_f(rc == 0, "xe_exec failed unexpectedly: %s (%d)\n",
+			     strerror(errno), errno);
+		xe_wait_ufence(fd, (uint64_t *)ufence_bo.ptr, USER_FENCE_VALUE, ctx.exec_queue_id,
+			       TIMEOUT_NS);
+		result_bo.ptr = xe_bo_map(fd, result_bo.handle, result_bo.size);
+		igt_assert(result_bo.ptr != MAP_FAILED);
+		igt_assert_eq(result_bo.ptr[0], expected_result);
+cleanup:
+		cleanup_bo_resources(fd, &ufence_bo);
+		cleanup_bo_resources(fd, &result_bo);
+		cleanup_bo_resources(fd, &batch_bo);
+		cleanup_bo_resources(fd, &integers_bo);
+		cleanup_sram_vram_objs(fd, &vram_bind, &sram_bind);
+		xe_exec_queue_destroy(fd, ctx.exec_queue_id);
+		xe_vm_destroy(fd, ctx.vm_id);
+	}
+
+	signal_pdata(pdata);
+	igt_waitchildren();
+	igt_reset_timeout();
+
+	pthread_cond_destroy(&pdata->cond);
+	pthread_mutex_destroy(&pdata->mutex);
+	igt_assert_eq(munmap(pdata, sizeof(*pdata)), 0);
+}
+
+static void alloc_sizes_init(void)
+{
+	int i;
+
+	alloc_sizes = malloc(sizeof(*alloc_sizes) * N_ALLOC_SIZES);
+
+	/* For now just do incremnts of 64k */
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
+static void test_prepare(int fd, uint32_t vm, struct bo_alloc *bos,  int n_bos, uint16_t gt_id,
+			 uint32_t flags, uint64_t start_va)
+{
+	uint64_t alignment = xe_get_default_alignment(fd);
+	uint64_t addr = ALIGN(start_va, alignment);
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
+		bo_alloc_reserve_va(&bos[i], flags);
+		bos[i].map = NULL;
+
+		bos[i].bo = xe_bo_create(fd, vm,
+					 bos[i].bo_size,
+					 vram_if_possible(fd, gt_id),
+					 create_flags);
+
+		igt_assert_f(bos[i].bo,
+			     "Failed to create BO[%d]: gt=%u size=%#llx gpu_va=%#llx\n",
+			     i, gt_id,
+			     (unsigned long long)bos[i].bo_size,
+			     (unsigned long long)bos[i].gpu_va);
+
+		addr = ALIGN(addr + bos[i].bo_size, alignment);
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
+	int i, ret;
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
+			igt_debug("VRAM exhausted");
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
+		if (errno == ENOMEM || errno == ENOSPC) {
+			syncobj_destroy(fd, sync.handle);
+			free(bind_ops);
+			return -errno;
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
+static void test_execute(int fd, uint32_t exec_queue,
+			 struct bo_alloc *bos, int n_bos)
+{
+	int i;
+
+	test_map_bos(fd, bos, n_bos);
+
+	for (i = 0; i < n_bos; i++)
+		execute_bo(fd, exec_queue, &bos[i]);
+}
+
+static void test_free(int fd, struct bo_alloc *b)
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
+ * eventually pass to check_leaks()/free()); otherwise they're torn down
+ * immediately and NULL is returned.
+ */
+static struct bo_alloc *test_alloc_sizes(int fd, uint32_t vm, uint32_t q,
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
+	test_prepare(fd, vm, bos, n_bos, gt_id, flags, va_base);
+	ret = test_bind(fd, vm, bos, n_bos, flags);
+	if (ret == -ENOMEM || ret == -ENOSPC)
+		goto cleanup;
+
+	igt_assert_eq(ret, 0);
+	test_execute(fd, q, bos, n_bos);
+
+	if (!(flags & LEAK_BINDING))
+		test_unbind(fd, vm, bos, n_bos);
+
+cleanup:
+
+	if (ret || !(flags & LEAK_BO)) {
+		for (i = 0; i < n_bos; ++i)
+			test_free(fd, &bos[i]);
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
+static void check_leak(int fd, uint32_t vm, struct bo_alloc *leak,
+		       uint32_t flags)
+{
+	check_exec_data(leak->map, leak->bo_size >> SZ_4K_SHIFT);
+
+	/* Migrate buffer back into VRAM, recheck */
+	if (flags & EVICT) {
+		igt_assert_eq(test_bind(fd, vm, leak, 1, flags), 0);
+
+		check_exec_data(leak->map, leak->bo_size >> SZ_4K_SHIFT);
+
+		test_unbind(fd, vm, leak, 1);
+	}
+
+	test_free(fd, leak);
+}
+
+static void check_leaks(int fd, uint32_t vm, struct bo_alloc **leaks,
+			int count, uint32_t flags)
+{
+	int i;
+
+	for (i = 0; i < count; ++i) {
+		if (!leaks[i])
+			continue;
+
+		check_leak(fd, vm, leaks[i], flags);
+		free(leaks[i]);
+	}
+}
+
+static void rand_sizes(int fd, struct drm_xe_engine_class_instance *hwe,
+		       int count, uint64_t vram_per_process,
+		       pthread_barrier_t *barrier, uint32_t flags)
+{
+	struct bo_alloc **leaks = NULL;
+	uint32_t vm, q, bo_size;
+	uint64_t vram_used = 0;
+	int i, alloc = (count == -1) ? 50000 : count;
+
+	igt_assert(count > 0 || (flags & EVICT && flags & LEAK_BO));
+	leaks = malloc(sizeof(*leaks) * alloc);
+	igt_assert(leaks);
+
+	vm = xe_vm_create(fd, 0, 0);
+	q =  xe_exec_queue_create(fd, vm, hwe, 0);
+
+	for (i = 0; i < count || vram_used < vram_per_process; ++i) {
+		bo_size = alloc_sizes[rand() % N_ALLOC_SIZES];
+
+		igt_assert(i < alloc);
+		leaks[i] = test_alloc_size(fd, vm, q, hwe->gt_id, bo_size, flags,
+					   BO_BIND_BASE_ADDR);
+		if (leaks[i])
+			vram_used += leaks[i]->bo_size;
+	}
+
+	if (barrier)
+		pthread_barrier_wait(barrier);
+	check_leaks(fd, vm, leaks, i, flags);
+
+	xe_exec_queue_destroy(fd, q);
+	xe_vm_destroy(fd, vm);
+	free(leaks);
+}
+
+/*
+ * Same idea as rand_sizes(), but each iteration binds N_BOS_PER_BIND BOs
+ * together via a single array-of-binds call instead of one at a time.
+ * Used by the array-binds-* subtests, in particular the eviction stress
+ * test where several BOs need to be resident (or evicted) as a unit.
+ */
+#define N_BOS_PER_BIND	10
+
+static void rand_sizes_array_binds(int fd,
+				   struct drm_xe_engine_class_instance *hwe,
+				   int count, uint64_t vram_per_process,
+				   pthread_barrier_t *barrier, uint32_t flags)
+{
+	struct bo_alloc **leaks = NULL;
+	uint32_t vm, q;
+	uint64_t vram_used = 0;
+	int i, n_leaks, alloc = (count == -1) ? 50000 : count;
+
+	igt_debug("count=%d alloc=%d vram_per_process=%llu flags=%x\n",
+		  count, alloc, (unsigned long long)vram_per_process, flags);
+
+	igt_assert(count > 0 || (flags & EVICT && flags & LEAK_BO));
+
+	leaks = malloc(sizeof(*leaks) * alloc);
+	igt_assert(leaks);
+
+	vm = xe_vm_create(fd, 0, 0);
+	q =  xe_exec_queue_create(fd, vm, hwe, 0);
+
+	for (i = 0; i < count || vram_used < vram_per_process; ++i) {
+		uint64_t sizes[N_BOS_PER_BIND];
+		struct bo_alloc *bos;
+		int j;
+
+		for (j = 0; j < N_BOS_PER_BIND; ++j)
+			sizes[j] = alloc_sizes[rand() % N_ALLOC_SIZES];
+
+		igt_assert(i < alloc);
+		bos = test_alloc_sizes(fd, vm, q, hwe->gt_id, sizes,
+				       N_BOS_PER_BIND, flags, BO_BIND_BASE_ADDR);
+		if (bos) {
+			for (j = 0; j < N_BOS_PER_BIND; ++j)
+				vram_used += bos[j].bo_size;
+		}
+		leaks[i] = bos ? (struct bo_alloc *)bos : NULL;
+	}
+
+	if (barrier)
+		pthread_barrier_wait(barrier);
+
+	/* Each surviving leaks[i] here is really an array of N_BOS_PER_BIND
+	 * struct bo_alloc, so walk and free them accordingly rather than
+	 * going through check_leaks(), which assumes one BO per entry.
+	 * n_leaks is the final value of i from the fill loop above, i.e.
+	 * how many entries were actually populated.
+	 */
+	n_leaks = i;
+
+	for (i = 0; i < n_leaks; ++i) {
+		int j;
+
+		if (!leaks[i])
+			continue;
+
+		for (j = 0; j < N_BOS_PER_BIND; ++j)
+			check_leak(fd, vm, &leaks[i][j], flags);
+		free(leaks[i]);
+	}
+
+	xe_exec_queue_destroy(fd, q);
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
+	int n_found = 0, i;
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
+		threads_data[i].va_base = BO_BIND_BASE_ADDR + (uint64_t)i * THREAD_VA_STRIDE;
+		pthread_create(&threads_data[i].thread, 0, bo_alloc_thread_fn, &threads_data[i]);
+	}
+
+	pthread_mutex_lock(&mutex);
+	begin_work = true;
+	pthread_cond_broadcast(&cond);
+	pthread_mutex_unlock(&mutex);
+
+	for (i = 0; i < n_found; ++i) {
+		pthread_join(threads_data[i].thread, NULL);
+		xe_vm_destroy(fd, threads_data[i].vm);
+	}
+
+	free(threads_data);
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
+				rand_sizes(fd, hwe, t->count, 0, NULL, t->flags);
+				break;
+			case TYPE_ARRAY_BIND:
+				igt_info("\n Running array bind test");
+				rand_sizes_array_binds(fd, hwe, t->count, 0, NULL,
+						       t->flags);
+				break;
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
+	{ "all-sizes-once", 0, 0, TYPE_ALL_SIZES, false, false },
+	{ "rand-sizes-10", 10, 0, TYPE_SINGLE, false, false },
+	{ "rand-sizes-100", 100, 0, TYPE_SINGLE, false, false },
+	{ "rand-sizes-100-unaligned", 100, UNALIGNED, TYPE_SINGLE, false, false },
+	{ "array-binds-rand-sizes-10", 10, ARRAY_BIND, TYPE_ARRAY_BIND, true, false },
+	{ "array-binds-rand-sizes-10-unaligned", 10,  ARRAY_BIND | UNALIGNED, TYPE_ARRAY_BIND,
+	  true, false },
+	{ "threads-rand-sizes-50", 50, 0, TYPE_THREAD, false, false },
+	{ "threads-rand-sizes-50-unaligned", 50, UNALIGNED, TYPE_THREAD,
+	  false, false },
+	{ "threads-leak-binding-rand-sizes-50", 50, LEAK_BINDING, TYPE_THREAD,
+	  false, false },
+	{ "threads-leak-binding-rand-sizes-50-unaligned", 50,
+	  LEAK_BINDING | UNALIGNED, TYPE_THREAD, false, false },
+	{ "test_vm_oversubscribe_concurrent_bind", 0, 0,
+	  TYPE_OVERSUBSCRIBE, false, false },
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
+		case TYPE_OVERSUBSCRIBE:
+			igt_subtest_f("%s", t->name)
+				test_vm_oversubscribe_concurrent_bind(fd);
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
index 9c266569d..b9c174f29 100644
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

