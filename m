Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0687D46BE2
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 17:34:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606DC10E752;
	Wed, 28 Jan 2026 17:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DoQR6+qO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A0E10E752
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 17:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769621676; x=1801157676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TCx2qlGe4lDfARY7UbzCOH0lgRz2jLbR0H196loQW68=;
 b=DoQR6+qOgyawxpMw8zfgtnRw1TEQ5Hl+cDPx9QgNFan/V77h4kddnJsC
 ixP0aFHg450TiGlSUtoJ2eFjBI/ByY8EqUts/VS1zyn2URtEhsLCLsWEF
 ym4tFTYrmgOGIR3swIy43HwRMIMTkbrpEJkFDjtIH3Wx1Mlrfa33k+z+Q
 hLZu9d5nsn4PJkIND0IRWNyrHO6saLlDIVCQSmOBf7UYdImLZxPpAFxWL
 4rbY2i8A7gbG3fLzG+D1jBvhLGhW1iw9xegq6k00pjl3kFOLF8E8QN3JJ
 gErl5wRyFKAP2baNqXBsd7R62pkZMV5fcJg5YEHG1xaua9QnCeX2Vh8iC A==;
X-CSE-ConnectionGUID: zqBlsCMXRZK76do9ljzb9g==
X-CSE-MsgGUID: oPVgj8J0Qbmnp1qV72FPpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="82213477"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="82213477"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 09:34:36 -0800
X-CSE-ConnectionGUID: qsS9VEuWR1C/URci/3HNbQ==
X-CSE-MsgGUID: YqFqTfgTT+iEAUX6EEfLug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="245927213"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.217])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 09:34:35 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 5/5] tests/intel/xe_exec_system_allocator: Print page
 fault duration in compute
Date: Wed, 28 Jan 2026 18:29:10 +0100
Message-ID: <20260128173412.1319610-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128173412.1319610-1-francois.dugast@intel.com>
References: <20260128173412.1319610-1-francois.dugast@intel.com>
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

Extend use of GT stats in the compute test to display the GPU page fault
handling duration as this is a KPI use for performance optimization.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index e45165acd..18ea6e7fe 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2183,6 +2183,10 @@ struct xe_gt_stats_snapshot {
 	int svm_2M_migrate_count;
 
 	int svm_device_copy_kb;
+
+	int svm_4K_pagefault_us;
+	int svm_64K_pagefault_us;
+	int svm_2M_pagefault_us;
 };
 
 static void read_gt_stats_snapshot(int fd,
@@ -2205,6 +2209,13 @@ static void read_gt_stats_snapshot(int fd,
 
 	snapshot->svm_device_copy_kb =
 		xe_gt_stats_get_count(fd, eci->gt_id, "svm_device_copy_kb");
+
+	snapshot->svm_4K_pagefault_us =
+		xe_gt_stats_get_count(fd, eci->gt_id, "svm_4K_pagefault_us");
+	snapshot->svm_64K_pagefault_us =
+		xe_gt_stats_get_count(fd, eci->gt_id, "svm_64K_pagefault_us");
+	snapshot->svm_2M_pagefault_us =
+		xe_gt_stats_get_count(fd, eci->gt_id, "svm_2M_pagefault_us");
 }
 
 /* compute flags */
@@ -2257,6 +2268,8 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
 	float *compute_input;
 	struct xe_gt_stats_snapshot stats_before, stats_after;
 
+	igt_assert(loops);
+
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
 	bo_sync = aligned_alloc(xe_get_default_alignment(fd), sizeof(*bo_sync));
 	sync.addr = to_user_pointer(&bo_sync->sync);
@@ -2298,6 +2311,10 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
 				      stats_before.svm_64K_migrate_count);
 			igt_assert_eq(stats_after.svm_2M_migrate_count,
 				      stats_before.svm_2M_migrate_count);
+
+			igt_info("  svm_4K_pagefault_us=%d\n",
+				 (stats_after.svm_4K_pagefault_us -
+				  stats_before.svm_4K_pagefault_us) / loops);
 		} else if (size == SZ_64K) {
 			igt_assert_eq(stats_after.svm_4K_pagefault_count,
 				      stats_before.svm_4K_pagefault_count);
@@ -2312,6 +2329,10 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
 				      stats_before.svm_64K_migrate_count + loops);
 			igt_assert_eq(stats_after.svm_2M_migrate_count,
 				      stats_before.svm_2M_migrate_count);
+
+			igt_info("  svm_64K_pagefault_us=%d\n",
+				 (stats_after.svm_64K_pagefault_us -
+				  stats_before.svm_64K_pagefault_us) / loops);
 		} else if (size == SZ_2M) {
 			igt_assert_eq(stats_after.svm_4K_pagefault_count,
 				      stats_before.svm_4K_pagefault_count);
@@ -2326,6 +2347,10 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
 				      stats_before.svm_64K_migrate_count);
 			igt_assert_eq(stats_after.svm_2M_migrate_count,
 				      stats_before.svm_2M_migrate_count + loops);
+
+			igt_info("  svm_2M_pagefault_us=%d\n",
+				 (stats_after.svm_2M_pagefault_us -
+				  stats_before.svm_2M_pagefault_us) / loops);
 		}
 
 		igt_assert_eq(stats_after.svm_device_copy_kb,
-- 
2.43.0

