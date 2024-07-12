Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B13C3DA45
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jul 2024 06:46:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520FF10EC15;
	Fri, 12 Jul 2024 06:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MGRFwARs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4471210EC15
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jul 2024 06:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720766767; x=1752302767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pXZxWbMyP8K9QKb22jbt1msddKQ+FaHpJql9XrYdYjE=;
 b=MGRFwARs+ucfVHg8d+aYdUxkCowCwFLTj2ClBGOOdfrcf6l9WJejiUWo
 mkzkkSurrilK6v+cZ1pF7l77PeJTdq56gB8mejbJnJNhVoFNfDggHgz++
 w2d67EDLj6i8AxSuO7qrJbUrtfastkjqoOWVojSgm/pf2p7tOU3umlI7k
 AmBNiqP4dOwbiU4z7vVEwHwQfZT6GfU7/afmaP4a5aO1Ct2GL9CF+Irwc
 ufMb+ypEzizOd5bebi05c3N4YBNcDjbdvegLW9AuSn7lowyZt8ZDc5IjG
 OZHQlExND9qdqWcOAygtRERF7eCCv3LMWbl/OKTN2BZRv59zO7LAHNyOP A==;
X-CSE-ConnectionGUID: QA3majpCQJKjxMnD1NHg1w==
X-CSE-MsgGUID: fj6qYvVMSXyq96xwVlU4JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18036266"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="18036266"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 23:46:07 -0700
X-CSE-ConnectionGUID: FuDRQHUtTu+4fOyg25bU4w==
X-CSE-MsgGUID: n+XvQFGETSalMDpsgNcKeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="48728690"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 23:46:05 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 2/4] tests/kms_plane_scaling: Update the single plane
 scaling function arguments
Date: Fri, 12 Jul 2024 12:20:01 +0530
Message-ID: <20240712065003.530021-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240712065003.530021-1-ramanaidu.naladala@intel.com>
References: <20240712065003.530021-1-ramanaidu.naladala@intel.com>
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

This patch remove the unused function arguments for plane1
subtests. It will not impact any functionality.

v2: Update the function arguments (Ankit)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 65 +++++++++++++++------------------------
 1 file changed, 24 insertions(+), 41 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 546869912..c6d7ee832 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -572,7 +572,7 @@ static void cleanup_crtc(data_t *data)
 static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 					 uint32_t pixel_format,
 					 uint64_t modifier,
-					 int width, int height,
+					 double sf_plane1,
 					 bool is_upscale,
 					 enum pipe pipe,
 					 igt_output_t *output,
@@ -582,20 +582,21 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 	drmModeModeInfo *mode;
 	int commit_ret;
 	int w, h;
