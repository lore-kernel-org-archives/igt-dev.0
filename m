Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872AACD6E5D
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 06:31:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3201A11A46A;
	Fri,  5 Jun 2026 06:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nmJZXfYR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505E111A465
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 06:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780641017; x=1812177017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M2KJ6rnyh+dOL7SokkgMwPNlsm3Pl4jId0ThdgGM1tw=;
 b=nmJZXfYRnhpt8yLZHj+JPdT8FJYG+TgaDymXOv6Snk4rnW8ckofBs+i5
 y1Z41QO7L5x0HdigeBIRZjPw6fjMu7TUGIpF3sE/vTgDejz1fewg9CRZ6
 UScIMZtW4Vob35p/HcKs9Jry/+ZIGxY1JsSSL3iIxUNhcOKd43H0/nAft
 RPcmXhmeUNmnPziOva8SB/kf6k8dNGMhPtF7d7OICNb2qA8JbcNou2kPg
 0QuTpACMpY9ZYjXHCN16eDR4v6HuhnB+jXS/eHc+s7DJFUBPZduBtZtid
 jFR3fgb0r6bIlLPLgspYVYSe/2SEqEcHNGr8vsK6wo4KzAcgeTGGe+/+H Q==;
X-CSE-ConnectionGUID: 2vAmzcLhT7GaLEcTkxVRSw==
X-CSE-MsgGUID: uQr9Gee2QjipNkb05IuuMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="85362757"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="85362757"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 23:30:17 -0700
X-CSE-ConnectionGUID: oT/q9s+ZSlOax4mgkFcmEw==
X-CSE-MsgGUID: ps7WoF9/SCyxBnFPtWmK2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="240576126"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa010.fm.intel.com with ESMTP; 04 Jun 2026 23:30:15 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v5 2/2] tests/kms_color: Add multi-format coverage for
 pipe color tests
Date: Fri,  5 Jun 2026 12:11:03 +0530
Message-Id: <20260605064103.855630-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605064103.855630-1-pranay.samala@intel.com>
References: <20260605064103.855630-1-pranay.samala@intel.com>
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

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_color.c | 127 ++++++++++++++++++++++++++++++----------------
 1 file changed, 83 insertions(+), 44 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index f4b792fdd..8d08820ed 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -78,6 +78,18 @@
 
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
+};
+
 static unsigned int create_color_test_fb(data_t *data, int w, int h,
 					 uint32_t format, struct igt_fb *fb)
 {
@@ -733,12 +745,33 @@ run_gamma_degamma_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 	 * for CRC checks with framebuffer references.
 	 */
 	data->color_depth = 8;
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
+			data->drm_format = formats[i].format;
+			igt_assert(test_t(data, data->primary));
+		}
+	}
 
 	test_cleanup(data);
 }
@@ -758,24 +791,20 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 		       const double *ctm,
 		       int iter)
 {
-	bool success = false;
-	bool depth_10bit = false;
+	bool success;
+	bool mtk_10bpc_only;
 	double delta;
 	int i;
 
 	test_setup(data, crtc);
 
-	/* MediaTek can only support bit-ture in 10-bit depth pre color */
-	if (is_mtk_device(data->drm_fd))
-		depth_10bit = true;
+	/* MediaTek can only support CTM in 10-bit depth per color. */
+	mtk_10bpc_only = is_mtk_device(data->drm_fd);
 
 	/*
 	 * We assume an 8bits or 10bits depth per color for degamma/gamma LUTs
 	 * for CRC checks with framebuffer references.
 	 */
-	data->color_depth = depth_10bit ? 10 : 8;
-	delta = 1.0 / (1 << data->color_depth);
-	data->drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 : DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
 	igt_require(crtc_output_combo_valid(data, crtc));
@@ -783,30 +812,44 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
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
+		/* MTK runs 10bpc only; non-MTK runs all supported bpc formats. */
+		if (mtk_10bpc_only && formats[fi].bpc != 10)
+			continue;
+
+		data->color_depth = formats[fi].bpc;
+		delta = 1.0 / (1 << data->color_depth);
+
+		if (!igt_plane_has_format_mod(data->primary, formats[fi].format,
+					      DRM_FORMAT_MOD_LINEAR))
+			continue;
+
+		igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
+			      igt_output_name(data->output),
+			      formats[fi].name) {
+			success = false;
+			data->drm_format = formats[fi].format;
+
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
@@ -1100,11 +1143,9 @@ run_tests_for_pipe(data_t *data)
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
@@ -1113,13 +1154,11 @@ run_tests_for_pipe(data_t *data)
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

