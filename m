Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89501E6BF3C
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 23:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD2F10E079;
	Fri, 30 Jan 2026 23:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dmfnSCvv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F4310E079
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 23:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769817430; x=1801353430;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JS3fIYeEsRktnVK7bSRy62a1Ru84Mi34LbP51tvDEzI=;
 b=dmfnSCvv9+J0WMHHTrtl6gy7Gq6mDhQzI1AvVfMRXDOyHXKhGGm3DD0K
 Wl4JAUGwC9yXZjZxoFocMgRoMxY4qmaYyqhr+HzQOFT+Q7JTzlLEAjOej
 DOXBXKY3MauY+bAyehT0jw55WY32pZKjCIbRh8651PU3A2Q9VfAX8l3AJ
 hi+CBIDZ35dSr2LCXYYj20buz/JtsHlBvbDjvrraG6YsHsrNpKeb3I+YE
 zf4vpIMJ8fM39Fjnga4df2q+dMuB8flrYj9EddbnuqHm6we7vNUM1TJS8
 iUqcK8CrqiFNgSWTco88x8JuKWX5ML48YVtRPwNjTA1/bMGALWt3wtyYi A==;
X-CSE-ConnectionGUID: CD9wb5mCQtKB0ED3lJB1MA==
X-CSE-MsgGUID: aoHVvf2oSnSxceBSmjje5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="88646921"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; d="scan'208";a="88646921"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 15:57:09 -0800
X-CSE-ConnectionGUID: xThor8L6TV6hRbDQNKxlBA==
X-CSE-MsgGUID: SdOKQ6syTIad8hVo+js7Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; d="scan'208";a="208556451"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.45])
 by fmviesa007.fm.intel.com with ESMTP; 30 Jan 2026 15:57:09 -0800
From: Jia Yao <jia.yao@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>,
	Xin Wang <x.wang@intel.com>
Subject: [PATCH v5] tests/intel/xe_exec_system_allocator: Expect UC PAT
 madvise rejection
Date: Fri, 30 Jan 2026 23:57:05 +0000
Message-ID: <20260130235705.647133-1-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129003146.340181-1-jia.yao@intel.com>
References: <20260129003146.340181-1-jia.yao@intel.com>
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

Cc: Xin Wang <x.wang@intel.com>
Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 56 +++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 412ad0384..ce232baae 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -1193,7 +1193,7 @@ xe_vm_madvise_migrate_pages(int fd, uint32_t vm, uint64_t addr, uint64_t range)
 		      DRM_XE_MIGRATE_ALL_PAGES, 0);
 }
 
-static void
+static bool
 xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
 			    size_t bo_size,
 			    struct drm_xe_engine_class_instance *eci,
@@ -1289,33 +1289,63 @@ xe_vm_parse_execute_madvise(int fd, uint32_t vm, struct test_exec_data *data,
 	if (flags & MADVISE_PAT_INDEX) {
 		uint32_t num_ranges;
 		struct drm_xe_mem_range_attr *mem_attrs;
+		uint8_t pat_idx = pat_value(fd);
+		bool is_uc_pat = (pat_value == intel_get_pat_idx_uc ||
+				  pat_value == intel_get_pat_idx_uc_comp);
+		int err;
 
 		if (bo_size)
 			bo_size = ALIGN(bo_size, SZ_4K);
 
+		if (is_uc_pat) {
+			/* UC PAT should be rejected by kernel for CPU cached memory */
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
+			return true;  /* Skip exec for UC PAT tests */
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
@@ -1535,8 +1565,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	addr = to_user_pointer(data);
 
 	if (flags & MADVISE_OP)
-		xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync,
-					    pat_value);
+		if (xe_vm_parse_execute_madvise(fd, vm, data, bo_size, eci, addr, flags, sync,
+						pat_value))
+			goto cleanup;
 
 	if (flags & BO_UNMAP) {
 		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
@@ -1946,8 +1977,11 @@ cleanup:
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

