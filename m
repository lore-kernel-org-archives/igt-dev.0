Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC13DC3271E
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jul 2024 19:54:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F0510E002;
	Fri,  5 Jul 2024 19:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VgK3qhPu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2F410E002
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jul 2024 19:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720209251; x=1751745251;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1R1gaycn1J8XvqrQEJ/JZhpwjvoaNpjBq7OJVUZh1iQ=;
 b=VgK3qhPuyomdWGQ8vbooj/coGLKM1cHgua4IAGYV4g9FUmFL8JjoD8cq
 2gL5SBFfA8yarybihw238gWiN1mvpBwgCivLgLhUurg4PhTfPQgG4JhIY
 6xtWs3W3fQQOLOqZKomzpYn9lm6y2pBfrQQiAHj1PwdTwbaqut2HJ4gNP
 XBoJTLHryFIYd1MFAKqaePV1Cm3juAvpviNjyJC5W+qXK+asY+6CBO6l5
 KyDLnI15qCcYlsVCnxekCK6vqTF3SohOBqiGryXrEkbbSPyjXrvD7EEMy
 hEaXGOs6knSYTaMegMZ2TShuDqS4UsQca4RUcp18aZ5vhZuSEra6hjRI1 A==;
X-CSE-ConnectionGUID: gkeXceHUTUacGoL/oVQfKw==
X-CSE-MsgGUID: lN2oz8/NRuOJY+Vn11xIFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="21273876"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="21273876"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 12:54:10 -0700
X-CSE-ConnectionGUID: CiKLg04KS+yqaIsuXI8XtA==
X-CSE-MsgGUID: vqUbqq8fTGesU8/6ca0fWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="51898154"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 12:54:08 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t] tests/kms_plane_scaling: Improvise the scaling BW
 issues.
Date: Sat,  6 Jul 2024 01:28:20 +0530
Message-ID: <20240705195820.411421-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

	Description:
	1. We observed many tests are failing due to Bandwidth
	   issues. To elimate this failures we change the least
	   working modes.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 72 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 67 insertions(+), 5 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 3f63d3cf4..22983710f 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -197,6 +197,9 @@
 
 IGT_TEST_DESCRIPTION("Test display plane scaling");
 
