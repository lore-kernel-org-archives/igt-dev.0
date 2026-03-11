Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B97FCC9AA
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 06:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E885210E31F;
	Wed, 11 Mar 2026 06:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HUOnVxMU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2525810E31F
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 06:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773209254; x=1804745254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4kLLF+awXTvFvTPUDOwfkNAiEtuc5csuQOeYoY6gAi0=;
 b=HUOnVxMUwbikiICdatWPszWiHwOyx8vLDjUrq3pE0+dzaZQp7X/GCC5R
 +wftxqJB7OiaS6Uodv3R2svUIhC0WY5K+BHRsRUKylOmnbjgvWpkSw5Ap
 pFcZSE5aBzslDCKUnIWgf6f2c89O7D+/rU90QDOWheoybOPy8cinLV/yl
 zEZU2IVWF0g9jD3SUlbfTjy48D1COG+Let3oI9HrLHXo2B/WuooK2KemF
 /wSiiEaT6XTnyN0F391E99Hj5gW9zspWerzHstrgJUtk1CwWDhNCXFnOf
 V4j8qPdIWLv9LwVqB4V9c0ufoqZgB5Cr3rIioYG83kjyKxc1cg29yM2o9 g==;
X-CSE-ConnectionGUID: ea5NuJY4SByvZ+eHrwa/1Q==
X-CSE-MsgGUID: dOmv4xa4RumRO/LyE6gfLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74387754"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74387754"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 23:07:34 -0700
X-CSE-ConnectionGUID: 5e22JgktR5SvYYh2LCgKqQ==
X-CSE-MsgGUID: 6NqGhsMORQ21og3twOS9Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="216649883"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 23:07:34 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Cc: nishit.sharma@intel.com, Sobin Thomas <sobin.thomas@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v4 i-g-t 1/2] drm-uapi/xe: sync with kernel header
Date: Wed, 11 Mar 2026 06:06:57 +0000
Message-ID: <20260311060701.2133206-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260311060701.2133206-1-sobin.thomas@intel.com>
References: <20260311060701.2133206-1-sobin.thomas@intel.com>
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

This commit is for sync with kernel header.
Align with kernel commit 369cc8804985 ("drm/xe/uapi: Introduce a flag to
disallow VM overcommit in fault mode").

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 include/drm-uapi/xe_drm.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 077e66a68..fc71a6cd1 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -3,8 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#ifndef _UAPI_XE_DRM_H_
-#define _UAPI_XE_DRM_H_
+#ifndef _XE_DRM_H_
+#define _XE_DRM_H_
 
 #include "drm.h"
 
@@ -142,7 +142,7 @@ extern "C" {
  * redefine the interface more easily than an ever growing struct of
  * increasing complexity, and for large parts of that interface to be
  * entirely optional. The downside is more pointer chasing; chasing across
- * the __user boundary with pointers encapsulated inside u64.
+ * the boundary with pointers encapsulated inside u64.
  *
  * Example chaining:
  *
@@ -335,10 +335,6 @@ struct drm_xe_mem_region {
 	__u64 total_size;
 	/**
 	 * @used: Estimate of the memory used in bytes for this region.
-	 *
-	 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable
-	 * accounting.  Without this the value here will always equal
-	 * zero.
 	 */
 	__u64 used;
 	/**
@@ -363,9 +359,7 @@ struct drm_xe_mem_region {
 	 * @cpu_visible_used: Estimate of CPU visible memory used, in
 	 * bytes.
 	 *
-	 * Requires CAP_PERFMON or CAP_SYS_ADMIN to get reliable
-	 * accounting. Without this the value here will always equal
-	 * zero.  Note this is only currently tracked for
+	 * Note this is only currently tracked for
 	 * DRM_XE_MEM_REGION_CLASS_VRAM regions (for other types the value
 	 * here will always be zero).
 	 */
@@ -975,6 +969,11 @@ struct drm_xe_gem_mmap_offset {
  *    demand when accessed, and also allows per-VM overcommit of memory.
  *    The xe driver internally uses recoverable pagefaults to implement
  *    this.
+ *  - %DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT - Requires also
+ *    DRM_XE_VM_CREATE_FLAG_FAULT_MODE. This disallows per-VM overcommit
+ *    but only during a &DRM_IOCTL_XE_VM_BIND operation with the
+ *    %DRM_XE_VM_BIND_FLAG_IMMEDIATE flag set. This may be useful for
+ *    user-space naively probing the amount of available memory.
  */
 struct drm_xe_vm_create {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -983,6 +982,7 @@ struct drm_xe_vm_create {
 #define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
 #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
 #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
+#define DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT  (1 << 3)
 	/** @flags: Flags */
 	__u32 flags;
 
@@ -2361,4 +2361,4 @@ struct drm_xe_exec_queue_set_property {
 }
 #endif
 
-#endif /* _UAPI_XE_DRM_H_ */
+#endif /* _XE_DRM_H_ */
-- 
2.52.0

