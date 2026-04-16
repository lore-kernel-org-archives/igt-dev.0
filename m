Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF53F8D76E
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 19:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204AE10E16B;
	Thu, 16 Apr 2026 19:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DyI47vTc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483F610E213
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 19:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776367127; x=1807903127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K2QUSmGHtROhbth5YTyrOFbEXw8kGYPPtEBEclv4lBI=;
 b=DyI47vTcA2I8P7Ck2GapDeGb0BSVev9DCMukHRBQIww5S8qDPah3PqyS
 8vfozH9onCaf59LoV5ZYFmYIRHdI0TueCrva4l8cpaP7EIZ0x08C/wlG2
 4Ej6sBXHeV9u9N4QiiofVFzhDAwVqwFUs1fIv9AdqOdySnZgLJQGjYc0l
 +pF2OA2ZWvQP0I9tzXtoIoxi7kjt85ve9CE95c2h9ChsgXsh3LYxl60WF
 ckiPBze4Pq3oqfrQXtMsIeZmE7Vbu7PVyd+Q7T5U2jTqcbwZWtPtmmuk2
 KVGdXFG7l2YmtM5vnWyMe0Hk0T924ao+UMEQ2pbj5zyrWJebK0LHVnz+N g==;
X-CSE-ConnectionGUID: nVAg0oGZSXiW61InLwyBpg==
X-CSE-MsgGUID: 6vZjFt1KR8ij6OXab2frWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81260628"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="81260628"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 12:18:27 -0700
X-CSE-ConnectionGUID: q0NxKo5gRlCODcBnNtEWgA==
X-CSE-MsgGUID: u6CnUFI/QM6gEiZmwi99Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="229818028"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 12:18:26 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [RFC PATCH,
 v2 4/5] tests/kms_color_pipeline: Add FIXED_MATRIX colorop tests
Date: Fri, 17 Apr 2026 00:56:59 +0530
Message-Id: <20260416192700.1579042-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260416192700.1579042-1-swati2.sharma@intel.com>
References: <20260416192700.1579042-1-swati2.sharma@intel.com>
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
 - plane-yuv-range-correct-yuv-full
 - plane-yuv-range-correct-fixed-matrix-bt601-yuv-lim
 - plane-yuv-range-correct-fixed-matrix-bt601-yuv-full
 - plane-yuv-range-correct-fixed-matrix-bt709-yuv-lim
 - plane-yuv-range-correct-fixed-matrix-bt709-yuv-full
 - plane-yuv-range-correct-fixed-matrix-bt2020-yuv-lim
 - plane-yuv-range-correct-fixed-matrix-bt2020-yuv-full

For YUV input tests, a YUYV framebuffer is created with the appropriate
color encoding and range. The reference CRC is captured from an
XRGB8888 framebuffer with expected colors, then compared against the
CRC produced by the HW color pipeline with FIXED_MATRIX active.

The YCbCr range correction tests validate both limited range (conversion
active) and full range (bypass) paths, standalone and chained with the
FIXED_MATRIX colorop matching the SDR plane pipeline.

Also refactors ctm_colorop_only() into a generic colorop_type_only()
helper that accepts the colorop type as a parameter.

v2: -Naming changes (CSC_FF -> FIXED_MATRIX)
    -Add YCbCr range correction tests (yuv-lim + yuv-full)

