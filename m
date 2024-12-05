Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D715AE7716C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 05:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707F710ED9E;
	Thu,  5 Dec 2024 05:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nXTYC3Lg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4731710ED9E
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 05:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733376713; x=1764912713;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CwS4BEz/Bfn5CiPgxy5+3fN3RhoELlJ9c/OVE3CzZWE=;
 b=nXTYC3Lgw75P5Pct7dVWkQIhsRqLxbAOzd39rVxJG6xYyMt8NwbRT6SG
 yty+t3IKXAbCCksyD0w7IxZYKIQo2UA+uu3RaWG3OC1u7wlJ0cWVQHqw3
 VQPsdiHEV7q74i/7eup5VhbFSLPBO4IzicKWQQhp3z0C+O/y4FNZCiRMG
 aelcnmQyvVcaytC35MkbT7OoynhVl1Xvs6byT9x+TyuvFLk1NxcYuLWJf
 ml92/UGK+MU195Hn1z3xn9BFnnWtKVfK9IEgHOQExJwxf2OBnYyDCHFJX
 vfiIUeF+h5sy+LhzhrStfjrxsjN8wTdz8Q92gW5yK+0giPN3LhtRXegzr A==;
X-CSE-ConnectionGUID: tAZDTBPuRiGqvgghZHG25w==
X-CSE-MsgGUID: x/bDkWpCRlWAqmJdQoga1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37335963"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="37335963"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 21:31:53 -0800
X-CSE-ConnectionGUID: LYoG9ENeSQ+2JRR/Rsvtiw==
X-CSE-MsgGUID: kpsUJij3Qc2wq5HVO7Gv6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="98954458"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 21:31:51 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, rodrigo.vivi@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_rpm: Update cursor_fb3 framebuffer
 creation format
Date: Thu,  5 Dec 2024 11:16:52 +0530
Message-Id: <20241205054652.1234964-1-jeevan.b@intel.com>
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

Updated the cursor_fb3 framebuffer creation in the cursor subtest
function to use a supported tiling format, either X-tile or linear,
for supported platforms.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_rpm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 990c50915..af8976ad5 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -1198,8 +1198,13 @@ static void cursor_subtest(bool dpms)
 		      DRM_FORMAT_MOD_LINEAR, &cursor_fb1);
 	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 		      DRM_FORMAT_MOD_LINEAR, &cursor_fb2);
-	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_XRGB8888,
-		      I915_FORMAT_MOD_X_TILED, &cursor_fb3);
+	if(igt_display_has_format_mod(&ms_data.display, DRM_FORMAT_XRGB8888,
+				      I915_FORMAT_MOD_X_TILED))
+		igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_XRGB8888,
+			      I915_FORMAT_MOD_X_TILED, &cursor_fb3);
+	else
+		 igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_XRGB8888,
+			       DRM_FORMAT_MOD_LINEAR, &cursor_fb3);
 
 	fill_igt_fb(&cursor_fb1, 0xFF00FFFF);
 	fill_igt_fb(&cursor_fb2, 0xFF00FF00);
-- 
2.25.1

