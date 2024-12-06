Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5DAE77179
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 21:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1896A10F1DC;
	Fri,  6 Dec 2024 21:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjtXK9WY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC5310F1D2
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 21:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733520605; x=1765056605;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=7oVC0gV5YcYWxZ79Y/EExqe1zkeOja5UM7dxiT9gxXg=;
 b=GjtXK9WYOGEfzIpic13cvMjg48YTOM9j+gmOrRsRSXy4vFquuooBffUt
 UnWAKZZ6xAKMJPVQh/IHAW0wt6HGGQCYREelprG/bbtCJ6sdKioFNpES0
 9hulEzYzZ8U2u5qxu6oxfJrUPUrWQf6aTLOJ9lobtzkuSQvPe9vOWUqPB
 RIj9oRFNqNuIIPld6QG7nPaqs6ypVJ5gZpPsp63Zz1ua7XlxMcVRZS5j2
 NXVCn9eSLEMLPHdlU3yBXf+XM25W1dmFLFOwh8eO7y+8kiXAZxzQkQMr1
 koe61UGUbmaWbo9KN/P+FLx6YpZOlTphkzZhdCJ+MgogiO5WZejSLpxkG w==;
X-CSE-ConnectionGUID: CMQxItSDT36uwQZynZPyFA==
X-CSE-MsgGUID: FkBW+DfjSV+9/nbJJ2r6hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="51304476"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="51304476"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 13:27:53 -0800
X-CSE-ConnectionGUID: kpWMujzoQe+OAOduPRHTRQ==
X-CSE-MsgGUID: ++13G+1yTKqGEdSTKHfYcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="95306728"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 13:27:53 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v4 7/8] XE3: tests/intel/kms_frontbuffer_tracking: fix
 x-tiled tests for case when there is no x-tile
Date: Fri,  6 Dec 2024 13:27:47 -0800
Message-Id: <20241206212748.2101217-8-clinton.a.taylor@intel.com>
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

From: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>

On Xe3 display no more support x-tile and will disable such framebuffers

v2: Optimize display_ver checks (Sai Teja)

Signed-off-by: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>
Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index e41ee0a80..c5b3fd46f 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2181,7 +2181,12 @@ static void setup_modeset(void)
 	offscreen_fb.fb = NULL;
 	offscreen_fb.w = 1024;
 	offscreen_fb.h = 1024;
-	create_fbs(FORMAT_DEFAULT, opt.tiling);
+
+	/* Xe3 remove x-tile from display + */
+	if (drm.display_ver < 30)
+		create_fbs(FORMAT_DEFAULT, opt.tiling);
+	else
+		create_fbs(FORMAT_DEFAULT, TILING_4);
 }
 
 static void teardown_modeset(void)
@@ -2302,7 +2307,6 @@ static void setup_drrs(void)
 
 static void setup_environment(void)
 {
-	setup_drm();
 	setup_modeset();
 
 	setup_fbc();
@@ -3146,6 +3150,7 @@ static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
 	case TILING_LINEAR:
 		return intel_gen(drm.devid) >= 9;
 	case TILING_X:
+		return (intel_get_device_info(drm.devid)->display_ver > 29) ? false : true;
 	case TILING_Y:
 		return true;
 	case TILING_4:
@@ -4226,9 +4231,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	igt_output_t *output;
 
 	igt_fixture {
-		setup_environment();
+		setup_drm();
 		drm.devid = intel_get_drm_devid(drm.fd);
 		drm.display_ver = intel_display_ver(drm.devid);
+		setup_environment();
 	}
 
 	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
@@ -4537,6 +4543,11 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 					if (t.tiling == TILING_4)
 						igt_require(intel_get_device_info(drm.devid)->has_4tile);
 
+					/* Xe3 remove x-tile from display + */
+					if (t.tiling == TILING_X) {
+						igt_require(drm.display_ver < 30);
+					}
+
 					if (tiling_is_valid(t.feature, t.tiling))
 						draw_subtest(&t);
 					else
@@ -4568,7 +4579,13 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	t.format = FORMAT_DEFAULT;
 	t.flip = FLIP_PAGEFLIP;
 	t.method = IGT_DRAW_BLT;
-	t.tiling = opt.tiling;
+
+	/* Xe3 remove x-tile from display + */
+	if (drm.display_ver < 30)
+		t.tiling = opt.tiling;
+	else
+		t.tiling = TILING_4;
+
 	igt_subtest("basic") {
 		if (!is_xe_device(drm.fd))
 			igt_require_gem(drm.fd);
-- 
2.25.1

