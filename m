Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E4FFC72A4
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 06:16:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBEF10E0DC;
	Mon, 20 Apr 2026 06:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jDFJQvHR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EE310E0DC
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 06:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776665785; x=1808201785;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YJ+6ma/Ebn03fJRciahEfd0ZJjZp4QyDj8suxRHySIY=;
 b=jDFJQvHRHsT1nYjA1Ans1IYwuyMYrCXS4o8JaBH5zFfycZ7G6rT3b82s
 IM4O2NRPwvAz6uQFhTmD252zEbGb8AV8tXCGGcHVEI4mH636onbIuPZP1
 Llw8Btw2VTiZcHkW13Ubr54RKVuI+8FrfCd5olG8lmUk2H3TK//4nVO7f
 xDYT2MJFHOIm/EJPx6eKRQ9hRv1E+hFYK6jevHc450YY8gUdN55mC5Y/m
 Ox19W8+uKYKazB9XHA7IeGU2tnYpoUKRGHWC6Rfdtb21lnw6UWD8sVhA6
 6OPv8ZKyKaM2y04SjHiI50hMsFQu8XaLtS9eHmuUWI7dYnk5Uq/jF9sbX g==;
X-CSE-ConnectionGUID: qUvSSK9xSl6pU63jsPxY8w==
X-CSE-MsgGUID: gi+T0JGfSryWTaTixRMfOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="100232033"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="100232033"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 23:16:24 -0700
X-CSE-ConnectionGUID: ryvUQPHfQ0S4J7mDezI/Cg==
X-CSE-MsgGUID: X0sbedPrSoWDb6HO85Q8Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="255111848"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 23:16:22 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, Karthik B S <karthik.b.s@intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t v3] tests/kms_bw: Allow custom modes for external panels
Date: Mon, 20 Apr 2026 11:42:31 +0530
Message-ID: <20260420061231.1952346-1-karthik.b.s@intel.com>
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

Currently, the test is rejecting outputs where the mode does not match.
This is leading to excessive skips on configs where the tests
were passing previously.

Instead of this, use default mode for fixed-mode panels if the required
custom mode is not found, and use custom mode for external panels as
these are allowed and have also been passing previously.

v2: Fixes in output_supported_mode (Kunal)
    Add description to call out fixed-mode on internal panels (Kunal)

v3: Fix documentation issue on compilation.

Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Tested-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 tests/kms_bw.c | 82 +++++++++++++++++++++++++++++++++++---------------
 1 file changed, 58 insertions(+), 24 deletions(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 4df5c2cee..fea7d9d38 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -35,7 +35,7 @@
 #include <xf86drmMode.h>
 
 /**
- * SUBTEST: linear-tiling-%d-displays-%s
+ * SUBTEST: linear-tiling-%d-displays-target-%s
  * Description: bw test with %arg[2]
  *
  * arg[1].values: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
@@ -47,7 +47,7 @@
  * @3840x2160p:       3840x2160 resolution
  * @2160x1440p:       2160x1440 resolution
  *
- * SUBTEST: connected-linear-tiling-%d-displays-%s
+ * SUBTEST: connected-linear-tiling-%d-displays-target-%s
  * Description: bw test with %arg[2]
  *
  * arg[1].values: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
@@ -186,14 +186,16 @@ static void force_output_mode(data_t *d, igt_output_t *output,
 	igt_output_override_mode(output, mode);
 }
 
-static bool output_mode_supported(igt_output_t *output, const drmModeModeInfo *mode)
+/* Check if output has a matching mode and call it out if mode is being forced */
+static void log_output_mode_support(igt_output_t *output, const drmModeModeInfo *mode)
 {
 	drmModeConnector *connector = output->config.connector;
+	drmModeModeInfo *default_mode;
 	int i;
 
 	/* Virtual/forced sinks support all modes */
 	if (!igt_output_is_connected(output))
-		return true;
+		return;
 
 	for (i = 0; i < connector->count_modes; i++) {
 		drmModeModeInfo *conn_mode = &connector->modes[i];
@@ -204,26 +206,33 @@ static bool output_mode_supported(igt_output_t *output, const drmModeModeInfo *m
 			igt_debug("Found matching mode for %dx%d@%dHz on %s\n",
 				  mode->hdisplay, mode->vdisplay, mode->vrefresh,
 				  igt_output_name(output));
-			return true;
+			return;
 		}
 	}
 
-	igt_info("Mode %dx%d@%dHz not supported by %s (has %d modes)\n",
-		 mode->hdisplay, mode->vdisplay, mode->vrefresh,
-		 igt_output_name(output), connector->count_modes);
-
-	return false;
+	if (output_is_internal_panel(output)) {
+		default_mode = igt_output_get_mode(output);
+		igt_info("Mode %dx%d@%dHz not supported by %s (has %d modes).\n"
+			 "%s Default mode: %dx%d@%dHz\n",
+			 mode->hdisplay, mode->vdisplay, mode->vrefresh,
+			 igt_output_name(output), connector->count_modes, igt_output_name(output),
+			 default_mode->hdisplay, default_mode->vdisplay, default_mode->vrefresh);
+	} else {
+		igt_info("Mode %dx%d@%dHz not supported by %s (has %d modes). Forcing mode.\n",
+			 mode->hdisplay, mode->vdisplay, mode->vrefresh,
+			 igt_output_name(output), connector->count_modes);
+	}
 }
 
 static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeInfo *mode, bool physical) {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
+	drmModeModeInfo fb_mode;
 	struct igt_fb buffer[IGT_MAX_PIPES];
 	igt_crc_t zero, captured[IGT_MAX_PIPES];
 	int i = 0, num_pipes = 0;
 	igt_crtc_t *crtc;
 	int ret;
-	bool has_supported_mode = false;
 
 	/* Cannot use igt_display_n_crtcs() due to fused pipes on i915 where they do
 	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
@@ -242,14 +251,28 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
 		crtc = data->crtc[i];
 
 		output = physical ? data->connected_output[i] : data->output[i];
-		if (!output || !output_mode_supported(output, mode)) {
+		if (!output)
 			continue;
-		}
 
-		force_output_mode(data, output, mode);
+		log_output_mode_support(output, mode);
+
+		/*
+		 * On fixed mode panels trying to force a custom mode can lead
+		 * to failures or implicit handling where the default mode is
+		 * used even though custom mode is requested.
+		 *
+		 * To avoid this use default mode on fixed mode panels and
+		 * use custom modes only on external panels.
+		 */
+		if (output_is_internal_panel(output)) {
+			fb_mode = *igt_output_get_mode(output);
+		} else {
+			force_output_mode(data, output, mode);
+			fb_mode = *mode;
+		}
 
-		igt_create_color_fb(display->drm_fd, mode->hdisplay,
-				    mode->vdisplay, DRM_FORMAT_XRGB8888,
+		igt_create_color_fb(display->drm_fd, fb_mode.hdisplay,
+				    fb_mode.vdisplay, DRM_FORMAT_XRGB8888,
 				    DRM_FORMAT_MOD_LINEAR, 1.f, 0.f, 0.f,
 				    &buffer[i]);
 
@@ -258,10 +281,8 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
 		igt_plane_set_fb(data->primary[i], &buffer[i]);
 		igt_info("Assigning pipe %s to output %s with mode %s\n",
 			 igt_crtc_name(crtc), igt_output_name(output),
-			 mode->name);
-		has_supported_mode = true;
+			 fb_mode.name);
 	}
