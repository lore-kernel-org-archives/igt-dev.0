Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723C1FEA80C
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 05:56:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2489410E1EB;
	Wed, 25 Mar 2026 05:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EX1KjvJj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600CA10E1EB
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 05:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774418188; x=1805954188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BvGhDXuAZKXCU0QWiJ82xvIqVhb4PSW5KocpwJgyqzI=;
 b=EX1KjvJjxMeDFIqKpuib/a9y+wM/m8qeQF+ZAPnGlmltbcXquVEzax5P
 cLHXp6US7izfUe0LtX2ypQMobqZy9aDb0PDXiau6QvpcaEnAry1WqK4Ea
 NYue46gg2Ockx144id7WGEnqeY0ITBbZzJQxK5uBbaLXqg+Z10/fImfuq
 Yu2JzABvOH4S8Y9+M+GTzi6AIZ6j7znBAhkwq2Y/FYetdnx6q5NWoRrWO
 kxPVESYAqi5xyJSEU21BxRru9pTG4cvFQ5CVY72Oey3aPnKBB9r29xJ+K
 s2/a9n2cR47DeFPqb3wNjo5kSk8caXkMjeeBi1TYcfxuOzWN9WRNMs/Jz Q==;
X-CSE-ConnectionGUID: o6e4BmdcQFa1kLWhSfoPyg==
X-CSE-MsgGUID: lGfvbgj0RRGcU5e/SDMoQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="62999227"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="62999227"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 22:56:28 -0700
X-CSE-ConnectionGUID: TrbVB6B8QdqPiWbTDeSqeQ==
X-CSE-MsgGUID: cIom9vhzSb6EHdMhrt7wUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="224842545"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 22:56:28 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.hellstrom@intel.com, nishit.sharma@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v7 i-g-t 1/3] drm-uapi/xe: sync with kernel header
Date: Wed, 25 Mar 2026 05:55:48 +0000
Message-ID: <20260325055552.2496156-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260325055552.2496156-1-sobin.thomas@intel.com>
References: <20260320100554.2427448-1-sobin.thomas@intel.com>
 <20260325055552.2496156-1-sobin.thomas@intel.com>
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
2.43.0

