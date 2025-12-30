Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BDFE9411B
	for <igt-dev@archiver.kernel.org>; Tue, 30 Dec 2025 06:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C349410E82F;
	Tue, 30 Dec 2025 06:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N8CldcKy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5209E10E82D
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Dec 2025 06:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767076671; x=1798612671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EuU1Rqjn4PFfplS7KBEj5NNJ6JmmPdXHecSVXmo8JzE=;
 b=N8CldcKy562EnVZEnFiYaaqnG4A0LVxpjsiqvo1R5606hR1Q7ICMN4UU
 a48oNATKyF8HkE5lmNOsBrQvdwclenFtNEg3iqq4YzB/2eH6b2ma0AmXm
 0Lx1bYlm0kLZDfioDTpIX8UwhbPngZQjpycdZnk5h56onISjofbpG1e4c
 6wkN3FBpSv7O52qNKuqIO9bwxbjqVFp5YWIJYnqsGWFfCi6jM7/Zrmbdl
 Th66VwngUCMY4JCCJz/++HioXTUJiwCRffHK4x+UIZoaMpj/whcZcjBeN
 maa6tFqS/8+IuTHNDv6/DKVKtESYjP9x4yMhbvrY0vyScdm1UiCeMFMCK g==;
X-CSE-ConnectionGUID: KaFNEIb1TbS7qdhzRTT+hA==
X-CSE-MsgGUID: xEFKZ6gvQJeocMkPvy7Azw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="67672913"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="67672913"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 22:37:51 -0800
X-CSE-ConnectionGUID: JndO6zAyRv2W5ayFoT9gCQ==
X-CSE-MsgGUID: jsv01gePQh2937TdMQyOoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="224644619"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 22:37:46 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v8 4/5] tests/kms_color_pipeline: Add Intel plane pipeline tests with
 LUT1D and CTM
Date: Tue, 30 Dec 2025 12:15:51 +0530
Message-Id: <20251230064552.22909-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251230064552.22909-1-swati2.sharma@intel.com>
References: <20251230064552.22909-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

For now, Intel plane color pipeline contains 3 colorops:
Pre-csc gamma (1D LUT) --> CTM 3x4 --> Post-csc gamma (1D LUT)

These tests follow a common flow:
-Configure the primary plane with a deterministic test pattern.
-Enable one or more colorops on the plane color pipeline in a defined
order.
-Program the corresponding color properties with known transformation
values.
-Validate the output by comparing the resulting frame against the
expected transformed output using CRC-based verification.

Separate subtests exercise different valid combinations of the
available colorops to ensure correct programming, ordering, and
interaction of plane color pipeline elements:
  igt@kms_color@plane-lut1d
  igt@kms_color@plane-lut1d-pre-ctm3x4
  igt@kms_color@plane-lut1d-post-ctm3x4
  igt@kms_color@plane-lut1d-ctm3x4
  igt@kms_color@plane-ctm3x4-lut1d
  igt@kms_color@plane-lut1d-lut1d
  igt@kms_color@plane-lut1d-ctm3x4-lut1d

v2: -add new tests pre/post ctm (Chaitanya)
    -remove redundant code (Chaitanya)
    -create plane tests subtest_group (Chaitanya)
    -add/use transfer linear/max func (Chaitanya)
    -improve commit message (Chaitanya)
v3: -create new IGT test (Chaitanya)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_color.c            |  19 +++
 lib/igt_color.h            |   6 +
 tests/kms_color_helper.h   |   1 +
 tests/kms_color_pipeline.c | 310 +++++++++++++++++++++++++++++++++++++
 tests/meson.build          |   2 +
 5 files changed, 338 insertions(+)
 create mode 100644 tests/kms_color_pipeline.c

diff --git a/lib/igt_color.c b/lib/igt_color.c
index a34872763..4d94421ba 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -19,6 +19,9 @@
 const struct igt_color_tf srgb_eotf = {2.4f, (float)(1/1.055), (float)(0.055/1.055), (float)(1/12.92), 0.04045f, 0, 0};
 const struct igt_color_tf bt2020_inv_oetf = {(float)(1/0.45f), (float)(1/1.0993f), (float)(0.0993f/1.0993f), (float)(1/4.5f), (float)(0.081), 0, 0};
 
