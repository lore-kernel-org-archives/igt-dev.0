Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE378CFA466
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 04:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595D810E1C5;
	Mon, 24 Nov 2025 04:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cYXd6Hql";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1884610E05F
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 04:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763958514; x=1795494514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4DYUVLezomybk7I7RymfXbdjRJ2LiL5XhjmXNp/OLRU=;
 b=cYXd6HqlcL7qp7f9+dvDgGH3vvaARwYTTFH0PeefYgaqEliD3yreodj9
 ZVsvE3vHeQkxAIvRiYPw8OkPtTqbV525FcSOKP/k8FMKphMkTBC93oX9Y
 U0a7p1cZ5098j4IQTwo0W0wnZCNHRjPbMCkC21RlWEG+S97IatOnD0kLw
 TMSeMxti0qmcsGke8BWXzFI/sA5A9Xb9pRMJF5dhKJcBMqMjwXAG00wKL
 SKi7GgOncOpNTwRUPUjcIsJPG2sgPhoF1nUfCEF/g6t228m+CnCfD2nUe
 VlgEwKIXllDOD1iH4hR1WyW+gesS8/aokZndYAsb5qDMgIu8RWO9KZBK5 w==;
X-CSE-ConnectionGUID: 3smj0IR1QKOzZ8MmZv9pMg==
X-CSE-MsgGUID: Y00sXOVURMWQv5gleyvFNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76565270"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="76565270"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 20:28:34 -0800
X-CSE-ConnectionGUID: cum8kAwZSd6iiWZuMbiafg==
X-CSE-MsgGUID: clVcpSzHSFubYSqKgcN4gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="191891400"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 20:28:34 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nishit.sharma@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel/xe_exec_system_allocator: Added 64k
 alignment support
Date: Mon, 24 Nov 2025 04:28:21 +0000
Message-ID: <20251124042821.283623-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124042821.283623-1-sobin.thomas@intel.com>
References: <20251124042821.283623-1-sobin.thomas@intel.com>
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

The original test for madvise split vm only supported 4 KB alignment, 
which failed certain hardware such as PVC that required 64 KB page 
alignment. The test has been updated to include support for 64 KB 
page alignment.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index b88967e58..9530e07e7 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -1201,6 +1201,8 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
 			    struct drm_xe_sync *sync, uint8_t (*pat_value)(int))
 {
 	uint32_t bo_flags, bo = 0;
+	uint64_t split_addr, split_size;
+	uint64_t alignment;
 
 	if (flags & MADVISE_ATOMIC_DEVICE)
 		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
@@ -1251,17 +1253,29 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
 	}
 
 	if (flags & MADVISE_SPLIT_VMA) {
+		uint16_t dev_id = intel_get_drm_devid(fd);
+		uint64_t alignment = SZ_4K;
+
+		if (IS_PONTEVECCHIO(dev_id))
+			alignment = SZ_64K;
+
 		if (bo_size)
-			bo_size = ALIGN(bo_size, SZ_4K);
+			bo_size = ALIGN(bo_size, alignment);
+
+		split_addr = to_user_pointer(data) + bo_size/2;
+		split_addr = ALIGN(split_addr, alignment);
+		split_size = bo_size / 2;
+		split_size = ALIGN(split_size, alignment);
 
 		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
 		bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, eci->gt_id),
 				  bo_flags);
-		xe_vm_bind_async(fd, vm, 0, bo, 0, to_user_pointer(data) + bo_size / 2,
-				 bo_size / 2, 0, 0);
 
-		__xe_vm_bind_assert(fd, vm, 0, 0, 0, to_user_pointer(data) + bo_size / 2,
-				    bo_size / 2, DRM_XE_VM_BIND_OP_MAP,
+		xe_vm_bind_async(fd, vm, 0, bo, 0, split_addr,
+				 split_size, 0, 0);
+
+		__xe_vm_bind_assert(fd, vm, 0, 0, 0, split_addr,
+				    split_size, DRM_XE_VM_BIND_OP_MAP,
 				    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, sync,
 				    1, 0, 0);
 		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
@@ -1269,7 +1283,7 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
 		gem_close(fd, bo);
 		bo = 0;
 
-		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size / 2,
+		xe_vm_madvise_atomic_attr(fd, vm, split_addr, split_size,
 					  DRM_XE_ATOMIC_GLOBAL);
 	}
 
-- 
2.51.0

