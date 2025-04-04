Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879EBC36010
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 04:59:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B12810E009;
	Fri,  4 Apr 2025 04:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n9x56r6H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7720010E009
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 04:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743742761; x=1775278761;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UpZIx9FYsuwNQWNwSXHJfW8YH+NSJaGgHdbDcsZxZ6s=;
 b=n9x56r6Hxrl34c6X0d430M3BEkeaLxZkMuId1GEb71GI7mOrAG8PHI+s
 7uc7pgcG0Z5TJDO2GEuNq/D9cYfJWzXKNLpdCDi7+/VjXs+9sjpJrIgZY
 TbiXN/VcOONdlFgpCjxG442QDX1YdSUTrT8u6Thi2x/hniXg2vkj5bgEs
 deH1JXDEHDrB6h4Dar1nXeOsyRh9+hC4G5+R6IMvs3cwIudXn+pnVpW05
 ftaoevlDZIb8bXKeue3YwHOvZXLHXbrnu0w3jxxuuur6EEyiavqIXzwjg
 RGMVNxb2CnPedV9anZ0sYh76jqiPmZ34BvAM18JsFnpmSov6iroUkLIi0 g==;
X-CSE-ConnectionGUID: WixJZCmUS5ORzTQOFGeJUw==
X-CSE-MsgGUID: EmzxXbpDSOWpg5w4d/46LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="32777371"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="32777371"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 21:59:20 -0700
X-CSE-ConnectionGUID: B//k9SxDSjiBV1e208/V4Q==
X-CSE-MsgGUID: 7I6j6QsaTbiVpupfgIgYrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="132190379"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 21:59:18 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, karthik.b.s@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_dirtyfb: Fix misplaced parenthesis in
 display version check
Date: Fri,  4 Apr 2025 10:45:03 +0530
Message-Id: <20250404051503.2095885-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
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

Fixed a misplaced parenthesis in the FBC display version check to ensure
correct tiling format selection.

Fixes: f0b66883398b4a07bb8fcaa3663a2140129d9a58
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_dirtyfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 8efa14447..a5707c5b1 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -386,7 +386,7 @@ igt_main
 
 					/* FBC Disp_ver 8 and below supports only I915_FORMAT_MOD_X_TILED */
 					if (data.feature == FEATURE_FBC &&
-					    intel_display_ver(intel_get_drm_devid(data.drm_fd) <= 8))
+					    intel_display_ver(intel_get_drm_devid(data.drm_fd)) <= 8)
 						data.modifier = I915_FORMAT_MOD_X_TILED;
 					else
 						data.modifier = DRM_FORMAT_MOD_LINEAR;
-- 
2.25.1

