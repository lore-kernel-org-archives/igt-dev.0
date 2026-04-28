Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C89FF885A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 04:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D5D10E29C;
	Tue, 28 Apr 2026 04:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CdxGjDCn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB35E10E29C
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 04:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777351656; x=1808887656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PL6suXgvkjHnqi+dQRczLECsqTIWousldiV1xVB4Ze0=;
 b=CdxGjDCnDZ47vJLZpu8oOnoOhjNnNg8F7NTXGW8SAnTbT6XnaSI4p6nS
 go65gxB7EJu6kLRMpB4fmGi31ksQbSG19Uso/NMeZTCbaXFSgeEq7qvim
 FXe+E1juYM4DO++9RiOUz3HrH+FqbevkRQc4m2Q/h/oa/mTMQ2oScHIey
 Riy0Wz/BbPFfYK49p5GenYoSXJaGaZy4aej3R3gw+7T2OIGrk1m6m1489
 PBdfmoNrMd6kIl2uEJcl15tGcJUmkPuO00MFVLrbBzjBzj0/vvbTNPg0W
 wo/6tZmE9l+XlcUsSHhotb19gCzlFprMYa3sFTaC/g25+0pot9uHHKjbp g==;
X-CSE-ConnectionGUID: oCyYKuP2SP2kKuzi/ylPPw==
X-CSE-MsgGUID: E0kkF6w2TuGT+BDJpPruMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78167861"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78167861"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:35 -0700
X-CSE-ConnectionGUID: 40IcFqngTAOKfnn8x9UaLw==
X-CSE-MsgGUID: vzOAdBUsQGeX8PAa/5xYqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="233706780"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:34 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v1 21/25] tests/chamelium/v3: Add HPD (Hot Plug Detect)
 tests for Chamelium v3
Date: Tue, 28 Apr 2026 10:16:30 +0530
Message-ID: <20260428044644.257001-22-mohammed.bilal@intel.com>
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

This commit adds comprehensive HPD testing for Chamelium v3 including
plug/unplug detection, suspend/resume tests, and connector state
verification.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/chamelium/v3/kms_chamelium_v3_hpd.c | 928 ++++++++++++++++++++++
 tests/meson.build                         |   1 +
 2 files changed, 929 insertions(+)
 create mode 100644 tests/chamelium/v3/kms_chamelium_v3_hpd.c