-	igt_skip_on_f(!has_supported_mode, "Unsupported mode for all pipes\n");
 
 	ret = igt_display_try_commit_atomic(display,
 					    DRM_MODE_ATOMIC_ALLOW_MODESET |
@@ -273,9 +294,8 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
 
 	for (i = 0; i < n_crtcs; i++) {
 		output = physical ? data->connected_output[i] : data->output[i];
-		if (!output || !output_mode_supported(output, mode)) {
+		if (!output)
 			continue;
-		}
 
 		igt_pipe_crc_collect_crc(data->pipe_crc[i], &captured[i]);
 		igt_assert_f(!igt_check_crc_equal(&zero, &captured[i]),
@@ -284,7 +304,7 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
 
 	for (i = n_crtcs - 1; i >= 0; i--) {
 		output = physical ? data->connected_output[i] : data->output[i];
-		if (!output || !output_mode_supported(output, mode))
+		if (!output)
 			continue;
 
 		igt_remove_fb(display->drm_fd, &buffer[i]);
@@ -319,7 +339,14 @@ int igt_main()
 		n_crtcs = i + 1;
 
 		for (j = 0; j < ARRAY_SIZE(test_mode); j++) {
-			igt_subtest_f("linear-tiling-%d-displays-%s", n_crtcs, test_mode[j].name)
+			igt_describe("Exercise bandwidth test using linear tiling across multiple pipes "
+				     "on a combination of phical and/or virtual outputs."
+				     "The test targets a bandwidth configuration corresponding to the "
+				     "requested mode, forcing the mode on external or virtual outputs"
+				     "(where supported).On fixed-mode internal panels, if the native mode "
+				     "is used even if it does not match the requested mode.");
+			igt_subtest_f("linear-tiling-%d-displays-target-%s",
+				      n_crtcs, test_mode[j].name)
 				run_test_linear_tiling(&data, n_crtcs, &test_mode[j], false);
 		}
 	}
@@ -328,7 +355,14 @@ int igt_main()
 		n_crtcs = i + 1;
 
                 for (j = 0; j < ARRAY_SIZE(test_mode); j++) {
-                        igt_subtest_f("connected-linear-tiling-%d-displays-%s", n_crtcs, test_mode[j].name)
+			igt_describe("Exercise bandwidth test using linear tiling across multiple pipes "
+				     "on physically connected outputs only."
+				     "The test targets a bandwidth configuration corresponding to the "
+				     "requested mode, forcing the mode on external panels."
+				     "On fixed-mode internal panels, if the native mode "
+				     "is used even if it does not match the requested mode.");
+			igt_subtest_f("connected-linear-tiling-%d-displays-target-%s",
+				      n_crtcs, test_mode[j].name)
 				run_test_linear_tiling(&data, n_crtcs, &test_mode[j], true);
                 }
         }
-- 
2.43.0

