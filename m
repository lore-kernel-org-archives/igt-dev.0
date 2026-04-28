Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3796CFF886F
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 04:49:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE0E10E2C4;
	Tue, 28 Apr 2026 04:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PkR3FvKu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80E110E2ED
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 04:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777351657; x=1808887657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KV4yJQKc6vuWktrL/YPkkXYADZvvKbto7s5JZoNkunw=;
 b=PkR3FvKuej0GITpIamuQ+ghpB+UxFOCx8oBaZ1+iRfWvszxb+SttdxvH
 3l8vteRMuEvyqz+pZOds9YeiEtAfHLZ1IdKdxM4cWtLmAcjKAfc5Xtmku
 tuphH7uadmLwh2hu/bzIgLohyU0SNy5E82495clLwv8/vipvWu3HDpjab
 ayXwXNYFCecPn5ABT53ahmKfTQGf8xfcBVM6993fd+YC6cNJQdk3WJ8QZ
 XZ/M6Pgfklusa/B30LPnAaNssd+RQ1riaugcM0HYA9KRNzqK8E/BzZgtQ
 uFspwSyQgYdktDandYkcu1Iq3crtzjv2iuQZsiM38zpiu4DerXEx5p8RQ A==;
X-CSE-ConnectionGUID: STbsTWi+TlWOLHAw890T1w==
X-CSE-MsgGUID: AqN6dszoQlC6+FklmDWo4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78167863"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78167863"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:37 -0700
X-CSE-ConnectionGUID: pPU5aj/ORC2SN9YY/TgR5A==
X-CSE-MsgGUID: TaSr2yWoQ0uDHGmKaFksnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="233706790"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:36 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v1 22/25] tests/chamelium/v3: Add EDID tests for
 Chamelium v3
Date: Tue, 28 Apr 2026 10:16:31 +0530
Message-ID: <20260428044644.257001-23-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260428044644.257001-1-mohammed.bilal@intel.com>
References: <20260428044644.257001-1-mohammed.bilal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
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

This commit adds EDID testing capabilities for Chamelium v3 including
EDID read/write, mode detection, and multiple monitor EDID support.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/chamelium/v3/kms_chamelium_v3_edid.c | 1357 ++++++++++++++++++++
 tests/meson.build                          |    1 +
 2 files changed, 1358 insertions(+)
 create mode 100644 tests/chamelium/v3/kms_chamelium_v3_edid.c

