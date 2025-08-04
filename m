Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF93CC87FCB
	for <igt-dev@archiver.kernel.org>; Mon,  4 Aug 2025 14:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7280310E09A;
	Mon,  4 Aug 2025 14:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hnw9vhpo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14E810E09A
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Aug 2025 14:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754316799; x=1785852799;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5eUy+n32pZl5n4kMIob92nk/7P3S0NRNeZQcd/2PLMc=;
 b=hnw9vhpoApReWGxzlNKDver6NOzP/+ob+0j1ft8GhVkMB1IbAvHnEim3
 RF1uy5Ft206+VXEX/oiLGADFvaKArHi7herelcMSr8jBz4z0Ie01O/lM/
 9AbadnfNY/A7Qmg68jWkq24B+3djjWABc3es6M2IY+IIKVCcWAIMKal+y
 5DVDB2w8qSKwzJHK/XF6joqvT0e92s6Z/tNr3SwziL/ikPFT3nE06ZKyA
 L47zsOYJcr9hnqw/mUMKq1JfA/1iss+pxWlFlyhC+EsGQG2o+fHeLnzNV
 /MYpBia3jMEoqO34zyU0BwZYYqEorlpuyeO5yb9MVhduD0QHp8tLQQbE9 g==;
X-CSE-ConnectionGUID: ZEXVQfPGSwavb0JUFNf39Q==
X-CSE-MsgGUID: Q6+CXPIuSQ2u8Iv/rGVPLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="67279644"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="67279644"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 07:13:19 -0700
X-CSE-ConnectionGUID: V0xK2ICSSQW6vlqNVV0D9A==
X-CSE-MsgGUID: RrvpJtPITF265tEZ0d0uCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="164621109"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 07:13:17 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com, swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Arun R Murthy <arun.rmurthy@intel.com>
Subject: [PATCH i-g-t v3] tests/kms_async_flips: Replace hard coded modifiers
 with async modifiers
Date: Mon,  4 Aug 2025 19:41:15 +0530
Message-Id: <20250804141115.953393-1-santhosh.reddy.guddati@intel.com>
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

closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3768
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Arun R Murthy <arun.rmurthy@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_async_flips.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 8a943fe01..40a71fe6f 100644
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
 
+	/* Need at least 2 different modifiers to test invalid case */
+	igt_require_f(data->plane->async_format_mod_count >= 2,
+		      "Need at least 2 async modifiers for invalid test\n");
+
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

