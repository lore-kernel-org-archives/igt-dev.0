Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64AECD98D2
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 21:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFD010E83E;
	Tue, 16 Jun 2026 21:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NJbUl+dL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E33810E83E
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 21:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781644280; x=1813180280;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZNfd6CMTSRvd8GVYq7XSI9GAYiHA5B7zL8/3dVFxC/g=;
 b=NJbUl+dL4OJzZGA0Wo8DDl3fselt2uoSzwLDUuHqckWVPP18ukBxvC60
 Sv5Pta0fyr8X6qQ6pMrM1Acw3CjZ2fOJMnxG8EQbP7Bf7Btes581VkdS2
 zm8aMMIFCFbyyybdsRw+AcB2Y1yDubKAKF45sNK5bKUmIj8um8m75osUQ
 XvMm9q4pEsCeVKUKkSKa3xwffOu+Q8aBgvUhgZd37POnpuCLkAqIEL0u8
 +mELYZNv97Q/u+BVSn+ZUv2AmtXbUmzCUBqx3rGD05zbwbSnU8eCuBlem
 r/9h9HXMkyp0Xo4eS6PM3cpSAL9yleOcqUosJvxi0Ahe+hEtfSYQtAjsL w==;
X-CSE-ConnectionGUID: e7Lw684RRZuL/XN3LF/hZg==
X-CSE-MsgGUID: mqRwLZUPRnCC7MGWlfr6kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="107867833"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="107867833"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 14:11:20 -0700
X-CSE-ConnectionGUID: 9DQ6QgiGRfCoEU4uCC8Iaw==
X-CSE-MsgGUID: 9y2sJgkVT4Oa5RaFEwEN0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="243720602"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.223.55.75])
 by fmviesa010.fm.intel.com with ESMTP; 16 Jun 2026 14:11:18 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com,
	Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_rpm: Test video playback across
 suspend/resume cycle
Date: Wed, 17 Jun 2026 02:31:08 +0530
Message-ID: <20260616210109.21172-1-mohammed.thasleem@intel.com>
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

This test simulate video playback using multiple-buffer page-flip rotation,
suspend to idle (S0ix/FREEZE), resume, and verify that the display pipeline
and frame flipping are correctly restored.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_rpm.c | 179 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 60d0b2792..a4015516b 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -132,6 +132,11 @@
  * SUBTEST: system-suspend-idle
  * Description: Validate suspend-to-idle (S0ix) functionality.
  *
+ * SUBTEST: system_suspend_idle_vpb_simulation
+ * Description: Simulate video playback using multiple-buffer page-flip rotation,
+ *              suspend to idle (S0ix/FREEZE), resume, and verify that the
+ *              display pipeline and frame flipping are correctly restored.
+ *
  * SUBTEST: package-g7
  * Description: Validate the package-g7 residency.
  */
@@ -176,6 +181,10 @@ static const struct {
 	{3840, 2160, 144, "4K@144"},
 };
 
+typedef struct {
+	double r, g, b;
+} color_t;
+
 /* Wait flags */
 #define DONT_WAIT	0
 #define WAIT_STATUS	1
@@ -198,6 +207,7 @@ struct mode_set_data {
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
 	struct igt_fb fb_white;
+	struct igt_fb fb_frame[3];
 	uint32_t devid;
 	int fw_fd;
 };
@@ -1720,6 +1730,172 @@ static void test_package_g7(void)
 	cleanup();
 }
 
