Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FF2C87FD3
	for <igt-dev@archiver.kernel.org>; Fri,  8 Aug 2025 03:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB0810E1A1;
	Fri,  8 Aug 2025 03:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uo624Av8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD75110E8C2
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Aug 2025 03:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754623448; x=1786159448;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aQA6k9Fh09RSOlV7XB/lnv8pKaAy4DLNZC4t0MApIFY=;
 b=Uo624Av8iLWkGYl12LEtbCBYxXQyMBIyq/9ip9kUEAs1GXdJzFlKAkKD
 B11JPIkqpVzqYORSFmRwJZ0YrPY7EWaB77OuvBPHmNfBrW+48zIUp1aFN
 QCOT9iDyRiMmv3+1TvB0l0KpQF7pr6Ipi1uBACmLg74jPbFQHRk6+gCeD
 iq51BrYfmOg9E9jZ0LwyHBslDNmIIxuCFQT/TimMnCc+slG9sc1LsjN1h
 8+1avCv/NFXR11OmF34dShaI7iaJH8InxAHHrQpjEoqcGViEq6bUmAPR0
 +6QTQ/AaWR+bRj1L2XbJCIKOr6Am10DKzLFlVLqvU6gNNDQkhyCjKyXPG Q==;
X-CSE-ConnectionGUID: cf7kpv02Tqu3M4aPHteadw==
X-CSE-MsgGUID: qH90lY9ySMeTnJyutgfLjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="57101607"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="57101607"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 20:24:07 -0700
X-CSE-ConnectionGUID: d8T18gnnQQiggJOX1AYuIg==
X-CSE-MsgGUID: 1h2dfvTrTySSRqpSQ9Pk3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="169437040"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 20:24:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: francois.dugast@intel.com,
	himal.prasad.ghimiray@intel.com
Subject: [PATCH] tests/intel/xe_exec_system_allocator: Add
 prefetch-sys-benchmark
Date: Thu,  7 Aug 2025 20:24:02 -0700
Message-Id: <20250808032402.1652099-1-matthew.brost@intel.com>
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

Add prefetch-sys-benchmark to uses prefetch to system rather than
faulting it back and measures prefetch to system bandwidth in GB/s.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 42 +++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index dd5303855d..2703b7f1e1 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -775,6 +775,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 #define THREADS			(0x1 << 23)
 #define PROCESSES		(0x1 << 24)
 #define PREFETCH_BENCHMARK	(0x1 << 25)
+#define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
 
 #define N_MULTI_FAULT		4
 
@@ -955,6 +956,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
  * Description: Prefetch a 64M buffer 128 times, measure bandwidth of prefetch
  * Test category: performance test
  *
+ * SUBTEST: prefetch-sys-benchmark
+ * Description: Prefetch a 64M buffer 128 times, measure bandwidth of prefetch in both directions
+ * Test category: performance test
+ *
  * SUBTEST: threads-shared-vm-shared-alloc-many-stride-malloc
  * Description: Create multiple threads with a shared VM triggering faults on different hardware engines to same addresses
  * Test category: stress test
@@ -1022,7 +1027,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	struct aligned_alloc_type aligned_alloc_type;
 	uint32_t mem_region = vram_if_possible(fd, eci->gt_id);
 	uint32_t region = mem_region & 4 ? 2 : mem_region & 2 ? 1 : 0;
-	uint64_t prefetch_ns = 0;
+	uint64_t prefetch_ns = 0, prefetch_system_ns = 0;
 	const char *pf_count_stat = "svm_pagefault_count";
 
 	if (flags & MULTI_FAULT) {
@@ -1350,8 +1355,25 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				} else {
 					igt_assert_eq(data[idx].data,
 						      READ_VALUE(&data[idx]));
-					if (flags & PREFETCH_BENCHMARK)
+					if (flags & PREFETCH_SYS_BENCHMARK) {
+						struct timespec tv = {};
+						u64 start, end;
+
+						sync[0].addr = to_user_pointer(bind_ufence);
+
+						start = igt_nsec_elapsed(&tv);
+						xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
+								     1, 0);
+						end = igt_nsec_elapsed(&tv);
+
+						xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
+							       FIVE_SEC);
+						bind_ufence[0] = 0;
+
+						prefetch_system_ns += (end - start);
+					} else if (flags & PREFETCH_BENCHMARK) {
 						memset(data, 5, bo_size);
+					}
 
 					if (flags & MULTI_FAULT) {
 						for (j = 1; j < N_MULTI_FAULT; ++j) {
@@ -1438,11 +1460,17 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		prev_idx = idx;
 	}
 
-	if (flags & PREFETCH_BENCHMARK)
-		igt_info("Prefetch execution took %.3fms, %.1f5 GB/s\n",
+	if (flags & PREFETCH_BENCHMARK) {
+		igt_info("Prefetch VRAM execution took %.3fms, %.1f5 GB/s\n",
 			 1e-6 * prefetch_ns,
 			 bo_size * n_execs  / (float)prefetch_ns);
 
+		if (flags & PREFETCH_SYS_BENCHMARK)
+			igt_info("Prefetch SRAM execution took %.3fms, %.1f5 GB/s\n",
+				 1e-6 * prefetch_system_ns,
+				 bo_size * n_execs  / (float)prefetch_system_ns);
+	}
+
 	if (!(flags & FAULT) && flags & PREFETCH &&
 	    (flags & MMAP || !(flags & (NEW | THREADS | PROCESSES)))) {
 		int pf_count_after = xe_gt_stats_get_count(fd, eci->gt_id,
@@ -1917,6 +1945,12 @@ igt_main
 			test_exec(fd, hwe, 1, 128, SZ_64M, 0, 0, NULL,
 				  NULL, PREFETCH | PREFETCH_BENCHMARK);
 
+	igt_subtest_f("prefetch-sys-benchmark")
+		xe_for_each_engine(fd, hwe)
+			test_exec(fd, hwe, 1, 128, SZ_64M, 0, 0, NULL,
+				  NULL, PREFETCH | PREFETCH_BENCHMARK |
+				  PREFETCH_SYS_BENCHMARK);
+
 	igt_subtest("threads-shared-vm-shared-alloc-many-stride-malloc")
 		threads(fd, 1, 128, 0, 256, SHARED_ALLOC, true);
 
-- 
2.34.1

