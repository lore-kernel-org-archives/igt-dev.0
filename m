Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B816D6A228
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 19:04:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA8310E2C5;
	Thu, 14 Nov 2024 19:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eLvCEWAP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BD010E2BD
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 19:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731611045; x=1763147045;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=picALkqOpleVBpzf3kO7WWG0g312kFG5U4FmvMsrlIk=;
 b=eLvCEWAPMb/xZsLILw36YhNQwVTEcsWdevroVbJRhn8lSvbzUvUiRUFX
 SgYzVK0F7dWdH49bpxHS5b6VM9hcC+azPfEFxLAJWFZvn0aAw7bDRbDFR
 UO0f8+FSbZJ82aJsGgPzmThBALlyACMooFQAroqY7QSEeXDgCgNm90Kbt
 ZzWC2ZsXurxgK9IiWnGiN1rc4UmZuJmb4Kvu6Y2KgQ6ID7aMstX64Rd50
 DPJots/RcZbQYgpAXntNVuqJwAowvaZrL6r09WoKqNUZvyjdHOX3H81FW
 N52LMjZfGYUB4L1qzs40cd8SK+nOf2wkI/Lrii90XchfMv8N+8NiNNpB/ g==;
X-CSE-ConnectionGUID: yfaMbjibRrK4qiXWqkN5bQ==
X-CSE-MsgGUID: wzGfxgtfQG2ASudwIzub3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="34442578"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="34442578"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 11:03:44 -0800
X-CSE-ConnectionGUID: 0eASpEEIRPq4Q/3hVixY1A==
X-CSE-MsgGUID: 2VJQvxC/TKyoCnThs9YXwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93242111"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 11:03:43 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 8/9] XE3: tests/intel/kms_frontbuffer_tracking: fix
 x-tiled tests for case when there is no x-tile
Date: Thu, 14 Nov 2024 11:03:38 -0800
Message-Id: <20241114190339.3885752-9-clinton.a.taylor@intel.com>
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

From: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>

On Xe3 display no more support x-tile and will disable such framebuffers

Signed-off-by: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>
Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index b7e3f7379..8af41caf3 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2421,7 +2421,12 @@ static void setup_modeset(void)
 	offscreen_fb.fb = NULL;
 	offscreen_fb.w = 1024;
 	offscreen_fb.h = 1024;
-	create_fbs(FORMAT_DEFAULT, opt.tiling);
+
+	/* Xe3 remove x-tile from display + */
+	if (drm.display_ver <= 20)
+		create_fbs(FORMAT_DEFAULT, opt.tiling);
+	else
+		create_fbs(FORMAT_DEFAULT, TILING_4);
 }
 
 static void teardown_modeset(void)
@@ -2542,7 +2547,6 @@ static void setup_drrs(void)
 
 static void setup_environment(void)
 {
-	setup_drm();
 	setup_modeset();
 
 	setup_fbc();
@@ -3386,6 +3390,7 @@ static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
 	case TILING_LINEAR:
 		return intel_gen(drm.devid) >= 9;
 	case TILING_X:
+		return (intel_get_device_info(drm.devid)->display_ver > 20) ? false : true;
 	case TILING_Y:
 		return true;
 	case TILING_4:
@@ -4468,9 +4473,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	igt_output_t *output;
 
 	igt_fixture {
-		setup_environment();
+		setup_drm();
 		drm.devid = intel_get_drm_devid(drm.fd);
 		drm.display_ver = intel_display_ver(drm.devid);
+		setup_environment();
 	}
 
 	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
@@ -4774,6 +4780,11 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 					if (t.tiling == TILING_4)
 						igt_require(intel_get_device_info(drm.devid)->has_4tile);
 
+					/* Xe3 remove x-tile from display + */
+					if (t.tiling == TILING_X) {
+						igt_require(drm.display_ver <= 20);
+					}
+
 					if (tiling_is_valid(t.feature, t.tiling))
 						draw_subtest(&t);
 					else
@@ -4805,7 +4816,13 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	t.format = FORMAT_DEFAULT;
 	t.flip = FLIP_PAGEFLIP;
 	t.method = IGT_DRAW_BLT;
-	t.tiling = opt.tiling;
+
+	/* Xe3 remove x-tile from display + */
+	if (drm.display_ver <= 20)
+		t.tiling = opt.tiling;
+	else
+		t.tiling = TILING_4;
+
 	igt_subtest("basic") {
 		if (!is_xe_device(drm.fd))
 			igt_require_gem(drm.fd);
-- 
2.25.1

