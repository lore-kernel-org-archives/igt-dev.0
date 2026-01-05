Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5ABC2A077
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 04:00:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BC610E340;
	Mon,  5 Jan 2026 04:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M0w7fzgg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187BD10E1FF
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 04:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585602; x=1799121602;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=77fRFsp8rgdsu1JfyBWipGWc+4dpVgL9l2TktCRB9fE=;
 b=M0w7fzggFXehYtJd57m8CD5bm1UyzHxH9AgjJxSCyzPxHGywzJTnBYZh
 VigsxBCDECs5c1I88O8TBIO4SsFN4E8c8dMd9KKY2BQofncByZ0nxnTAv
 iyEl+6G2GKVf5iV6IA4mZ1BntKCbX+wYGTjOoMWkRTQvbIiNkLCEfWV16
 4tJlAS+XXz3+GR+QIRWwbs8GGA4Pw+U+BLP1xJ4Ke/3udNr0e5QqDZYrK
 IVu6thURXbnmpJqQXcNycALazvrAstb+OHvXWLFBlVrtX/lUJ3w8C25L2
 GtH3GyJkmUpG6J6NtTfKJeasVMEeHwoMf1vk/Z6hkOBflW04OER2LWr7X g==;
X-CSE-ConnectionGUID: m2f9FWP0QqO1O5dIq7coVA==
X-CSE-MsgGUID: FDjoLfA6Rc2Ub579LbZiGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="69024113"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="69024113"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:00:01 -0800
X-CSE-ConnectionGUID: JgQbflDBSau8Z42OsvS+9A==
X-CSE-MsgGUID: H5dEyQbsRFS3XCHZb9O/gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202335508"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.84.79])
 by orviesa008.jf.intel.com with ESMTP; 04 Jan 2026 20:00:01 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	pravalika.gurram@intel.com
Subject: [PATCH i-g-t v13 02/11] lib/xe: Add instance parameter to
 xe_vm_madvise
Date: Mon,  5 Jan 2026 03:59:51 +0000
Message-ID: <20260105040000.181183-3-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260105040000.181183-1-nishit.sharma@intel.com>
References: <20260105040000.181183-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

tests/intel/xe_exec_system_allocator: Add parameter in madvise call

Add an 'instance' parameter to __xe_vm_madvise() and xe_vm_madvise() to
specify which VRAM instance should be targeted for memory advise
operations.
Getting compilation issues in xe_exec_system_allocator test after adding
'instance' parameters in xe_vm_madvise(). As a fix 0 as instance parameter
passed in xe_vm_madvise() calls available in xe_exec_system_allocator test.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 lib/xe/xe_ioctl.c                      | 13 +++++++++----
 lib/xe/xe_ioctl.h                      |  9 +++++++--
 tests/intel/xe_exec_system_allocator.c |  8 ++++----
 3 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 319853da0..e3efe12ad 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -714,7 +714,8 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 }
 
 int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
-		    uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy)
+		    uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy,
+		    uint16_t instance)
 {
 	struct drm_xe_madvise madvise = {
 		.type = type,
@@ -731,6 +732,7 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
 	case DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC:
 		madvise.preferred_mem_loc.devmem_fd = op_val;
 		madvise.preferred_mem_loc.migration_policy = policy;
+		madvise.preferred_mem_loc.region_instance = instance;
 		igt_debug("madvise.preferred_mem_loc.devmem_fd = %d\n",
 			  madvise.preferred_mem_loc.devmem_fd);
 		break;
@@ -758,14 +760,17 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
  * @type: type of attribute
  * @op_val: fd/atomic value/pat index, depending upon type of operation
  * @policy: Page migration policy
+ * @instance: vram instance
  *
  * Function initializes different members of struct drm_xe_madvise and calls
  * MADVISE IOCTL .
  *
- * Asserts in case of error returned by DRM_IOCTL_XE_MADVISE.
+ * Asserts in case of error returned by DRM_IOCTL_XE_MADVISE
  */
 void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
-		   uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy)
+		   uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy,
+		   uint16_t instance)
 {
-	igt_assert_eq(__xe_vm_madvise(fd, vm, addr, range, ext, type, op_val, policy), 0);
+	igt_assert_eq(__xe_vm_madvise(fd, vm, addr, range, ext, type, op_val, policy,
+				      instance), 0);
 }
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index a7fd43c9e..3ea651063 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -104,13 +104,18 @@ int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
 		       uint32_t exec_queue, int64_t timeout);
 int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_t ext,
-		    uint32_t type, uint32_t op_val, uint16_t policy);
+		    uint32_t type, uint32_t op_val, uint16_t policy, uint16_t instance);
 void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64_t ext,
-		   uint32_t type, uint32_t op_val, uint16_t policy);
+		   uint32_t type, uint32_t op_val, uint16_t policy, uint16_t instance);
 int xe_vm_number_vmas_in_range(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr);
 int xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr *vmas_attr,
 		    struct drm_xe_mem_range_attr *mem_attr);
 struct drm_xe_mem_range_attr
 *xe_vm_get_mem_attr_values_in_range(int fd, uint32_t vm, uint64_t start,
 				    uint64_t range, uint32_t *num_ranges);
+void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo,
+			uint64_t offset, uint64_t addr,
+			uint64_t size, uint32_t flags);
+void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
+			  uint64_t addr, uint64_t size);
 #endif /* XE_IOCTL_H */
diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index ffa4ec3f5..28958eccc 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -1164,7 +1164,7 @@ madvise_swizzle_op_exec(int fd, uint32_t vm, struct test_exec_data *data,
 	xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
 		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
 		      preferred_loc,
-		      0);
+		      0, 0);
 }
 
 static void
@@ -1172,7 +1172,7 @@ xe_vm_madvixe_pat_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
 		       int pat_index)
 {
 	xe_vm_madvise(fd, vm, addr, range, 0,
-		      DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0);
+		      DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0, 0);
 }
 
 static void
@@ -1181,7 +1181,7 @@ xe_vm_madvise_atomic_attr(int fd, uint32_t vm, uint64_t addr, uint64_t range,
 {
 	xe_vm_madvise(fd, vm, addr, range, 0,
 		      DRM_XE_MEM_RANGE_ATTR_ATOMIC,
-		      mem_attr, 0);
+		      mem_attr, 0, 0);
 }
 
 static void
@@ -1190,7 +1190,7 @@ xe_vm_madvise_migrate_pages(int fd, uint32_t vm, uint64_t addr, uint64_t range)
 	xe_vm_madvise(fd, vm, addr, range, 0,
 		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
 		      DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM,
-		      DRM_XE_MIGRATE_ALL_PAGES);
+		      DRM_XE_MIGRATE_ALL_PAGES, 0);
 }
 
 static void
-- 
2.48.1

