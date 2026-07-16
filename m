Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90C2C44511
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 15:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF0810E1A7;
	Thu, 16 Jul 2026 15:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ERZZM/a3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5419710F34C
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 15:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784216004; x=1815752004;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vs29ErJ+TfRoZOzUDjr81CSqvcEtPwD0riFAqhqy7Vo=;
 b=ERZZM/a3PQiUmoyPgzkPQ7bScc+6yOoUtDu7dlGjuMZcEWqX8ectYFNI
 f75yOTVV4cu/BGGhdZ3LNnkjwHRWx9kwlO91vm16DTHEMB9dk0eBxp2uc
 EZLIDybHqiTKJHBocfOf7HDGYsFTH8EbCtaoPR2Zsr2z5HzpiuzgDi4qz
 EiFZh8uNoJBLdoaOACDca01UeGRLELYZg5nCAd2vMf++XKd4FxerGKXnK
 thKjMiZmqPVIm+3UMr12mBUmYsrFw/KiceniPUOoxQtqXA2uTnp2D1qnG
 9y4i29uFMtfBUvVU5qOhoUpn/A+8JUmgFgJFIfMiTpe0lEgA3qLQT0jFF g==;
X-CSE-ConnectionGUID: po18oUSPRgimKfckZiWNSg==
X-CSE-MsgGUID: WBGoi4pqRwGeALHVd+QaAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84971937"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84971937"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 08:33:24 -0700
X-CSE-ConnectionGUID: esJYwOorS2yeaXItLjidXg==
X-CSE-MsgGUID: dCFfHEGISx+c7B/B3kDt/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="280982006"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 08:33:22 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dibin.moolakadan.subrahmanian@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_pm_dc: Add test to validate YUV420
 with DC3CO
Date: Thu, 16 Jul 2026 21:03:05 +0530
Message-ID: <20260716153305.817439-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716153305.817439-1-jeevan.b@intel.com>
References: <20260716153305.817439-1-jeevan.b@intel.com>
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

Add a new validation test to ensure YUV420 works correctly when
DC3CO is enabled.

v2: Add YUV420 support for all DC3CO tests.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 70 ++++++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 33 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 018def5e4..2730fa81b 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -125,16 +125,24 @@ typedef struct {
 	igt_display_t display;
 	struct igt_fb fb_white, fb_rgb, fb_rgr;
 	enum psr_mode op_psr_mode;
+	uint32_t dc3co_fb_format;
 	drmModeModeInfo *mode;
 	igt_output_t *output;
 	bool runtime_suspend_disabled;
 } data_t;
 
