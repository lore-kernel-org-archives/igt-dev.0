Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726F6C3ABC3
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 17:07:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0119410E221;
	Tue, 13 May 2025 17:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UH6pZG13";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA3C10E039
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 17:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747156036; x=1778692036;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=mUhiTkjXlk50xIxaoawa2PoA4ekYrzH/HglKquB3fUA=;
 b=UH6pZG13rD2hwhoxj2clS3Y0kBY0hA6QV/V/1XAHvOBe1tF5mwx25i5O
 AM8B5f6aoNoY6SUXTSI20zitGCC2qhwGesz6EP7H1Aqa6I8z7oXUcfX5F
 cYK9vFJuQBiN5jzxDjyJU8vIjFYcnfVpNBs+PEa2wgKdyCYtusgieGZmD
 LI4+d5hokfNSpd/S0Qwx0lwFtWz5nfcPtkF4TDew32HeWEycPQTIWuuCb
 et466U3f1kQEFJeAnQ/AG2DRxGQVCulinKtV9W531VAFOYTdOwmHBxQPj
 CIKkWNTAqC5Ytj/eFepiMScawJFCgRpmwrmZ99dSojQ0pVrG7mmeaYipE Q==;
X-CSE-ConnectionGUID: N9R1g9rYRkSkH6YJ3ZVOFA==
X-CSE-MsgGUID: LZUKVXWqSrGJ1WAep49iXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48269609"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="48269609"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 10:07:16 -0700
X-CSE-ConnectionGUID: U0ycRuNGS8GCDFlIeOaw1w==
X-CSE-MsgGUID: ndA41c7MQ2KceMWB2WJvFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; d="scan'208";a="174894240"
Received: from dut1103bmgfrd.igk.intel.com ([10.211.177.128])
 by orviesa001.jf.intel.com with ESMTP; 13 May 2025 10:07:15 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 himal.prasad.ghimiray@intel.com, matthew.brost@intel.com
Subject: [PATCH 2/3] tests/intel/xe_exec_system_allocator: Validate preftch of
 svm with single and multi ranges
Date: Tue, 13 May 2025 17:07:10 +0000
Message-Id: <20250513170711.14518-3-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513170711.14518-1-sai.gowtham.ch@intel.com>
References: <20250513170711.14518-1-sai.gowtham.ch@intel.com>
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

Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 126 +++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index ba11ed834..c3f0e61f3 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -20,6 +20,7 @@
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
 #include "xe_drm.h"
+#include "xe/xe_gt.c"
 
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
@@ -139,6 +140,7 @@ static void signal_pdata(struct process_data *pdata)
 #define CPU_FAULT_THREADS	(0x1 << 2)
 #define CPU_FAULT_PROCESS	(0x1 << 3)
 #define CPU_FAULT_SAME_PAGE	(0x1 << 4)
+#define VRAM            	(0x1 << 5)
 
 static void process_check(void *ptr, uint64_t alloc_size, uint64_t stride,
 			  unsigned int flags)
@@ -464,6 +466,106 @@ static void test_basic(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_exec_queue_destroy(fd, exec_queues);
 	xe_vm_destroy(fd, vm);
 }
