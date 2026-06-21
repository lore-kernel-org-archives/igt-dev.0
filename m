Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A466CD98F2
	for <igt-dev@archiver.kernel.org>; Sun, 21 Jun 2026 18:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5CF10E27C;
	Sun, 21 Jun 2026 18:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="STkEFtXl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB81C10E27C
 for <igt-dev@lists.freedesktop.org>; Sun, 21 Jun 2026 18:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782065651; x=1813601651;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1aR/NdDAkdefbPMUbG5m76+u0hp1jbupgtp0V3Jx/Qw=;
 b=STkEFtXlHwt44pTWj2G0X55weTCJ6vLlHCEu+HkKByUOf+vBRw8Ur9hx
 KMv2SPSiDV2QKisVKTSS9Gvh8MAo1Hwu+7m7RlPYNrozUKwrpptkFnFQk
 W7ij6P7IQ9galqwG1krWnd4x2f0NkYmDI3YqaD2A62BMfbrU8+A8SY12Y
 trSXWEGWEWgQLKm6q0tiEBem+Yxp3YBBKoGPkLf6wFdp9DT+yIZd9XMAq
 0Bhic2vBVJSywE/2quDv09fMg3bqQVNvdxnbSCEVdROy/obf/wKERCAGC
 kZQXMGldqXiLbmZFKs18oZxVfptTbrxYq6s4ENY2/jOguLy2uBNCcMG3D Q==;
X-CSE-ConnectionGUID: YePLW8ZtSpuz0xtEc3j1fg==
X-CSE-MsgGUID: 0tRpHm/vTvKOAN4Mc1DzFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="94200609"
X-IronPort-AV: E=Sophos;i="6.24,217,1774335600"; d="scan'208";a="94200609"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 11:14:11 -0700
X-CSE-ConnectionGUID: yloIeCRETx6I8uPYabBEWw==
X-CSE-MsgGUID: xMNfKmk3S+yYqj83cygAzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,217,1774335600"; d="scan'208";a="244695306"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa006.fm.intel.com with ESMTP; 21 Jun 2026 11:14:09 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v6 2/2] tests/kms_color: Add multi-format coverage for
 pipe color tests
Date: Sun, 21 Jun 2026 23:55:06 +0530
Message-Id: <20260621182506.2970102-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260621182506.2970102-1-pranay.samala@intel.com>
References: <20260621182506.2970102-1-pranay.samala@intel.com>
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

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_color.c | 139 +++++++++++++++++++++++++++++-----------------
 1 file changed, 88 insertions(+), 51 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index d98be46f0..6caff7dbb 100644
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
@@ -760,16 +773,37 @@ run_gamma_degamma_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 	test_setup(data, crtc);
 
 	/*
-	 * We assume an 8bits depth per color for degamma/gamma LUTs
+	 * We assume an 8bits or 10bits depth per color for degamma/gamma LUTs
 	 * for CRC checks with framebuffer references.
 	 */
-	data->color_depth = 8;
-	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
 	igt_require(crtc_output_combo_valid(data, crtc));
 
-	igt_assert(test_t(data, data->primary));
+	for (int i = 0; i < ARRAY_SIZE(formats); i++) {
+		/*
+		 * legacy gamma path internally uses XRGB8888; avoid misleading
+		 * dynamic names for non-RGB formats.
+		 */
+		if ((test_t == test_pipe_legacy_gamma ||
+		     test_t == test_pipe_legacy_gamma_reset) &&
+		    formats[i].format != DRM_FORMAT_XRGB8888)
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
@@ -789,24 +823,13 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
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
@@ -814,30 +837,48 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
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
+				transform_color(&expected_colors[0], ctm, delta * (i - (iter / 2)));
+				transform_color(&expected_colors[1], ctm, delta * (i - (iter / 2)));
+				transform_color(&expected_colors[2], ctm, delta * (i - (iter / 2)));
+
+				if (test_pipe_ctm(data, data->primary, fb_colors,
+						  expected_colors, ctm)) {
+					success = true;
+					break;
+				}
+			}
+			igt_assert(success);
 		}
 	}
-	igt_assert(success);
 
 	test_cleanup(data);
 }
@@ -1131,11 +1172,9 @@ run_tests_for_pipe(data_t *data)
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
@@ -1144,13 +1183,11 @@ run_tests_for_pipe(data_t *data)
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

