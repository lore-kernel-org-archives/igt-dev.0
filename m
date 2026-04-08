Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A5C10F9972
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 20:23:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200DC10E3BE;
	Wed,  8 Apr 2026 20:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YERJSz9m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FA210E260
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 20:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775679685; x=1807215685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kFvo0AA+XkV1G70mb1IZSaljXwwjMXI2oIHWEL1EvPw=;
 b=YERJSz9mzv/jjBZPjQy27kobEUT/xPWZljfBpw8iD9Ixa+QgMjEbrMu0
 mfy3eoypD/uTmSyu2Ty2q8/tRuOC+uYuhc+IptIBY2O+sOIAyukyeiFGq
 oCnIObSl2zCIITuW54zOm7KBfDx+9vRnjoj8EdroJVJdkYCWtNvPxwGpx
 X0J+xFvdoxaU/kt2TzkP+Q6sKmf1oCANCBTvSWQxLeeOdM9/wMeFQfCxV
 nN0vMjgNnVe5XFnNs49VDTvcDQKXiAK3pSZQmmoMid8Se0LKF+gCDzK9m
 qRMw8clGhf/bHeWgkafFBIL+HpvcOEocnzFqs17rL1VxaeTB334gvTeuB w==;
X-CSE-ConnectionGUID: Z0RDfg9PRQCmJHbMs4CjVg==
X-CSE-MsgGUID: GZ1mB3Z7QO+Ga5a/E1iApw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="75713373"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="75713373"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 13:21:25 -0700
X-CSE-ConnectionGUID: jReXZbOESi2ywRhaIlHbJg==
X-CSE-MsgGUID: XdiX1PuuTlSsV2FaH9BDlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="223810486"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 13:21:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 1/7] lib/kms: pass mode parameter to
 for_each_connector_mode()
Date: Wed,  8 Apr 2026 23:21:07 +0300
Message-ID: <0f11189bfbc9cf01ea2977e54569e57a7e569e16.1775679624.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775679624.git.jani.nikula@intel.com>
References: <cover.1775679624.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Add enumerated mode parameter to for_each_connector_mode() to simplify
the loop usage, and avoid the dodgy implicit j__ usage in the loops.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 benchmarks/kms_fb_stress.c              |  3 +--
 lib/igt_kms.c                           | 10 ++++++----
 lib/igt_kms.h                           |  7 +++++--
 tests/intel/kms_dp_linktrain_fallback.c |  5 +++--
 tests/intel/kms_pm_dc.c                 |  5 +++--
 tests/intel/kms_pm_lpsp.c               |  4 +---
 tests/kms_plane.c                       | 10 +++++-----
 tests/kms_plane_scaling.c               |  6 ++----
 8 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/benchmarks/kms_fb_stress.c b/benchmarks/kms_fb_stress.c
index d9501ffd2fe6..f63490ce40da 100644
--- a/benchmarks/kms_fb_stress.c
+++ b/benchmarks/kms_fb_stress.c
@@ -92,8 +92,7 @@ static void set_crtc_size(struct data_t *data)
 	drmModeModeInfo *mode;
 	struct rect_t *crtc = &data->kms.crtc;
 
