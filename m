Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E85E98FA6
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 04:16:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F8410E10A;
	Thu,  9 Apr 2026 04:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZjIWgV7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E9110E0FF
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 04:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775708159; x=1807244159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nxuec0uzL3IBMBbB9xSk85Vl3SvJmkAR5x6kZMcX+F8=;
 b=SZjIWgV7ERHTzcqd/Bh7WEjezigA4w6/4SLonvk53BCdvRDYZFeKgP0A
 uSipyZavlWFvFuz6duhMqsgWVUYbK/6Mjs107R3h9tfB6SMkAPpR9gifT
 GVyplSTdYUBnO1c6ERrRqcErT7Tf3uoev+JUZVcVfeMZ6FbEUAAUknufR
 EXHUmUbQ7WTbNs4xB5uGqGqmJ/dv7sUGV0G/z0m4Y6OTxpqPpHHvZL7E+
 FO5EJ9TydvJkU0Nj+iSrF4gSPedb3RMuDA7TsbrWbhxfQDGwBNd+wLoFU
 Q7M5se2oqGjc9JkYgCudukmDaydlzFISpXXh+sG/stOc9tQs0x++i4nFY A==;
X-CSE-ConnectionGUID: P7rnW7bmTx2v0kcy3bMrPw==
X-CSE-MsgGUID: C1LauIcCR2W4mKQ2fxfzYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76608383"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="76608383"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 21:15:59 -0700
X-CSE-ConnectionGUID: Ywvknn/JRC+4Bc0RWFpaYQ==
X-CSE-MsgGUID: Nc7QUpYsRaCan0ldzoE3rw==
X-ExtLoop1: 1
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 21:15:57 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t 4/6] lib/igt_usb4_switch: add helper library for USB4
 Switch 3141
Date: Thu,  9 Apr 2026 10:07:12 +0530
Message-Id: <20260409043714.284108-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260409043714.284108-1-kunal1.joshi@intel.com>
References: <20260409043714.284108-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add a control library for the Microsft USB4 Switch 3141 test equipment,
used for automated USB4/Thunderbolt dock/undock testing:

 - usb4switch_init()/deinit(): lifecycle with
   .igtrc config or autodiscovery
 - usb4switch_port_enable()/disable(): port control with optional HW delay
 - usb4switch_get_active_port(): query current port state
 - usb4switch_get_voltage_mv()/get_current_ma(): VBUS monitoring
 - usb4switch_get_orientation(): USB-C cable orientation

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 lib/igt_usb4_switch.c | 1055 +++++++++++++++++++++++++++++++++++++++++
 lib/igt_usb4_switch.h |  157 ++++++
 lib/meson.build       |    1 +
 3 files changed, 1213 insertions(+)
 create mode 100644 lib/igt_usb4_switch.c
 create mode 100644 lib/igt_usb4_switch.h

