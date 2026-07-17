Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D65C44507
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 03:58:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A806E10E3FB;
	Fri, 17 Jul 2026 03:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CFR3cX+t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9B110E3D9
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 03:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784260633; x=1815796633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xOJkE6ZjCIxg1BLOuCck0u85HcLjpKelQHWvdUTU5kE=;
 b=CFR3cX+tJXOgYNjucKEMJBe2LQm9yqR+oMsuMHQDTdH78yfYIteXsAx1
 8xq4xr70ow/paUt2a2ooyKTjcvixXtQkZ7nsXoMg/xPnPtrTCJ9KajFmJ
 +O+SQwuFrXmqFiSmKXvhZFpWZBGWvxaQIbbG5ztG9V9DkPhHuoq/HgqzW
 UstRk/0y3d3ngznHfvEEUySFlobToiVqj/gMsGmlfm5ppSOLB9YSFPkp+
 zTW4zyGXrsWFxELeo1GhrNf691x3vYemEOAeHw5TdHmR85EHd24uoht+p
 4uMETYVLjJu/rZGCr9WyYXPUp9iWhmnJc3Ly3G10LHe7XW0Xc81EeOVct Q==;
X-CSE-ConnectionGUID: /wxHrR6sR2KdmqovG2V1sA==
X-CSE-MsgGUID: /6nBIqEuR72ox/cWEoWOmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="110480312"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="110480312"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 20:57:13 -0700
X-CSE-ConnectionGUID: CoqsGjQXR/6OLPnCoYv5zw==
X-CSE-MsgGUID: BEidsFcpTF2Ode8T3/ZgDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208";a="261626423"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 20:57:11 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dibin.moolakadan.subrahmanian@intel.com, ramanaidu.naladala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_pm_dc: Add test to validate YUV420
 with DC3CO
Date: Fri, 17 Jul 2026 09:26:58 +0530
Message-ID: <20260717035658.857405-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717035658.857405-1-jeevan.b@intel.com>
References: <20260717035658.857405-1-jeevan.b@intel.com>
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
index 018def5e4..52f0be183 100644
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
+	{ PSR_MODE_2, DRM_FORMAT_NV12,     "psr2-yuv420" },
+	{ PR_MODE,    DRM_FORMAT_XRGB8888, "pr-xrgb8888" },
+};
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

