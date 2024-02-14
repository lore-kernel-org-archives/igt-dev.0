Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072EAC4829A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 06:46:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E51210E491;
	Wed, 14 Feb 2024 06:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwcMGh5V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FFC10E491
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 06:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707893173; x=1739429173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F5fi8m5tGrcHKDXobyP24CfNCfXAEyopx30LPomPlu0=;
 b=kwcMGh5VMClUT8rvIiEyZ0nPmtIsjsT7gjybwuPpiDCJOCNJ41xeCRRh
 XciAmptyOYLCMH+OUB8AW2n/35VlnyW83X2Swp2J7ZX5QIOMWuDIY2Nq0
 uUYtum8fD1kB3Z3T4Vou9NgwV9So8+OA60Bzwnz+WdeYhkSN7oBUvZpmq
 ChHasYd/THVVxGO6Asri5QDuY42bYPlnp3/ClE9oO0jW68JwCp6u5H0Ec
 R6wlvLdyitJetyDinyulll3ImlhVgSbVnT/SISWZJ7Nv+foqqShz4blpy
 koo1/xkm/ePESvH5nOZrtnoM8IEJSUk9950DjD2aKBEe54JL0pMMovps/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12645523"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12645523"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:46:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3427694"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:46:13 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [RFC v4 22/22] tests/kms_color: Add plane color pipeline tests for
 Intel hardware
Date: Wed, 14 Feb 2024 12:09:53 +0530
Message-ID: <20240214063953.1285495-23-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
References: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
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

For now, Intel plane color pipeline contains 3 colorops:
Pre-csc gamma (1D LUT) --> CTM 3x3 --> Post-csc gamma (1D LUT)

Create subtests to cover different combinations of available
colorops:
  igt@kms_color@plane-lut1d
  igt@kms_color@plane-ctm3x3
  igt@kms_color@plane-lut1d-ctm3x3
  igt@kms_color@plane-ctm3x3-lut1d
  igt@kms_color@plane-lut1d-lut1d
  igt@kms_color@plane-lut1d-ctm3x3-lut1d

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c | 273 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 267 insertions(+), 6 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index bdb80a4ad..5a8bc6eb9 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -34,6 +34,8 @@
 
 #include "kms_color_helper.h"
 
+#define MAX_COLOROPS	5
+
 /**
  * SUBTEST: degamma
  * Description: Verify that degamma LUT transformation works correctly
@@ -78,6 +80,20 @@
  * @gamma-lut:          Gamma LUT
  */
 
