Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959CCC56208
	for <igt-dev@archiver.kernel.org>; Thu,  6 Aug 2026 11:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE1A10F1C6;
	Thu,  6 Aug 2026 11:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZhk4ojG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A05110F1B0
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2026 11:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786017303; x=1817553303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kofr3CrrXY2AUq6+c2oFlltbiiDpr7yTnG0J8dpB5C8=;
 b=XZhk4ojGM64qU0J+e1B2MuT0pYIhTl08rjLbQEucenqQwk/Av2uEZdRZ
 gIiEcd0+Hx9Rn8dLpbxH+dbe2x2HDBTf5DMkGB0WXmkatJ3Zx9FuAea8N
 hVVT+qdYCmC45U0muW1H2uceEMCA+sIwnbIqqxKJ/tO9Srv5NyQHsRwOy
 nuTUcNNTXjyLR3TKoTxf03H7gywg6CObIdhvfovozIkpJyQEvCnZQ8XA1
 AmfKC8oEQ7j00B4DqmFSJhRrFb/9YagRCNNf3sBP0pR2FF7joYJSR1D9A
 B/4ei/zKU+C1KitL9OJdnpH0iD63kS97LBfev7jbqTqJeKYUVDcu0fgq6 w==;
X-CSE-ConnectionGUID: E9cC3cr3Q42Cj0UQ7P0juA==
X-CSE-MsgGUID: +jqiMsdOTPe1EhNB+Y5FaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="97204787"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="97204787"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 04:55:03 -0700
X-CSE-ConnectionGUID: iWQ1PjH6T/e30cwaVhVPMA==
X-CSE-MsgGUID: TcNL76y8QACH8V6VMgWKlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="261552859"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 04:55:01 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 6/6] tests/kms_chamelium_color_pipeline: Add
 FIXED_MATRIX colorop tests
Date: Thu,  6 Aug 2026 17:33:45 +0530
Message-Id: <20260806120345.19406-7-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260806120345.19406-1-swati2.sharma@intel.com>
References: <20260806120345.19406-1-swati2.sharma@intel.com>
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

v2: -Naming changes (CSC_FF -> FIXED_MATRIX)
v3: -Drop YCbCr limited to full and RGB709 to RGB2020 matrices
     until we have non-IGT userspace that shows their use
    -Rename subtests to yuv-rgb-btXXX with limited range variants

Assisted-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 .../chamelium/kms_chamelium_color_pipeline.c  | 307 ++++++++++++++++++
 1 file changed, 307 insertions(+)

diff --git a/tests/chamelium/kms_chamelium_color_pipeline.c b/tests/chamelium/kms_chamelium_color_pipeline.c
index db6107221..63c5a3a3c 100644
--- a/tests/chamelium/kms_chamelium_color_pipeline.c
+++ b/tests/chamelium/kms_chamelium_color_pipeline.c
@@ -34,6 +34,26 @@
  * @lut3d-green-only:		3D LUT
  */
 
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
+ * @yuv-rgb-bt2020-lim:		YUV BT.2020 limited range to RGB BT.2020
+ * @yuv-rgb-bt601-lut1d:	YUV BT.601 full range to RGB BT.601, then 1D LUT
+ * @yuv-rgb-bt709-lut1d:	YUV BT.709 full range to RGB BT.709, then 1D LUT
+ * @yuv-rgb-bt2020-lut1d:	YUV BT.2020 full range to RGB BT.2020, then 1D LUT
+ * @yuv-rgb-bt601-lim-lut1d:	YUV BT.601 limited range to RGB BT.601, then 1D LUT
+ * @yuv-rgb-bt709-lim-lut1d:	YUV BT.709 limited range to RGB BT.709, then 1D LUT
+ * @yuv-rgb-bt2020-lim-lut1d:	YUV BT.2020 limited range to RGB BT.2020, then 1D LUT
+ */
+
 IGT_TEST_DESCRIPTION("Test to validate DRM plane color pipeline using Chamelium frame capture instead of pipe CRC");
 
 static void test_cleanup(data_t *data)