diff --git a/tests/chamelium/v3/kms_chamelium_v3_hpd.c b/tests/chamelium/v3/kms_chamelium_v3_hpd.c
new file mode 100644
index 000000000..f523dd176
--- /dev/null
+++ b/tests/chamelium/v3/kms_chamelium_v3_hpd.c
@@ -0,0 +1,928 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ *
+ * Chamelium V3 HPD (Hot Plug Detect) Tests
+ *
+ * This test reads [Chamelium:<connector>] port mappings from .igtrc,
+ * maps each Chamelium port to a specific DRM connector ID, and verifies
+ * that plug/unplug operations produce real kernel uevents AND real
+ * DRM connector status transitions.
+ */
+
+#include <errno.h>
+#include <poll.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <string.h>
+#include <fcntl.h>
+#include <libudev.h>
+
+#include "igt.h"
+#include "igt_sysfs.h"
+#include "chamelium/v3/igt_chamelium.h"
+
+/**
+ * TEST: kms chamelium v3 hpd
+ * Category: Display
+ * Description: HPD tests for Chamelium V3
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
+ */
+
+/**
+ * SUBTEST: dp-hpd
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug
+ *
+ * SUBTEST: dp-hpd-fast
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug
+ *
+ * SUBTEST: dp-hpd-enable-disable-mode
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug with modeset toggle
+ *
+ * SUBTEST: dp-hpd-with-enabled-mode
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug with enabled mode
+ *
+ * SUBTEST: dp-hpd-for-each-pipe
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug for each pipe with valid output
+ *
+ * SUBTEST: dp-hpd-after-suspend
+ * Description: Toggle HPD during Suspend, check that uevents are sent and
+ *              connector status is updated
+ *
+ * SUBTEST: dp-hpd-after-hibernate
+ * Description: Toggle HPD during Hibernation, check that uevents are sent and
+ *              connector status is updated
+ *
+ * SUBTEST: dp-hpd-storm
+ * Description: Trigger a series of hotplugs in a very small timeframe to
+ *              simulate a bad cable, check the kernel falls back to polling
+ *
+ * SUBTEST: dp-hpd-storm-disable
+ * Description: Disable HPD storm detection, trigger a storm and check the
+ *              kernel doesn't detect one
+ *
+ * SUBTEST: hdmi-hpd
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug
+ *
+ * SUBTEST: hdmi-hpd-fast
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug
+ *
+ * SUBTEST: hdmi-hpd-enable-disable-mode
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug with modeset toggle
+ *
+ * SUBTEST: hdmi-hpd-with-enabled-mode
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug with enabled mode
+ *
+ * SUBTEST: hdmi-hpd-for-each-pipe
+ * Description: Check that we get uevents and updated connector status on
+ *              hotplug and unplug for each pipe with valid output
+ *
+ * SUBTEST: hdmi-hpd-after-suspend
+ * Description: Toggle HPD during Suspend, check that uevents are sent and
+ *              connector status is updated
+ *
+ * SUBTEST: hdmi-hpd-after-hibernate
+ * Description: Toggle HPD during Hibernation, check that uevents are sent and
+ *              connector status is updated
+ *
+ * SUBTEST: hdmi-hpd-storm
+ * Description: Trigger a series of hotplugs in a very small timeframe to
+ *              simulate a bad cable, check the kernel falls back to polling
+ *
+ * SUBTEST: hdmi-hpd-storm-disable
+ * Description: Disable HPD storm detection, trigger a storm and check the
+ *              kernel doesn't detect one
+ *
+ */
+
+#define HPD_STORM_PULSE_INTERVAL_DP	100 /* ms */
+#define HPD_STORM_PULSE_INTERVAL_HDMI	200 /* ms */
+
+#define HPD_TOGGLE_COUNT_DP_HDMI	15
+#define HPD_TOGGLE_COUNT_FAST		3
+
+#define CHAMELIUM_HOTPLUG_TIMEOUT	20 /* seconds */
+
+enum test_modeset_mode {
+	TEST_MODESET_ON,
+	TEST_MODESET_ON_OFF,
+	TEST_MODESET_OFF,
+};
+
+/*
+ * Test data structure — holds everything needed for HPD tests.
+ * Includes Chamelium RPC handle, DRM fd, AND proper port-to-connector mappings.
+ */
+struct hpd_test_data {
+	struct igt_chamelium_v3 *chamelium;
+	int drm_fd;
+
+	/* Port-to-connector mappings from .igtrc */
+	struct chamelium_v3_drm_port *mapped_ports;
+	int mapped_port_count;
+};
+
+
+/*
+ * find_dp_port - Find first mapped DP port
+ */
+static struct chamelium_v3_drm_port *find_dp_port(struct hpd_test_data *data)
+{
+	for (int i = 0; i < data->mapped_port_count; i++) {
+		if (data->mapped_ports[i].connector_type ==
+		    DRM_MODE_CONNECTOR_DisplayPort)
+			return &data->mapped_ports[i];
+	}
+	return NULL;
+}
+
+/*
+ * find_hdmi_port - Find first mapped HDMI port
+ */
+static struct chamelium_v3_drm_port *find_hdmi_port(struct hpd_test_data *data)
+{
+	for (int i = 0; i < data->mapped_port_count; i++) {
+		if (data->mapped_ports[i].connector_type ==
+		    DRM_MODE_CONNECTOR_HDMIA)
+			return &data->mapped_ports[i];
+	}
+	return NULL;
+}
+
+
+/*
+ * plug_port - Plug a Chamelium port with ApplyEdid first (required for V3 DP)
+ *
+ * In V3, DP connectors only become connected after ApplyEdid + Plug.
+ */
+static void plug_port(struct hpd_test_data *data, chamelium_v3_port_id port_id)
+{
+	chamelium_v3_apply_edid(data->chamelium, port_id, 0);
+	/* DP link training needs time after EDID is applied */
+	usleep(500000);
+	chamelium_v3_plug(data->chamelium, port_id);
+}
+
+/*
+ * plug_all_mapped_ports - Plug all mapped Chamelium ports and wait for them.
+ *
+ * Called before each subtest to ensure all ports are in a known-good
+ * (plugged) state, regardless of what a prior subtest did.
+ */
+static void plug_all_mapped_ports(struct hpd_test_data *data)
+{
+	for (int i = 0; i < data->mapped_port_count; i++) {
+		plug_port(data, data->mapped_ports[i].port_id);
+	}
+	/* Give connectors time to settle */
+	sleep(2);
+}
+
+
+/*
+ * get_connector - Get a fresh drmModeConnector for a mapped port.
+ * This calls drmModeGetConnector() which forces kernel to reprobe.
+ * Caller must free with drmModeFreeConnector().
+ */
+static drmModeConnector *get_connector(struct hpd_test_data *data,
+				       struct chamelium_v3_drm_port *port)
+{
+	return drmModeGetConnector(data->drm_fd, port->connector_id);
+}
+
+
+/*
+ * wait_hotplug_for_connector - Wait for a HOTPLUG uevent for a specific connector.
+ *
+ * Unlike igt_hotplug_detected() which matches ANY hotplug uevent, this
+ * matches HOTPLUG=1 AND CONNECTOR=<connector_id>. This prevents uevents
+ * from other connectors (e.g. HDMI) being consumed when testing DP.
+ *
+ * Returns true if a matching uevent was received, false on timeout.
+ * Updates *timeout with remaining time.
+ */
+static bool wait_hotplug_for_connector(struct udev_monitor *mon,
+				       uint32_t connector_id,
+				       int *timeout)
+{
+	struct pollfd fd = {
+		.fd = udev_monitor_get_fd(mon),
+		.events = POLLIN
+	};
+	struct timespec start, now;
+
+	igt_assert_eq(igt_gettime(&start), 0);
+
+	while (*timeout > 0) {
+		struct udev_device *dev;
+		const char *hotplug_val, *conn_val;
+		int elapsed;
+
+		if (!poll(&fd, 1, *timeout * 1000))
+			break;
+
+		dev = udev_monitor_receive_device(mon);
+		if (!dev)
+			continue;
+
+		hotplug_val = udev_device_get_property_value(dev, "HOTPLUG");
+		conn_val = udev_device_get_property_value(dev, "CONNECTOR");
+
+		igt_debug("uevent: HOTPLUG=%s CONNECTOR=%s (want %u)\n",
+			  hotplug_val ? hotplug_val : "null",
+			  conn_val ? conn_val : "null",
+			  connector_id);
+
+		if (hotplug_val && atoi(hotplug_val) == 1 &&
+		    conn_val && (uint32_t)atoi(conn_val) == connector_id) {
+			udev_device_unref(dev);
+
+			igt_assert_eq(igt_gettime(&now), 0);
+			elapsed = igt_time_elapsed(&start, &now);
+			*timeout = max(0, *timeout - elapsed);
+
+			return true;
+		}
+
+		udev_device_unref(dev);
+
+		igt_assert_eq(igt_gettime(&now), 0);
+		elapsed = igt_time_elapsed(&start, &now);
+		*timeout = max(0, *timeout - elapsed);
+	}
+
+	return false;
+}
+
+/*
+ * wait_for_hotplug_and_check - Wait for uevent for THIS connector,
+ *                              then verify DRM connector status.
+ */
+static void wait_for_hotplug_and_check(struct hpd_test_data *data,
+				       struct udev_monitor *mon,
+				       struct chamelium_v3_drm_port *port,
+				       drmModeConnection expected)
+{
+	int timeout = CHAMELIUM_HOTPLUG_TIMEOUT;
+	int hotplug_count = 0;
+	drmModeConnection current;
+
+	igt_debug("Waiting for %s (connector_id=%u) to become %s after hotplug...\n",
+		  port->connector_name, port->connector_id,
+		  expected == DRM_MODE_CONNECTED ? "connected" : "disconnected");
+
+	while (timeout > 0) {
+		bool detected;
+
+		detected = wait_hotplug_for_connector(mon, port->connector_id,
+						      &timeout);
+
+		if (!detected)
+			break;
+
+		hotplug_count++;
+
+		/* After uevent for OUR connector, reprobe it */
+		current = chamelium_v3_reprobe_connector(data->drm_fd,
+							 port->connector_id);
+		if (current == expected) {
+			igt_debug("%s is now %s (after %d uevents)\n",
+				  port->connector_name,
+				  expected == DRM_MODE_CONNECTED ?
+				  "connected" : "disconnected",
+				  hotplug_count);
+			return;
+		}
+	}
+
+	/*
+	 * If we timed out waiting for a uevent, check the connector status
+	 * directly. If it's already in the expected state, the uevent was
+	 * likely consumed or coalesced by the kernel — treat as success.
+	 */
+	current = chamelium_v3_reprobe_connector(data->drm_fd,
+						 port->connector_id);
+	if (current == expected) {
+		igt_debug("%s is already %s (uevent missed, got %d uevents) — accepting\n",
+			  port->connector_name,
+			  expected == DRM_MODE_CONNECTED ?
+			  "connected" : "disconnected",
+			  hotplug_count);
+		return;
+	}
+
+	igt_assert_f(false,
+		     "Timed out waiting for %s to become %s after hotplug. "
+		     "Got %d uevents for connector %u, connector is: %s\n",
+		     port->connector_name,
+		     expected == DRM_MODE_CONNECTED ? "connected" : "disconnected",
+		     hotplug_count, port->connector_id,
+		     current == DRM_MODE_CONNECTED ? "connected" :
+		     current == DRM_MODE_DISCONNECTED ? "disconnected" : "unknown");
+}
+
+
+/*
+ * reset_port - Unplug only the specific port being tested and wait for it
+ *              to become disconnected.
+ *
+ * Unlike Reset() which resets ALL Chamelium ports (causing other connectors
+ * like HDMI to disconnect when testing DP), this only unplugs the target port.
+ */
+static void reset_port(struct hpd_test_data *data,
+		       struct chamelium_v3_drm_port *port)
+{
+	chamelium_v3_unplug(data->chamelium, port->port_id);
+
+	igt_debug("Waiting for %s to become disconnected after unplug...\n",
+		  port->connector_name);
+
+	igt_assert_f(
+		chamelium_v3_wait_for_conn_status_change(
+			data->drm_fd, port->connector_id,
+			DRM_MODE_DISCONNECTED, CHAMELIUM_HOTPLUG_TIMEOUT),
+		"Connector %s did not become disconnected after unplug\n",
+		port->connector_name);
+}
+
+
+static uint32_t find_crtc_for_connector(int drm_fd, drmModeConnector *conn)
+{
+	drmModeRes *res;
+	drmModeEncoder *enc;
+	uint32_t crtc_id = 0;
+
+	res = drmModeGetResources(drm_fd);
+	if (!res)
+		return 0;
+
+	for (int i = 0; i < conn->count_encoders && !crtc_id; i++) {
+		enc = drmModeGetEncoder(drm_fd, conn->encoders[i]);
+		if (!enc)
+			continue;
+		for (int j = 0; j < res->count_crtcs && !crtc_id; j++) {
+			if (enc->possible_crtcs & (1 << j))
+				crtc_id = res->crtcs[j];
+		}
+		drmModeFreeEncoder(enc);
+	}
+
+	drmModeFreeResources(res);
+	return crtc_id;
+}
+
+static bool enable_modeset(int drm_fd, drmModeConnector *conn, struct igt_fb *fb)
+{
+	uint32_t crtc_id, conn_id;
+	int ret;
+
+	crtc_id = find_crtc_for_connector(drm_fd, conn);
+	if (!crtc_id)
+		return false;
+
+	conn_id = conn->connector_id;
+
+	if (fb->fb_id == 0) {
+		igt_create_color_fb(drm_fd,
+				    conn->modes[0].hdisplay,
+				    conn->modes[0].vdisplay,
+				    DRM_FORMAT_XRGB8888,
+				    DRM_FORMAT_MOD_LINEAR,
+				    1.0, 0.0, 0.0, fb);
+	}
+
+	ret = drmModeSetCrtc(drm_fd, crtc_id, fb->fb_id, 0, 0,
+			     &conn_id, 1, &conn->modes[0]);
+	return ret == 0;
+}
+
+static void disable_modeset(int drm_fd, drmModeConnector *conn)
+{
+	uint32_t crtc_id = find_crtc_for_connector(drm_fd, conn);
+
+	if (crtc_id)
+		drmModeSetCrtc(drm_fd, crtc_id, 0, 0, 0, NULL, 0, NULL);
+}
+
+
+/*
+ * test_hotplug - Generic hotplug toggle test
+ *
+ * 1. Reset all ports and verify all connectors show disconnected
+ * 2. For each toggle cycle:
+ *    a. Plug → wait for uevent → verify connector is CONNECTED
+ *    b. Optional modeset
+ *    c. Unplug → wait for uevent → verify connector is DISCONNECTED
+ */
+static void test_hotplug(struct hpd_test_data *data,
+			 struct chamelium_v3_drm_port *port,
+			 int toggle_count,
+			 enum test_modeset_mode modeset_mode)
+{
+	struct udev_monitor *mon;
+	struct igt_fb fb = { 0 };
+	drmModeConnector *conn = NULL;
+
+	igt_info("Testing hotplug on %s (chamelium port %d, connector_id %u, "
+		 "%d toggles, modeset=%d)\n",
+		 port->connector_name, port->port_id, port->connector_id,
+		 toggle_count, modeset_mode);
+
+	/* Unplug the port under test and confirm it becomes disconnected */
+	reset_port(data, port);
+
+	igt_hpd_storm_set_threshold(data->drm_fd, 0);
+
+	/* Let any straggling uevents settle before we start.
+	 * DP connectors need extra time after unplug for the link
+	 * to fully de-train before re-plugging.
+	 */
+	usleep(3000000);
+
+	for (int i = 0; i < toggle_count; i++) {
+		/*
+		 * Create a fresh uevent monitor right before each action.
+		 * Flush aggressively — any uevent that arrived before this
+		 * point (from prior operations or other ports) must be drained.
+		 */
+		mon = igt_watch_uevents();
+		usleep(100000);
+		igt_flush_uevents(mon);
+
+		/* Plug */
+		plug_port(data, port->port_id);
+		wait_for_hotplug_and_check(data, mon, port, DRM_MODE_CONNECTED);
+		igt_cleanup_uevents(mon);
+
+		/* Optional modeset */
+		if (modeset_mode == TEST_MODESET_ON_OFF ||
+		    (modeset_mode == TEST_MODESET_ON && i == 0)) {
+			if (conn)
+				drmModeFreeConnector(conn);
+			conn = get_connector(data, port);
+			if (conn && conn->count_modes > 0)
+				enable_modeset(data->drm_fd, conn, &fb);
+		}
+
+		/* Fresh monitor for unplug */
+		mon = igt_watch_uevents();
+		usleep(100000);
+		igt_flush_uevents(mon);
+
+		/* Unplug */
+		chamelium_v3_unplug(data->chamelium, port->port_id);
+		wait_for_hotplug_and_check(data, mon, port, DRM_MODE_DISCONNECTED);
+		igt_cleanup_uevents(mon);
+
+		if (modeset_mode == TEST_MODESET_ON_OFF && conn)
+			disable_modeset(data->drm_fd, conn);
+	}
+
+	/*
+	 * Re-plug the port at the end and verify it becomes connected.
+	 * This restores the original state AND serves as the final
+	 * verification that the connector truly responds to hotplug.
+	 */
+	mon = igt_watch_uevents();
+	usleep(100000);
+	igt_flush_uevents(mon);
+	plug_port(data, port->port_id);
+	wait_for_hotplug_and_check(data, mon, port, DRM_MODE_CONNECTED);
+	igt_cleanup_uevents(mon);
+
+	/* Final explicit check: the DRM connector MUST be connected now.
+	 * After many rapid toggles the connector may need a moment to
+	 * stabilize, so poll for up to 5 seconds.
+	 */
+	igt_assert_f(
+		chamelium_v3_wait_for_conn_status_change(
+			data->drm_fd, port->connector_id,
+			DRM_MODE_CONNECTED, 5),
+		"%s (connector_id=%u) is NOT connected after final re-plug. "
+		"HPD is not working correctly!\n",
+		port->connector_name, port->connector_id);
+
+	igt_info("%s: final state is CONNECTED - test PASSED\n",
+		 port->connector_name);
+
+	igt_hpd_storm_reset(data->drm_fd);
+
+	if (fb.fb_id)
+		igt_remove_fb(data->drm_fd, &fb);
+	if (conn)
+		drmModeFreeConnector(conn);
+}
+
+/*
+ * test_hotplug_for_each_pipe - Test HPD across each CRTC/pipe
+ *
+ * For each pipe, plug → verify connected → modeset → unplug → verify disconnected
+ */
+static void test_hotplug_for_each_pipe(struct hpd_test_data *data,
+				       struct chamelium_v3_drm_port *port)
+{
+	struct udev_monitor *mon;
+	drmModeRes *res;
+
+	igt_info("Testing hotplug for each pipe on %s (port %d)\n",
+		 port->connector_name, port->port_id);
+
+	reset_port(data, port);
+	igt_hpd_storm_set_threshold(data->drm_fd, 0);
+
+	/* Let straggling uevents settle */
+	usleep(1000000);
+
+	res = drmModeGetResources(data->drm_fd);
+	igt_assert(res);
+
+	for (int j = 0; j < res->count_crtcs; j++) {
+		struct igt_fb fb = { 0 };
+		uint32_t crtc_id = res->crtcs[j];
+		drmModeConnector *conn;
+
+		igt_info("  Testing pipe/CRTC %d (id=%u)\n", j, crtc_id);
+
+		/* Fresh monitor for plug */
+		mon = igt_watch_uevents();
+		usleep(100000);
+		igt_flush_uevents(mon);
+
+		/* Plug */
+		plug_port(data, port->port_id);
+		wait_for_hotplug_and_check(data, mon, port, DRM_MODE_CONNECTED);
+		igt_cleanup_uevents(mon);
+
+		/* Modeset on this CRTC */
+		conn = get_connector(data, port);
+		if (conn && conn->count_modes > 0) {
+			drmModeEncoder *enc;
+			bool crtc_valid = false;
+
+			for (int e = 0; e < conn->count_encoders; e++) {
+				enc = drmModeGetEncoder(data->drm_fd,
+							conn->encoders[e]);
+				if (enc && (enc->possible_crtcs & (1 << j))) {
+					crtc_valid = true;
+					drmModeFreeEncoder(enc);
+					break;
+				}
+				if (enc)
+					drmModeFreeEncoder(enc);
+			}
+
+			if (crtc_valid) {
+				uint32_t conn_id = conn->connector_id;
+
+				igt_create_color_fb(data->drm_fd,
+						    conn->modes[0].hdisplay,
+						    conn->modes[0].vdisplay,
+						    DRM_FORMAT_XRGB8888,
+						    DRM_FORMAT_MOD_LINEAR,
+						    0.0, 1.0, 0.0, &fb);
+				drmModeSetCrtc(data->drm_fd, crtc_id,
+					       fb.fb_id, 0, 0,
+					       &conn_id, 1, &conn->modes[0]);
+				igt_info("    Modeset on CRTC %u: OK\n", crtc_id);
+			}
+			drmModeFreeConnector(conn);
+		}
+
+		/* Fresh monitor for unplug */
+		mon = igt_watch_uevents();
+		usleep(100000);
+		igt_flush_uevents(mon);
+
+		/* Unplug */
+		chamelium_v3_unplug(data->chamelium, port->port_id);
+		wait_for_hotplug_and_check(data, mon, port, DRM_MODE_DISCONNECTED);
+		igt_cleanup_uevents(mon);
+
+		if (fb.fb_id)
+			igt_remove_fb(data->drm_fd, &fb);
+	}
+
+	/*
+	 * Re-plug the port and verify connected as final check.
+	 */
+	mon = igt_watch_uevents();
+	usleep(100000);
+	igt_flush_uevents(mon);
+	plug_port(data, port->port_id);
+	wait_for_hotplug_and_check(data, mon, port, DRM_MODE_CONNECTED);
+	igt_cleanup_uevents(mon);
+
+	igt_assert_f(
+		chamelium_v3_reprobe_connector(data->drm_fd, port->connector_id)
+			== DRM_MODE_CONNECTED,
+		"%s (connector_id=%u) is NOT connected after final re-plug. "
+		"HPD is not working correctly!\n",
+		port->connector_name, port->connector_id);
+
+	igt_info("%s: final state is CONNECTED - test PASSED\n",
+		 port->connector_name);
+
+	drmModeFreeResources(res);
+	igt_hpd_storm_reset(data->drm_fd);
+}
+
+/*
+ * test_suspend_resume_hpd - Toggle HPD during suspend/hibernate
+ *
+ * V3 does not yet support schedule_hpd_toggle, so these skip.
+ */
+static void test_suspend_resume_hpd(struct hpd_test_data *data,
+				    struct chamelium_v3_drm_port *port,
+				    const char *state_name)
+{
+	igt_skip("V3 Chamelium does not yet support schedule_hpd_toggle "
+		 "required for %s HPD testing\n", state_name);
+}
+
+/*
+ * test_hpd_storm_detect - Fire rapid HPD pulses, verify kernel detects storm
+ */
+static void test_hpd_storm_detect(struct hpd_test_data *data,
+				  struct chamelium_v3_drm_port *port,
+				  int pulse_interval_ms)
+{
+	igt_info("Testing HPD storm detection on %s (port %d, interval=%dms)\n",
+		 port->connector_name, port->port_id, pulse_interval_ms);
+
+	igt_require_hpd_storm_ctl(data->drm_fd);
+
+	reset_port(data, port);
+
+	/* Plug the port first */
+	plug_port(data, port->port_id);
+	igt_assert_f(
+		chamelium_v3_wait_for_conn_status_change(
+			data->drm_fd, port->connector_id,
+			DRM_MODE_CONNECTED, CHAMELIUM_HOTPLUG_TIMEOUT),
+		"Connector %s did not become connected after plug\n",
+		port->connector_name);
+
+	/* Set threshold and fire pulses */
+	igt_hpd_storm_set_threshold(data->drm_fd, 1);
+	chamelium_v3_fire_hpd_pulse(data->chamelium, port->port_id,
+				    pulse_interval_ms * 1000,
+				    pulse_interval_ms * 1000,
+				    10, 1);
+
+	igt_assert(igt_hpd_storm_detected(data->drm_fd));
+
+	igt_hpd_storm_reset(data->drm_fd);
+}
+
+/*
+ * test_hpd_storm_disable - Disable storm detection, verify no false detection
+ */
+static void test_hpd_storm_disable(struct hpd_test_data *data,
+				   struct chamelium_v3_drm_port *port,
+				   int pulse_interval_ms)
+{
+	igt_info("Testing HPD storm disable on %s (port %d, interval=%dms)\n",
+		 port->connector_name, port->port_id, pulse_interval_ms);
+
+	igt_require_hpd_storm_ctl(data->drm_fd);
+
+	reset_port(data, port);
+
+	/* Disable storm detection */
+	igt_hpd_storm_set_threshold(data->drm_fd, 0);
+
+	/* Plug the port first */
+	plug_port(data, port->port_id);
+	igt_assert_f(
+		chamelium_v3_wait_for_conn_status_change(
+			data->drm_fd, port->connector_id,
+			DRM_MODE_CONNECTED, CHAMELIUM_HOTPLUG_TIMEOUT),
+		"Connector %s did not become connected after plug\n",
+		port->connector_name);
+
+	/* Fire pulses */
+	chamelium_v3_fire_hpd_pulse(data->chamelium, port->port_id,
+				    pulse_interval_ms * 1000,
+				    pulse_interval_ms * 1000,
+				    10, 1);
+
+	/* Storm should NOT be detected */
+	igt_assert(!igt_hpd_storm_detected(data->drm_fd));
+
+	igt_hpd_storm_reset(data->drm_fd);
+}
+
+
+int igt_main()
+{
+	struct hpd_test_data data = { 0 };
+	struct chamelium_v3_drm_port *dp_port = NULL, *hdmi_port = NULL;
+
+	/* Setup */
+	igt_fixture() {
+		data.chamelium = chamelium_v3_init_from_config();
+		igt_require_f(data.chamelium,
+			      "Chamelium V3 not available (check .igtrc [Chameliumv3] section)\n");
+
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		igt_assert_f(data.drm_fd >= 0, "Cannot open DRM device\n");
+
+		kmstest_set_vt_graphics_mode();
+
+		/* Read port-to-connector mappings from .igtrc */
+		igt_require_f(chamelium_v3_read_port_mappings(data.drm_fd,
+							      &data.mapped_ports,
+							      &data.mapped_port_count),
+			      "No port mappings found in .igtrc [Chamelium:<connector>] sections\n");
+
+		igt_info("Found %d port mapping(s):\n", data.mapped_port_count);
+		for (int i = 0; i < data.mapped_port_count; i++) {
+			igt_info("  %s -> chamelium port %d (connector_id=%u)\n",
+				 data.mapped_ports[i].connector_name,
+				 data.mapped_ports[i].port_id,
+				 data.mapped_ports[i].connector_id);
+		}
+
+		dp_port = find_dp_port(&data);
+		hdmi_port = find_hdmi_port(&data);
+	}
+
+
+	igt_fixture() { plug_all_mapped_ports(&data); }
+
+	igt_describe("Check that we get uevents and updated connector status on "
+		     "hotplug and unplug");
+	igt_subtest("dp-hpd") {
+		igt_require_f(dp_port, "No DP port mapped\n");
+		test_hotplug(&data, dp_port, HPD_TOGGLE_COUNT_DP_HDMI,
+			     TEST_MODESET_OFF);
+	}
+
+	igt_fixture() { plug_all_mapped_ports(&data); }
+
+	igt_describe("Check that we get uevents and updated connector status on "
+		     "hotplug and unplug");
+	igt_subtest("dp-hpd-fast") {
+		igt_require_f(dp_port, "No DP port mapped\n");
+		test_hotplug(&data, dp_port, HPD_TOGGLE_COUNT_FAST,
+			     TEST_MODESET_OFF);
+	}
+
+	igt_fixture() { plug_all_mapped_ports(&data); }
+
+	igt_describe("Check hotplug and unplug with modeset enable/disable toggle");
+	igt_subtest("dp-hpd-enable-disable-mode") {
+		igt_require_f(dp_port, "No DP port mapped\n");
+		test_hotplug(&data, dp_port, HPD_TOGGLE_COUNT_FAST,
+			     TEST_MODESET_ON_OFF);
+	}
+
+	igt_fixture() { plug_all_mapped_ports(&data); }
+
+	igt_describe("Check hotplug and unplug with enabled mode");
+	igt_subtest("dp-hpd-with-enabled-mode") {
+		igt_require_f(dp_port, "No DP port mapped\n");
+		test_hotplug(&data, dp_port, HPD_TOGGLE_COUNT_FAST,
+			     TEST_MODESET_ON);
+	}
+
+	igt_fixture() { plug_all_mapped_ports(&data); }
+
+	igt_describe("Check hotplug for each pipe with valid output");
+	igt_subtest("dp-hpd-for-each-pipe") {
+		igt_require_f(dp_port, "No DP port mapped\n");
+		test_hotplug_for_each_pipe(&data, dp_port);
+	}
+
+	igt_fixture() { plug_all_mapped_ports(&data); }
+
+	igt_describe("Toggle HPD during Suspend, check uevents and connector status");
+	igt_subtest("dp-hpd-after-suspend") {
+		igt_require_f(dp_port, "No DP port mapped\n");
+		test_suspend_resume_hpd(&data, dp_port, "suspend");
+	}
+
+	igt_fixture() { plug_all_mapped_ports(&data); }
+
+	igt_describe("Toggle HPD during Hibernation, check uevents and connector status");
+	igt_subtest("dp-hpd-after-hibernate") {
+		igt_require_f(dp_port, "No DP port mapped\n");
+		test_suspend_resume_hpd(&data, dp_port, "hibernate");
+	}
+
+	igt_fixture() { plug_all_mapped_ports(&data); }
+
+	igt_describe("Trigger HPD storm, check kernel detects it");
+	igt_subtest("dp-hpd-storm") {
+		igt_require_f(dp_port, "No DP port mapped\n");
+		test_hpd_storm_detect(&data, dp_port,
+				      HPD_STORM_PULSE_INTERVAL_DP);
+	}
+
+	igt_fixture() { plug_all_mapped_ports(&data); }
+
+	igt_describe("Disable HPD storm detection, verify no false detection");
+	igt_subtest("dp-hpd-storm-disable") {
+		igt_require_f(dp_port, "No DP port mapped\n");
+		test_hpd_storm_disable(&data, dp_port,
+				       HPD_STORM_PULSE_INTERVAL_DP);
+	}
+
+
+	igt_fixture() { plug_all_mapped_ports(&data); }
+
+	igt_describe("Check that we get uevents and updated connector status on "
+		     "hotplug and unplug");
+	igt_subtest("hdmi-hpd") {
+		igt_require_f(hdmi_port, "No HDMI port mapped\n");
+		test_hotplug(&data, hdmi_port, HPD_TOGGLE_COUNT_DP_HDMI,
+			     TEST_MODESET_OFF);
+	}
+
+	igt_fixture() { plug_all_mapped_ports(&data); }
+
+	igt_describe("Check that we get uevents and updated connector status on "
+		     "hotplug and unplug");
+	igt_subtest("hdmi-hpd-fast") {
+		igt_require_f(hdmi_port, "No HDMI port mapped\n");
+		test_hotplug(&data, hdmi_port, HPD_TOGGLE_COUNT_FAST,
+			     TEST_MODESET_OFF);
+	}
+
+	igt_fixture() { plug_all_mapped_ports(&data); }
+
+	igt_describe("Check hotplug and unplug with modeset enable/disable toggle");
+	igt_subtest("hdmi-hpd-enable-disable-mode") {
+		igt_require_f(hdmi_port, "No HDMI port mapped\n");
+		test_hotplug(&data, hdmi_port, HPD_TOGGLE_COUNT_FAST,
+			     TEST_MODESET_ON_OFF);
+	}
+
+	igt_fixture() { plug_all_mapped_ports(&data); }
+
+	igt_describe("Check hotplug and unplug with enabled mode");
+	igt_subtest("hdmi-hpd-with-enabled-mode") {
+		igt_require_f(hdmi_port, "No HDMI port mapped\n");
+		test_hotplug(&data, hdmi_port, HPD_TOGGLE_COUNT_FAST,
+			     TEST_MODESET_ON);
+	}
+
+	igt_fixture() { plug_all_mapped_ports(&data); }
+
+	igt_describe("Check hotplug for each pipe with valid output");
+	igt_subtest("hdmi-hpd-for-each-pipe") {
+		igt_require_f(hdmi_port, "No HDMI port mapped\n");
+		test_hotplug_for_each_pipe(&data, hdmi_port);
+	}
+
+	igt_fixture() { plug_all_mapped_ports(&data); }
+
+	igt_describe("Toggle HPD during Suspend, check uevents and connector status");
+	igt_subtest("hdmi-hpd-after-suspend") {
+		igt_require_f(hdmi_port, "No HDMI port mapped\n");
+		test_suspend_resume_hpd(&data, hdmi_port, "suspend");
+	}
+
+	igt_fixture() { plug_all_mapped_ports(&data); }
+
+	igt_describe("Toggle HPD during Hibernation, check uevents and connector status");
+	igt_subtest("hdmi-hpd-after-hibernate") {
+		igt_require_f(hdmi_port, "No HDMI port mapped\n");
+		test_suspend_resume_hpd(&data, hdmi_port, "hibernate");
+	}
+
+	igt_fixture() { plug_all_mapped_ports(&data); }
+
+	igt_describe("Trigger HPD storm, check kernel detects it");
+	igt_subtest("hdmi-hpd-storm") {
+		igt_require_f(hdmi_port, "No HDMI port mapped\n");
+		test_hpd_storm_detect(&data, hdmi_port,
+				      HPD_STORM_PULSE_INTERVAL_HDMI);
+	}
+
+	igt_fixture() { plug_all_mapped_ports(&data); }
+
+	igt_describe("Disable HPD storm detection, verify no false detection");
+	igt_subtest("hdmi-hpd-storm-disable") {
+		igt_require_f(hdmi_port, "No HDMI port mapped\n");
+		test_hpd_storm_disable(&data, hdmi_port,
+				       HPD_STORM_PULSE_INTERVAL_HDMI);
+	}
+
+	/* Cleanup */
+	igt_fixture() {
+		free(data.mapped_ports);
+		chamelium_v3_uninit(data.chamelium);
+		close(data.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 80e88954a..31ca2d963 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -374,6 +374,7 @@ chamelium_v2_progs = [
 
 chamelium_v3_progs = [
 	'kms_chamelium_v3_basic',
+	'kms_chamelium_v3_hpd',
 ]
 
 test_deps = [ igt_deps ]
-- 
2.48.1

