Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B35CD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 05:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D6510E490;
	Mon, 11 May 2026 05:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OU7+gyd8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B573210E485
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 05:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778476954; x=1810012954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r5w1LbIq9xWGYLZZS825cACFE44eL+TFY+gw8zmbM4I=;
 b=OU7+gyd8ODcbhT5bOkLmqi1AusBOT2VKypC/gStr2kNGAb+JGm+fXz60
 nfFWScoI0zqXI1tB6uE3SXvuXBKMQYliufXZ35Ivl1S7kgxHttsSfqNQQ
 YQWCJED/8z2Fqf9mLYq9doSNvYbJtpd1bcECTjXOPKUyPK0d0oSw0nRWy
 nND4FKW16LFDw3S8O/rtJZdfqqMo5hBX6UtTNAGV/gIISbZQrRK8kZ9Jk
 qwVKBJkr23jQYKvP13KjxARbDE/PhvoTcqRyNeaRLtyc4fzkqePiaK1bI
 RI+NBl6dtnU3QPg19QliA0K/IRR1vujttNvn1A/Jglm8juWnT7A3Gey+e w==;
X-CSE-ConnectionGUID: Fdaa3uKsQlWI7b7xHaszXw==
X-CSE-MsgGUID: NBFqwW6ySPOEH8XHsI8sSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="90823863"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="90823863"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 22:22:34 -0700
X-CSE-ConnectionGUID: Fk0iXxbyR4qCADyBVb5MzA==
X-CSE-MsgGUID: CxLgeguRQSmR5G/HBy+C1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="237299744"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 22:22:33 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Simon Ser <contact@emersion.fr>,
 Jani Nikula <jani.nikula@intel.com>, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_connector_helper: Add DRM connector helpers
 using libdisplay-info
Date: Mon, 11 May 2026 11:13:55 +0530
Message-Id: <20260511054356.1313884-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260511054356.1313884-1-kunal1.joshi@intel.com>
References: <20260511054356.1313884-1-kunal1.joshi@intel.com>
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

The upcoming DP tunneling tests need to look up connectors by EDID
serial or MST PATH across re-probes such as suspend/resume, and
select modes by pixel clock rather than resolution. Neither
capability exists in the current IGT helper set.

Add a small connector-enumeration layer backed by libdisplay-info
with look-up-by-name, by-PATH, and by-serial helpers, plus five
mode/output-selection utilities (lowest/highest clock, preferred,
mode-in-list, output-by-id). The dependency is optional; when
missing the helper is simply not built.

Cc: Simon Ser <contact@emersion.fr>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_connector_helper.c | 525 +++++++++++++++++++++++++++++++++++++
 lib/igt_connector_helper.h |  45 ++++
 lib/meson.build            |   5 +
 meson.build                |   3 +
 4 files changed, 578 insertions(+)
 create mode 100644 lib/igt_connector_helper.c
 create mode 100644 lib/igt_connector_helper.h

