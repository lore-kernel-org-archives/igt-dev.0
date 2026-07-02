Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E69C43458
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jul 2026 08:13:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1EB410F220;
	Thu,  2 Jul 2026 08:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cTO2U35q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601D610F1FE
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2026 08:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782979950; x=1814515950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+DnjW2PIxxDP7YxXxyFQRYX8929qn7L3wC4+6ByUSSY=;
 b=cTO2U35qbxQjoL42AppnF3u8OXCrJBdY8njwn3vEiybzocWu4ebVQ7cB
 /c9Rwix/DehMhGd0lFPlJdgbgp4Hl3Rfod6nJJ7D6gTIbTQfhhTGUsZQV
 W1ofNEF9lP3Lc9VReMvDSPDPfg59pkKfdjLj3riz2tXrjWxHlG2bpxsN6
 Qa4qaqw0K5dij9ZLzIfb4R1VPUFZ87xP27pijxrAfbo76Ybd4HJkk+onk
 HivybEMr6NP2NhNR+kD4IrgjF1Ut+cWj9V6xg3qOxuPUMpuiH2HqkFk9o
 /83kWbwXZICVzO5DNgs73XSdJuaTtMRjkQpq+tueGHrX8jpZnHICicwrm g==;
X-CSE-ConnectionGUID: CgU12S1JS4Cn+tMG8sO0Lw==
X-CSE-MsgGUID: J4UM7c0hTuihygYRS7x2Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83504801"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="83504801"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 01:12:30 -0700
X-CSE-ConnectionGUID: Sk+8Ck8HQaydomhOif31kg==
X-CSE-MsgGUID: jMoMnLOLR9ux9H2GMOTIrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="257132412"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa005.jf.intel.com with ESMTP; 02 Jul 2026 01:12:28 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v7 2/2] tests/kms_color: Add multi-format coverage for
 pipe color tests
Date: Thu,  2 Jul 2026 13:53:23 +0530
Message-Id: <20260702082323.3398022-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702082323.3398022-1-pranay.samala@intel.com>
References: <20260702082323.3398022-1-pranay.samala@intel.com>
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

Extend kms_color tests to run across multiple pixel formats at dynamic
subtest level instead of being limited to single format for gamma/degamma
and CTM tests.
For platforms where only a single format is relevant (e.g. 10-bit
paths), limit the iteration accordingly to avoid redundant testing.

This improves coverage for format-dependent pipe color pipeline
behavior.

v2:
- Add DRM_FORMAT_P010 format

v4:
- Split the patches (Swati)

v5:
- Consolidate format structure with bpc info (Swati)
- Move format support check out of dynamic subtest scope (Swati)

v6:
- Add FP16 format to the format list
- Combine declaration and assignment for mtk_10bpc_only (Swati)
- Use per-format depth in gamma/degamma tests for 10-bit accuracy (Swati)
- Improve comment placement and clarity (Swati)

v7:
- Rebase

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_color.c | 149 +++++++++++++++++++++++++++++-----------------
 1 file changed, 96 insertions(+), 53 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 106442f44..65c38dfe0 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -78,6 +78,19 @@
 
 IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
 
+static const struct {
+	const char *name;
+	uint32_t format;
+	int bpc;
+} formats[] = {
+	{ "XRGB8888", DRM_FORMAT_XRGB8888, 8 },
+	{ "YUYV", DRM_FORMAT_YUYV, 8 },
+	{ "NV12", DRM_FORMAT_NV12, 8 },
+	{ "XRGB2101010", DRM_FORMAT_XRGB2101010, 10 },
+	{ "P010", DRM_FORMAT_P010, 10 },
+	{ "FP16", DRM_FORMAT_XRGB16161616F, 16 },
+};
+
 static unsigned int create_test_fb(data_t *data, int w, int h,
 				   uint32_t format,
 				   enum igt_color_encoding encoding,
@@ -771,22 +784,46 @@ static void
 run_gamma_degamma_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 				 bool (*test_t)(data_t*, igt_plane_t*))
 {
-	bool depth_10bit = is_mtk_device(data->drm_fd);
+	bool mtk_10bpc_only = is_mtk_device(data->drm_fd);
 
 	test_setup(data, crtc);
 
 	/*
 	 * We assume an 8bits or 10bits depth per color for degamma/gamma LUTs
 	 * for CRC checks with framebuffer references.
-	 * MediaTek requires 10-bit pipeline for accurate (bit true) color processing.
 	 */
-	data->color_depth = depth_10bit ? 10 : 8;
-	data->drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 : DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
 	igt_require(crtc_output_combo_valid(data, crtc));
 
-	igt_assert(test_t(data, data->primary));
+	for (int i = 0; i < ARRAY_SIZE(formats); i++) {
+		/*
+		 * Legacy gamma path should stay on RGB formats; keep MediaTek 10bpc
+		 * compatibility by allowing XRGB2101010.
+		 */
+		if ((test_t == test_pipe_legacy_gamma ||
+		     test_t == test_pipe_legacy_gamma_reset) &&
+		    formats[i].format != DRM_FORMAT_XRGB8888 &&
+		    formats[i].format != DRM_FORMAT_XRGB2101010)
+			continue;
+
+		if (mtk_10bpc_only && formats[i].bpc != 10)
+			continue;
+
+		if (!igt_plane_has_format_mod(data->primary, formats[i].format,
+					      DRM_FORMAT_MOD_LINEAR))
+			continue;
+
+		igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
+			      igt_output_name(data->output),
+			      formats[i].name) {
+			igt_info("Running on " IGT_FORMAT_FMT " format\n",
+				 IGT_FORMAT_ARGS(formats[i].format));
+			data->color_depth = formats[i].bpc;
+			data->drm_format = formats[i].format;
+			igt_assert(test_t(data, data->primary));
+		}
+	}
 
 	test_cleanup(data);
 }
