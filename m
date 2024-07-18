Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AE5C3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 14:01:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA59A10E8A0;
	Thu, 18 Jul 2024 14:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n6u1VTeG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADF810E8A0
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 14:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721311301; x=1752847301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BY/K2rn2y1yO726f47KfsPxEmBoCz8tfmIGu00bA7vA=;
 b=n6u1VTeGUvsJh1qCBso+U2iP+gNj9M/0CjVVBiN/7wDqagAJLxWGaKtr
 0t/k6UpJWjfkzi2Dbo8nvnzD2hAQX0WlP2V3tb+Fn7alzyNlw5/v1X1/n
 1DqI1I6d8AdWQhIoH+6EPFJR0qkMFDV4q6piFNBfb1BOdPz2rle/Ky7WG
 qaw9bsnNztaTDRp0DB9eT2pKy0rrFNrLAbr8RkcXo62XkIUYS9BSGx0Ee
 58Nb4xzBbYbuxl3GReNZJ/vaCU/h4dh8cxum11r8Cxi/G7qH5E2XPpkUN
 0Noi1366SYfsGnertgX8R3d4wuFHbCypIV6xm1/bE4RuqGNmPqYRj/sAN w==;
X-CSE-ConnectionGUID: yKGT4CjGQfyGLKf4o8n7Lg==
X-CSE-MsgGUID: DOn0OB7lTpOhZrkJowaI8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="19005872"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="19005872"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 07:01:40 -0700
X-CSE-ConnectionGUID: J15bAhgyRjC7FiENAeOfcQ==
X-CSE-MsgGUID: oZ5SDsnKSP6oAf8mnWck8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="55927289"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 07:01:38 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v7 1/5] tests/kms_plane_scaling: Update the single plane
 scaling function arguments
Date: Thu, 18 Jul 2024 19:35:42 +0530
Message-ID: <20240718140546.676903-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240718140546.676903-1-ramanaidu.naladala@intel.com>
References: <20240718140546.676903-1-ramanaidu.naladala@intel.com>
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

Update the helper test_scaler_with_modifier_pipe,
test_scaler_with_rotation_pipe and test_scaler_with_pixel_format_pipe
to use a scaling_factor and is_clip_clamp flag instead of explicit
width and height parameters. This change simplifies the function interfaces
and allows for testing scenarios, where we need to recalculate the width
and height based on the display mode. Adjusted all function calls to match
new argument order.

v2: Update the function arguments (Ankit)
v3: Remove unwanted changes (Ankit) 

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 81 +++++++++++++++++++++++----------------
 1 file changed, 48 insertions(+), 33 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 3f63d3cf4..450381831 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -569,7 +569,8 @@ static void cleanup_crtc(data_t *data)
 static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 					 uint32_t pixel_format,
 					 uint64_t modifier,
-					 int width, int height,
+					 double sf_plane,
+					 bool is_clip_clamp,
 					 bool is_upscale,
 					 enum pipe pipe,
 					 igt_output_t *output,
@@ -579,8 +580,16 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 	drmModeModeInfo *mode;
 	int commit_ret;
 	int w, h;
+	int width, height;
 
 	mode = igt_output_get_mode(output);