diff --git a/lib/igt_connector_helper.c b/lib/igt_connector_helper.c
new file mode 100644
index 000000000..cd10b2e91
--- /dev/null
+++ b/lib/igt_connector_helper.c
@@ -0,0 +1,525 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * SECTION:igt_connector_helper
+ * @short_description: Generic DRM connector helpers
+ * @title: Connector Helper
+ * @include: igt_connector_helper.h
+ *
+ * Helpers for DRM connector enumeration, lookup by name / MST PATH /
+ * EDID serial, and post-hotplug reprobing. EDID parsing is delegated to
+ * libdisplay-info (https://gitlab.freedesktop.org/emersion/libdisplay-info).
+ */
+
+#include <stdlib.h>
+#include <string.h>
+
+#include <libdisplay-info/info.h>
+#include <xf86drm.h>
+#include <xf86drmMode.h>
+
+#include "igt_core.h"
+#include "igt_kms.h"
+#include "igt_connector_helper.h"
+
+#define IGT_CONNECTOR_MAX_PROBE		64
+
+/*
+ * Best-effort serial extraction via libdisplay-info.
+ *
+ * di_info_get_serial() returns a malloc'd string built from the EDID
+ * 0xFF descriptor when present, falling back to the 32-bit header
+ * serial number rendered as decimal. NULL means the EDID is unparsable
+ * or contains no serial information at all.
+ */
+static void connector_serial_from_edid(const void *edid_data, size_t edid_size,
+				       char *serial, size_t serial_size)
+{
+	struct di_info *info;
+	char *got;
+
+	serial[0] = '\0';
+
+	info = di_info_parse_edid(edid_data, edid_size);
+	if (!info)
+		return;
+
+	got = di_info_get_serial(info);
+	if (got) {
+		snprintf(serial, serial_size, "%s", got);
+		free(got);
+	}
+
+	di_info_destroy(info);
+}
+
+/**
+ * igt_connector_get_connected:
+ * @drm_fd: DRM file descriptor
+ * @connectors: array to store connector IDs; must be valid if @max_connectors > 0
+ * @max_connectors: maximum number of connectors to store
+ *
+ * Walks all DRM connectors and stores the IDs of those currently connected.
+ * Scanning stops once @max_connectors IDs have been collected; later
+ * connectors are not examined.
+ *
+ * Returns: number of connector IDs written to @connectors, capped by
+ * @max_connectors.
+ */
+int igt_connector_get_connected(int drm_fd, uint32_t *connectors,
+				int max_connectors)
+{
+	drmModeRes *res;
+	drmModeConnector *conn;
+	int count = 0;
+	int i;
+
+	igt_assert(max_connectors >= 0);
+	if (max_connectors > 0)
+		igt_assert(connectors);
+
+	res = drmModeGetResources(drm_fd);
+	if (!res)
+		return 0;
+
+	for (i = 0; i < res->count_connectors && count < max_connectors; i++) {
+		conn = drmModeGetConnector(drm_fd, res->connectors[i]);
+		if (!conn)
+			continue;
+
+		if (conn->connection == DRM_MODE_CONNECTED)
+			connectors[count++] = conn->connector_id;
+
+		drmModeFreeConnector(conn);
+	}
+
+	drmModeFreeResources(res);
+	return count;
+}
+
+/**
+ * igt_connector_get_info:
+ * @drm_fd: DRM file descriptor
+ * @connector_id: connector ID
+ * @name: buffer for connector name (mandatory)
+ * @name_size: size of @name; must be > 0
+ * @serial: buffer for EDID-derived serial (mandatory)
+ * @serial_size: size of @serial; must be > 1
+ * @path: buffer for MST PATH property (optional, may be %NULL)
+ * @path_size: size of @path buffer
+ *
+ * Fills connector name, MST PATH and EDID-derived serial for a connector.
+ * @name is always filled when the connector is found and connected.
+ * @serial is filled by libdisplay-info from the EDID blob; left empty if no
+ * EDID is attached or the EDID has no serial information. @path is filled
+ * only if requested and the PATH property exists.
+ *
+ * Success means the connector object exists and is currently connected.
+ * @serial and @path are best-effort and may still be empty on success.
+ *
+ * Returns: %true if the connector was found and is connected, %false
+ * otherwise.
+ */
+bool igt_connector_get_info(int drm_fd, uint32_t connector_id,
+			    char *name, size_t name_size,
+			    char *serial, size_t serial_size,
+			    char *path, size_t path_size)
+{
+	drmModeConnector *conn;
+	drmModePropertyBlobPtr edid_blob = NULL;
+	drmModePropertyPtr prop;
+	uint64_t blob_id = 0;
+	int i;
+
+	igt_assert(name && name_size > 0);
+	igt_assert(serial && serial_size > 1);
+	igt_assert(!path || path_size > 0);
+
+	name[0] = '\0';
+	serial[0] = '\0';
+	if (path)
+		path[0] = '\0';
+
+	conn = drmModeGetConnector(drm_fd, connector_id);
+	if (!conn)
+		return false;
+
+	if (conn->connection != DRM_MODE_CONNECTED) {
+		drmModeFreeConnector(conn);
+		return false;
+	}
+
+	snprintf(name, name_size, "%s-%d",
+		 kmstest_connector_type_str(conn->connector_type),
+		 conn->connector_type_id);
+
+	for (i = 0; i < conn->count_props; i++) {
+		prop = drmModeGetProperty(drm_fd, conn->props[i]);
+		if (!prop)
+			continue;
+
+		if (strcmp(prop->name, "EDID") == 0)
+			blob_id = conn->prop_values[i];
+
+		drmModeFreeProperty(prop);
+		if (blob_id)
+			break;
+	}
+
+	if (path) {
+		drmModePropertyBlobPtr path_blob;
+
+		path_blob = kmstest_get_path_blob(drm_fd, connector_id);
+		if (path_blob) {
+			snprintf(path, path_size, "%s",
+				 (const char *)path_blob->data);
+			drmModeFreePropertyBlob(path_blob);
+		}
+	}
+
+	drmModeFreeConnector(conn);
+
+	if (blob_id) {
+		edid_blob = drmModeGetPropertyBlob(drm_fd, blob_id);
+		if (edid_blob) {
+			connector_serial_from_edid(edid_blob->data,
+						   edid_blob->length,
+						   serial, serial_size);
+			drmModeFreePropertyBlob(edid_blob);
+		}
+	}
+
+	return true;
+}
+
+/**
+ * igt_connector_find_by_path:
+ * @drm_fd: DRM file descriptor
+ * @path: MST PATH property value to match
+ * @connector_id: output for connector ID (filled on success)
+ *
+ * Finds the currently connected connector whose PATH property matches @path
+ * (exact string comparison). PATH is the preferred stable identity for MST
+ * connectors; connector IDs may change across hotplug events.
+ *
+ * Returns: %true if a matching connected connector was found.
+ */
+bool igt_connector_find_by_path(int drm_fd, const char *path,
+				uint32_t *connector_id)
+{
+	drmModeRes *res;
+	drmModeConnector *conn;
+	drmModePropertyBlobPtr path_blob;
+	bool found = false;
+	int i;
+
+	if (!path || !connector_id)
+		return false;
+
+	res = drmModeGetResources(drm_fd);
+	if (!res)
+		return false;
+
+	for (i = 0; i < res->count_connectors && !found; i++) {
+		conn = drmModeGetConnector(drm_fd, res->connectors[i]);
+		if (!conn)
+			continue;
+
+		if (conn->connection == DRM_MODE_CONNECTED) {
+			path_blob = kmstest_get_path_blob(drm_fd,
+							  conn->connector_id);
+			if (path_blob) {
+				const char *blob_str = path_blob->data;
+
+				/*
+				 * The kernel NUL-terminates the PATH blob,
+				 * but be defensive and bound the compare by
+				 * the blob length so a future kernel change
+				 * cannot drive us off the end of the buffer.
+				 */
+				if (path_blob->length > 0 &&
+				    strnlen(blob_str, path_blob->length) <
+				    path_blob->length &&
+				    strcmp(blob_str, path) == 0) {
+					*connector_id = conn->connector_id;
+					found = true;
+				}
+				drmModeFreePropertyBlob(path_blob);
+			}
+		}
+
+		drmModeFreeConnector(conn);
+	}
+
+	drmModeFreeResources(res);
+
+	if (found)
+		igt_debug("igt_connector: Found connector %u for path '%s'\n",
+			  *connector_id, path);
+
+	return found;
+}
+
+/**
+ * igt_connector_find_by_name:
+ * @drm_fd: DRM file descriptor
+ * @name: connector name to match (e.g. "DP-6")
+ * @connector_id: output for connector ID (filled on success)
+ *
+ * Name-based lookup helper. Prefer igt_connector_find_by_path() or
+ * igt_connector_find_by_serial() for MST connectors, since connector
+ * names and IDs may change across hotplug events.
+ *
+ * Returns: %true if a matching connected connector was found.
+ */
+bool igt_connector_find_by_name(int drm_fd, const char *name,
+				uint32_t *connector_id)
+{
+	drmModeRes *res;
+	drmModeConnector *conn;
+	char conn_name[IGT_CONNECTOR_NAME_MAX];
+	bool found = false;
+	int i;
+
+	if (!name || !connector_id)
+		return false;
+
+	res = drmModeGetResources(drm_fd);
+	if (!res)
+		return false;
+
+	for (i = 0; i < res->count_connectors && !found; i++) {
+		conn = drmModeGetConnector(drm_fd, res->connectors[i]);
+		if (!conn)
+			continue;
+
+		snprintf(conn_name, sizeof(conn_name), "%s-%d",
+			 kmstest_connector_type_str(conn->connector_type),
+			 conn->connector_type_id);
+
+		if (strcmp(conn_name, name) == 0 &&
+		    conn->connection == DRM_MODE_CONNECTED) {
+			*connector_id = conn->connector_id;
+			found = true;
+		}
+
+		drmModeFreeConnector(conn);
+	}
+
+	drmModeFreeResources(res);
+
+	if (found)
+		igt_debug("igt_connector: Found connector %u for name '%s'\n",
+			  *connector_id, name);
+
+	return found;
+}
+
+/**
+ * igt_connector_find_by_serial:
+ * @drm_fd: DRM file descriptor
+ * @serial: EDID-derived serial string to match
+ * @connector_id: output for connector ID (filled on success)
+ *
+ * Finds a currently connected connector whose EDID serial matches @serial.
+ * EDID serial is the most stable identifier for a physical display and
+ * survives hotplug / suspend-resume connector re-enumeration.
+ *
+ * Returns: %true if a matching connected connector was found.
+ */
+bool igt_connector_find_by_serial(int drm_fd, const char *serial,
+				  uint32_t *connector_id)
+{
+	uint32_t connectors[IGT_CONNECTOR_MAX_PROBE];
+	char name[IGT_CONNECTOR_NAME_MAX];
+	char found_serial[IGT_CONNECTOR_SERIAL_MAX];
+	int n, i;
+
+	if (!serial || !serial[0] || !connector_id)
+		return false;
+
+	n = igt_connector_get_connected(drm_fd, connectors,
+					IGT_CONNECTOR_MAX_PROBE);
+	for (i = 0; i < n; i++) {
+		if (!igt_connector_get_info(drm_fd, connectors[i],
+					    name, sizeof(name),
+					    found_serial, sizeof(found_serial),
+					    NULL, 0))
+			continue;
+
+		if (found_serial[0] && strcmp(found_serial, serial) == 0) {
+			*connector_id = connectors[i];
+			igt_debug("igt_connector: Found connector %u (%s) for serial '%s'\n",
+				  *connector_id, name, serial);
+			return true;
+		}
+	}
+	return false;
+}
+
+/**
+ * igt_connector_reprobe_all:
+ * @drm_fd: DRM file descriptor
+ *
+ * Issues a GETCONNECTOR ioctl for every connector, asking the kernel for
+ * fresh state. This refreshes the cached connection status and MST topology
+ * visibility from the kernel's perspective, but does not synthesise a
+ * hot-plug event nor guarantee a full hardware reprobe across all driver
+ * paths.
+ */
+void igt_connector_reprobe_all(int drm_fd)
+{
+	drmModeRes *res;
+	drmModeConnector *conn;
+	int i;
+
+	res = drmModeGetResources(drm_fd);
+	if (!res)
+		return;
+
+	for (i = 0; i < res->count_connectors; i++) {
+		conn = drmModeGetConnector(drm_fd, res->connectors[i]);
+		if (conn)
+			drmModeFreeConnector(conn);
+	}
+
+	drmModeFreeResources(res);
+}
+
+/**
+ * igt_connector_find_lowest_clock_mode:
+ * @output: Connected output to inspect.
+ * @out: Filled with the chosen mode on success.
+ *
+ * Picks the mode with the smallest pixel clock from @output's current
+ * connector mode list. Useful for testing fallback paths that need a
+ * mode that consumes minimal bandwidth.
+ *
+ * Returns: true on success, false if the connector has no modes.
+ */
+bool igt_connector_find_lowest_clock_mode(igt_output_t *output,
+					  drmModeModeInfo *out)
+{
+	drmModeConnector *c = output->config.connector;
+	int i, best = -1;
+
+	for (i = 0; i < c->count_modes; i++) {
+		if (best < 0 || c->modes[i].clock < c->modes[best].clock)
+			best = i;
+	}
+	if (best < 0)
+		return false;
+
+	*out = c->modes[best];
+	return true;
+}
+
+/**
+ * igt_connector_find_highest_clock_mode_in:
+ * @conn: Freshly probed connector to inspect.
+ * @out: Filled with the chosen mode on success.
+ *
+ * Picks the mode with the largest pixel clock from @conn's mode list.
+ * Operates on a freshly fetched #drmModeConnector rather than an
+ * #igt_output_t so callers can use it after #drmModeGetConnector to
+ * inspect a kernel-filtered list (e.g. after writing a bandwidth cap).
+ *
+ * Returns: true on success, false if @conn has no modes.
+ */
+bool igt_connector_find_highest_clock_mode_in(const drmModeConnector *conn,
+					      drmModeModeInfo *out)
+{
+	int i, best = -1;
+
+	for (i = 0; i < conn->count_modes; i++) {
+		if (best < 0 || conn->modes[i].clock > conn->modes[best].clock)
+			best = i;
+	}
+	if (best < 0)
+		return false;
+
+	*out = conn->modes[best];
+	return true;
+}
+
+/**
+ * igt_connector_find_preferred_mode:
+ * @output: Connected output to inspect.
+ * @out: Filled with the chosen mode on success.
+ *
+ * Picks the first mode flagged %DRM_MODE_TYPE_PREFERRED on @output. Falls
+ * back to the first mode in the list when no preferred mode is present.
+ * Unlike #kmstest_get_connector_default_mode this performs no environment
+ * variable overrides, giving deterministic behaviour for tests that need
+ * to reason about which mode they will pick.
+ *
+ * Returns: true on success, false if the connector has no modes.
+ */
+bool igt_connector_find_preferred_mode(igt_output_t *output,
+				       drmModeModeInfo *out)
+{
+	drmModeConnector *c = output->config.connector;
+	int i;
+
+	for (i = 0; i < c->count_modes; i++) {
+		if (c->modes[i].type & DRM_MODE_TYPE_PREFERRED) {
+			*out = c->modes[i];
+			return true;
+		}
+	}
+	if (c->count_modes > 0) {
+		*out = c->modes[0];
+		return true;
+	}
+	return false;
+}
+
+/**
+ * igt_connector_mode_in_list:
+ * @conn: Connector whose mode list to search.
+ * @mode: Mode to look up.
+ *
+ * Returns true if a mode matching @mode in pixel clock and active region
+ * (hdisplay, vdisplay) is present in @conn's current mode list. Useful
+ * for verifying whether a previously cached mode survives a kernel-side
+ * mode filter (e.g. after writing a bandwidth cap).
+ */
+bool igt_connector_mode_in_list(const drmModeConnector *conn,
+				const drmModeModeInfo *mode)
+{
+	int i;
+
+	for (i = 0; i < conn->count_modes; i++) {
+		if (conn->modes[i].clock == mode->clock &&
+		    conn->modes[i].hdisplay == mode->hdisplay &&
+		    conn->modes[i].vdisplay == mode->vdisplay)
+			return true;
+	}
+	return false;
+}
+
+/**
+ * igt_connector_find_output_by_id:
+ * @display: Initialised display containing the outputs to search.
+ * @connector_id: DRM connector ID to look for.
+ *
+ * Walks the connected outputs of @display and returns the one whose DRM
+ * connector ID matches @connector_id, or %NULL if no such output exists.
+ *
+ * Returns: matching #igt_output_t pointer or %NULL.
+ */
+igt_output_t *igt_connector_find_output_by_id(igt_display_t *display,
+					      uint32_t connector_id)
+{
+	igt_output_t *output;
+
+	for_each_connected_output(display, output) {
+		if (output->config.connector->connector_id == connector_id)
+			return output;
+	}
+
+	return NULL;
+}
diff --git a/lib/igt_connector_helper.h b/lib/igt_connector_helper.h
new file mode 100644
index 000000000..3e2ef7e35
--- /dev/null
+++ b/lib/igt_connector_helper.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef IGT_CONNECTOR_HELPER_H
+#define IGT_CONNECTOR_HELPER_H
+
+#include <stdbool.h>
+#include <stddef.h>
+#include <stdint.h>
+
+#include <xf86drmMode.h>
+
+#include "igt_kms.h"
+
+#define IGT_CONNECTOR_NAME_MAX		64
+#define IGT_CONNECTOR_SERIAL_MAX	64
+
+int igt_connector_get_connected(int drm_fd, uint32_t *connectors,
+				int max_connectors);
+bool igt_connector_get_info(int drm_fd, uint32_t connector_id,
+			    char *name, size_t name_size,
+			    char *serial, size_t serial_size,
+			    char *path, size_t path_size);
+bool igt_connector_find_by_path(int drm_fd, const char *path,
+				uint32_t *connector_id);
+bool igt_connector_find_by_name(int drm_fd, const char *name,
+				uint32_t *connector_id);
+bool igt_connector_find_by_serial(int drm_fd, const char *serial,
+				  uint32_t *connector_id);
+void igt_connector_reprobe_all(int drm_fd);
+
+bool igt_connector_find_lowest_clock_mode(igt_output_t *output,
+					  drmModeModeInfo *out);
+bool igt_connector_find_highest_clock_mode_in(const drmModeConnector *conn,
+					      drmModeModeInfo *out);
+bool igt_connector_find_preferred_mode(igt_output_t *output,
+				       drmModeModeInfo *out);
+bool igt_connector_mode_in_list(const drmModeConnector *conn,
+				const drmModeModeInfo *mode);
+igt_output_t *igt_connector_find_output_by_id(igt_display_t *display,
+					      uint32_t connector_id);
+
+#endif /* IGT_CONNECTOR_HELPER_H */
diff --git a/lib/meson.build b/lib/meson.build
index a82aa27dc..46d007eef 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -156,6 +156,11 @@ lib_deps = [
 
 inc = [ inc, include_directories('vendor') ]
 
+if libdisplay_info.found()
+	lib_deps += libdisplay_info
+	lib_sources += 'igt_connector_helper.c'
+endif
+
 if libdrm_nouveau.found()
 	lib_deps += libdrm_nouveau
 	lib_sources += [
diff --git a/meson.build b/meson.build
index 79051be21..0e06139b2 100644
--- a/meson.build
+++ b/meson.build
@@ -166,6 +166,9 @@ libpci = dependency('libpci', required : true)
 libudev = dependency('libudev', required : true)
 glib = dependency('glib-2.0', required : true)
 
+libdisplay_info = dependency('libdisplay-info', required : false)
+build_info += 'libdisplay-info: @0@'.format(libdisplay_info.found())
+
 xmlrpc = dependency('xmlrpc', required : false)
 xmlrpc_util = dependency('xmlrpc_util', required : false)
 xmlrpc_client = dependency('xmlrpc_client', required : false)
-- 
2.25.1

