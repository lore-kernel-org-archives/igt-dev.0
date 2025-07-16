Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465D6C83F22
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 16:13:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F027F10E295;
	Wed, 16 Jul 2025 16:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DI+hIk25";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B6910E295
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 16:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752682399; x=1784218399;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2TUK97mvxh6ldB8IERRdhdZ/yp/HJu7TyCS3wYsTufk=;
 b=DI+hIk25yO4ljygD+DzPVzyQ8jYBGNjp5+IdcLI3BC6uAnL6tDEL8wzu
 uRKO1NwyzC77BGnBx8AzIJdsl9bcvV1B6l3str1wnwhlL9nKe4dq7/G2p
 3iZWTpI+XtqvacAYpfM3kJg6gXVJYzcvmVDG1BrU0ANWUBMhyLpS75hhp
 oNZMZcjUN72REWqzDasDic9eyF8rnebzt/NEoOUmdXbLqD7NE4KZkuj6l
 xG+OYZywdy+ABQM2d0AqqQeWsBiWOOWDB9NRrrDyUZpXgVE4WKRHmPOrW
 0bNvd5sheNTaVFZCDClfteFHY/ne6TbzZ0tu/rLKjWzChNe80wKaEbhZv w==;
X-CSE-ConnectionGUID: hikzsvsFSKCmw+y6DRbklg==
X-CSE-MsgGUID: GxiKolIBTRi1OqHnoGfoLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="72389918"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="72389918"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 09:13:19 -0700
X-CSE-ConnectionGUID: oZ0iH3b/TUKSksWQU9NjPQ==
X-CSE-MsgGUID: Xb3CBZz3QvGE+zNM8vdH6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="163173474"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 09:13:16 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, chaitanya.kumar.borah@intel.com,
 arun.r.murthy@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_async_flips: Replace hard coded modifiers
 with async modifiers
Date: Wed, 16 Jul 2025 21:42:31 +0530
Message-Id: <20250716161231.410389-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

Use the IN_FORMATS_ASYNC uAPI to get the list of async supported modifiers.
select the 2 unique modifiers from this list to test invalid async test,
removing the hard coded dependency across platforms.

v2: Use first and last modifier from the async supported format list for
invalid subtest.

closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3768
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index ddac904ce..1d4684c51 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -598,6 +598,7 @@ static void test_invalid(data_t *data)
 	struct igt_fb fb[2];
 	drmModeModeInfo *mode;
 	int flags;
+	uint64_t mod1, mod2;
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -607,10 +608,16 @@ static void test_invalid(data_t *data)
 
 	flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
 
+	mod1 = data->plane->async_modifiers[0];
+	mod2 = data->plane->async_modifiers[(data->plane->async_format_mod_count) - 1];
+
+	igt_info("using modifier1 %s and modifier2 %s\n",
+		 igt_fb_modifier_name(mod1), igt_fb_modifier_name(mod2));
+
 	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
-		      I915_FORMAT_MOD_X_TILED, &fb[0]);
+		      mod1, &fb[0]);
 	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
-		      I915_FORMAT_MOD_Y_TILED, &fb[1]);
+		      mod2, &fb[1]);
 
 	igt_plane_set_fb(data->plane, &fb[0]);
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
@@ -1113,11 +1120,6 @@ igt_main
 		test_init_ops(&data);
 		/* TODO: support more vendors */
 		igt_require(is_intel_device(data.drm_fd));
-		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
-						       I915_FORMAT_MOD_X_TILED));
-		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
-						       I915_FORMAT_MOD_Y_TILED));
-
 		run_test(&data, test_invalid);
 	}
 
-- 
2.34.1

