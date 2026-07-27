Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E439DC53209
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jul 2026 18:50:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9102510E093;
	Mon, 27 Jul 2026 18:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="doebhR7U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91EDD10E6CA
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jul 2026 18:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785178000; x=1816714000;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zPYWuBSRV1KAkGG2b82fHqJqKoxXw6PllB9iA/2xbJE=;
 b=doebhR7Uz5eMII/A1MUUbZnV6QvEQk04YpvLPFL34gYXcMgYjo5QE3lt
 TjsUmnGM1b32kBt8Ybg1w/kof1OGhBolqkcYSv0AvZUulUNkMIol8gb0s
 7qt8hzALCFn09ZF/zsxssp38/Qf65CZCi55vOfcsPIqJmo0+DFBZMmzPa
 k6nTVTqIqv58crDXHwUF0tCI//rNNLys3DF0l1W4j+MVqCbmb0XlKrtwC
 K6bgi5XisejYAvFqbCeqYY9DuIv3PLMzDINs/yn5G72cH6u99xNioR0p6
 9vj98doaKDLDK7ih/nxDNxycdLLCkrHpE6DTNUg2yTb1yhIGrS7fnEsJV A==;
X-CSE-ConnectionGUID: nzjwIZE/TNmIhnLesBVU+w==
X-CSE-MsgGUID: amVmfwjlRPG4VLZUxjkAFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="103296109"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="103296109"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 11:46:40 -0700
X-CSE-ConnectionGUID: ccd8hZG/QymN6yasfoNgTg==
X-CSE-MsgGUID: iJLiAHa1TweMj8uhdVVTgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="259545276"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 11:46:38 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 6/6] tests/kms_chamelium_color_pipeline: Add
 FIXED_MATRIX colorop tests
Date: Tue, 28 Jul 2026 00:25:31 +0530
Message-Id: <20260727185531.4046807-7-swati2.sharma@intel.com>
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

Add Chamelium frame-capture equivalents of the FIXED_MATRIX colorop
tests from kms_color_pipeline. Unlike the pipe-CRC variant, these
validate the output using chamelium_frame_match_or_dump() with analog
frame comparison, whose tolerance accommodates the small differences
between the software color model and the hardware fixed-point matrix
that a bit-exact pipe CRC cannot.

The SW reference framebuffer is computed by converting the YUV input
through igt_fb_convert(), which internally applies igt_ycbcr_to_rgb_matrix(),
matching the reference computation used in the pipe-CRC variant.

Redundant *-yuv-full range correction subtests are omitted because the
YCBCR_LIMITED_FULL colorop is a no-op on full-range input, making them
equivalent to the plain plane-fixed-matrix-* tests.

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

Assisted-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 .../chamelium/kms_chamelium_color_pipeline.c  | 339 ++++++++++++++++++
 1 file changed, 339 insertions(+)

diff --git a/tests/chamelium/kms_chamelium_color_pipeline.c b/tests/chamelium/kms_chamelium_color_pipeline.c
index db6107221..254a4817d 100644
--- a/tests/chamelium/kms_chamelium_color_pipeline.c
+++ b/tests/chamelium/kms_chamelium_color_pipeline.c
@@ -34,6 +34,58 @@
  * @lut3d-green-only:		3D LUT
  */
 
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
 IGT_TEST_DESCRIPTION("Test to validate DRM plane color pipeline using Chamelium frame capture instead of pipe CRC");
 
 static void test_cleanup(data_t *data)
@@ -345,6 +397,290 @@ run_tests_for_plane(data_t *data)
 	}
 }
 
