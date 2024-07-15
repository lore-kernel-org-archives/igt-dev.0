Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F72AC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jul 2024 15:42:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47C010E40F;
	Mon, 15 Jul 2024 15:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="muwSZM9T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1913E10E40F
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jul 2024 15:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721058140; x=1752594140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jkJTK3804z6ziAswxaSledIheSgj0WRa7hW8wHjKdzw=;
 b=muwSZM9TZB9tLDFZRyJt7a+L+ummiqlz37+bO6ccsUIRYXvEbPAqY4Pe
 pgH+vbL+mZDonm9/dEpSc+zRWHnaZndZAMv6HXunNhHIWjWI0gxpx1fPp
 edewuDrpiJOYWf3IDKNyBZKXodYgNfQvszjUcXsafAW2VmJtt+JlFXUZJ
 a44lAam8CcUvynrnuMA85VavC8avH5IKzhyPKdD2WLFJR/HpZsGvrS/Pm
 beph2I9tGxmSv6Av8W3xbGV4XrodDAZU3AvckQpWAhVf50ysrH2Bh0InL
 KeBOxmR+0yF/U0Z4kheMlu0VwvG6jaNoKhbYQ8BGNTI2ZDwrGxemvbTV5 A==;
X-CSE-ConnectionGUID: QyfihOU6R+udCPOtve2ouw==
X-CSE-MsgGUID: 4yfWwj1CSIqQf021v85oBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="35987956"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="35987956"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 08:42:20 -0700
X-CSE-ConnectionGUID: zkEFPw67Q7mu3XjNKNpAyQ==
X-CSE-MsgGUID: fdvfaECQT/q2qeqO6nIc2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="49408701"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 08:42:18 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 1/5] tests/kms_plane_scaling: Update the single plane
 scaling function arguments
Date: Mon, 15 Jul 2024 21:16:24 +0530
Message-ID: <20240715154628.583682-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240715154628.583682-1-ramanaidu.naladala@intel.com>
References: <20240715154628.583682-1-ramanaidu.naladala@intel.com>
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

Update the helper test_scaler_with_modifier_pipe to use a scaling_factor
and is_clip_clamp flag instead of explicit width and height parameters.
This change simplifies the function interfaces and allows for testing
scenarios, where we need to recalculate the width and height based on the
display mode.Adjusted all function calls to match new argument order.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 61 ++++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 26 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 3f63d3cf4..f5efd13ef 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -569,7 +569,8 @@ static void cleanup_crtc(data_t *data)
 static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 					 uint32_t pixel_format,
 					 uint64_t modifier,
-					 int width, int height,
+					 double sf_plane1,
+					 bool is_clip_clamp,
 					 bool is_upscale,
 					 enum pipe pipe,
 					 igt_output_t *output,
@@ -579,9 +580,18 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 	drmModeModeInfo *mode;
 	int commit_ret;
 	int w, h;
+	int width, height;
 
 	mode = igt_output_get_mode(output);
 
