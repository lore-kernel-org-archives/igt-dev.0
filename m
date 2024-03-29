Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546A8CD11DD
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 15:31:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F0511275B;
	Fri, 29 Mar 2024 15:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQ82BCtW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7A0112735
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2024 15:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711726284; x=1743262284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lOk6TYUqbj+CyYZsoEGFhk9iOCNzlo0FgF81qHjlgpE=;
 b=QQ82BCtWehnzOchhQNzeK4exTS6+Zt0n1KLryVpJWG1vcqZpSn/HrORV
 BbR69/W1/YiWljDJXE3NlAgqjvtyHFZHC21f1yijBQALhL33tm5JvL/7P
 odS5LNF0kZ9LeSDE9ElRGa0tNC1YNmTxVoci+cIE4vd0Puf4aHlMCb8jr
 9+Mce6NqRNwSFnDxdy48N53dQgimkIBBU3H9EO3MFfr8eYGnlG/+ahqcD
 QUJkfuVIlDTwbKM18GB2JJ9fuSTnayLnrmGq3FztJMAfADrHxVRVPT3dq
 lg1docnGbr+zAJViSdQ3sWvU8hkU8tafkIBcz6pUnsNjMoIBWSGqB0I/O A==;
X-CSE-ConnectionGUID: DoEy4SgUSdSxtatwY/R2Yg==
X-CSE-MsgGUID: qmDKWlwcQQOzbw07Cs9uhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="7042944"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="7042944"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 08:31:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="54459209"
Received: from fpirou-mobl1.ger.corp.intel.com (HELO f83c703597ca.intel.com)
 ([10.252.40.129])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 08:31:23 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 2/3] drm-uapi/xe: Define topology types as indexes
 rather than masks
Date: Fri, 29 Mar 2024 15:30:57 +0000
Message-Id: <20240329153058.7-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329153058.7-1-francois.dugast@intel.com>
References: <20240329153058.7-1-francois.dugast@intel.com>
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