+static void
+_test_plane_fixed_matrix_colorops(data_t *data,
+				  igt_plane_t *plane,
+				  const color_t *fb_colors,
+				  kms_colorop_t *colorops[],
+				  uint32_t input_format,
+				  enum igt_color_encoding encoding,
+				  enum igt_color_range range,
+				  struct chamelium_port *port)
+{
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode = data->mode;
+	igt_colorop_t *color_pipeline;
+	struct igt_fb fb, fbref;
+	struct chamelium_frame_dump *frame;
+	bool is_yuv = igt_format_is_yuv(input_format);
+	bool ret;
+
+	color_pipeline = get_color_pipeline(display, plane, colorops);
+	igt_skip_on(!color_pipeline);
+
+	/* Create HW input framebuffer (YUV or RGB) */
+	if (is_yuv)
+		igt_assert(igt_create_fb_with_bo_size(data->drm_fd,
+						      mode->hdisplay,
+						      mode->vdisplay,
+						      input_format,
+						      DRM_FORMAT_MOD_LINEAR,
+						      encoding, range,
+						      &fb, 0, 0));
+	else
+		igt_assert(igt_create_fb(data->drm_fd,
+					 mode->hdisplay,
+					 mode->vdisplay,
+					 input_format,
+					 DRM_FORMAT_MOD_LINEAR,
+					 &fb));
+
+	/* Paint the input fb with test colors */
+	paint_rectangles(data, mode, fb_colors, &fb);
+
+	/*
+	 * Software reference: convert the input fb through igt_fb_convert()
+	 * which internally applies igt_ycbcr_to_rgb_matrix(). This matches
+	 * what the HW FIXED_MATRIX colorop should produce.
+	 * Chamelium analog comparison tolerates HW vs SW rounding differences.
+	 */
+	igt_fb_convert(&fbref, &fb, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR);
+
+	/* Hardware path */
+	set_color_pipeline(display, plane, colorops, color_pipeline);
+
+	igt_plane_set_fb(plane, &fb);
+	igt_display_commit_atomic(&data->display, 0, NULL);
+
+	chamelium_port_wait_video_input_stable(data->chamelium, port, 5);
+	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
+
+	frame = chamelium_read_captured_frame(data->chamelium, 0);
+
+	ret = chamelium_frame_match_or_dump(data->chamelium, port, frame,
+					    &fbref, CHAMELIUM_CHECK_ANALOG);
+	igt_assert(ret);
+
+	chamelium_destroy_frame_dump(frame);
+
+	/* Cleanup */
+	set_color_pipeline_bypass(plane);
+	reset_colorops(colorops);
+	igt_plane_set_fb(plane, NULL);
+	igt_display_commit_atomic(&data->display, 0, NULL);
+
+	igt_remove_fb(data->drm_fd, &fb);
+	igt_remove_fb(data->drm_fd, &fbref);
+}
+
+static void
+test_plane_fixed_matrix_colorops(data_t *data, igt_crtc_t *crtc,
+				 const color_t *fb_colors,
+				 kms_colorop_t *colorops[],
+				 uint32_t input_format,
+				 enum igt_color_encoding encoding,
+				 enum igt_color_range range,
+				 int port_idx)
+{
+	int n_planes = crtc->n_planes;
+	igt_output_t *output = data->output;
+	igt_plane_t *plane;
+
+	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
+		plane = igt_output_get_plane(output, plane_id);
+
+		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
+			continue;
+
+		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(crtc->pipe), plane_id)
+			_test_plane_fixed_matrix_colorops(data, plane,
+							  fb_colors,
+							  colorops, input_format,
+							  encoding, range,
+							  data->ports[port_idx]);
+	}
+}
+
+static void
+run_tests_for_fixed_matrix(data_t *data)
+{
+	igt_crtc_t *crtc;
+	igt_output_t *output = NULL;
+	int port_idx = 0;
+	static const color_t colors_rgb[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 },
+	};
+	kms_colorop_t lut1d_linear = {
+		.type = KMS_COLOROP_CUSTOM_LUT1D,
+		.name = "1D LUT (linear)",
+		.lut1d = &igt_1dlut_linear,
+		.transform = &igt_color_linear,
+	};
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
+				port_idx = test_setup(data, crtc);
+				if (port_idx < 0) {
+					test_cleanup(data);
+					continue;
+				}
+
+				test_plane_fixed_matrix_colorops(data, crtc,
+								 fixed_matrix_tests[i].fb_colors,
+								 fixed_matrix_tests[i].colorops,
+								 fixed_matrix_tests[i].input_format,
+								 fixed_matrix_tests[i].encoding,
+								 fixed_matrix_tests[i].range,
+								 port_idx);
+
+				test_cleanup(data);
+			}
+		}
+	}
+}
+
 int igt_main()
 {
 	int i;
@@ -404,6 +740,9 @@ int igt_main()
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