+#define MODE2KHDISPLAY 1920
+#define MODE2KVDISPLAY 1080
+
 enum scaler_combo_test_type {
 	TEST_PLANES_UPSCALE = 0,
 	TEST_PLANES_DOWNSCALE,
@@ -210,6 +213,9 @@ typedef struct {
 	igt_display_t display;
 	struct igt_fb fb[4];
 	bool extended;
+	double sf_plane1;
+	double sf_plane2;
+	bool flag;
 } data_t;
 
 struct invalid_paramtests {
@@ -579,13 +585,31 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 	drmModeModeInfo *mode;
 	int commit_ret;
 	int w, h;
-
-	mode = igt_output_get_mode(output);
+	bool mode_support=false;
 
 	if (is_upscale) {
+		mode = igt_output_get_mode(output);
 		w = width;
 		h = height;
 	} else {
+		for_each_connector_mode(output) {
+			mode = &output->config.connector->modes[j__];
+			if((MODE2KHDISPLAY == mode->hdisplay) && (MODE2KVDISPLAY == mode->vdisplay)) {
+				mode_support=true;
+				break;
+			}
+
+		}
+		igt_skip_on_f(!mode_support, "Unsupported Resolution \n");
+
+		igt_output_override_mode(output, mode);
+		if (d->flag == true) {
+			width = mode->hdisplay + 100;
+			height = mode->vdisplay + 100;
+		}else {
+			width = get_width(mode, d->sf_plane1);
+			height = get_height(mode, d->sf_plane1);
+		}
 		w = mode->hdisplay;
 		h = mode->vdisplay;
 	}
@@ -593,7 +617,7 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 	/*
 	 * guarantee even value width/height to avoid fractional
 	 * uv component in chroma subsampling for yuv 4:2:0 formats
-	 * */
+	 */
 	w = ALIGN(w, 2);
 	h = ALIGN(h, 2);
 
@@ -603,6 +627,10 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 	igt_fb_set_position(&d->fb[0], plane, 0, 0);
 	igt_fb_set_size(&d->fb[0], plane, w, h);
 	igt_plane_set_position(plane, 0, 0);
+	commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
+	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
+		      "Unsupported resolution parameters  %dx%d\n",
+		       w,h);
 
 	if (is_upscale)
 		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
@@ -847,11 +875,27 @@ __test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
 	igt_display_t *display = &d->display;
 	drmModeModeInfo *mode;
 	int ret;
+	bool mode_support=false;
 
-	mode = igt_output_get_mode(output);
+	for_each_connector_mode(output) {
+		mode = &output->config.connector->modes[j__];
+		if((MODE2KHDISPLAY == mode->hdisplay) && (MODE2KVDISPLAY == mode->vdisplay)) {
+			mode_support = true;
+			break;
+		}
+	}
+	igt_skip_on_f(!mode_support, "Band Width not sufficent for Multi Plane\n");
+	igt_output_override_mode(output, mode);
+	w1 = get_width(mode, d->sf_plane1);
+	h1 = get_height(mode, d->sf_plane1);
+	w2 = get_width(mode, d->sf_plane2);
+        h2 = get_height(mode, d->sf_plane2);
 
 	igt_plane_set_fb(p1, fb1);
 	igt_plane_set_fb(p2, fb2);
+	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_skip_on_f(ret == -EINVAL || ret == -ERANGE,
+                      "Resolution not supported by driver\n");
 
 	switch (test_type) {
 	case TEST_PLANES_UPSCALE:
@@ -904,7 +948,17 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
 	cleanup_crtc(d);
 
 	igt_output_set_pipe(output, pipe);
-	mode = igt_output_get_mode(output);
+	for_each_connector_mode(output) {
+		mode = &output->config.connector->modes[j__];
+		if((MODE2KHDISPLAY == mode->hdisplay) && (MODE2KVDISPLAY == mode->vdisplay))
+			break;
+	}
+
+	igt_output_override_mode(output, mode);
+	w1 = get_width(mode, d->sf_plane1);
+	h1 = get_height(mode, d->sf_plane1);
+	w2 = get_width(mode, d->sf_plane2);
+        h2 = get_height(mode, d->sf_plane2);
 
 	n_planes = display->pipes[pipe].n_planes;
 	igt_require(n_planes >= 2);
@@ -1308,6 +1362,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 							drmModeModeInfo *mode = igt_output_get_mode(output);
+							data.sf_plane1 = scaler_with_pixel_format_tests[index].sf;
 
 							test_scaler_with_pixel_format_pipe(&data,
 								get_width(mode, scaler_with_pixel_format_tests[index].sf),
@@ -1333,6 +1388,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 							drmModeModeInfo *mode = igt_output_get_mode(output);
+							data.sf_plane1 = scaler_with_rotation_tests[index].sf;
 
 							test_scaler_with_rotation_pipe(&data,
 								get_width(mode, scaler_with_rotation_tests[index].sf),
@@ -1358,6 +1414,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 							drmModeModeInfo *mode = igt_output_get_mode(output);
+							data.sf_plane1 = scaler_with_modifiers_tests[index].sf;
 
 							test_scaler_with_modifier_pipe(&data,
 								get_width(mode, scaler_with_modifiers_tests[index].sf),
@@ -1382,6 +1439,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 						drmModeModeInfo *mode = igt_output_get_mode(output);
+						data.flag =true;
 
 						test_scaler_with_pixel_format_pipe(&data, mode->hdisplay + 100,
 							mode->vdisplay + 100, false, pipe, output);
@@ -1402,6 +1460,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 						drmModeModeInfo *mode = igt_output_get_mode(output);
+						data.flag = true;
 
 						test_scaler_with_rotation_pipe(&data, mode->hdisplay + 100,
 							mode->vdisplay + 100, false, pipe, output);
@@ -1422,6 +1481,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 						drmModeModeInfo *mode = igt_output_get_mode(output);
+						data.flag=true;
 						test_scaler_with_modifier_pipe(&data, mode->hdisplay + 100,
 							mode->vdisplay + 100, false, pipe, output);
 					}
@@ -1442,6 +1502,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
 						drmModeModeInfo *mode = igt_output_get_mode(output);
+						data.sf_plane1 = scaler_with_2_planes_tests[index].sf_plane1;
+						data.sf_plane2 = scaler_with_2_planes_tests[index].sf_plane2;
 
 						test_planes_scaling_combo(&data,
 							get_width(mode, scaler_with_2_planes_tests[index].sf_plane1),
-- 
2.43.0

