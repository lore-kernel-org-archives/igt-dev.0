Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2927CC43458
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jul 2026 05:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89DA610E41A;
	Tue,  7 Jul 2026 05:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QbqwOZ15";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5145910E41A
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jul 2026 05:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783401652; x=1814937652;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BuxNVKyWgk+5tS5p0+JDSxip+VmDf8RwKMecnme0hxI=;
 b=QbqwOZ15cE37STIaZkqbR55kDa8rDDyZAINxnosJVeVL9mtQpkPgi7Wd
 iaWZ05lR7t2VpNMNAPxUrQL4g8BGDt6XWg1XyWvtyFTZIsxqLQfEbUGpG
 23Ad5aknkcxx7Xj74gonMqlT708s4qBuMBxw1CyzWeCL8gv55QdYmkVp1
 B4aN16hAretzWZlpQ3wcYTQ1VvKAR1GI07AwdUPJqs5JJusZSZLlWhLdB
 YuRWg8FSyGJim0B/rFE1Ag9dw6jaR7O/whNrsfThMb8pc3aEMhea1DHjv
 ObnaY9xmU2rEdhyWPuSb2qCGhLZGvBna1SRbDDO6qpTW2/gWmE+cnaili w==;
X-CSE-ConnectionGUID: hCNHXJ9ZQQ+i/GscwdPrAA==
X-CSE-MsgGUID: H/XWksQbQMCD6NCeH4QmgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="95557940"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="95557940"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 22:20:36 -0700
X-CSE-ConnectionGUID: 8xgB+kN/QFiK7CLUd27P+Q==
X-CSE-MsgGUID: y69NSbRrTqiZ/rvQNWTZWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="257765773"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 22:20:35 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dibin.moolakadan.subrahmanian@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Add test to validate YUV420 with
 DC3CO
Date: Tue,  7 Jul 2026 10:50:28 +0530
Message-ID: <20260707052028.4022700-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index ef53c5f96..db2601ac7 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -125,6 +125,7 @@ typedef struct {
 	igt_display_t display;
 	struct igt_fb fb_white, fb_rgb, fb_rgr;
 	enum psr_mode op_psr_mode;
+	uint32_t dc3co_fb_format;
 	drmModeModeInfo *mode;
 	igt_output_t *output;
 	bool runtime_suspend_disabled;
@@ -275,7 +276,7 @@ static void create_color_fb(data_t *data, igt_fb_t *fb, color_t *fb_color)
 	fb_id = igt_create_fb(data->drm_fd,
 			      data->mode->hdisplay,
 			      data->mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
+			      data->dc3co_fb_format,
 			      DRM_FORMAT_MOD_LINEAR,
 			      fb);
 	igt_assert(fb_id);
@@ -300,6 +301,15 @@ static void assert_dc_counter_negative(data_t *data, int dc_flag, uint32_t prev_
 
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
@@ -879,14 +889,20 @@ int igt_main()
 	igt_describe("In this test we make sure that system enters DC3CO "
 		     "when PSR2 or PR is active and system is in SLEEP state");
 	igt_subtest_with_dynamic("dc3co-vpb-simulation") {
-		static const struct dc3co_test_mode dc3co_modes[] = {
-			{ PSR_MODE_2, "psr2" },
-			{ PR_MODE,    "pr"   },
+		static const struct {
+			enum psr_mode mode;
+			uint32_t fb_format;
+			const char *name;
+		} dc3co_cases[] = {
+			{ PSR_MODE_2, DRM_FORMAT_XRGB8888, "psr2-xrgb8888" },
+			{ PR_MODE,    DRM_FORMAT_XRGB8888, "pr-xrgb8888" },
+			{ PSR_MODE_2, DRM_FORMAT_NV12,     "psr2-yuv420" },
 		};
 
-		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
-			const char *name = dc3co_modes[i].name;
-			data.op_psr_mode = dc3co_modes[i].mode;
+		for (int i = 0; i < ARRAY_SIZE(dc3co_cases); i++) {
+			const char *name = dc3co_cases[i].name;
+			data.op_psr_mode = dc3co_cases[i].mode;
+			data.dc3co_fb_format = dc3co_cases[i].fb_format;
 
 			igt_dynamic_f("%s", name) {
 				igt_require_f(intel_display_ver(data.devid) >= 35,
@@ -913,6 +929,7 @@ int igt_main()
 		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
 			const char *name = dc3co_modes[i].name;
 			data.op_psr_mode = dc3co_modes[i].mode;
+			data.dc3co_fb_format = DRM_FORMAT_XRGB8888;
 
 			igt_dynamic_f("%s", name) {
 				igt_require_f(intel_display_ver(data.devid) >= 35,
@@ -942,6 +959,7 @@ int igt_main()
 		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
 			const char *name = dc3co_modes[i].name;
 			data.op_psr_mode = dc3co_modes[i].mode;
+			data.dc3co_fb_format = DRM_FORMAT_XRGB8888;
 
 			igt_dynamic_f("%s", name) {
 				igt_require_f(intel_display_ver(data.devid) >= 35,
@@ -968,6 +986,7 @@ int igt_main()
 		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
 			const char *name = dc3co_modes[i].name;
 			data.op_psr_mode = dc3co_modes[i].mode;
+			data.dc3co_fb_format = DRM_FORMAT_XRGB8888;
 
 			igt_dynamic_f("%s", name) {
 				igt_require_f(intel_display_ver(data.devid) >= 35,
@@ -1011,6 +1030,7 @@ int igt_main()
 		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 			      "PC8+ residencies not supported\n");
 		igt_require(intel_display_ver(data.devid) >= 20);
+		data.dc3co_fb_format = DRM_FORMAT_XRGB8888;
 		test_deep_pkgc_state(&data);
 	}
 
@@ -1039,6 +1059,7 @@ int igt_main()
 		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
 					     PSR_MODE_1, NULL));
 		data.op_psr_mode = PSR_MODE_1;
+		data.dc3co_fb_format = DRM_FORMAT_XRGB8888;
 		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
 		igt_require(!psr_disabled_check(data.debugfs_fd));
 		test_dc5_pageflip_negative(&data, IGT_INTEL_CHECK_DC5);
-- 
2.43.0

