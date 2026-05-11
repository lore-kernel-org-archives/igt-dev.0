Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F043CD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 10:19:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477F210E534;
	Mon, 11 May 2026 10:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GEZe/GPE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084F210E146
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 10:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778494731; x=1810030731;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EbKhofkxV0GLABTV9wz3W2hG0CX8wCV2Xb4RfwHpsRc=;
 b=GEZe/GPE7baHLbXRZq1Oxc0wcKCbL5KtCrLFlb8GBZxxOj3KUffp4eec
 Ea9alMxkOPen6Zi8xkrMzQnSJiLnVzfvxUPdSC4YNZUDn7bUumk9OJKvv
 +wy5p1yQU5j6kvT4dbCqaGahqmnILPLE88b14bU19QFsEPC+AGHwE8dBY
 NsMCdlxHd/2nWFg8w3+Vt0DEDuSMivI2g5pAk3GGV9M3rngcz+bl37Av1
 eE4+L8Wp23PUSrebvt19z0q5oP7S+a6n4f0wQzSJZgjdUmsPUAAa5I0dw
 K6qhfmYMe/8RoexYxXCVIRbOkB7IGlRFPpWyznzmOheRny+09BsOSGmUX g==;
X-CSE-ConnectionGUID: mLnJ53iVQaWJb5hfkUJkpw==
X-CSE-MsgGUID: ovNLfHHfSd2oy4xKhC2xWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="82990350"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="82990350"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 03:18:50 -0700
X-CSE-ConnectionGUID: SSRooaEeSqiKrHhMX/j67w==
X-CSE-MsgGUID: h85LSa68SCyRNqmZoI8w8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="261147755"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa001.fm.intel.com with ESMTP; 11 May 2026 03:18:49 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/chamelium/kms_chamelium_color: Add YUYV and NV12
 coverage to color subtests
Date: Mon, 11 May 2026 15:59:36 +0530
Message-Id: <20260511102936.115495-1-pranay.samala@intel.com>
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

Add multi-format coverage to kms_chamelium_color by iterating
DRM_FORMAT_XRGB8888, DRM_FORMAT_YUYV, and DRM_FORMAT_NV12 for
degamma, gamma, CTM, and limited-range CTM subtests.

Dynamic subtest names now include format suffix and unsupported
formats are skipped.

Observed behavior while validating:

ctm-green-to-red: RGB and YUYV render correctly, while NV12
shows a thin dark seam at the green-to-red transition.
ctm-negative: RGB is fully black as expected; YUYV/NV12 are
near-black with faint residual tint.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/chamelium/kms_chamelium_color.c | 281 +++++++++++++++++---------
 1 file changed, 181 insertions(+), 100 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 4b50a148d..d2ced32c8 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -58,6 +58,15 @@
 
 IGT_TEST_DESCRIPTION("Test Color Features at Pipe level using Chamelium to verify instead of CRC");
 
