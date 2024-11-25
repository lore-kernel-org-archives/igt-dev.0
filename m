Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DACD58D69
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 16:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E342210E6BA;
	Mon, 25 Nov 2024 16:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LflMYfFP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A0B10E6BA
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 16:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732553727; x=1764089727;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wIDI+jJ1KD93q37QYWyYSf7lpVFnPy3t/EP6os530Xw=;
 b=LflMYfFPzusp6qIAU/WS6zi7M2/u8kQO4SQg3UjWVJtjK4qWMwllLSuj
 BXZ5mDq9tNEo1Y9KoBS5pUdUCqO11cveOuisAyHL3aW17TLBd5B+PflNi
 nhj3fHLYxWh+SSRhFxqIACMuuT3MZ50var/tuLR9p7+1nl9ZngwFXlGVK
 9VPJa1AVIb+N99ZbX07ibJpOa9VPD7JOk87di2D454psXpb8LQrR/NnL6
 O0NPwwwvdhMXQnpUMaSN1yoadbYwkSKUMmMsjsG7JsYF9wkvT0/CuOaXY
 /dUSNnhcoDlydb36uKtGHje0E4DF17BbxIniHwMFdEVIp9m1PIDoe+5Zy Q==;
X-CSE-ConnectionGUID: nA+KAQOHQiqdFxHVWTqn+g==
X-CSE-MsgGUID: 76aft3csTnCfFz0+MktTmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32801791"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="32801791"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 08:55:26 -0800
X-CSE-ConnectionGUID: jkRe768TR2OpqEvdLqz69A==
X-CSE-MsgGUID: VvvuMbCYSAO/c6/DjpJZHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="91457467"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 08:55:25 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH] tests/intel/kms_pm_rpm: Update cursor_fb3 framebuffer
 creation format
Date: Mon, 25 Nov 2024 22:40:28 +0530
Message-Id: <20241125171028.383914-1-jeevan.b@intel.com>
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

Updated cursor_fb3 framebuffer creation in the cursor subtest function
to use linear tiling instead of x-tile. As x-tile is no longer supported
on latest platforms.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_rpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 990c50915..aeeaf69f7 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -1199,7 +1199,7 @@ static void cursor_subtest(bool dpms)
 	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 		      DRM_FORMAT_MOD_LINEAR, &cursor_fb2);
 	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_XRGB8888,
-		      I915_FORMAT_MOD_X_TILED, &cursor_fb3);
+		      DRM_FORMAT_MOD_LINEAR, &cursor_fb3);
 
 	fill_igt_fb(&cursor_fb1, 0xFF00FFFF);
 	fill_igt_fb(&cursor_fb2, 0xFF00FF00);
-- 
2.25.1

