Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C402F01832
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 13:31:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A01B10ED43;
	Fri,  6 Mar 2026 13:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UeC4KdDj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750C310ED42
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 13:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772803882; x=1804339882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lYZIG0kj4oeYxMYFpG0aHuTX2a6ScwVmoS2qo1KpbeE=;
 b=UeC4KdDjd4p/6A9PlU7OfJ4HWbj7MScguZS+8syarbCMk+I+NlBK2P65
 7gCJfe6K/IsJlKxr4+gXneJlQ0Wep5foZswiYRlVxU2GSm/fp/PQtmQ33
 LRuJz4gH/NqBSattMrZNIWDx4yYjdzLFiPuFJD+ludngG/2X/FXQ2g5kl
 CXmgi9qKsY0bjZR3KOLNx5cexlwTZRrd6omne4rgYIFBtokyNzMKvtTH5
 KI/WirSqOZYj5rooH0uQ3Jey68N5fRkqL9kUtLBJQ6wtVsyhk8WLOWaYE
 jwO/Xo/OvcXYraSacjNXmu9Jo+997YsB80GOUz8loZDY013Lpt3/BCeyM g==;
X-CSE-ConnectionGUID: Qd4gzjZWSU+oF+iBHuc2pw==
X-CSE-MsgGUID: SDNzigx7RgCLW42mqbPOPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84236850"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="84236850"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:31:22 -0800
X-CSE-ConnectionGUID: xAjAqthzRGCPabrulBayvw==
X-CSE-MsgGUID: GTNMGsq8Q8WUM0MjE/Fsnw==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.208])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:31:20 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t,
 v2 4/4] tests/intel/xe_exec_system_allocator: Print page fault
 duration in compute
Date: Fri,  6 Mar 2026 14:29:12 +0100
Message-ID: <20260306133059.859625-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306133059.859625-1-francois.dugast@intel.com>
References: <20260306133059.859625-1-francois.dugast@intel.com>
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

Use GT stats in the compute test to display the GPU page fault handling
duration as this is a KPI use for performance optimization.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 39 ++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 7458b8572..bf3330002 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2211,6 +2211,24 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
 		reset_nr_hugepages();
 }
 
+struct xe_gt_stats_snapshot {
+	int svm_4K_pagefault_us;
+	int svm_64K_pagefault_us;
+	int svm_2M_pagefault_us;
+};
+
+static void read_gt_stats_snapshot(int fd,
+				   struct drm_xe_engine_class_instance *eci,
+				   struct xe_gt_stats_snapshot *snapshot)
+{
+	snapshot->svm_4K_pagefault_us =
+		xe_gt_stats_get_count(fd, eci->gt_id, "svm_4K_pagefault_us");
+	snapshot->svm_64K_pagefault_us =
+		xe_gt_stats_get_count(fd, eci->gt_id, "svm_64K_pagefault_us");
+	snapshot->svm_2M_pagefault_us =
+		xe_gt_stats_get_count(fd, eci->gt_id, "svm_2M_pagefault_us");
+}
+
 /* compute flags */
 #define TOUCH_ONCE		(0x1 << 0)
 #define ACCESS_DEVICE_HOST	(0x1 << 1)
@@ -2259,6 +2277,7 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
 		.array_size = size / sizeof(float),
 	};
 	float *compute_input;
+	struct xe_gt_stats_snapshot stats_before, stats_after;
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE | DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
 	bo_sync = aligned_alloc(xe_get_default_alignment(fd), sizeof(*bo_sync));
@@ -2270,6 +2289,8 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
 	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST);
 	env.vm = vm;
 
+	read_gt_stats_snapshot(fd, eci, &stats_before);
+
 	for (int i = 0; i < loops; i++) {
 		compute_input = aligned_alloc(size, size);
 		igt_assert(compute_input);
@@ -2282,6 +2303,24 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
 		free(compute_input);
 	}
 
+	read_gt_stats_snapshot(fd, eci, &stats_after);
+
+	if (flags & TOUCH_ONCE) {
+		if (size == SZ_4K) {
+			igt_info("  svm_4K_pagefault_us=%d\n",
+				 (stats_after.svm_4K_pagefault_us -
+				  stats_before.svm_4K_pagefault_us) / loops);
+		} else if (size == SZ_64K) {
+			igt_info("  svm_64K_pagefault_us=%d\n",
+				 (stats_after.svm_64K_pagefault_us -
+				  stats_before.svm_64K_pagefault_us) / loops);
+		} else if (size == SZ_2M) {
+			igt_info("  svm_2M_pagefault_us=%d\n",
+				 (stats_after.svm_2M_pagefault_us -
+				  stats_before.svm_2M_pagefault_us) / loops);
+		}
+	}
+
 	unbind_system_allocator();
 	xe_vm_destroy(fd, vm);
 }
-- 
2.43.0

