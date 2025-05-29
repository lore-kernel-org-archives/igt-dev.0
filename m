Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB5EC54FB3
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 11:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1039E10E20E;
	Thu, 29 May 2025 11:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="im8LU5sS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBEC110E20E
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 11:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748519563; x=1780055563;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=mEK+4Ke8fuafvmv/7LyMjNq6qDLnFJMypTPN+xUeVhQ=;
 b=im8LU5sS1+oWMTTuPnsgT5v8ArkNWk7apELsw8nIvqZEtNmzl/nl6h2S
 NZB31axOdJ33a7qFgtFEvB+8dHlNTP+q+LfsT82fE/bejGfd9RFMwSyJq
 wv7c14kcaXo17XXwQ/JmPijvbtx0I1Bhfic6ivvSM7llNdzQlU6qHWXWd
 LnfuyygzFa6bZXhU7x87hThQofo3WJ3euALEVI8B0SHbsQHQ39Vxec2Dn
 hBlasNHL9C7KEfl5778TQAIN/4kb9VcOSB8ig4kabnTp4ZkpmktMHsp0P
 RKzcg7OybDwReaR9xCtqGKC/r8jpGxbwG12n651XEpOhf4nzGGaT13CJi w==;
X-CSE-ConnectionGUID: XJ562WCGRjWe7mTaQczoGA==
X-CSE-MsgGUID: NQE+1r2MTl+tfY57j0j/tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50630500"
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="50630500"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 04:52:41 -0700
X-CSE-ConnectionGUID: ND+MlZ0qTSKNru/UrPHx8A==
X-CSE-MsgGUID: ScHMkP4PS9CIVnu2sIx9yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="144008379"
Received: from dut1130bmgfrd.igk.intel.com ([10.211.178.45])
 by fmviesa010.fm.intel.com with ESMTP; 29 May 2025 04:52:40 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com
Subject: [PATCH 1/2] tests/intel/xe_exec_system_allocator: Validate preftch of
 svm with single and multi ranges
Date: Thu, 29 May 2025 11:52:36 +0000
Message-Id: <20250529115237.25974-2-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529115237.25974-1-sai.gowtham.ch@intel.com>
References: <20250529115237.25974-1-sai.gowtham.ch@intel.com>
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

Tests validates Prefetch of SVM with single range and multiple ranges, with different
range of sizes. checks if not svm pagefaults are seen while prefetching the ranges of
svm.

v2: Enhance test to utilize smem/vram flags from the selection loop (Jonathan Cavitt)

v3: Integrate prefetch tests in exixting test_exec (Matthew Brost)

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 135 ++++++++++++++++++++-----
 1 file changed, 109 insertions(+), 26 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 06daac8c2..9596f7be3 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -20,6 +20,7 @@
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
 #include "xe_drm.h"
+#include "xe/xe_gt.c"
 
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
@@ -770,8 +771,11 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 #define SYNC_EXEC		(0x1 << 19)
 #define EVERY_OTHER_CHECK	(0x1 << 20)
 #define MULTI_FAULT		(0x1 << 21)
+#define PREFETCH		(0x1 << 22)
+#define VRAM			(0x1 << 23)
 
 #define N_MULTI_FAULT		4
+#define MAX_BATCH_DWORDS	16
 
 /**
  * SUBTEST: once-%s
@@ -957,7 +961,24 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
  * Description: Create multiple threads with a faults on different hardware engines to same addresses, racing between CPU and GPU access
  * Test category: stress test
  */
-
+/**
+ * SUBTEST: prefetch-%s
+ * Description: Test to validate functionality of Prefetch of SVM %arg[1]
+ * Test category: functionality test
+ *
+ * SUBTEST: multi-range-%s
+ * Description: Multi range Prefetch of SVM %arg[1] and  check if multiple ranges are created
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @smem-SZ_4K: with size of SZ_4K on smem region
+ * @smem-SZ_64K: with size of SZ_64K on smem region
+ * @smem-SZ_2M: with size of SZ_2M on smem region
+ * @vram-SZ_4K: with size of SZ_4K on vram region
+ * @vram-SZ_64K: with size of SZ_64K on vram region
+ * @vram-SZ_2M: with size of SZ_2M on vram region
+ */
 struct test_exec_data {
 	uint32_t batch[32];
 	uint64_t pad;
@@ -981,7 +1002,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	  size_t stride, uint32_t vm, void *alloc, pthread_barrier_t *barrier,
 	  unsigned int flags)
 {
-	uint64_t addr;
+	uint64_t addr, target_addr, ba_addr;
 	struct drm_xe_sync sync[1] = {
 		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	          .timeline_value = USER_FENCE_VALUE },
@@ -993,15 +1014,20 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	};
 	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
 	struct test_exec_data *data, *next_data = NULL;
