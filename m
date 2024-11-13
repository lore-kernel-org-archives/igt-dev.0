Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09772D637D5
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 23:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0F410E776;
	Wed, 13 Nov 2024 23:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DMqeWjNi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D2C10E29C
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 23:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731538986; x=1763074986;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9U02e5kGPCsxLLjrPqXjpwircxnlmkPnalQgQXRu3xg=;
 b=DMqeWjNiJnNke4rrI5aH4BqvSJUz5+yGmtDIxSMGwSxXV/zOgpGNXIO/
 0RT9Tx07/FqyIVRNWXOqtEryZIV54SzIjvc2HqKYNrcbJTNvTCBZPW8H2
 4oQZKdWZVqv9x1PqPW2Lnj32Cf5SrLm0TFN/+/SKc9H6e0sz+9mRyExs9
 82bid03Yci+3hJ+kvSrr6++XSMvCDaCmLl9vfnSnkJSZrn1KBID+ySyDz
 GerClXczxq8IPjJDAY5AJAkvQ8IXg7BWa+8aLQn06BsW6Xg+9/dNYbnHD
 5ZQeASuinArqRBBGN1+a/5IorgFfxxaxH7iVrRxaQ3EvWFTzfjmiOvzBG Q==;
X-CSE-ConnectionGUID: UkIXlkNOQ5uDmzoO9WD9fQ==
X-CSE-MsgGUID: nak3wQtdTue2jEN8AYRVxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53999381"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53999381"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 15:03:06 -0800
X-CSE-ConnectionGUID: V619oLMiQCSUeDj9+8vjmg==
X-CSE-MsgGUID: XzX1z1RxSK6CK3ITPBFehw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="93074720"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 15:03:05 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 9/9] XE3: tests/intel/kms_frontbuffer_tracking: platform
 based handling of x-tile cases
Date: Wed, 13 Nov 2024 15:03:01 -0800
Message-Id: <20241113230301.655499-11-clinton.a.taylor@intel.com>
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

