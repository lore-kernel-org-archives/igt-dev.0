Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5E1C2A072
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 04:00:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9304810E289;
	Mon,  5 Jan 2026 04:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aBJxCoP9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5ACB10E232
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 04:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585602; x=1799121602;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ZBfkx3WRpO1wbIyjyTh+YeMUsHwklSZwKWrh2D9sSzU=;
 b=aBJxCoP9fk7mG2Lya8/zYr1YlP3ut1z6+kwsHnTv3PUYFOtpkZxKbkzt
 yeiEdT/Qq1eMMDZfZFCC/LIJp0yRB79BNmuJ3jpdm05Ut5VoEr5OCLX8J
 MMTNwc5HQ9nWP37PG1D4KHcIPvEj/2gJVNSowL+blwUd2NWCz3ZnfkEaQ
 aJFhfjFYBQMjJLIajdgrgiuAPgInys2pOmMQV6fkjI8sGHnHxW3Y3NsIg
 wSpeZtZsZoECOBIa24XMZIK2ttcgYcVSGX6ii/sg0WcMUSVNpLk/6kHbg
 sInTytdY9PRcs0FdkMMuK3eUFOwwsYg3c5I9tlu/d09L6J9NhuGEMTmyr Q==;
X-CSE-ConnectionGUID: WDF17qCCQDSQnqBgyX+sPQ==
X-CSE-MsgGUID: C4GkQ4ETT/i6pWTc4sDRlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="69024112"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="69024112"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:00:01 -0800
X-CSE-ConnectionGUID: fJDKy06KTUGDGN8yCiFqHA==
X-CSE-MsgGUID: Rwmfnxp0Rwq9wfwuedj6tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202335503"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.84.79])
 by orviesa008.jf.intel.com with ESMTP; 04 Jan 2026 20:00:01 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	pravalika.gurram@intel.com
Subject: [PATCH i-g-t v13 01/11] drm-uapi/xe: Sync with madvise interface
Date: Mon,  5 Jan 2026 03:59:50 +0000
Message-ID: <20260105040000.181183-2-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260105040000.181183-1-nishit.sharma@intel.com>
References: <20260105040000.181183-1-nishit.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Align with kernel commit dff547e137be2 ("drm/xe/uapi: Extend the madvise
functionality"). This is to bring in madvise interface changes from KMD.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 include/drm-uapi/xe_drm.h | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index f8b228350..bb69f9b30 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -3,8 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#ifndef _XE_DRM_H_
-#define _XE_DRM_H_
+#ifndef _UAPI_XE_DRM_H_
+#define _UAPI_XE_DRM_H_
 
 #include "drm.h"
 
@@ -142,7 +142,7 @@ extern "C" {
  * redefine the interface more easily than an ever growing struct of
  * increasing complexity, and for large parts of that interface to be
  * entirely optional. The downside is more pointer chasing; chasing across
- * the boundary with pointers encapsulated inside u64.
+ * the __user boundary with pointers encapsulated inside u64.
  *
  * Example chaining:
  *
@@ -2123,7 +2123,13 @@ struct drm_xe_madvise {
 		struct {
 #define DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE	0
 #define DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM	-1
-			/** @preferred_mem_loc.devmem_fd: fd for preferred loc */
+			/**
+			 * @preferred_mem_loc.devmem_fd:
+			 * Device file-descriptor of the device where the
+			 * preferred memory is located, or one of the
+			 * above special values. Please also see
+			 * @preferred_mem_loc.region_instance below.
+			 */
 			__u32 devmem_fd;
 
 #define DRM_XE_MIGRATE_ALL_PAGES		0
@@ -2131,8 +2137,14 @@ struct drm_xe_madvise {
 			/** @preferred_mem_loc.migration_policy: Page migration policy */
 			__u16 migration_policy;
 
-			/** @preferred_mem_loc.pad : MBZ */
-			__u16 pad;
+			/**
+			 * @preferred_mem_loc.region_instance : Region instance.
+			 * MBZ if @devmem_fd <= &DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE.
+			 * Otherwise should point to the desired device
+			 * VRAM instance of the device indicated by
+			 * @preferred_mem_loc.devmem_fd.
+			 */
+			__u16 region_instance;
 
 			/** @preferred_mem_loc.reserved : Reserved */
 			__u64 reserved;
@@ -2353,4 +2365,4 @@ struct drm_xe_exec_queue_set_property {
 }
 #endif
 
-#endif /* _XE_DRM_H_ */
+#endif /* _UAPI_XE_DRM_H_ */
-- 
2.48.1

