Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861A9CCF9E3
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 08:10:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF3010E53F;
	Tue,  4 Nov 2025 08:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PJC0owi8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AA710E541
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 08:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762243831; x=1793779831;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CW2EQw5t8+oOH9oLpS4+rNkHEQD6PCEA46UNI0l3mCs=;
 b=PJC0owi8n5pBeVyTdW/ZOM2WK7igSCfEFMPdsO8oYVCZJkTfI+aW7tKD
 CsaYrOL+h2waJxuz4zHM4+gPvE7IoosNWNJPwgN2UpvnirbRt1vNd/cR6
 egyTLcJaQGINZ9b36+yTk0g5s7JQ1DKw3IHOiQ5XtWLl+8gl7Wkw6thwM
 TXdUc0t5wtz88VAUypwUKrRldEJEDLKVwXBA8Oyn4JVEF+WXfKeWVtZDq
 ccRj+BDzMPHEwU0vY/NRPwY+RJ1NCxDmx9g9jBE+Tp2d/85HUA29T20WP
 G9KUTu0bUn0YpIcze3xV//MSnf+AZ9S6VvixQs4xnD66I/xvLDTsAAoLX Q==;
X-CSE-ConnectionGUID: qstGBI2zSeScOzBbFnIJgQ==
X-CSE-MsgGUID: MiBwe6BdRGCbbHstWkL9Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64429297"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="64429297"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 00:10:31 -0800
X-CSE-ConnectionGUID: i0U3Xp3TT/K4Q04QZ2HGww==
X-CSE-MsgGUID: A/cdT2UETEGa1LCgVZHXVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="187041475"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 00:10:29 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_vrr: Fix logical condition for DRRS support
Date: Tue,  4 Nov 2025 13:40:09 +0530
Message-ID: <20251104081009.1474197-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Adjust the condition to correctly identify platforms newer than
LNL and disable DRRS accordingly.

Fixes: 734ee5297842 ("tests/kms_vrr: Skip DRRS-related tests on LNL and newer platforms")

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index bcb756202..638bfb6a6 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -1057,7 +1057,7 @@ static bool config_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	}
 
 	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)) &&
-	    (intel_display_ver(data->drm_fd) >= 14)) {
+	    (intel_display_ver(data->drm_fd) > 14)) {
 		igt_info("DRRS is not supported on LNL and newer platforms\n");
 		return false;
 	}
-- 
2.43.0

