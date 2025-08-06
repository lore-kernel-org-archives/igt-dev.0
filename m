Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23162C87FCB
	for <igt-dev@archiver.kernel.org>; Wed,  6 Aug 2025 11:52:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C843810E752;
	Wed,  6 Aug 2025 11:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mOfk7+b3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A51010E752
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Aug 2025 11:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754481128; x=1786017128;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XXbnCgpB3k4nBQZl/E3Py691iLLkd795td9ksqennGI=;
 b=mOfk7+b35w1+QUrzU9RTJdbadAPgbvo2HNu051TY5lzXmdts0dvsI/BD
 7pEiHDn/AvAJsLkhBrkso20OKuovB9tDdWXgduS7aMfpHtKpHuRfTNT2l
 dQM7w0xuguTvWJy2PdxZjAyQNXPD39SxEU1llYTX8WkGV4KmpEolXBU+D
 RkmD7sYeQCMR/noq2qr6sP/w6FPluvxUy1tzi+Ubd9qJNGm2v48c9e/Rl
 591chB9lGJvLDRFbW/aQ2ySrX5W8Jxv5ScLd7r2CML68mMFJpLqsU0424
 m1K1AmWGd8KuVnx7XMqDBj9moxqzLMFgpPLTPBlm1Idu20wYDhl4K/m7n g==;
X-CSE-ConnectionGUID: yEAIe7moSHm08tOIoxo7FA==
X-CSE-MsgGUID: Susb9EjYTWGzxZqgtb/xHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56688993"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="56688993"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 04:52:08 -0700
X-CSE-ConnectionGUID: PTPoCrroQ1CNXmr9rD+pUA==
X-CSE-MsgGUID: UeHU+PLuRBKcQBXCK8Xg0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164283770"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 04:52:05 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com, swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Arun R Murthy <arun.rmurthy@intel.com>
Subject: [PATCH i-g-t v4] tests/kms_async_flips: Replace hard coded modifiers
 with async modifiers
Date: Wed,  6 Aug 2025 17:19:59 +0530
Message-Id: <20250806114959.975809-1-santhosh.reddy.guddati@intel.com>
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

v3: Skip the test on platforms where only single modifier is supported.

v4: Add check to identify unique modifiers.

closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3768
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Arun R Murthy <arun.rmurthy@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_async_flips.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 8a943fe01..1ac5e6db0 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -650,6 +650,7 @@ static void test_invalid(data_t *data)
 	struct igt_fb fb[2];
 	drmModeModeInfo *mode;
 	int flags;
+	uint64_t mod1, mod2;
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -659,10 +660,20 @@ static void test_invalid(data_t *data)
 
 	flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
 
+	mod1 = data->plane->async_modifiers[0];
+	mod2 = data->plane->async_modifiers[data->plane->async_format_mod_count - 1];
+
+	/* Need at least 2 different modifiers to test invalid case */
+	igt_require_f(data->plane->async_format_mod_count >= 2 && mod1 != mod2,
+		      "Need at least 2 different async modifiers for invalid test\n");
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
@@ -1165,11 +1176,6 @@ igt_main
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

