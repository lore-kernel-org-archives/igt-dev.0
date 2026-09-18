Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9698CC982D2
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 08:28:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1AB10E95F;
	Fri, 18 Sep 2026 08:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nxnNZ61F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0F110E95F
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Sep 2026 08:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789719891; x=1821255891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A/X9HhIfImlw9hREWYqYO98V1thB6jJuAp+j+iab9T8=;
 b=nxnNZ61FX91npGTPLoJmWVRIPQ07iq6LEa7U9qWe5FBEWN7xgIIOw1W+
 sDcp6xU4q0NtSNmj9KR9qEUiHjj6WCL2gdWk59Slpd/0odU2X0ML83vgr
 gV/WYlOgsXrEMU8ftYQ/73YUTmkc+8pAio4r/q4J6Yvj8UPV/iZAULUSY
 dISyi8iY20bjerj2bOSKTizKWUtMMUwt1milZ6puDd1IOywZDUDo7L0s2
 RpF9zWR5BafZun/qFAkH45bcEJuMU/j5ZLU7vp3QjCqdkhYDZK3EpEgeY
 vohWjHLisCVOBin+6GGQkD0Y4S2UmSpeDD2FFNF2hnMyr9tItGfgpWpsu Q==;
X-CSE-ConnectionGUID: uHnAXNxRTn2p77kFMr/yMQ==
X-CSE-MsgGUID: ZKu9rERbRGqkxEPH7FHSCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100870712"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100870712"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 01:24:51 -0700
X-CSE-ConnectionGUID: BhtB4gl/TAKrugN7d7MiFg==
X-CSE-MsgGUID: LsEAcK4ZQFe2njVeGCcMrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270965436"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 01:24:50 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH i-g-t,
 v6 4/6] tests/kms_color_pipeline: Add FIXED_MATRIX colorop tests
Date: Fri, 18 Sep 2026 14:03:48 +0530
Message-Id: <20260918083350.1021184-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260918083350.1021184-1-swati2.sharma@intel.com>
References: <20260918083350.1021184-1-swati2.sharma@intel.com>
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

Add plane color pipeline tests for the DRM_COLOROP_FIXED_MATRIX colorop,
validating color space conversion through the color pipeline framework.

With this, the SDR plane color pipeline looks like:

[YUV Full/Limited -> RGB] -> [1D LUT]

A single FIXED_MATRIX colorop handles both full and limited range
YCbCr to RGB conversion.

New subtests:
 - plane-fixed-matrix-yuv-rgb-bt601
 - plane-fixed-matrix-yuv-rgb-bt709
 - plane-fixed-matrix-yuv-rgb-bt2020
 - plane-fixed-matrix-yuv-rgb-bt601-lim
 - plane-fixed-matrix-yuv-rgb-bt709-lim
 - plane-fixed-matrix-yuv-rgb-bt2020-lim
 - plane-fixed-matrix-yuv-rgb-bt601-lut1d
 - plane-fixed-matrix-yuv-rgb-bt709-lut1d
 - plane-fixed-matrix-yuv-rgb-bt2020-lut1d
 - plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d
 - plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d
 - plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d

The test works as follows:
1. Creates a YUYV framebuffer with the appropriate color encoding
2. Converts it to XRGB8888 in software using igt_fb_convert() which
   internally uses igt_ycbcr_to_rgb_matrix() with the matching
   coefficients
3. Displays the SW-converted RGB fb and captures its CRC as reference
4. Programs the HW color pipeline with the FIXED_MATRIX colorop set to
   the corresponding matrix type
5. Displays the original YUYV fb through the HW pipeline and compares
   the resulting CRC against the SW reference

This ensures the HW fixed matrix implementation matches the expected
YCbCr-to-RGB conversion behavior.

Address review comments from Chaitanya:
v2: -Naming changes (CSC_FF -> FIXED_MATRIX)
    -Use SW-generated reference CRC (igt_fb_convert) for YUV tests
    -Remove redundant tests