+	int width, height;
 	bool mode_support = false;
 
 	for_each_connector_mode(output) {
 		mode = &output->config.connector->modes[j__];
 		if (is_upscale) {
-			w = width;
-			h = height;
+			w = get_width(mode, sf_plane1);
+			h = get_height(mode, sf_plane1);
 		} else {
 			if (d->flag == true) {
 				width = mode->hdisplay + 100;
 				height = mode->vdisplay + 100;
 			} else {
-				width = get_width(mode, d->sf_plane1);
-				height = get_height(mode, d->sf_plane1);
+				width = get_width(mode, sf_plane1);
+				height = get_height(mode, sf_plane1);
 			}
 			w = mode->hdisplay;
 			h = mode->vdisplay;
@@ -705,7 +706,7 @@ static const uint64_t modifiers[] = {
 };
 
 static void test_scaler_with_modifier_pipe(data_t *d,
-					   int width, int height,
+					   double sf_plane1,
 					   bool is_upscale,
 					   enum pipe pipe,
 					   igt_output_t *output)
@@ -728,7 +729,7 @@ static void test_scaler_with_modifier_pipe(data_t *d,
 			if (igt_plane_has_format_mod(plane, format, modifier))
 				check_scaling_pipe_plane_rot(d, plane,
 							     format, modifier,
-							     width, height,
+							     sf_plane1,
 							     is_upscale,
 							     pipe, output,
 							     IGT_ROTATION_0);
@@ -737,7 +738,7 @@ static void test_scaler_with_modifier_pipe(data_t *d,
 }
 
 static void test_scaler_with_rotation_pipe(data_t *d,
-					   int width, int height,
+					   double sf_plane1,
 					   bool is_upscale,
 					   enum pipe pipe,
 					   igt_output_t *output)
@@ -761,7 +762,7 @@ static void test_scaler_with_rotation_pipe(data_t *d,
 			if (igt_plane_has_rotation(plane, rot))
 				check_scaling_pipe_plane_rot(d, plane,
 							     format, modifier,
-							     width, height,
+							     sf_plane1,
 							     is_upscale,
 							     pipe, output,
 							     rot);
@@ -769,7 +770,7 @@ static void test_scaler_with_rotation_pipe(data_t *d,
 	}
 }
 
-static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height, bool is_upscale,
+static void test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane1, bool is_upscale,
 					       enum pipe pipe, igt_output_t *output)
 {
 	igt_display_t *display = &d->display;
@@ -799,7 +800,7 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height,
 			    can_scale(d, format))
 			    check_scaling_pipe_plane_rot(d, plane,
 							 format, modifier,
-							 width, height,
+							 sf_plane1,
 							 is_upscale,
 							 pipe, output, IGT_ROTATION_0);
 		}
@@ -1330,14 +1331,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-							drmModeModeInfo *mode = igt_output_get_mode(output);
-							data.sf_plane1 = scaler_with_pixel_format_tests[index].sf;
-
 							test_scaler_with_pixel_format_pipe(&data,
-								get_width(mode, scaler_with_pixel_format_tests[index].sf),
-								get_height(mode, scaler_with_pixel_format_tests[index].sf),
-								scaler_with_pixel_format_tests[index].is_upscale,
-								pipe, output);
+									scaler_with_pixel_format_tests[index].sf,
+									scaler_with_pixel_format_tests[index].is_upscale,
+									pipe, output);
 						}
 						break;
 					}
@@ -1356,14 +1353,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-							drmModeModeInfo *mode = igt_output_get_mode(output);
-							data.sf_plane1 = scaler_with_rotation_tests[index].sf;
-
 							test_scaler_with_rotation_pipe(&data,
-								get_width(mode, scaler_with_rotation_tests[index].sf),
-								get_height(mode, scaler_with_rotation_tests[index].sf),
-								scaler_with_rotation_tests[index].is_upscale,
-								pipe, output);
+									scaler_with_rotation_tests[index].sf,
+									scaler_with_rotation_tests[index].is_upscale,
+									pipe, output);
 						}
 						break;
 					}
@@ -1382,14 +1375,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 							continue;
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-							drmModeModeInfo *mode = igt_output_get_mode(output);
-							data.sf_plane1 = scaler_with_modifiers_tests[index].sf;
-
 							test_scaler_with_modifier_pipe(&data,
-								get_width(mode, scaler_with_modifiers_tests[index].sf),
-								get_height(mode, scaler_with_modifiers_tests[index].sf),
-								scaler_with_modifiers_tests[index].is_upscale,
-								pipe, output);
+									scaler_with_modifiers_tests[index].sf,
+									scaler_with_modifiers_tests[index].is_upscale,
+									pipe, output);
 						}
 						break;
 					}
@@ -1407,11 +1396,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-						drmModeModeInfo *mode = igt_output_get_mode(output);
 						data.flag = true;
 
-						test_scaler_with_pixel_format_pipe(&data, mode->hdisplay + 100,
-							mode->vdisplay + 100, false, pipe, output);
+						test_scaler_with_pixel_format_pipe(&data, 0.0, false, pipe, output);
 					}
 					break;
 				}
@@ -1428,11 +1415,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-						drmModeModeInfo *mode = igt_output_get_mode(output);
 						data.flag = true;
 
-						test_scaler_with_rotation_pipe(&data, mode->hdisplay + 100,
-							mode->vdisplay + 100, false, pipe, output);
+						test_scaler_with_rotation_pipe(&data, 0.0, false, pipe, output);
 					}
 					break;
 				}
@@ -1449,10 +1434,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 						continue;
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-						drmModeModeInfo *mode = igt_output_get_mode(output);
 						data.flag = true;
-						test_scaler_with_modifier_pipe(&data, mode->hdisplay + 100,
-							mode->vdisplay + 100, false, pipe, output);
+						test_scaler_with_modifier_pipe(&data, 0.0, false, pipe, output);
 					}
 					break;
 				}
-- 
2.43.0

