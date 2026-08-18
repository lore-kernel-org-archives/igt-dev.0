Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCB2C5DF7D
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 14:30:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C82710E056;
	Tue, 18 Aug 2026 14:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bCxa0U6x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C24410E00B
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 14:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787063403; x=1818599403;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kL5Pg/DmfNGyz2WpK4o7Fm7wcgUCNzgqSdC6Appcgbg=;
 b=bCxa0U6xBz4PcFY/8dSACLYIIEZaeSr1ACMhwro4Gg8rW6YQL9cGUZ4l
 AEDzDaYYo3Xv581Sr0D4yf7429ejSyp4r2G3D6Xo0YnUaFjRVFq3Xecg9
 JF36/e9ZfB5oIbBz06cbTBCNkotjun3ZRf1ETrDQMAlxCWb1FpeaJatm7
 ikwLAP+TLDsSxwXWvqReYcjMMYFaVQyTHzGRHx6SM2rw11SUHIvYUpP2P
 BRmY6hiWq7bAWsfiZXzqGlIpB2reirCYNY/Dxty1p71XTQt5pnHGYw0SJ
 7kwGOQD74pURoQscp7r1Q4lsmx0MLr71jT7whlG1Xy+0y9SaTTYMBaH+t g==;
X-CSE-ConnectionGUID: KmgpyiX7QymLPZITcI5Usg==
X-CSE-MsgGUID: q/GUAWV3RSKAwFrIC4f3hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="99077757"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="99077757"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 07:30:03 -0700
X-CSE-ConnectionGUID: 7oj3N9/ASgayOQpVDyF7ig==
X-CSE-MsgGUID: Sr/RaYZeQwWO0hoEyuF9pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="288751710"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by fmviesa002.fm.intel.com with ESMTP; 18 Aug 2026 07:29:57 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Subject: [PATCH] tests/intel/xe_exec_system_allocator: fix
 prefetch-change-attr and DONTNEED flag handling
Date: Tue, 18 Aug 2026 14:29:56 +0000
Message-ID: <20260818142956.577956-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Nishit Sharma <nishit.sharma@intel.com>

These changes fixes the prefetch-change-attr test flow so the intended
prefetch and atomic-attribute transition execute in the correct path,
and it also switches the skip-results condition to use the proper internal
test flag (USE_MADV_DONTNEED) instead of the libc MADV_DONTNEED constant.
Together, these updates remove dead-path behavior, make the intent explicit
and improve reliability of the affected system-allocator IGT coverage
across platforms.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 6ca53aa5f..305512dfd 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -1395,6 +1395,9 @@ madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
 
 		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size / 2);
 
+		/* free 1st allocation in mem_attrs */
+		free(mem_attrs);
+
 		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
 		if (!mem_attrs) {
 			igt_info("Failed to get memory attributes\n");
@@ -1426,13 +1429,14 @@ madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
 		if (!mem_attrs) {
 			igt_info("Failed to get memory attributes\n");
 			return;
+		}
 
 		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0,
 				     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
 
 		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
 					  DRM_XE_ATOMIC_DEVICE);
-		}
+
 		free(mem_attrs);
 	}
 }
@@ -2333,7 +2337,7 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
 	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
 
 	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
-	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST) || (flags & MADV_DONTNEED);
+	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST) || (flags & USE_MADV_DONTNEED);
 	env.vm = vm;
 
 	read_gt_stats_snapshot(fd, eci, &stats_before);
-- 
2.43.0

