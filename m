Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F010E77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 21:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104C310EC47;
	Wed, 18 Dec 2024 21:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GnK+hs8j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBED810EA64
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 21:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734557821; x=1766093821;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=vyu7fwUz3mRHztcg5E6WU5+OwUgN0m5I3QJso+C+7Xc=;
 b=GnK+hs8j3Cj7/q0nt6YOiu4ftFsdIIjUgOOIX/4fVPvTwu2PWNE9lZnh
 +3hkV0s5w0cAItMyziAZCjHDr2M8xVCaak7gS4wnVjictYYbLxIcsFhmg
 fjYQEG5gkud2LpcBvUksdBYInmGD6ye8OPikClPOiYSMJEhls8Av1tFeE
 Hx72UYGwK6pGsQhxWsVmzVfd8yUczmyygnR8Kzr+dTAueASDCzQzjdVou
 UWkWExQXn9+bXRVOeSctXqQqFH2HjV9iC85gY2F6XY3YRDUAG9vPNSPJD
 3HmQ2Qu58M2Aa8DJYUOLker5LbeNW9PnAudl3DfUeABeL4iPzjBlqr+Wj g==;
X-CSE-ConnectionGUID: dfqtyMeqReaswgk4VE1Snw==
X-CSE-MsgGUID: zd5123aQQT6u2zl9h3bH8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34379762"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="34379762"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 13:36:58 -0800
X-CSE-ConnectionGUID: wl9U7xr+R12DwaBz74SAeA==
X-CSE-MsgGUID: Tdv1j7njREGz65nSYSDdrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="128973922"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 13:36:58 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 7/7] tests/intel/kms_frontbuffer_tracking: fix
 x-tiled tests for case when there is no x-tile
Date: Wed, 18 Dec 2024 13:36:54 -0800
Message-Id: <20241218213654.2734573-8-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
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

From: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>

x-tile is not supported from xe3 onwards. Handle this conclusively
in all the kms_frontbuffer_tracking subtest options.

v2: Optimize display_ver checks (Sai Teja)

Signed-off-by: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index e41ee0a80..ba564fafa 100644
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
@@ -2181,6 +2181,7 @@ static void setup_modeset(void)
 	offscreen_fb.fb = NULL;
 	offscreen_fb.w = 1024;
 	offscreen_fb.h = 1024;
+
 	create_fbs(FORMAT_DEFAULT, opt.tiling);
 }
 
@@ -2302,7 +2303,6 @@ static void setup_drrs(void)
 
 static void setup_environment(void)
 {
-	setup_drm();
 	setup_modeset();
 
 	setup_fbc();
@@ -3146,6 +3146,7 @@ static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
 	case TILING_LINEAR:
 		return intel_gen(drm.devid) >= 9;
 	case TILING_X:
+		return (intel_get_device_info(drm.devid)->display_ver > 29) ? false : true;
 	case TILING_Y:
 		return true;
 	case TILING_4:
@@ -4226,9 +4227,18 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	igt_output_t *output;
 
 	igt_fixture {
-		setup_environment();
+		setup_drm();
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
+		setup_environment();
 	}
 
 	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
@@ -4537,6 +4547,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 					if (t.tiling == TILING_4)
 						igt_require(intel_get_device_info(drm.devid)->has_4tile);
 
+
 					if (tiling_is_valid(t.feature, t.tiling))
 						draw_subtest(&t);
 					else
@@ -4569,6 +4580,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	t.flip = FLIP_PAGEFLIP;
 	t.method = IGT_DRAW_BLT;
 	t.tiling = opt.tiling;
+
 	igt_subtest("basic") {
 		if (!is_xe_device(drm.fd))
 			igt_require_gem(drm.fd);
-- 
2.25.1