+const struct igt_color_tf linear_tf = {1.0f, 0.0f, 1.0f, 1.0f, 1.0f, 0.0f, 0.0f};
+const struct igt_color_tf max_tf = {1.0f, 0.0f, 1.0f, 0.0f, 1.0e-6f, 0.0f, 0.0f};
+
 const struct igt_color_tf_pq pq_eotf = {-107/128.0f, 1.0f, 32/2523.0f, 2413/128.0f, -2392/128.0f, 8192/1305.0f };
 
 igt_1dlut_t igt_1dlut_srgb_inv_eotf = { {
@@ -27,6 +30,12 @@ igt_1dlut_t igt_1dlut_srgb_inv_eotf = { {
 igt_1dlut_t igt_1dlut_srgb_eotf = { {
 } };
 
+igt_1dlut_t igt_1dlut_linear = { {
+} };
+
+igt_1dlut_t igt_1dlut_max = { {
+} };
+
 static float clamp(float val, float min, float max)
 {
 	return ((val < min) ? min : ((val > max) ? max : val));
@@ -130,6 +139,16 @@ void igt_color_srgb_inv_eotf(igt_pixel_t *pixel)
 	igt_color_inv_tf(pixel, &srgb_eotf);
 }
 
+void igt_color_linear(igt_pixel_t *pixel)
+{
+	igt_color_tf(pixel, &linear_tf);
+}
+
+void igt_color_max(igt_pixel_t *pixel)
+{
+	igt_color_tf(pixel, &max_tf);
+}
+
 void igt_color_bt2020_inv_oetf(igt_pixel_t *pixel)
 {
 	igt_color_tf(pixel, &bt2020_inv_oetf);
diff --git a/lib/igt_color.h b/lib/igt_color.h
index 45cf8f3c7..919330c8b 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -45,6 +45,9 @@ typedef struct igt_1dlut {
 extern igt_1dlut_t igt_1dlut_srgb_inv_eotf;
 extern igt_1dlut_t igt_1dlut_srgb_eotf;
 
+extern igt_1dlut_t igt_1dlut_linear;
+extern igt_1dlut_t igt_1dlut_max;
+
 typedef struct igt_matrix_3x4 {
 	/*
 	 * out   matrix          in
@@ -93,6 +96,9 @@ void igt_colorop_set_3dlut(igt_display_t *display,
 void igt_color_srgb_inv_eotf(igt_pixel_t *pixel);
 void igt_color_srgb_eotf(igt_pixel_t *pixel);
 
+void igt_color_max(igt_pixel_t *pixel);
+void igt_color_linear(igt_pixel_t *pixel);
+
 void igt_color_pq_inv_eotf(igt_pixel_t *pixel);
 void igt_color_pq_eotf(igt_pixel_t *pixel);
 
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index fb9c3b3aa..0be312342 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -38,6 +38,7 @@
 #include "igt.h"
 #include "igt_edid.h"
 
+#include "kms_colorop_helper.h"
 
 /* Internal */
 typedef struct {
diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
new file mode 100644
index 000000000..a085ff823
--- /dev/null
+++ b/tests/kms_color_pipeline.c
@@ -0,0 +1,310 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/**
+ * TEST: kms color pipeline
+ * Category: Display
+ * Description: Test to validate DRM colorops at plane level
+ * Driver requirement: i915, xe
+ * Mega feature: Color Management
+ */
+
+#include "kms_color_helper.h"
+
+#define MAX_COLOROPS	5
+
+/**
+ * SUBTEST: plane-%s
+ * Description: Test plane color pipeline with colorops: %arg[1].
+ *
+ * arg[1]:
+ *
+ * @lut1d:			1D LUT
+ * @lut1d-pre-ctm3x4:		1D LUT PRE CTM 3x4
+ * @lut1d-post-ctm3x4:		1D LUT POST CTM 3x4
+ * @ctm3x4:			3X4 CTM
+ * @lut1d-ctm3x4:		1D LUT --> 3X4 CTM
+ * @ctm3x4-lut1d:		3X4 CTM --> 1D LUT
+ * @lut1d-lut1d:		1D LUT --> 1D LUT
+ * @lut1d-ctm3x4-lut1d:		1D LUT --> 3X4 CTM --> 1D LUT
+ */
+
+IGT_TEST_DESCRIPTION("Test DRM colorops at plane level");
+
+static void test_cleanup(data_t *data)
+{
+	if (data->pipe_crc) {
+		igt_pipe_crc_free(data->pipe_crc);
+		data->pipe_crc = NULL;
+	}
+
+	igt_output_set_crtc(data->output, NULL);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
+static void test_setup(data_t *data, enum pipe p)
+{
+	igt_crtc_t *pipe;
+
+	igt_require_pipe_crc(data->drm_fd);
+
+	pipe = igt_crtc_for_pipe(&data->display, p);
+	igt_require(pipe);
+	igt_require(pipe->n_planes > 0);
+
+	igt_output_set_crtc(data->output, pipe);
+
+	data->primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+	data->mode = igt_output_get_mode(data->output);
+	igt_require(data->mode);
+
+	data->pipe_crc = igt_pipe_crc_new(data->drm_fd,
+					  data->primary->pipe->pipe,
+					  IGT_PIPE_CRC_SOURCE_AUTO);
+
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
+static bool ctm_colorop_only(kms_colorop_t *colorops[])
+{
+	int i;
+
+	if (!colorops[0])
+		return false;
+
+	for (i = 0; colorops[i]; i++) {
+		if (colorops[i]->type != KMS_COLOROP_CTM_3X4)
+			return false;
+	}
+
+	return true;
+}
+
+static bool test_plane_colorops(data_t *data,
+				const color_t *fb_colors,
+				const color_t *exp_colors,
+				kms_colorop_t *colorops[])
+{
+	igt_plane_t *plane = data->primary;
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode = data->mode;
+	igt_colorop_t *color_pipeline;
+	igt_crc_t crc_ref, crc_pipe;
+	struct igt_fb fb;
+	bool ret;
+
+	color_pipeline = get_color_pipeline(display, plane, colorops);
+	igt_skip_on(!color_pipeline);
+
+	/* Create a framebuffer at the size of the output. */
+	igt_assert(igt_create_fb(data->drm_fd,
+				 mode->hdisplay,
+				 mode->vdisplay,
+				 DRM_FORMAT_XRGB8888,
+				 DRM_FORMAT_MOD_LINEAR,
+				 &fb));
+	igt_plane_set_fb(plane, &fb);
+
+	/* Disable Pipe color props. */
+	disable_ctm(plane->pipe);
+	disable_degamma(plane->pipe);
+	disable_gamma(plane->pipe);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	/* Reference (software-equivalent) CRC */
+	set_color_pipeline_bypass(plane);
+	paint_rectangles(data, mode, exp_colors, &fb);
+
+	igt_plane_set_fb(plane, &fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_wait_for_vblank(plane->pipe);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
+
+	/* Hardware pipeline CRC */
+	set_color_pipeline(display, plane, colorops, color_pipeline);
+	/*
+	 * Use flat colors only when the pipeline
+	 * contains CTM colorops exclusively.
+	 */
+	if (ctm_colorop_only(colorops))
+		paint_rectangles(data, mode, fb_colors, &fb);
+	else
+		paint_gradient_rectangles(data, mode, fb_colors, &fb);
+
+	igt_plane_set_fb(plane, &fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_wait_for_vblank(plane->pipe);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_pipe);
+
+	ret = igt_check_crc_equal(&crc_ref, &crc_pipe);
+
+	/* Cleanup per-test state */
+	reset_colorops(colorops);
+	igt_plane_set_fb(plane, NULL);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	igt_remove_fb(data->drm_fd, &fb);
+
+	return ret;
+}
+
+static void
+run_tests_for_plane(data_t *data)
+{
+	enum pipe pipe;
+	igt_output_t *output = NULL;
+	static const color_t colors_rgb[] = {
+	        { 1.0, 0.0, 0.0 },
+	        { 0.0, 1.0, 0.0 },
+	        { 0.0, 0.0, 1.0 },
+	};
+	static const color_t colors_red_to_blue[] = {
+		{ 0.0, 0.0, 1.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 },
+	};
+	const igt_matrix_3x4_t ctm_red_to_blue = { {
+		0.0, 0.0, 0.0, 0.0,
+		0.0, 1.0, 0.0, 0.0,
+		1.0, 0.0, 1.0, 0.0,
+	} };
+	const igt_matrix_3x4_t ctm_linear = { {
+		1.0, 0.0, 0.0, 0.0,
+		0.0, 1.0, 0.0, 0.0,
+		0.0, 0.0, 1.0, 0.0,
+	} };
+	kms_colorop_t lut1d_linear = {
+		.type = KMS_COLOROP_CUSTOM_LUT1D,
+		.name = "Pre/Post CSC GAMMA (linear LUT)",
+		.lut1d = &igt_1dlut_linear,
+		.transform = &igt_color_linear,
+	};
+	kms_colorop_t lut1d_max = {
+		.type = KMS_COLOROP_CUSTOM_LUT1D,
+		.lut1d = &igt_1dlut_max,
+		.name = "Pre/Post CSC GAMMA (max LUT)",
+		.transform = &igt_color_max,
+	};
+	kms_colorop_t ctm_3x4 = {
+		.type = KMS_COLOROP_CTM_3X4,
+		.name = "CTM 3X4 (red to blue)",
+		.matrix_3x4 = &ctm_red_to_blue,
+	};
+	kms_colorop_t ctm_3x4_linear = {
+		.type = KMS_COLOROP_CTM_3X4,
+		.name = "CTM 3X4 (linear)",
+		.matrix_3x4 = &ctm_linear,
+	};
+
+	struct {
+		const char *name;
+		const color_t *fb_colors;
+		const color_t *exp_colors;
+		kms_colorop_t *colorops[MAX_COLOROPS];
+	} plane_colorops_tests[] = {
+		{ .name = "lut1d",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &lut1d_max, NULL },
+		},
+		{ .name = "lut1d-pre-ctm3x4",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &lut1d_max, &ctm_3x4_linear, NULL },
+		},
+		{ .name = "lut1d-post-ctm3x4",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &ctm_3x4_linear, &lut1d_max, NULL },
+		},
+		{ .name = "ctm3x4",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_red_to_blue,
+		  .colorops = { &ctm_3x4, NULL },
+		},
+		{ .name = "lut1d-ctm3x4",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_red_to_blue,
+		  .colorops = { &lut1d_max, &ctm_3x4, NULL },
+		},
+		{ .name = "ctm3x4-lut1d",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_red_to_blue,
+		  .colorops = { &ctm_3x4, &lut1d_max, NULL },
+		},
+		{ .name = "lut1d-lut1d",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &lut1d_linear, &lut1d_max, NULL },
+		},
+		{ .name = "lut1d-ctm3x4-lut1d",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_red_to_blue,
+		  .colorops = { &lut1d_linear, &ctm_3x4, &lut1d_max, NULL },
+		},
+	};
+
+	for (int i = 0; i < ARRAY_SIZE(plane_colorops_tests); i++) {
+		igt_describe_f("Test plane color pipeline with colorops: %s", plane_colorops_tests[i].name);
+		igt_subtest_with_dynamic_f("plane-%s", plane_colorops_tests[i].name) {
+			for_each_pipe_with_single_output(&data->display, pipe, output) {
+				data->output = output;
+
+				if (!pipe_output_combo_valid(data, pipe))
+					continue;
+
+				test_setup(data, pipe);
+
+				if (!igt_plane_has_prop(data->primary, IGT_PLANE_COLOR_PIPELINE)) {
+					test_cleanup(data);
+					continue;
+				}
+
+				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+					       igt_output_name(data->output)) {
+					data->color_depth = 8;
+					data->drm_format = DRM_FORMAT_XRGB8888;
+
+					igt_assert(test_plane_colorops(data,
+								       plane_colorops_tests[i].fb_colors,
+								       plane_colorops_tests[i].exp_colors,
+								       plane_colorops_tests[i].colorops));
+				}
+
+				test_cleanup(data);
+			}
+		}
+	}
+}
+
+int igt_main()
+{
+	int has_plane_color_pipeline = 0;
+	data_t data = {};
+
+	igt_fixture() {
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+
+		if (drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
+			data.display.is_atomic = 1;
+
+		if (drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
+			has_plane_color_pipeline = 1;
+
+		kmstest_set_vt_graphics_mode();
+
+		igt_display_require(&data.display, data.drm_fd);
+		data.display.has_plane_color_pipeline = has_plane_color_pipeline;
+		igt_require(data.display.is_atomic);
+	}
+
+	igt_subtest_group()
+		run_tests_for_plane(&data);
+
+	igt_fixture() {
+		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index ae48dfe04..912d8cd38 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -25,6 +25,7 @@ test_progs = [
 	'kms_atomic_transition',
 	'kms_bw',
 	'kms_color',
+	'kms_color_pipeline',
 	'kms_concurrent',
 	'kms_colorop',
 	'kms_content_protection',
@@ -379,6 +380,7 @@ extra_sources = {
 	'dumb_buffer': ['dumb_buffer.c' ],
 	'testdisplay': [ 'testdisplay_hotplug.c' ],
 	'kms_color':  [ 'kms_color_helper.c' ],
+	'kms_color_pipeline':  [ 'kms_color_helper.c', 'kms_colorop_helper.c' ],
 	'kms_colorop':  [ 'kms_colorop_helper.c' ],
 	'kms_chamelium_audio': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_color':  [ 'kms_color_helper.c', join_paths ('chamelium', 'kms_chamelium_helper.c') ],
-- 
2.25.1