+static const struct {
+	const char *name;
+	uint32_t format;
+} formats[] = {
+	{ "RGB", DRM_FORMAT_XRGB8888 },
+	{ "YUYV", DRM_FORMAT_YUYV },
+	{ "NV12", DRM_FORMAT_NV12 },
+};
+
 /*
  * Draw 3 gradient rectangles in red, green and blue, with a maxed out
  * degamma LUT and verify we have the same frame dump as drawing solid color
@@ -87,28 +96,40 @@ static bool test_pipe_degamma(data_t *data,
 	igt_output_set_crtc(output, primary->crtc);
 
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
-				      DRM_FORMAT_XRGB8888,
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
 
-	fbref_id = igt_create_fb(data->drm_fd,
-				 mode->hdisplay,
-				 mode->vdisplay,
-				 DRM_FORMAT_XRGB8888,
-				 DRM_FORMAT_MOD_LINEAR,
-				 &fbref);
+	fbref_id = igt_create_fb_with_bo_size(data->drm_fd,
+					      mode->hdisplay,
+					      mode->vdisplay,
+					      data->drm_format,
+					      DRM_FORMAT_MOD_LINEAR,
+					      IGT_COLOR_YCBCR_BT709,
+					      IGT_COLOR_YCBCR_FULL_RANGE,
+					      &fbref,
+					      0,
+					      0);
 	igt_assert(fbref_id);
 
 	igt_plane_set_fb(primary, &fb_modeset);
@@ -178,28 +199,40 @@ static bool test_pipe_gamma(data_t *data,
 	igt_output_set_crtc(output, primary->crtc);
 
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
-				      DRM_FORMAT_XRGB8888,
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
 
-	fbref_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &fbref);
+	fbref_id = igt_create_fb_with_bo_size(data->drm_fd,
+					      mode->hdisplay,
+					      mode->vdisplay,
+					      data->drm_format,
+					      DRM_FORMAT_MOD_LINEAR,
+					      IGT_COLOR_YCBCR_BT709,
+					      IGT_COLOR_YCBCR_FULL_RANGE,
+					      &fbref,
+					      0,
+					      0);
 	igt_assert(fbref_id);
 
 	igt_plane_set_fb(primary, &fbref);
@@ -267,28 +300,40 @@ static bool test_pipe_ctm(data_t *data,
 	igt_output_set_crtc(output, primary->crtc);
 
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
-				      DRM_FORMAT_XRGB8888,
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
 
-	fbref_id = igt_create_fb(data->drm_fd,
-				 mode->hdisplay,
-				 mode->vdisplay,
-				 DRM_FORMAT_XRGB8888,
-				 DRM_FORMAT_MOD_LINEAR,
-				 &fbref);
+	fbref_id = igt_create_fb_with_bo_size(data->drm_fd,
+					      mode->hdisplay,
+					      mode->vdisplay,
+					      data->drm_format,
+					      DRM_FORMAT_MOD_LINEAR,
+					      IGT_COLOR_YCBCR_BT709,
+					      IGT_COLOR_YCBCR_FULL_RANGE,
+					      &fbref,
+					      0,
+					      0);
 	igt_assert(fbref_id);
 
 	igt_plane_set_fb(primary, &fb_modeset);
@@ -372,20 +417,28 @@ static bool test_pipe_limited_range_ctm(data_t *data,
 	igt_output_set_crtc(output, primary->crtc);
 
 	/* Create a framebuffer at the size of the output. */
-	fb_id0 = igt_create_fb(data->drm_fd,
-			       mode->hdisplay,
-			       mode->vdisplay,
-			       DRM_FORMAT_XRGB8888,
-			       DRM_FORMAT_MOD_LINEAR,
-			       &fb0);
+	fb_id0 = igt_create_fb_with_bo_size(data->drm_fd,
+					    mode->hdisplay,
+					    mode->vdisplay,
+					    data->drm_format,
+					    DRM_FORMAT_MOD_LINEAR,
+					    IGT_COLOR_YCBCR_BT709,
+					    IGT_COLOR_YCBCR_LIMITED_RANGE,
+					    &fb0,
+					    0,
+					    0);
 	igt_assert(fb_id0);
 
-	fb_id1 = igt_create_fb(data->drm_fd,
-		               mode->hdisplay,
-			       mode->vdisplay,
-			       DRM_FORMAT_XRGB8888,
-			       DRM_FORMAT_MOD_LINEAR,
-			       &fb1);
+	fb_id1 = igt_create_fb_with_bo_size(data->drm_fd,
+					    mode->hdisplay,
+					    mode->vdisplay,
+					    data->drm_format,
+					    DRM_FORMAT_MOD_LINEAR,
+					    IGT_COLOR_YCBCR_BT709,
+					    IGT_COLOR_YCBCR_LIMITED_RANGE,
+					    &fb1,
+					    0,
+					    0);
 	igt_assert(fb_id1);
 
 	set_degamma(data, primary->crtc, degamma_linear);
@@ -502,14 +555,25 @@ run_gamma_degamma_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 	igt_require(port_idx >= 0);
 
 	data->color_depth = 8;
-	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
 	if (!crtc_output_combo_valid(data, crtc))
 		return;
 