v3: -Drop YCbCr limited to full and RGB709 to RGB2020 matrices
     until we have non-IGT userspace that shows their use
    -Add limited range YCbCr to RGB tests
    -Consolidate all tests under single plane-fixed-matrix prefix
v4: -Revert colorop_type_only() back to ctm_colorop_only()
    -Reuse _test_plane_colorops() for FIXED_MATRIX instead of
     separate _test_plane_fixed_matrix_colorops()
    -Move cleanup before assert so failed plane doesn't affect
     next plane
    -Store encoding/range in colorop fixed_matrix_info
v5: -rebase
v6: -remove extra newline
    -non-doc comment
    -derive encoding/range from colorops[0]
    -assert colorops[0] is a YUV to RGB fixed matrix type
    -remove redundant encoding/range arguments
    -remove redundant igt_require(mode)

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_color_pipeline.c | 308 ++++++++++++++++++++++++++++++++++---
 1 file changed, 289 insertions(+), 19 deletions(-)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 78860a845..693a0faed 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -130,32 +130,47 @@ static void _test_plane_colorops(data_t *data,
 				 igt_plane_t *plane,
 				 const color_t *fb_colors,
 				 igt_crc_t *crc_ref,
-				 kms_colorop_t *colorops[])
+				 kms_colorop_t *colorops[],
+				 uint32_t input_format)
 {
 	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode = data->mode;
 	igt_colorop_t *color_pipeline;
 	igt_crc_t crc_pipe;
 	struct igt_fb fb;
+	bool is_yuv = igt_format_is_yuv(input_format);
 
 	color_pipeline = get_color_pipeline(display, plane, colorops);
 	igt_skip_on(!color_pipeline);
 
-	/* Create a framebuffer at the size of the output. */
-	igt_assert(igt_create_fb(data->drm_fd,
-				 mode->hdisplay,
-				 mode->vdisplay,
-				 DRM_FORMAT_XRGB8888,
-				 DRM_FORMAT_MOD_LINEAR,
-				 &fb));
+	if (is_yuv) {
+		enum igt_color_encoding encoding;
+		enum igt_color_range range;
+
+		igt_assert(colorops[0]);
+		igt_assert_eq(colorops[0]->type, KMS_COLOROP_FIXED_MATRIX);
+		encoding = colorops[0]->fixed_matrix_info.encoding;
+		range = colorops[0]->fixed_matrix_info.range;
+
+		igt_assert(igt_create_fb_with_bo_size(data->drm_fd,
+						      mode->hdisplay,
+						      mode->vdisplay,
+						      input_format,
+						      DRM_FORMAT_MOD_LINEAR,
+						      encoding, range,
+						      &fb, 0, 0));
+	} else {
+		igt_assert(igt_create_fb(data->drm_fd,
+					 mode->hdisplay,
+					 mode->vdisplay,
+					 input_format,
+					 DRM_FORMAT_MOD_LINEAR,
+					 &fb));
+	}
 
-	/* Hardware pipeline CRC */
 	set_color_pipeline(display, plane, colorops, color_pipeline);
-	/*
-	 * Use flat colors only when the pipeline
-	 * contains CTM colorops exclusively.
-	 */
-	if (ctm_colorop_only(colorops))
+
+	if (ctm_colorop_only(colorops) || is_yuv)
 		paint_rectangles(data, mode, fb_colors, &fb);
 	else
 		paint_gradient_rectangles(data, mode, fb_colors, &fb);
@@ -165,15 +180,14 @@ static void _test_plane_colorops(data_t *data,
 	igt_wait_for_vblank(plane->crtc);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_pipe);
 
-	igt_assert_crc_equal(crc_ref, &crc_pipe);
-
-	/* Cleanup per-test state */
+	/* Cleanup before assert so failed plane doesn't affect next plane */
 	set_color_pipeline_bypass(plane);
 	reset_colorops(colorops);
 	igt_plane_set_fb(plane, NULL);
 	igt_display_commit_atomic(&data->display, 0, NULL);
-
 	igt_remove_fb(data->drm_fd, &fb);
+
+	igt_assert_crc_equal(crc_ref, &crc_pipe);
 }
 
 static void test_plane_colorops(data_t *data, igt_crtc_t *crtc,
@@ -196,7 +210,8 @@ static void test_plane_colorops(data_t *data, igt_crtc_t *crtc,
 
 		igt_dynamic_f("pipe-%s-plane-%u", igt_crtc_name(crtc), plane_id)
 			_test_plane_colorops(data, plane, fb_colors,
-					     &ref_crc, colorops);
+					     &ref_crc, colorops,
+					     DRM_FORMAT_XRGB8888);
 	}
 }
 