-struct dc3co_test_mode {
+struct dc3co_test_case {
 	enum psr_mode mode;
+	uint32_t fb_format;
 	const char *name;
 };
 
+static const struct dc3co_test_case dc3co_cases[] = {
+	{ PSR_MODE_2, DRM_FORMAT_XRGB8888, "psr2-xrgb8888" },
+	{ PR_MODE,    DRM_FORMAT_XRGB8888, "pr-xrgb8888" },
+	{ PSR_MODE_2, DRM_FORMAT_NV12,     "psr2-yuv420" },
+}
+
 static void assert_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
 
 static void set_output_on_pipe_b(data_t *data)
@@ -275,7 +283,7 @@ static void create_color_fb(data_t *data, igt_fb_t *fb, color_t *fb_color)
 	fb_id = igt_create_fb(data->drm_fd,
 			      data->mode->hdisplay,
 			      data->mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
+			      data->dc3co_fb_format,
 			      DRM_FORMAT_MOD_LINEAR,
 			      fb);
 	igt_assert(fb_id);
@@ -300,6 +308,15 @@ static void assert_dc_counter_negative(data_t *data, int dc_flag, uint32_t prev_
 
 static void setup_videoplayback(data_t *data)
 {
+	igt_plane_t *primary;
+
+	primary = igt_output_get_plane_type(data->output,
+					    DRM_PLANE_TYPE_PRIMARY);
+	igt_require_f(igt_plane_has_format_mod(primary, data->dc3co_fb_format,
+					       DRM_FORMAT_MOD_LINEAR),
+					       "Primary plane does not support format %s\n",
+					       igt_format_str(data->dc3co_fb_format));
+
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
 		{ 0.0, 1.0, 0.0 },
@@ -893,14 +910,10 @@ int igt_main()
 	igt_describe("In this test we make sure that system enters DC3CO "
 		     "when PSR2 or PR is active and system is in SLEEP state");
 	igt_subtest_with_dynamic("dc3co-vpb-simulation") {
-		static const struct dc3co_test_mode dc3co_modes[] = {
-			{ PSR_MODE_2, "psr2" },
-			{ PR_MODE,    "pr"   },
-		};
-
-		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
-			const char *name = dc3co_modes[i].name;
-			data.op_psr_mode = dc3co_modes[i].mode;
+		for (int i = 0; i < ARRAY_SIZE(dc3co_cases); i++) {
+			const char *name = dc3co_cases[i].name;
+			data.op_psr_mode = dc3co_cases[i].mode;
+			data.dc3co_fb_format = dc3co_cases[i].fb_format;
 
 			igt_dynamic_f("%s", name) {
 				igt_require_f(intel_display_ver(data.devid) >= 35,
@@ -919,14 +932,10 @@ int igt_main()
 	igt_describe("Validate that no frame drops occur during DC3CO entry "
 			     "while alternating framebuffers with PSR2 or Panel Replay active");
 	igt_subtest_with_dynamic("dc3co-framedrop-check") {
-		static const struct dc3co_test_mode dc3co_modes[] = {
-			{ PSR_MODE_2, "psr2" },
-			{ PR_MODE,    "pr"   },
-		};
-
-		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
-			const char *name = dc3co_modes[i].name;
-			data.op_psr_mode = dc3co_modes[i].mode;
+		for (int i = 0; i < ARRAY_SIZE(dc3co_cases); i++) {
+			const char *name = dc3co_cases[i].name;
+			data.op_psr_mode = dc3co_cases[i].mode;
+			data.dc3co_fb_format = dc3co_cases[i].fb_format;
 
 			igt_dynamic_f("%s", name) {
 				igt_require_f(intel_display_ver(data.devid) >= 35,
@@ -945,17 +954,14 @@ int igt_main()
 	igt_describe("Verify DC3CO entry is still functional after a DC6 entry "
 		     "and exit cycle");
 	igt_subtest_with_dynamic("dc3co-after-dc6") {
-		static const struct dc3co_test_mode dc3co_modes[] = {
-			{ PSR_MODE_2, "psr2" },
-			{ PR_MODE,    "pr"   },
-		};
 
 		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 			      "PC8+ residencies not supported\n");
 
-		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
-			const char *name = dc3co_modes[i].name;
-			data.op_psr_mode = dc3co_modes[i].mode;
+		for (int i = 0; i < ARRAY_SIZE(dc3co_cases); i++) {
+			const char *name = dc3co_cases[i].name;
+			data.op_psr_mode = dc3co_cases[i].mode;
+			data.dc3co_fb_format = dc3co_cases[i].fb_format;
 
 			igt_dynamic_f("%s", name) {
 				igt_require_f(intel_display_ver(data.devid) >= 35,
@@ -974,14 +980,10 @@ int igt_main()
 	igt_describe("Validate DC3CO counter increments before and after a delay "
 		     "greater than 6 frame gaps during video-like load with PSR2/PR active");
 	igt_subtest_with_dynamic("dc3co-vpb-framegap") {
-		static const struct dc3co_test_mode dc3co_modes[] = {
-			{ PSR_MODE_2, "psr2" },
-			{ PR_MODE,    "pr"   },
-		};
-
-		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
-			const char *name = dc3co_modes[i].name;
-			data.op_psr_mode = dc3co_modes[i].mode;
+		for (int i = 0; i < ARRAY_SIZE(dc3co_cases); i++) {
+			const char *name = dc3co_cases[i].name;
+			data.op_psr_mode = dc3co_cases[i].mode;
+			data.dc3co_fb_format = dc3co_cases[i].fb_format;
 
 			igt_dynamic_f("%s", name) {
 				igt_require_f(intel_display_ver(data.devid) >= 35,
@@ -1025,6 +1027,7 @@ int igt_main()
 		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 			      "PC8+ residencies not supported\n");
 		igt_require(intel_display_ver(data.devid) >= 20);
+		data.dc3co_fb_format = DRM_FORMAT_XRGB8888;
 		test_deep_pkgc_state(&data);
 	}
 
@@ -1053,6 +1056,7 @@ int igt_main()
 		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
 					     PSR_MODE_1, NULL));
 		data.op_psr_mode = PSR_MODE_1;
+		data.dc3co_fb_format = DRM_FORMAT_XRGB8888;
 		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
 		igt_require(!psr_disabled_check(data.debugfs_fd));
 		test_dc5_pageflip_negative(&data, IGT_INTEL_CHECK_DC5);
-- 
2.43.0

