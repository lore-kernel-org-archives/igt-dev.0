Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30A4C02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 16:04:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD10710E33D;
	Fri, 14 Feb 2025 16:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SgBXQJDk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB7510E33D
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 16:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739549097; x=1771085097;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LYATijEiFVdVW19NBZXf0/DamFXq9Kvg6N2S6I66ZFg=;
 b=SgBXQJDk5ss+yGmCeFG4phSHZklwodbY+IYNPZEfDPBVlL6I8wHhHJMy
 SSPXPO4wYofmAJOm8QzYX3Wu432h1MqsOjL+Gscl7Mf5aWd/zTUx7FVQ4
 xUjl91f0mI3tS/XOh+6ctjQDmBpVu1GdK8wMLrgYeL1BVSNqmiG0huX3g
 5KxL+F5OF8a1WJDtcfjtZYgx/gdknsvekNdAbnpbmwdiWo9OyciYwaBZQ
 n9AT/Jwv38WLBp2X8xoUgaoMPm1b0NOje5THRO7XRCespTJFsEY7P+p4Z
 NqcHcMyZ+tXLd7hMN5HwiJmNBNFxeWYU6RtRBojLwbbXhaDfCbcxVxR8W w==;
X-CSE-ConnectionGUID: cQw7xBHHQbG6hzmAO3q4xw==
X-CSE-MsgGUID: T+JEbL4US/ONVehteMZhFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40174317"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="40174317"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 08:04:56 -0800
X-CSE-ConnectionGUID: 7OrHE3PrRX+7yVbFXz/2EA==
X-CSE-MsgGUID: Xy0ewX4DSg+BiLNPFYq6ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117618425"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 08:04:55 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/kms_color: Enable ctm-limited-range subtest
Date: Fri, 14 Feb 2025 21:40:11 +0530
Message-Id: <20250214161011.363157-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

This tests is currently disabled since CRC computed on Intel
hardware seems to include data on the lower bits, this is
preventing us to CRC checks.

Let's try to enable it back and check behavior on newer Intel
platforms.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color.c | 166 ++++++++++++++++++++++++++--------------------
 1 file changed, 93 insertions(+), 73 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 4b71d3dd3..c3b285b4e 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -58,6 +58,7 @@
  * @0-75:           for 0.75 transparency
  * @blue-to-red:    from blue to red
  * @green-to-red:   from green to red
+ * @limited-range:  with identity matrix
  * @max:            for maximum transparency
  * @negative:       for negative transparency
  * @red-to-blue:    from red to blue