-	uint32_t bo_flags;
+	uint32_t bo_flags, expected, *result_ptr, *batch;
 	uint32_t bo = 0;
 	void **pending_free;
 	u64 *exec_ufence = NULL;
-	int i, j, b, file_fd = -1, prev_idx;
+	int i, j, b, file_fd = -1, prev_idx, svm_pf_count_pre, svm_pf_count_pos;
 	bool free_vm = false;
 	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
 	size_t orig_size = bo_size;
+	size_t slice_size = bo_size;
 	struct aligned_alloc_type aligned_alloc_type;
+	const char *stat = "svm_pagefault_count";
+
+	if (flags & PREFETCH)
+		bo_size = bo_size * n_execs;
 
 	if (flags & MULTI_FAULT) {
 		if (!bo_size)
@@ -1134,7 +1160,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 	for (i = 0; i < n_execs; i++) {
 		int idx = !stride ? i : i * stride, next_idx = !stride
-			? (i + 1) : (i + 1) * stride;
+			  ? (i + 1) : (i + 1) * stride;
 		uint64_t batch_offset = (char *)&data[idx].batch - (char *)data;
 		uint64_t batch_addr = addr + batch_offset;
 		uint64_t sdi_offset = (char *)&data[idx].data - (char *)data;
@@ -1155,12 +1181,12 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			write_dword(data[idx].batch, sdi_addr + j * orig_size,
 				    WRITE_VALUE(&data[idx], idx), &b);
 			igt_assert(b <= ARRAY_SIZE(data[idx].batch));
-		} else if (!(flags & EVERY_OTHER_CHECK)) {
+		} else if (!(flags & EVERY_OTHER_CHECK) && !(flags & PREFETCH)) {
 			b = 0;
 			write_dword(data[idx].batch, sdi_addr,
 				    WRITE_VALUE(&data[idx], idx), &b);
 			igt_assert(b <= ARRAY_SIZE(data[idx].batch));
-		} else if (flags & EVERY_OTHER_CHECK && !odd(i)) {
+		} else if (flags & EVERY_OTHER_CHECK && !odd(i) && !(flags & PREFETCH)) {
 			b = 0;
 			write_dword(data[idx].batch, sdi_addr,
 				    WRITE_VALUE(&data[idx], idx), &b);
@@ -1177,28 +1203,36 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				    (char *)&data[next_idx].data - (char *)data,
 				    WRITE_VALUE(&data[next_idx], next_idx), &b);
 			igt_assert(b <= ARRAY_SIZE(data[next_idx].batch));
-		}
+		} else if ( flags & PREFETCH) {
+			batch = (uint32_t *)((uint8_t *)data + i * slice_size);
+			target_addr = addr + i * slice_size + 0x100;
+			b = 0;
 
-		if (!exec_ufence)
-			data[idx].exec_sync = 0;
+			igt_assert(b + 5 <= MAX_BATCH_DWORDS);
+			write_dword(batch, target_addr, 0xDEADBEEF + i, &b);
+		}
+		if (!(flags & PREFETCH)) {
+			if (!exec_ufence)
+				data[idx].exec_sync = 0;
 
-		sync[0].addr = exec_ufence ? to_user_pointer(exec_ufence) :
-			addr + (char *)&data[idx].exec_sync - (char *)data;
+			sync[0].addr = exec_ufence ? to_user_pointer(exec_ufence) :
+				       addr + (char *)&data[idx].exec_sync - (char *)data;
 
-		exec.exec_queue_id = exec_queues[e];
-		if (fault_inject)
-			exec.address = batch_addr * 2;
-		else
-			exec.address = batch_addr;
+			exec.exec_queue_id = exec_queues[e];
+			if (fault_inject)
+				exec.address = batch_addr * 2;
+			else
+				exec.address = batch_addr;
 
-		if (fault_injected) {
-			err = __xe_exec(fd, &exec);
-			igt_assert(err == -ENOENT);
-		} else {
-			xe_exec(fd, &exec);
+			if (fault_injected) {
+				err = __xe_exec(fd, &exec);
+				igt_assert(err == -ENOENT);
+			} else {
+				xe_exec(fd, &exec);
+			}
 		}
 
-		if (barrier)
+		if (barrier && ! (flags & PREFETCH))
 			pthread_barrier_wait(barrier);
 
 		if (fault_inject || fault_injected) {
@@ -1209,7 +1243,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 					       USER_FENCE_VALUE,
 					       exec_queues[e], &timeout);
 			igt_assert(err == -ETIME || err == -EIO);
-		} else {
+		} else if (!(flags & PREFETCH)){
 			xe_wait_ufence(fd, exec_ufence ? exec_ufence :
 				       &data[idx].exec_sync, USER_FENCE_VALUE,
 				       exec_queues[e], FIVE_SEC);
@@ -1289,8 +1323,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 						      READ_VALUE(&data[prev_idx]));
 			}
 		}
