Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6AA10D14A6
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 11:43:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F81D10E68C;
	Mon, 30 Mar 2026 11:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G3s6ZEA2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE8F10E678
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 11:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774870958; x=1806406958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=udavaBoyU2TcJVoaqrhne3Mwc5uxu6FX4CpMC1b+WTk=;
 b=G3s6ZEA2RNkaxEz67pwEjK0kdlfy7hCACCVCbQGN9f36EUJIxCxcORxb
 AWKNrJIA6LtOBDOu1huExFCsXj+sgeMJGKo9HgK3VU66z5AOL7Jov/yoZ
 91QjyJ2P8sm69MHHV7Su1Yp7sZgs1fDy0kEzoPhVpQP1HVLOKp43Vmh+H
 1KjsxtSn40ZjOVXDTF/wvlCCDhH+ATBYvAs+8henl+bgam2zy9BmZghxN
 O7XHv4lk6qm27mYqSUXagtn/0QrjALNaozWcT0bsL+Yy0n4FuIVFSSUcq
 njSq3lygpQTvU+oj9SZzBvxEOCeSxc4Adq+ezT0aGrR9JgEV5R9D2SQhl A==;
X-CSE-ConnectionGUID: jMlr0ZJ7SeuwCTyB/FoLlA==
X-CSE-MsgGUID: dBqeUi+xQVqOry+MDpmzjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75572011"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="75572011"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 04:42:38 -0700
X-CSE-ConnectionGUID: MDFv9JUURaCFNm8wICHemw==
X-CSE-MsgGUID: LQher0A7R/mP44YJTZD+lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="230080369"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 04:42:37 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [RFC PATCH i-g-t 4/5] tests/kms_color_pipeline: Add CSC_FF colorop
 tests
Date: Mon, 30 Mar 2026 17:20:56 +0530
Message-Id: <20260330115057.963395-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260330115057.963395-1-swati2.sharma@intel.com>
References: <20260330115057.963395-1-swati2.sharma@intel.com>
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

Add plane color pipeline tests for the DRM_COLOROP_CSC_FF colorop,
validating color space conversion through the color pipeline framework.

New subtests:
 - plane-csc-ff-yuv601-rgb601
 - plane-csc-ff-yuv709-rgb709
 - plane-csc-ff-yuv2020-rgb2020
 - plane-csc-ff-rgb709-rgb2020
 - plane-csc-ff-lut1d-yuv601-rgb601
 - plane-csc-ff-lut1d-yuv709-rgb709
 - plane-csc-ff-lut1d-yuv2020-rgb2020
 - plane-lut1d-csc-ff-lut1d-rgb709-rgb2020

For YUV input tests, a YUYV framebuffer is created with the appropriate
color encoding and full range. The reference CRC is captured from an
XRGB8888 framebuffer with expected colors, then compared against the
CRC produced by the HW color pipeline with CSC_FF active.

Also refactors ctm_colorop_only() into a generic colorop_type_only()
helper that accepts the colorop type as a parameter.

Co-developed-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color_pipeline.c | 289 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 286 insertions(+), 3 deletions(-)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 78860a845..85accef27 100644
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
@@ -347,6 +349,284 @@ run_tests_for_plane(data_t *data)
 	}
 }
 
