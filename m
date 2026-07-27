Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B44C53209
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jul 2026 18:49:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BFE10E6D9;
	Mon, 27 Jul 2026 18:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FhB4sB2P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBCF10E6CA
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jul 2026 18:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785177997; x=1816713997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3f0ADA9FdzeZzMfFtJ8Wt5xtwqc3nDUzA3gwFXEQQSY=;
 b=FhB4sB2PRU1TSEtHJzmy23Qzk9h++DS6vTjWfb8DaXBQya0hTcHs+cf8
 XDxQgt2cHH5t2qSsAlVNyHcMdxoULQlJlsghTl8TZIGKHGWgk0DFT8RD+
 1bLD145+BjfE8ZdyGO5enK5hkwNqFOfXjvb4bYyipijPKAsZt1/EkDQYv
 hE05FVrS+n9SLYfrbdQP6q0AQlUvQNU9XSQ8XAKrWVJtQWTbGSbCK4edt
 1ysvo7I26BK/gUaMniUiKORAuG6KPyEv0I0wj8FSsi7LGpLRct8CaPMe9
 hV+hT0YHiu6YMkPDfHFXLIvS+FuKUY1XpUx1hyc2fOV0b4NaF6rloMCQD w==;
X-CSE-ConnectionGUID: ayQT7yqgTHuhjEQY8AA9NA==
X-CSE-MsgGUID: i6ste83HR0GVWdBx68VGdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="103296105"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="103296105"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 11:46:37 -0700
X-CSE-ConnectionGUID: dDGjmoZjSXS7j/mhnDtgfA==
X-CSE-MsgGUID: y1Uk2APPTweeImY1GhMbOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="259545270"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 11:46:35 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 4/6] tests/kms_color_pipeline: Add FIXED_MATRIX colorop
 tests
Date: Tue, 28 Jul 2026 00:25:29 +0530
Message-Id: <20260727185531.4046807-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260727185531.4046807-1-swati2.sharma@intel.com>
References: <20260727185531.4046807-1-swati2.sharma@intel.com>
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

[YUV Range Correct] -> [1D LUT] -> [CSC] -> [1D LUT]

New subtests:
 - plane-fixed-matrix-yuv601-rgb601
 - plane-fixed-matrix-yuv709-rgb709
 - plane-fixed-matrix-yuv2020-rgb2020
 - plane-fixed-matrix-rgb709-rgb2020
 - plane-fixed-matrix-lut1d-yuv601-rgb601
 - plane-fixed-matrix-lut1d-yuv709-rgb709
 - plane-fixed-matrix-lut1d-yuv2020-rgb2020
 - plane-lut1d-fixed-matrix-lut1d-rgb709-rgb2020
 - plane-yuv-range-correct-yuv-lim
 - plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim
 - plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim
 - plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim

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

The YCbCr range correction tests validate the limited range (conversion
active) path, standalone and chained with the FIXED_MATRIX colorop
matching the SDR plane pipeline. Redundant *-yuv-full range correction
subtests are omitted because the YCBCR_LIMITED_FULL colorop is a no-op
on full-range input, making them equivalent to the plain
plane-fixed-matrix-* tests.

Also refactors ctm_colorop_only() into a generic colorop_type_only()
helper that accepts the colorop type as a parameter.

v2: -Naming changes (CSC_FF -> FIXED_MATRIX)
    -Add YCbCr range correction tests
    -Use SW-generated reference CRC (igt_fb_convert) for YUV tests
    -Remove redundant tests

Assisted-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color_pipeline.c | 388 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 385 insertions(+), 3 deletions(-)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 6119a830f..2bd6722a7 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -13,6 +13,7 @@
 
 #include "kms_color_helper.h"
 #include "kms_colorop_helper.h"
+#include "igt_color_encoding.h"
 
 #define MAX_COLOROPS	5
 
@@ -69,7 +70,8 @@ static void test_setup(data_t *data, igt_crtc_t *crtc)
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 }
 
