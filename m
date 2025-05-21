Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E0DC2D0CD
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 05:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F2710E056;
	Wed, 21 May 2025 05:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f52AyeXA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE71F10E056
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 05:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747806036; x=1779342036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PEzP9d9aDB2Odm9jUhYIpSnjXefHr/otAaMjd0/WYqg=;
 b=f52AyeXABcMCZWm1IEwz5VfGspaO8LfJH8DTe/XWmrZcd1gl6GzyDQjd
 Sj0iWqnCRbWRVGtmFUWdBbufdEI07oN5Qumr6M4b5RkMlU35bbkHMghx2
 zwuMld3ls8vlOSx8eDAighvZOFNcZyckb7AQP17W/ATw1J5dr3hMg62y6
 /ORvemGpeOMmQHud5fhHxpr7y0YY9TQ+3dtcUY4MznIJrqvmA58hVum1d
 dr+ROKE+OI3V00SI1Ww7ngE6HZLgKBmiYDYSfjiSaOf/7lHXrijL7Mx1T
 1w1SqN6KQ/U9lnyXZsjhBq6DIBcyxfkkqK1II2X52wAiI8DY4q+rru10D g==;
X-CSE-ConnectionGUID: uPNabj+bRS2ev2yNY+k2Og==
X-CSE-MsgGUID: MjSOoGpnT9OJ/RxpZy1rbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49693910"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49693910"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 22:40:36 -0700
X-CSE-ConnectionGUID: sY4UOuLIQ2mT6Rjp9EEQBA==
X-CSE-MsgGUID: 8cgPlRLvTty/4ObvOPjnYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="139758252"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 22:40:34 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH 1/2] lib/igt_usb4_switch: add helper library for Microsoft
 USB4 switch 3141
Date: Wed, 21 May 2025 11:26:18 +0530
Message-Id: <20250521055619.1961965-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250521055619.1961965-1-kunal1.joshi@intel.com>
References: <20250521055619.1961965-1-kunal1.joshi@intel.com>
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

The Microsoft USB4 Switch (model 3141) board
has two downstream ports, but only one can be
active at any moment. Each port may run in
Thunderbolt (TBT) or DisplayPort-Alt mode,
and the board is controlled over a
CDC-ACM serial console (/dev/ttyACM0).

The helper library exposes simple commands to:
- activate a port (port <N>)
- set the power-on default port
- program switch delay / timeout values
- enable or disable the SuperSpeed lanes
- read or write arbitrary registers
- query status or firmware version

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_usb4_switch.c | 392 ++++++++++++++++++++++++++++++++++++++++++
 lib/igt_usb4_switch.h |  78 +++++++++
 lib/meson.build       |   1 +
 3 files changed, 471 insertions(+)
 create mode 100644 lib/igt_usb4_switch.c
 create mode 100644 lib/igt_usb4_switch.h

