Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A714C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 14:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD0E10F695;
	Wed, 17 Apr 2024 14:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gcMj/DXA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2F310F695
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 14:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713365470; x=1744901470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6o18hjl9QpLXrbOnUEom5Smh+dsMQFGeWaIa0yP7ju8=;
 b=gcMj/DXA6l7EvsrtRXGtJ09YmbWP/ySdqXdkBPUXiNHgSyIuLAMVOZ6L
 syHZ8qXcDmX3n1448sPACeKmPjxhOjlzbF20JFrrPw4BCSbgv79RH5PBp
 eTCsddP1nyZcs7Wq9ltqqvbtiFBxquzkbbk3LecPGvfE06dDBS+U/8at7
 eW+Z469BDKlyqCBbteJR/o6ft8zLZ3PHXabsFP5DvzU3PStkfwePDe/vp
 WvUIcRg6F1PJZNJZP3/PCJszPEr0HA9AiaHz+GBQfQariNc4zNzEVlCEW
 6tTJeP0hWRJO1QiAkfWPlKcwib6mymxwdtEfzalRVWstLTO8zUKwRDjUY g==;
X-CSE-ConnectionGUID: U7bEnC1IQPqVV/P0U9VA7A==
X-CSE-MsgGUID: Goz8F3ybTq+/NwCIA12zEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8726357"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="8726357"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:51:10 -0700
X-CSE-ConnectionGUID: 19QqGGwITQ2NZV7j6PqiNw==
X-CSE-MsgGUID: XRScAMQbSiShq/DWWrV2Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="22729717"
Received: from vdegtyar-mobl1.ger.corp.intel.com (HELO cc1cf3aaf32c.intel.com)
 ([10.252.44.146])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:51:09 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,v1 3/4] drm-uapi/xe: Expose the L3 bank mask
Date: Wed, 17 Apr 2024 14:50:48 +0000
Message-Id: <20240417145049.7-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240417145049.7-1-francois.dugast@intel.com>
References: <20240417145049.7-1-francois.dugast@intel.com>
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
index d8816df83..ca4ed704d 100644
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
2.34.1

