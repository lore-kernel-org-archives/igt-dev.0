Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A98C7EE31
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 10:55:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE08010E571;
	Tue, 24 Jun 2025 10:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SUAmzBvb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D172A10E56B
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 10:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750762531; x=1782298531;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=14Secceu9tg/lbVb8AK1E9Ogiq6MldnDp5QJItV0zwA=;
 b=SUAmzBvby1ckKBo99kP+8CBUuXt4FOVUn1qoCryj0GveXeF056jRbfRc
 qbLg0zonyO2xOtuksnwbjH3I9jsCl5tloUBXOOpAsS4q3EGtb6AxEgwIH
 hNaYr/RiX7i2NxwEmOBTxFOD+uTyQdPJThAPMvKOY7cdQygDA7k+lOWz+
 t4TFnOrJmxw4G97x2PHOT8qLf1xsxO2EwhOTUCsX0YvZBciTHrH3EllBO
 7Kh96T2t13rtt01ylyFoSrtYkZQqI45H94mjQ6CiCni30L0ObzIuDF6/g
 kzhAN4pu+xcTYN3pqzVJ8KZdcJz7Hnn9T6PBQbZK3qVmGEnQbcJETn2yZ w==;
X-CSE-ConnectionGUID: mjUkWBrIRY+sG3nEPm1G8A==
X-CSE-MsgGUID: zyOMVTDeSzizktZyEqBZJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52226635"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="52226635"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 03:55:31 -0700
X-CSE-ConnectionGUID: 70HT7aZdRyCAhy8ddAW1ww==
X-CSE-MsgGUID: sUyA1ldXScyW4AcxY5fCSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="155909362"
Received: from dut1845bmgfrg.igk.intel.com ([10.211.177.128])
 by fmviesa003.fm.intel.com with ESMTP; 24 Jun 2025 03:55:30 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 matthew.brost@intel.com
Subject: [PATCH] tests/intel/xe_exec_system_allocator: Test to validate SVM
 prefetch ranges
Date: Tue, 24 Jun 2025 10:55:25 +0000
Message-Id: <20250624105525.17636-1-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Test validates prefetch ranges by updating test_exec funtion with flags
to initiate prefetch runs with different combinations of malloc, mmap,
race, threads and processes. Prefetching is tested by verifying that
the fault count in the GT stats has not increased.

A prefetch benchmark section has also been added to help profile
prefetch behavior  in the KMD.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 121 ++++++++++++++++++++++++-
 1 file changed, 116 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 2a99bd435..832ea29b8 100644
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
 
@@ -874,14 +879,17 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
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
@@ -892,6 +900,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
  * @mmap-remap-ro-dontunmap-eocheck:	mmap and mremap a read-only buffer with dontunmap flag for all execs, check data every other loop iteration
  * @mmap-huge:				mmap huge page single buffer for all execs
  * @mmap-shared:			mmap shared single buffer for all execs
+ * @mmap-prefetch-shared:		mmap shared single buffer for all execs, prefetch buffer before each exec
  * @mmap-shared-remap:			mmap shared and mremap a buffer for all execs
  * @mmap-shared-remap-dontunmap:	mmap shared and mremap a buffer with dontunmap flag for all execs
  * @mmap-shared-remap-eocheck:		mmap shared and mremap a buffer for all execs, check data every other loop iteration
@@ -903,6 +912,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
  * @free:				malloc and free buffer for each exec
  * @free-race:				malloc and free buffer for each exec with race between cpu and gpu access
  * @new:				malloc a new buffer for each exec
+ * @new-prefetch:			malloc a new buffer and prefetch for each exec
  * @new-race:				malloc a new buffer for each exec with race between cpu and gpu access
  * @new-bo-map:				malloc a new buffer or map BO for each exec
  * @new-busy:				malloc a new buffer for each exec, try to unbind while buffers valid
@@ -937,6 +947,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
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
@@ -994,14 +1008,18 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
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
@@ -1132,6 +1150,43 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
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
+			     LOCK | MMAP_SHARED | HUGE_PAGE)) {
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
@@ -1182,6 +1237,25 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
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
 
@@ -1273,6 +1347,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				} else {
 					igt_assert_eq(data[idx].data,
 						      READ_VALUE(&data[idx]));
+					if (flags & PREFETCH_BENCHMARK)
+						memset(data, 0, bo_size);
 
 					if (flags & MULTI_FAULT) {
 						for (j = 1; j < N_MULTI_FAULT; ++j) {
@@ -1355,6 +1431,26 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
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
+		 * Due to how system allocations work, we can't make this check
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
@@ -1366,6 +1462,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		gem_close(fd, bo);
 	}
 
+	if (prefetch_sync) {
+		munmap(prefetch_ufence, SZ_4K);
+		gem_close(fd, prefetch_sync);
+	}
+
 	if (flags & BUSY)
 		igt_assert_eq(unbind_system_allocator(), -EBUSY);
 
@@ -1431,7 +1532,7 @@ static void *thread(void *data)
 
 	test_exec(t->fd, t->eci, t->n_exec_queues, t->n_execs,
 		  t->bo_size, t->stride, t->vm, t->alloc, t->barrier,
-		  t->flags);
+		  t->flags | THREADS);
 
 	return NULL;
 }
@@ -1549,7 +1650,7 @@ static void process(struct drm_xe_engine_class_instance *hwe, int n_exec_queues,
 
 	fd = drm_open_driver(DRIVER_XE);
 	test_exec(fd, hwe, n_exec_queues, n_execs,
-		  bo_size, stride, 0, NULL, NULL, flags);
+		  bo_size, stride, 0, NULL, NULL, flags | PROCESSES);
 	drm_close_driver(fd);
 
 	close(map_fd);
@@ -1600,14 +1701,17 @@ igt_main
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
@@ -1622,6 +1726,7 @@ igt_main
 			READ_ONLY_REMAP | EVERY_OTHER_CHECK },
 		{ "mmap-huge", MMAP | HUGE_PAGE },
 		{ "mmap-shared", MMAP | LOCK | MMAP_SHARED },
+		{ "mmap-prefetch-shared", MMAP | LOCK | MMAP_SHARED | PREFETCH },
 		{ "mmap-shared-remap", MMAP | LOCK | MMAP_SHARED | MREMAP },
 		{ "mmap-shared-remap-dontunmap", MMAP | LOCK | MMAP_SHARED |
 			MREMAP | DONTUNMAP },
@@ -1636,6 +1741,7 @@ igt_main
 		{ "free", NEW | FREE },
 		{ "free-race", NEW | FREE | RACE },
 		{ "new", NEW },
+		{ "new-prefetch", NEW | PREFETCH },
 		{ "new-race", NEW | RACE },
 		{ "new-bo-map", NEW | BO_MAP },
 		{ "new-busy", NEW | BUSY },
@@ -1792,6 +1898,11 @@ igt_main
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