+	if (is_clip_clamp == true) {
+		width = mode->hdisplay + 100;
+		height = mode->vdisplay + 100;
+	} else {
+		width = get_width(mode, sf_plane);
+		height = get_height(mode, sf_plane);
+	}
 
 	if (is_upscale) {
 		w = width;
@@ -693,7 +702,8 @@ static const uint64_t modifiers[] = {
 };
 
 static void test_scaler_with_modifier_pipe(data_t *d,
-					   int width, int height,
+					   double sf_plane,
+					   bool is_clip_clamp,
 					   bool is_upscale,
 					   enum pipe pipe,
 					   igt_output_t *output)
@@ -716,7 +726,8 @@ static void test_scaler_with_modifier_pipe(data_t *d,
 			if (igt_plane_has_format_mod(plane, format, modifier))
 				check_scaling_pipe_plane_rot(d, plane,
 							     format, modifier,
-							     width, height,
+							     sf_plane,
+							     is_clip_clamp,
 							     is_upscale,
 							     pipe, output,
 							     IGT_ROTATION_0);
@@ -725,7 +736,8 @@ static void test_scaler_with_modifier_pipe(data_t *d,
 }
 
 static void test_scaler_with_rotation_pipe(data_t *d,
-					   int width, int height,
+					   double sf_plane,
+					   bool is_clip_clamp,
 					   bool is_upscale,
 					   enum pipe pipe,
 					   igt_output_t *output)
@@ -749,7 +761,8 @@ static void test_scaler_with_rotation_pipe(data_t *d,
 			if (igt_plane_has_rotation(plane, rot))
 				check_scaling_pipe_plane_rot(d, plane,
 							     format, modifier,
-							     width, height,
+							     sf_plane,
+							     is_clip_clamp,
 							     is_upscale,
 							     pipe, output,
 							     rot);
@@ -757,8 +770,11 @@ static void test_scaler_with_rotation_pipe(data_t *d,
 	}
 }
 
-static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height, bool is_upscale,
-					       enum pipe pipe, igt_output_t *output)
+static void test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
+					       bool is_clip_clamp,
+					       bool is_upscale,
+					       enum pipe pipe,
+					       igt_output_t *output)
 {
 	igt_display_t *display = &d->display;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
@@ -787,9 +803,11 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height,
 			    can_scale(d, format))
 			    check_scaling_pipe_plane_rot(d, plane,
 							 format, modifier,
-							 width, height,
+							 sf_plane,
+							 is_clip_clamp,
 							 is_upscale,
-							 pipe, output, IGT_ROTATION_0);
+							 pipe, output,
+							 IGT_ROTATION_0);
 		}
 
 		igt_vec_fini(&tested_formats);
@@ -1307,13 +1325,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-							drmModeModeInfo *mode = igt_output_get_mode(output);
 
 							test_scaler_with_pixel_format_pipe(&data,
-								get_width(mode, scaler_with_pixel_format_tests[index].sf),
-								get_height(mode, scaler_with_pixel_format_tests[index].sf),
-								scaler_with_pixel_format_tests[index].is_upscale,
-								pipe, output);
+									scaler_with_pixel_format_tests[index].sf,
+									false,
+									scaler_with_pixel_format_tests[index].is_upscale,
+									pipe, output);
 						}
 						break;
 					}
@@ -1332,13 +1349,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-							drmModeModeInfo *mode = igt_output_get_mode(output);
 
 							test_scaler_with_rotation_pipe(&data,
-								get_width(mode, scaler_with_rotation_tests[index].sf),
-								get_height(mode, scaler_with_rotation_tests[index].sf),
-								scaler_with_rotation_tests[index].is_upscale,
-								pipe, output);
+									scaler_with_rotation_tests[index].sf,
+									false,
+									scaler_with_rotation_tests[index].is_upscale,
+									pipe, output);
 						}
 						break;
 					}
@@ -1357,13 +1373,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-							drmModeModeInfo *mode = igt_output_get_mode(output);
 
 							test_scaler_with_modifier_pipe(&data,
-								get_width(mode, scaler_with_modifiers_tests[index].sf),
-								get_height(mode, scaler_with_modifiers_tests[index].sf),
-								scaler_with_modifiers_tests[index].is_upscale,
-								pipe, output);
+									scaler_with_modifiers_tests[index].sf,
+									false,
+									scaler_with_modifiers_tests[index].is_upscale,
+									pipe, output);
 						}
 						break;
 					}
@@ -1381,10 +1396,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-						drmModeModeInfo *mode = igt_output_get_mode(output);
 
-						test_scaler_with_pixel_format_pipe(&data, mode->hdisplay + 100,
-							mode->vdisplay + 100, false, pipe, output);
+						test_scaler_with_pixel_format_pipe(&data, 0.0, true,
+										   false, pipe,
+										   output);
 					}
 					break;
 				}
@@ -1401,10 +1416,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-						drmModeModeInfo *mode = igt_output_get_mode(output);
 
-						test_scaler_with_rotation_pipe(&data, mode->hdisplay + 100,
-							mode->vdisplay + 100, false, pipe, output);
+						test_scaler_with_rotation_pipe(&data, 0.0, true,
+										false, pipe,
+										output);
 					}
 					break;
 				}
@@ -1421,9 +1436,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-						drmModeModeInfo *mode = igt_output_get_mode(output);
-						test_scaler_with_modifier_pipe(&data, mode->hdisplay + 100,
-							mode->vdisplay + 100, false, pipe, output);
+						test_scaler_with_modifier_pipe(&data, 0.0, true,
+										false, pipe,
+										output);
 					}
 					break;
 				}
-- 
2.43.0

