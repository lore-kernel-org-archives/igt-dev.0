Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1A5C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 02:40:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F192610E53C;
	Fri,  3 Jul 2026 02:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFTgU4mP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4558810E53C
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 02:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783046403; x=1814582403;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ArEBas0McDfc9FOlWc1t8sl7GCoLPQdw6Ve2TWW+dp8=;
 b=ZFTgU4mPFu/MecZIE5zjLJcKT9ekIoO4yvxCMNpM8vaD6Sg5rf8x2xLq
 uHCCT6SClaVJYgP/DSm7+TshcGe+yfKEnTkuesapvLFg7JaU+FUdmibye
 Bo42zWGUPbsAsWLabJagiKTDJtvUeMuPoVD8FSzjM5v/r7D+loTolE81T
 x6Cf2yuo+yLwhxpL498nxo7hfvMCisHEkCAGgzf2v0dqn6pDexBPQEhjh
 kED/F/AGcGrpcQSGis1JvpWG/lnaEYmTp5eLVRcXoYMaI5qH5UOO4MM5d
 Enw3krOMCZtUtkXN0ShrxeWJq1fygRFDgt5rldQsIca0L/4ZTBbuvgF4W g==;
X-CSE-ConnectionGUID: 9aKiI/f+QIKTy62Iyfzhhw==
X-CSE-MsgGUID: LMCsnQqNSHCAG0Kv4xXwqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87711171"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="87711171"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 19:40:02 -0700
X-CSE-ConnectionGUID: tgyLdRvWR0+ztfEzAa8DEQ==
X-CSE-MsgGUID: mEHBDd87Q+6Hm7v98KOMdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="253647235"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 19:40:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] tests/intel/xe_defrag: Exercise the Xe page-defragmentation
 worker
Date: Thu,  2 Jul 2026 19:39:53 -0700
Message-Id: <20260703023953.4117748-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add an IGT test that drives the Xe background page-defragmentation
worker under realistic memory pressure and validates data integrity
across the moves it performs.

A continuously running, *non-GPU* fragmentation thread churns anonymous
mmap()s and temporary-file page cache to drain the high-order (2M) free
lists, mimicking a busy system doing ordinary CPU work.  On top of that,
the TTM beneficial-order fault-injection knob is used to deterministically
force system BOs to be backed at a sub-optimal page order, which is what
places them on the driver's defrag list.

The GPU workload creates a set of variously sized system-memory BOs
(several deliberately not aligned to the 2M beneficial order), binds
them, patterns them from the CPU, issues blitter copy commands, and
verifies integrity both immediately and again after the defrag worker
has had a chance to re-back (move + copy) the objects at the beneficial
order.  A controller thread toggles fault injection, pauses fragmentation
and lets the system settle, then reads the GT defrag stats.

The GPU section scales out to stress concurrency against the worker:

  * fault-single             - single threaded baseline
  * fault-threads-shared-vm  - many threads sharing one VM
  * fault-threads-separate-vm - many threads, a VM each
  * fault-processes          - many processes, independent fd + VM
  * fragment-threads-shared-vm - no fault injection; rely solely on the
                               fragmentation thread to induce sub-optimal
                               backing

The blitter copy honours blt_uses_extended_block_copy() so the extended
XY_BLOCK_COPY command length is emitted on platforms that require it,
and threads sharing a VM also share that VM's allocator handle (owned by
the parent) so the shared bind tracking outlives every worker's GPU work.

Assisted-by: GitHub_Copilot:claude-opus-4.8
Signed-off-by: Matthew Brost <matthew.brost@intel.com>

---

This test is for the WIP series in list [1]. It seems quite effective,
as it found two bugs ([2] and [3]) in the existing driver related to
[1].

[1] https://patchwork.freedesktop.org/series/169053/
[2] https://patchwork.freedesktop.org/series/169722/
[3] https://patchwork.freedesktop.org/series/169655/
---
 tests/intel/xe_defrag.c | 799 ++++++++++++++++++++++++++++++++++++++++
 tests/meson.build       |   1 +
 2 files changed, 800 insertions(+)
 create mode 100644 tests/intel/xe_defrag.c

