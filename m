Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9DFF588E3
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 16:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9DC10E6DD;
	Mon, 20 Apr 2026 16:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQWc431w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F57B10E6DD
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 16:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776701512; x=1808237512;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h8Xj+KdLwlPUT2rxO77QRbxzJXDrx2n83ZF1/qoU8h4=;
 b=AQWc431wssk9102ZmQiLls5ZCJkxJxA0chJMNMNE0IhnnPrKKFCJGzR/
 ST4yMPmW3B9OCOz5zSTqGYEqNxwW+zTbFwsVJ4SL0QX3p+HnyYczc6k92
 Za+D2lpMOkhGqOXVGAygzhFTRX1rEm7aFG8TS9M+4pfPor/8HCnBr1kz9
 6+eIcJ/TVSngsfIrMJ+dX7gO/OOCv7SOTzAThJ3gvMtFuf/rG2XUJz6Ml
 3KolWainuGr3A8mFxBlNjVdpshRRIDOKdIX6LSnWqPd5hL5Sc8TbH223h
 M73bq9h1f6GjG9bcPcOfVW8CSN3RSQJp1ck1aa0U7JTD3j7fLzOOdxOGK A==;
X-CSE-ConnectionGUID: EUfeq2F5TLKgIKB+UMFkbg==
X-CSE-MsgGUID: MzEOXU1gQB6yF6LnSwFPwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88999099"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="88999099"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 09:11:52 -0700
X-CSE-ConnectionGUID: 3M2KisgKTaGR1DI+ASSrDA==
X-CSE-MsgGUID: 0FnHCKu9QpitbO8w4MPAvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="231642475"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa009.jf.intel.com with ESMTP; 20 Apr 2026 09:11:50 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/kms_color: Add multi-format coverage for pipe
 color tests
Date: Mon, 20 Apr 2026 21:52:39 +0530
Message-Id: <20260420162239.3450203-1-pranay.samala@intel.com>
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

Extend kms_color tests to run across multiple pixel formats at dynamic
subtest level instead of being limited to single format for gamma/degamma
and CTM tests.

For platforms where only a single format is relevant (e.g. 10-bit
paths), limit the iteration accordingly to avoid redundant testing.

This improves coverage for format-dependent pipe color pipeline
behavior.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_color.c | 224 +++++++++++++++++++++++++++++-----------------
 1 file changed, 143 insertions(+), 81 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 565edb2dc..7c64f2dde 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -78,6 +78,15 @@
 
 IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
 
+static const struct {
+	const char *name;
+	uint32_t format;
+} formats[] = {
+	{ "RGB", DRM_FORMAT_XRGB8888 },
+	{ "YUYV", DRM_FORMAT_YUYV },
+	{ "NV12", DRM_FORMAT_NV12 },
+};
+
 static bool test_pipe_degamma(data_t *data,
 			      igt_plane_t *primary)
 {
@@ -104,20 +113,28 @@ static bool test_pipe_degamma(data_t *data,
 	igt_output_override_mode(output, mode);
 
 	/* Create a framebuffer at the size of the output. */
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      data->drm_format,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &fb);
+	fb_id = igt_create_fb_with_bo_size(data->drm_fd,
+					   mode->hdisplay,
+					   mode->vdisplay,
+					   data->drm_format,
+					   DRM_FORMAT_MOD_LINEAR,
+					   IGT_COLOR_YCBCR_BT709,
+					   IGT_COLOR_YCBCR_FULL_RANGE,
+					   &fb,
+					   0,
+					   0);
 	igt_assert(fb_id);
 
-	fb_modeset_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      data->drm_format,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb_modeset);
+	fb_modeset_id = igt_create_fb_with_bo_size(data->drm_fd,
+						   mode->hdisplay,
+						   mode->vdisplay,
+						   data->drm_format,
+						   DRM_FORMAT_MOD_LINEAR,
+						   IGT_COLOR_YCBCR_BT709,
+						   IGT_COLOR_YCBCR_FULL_RANGE,
+						   &fb_modeset,
+						   0,
+						   0);
 	igt_assert(fb_modeset_id);
 
 	igt_plane_set_fb(primary, &fb_modeset);
