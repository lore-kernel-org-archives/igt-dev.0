Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16295D6A22B
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 19:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F3F10E359;
	Thu, 14 Nov 2024 19:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UDFmRE9G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C37810E093
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 19:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731611045; x=1763147045;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9U02e5kGPCsxLLjrPqXjpwircxnlmkPnalQgQXRu3xg=;
 b=UDFmRE9GT7ddbrQ9cZij/nGpCrhRAVGp7ux5t12hGDWMKhEFzJOwaqOb
 zKjFeKKSUu+F2geg/LJHc85N7atDzCYQ5iAL4UqJcI6MVR6D73WNAh+Sg
 bNirb+gRsOAhE6hiOwo006Qav6iUIw1fiPFlFuXzigpSgjJz38KAB2KOO
 E+UtcxXWWFTOF2O8DCnwAbmy9jj07HyfW18h01411N00eP7drtIq1pLzt
 ANYZ9+DQHqj4BL0ebT7FPdcTUx663IDsWVYbQrQlkDIRCC0mG2N3gBIEs
 NTi6T3uElSt0+Skn05CAKdqK1wjeBe71wP3S7F+Bvl5Beu9R6AEv5beUB w==;
X-CSE-ConnectionGUID: 76bVYLkqQ16UchnZzK5TBw==
X-CSE-MsgGUID: 1URfN+jiTSS6snD4L0az8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="34442579"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="34442579"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 11:03:44 -0800
X-CSE-ConnectionGUID: 5AIi9N02TimTYKM1IwFruA==
X-CSE-MsgGUID: ULtA07lXQNGxigAQ3ZchjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93242113"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 11:03:43 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 9/9] XE3: tests/intel/kms_frontbuffer_tracking:
 platform based handling of x-tile cases
Date: Thu, 14 Nov 2024 11:03:39 -0800
Message-Id: <20241114190339.3885752-10-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
References: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
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
 tests/intel/kms_frontbuffer_tracking.c | 31 ++++++++++----------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 8af41caf3..8ceb7b860 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1271,7 +1271,7 @@ struct test_mode {
 		TILING_Y,
 		TILING_4,
 		TILING_COUNT,
-		TILING_DEFAULT = TILING_X,
+		TILING_AUTOSELECT,
 	} tiling;
 
 	enum igt_draw_method method;
@@ -1394,7 +1394,7 @@ struct {
 	.only_pipes = PIPE_COUNT,
 	.shared_fb_x_offset = 248,
 	.shared_fb_y_offset = 500,
-	.tiling = TILING_DEFAULT,
+	.tiling = TILING_AUTOSELECT,
 };
 
 struct modeset_params {
@@ -2421,12 +2421,7 @@ static void setup_modeset(void)
 	offscreen_fb.fb = NULL;
 	offscreen_fb.w = 1024;
 	offscreen_fb.h = 1024;
-
-	/* Xe3 remove x-tile from display + */
-	if (drm.display_ver <= 20)
-		create_fbs(FORMAT_DEFAULT, opt.tiling);
-	else
-		create_fbs(FORMAT_DEFAULT, TILING_4);
+	create_fbs(FORMAT_DEFAULT, opt.tiling);
 }
 
 static void teardown_modeset(void)
@@ -4476,6 +4471,14 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
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
 
@@ -4780,11 +4783,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 					if (t.tiling == TILING_4)
 						igt_require(intel_get_device_info(drm.devid)->has_4tile);
 
-					/* Xe3 remove x-tile from display + */
-					if (t.tiling == TILING_X) {
-						igt_require(drm.display_ver <= 20);
-					}
-
 					if (tiling_is_valid(t.feature, t.tiling))
 						draw_subtest(&t);
 					else
@@ -4816,12 +4814,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	t.format = FORMAT_DEFAULT;
 	t.flip = FLIP_PAGEFLIP;
 	t.method = IGT_DRAW_BLT;
-
-	/* Xe3 remove x-tile from display + */
-	if (drm.display_ver <= 20)
-		t.tiling = opt.tiling;
-	else
-		t.tiling = TILING_4;
+	t.tiling = opt.tiling;
 
 	igt_subtest("basic") {
 		if (!is_xe_device(drm.fd))
-- 
2.25.1