@@ -806,24 +843,12 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 		       const double *ctm,
 		       int iter)
 {
-	bool success = false;
-	bool depth_10bit = false;
+	bool success;
+	bool mtk_10bpc_only = is_mtk_device(data->drm_fd);
 	double delta;
 	int i;
 
 	test_setup(data, crtc);
-
-	/* MediaTek can only support bit-ture in 10-bit depth pre color */
-	if (is_mtk_device(data->drm_fd))
-		depth_10bit = true;
-
-	/*
-	 * We assume an 8bits or 10bits depth per color for degamma/gamma LUTs
-	 * for CRC checks with framebuffer references.
-	 */
-	data->color_depth = depth_10bit ? 10 : 8;
-	delta = 1.0 / (1 << data->color_depth);
-	data->drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 : DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
 	igt_require(crtc_output_combo_valid(data, crtc));
@@ -831,30 +856,52 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 	if (!iter)
 		iter = 1;
 
-	/*
-	 * We tests a few values around the expected result because
-	 * it depends on the hardware we're dealing with, we can either
-	 * get clamped or rounded values and we also need to account
-	 * for odd number of items in the LUTs.
-	 */
-	for (i = 0; i < iter; i++) {
-		color_t expected_colors[3] = {
-			fb_colors[0],
-			fb_colors[1],
-			fb_colors[2],
-		};
-
-		transform_color(&expected_colors[0], ctm, delta * (i - (iter / 2)));
-		transform_color(&expected_colors[1], ctm, delta * (i - (iter / 2)));
-		transform_color(&expected_colors[2], ctm, delta * (i - (iter / 2)));
-
-		if (test_pipe_ctm(data, data->primary, fb_colors,
-				  expected_colors, ctm)) {
-			success = true;
-			break;
+	for (int fi = 0; fi < ARRAY_SIZE(formats); fi++) {
+		if (mtk_10bpc_only && formats[fi].bpc != 10)
+			continue;
+
+		if (!igt_plane_has_format_mod(data->primary, formats[fi].format,
+					      DRM_FORMAT_MOD_LINEAR))
+			continue;
+
+		igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
+			      igt_output_name(data->output),
+			      formats[fi].name) {
+			data->color_depth = formats[fi].bpc;
+			delta = 1.0 / (1 << data->color_depth);
+			data->drm_format = formats[fi].format;
+			success = false;
+
+			/*
+			 * We tests a few values around the expected result because
+			 * it depends on the hardware we're dealing with, we can either
+			 * get clamped or rounded values and we also need to account
+			 * for odd number of items in the LUTs.
+			 */
+			for (i = 0; i < iter; i++) {
+				color_t expected_colors[3] = {
+					fb_colors[0],
+					fb_colors[1],
+					fb_colors[2],
+				};
+
+				transform_color(&expected_colors[0], ctm,
+						delta * (i - (iter / 2)));
+				transform_color(&expected_colors[1], ctm,
+						delta * (i - (iter / 2)));
+				transform_color(&expected_colors[2], ctm,
+						delta * (i - (iter / 2)));
+
+				if (test_pipe_ctm(data, data->primary, fb_colors,
+						  expected_colors, ctm)) {
+					success = true;
+					break;
+				}
+			}
+
+			igt_assert(success);
 		}
 	}
-	igt_assert(success);
 
 	test_cleanup(data);
 }
@@ -1148,11 +1195,9 @@ run_tests_for_pipe(data_t *data)
 		igt_describe_f("%s", gamma_degamma_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", gamma_degamma_tests[i].name) {
 			for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
-				igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
-					      igt_output_name(data->output))
-					run_gamma_degamma_tests_for_crtc(data,
-									 crtc,
-									 gamma_degamma_tests[i].test_t);
+				run_gamma_degamma_tests_for_crtc(data,
+								 crtc,
+								 gamma_degamma_tests[i].test_t);
 			}
 		}
 	}
@@ -1161,13 +1206,11 @@ run_tests_for_pipe(data_t *data)
 		igt_describe_f("%s", ctm_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
 			for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
-				igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
-					      igt_output_name(data->output))
-					run_ctm_tests_for_crtc(data,
-							       crtc,
-							       ctm_tests[i].fb_colors,
-							       ctm_tests[i].ctm,
-							       ctm_tests[i].iter);
+				run_ctm_tests_for_crtc(data,
+						       crtc,
+						       ctm_tests[i].fb_colors,
+						       ctm_tests[i].ctm,
+						       ctm_tests[i].iter);
 				if (igt_run_in_simulation())
 					break;
 			}
-- 
2.34.1