-
-		if (exec_ufence)
+		if (!(flags & PREFETCH) && exec_ufence)
 			exec_ufence[0] = 0;
 
 		if (bo) {
@@ -1355,6 +1388,31 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		prev_idx = idx;
 	}
 
+	if (flags & PREFETCH) {
+		sync[0].addr = to_user_pointer(exec_ufence);
+		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRAM ? 1 : 0);
+		xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+
+		for (i =0; i < n_execs; i++) {
+			int e = i % n_exec_queues;
+			result_ptr = (uint32_t *)((uint8_t *)data + i * slice_size + 0x100);
+			expected = 0xDEADBEEF + i;
+
+			svm_pf_count_pre = xe_gt_stats_get_count(fd, eci->gt_id, stat);
+			ba_addr = addr + i * slice_size;
+			exec.exec_queue_id = exec_queues[e];
+			exec.address = ba_addr;
+			exec_ufence[0] = 0;
+			sync[0].addr = to_user_pointer(exec_ufence);
+			xe_exec(fd, &exec);
+			svm_pf_count_pos = xe_gt_stats_get_count(fd, eci->gt_id, stat);
+			igt_assert(svm_pf_count_pre == svm_pf_count_pos);
+			xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, exec_queues[e], NSEC_PER_SEC);
+			exec_ufence[0] = 0;
+			igt_assert_eq(*result_ptr, expected);
+		}
+	}
+
 	if (bo) {
 		__xe_vm_bind_assert(fd, vm, 0,
 				    0, 0, addr, bo_size,
@@ -1598,6 +1656,19 @@ struct section {
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
+	const struct mode {
+		const char *name;
+		unsigned int flags;
+		size_t size;
+	} mode[] = {
+		{ "smem-SZ_4K", PREFETCH, SZ_4K},
+		{ "smem-SZ_64K", PREFETCH, SZ_64K},
+		{ "smem-SZ_2M", PREFETCH, SZ_2M},
+		{ "vram-SZ_4K", PREFETCH, SZ_4K},
+		{ "vram-SZ_64K", PREFETCH | VRAM, SZ_64K},
+		{ "vram-SZ_2M", PREFETCH | VRAM, SZ_2M},
+		{ NULL },
+	}, *m;
 	const struct section sections[] = {
 		{ "malloc", 0 },
 		{ "malloc-multi-fault", MULTI_FAULT },
@@ -1792,6 +1863,18 @@ igt_main
 			processes(fd, 16, 128, SZ_2M, 0, s->flags);
 	}
 
+	for (m = mode; m->name; m++) {
+                igt_subtest_f("prefetch-%s", m->name)
+                        xe_for_each_engine(fd, hwe)
+                                test_exec(fd, hwe, 1, 1, m->size, 0, 0, NULL,
+                                          NULL, m->flags);
+
+		igt_subtest_f("multi-range-%s", m->name)
+			xe_for_each_engine(fd, hwe)
+				test_exec(fd, hwe, 1, 10, m->size, 0, 0, NULL,
+					  NULL, m->flags);
+	}
+
 	igt_subtest("threads-shared-vm-shared-alloc-many-stride-malloc")
 		threads(fd, 1, 128, 0, 256, SHARED_ALLOC, true);
 
-- 
2.34.1

