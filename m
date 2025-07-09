Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40942C83F09
	for <igt-dev@archiver.kernel.org>; Wed,  9 Jul 2025 03:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DED10E20F;
	Wed,  9 Jul 2025 03:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DyXa1Sca";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC9410E1EF
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jul 2025 03:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752033401; x=1783569401;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=u2rM3JSDAQ+et4rHX5zk0fKLfpPYdQfLxLR6U6wz9Ts=;
 b=DyXa1ScaydVWF+5Y0PYD7KXcBWFzXp42aJIZ7/hTfAScn0WfJKVzt5oD
 0NHQiLx4K0ZwDh3s5nPqcM//3h2IMk/GwdZMMDjwHA7bFC+dzJoGmSOtX
 vocqU+ZsdPJtKOGEPYcjq8XhS7gea/XyZU9xsqB49MiUZzDmeB4wNc5Su
 UO8kxK3SghFhJh+oA3zlNGUDHv65lb/9+hggD+QOeeSlTzWJ48ueq3Chm
 h7+705uZFUosQZKC/4Yhnfex6sWhZ81eETfG6hEpa1QZ9pMHSbyVzngGm
 D5qL2zg4+hYTqupPC2BmHuJjOEUYQcyqdVZbzLPGyvPoWA1GmEqKU3j0M Q==;
X-CSE-ConnectionGUID: Pwl4Zkd4QKCaFrvFvlipuQ==
X-CSE-MsgGUID: v0Y2qX9mTDOp17+6nEuhnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54003574"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54003574"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 20:56:40 -0700
X-CSE-ConnectionGUID: mWUgvGngTJWZF5wt7vNRfA==
X-CSE-MsgGUID: xDM1chvlRD2C0VgUlp8F7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155749818"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 20:56:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 2/3] tests/intel/xe_exec_system_allocator: Add prefetch
 sections
Date: Tue,  8 Jul 2025 20:58:20 -0700
Message-Id: <20250709035821.712973-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709035821.712973-1-matthew.brost@intel.com>
References: <20250709035821.712973-1-matthew.brost@intel.com>
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

Update the test_exec() function with flags to initiate and understand
prefetches. Prefetching is tested by verifying that the fault count in
the GT stats has not  increased. However, a mismatch does not cause the
test to fail—instead, a warning  is printed. This is due to the
unreliability of system allocator behavior; the  added sections
primarily serve to ensure that the driver remains stable.

That said, if the page fault counts are consistently incorrect, it may
indicate a  problem in the KMD.

A prefetch benchmark section has also been added to help profile
prefetch behavior  in the KMD.

v2:
 - Prefetch initial buffer on SRAM devices (CI)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 121 ++++++++++++++++++++++++-
 1 file changed, 116 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 65d281c784..f8d144328e 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -21,6 +21,7 @@
 #include "lib/intel_reg.h"
 #include "xe_drm.h"
 
+#include "xe/xe_gt.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include <string.h>
@@ -770,6 +771,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 #define SYNC_EXEC		(0x1 << 19)
 #define EVERY_OTHER_CHECK	(0x1 << 20)
 #define MULTI_FAULT		(0x1 << 21)
+#define PREFETCH		(0x1 << 22)
+#define THREADS			(0x1 << 23)
+#define PROCESSES		(0x1 << 24)
+#define PREFETCH_BENCHMARK	(0x1 << 25)
 
 #define N_MULTI_FAULT		4
 
@@ -878,14 +883,17 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
  * arg[1]:
  *
  * @malloc:				malloc single buffer for all execs, issue a command which will trigger multiple faults
+ * @malloc-prefetch:			malloc single buffer for all execs, prefetch buffer before each exec
  * @malloc-multi-fault:			malloc single buffer for all execs
  * @malloc-fork-read:			malloc single buffer for all execs, fork a process to read test output
  * @malloc-fork-read-after:		malloc single buffer for all execs, fork a process to read test output, check again after fork returns in parent
  * @malloc-mlock:			malloc and mlock single buffer for all execs
  * @malloc-race:			malloc single buffer for all execs with race between cpu and gpu access
