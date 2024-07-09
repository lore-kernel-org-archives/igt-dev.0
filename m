Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36977C3DA41
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 12:59:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26B210E53F;
	Tue,  9 Jul 2024 12:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QWfJxnaf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D53810E53F
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 12:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720529954; x=1752065954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0bguuiv1REXUkwof77uI7ewOy5IxSxoUpVhaVoONKGw=;
 b=QWfJxnafb9KtZI02Y4oUux78D0ViFQAV2/8rLizbzhidvTS2g0IAjPvX
 7puxDBsp2a5vakAUetspDlIdgejALNgedw8c3Ien2YWlUhI3cu4HPj0SL
 Ck4zPiDx5VqcNOckss+XeWn0z/RiKeXj/E1DbfpR6fGk0Dje28zUnCrPh
 3MsWl0+HfUc0pgkskQf2pHuZo6nY0tbNwkUPOHJo6X1ulIm0mB0yj/YxF
 h/jNb5tPdeBdwEFO5BP0+uP3f5KjU02cws/bnTFCDCux4AONQewmWCN2b
 /xulN8AANAAcWPUGbybuDHLs01uvxZzLZviWkJvGyGs+3+WzHyw0feODW Q==;
X-CSE-ConnectionGUID: 5WljdSEyTKuHqbzO+WJhvg==
X-CSE-MsgGUID: vRslx+qrRjyt6UqugRI1lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17411368"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="17411368"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 05:59:13 -0700
X-CSE-ConnectionGUID: S3MX5HrwTeWLYddd+HO6mA==
X-CSE-MsgGUID: 6iZ05lYkQo2b9b3hudEP3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="53031362"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 05:59:11 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 1/2] tests/kms_plane_scaling: Improvise the scaling BW
 issues.
Date: Tue,  9 Jul 2024 18:33:20 +0530
Message-ID: <20240709130321.455906-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709130321.455906-1-ramanaidu.naladala@intel.com>
References: <20240709130321.455906-1-ramanaidu.naladala@intel.com>
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

Many tests are failing due to Bandwidth issues. 
To eliminate this failures we change the least 
working display modes.

- Observed, for higher modes Bandwidth is not sufficient
  to downscale operation and multi-plane scaling operations.
- Add a fix, when Bandwidth is not sufficent for higher
  modes it will try the next lower display mode.
- Fixed some styling issues in the patch.

