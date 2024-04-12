Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8ECDC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 14:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A9310F674;
	Fri, 12 Apr 2024 14:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KzQx2YMf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AED789262
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 14:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712931743; x=1744467743;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0zAejpEvFfy4gdofb0rZ5ssuYAsCdEHYIieghRhi2yY=;
 b=KzQx2YMfqSgZYQy0XkBYq+Vsox5RmJL8NIeGyjLKEhWsXjplHiH1VX85
 PqAASPY7aBEo1gGYNM81ky3yJUiTkvkOkHPnJKcowlLXwGDbTy3kzsBHK
 dvcFcRE9fKRms/PmrtkLJOzdHX/FwJ2yuH6e8Htx+fuQpRPRlFXGN0g1j
 bAdi8yHV1PxeTGzNu1JA37pdzVd3iTvFlsrf1XeTMtU0rqM3DFo5d+7hu
 ZaO/fCHkv70m3CXCqR5gBKShw6TmRGw1AVXULER0kj89GWDl/Ycm/md62
 VEm0pH8ohig/+rHNjQzpiYOgVcimi9FltlaeUSKy30vpe7LUs+66S0MrA w==;
X-CSE-ConnectionGUID: aOH3kv9RSy64FGSF9U10nA==
X-CSE-MsgGUID: 4rqe96HQRhCGdOTu2Hpupw==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="25840435"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="25840435"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 07:22:23 -0700
X-CSE-ConnectionGUID: muLOqRVkRD+2kUGmNP6nKA==
X-CSE-MsgGUID: N69+9Y1cT2KDSLcoLypTmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="21313807"
Received: from dovchinx-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.215.7])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 07:22:21 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t,
 v2 2/3] drm-uapi/xe: Define topology types as indexes rather than
 masks
Date: Fri, 12 Apr 2024 14:21:58 +0000
Message-Id: <20240412142159.6-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240412142159.6-1-francois.dugast@intel.com>
References: <20240412142159.6-1-francois.dugast@intel.com>
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

Align with kernel commit ca83f9d20171 ("drm/xe/uapi: Define topology \
types as indexes rather than masks").

This is not a functional change.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 include/drm-uapi/xe_drm.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 91ea92035..d8816df83 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -518,9 +518,9 @@ struct drm_xe_query_topology_mask {
 	/** @gt_id: GT ID the mask is associated with */
 	__u16 gt_id;
 
-#define DRM_XE_TOPO_DSS_GEOMETRY	(1 << 0)
-#define DRM_XE_TOPO_DSS_COMPUTE		(1 << 1)
-#define DRM_XE_TOPO_EU_PER_DSS		(1 << 2)
+#define DRM_XE_TOPO_DSS_GEOMETRY	1
+#define DRM_XE_TOPO_DSS_COMPUTE		2
+#define DRM_XE_TOPO_EU_PER_DSS		4
 	/** @type: type of mask */
 	__u16 type;
 
-- 
2.34.1

