Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F56D116F3
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 04:38:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8D910E713;
	Fri, 28 Nov 2025 04:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QUs5hS19";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A391810E0D7
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 04:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764304724; x=1795840724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YqkO/2SN+eRN7jjmV+2KJAX11gEfIvTQr15tHjkKxF4=;
 b=QUs5hS19bFkDw8mMqV/AcG5kG2BL6qBqTdLv/D5IVAA1oZsyIbURHkKy
 7EyMs2Sp9e0g3CrA7A7Ek8plQeJ8va49COVBPsVznL5N4zDXlHGOm2SnG
 Shw/KAB17z1T1M8P7PUhc7f8aOPwRWw4GPHJp3bKGGPvbAz+jsTD+oucE
 0soMX4OXcu1fo3OeZD8ddIb2U4678C52qWMJfT2tD1iM2rL6ZYHak8O3l
 16pg5zrRGh66XqV+sxLcjeFvc4f/41kKgK2ok5ctcvhbU5UZxCjsD7i+9
 M91du/t4KVHnyhX4KMthLb+i0hZvQpPaZEhUnsnIwXaM27tCSQo5yM8we Q==;
X-CSE-ConnectionGUID: 3qDYwNYRTSCVsL14gPvNpQ==
X-CSE-MsgGUID: +Pk7BNzbSPuHIfQ4v7nKJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="70200652"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="70200652"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 20:38:44 -0800
X-CSE-ConnectionGUID: SL5GV+sNRPe1fhTGaTQFgw==
X-CSE-MsgGUID: CXSfEPD8RyCllgpDfn5Z0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="197852071"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 20:38:44 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nishit.sharma@intel.com, kamil.konieczny@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v3 1/1] tests/intel/xe_exec_system_allocator: Added 64k
 alignment support
Date: Fri, 28 Nov 2025 04:38:32 +0000
Message-ID: <20251128043832.322810-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251128043832.322810-1-sobin.thomas@intel.com>
References: <20251128043832.322810-1-sobin.thomas@intel.com>
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

ver2:
 - Added check for PVC.

ver3:
 - Moved declarations in MADVISE_SPLIT_VMA scope. (Nishit)

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index b88967e58..c54a52690 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -1251,17 +1251,30 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
 	}
 
 	if (flags & MADVISE_SPLIT_VMA) {
+		uint16_t dev_id = intel_get_drm_devid(fd);
+		uint64_t split_addr, split_size;
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
@@ -1269,7 +1282,7 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
 		gem_close(fd, bo);
 		bo = 0;
 
-		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size / 2,
+		xe_vm_madvise_atomic_attr(fd, vm, split_addr, split_size,
 					  DRM_XE_ATOMIC_GLOBAL);
 	}
 
-- 
2.51.0