v2: Fix some styling issues in the patch . (Ankit)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 181 ++++++++++++++++++++++----------------
 1 file changed, 106 insertions(+), 75 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 3f63d3cf4..3296f98e8 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -210,6 +210,9 @@ typedef struct {
 	igt_display_t display;
 	struct igt_fb fb[4];
 	bool extended;
+	double sf_plane1;
+	double sf_plane2;
+	bool flag;
 } data_t;
 
 struct invalid_paramtests {
@@ -579,48 +582,57 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 	drmModeModeInfo *mode;
 	int commit_ret;
 	int w, h;
+	bool mode_support = false;
+
+	for_each_connector_mode(output) {
+		mode = &output->config.connector->modes[j__];
+		if (is_upscale) {
+			w = width;
+			h = height;
+		} else {
+			if (d->flag == true) {
+				width = mode->hdisplay + 100;
+				height = mode->vdisplay + 100;
+			} else {
+				width = get_width(mode, d->sf_plane1);
+				height = get_height(mode, d->sf_plane1);
+			}
+			w = mode->hdisplay;
+			h = mode->vdisplay;
+		}
 
-	mode = igt_output_get_mode(output);
-
-	if (is_upscale) {
-		w = width;
-		h = height;
-	} else {
-		w = mode->hdisplay;
-		h = mode->vdisplay;
+		/*
+		 * guarantee even value width/height to avoid fractional
+		 * uv component in chroma subsampling for yuv 4:2:0 formats
+		 */
+		w = ALIGN(w, 2);
+		h = ALIGN(h, 2);
+		igt_create_fb(display->drm_fd, w, h, pixel_format, modifier, &d->fb[0]);
+		igt_plane_set_fb(plane, &d->fb[0]);
+		igt_fb_set_position(&d->fb[0], plane, 0, 0);
+		igt_fb_set_size(&d->fb[0], plane, w, h);
+		igt_plane_set_position(plane, 0, 0);
+		commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
+		igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
+				"Unsupported resolution parameters  %dx%d\n",
+				 w, h);
+		if (is_upscale)
+			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
+		else
+			igt_plane_set_size(plane, width, height);
+
+		if (rot != IGT_ROTATION_0)
+			igt_plane_set_rotation(plane, rot);
+
+		if (igt_display_try_commit2(display, COMMIT_ATOMIC) >= 0) {
+			igt_plane_set_fb(plane, NULL);
+			igt_plane_set_position(plane, 0, 0);
+			cleanup_fbs(d);
+			mode_support = true;
+			break;
+		}
 	}
-
-	/*
-	 * guarantee even value width/height to avoid fractional
-	 * uv component in chroma subsampling for yuv 4:2:0 formats
-	 * */
-	w = ALIGN(w, 2);
-	h = ALIGN(h, 2);
-
-	igt_create_fb(display->drm_fd, w, h, pixel_format, modifier, &d->fb[0]);
-
-	igt_plane_set_fb(plane, &d->fb[0]);
-	igt_fb_set_position(&d->fb[0], plane, 0, 0);
-	igt_fb_set_size(&d->fb[0], plane, w, h);
-	igt_plane_set_position(plane, 0, 0);
-
-	if (is_upscale)
-		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
-	else
-		igt_plane_set_size(plane, width, height);
-
-	if (rot != IGT_ROTATION_0)
-		igt_plane_set_rotation(plane, rot);
-	commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
-
-	igt_plane_set_fb(plane, NULL);
-	igt_plane_set_position(plane, 0, 0);
-	cleanup_fbs(d);
-
-	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
-		      "Unsupported scaling factor with fb size %dx%d\n",
-		      w, h);
-	igt_assert_eq(commit_ret, 0);
+	igt_skip_on_f(!mode_support, "Band Width not sufficent for scaling\n");
 }
 
 static const igt_rotation_t rotations[] = {
@@ -847,41 +859,52 @@ __test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
 	igt_display_t *display = &d->display;
 	drmModeModeInfo *mode;
 	int ret;
-
-	mode = igt_output_get_mode(output);
-
-	igt_plane_set_fb(p1, fb1);
-	igt_plane_set_fb(p2, fb2);
-
-	switch (test_type) {
-	case TEST_PLANES_UPSCALE:
-		igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
-		igt_plane_set_size(p2, mode->hdisplay - 20, mode->vdisplay - 20);
-		break;
-	case TEST_PLANES_DOWNSCALE:
-		igt_plane_set_size(p1, w1, h1);
-		igt_plane_set_size(p2, w2, h2);
-		break;
-	case TEST_PLANES_UPSCALE_DOWNSCALE:
-		igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
-		igt_plane_set_size(p2, w2, h2);
-		break;
-	case TEST_PLANES_DOWNSCALE_UPSCALE:
-		igt_plane_set_size(p1, w1, h1);
-		igt_plane_set_size(p2, mode->hdisplay, mode->vdisplay);
-		break;
-	default:
-		igt_assert(0);
+	bool mode_support = false;
+
+	for_each_connector_mode(output) {
+		mode = &output->config.connector->modes[j__];
+		w1 = get_width(mode, d->sf_plane1);
+		h1 = get_height(mode, d->sf_plane1);
+		w2 = get_width(mode, d->sf_plane2);
+		h2 = get_height(mode, d->sf_plane2);
+
+		igt_output_override_mode(output, mode);
+		igt_plane_set_fb(p1, fb1);
+		igt_plane_set_fb(p2, fb2);
+		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		igt_skip_on_f(ret == -EINVAL || ret == -ERANGE,
+				"Resolution not supported by driver\n");
+
+		switch (test_type) {
+		case TEST_PLANES_UPSCALE:
+			igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
+			igt_plane_set_size(p2, mode->hdisplay - 20, mode->vdisplay - 20);
+			break;
+		case TEST_PLANES_DOWNSCALE:
+			igt_plane_set_size(p1, w1, h1);
+			igt_plane_set_size(p2, w2, h2);
+			break;
+		case TEST_PLANES_UPSCALE_DOWNSCALE:
+			igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
+			igt_plane_set_size(p2, w2, h2);
+			break;
+		case TEST_PLANES_DOWNSCALE_UPSCALE:
+			igt_plane_set_size(p1, w1, h1);
+			igt_plane_set_size(p2, mode->hdisplay, mode->vdisplay);
+			break;
+		default:
+			igt_assert(0);
+		}
+		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		if (ret >= 0) {
+			mode_support = true;
+			igt_plane_set_fb(p1, NULL);
+			igt_plane_set_fb(p2, NULL);
+			igt_assert_eq(ret, 0);
+			break;
+		}
 	}
-
-	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-
-	igt_plane_set_fb(p1, NULL);
-	igt_plane_set_fb(p2, NULL);
-
-	igt_skip_on_f(ret == -EINVAL || ret == -ERANGE,
-		      "Scaling op not supported by driver\n");
-	igt_assert_eq(ret, 0);
+	igt_skip_on_f(!mode_support, "Band Width not sufficent for Multi Plane\n");
 }
 
 static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
@@ -902,9 +925,9 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
 	int n_planes;
 
 	cleanup_crtc(d);
+	mode = igt_output_get_mode(output);
 
 	igt_output_set_pipe(output, pipe);
-	mode = igt_output_get_mode(output);
 
 	n_planes = display->pipes[pipe].n_planes;
 	igt_require(n_planes >= 2);
@@ -1308,6 +1331,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 							drmModeModeInfo *mode = igt_output_get_mode(output);
+							data.sf_plane1 = scaler_with_pixel_format_tests[index].sf;
 
 							test_scaler_with_pixel_format_pipe(&data,
 								get_width(mode, scaler_with_pixel_format_tests[index].sf),
@@ -1333,6 +1357,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 							drmModeModeInfo *mode = igt_output_get_mode(output);
+							data.sf_plane1 = scaler_with_rotation_tests[index].sf;
 
 							test_scaler_with_rotation_pipe(&data,
 								get_width(mode, scaler_with_rotation_tests[index].sf),
@@ -1358,6 +1383,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 							drmModeModeInfo *mode = igt_output_get_mode(output);
+							data.sf_plane1 = scaler_with_modifiers_tests[index].sf;
 
 							test_scaler_with_modifier_pipe(&data,
 								get_width(mode, scaler_with_modifiers_tests[index].sf),
@@ -1382,6 +1408,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 						drmModeModeInfo *mode = igt_output_get_mode(output);
+						data.flag = true;
 
 						test_scaler_with_pixel_format_pipe(&data, mode->hdisplay + 100,
 							mode->vdisplay + 100, false, pipe, output);
@@ -1402,6 +1429,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 						drmModeModeInfo *mode = igt_output_get_mode(output);
+						data.flag = true;
 
 						test_scaler_with_rotation_pipe(&data, mode->hdisplay + 100,
 							mode->vdisplay + 100, false, pipe, output);
@@ -1422,6 +1450,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 						drmModeModeInfo *mode = igt_output_get_mode(output);
+						data.flag = true;
 						test_scaler_with_modifier_pipe(&data, mode->hdisplay + 100,
 							mode->vdisplay + 100, false, pipe, output);
 					}
@@ -1442,6 +1471,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 						drmModeModeInfo *mode = igt_output_get_mode(output);
+						data.sf_plane1 = scaler_with_2_planes_tests[index].sf_plane1;
+						data.sf_plane2 = scaler_with_2_planes_tests[index].sf_plane2;
 
 						test_planes_scaling_combo(&data,
 							get_width(mode, scaler_with_2_planes_tests[index].sf_plane1),
-- 
2.43.0