+/**
+ * SUBTEST: plane-%s
+ * Description: Test plane color pipeline with colorops: %arg[1].
+ *
+ * arg[1]:
+ *
+ * @lut1d:		1D LUT
+ * @ctm3x3:		3X3 CTM
+ * @lut1d-ctm3x3:	1D LUT --> 3X3 CTM
+ * @ctm3x3-lut1d:	3X3 CTM --> 1D LUT
+ * @lut1d-lut1d:	1D LUT --> 1D LUT
+ * @lut1d-ctm3x3-lut1d: 1D LUT --> 3X3 CTM --> 1D LUT
+ */
+
 IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
 
 static bool test_pipe_degamma(data_t *data,
@@ -725,6 +741,137 @@ static void test_pipe_limited_range_ctm(data_t *data,
 }
 #endif
 
+static void clear_lut_data(kms_colorop_t *colorops[])
+{
+	int i;
+
+	for (i = 0; colorops[i]; i++) {
+		if (colorops[i]->type != KMS_COLOROP_CUSTOM_LUT1D)
+			continue;
+
+		if (colorops[i]->custom_lut1d_info.lut)
+			free(colorops[i]->custom_lut1d_info.lut);
+	}
+}
+
+static void prepare_lut_data(data_t *data, kms_colorop_t *colorops[])
+{
+	int i;
+
+	for (i = 0; colorops[i]; i++) {
+		uint64_t hwlut_caps = 0;
+		segment_data_t *segment_info;
+
+		if (colorops[i]->type != KMS_COLOROP_CUSTOM_LUT1D)
+			continue;
+
+		hwlut_caps = igt_colorop_get_prop(&data->display, colorops[i]->colorop, IGT_COLOROP_HW_CAPS);
+		segment_info = get_segment_data(data->drm_fd, hwlut_caps);
+
+		igt_info("Lut size (%s): %d\n", colorops[i]->name, segment_info->entries_count);
+
+		colorops[i]->custom_lut1d_info.lut_size = segment_info->entries_count;
+		colorops[i]->custom_lut1d_info.lut =
+			malloc(sizeof(struct drm_color_lut_ext) * colorops[i]->custom_lut1d_info.lut_size);
+		igt_assert(colorops[i]->custom_lut1d_info.lut);
+
+		switch (colorops[i]->custom_lut1d_info.lut_type) {
+			case KMS_COLOROP_CUSTOM_LUT1D_ZERO:
+				create_zero_lut(segment_info, colorops[i]->custom_lut1d_info.lut);
+				break;
+			case KMS_COLOROP_CUSTOM_LUT1D_LINEAR:
+				create_unity_lut(segment_info, colorops[i]->custom_lut1d_info.lut);
+				break;
+			case KMS_COLOROP_CUSTOM_LUT1D_MAX:
+			default:
+				create_max_lut(segment_info, colorops[i]->custom_lut1d_info.lut);
+		}
+
+		clear_segment_data(segment_info);
+	}
+}
+
+static bool ctm_colorop_only(kms_colorop_t *colorops[])
+{
+	int i;
+
+	for (i = 0; colorops[i]; i++)
+		if (colorops[i]->type != KMS_COLOROP_CTM_3X3)
+			return false;
+	return true;
+}
+
+static bool test_plane_colorops(data_t *data,
+				const color_t *fb_colors,
+				const color_t *exp_colors,
+				kms_colorop_t *colorops[])
+{
+	igt_plane_t *plane = data->primary;
+	igt_output_t *output = data->output;
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode = data->mode;
+	struct igt_fb fb;
+	bool ret;
+	igt_colorop_t *color_pipeline = get_color_pipeline(display, plane, colorops);
+	igt_crc_t crc_gamma, crc_fullcolors;
+
+	igt_output_set_pipe(output, plane->pipe->pipe);
+	mode = igt_output_get_mode(output);
+
+	/* Create a framebuffer at the size of the output. */
+	igt_assert(igt_create_fb(data->drm_fd,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR,
+			      &fb));
+	igt_plane_set_fb(plane, &fb);
+
+	/* Disable Pipe color props. */
+	disable_ctm(plane->pipe);
+	disable_degamma(plane->pipe);
+	disable_gamma(plane->pipe);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	set_color_pipeline_bypass(plane);
+	paint_rectangles(data, mode, exp_colors, &fb);
+	igt_plane_set_fb(plane, &fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_wait_for_vblank(data->drm_fd,
+		display->pipes[plane->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
+
+	/*
+	 * Draw gradient colors with LUT to remap all
+	 * values to max red/green/blue.
+	 */
+	prepare_lut_data(data, colorops);
+	set_color_pipeline(display, plane, colorops, color_pipeline);
+	if (ctm_colorop_only(colorops))
+		paint_rectangles(data, mode, fb_colors, &fb);
+	else
+		paint_gradient_rectangles(data, mode, fb_colors, &fb);
+	igt_plane_set_fb(plane, &fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_wait_for_vblank(data->drm_fd,
+			display->pipes[plane->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_gamma);
+
+	/*
+	 * Verify that the CRC of the software computed output is
+	 * equal to the CRC of the gamma LUT transformation output.
+	 */
+	ret = igt_check_crc_equal(&crc_gamma, &crc_fullcolors);
+
+	clear_lut_data(colorops);
+	clear_color_pipeline(display, plane, colorops, color_pipeline);
+	igt_plane_set_fb(plane, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	return ret;
+}
+
 static void
 prep_pipe(data_t *data, enum pipe p)
 {
@@ -861,6 +1008,42 @@ out:
 	test_cleanup(data);
 }
 
+static void run_plane_color_tests(data_t *data,
+				  const color_t *fb_colors,
+				  const color_t *exp_colors,
+				  kms_colorop_t *colorops[])
+{
+	enum pipe pipe;
+
+	data->color_depth = 8;
+	data->drm_format = DRM_FORMAT_XRGB8888;
+
+	for_each_pipe(&data->display, pipe) {
+		test_setup(data, pipe);
+
+		data->mode = igt_output_get_mode(data->output);
+
+		if (!pipe_output_combo_valid(data, pipe)){
+			test_cleanup(data);
+			continue;
+		}
+
+		/*
+		 * TODO: Extend the test to multiple planes?
+		 * Since, Intel planes (HDR & SDR) have different capabilities.
+		 */
+		if (!igt_plane_has_prop(data->primary, IGT_PLANE_COLOR_PIPELINE))
+			continue;
+
+		igt_dynamic_f("pipe-%s-%s",
+			      kmstest_pipe_name(pipe),
+			      igt_output_name(data->output))
+			igt_assert(test_plane_colorops(data, fb_colors, exp_colors, colorops));
+	}
+
+	test_cleanup(data);
+}
+
 static void
 run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 {
@@ -1151,13 +1334,91 @@ run_tests_for_pipe(data_t *data)
 		}
 	}
 
-	igt_fixture
-		igt_require(data->display.is_atomic);
+	igt_subtest_group {
+		static const color_t colors_red_to_blue[] = {
+			{ 0.0, 0.0, 1.0 },
+			{ 0.0, 1.0, 0.0 },
+			{ 0.0, 0.0, 1.0 },
+		};
+		const struct drm_color_ctm ctm_red_to_blue = { {
+			0.0, 0.0, 0.0,
+			0.0, 1.0, 0.0,
+			1.0, 0.0, 1.0
+		} };
+		kms_colorop_t lut1d_linear = {
+			.type = KMS_COLOROP_CUSTOM_LUT1D,
+			.name = "Pre/Post CSC GAMMA (linear LUT)",
+			.custom_lut1d_info = {
+				.lut_type = KMS_COLOROP_CUSTOM_LUT1D_LINEAR,
+			},
+		};
+		kms_colorop_t lut1d_max = {
+			.type = KMS_COLOROP_CUSTOM_LUT1D,
+			.name = "Pre/Post CSC GAMMA (max LUT)",
+			.custom_lut1d_info = {
+				.lut_type = KMS_COLOROP_CUSTOM_LUT1D_MAX,
+			},
+		};
+		kms_colorop_t ctm_3x3 = {
+			.type = KMS_COLOROP_CTM_3X3,
+			.name = "CTM 3X3 (red to blue)",
+			.matrix_3x3 = &ctm_red_to_blue,
+		};
+		struct {
+			const char *name;
+			const color_t *fb_colors;
+			const color_t *exp_colors;
+			kms_colorop_t *colorops[MAX_COLOROPS];
+		} plane_colorops_tests[] = {
+			{ .name = "lut1d",
+			  .fb_colors = colors_rgb,
+			  .exp_colors = colors_rgb,
+			  .colorops = { &lut1d_max, NULL },
+			},
+			{ .name = "ctm3x3",
+			  .fb_colors = colors_rgb,
+			  .exp_colors = colors_red_to_blue,
+			  .colorops = { &ctm_3x3, NULL },
+			},
+			{ .name = "lut1d-ctm3x3",
+			  .fb_colors = colors_rgb,
+			  .exp_colors = colors_red_to_blue,
+			  .colorops = { &lut1d_max, &ctm_3x3, NULL },
+			},
+			{ .name = "ctm3x3-lut1d",
+			  .fb_colors = colors_rgb,
+			  .exp_colors = colors_red_to_blue,
+			  .colorops = { &ctm_3x3, &lut1d_max, NULL },
+			},
+			{ .name = "lut1d-lut1d",
+			  .fb_colors = colors_rgb,
+			  .exp_colors = colors_rgb,
+			  .colorops = { &lut1d_linear, &lut1d_max, NULL },
+			},
+			{ .name = "lut1d-ctm3x3-lut1d",
+			  .fb_colors = colors_rgb,
+			  .exp_colors = colors_red_to_blue,
+			  .colorops = { &lut1d_linear, &ctm_3x3, &lut1d_max, NULL },
+			},
+		};
 
-	igt_describe("Verify that deep color works correctly");
-	igt_subtest_with_dynamic("deep-color") {
-		for_each_pipe(&data->display, pipe) {
-			run_deep_color_tests_for_pipe(data, pipe);
+		igt_fixture
+			igt_require(data->display.is_atomic);
+
+		for (i = 0; i < ARRAY_SIZE(plane_colorops_tests); i++) {
+			igt_describe_f("Test plane color pipeline with colorops: %s", plane_colorops_tests[i].name);
+			igt_subtest_with_dynamic_f("plane-%s", plane_colorops_tests[i].name)
+				run_plane_color_tests(data,
+						      plane_colorops_tests[i].fb_colors,
+						      plane_colorops_tests[i].exp_colors,
+						      plane_colorops_tests[i].colorops);
+		}
+
+		igt_describe("Verify that deep color works correctly");
+		igt_subtest_with_dynamic("deep-color") {
+			for_each_pipe(&data->display, pipe) {
+				run_deep_color_tests_for_pipe(data, pipe);
+			}
 		}
 	}
 }
-- 
2.43.0

