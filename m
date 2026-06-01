Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15153CD6E4C
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 08:13:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DB9112F56;
	Mon,  1 Jun 2026 08:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kSFV69LU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B603112F56
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 08:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780301600; x=1811837600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AZPkoBUyhV3nwHheKO0TiTuuyWMONACvm8bU18XqDvA=;
 b=kSFV69LUzw8u0cNdn1ZedqZoa+bWqt/4GwoYWvmSL4MyN5eNcSoMN9MO
 ukM9VjvHt09oieoKoMO0e8XrpYLZG6a66j0DPAvhyJh8i7i8qw31lwxM2
 WmErHlibRNy0b/Z36DX6ncR9yC0QHB1vlzstLzZs5ZWKr4c+IkTIqgsO3
 3Uv5IK5//G9Uh5psqDIdV7ehD8kzdCxhg4nNUK9kF14VTL2XNAnj2w7DF
 hnXbd4wl6lD6faa5xfZj+qlcWa6Qa0KR1WBXML3JmlHMu8I8bF73t5KMN
 kr9DGVy2f0HSCXsbXZKdgd65JkINjlQcvROMkFZbGmcrl0A8j7GYTRmFq w==;
X-CSE-ConnectionGUID: OnXq+B3RQdC66tEXCjlSJA==
X-CSE-MsgGUID: h/x4kipoSBucKT7+/ew2eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80906138"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="80906138"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 01:13:20 -0700
X-CSE-ConnectionGUID: XyqAFlbbSoaKXjTrnclggw==
X-CSE-MsgGUID: zPHniLLJQuqqVvVbu5BKOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="245337464"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa004.fm.intel.com with ESMTP; 01 Jun 2026 01:13:17 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v4 2/2] tests/kms_color: Add multi-format coverage for
 pipe color tests
Date: Mon,  1 Jun 2026 13:54:10 +0530
Message-Id: <20260601082410.798948-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260601082410.798948-1-pranay.samala@intel.com>
References: <20260601082410.798948-1-pranay.samala@intel.com>
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

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_color.c | 97 +++++++++++++++++++++++++++++++----------------
 1 file changed, 64 insertions(+), 33 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 146181fbb..b0adcd221 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -78,6 +78,16 @@
 
 IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
 
+static const struct {
+	const char *name;
+	uint32_t format;
+} formats[] = {
+	{ "RGB", DRM_FORMAT_XRGB8888 },
+	{ "YUYV", DRM_FORMAT_YUYV },
+	{ "NV12", DRM_FORMAT_NV12 },
+	{ "P010", DRM_FORMAT_P010 },
+};
+
 static bool test_pipe_degamma(data_t *data,
 			      igt_plane_t *primary)
 {
@@ -791,12 +801,23 @@ run_gamma_degamma_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 	 * for CRC checks with framebuffer references.
 	 */
 	data->color_depth = 8;
-	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
 	igt_require(crtc_output_combo_valid(data, crtc));
 
-	igt_assert(test_t(data, data->primary));
+	for (int i = 0; i < ARRAY_SIZE(formats); i++) {
+		igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
+			      igt_output_name(data->output),
+			      formats[i].name) {
+			if (!igt_plane_has_format_mod(data->primary, formats[i].format,
+						      DRM_FORMAT_MOD_LINEAR))
+				continue;
+			igt_info("Running on " IGT_FORMAT_FMT " format\n",
+				 IGT_FORMAT_ARGS(formats[i].format));
+			data->drm_format = formats[i].format;
+			igt_assert(test_t(data, data->primary));
+		}
+	}
 
 	test_cleanup(data);
 }
@@ -816,10 +837,10 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 		       const double *ctm,
 		       int iter)
 {
-	bool success = false;
+	bool success;
 	bool depth_10bit = false;
 	double delta;
-	int i;
+	int i, n_formats;
 
 	test_setup(data, crtc);
 
@@ -833,7 +854,6 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 	 */
 	data->color_depth = depth_10bit ? 10 : 8;
 	delta = 1.0 / (1 << data->color_depth);
-	data->drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 : DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
 	igt_require(crtc_output_combo_valid(data, crtc));
@@ -847,24 +867,39 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 	 * get clamped or rounded values and we also need to account
 	 * for odd number of items in the LUTs.
 	 */
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
+	n_formats = depth_10bit ? 1 : ARRAY_SIZE(formats);
+
+	for (int fi = 0; fi < n_formats; fi++) {
+		igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
+			      igt_output_name(data->output),
+			      depth_10bit ? "XRGB2101010" : formats[fi].name) {
+			success = false;
+			data->drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 :
+							formats[fi].format;
+
+			if (!igt_plane_has_format_mod(data->primary, data->drm_format,
+						      DRM_FORMAT_MOD_LINEAR))
+				continue;
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
@@ -1158,11 +1193,9 @@ run_tests_for_pipe(data_t *data)
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
@@ -1171,13 +1204,11 @@ run_tests_for_pipe(data_t *data)
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