diff --git a/tests/intel/xe_defrag.c b/tests/intel/xe_defrag.c
new file mode 100644
index 0000000000..8333d5ad73
--- /dev/null
+++ b/tests/intel/xe_defrag.c
@@ -0,0 +1,799 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: Exercise the Xe page-defragmentation worker
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: memory management tests
+ * Functionality: page defragmentation
+ * GPU: LNL, BMG, PVC
+ * Description:
+ *	Drives the Xe background defragmentation worker under memory pressure.
+ *
+ *	A continuously running, *non-GPU* fragmentation thread churns anonymous
+ *	mmap()s and temporary-file page cache so that the high-order (2M)
+ *	free lists get drained, mimicking a busy system doing ordinary CPU work.
+ *	On top of that, the TTM beneficial-order fault injection knob is used to
+ *	deterministically force system BOs to be backed at a sub-optimal page
+ *	order, which is exactly what puts them onto the driver's defrag list.
+ *
+ *	The GPU workload then creates a set of variously sized system-memory BOs
+ *	(several deliberately not aligned to the 2M beneficial order), binds
+ *	them, patterns them from the CPU, issues blitter copy commands, and
+ *	verifies data integrity both immediately and again after the defrag
+ *	worker has had a chance to re-back (move + copy) the objects at the
+ *	beneficial order.  The GPU section scales from a single thread, to many
+ *	threads (sharing a VM or with a VM each), to many processes.
+ */
+
+#include <fcntl.h>
+#include <pthread.h>
+#include <stdatomic.h>
+#include <sys/mman.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "igt_syncobj.h"
+#include "igt_sysfs.h"
+#include "intel_blt.h"
+#include "lib/intel_cmds_info.h"
+#include "lib/intel_mocs.h"
+#include "lib/intel_pat.h"
+#include "xe_drm.h"
+
+#include "xe/xe_gt.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+/* Xe device beneficial order is 2M; a page is 4K. */
+#define DEFRAG_PAGE_SIZE	SZ_4K
+#define DEFRAG_BENEFICIAL_SIZE	SZ_2M
+#define DEFRAG_PAGES_PER_2M	(DEFRAG_BENEFICIAL_SIZE / DEFRAG_PAGE_SIZE)
+
+/* blitter surface geometry: 4K pitch, 32bpp -> 1024 dwords wide, height in pages */
+#define DEFRAG_BPP		32
+#define DEFRAG_WIDTH_DW		(DEFRAG_PAGE_SIZE / (DEFRAG_BPP / 8))
+
+/* Worker workload tuning. */
+#define DEFRAG_WARMUP_ROUNDS	3
+#define DEFRAG_WARMUP_ROUND_MS	20
+#define DEFRAG_SETTLE_MS	400
+
+/* Feature flags for a subtest. */
+#define F_FAULT_INJECT		(1u << 0)	/* force sub-optimal backing */
+#define F_THREADS		(1u << 1)	/* many threads */
+#define F_SEPARATE_VM		(1u << 2)	/* one VM per thread */
+#define F_PROCESSES		(1u << 3)	/* many processes */
+
+/*
+ * Objects per worker, in units of 4K pages (height). Several are deliberately
+ * NOT a multiple of DEFRAG_PAGES_PER_2M (512), i.e. not aligned to the 2M
+ * beneficial order, so the tail of the backing cannot be a full 2M chunk.
+ */
+static const uint32_t bo_heights[] = {
+	512,	/* 2M   - exactly aligned */
+	513,	/* 2M+4K - unaligned */
+	511,	/* just under 2M */
+	100,	/* 400K - sub-2M */
+	1024,	/* 4M   - aligned */
+	1025,	/* 4M+4K - unaligned */
+	1536,	/* 6M   - aligned */
+	2049,	/* 8M+4K - unaligned */
+	8192,	/* 32M  - aligned */
+	8193,	/* 32M+4K - unaligned */
+	16384,	/* 64M  - aligned */
+	16385,	/* 64M+4K - unaligned */
+};
+
+struct defrag_bo {
+	struct blt_copy_object *src;
+	struct blt_copy_object *dst;
+	uint32_t bb;
+	uint64_t bb_size;
+	uint64_t size;
+	uint32_t seed;
+};
+
+/*
+ * Cross-worker synchronisation. Lives in MAP_SHARED anonymous memory with a
+ * PTHREAD_PROCESS_SHARED barrier so the very same code path works for both the
+ * thread and the process scaling variants.
+ */
+struct defrag_sync {
+	pthread_barrier_t barrier;
+};
+
+/* Non-GPU fragmentation control (shared with the fragmentation thread). */
+struct frag_ctl {
+	atomic_int stop;
+	atomic_int pause;
+};
+
+struct worker_args {
+	int fd;
+	uint32_t vm;
+	uint64_t ahnd;
+	int id;
+	uint32_t region;
+	unsigned int flags;
+	struct defrag_sync *sync;
+	pthread_t thread;
+};
+
+/* -------------------------------------------------------------------------- */
+/* Non-GPU fragmentation: anonymous mmap churn + temp-file page cache churn.   */
+/* -------------------------------------------------------------------------- */
+
+#define FRAG_RING		4
+#define FRAG_MAP_MIN		(32ull << 20)
+#define FRAG_MAP_MAX		(96ull << 20)
+
+static void frag_punch_holes(char *p, size_t size)
+{
+	size_t pages = size / DEFRAG_PAGE_SIZE;
+	int holes = pages / 8;
+	int i;
+
+	/*
+	 * Scatter MADV_DONTNEED over random single pages inside a large mapping.
+	 * Returning individual pages to the allocator while keeping the mapping
+	 * around is what actually fragments the buddy free lists and starves the
+	 * 2M order that the beneficial-order allocation wants.
+	 */
+	for (i = 0; i < holes; i++) {
+		size_t pg = ((size_t)rand() % pages) * DEFRAG_PAGE_SIZE;
+
+		madvise(p + pg, DEFRAG_PAGE_SIZE, MADV_DONTNEED);
+	}
+}
+
+static void frag_file_churn(void)
+{
+	char path[] = "/tmp/xe_defrag_frag.XXXXXX";
+	char buf[SZ_64K];
+	int fd, i;
+
+	fd = mkstemp(path);
+	if (fd < 0)
+		return;
+	unlink(path);
+
+	memset(buf, rand(), sizeof(buf));
+	for (i = 0; i < 64; i++) {
+		if (write(fd, buf, sizeof(buf)) != sizeof(buf))
+			break;
+	}
+	fdatasync(fd);
+	/* Drop the page-cache pages we just dirtied to keep churning. */
+	posix_fadvise(fd, 0, 0, POSIX_FADV_DONTNEED);
+	close(fd);
+}
+
+static void *frag_thread_fn(void *arg)
+{
+	struct frag_ctl *ctl = arg;
+	char *ring[FRAG_RING] = { };
+	size_t ring_sz[FRAG_RING] = { };
+	int slot = 0;
+
+	while (!atomic_load(&ctl->stop)) {
+		size_t size, off;
+		char *p;
+
+		if (atomic_load(&ctl->pause)) {
+			usleep(2000);
+			continue;
+		}
+
+		size = FRAG_MAP_MIN +
+		       ((size_t)rand() % (FRAG_MAP_MAX - FRAG_MAP_MIN));
+		size = ALIGN(size, DEFRAG_PAGE_SIZE);
+
+		p = mmap(NULL, size, PROT_READ | PROT_WRITE,
+			 MAP_PRIVATE | MAP_ANONYMOUS | MAP_NORESERVE, -1, 0);
+		if (p == MAP_FAILED) {
+			usleep(2000);
+			continue;
+		}
+
+		/* Fault every page in to actually consume physical memory. */
+		for (off = 0; off < size; off += DEFRAG_PAGE_SIZE)
+			p[off] = (char)off;
+
+		frag_punch_holes(p, size);
+		frag_file_churn();
+
+		/* Retire the oldest mapping in the ring, keep this one alive. */
+		if (ring[slot])
+			munmap(ring[slot], ring_sz[slot]);
+		ring[slot] = p;
+		ring_sz[slot] = size;
+		slot = (slot + 1) % FRAG_RING;
+	}
+
+	for (slot = 0; slot < FRAG_RING; slot++)
+		if (ring[slot])
+			munmap(ring[slot], ring_sz[slot]);
+
+	return NULL;
+}
+
+/* -------------------------------------------------------------------------- */
+/* TTM beneficial-order fault injection knobs.                                 */
+/* -------------------------------------------------------------------------- */
+
+static int open_fault_dir(void)
+{
+	char path[PATH_MAX];
+	const char *root;
+	int dir;
+
+	root = igt_debugfs_mount();
+	igt_assert(root);
+
+	snprintf(path, sizeof(path), "%s/ttm/beneficial_order_fault_inject",
+		 root);
+	dir = open(path, O_RDONLY);
+
+	return dir;
+}
+
+static void set_fault_inject(int dir, bool enable)
+{
+	igt_assert(dir >= 0);
+
+	if (enable) {
+		igt_sysfs_set_u32(dir, "probability", 100);
+		igt_sysfs_printf(dir, "times", "%d", -1);
+		igt_sysfs_set_u32(dir, "interval", 4);
+		igt_sysfs_set_u32(dir, "space", 0);
+		igt_sysfs_set_u32(dir, "verbose", 0);
+	} else {
+		igt_sysfs_set_u32(dir, "probability", 0);
+		igt_sysfs_set_u32(dir, "times", 0);
+	}
+}
+
+/* -------------------------------------------------------------------------- */
+/* Per-worker GPU workload.                                                    */
+/* -------------------------------------------------------------------------- */
+
+static void fill_pattern(struct blt_copy_object *obj, uint32_t seed)
+{
+	uint32_t *p = obj->ptr;
+	uint64_t n = obj->size / sizeof(*p);
+	uint64_t i;
+
+	for (i = 0; i < n; i++)
+		p[i] = seed + (uint32_t)i;
+}
+
+static void verify_pattern(struct blt_copy_object *obj, uint32_t seed,
+			   int id, const char *what, uint64_t ahnd)
+{
+	uint32_t *p = obj->ptr;
+	uint64_t n = obj->size / sizeof(*p);
+	uint64_t i;
+
+	for (i = 0; i < n; i++) {
+		uint32_t expected = seed + (uint32_t)i;
+
+		if (p[i] != expected) {
+			int64_t delta = (int64_t)p[i] - (int64_t)expected;
+			int64_t dw_per_page = DEFRAG_PAGE_SIZE / sizeof(*p);
+			uint64_t base_va = get_offset(ahnd, obj->handle,
+						      obj->size, 0);
+			uint64_t byte_off = i * sizeof(*p);
+			uint64_t page = byte_off / DEFRAG_PAGE_SIZE;
+			uint32_t src_dw = p[i] - seed; /* implied source dword */
+			uint64_t src_page = (uint64_t)src_dw / dw_per_page;
+
+			igt_critical("worker %d %s corruption at dword %llu: "
+				     "expected 0x%08x got 0x%08x (size %llu) "
+				     "delta=%lld dwords (%.3f pages)\n",
+				     id, what, (unsigned long long)i, expected,
+				     p[i], (unsigned long long)obj->size,
+				     (long long)delta,
+				     (double)delta / (double)dw_per_page);
+			igt_critical("worker %d %s VA: bo_base=0x%llx "
+				     "dst_page=%llu dst_page_va=0x%llx "
+				     "src_page=%llu (bo handle=%u)\n",
+				     id, what,
+				     (unsigned long long)base_va,
+				     (unsigned long long)page,
+				     (unsigned long long)(base_va +
+					     (page << 12)),
+				     (unsigned long long)src_page,
+				     obj->handle);
+			igt_assert_eq_u32(p[i], expected);
+		}
+	}
+}
+
+static void gpu_copy(int fd, const intel_ctx_t *ctx, uint64_t ahnd,
+		     uint32_t bb, uint64_t bb_size, uint32_t region,
+		     struct defrag_bo *bo)
+{
+	struct blt_copy_data blt = {};
+	struct blt_block_copy_data_ext ext = {};
+	struct blt_block_copy_data_ext *pext = &ext;
+
+	blt_copy_init(fd, &blt);
+	blt.color_depth = CD_32bit;
+	blt_set_copy_object(&blt.src, bo->src);
+	blt_set_copy_object(&blt.dst, bo->dst);
+	blt_set_batch(&blt.bb, bb, bb_size, region);
+
+	/*
+	 * Platforms that use the extended XY_BLOCK_COPY command must be given a
+	 * (non-NULL) extended data struct; otherwise the shorter command is
+	 * emitted and the engine misparses the trailing dwords as addresses.
+	 */
+	if (!blt_uses_extended_block_copy(fd))
+		pext = NULL;
+
+	blt_block_copy(fd, ctx, NULL, ahnd, &blt, pext);
+}
+
+/*
+ * One round: (re)pattern each src from the CPU, GPU-copy src->dst, then verify
+ * the copy landed. Used during warm-up while the objects are freshly patterned.
+ */
+static void workload_round(int fd, intel_ctx_t *ctx, uint64_t ahnd,
+			   uint32_t region, struct defrag_bo *bos,
+			   int n_bos, int id)
+{
+	int i;
+
+	for (i = 0; i < n_bos; i++) {
+		fill_pattern(bos[i].src, bos[i].seed);
+		/*
+		 * Confirm the copy INPUT is intact right before submitting: if
+		 * src is already wrong here, the corruption came from the
+		 * backing/move, not from the blit itself.
+		 */
+		verify_pattern(bos[i].src, bos[i].seed, id, "src-pre-copy", ahnd);
+		gpu_copy(fd, ctx, ahnd, bos[i].bb, bos[i].bb_size, region,
+			 &bos[i]);
+	}
+
+	igt_assert(!intel_ctx_xe_sync(ctx, false));
+
+	for (i = 0; i < n_bos; i++) {
+		/* Re-check src post-copy to catch a move that happened during. */
+		verify_pattern(bos[i].src, bos[i].seed, id, "src-post-copy", ahnd);
+		verify_pattern(bos[i].dst, bos[i].seed, id, "copy", ahnd);
+	}
+}
+
+static void worker_run(struct worker_args *w)
+{
+	struct drm_xe_engine_class_instance inst = {
+		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+	};
+	int n_bos = ARRAY_SIZE(bo_heights);
+	uint64_t bb_size = xe_bb_size(w->fd, SZ_2M);
+	struct blt_copy_data init = {};
+	struct defrag_bo *bos;
+	intel_ctx_t *ctx;
+	uint32_t exec_queue;
+	uint64_t ahnd;
+	uint32_t sync_out = syncobj_create(w->fd, 0);
+	bool own_ahnd = !w->ahnd;
+	int i, r;
+
+	bos = calloc(n_bos, sizeof(*bos));
+	igt_assert(bos);
+
+	exec_queue = xe_exec_queue_create(w->fd, w->vm, &inst, 0);
+	ctx = intel_ctx_xe(w->fd, w->vm, exec_queue, 0, 0, sync_out);
+	/*
+	 * When several workers share a VM they must also share the (VM-keyed)
+	 * allocator handle. intel_allocator_close() untracks the handle on every
+	 * put_ahnd() regardless of refcount, so letting each worker open+close
+	 * it independently tears the shared bind tracking down on the first
+	 * worker to exit - while the others' objects are still bound and their
+	 * GPU work may still be in flight on that VM. The parent therefore owns
+	 * the shared handle and we borrow it here; only a privately-opened
+	 * handle is closed by the worker.
+	 */
+	ahnd = own_ahnd ?
+	       intel_allocator_open_full(w->fd, w->vm, 0, 0,
+					 INTEL_ALLOCATOR_SIMPLE,
+					 ALLOC_STRATEGY_LOW_TO_HIGH, 0) :
+	       w->ahnd;
+
+	blt_copy_init(w->fd, &init);
+	for (i = 0; i < n_bos; i++) {
+		bos[i].src = blt_create_object(&init, w->region,
+					       DEFRAG_WIDTH_DW, bo_heights[i],
+					       DEFRAG_BPP, 0, T_LINEAR,
+					       COMPRESSION_DISABLED, 0, true);
+		bos[i].dst = blt_create_object(&init, w->region,
+					       DEFRAG_WIDTH_DW, bo_heights[i],
+					       DEFRAG_BPP, 0, T_LINEAR,
+					       COMPRESSION_DISABLED, 0, true);
+		bos[i].size = bos[i].src->size;
+		bos[i].seed = (w->id << 24) ^ (bo_heights[i] << 8) ^ (i + 1);
+		bos[i].bb = xe_bo_create(w->fd, 0, bb_size, w->region, 0);
+		bos[i].bb_size = bb_size;
+		igt_assert_eq_u64(bos[i].src->size, bos[i].dst->size);
+
+		/*
+		 * Force + report the GPU addresses the batches will reference,
+		 * so a pagefault can be correlated to a specific object (and to
+		 * prove whether the faulting VA was ever handed out/bound).
+		 */
+		if (igt_debug_on(getenv("XE_DEFRAG_DEBUG") != NULL)) {
+			uint64_t so = get_offset(ahnd, bos[i].src->handle,
+						 bos[i].size, 0);
+			uint64_t doff = get_offset(ahnd, bos[i].dst->handle,
+						   bos[i].size, 0);
+
+			igt_info("worker %d bo[%d] h=%u pages size=%#llx "
+				 "src_va=%#llx dst_va=%#llx\n",
+				 w->id, i, bo_heights[i],
+				 (unsigned long long)bos[i].size,
+				 (unsigned long long)so,
+				 (unsigned long long)doff);
+		}
+	}
+
+	/*
+	 * Phase A: pattern + GPU copy + verify while beneficial-order allocation
+	 * is being forced to fail. Every object here ends up backed at a
+	 * sub-optimal order and gets queued on the driver's defrag list.
+	 */
+	for (r = 0; r < DEFRAG_WARMUP_ROUNDS; r++) {
+		workload_round(w->fd, ctx, ahnd, w->region, bos, n_bos, w->id);
+		usleep(DEFRAG_WARMUP_ROUND_MS * 1000);
+	}
+
+	/* Rendezvous #1: everyone has sub-optimal backing on the defrag list. */
+	pthread_barrier_wait(&w->sync->barrier);
+
+	/*
+	 * Controller now disables fault injection, pauses fragmentation and lets
+	 * the defrag worker run. Rendezvous #2 releases us once it has settled.
+	 */
+	pthread_barrier_wait(&w->sync->barrier);
+
+	/*
+	 * Phase B: the objects may have been moved and re-copied to fresh
+	 * beneficial-order backing underneath us. Their contents must have
+	 * survived the defrag move. Verify the CPU-visible data is intact and
+	 * re-issue a GPU copy to prove the (possibly relocated) BO is still
+	 * bound and GPU-accessible.
+	 */
+	for (i = 0; i < n_bos; i++) {
+		verify_pattern(bos[i].src, bos[i].seed, w->id, "post-defrag src", ahnd);
+		verify_pattern(bos[i].dst, bos[i].seed, w->id, "post-defrag dst", ahnd);
+	}
+	for (i = 0; i < n_bos; i++) {
+		/* Wipe dst, re-copy from src on the GPU, re-verify. */
+		memset(bos[i].dst->ptr, 0, bos[i].size);
+		gpu_copy(w->fd, ctx, ahnd, bos[i].bb, bos[i].bb_size,
+			 w->region, &bos[i]);
+	}
+	igt_assert(!intel_ctx_xe_sync(ctx, false));
+	for (i = 0; i < n_bos; i++)
+		verify_pattern(bos[i].dst, bos[i].seed, w->id, "post-defrag copy", ahnd);
+
+	/* Rendezvous #3: safe to tear down. */
+	pthread_barrier_wait(&w->sync->barrier);
+
+	/*
+	 * Drop the GPU context/queue first so this worker's copies are
+	 * guaranteed idle, then release the objects (freeing their VA in the -
+	 * possibly shared - allocator). Only close the allocator handle if we
+	 * opened it privately; a shared handle is owned by the parent.
+	 */
+	intel_ctx_destroy(w->fd, ctx);
+	xe_exec_queue_destroy(w->fd, exec_queue);
+
+	for (i = 0; i < n_bos; i++) {
+		blt_destroy_object_and_alloc_free(w->fd, ahnd, bos[i].src);
+		blt_destroy_object_and_alloc_free(w->fd, ahnd, bos[i].dst);
+		gem_close(w->fd, bos[i].bb);
+	}
+	syncobj_destroy(w->fd, sync_out);
+	if (own_ahnd)
+		put_ahnd(ahnd);
+	free(bos);
+}
+
+static void *worker_thread(void *arg)
+{
+	worker_run(arg);
+	return NULL;
+}
+
+/* -------------------------------------------------------------------------- */
+/* Orchestration.                                                              */
+/* -------------------------------------------------------------------------- */
+
+static struct defrag_sync *sync_create(int nparties)
+{
+	pthread_barrierattr_t attr;
+	struct defrag_sync *s;
+
+	s = mmap(NULL, sizeof(*s), PROT_READ | PROT_WRITE,
+		 MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(s != MAP_FAILED);
+
+	pthread_barrierattr_init(&attr);
+	pthread_barrierattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
+	pthread_barrier_init(&s->barrier, &attr, nparties);
+	pthread_barrierattr_destroy(&attr);
+
+	return s;
+}
+
+static void sync_destroy(struct defrag_sync *s)
+{
+	pthread_barrier_destroy(&s->barrier);
+	munmap(s, sizeof(*s));
+}
+
+static int defrag_stat(int fd, const char *name)
+{
+	/* Primary GT owns the defrag counters. */
+	return xe_gt_stats_get_count(fd, 0, name);
+}
+
+/*
+ * The controller drives the global (system-wide) knobs around the phased
+ * worker run: it forces sub-optimal backing for phase A, then lifts the
+ * pressure and gives the defrag worker time to upgrade the objects for phase B.
+ */
+static void controller_run(int fd, int fault_dir, struct frag_ctl *frag,
+			   struct defrag_sync *sync, unsigned int flags)
+{
+	int added_before = -1, added_after = -1, success_before = -1,
+	    success_after = -1;
+
+	if (flags & F_FAULT_INJECT)
+		added_before = defrag_stat(fd, "defrag_added_count");
+	success_before = defrag_stat(fd, "defrag_success_count");
+
+	/* Rendezvous #1: workers finished phase A. */
+	pthread_barrier_wait(&sync->barrier);
+
+	if (flags & F_FAULT_INJECT) {
+		added_after = defrag_stat(fd, "defrag_added_count");
+		if (added_before >= 0 && added_after >= 0) {
+			igt_info("defrag_added_count: %d -> %d\n",
+				 added_before, added_after);
+			igt_assert_f(added_after > added_before,
+				     "expected BOs to be queued for defrag\n");
+		}
+		/* Let the worker actually re-back objects at 2M. */
+		set_fault_inject(fault_dir, false);
+	}
+
+	/* Pause the CPU pressure so 2M chunks become available again. */
+	atomic_store(&frag->pause, 1);
+
+	usleep(DEFRAG_SETTLE_MS * 1000);
+
+	success_after = defrag_stat(fd, "defrag_success_count");
+	if (success_before >= 0 && success_after >= 0)
+		igt_info("defrag_success_count: %d -> %d\n",
+			 success_before, success_after);
+
+	/* Rendezvous #2: release workers into phase B. */
+	pthread_barrier_wait(&sync->barrier);
+
+	/* Rendezvous #3: workers are done verifying. */
+	pthread_barrier_wait(&sync->barrier);
+
+	atomic_store(&frag->pause, 0);
+}
+
+static int num_workers(void)
+{
+	int n = sysconf(_SC_NPROCESSORS_ONLN);
+
+	return clamp(n, 2, 8);
+}
+
+static void run_threads(int fd, uint32_t region, int fault_dir,
+			struct frag_ctl *frag, unsigned int flags)
+{
+	int n = (flags & F_THREADS) ? num_workers() : 1;
+	struct defrag_sync *sync = sync_create(n + 1);
+	struct worker_args *args = calloc(n, sizeof(*args));
+	uint32_t shared_vm = 0;
+	uint64_t shared_ahnd = 0;
+	int i;
+
+	igt_assert(args);
+
+	if (!(flags & F_SEPARATE_VM)) {
+		shared_vm = xe_vm_create(fd, 0, 0);
+		/*
+		 * Workers sharing a VM must share its (VM-keyed) allocator
+		 * handle. Own it here so it strictly outlives every worker's
+		 * GPU work; letting workers open+close it themselves would
+		 * untrack the shared state on the first worker to exit.
+		 */
+		shared_ahnd = intel_allocator_open_full(fd, shared_vm, 0, 0,
+							INTEL_ALLOCATOR_SIMPLE,
+							ALLOC_STRATEGY_LOW_TO_HIGH,
+							0);
+	}
+
+	for (i = 0; i < n; i++) {
+		args[i].fd = fd;
+		args[i].id = i;
+		args[i].region = region;
+		args[i].flags = flags;
+		args[i].sync = sync;
+		args[i].vm = (flags & F_SEPARATE_VM) ?
+			     xe_vm_create(fd, 0, 0) : shared_vm;
+		args[i].ahnd = shared_ahnd;	/* 0 => worker opens its own */
+	}
+
+	for (i = 0; i < n; i++)
+		pthread_create(&args[i].thread, NULL, worker_thread, &args[i]);
+
+	controller_run(fd, fault_dir, frag, sync, flags);
+
+	for (i = 0; i < n; i++)
+		pthread_join(args[i].thread, NULL);
+
+	if (flags & F_SEPARATE_VM) {
+		for (i = 0; i < n; i++)
+			xe_vm_destroy(fd, args[i].vm);
+	} else {
+		put_ahnd(shared_ahnd);
+		xe_vm_destroy(fd, shared_vm);
+	}
+
+	sync_destroy(sync);
+	free(args);
+}
+
+static void run_processes(int fd, uint32_t region, int fault_dir,
+			  struct frag_ctl *frag, unsigned int flags)
+{
+	int n = num_workers();
+	struct defrag_sync *sync = sync_create(n + 1);
+
+	/*
+	 * The IGT allocator keeps global state; coordinate it across the fork so
+	 * each child's independent address space is tracked correctly.
+	 */
+	intel_allocator_multiprocess_start();
+
+	/*
+	 * Each child opens its own device fd and VM: a fully independent
+	 * address space per process. The parent stays the controller and owns
+	 * the global fault-injection / fragmentation knobs.
+	 */
+	igt_fork(child, n) {
+		struct worker_args w = { };
+		int cfd = drm_open_driver(DRIVER_XE);
+
+		w.fd = cfd;
+		w.id = child;
+		w.region = system_memory(cfd);
+		w.flags = flags;
+		w.sync = sync;
+		w.vm = xe_vm_create(cfd, 0, 0);
+
+		worker_run(&w);
+
+		xe_vm_destroy(cfd, w.vm);
+		drm_close_driver(cfd);
+	}
+
+	controller_run(fd, fault_dir, frag, sync, flags);
+
+	igt_waitchildren();
+	intel_allocator_multiprocess_stop();
+	sync_destroy(sync);
+}
+
+static void test_defrag(int fd, unsigned int flags)
+{
+	uint32_t region = system_memory(fd);
+	struct frag_ctl frag = { };
+	int fault_dir = -1;
+	pthread_t frag_tid;
+
+	if (flags & F_FAULT_INJECT) {
+		fault_dir = open_fault_dir();
+		igt_require(fault_dir >= 0);
+		set_fault_inject(fault_dir, true);
+	}
+
+	/* Continuous non-GPU memory pressure for the duration of the test. */
+	atomic_store(&frag.stop, 0);
+	atomic_store(&frag.pause, 0);
+	pthread_create(&frag_tid, NULL, frag_thread_fn, &frag);
+
+	if (flags & F_PROCESSES)
+		run_processes(fd, region, fault_dir, &frag, flags);
+	else
+		run_threads(fd, region, fault_dir, &frag, flags);
+
+	atomic_store(&frag.stop, 1);
+	pthread_join(frag_tid, NULL);
+
+	if (fault_dir >= 0) {
+		/* Restore the knob no matter what path we took. */
+		set_fault_inject(fault_dir, false);
+		close(fault_dir);
+	}
+}
+
+int igt_main()
+{
+	int fault_dir = -1;
+	int fd;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_XE);
+		igt_require(blt_has_block_copy(fd));
+		igt_require_f(system_memory(fd),
+			      "system memory region required\n");
+		fault_dir = open_fault_dir();
+	}
+
+	/**
+	 * SUBTEST: fault-single
+	 * Description:
+	 *	Single-threaded: force sub-optimal backing via fault injection,
+	 *	then verify integrity across the defrag worker's move.
+	 */
+	igt_subtest("fault-single")
+		test_defrag(fd, F_FAULT_INJECT);
+
+	/**
+	 * SUBTEST: fault-threads-shared-vm
+	 * Description:
+	 *	Many threads sharing a single VM, with fault injection forcing
+	 *	sub-optimal backing.
+	 */
+	igt_subtest("fault-threads-shared-vm")
+		test_defrag(fd, F_FAULT_INJECT | F_THREADS);
+
+	/**
+	 * SUBTEST: fault-threads-separate-vm
+	 * Description:
+	 *	Many threads each with their own VM, with fault injection forcing
+	 *	sub-optimal backing.
+	 */
+	igt_subtest("fault-threads-separate-vm")
+		test_defrag(fd, F_FAULT_INJECT | F_THREADS | F_SEPARATE_VM);
+
+	/**
+	 * SUBTEST: fault-processes
+	 * Description:
+	 *	Many processes, each with an independent device fd and VM, with
+	 *	fault injection forcing sub-optimal backing.
+	 */
+	igt_subtest("fault-processes")
+		test_defrag(fd, F_FAULT_INJECT | F_PROCESSES);
+
+	/**
+	 * SUBTEST: fragment-threads-shared-vm
+	 * Description:
+	 *	Many threads sharing a VM, relying only on the non-GPU
+	 *	fragmentation thread (no fault injection) to induce sub-optimal
+	 *	backing and exercise the defrag worker.
+	 */
+	igt_subtest("fragment-threads-shared-vm")
+		test_defrag(fd, F_THREADS);
+
+	igt_fixture() {
+		drm_close_driver(fd);
+		set_fault_inject(fault_dir, false);
+		close(fault_dir);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 96bd6213d1..1ea97d4f0c 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -289,6 +289,7 @@ intel_xe_progs = [
 	'xe_copy_basic',
 	'xe_configfs',
 	'xe_debugfs',
+	'xe_defrag',
 	'xe_dma_buf_sync',
 	'xe_drm_fdinfo',
 	'xe_eu_stall',
-- 
2.34.1