-	igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), data->output->name)
-		igt_assert(test_t(data, data->primary, data->ports[port_idx]));
+	for (int i = 0; i < ARRAY_SIZE(formats); i++) {
+		igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
+			      data->output->name, formats[i].name) {
+			if (!igt_plane_has_format_mod(data->primary,
+						      formats[i].format,
+						      DRM_FORMAT_MOD_LINEAR))
+				continue;
+			igt_info("Running on " IGT_FORMAT_FMT " format\n",
+				 IGT_FORMAT_ARGS(formats[i].format));
+			data->drm_format = formats[i].format;
+			igt_assert(test_t(data, data->primary,
+					  data->ports[port_idx]));
+		}
+	}
 }
 
 static void
@@ -541,41 +605,47 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 	 */
 	data->color_depth = 8;
 	delta = 1.0 / (1 << data->color_depth);
-	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
 	if (!crtc_output_combo_valid(data, crtc))
 		return;
 
-	igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), data->output->name) {
-		bool success = false;
-		int i;
-
-		if (!iter)
-			success = test_pipe_ctm(data, data->primary,
-						red_green_blue,
-						expected_colors, ctm,
-						data->ports[port_idx]);
-
-		/*
-		 * We tests a few values around the expected result because
-		 * it depends on the hardware we're dealing with, we can either
-		 * get clamped or rounded values and we also need to account
-		 * for odd number of items in the LUTs.
-		 */
-		for (i = 0; i < iter; i++) {
-			expected_colors[0].r =
-				expected_colors[1].g =
-				expected_colors[2].b =
-				ctm[0] + delta * (i - (iter / 2));
-			if (test_pipe_ctm(data, data->primary,
-					  red_green_blue, expected_colors,
-					  ctm, data->ports[port_idx])) {
-				success = true;
-				break;
+	for (int fi = 0; fi < ARRAY_SIZE(formats); fi++) {
+		igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
+			      data->output->name, formats[fi].name) {
+			bool success = false;
+			int i;
+
+			data->drm_format = formats[fi].format;
+
+			if (!igt_plane_has_format_mod(data->primary,
+						      formats[fi].format,
+						      DRM_FORMAT_MOD_LINEAR))
+				continue;
+
+			igt_info("Running on " IGT_FORMAT_FMT " format\n",
+				 IGT_FORMAT_ARGS(formats[fi].format));
+
+			if (!iter)
+				success = test_pipe_ctm(data, data->primary,
+							red_green_blue,
+							expected_colors, ctm,
+							data->ports[port_idx]);
+
+			for (i = 0; i < iter; i++) {
+				expected_colors[0].r =
+					expected_colors[1].g =
+					expected_colors[2].b =
+					ctm[0] + delta * (i - (iter / 2));
+				if (test_pipe_ctm(data, data->primary,
+						  red_green_blue, expected_colors,
+						  ctm, data->ports[port_idx])) {
+					success = true;
+					break;
+				}
 			}
+			igt_assert(success);
 		}
-		igt_assert(success);
 	}
 }
 
@@ -590,14 +660,25 @@ run_limited_range_ctm_test_for_crtc(data_t *data, igt_crtc_t *crtc,
 	igt_require(igt_output_has_prop(data->output, IGT_CONNECTOR_BROADCAST_RGB));
 
 	data->color_depth = 8;
-	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
 	if (!crtc_output_combo_valid(data, crtc))
 		return;
 
-	igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), data->output->name)
-		igt_assert(test_t(data, data->primary, data->ports[port_idx]));
+	for (int i = 0; i < ARRAY_SIZE(formats); i++) {
+		igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
+			      data->output->name, formats[i].name) {
+			if (!igt_plane_has_format_mod(data->primary,
+						      formats[i].format,
+						      DRM_FORMAT_MOD_LINEAR))
+				continue;
+			igt_info("Running on " IGT_FORMAT_FMT " format\n",
+				 IGT_FORMAT_ARGS(formats[i].format));
+			data->drm_format = formats[i].format;
+			igt_assert(test_t(data, data->primary,
+					  data->ports[port_idx]));
+		}
+	}
 }
 
 static void
-- 
2.34.1