@@ -347,6 +362,258 @@ run_tests_for_plane(data_t *data)
 	}
 }
 
+/*
+ * Capture reference CRC by converting a YUV framebuffer to RGB in software
+ * using igt_fb_convert(), then displaying the resulting XRGB8888 framebuffer.
+ */
+static void
+capture_sw_converted_ref_crc(data_t *data, igt_output_t *output,
+			     struct igt_fb *yuv_fb, igt_crc_t *crc /* out */)
+{
+	struct igt_fb rgb_ref_fb;
+	igt_plane_t *primary;
+	char *crc_str;
+	int ret;
+
+	primary = igt_output_get_plane(output, DRM_PLANE_TYPE_PRIMARY);
+
+	/* Convert YUV fb to XRGB8888 in software (uses igt_ycbcr_to_rgb_matrix) */
+	igt_fb_convert(&rgb_ref_fb, yuv_fb, DRM_FORMAT_XRGB8888,
+		       DRM_FORMAT_MOD_LINEAR);
+
+	igt_plane_set_fb(primary, &rgb_ref_fb);
+	ret = igt_display_try_commit_atomic(&data->display, 0, NULL);
+	igt_assert(!ret);
+
+	igt_wait_for_vblank(primary->crtc);
+	igt_pipe_crc_collect_crc(data->pipe_crc, crc);
+
+	igt_plane_set_fb(primary, NULL);
+	igt_display_commit_atomic(&data->display, 0, NULL);
+
+	igt_remove_fb(data->drm_fd, &rgb_ref_fb);
+
+	crc_str = igt_crc_to_string(crc);
+	igt_debug("CRC for SW-converted reference fb: %s\n", crc_str);
+	free(crc_str);
+}
+
+static void test_plane_fixed_matrix_colorops(data_t *data, igt_crtc_t *crtc,
+					     const color_t *fb_colors,
+					     kms_colorop_t *colorops[])
+{
+	int n_planes = crtc->n_planes;
+	igt_output_t *output = data->output;
+	drmModeModeInfo *mode = data->mode;
+	igt_plane_t *plane;
+	igt_crc_t ref_crc;
+	struct igt_fb yuv_fb;
+	enum igt_color_encoding encoding;
+	enum igt_color_range range;
+
+	igt_assert(colorops[0]);
+	igt_assert_eq(colorops[0]->type, KMS_COLOROP_FIXED_MATRIX);
+
+	encoding = colorops[0]->fixed_matrix_info.encoding;
+	range = colorops[0]->fixed_matrix_info.range;
+
+	igt_assert(igt_create_fb_with_bo_size(data->drm_fd,
+					      mode->hdisplay,
+					      mode->vdisplay,
+					      DRM_FORMAT_YUYV,
+					      DRM_FORMAT_MOD_LINEAR,
+					      encoding, range,
+					      &yuv_fb, 0, 0));
+	paint_rectangles(data, mode, fb_colors, &yuv_fb);
+
+	capture_sw_converted_ref_crc(data, output, &yuv_fb, &ref_crc);
+	igt_remove_fb(data->drm_fd, &yuv_fb);
+
+	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
+		plane = igt_output_get_plane(output, plane_id);
+
+		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
+			continue;
+
+		igt_dynamic_f("pipe-%s-plane-%u", igt_crtc_name(crtc), plane_id)
+			_test_plane_colorops(data, plane, fb_colors,
+					     &ref_crc, colorops,
+					     DRM_FORMAT_YUYV);
+	}
+}
+
+/**
+ * SUBTEST: plane-fixed-matrix-%s
+ * Description: Test FIXED_MATRIX colorop for color space conversion: %arg[1].
+ *
+ * arg[1]:
+ *
+ * @yuv-rgb-bt601:		YUV BT.601 full range to RGB BT.601
+ * @yuv-rgb-bt709:		YUV BT.709 full range to RGB BT.709
+ * @yuv-rgb-bt2020:		YUV BT.2020 full range to RGB BT.2020
+ * @yuv-rgb-bt601-lim:		YUV BT.601 limited range to RGB BT.601
+ * @yuv-rgb-bt709-lim:		YUV BT.709 limited range to RGB BT.709
+ * @yuv-rgb-bt2020-lim:	YUV BT.2020 limited range to RGB BT.2020
+ * @yuv-rgb-bt601-lut1d:	YUV BT.601 full range to RGB BT.601, then 1D LUT
+ * @yuv-rgb-bt709-lut1d:	YUV BT.709 full range to RGB BT.709, then 1D LUT
+ * @yuv-rgb-bt2020-lut1d:	YUV BT.2020 full range to RGB BT.2020, then 1D LUT
+ * @yuv-rgb-bt601-lim-lut1d:	YUV BT.601 limited range to RGB BT.601, then 1D LUT
+ * @yuv-rgb-bt709-lim-lut1d:	YUV BT.709 limited range to RGB BT.709, then 1D LUT
+ * @yuv-rgb-bt2020-lim-lut1d:	YUV BT.2020 limited range to RGB BT.2020, then 1D LUT
+ */
+
+static void
+run_tests_for_fixed_matrix(data_t *data)
+{
+	igt_crtc_t *crtc;
+	igt_output_t *output = NULL;
+
+	static const color_t colors_rgb[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 },
+	};
+
+	kms_colorop_t lut1d_linear = {
+		.type = KMS_COLOROP_CUSTOM_LUT1D,
+		.name = "1D LUT (linear)",
+		.lut1d = &igt_1dlut_linear,
+		.transform = &igt_color_linear,
+	};
+
+	kms_colorop_t fixed_matrix_yuv601_rgb601 = {
+		.type = KMS_COLOROP_FIXED_MATRIX,
+		.name = "FIXED_MATRIX YUV601 to RGB601",
+		.fixed_matrix_info = {
+			.fixed_matrix_type = KMS_COLOROP_FIXED_MATRIX_YCBCR601_FULL_RGB,
+			.encoding = IGT_COLOR_YCBCR_BT601,
+			.range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+	};
+	kms_colorop_t fixed_matrix_yuv709_rgb709 = {
+		.type = KMS_COLOROP_FIXED_MATRIX,
+		.name = "FIXED_MATRIX YUV709 to RGB709",
+		.fixed_matrix_info = {
+			.fixed_matrix_type = KMS_COLOROP_FIXED_MATRIX_YCBCR709_FULL_RGB,
+			.encoding = IGT_COLOR_YCBCR_BT709,
+			.range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+	};
+	kms_colorop_t fixed_matrix_yuv2020_rgb2020 = {
+		.type = KMS_COLOROP_FIXED_MATRIX,
+		.name = "FIXED_MATRIX YUV2020 to RGB2020",
+		.fixed_matrix_info = {
+			.fixed_matrix_type = KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_FULL_RGB,
+			.encoding = IGT_COLOR_YCBCR_BT2020,
+			.range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+	};
+	kms_colorop_t fixed_matrix_yuv601_rgb601_lim = {
+		.type = KMS_COLOROP_FIXED_MATRIX,
+		.name = "FIXED_MATRIX YUV601 limited to RGB601",
+		.fixed_matrix_info = {
+			.fixed_matrix_type = KMS_COLOROP_FIXED_MATRIX_YCBCR601_LIMITED_RGB,
+			.encoding = IGT_COLOR_YCBCR_BT601,
+			.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
+		},
+	};
+	kms_colorop_t fixed_matrix_yuv709_rgb709_lim = {
+		.type = KMS_COLOROP_FIXED_MATRIX,
+		.name = "FIXED_MATRIX YUV709 limited to RGB709",
+		.fixed_matrix_info = {
+			.fixed_matrix_type = KMS_COLOROP_FIXED_MATRIX_YCBCR709_LIMITED_RGB,
+			.encoding = IGT_COLOR_YCBCR_BT709,
+			.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
+		},
+	};
+	kms_colorop_t fixed_matrix_yuv2020_rgb2020_lim = {
+		.type = KMS_COLOROP_FIXED_MATRIX,
+		.name = "FIXED_MATRIX YUV2020 limited to RGB2020",
+		.fixed_matrix_info = {
+			.fixed_matrix_type = KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_LIMITED_RGB,
+			.encoding = IGT_COLOR_YCBCR_BT2020,
+			.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
+		},
+	};
+
+	struct {
+		const char *name;
+		const color_t *fb_colors;
+		kms_colorop_t *colorops[MAX_COLOROPS];
+	} fixed_matrix_tests[] = {
+		{ .name = "yuv-rgb-bt601",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv601_rgb601, NULL },
+		},
+		{ .name = "yuv-rgb-bt709",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv709_rgb709, NULL },
+		},
+		{ .name = "yuv-rgb-bt2020",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv2020_rgb2020, NULL },
+		},
+		{ .name = "yuv-rgb-bt601-lim",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv601_rgb601_lim, NULL },
+		},
+		{ .name = "yuv-rgb-bt709-lim",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv709_rgb709_lim, NULL },
+		},
+		{ .name = "yuv-rgb-bt2020-lim",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv2020_rgb2020_lim, NULL },
+		},
+		{ .name = "yuv-rgb-bt601-lut1d",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv601_rgb601, &lut1d_linear, NULL },
+		},
+		{ .name = "yuv-rgb-bt709-lut1d",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv709_rgb709, &lut1d_linear, NULL },
+		},
+		{ .name = "yuv-rgb-bt2020-lut1d",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv2020_rgb2020, &lut1d_linear, NULL },
+		},
+		{ .name = "yuv-rgb-bt601-lim-lut1d",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv601_rgb601_lim, &lut1d_linear, NULL },
+		},
+		{ .name = "yuv-rgb-bt709-lim-lut1d",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv709_rgb709_lim, &lut1d_linear, NULL },
+		},
+		{ .name = "yuv-rgb-bt2020-lim-lut1d",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv2020_rgb2020_lim, &lut1d_linear, NULL },
+		},
+	};
+
+	for (int i = 0; i < ARRAY_SIZE(fixed_matrix_tests); i++) {
+		igt_describe_f("Test FIXED_MATRIX pipeline: plane-fixed-matrix-%s",
+			       fixed_matrix_tests[i].name);
+		igt_subtest_with_dynamic_f("plane-fixed-matrix-%s",
+					   fixed_matrix_tests[i].name) {
+			for_each_crtc_with_single_output(&data->display, crtc,
+							 output) {
+				data->output = output;
+
+				if (!crtc_output_combo_valid(data, crtc))
+					continue;
+
+				test_setup(data, crtc);
+
+				test_plane_fixed_matrix_colorops(data, crtc,
+								 fixed_matrix_tests[i].fb_colors,
+								 fixed_matrix_tests[i].colorops);
+				test_cleanup(data);
+			}
+		}
+	}
+}
+
 int igt_main()
 {
 	int has_plane_color_pipeline = 0;
@@ -377,6 +644,9 @@ int igt_main()
 	igt_subtest_group()
 		run_tests_for_plane(&data);
 
+	igt_subtest_group()
+		run_tests_for_fixed_matrix(&data);
+
 	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.25.1