@@ -623,107 +624,97 @@ static bool test_pipe_ctm(data_t *data,
  * This test is currently disabled as the CRC computed on Intel hardware seems
  * to include data on the lower bits, this is preventing us to CRC checks.
  */
-#if 0
-static void test_pipe_limited_range_ctm(data_t *data,
+static bool test_pipe_limited_range_ctm(data_t *data,
 					igt_plane_t *primary)
 {
 	double limited_result = 235.0 / 255.0;
-	static const color_t red_green_blue_limited[] = {
+	color_t red_green_blue_limited[] = {
 		{ limited_result, 0.0, 0.0 },
 		{ 0.0, limited_result, 0.0 },
-		{ 0.0, 0.0, limited_result },
+		{ 0.0, 0.0, limited_result }
 	};
-	static const color_t red_green_blue_full[] = {
+	color_t red_green_blue_full[] = {
 		{ 0.5, 0.0, 0.0 },
 		{ 0.0, 0.5, 0.0 },
-		{ 0.0, 0.0, 0.5 },
-	};
-	static const double ctm[] = {
-		1.0, 0.0, 0.0,
-		0.0, 1.0, 0.0,
-		0.0, 0.0, 1.0,
+		{ 0.0, 0.0, 0.5 }
 	};
+	double ctm[] = { 1.0, 0.0, 0.0,
+			0.0, 1.0, 0.0,
+			0.0, 0.0, 1.0 };
 	gamma_lut_t *degamma_linear, *gamma_linear;
-	igt_output_t *output;
-	bool has_broadcast_rgb_output = false;
+	igt_output_t *output = data->output;
+	drmModeModeInfo *mode = data->mode;
+	struct igt_fb fb_modeset, fb;
+	int fb_id, fb_modeset_id;
+	igt_crc_t crc_full, crc_limited;
 	igt_display_t *display = &data->display;
+	bool ret = false;
+
+	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
 
 	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
 	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
 
-	for_each_valid_output_on_pipe(&data->display, primary->pipe->pipe, output) {
-		drmModeModeInfo *mode;
-		struct igt_fb fb_modeset, fb;
-		igt_crc_t crc_full, crc_limited;
-		int fb_id, fb_modeset_id;
-
-		if (!igt_output_has_prop(output, IGT_CONNECTOR_BROADCAST_RGB))
-			continue;
-
-		has_broadcast_rgb_output = true;
+	igt_output_set_pipe(output, primary->pipe->pipe);
 
-		igt_output_set_pipe(output, primary->pipe->pipe);
-		mode = igt_output_get_mode(output);
+	/* Create a framebuffer at the size of the output. */
+	fb_id = igt_create_fb(data->drm_fd,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR,
+			      &fb);
+	igt_assert(fb_id);
 
-		/* Create a framebuffer at the size of the output. */
-		fb_id = igt_create_fb(data->drm_fd,
+	fb_modeset_id = igt_create_fb(data->drm_fd,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
 				      DRM_FORMAT_MOD_LINEAR,
-				      &fb);
-		igt_assert(fb_id);
-
-		fb_modeset_id = igt_create_fb(data->drm_fd,
-					      mode->hdisplay,
-					      mode->vdisplay,
-					      DRM_FORMAT_XRGB8888,
-					      DRM_FORMAT_MOD_LINEAR,
-					      &fb_modeset);
-		igt_assert(fb_modeset_id);
-		igt_plane_set_fb(primary, &fb_modeset);
+				      &fb_modeset);
+	igt_assert(fb_modeset_id);
+	igt_plane_set_fb(primary, &fb_modeset);
 
-		set_degamma(data, primary->pipe, degamma_linear);
-		set_gamma(data, primary->pipe, gamma_linear);
-		set_ctm(primary->pipe, ctm);
-
-		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB, BROADCAST_RGB_FULL);
-		paint_rectangles(data, mode, red_green_blue_limited, &fb);
-		igt_plane_set_fb(primary, &fb);
-		igt_display_commit(&data->display);
-		igt_wait_for_vblank(data->drm_fd,
-				display->pipes[primary->pipe->pipe].crtc_offset);
-		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_full);
-
-		/* Set the output into limited range. */
-		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB, BROADCAST_RGB_16_235);
-		paint_rectangles(data, mode, red_green_blue_full, &fb);
-		igt_plane_set_fb(primary, &fb);
-		igt_display_commit(&data->display);
-		igt_wait_for_vblank(data->drm_fd,
-				display->pipes[primary->pipe->pipe].crtc_offset);
-		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_limited);
-
-		/* And reset.. */
-		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB, BROADCAST_RGB_FULL);
-		igt_plane_set_fb(primary, NULL);
-		igt_output_set_pipe(output, PIPE_NONE);
-
-		/* Verify that the CRC of the software computed output is
-		 * equal to the CRC of the CTM matrix transformation output.
-		 */
-		igt_assert_crc_equal(&crc_full, &crc_limited);
+	set_degamma(data, primary->pipe, degamma_linear);
+	set_gamma(data, primary->pipe, gamma_linear);
+	set_ctm(primary->pipe, ctm);
 
-		igt_remove_fb(data->drm_fd, &fb);
-		igt_remove_fb(data->drm_fd, &fb_modeset);
-	}
+	igt_output_set_prop_value(output,
+				  IGT_CONNECTOR_BROADCAST_RGB,
+				  BROADCAST_RGB_FULL);
+	paint_rectangles(data, mode, red_green_blue_limited, &fb);
+	igt_plane_set_fb(primary, &fb);
+	igt_display_commit(&data->display);
+	igt_wait_for_vblank(data->drm_fd,
+			display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_full);
+
+	/* Set the output into limited range. */
+	igt_output_set_prop_value(output,
+				  IGT_CONNECTOR_BROADCAST_RGB,
+				  BROADCAST_RGB_16_235);
+	paint_rectangles(data, mode, red_green_blue_full, &fb);
+	igt_plane_set_fb(primary, &fb);
+	igt_display_commit(&data->display);
+	igt_wait_for_vblank(data->drm_fd,
+			display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_limited);
+
+	/* And reset.. */
+	igt_output_set_prop_value(output,
+				  IGT_CONNECTOR_BROADCAST_RGB,
+				  BROADCAST_RGB_FULL);
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit(&data->display);
+
+	ret = igt_skip_crc_compare || igt_check_crc_equal(&crc_full, &crc_limited);
 
 	free_lut(gamma_linear);
 	free_lut(degamma_linear);
 
-	igt_require(has_broadcast_rgb_output);
+	return ret;
 }
-#endif
 
 static void
 prep_pipe(data_t *data, enum pipe p)
@@ -1000,6 +991,25 @@ run_invalid_tests_for_pipe(data_t *data)
 	}
 }
 
+static void
+run_limited_range_ctm_test_for_pipe(data_t *data, enum pipe p,
+		bool (*test_t)(data_t*, igt_plane_t*))
+{
+	test_setup(data, p);
+
+	igt_require(igt_output_has_prop(data->output, IGT_CONNECTOR_BROADCAST_RGB));
+
+	data->color_depth = 8;
+	data->drm_format = DRM_FORMAT_XRGB8888;
+	data->mode = igt_output_get_mode(data->output);
+
+	igt_require(pipe_output_combo_valid(data, p));
+
+	igt_assert(test_t(data, data->primary));
+
+	test_cleanup(data);
+}
+
 static void
 run_tests_for_pipe(data_t *data)
 {
@@ -1156,6 +1166,16 @@ run_tests_for_pipe(data_t *data)
 		}
 	}
 
+	igt_describe("Compare after applying ctm matrix & identity matrix");
+	igt_subtest_with_dynamic("ctm-limited-range") {
+		for_each_pipe_with_valid_output(&data->display, pipe, data->output) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+				       igt_output_name(data->output))
+				run_limited_range_ctm_test_for_pipe(data, pipe,
+								    test_pipe_limited_range_ctm);
+			}
+		}
+
 	igt_fixture
 		igt_require(data->display.is_atomic);
 
-- 
2.25.1

