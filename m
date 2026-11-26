Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ADE606A329
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 07:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yl8c1Kwq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EAF10E73D;
	Thu, 26 Nov 2026 07:49:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B4110E331
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 07:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795679225; x=1827215225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wK29c2HLmOwkWnxwwtaHf4zFD0MN2KzNp3m7co571KE=;
 b=Yl8c1KwqA+Z5pgA90KLJlpvuk2dBlfNErAEthiRSvMFBLHjisZPkR0/q
 DmbKKxwTL7UPPIzm4/K9z3I30FlR9nBSWdeyj+2q4a1pO0bzO2YowqZRT
 uYK8431gksEIMQIm+6KTxTLH4jeJ+KWjML2cA2EllcWmlGDkc2GX4p8Wd
 0mdvFFImAl4fXGT2aLfyUw8AHKXGTAm4DzS7yQGiTioOAv+LpJYH4mx+8
 gvv3KF9cwZ3sH6rMCWkYuSiguR5URCTmV1ARZpfdg6A42417/xe3EpzEt
 /tbF9WmDl4u5HgxZVRJEd0WRJj5KCk9ehru8OJkDcsx/oLmi/KJU1JxXg g==;
X-CSE-ConnectionGUID: NxCqC19YSUSbfJc//xTPAA==
X-CSE-MsgGUID: 3hVx1M4vSDuL86INoQSFNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4566203"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4566203"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:46:54 -0800
X-CSE-ConnectionGUID: 3oxIIdUuRc6CMaVNkgEeeg==
X-CSE-MsgGUID: s1ZEC5dcQIipK38WLU1dJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="11991846"
Received: from hchegond-desk.jf.intel.com ([10.24.80.219])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:46:55 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, ravi.kishore.koppuravuri@intel.com,
 zbigniew.kempczynski@intel.com, maarten.lankhorst@intel.com,
 alexander.usyskin@intel.com, anshuman.gupta@intel.com,
 soham.purkait@intel.com, riana.tauro@intel.com, nishit.sharma@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH i-g-t 3/6] drm-uapi/xe: Sync with DRM RAS uapi updates
Date: Wed, 25 Nov 2026 23:46:43 -0800
Message-ID: <366be0c5c9a41173f9e3507de39e9a1a6fe28a95.1795677252.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795677252.git.harish.chegondi@intel.com>
References: <cover.1795677252.git.harish.chegondi@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Align with kernel commit cdeb5e248de11537
("drm/xe/uapi: Add additional error components to xe drm_ras").

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 include/drm-uapi/xe_drm.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 5a96a7910..b07f1ef4a 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -2589,6 +2589,12 @@ enum drm_xe_ras_error_component {
 	DRM_XE_RAS_ERR_COMP_CORE_COMPUTE = 1,
 	/** @DRM_XE_RAS_ERR_COMP_SOC_INTERNAL: SoC Internal Error */
 	DRM_XE_RAS_ERR_COMP_SOC_INTERNAL,
+	/** @DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY: Device Memory Error */
+	DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY,
+	/** @DRM_XE_RAS_ERR_COMP_PCIE: PCIe Subsystem Error */
+	DRM_XE_RAS_ERR_COMP_PCIE,
+	/** @DRM_XE_RAS_ERR_COMP_FABRIC: Fabric Subsystem Error */
+	DRM_XE_RAS_ERR_COMP_FABRIC,
 	/** @DRM_XE_RAS_ERR_COMP_MAX: Max Error */
 	DRM_XE_RAS_ERR_COMP_MAX	/* non-ABI */
 };
@@ -2606,7 +2612,10 @@ enum drm_xe_ras_error_component {
  */
 #define DRM_XE_RAS_ERROR_COMPONENT_NAMES {				\
 	[DRM_XE_RAS_ERR_COMP_CORE_COMPUTE] = "core-compute",		\
-	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL] = "soc-internal"		\
+	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL] = "soc-internal",		\
+	[DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY] = "device-memory",		\
+	[DRM_XE_RAS_ERR_COMP_PCIE] = "pcie",				\
+	[DRM_XE_RAS_ERR_COMP_FABRIC] = "fabric",			\
 }
 
 #if defined(__cplusplus)
-- 
2.43.0

