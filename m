Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F27D637D0
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 23:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D493110E778;
	Wed, 13 Nov 2024 23:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVtC9Nxj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75AC10E29B
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 23:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731538986; x=1763074986;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=picALkqOpleVBpzf3kO7WWG0g312kFG5U4FmvMsrlIk=;
 b=QVtC9Nxjbl5EZmfpaWR5Rpw/mysQ91zBefiTbbu22d98OsFFXHidxD6O
 HTlGzAYdrsZPmaxRUKXUY+P/uWBnxTBOhdCR0gaJ9bLM6SGfDBhHDuhlR
 Q0pZCwPZoO3W9DAM6Y3YxUnIajfbXl307IhfAI9jGNtThRLsKtIkWfwqg
 j7ES6rARwcME/sKOA57h92bkwLjXDWVw9yv1l5ueknxR205kIq9k/jK5/
 HhepELKs7+u5B2y5kDrnqNQTLbdj0ObRKib5BkDKEgp5CMomF4oUQNbGy
 7cc9i8Hun8MRpXDhAiGy7g9kI8C+XAT0kx2ntMbcd574SD2ZFcf9GBhjJ w==;
X-CSE-ConnectionGUID: 8C+WilGpTzCrpc/CjvjIaw==
X-CSE-MsgGUID: AgxoLp2VRDmedld7LNjYTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53999380"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53999380"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 15:03:06 -0800
X-CSE-ConnectionGUID: NEF4Fg6uQZ+EPuhqVBLOng==
X-CSE-MsgGUID: NmvLxHmNSw65PvYbBjJflg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="93074719"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 15:03:05 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 8/9] XE3: tests/intel/kms_frontbuffer_tracking: fix
 x-tiled tests for case when there is no x-tile
Date: Wed, 13 Nov 2024 15:03:00 -0800
Message-Id: <20241113230301.655499-10-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241113230301.655499-1-clinton.a.taylor@intel.com>
References: <20241113230301.655499-1-clinton.a.taylor@intel.com>
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

