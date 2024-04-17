Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5E1C001CC
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 14:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE1C10F67C;
	Wed, 17 Apr 2024 14:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="STYs0Xbw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7B21135D5
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 14:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713365469; x=1744901469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0zAejpEvFfy4gdofb0rZ5ssuYAsCdEHYIieghRhi2yY=;
 b=STYs0XbwgqUVPZWysYa6xDivyU051rV74lXl1HtQbQkRkX/8YWHnYpv+
 QGK6A3mccKpxpcz4u9Q546U/zK17Eb9907en/7ej8lzPTaGskFUe1vFAd
 p7hZCktvE7feaVWXofhldU4E9r08zR4H6vUFdt/nCUO79BZkOD+HQiHfZ
 9xhL1cdeoR21cK7NAnxDFYQk7DSQDfom/F4uy6txNVbcFizMpuJb8zir1
 Y3K/N65FC2f9FbzS1sPn+SmxMKm2mgW4fi7p6hGR+IIcNh13W3gi5nipN
 UCtELwHFKHMSrYgiulPHDyoDJT9xHpFsGjqTE5IMPsXGF0/seIX/w4Bge Q==;
X-CSE-ConnectionGUID: ugchK1/uSo2jBVyYmW9ETw==
X-CSE-MsgGUID: kMaYTM5XQCCEFrcYeBtHYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8726355"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="8726355"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:51:09 -0700
X-CSE-ConnectionGUID: 7w7Q+1PBTdG2cvmxArQrkQ==
X-CSE-MsgGUID: 4P8lU7eCTziKEGFFCaa/SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="22729710"
Received: from vdegtyar-mobl1.ger.corp.intel.com (HELO cc1cf3aaf32c.intel.com)
 ([10.252.44.146])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:51:08 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t,
 v1 2/4] drm-uapi/xe: Define topology types as indexes rather than
 masks
Date: Wed, 17 Apr 2024 14:50:47 +0000
Message-Id: <20240417145049.7-3-francois.dugast@intel.com>
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

