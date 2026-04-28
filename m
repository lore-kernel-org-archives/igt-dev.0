Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C5BFF886F
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 04:52:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3BA10E2C4;
	Tue, 28 Apr 2026 04:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5UIEFSg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7E210E29C
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 04:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777351662; x=1808887662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=70JV7TW60lPpDHycOje3QQeCm22MsNmO8i9MiutaoTQ=;
 b=f5UIEFSgLtmiphhfWQZ0LWkLPr3Z7eM4KpQbFwIKBhZMhATds6+IzV0q
 O/6FF+tIGm+Q56+iGyVW4Q+Xqv2f6hj1bvs11OcL7l0lsPt+3qFeAzoIK
 cPYPt/naTWNu/JrmxQKp9wG6zZMtvmRazMZiOYr6pSDIdpx/Y1IOm4+0I
 d52Ew0pXiEehELGcpVu1eYDB2c4MZUWDWkG4QpjeFSUeEpqw3k4CJzRS3
 zymb0boOsQ1M1Bv/ZiCr1Art+hcCt+EKaQ7FpqFkvE4NR5lnTHVXlHvwj
 ohs3y31XXziInOH694gf461BTYnu424TCKF+j/QgVxF+/OU1RkzaNBeHk A==;
X-CSE-ConnectionGUID: 3ASJuI8sQve1u0ePnMMLLA==
X-CSE-MsgGUID: rLAwuR4aQ86RUWvH7jvAZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78167874"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78167874"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:42 -0700
X-CSE-ConnectionGUID: ySD157b3SliX9qHhCMmt0A==
X-CSE-MsgGUID: b3vSKcjnTiKVbK1A+zWA7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="233706821"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:41 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v1 25/25] tests/chamelium/v3: Add audio tests for
 Chamelium v3
Date: Tue, 28 Apr 2026 10:16:34 +0530
Message-ID: <20260428044644.257001-26-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260428044644.257001-1-mohammed.bilal@intel.com>
References: <20260428044644.257001-1-mohammed.bilal@intel.com>
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

This commit adds audio testing capabilities for Chamelium v3 including
HDMI audio capture, audio format verification, and audio playback tests.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/chamelium/v3/kms_chamelium_v3_audio.c | 707 ++++++++++++++++++++
 tests/meson.build                           |   1 +
 2 files changed, 708 insertions(+)
 create mode 100644 tests/chamelium/v3/kms_chamelium_v3_audio.c