Co-developed-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color_pipeline.c | 392 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 389 insertions(+), 3 deletions(-)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 78860a845..6cc5e9bfc 100644
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
@@ -347,6 +349,387 @@ run_tests_for_plane(data_t *data)
 	}
 }
 
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
+
+	if (colorop_type_only(colorops, KMS_COLOROP_FIXED_MATRIX))
+		paint_rectangles(data, mode, fb_colors, &fb);
+	else
+		paint_gradient_rectangles(data, mode, fb_colors, &fb);
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
+					     const color_t *exp_colors,
+					     kms_colorop_t *colorops[],
+					     uint32_t input_format,
+					     enum igt_color_encoding encoding,
+					     enum igt_color_range range)
+{
+	int n_planes = crtc->n_planes;
+	igt_output_t *output = data->output;
+	igt_plane_t *plane;
+	igt_crc_t ref_crc;
+
+	capture_ref_crc(data, output, exp_colors, &ref_crc);
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
+ * @yuv-full:			YCbCr full range (bypass)
+ */
+
+/**
+ * SUBTEST: plane-yuv-range-correct-fixed-matrix-%s
+ * Description: Test YCbCr range correction + FIXED_MATRIX pipeline: %arg[1].
+ *
+ * arg[1]:
+ *
+ * @bt601-yuv-lim:		YCbCr BT.601 limited range with CSC
+ * @bt601-yuv-full:		YCbCr BT.601 full range with CSC (range bypass)
+ * @bt709-yuv-lim:		YCbCr BT.709 limited range with CSC
+ * @bt709-yuv-full:		YCbCr BT.709 full range with CSC (range bypass)
+ * @bt2020-yuv-lim:		YCbCr BT.2020 limited range with CSC
+ * @bt2020-yuv-full:		YCbCr BT.2020 full range with CSC (range bypass)
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
+	kms_colorop_t lut1d_pre = {
+		.type = KMS_COLOROP_CUSTOM_LUT1D,
+		.name = "Pre FIXED_MATRIX 1D LUT (linear)",
+		.lut1d = &igt_1dlut_linear,
+		.transform = &igt_color_linear,
+	};
+	kms_colorop_t lut1d_post = {
+		.type = KMS_COLOROP_CUSTOM_LUT1D,
+		.name = "Post FIXED_MATRIX 1D LUT (max)",
+		.lut1d = &igt_1dlut_max,
+		.transform = &igt_color_max,
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
+		.fixed_matrix_info = { .fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR2020_FULL_RGB_NC },
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
+		const color_t *exp_colors;
+		kms_colorop_t *colorops[MAX_COLOROPS];
+		uint32_t input_format;
+		enum igt_color_encoding encoding;
+		enum igt_color_range range;
+	} fixed_matrix_tests[] = {
+		{ .name = "yuv601-rgb601",
+		  .subtest_prefix = "plane-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv601_rgb601, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT601,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "yuv709-rgb709",
+		  .subtest_prefix = "plane-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv709_rgb709, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT709,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "yuv2020-rgb2020",
+		  .subtest_prefix = "plane-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv2020_rgb2020, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT2020,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "rgb709-rgb2020",
+		  .subtest_prefix = "plane-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_rgb709_rgb2020, NULL },
+		  .input_format = DRM_FORMAT_XRGB8888,
+		},
+		{ .name = "yuv601-rgb601",
+		  .subtest_prefix = "plane-fixed-matrix-lut1d",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv601_rgb601, &lut1d_post, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT601,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "yuv709-rgb709",
+		  .subtest_prefix = "plane-fixed-matrix-lut1d",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv709_rgb709, &lut1d_post, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT709,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "yuv2020-rgb2020",
+		  .subtest_prefix = "plane-fixed-matrix-lut1d",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv2020_rgb2020, &lut1d_post, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT2020,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "rgb709-rgb2020",
+		  .subtest_prefix = "plane-lut1d-fixed-matrix-lut1d",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &lut1d_pre, &fixed_matrix_rgb709_rgb2020, &lut1d_post, NULL },
+		  .input_format = DRM_FORMAT_XRGB8888,
+		},
+		/* YCbCr range correction tests: limited (active) and full (bypass) */
+		{ .name = "yuv-lim",
+		  .subtest_prefix = "plane-yuv-range-correct",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_ycbcr_limited_full, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT709,
+		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
+		},
+		{ .name = "yuv-full",
+		  .subtest_prefix = "plane-yuv-range-correct",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_ycbcr_limited_full, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT709,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		/* YCbCr range correction + FIXED_MATRIX pipeline tests */
+		{ .name = "bt601-yuv-lim",
+		  .subtest_prefix = "plane-yuv-range-correct-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_ycbcr_limited_full, &fixed_matrix_yuv601_rgb601, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT601,
+		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
+		},
+		{ .name = "bt601-yuv-full",
+		  .subtest_prefix = "plane-yuv-range-correct-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_ycbcr_limited_full, &fixed_matrix_yuv601_rgb601, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT601,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "bt709-yuv-lim",
+		  .subtest_prefix = "plane-yuv-range-correct-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_ycbcr_limited_full, &fixed_matrix_yuv709_rgb709, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT709,
+		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
+		},
+		{ .name = "bt709-yuv-full",
+		  .subtest_prefix = "plane-yuv-range-correct-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_ycbcr_limited_full, &fixed_matrix_yuv709_rgb709, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT709,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "bt2020-yuv-lim",
+		  .subtest_prefix = "plane-yuv-range-correct-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_ycbcr_limited_full, &fixed_matrix_yuv2020_rgb2020, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT2020,
+		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
+		},
+		{ .name = "bt2020-yuv-full",
+		  .subtest_prefix = "plane-yuv-range-correct-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_ycbcr_limited_full, &fixed_matrix_yuv2020_rgb2020, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT2020,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
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
+								 fixed_matrix_tests[i].exp_colors,
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
 	int has_plane_color_pipeline = 0;
@@ -377,6 +760,9 @@ int igt_main()
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