-	for_each_connector_mode(data->wb_output) {
-		mode = &data->wb_output->config.connector->modes[j__];
+	for_each_connector_mode(data->wb_output, mode) {
 		if (mode->hdisplay == crtc->width && mode->vdisplay == crtc->height) {
 			igt_output_override_mode(data->wb_output, mode);
 			return;
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 04b1f3972307..2dbf9ec38458 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5361,16 +5361,17 @@ bool __override_all_active_output_modes_to_fit_bw(igt_display_t *display,
 						  int base)
 {
 	igt_output_t *output = NULL;
+	drmModeModeInfo *mode;
 
 	if (base >= n_outputs)
 		return false;
 
 	output = outputs[base];
 
-	for_each_connector_mode(output) {
+	for_each_connector_mode(output, mode) {
 		int ret;
 
-		igt_output_override_mode(output, &output->config.connector->modes[j__]);
+		igt_output_override_mode(output, mode);
 
 		if (__override_all_active_output_modes_to_fit_bw(display, outputs, n_outputs, base + 1))
 			return true;
@@ -6791,11 +6792,12 @@ bool igt_max_bpc_constraint(igt_display_t *display, igt_crtc_t *crtc,
 			    igt_output_t *output, int bpc)
 {
 	drmModeConnector *connector = output->config.connector;
+	drmModeModeInfo *mode;
 
 	igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
 
-	for_each_connector_mode(output) {
-		igt_output_override_mode(output, &connector->modes[j__]);
+	for_each_connector_mode(output, mode) {
+		igt_output_override_mode(output, mode);
 
 		if (is_intel_device(display->drm_fd) &&
 		    !igt_check_bigjoiner_support(display))
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index f994d91d3aa0..9a3fa980d89d 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -802,12 +802,15 @@ igt_output_crtc_t *__igt_output_crtc_populate(igt_display_t *display,
 /**
  * for_each_connector_mode:
  * @output: Output to enumerate available modes.
+ * @mode: The enumerated mode.
  *
  * This for loop iterates over all modes associated to the given @output.
  * If there are no mode available for this output, nothing happens.
  */
-#define for_each_connector_mode(output)		\
-	for (int j__ = 0;  j__ < output->config.connector->count_modes; j__++)
+#define for_each_connector_mode(output, mode) \
+	for ((mode) = &(output)->config.connector->modes[0]; \
+	     (mode) < &(output)->config.connector->modes[(output)->config.connector->count_modes]; \
+	     (mode)++)
 
 #define IGT_FIXED(i,f)	((i) << 16 | (f))
 
diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 91dde2a7dcee..c09e9ce36928 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -464,6 +464,7 @@ static void test_dsc_sst_fallback(data_t *data)
 	int ret;
 	struct udev_monitor *mon;
 	drmModeModeInfo *mode_to_check;
+	drmModeModeInfo *mode;
 	igt_output_t *outputs[IGT_MAX_PIPES];
 	int output_count = 0;
 
@@ -475,8 +476,8 @@ static void test_dsc_sst_fallback(data_t *data)
 	igt_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
 
 	/* Find a mode that doesn't require DSC initially */
-	for_each_connector_mode(data->output) {
-		data->mode = &data->output->config.connector->modes[j__];
+	for_each_connector_mode(data->output, mode) {
+		data->mode = mode;
 		igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
 				    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
 				    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 39d00bb6e620..8138933d43b1 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -548,6 +548,7 @@ static void test_deep_pkgc_state(data_t *data)
 	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
 	igt_output_t *output = NULL;
+	drmModeModeInfo *mode;
 
 	for_each_crtc_with_valid_output(display, crtc, output) {
 		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
@@ -577,8 +578,8 @@ static void test_deep_pkgc_state(data_t *data)
 	igt_display_reset(display);
 
 	igt_output_set_crtc(output, crtc);
-	for_each_connector_mode(output) {
-		data->mode = &output->config.connector->modes[j__];
+	for_each_connector_mode(output, mode) {
+		data->mode = mode;
 		delay = (MSEC / (data->mode->vrefresh));
 		/*
 		 * Should be 5ms vblank time required to program higher
diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index b0f79124e9e5..6d4e64da01fe 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -166,9 +166,7 @@ static bool test_constraint(data_t *data)
 		return false;
 
 	if (igt_bigjoiner_possible(data->drm_fd, mode, max_dotclock)) {
-		for_each_connector_mode(data->output) {
-			mode = &data->output->config.connector->modes[j__];
-
+		for_each_connector_mode(data->output, mode) {
 			if (igt_bigjoiner_possible(data->drm_fd, mode, max_dotclock))
 				continue;
 
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 502985f2353c..7962c733a671 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -505,6 +505,7 @@ test_plane_panning(data_t *data, igt_crtc_t *crtc)
 	uint64_t mem_size = 0;
 	igt_output_t *output = data->output;
 	igt_crc_t ref_crc;
+	drmModeModeInfo *mode;
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
 		 igt_crtc_name(crtc), igt_output_name(output));
@@ -530,17 +531,16 @@ test_plane_panning(data_t *data, igt_crtc_t *crtc)
 		}
 	}
 
-	for_each_connector_mode(output) {
-		drmModeModeInfo *m = &output->config.connector->modes[j__];
-		uint32_t fb_size = m->hdisplay * m->vdisplay * 4;
+	for_each_connector_mode(output, mode) {
+		uint32_t fb_size = mode->hdisplay * mode->vdisplay * 4;
 
 		/* test allocates 2 double-dim fbs, add one more, to be safe */
 		if (mem_size && 3 * 4 * fb_size > mem_size) {
-			igt_debug("Skipping mode %s due to low memory\n", m->name);
+			igt_debug("Skipping mode %s due to low memory\n", mode->name);
 			continue;
 		}
 
-		igt_output_override_mode(output, m);
+		igt_output_override_mode(output, mode);
 		mode_found = true;
 		break;
 	}
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 8d34619b328f..0941dcb4eb05 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -585,8 +585,7 @@ check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 	int w, h;
 	int width, height;
 
-	for_each_connector_mode(output) {
-		mode = &output->config.connector->modes[j__];
+	for_each_connector_mode(output, mode) {
 		igt_output_override_mode(output, mode);
 		igt_debug("Trying mode %dx%d\n",
 			  mode->hdisplay, mode->vdisplay);
@@ -946,8 +945,7 @@ test_planes_scaling_combo(data_t *d, double sf_plane1,
 	cleanup_crtc(d);
 
 	igt_output_set_crtc(output, crtc);
-	for_each_connector_mode(output) {
-		mode = &output->config.connector->modes[j__];
+	for_each_connector_mode(output, mode) {
 		igt_output_override_mode(output, mode);
 		igt_debug("Trying mode %dx%d\n",
 			  mode->hdisplay, mode->vdisplay);
-- 
2.47.3