@@ -191,20 +208,28 @@ static bool test_pipe_gamma(data_t *data,
 	igt_output_override_mode(output, mode);
 
 	/* Create a framebuffer at the size of the output. */
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      data->drm_format,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &fb);
+	fb_id = igt_create_fb_with_bo_size(data->drm_fd,
+					   mode->hdisplay,
+					   mode->vdisplay,
+					   data->drm_format,
+					   DRM_FORMAT_MOD_LINEAR,
+					   IGT_COLOR_YCBCR_BT709,
+					   IGT_COLOR_YCBCR_FULL_RANGE,
+					   &fb,
+					   0,
+					   0);
 	igt_assert(fb_id);
 
-	fb_modeset_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      data->drm_format,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb_modeset);
+	fb_modeset_id = igt_create_fb_with_bo_size(data->drm_fd,
+						   mode->hdisplay,
+						   mode->vdisplay,
+						   data->drm_format,
+						   DRM_FORMAT_MOD_LINEAR,
+						   IGT_COLOR_YCBCR_BT709,
+						   IGT_COLOR_YCBCR_FULL_RANGE,
+						   &fb_modeset,
+						   0,
+						   0);
 	igt_assert(fb_modeset_id);
 
 	igt_plane_set_fb(primary, &fb_modeset);
@@ -285,20 +310,28 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	igt_output_override_mode(output, mode);
 
 	/* Create a framebuffer at the size of the output. */
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &fb);
+	fb_id = igt_create_fb_with_bo_size(data->drm_fd,
+					   mode->hdisplay,
+					   mode->vdisplay,
+					   DRM_FORMAT_XRGB8888,
+					   DRM_FORMAT_MOD_LINEAR,
+					   IGT_COLOR_YCBCR_BT709,
+					   IGT_COLOR_YCBCR_FULL_RANGE,
+					   &fb,
+					   0,
+					   0);
 	igt_assert(fb_id);
 
-	fb_modeset_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb_modeset);
+	fb_modeset_id = igt_create_fb_with_bo_size(data->drm_fd,
+						   mode->hdisplay,
+						   mode->vdisplay,
+						   DRM_FORMAT_XRGB8888,
+						   DRM_FORMAT_MOD_LINEAR,
+						   IGT_COLOR_YCBCR_BT709,
+						   IGT_COLOR_YCBCR_FULL_RANGE,
+						   &fb_modeset,
+						   0,
+						   0);
 	igt_assert(fb_modeset_id);
 
 	igt_plane_set_fb(primary, &fb_modeset);
@@ -520,20 +553,28 @@ static bool test_pipe_ctm(data_t *data,
 	igt_output_override_mode(output, mode);
 
 	/* Create a framebuffer at the size of the output. */
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      data->drm_format,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &fb);
+	fb_id = igt_create_fb_with_bo_size(data->drm_fd,
+					   mode->hdisplay,
+					   mode->vdisplay,
+					   data->drm_format,
+					   DRM_FORMAT_MOD_LINEAR,
+					   IGT_COLOR_YCBCR_BT709,
+					   IGT_COLOR_YCBCR_FULL_RANGE,
+					   &fb,
+					   0,
+					   0);
 	igt_assert(fb_id);
 
-	fb_modeset_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      data->drm_format,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb_modeset);
+	fb_modeset_id = igt_create_fb_with_bo_size(data->drm_fd,
+						   mode->hdisplay,
+						   mode->vdisplay,
+						   data->drm_format,
+						   DRM_FORMAT_MOD_LINEAR,
+						   IGT_COLOR_YCBCR_BT709,
+						   IGT_COLOR_YCBCR_FULL_RANGE,
+						   &fb_modeset,
+						   0,
+						   0);
 	igt_assert(fb_modeset_id);
 	igt_plane_set_fb(primary, &fb_modeset);
 
@@ -759,12 +800,23 @@ run_gamma_degamma_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
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
@@ -784,10 +836,10 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
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
 
@@ -801,7 +853,6 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 	 */
 	data->color_depth = depth_10bit ? 10 : 8;
 	delta = 1.0 / (1 << data->color_depth);
-	data->drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 : DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
 	igt_require(crtc_output_combo_valid(data, crtc));
@@ -815,24 +866,39 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
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
@@ -1126,11 +1192,9 @@ run_tests_for_pipe(data_t *data)
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
@@ -1139,13 +1203,11 @@ run_tests_for_pipe(data_t *data)
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