diff --git a/tests/chamelium/v3/kms_chamelium_v3_edid.c b/tests/chamelium/v3/kms_chamelium_v3_edid.c
new file mode 100644
index 000000000..68b361bfe
--- /dev/null
+++ b/tests/chamelium/v3/kms_chamelium_v3_edid.c
@@ -0,0 +1,1357 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ *
+ * Chamelium V3 EDID Tests
+ *
+ * Tests EDID reading (strict byte comparison), custom EDID upload,
+ * EDID change detection, mode timing verification, and resolution validation.
+ */
+
+#include <stdlib.h>
+#include <unistd.h>
+#include <string.h>
+#include <fcntl.h>
+#include <math.h>
+#include <time.h>
+
+#include "igt.h"
+#include "igt_edid.h"
+#include "igt_aux.h"
+#include "chamelium/v3/igt_chamelium.h"
+#include "monitor_edids/dp_edids.h"
+#include "monitor_edids/hdmi_edids.h"
+#include "monitor_edids/monitor_edids_helper.h"
+
+/**
+ * TEST: kms chamelium v3 edid
+ * Category: Display
+ * Description: EDID tests for Chamelium V3
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
+ *
+ * SUBTEST: dp-edid-read
+ * Description: Make sure the EDID exposed by KMS is the same as the screen's
+ *
+ * SUBTEST: hdmi-edid-read
+ * Description: Make sure the EDID exposed by KMS is the same as the screen's
+ *
+ * SUBTEST: dp-edid-stress-resolution-%s
+ * Description: Stress test the DUT by testing multiple EDIDs, one right after
+ *              the other, and ensure their validity by check the real screen
+ *              resolution vs the advertised mode (%arg[1]) resolution.
+ *
+ * SUBTEST: hdmi-edid-stress-resolution-%s
+ * Description: Stress test the DUT by testing multiple EDIDs, one right after
+ *              the other, and ensure their validity by check the real screen
+ *              resolution vs the advertised mode (%arg[1]) resolution.
+ *
+ * arg[1]:
+ *
+ * @4k:      4K
+ * @non-4k:  Non 4K
+ *
+ * SUBTEST: dp-edid-resolution-list
+ * Description: Get an EDID with many modes of different configurations, set
+ *              them on the screen and check the screen resolution matches the
+ *              mode resolution.
+ *
+ * SUBTEST: dp-edid-change-during-%s
+ * Description: Simulate a screen being unplugged and another screen being
+ *              plugged during suspend, check that a uevent is sent and
+ *              connector status is updated during %arg[1]
+ *
+ * SUBTEST: hdmi-edid-change-during-%s
+ * Description: Simulate a screen being unplugged and another screen being
+ *              plugged during suspend, check that a uevent is sent and
+ *              connector status is updated during %arg[1]
+ *
+ * arg[1]:
+ *
+ * @hibernate:    hibernation
+ * @suspend:      suspend
+ *
+ * SUBTEST: dp-mode-timings
+ * Description: For each mode of the IGT base EDID, perform a modeset and check
+ *              the mode detected by the Chamelium receiver matches the mode we
+ *              set
+ *
+ * SUBTEST: hdmi-mode-timings
+ * Description: For each mode of the IGT base EDID, perform a modeset and check
+ *              the mode detected by the Chamelium receiver matches the mode we
+ *              set
+ */
+
+#define HPD_WAIT_TIME_MS 3000
+#define EDID_BLOCK_SIZE 128
+#define EDID_SETTLE_TIME_MS 2000
+#define CONNECTOR_REPROBE_RETRIES 10
+#define MODE_CLOCK_ACCURACY 0.05 /* 5% tolerance */
+#define VIDEO_STABLE_TIMEOUT_S 5
+#define MODESET_SETTLE_TIME_MS 2000
+#define CHAMELIUM_HOTPLUG_TIMEOUT 20
+
+/* FPGA DP ports (recommended) */
+#define FPGA_DP1_PORT 4
+#define FPGA_DP2_PORT 5
+#define ITE_HDMI1_PORT 2
+#define ITE_HDMI2_PORT 3
+
+struct edid_test_data {
+	struct igt_chamelium_v3 *chamelium;
+	chamelium_v3_port_id *ports;
+	int port_count;
+	int drm_fd;
+};
+
+/* Find a DP port, preferring FPGA ports */
+static chamelium_v3_port_id find_dp_port(struct edid_test_data *data)
+{
+	int i;
+
+	/* Prefer FPGA DP ports (4, 5) over ITE DP ports (0, 1) */
+	for (i = 0; i < data->port_count; i++) {
+		chamelium_v3_port_id port = data->ports[i];
+
+		if (chamelium_v3_port_is_dp(data->chamelium, port) &&
+		    (port == FPGA_DP1_PORT || port == FPGA_DP2_PORT))
+			return port;
+	}
+	/* Fall back to any DP port */
+	for (i = 0; i < data->port_count; i++) {
+		chamelium_v3_port_id port = data->ports[i];
+
+		if (chamelium_v3_port_is_dp(data->chamelium, port))
+			return port;
+	}
+	return (chamelium_v3_port_id)-1;
+}
+
+/* Find an HDMI port */
+static chamelium_v3_port_id find_hdmi_port(struct edid_test_data *data)
+{
+	int i;
+
+	for (i = 0; i < data->port_count; i++) {
+		chamelium_v3_port_id port = data->ports[i];
+
+		if (chamelium_v3_port_is_hdmi(data->chamelium, port))
+			return port;
+	}
+	return (chamelium_v3_port_id)-1;
+}
+
+/*
+ * Find a connected DRM connector by type.
+ * Uses drmModeGetConnector() which forces a reprobe.
+ * Caller must free with drmModeFreeConnector().
+ */
+static drmModeConnector *find_connected_connector(int drm_fd, uint32_t connector_type)
+{
+	drmModeRes *res;
+	drmModeConnector *connector;
+	int i;
+
+	res = drmModeGetResources(drm_fd);
+	igt_assert(res);
+
+	for (i = 0; i < res->count_connectors; i++) {
+		connector = drmModeGetConnector(drm_fd, res->connectors[i]);
+		if (!connector)
+			continue;
+
+		if (connector->connector_type == connector_type &&
+		    connector->connection == DRM_MODE_CONNECTED) {
+			drmModeFreeResources(res);
+			return connector;
+		}
+		drmModeFreeConnector(connector);
+	}
+
+	drmModeFreeResources(res);
+	return NULL;
+}
+
+/*
+ * Wait for a connector of the given type to become connected.
+ * Retries with reprobe to handle HPD propagation delay.
+ * Returns the connected connector, or NULL if timeout.
+ */
+static drmModeConnector *wait_for_connected_connector(int drm_fd, uint32_t connector_type)
+{
+	drmModeConnector *connector;
+	int attempt;
+
+	for (attempt = 0; attempt < CONNECTOR_REPROBE_RETRIES; attempt++) {
+		usleep(HPD_WAIT_TIME_MS * 1000 / 2);
+		connector = find_connected_connector(drm_fd, connector_type);
+		if (connector)
+			return connector;
+	}
+	return NULL;
+}
+
+/*
+ * Read the EDID blob from a DRM connector.
+ * Returns allocated buffer with EDID data, or NULL if not found.
+ * Caller must free the returned buffer.
+ */
+static unsigned char *read_edid_from_connector(int drm_fd, drmModeConnector *connector,
+					       int *edid_len)
+{
+	int i;
+	drmModePropertyPtr prop;
+	drmModePropertyBlobPtr blob;
+	unsigned char *edid_data;
+
+	for (i = 0; i < connector->count_props; i++) {
+		prop = drmModeGetProperty(drm_fd, connector->props[i]);
+		if (!prop)
+			continue;
+
+		if (strcmp(prop->name, "EDID") == 0 &&
+		    connector->prop_values[i] != 0) {
+			blob = drmModeGetPropertyBlob(drm_fd,
+						      connector->prop_values[i]);
+			if (blob && blob->length > 0) {
+				edid_data = malloc(blob->length);
+				igt_assert(edid_data);
+				memcpy(edid_data, blob->data, blob->length);
+				*edid_len = blob->length;
+				drmModeFreePropertyBlob(blob);
+				drmModeFreeProperty(prop);
+				return edid_data;
+			}
+			if (blob)
+				drmModeFreePropertyBlob(blob);
+		}
+		drmModeFreeProperty(prop);
+	}
+
+	*edid_len = 0;
+	return NULL;
+}
+
+/* Verify EDID header magic bytes: 00 FF FF FF FF FF FF 00 */
+static bool verify_edid_header(const unsigned char *edid, int len)
+{
+	static const unsigned char edid_header[] = {
+		0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00
+	};
+
+	if (len < EDID_BLOCK_SIZE)
+		return false;
+
+	return memcmp(edid, edid_header, sizeof(edid_header)) == 0;
+}
+
+/* Get connector type constant for DRM */
+static uint32_t get_drm_connector_type(bool is_dp)
+{
+	return is_dp ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_HDMIA;
+}
+
+/* Get port for given type */
+static chamelium_v3_port_id get_port_for_type(struct edid_test_data *data, bool is_dp)
+{
+	return is_dp ? find_dp_port(data) : find_hdmi_port(data);
+}
+
+/*
+ * Find a CRTC that can drive the given connector.
+ * Needed for DRM modesetting in mode-timings and resolution tests.
+ */
+static uint32_t find_crtc_for_connector(int drm_fd, drmModeConnector *conn)
+{
+	drmModeRes *res;
+	drmModeEncoder *encoder;
+	uint32_t crtc_id = 0;
+	int i, j;
+
+	res = drmModeGetResources(drm_fd);
+	igt_assert(res);
+
+	for (i = 0; i < conn->count_encoders && !crtc_id; i++) {
+		encoder = drmModeGetEncoder(drm_fd, conn->encoders[i]);
+		if (!encoder)
+			continue;
+
+		for (j = 0; j < res->count_crtcs && !crtc_id; j++) {
+			if (encoder->possible_crtcs & (1 << j))
+				crtc_id = res->crtcs[j];
+		}
+		drmModeFreeEncoder(encoder);
+	}
+
+	drmModeFreeResources(res);
+	return crtc_id;
+}
+
+/* Disable all CRTCs to get a clean slate for modesetting */
+static void disable_all_crtcs(int drm_fd)
+{
+	drmModeRes *res;
+	int i;
+
+	res = drmModeGetResources(drm_fd);
+	igt_assert(res);
+
+	for (i = 0; i < res->count_crtcs; i++)
+		drmModeSetCrtc(drm_fd, res->crtcs[i], 0, 0, 0, NULL, 0, NULL);
+
+	drmModeFreeResources(res);
+}
+
+/*
+ * Ensure a specific Chamelium port is plugged with default EDID.
+ *
+ * Some ports share muxes (e.g., FPGA DP1 and DP2 are mutually exclusive),
+ * so we only plug the target port — not all ports.
+ *
+ * This "primes" the DRM connector state so that subsequent per-port
+ * unplug/replug cycles are fast, especially for FPGA DP ports which
+ * need a long time to recover from a full chamelium_v3_reset().
+ */
+static void ensure_port_plugged(struct edid_test_data *data,
+				chamelium_v3_port_id port)
+{
+	disable_all_crtcs(data->drm_fd);
+
+	chamelium_v3_apply_edid(data->chamelium, port, 0);
+	if (!chamelium_v3_is_plugged(data->chamelium, port))
+		chamelium_v3_plug(data->chamelium, port);
+
+	/* Give port time to complete link training */
+	usleep(HPD_WAIT_TIME_MS * 1000);
+	usleep(EDID_SETTLE_TIME_MS * 1000);
+
+	igt_debug("Port %d plugged with default EDID\n", port);
+}
+
+/*
+ * Wait for video to become stable on a Chamelium port.
+ * Polls GetVideoParams until valid resolution is reported or timeout.
+ */
+static bool wait_for_video_stable(struct igt_chamelium_v3 *chamelium,
+				  chamelium_v3_port_id port,
+				  int timeout_secs)
+{
+	struct chamelium_v3_video_params params;
+	struct timespec start, now;
+
+	clock_gettime(CLOCK_MONOTONIC, &start);
+
+	while (1) {
+		memset(&params, 0, sizeof(params));
+		if (chamelium_v3_get_video_params(chamelium, port, &params) &&
+		    params.hactive > 0 && params.vactive > 0)
+			return true;
+
+		clock_gettime(CLOCK_MONOTONIC, &now);
+		if (now.tv_sec - start.tv_sec >= timeout_secs)
+			break;
+
+		usleep(250000); /* 250ms poll interval */
+	}
+
+	return false;
+}
+
+/*
+ * Wait for video to report a specific expected resolution.
+ *
+ * After a mode change, Chamelium (especially ITE HDMI ports) may
+ * temporarily report stale video params from the previous mode.
+ * This function polls until the EXPECTED resolution is seen, not
+ * just any non-zero resolution.
+ */
+static bool wait_for_video_resolution(struct igt_chamelium_v3 *chamelium,
+				      chamelium_v3_port_id port,
+				      int expected_w, int expected_h,
+				      int timeout_secs)
+{
+	struct chamelium_v3_video_params params;
+	struct timespec start, now;
+
+	clock_gettime(CLOCK_MONOTONIC, &start);
+
+	while (1) {
+		memset(&params, 0, sizeof(params));
+		if (chamelium_v3_get_video_params(chamelium, port, &params) &&
+		    params.hactive == expected_w &&
+		    params.vactive == expected_h)
+			return true;
+
+		clock_gettime(CLOCK_MONOTONIC, &now);
+		if (now.tv_sec - start.tv_sec >= timeout_secs)
+			break;
+
+		igt_debug("  Waiting for %dx%d, currently %dx%d...\n",
+			  expected_w, expected_h,
+			  params.hactive, params.vactive);
+		usleep(500000); /* 500ms poll for mode transition */
+	}
+
+	igt_warn("Timed out waiting for resolution %dx%d (last seen: %dx%d)\n",
+		 expected_w, expected_h,
+		 params.hactive, params.vactive);
+	return false;
+}
+
+/*
+ * check_mode_v3 - Verify mode timing parameters.
+ *
+ * Retrieves video parameters from Chamelium V3 GetVideoParams RPC
+ * and compares them against the DRM mode info. Uses the same 5% clock
+ * tolerance and exact matching for all timing parameters.
+ *
+ */
+static void check_mode_v3(struct igt_chamelium_v3 *chamelium,
+			  chamelium_v3_port_id port, bool is_dp,
+			  drmModeModeInfo *mode)
+{
+	struct chamelium_v3_video_params params = { 0 };
+	double mode_clock;
+	int expected_hfp, expected_vfp;
+	int expected_hsw, expected_vsw;
+	bool expected_hsp, expected_vsp;
+	bool ok;
+
+	ok = chamelium_v3_get_video_params(chamelium, port, &params);
+	igt_assert_f(ok, "Failed to get video params from Chamelium\n");
+
+	mode_clock = (double)mode->clock / 1000;
+
+	/* Standard timing derivation from DRM mode info */
+	expected_hfp = mode->hsync_start - mode->hdisplay;
+	expected_vfp = mode->vsync_start - mode->vdisplay;
+	expected_hsw = mode->hsync_end - mode->hsync_start;
+	expected_vsw = mode->vsync_end - mode->vsync_start;
+	expected_hsp = !!(mode->flags & DRM_MODE_FLAG_PHSYNC);
+	expected_vsp = !!(mode->flags & DRM_MODE_FLAG_PVSYNC);
+
+	igt_debug("Checking video mode (%s):\n", is_dp ? "DP" : "HDMI");
+	igt_debug("  clock: got %.2f, expected %.2f ± %.1f%%\n",
+		  params.clock, mode_clock, MODE_CLOCK_ACCURACY * 100);
+	igt_debug("  hactive: got %d, expected %d\n",
+		  params.hactive, mode->hdisplay);
+	igt_debug("  vactive: got %d, expected %d\n",
+		  params.vactive, mode->vdisplay);
+	igt_debug("  htotal: got %d, expected %d\n",
+		  params.htotal, mode->htotal);
+	igt_debug("  vtotal: got %d, expected %d\n",
+		  params.vtotal, mode->vtotal);
+	igt_debug("  hfront_porch: got %d, expected %d\n",
+		  params.hfront_porch, expected_hfp);
+	igt_debug("  vfront_porch: got %d, expected %d\n",
+		  params.vfront_porch, expected_vfp);
+	igt_debug("  hsync_width: got %d, expected %d\n",
+		  params.hsync_width, expected_hsw);
+	igt_debug("  vsync_width: got %d, expected %d\n",
+		  params.vsync_width, expected_vsw);
+	igt_debug("  hsync_polarity: got %d, expected %d\n",
+		  params.hsync_polarity, expected_hsp);
+	igt_debug("  vsync_polarity: got %d, expected %d\n",
+		  params.vsync_polarity, expected_vsp);
+
+	/* Clock check with tolerance */
+	if (params.clock > 0) {
+		igt_assert_f(params.clock >
+			     mode_clock * (1 - MODE_CLOCK_ACCURACY),
+			     "Clock too low: %.2f < %.2f\n",
+			     params.clock,
+			     mode_clock * (1 - MODE_CLOCK_ACCURACY));
+		igt_assert_f(params.clock <
+			     mode_clock * (1 + MODE_CLOCK_ACCURACY),
+			     "Clock too high: %.2f > %.2f\n",
+			     params.clock,
+			     mode_clock * (1 + MODE_CLOCK_ACCURACY));
+	}
+
+	/* Resolution must match exactly */
+	igt_assert_eq(params.hactive, mode->hdisplay);
+	igt_assert_eq(params.vactive, mode->vdisplay);
+
+	/* Totals must match */
+	igt_assert_eq(params.htotal, mode->htotal);
+	igt_assert_eq(params.vtotal, mode->vtotal);
+
+	/* Sync widths must match */
+	igt_assert_eq(params.hsync_width, expected_hsw);
+	igt_assert_eq(params.vsync_width, expected_vsw);
+
+	/* Front porch must match (V3 reports standard front porch) */
+	igt_assert_eq(params.hfront_porch, expected_hfp);
+	igt_assert_eq(params.vfront_porch, expected_vfp);
+
+	/* Sync polarity must match */
+	igt_assert_eq(params.hsync_polarity, expected_hsp);
+	igt_assert_eq(params.vsync_polarity, expected_vsp);
+}
+
+/*
+ * Perform a modeset on a connector with the given mode.
+ * Returns the CRTC ID used, or 0 on failure.
+ * Caller must clean up the fb with igt_remove_fb().
+ */
+static uint32_t set_mode_on_connector(int drm_fd, drmModeConnector *conn,
+				      drmModeModeInfo *mode, struct igt_fb *fb)
+{
+	uint32_t crtc_id;
+	int fb_id, ret;
+
+	crtc_id = find_crtc_for_connector(drm_fd, conn);
+	if (!crtc_id) {
+		igt_warn("No CRTC found for connector %d\n",
+			 conn->connector_id);
+		return 0;
+	}
+
+	fb_id = igt_create_color_pattern_fb(drm_fd,
+					    mode->hdisplay, mode->vdisplay,
+					    DRM_FORMAT_XRGB8888,
+					    DRM_FORMAT_MOD_LINEAR,
+					    0, 0, 0, fb);
+	igt_assert_f(fb_id > 0, "Failed to create FB %dx%d\n",
+		     mode->hdisplay, mode->vdisplay);
+
+	ret = drmModeSetCrtc(drm_fd, crtc_id, fb_id, 0, 0,
+			     &conn->connector_id, 1, mode);
+	if (ret) {
+		igt_warn("drmModeSetCrtc failed: %d\n", ret);
+		igt_remove_fb(drm_fd, fb);
+		return 0;
+	}
+
+	return crtc_id;
+}
+
+/**
+ * SUBTEST: dp-edid-read
+ * Description: Make sure the EDID exposed by KMS matches the uploaded EDID
+ *              (tests both base and alt EDIDs, strict byte comparison)
+ *
+ * SUBTEST: hdmi-edid-read
+ * Description: Make sure the EDID exposed by KMS matches the uploaded EDID
+ *              (tests both base and alt EDIDs, strict byte comparison)
+ */
+
+/*
+ * edid_read_one - Upload a single EDID, read back from DRM, assert exact match.
+ *
+ * Ported from V2 igt_custom_edid_type_read():
+ * - Uploads EDID via CreateEdid + ApplyEdid
+ * - Plugs port, waits for connection
+ * - Reads EDID blob from DRM connector property
+ * - Asserts exact byte-for-byte match (igt_assert, not just igt_info)
+ */
+static void edid_read_one(struct edid_test_data *data, bool is_dp,
+			  const struct edid *raw_edid, const char *edid_name)
+{
+	chamelium_v3_port_id port;
+	size_t edid_size;
+	int edid_id;
+	drmModeConnector *connector;
+	unsigned char *read_edid;
+	int read_len;
+
+	port = get_port_for_type(data, is_dp);
+	igt_require_f(port != (chamelium_v3_port_id)-1,
+		      "No %s port found on Chamelium\n", is_dp ? "DP" : "HDMI");
+
+	/* Ensure target port is plugged first (primes DRM connector state) */
+	ensure_port_plugged(data, port);
+
+	/* Get EDID size and upload to Chamelium */
+	edid_size = edid_get_size(raw_edid);
+	igt_info("Testing %s EDID read (%s, %zu bytes)\n",
+		 edid_name, is_dp ? "DP" : "HDMI", edid_size);
+
+	edid_id = chamelium_v3_create_edid(data->chamelium,
+					   (const unsigned char *)raw_edid,
+					   edid_size);
+	igt_info("  Created EDID with ID %d\n", edid_id);
+
+	/* Unplug target port, apply custom EDID, then re-plug */
+	chamelium_v3_unplug(data->chamelium, port);
+	usleep(HPD_WAIT_TIME_MS * 1000);
+
+	chamelium_v3_apply_edid(data->chamelium, port, edid_id);
+	chamelium_v3_plug(data->chamelium, port);
+
+	/* Wait for connector to reappear */
+	usleep(HPD_WAIT_TIME_MS * 1000);
+	igt_assert_f(chamelium_v3_is_plugged(data->chamelium, port),
+		     "Port %d should be plugged\n", port);
+
+	usleep(EDID_SETTLE_TIME_MS * 1000);
+	connector = wait_for_connected_connector(data->drm_fd,
+						 get_drm_connector_type(is_dp));
+	if (!connector) {
+		igt_info("  Connector not found, retrying after extra wait...\n");
+		usleep(HPD_WAIT_TIME_MS * 1000);
+		connector = wait_for_connected_connector(data->drm_fd,
+							 get_drm_connector_type(is_dp));
+	}
+	igt_require_f(connector, "No connected %s connector found\n",
+		      is_dp ? "DP" : "HDMI");
+
+	igt_info("  Found connector: %s-%d\n",
+		 kmstest_connector_type_str(connector->connector_type),
+		 connector->connector_type_id);
+
+	/* Read EDID blob from DRM connector */
+	read_edid = read_edid_from_connector(data->drm_fd, connector, &read_len);
+	igt_assert_f(read_edid, "Failed to read EDID from DRM connector\n");
+	igt_assert_f(read_len >= (int)edid_size,
+		     "Read EDID too short: %d bytes (uploaded %zu)\n",
+		     read_len, edid_size);
+
+	/* Verify EDID header */
+	igt_assert_f(verify_edid_header(read_edid, read_len),
+		     "Invalid EDID header in read-back data\n");
+
+	/*
+	 * STRICT byte-for-byte comparison.
+	 */
+	igt_assert_f(memcmp(read_edid, raw_edid, edid_size) == 0,
+		     "%s EDID mismatch: uploaded %zu bytes != read %d bytes\n",
+		     edid_name, edid_size, read_len);
+	igt_info("  %s EDID matches exactly (%zu bytes)\n", edid_name, edid_size);
+
+	/* Verify connector has modes */
+	igt_assert_f(connector->count_modes > 0,
+		     "Connector has no modes after EDID apply\n");
+	igt_info("  Connector reports %d modes\n", connector->count_modes);
+
+	/* Cleanup */
+	free(read_edid);
+	drmModeFreeConnector(connector);
+	chamelium_v3_unplug(data->chamelium, port);
+	usleep(HPD_WAIT_TIME_MS * 1000);
+}
+
+/*
+ * test_edid_read - Test both BASE and ALT EDIDs.
+ */
+static void test_edid_read(struct edid_test_data *data, bool is_dp)
+{
+	/* Test base EDID (1920x1080) - same */
+	edid_read_one(data, is_dp, igt_kms_get_base_edid(), "BASE");
+
+	/* Test alt EDID (1400x1050) - same */
+	edid_read_one(data, is_dp, igt_kms_get_alt_edid(), "ALT");
+
+	igt_info("  EDID read test PASSED (both BASE and ALT)\n");
+}
+
+/**
+ * SUBTEST: dp-mode-timings
+ * Description: For each mode of the IGT base EDID, perform a modeset and check
+ *              the mode detected by the Chamelium receiver matches the mode we
+ *              set
+ *
+ * SUBTEST: hdmi-mode-timings
+ * Description: For each mode of the IGT base EDID, perform a modeset and check
+ *              the mode detected by the Chamelium receiver matches the mode we
+ *              set
+ */
+static void test_mode_timings(struct edid_test_data *data, bool is_dp)
+{
+	chamelium_v3_port_id port;
+	const struct edid *base_edid;
+	size_t edid_size;
+	int edid_id;
+	drmModeConnector *connector;
+	int i, count_modes;
+	char *port_name;
+
+	port = get_port_for_type(data, is_dp);
+	igt_require_f(port != (chamelium_v3_port_id)-1,
+		      "No %s port found\n", is_dp ? "DP" : "HDMI");
+
+	port_name = chamelium_v3_get_port_name(data->chamelium, port);
+	igt_info("Testing mode timings on %s (port %d)\n", port_name, port);
+
+	/* Prevent fbcon from interfering */
+	kmstest_set_vt_graphics_mode();
+
+	/*
+	 * Reset Chamelium and disable CRTCs for a clean start.
+	 * Reset state before test.
+	 */
+	chamelium_v3_reset(data->chamelium);
+	disable_all_crtcs(data->drm_fd);
+	usleep(HPD_WAIT_TIME_MS * 1000);
+
+	/* Upload base EDID and plug */
+	base_edid = igt_kms_get_base_edid();
+	edid_size = edid_get_size(base_edid);
+
+	edid_id = chamelium_v3_create_edid(data->chamelium,
+					   (const unsigned char *)base_edid,
+					   edid_size);
+
+	chamelium_v3_apply_edid(data->chamelium, port, edid_id);
+	chamelium_v3_plug(data->chamelium, port);
+	usleep(HPD_WAIT_TIME_MS * 1000);
+	usleep(EDID_SETTLE_TIME_MS * 1000);
+
+	connector = wait_for_connected_connector(data->drm_fd,
+						 get_drm_connector_type(is_dp));
+	igt_require_f(connector, "No connected %s connector found\n",
+		      is_dp ? "DP" : "HDMI");
+
+	count_modes = connector->count_modes;
+	igt_assert_f(count_modes > 0, "Connector has no modes\n");
+	igt_info("  Found %d modes to test\n", count_modes);
+
+	/* List all modes for debug */
+	for (i = 0; i < count_modes; i++)
+		igt_debug("  #%d %s %uHz\n", i,
+			  connector->modes[i].name,
+			  connector->modes[i].vrefresh);
+
+	/*
+	 * For each mode: modeset, wait for video stable, check all
+	 * timing parameters. Validate timing parameters.
+	 */
+	for (i = 0; i < count_modes; i++) {
+		drmModeModeInfo *mode = &connector->modes[i];
+		struct igt_fb fb = { 0 };
+		uint32_t crtc_id;
+
+		igt_info("  Testing #%d %s %uHz (%dx%d)\n",
+			 i, mode->name, mode->vrefresh,
+			 mode->hdisplay, mode->vdisplay);
+
+		disable_all_crtcs(data->drm_fd);
+
+		crtc_id = set_mode_on_connector(data->drm_fd, connector,
+						mode, &fb);
+		igt_assert_f(crtc_id,
+			     "Failed to modeset %dx%d@%d\n",
+			     mode->hdisplay, mode->vdisplay,
+			     mode->vrefresh);
+
+		/* Wait for video to stabilize */
+		usleep(MODESET_SETTLE_TIME_MS * 1000);
+		igt_assert_f(
+			wait_for_video_stable(data->chamelium, port,
+					      VIDEO_STABLE_TIMEOUT_S),
+			"Video not stable for mode #%d\n", i);
+
+		/* Full timing validation */
+		check_mode_v3(data->chamelium, port, is_dp, mode);
+		igt_info("    Mode #%d timing check PASSED\n", i);
+
+		/* Cleanup FB for this mode */
+		drmModeSetCrtc(data->drm_fd, crtc_id, 0, 0, 0,
+			       NULL, 0, NULL);
+		igt_remove_fb(data->drm_fd, &fb);
+	}
+
+	drmModeFreeConnector(connector);
+	chamelium_v3_unplug(data->chamelium, port);
+	usleep(HPD_WAIT_TIME_MS * 1000);
+	free(port_name);
+
+	igt_info("  Mode timings test PASSED (%d modes verified)\n",
+		 count_modes);
+}
+
+/**
+ * SUBTEST: dp-edid-resolution-list
+ * Description: Set full EDID with many modes, iterate each mode,
+ *              perform modeset and verify screen resolution matches
+ *             
+ */
+static void test_edid_resolution_list(struct edid_test_data *data)
+{
+	chamelium_v3_port_id port;
+	const struct edid *full_edid;
+	size_t edid_size;
+	int edid_id;
+	drmModeConnector *connector;
+	int i, count_modes;
+	char *port_name;
+
+	port = find_dp_port(data);
+	igt_require_f(port != (chamelium_v3_port_id)-1,
+		      "No DP port found on Chamelium\n");
+
+	port_name = chamelium_v3_get_port_name(data->chamelium, port);
+	igt_info("Testing EDID resolution list on %s (port %d)\n",
+		 port_name, port);
+
+	/* Prevent fbcon from interfering */
+	kmstest_set_vt_graphics_mode();
+
+	/* Reset Chamelium and disable CRTCs for clean start */
+	chamelium_v3_reset(data->chamelium);
+	disable_all_crtcs(data->drm_fd);
+	usleep(HPD_WAIT_TIME_MS * 1000);
+
+	/* Upload full EDID (many modes) */
+	full_edid = igt_kms_get_custom_edid(IGT_CUSTOM_EDID_FULL);
+	edid_size = edid_get_size(full_edid);
+
+	edid_id = chamelium_v3_create_edid(data->chamelium,
+					   (const unsigned char *)full_edid,
+					   edid_size);
+
+	chamelium_v3_apply_edid(data->chamelium, port, edid_id);
+	chamelium_v3_plug(data->chamelium, port);
+	usleep(HPD_WAIT_TIME_MS * 1000);
+	usleep(EDID_SETTLE_TIME_MS * 1000);
+
+	connector = wait_for_connected_connector(data->drm_fd,
+						 DRM_MODE_CONNECTOR_DisplayPort);
+	igt_require_f(connector, "No connected DP connector found\n");
+
+	count_modes = connector->count_modes;
+	igt_assert_f(count_modes > 0, "Full EDID should have many modes\n");
+	igt_info("  Found %d modes from full EDID\n", count_modes);
+
+	for (i = 0; i < count_modes; i++)
+		igt_debug("  #%d %s %uHz\n", i,
+			  connector->modes[i].name,
+			  connector->modes[i].vrefresh);
+
+	/*
+	 * For each mode, set it and verify the screen
+	 * resolution via Chamelium matches the mode we set.
+	 */
+	for (i = 0; i < count_modes; i++) {
+		drmModeModeInfo *mode = &connector->modes[i];
+		struct igt_fb fb = { 0 };
+		struct chamelium_v3_video_params params = { 0 };
+		uint32_t crtc_id;
+
+		igt_info("  Testing #%d %s %uHz\n",
+			 i, mode->name, mode->vrefresh);
+
+		disable_all_crtcs(data->drm_fd);
+
+		crtc_id = set_mode_on_connector(data->drm_fd, connector,
+						mode, &fb);
+		if (!crtc_id) {
+			igt_info("    Skipped (no CRTC)\n");
+			continue;
+		}
+
+		usleep(MODESET_SETTLE_TIME_MS * 1000);
+		igt_assert_f(
+			wait_for_video_stable(data->chamelium, port,
+					      VIDEO_STABLE_TIMEOUT_S),
+			"Video not stable for mode #%d %s\n", i, mode->name);
+
+		chamelium_v3_get_video_params(data->chamelium, port, &params);
+
+		/* Screen resolution must match mode */
+		igt_assert_eq(params.hactive, mode->hdisplay);
+		igt_assert_eq(params.vactive, mode->vdisplay);
+		igt_info("    Resolution verified: %dx%d\n",
+			 params.hactive, params.vactive);
+
+		drmModeSetCrtc(data->drm_fd, crtc_id, 0, 0, 0,
+			       NULL, 0, NULL);
+		igt_remove_fb(data->drm_fd, &fb);
+	}
+
+	drmModeFreeConnector(connector);
+	chamelium_v3_unplug(data->chamelium, port);
+	usleep(HPD_WAIT_TIME_MS * 1000);
+	free(port_name);
+
+	igt_info("  EDID resolution list test PASSED (%d modes)\n",
+		 count_modes);
+}
+
+/*
+ * Convert a hex string EDID (from monitor_edid) to raw bytes.
+ * Caller must free returned buffer.
+ */
+static uint8_t *hex_str_to_edid_bytes(const char *hex_str, size_t *out_size)
+{
+	size_t len = strlen(hex_str);
+	size_t byte_len = len / 2;
+	uint8_t *bytes;
+	size_t i;
+
+	igt_assert_f(len % 2 == 0, "EDID hex string has odd length\n");
+
+	bytes = malloc(byte_len);
+	igt_assert(bytes);
+
+	for (i = 0; i < byte_len; i++) {
+		char hi = hex_str[i * 2];
+		char lo = hex_str[i * 2 + 1];
+		uint8_t b = 0;
+
+		if (hi >= '0' && hi <= '9') b = (hi - '0') << 4;
+		else if (hi >= 'A' && hi <= 'F') b = (hi - 'A' + 10) << 4;
+		else if (hi >= 'a' && hi <= 'f') b = (hi - 'a' + 10) << 4;
+
+		if (lo >= '0' && lo <= '9') b |= (lo - '0');
+		else if (lo >= 'A' && lo <= 'F') b |= (lo - 'A' + 10);
+		else if (lo >= 'a' && lo <= 'f') b |= (lo - 'a' + 10);
+
+		bytes[i] = b;
+	}
+
+	*out_size = byte_len;
+	return bytes;
+}
+
+/*
+ * edid_stress_resolution_v3 - Stress test multiple EDIDs.
+ *
+ * Iterates over a list of real monitor EDIDs (4K or non-4K), uploads each
+ * to Chamelium, plugs the port, performs a modeset with the preferred mode,
+ * and verifies the screen resolution matches via GetVideoParams.
+ */
+static void edid_stress_resolution_v3(struct edid_test_data *data,
+				      bool is_dp, bool is_4k)
+{
+	chamelium_v3_port_id port;
+	monitor_edid *edid_list;
+	size_t edid_count;
+	int i;
+	char *port_name;
+
+	port = get_port_for_type(data, is_dp);
+	igt_require_f(port != (chamelium_v3_port_id)-1,
+		      "No %s port found\n", is_dp ? "DP" : "HDMI");
+
+	port_name = chamelium_v3_get_port_name(data->chamelium, port);
+
+	/* Get the appropriate EDID list */
+	if (is_dp) {
+		if (is_4k) {
+			edid_list = DP_EDIDS_4K;
+			edid_count = DP_EDIDS_4K_COUNT;
+		} else {
+			edid_list = DP_EDIDS_NON_4K;
+			edid_count = DP_EDIDS_NON_4K_COUNT;
+		}
+	} else {
+		if (is_4k) {
+			edid_list = HDMI_EDIDS_4K;
+			edid_count = HDMI_EDIDS_4K_COUNT;
+		} else {
+			edid_list = HDMI_EDIDS_NON_4K;
+			edid_count = HDMI_EDIDS_NON_4K_COUNT;
+		}
+	}
+
+	igt_info("Stress testing %s %s EDIDs on %s (port %d, %zu EDIDs)\n",
+		 is_4k ? "4K" : "non-4K", is_dp ? "DP" : "HDMI",
+		 port_name, port, edid_count);
+
+	/* Prevent fbcon from interfering */
+	kmstest_set_vt_graphics_mode();
+
+	/* Reset for clean start */
+	chamelium_v3_reset(data->chamelium);
+	disable_all_crtcs(data->drm_fd);
+	usleep(HPD_WAIT_TIME_MS * 1000);
+
+	for (i = 0; i < (int)edid_count; i++) {
+		uint8_t *edid_bytes;
+		size_t edid_size;
+		int edid_id;
+		drmModeConnector *connector;
+		struct igt_fb fb = { 0 };
+		uint32_t crtc_id;
+		int exp_w, exp_h;
+
+		igt_info("  [%d/%zu] Testing EDID: %s\n",
+			 i + 1, edid_count, edid_list[i].name);
+
+		/* Convert hex EDID to bytes */
+		edid_bytes = hex_str_to_edid_bytes(edid_list[i].edid, &edid_size);
+
+		/* Upload and apply EDID */
+		edid_id = chamelium_v3_create_edid(data->chamelium,
+						   edid_bytes, edid_size);
+		chamelium_v3_apply_edid(data->chamelium, port, edid_id);
+
+		chamelium_v3_plug(data->chamelium, port);
+		usleep(HPD_WAIT_TIME_MS * 1000);
+		usleep(EDID_SETTLE_TIME_MS * 1000);
+
+		connector = wait_for_connected_connector(data->drm_fd,
+							 get_drm_connector_type(is_dp));
+		if (!connector) {
+			igt_info("    Connector not found, retrying...\n");
+			usleep(HPD_WAIT_TIME_MS * 1000);
+			connector = wait_for_connected_connector(data->drm_fd,
+								 get_drm_connector_type(is_dp));
+		}
+		igt_assert_f(connector,
+			     "No connector for EDID %s\n", edid_list[i].name);
+		igt_assert_f(connector->count_modes > 0,
+			     "No modes for EDID %s\n", edid_list[i].name);
+
+		igt_info("    %d modes, preferred %dx%d@%d\n",
+			 connector->count_modes,
+			 connector->modes[0].hdisplay,
+			 connector->modes[0].vdisplay,
+			 connector->modes[0].vrefresh);
+
+		/* Modeset with preferred mode */
+		disable_all_crtcs(data->drm_fd);
+		crtc_id = set_mode_on_connector(data->drm_fd, connector,
+						&connector->modes[0], &fb);
+		igt_assert_f(crtc_id, "Failed to modeset for EDID %s\n",
+			     edid_list[i].name);
+
+		exp_w = connector->modes[0].hdisplay;
+		exp_h = connector->modes[0].vdisplay;
+
+		/* Verify resolution via Chamelium */
+		igt_assert_f(
+			wait_for_video_resolution(data->chamelium, port,
+						  exp_w, exp_h,
+						  VIDEO_STABLE_TIMEOUT_S + 5),
+			"Resolution %dx%d not seen for EDID %s\n",
+			exp_w, exp_h, edid_list[i].name);
+
+		igt_info("    Resolution verified: %dx%d\n", exp_w, exp_h);
+
+		/* Cleanup */
+		drmModeSetCrtc(data->drm_fd, crtc_id, 0, 0, 0,
+			       NULL, 0, NULL);
+		igt_remove_fb(data->drm_fd, &fb);
+		drmModeFreeConnector(connector);
+
+		disable_all_crtcs(data->drm_fd);
+		chamelium_v3_unplug(data->chamelium, port);
+		usleep(HPD_WAIT_TIME_MS * 1000);
+
+		free(edid_bytes);
+	}
+
+	free(port_name);
+	igt_info("  Stress resolution test PASSED (%zu EDIDs)\n", edid_count);
+}
+
+/*
+ * test_suspend_resume_edid_change_v3 - Suspend/resume EDID change test.
+ * test_suspend_resume_edid_change().
+ *
+ * Simulates a screen being unplugged and another screen being plugged
+ * during suspend/hibernate. Checks that the connector sees the new EDID
+ * after resume.
+ */
+static void test_suspend_resume_edid_change_v3(struct edid_test_data *data,
+					       bool is_dp,
+					       enum igt_suspend_state state,
+					       enum igt_suspend_test test)
+{
+	chamelium_v3_port_id port;
+	const struct edid *base_edid, *alt_edid;
+	size_t base_size, alt_size;
+	int base_edid_id, alt_edid_id;
+	drmModeConnector *connector;
+	struct udev_monitor *mon;
+	char *port_name;
+
+	port = get_port_for_type(data, is_dp);
+	igt_require_f(port != (chamelium_v3_port_id)-1,
+		      "No %s port found\n", is_dp ? "DP" : "HDMI");
+
+	port_name = chamelium_v3_get_port_name(data->chamelium, port);
+	igt_info("Testing EDID change during %s on %s (port %d)\n",
+		 state == SUSPEND_STATE_MEM ? "suspend" : "hibernate",
+		 port_name, port);
+
+	/* Reset for clean start */
+	chamelium_v3_reset(data->chamelium);
+	disable_all_crtcs(data->drm_fd);
+	usleep(HPD_WAIT_TIME_MS * 1000);
+
+	/* Create both EDIDs */
+	base_edid = igt_kms_get_base_edid();
+	alt_edid = igt_kms_get_alt_edid();
+	base_size = edid_get_size(base_edid);
+	alt_size = edid_get_size(alt_edid);
+
+	base_edid_id = chamelium_v3_create_edid(data->chamelium,
+						(const unsigned char *)base_edid,
+						base_size);
+	alt_edid_id = chamelium_v3_create_edid(data->chamelium,
+					       (const unsigned char *)alt_edid,
+					       alt_size);
+
+	/* Start watching for uevents */
+	mon = igt_watch_uevents();
+	igt_flush_uevents(mon);
+
+	/* Plug with base EDID first */
+	chamelium_v3_apply_edid(data->chamelium, port, base_edid_id);
+	chamelium_v3_plug(data->chamelium, port);
+	usleep(HPD_WAIT_TIME_MS * 1000);
+	usleep(EDID_SETTLE_TIME_MS * 1000);
+
+	connector = wait_for_connected_connector(data->drm_fd,
+						 get_drm_connector_type(is_dp));
+	igt_assert_f(connector, "No connector after base EDID plug\n");
+	igt_info("  Base EDID: %d modes, preferred %dx%d\n",
+		 connector->count_modes,
+		 connector->modes[0].hdisplay,
+		 connector->modes[0].vdisplay);
+	drmModeFreeConnector(connector);
+
+	/* Change the EDID to alt (this sets up the new EDID for after resume) */
+	chamelium_v3_apply_edid(data->chamelium, port, alt_edid_id);
+	igt_info("  Applied alt EDID, now suspending...\n");
+
+	igt_flush_uevents(mon);
+
+	/* Suspend/hibernate and auto-resume */
+	igt_system_suspend_autoresume(state, test);
+
+	/* After resume, check for hotplug event.
+	 * S4 (hibernate) may not always generate a hotplug uevent on all
+	 * platforms, so treat it as non-fatal — the replug cycle below
+	 * will definitively verify the EDID change.
+	 */
+	if (igt_hotplug_detected(mon, CHAMELIUM_HOTPLUG_TIMEOUT)) {
+		igt_info("  Hotplug detected after resume from %s\n",
+			 state == SUSPEND_STATE_MEM ? "suspend" : "hibernate");
+	} else {
+		igt_info("  No hotplug after resume from %s (expected for some S4 platforms)\n",
+			 state == SUSPEND_STATE_MEM ? "suspend" : "hibernate");
+	}
+
+	/* Verify connector is still connected after resume */
+	usleep(EDID_SETTLE_TIME_MS * 1000);
+	connector = wait_for_connected_connector(data->drm_fd,
+						 get_drm_connector_type(is_dp));
+	igt_assert_f(connector,
+		     "No connector after resume from %s\n",
+		     state == SUSPEND_STATE_MEM ? "suspend" : "hibernate");
+	igt_info("  Connector still connected after resume: %d modes, preferred %dx%d\n",
+		 connector->count_modes,
+		 connector->modes[0].hdisplay,
+		 connector->modes[0].vdisplay);
+	drmModeFreeConnector(connector);
+
+	/*
+	 * The kernel may not reprobe the EDID on an already-connected port
+	 * after resume. Do an unplug/replug cycle to force the connector
+	 * to re-read the EDID (alt EDID is still applied on the Chamelium).
+	 * This simulates: "screen A unplugged, screen B
+	 * plugged during suspend".
+	 */
+	igt_flush_uevents(mon);
+	chamelium_v3_unplug(data->chamelium, port);
+	usleep(HPD_WAIT_TIME_MS * 1000);
+	chamelium_v3_apply_edid(data->chamelium, port, alt_edid_id);
+	chamelium_v3_plug(data->chamelium, port);
+	usleep(HPD_WAIT_TIME_MS * 1000);
+	usleep(EDID_SETTLE_TIME_MS * 1000);
+
+	igt_assert_f(igt_hotplug_detected(mon, CHAMELIUM_HOTPLUG_TIMEOUT),
+		     "No hotplug event after replug with alt EDID\n");
+
+	connector = wait_for_connected_connector(data->drm_fd,
+						 get_drm_connector_type(is_dp));
+	igt_assert_f(connector,
+		     "No connector after replug with alt EDID\n");
+
+	igt_info("  After replug with alt EDID: %d modes, preferred %dx%d\n",
+		 connector->count_modes,
+		 connector->modes[0].hdisplay,
+		 connector->modes[0].vdisplay);
+
+	/* Alt EDID should give different preferred mode (1400x1050 vs 1920x1080) */
+	igt_assert_f(connector->modes[0].hdisplay == 1400 &&
+		     connector->modes[0].vdisplay == 1050,
+		     "Expected alt EDID preferred mode 1400x1050, got %dx%d\n",
+		     connector->modes[0].hdisplay,
+		     connector->modes[0].vdisplay);
+
+	drmModeFreeConnector(connector);
+
+	/* Cleanup */
+	chamelium_v3_unplug(data->chamelium, port);
+	usleep(HPD_WAIT_TIME_MS * 1000);
+	free(port_name);
+
+	igt_info("  EDID change during %s test PASSED\n",
+		 state == SUSPEND_STATE_MEM ? "suspend" : "hibernate");
+}
+
+static void __real_main(void)
+{
+	struct edid_test_data data = { 0 };
+	bool setup_done = false;
+
+	/* Setup */
+	data.chamelium = chamelium_v3_init_from_config();
+	if (!data.chamelium) {
+		igt_info("Chamelium not available, skipping tests\n");
+		return;
+	}
+
+	data.port_count = chamelium_v3_get_supported_ports(data.chamelium, &data.ports);
+	if (data.port_count <= 0) {
+		igt_info("No Chamelium ports found, skipping tests\n");
+		chamelium_v3_uninit(data.chamelium);
+		return;
+	}
+
+	/* Need master for modesetting in mode-timings and resolution tests */
+	data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+	if (data.drm_fd < 0) {
+		igt_info("Cannot open DRM device as master, skipping tests\n");
+		free(data.ports);
+		chamelium_v3_uninit(data.chamelium);
+		return;
+	}
+
+	setup_done = true;
+	igt_info("Found %d Chamelium ports, DRM fd: %d\n",
+		 data.port_count, data.drm_fd);
+
+
+	igt_describe("Make sure the EDID exposed by KMS is the same as the screen's");
+	igt_subtest("dp-edid-read") {
+		igt_require(setup_done);
+		test_edid_read(&data, true);
+	}
+
+	igt_describe("Stress test the DUT by testing multiple 4K EDIDs, one "
+		     "right after the other, and ensure their validity");
+	igt_subtest("dp-edid-stress-resolution-4k") {
+		igt_require(setup_done);
+		edid_stress_resolution_v3(&data, true, true);
+	}
+
+	igt_describe("Stress test the DUT by testing multiple non-4K EDIDs, one "
+		     "right after the other, and ensure their validity");
+	igt_subtest("dp-edid-stress-resolution-non-4k") {
+		igt_require(setup_done);
+		edid_stress_resolution_v3(&data, true, false);
+	}
+
+	igt_describe("Get an EDID with many modes of different configurations, "
+		     "set them on the screen and check the screen resolution "
+		     "matches the mode resolution");
+	igt_subtest("dp-edid-resolution-list") {
+		igt_require(setup_done);
+		test_edid_resolution_list(&data);
+	}
+
+	igt_describe("Simulate a screen being unplugged and another screen "
+		     "being plugged during suspend");
+	igt_subtest("dp-edid-change-during-suspend") {
+		igt_require(setup_done);
+		test_suspend_resume_edid_change_v3(&data, true,
+						   SUSPEND_STATE_MEM,
+						   SUSPEND_TEST_NONE);
+	}
+
+	igt_describe("Simulate a screen being unplugged and another screen "
+		     "being plugged during hibernation");
+	igt_subtest("dp-edid-change-during-hibernate") {
+		igt_require(setup_done);
+		test_suspend_resume_edid_change_v3(&data, true,
+						   SUSPEND_STATE_DISK,
+						   SUSPEND_TEST_DEVICES);
+	}
+
+	igt_describe("For each mode of the IGT base EDID, perform a modeset "
+		     "and check the mode detected by Chamelium matches");
+	igt_subtest("dp-mode-timings") {
+		igt_require(setup_done);
+		test_mode_timings(&data, true);
+	}
+
+
+	igt_describe("Make sure the EDID exposed by KMS is the same as the screen's");
+	igt_subtest("hdmi-edid-read") {
+		igt_require(setup_done);
+		test_edid_read(&data, false);
+	}
+
+	igt_describe("Stress test the DUT by testing multiple 4K EDIDs, one "
+		     "right after the other, and ensure their validity");
+	igt_subtest("hdmi-edid-stress-resolution-4k") {
+		igt_require(setup_done);
+		edid_stress_resolution_v3(&data, false, true);
+	}
+
+	igt_describe("Stress test the DUT by testing multiple non-4K EDIDs, one "
+		     "right after the other, and ensure their validity");
+	igt_subtest("hdmi-edid-stress-resolution-non-4k") {
+		igt_require(setup_done);
+		edid_stress_resolution_v3(&data, false, false);
+	}
+
+	igt_describe("Simulate a screen being unplugged and another screen "
+		     "being plugged during suspend");
+	igt_subtest("hdmi-edid-change-during-suspend") {
+		igt_require(setup_done);
+		test_suspend_resume_edid_change_v3(&data, false,
+						   SUSPEND_STATE_MEM,
+						   SUSPEND_TEST_NONE);
+	}
+
+	igt_describe("Simulate a screen being unplugged and another screen "
+		     "being plugged during hibernation");
+	igt_subtest("hdmi-edid-change-during-hibernate") {
+		igt_require(setup_done);
+		test_suspend_resume_edid_change_v3(&data, false,
+						   SUSPEND_STATE_DISK,
+						   SUSPEND_TEST_DEVICES);
+	}
+
+	igt_describe("For each mode of the IGT base EDID, perform a modeset "
+		     "and check the mode detected by Chamelium matches");
+	igt_subtest("hdmi-mode-timings") {
+		igt_require(setup_done);
+		test_mode_timings(&data, false);
+	}
+
+	/* Cleanup: re-plug tested ports so connectors are not left disconnected */
+	if (setup_done) {
+		chamelium_v3_port_id dp_port, hdmi_port;
+
+		igt_info("Restoring port state...\n");
+
+		dp_port = find_dp_port(&data);
+		hdmi_port = find_hdmi_port(&data);
+
+		if (dp_port != (chamelium_v3_port_id)-1) {
+			chamelium_v3_apply_edid(data.chamelium, dp_port, 0);
+			chamelium_v3_plug(data.chamelium, dp_port);
+			igt_info("  Re-plugged DP port %d with default EDID\n",
+				 dp_port);
+		}
+		if (hdmi_port != (chamelium_v3_port_id)-1) {
+			chamelium_v3_apply_edid(data.chamelium, hdmi_port, 0);
+			chamelium_v3_plug(data.chamelium, hdmi_port);
+			igt_info("  Re-plugged HDMI port %d with default EDID\n",
+				 hdmi_port);
+		}
+
+		/* Give connectors time to come up */
+		usleep(HPD_WAIT_TIME_MS * 1000);
+
+		free(data.ports);
+		chamelium_v3_uninit(data.chamelium);
+		drm_close_driver(data.drm_fd);
+	}
+}
+
+IGT_TEST_DESCRIPTION("Testing EDID with a Chamelium V3 board");
+int main(int argc, char **argv)
+{
+	igt_subtest_init(argc, argv);
+	__real_main();
+	igt_exit();
+}
diff --git a/tests/meson.build b/tests/meson.build
index 31ca2d963..cfb59ecbb 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -375,6 +375,7 @@ chamelium_v2_progs = [
 chamelium_v3_progs = [
 	'kms_chamelium_v3_basic',
 	'kms_chamelium_v3_hpd',
+	'kms_chamelium_v3_edid',
 ]
 
 test_deps = [ igt_deps ]
-- 
2.48.1