+static void paint_rectangles(drmModeModeInfo *mode,
+			     color_t *colors,
+			     igt_fb_t *fb)
+{
+	cairo_t *cr = igt_get_cairo_ctx(drm_fd, fb);
+	int i, l = mode->hdisplay / 3;
+	int rows_remaining = mode->hdisplay % 3;
+
+	/* Paint 3 rectangles. */
+	for (i = 0; i < 3; i++) {
+		igt_paint_color(cr, i * l, 0, l, mode->vdisplay,
+				colors[i].r, colors[i].g, colors[i].b);
+	}
+
+	if (rows_remaining > 0)
+		igt_paint_color(cr, i * l, 0, rows_remaining, mode->vdisplay,
+				colors[i - 1].r, colors[i - 1].g,
+				colors[i - 1].b);
+
+	igt_put_cairo_ctx(cr);
+}
+
+static void create_color_fb(struct mode_set_data *data,
+			    igt_fb_t *fb,
+			    color_t *fb_color)
+{
+	int fb_id;
+
+	fb_id = igt_create_fb(drm_fd,
+			      data->mode->hdisplay,
+			      data->mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR,
+			      fb);
+	igt_assert(fb_id);
+	paint_rectangles(data->mode, fb_color, fb);
+}
+
+static void setup_videoplayback(struct mode_set_data *data)
+{
+	color_t red_green_blue[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 },
+	};
+	color_t red_green_red[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 1.0, 0.0, 0.0 },
+	};
+	color_t blue_red_green[] = {
+		{ 0.0, 0.0, 1.0 },
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+	};
+
+	create_color_fb(data, &data->fb_frame[0], red_green_blue);
+	create_color_fb(data, &data->fb_frame[1], red_green_red);
+	create_color_fb(data, &data->fb_frame[2], blue_red_green);
+}
+
+static void cleanup_videoplayback(struct mode_set_data *data)
+{
+	int i;
+
+	igt_plane_set_fb(data->primary, NULL);
+	igt_output_set_crtc(data->output, NULL);
+	igt_display_commit(&data->display);
+
+	for (i = 0; i < 3; i++) {
+		if (data->fb_frame[i].fb_id)
+			igt_remove_fb(drm_fd, &data->fb_frame[i]);
+	}
+}
+
+static void run_videoplayback_loop(struct mode_set_data *data)
+{
+	int delay;
+	int frame = 0;
+	time_t secs = 6;
+	time_t start = time(NULL);
+
+	igt_require(data->primary);
+	igt_require(data->mode);
+
+	/* One frame period in microseconds convention */
+	delay = (1000 * 1000) / data->mode->vrefresh;
+
+	while (time(NULL) - start < secs) {
+		igt_plane_set_fb(data->primary, &data->fb_frame[frame % 3]);
+		igt_display_commit(&data->display);
+		usleep(delay);
+		frame++;
+	}
+}
+
+static void configure_output(struct mode_set_data *data)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	bool found = false;
+	igt_crtc_t *crtc;
+
+	/* If output is already configured, use it */
+	if (data->output && data->mode && data->primary)
+		return;
+
+	for_each_crtc_with_valid_output(display, crtc, output) {
+		drmModeConnectorPtr c = output->config.connector;
+
+		if (c->connector_type == DRM_MODE_CONNECTOR_eDP) {
+			igt_output_set_crtc(output, crtc);
+			if (!intel_pipe_output_combo_valid(display))
+				continue;
+
+			found = true;
+			break;
+		}
+	}
+
+	/* Fallback to any connected output */
+	if (!found) {
+		for_each_crtc_with_valid_output(display, crtc, output) {
+			igt_output_set_crtc(output, crtc);
+			if (!intel_pipe_output_combo_valid(display))
+				continue;
+
+			found = true;
+			break;
+		}
+	}
+
+	if (found) {
+		data->output = output;
+		data->mode = igt_output_get_mode(output);
+		data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	}
+}
+
+static void system_suspend_idle_vpb_simulation(int suspend_state,
+					       int suspend_test)
+{
+	igt_require_f(default_mode_params,
+		      "No connected output available for video-playback-suspend-idle\n");
+
+	configure_output(&ms_data);
+	setup_output_fb();
+
+	/* Create video playback framebuffers */
+	setup_videoplayback(&ms_data);
+
+	/* Pre-suspend video playback simulation */
+	igt_info("Running pre-suspend video playback...\n");
+	run_videoplayback_loop(&ms_data);
+
+	/* Suspend/resume cycle */
+	igt_info("Performing suspend/resume cycle...\n");
+	igt_system_suspend_autoresume(suspend_state, suspend_test);
+
+	/* Post-resume video playback simulation */
+	igt_info("Running post-resume video playback...\n");
+	run_videoplayback_loop(&ms_data);
+
+	cleanup_videoplayback(&ms_data);
+}
+
 int rounds = 10;
 bool stay = false;
 
@@ -1835,6 +2011,9 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 	igt_subtest("system-suspend-idle")
 		system_suspend_modeset_subtest(SUSPEND_STATE_FREEZE,
 					       SUSPEND_TEST_NONE);
+	igt_subtest("system_suspend_idle_vpb_simulation")
+		 system_suspend_idle_vpb_simulation(SUSPEND_STATE_FREEZE,
+						    SUSPEND_TEST_NONE);
 
 	/* power-wake reference tests */
 	igt_subtest("pm-tiling") {
-- 
2.43.0

