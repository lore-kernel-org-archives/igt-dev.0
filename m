Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75CEE67A6F
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 06:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14CE10E63D;
	Tue,  3 Mar 2026 06:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gpW5VBz5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F1310E63D
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 06:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772520732; x=1804056732;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VOvUOkFYs5MyqS3urq4Xqr7zxl24SPH4hYAvqCd8v+I=;
 b=gpW5VBz5xzfyaVwoGUOLQIjV1w6KF4EcaIf+1ewgAl5hq/2clG7vNUT/
 Bk1A2YTHLox95mzDjhopOYw7j4GLfxZSRoc84GQU5z1WjZqdFrxbs1q1f
 eDtE/MVmnHZaCtARn9Clp+aAYIuAkagojqM0pcUAOvNCyJ3mks3FjrX9z
 O9nBqWIg5kENhhdz27xG4qGXUvQL9kBz9F6mAMK5kzAD80PFaPI9wmRQS
 nYZm58FSm6ZFv6J6IBVk0kzsJIF5qIs3QhpqyWpcxdmLP0kactDNAjpRS
 lDUEFdU25GQjFhqcikuhJAOjXtk9NBA6kybicNsO5pb4dLFjVCE4+L7Di A==;
X-CSE-ConnectionGUID: wO+toz8ET6imba/Sld3OHw==
X-CSE-MsgGUID: lUtQu4mtTeGmuM86/pQ4Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="91115078"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="91115078"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 22:52:12 -0800
X-CSE-ConnectionGUID: yFIPWQ6URIqBudjuZTm69w==
X-CSE-MsgGUID: jAPVkueNQJWchbodl6+n0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="218011943"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 22:52:10 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH] include/drm-uapi-experimental: Remove temporary
 NO_COMPRESSION experimental macros
Date: Tue,  3 Mar 2026 12:21:13 +0530
Message-ID: <20260303065112.159575-2-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
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

Remove the temporary NO_COMPRESSION macros
(DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION and
DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT) from intel_drm_local.h.
These macros are now part of upstream drm-next and provided through
include/drm-uapi/xe_drm.h. They were originally added for early
development and are no longer needed.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
---
 include/drm-uapi-experimental/intel_drm_local.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/drm-uapi-experimental/intel_drm_local.h b/include/drm-uapi-experimental/intel_drm_local.h
index 9949d5350..b48c9e219 100644
--- a/include/drm-uapi-experimental/intel_drm_local.h
+++ b/include/drm-uapi-experimental/intel_drm_local.h
@@ -20,9 +20,6 @@ extern "C" {
  * clean these up when kernel uapi headers are sync'd.
  */
 
-#define DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION (1 << 3)
-#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
-
 #if defined(__cplusplus)
 }
 #endif
-- 
2.52.0

