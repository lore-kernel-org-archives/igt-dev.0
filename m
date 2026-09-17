Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B1FC88E72
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 19:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3540610F079;
	Thu, 17 Sep 2026 19:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bQYkquxi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA59D10F088
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Sep 2026 19:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789672172; x=1821208172;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8bUcLYPIhWYNqvjIXrzCmgDojrk3aLyR5Emr6FXmANo=;
 b=bQYkquxi7rU7Y6BwO+vIDFpKsVoVtB4JSvs3ZvJEH/OwRBFbfOtojeXn
 XwDSOVJw6zfslqTkBTYehcRbSfAaiB0fq9rQ1RZwNL6ug+iDksJJw4BLw
 89irzpfquahgp0rwIsaeQtcaPC7zhNMArStJG/+WR/8QyoWDyr+uDu40h
 GsluDM+PcCt2G9DIkfMhxMmAAS0QC4trizKIeeYrqqBlfoyJpy2jLb6D5
 4JUtMR/pcYKPNali6rMYtxn7iunwN9SfekP8R6/cr6IJw5JjwoCNTptkL
 1rtr5O9hCD9fzEPxxItUhhEL8Nn5hTU3+YR5+I6s36NJB8wjKf2ld+639 w==;
X-CSE-ConnectionGUID: bpiXsgzoTMWgc0VVJLM+iw==
X-CSE-MsgGUID: RLR4UxgnS3K74XXDh8ciYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639286"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639286"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 12:09:32 -0700
X-CSE-ConnectionGUID: wiu2m6XwRUyIv+zGdAdw1w==
X-CSE-MsgGUID: GFN+iz9KQuCooWfnZprsEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270271231"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:09:30 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, Maarten Lankhorst <dev@lankhorst.se>,
 Pranay Samala <pranay.samala@intel.com>
Subject: [PATCH i-g-t,
 v5 1/3] lib/igt_kms: Add support for the BACKGROUND_COLOR property
Date: Fri, 18 Sep 2026 00:48:33 +0530
Message-Id: <20260917191835.977425-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260917191835.977425-1-swati2.sharma@intel.com>
References: <20260917191835.977425-1-swati2.sharma@intel.com>
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

From: Maarten Lankhorst <dev@lankhorst.se>

The background color is a 64-bits property that contains the ARGB values
of the background with 16 bits for each component.

Add support for the BACKGROUND_COLOR property, and set to pitch black
as the default.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_kms.c | 6 ++++++
 lib/igt_kms.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 22418f359..68dd9a322 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -49,6 +49,7 @@
 #include <time.h>
 #include <ctype.h>
 
+#include "linux_scaffold.h"
 #include <i915_drm.h>
 
 #include "drmtest.h"
@@ -740,6 +741,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
 	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
 	[IGT_CRTC_SCALING_FILTER] = "SCALING_FILTER",
 	[IGT_CRTC_SHARPNESS_STRENGTH] = "SHARPNESS_STRENGTH",
+	[IGT_CRTC_BACKGROUND_COLOR] = "BACKGROUND_COLOR",
 };
 
 const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
@@ -2742,6 +2744,10 @@ static void igt_crtc_reset(igt_crtc_t *crtc)
 	if (igt_crtc_has_prop(crtc, IGT_CRTC_SHARPNESS_STRENGTH))
 		igt_crtc_set_prop_value(crtc, IGT_CRTC_SHARPNESS_STRENGTH, 0);
 
+	if (igt_crtc_has_prop(crtc, IGT_CRTC_BACKGROUND_COLOR))
+		igt_crtc_set_prop_value(crtc, IGT_CRTC_BACKGROUND_COLOR,
+					DRM_ARGB64_PREP(0xffff, 0, 0, 0));
+
 	crtc->out_fence_fd = -1;
 }
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 671462ede..05f70b195 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -174,6 +174,7 @@ enum igt_atomic_crtc_properties {
        IGT_CRTC_VRR_ENABLED,
        IGT_CRTC_SCALING_FILTER,
        IGT_CRTC_SHARPNESS_STRENGTH,
+       IGT_CRTC_BACKGROUND_COLOR,
        IGT_NUM_CRTC_PROPS
 };
 
-- 
2.25.1

