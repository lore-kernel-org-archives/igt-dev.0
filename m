Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72117F94CD7
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 06:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D368933E;
	Wed, 22 Apr 2026 06:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GdWQ17LF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0458610E889
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 06:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776840863; x=1808376863;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O+tJQFBqzsV+BtXT6a8XGppdN0SCtlAYaLY6K9/uRZ0=;
 b=GdWQ17LFVjouKFmrYWqOA+xuoFqeehWhxnWEv042l3nzcVc3HXdwLAgT
 Y8zcAQaaGd7KYlGf3X0So5xlcIb3eblE6l3ZidN64kSumf+TS3WNOguJ6
 Ssl1XxYdtkd76x41C4OZ3TI4zcOVpgCITz49uO6IdiTCOrT/vWKIf+rgA
 e2jIrwswC+rT+dHB9tGy7YNNr/pX0Pb4fz9rXEiobc67IUWYNyo/vWIbW
 588KZMXmL4SlrGaMyQGpOHHo7jEdNDtuzF3ds9HwMgW5dYWgUsIpdxGZT
 W1TGItp/iAjCagtMpGlTD/etBUg75q6h0yQHSTPHBptyrVlDT6LXsTeO+ A==;
X-CSE-ConnectionGUID: QcIlVhrgQqK2lHN/wl4pZQ==
X-CSE-MsgGUID: IQ1BzbW6TLKGgxSVR0iQAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="100441933"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="100441933"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 23:54:23 -0700
X-CSE-ConnectionGUID: B7MN9puLS+GOt0n6A5t0uA==
X-CSE-MsgGUID: YYGiLuveT0izxt2tleNYsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="232178267"
Received: from jiayao1-desk.fm.intel.com ([10.121.64.108])
 by orviesa008.jf.intel.com with ESMTP; 21 Apr 2026 23:54:23 -0700
From: Jia Yao <jia.yao@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Nishit Sharma <nishit.sharma@intel.com>, Xin Wang <x.wang@intel.com>
Subject: [PATCH v7] tests/intel/xe_exec_system_allocator: Expect UC PAT
 madvise rejection
Date: Tue, 21 Apr 2026 23:54:12 -0700
Message-ID: <20260422065412.406536-1-jia.yao@intel.com>
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

UC PAT index with CPU cached memory (system allocator) is now rejected
by kernel to prevent security issues where GPU could bypass CPU cache
and read stale sensitive data from DRAM.

Modify UC PAT index tests to verify kernel correctly rejects the madvise
call with -EINVAL, instead of attempting to execute batch buffers.

v2(Xin Wang)
- Put madvise rejection in a function

v3:
- Add multi-vma check in the function

v4(Xin Wang)
- Implement reject function inside test_exec

v5(Xin Wang)
- Some optimize

v6:
- wt is also judeged as coh_none inside kernel, need rejection too

v7:
- limited the change to iGPU only

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Xin Wang <x.wang@intel.com>
Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 57 +++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index ee199dd15..5580099f7 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -1216,7 +1216,7 @@ xe_vm_madvise_migrate_pages(int fd, uint32_t vm, uint64_t addr, uint64_t range)
 		      DRM_XE_MIGRATE_ALL_PAGES, 0);
 }
 
-static void
+static bool
 xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
 			    size_t bo_size,
 			    struct drm_xe_engine_class_instance *eci,
@@ -1312,33 +1312,64 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
 	if (flags & MADVISE_PAT_INDEX) {
 		uint32_t num_ranges;
 		struct drm_xe_mem_range_attr *mem_attrs;
+		uint8_t pat_idx = pat_value(fd);
+		bool is_uc_pat = (pat_value == intel_get_pat_idx_wt ||
+				  pat_value == intel_get_pat_idx_uc ||
+				  pat_value == intel_get_pat_idx_uc_comp);
+		int err;
 
 		if (bo_size)
 			bo_size = ALIGN(bo_size, SZ_4K);
 
+		if (is_uc_pat && !xe_has_vram(fd)) {
+			/* UC PAT should be rejected by kernel for CPU cached memory (iGPU only) */
+			if (flags & MADVISE_MULTI_VMA) {
+				err = __xe_vm_madvise(fd, vm, to_user_pointer(data) + bo_size,
+						      bo_size / 2, 0, DRM_XE_MEM_RANGE_ATTR_PAT,
+						      pat_idx, 0, 0);
+				igt_assert_eq(err, -EINVAL);
+
+				err = __xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size,
+						      0, DRM_XE_MEM_RANGE_ATTR_PAT,
+						      pat_idx, 0, 0);
+				igt_assert_eq(err, -EINVAL);
+
+				err = __xe_vm_madvise(fd, vm, to_user_pointer(data) + bo_size / 2,
+						      bo_size / 4, 0, DRM_XE_MEM_RANGE_ATTR_PAT,
+						      pat_idx, 0, 0);
+				igt_assert_eq(err, -EINVAL);
+			} else {
+				err = __xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size,
+						      0, DRM_XE_MEM_RANGE_ATTR_PAT, pat_idx, 0, 0);
+				igt_assert_eq(err, -EINVAL);
+			}
+			return true;  /* Skip exec for UC PAT tests on iGPU */
+		}
+
 		if (flags & MADVISE_MULTI_VMA) {
 			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data) + bo_size,
-					       bo_size / 2, pat_value(fd));
+					       bo_size / 2, pat_idx);
 			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data), bo_size,
-					       pat_value(fd));
+					       pat_idx);
 			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data) + bo_size / 2,
-					       bo_size / 4, pat_value(fd));
+					       bo_size / 4, pat_idx);
 		} else {
 			xe_vm_madvixe_pat_attr(fd, vm, to_user_pointer(data), bo_size,
-					       pat_value(fd));
+					       pat_idx);
 		}
 
 		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
 		if (!mem_attrs) {
 			igt_debug("Failed to get memory attributes\n");
-			return;
+			return false;
 		}
 
 		for (uint32_t i = 0; i < num_ranges; i++)
-			igt_assert_eq_u32(mem_attrs[i].pat_index.val, pat_value(fd));
+			igt_assert_eq_u32(mem_attrs[i].pat_index.val, pat_idx);
 
 		free(mem_attrs);
 	}
+	return false;
 }
 
 static void
@@ -1560,8 +1591,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	addr = to_user_pointer(data);
 
 	if (flags & MADVISE_OP)
-		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync,
-					    pat_value);
+		if (xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync,
+						pat_value))
+			goto cleanup;
 
 	if (flags & BO_UNMAP) {
 		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
@@ -1971,8 +2003,11 @@ cleanup:
 		gem_close(fd, bo);
 	}
 
-	munmap(bind_ufence, SZ_4K);
-	gem_close(fd, bind_sync);
+	if (bind_ufence)
+		munmap(bind_ufence, SZ_4K);
+
+	if (bind_sync)
+		gem_close(fd, bind_sync);
 
 	if (flags & BUSY)
 		igt_assert_eq(unbind_system_allocator(), -EBUSY);
-- 
2.43.0