+	if (is_clip_clamp == true) {
+		width = mode->hdisplay + 100;
+		height = mode->vdisplay + 100;
+	} else {
+		width = get_width(mode, sf_plane1);
+		height = get_height(mode, sf_plane1);
+	}
+
 	if (is_upscale) {
 		w = width;
 		h = height;
@@ -693,7 +703,8 @@ static const uint64_t modifiers[] = {
 };
 
 static void test_scaler_with_modifier_pipe(data_t *d,
-					   int width, int height,
+					   double sf_plane1,
+					   bool is_clip_clamp,
 					   bool is_upscale,
 					   enum pipe pipe,
 					   igt_output_t *output)
@@ -716,7 +727,8 @@ static void test_scaler_with_modifier_pipe(data_t *d,
 			if (igt_plane_has_format_mod(plane, format, modifier))
 				check_scaling_pipe_plane_rot(d, plane,
 							     format, modifier,
-							     width, height,
+							     sf_plane1,
+							     is_clip_clamp,
 							     is_upscale,
 							     pipe, output,
 							     IGT_ROTATION_0);
@@ -725,7 +737,8 @@ static void test_scaler_with_modifier_pipe(data_t *d,
 }
 
 static void test_scaler_with_rotation_pipe(data_t *d,
-					   int width, int height,
+					   double sf_plane1,
+					   bool is_clip_clamp,
 					   bool is_upscale,
 					   enum pipe pipe,
 					   igt_output_t *output)
@@ -749,7 +762,8 @@ static void test_scaler_with_rotation_pipe(data_t *d,
 			if (igt_plane_has_rotation(plane, rot))
 				check_scaling_pipe_plane_rot(d, plane,
 							     format, modifier,
-							     width, height,
+							     sf_plane1,
+							     is_clip_clamp,
 							     is_upscale,
 							     pipe, output,
 							     rot);
@@ -757,8 +771,9 @@ static void test_scaler_with_rotation_pipe(data_t *d,
 	}
 }
 
-static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height, bool is_upscale,
-					       enum pipe pipe, igt_output_t *output)
+static void test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane1,
+		bool is_clip_clamp, bool is_upscale, enum pipe pipe,
+		igt_output_t *output)
 {
 	igt_display_t *display = &d->display;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
@@ -787,7 +802,7 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height,
 			    can_scale(d, format))
 			    check_scaling_pipe_plane_rot(d, plane,
 							 format, modifier,
-							 width, height,
+							 sf_plane1, is_clip_clamp,
 							 is_upscale,
 							 pipe, output, IGT_ROTATION_0);
 		}
@@ -1307,11 +1322,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-							drmModeModeInfo *mode = igt_output_get_mode(output);
 
 							test_scaler_with_pixel_format_pipe(&data,
-								get_width(mode, scaler_with_pixel_format_tests[index].sf),
-								get_height(mode, scaler_with_pixel_format_tests[index].sf),
+								scaler_with_pixel_format_tests[index].sf,
+								false,
 								scaler_with_pixel_format_tests[index].is_upscale,
 								pipe, output);
 						}
@@ -1332,11 +1346,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-							drmModeModeInfo *mode = igt_output_get_mode(output);
 
 							test_scaler_with_rotation_pipe(&data,
-								get_width(mode, scaler_with_rotation_tests[index].sf),
-								get_height(mode, scaler_with_rotation_tests[index].sf),
+								scaler_with_rotation_tests[index].sf,
+								false,
 								scaler_with_rotation_tests[index].is_upscale,
 								pipe, output);
 						}
@@ -1357,11 +1370,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-							drmModeModeInfo *mode = igt_output_get_mode(output);
 
 							test_scaler_with_modifier_pipe(&data,
-								get_width(mode, scaler_with_modifiers_tests[index].sf),
-								get_height(mode, scaler_with_modifiers_tests[index].sf),
+								scaler_with_modifiers_tests[index].sf,
+								false,
 								scaler_with_modifiers_tests[index].is_upscale,
 								pipe, output);
 						}
@@ -1381,10 +1393,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-						drmModeModeInfo *mode = igt_output_get_mode(output);
 
-						test_scaler_with_pixel_format_pipe(&data, mode->hdisplay + 100,
-							mode->vdisplay + 100, false, pipe, output);
+						test_scaler_with_pixel_format_pipe(&data, 0.0, true,
+								false, pipe, output);
 					}
 					break;
 				}
@@ -1401,10 +1412,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-						drmModeModeInfo *mode = igt_output_get_mode(output);
 
-						test_scaler_with_rotation_pipe(&data, mode->hdisplay + 100,
-							mode->vdisplay + 100, false, pipe, output);
+						test_scaler_with_rotation_pipe(&data, 0.0, true,
+								false, pipe, output);
 					}
 					break;
 				}
@@ -1421,9 +1431,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-						drmModeModeInfo *mode = igt_output_get_mode(output);
-						test_scaler_with_modifier_pipe(&data, mode->hdisplay + 100,
-							mode->vdisplay + 100, false, pipe, output);
+						test_scaler_with_modifier_pipe(&data, 0.0, true,
+								false, pipe, output);
 					}
 					break;
 				}
-- 
2.43.0