diff --git a/lib/igt_usb4_switch.c b/lib/igt_usb4_switch.c
new file mode 100644
index 000000000..8db57089f
--- /dev/null
+++ b/lib/igt_usb4_switch.c
@@ -0,0 +4,395 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/*
+ * Helper library for controlling a USB4 switch over a serial ACM port.
+ */
+
+#include "igt_usb4_switch.h"
+
+#include <termios.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <string.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <errno.h>
+
+static GKeyFile * usb4_conf;
+
+/**
+ * configure_port:
+ * @fd: File descriptor for serial port
+ *
+ * Put @fd in raw 9600-8N1, no flow control, VMIN=0 / VTIME=5.
+ *
+ * Returns: 0 on success, -1 on error
+ */
+static int configure_port(int fd)
+{
+	struct termios tty;
+
+	if (tcgetattr(fd, &tty) < 0)
+		return -1;
+
+	cfmakeraw(&tty);
+	cfsetispeed(&tty, B9600);
+	cfsetospeed(&tty, B9600);
+
+	tty.c_cflag |=  CS8 | CLOCAL | CREAD;
+	tty.c_cflag &= ~CRTSCTS;
+
+	tty.c_cc[VMIN]  = 0;
+	tty.c_cc[VTIME] = 5;
+
+	if (tcsetattr(fd, TCSANOW, &tty) < 0)
+		return -1;
+
+	tcflush(fd, TCIOFLUSH);
+	return 0;
+}
+
+/**
+ * send_cmd:
+ * @sw:       Switch object
+ * @cmd:      Command string (without CR)
+ * @resp:     Output buffer (may be %NULL)
+ * @resp_len: Size of @resp
+ *
+ * Sends “@cmd\r”; if @resp is provided and @resp_len > 1, reads up to
+ * @resp_len-1 bytes and NUL-terminates the buffer.
+ *
+ * Returns: 0 on success, -1 on error
+ */
+static int send_cmd(usb4_switch_t *sw,
+		    const char *cmd,
+		    char *resp,
+		    size_t resp_len)
+{
+	char buf[CMD_BUF_SIZE];
+	int n = snprintf(buf, sizeof(buf), "%s\r", cmd);
+
+	if (n <= 0 || n >= (int)sizeof(buf))
+		return -1;
+
+	if (write(sw->fd, buf, n) != n)
+		return -1;
+
+	tcdrain(sw->fd);
+
+	if (resp && resp_len > 1) {
+		ssize_t r = read(sw->fd, resp, resp_len - 1);
+
+		if (r <= 0)
+			return -1;
+		resp[r] = '\0';
+	}
+
+	return 0;
+}
+
+int usb4_switch_open(usb4_switch_t *sw)
+{
+	int fd = open("/dev/ttyACM0", O_RDWR | O_NOCTTY);
+
+	if (fd < 0)
+		return -1;
+
+	if (configure_port(fd) < 0) {
+		close(fd);
+		return -1;
+	}
+
+	sw->fd = fd;
+	return 0;
+}
+
+void usb4_switch_close(usb4_switch_t *sw)
+{
+	if (sw->fd >= 0) {
+		close(sw->fd);
+		sw->fd = -1;
+	}
+}
+
+int usb4_switch_version(usb4_switch_t *sw, char *out, size_t outlen)
+{
+	return send_cmd(sw, "version", out, outlen);
+}
+
+int usb4_switch_get_port(usb4_switch_t *sw)
+{
+	char resp[RESP_BUF_SIZE];
+
+	if (send_cmd(sw, "port", resp, sizeof(resp)) < 0)
+		return -1;
+	return atoi(resp);
+}
+
+int usb4_switch_set_port(usb4_switch_t *sw, int port)
+{
+	char cmd[CMD_BUF_SIZE];
+
+	snprintf(cmd, sizeof(cmd), "port %d", port);
+	return send_cmd(sw, cmd, NULL, 0);
+}
+
+int usb4_switch_get_default_port(usb4_switch_t *sw)
+{
+	char resp[RESP_BUF_SIZE];
+
+	if (send_cmd(sw, "defaultport", resp, sizeof(resp)) < 0)
+		return -1;
+	return atoi(resp);
+}
+
+int usb4_switch_set_default_port(usb4_switch_t *sw, int port)
+{
+	char cmd[CMD_BUF_SIZE];
+
+	snprintf(cmd, sizeof(cmd), "defaultport %d", port);
+	return send_cmd(sw, cmd, NULL, 0);
+}
+
+int usb4_switch_set_delay(usb4_switch_t *sw, int seconds)
+{
+	char cmd[CMD_BUF_SIZE];
+
+	snprintf(cmd, sizeof(cmd), "delay %d", seconds);
+	return send_cmd(sw, cmd, NULL, 0);
+}
+
+int usb4_switch_set_timeout(usb4_switch_t *sw, int ms)
+{
+	char cmd[CMD_BUF_SIZE];
+
+	snprintf(cmd, sizeof(cmd), "timeout %d", ms);
+	return send_cmd(sw, cmd, NULL, 0);
+}
+
+int usb4_switch_set_superspeed(usb4_switch_t *sw, bool enable)
+{
+	return send_cmd(sw, enable ? "superspeed 1" : "superspeed 0", NULL, 0);
+}
+
+int usb4_switch_put_data(usb4_switch_t *sw, int idx, int val)
+{
+	char cmd[CMD_BUF_SIZE];
+
+	snprintf(cmd, sizeof(cmd), "put %d %d", idx, val);
+	return send_cmd(sw, cmd, NULL, 0);
+}
+
+int usb4_switch_get_data(usb4_switch_t *sw, int idx)
+{
+	char resp[RESP_BUF_SIZE];
+	char cmd[CMD_BUF_SIZE];
+
+	snprintf(cmd, sizeof(cmd), "get %d", idx);
+	if (send_cmd(sw, cmd, resp, sizeof(resp)) < 0)
+		return -1;
+	return atoi(resp);
+}
+
+int usb4_switch_status(usb4_switch_t *sw, char *out, size_t outlen)
+{
+	return send_cmd(sw, "status", out, outlen);
+}
+
+int usb4_switch_reset(usb4_switch_t *sw)
+{
+	return send_cmd(sw, "reset", NULL, 0);
+}
+
+int usb4_switch_set_port_with_delay(usb4_switch_t *sw,
+				    int port, int delay_s)
+{
+	if (usb4_switch_set_delay(sw, delay_s) < 0)
+		return -1;
+	return usb4_switch_set_port(sw, port);
+}
+
+int usb4_switch_set_port_with_timeout(usb4_switch_t *sw,
+				      int port, int timeout_ms)
+{
+	if (usb4_switch_set_timeout(sw, timeout_ms) < 0)
+		return -1;
+	return usb4_switch_set_port(sw, port);
+}
+
+bool usb4_switch_load_config(void)
+{
+	usb4_conf = igt_load_igtrc();
+	return usb4_conf != NULL;
+}
+
+void usb4_switch_unload_config(void)
+{
+	if (usb4_conf) {
+		g_key_file_free(usb4_conf);
+		usb4_conf = NULL;
+	}
+}
+
+struct usb4_switch_port_info *
+usb4_switch_list_ports(size_t *out_count)
+{
+	gsize n_groups;
+
+	gchar **groups = g_key_file_get_groups(usb4_conf, &n_groups);
+	struct usb4_switch_port_info *ports = NULL;
+	size_t count = 0;
+
+	for (gsize gi = 0; gi < n_groups; gi++) {
+		const char *grp = groups[gi];
+		struct usb4_switch_port_info *p;
+		GError *err = NULL;
+		gchar **tokens = NULL;
+		char *raw = NULL;
+		size_t n = 0;
+
+		/* skip irrelevant sections */
+		if (g_strcmp0(grp, USB4_SWITCH_CFG_GROUP) == 0)
+			continue;
+		if (!g_str_has_prefix(grp, USB4_SWITCH_SECTION_PREF))
+			continue;
+
+		/* ---- allocate & fill struct ---- */
+		ports = realloc(ports, sizeof(*ports) * (count + 1));
+		p     = &ports[count];
+		memset(p, 0, sizeof(*p));
+
+		p->name = strdup(grp + strlen(USB4_SWITCH_SECTION_PREF));
+
+		p->port_id = g_key_file_get_integer(usb4_conf,
+						    grp, "USB4SwitchPortID", NULL);
+		p->type    = g_key_file_get_string(usb4_conf,
+						    grp, "Type", NULL);
+		p->displays = g_key_file_get_integer(usb4_conf,
+						     grp, "Displays", NULL);
+
+		raw = g_key_file_get_string(usb4_conf, grp, "EDIDs", &err);
+		igt_assert_f(raw && !err,
+			     "Missing or invalid EDIDs in [%s]\n", grp);
+
+		tokens = g_strsplit(raw, ",", 0);
+
+		/* trim + count */
+		for (char **t = tokens; *t; t++) {
+			char *s = g_strstrip(*t);
+
+			if (s[0] != '\0')
+				tokens[n++] = s;
+		}
+		tokens[n] = NULL;
+
+		p->edids = g_malloc0(sizeof(char *) * (n + 1));
+		for (size_t i = 0; i < n; i++)
+			p->edids[i] = strdup(tokens[i]);
+		p->n_edids = n;
+
+		g_strfreev(tokens);
+		g_free(raw);
+
+		igt_assert_f(p->n_edids == p->displays,
+			     "Config error in [%s]: Displays=%d, EDIDs=%u\n",
+			     grp, p->displays, p->n_edids);
+
+		count++;
+	}
+
+	g_strfreev(groups);
+	*out_count = count;
+	return ports;
+}
+
+void usb4_switch_free_port_info(struct usb4_switch_port_info *ports,
+				size_t count)
+{
+	if (!ports)
+		return;
+
+	for (size_t i = 0; i < count; i++) {
+		free(ports[i].name);
+		free(ports[i].type);
+		g_strfreev(ports[i].edids);
+	}
+	free(ports);
+}
+
+bool usb4_switch_port_has_edid(int drm_fd,
+			       int port_id,
+			       const char *expected)
+{
+	drmModeRes *res  = NULL;   /* declare at block top (C90) */
+	bool found = false;
+
+	igt_info("Checking EDID serial on port %d: want %s\n",
+		 port_id, expected);
+
+	res = drmModeGetResources(drm_fd);
+	igt_assert(res);
+	igt_info("  %d connectors to scan\n", res->count_connectors);
+
+	for (int ci = 0; ci < res->count_connectors; ci++) {
+		uint32_t conn_id;
+		drmModeConnector *conn;
+		uint64_t blob64 = 0;
+		uint32_t blob_id;
+		drmModePropertyBlobRes *blob;
+		struct edid *e;
+		char serial_hex[9];
+
+		conn_id = res->connectors[ci];
+		conn    = drmModeGetConnector(drm_fd, conn_id);
+		if (!conn) {
+			igt_warn("  connector %u: no connector data\n", conn_id);
+			continue;
+		}
+
+		if (conn->connection != DRM_MODE_CONNECTED) {
+			drmModeFreeConnector(conn);
+			continue;
+		}
+
+		if (!kmstest_get_property(drm_fd,
+					  conn->connector_id,
+					  DRM_MODE_OBJECT_CONNECTOR,
+					  "EDID", NULL,
+					  &blob64, NULL) ||
+		    blob64 == 0) {
+			igt_warn("  connector %u: no EDID blob\n", conn_id);
+			drmModeFreeConnector(conn);
+			continue;
+		}
+
+		blob_id = (uint32_t)blob64;
+		blob = drmModeGetPropertyBlob(drm_fd, blob_id);
+		igt_assert(blob && blob->length >= sizeof(struct edid));
+
+		e = (struct edid *)blob->data;
+		snprintf(serial_hex, sizeof(serial_hex),
+			 "%02X%02X%02X%02X",
+			 e->serial[0], e->serial[1],
+			 e->serial[2], e->serial[3]);
+
+		igt_info("  connector %u → serial=%s\n",
+			 conn_id, serial_hex);
+
+		drmModeFreePropertyBlob(blob);
+		drmModeFreeConnector(conn);
+
+		if (strcmp(serial_hex, expected) == 0) {
+			igt_info("  → match on connector %u\n", conn_id);
+			found = true;
+			break;
+		}
+	}
+
+	drmModeFreeResources(res);
+	if (!found)
+		igt_info("No connector found with serial %s\n", expected);
+	return found;
+}
diff --git a/lib/igt_usb4_switch.h b/lib/igt_usb4_switch.h
new file mode 100644
index 000000000..8d9d265cc
--- /dev/null
+++ b/lib/igt_usb4_switch.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef IGT_USB4_SWITCH_H
+#define IGT_USB4_SWITCH_H
+
+#include <stdbool.h>
+#include <stddef.h>
+#include <stdio.h>
+#include <string.h>
+#include <stdlib.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <termios.h>
+#include <sys/ioctl.h>
+#include <errno.h>
+#include <glib.h>
+#include "igt_core.h"
+#include <xf86drmMode.h>
+#include "igt_kms.h"
+#include "igt_edid.h"
+
+#define CMD_BUF_SIZE   64
+#define RESP_BUF_SIZE 128
+#define USB4_SWITCH_CFG_GROUP     "USB4Switch"
+#define USB4_SWITCH_SECTION_PREF  "USB4Switch:"
+
+/**
+ * struct usb4_switch_port_info - describes one USB4-switch port from igtrc
+ * @name:       the logical name after the colon in the section header
+ * @port_id:    the numeric USB4SwitchPortID
+ * @type:       TBT or DP-ALT
+ * @displays:   how many displays to expect
+ * @edids:      array of EDID serial strings
+ * @n_edids:    number of entries in @edids (should == @displays)
+ */
+struct usb4_switch_port_info {
+	char *name;
+	int port_id;
+	char *type;
+	int displays;
+	char **edids;
+	int n_edids;
+};
+
+typedef struct {
+	int fd;
+	char devpath[64];
+} usb4_switch_t;
+
+int usb4_switch_open(usb4_switch_t *sw);
+void usb4_switch_close(usb4_switch_t *sw);
+int usb4_switch_version(usb4_switch_t *sw, char *out, size_t outlen);
+int usb4_switch_get_port(usb4_switch_t *sw);
+int usb4_switch_set_port(usb4_switch_t *sw, int port);
+int usb4_switch_get_default_port(usb4_switch_t *sw);
+int usb4_switch_set_default_port(usb4_switch_t *sw, int port);
+int usb4_switch_set_delay(usb4_switch_t *sw, int seconds);
+int usb4_switch_set_timeout(usb4_switch_t *sw, int ms);
+int usb4_switch_set_superspeed(usb4_switch_t *sw, bool enable);
+int usb4_switch_put_data(usb4_switch_t *sw, int index, int value);
+int usb4_switch_get_data(usb4_switch_t *sw, int index);
+int usb4_switch_status(usb4_switch_t *sw, char *out, size_t outlen);
+int usb4_switch_reset(usb4_switch_t *sw);
+int usb4_switch_set_port_with_delay(usb4_switch_t *sw, int port, int delay_s);
+int usb4_switch_set_port_with_timeout(usb4_switch_t *sw, int port, int timeout_ms);
+bool usb4_switch_load_config(void);
+void usb4_switch_unload_config(void);
+bool usb4_switch_port_has_edid(int drm_fd,
+			       int port_id,
+			       const char *expected_edid);
+struct usb4_switch_port_info *
+usb4_switch_list_ports(size_t *out_count);
+void usb4_switch_free_port_info(struct usb4_switch_port_info *ports,
+				size_t count);
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index 6f3a1150c..c2892eaab 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -48,6 +48,7 @@ lib_sources = [
 	'igt_taints.c',
 	'igt_thread.c',
 	'igt_types.c',
+        'igt_usb4_switch.c',
 	'igt_vec.c',
 	'igt_vgem.c',
 	'igt_x86.c',
-- 
2.25.1

