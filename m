Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5B3EDB7E5
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 09:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B01110E3B1;
	Tue,  7 Apr 2026 09:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wn25jJnv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E28510E3B1
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 09:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775555788; x=1807091788;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Nn85xqu2NonS6CADBnsJIxRXyAGIRIsATugxEk6crOI=;
 b=Wn25jJnvhdk2SMyz4kZjxFTawh8NQT1vxOLeuack1hw8kl4SWSIpItnU
 2f6+wLtO49hvrX1HajofDOkJ1Xj5vbxAtR3qqfpLc7+OpTVuHSY7nkVmD
 YRMxkRfOZ2m2RvzOo5wk4PlwdLcbUMyHC/1kPQiay0kMQomYZDxdlbEX8
 pbvdLOfTmxvpc3KPMRSl8Ft+6KIUY1pZWKA2DvcU9h5drrXwXhy8UoClF
 3vc2hTnibkZOvM9LvwTMmumB8g3hzOH9CkmQyrxINp1cFkeparL0tNgM+
 Z0vO4CsIKKlXeu9jvSjfjeBlPgxMk9/eBP1bW3rmPP4UZFOJCvmcttRit w==;
X-CSE-ConnectionGUID: gHe1mkovScyauAK21+YwBg==
X-CSE-MsgGUID: GVJBvJ6WSvC6z6JhTfAEUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76411527"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76411527"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 02:56:28 -0700
X-CSE-ConnectionGUID: c328PblPSmi36aIMeX2QnA==
X-CSE-MsgGUID: PlMgE1AxT42UleTYvJscqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="232529019"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 02:56:26 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t] tests/kms_bw: Allow custom modes for external panels
Date: Tue,  7 Apr 2026 15:22:34 +0530
Message-ID: <20260407095234.1728691-1-karthik.b.s@intel.com>
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

Currently the test is rejecting all the outputs where the mode is not
matching. This is leading to excessive skips on configs wherer the tests
were passing previouly.

Instead of this, use default mode for fixed mode panels if the required
custom mode is not found. And use custom mode for external panels as
these are allowed and have also been passing previously.

Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_bw.c | 57 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 20 deletions(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 4df5c2cee..4a32ec811 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -186,14 +186,16 @@ static void force_output_mode(data_t *d, igt_output_t *output,
 	igt_output_override_mode(output, mode);
 }
 
-static bool output_mode_supported(igt_output_t *output, const drmModeModeInfo *mode)
+/* Check if output has a matching mode and call it out if mode is being forced */
+static void output_mode_supported(igt_output_t *output, const drmModeModeInfo *mode)
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
@@ -204,26 +206,32 @@ static bool output_mode_supported(igt_output_t *output, const drmModeModeInfo *m
 			igt_debug("Found matching mode for %dx%d@%dHz on %s\n",
 				  mode->hdisplay, mode->vdisplay, mode->vrefresh,
 				  igt_output_name(output));
-			return true;
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
@@ -242,14 +250,26 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
 		crtc = data->crtc[i];
 
 		output = physical ? data->connected_output[i] : data->output[i];
-		if (!output || !output_mode_supported(output, mode)) {
+		if (!output)
 			continue;
-		}
 
-		force_output_mode(data, output, mode);
+		output_mode_supported(output, mode);
+
+		/*
+		 * On fixed mode panels trying to force a custom mode can lead to failures or
+		 * implicit handling where the default mode is used even though custom mode is requested.
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
 
@@ -258,10 +278,8 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
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
@@ -273,9 +291,8 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
 
 	for (i = 0; i < n_crtcs; i++) {
 		output = physical ? data->connected_output[i] : data->output[i];
-		if (!output || !output_mode_supported(output, mode)) {
+		if (!output)
 			continue;
-		}
 
 		igt_pipe_crc_collect_crc(data->pipe_crc[i], &captured[i]);
 		igt_assert_f(!igt_check_crc_equal(&zero, &captured[i]),
@@ -284,7 +301,7 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
 
 	for (i = n_crtcs - 1; i >= 0; i--) {
 		output = physical ? data->connected_output[i] : data->output[i];
-		if (!output || !output_mode_supported(output, mode))
+		if (!output)
 			continue;
 
 		igt_remove_fb(display->drm_fd, &buffer[i]);
-- 
2.43.0