+
+static void
+_test_plane_csc_ff_colorops(data_t *data,
+			    igt_plane_t *plane,
+			    const color_t *fb_colors,
+			    igt_crc_t *crc_ref,
+			    kms_colorop_t *colorops[],
+			    uint32_t input_format,
+			    enum igt_color_encoding encoding,
+			    enum igt_color_range range)
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
+	if (colorop_type_only(colorops, KMS_COLOROP_CSC_FF))
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
+static void test_plane_csc_ff_colorops(data_t *data, igt_crtc_t *crtc,
+				       const color_t *fb_colors,
+				       const color_t *exp_colors,
+				       kms_colorop_t *colorops[],
+				       uint32_t input_format,
+				       enum igt_color_encoding encoding,
+				       enum igt_color_range range)
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
+			_test_plane_csc_ff_colorops(data, plane, fb_colors,
+						    &ref_crc, colorops,
+						    input_format,
+						    encoding, range);
+	}
+}
+
+/**
+ * SUBTEST: plane-csc-ff-%s
+ * Description: Test CSC_FF colorop for color space conversion: %arg[1].
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
+ * SUBTEST: plane-csc-ff-lut1d-%s
+ * Description: Test CSC_FF + 1D LUT pipeline: %arg[1].
+ *
+ * arg[1]:
+ *
+ * @yuv601-rgb601:		YUV BT.601 to RGB BT.601
+ * @yuv709-rgb709:		YUV BT.709 to RGB BT.709
+ * @yuv2020-rgb2020:		YUV BT.2020 to RGB BT.2020
+ */
+
+/**
+ * SUBTEST: plane-lut1d-csc-ff-lut1d-%s
+ * Description: Test 1D LUT + CSC_FF + 1D LUT pipeline: %arg[1].
+ *
+ * arg[1]:
+ *
+ * @rgb709-rgb2020:		RGB BT.709 to RGB BT.2020
+ */
+
+static void
+run_tests_for_csc_ff(data_t *data)
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
+		.name = "Pre CSC_FF 1D LUT (linear)",
+		.lut1d = &igt_1dlut_linear,
+		.transform = &igt_color_linear,
+	};
+	kms_colorop_t lut1d_post = {
+		.type = KMS_COLOROP_CUSTOM_LUT1D,
+		.name = "Post CSC_FF 1D LUT (max)",
+		.lut1d = &igt_1dlut_max,
+		.transform = &igt_color_max,
+	};
+
+	kms_colorop_t csc_ff_yuv601_rgb601 = {
+		.type = KMS_COLOROP_CSC_FF,
+		.name = "CSC_FF YUV601 to RGB601",
+		.csc_ff_info = { .csc_ff = KMS_COLOROP_CSC_FF_YUV601_RGB601 },
+	};
+	kms_colorop_t csc_ff_yuv709_rgb709 = {
+		.type = KMS_COLOROP_CSC_FF,
+		.name = "CSC_FF YUV709 to RGB709",
+		.csc_ff_info = { .csc_ff = KMS_COLOROP_CSC_FF_YUV709_RGB709 },
+	};
+	kms_colorop_t csc_ff_yuv2020_rgb2020 = {
+		.type = KMS_COLOROP_CSC_FF,
+		.name = "CSC_FF YUV2020 to RGB2020",
+		.csc_ff_info = { .csc_ff = KMS_COLOROP_CSC_FF_YUV2020_RGB2020 },
+	};
+	kms_colorop_t csc_ff_rgb709_rgb2020 = {
+		.type = KMS_COLOROP_CSC_FF,
+		.name = "CSC_FF RGB709 to RGB2020",
+		.csc_ff_info = { .csc_ff = KMS_COLOROP_CSC_FF_RGB709_RGB2020 },
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
+	} csc_ff_tests[] = {
+		{ .name = "yuv601-rgb601",
+		  .subtest_prefix = "plane-csc-ff",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &csc_ff_yuv601_rgb601, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT601,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "yuv709-rgb709",
+		  .subtest_prefix = "plane-csc-ff",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &csc_ff_yuv709_rgb709, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT709,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "yuv2020-rgb2020",
+		  .subtest_prefix = "plane-csc-ff",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &csc_ff_yuv2020_rgb2020, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT2020,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "rgb709-rgb2020",
+		  .subtest_prefix = "plane-csc-ff",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &csc_ff_rgb709_rgb2020, NULL },
+		  .input_format = DRM_FORMAT_XRGB8888,
+		},
+		{ .name = "yuv601-rgb601",
+		  .subtest_prefix = "plane-csc-ff-lut1d",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &csc_ff_yuv601_rgb601, &lut1d_post, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT601,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "yuv709-rgb709",
+		  .subtest_prefix = "plane-csc-ff-lut1d",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &csc_ff_yuv709_rgb709, &lut1d_post, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT709,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "yuv2020-rgb2020",
+		  .subtest_prefix = "plane-csc-ff-lut1d",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &csc_ff_yuv2020_rgb2020, &lut1d_post, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT2020,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "rgb709-rgb2020",
+		  .subtest_prefix = "plane-lut1d-csc-ff-lut1d",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &lut1d_pre, &csc_ff_rgb709_rgb2020, &lut1d_post, NULL },
+		  .input_format = DRM_FORMAT_XRGB8888,
+		},
+	};
+
+	for (int i = 0; i < ARRAY_SIZE(csc_ff_tests); i++) {
+		igt_describe_f("Test CSC_FF pipeline: %s-%s",
+			       csc_ff_tests[i].subtest_prefix,
+			       csc_ff_tests[i].name);
+		igt_subtest_with_dynamic_f("%s-%s",
+					   csc_ff_tests[i].subtest_prefix,
+					   csc_ff_tests[i].name) {
+			for_each_crtc_with_single_output(&data->display, crtc,
+							 output) {
+				data->output = output;
+
+				if (!crtc_output_combo_valid(data, crtc))
+					continue;
+
+				test_setup(data, crtc);
+
+				test_plane_csc_ff_colorops(data, crtc,
+							   csc_ff_tests[i].fb_colors,
+							   csc_ff_tests[i].exp_colors,
+							   csc_ff_tests[i].colorops,
+							   csc_ff_tests[i].input_format,
+							   csc_ff_tests[i].encoding,
+							   csc_ff_tests[i].range);
+				test_cleanup(data);
+			}
+		}
+	}
+}
+
 int igt_main()
 {
 	int has_plane_color_pipeline = 0;
@@ -377,6 +657,9 @@ int igt_main()
 	igt_subtest_group()
 		run_tests_for_plane(&data);
 
+	igt_subtest_group()
+		run_tests_for_csc_ff(&data);
+
 	igt_fixture() {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.25.1