+
+/**
+ * SUBTEST: prefetch-smem-%s
+ * Description: Test to validate functionality of Prefetch using SVM of size arg[1] at smem region
+ * Test category: functionality test
+ *
+ * SUBTEST: prefetch-vram-%s
+ * Description: Test to validate functionality of Prefetch using SVM of size arg[1] at vram region
+ * Test category: functionality test
+ *
+ * SUBTEST: multi-range-smem-%s
+ * Description: Prefetch of mutliple ranges within arg[1] size to validate multiple ranges are created
+ * Test category: functionality test
+ *
+ * SUBTEST: multi-range-vram-%s
+ * Description: Prefetch of mutliple ranges within arg[1] size and check if multiple ranges are created
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @SZ_4K: SZ_4K
+ * @SZ_64K: SZ_64K
+ * @SZ_2M: SZ_2M
+ */
+#define MAX_BATCH_DWORDS 16
+static void prefetch(int fd, struct drm_xe_engine_class_instance *eci,
+		     size_t bo_size, unsigned int flags, int num_dwords)
+{
+	struct batch_data *data;
+	uint64_t target_addr;
+	uint64_t addr;
+	u64 *exec_ufence = NULL;
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(sync),
+	};
+	size_t slice_size = bo_size;
+	uint64_t batch_addr;
+	uint32_t exec_queues, expected, vm, *result_ptr, *batch;
+	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
+	const char *stat = "svm_pagefault_count";
+	int b, svm_pf_count_pre, svm_pf_count_pos;
+
+	bo_size = bo_size * num_dwords;
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	data = aligned_alloc(aligned_size, bo_size);
+	memset(data, 0, bo_size);
+	addr = to_user_pointer(data);
+
+	exec_queues = xe_exec_queue_create(fd, vm, eci, 0);
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	bind_system_allocator(sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+	data[0].vm_sync = 0;
+	exec_ufence = mmap(NULL, SZ_4K, PROT_READ |
+				 PROT_WRITE, MAP_SHARED |
+				 MAP_ANONYMOUS, -1, 0);
+	igt_assert(exec_ufence != MAP_FAILED);
+	memset(exec_ufence, 0, SZ_4K);
+
+	for (int i = 0; i < num_dwords; i++) {
+		batch = (uint32_t *)((uint8_t *)data + i * slice_size);
+		target_addr = addr + i * slice_size + 0x100;
+		b = 0;
+
+		igt_assert(b + 5 <= MAX_BATCH_DWORDS);
+		write_dword(batch, target_addr, 0xDEADBEEF + i, &b);
+	}
+	sync[0].addr = to_user_pointer(exec_ufence);
+	xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRAM ? 1 : 0);
+	xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+	exec.exec_queue_id = exec_queues;
+
+	for (int i = 0; i < num_dwords; i++) {
+		result_ptr = (uint32_t *)((uint8_t *)data + i * slice_size + 0x100);
+		expected = 0xDEADBEEF + i;
+
+		svm_pf_count_pre = xe_gt_stats_get_count(fd, eci->gt_id, stat);
+		batch_addr = addr + i * slice_size;
+		exec.address = batch_addr;
+		exec_ufence[0] = 0;
+		sync[0].addr = to_user_pointer(exec_ufence);
+		xe_exec(fd, &exec);
+		svm_pf_count_pos = xe_gt_stats_get_count(fd, eci->gt_id, stat);
+		igt_assert(svm_pf_count_pre == svm_pf_count_pos);
+		xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, exec_queues, NSEC_PER_SEC);
+		exec_ufence[0] = 0;
+		igt_assert_eq(*result_ptr, expected);
+	}
+	xe_exec_queue_destroy(fd, exec_queues);
+	unbind_system_allocator();
+	munmap(data, bo_size);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: unaligned-alloc
  * Description: allocate unaligned sizes of memory
@@ -1658,6 +1760,16 @@ igt_main
 {
 	struct drm_xe_engine *engine;
 	struct drm_xe_engine_class_instance *hwe;
+	const struct mode {
+		const char *name;
+		size_t size;
+	} mode[] = {
+		{ "SZ_4K", SZ_4K},
+		{ "SZ_64K", SZ_64K},
+		{ "SZ_2M", SZ_2M},
+		{},
+	}, *m;
+
 	const struct section sections[] = {
 		{ "malloc", 0 },
 		{ "malloc-multi-fault", MULTI_FAULT },
@@ -1931,6 +2043,20 @@ igt_main
 			processes_evict(fd, SZ_8M, SZ_1M, s->flags);
 	}
 
+	for (m = mode; m->name; m++) {
+                igt_subtest_f("prefetch-smem-%s", m->name)
+                        prefetch(fd, &engine->instance, m->size, 0, 1);
+
+                igt_subtest_f("prefetch-vram-%s", m->name)
+                        prefetch(fd, &engine->instance, m->size, VRAM, 1);
+
+                igt_subtest_f("multi-range-smem-%s", m->name)
+                        prefetch(fd, &engine->instance, m->size, 0, 10);
+
+                igt_subtest_f("multi-range-vram-%s", m->name)
+                        prefetch(fd, &engine->instance, m->size, VRAM, 10);
+        }
+
 	igt_fixture {
 		xe_device_put(fd);
 		drm_close_driver(fd);
-- 
2.34.1