+ * @malloc-prefetch-race:		malloc single buffer for all execs, prefetch buffer before each exec, with race between cpu and gpu access
  * @malloc-bo-unmap:			malloc single buffer for all execs, bind and unbind a BO to same address before execs
  * @malloc-busy:			malloc single buffer for all execs, try to unbind while buffer valid
  * @mmap:				mmap single buffer for all execs
+ * @mmap-prefetch:			mmap single buffer for all execs, prefetch buffer before each exec
  * @mmap-remap:				mmap and mremap a buffer for all execs
  * @mmap-remap-dontunmap:		mmap and mremap a buffer with dontunmap flag for all execs
  * @mmap-remap-ro:			mmap and mremap a read-only buffer for all execs
@@ -896,6 +904,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
  * @mmap-remap-ro-dontunmap-eocheck:	mmap and mremap a read-only buffer with dontunmap flag for all execs, check data every other loop iteration
  * @mmap-huge:				mmap huge page single buffer for all execs
  * @mmap-shared:			mmap shared single buffer for all execs
+ * @mmap-prefetch-shared:		mmap shared single buffer for all execs, prefetch buffer before each exec
  * @mmap-shared-remap:			mmap shared and mremap a buffer for all execs
  * @mmap-shared-remap-dontunmap:	mmap shared and mremap a buffer with dontunmap flag for all execs
  * @mmap-shared-remap-eocheck:		mmap shared and mremap a buffer for all execs, check data every other loop iteration
@@ -907,6 +916,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
  * @free:				malloc and free buffer for each exec
  * @free-race:				malloc and free buffer for each exec with race between cpu and gpu access
  * @new:				malloc a new buffer for each exec
+ * @new-prefetch:			malloc a new buffer and prefetch for each exec
  * @new-race:				malloc a new buffer for each exec with race between cpu and gpu access
  * @new-bo-map:				malloc a new buffer or map BO for each exec
  * @new-busy:				malloc a new buffer for each exec, try to unbind while buffers valid
@@ -941,6 +951,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
  * @mmap-new-huge-nomemset:		mmap huge page new buffer for each exec, skip memset of buffers
  * @mmap-new-race-nomemset:		mmap a new buffer for each exec with race between cpu and gpu access, skip memset of buffers
  *
+ * SUBTEST: prefetch-benchmark
+ * Description: Prefetch a 64M buffer 128 times, measure bandwidth of prefetch
+ * Test category: performance test
+ *
  * SUBTEST: threads-shared-vm-shared-alloc-many-stride-malloc
  * Description: Create multiple threads with a shared VM triggering faults on different hardware engines to same addresses
  * Test category: stress test
@@ -998,14 +1012,18 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
 	struct test_exec_data *data, *next_data = NULL;
 	uint32_t bo_flags;
-	uint32_t bo = 0;
+	uint32_t bo = 0, prefetch_sync = 0;
 	void **pending_free;
-	u64 *exec_ufence = NULL;
-	int i, j, b, file_fd = -1, prev_idx;
+	u64 *exec_ufence = NULL, *prefetch_ufence = NULL;
+	int i, j, b, file_fd = -1, prev_idx, pf_count;
 	bool free_vm = false;
 	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
 	size_t orig_size = bo_size;
 	struct aligned_alloc_type aligned_alloc_type;
+	uint32_t mem_region = vram_if_possible(fd, eci->gt_id);
+	uint32_t region = mem_region & 4 ? 2 : mem_region & 2 ? 1 : 0;
+	uint64_t prefetch_ns = 0;
+	const char *pf_count_stat = "svm_pagefault_count";
 
 	if (flags & MULTI_FAULT) {
 		if (!bo_size)
@@ -1136,6 +1154,43 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		memset(exec_ufence, 0, SZ_4K);
 	}
 
