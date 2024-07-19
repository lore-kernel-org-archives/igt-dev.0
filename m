Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892E1C3DA5D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jul 2024 13:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284D510EC25;
	Fri, 19 Jul 2024 13:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dv7Cb2C3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7004C10EC25
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 13:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721395675; x=1752931675;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=evACF+4hQYYHZe0PRFrRstTdF8dIAiZyU6yTaEggLlg=;
 b=dv7Cb2C3HtLpN+ImCA9H9SjvVPLaDeRQ87Kbu2vd7XxOsVIpJvLaL6XD
 aKx5xpseMaDyVxUsFtfRJW2M/7hEC5+d456BJ6nuT25CLVj4EVWp+gmPs
 t9+NmPfYqJpFimfxr5Gt5bqtySu70qdVbR+rfWZ33b8kt5gVbR8Ww2Stc
 jFIzSZNgWoLO9Nz+20UPag62wLWjZcVp7Qf7XMYsZTL2sRyirploNMOa0
 z/q2jgiHxyawtMWaCS/eKgrpNnAuqTpHT2HbjgoKZYjhRyxuyt7yEZ8fK
 gBFfJH9SE3CPZ826Y6bFcc1cJULgI7N7mlABh0Jf1BRcB2OgV0s4a4OIT w==;
X-CSE-ConnectionGUID: nmAqrxIAS22J5Cz5L6yCTw==
X-CSE-MsgGUID: 2CzN7RohRzy17+tZJWl89A==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="19119194"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="19119194"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 06:27:54 -0700
X-CSE-ConnectionGUID: UnizB3jxSxWjZToiwF8nUQ==
X-CSE-MsgGUID: u2zm6VBcRbiuiD7RyTbZvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="51400958"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 06:27:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/2] drm-uapi/xe: Sync with topology query uapi updates
Date: Fri, 19 Jul 2024 06:27:47 -0700
Message-ID: <20240719132748.3382266-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Align with kernel commit 7108b4a589cd ("drm/xe/uapi: Expose SIMD16 EU
mask in topology query") which adds one item to topology query.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/drm-uapi/xe_drm.h | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 3bab3fdaa..29425d7fd 100644
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
 
@@ -134,7 +134,7 @@ extern "C" {
  * redefine the interface more easily than an ever growing struct of
  * increasing complexity, and for large parts of that interface to be
  * entirely optional. The downside is more pointer chasing; chasing across
- * the boundary with pointers encapsulated inside u64.
+ * the __user boundary with pointers encapsulated inside u64.
  *
  * Example chaining:
  *
@@ -517,7 +517,14 @@ struct drm_xe_query_gt_list {
  *    available per Dual Sub Slices (DSS). For example a query response
  *    containing the following in mask:
  *    ``EU_PER_DSS    ff ff 00 00 00 00 00 00``
- *    means each DSS has 16 EU.
+ *    means each DSS has 16 SIMD8 EUs. This type may be omitted if device
+ *    doesn't have SIMD8 EUs.
+ *  - %DRM_XE_TOPO_SIMD16_EU_PER_DSS - To query the mask of SIMD16 Execution
+ *    Units (EU) available per Dual Sub Slices (DSS). For example a query
+ *    response containing the following in mask:
+ *    ``SIMD16_EU_PER_DSS    ff ff 00 00 00 00 00 00``
+ *    means each DSS has 16 SIMD16 EUs. This type may be omitted if device
+ *    doesn't have SIMD16 EUs.
  */
 struct drm_xe_query_topology_mask {
 	/** @gt_id: GT ID the mask is associated with */
@@ -527,6 +534,7 @@ struct drm_xe_query_topology_mask {
 #define DRM_XE_TOPO_DSS_COMPUTE		2
 #define DRM_XE_TOPO_L3_BANK		3
 #define DRM_XE_TOPO_EU_PER_DSS		4
+#define DRM_XE_TOPO_SIMD16_EU_PER_DSS	5
 	/** @type: type of mask */
 	__u16 type;
 
@@ -783,7 +791,13 @@ struct drm_xe_gem_create {
 #define DRM_XE_GEM_CPU_CACHING_WC                      2
 	/**
 	 * @cpu_caching: The CPU caching mode to select for this object. If
-	 * mmaping the object the mode selected here will also be used.
+	 * mmaping the object the mode selected here will also be used. The
+	 * exception is when mapping system memory (including data evicted
+	 * to system) on discrete GPUs. The caching mode selected will
+	 * then be overridden to DRM_XE_GEM_CPU_CACHING_WB, and coherency
+	 * between GPU- and CPU is guaranteed. The caching mode of
+	 * existing CPU-mappings will be updated transparently to
+	 * user-space clients.
 	 */
 	__u16 cpu_caching;
 	/** @pad: MBZ */
@@ -1684,4 +1698,4 @@ struct drm_xe_oa_stream_info {
 }
 #endif
 
-#endif /* _XE_DRM_H_ */
+#endif /* _UAPI_XE_DRM_H_ */
-- 
2.43.0

