Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D39C4345F
	for <igt-dev@archiver.kernel.org>; Fri,  3 May 2024 17:16:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25665113185;
	Fri,  3 May 2024 17:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sivpw76F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B4A113188
 for <igt-dev@lists.freedesktop.org>; Fri,  3 May 2024 17:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714756576; x=1746292576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vfSy5gT9DFFUCSF7skIOQEbxEoNH46kruNTwNcdiVvE=;
 b=Sivpw76F6kze2M7KRcxmena9jWuHnQoUBEfuWfV9DRN4WsdiV1ot5fFj
 OCIrLv6fJy7kQT5CYraWnqn113sFbZgFP2xF0XeVMGNboJktJc6sxlqxe
 32Ut/KgMIiUNTm0bNF3DkkFGG54C6oup8ePwKRfvzz+pcwWTiQfMgObAM
 QoEKZcubG4fIUQ+6WqGg28C4ceB3Wu0PF8sR+vME4Uyh/HvSjsjcrma2g
 BIOhcwnjc4+z2LFFFIJApa2+eZMxjDOzFWCo+vMti3MaLxkxnKUwx2mlw
 f5aMYXo3qOGHrDig5RB8/0ZMs04RqGqntAsHk+uDjNgnjFiv/fsfH5Lw7 g==;
X-CSE-ConnectionGUID: 08badAhqThup1YAUPChgVA==
X-CSE-MsgGUID: Ivt6VjwzTBOl5ji6/V8afA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10733943"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10733943"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 10:16:15 -0700
X-CSE-ConnectionGUID: RO7GFylnT8earHCFB3r6gQ==
X-CSE-MsgGUID: fq8NdymZQLCHqB2O0+J/nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="64950661"
Received: from alutz-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.50.96])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 10:16:13 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,v2 1/2] drm-uapi/xe: Expose the L3 bank mask
Date: Fri,  3 May 2024 19:12:29 +0200
Message-ID: <20240503171539.295801-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240503171539.295801-1-francois.dugast@intel.com>
References: <20240503171539.295801-1-francois.dugast@intel.com>
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

Align with kernel commit:
ca83f9d20171 ("drm/xe/uapi: Expose the L3 bank mask").

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 0b709b374..1100dfe1f 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -508,6 +508,7 @@ struct drm_xe_query_gt_list {
  *    containing the following in mask:
  *    ``DSS_COMPUTE    ff ff ff ff 00 00 00 00``
  *    means 32 DSS are available for compute.
+ *  - %DRM_XE_TOPO_L3_BANK - To query the mask of enabled L3 banks
  *  - %DRM_XE_TOPO_EU_PER_DSS - To query the mask of Execution Units (EU)
  *    available per Dual Sub Slices (DSS). For example a query response
  *    containing the following in mask:
@@ -520,6 +521,7 @@ struct drm_xe_query_topology_mask {
 
 #define DRM_XE_TOPO_DSS_GEOMETRY	1
 #define DRM_XE_TOPO_DSS_COMPUTE		2
+#define DRM_XE_TOPO_L3_BANK		3
 #define DRM_XE_TOPO_EU_PER_DSS		4
 	/** @type: type of mask */
 	__u16 type;
-- 
2.43.0