+	if (!(flags & FAULT) && flags & PREFETCH) {
+		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
+
+		aligned_alloc_type = __aligned_alloc(SZ_4K, SZ_4K);
+		prefetch_ufence = aligned_alloc_type.ptr;
+		igt_assert(prefetch_ufence);
+		__aligned_partial_free(&aligned_alloc_type);
+
+		prefetch_sync = xe_bo_create(fd, vm, SZ_4K, system_memory(fd),
+					     bo_flags);
+		prefetch_ufence = xe_bo_map_fixed(fd, prefetch_sync, SZ_4K,
+						  to_user_pointer(prefetch_ufence));
+
+		sync[0].addr = to_user_pointer(prefetch_ufence);
+
+		pf_count = xe_gt_stats_get_count(fd, eci->gt_id, pf_count_stat);
+
+		if (flags & (RACE | FILE_BACKED |
+			     LOCK | MMAP_SHARED | HUGE_PAGE) || !region) {
+			region = 0;
+			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
+					     1, region);
+			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
+				       FIVE_SEC);
+			prefetch_ufence[0] = 0;
+		}
+
+		if (exec_ufence) {
+			xe_vm_prefetch_async(fd, vm, 0, 0,
+					     to_user_pointer(exec_ufence),
+					     SZ_4K, sync, 1, 0);
+			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
+				       FIVE_SEC);
+			prefetch_ufence[0] = 0;
+		}
+	}
+
 	for (i = 0; i < n_execs; i++) {
 		int idx = !stride ? i : i * stride, next_idx = !stride
 			? (i + 1) : (i + 1) * stride;
@@ -1186,6 +1241,25 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		if (!exec_ufence)
 			data[idx].exec_sync = 0;
 
+		if (!(flags & FAULT) && flags & PREFETCH &&
+		    (region || flags & (NEW | MREMAP))) {
+			struct timespec tv = {};
+			u64 start, end;
+
+			sync[0].addr = to_user_pointer(prefetch_ufence);
+
+			start = igt_nsec_elapsed(&tv);
+			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
+					     1, region);
+			end = igt_nsec_elapsed(&tv);
+
+			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
+				       FIVE_SEC);
+			prefetch_ufence[0] = 0;
+
+			prefetch_ns += (end - start);
+		}
+
 		sync[0].addr = exec_ufence ? to_user_pointer(exec_ufence) :
 			addr + (char *)&data[idx].exec_sync - (char *)data;
 