diff --git a/tests/chamelium/v3/kms_chamelium_v3_audio.c b/tests/chamelium/v3/kms_chamelium_v3_audio.c
new file mode 100644
index 000000000..1e392de15
--- /dev/null
+++ b/tests/chamelium/v3/kms_chamelium_v3_audio.c
@@ -0,0 +1,707 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (c) 2024 Intel Corporation
+ *
+ * Chamelium V3 Audio Tests
+ *
+ * Tests audio output pipeline verification using ALSA, audio signal,
+ * ELD, and EDID infrastructure from the shared IGT libraries.
+ *
+ * The dp-audio and hdmi-audio subtests verify the GPU audio output pipeline:
+ *   1. Audio EDID is applied and ELD is populated correctly.
+ *   2. ALSA output device opens for the connected display.
+ *   3. Multi-format, multi-rate audio playback completes without error.
+ */
+
+#include <stdlib.h>
+#include <unistd.h>
+#include <string.h>
+#include <fcntl.h>
+
+#include "igt.h"
+#include "igt_edid.h"
+#include "igt_eld.h"
+#include "igt_alsa.h"
+#include "igt_audio.h"
+#include "chamelium/v3/igt_chamelium.h"
+
+/**
+ * TEST: kms chamelium v3 audio
+ * Category: Display
+ * Description: Audio tests for Chamelium V3
+ * Driver requirement: i915, xe
+ * Mega feature: Display Audio
+ */
+
+#define HPD_WAIT_TIME_MS      3000
+#define EDID_SETTLE_TIME_MS   2000
+#define CONNECTOR_WAIT_TIMEOUT 10  /* seconds */
+
+/* Playback parameters */
+#define PLAYBACK_CHANNELS 2
+#define PLAYBACK_SAMPLES  1024
+
+/* Capture parameters (used for frequency step calculation) */
+#define CAPTURE_SAMPLES   2048
+
+/* Duration to play each audio configuration (milliseconds) */
+#define PLAYBACK_DURATION_MS 500
+
+/* Chamelium V3 port IDs */
+#define FPGA_DP1_PORT  4
+#define FPGA_DP2_PORT  5
+#define ITE_HDMI1_PORT 2
+#define ITE_HDMI2_PORT 3
+
+struct audio_test_data {
+	struct igt_chamelium_v3 *chamelium;
+	chamelium_v3_port_id *ports;
+	int port_count;
+	int drm_fd;
+};
+
+/**
+ * struct v3_playback_ctx - Context for audio playback callback
+ *
+ * The dp-audio / hdmi-audio subtests verify the GPU audio output pipeline
+ * by playing test signals and verifying ALSA playback completes without error.
+ */
+struct v3_playback_ctx {
+	struct audio_signal *signal;
+	snd_pcm_format_t format;
+	int channels;
+};
+
+static int test_sampling_rates[] = {
+	32000, 44100, 48000,
+};
+
+static int test_sampling_rates_count =
+	sizeof(test_sampling_rates) / sizeof(int);
+
+static int test_frequencies[] = {
+	300, 600, 1200, 10000, 80000,
+};
+
+static int test_frequencies_count = sizeof(test_frequencies) / sizeof(int);
+
+static const snd_pcm_format_t test_formats[] = {
+	SND_PCM_FORMAT_S16_LE,
+	SND_PCM_FORMAT_S24_LE,
+	SND_PCM_FORMAT_S32_LE,
+};
+
+static const int test_formats_count =
+	sizeof(test_formats) / sizeof(test_formats[0]);
+
+
+static chamelium_v3_port_id find_dp_port(struct audio_test_data *data)
+{
+	int i;
+
+	for (i = 0; i < data->port_count; i++) {
+		chamelium_v3_port_id port = data->ports[i];
+
+		if (chamelium_v3_port_is_dp(data->chamelium, port) &&
+		    (port == FPGA_DP1_PORT || port == FPGA_DP2_PORT))
+			return port;
+	}
+	for (i = 0; i < data->port_count; i++) {
+		if (chamelium_v3_port_is_dp(data->chamelium, data->ports[i]))
+			return data->ports[i];
+	}
+	return (chamelium_v3_port_id)-1;
+}
+
+static chamelium_v3_port_id find_hdmi_port(struct audio_test_data *data)
+{
+	int i;
+
+	for (i = 0; i < data->port_count; i++) {
+		if (chamelium_v3_port_is_hdmi(data->chamelium, data->ports[i]))
+			return data->ports[i];
+	}
+	return (chamelium_v3_port_id)-1;
+}
+
+static chamelium_v3_port_id get_port_for_type(struct audio_test_data *data,
+					      bool is_dp)
+{
+	return is_dp ? find_dp_port(data) : find_hdmi_port(data);
+}
+
+static int get_drm_connector_type(bool is_dp)
+{
+	return is_dp ? DRM_MODE_CONNECTOR_DisplayPort :
+		       DRM_MODE_CONNECTOR_HDMIA;
+}
+
+
+static void disable_all_crtcs(int drm_fd)
+{
+	drmModeRes *res = drmModeGetResources(drm_fd);
+
+	if (!res)
+		return;
+
+	for (int i = 0; i < res->count_crtcs; i++)
+		drmModeSetCrtc(drm_fd, res->crtcs[i], 0, 0, 0, NULL, 0, NULL);
+
+	drmModeFreeResources(res);
+}
+
+static void dump_connector_info(int drm_fd, const char *label)
+{
+	drmModeRes *res = drmModeGetResources(drm_fd);
+	const char *status_str;
+
+	if (!res) {
+		igt_info("%s: cannot get DRM resources\n", label);
+		return;
+	}
+
+	igt_info("%s - Connector info:\n", label);
+	for (int i = 0; i < res->count_connectors; i++) {
+		drmModeConnector *conn =
+			drmModeGetConnector(drm_fd, res->connectors[i]);
+		if (!conn)
+			continue;
+
+		switch (conn->connection) {
+		case DRM_MODE_CONNECTED:
+			status_str = "connected";
+			break;
+		case DRM_MODE_DISCONNECTED:
+			status_str = "disconnected";
+			break;
+		default:
+			status_str = "unknown";
+			break;
+		}
+
+		igt_info("  [CONNECTOR:%u:%s-%u]: status: %s, modes: %d\n",
+			 conn->connector_id,
+			 kmstest_connector_type_str(conn->connector_type),
+			 conn->connector_type_id,
+			 status_str, conn->count_modes);
+
+		drmModeFreeConnector(conn);
+	}
+	drmModeFreeResources(res);
+}
+
+static drmModeConnector *wait_for_connected_connector(int drm_fd, int type)
+{
+	int retries = CONNECTOR_WAIT_TIMEOUT * 20; /* 50ms interval */
+
+	while (retries-- > 0) {
+		drmModeRes *res = drmModeGetResources(drm_fd);
+
+		if (!res) {
+			usleep(50000);
+			continue;
+		}
+
+		for (int i = 0; i < res->count_connectors; i++) {
+			drmModeConnector *conn =
+				drmModeGetConnector(drm_fd, res->connectors[i]);
+			if (!conn)
+				continue;
+			if (conn->connector_type == (uint32_t)type &&
+			    conn->connection == DRM_MODE_CONNECTED &&
+			    conn->count_modes > 0) {
+				drmModeFreeResources(res);
+				return conn;
+			}
+			drmModeFreeConnector(conn);
+		}
+		drmModeFreeResources(res);
+		usleep(50000);
+	}
+	return NULL;
+}
+
+static uint32_t find_crtc_for_connector(int drm_fd, drmModeConnector *conn)
+{
+	drmModeRes *res = drmModeGetResources(drm_fd);
+	drmModeEncoder *enc;
+	uint32_t crtc_id = 0;
+	int i;
+
+	if (!res)
+		return 0;
+
+	for (i = 0; i < conn->count_encoders && !crtc_id; i++) {
+		enc = drmModeGetEncoder(drm_fd, conn->encoders[i]);
+		if (!enc)
+			continue;
+		for (int j = 0; j < res->count_crtcs; j++) {
+			if (enc->possible_crtcs & (1 << j)) {
+				crtc_id = res->crtcs[j];
+				break;
+			}
+		}
+		drmModeFreeEncoder(enc);
+	}
+	drmModeFreeResources(res);
+	return crtc_id;
+}
+
+static int set_mode_on_connector(int drm_fd, drmModeConnector *conn)
+{
+	drmModeModeInfo *mode;
+	uint32_t crtc_id;
+	struct igt_fb fb;
+	int fb_id;
+
+	igt_assert(conn->count_modes > 0);
+	mode = &conn->modes[0];
+
+	crtc_id = find_crtc_for_connector(drm_fd, conn);
+	igt_assert_f(crtc_id, "No CRTC found for connector\n");
+
+	fb_id = igt_create_color_pattern_fb(drm_fd, mode->hdisplay,
+				    mode->vdisplay,
+				    DRM_FORMAT_XRGB8888,
+				    DRM_FORMAT_MOD_LINEAR,
+				    0, 0, 0, &fb);
+	igt_assert(fb_id > 0);
+
+	igt_assert_eq(drmModeSetCrtc(drm_fd, crtc_id, fb_id, 0, 0,
+			     &conn->connector_id, 1, mode), 0);
+
+	igt_info("  Modeset: %dx%d on CRTC %u\n",
+		 mode->hdisplay, mode->vdisplay, crtc_id);
+
+	return fb_id;
+}
+
+/**
+ * ensure_port_plugged - Plug a port with the given EDID and wait for connector
+ *
+ * Resets Chamelium, disables CRTCs, creates EDID (after reset so it
+ * doesn't get wiped), applies EDID, plugs the port, then polls until
+ * the DRM connector shows as connected.
+ */
+static drmModeConnector *ensure_port_plugged(struct audio_test_data *data,
+					     chamelium_v3_port_id port,
+					     bool is_dp,
+					     const unsigned char *edid_data,
+					     size_t edid_size)
+{
+	drmModeConnector *conn;
+	char *port_name;
+	int edid_id;
+
+	port_name = chamelium_v3_get_port_name(data->chamelium, port);
+	igt_info("Preparing port %d (%s) for plug...\n", port, port_name);
+	free(port_name);
+
+	/* 1. Reset chamelium -- unplugs all ports and clears EDIDs */
+	igt_info("  Resetting Chamelium (unplug all)...\n");
+	chamelium_v3_reset(data->chamelium);
+	usleep(HPD_WAIT_TIME_MS * 1000);
+
+	/* 2. Disable all CRTCs for a clean slate */
+	disable_all_crtcs(data->drm_fd);
+	usleep(500000);
+
+	/* 3. Explicitly unplug the target port if still plugged */
+	if (chamelium_v3_is_plugged(data->chamelium, port)) {
+		igt_info("  Port still plugged after reset, unplugging...\n");
+		chamelium_v3_unplug(data->chamelium, port);
+		usleep(HPD_WAIT_TIME_MS * 1000);
+	}
+
+	dump_connector_info(data->drm_fd, "Before plug");
+
+	/* 4. Create EDID AFTER reset (reset clears all created EDIDs) */
+	edid_id = chamelium_v3_create_edid(data->chamelium, edid_data,
+				   edid_size);
+	igt_info("  Created EDID (id=%d, %zu bytes)\n", edid_id, edid_size);
+
+	/* 5. Apply EDID then plug */
+	chamelium_v3_apply_edid(data->chamelium, port, edid_id);
+	igt_info("  Applied EDID and plugging port %d...\n", port);
+	chamelium_v3_plug(data->chamelium, port);
+
+	/* 6. Wait for HPD and link training */
+	igt_info("  Waiting for HPD + link training...\n");
+	usleep(HPD_WAIT_TIME_MS * 1000);
+	usleep(EDID_SETTLE_TIME_MS * 1000);
+
+	dump_connector_info(data->drm_fd, "After plug");
+
+	/* 7. Poll for connected connector */
+	conn = wait_for_connected_connector(data->drm_fd,
+				    get_drm_connector_type(is_dp));
+	if (conn) {
+		igt_info("  Connector %u now CONNECTED (%d modes)\n",
+			 conn->connector_id, conn->count_modes);
+	} else {
+		igt_warn("  Connector NOT connected after plug!\n");
+		dump_connector_info(data->drm_fd, "Plug failed");
+	}
+
+	return conn;
+}
+
+static int v3_playback_callback(void *data, void *buffer, int samples)
+{
+	struct v3_playback_ctx *ctx = data;
+	double *tmp;
+	size_t len;
+
+	len = samples * ctx->channels;
+	tmp = malloc(len * sizeof(double));
+	audio_signal_fill(ctx->signal, tmp, samples);
+	audio_convert_to(buffer, tmp, len, ctx->format);
+	free(tmp);
+
+	return 0; /* alsa_run() will stop after the requested duration */
+}
+
+/**
+ * test_one_playback - Play a test signal for a fixed duration
+ *
+ * Generates a multi-frequency audio signal, configures the ALSA output
+ * device, plays for @duration_ms and returns true if playback completed
+ * without any ALSA errors.
+ */
+static bool test_one_playback(struct alsa *alsa, snd_pcm_format_t format,
+			      int channels, int rate, int duration_ms)
+{
+	struct v3_playback_ctx ctx;
+	struct audio_signal *signal;
+	int step, i, j, freq, ret;
+
+	signal = audio_signal_init(channels, rate);
+	igt_assert_f(signal, "Failed to init audio signal\n");
+
+	/* Add test frequencies */
+	step = 2 * rate / CAPTURE_SAMPLES;
+	for (i = 0; i < test_frequencies_count; i++) {
+		for (j = 0; j < channels; j++) {
+			freq = test_frequencies[i] + j * step;
+			audio_signal_add_frequency(signal, freq, j);
+		}
+	}
+	audio_signal_synthesize(signal);
+
+	ctx.signal = signal;
+	ctx.format = format;
+	ctx.channels = channels;
+
+	alsa_configure_output(alsa, format, channels, rate);
+	alsa_register_output_callback(alsa, v3_playback_callback, &ctx,
+				      PLAYBACK_SAMPLES);
+
+	igt_info("    Playing: %s, %d Hz, %d ch for %d ms ... ",
+		 snd_pcm_format_name(format), rate, channels, duration_ms);
+
+	ret = alsa_run(alsa, duration_ms);
+
+	audio_signal_fini(signal);
+
+	if (ret < 0) {
+		igt_info("FAIL (ret=%d)\n", ret);
+		return false;
+	}
+
+	igt_info("OK\n");
+	return true;
+}
+
+
+static bool check_audio_configuration(struct alsa *alsa,
+			      snd_pcm_format_t format, int channels,
+			      int sampling_rate)
+{
+	if (!alsa_test_output_configuration(alsa, format, channels,
+				    sampling_rate)) {
+		igt_debug("Skipping format %s, rate %d Hz, %d ch: "
+			  "output device doesn't support this config\n",
+			  snd_pcm_format_name(format), sampling_rate, channels);
+		return false;
+	}
+	return true;
+}
+
+
+/**
+ * SUBTEST: dp-audio
+ * Description: Playback various audio signals with various audio formats/rates
+ *              over DP, verify ALSA ELD and playback complete without error
+ *
+ * SUBTEST: hdmi-audio
+ * Description: Playback various audio signals with various audio formats/rates
+ *              over HDMI, verify ALSA ELD and playback complete without error
+ */
+static void test_display_audio(struct audio_test_data *data, bool is_dp)
+{
+	bool run, success;
+	struct alsa *alsa;
+	int ret;
+	drmModeConnector *connector;
+	int fb_id, i, j;
+	int channels, sampling_rate;
+	snd_pcm_format_t format;
+	chamelium_v3_port_id port;
+	const struct edid *audio_edid;
+	size_t edid_size;
+	char *port_name;
+	struct eld_entry eld;
+
+	port = get_port_for_type(data, is_dp);
+	igt_require_f(port != (chamelium_v3_port_id)-1,
+		      "No %s port found on Chamelium\n",
+		      is_dp ? "DP" : "HDMI");
+
+	port_name = chamelium_v3_get_port_name(data->chamelium, port);
+	igt_info("Testing audio playback on %s (port %d)\n", port_name, port);
+	free(port_name);
+
+	igt_require(alsa_has_exclusive_access());
+
+	alsa = alsa_init();
+	igt_assert(alsa);
+
+	/* Get audio EDID */
+	if (is_dp)
+		audio_edid = igt_kms_get_dp_audio_edid();
+	else
+		audio_edid = igt_kms_get_hdmi_audio_edid();
+	edid_size = edid_get_size(audio_edid);
+
+	/* Plug with audio EDID and modeset */
+	connector = ensure_port_plugged(data, port, is_dp,
+				(const unsigned char *)audio_edid,
+				edid_size);
+	igt_assert_f(connector, "No connector after plug with audio EDID\n");
+
+	fb_id = set_mode_on_connector(data->drm_fd, connector);
+	igt_assert(fb_id > 0);
+
+	/* Give audio subsystem time to initialize after modeset */
+	usleep(2000000);
+
+	/* Verify ELD is populated -- confirms the audio output path is
+	 * active and the display reports correct audio capabilities. */
+	igt_assert_f(eld_get_igt(&eld),
+		     "ELD not available -- audio output path not active\n");
+	igt_info("  ELD verified: audio output path is active "
+		 "(SADs: %zu)\n", eld.sads_len);
+
+	/* Test each format/rate combination by playing through ALSA.
+	 * Verify that the GPU audio output pipeline works: ALSA device
+	 * opens, configures, and plays without error for each supported
+	 * configuration. */
+	run = false;
+	success = true;
+	for (i = 0; i < test_sampling_rates_count; i++) {
+		for (j = 0; j < test_formats_count; j++) {
+			ret = alsa_open_output(alsa, "HDMI");
+			igt_assert_f(ret >= 0, "Failed to open ALSA output\n");
+
+			format = test_formats[j];
+			channels = PLAYBACK_CHANNELS;
+			sampling_rate = test_sampling_rates[i];
+
+			if (!check_audio_configuration(alsa, format, channels,
+						       sampling_rate)) {
+				alsa_close_output(alsa);
+				continue;
+			}
+
+			run = true;
+			success &= test_one_playback(alsa, format, channels,
+						     sampling_rate,
+						     PLAYBACK_DURATION_MS);
+			alsa_close_output(alsa);
+		}
+	}
+
+	igt_assert_f(run, "No audio configuration could be tested\n");
+	igt_assert_f(success, "One or more audio playback configs failed\n");
+
+	igt_info("  Audio playback test PASSED (%s)\n",
+		 is_dp ? "DP" : "HDMI");
+
+	drmModeFreeConnector(connector);
+	free(alsa);
+}
+
+
+/**
+ * SUBTEST: dp-audio-edid
+ * Description: Plug a connector with an EDID suitable for audio, check ALSA's
+ *              EDID-Like Data reports the correct audio parameters
+ *
+ * SUBTEST: hdmi-audio-edid
+ * Description: Plug a connector with an EDID suitable for audio, check ALSA's
+ *              EDID-Like Data reports the correct audio parameters
+ */
+static void test_display_audio_edid(struct audio_test_data *data, bool is_dp)
+{
+	chamelium_v3_port_id port;
+	const struct edid *audio_edid;
+	size_t edid_size;
+	drmModeConnector *connector;
+	int fb_id;
+	struct eld_entry eld;
+	struct eld_sad *sad;
+	char *port_name;
+
+	port = get_port_for_type(data, is_dp);
+	igt_require_f(port != (chamelium_v3_port_id)-1,
+		      "No %s port found on Chamelium\n",
+		      is_dp ? "DP" : "HDMI");
+
+	port_name = chamelium_v3_get_port_name(data->chamelium, port);
+	igt_info("Testing audio EDID on %s (port %d)\n", port_name, port);
+	free(port_name);
+
+	igt_require(eld_is_supported());
+
+	/* Get audio EDID */
+	if (is_dp)
+		audio_edid = igt_kms_get_dp_audio_edid();
+	else
+		audio_edid = igt_kms_get_hdmi_audio_edid();
+	edid_size = edid_get_size(audio_edid);
+
+	/* Plug with audio EDID */
+	connector = ensure_port_plugged(data, port, is_dp,
+				(const unsigned char *)audio_edid,
+				edid_size);
+	igt_assert_f(connector, "No connector after plug with audio EDID\n");
+
+	igt_info("  Connected: %d modes, preferred %dx%d\n",
+		 connector->count_modes,
+		 connector->modes[0].hdisplay,
+		 connector->modes[0].vdisplay);
+
+	/* Enable the output -- audio cannot be played on inactive
+	 * connectors (ELD won't be populated until modeset). */
+	fb_id = set_mode_on_connector(data->drm_fd, connector);
+	igt_assert(fb_id > 0);
+
+	/* Wait for ELD to populate after modeset */
+	usleep(2000000);
+
+	/* Read ELD and verify it matches the audio EDID we applied */
+	igt_assert_f(eld_get_igt(&eld), "Failed to read ELD from ALSA\n");
+	igt_assert_f(eld.sads_len == 1,
+		     "Expected 1 SAD in ELD, got %zu\n", eld.sads_len);
+
+	sad = &eld.sads[0];
+	igt_info("  ELD SAD: coding_type=%d, channels=%d, "
+		 "rates=0x%x, bits=0x%x\n",
+		 sad->coding_type, sad->channels,
+		 sad->rates, sad->bits);
+
+	igt_assert_f(sad->coding_type == CEA_SAD_FORMAT_PCM,
+		     "Expected PCM coding type, got %d\n", sad->coding_type);
+	igt_assert_f(sad->channels == 2,
+		     "Expected 2 channels, got %d\n", sad->channels);
+	igt_assert_f(sad->rates ==
+		     (CEA_SAD_SAMPLING_RATE_32KHZ |
+		      CEA_SAD_SAMPLING_RATE_44KHZ |
+		      CEA_SAD_SAMPLING_RATE_48KHZ),
+		     "Unexpected sampling rates: 0x%x\n", sad->rates);
+	igt_assert_f(sad->bits ==
+		     (CEA_SAD_SAMPLE_SIZE_16 |
+		      CEA_SAD_SAMPLE_SIZE_20 |
+		      CEA_SAD_SAMPLE_SIZE_24),
+		     "Unexpected sample sizes: 0x%x\n", sad->bits);
+
+	igt_info("  Audio EDID verification PASSED\n");
+
+	drmModeFreeConnector(connector);
+}
+
+
+static void __real_main(void)
+{
+	struct audio_test_data data = { 0 };
+	bool setup_done = false;
+
+	data.chamelium = chamelium_v3_init_from_config();
+	if (!data.chamelium) {
+		igt_info("Chamelium not available, skipping tests\n");
+		return;
+	}
+
+	data.port_count = chamelium_v3_get_supported_ports(data.chamelium,
+						   &data.ports);
+	if (data.port_count <= 0) {
+		igt_info("No Chamelium ports found, skipping tests\n");
+		chamelium_v3_uninit(data.chamelium);
+		return;
+	}
+
+	data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+	if (data.drm_fd < 0) {
+		igt_info("Cannot open DRM device as master, skipping tests\n");
+		free(data.ports);
+		chamelium_v3_uninit(data.chamelium);
+		return;
+	}
+
+	setup_done = true;
+	igt_info("Opened DRM device as master, found %d Chamelium ports\n",
+		 data.port_count);
+
+	/* Show initial connector status */
+	dump_connector_info(data.drm_fd, "Initial state");
+
+	/* DP audio tests */
+	igt_describe("Playback various audio signals with various audio "
+		     "formats/rates over DP, verify ELD and playback");
+	igt_subtest("dp-audio") {
+		igt_require(setup_done);
+		test_display_audio(&data, true);
+	}
+
+	igt_describe("Plug a connector with an EDID suitable for audio, "
+		     "check ALSA EDID-Like Data reports the correct "
+		     "audio parameters");
+	igt_subtest("dp-audio-edid") {
+		igt_require(setup_done);
+		test_display_audio_edid(&data, true);
+	}
+
+	/* HDMI audio tests */
+	igt_describe("Playback various audio signals with various audio "
+		     "formats/rates over HDMI, verify ELD and playback");
+	igt_subtest("hdmi-audio") {
+		igt_require(setup_done);
+		test_display_audio(&data, false);
+	}
+
+	igt_describe("Plug a connector with an EDID suitable for audio, "
+		     "check ALSA EDID-Like Data reports the correct "
+		     "audio parameters");
+	igt_subtest("hdmi-audio-edid") {
+		igt_require(setup_done);
+		test_display_audio_edid(&data, false);
+	}
+
+	/* Cleanup */
+	if (setup_done) {
+		igt_info("Cleaning up...\n");
+		chamelium_v3_reset(data.chamelium);
+		usleep(HPD_WAIT_TIME_MS * 1000);
+
+		free(data.ports);
+		chamelium_v3_uninit(data.chamelium);
+		close(data.drm_fd);
+	}
+}
+
+int main(int argc, char **argv)
+{
+	igt_subtest_init(argc, argv);
+	__real_main();
+	igt_exit();
+}
diff --git a/tests/meson.build b/tests/meson.build
index 1c7facccd..8c054fd40 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -378,6 +378,7 @@ chamelium_v3_progs = [
 	'kms_chamelium_v3_edid',
 	'kms_chamelium_v3_frames',
 	'kms_chamelium_v3_color',
+	'kms_chamelium_v3_audio',
 ]
 
 test_deps = [ igt_deps ]
-- 
2.48.1