@@ -345,6 +365,290 @@ run_tests_for_plane(data_t *data)
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
+	bool ret;
+
+	color_pipeline = get_color_pipeline(display, plane, colorops);
+	igt_skip_on(!color_pipeline);
+
+	/* Create HW input framebuffer (YUV or RGB) */
+	igt_assert(igt_create_fb_with_bo_size(data->drm_fd,
+					      mode->hdisplay,
+					      mode->vdisplay,
+					      input_format,
+					      DRM_FORMAT_MOD_LINEAR,
+					      encoding, range,
+					      &fb, 0, 0));
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
+	kms_colorop_t fixed_matrix_yuv601_rgb601_lim = {
+		.type = KMS_COLOROP_FIXED_MATRIX,
+		.name = "FIXED_MATRIX YUV601 limited to RGB601",
+		.fixed_matrix_info = { .fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR601_LIMITED_RGB },
+	};
+	kms_colorop_t fixed_matrix_yuv709_rgb709_lim = {
+		.type = KMS_COLOROP_FIXED_MATRIX,
+		.name = "FIXED_MATRIX YUV709 limited to RGB709",
+		.fixed_matrix_info = { .fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR709_LIMITED_RGB },
+	};
+	kms_colorop_t fixed_matrix_yuv2020_rgb2020_lim = {
+		.type = KMS_COLOROP_FIXED_MATRIX,
+		.name = "FIXED_MATRIX YUV2020 limited to RGB2020",
+		.fixed_matrix_info = { .fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_LIMITED_RGB },
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
+		{ .name = "yuv-rgb-bt601",
+		  .subtest_prefix = "plane-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv601_rgb601, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT601,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "yuv-rgb-bt709",
+		  .subtest_prefix = "plane-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv709_rgb709, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT709,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "yuv-rgb-bt2020",
+		  .subtest_prefix = "plane-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv2020_rgb2020, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT2020,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "yuv-rgb-bt601-lim",
+		  .subtest_prefix = "plane-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv601_rgb601_lim, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT601,
+		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
+		},
+		{ .name = "yuv-rgb-bt709-lim",
+		  .subtest_prefix = "plane-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv709_rgb709_lim, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT709,
+		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
+		},
+		{ .name = "yuv-rgb-bt2020-lim",
+		  .subtest_prefix = "plane-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv2020_rgb2020_lim, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT2020,
+		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
+		},
+		{ .name = "yuv-rgb-bt601-lut1d",
+		  .subtest_prefix = "plane-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv601_rgb601, &lut1d_linear, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT601,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "yuv-rgb-bt709-lut1d",
+		  .subtest_prefix = "plane-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv709_rgb709, &lut1d_linear, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT709,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "yuv-rgb-bt2020-lut1d",
+		  .subtest_prefix = "plane-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv2020_rgb2020, &lut1d_linear, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT2020,
+		  .range = IGT_COLOR_YCBCR_FULL_RANGE,
+		},
+		{ .name = "yuv-rgb-bt601-lim-lut1d",
+		  .subtest_prefix = "plane-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv601_rgb601_lim, &lut1d_linear, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT601,
+		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
+		},
+		{ .name = "yuv-rgb-bt709-lim-lut1d",
+		  .subtest_prefix = "plane-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv709_rgb709_lim, &lut1d_linear, NULL },
+		  .input_format = DRM_FORMAT_YUYV,
+		  .encoding = IGT_COLOR_YCBCR_BT709,
+		  .range = IGT_COLOR_YCBCR_LIMITED_RANGE,
+		},
+		{ .name = "yuv-rgb-bt2020-lim-lut1d",
+		  .subtest_prefix = "plane-fixed-matrix",
+		  .fb_colors = colors_rgb,
+		  .colorops = { &fixed_matrix_yuv2020_rgb2020_lim, &lut1d_linear, NULL },
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
@@ -404,6 +708,9 @@ int igt_main()
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