@@ -1277,6 +1351,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				} else {
 					igt_assert_eq(data[idx].data,
 						      READ_VALUE(&data[idx]));
+					if (flags & PREFETCH_BENCHMARK)
+						memset(data, 0, bo_size);
 
 					if (flags & MULTI_FAULT) {
 						for (j = 1; j < N_MULTI_FAULT; ++j) {
@@ -1359,6 +1435,26 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		prev_idx = idx;
 	}
 
+	if (flags & PREFETCH_BENCHMARK)
+		igt_info("Prefetch execution took %.3fms, %.1f5 GB/s\n",
+			 1e-6 * prefetch_ns,
+			 bo_size * n_execs  / (float)prefetch_ns);
+
+	if (!(flags & FAULT) && flags & PREFETCH &&
+	    (flags & MMAP || !(flags & (NEW | THREADS | PROCESSES)))) {
+		int pf_count_after = xe_gt_stats_get_count(fd, eci->gt_id,
+							   pf_count_stat);
+
+		/*
+		 * Due how system allocations work, we can't make this check
+		 * 100% reliable, rather than fail the test, just print a
+		 * warning message.
+		 */
+		if (pf_count != pf_count_after)
+			igt_warn("pf_count(%d) != pf_count_after(%d)\n",
+				 pf_count, pf_count_after);
+	}
+
 	if (bo) {
 		__xe_vm_bind_assert(fd, vm, 0,
 				    0, 0, addr, bo_size,
@@ -1370,6 +1466,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		gem_close(fd, bo);
 	}
 
+	if (prefetch_sync) {
+		munmap(prefetch_ufence, SZ_4K);
+		gem_close(fd, prefetch_sync);
+	}
+
 	if (flags & BUSY)
 		igt_assert_eq(unbind_system_allocator(), -EBUSY);
 
@@ -1435,7 +1536,7 @@ static void *thread(void *data)
 
 	test_exec(t->fd, t->eci, t->n_exec_queues, t->n_execs,
 		  t->bo_size, t->stride, t->vm, t->alloc, t->barrier,
-		  t->flags);
+		  t->flags | THREADS);
 
 	return NULL;
 }
@@ -1553,7 +1654,7 @@ static void process(struct drm_xe_engine_class_instance *hwe, int n_exec_queues,
 
 	fd = drm_open_driver(DRIVER_XE);
 	test_exec(fd, hwe, n_exec_queues, n_execs,
-		  bo_size, stride, 0, NULL, NULL, flags);
+		  bo_size, stride, 0, NULL, NULL, flags | PROCESSES);
 	drm_close_driver(fd);
 
 	close(map_fd);
@@ -1604,14 +1705,17 @@ igt_main
 	struct drm_xe_engine_class_instance *hwe;
 	const struct section sections[] = {
 		{ "malloc", 0 },
+		{ "malloc-prefetch", PREFETCH },
 		{ "malloc-multi-fault", MULTI_FAULT },
 		{ "malloc-fork-read", FORK_READ },
 		{ "malloc-fork-read-after", FORK_READ | FORK_READ_AFTER },
 		{ "malloc-mlock", LOCK },
 		{ "malloc-race", RACE },
+		{ "malloc-prefetch-race", RACE | PREFETCH },
 		{ "malloc-busy", BUSY },
 		{ "malloc-bo-unmap", BO_UNMAP },
 		{ "mmap", MMAP },
+		{ "mmap-prefetch", MMAP | PREFETCH },
 		{ "mmap-remap", MMAP | MREMAP },
 		{ "mmap-remap-dontunmap", MMAP | MREMAP | DONTUNMAP },
 		{ "mmap-remap-ro", MMAP | MREMAP | READ_ONLY_REMAP },
@@ -1626,6 +1730,7 @@ igt_main
 			READ_ONLY_REMAP | EVERY_OTHER_CHECK },
 		{ "mmap-huge", MMAP | HUGE_PAGE },
 		{ "mmap-shared", MMAP | LOCK | MMAP_SHARED },
+		{ "mmap-prefetch-shared", MMAP | LOCK | MMAP_SHARED | PREFETCH },
 		{ "mmap-shared-remap", MMAP | LOCK | MMAP_SHARED | MREMAP },
 		{ "mmap-shared-remap-dontunmap", MMAP | LOCK | MMAP_SHARED |
 			MREMAP | DONTUNMAP },
@@ -1640,6 +1745,7 @@ igt_main
 		{ "free", NEW | FREE },
 		{ "free-race", NEW | FREE | RACE },
 		{ "new", NEW },
+		{ "new-prefetch", NEW | PREFETCH },
 		{ "new-race", NEW | RACE },
 		{ "new-bo-map", NEW | BO_MAP },
 		{ "new-busy", NEW | BUSY },
@@ -1801,6 +1907,11 @@ igt_main
 			processes(fd, 16, 128, SZ_2M, 0, s->flags);
 	}
 
+	igt_subtest_f("prefetch-benchmark")
+		xe_for_each_engine(fd, hwe)
+			test_exec(fd, hwe, 1, 128, SZ_64M, 0, 0, NULL,
+				  NULL, PREFETCH | PREFETCH_BENCHMARK);
+
 	igt_subtest("threads-shared-vm-shared-alloc-many-stride-malloc")
 		threads(fd, 1, 128, 0, 256, SHARED_ALLOC, true);
 
-- 
2.34.1

