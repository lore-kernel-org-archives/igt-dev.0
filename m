Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B793E7717F
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 21:30:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7CD10F1D9;
	Fri,  6 Dec 2024 21:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPNwshne";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FCE10F1CF
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 21:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733520605; x=1765056605;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=L4AjxUQfJRn1Um6tNkzUswOPjvzUxVTrah/UWrm+icY=;
 b=NPNwshneqkAeiAaTyX3uxShDrVw/r6ZDH9uvnSemjcb2HRdCUeMOz3qT
 0zBIyVh4dE4SwwWlfv6VixiqqxpqAiUCPNfIHjVVjvdzkO3FWQG5Z3uOz
 /6K2Por+2Pb4U0pGcOQkqkrHXwu3VUmbtvVUclHf/lmNSYwNHkGDOCX4u
 a+E08W0Tk+I5cAZGrFvgxTukaNufFcZcUUC8hZ/eOph0aTgZwykh1f2NT
 RP8iJYVl/WFmFpU+/D4UdhhQodBnv2h6SI4UfWVhdjdARRZRK9ZyUGWNb
 KGMOLebiUz3LH5DrAHnB9gL4twn5zrq1K0ioaFmAsdL/KwB0QTBlDu/YG A==;
X-CSE-ConnectionGUID: BCT5btrUQ9iRus7Ep9CO6g==
X-CSE-MsgGUID: M5Et3n7zRs+CApQNk+bBgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="51304477"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="51304477"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 13:27:54 -0800
X-CSE-ConnectionGUID: 7zxTEAzXRIKOrVp78WxBqg==
X-CSE-MsgGUID: cQOB8aQYTCGCBsEYCT6kZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="95306729"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 13:27:53 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v4 8/8] XE3: tests/intel/kms_frontbuffer_tracking:
 platform based handling of x-tile cases
Date: Fri,  6 Dec 2024 13:27:48 -0800
Message-Id: <20241206212748.2101217-9-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
References: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
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

From: Vinod Govindapillai <vinod.govindapillai@intel.com>

x-tile is not supported from xe3 onwards. Handle this conclusively
in all the kms_frontbuffer_tracking subtest options.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 29 +++++++++++---------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index c5b3fd46f..ba564fafa 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1031,7 +1031,7 @@ struct test_mode {
 		TILING_Y,
 		TILING_4,
 		TILING_COUNT,
-		TILING_DEFAULT = TILING_X,
+		TILING_AUTOSELECT,
 	} tiling;
 
 	enum igt_draw_method method;
@@ -1154,7 +1154,7 @@ struct {
 	.only_pipes = PIPE_COUNT,
 	.shared_fb_x_offset = 248,
 	.shared_fb_y_offset = 500,
-	.tiling = TILING_DEFAULT,
+	.tiling = TILING_AUTOSELECT,
 };
 
 struct modeset_params {
@@ -2182,11 +2182,7 @@ static void setup_modeset(void)
 	offscreen_fb.w = 1024;
 	offscreen_fb.h = 1024;
 
-	/* Xe3 remove x-tile from display + */
-	if (drm.display_ver < 30)
-		create_fbs(FORMAT_DEFAULT, opt.tiling);
-	else
-		create_fbs(FORMAT_DEFAULT, TILING_4);
+	create_fbs(FORMAT_DEFAULT, opt.tiling);
 }
 
 static void teardown_modeset(void)
@@ -4234,6 +4230,14 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		setup_drm();
 		drm.devid = intel_get_drm_devid(drm.fd);
 		drm.display_ver = intel_display_ver(drm.devid);
+
+		/* TILING_X is not supported from Xe3 onwards. If the tiling
+		 * is not set explicitly using the commandline parameter,
+		 * handle the default tiling based on the platform.
+		 */
+		if (opt.tiling == TILING_AUTOSELECT)
+			opt.tiling = drm.display_ver >= 30 ? TILING_4 : TILING_X;
+
 		setup_environment();
 	}
 
@@ -4543,10 +4547,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 					if (t.tiling == TILING_4)
 						igt_require(intel_get_device_info(drm.devid)->has_4tile);
 
-					/* Xe3 remove x-tile from display + */
-					if (t.tiling == TILING_X) {
-						igt_require(drm.display_ver < 30);
-					}
 
 					if (tiling_is_valid(t.feature, t.tiling))
 						draw_subtest(&t);
@@ -4579,12 +4579,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	t.format = FORMAT_DEFAULT;
 	t.flip = FLIP_PAGEFLIP;
 	t.method = IGT_DRAW_BLT;
-
-	/* Xe3 remove x-tile from display + */
-	if (drm.display_ver < 30)
-		t.tiling = opt.tiling;
-	else
-		t.tiling = TILING_4;
+	t.tiling = opt.tiling;
 
 	igt_subtest("basic") {
 		if (!is_xe_device(drm.fd))
-- 
2.25.1