-static bool ctm_colorop_only(kms_colorop_t *colorops[])
+static bool colorop_type_only(kms_colorop_t *colorops[],
+			      kms_colorop_type_t type)
 {
 	int i;
 
@@ -77,7 +79,7 @@ static bool ctm_colorop_only(kms_colorop_t *colorops[])
 		return false;
 
 	for (i = 0; colorops[i]; i++) {
-		if (colorops[i]->type != KMS_COLOROP_CTM_3X4)
+		if (colorops[i]->type != type)
 			return false;
 	}
 
@@ -155,7 +157,7 @@ static void _test_plane_colorops(data_t *data,
 	 * Use flat colors only when the pipeline
 	 * contains CTM colorops exclusively.
 	 */
-	if (ctm_colorop_only(colorops))
+	if (colorop_type_only(colorops, KMS_COLOROP_CTM_3X4))
 		paint_rectangles(data, mode, fb_colors, &fb);
 	else
 		paint_gradient_rectangles(data, mode, fb_colors, &fb);
@@ -347,6 +349,383 @@ run_tests_for_plane(data_t *data)
 	}
 }
 
+
+/**
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
+static void
+_test_plane_fixed_matrix_colorops(data_t *data,
+				  igt_plane_t *plane,
+				  const color_t *fb_colors,
+				  igt_crc_t *crc_ref,
+				  kms_colorop_t *colorops[],
+				  uint32_t input_format,
+				  enum igt_color_encoding encoding,
+				  enum igt_color_range range)
+{
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode = data->mode;
+	igt_colorop_t *color_pipeline;
+	igt_crc_t crc_pipe;
+	struct igt_fb fb;
+	bool is_yuv = igt_format_is_yuv(input_format);
+
+	color_pipeline = get_color_pipeline(display, plane, colorops);
+	igt_skip_on(!color_pipeline);
+
+	if (is_yuv) {
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
+
+	/* Hardware pipeline CRC */
+	set_color_pipeline(display, plane, colorops, color_pipeline);
+	paint_rectangles(data, mode, fb_colors, &fb);
+
+	igt_plane_set_fb(plane, &fb);
+	igt_display_commit_atomic(&data->display, 0, NULL);
+	igt_wait_for_vblank(plane->crtc);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_pipe);
+
+	igt_assert_crc_equal(crc_ref, &crc_pipe);
+
+	/* Cleanup per-test state */
+	set_color_pipeline_bypass(plane);
+	reset_colorops(colorops);
+	igt_plane_set_fb(plane, NULL);
+	igt_display_commit_atomic(&data->display, 0, NULL);
+
+	igt_remove_fb(data->drm_fd, &fb);
+}
+
+static void test_plane_fixed_matrix_colorops(data_t *data, igt_crtc_t *crtc,
+					     const color_t *fb_colors,
+					     kms_colorop_t *colorops[],
+					     uint32_t input_format,
+					     enum igt_color_encoding encoding,
+					     enum igt_color_range range)
+{
+	int n_planes = crtc->n_planes;
+	igt_output_t *output = data->output;
+	drmModeModeInfo *mode = data->mode;
+	igt_plane_t *plane;
+	igt_crc_t ref_crc;
+	bool is_yuv = igt_format_is_yuv(input_format);
+
+	if (is_yuv) {
+		struct igt_fb yuv_fb;
+
+		igt_require(mode);
+
+		/*
+		 * Create a YUV input framebuffer and paint it with the
+		 * test colors. Convert it to XRGB8888 in software to
+		 * generate the reference CRC. This exercises the same
+		 * YCbCr-to-RGB matrix in SW that the HW fixed matrix
+		 * colorop should implement.
+		 */
+		igt_assert(igt_create_fb_with_bo_size(data->drm_fd,
+						      mode->hdisplay,
+						      mode->vdisplay,
+						      input_format,
+						      DRM_FORMAT_MOD_LINEAR,
+						      encoding, range,
+						      &yuv_fb, 0, 0));
+		paint_rectangles(data, mode, fb_colors, &yuv_fb);
+
+		capture_sw_converted_ref_crc(data, output, &yuv_fb, &ref_crc);
+		igt_remove_fb(data->drm_fd, &yuv_fb);
+	} else {
+		capture_ref_crc(data, output, fb_colors, &ref_crc);
+	}
+
+	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
+		plane = igt_output_get_plane(output, plane_id);
+
+		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
+			continue;
+
+		igt_dynamic_f("pipe-%s-plane-%u", igt_crtc_name(crtc), plane_id)
+			_test_plane_fixed_matrix_colorops(data, plane, fb_colors,
+							  &ref_crc, colorops,
+							  input_format,
+							  encoding, range);
+	}
+}
+
+/**
+ * SUBTEST: plane-fixed-matrix-%s
+ * Description: Test FIXED_MATRIX colorop for color space conversion: %arg[1].
+ *
+ * arg[1]:
+ *
+ * @yuv601-rgb601:		YUV BT.601 to RGB BT.601
+ * @yuv709-rgb709:		YUV BT.709 to RGB BT.709
+ * @yuv2020-rgb2020:		YUV BT.2020 to RGB BT.2020
+ * @rgb709-rgb2020:		RGB BT.709 to RGB BT.2020
+ */
+
+/**
+ * SUBTEST: plane-fixed-matrix-lut1d-%s
+ * Description: Test FIXED_MATRIX + 1D LUT pipeline: %arg[1].
+ *
+ * arg[1]:
+ *
+ * @yuv601-rgb601:		YUV BT.601 to RGB BT.601
+ * @yuv709-rgb709:		YUV BT.709 to RGB BT.709
+ * @yuv2020-rgb2020:		YUV BT.2020 to RGB BT.2020
+ */
+
+/**
+ * SUBTEST: plane-lut1d-fixed-matrix-lut1d-%s
+ * Description: Test 1D LUT + FIXED_MATRIX + 1D LUT pipeline: %arg[1].
+ *
+ * arg[1]:
+ *
+ * @rgb709-rgb2020:		RGB BT.709 to RGB BT.2020
+ */
+
+/**
+ * SUBTEST: plane-yuv-range-correct-%s
+ * Description: Test YCbCr range correction colorop: %arg[1].
+ *
+ * arg[1]:
+ *
+ * @yuv-lim:			YCbCr limited range (conversion active)
+ */
+
+/**
+ * SUBTEST: plane-yuv-range-correct-fixed-matrix-%s
+ * Description: Test YCbCr range correction + FIXED_MATRIX pipeline: %arg[1].
+ *
+ * arg[1]:
+ *
+ * @bt601-yuv-lim:		YCbCr BT.601 limited range with CSC
+ * @bt709-yuv-lim:		YCbCr BT.709 limited range with CSC
+ * @bt2020-yuv-lim:		YCbCr BT.2020 limited range with CSC
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
+		.fixed_matrix_info = { .fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR601_FULL_RGB },
+	};
+	kms_colorop_t fixed_matrix_yuv709_rgb709 = {
+		.type = KMS_COLOROP_FIXED_MATRIX,
+		.name = "FIXED_MATRIX YUV709 to RGB709",
+		.fixed_matrix_info = { .fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR709_FULL_RGB },
+	};
+	kms_colorop_t fixed_matrix_yuv2020_rgb2020 = {
+		.type = KMS_COLOROP_FIXED_MATRIX,
+		.name = "FIXED_MATRIX YUV2020 to RGB2020",
+		.fixed_matrix_info = { .fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_FULL_RGB },
+	};
+	kms_colorop_t fixed_matrix_rgb709_rgb2020 = {
+		.type = KMS_COLOROP_FIXED_MATRIX,
+		.name = "FIXED_MATRIX RGB709 to RGB2020",
+		.fixed_matrix_info = { .fixed_matrix = KMS_COLOROP_FIXED_MATRIX_RGB709_RGB2020 },
+	};
+	kms_colorop_t fixed_matrix_ycbcr_limited_full = {
+		.type = KMS_COLOROP_FIXED_MATRIX,
+		.name = "FIXED_MATRIX YCbCr limited to full",
+		.fixed_matrix_info = { .fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR_LIMITED_FULL },
+	};
+
+	struct {
+		const char *name;
+		const char *subtest_prefix;
+		const color_t *fb_colors;
+		kms_colorop_t *colorops[MAX_COLOROPS];
+		uint32_t input_format;
+		enum igt_color_encoding encoding;
+		enum igt_color_range range;
+	} fixed_matrix_tests[] = {
+		{ .name = "yuv601-rgb601",
+		  .subtest_prefix = "plane-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv601_rgb601, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT601,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "yuv709-rgb709",
+		  .subtest_prefix = "plane-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv709_rgb709, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT709,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "yuv2020-rgb2020",
+		  .subtest_prefix = "plane-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv2020_rgb2020, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT2020,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "rgb709-rgb2020",
+		  .subtest_prefix = "plane-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_rgb709_rgb2020, NULL },
+		  .input_format = DRM_FORMAT_XRGB8888,
+		},
+		{ .name = "yuv601-rgb601",
+		  .subtest_prefix = "plane-fixed-matrix-lut1d",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv601_rgb601, &lut1d_linear, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT601,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "yuv709-rgb709",
+		  .subtest_prefix = "plane-fixed-matrix-lut1d",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv709_rgb709, &lut1d_linear, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT709,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "yuv2020-rgb2020",
+		  .subtest_prefix = "plane-fixed-matrix-lut1d",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv2020_rgb2020, &lut1d_linear, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT2020,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "rgb709-rgb2020",
+		  .subtest_prefix = "plane-lut1d-fixed-matrix-lut1d",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &lut1d_linear, &fixed_matrix_rgb709_rgb2020, &lut1d_linear, NULL },
+		  .input_format = DRM_FORMAT_XRGB8888,
+		},
+		{ .name = "yuv-lim",
+		  .subtest_prefix = "plane-yuv-range-correct",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_ycbcr_limited_full, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT709,
+		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
+		},
+		{ .name = "bt601-yuv-lim",
+		  .subtest_prefix = "plane-yuv-range-correct-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_ycbcr_limited_full, &fixed_matrix_yuv601_rgb601, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT601,
+		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
+		},
+		{ .name = "bt709-yuv-lim",
+		  .subtest_prefix = "plane-yuv-range-correct-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_ycbcr_limited_full, &fixed_matrix_yuv709_rgb709, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT709,
+		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
+		},
+		{ .name = "bt2020-yuv-lim",
+		  .subtest_prefix = "plane-yuv-range-correct-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_ycbcr_limited_full, &fixed_matrix_yuv2020_rgb2020, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT2020,
+		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
+		},
+	};
+
+	for (int i = 0; i < ARRAY_SIZE(fixed_matrix_tests); i++) {
+		igt_describe_f("Test FIXED_MATRIX pipeline: %s-%s",
+			       fixed_matrix_tests[i].subtest_prefix,
+			       fixed_matrix_tests[i].name);
+		igt_subtest_with_dynamic_f("%s-%s",
+					   fixed_matrix_tests[i].subtest_prefix,
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
+								 fixed_matrix_tests[i].colorops,
+								 fixed_matrix_tests[i].input_format,
+								 fixed_matrix_tests[i].encoding,
+								 fixed_matrix_tests[i].range);
+				test_cleanup(data);
+			}
+		}
+	}
+}
+
 int igt_main()
 {
 	data_t data = {};
@@ -372,6 +751,9 @@ int igt_main()
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

