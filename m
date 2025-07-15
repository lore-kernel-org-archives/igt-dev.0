Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147C2C83F17
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 15:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD62010E600;
	Tue, 15 Jul 2025 15:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="az+b+P/D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DEC310E609
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 15:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752594551; x=1784130551;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2crllcFcFD1zyNRVHKyvqMhfWmFU8M0fkHi11MeHmow=;
 b=az+b+P/DaMN9VlJRomoOm6z2ZxQ4yiqDKFANdxkKye4ruucddZBZOlUV
 Akpu2rU6VAVQwHE5dac19uPduQ7kcDXPZ1DsDxuQl9hEGQlLv/0QK8gTc
 1Pp8bT3NVX17ZPMnWNJN8ngv2sg2F5ppkOvSh1IxpxF5wR8Kw8STAM86s
 GV2NiFsdkTGxTmRpRmkuh+8zKH7qsqsptSwsMTjIjB533UBgQBiqX90qx
 Ly8MAscDh7zqC5bDxBB33w8FNVlQV5bZkoPNYZHSFWfrIaknvSuc/VcXG
 JoqkSSzFq0DIVgiJ0AbEQ4IB/0qWv0+y0RjgYhEHC0scTO3XYTMOQ8Pij A==;
X-CSE-ConnectionGUID: WpL9hpYvSNa72YCz+5oCQw==
X-CSE-MsgGUID: xQVFu7c/TXmXCYeojEshkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54675946"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="54675946"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 08:49:10 -0700
X-CSE-ConnectionGUID: Rsdfu2HnQNikdd4Ya9WrPg==
X-CSE-MsgGUID: fFnfW+nTT4GrB0s17Eh8cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="157363530"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 08:49:08 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, chaitanya.kumar.borah@intel.com,
 arun.r.murthy@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t] tests/kms_async_flips: Replace hard coded modifiers
 with async modifiers
Date: Tue, 15 Jul 2025 21:18:27 +0530
Message-Id: <20250715154827.318741-1-santhosh.reddy.guddati@intel.com>
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

closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3768
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index ddac904ce..ed95ffc96 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -598,6 +598,7 @@ static void test_invalid(data_t *data)
 	struct igt_fb fb[2];
 	drmModeModeInfo *mode;
 	int flags;
+	uint64_t mod1, mod2, found;
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -607,10 +608,35 @@ static void test_invalid(data_t *data)
 
 	flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
 
+	/*
+	 * TODO: As the async supported modifiers are currently duplicated in the list,
+	 * the below approach is chosen to find unique modifiers.
+	 * Get the first two supported async modifiers for the current plane.
+	 */
+	mod1 = 0;
+	mod2 = 0;
+	found = 0;
+	for (int i = 0; i < data->plane->async_format_mod_count && found < 2; i++) {
+		uint64_t mod = data->plane->async_modifiers[i];
+
+		if (mod1 == 0) {
+			mod1 = mod;
+			found = 1;
+		} else if (mod != mod1) {
+			mod2 = mod;
+			found = 2;
+			break;
+		}
+	}
+
+	igt_require_f(found == 2, "Need at least two distinct async modifiers for this test\n");
+
+	igt_debug("mod1 = %s, mod2 = %s\n", igt_fb_modifier_name(mod1), igt_fb_modifier_name(mod2));
+
 	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
-		      I915_FORMAT_MOD_X_TILED, &fb[0]);
+		      mod1, &fb[0]);
 	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
-		      I915_FORMAT_MOD_Y_TILED, &fb[1]);
+		      mod2, &fb[1]);
 
 	igt_plane_set_fb(data->plane, &fb[0]);
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
@@ -1113,11 +1139,6 @@ igt_main
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

