Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291AFD46BE1
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 17:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AA810E74E;
	Wed, 28 Jan 2026 17:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5Miw6QA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CA310E74E
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 17:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769621675; x=1801157675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=euv0qrDTntCAfKZnjw2d99JS3pye2vkR7vfUEeDNXEY=;
 b=d5Miw6QAMk+m0Grzo7WexsW4Qo3id/X2Twaq+rTgTAt0banPYvR1ImRB
 yTFXB9Svx2MkJ7CiPkcSs9dI4BeYjpPk8e/H78jYZtt4gL2QVkDsrkoaY
 9hrG2oEKExMKcnZ4EqVv9gHVp+g/MgkGyRZQNBAk2FjMXz4UeijkFAt8n
 D/BIIZ2bfLG1Fym4QU7dgHuzp9AxvTIB+vRzy2P3FdHfam+s/JlQIuiUH
 G9GCtKOMjzY0JjcY6Sz5gafGWcJYZW7iaQejWo+tppcZ15S3ziUSAuh4d
 meOL4euT7Z1SeL2M9RirOktX//loeYhZQ8vIZyLo/1BlYoGJk9ACWCv8G Q==;
X-CSE-ConnectionGUID: ZZ4+n21sShqISFrVfLwbkA==
X-CSE-MsgGUID: FrEnhiUwQWmiK9QHDQ0grg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="82213468"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="82213468"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 09:34:35 -0800
X-CSE-ConnectionGUID: Y4j3Xqg4RumLN9P1Ugr8Pw==
X-CSE-MsgGUID: 7IcGuqX7QoeQPdtVhv9iSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="245927204"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.217])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 09:34:34 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 4/5] tests/intel/xe_exec_system_allocator: Assert page
 fault count in compute
Date: Wed, 28 Jan 2026 18:29:09 +0100
Message-ID: <20260128173412.1319610-5-francois.dugast@intel.com>
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

With TOUCH_ONCE the page fault count should be deterministic so make use
of existing GT stats to assert that the memory was indeed touched by the
GPU and consequently triggered a page fault with migration of the correct
size.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 88 ++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index d577eb4f3..e45165acd 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2173,6 +2173,40 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
 	munmap(pdata, sizeof(*pdata));
 }
 
+struct xe_gt_stats_snapshot {
+	int svm_4K_pagefault_count;
+	int svm_64K_pagefault_count;
+	int svm_2M_pagefault_count;
+
+	int svm_4K_migrate_count;
+	int svm_64K_migrate_count;
+	int svm_2M_migrate_count;
+
+	int svm_device_copy_kb;
+};
+
+static void read_gt_stats_snapshot(int fd,
+				   struct drm_xe_engine_class_instance *eci,
+				   struct xe_gt_stats_snapshot *snapshot)
+{
+	snapshot->svm_4K_pagefault_count =
+		xe_gt_stats_get_count(fd, eci->gt_id, "svm_4K_pagefault_count");
+	snapshot->svm_64K_pagefault_count =
+		xe_gt_stats_get_count(fd, eci->gt_id, "svm_64K_pagefault_count");
+	snapshot->svm_2M_pagefault_count =
+		xe_gt_stats_get_count(fd, eci->gt_id, "svm_2M_pagefault_count");
+
+	snapshot->svm_4K_migrate_count =
+		xe_gt_stats_get_count(fd, eci->gt_id, "svm_4K_migrate_count");
+	snapshot->svm_64K_migrate_count =
+		xe_gt_stats_get_count(fd, eci->gt_id, "svm_64K_migrate_count");
+	snapshot->svm_2M_migrate_count =
+		xe_gt_stats_get_count(fd, eci->gt_id, "svm_2M_migrate_count");
+
+	snapshot->svm_device_copy_kb =
+		xe_gt_stats_get_count(fd, eci->gt_id, "svm_device_copy_kb");
+}
+
 /* compute flags */
 #define TOUCH_ONCE		(0x1 << 0)
 #define ACCESS_DEVICE_HOST	(0x1 << 1)
@@ -2221,6 +2255,7 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
 		.array_size = size / sizeof(float),
 	};
 	float *compute_input;
+	struct xe_gt_stats_snapshot stats_before, stats_after;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
 	bo_sync = aligned_alloc(xe_get_default_alignment(fd), sizeof(*bo_sync));
@@ -2232,6 +2267,8 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
 	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST);
 	env.vm = vm;
 
+	read_gt_stats_snapshot(fd, eci, &stats_before);
+
 	for (int i = 0; i < loops; i++) {
 		compute_input = aligned_alloc(size, size);
 		igt_assert(compute_input);
@@ -2244,6 +2281,57 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
 		free(compute_input);
 	}
 
+	read_gt_stats_snapshot(fd, eci, &stats_after);
+
+	if (flags & TOUCH_ONCE) {
+		if (size == SZ_4K) {
+			igt_assert_eq(stats_after.svm_4K_pagefault_count,
+				      stats_before.svm_4K_pagefault_count + loops);
+			igt_assert_eq(stats_after.svm_64K_pagefault_count,
+				      stats_before.svm_64K_pagefault_count);
+			igt_assert_eq(stats_after.svm_2M_pagefault_count,
+				      stats_before.svm_2M_pagefault_count);
+
+			igt_assert_eq(stats_after.svm_4K_migrate_count,
+				      stats_before.svm_4K_migrate_count + loops);
+			igt_assert_eq(stats_after.svm_64K_migrate_count,
+				      stats_before.svm_64K_migrate_count);
+			igt_assert_eq(stats_after.svm_2M_migrate_count,
+				      stats_before.svm_2M_migrate_count);
+		} else if (size == SZ_64K) {
+			igt_assert_eq(stats_after.svm_4K_pagefault_count,
+				      stats_before.svm_4K_pagefault_count);
+			igt_assert_eq(stats_after.svm_64K_pagefault_count,
+				      stats_before.svm_64K_pagefault_count + loops);
+			igt_assert_eq(stats_after.svm_2M_pagefault_count,
+				      stats_before.svm_2M_pagefault_count);
+
+			igt_assert_eq(stats_after.svm_4K_migrate_count,
+				      stats_before.svm_4K_migrate_count);
+			igt_assert_eq(stats_after.svm_64K_migrate_count,
+				      stats_before.svm_64K_migrate_count + loops);
+			igt_assert_eq(stats_after.svm_2M_migrate_count,
+				      stats_before.svm_2M_migrate_count);
+		} else if (size == SZ_2M) {
+			igt_assert_eq(stats_after.svm_4K_pagefault_count,
+				      stats_before.svm_4K_pagefault_count);
+			igt_assert_eq(stats_after.svm_64K_pagefault_count,
+				      stats_before.svm_64K_pagefault_count);
+			igt_assert_eq(stats_after.svm_2M_pagefault_count,
+				      stats_before.svm_2M_pagefault_count + loops);
+
+			igt_assert_eq(stats_after.svm_4K_migrate_count,
+				      stats_before.svm_4K_migrate_count);
+			igt_assert_eq(stats_after.svm_64K_migrate_count,
+				      stats_before.svm_64K_migrate_count);
+			igt_assert_eq(stats_after.svm_2M_migrate_count,
+				      stats_before.svm_2M_migrate_count + loops);
+		}
+
+		igt_assert_eq(stats_after.svm_device_copy_kb,
+			      stats_before.svm_device_copy_kb + (loops * size / 1024));
+	}
+
 	unbind_system_allocator();
 	xe_vm_destroy(fd, vm);
 }
-- 
2.43.0