diff --git a/lib/igt_usb4_switch.c b/lib/igt_usb4_switch.c
new file mode 100644
index 000000000..5cede4d60
--- /dev/null
+++ b/lib/igt_usb4_switch.c
@@ -0,0 +1,1055 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * SECTION:igt_usb4_switch
+ * @short_description: USB4 Switch 3141 control library
+ * @title: USB4 Switch
+ * @include: igt_usb4_switch.h
+ *
+ * This library provides control and status functions for the Microsoft
+ * USB4 Switch 3141 test equipment, used for automated USB4/Thunderbolt
+ * dock/undock testing.
+ *
+ * The library handles serial communication, port control, and
+ * configuration parsing.
+ */
+
+#include <stdlib.h>
+#include <string.h>
+#include <strings.h>
+#include <time.h>
+#include <unistd.h>
+
+#include "igt_core.h"
+#include "igt_rc.h"
+#include "igt_serial.h"
+#include "igt_usb4_switch.h"
+#include "igt_connector_helper.h"
+
+struct usb4switch {
+	struct igt_serial *serial;
+
+	/* Configuration */
+	char *device_path;
+	int hotplug_timeout_s;
+	int iterations;
+	int min_switch_interval_ms;
+
+	/* Timestamp of last port change for minimum interval enforcement */
+	struct timespec last_port_change;
+
+	/* Port configuration */
+	struct usb4switch_port ports[USB4_SWITCH_MAX_PORTS];
+	int port_count;
+};
+
+/* .igtrc section and key names */
+#define USB4_SWITCH_SECTION "USB4Switch"
+#define USB4_SWITCH_KEY_DEVICE "Device"
+#define USB4_SWITCH_KEY_HOTPLUG_TIMEOUT "HotplugTimeout"
+#define USB4_SWITCH_KEY_ITERATIONS "DockUndockIterations"
+#define USB4_SWITCH_KEY_MIN_INTERVAL "MinSwitchInterval"
+
+/*
+ * response_is_ok - Check that a firmware response does not indicate an error.
+ *
+ * The 3141 prefixes error replies with "ERR" (e.g. "ERR: unknown command").
+ * An empty response after a successful transport exchange is also treated as
+ * failure because no meaningful control command produces an empty reply.
+ *
+ * This is a transport vs. command-level distinction: send_command() only
+ * guarantees that bytes were exchanged; callers that need to know whether
+ * the firmware actually accepted the command must call response_is_ok().
+ */
+static bool response_is_ok(const char *response)
+{
+	if (!response || response[0] == '\0')
+		return false;
+
+	if (strncasecmp(response, "ERR", 3) == 0)
+		return false;
+
+	return true;
+}
+
+/*
+ * Minimum-interval helpers - enforce a floor between successive port
+ * operations to protect hardware from rapid switching.
+ */
+static void enforce_min_interval(struct usb4switch *sw)
+{
+	struct timespec now;
+	int elapsed_ms;
+
+	if (sw->last_port_change.tv_sec == 0 &&
+	    sw->last_port_change.tv_nsec == 0)
+		return;
+
+	clock_gettime(CLOCK_MONOTONIC, &now);
+	elapsed_ms = (now.tv_sec - sw->last_port_change.tv_sec) * 1000 +
+		     (now.tv_nsec - sw->last_port_change.tv_nsec) / 1000000;
+
+	if (elapsed_ms < sw->min_switch_interval_ms) {
+		int wait = sw->min_switch_interval_ms - elapsed_ms;
+
+		igt_debug("USB4Switch: enforcing %d ms minimum interval "
+			  "(sleeping %d ms)\n",
+			  sw->min_switch_interval_ms, wait);
+		usleep(wait * 1000);
+	}
+}
+
+/**
+ * send_command:
+ * @sw: switch handle
+ * @cmd: command string (without line ending)
+ * @response: buffer for response
+ * @resp_size: size of response buffer
+ *
+ * Sends a command to the USB4 Switch 3141.
+ * Appends CRLF as required by the switch protocol.
+ *
+ * Note: success means the serial exchange completed and at least one byte
+ * was received. It does not validate the firmware response payload — callers
+ * that care about command-level success must check response_is_ok().
+ *
+ * Returns: true if the exchange succeeded, false on transport error.
+ */
+static bool send_command(struct usb4switch *sw, const char *cmd,
+			 char *response, size_t resp_size)
+{
+	char cmd_with_crlf[256];
+	int len;
+
+	if (!sw || !sw->serial || !cmd)
+		return false;
+
+	len = snprintf(cmd_with_crlf, sizeof(cmd_with_crlf), "%s\r\n", cmd);
+	if (len < 0 || (size_t)len >= sizeof(cmd_with_crlf))
+		return false;
+
+	return igt_serial_command(sw->serial, cmd_with_crlf,
+				  response, resp_size);
+}
+
+static bool verify_communication(struct usb4switch *sw)
+{
+	char response[256];
+
+	if (!send_command(sw, "version", response, sizeof(response))) {
+		igt_debug("USB4Switch: Failed to query version\n");
+		return false;
+	}
+
+	if (!response_is_ok(response)) {
+		igt_debug("USB4Switch: Version command rejected: '%s'\n",
+			  response);
+		return false;
+	}
+
+	/*
+	 * The device was already identified by VID:PID in
+	 * discover_usb4_switch_device(). Here we just confirm the serial
+	 * link is alive.  The firmware returns only its firmware version
+	 * (e.g. "0201"), not the model number.
+	 */
+	igt_debug("USB4Switch: Version response: %s\n", response);
+	return true;
+}
+
+static char *get_config_string(const char *key)
+{
+	char *value = NULL;
+	GError *error = NULL;
+
+	value = g_key_file_get_string(igt_key_file, USB4_SWITCH_SECTION,
+				      key, &error);
+	if (error) {
+		g_error_free(error);
+		return NULL;
+	}
+	return value;
+}
+
+static int get_config_int(const char *key, int default_value)
+{
+	GError *error = NULL;
+	int value;
+
+	value = g_key_file_get_integer(igt_key_file, USB4_SWITCH_SECTION,
+				       key, &error);
+	if (error) {
+		g_error_free(error);
+		return default_value;
+	}
+	return value;
+}
+
+static void free_display_config(struct usb4switch_display *disp)
+{
+	free(disp->connector_path);
+	disp->connector_path = NULL;
+	free(disp->connector_name);
+	disp->connector_name = NULL;
+	free(disp->edid_serial);
+	disp->edid_serial = NULL;
+}
+
+static void free_port_config(struct usb4switch_port *port)
+{
+	int i;
+
+	free(port->name);
+	for (i = 0; i < USB4_SWITCH_MAX_DISPLAYS_PER_PORT; i++)
+		free_display_config(&port->displays[i]);
+}
+
+static void free_config(struct usb4switch *sw)
+{
+	int i;
+
+	free(sw->device_path);
+	for (i = 0; i < USB4_SWITCH_MAX_PORTS; i++)
+		free_port_config(&sw->ports[i]);
+}
+
+static void parse_display_config(struct usb4switch *sw, int port_idx,
+				 int disp_idx)
+{
+	struct usb4switch_display *disp;
+	char key[64];
+
+	disp = &sw->ports[port_idx].displays[disp_idx];
+
+	/* Path takes precedence for MST */
+	snprintf(key, sizeof(key), "Port%d.Display%d.Path",
+		 port_idx + 1, disp_idx + 1);
+	disp->connector_path = get_config_string(key);
+
+	/* Connector name as fallback */
+	snprintf(key, sizeof(key), "Port%d.Display%d.Connector",
+		 port_idx + 1, disp_idx + 1);
+	disp->connector_name = get_config_string(key);
+
+	/* EDID serial for verification */
+	snprintf(key, sizeof(key), "Port%d.Display%d.EDIDSerial",
+		 port_idx + 1, disp_idx + 1);
+	disp->edid_serial = get_config_string(key);
+}
+
+static void parse_port_config(struct usb4switch *sw, int port_idx)
+{
+	struct usb4switch_port *port;
+	char key[64];
+	int i;
+
+	port = &sw->ports[port_idx];
+	port->port_num = port_idx + 1;
+
+	snprintf(key, sizeof(key), "Port%d.Name", port_idx + 1);
+	port->name = get_config_string(key);
+	if (!port->name) {
+		port->name = malloc(16);
+		if (port->name)
+			snprintf(port->name, 16, "Port %d", port_idx + 1);
+	}
+
+	/*
+	 * Parse all display slots, then count the leading contiguous
+	 * prefix.  display_count is the exact number of valid entries
+	 * accessible via displays[0..display_count-1].
+	 */
+	for (i = 0; i < USB4_SWITCH_MAX_DISPLAYS_PER_PORT; i++)
+		parse_display_config(sw, port_idx, i);
+
+	/* Count leading contiguous displays (Display1, Display2, ...) */
+	port->display_count = 0;
+	for (i = 0; i < USB4_SWITCH_MAX_DISPLAYS_PER_PORT; i++) {
+		if (sw->ports[port_idx].displays[i].connector_path ||
+		    sw->ports[port_idx].displays[i].connector_name)
+			port->display_count++;
+		else
+			break;
+	}
+
+	/* Warn about and free any sparse entries beyond the contiguous prefix */
+	for (; i < USB4_SWITCH_MAX_DISPLAYS_PER_PORT; i++) {
+		if (sw->ports[port_idx].displays[i].connector_path ||
+		    sw->ports[port_idx].displays[i].connector_name) {
+			igt_warn("USB4Switch: Port%d.Display%d configured "
+				 "but Display%d is missing; displays must "
+				 "be contiguous from 1 — ignoring\n",
+				 port_idx + 1, i + 1,
+				 port->display_count + 1);
+			free_display_config(&sw->ports[port_idx].displays[i]);
+		}
+	}
+}
+
+static bool parse_config(struct usb4switch *sw)
+{
+	int i;
+
+	sw->device_path = get_config_string(USB4_SWITCH_KEY_DEVICE);
+	if (!sw->device_path) {
+		igt_debug("USB4Switch: No Device configured\n");
+		return false;
+	}
+
+	sw->hotplug_timeout_s =
+		get_config_int(USB4_SWITCH_KEY_HOTPLUG_TIMEOUT,
+			       USB4_SWITCH_DEFAULT_HOTPLUG_TIMEOUT_S);
+	sw->iterations =
+		get_config_int(USB4_SWITCH_KEY_ITERATIONS,
+			       USB4_SWITCH_DEFAULT_ITERATIONS);
+	sw->min_switch_interval_ms =
+		get_config_int(USB4_SWITCH_KEY_MIN_INTERVAL,
+			       USB4_SWITCH_DEFAULT_MIN_INTERVAL_MS);
+
+	/*
+	 * Count only leading contiguous ports that have at least one display.
+	 * Stop at the first port with no displays — this enforces contiguous
+	 * port numbering (Port1, Port2, ...) and means port_count is the exact
+	 * number of valid ports accessible via ports[0..port_count-1].
+	 */
+	sw->port_count = 0;
+	for (i = 0; i < USB4_SWITCH_MAX_PORTS; i++) {
+		parse_port_config(sw, i);
+		if (sw->ports[i].display_count > 0)
+			sw->port_count++;
+		else
+			break;
+	}
+
+	if (sw->port_count == 0)
+		igt_warn("USB4Switch: Device configured but no display keys found\n");
+
+	igt_debug("USB4Switch: Device=%s, Timeout=%ds, Iterations=%d, Ports=%d\n",
+		  sw->device_path, sw->hotplug_timeout_s, sw->iterations,
+		  sw->port_count);
+
+	return true;
+}
+
+static void stamp_port_change(struct usb4switch *sw)
+{
+	clock_gettime(CLOCK_MONOTONIC, &sw->last_port_change);
+}
+
+static bool usb4switch_queue_port_change_delayed(struct usb4switch *sw,
+						 int port,
+						 int delay_seconds,
+						 const char *action)
+{
+	char cmd[32];
+	char response[256];
+
+	if (!sw)
+		return false;
+
+	if (port < 0 || port > USB4_SWITCH_MAX_PORTS) {
+		igt_warn("USB4Switch: Invalid port %d\n", port);
+		return false;
+	}
+
+	if (delay_seconds < 0 || delay_seconds > 3600) {
+		igt_warn("USB4Switch: Invalid delay %d (must be 0-3600)\n",
+			 delay_seconds);
+		return false;
+	}
+
+	enforce_min_interval(sw);
+
+	snprintf(cmd, sizeof(cmd), "delay %d", delay_seconds);
+	if (!send_command(sw, cmd, response, sizeof(response))) {
+		igt_warn("USB4Switch: Failed to set delay %d\n", delay_seconds);
+		return false;
+	}
+
+	if (!response_is_ok(response)) {
+		igt_warn("USB4Switch: Failed to set delay %d (response: '%s')\n",
+			 delay_seconds, response);
+		return false;
+	}
+
+	snprintf(cmd, sizeof(cmd), "port %d", port);
+	if (!send_command(sw, cmd, response, sizeof(response))) {
+		igt_warn("USB4Switch: Failed to queue %s command\n", action);
+		return false;
+	}
+
+	if (!response_is_ok(response)) {
+		igt_warn("USB4Switch: Failed to queue %s command (response: '%s')\n",
+			 action, response);
+		return false;
+	}
+
+	stamp_port_change(sw);
+	igt_debug("USB4Switch: Queued %s with %ds delay\n",
+		  action, delay_seconds);
+
+	return true;
+}
+
+/*
+ * USB VID:PID for Microsoft USB4 Switch 3141
+ */
+#define USB4_SWITCH_VID "045e"
+#define USB4_SWITCH_PID "0646"
+
+/*
+ * Linux USB uevent PRODUCT= format uses lowercase hex without leading
+ * zeros: VID 0x045e → "45e", PID 0x0646 → "646".
+ */
+#define USB4_SWITCH_UEVENT_MATCH "PRODUCT=45e/646/"
+
+/*
+ * When no .igtrc configuration is present, autodiscover:
+ * - USB4 switch device by scanning /sys/class/tty for matching VID:PID
+ * - Displays behind each port by comparing connectors before/after docking
+ */
+static char *discover_usb4_switch_device(void)
+{
+	char path[256];
+	char uevent[512];
+	char *device_path = NULL;
+	FILE *fp;
+	int i;
+
+	/*
+	 * Scan ttyACM0..63. The 3141 almost always lands in the low
+	 * range, but the upper bound is generous to handle busy systems.
+	 */
+	for (i = 0; i < 64; i++) {
+		snprintf(path, sizeof(path),
+			 "/sys/class/tty/ttyACM%d/device/uevent", i);
+
+		fp = fopen(path, "r");
+		if (!fp)
+			continue;
+
+		while (fgets(uevent, sizeof(uevent), fp)) {
+			if (strstr(uevent, USB4_SWITCH_UEVENT_MATCH)) {
+				device_path = malloc(32);
+				if (device_path)
+					snprintf(device_path, 32,
+						 "/dev/ttyACM%d", i);
+				break;
+			}
+		}
+
+		fclose(fp);
+		if (device_path)
+			break;
+	}
+
+	if (device_path)
+		igt_debug("USB4Switch: Autodiscovered device at %s\n",
+			  device_path);
+	else
+		igt_debug("USB4Switch: No device found during autodiscovery\n");
+
+	return device_path;
+}
+
+/*
+ * discover_port_displays - Dock a port and compare connectors to find
+ * which displays appear. drm_fd is passed as parameter, NOT stored.
+ */
+static bool discover_port_displays(struct usb4switch *sw, int drm_fd,
+				   int port_num, uint32_t *before,
+				   int before_count)
+{
+	struct usb4switch_port *port = &sw->ports[port_num - 1];
+	uint32_t after[32];
+	int after_count;
+	char name[32];
+	char serial[64];
+	int i, j, wait;
+	bool found;
+
+	if (!usb4switch_port_enable(sw, port_num)) {
+		igt_debug("USB4Switch: Failed to enable port %d\n", port_num);
+		return false;
+	}
+
+	igt_debug("USB4Switch: Waiting for port %d displays...\n", port_num);
+	/* Poll for new connectors (max 10s) instead of fixed sleep */
+	after_count = 0;
+	for (wait = 0; wait < 10; wait++) {
+		sleep(1);
+		igt_connector_reprobe_all(drm_fd);
+		after_count = igt_connector_get_connected(drm_fd, after, 32);
+		if (after_count > before_count)
+			break;
+	}
+
+	if (after_count <= before_count) {
+		igt_debug("USB4Switch: No new connectors detected on port %d\n",
+			  port_num);
+		usb4switch_port_disable_and_wait(sw);
+		return false;
+	}
+
+	port->port_num = port_num;
+	port->name = malloc(16);
+	if (port->name)
+		snprintf(port->name, 16, "port-%d", port_num);
+	port->display_count = 0;
+
+	for (i = 0; i < after_count; i++) {
+		found = false;
+		for (j = 0; j < before_count; j++) {
+			if (after[i] == before[j]) {
+				found = true;
+				break;
+			}
+		}
+
+		if (!found &&
+		    port->display_count < USB4_SWITCH_MAX_DISPLAYS_PER_PORT) {
+			char path[256];
+
+			if (igt_connector_get_info(drm_fd, after[i],
+						   name, sizeof(name),
+						   serial, sizeof(serial),
+						   path, sizeof(path))) {
+				struct usb4switch_display *disp;
+
+				disp = &port->displays[port->display_count];
+				disp->connector_name = strdup(name);
+				if (!disp->connector_name)
+					continue;
+				disp->edid_serial = serial[0] ?
+						    strdup(serial) : NULL;
+				disp->connector_path = path[0] ?
+						       strdup(path) : NULL;
+
+				igt_info("USB4Switch: Port %d Display %d: %s (EDID: %s)\n",
+					 port_num, port->display_count + 1,
+					 name,
+					 serial[0] ? serial : "none");
+
+				port->display_count++;
+			}
+		}
+	}
+
+	usb4switch_port_disable_and_wait(sw);
+	igt_connector_reprobe_all(drm_fd);
+
+	if (port->display_count > 0)
+		sw->port_count++;
+
+	return port->display_count > 0;
+}
+
+/*
+ * autodiscover_config - Autodiscover switch device and port displays.
+ */
+static bool autodiscover_config(struct usb4switch *sw, int drm_fd)
+{
+	uint32_t before[32];
+	int before_count;
+	int p;
+
+	sw->device_path = discover_usb4_switch_device();
+	if (!sw->device_path)
+		return false;
+
+	sw->hotplug_timeout_s = USB4_SWITCH_DEFAULT_HOTPLUG_TIMEOUT_S;
+	sw->iterations = USB4_SWITCH_DEFAULT_ITERATIONS;
+	sw->min_switch_interval_ms = USB4_SWITCH_DEFAULT_MIN_INTERVAL_MS;
+	sw->port_count = 0;
+
+	sw->serial = igt_serial_open(sw->device_path, 115200);
+	if (!sw->serial) {
+		igt_debug("USB4Switch: Failed to open autodiscovered device %s\n",
+			  sw->device_path);
+		free(sw->device_path);
+		sw->device_path = NULL;
+		return false;
+	}
+
+	if (!verify_communication(sw)) {
+		igt_serial_close(sw->serial);
+		sw->serial = NULL;
+		free(sw->device_path);
+		sw->device_path = NULL;
+		return false;
+	}
+
+	igt_info("USB4Switch: Autodiscovering displays...\n");
+
+	usb4switch_port_disable_and_wait(sw);
+
+	igt_connector_reprobe_all(drm_fd);
+
+	before_count = igt_connector_get_connected(drm_fd, before, 32);
+	if (before_count >= 32)
+		igt_warn("USB4Switch: Connector count %d may exceed array size\n",
+			 before_count);
+	igt_debug("USB4Switch: %d connectors before autodiscovery\n",
+		  before_count);
+
+	/*
+	 * Probe ports sequentially. Stop at the first port that yields no
+	 * displays — same contiguity rule as config-based port counting.
+	 */
+	for (p = 1; p <= USB4_SWITCH_MAX_PORTS; p++) {
+		if (!discover_port_displays(sw, drm_fd, p, before, before_count))
+			break;
+	}
+
+	usb4switch_port_disable(sw);
+
+	igt_info("USB4Switch: Autodiscovery complete - %d ports with displays\n",
+		 sw->port_count);
+
+	return sw->port_count > 0;
+}
+
+/**
+ * usb4switch_init:
+ * @drm_fd: DRM file descriptor (used only for autodiscovery, not stored)
+ *
+ * Initializes USB4 switch from .igtrc configuration.
+ * If no configuration is present, attempts
+ * autodiscovery of the switch device and displays behind each port.
+ *
+ * Returns: Switch handle on success, NULL on failure.
+ */
+struct usb4switch *usb4switch_init(int drm_fd)
+{
+	struct usb4switch *sw;
+	bool config_ok;
+
+	sw = calloc(1, sizeof(*sw));
+	if (!sw)
+		return NULL;
+
+	config_ok = parse_config(sw);
+
+	if (!config_ok) {
+		if (drm_fd < 0) {
+			igt_debug("USB4Switch: No config and no DRM fd for autodiscovery\n");
+			free_config(sw);
+			free(sw);
+			return NULL;
+		}
+
+		igt_info("USB4Switch: No configuration found, attempting autodiscovery...\n");
+		if (!autodiscover_config(sw, drm_fd)) {
+			igt_debug("USB4Switch: Autodiscovery failed\n");
+			if (sw->serial)
+				igt_serial_close(sw->serial);
+			free_config(sw);
+			free(sw);
+			return NULL;
+		}
+		igt_info("USB4Switch: Initialized via autodiscovery (Model 3141)\n");
+		return sw;
+	}
+
+	sw->serial = igt_serial_open(sw->device_path, 115200);
+	if (!sw->serial) {
+		igt_debug("USB4Switch: Failed to open serial port %s\n",
+			  sw->device_path);
+		free_config(sw);
+		free(sw);
+		return NULL;
+	}
+
+	if (!verify_communication(sw)) {
+		igt_serial_close(sw->serial);
+		free_config(sw);
+		free(sw);
+		return NULL;
+	}
+
+	igt_info("USB4Switch: Initialized (Model 3141)\n");
+	return sw;
+}
+
+/**
+ * usb4switch_deinit:
+ * @sw: switch handle
+ *
+ * Closes the switch and frees resources.
+ * Disables all ports before closing.
+ */
+void usb4switch_deinit(struct usb4switch *sw)
+{
+	if (!sw)
+		return;
+
+	usb4switch_port_disable(sw);
+
+	if (sw->serial)
+		igt_serial_close(sw->serial);
+	free_config(sw);
+	free(sw);
+
+	igt_debug("USB4Switch: Deinitialized\n");
+}
+
+/**
+ * usb4switch_port_enable:
+ * @sw: switch handle
+ * @port: port number (1 or 2)
+ *
+ * Enables the specified port.
+ *
+ * Returns: true on success, false on failure.
+ */
+bool usb4switch_port_enable(struct usb4switch *sw, int port)
+{
+	char cmd[32];
+	char response[256];
+
+	if (!sw || port < 1 || port > USB4_SWITCH_MAX_PORTS)
+		return false;
+
+	enforce_min_interval(sw);
+
+	snprintf(cmd, sizeof(cmd), "port %d", port);
+
+	if (!send_command(sw, cmd, response, sizeof(response))) {
+		igt_warn("USB4Switch: Failed to enable port %d\n", port);
+		return false;
+	}
+	if (!response_is_ok(response)) {
+		igt_warn("USB4Switch: Failed to enable port %d (response: '%s')\n",
+			 port, response);
+		return false;
+	}
+
+	stamp_port_change(sw);
+	igt_debug("USB4Switch: Enabled port %d\n", port);
+	return true;
+}
+
+/**
+ * usb4switch_port_enable_delayed:
+ * @sw: switch handle
+ * @port: port number (1 or 2)
+ * @delay_seconds: delay in seconds before port change executes
+ *
+ * Schedules a port enable after the specified delay using the hardware
+ * delay command on Model 3141. Useful for hotplug-during-suspend tests.
+ *
+ * Returns: true on success, false on failure.
+ */
+bool usb4switch_port_enable_delayed(struct usb4switch *sw, int port,
+				    int delay_seconds)
+{
+	return usb4switch_queue_port_change_delayed(sw, port, delay_seconds,
+						    "port enable");
+}
+
+/**
+ * usb4switch_port_disable_delayed:
+ * @sw: switch handle
+ * @delay_seconds: delay in seconds before port disable executes
+ *
+ * Schedules a port disable (undock) after the specified delay.
+ * Useful for undock-during-suspend tests.
+ *
+ * Returns: true on success, false on failure.
+ */
+bool usb4switch_port_disable_delayed(struct usb4switch *sw, int delay_seconds)
+{
+	return usb4switch_queue_port_change_delayed(sw, 0, delay_seconds,
+						    "port disable");
+}
+
+/**
+ * usb4switch_port_disable:
+ * @sw: switch handle
+ *
+ * Disables all ports.
+ *
+ * Returns: true on success, false on failure.
+ */
+bool usb4switch_port_disable(struct usb4switch *sw)
+{
+	char response[256];
+
+	if (!sw)
+		return false;
+
+	enforce_min_interval(sw);
+
+	if (!send_command(sw, "port 0", response, sizeof(response))) {
+		igt_warn("USB4Switch: Failed to disable ports\n");
+		return false;
+	}
+	if (!response_is_ok(response)) {
+		igt_warn("USB4Switch: Failed to disable ports (response: '%s')\n",
+			 response);
+		return false;
+	}
+
+	stamp_port_change(sw);
+	igt_debug("USB4Switch: Disabled all ports\n");
+	return true;
+}
+
+/**
+ * usb4switch_get_active_port:
+ * @sw: switch handle
+ *
+ * Gets currently active port.
+ *
+ * Returns: Port number (1 or 2), 0 if disabled, -1 on error.
+ */
+int usb4switch_get_active_port(struct usb4switch *sw)
+{
+	char response[256];
+	int port;
+
+	if (!sw)
+		return -1;
+
+	if (!send_command(sw, "port ?", response, sizeof(response)))
+		return -1;
+
+	if (!response_is_ok(response)) {
+		igt_warn("USB4Switch: Port query rejected: '%s'\n", response);
+		return -1;
+	}
+
+	if (sscanf(response, "port: %d", &port) == 1 ||
+	    sscanf(response, "port %d", &port) == 1 ||
+	    sscanf(response, "%d", &port) == 1)
+		return port;
+
+	igt_warn("USB4Switch: Could not parse port response: '%s'\n",
+		 response);
+	return -1;
+}
+
+/**
+ * usb4switch_get_status:
+ * @sw: switch handle
+ * @buf: buffer for status
+ * @size: buffer size
+ *
+ * Gets full status from switch.
+ *
+ * Returns: true on success.
+ */
+bool usb4switch_get_status(struct usb4switch *sw, char *buf, size_t size)
+{
+	if (!sw || !buf || size == 0)
+		return false;
+
+	if (!send_command(sw, "status", buf, size))
+		return false;
+
+	return response_is_ok(buf);
+}
+
+/**
+ * usb4switch_get_voltage_mv:
+ * @sw: switch handle
+ *
+ * Gets VBUS voltage by sending the "volts" command.
+ * The 3141 firmware responds with "X.XX V" (e.g. "4.85 V").
+ *
+ * Note: The 3141 hardware may not have accurate VBUS sense circuitry.
+ * Voltage readback may not be meaningful on all units.
+ *
+ * Returns: Voltage in mV, -1 on error.
+ */
+int usb4switch_get_voltage_mv(struct usb4switch *sw)
+{
+	char response[256];
+	float volts;
+
+	if (!sw)
+		return -1;
+
+	if (!send_command(sw, "volts", response, sizeof(response)))
+		return -1;
+
+	if (sscanf(response, "%f", &volts) == 1)
+		return (int)(volts * 1000);
+
+	return -1;
+}
+
+/**
+ * usb4switch_get_current_ma:
+ * @sw: switch handle
+ *
+ * Gets VBUS current by sending the "amps" command.
+ * The 3141 firmware responds with "XXX mA" (e.g. "125 mA").
+ *
+ * Note: The 3141 hardware may not have accurate current sense circuitry.
+ *
+ * Returns: Current in mA, -1 on error.
+ */
+int usb4switch_get_current_ma(struct usb4switch *sw)
+{
+	char response[256];
+	int current;
+
+	if (!sw)
+		return -1;
+
+	if (!send_command(sw, "amps", response, sizeof(response)))
+		return -1;
+
+	if (sscanf(response, "%d", &current) == 1)
+		return current;
+
+	return -1;
+}
+
+/**
+ * usb4switch_wait_vbus_safe:
+ * @sw: switch handle
+ * @timeout_ms: maximum time to wait in milliseconds
+ *
+ * Waits for VBUS voltage to drop below the Vsafe0V threshold (800 mV)
+ * after a port disable. Polls using the "volts" command. If voltage
+ * readback is not supported or returns errors, falls back to a fixed
+ * 1-second delay.
+ *
+ * Returns: true when VBUS is safe (or after fallback delay).
+ */
+bool usb4switch_wait_vbus_safe(struct usb4switch *sw, int timeout_ms)
+{
+	int elapsed = 0;
+	int mv = -1;
+
+	if (!sw)
+		return false;
+
+	while (elapsed < timeout_ms) {
+		mv = usb4switch_get_voltage_mv(sw);
+		if (mv < 0) {
+			/* Voltage readback not supported; use fixed delay */
+			igt_debug("USB4Switch: voltage readback failed, "
+				  "using 1s fallback delay\n");
+			sleep(1);
+			return true;
+		}
+		if (mv < USB4_SWITCH_VBUS_SAFE_MV) {
+			igt_debug("USB4Switch: VBUS safe at %d mV\n", mv);
+			return true;
+		}
+		usleep(USB4_SWITCH_VBUS_SAFE_POLL_MS * 1000);
+		elapsed += USB4_SWITCH_VBUS_SAFE_POLL_MS;
+	}
+
+	igt_warn("USB4Switch: VBUS still at %d mV after %d ms\n",
+		 mv, timeout_ms);
+	return false;
+}
+
+/**
+ * usb4switch_port_disable_and_wait:
+ * @sw: switch handle
+ *
+ * Disables all ports and waits for VBUS to reach safe levels.
+ *
+ * Returns: true on success.
+ */
+bool usb4switch_port_disable_and_wait(struct usb4switch *sw)
+{
+	if (!usb4switch_port_disable(sw))
+		return false;
+
+	return usb4switch_wait_vbus_safe(sw, USB4_SWITCH_VBUS_SAFE_TIMEOUT_MS);
+}
+
+/**
+ * usb4switch_port_switch:
+ * @sw: switch handle
+ * @new_port: target port number (1..MAX_PORTS)
+ *
+ * Safely switches from the currently active port to @new_port.
+ * If another port is active, disables it first and waits for VBUS
+ * discharge before enabling the new port. If @new_port is already
+ * active, this is a no-op.
+ *
+ * Returns: true on success.
+ */
+bool usb4switch_port_switch(struct usb4switch *sw, int new_port)
+{
+	int active;
+
+	if (!sw || new_port < 1 || new_port > USB4_SWITCH_MAX_PORTS)
+		return false;
+
+	active = usb4switch_get_active_port(sw);
+
+	if (active == new_port) {
+		igt_debug("USB4Switch: Port %d already active\n", new_port);
+		return true;
+	}
+
+	if (active > 0) {
+		igt_debug("USB4Switch: Disabling port %d before switching "
+			  "to port %d\n", active, new_port);
+		if (!usb4switch_port_disable_and_wait(sw))
+			return false;
+	}
+
+	return usb4switch_port_enable(sw, new_port);
+}
+
+/**
+ * usb4switch_get_port_config:
+ * @sw: switch handle
+ * @port_index: port index (0-based)
+ *
+ * Returns: Pointer to port config, NULL if invalid.
+ */
+const struct usb4switch_port *usb4switch_get_port_config(struct usb4switch *sw,
+							 int port_index)
+{
+	if (!sw || port_index < 0 || port_index >= sw->port_count)
+		return NULL;
+
+	return &sw->ports[port_index];
+}
+
+/**
+ * usb4switch_get_port_count:
+ * @sw: switch handle
+ *
+ * Returns: Number of configured ports.
+ */
+int usb4switch_get_port_count(struct usb4switch *sw)
+{
+	return sw ? sw->port_count : 0;
+}
+
+/**
+ * usb4switch_get_hotplug_timeout:
+ * @sw: switch handle
+ *
+ * Returns: Hotplug timeout in seconds.
+ */
+int usb4switch_get_hotplug_timeout(struct usb4switch *sw)
+{
+	return sw ? sw->hotplug_timeout_s :
+		    USB4_SWITCH_DEFAULT_HOTPLUG_TIMEOUT_S;
+}
+
+/**
+ * usb4switch_get_iterations:
+ * @sw: switch handle
+ *
+ * Returns: Configured iterations.
+ */
+int usb4switch_get_iterations(struct usb4switch *sw)
+{
+	return sw ? sw->iterations : USB4_SWITCH_DEFAULT_ITERATIONS;
+}
diff --git a/lib/igt_usb4_switch.h b/lib/igt_usb4_switch.h
new file mode 100644
index 000000000..5f1a0d334
--- /dev/null
+++ b/lib/igt_usb4_switch.h
@@ -0,0 +1,157 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef IGT_USB4_SWITCH_H
+#define IGT_USB4_SWITCH_H
+
+#include <stdbool.h>
+#include <stddef.h>
+#include <stdint.h>
+
+/**
+ * USB4_SWITCH_MODEL_3141:
+ *
+ * Model number for Switch 3141.
+ */
+#define USB4_SWITCH_MODEL_3141 3141
+
+/**
+ * USB4_SWITCH_MAX_PORTS:
+ *
+ * Maximum number of ports on the switch.
+ */
+#define USB4_SWITCH_MAX_PORTS 2
+
+/**
+ * USB4_SWITCH_MAX_DISPLAYS_PER_PORT:
+ *
+ * Maximum displays per port (for MST hubs).
+ */
+#define USB4_SWITCH_MAX_DISPLAYS_PER_PORT 4
+
+/**
+ * USB4_SWITCH_RESPONSE_MAX_LEN:
+ *
+ * Recommended buffer size for usb4switch_get_status() callers.
+ * Internal commands use smaller buffers since responses are short.
+ */
+#define USB4_SWITCH_RESPONSE_MAX_LEN 1024
+
+/**
+ * USB4_SWITCH_DEFAULT_TIMEOUT_MS:
+ *
+ * Default command timeout in milliseconds.
+ */
+#define USB4_SWITCH_DEFAULT_TIMEOUT_MS 2000
+
+/**
+ * USB4_SWITCH_DEFAULT_HOTPLUG_TIMEOUT_S:
+ *
+ * Default hotplug wait timeout in seconds.
+ */
+#define USB4_SWITCH_DEFAULT_HOTPLUG_TIMEOUT_S 10
+
+/**
+ * USB4_SWITCH_DEFAULT_ITERATIONS:
+ *
+ * Default dock/undock iterations.
+ */
+#define USB4_SWITCH_DEFAULT_ITERATIONS 3
+
+/**
+ * USB4_SWITCH_VBUS_SAFE_MV:
+ *
+ * VBUS voltage threshold in mV below which VBUS is considered safe
+ * (Vsafe0V per USB PD specification).
+ */
+#define USB4_SWITCH_VBUS_SAFE_MV 800
+
+/**
+ * USB4_SWITCH_VBUS_SAFE_TIMEOUT_MS:
+ *
+ * Maximum time in milliseconds to wait for VBUS to discharge to safe levels.
+ */
+#define USB4_SWITCH_VBUS_SAFE_TIMEOUT_MS 3000
+
+/**
+ * USB4_SWITCH_VBUS_SAFE_POLL_MS:
+ *
+ * Polling interval in milliseconds when waiting for VBUS discharge.
+ */
+#define USB4_SWITCH_VBUS_SAFE_POLL_MS 100
+
+/**
+ * USB4_SWITCH_DEFAULT_MIN_INTERVAL_MS:
+ *
+ * Default minimum interval in milliseconds between successive port
+ * operations.  Matches Cricket UI's 1-second safety guard.
+ */
+#define USB4_SWITCH_DEFAULT_MIN_INTERVAL_MS 1000
+
+/**
+ * struct usb4switch_display:
+ * @connector_path: MST PATH property (e.g., "mst:5-2-8"), preferred for MST
+ * @connector_name: Fallback connector name (e.g., "DP-6") for non-MST
+ * @edid_serial: Expected EDID serial string for verification
+ *
+ * Configuration for an expected display on a switch port.
+ * For MST displays, use connector_path which is stable across hotplug.
+ * For non-MST displays, connector_name can be used.
+ */
+struct usb4switch_display {
+	char *connector_path;
+	char *connector_name;
+	char *edid_serial;
+};
+
+/**
+ * struct usb4switch_port:
+ * @port_num: Port number (1 or 2)
+ * @name: Human-readable port name
+ * @displays: Array of expected displays on this port
+ * @display_count: Number of displays configured
+ *
+ * Configuration for a switch port.
+ */
+struct usb4switch_port {
+	int port_num;
+	char *name;
+	struct usb4switch_display displays[USB4_SWITCH_MAX_DISPLAYS_PER_PORT];
+	int display_count;
+};
+
+struct usb4switch;
+
+/* Lifecycle */
+struct usb4switch *usb4switch_init(int drm_fd);
+void usb4switch_deinit(struct usb4switch *sw);
+
+/* Port control */
+bool usb4switch_port_enable(struct usb4switch *sw, int port);
+bool usb4switch_port_enable_delayed(struct usb4switch *sw, int port,
+				    int delay_seconds);
+bool usb4switch_port_disable(struct usb4switch *sw);
+bool usb4switch_port_disable_delayed(struct usb4switch *sw,
+				     int delay_seconds);
+
+/* VBUS safety */
+bool usb4switch_wait_vbus_safe(struct usb4switch *sw, int timeout_ms);
+bool usb4switch_port_disable_and_wait(struct usb4switch *sw);
+bool usb4switch_port_switch(struct usb4switch *sw, int new_port);
+
+/* Status queries */
+int usb4switch_get_active_port(struct usb4switch *sw);
+bool usb4switch_get_status(struct usb4switch *sw, char *buf, size_t size);
+int usb4switch_get_voltage_mv(struct usb4switch *sw);
+int usb4switch_get_current_ma(struct usb4switch *sw);
+
+/* Configuration getters */
+const struct usb4switch_port *usb4switch_get_port_config(struct usb4switch *sw,
+							 int port_index);
+int usb4switch_get_port_count(struct usb4switch *sw);
+int usb4switch_get_hotplug_timeout(struct usb4switch *sw);
+int usb4switch_get_iterations(struct usb4switch *sw);
+
+#endif /* IGT_USB4_SWITCH_H */
diff --git a/lib/meson.build b/lib/meson.build
index 26e7015d2..f18354f83 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -123,6 +123,7 @@ lib_sources = [
 	'igt_dsc.c',
 	'igt_hook.c',
 	'igt_serial.c',
+	'igt_usb4_switch.c',
 	'xe/xe_gt.c',
 	'xe/xe_ioctl.c',
 	'xe/xe_legacy.c',
-- 
2.25.1

