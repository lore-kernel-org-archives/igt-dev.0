Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC834FF886F
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 04:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A189D10E2C4;
	Tue, 28 Apr 2026 04:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fnmXclpl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6505B10E29C
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 04:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777351654; x=1808887654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=st8K8oZWZ0DlGDiD4BMKxdzbl7kK7bGDqQdAVQ4rft4=;
 b=fnmXclpl65ahOOwduoOgAL/vLxa5P3fHccvB7V3jOdXdseBuf14NnprO
 fyTTC5b+iGyCdFnjtPtvngjI0KuITFqpilVA8JeAmJ2E45D+zRcrJyfzf
 GkkCwRo/sUfoJhVsa3n2JaXjEAc0R6wJRwgcx/eQVKU6gkU/qN4A2scGD
 d2N23sxpB2Krxcm4gGjHqsR3DxFKbKmwviPYw4pElDyS7kG+9WoqEPxYY
 suEtYTSqlk+vCNSBjOQ9YL03wiPoeFqTSa9oV8g0Se6eAIyIPO1D87f9x
 aIjY0ZHhAspIyykar/VuaPxSUqeHwGXgkhqgOe0jtQEGocgSLPN5MpPFI Q==;
X-CSE-ConnectionGUID: GQp8JrxpRciNpLBfiQzywg==
X-CSE-MsgGUID: g9+CZFxzTUu4fg35x4Bb9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78167859"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78167859"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:34 -0700
X-CSE-ConnectionGUID: RDEcxvmYSlCL41za9KREpw==
X-CSE-MsgGUID: EOpD8cyWSKuHLCQHXNBYtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="233706765"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:32 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v1 20/25] lib/chamelium/v3: Add extended API for
 Chamelium v3 HPD, EDID, Frames, Color & Audio
Date: Tue, 28 Apr 2026 10:16:29 +0530
Message-ID: <20260428044644.257001-21-mohammed.bilal@intel.com>
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

This commit adds the extended Chamelium v3 wrapper API functions needed
for HPD, EDID management, frame capture, color verification, and audio
testing with the Chamelium v3 hardware.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 lib/chamelium/v3/igt_chamelium.c | 962 ++++++++++++++++++++++++++++++-
 lib/chamelium/v3/igt_chamelium.h | 195 +++++++
 2 files changed, 1155 insertions(+), 2 deletions(-)

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
index 8fad88e74..4d4eef1f7 100644
--- a/lib/chamelium/v3/igt_chamelium.c
+++ b/lib/chamelium/v3/igt_chamelium.c
@@ -1,10 +1,16 @@
 // SPDX-License-Identifier: MIT
 
+#include <string.h>
+#include <time.h>
+#include <unistd.h>
+#include <xf86drm.h>
+#include <xf86drmMode.h>
 #include <xmlrpc-c/base.h>
 #include <xmlrpc-c/client.h>
 
 #include "igt_chamelium.h"
 #include "igt_core.h"
+#include "igt_kms.h"
 #include "igt_rc.h"
 
 #define CHAMELIUM_CONFIG_SECTION "Chameliumv3"
@@ -70,13 +76,21 @@ struct igt_chamelium_v3 *chamelium_v3_init(char *url)
 	memset(&clientparms, 0, sizeof(clientparms));
 	memset(&curlparms, 0, sizeof(curlparms));
 
-	/* curl's timeout is in milliseconds */
-	curlparms.timeout = 10 * 1000;
+	/* curl's timeout is in milliseconds - 60s for large frame transfers */
+	curlparms.timeout = 60 * 1000;
 
 	clientparms.transport = "curl";
 	clientparms.transportparmsP = &curlparms;
 	clientparms.transportparm_size = XMLRPC_CXPSIZE(timeout);
 
+	/*
+	 * Increase the XML-RPC response size limit to 128MB to handle
+	 * DumpPixels responses for high-resolution frames (e.g. 4K/8K).
+	 * A 3840x2160 RGB frame is ~24MB raw, ~33MB base64 encoded.
+	 * The default xmlrpc-c limit is 15MB which is too small.
+	 */
+	xmlrpc_limit_set(XMLRPC_XML_SIZE_LIMIT_ID, 128 * 1024 * 1024);
+
 	/* Setup the libxmlrpc context */
 	xmlrpc_env_init(&chamelium->env);
 	xmlrpc_client_setup_global_const(&chamelium->env);
@@ -182,6 +196,44 @@ static xmlrpc_value *__chamelium_rpc(struct igt_chamelium_v3 *chamelium,
 	return res;
 }
 
+/**
+ * __chamelium_rpc_try - Call a remote function, returning NULL on failure
+ *
+ * Unlike __chamelium_rpc, this does NOT assert on RPC failure.
+ * Used for polling functions like GetVideoParams where transient
+ * failures (e.g. "Link has been severed") are expected during
+ * video stabilization.
+ *
+ * Returns a xmlrpc_value on success, or NULL on failure.
+ */
+static xmlrpc_value *__chamelium_rpc_try(struct igt_chamelium_v3 *chamelium,
+					 const char *method_name,
+					 const char *format_str,
+					 ...)
+{
+	xmlrpc_value *res;
+	va_list va_args;
+
+	if (chamelium->env.fault_occurred) {
+		xmlrpc_env_clean(&chamelium->env);
+		xmlrpc_env_init(&chamelium->env);
+	}
+	va_start(va_args, format_str);
+	xmlrpc_client_call2f_va(&chamelium->env, chamelium->client,
+				chamelium->url, method_name, format_str, &res,
+				va_args);
+	va_end(va_args);
+
+	if (chamelium->env.fault_occurred) {
+		igt_debug("Chamelium RPC call[%s] failed (non-fatal): %s\n",
+			  method_name, chamelium->env.fault_string);
+		xmlrpc_env_clean(&chamelium->env);
+		xmlrpc_env_init(&chamelium->env);
+		return NULL;
+	}
+	return res;
+}
+
 /*
  * For the RPC calls, please refer to the python code [1] for documentation.
  *
@@ -307,3 +359,909 @@ char *chamelium_v3_get_port_name(struct igt_chamelium_v3 *chamelium,
 
 	return port_name;
 }
+
+/**
+ * chamelium_v3_reset - Reset the Chamelium device
+ *
+ * @chamelium: Chamelium to reset
+ *
+ * Resets all ports to their default state (unplugged).
+ */
+void chamelium_v3_reset(struct igt_chamelium_v3 *chamelium)
+{
+	xmlrpc_value *res;
+
+	igt_debug("RPC Reset()\n");
+	res = __chamelium_rpc(chamelium, "Reset", "()");
+	xmlrpc_DECREF(res);
+}
+
+/**
+ * chamelium_v3_apply_edid - Apply an EDID to a port
+ *
+ * @chamelium: Chamelium to apply EDID on
+ * @port_id: Port to apply EDID to
+ * @edid_id: EDID ID to apply (0 for default)
+ *
+ * Chamelium V3 requires EDID to be applied before plugging a port.
+ */
+void chamelium_v3_apply_edid(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id,
+			     int edid_id)
+{
+	xmlrpc_value *res;
+
+	igt_debug("RPC ApplyEdid(%d, %d)\n", port_id, edid_id);
+	res = __chamelium_rpc(chamelium, "ApplyEdid", "(ii)", port_id, edid_id);
+	xmlrpc_DECREF(res);
+}
+
+/**
+ * chamelium_v3_plug - Plug a port on the Chamelium
+ *
+ * @chamelium: Chamelium to plug port on
+ * @port_id: Port to plug
+ *
+ * Note: Chamelium V3 requires ApplyEdid to be called before Plug.
+ */
+void chamelium_v3_plug(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id)
+{
+	xmlrpc_value *res;
+
+	igt_debug("RPC Plug(%d)\n", port_id);
+	res = __chamelium_rpc(chamelium, "Plug", "(i)", port_id);
+	xmlrpc_DECREF(res);
+}
+
+/**
+ * chamelium_v3_unplug - Unplug a port on the Chamelium
+ *
+ * @chamelium: Chamelium to unplug port on
+ * @port_id: Port to unplug
+ */
+void chamelium_v3_unplug(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id)
+{
+	xmlrpc_value *res;
+
+	igt_debug("RPC Unplug(%d)\n", port_id);
+	res = __chamelium_rpc(chamelium, "Unplug", "(i)", port_id);
+	xmlrpc_DECREF(res);
+}
+
+/**
+ * chamelium_v3_is_plugged - Check if a port is plugged
+ *
+ * @chamelium: Chamelium to check
+ * @port_id: Port to check
+ *
+ * Returns true if the port is plugged.
+ */
+bool chamelium_v3_is_plugged(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id)
+{
+	xmlrpc_value *res;
+	xmlrpc_bool is_plugged;
+
+	igt_debug("RPC IsPlugged(%d)\n", port_id);
+	res = __chamelium_rpc(chamelium, "IsPlugged", "(i)", port_id);
+
+	xmlrpc_read_bool(&chamelium->env, res, &is_plugged);
+	xmlrpc_DECREF(res);
+
+	return is_plugged;
+}
+
+/**
+ * chamelium_v3_plug_with_children - Plug an MST port with its children
+ *
+ * @chamelium: Chamelium to plug port on
+ * @port_id: Parent MST port to plug
+ * @children_ids: Array of children port IDs to plug with the parent
+ * @children_count: Number of children ports
+ *
+ * For MST, the parent port (e.g. FPGA_DP2) controls the HPD line.
+ * This function plugs the parent along with the specified children.
+ * Using this with an empty children list is equivalent to Plug().
+ */
+void chamelium_v3_plug_with_children(struct igt_chamelium_v3 *chamelium,
+				    chamelium_v3_port_id port_id,
+				    chamelium_v3_port_id *children_ids,
+				    int children_count)
+{
+	xmlrpc_value *res;
+	xmlrpc_value *children_array;
+	xmlrpc_value *child_val;
+	int i;
+
+	igt_debug("RPC PlugWithChildren(%d, [%d children])\n", port_id, children_count);
+
+	/* Build the children array */
+	children_array = xmlrpc_array_new(&chamelium->env);
+	for (i = 0; i < children_count; i++) {
+		child_val = xmlrpc_int_new(&chamelium->env, children_ids[i]);
+		xmlrpc_array_append_item(&chamelium->env, children_array, child_val);
+		xmlrpc_DECREF(child_val);
+	}
+
+	res = __chamelium_rpc(chamelium, "PlugWithChildren", "(iA)",
+			     port_id, children_array);
+	xmlrpc_DECREF(children_array);
+	xmlrpc_DECREF(res);
+}
+
+/**
+ * chamelium_v3_is_conflict - Check if two ports conflict (can't be plugged simultaneously)
+ *
+ * @chamelium: Chamelium to check
+ * @port_id_a: First port ID
+ * @port_id_b: Second port ID
+ *
+ * Some ports on Chamelium V3 are mutually exclusive (e.g. ITE HDMI1 and ITE HDMI2).
+ * If port A is plugged and conflicts with port B, plugging B will raise an exception.
+ * Port A must be explicitly unplugged first.
+ *
+ * Returns true if the two ports conflict.
+ */
+bool chamelium_v3_is_conflict(struct igt_chamelium_v3 *chamelium,
+			    chamelium_v3_port_id port_id_a,
+			    chamelium_v3_port_id port_id_b)
+{
+	xmlrpc_value *res;
+	xmlrpc_bool conflict;
+
+	igt_debug("RPC IsConflict(%d, %d)\n", port_id_a, port_id_b);
+	res = __chamelium_rpc(chamelium, "IsConflict", "(ii)", port_id_a, port_id_b);
+
+	xmlrpc_read_bool(&chamelium->env, res, &conflict);
+	xmlrpc_DECREF(res);
+
+	return conflict;
+}
+
+/**
+ * chamelium_v3_get_mutually_exclusive_ports - Get all ports that conflict with a given port
+ *
+ * @chamelium: Chamelium to check
+ * @port_id: Port to check conflicts for
+ * @port_ids: Out pointer for the list of conflicting port IDs
+ *
+ * Returns the number of conflicting ports stored in @port_ids.
+ * The caller must free this pointer.
+ */
+int chamelium_v3_get_mutually_exclusive_ports(struct igt_chamelium_v3 *chamelium,
+					     chamelium_v3_port_id port_id,
+					     chamelium_v3_port_id **port_ids)
+{
+	xmlrpc_value *res, *res_port;
+	int port_count, i;
+
+	igt_assert(port_ids);
+
+	igt_debug("RPC GetMutuallyExclusivePorts(%d)\n", port_id);
+	res = __chamelium_rpc(chamelium, "GetMutuallyExclusivePorts", "(i)", port_id);
+
+	port_count = xmlrpc_array_size(&chamelium->env, res);
+	*port_ids = calloc(port_count, sizeof(**port_ids));
+
+	for (i = 0; i < port_count; i++) {
+		xmlrpc_array_read_item(&chamelium->env, res, i, &res_port);
+		xmlrpc_read_int(&chamelium->env, res_port, (int *)&(*port_ids)[i]);
+		xmlrpc_DECREF(res_port);
+	}
+	xmlrpc_DECREF(res);
+
+	return port_count;
+}
+
+/**
+ * chamelium_v3_get_connector_type - Get the connector type string for a port
+ *
+ * @chamelium: Chamelium to check
+ * @port_id: Port to get the connector type for
+ *
+ * Returns a string with the connector type (e.g. "DP", "HDMI").
+ * The caller must free this pointer.
+ */
+char *chamelium_v3_get_connector_type(struct igt_chamelium_v3 *chamelium,
+				     chamelium_v3_port_id port_id)
+{
+	xmlrpc_value *res;
+	char *connector_type;
+
+	igt_debug("RPC GetConnectorType(%d)\n", port_id);
+	res = __chamelium_rpc(chamelium, "GetConnectorType", "(i)", port_id);
+
+	xmlrpc_read_string(&chamelium->env, res, (const char **)&connector_type);
+	xmlrpc_DECREF(res);
+
+	return connector_type;
+}
+
+/**
+ * chamelium_v3_get_port_type - Get the type of a port (DP, HDMI, etc.)
+ *
+ * @chamelium: Chamelium to check
+ * @port_id: Port to check
+ *
+ * Returns string containing port type. Caller must free.
+ */
+char *chamelium_v3_get_port_type(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id)
+{
+	char *name = chamelium_v3_get_port_name(chamelium, port_id);
+	char *type;
+
+	if (strstr(name, "DP") != NULL)
+		type = strdup("DP");
+	else if (strstr(name, "HDMI") != NULL)
+		type = strdup("HDMI");
+	else if (strstr(name, "VGA") != NULL)
+		type = strdup("VGA");
+	else
+		type = strdup("Unknown");
+
+	free(name);
+	return type;
+}
+
+/**
+ * chamelium_v3_port_is_dp - Check if a port is a DisplayPort
+ *
+ * @chamelium: Chamelium to check
+ * @port_id: Port to check
+ *
+ * Returns true if the port is a DP port.
+ */
+bool chamelium_v3_port_is_dp(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id)
+{
+	char *name = chamelium_v3_get_port_name(chamelium, port_id);
+	bool is_dp = (strstr(name, "DP") != NULL);
+	free(name);
+	return is_dp;
+}
+
+/**
+ * chamelium_v3_port_is_hdmi - Check if a port is HDMI
+ *
+ * @chamelium: Chamelium to check
+ * @port_id: Port to check
+ *
+ * Returns true if the port is an HDMI port.
+ */
+bool chamelium_v3_port_is_hdmi(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id)
+{
+	char *name = chamelium_v3_get_port_name(chamelium, port_id);
+	bool is_hdmi = (strstr(name, "HDMI") != NULL);
+	free(name);
+	return is_hdmi;
+}
+
+/**
+ * chamelium_v3_fire_hpd_pulse - Fire HPD pulses on a port
+ *
+ * @chamelium: Chamelium to fire pulses on
+ * @port_id: Port to fire pulses on
+ * @deassert_interval_usec: Time in microseconds for deasserted (unplugged) state
+ * @assert_interval_usec: Time in microseconds for asserted (plugged) state
+ * @repeat_count: Number of pulse cycles
+ * @end_level: Final HPD level (0 = deasserted/unplugged, 1 = asserted/plugged)
+ *
+ * Generates rapid HPD pulses for testing HPD storm detection and
+ * signal integrity.
+ */
+void chamelium_v3_fire_hpd_pulse(struct igt_chamelium_v3 *chamelium,
+				 chamelium_v3_port_id port_id,
+				 int deassert_interval_usec,
+				 int assert_interval_usec,
+				 int repeat_count,
+				 int end_level)
+{
+	xmlrpc_value *res;
+
+	igt_debug("RPC FireHpdPulse(%d, %d, %d, %d, %d)\n",
+		  port_id, deassert_interval_usec, assert_interval_usec,
+		  repeat_count, end_level);
+	res = __chamelium_rpc(chamelium, "FireHpdPulse", "(iiiii)",
+			     port_id, deassert_interval_usec,
+			     assert_interval_usec, repeat_count, end_level);
+	xmlrpc_DECREF(res);
+}
+
+/**
+ * chamelium_v3_create_edid - Upload a custom EDID to the Chamelium
+ *
+ * @chamelium: Chamelium to upload EDID to
+ * @edid_data: Raw EDID binary data
+ * @edid_size: Size of the EDID data in bytes
+ *
+ * Uploads raw EDID binary data to the Chamelium V3 device. The returned
+ * EDID ID can be used with chamelium_v3_apply_edid() to set the EDID
+ * on a specific port before plugging.
+ *
+ * Returns the EDID ID assigned by the Chamelium.
+ */
+int chamelium_v3_create_edid(struct igt_chamelium_v3 *chamelium,
+			     const unsigned char *edid_data,
+			     size_t edid_size)
+{
+	xmlrpc_value *res;
+	int edid_id;
+
+	igt_debug("RPC CreateEdid(%zu bytes)\n", edid_size);
+	res = __chamelium_rpc(chamelium, "CreateEdid", "(6)",
+			     edid_data, edid_size);
+
+	xmlrpc_read_int(&chamelium->env, res, &edid_id);
+	xmlrpc_DECREF(res);
+
+	return edid_id;
+}
+
+/**
+ * chamelium_v3_read_port_mappings - Read port mappings from .igtrc config
+ *
+ * Reads [Chamelium:<connector-name>] sections from the IGT config file
+ * and matches each connector name to a real DRM connector on the system.
+ * This is how V2 maps Chamelium ports to DRM connectors.
+ *
+ * @drm_fd: Open DRM file descriptor
+ * @ports: Output array of mapped ports (caller must free)
+ * @count: Output number of mapped ports
+ *
+ * Returns true on success, false if no mappings found or error.
+ */
+bool chamelium_v3_read_port_mappings(int drm_fd,
+				     struct chamelium_v3_drm_port **ports,
+				     int *count)
+{
+	GError *error = NULL;
+	char **group_list;
+	drmModeRes *res;
+	int mapping_count = 0;
+	int port_i = 0;
+	int i, j;
+
+	*ports = NULL;
+	*count = 0;
+
+	if (!igt_key_file) {
+		igt_debug("No config file for port mappings\n");
+		return false;
+	}
+
+	res = drmModeGetResources(drm_fd);
+	if (!res) {
+		igt_debug("Cannot get DRM resources\n");
+		return false;
+	}
+
+	group_list = g_key_file_get_groups(igt_key_file, NULL);
+
+	/* Count [Chamelium:*] sections */
+	for (i = 0; group_list[i] != NULL; i++) {
+		if (strstr(group_list[i], "Chamelium:"))
+			mapping_count++;
+	}
+
+	if (mapping_count == 0) {
+		igt_debug("No [Chamelium:<connector>] sections in config\n");
+		g_strfreev(group_list);
+		drmModeFreeResources(res);
+		return false;
+	}
+
+	*ports = calloc(mapping_count, sizeof(struct chamelium_v3_drm_port));
+	igt_assert(*ports);
+
+	for (i = 0; group_list[i] != NULL; i++) {
+		char *group = group_list[i];
+		char *map_name;
+		int chamelium_port_id;
+
+		if (!strstr(group, "Chamelium:"))
+			continue;
+
+		/* Extract connector name after "Chamelium:" */
+		map_name = group + strlen("Chamelium:");
+
+		chamelium_port_id = g_key_file_get_integer(igt_key_file, group,
+							   "ChameliumPortID",
+							   &error);
+		if (error) {
+			igt_debug("Failed to read ChameliumPortID for %s: %s\n",
+				  map_name, error->message);
+			g_error_free(error);
+			error = NULL;
+			continue;
+		}
+
+		/* Find the DRM connector matching this name */
+		for (j = 0; j < res->count_connectors; j++) {
+			drmModeConnector *conn;
+			char name[64];
+
+			conn = drmModeGetConnectorCurrent(drm_fd, res->connectors[j]);
+			if (!conn)
+				continue;
+
+			snprintf(name, sizeof(name), "%s-%u",
+				 kmstest_connector_type_str(conn->connector_type),
+				 conn->connector_type_id);
+
+			if (strcmp(name, map_name) == 0) {
+				struct chamelium_v3_drm_port *p = &(*ports)[port_i];
+
+				p->port_id = chamelium_port_id;
+				p->connector_id = conn->connector_id;
+				p->connector_type = conn->connector_type;
+				snprintf(p->connector_name, sizeof(p->connector_name),
+					 "%s", name);
+				port_i++;
+
+				igt_info("Mapped Chamelium port %d -> DRM %s (connector_id=%u)\n",
+					 chamelium_port_id, name, conn->connector_id);
+
+				drmModeFreeConnector(conn);
+				break;
+			}
+
+			drmModeFreeConnector(conn);
+		}
+	}
+
+	*count = port_i;
+	g_strfreev(group_list);
+	drmModeFreeResources(res);
+
+	if (port_i == 0) {
+		free(*ports);
+		*ports = NULL;
+		igt_warn("No connectors matched the Chamelium port mappings\n");
+		return false;
+	}
+
+	return true;
+}
+
+/**
+ * chamelium_v3_reprobe_connector - Force-reprobe a DRM connector
+ *
+ * Uses drmModeGetConnector() which triggers a kernel reprobe of the
+ * actual hardware state. This is how we verify whether a connector
+ * is truly connected or disconnected.
+ *
+ * @drm_fd: Open DRM file descriptor
+ * @connector_id: DRM connector ID to reprobe
+ *
+ * Returns the actual connection status.
+ */
+drmModeConnection chamelium_v3_reprobe_connector(int drm_fd,
+						 uint32_t connector_id)
+{
+	drmModeConnector *conn;
+	drmModeConnection status;
+
+	conn = drmModeGetConnector(drm_fd, connector_id);
+	if (!conn)
+		return DRM_MODE_UNKNOWNCONNECTION;
+
+	status = conn->connection;
+	drmModeFreeConnector(conn);
+
+	return status;
+}
+
+/**
+ * chamelium_v3_wait_for_conn_status_change - Poll connector until expected status
+ *
+ * Mirrors V2 chamelium_wait_for_conn_status_change. Polls the real DRM
+ * connector using drmModeGetConnector() (which triggers kernel reprobe)
+ * with 50ms intervals until the status matches or timeout.
+ *
+ * @drm_fd: Open DRM file descriptor
+ * @connector_id: DRM connector ID
+ * @expected: Expected connection status
+ * @timeout_secs: Max seconds to wait
+ *
+ * Returns true if the expected status was reached.
+ */
+bool chamelium_v3_wait_for_conn_status_change(int drm_fd,
+					      uint32_t connector_id,
+					      drmModeConnection expected,
+					      int timeout_secs)
+{
+	struct timespec start, now;
+
+	clock_gettime(CLOCK_MONOTONIC, &start);
+
+	while (1) {
+		if (chamelium_v3_reprobe_connector(drm_fd, connector_id) == expected)
+			return true;
+
+		clock_gettime(CLOCK_MONOTONIC, &now);
+		if (now.tv_sec - start.tv_sec >= timeout_secs)
+			break;
+
+		usleep(50000); /* 50ms poll, same as V2 */
+	}
+
+	return false;
+}
+
+/**
+ * chamelium_v3_get_video_params - Get video timing parameters from port
+ *
+ * Calls the GetVideoParams RPC to retrieve current video timing info.
+ * Uses non-asserting RPC to allow callers (e.g. polling/wait functions)
+ * to handle transient failures gracefully.
+ *
+ * @chamelium: Chamelium instance
+ * @port_id: Port ID to query
+ * @params: Output video parameters structure
+ *
+ * Returns true on success, false on RPC failure (e.g. link not ready).
+ */
+bool chamelium_v3_get_video_params(struct igt_chamelium_v3 *chamelium,
+				   chamelium_v3_port_id port_id,
+				   struct chamelium_v3_video_params *params)
+{
+	xmlrpc_value *res;
+	xmlrpc_value *val;
+
+	igt_assert(params);
+	memset(params, 0, sizeof(*params));
+
+	igt_debug("RPC GetVideoParams(%d)\n", port_id);
+	res = __chamelium_rpc_try(chamelium, "GetVideoParams", "(i)", port_id);
+	if (!res)
+		return false;
+
+	/* Parse the returned struct/dict */
+	xmlrpc_struct_find_value(&chamelium->env, res, "hactive", &val);
+	if (val) { xmlrpc_read_int(&chamelium->env, val, &params->hactive); xmlrpc_DECREF(val); }
+
+	xmlrpc_struct_find_value(&chamelium->env, res, "vactive", &val);
+	if (val) { xmlrpc_read_int(&chamelium->env, val, &params->vactive); xmlrpc_DECREF(val); }
+
+	xmlrpc_struct_find_value(&chamelium->env, res, "htotal", &val);
+	if (val) { xmlrpc_read_int(&chamelium->env, val, &params->htotal); xmlrpc_DECREF(val); }
+
+	xmlrpc_struct_find_value(&chamelium->env, res, "vtotal", &val);
+	if (val) { xmlrpc_read_int(&chamelium->env, val, &params->vtotal); xmlrpc_DECREF(val); }
+
+	xmlrpc_struct_find_value(&chamelium->env, res, "hsync_width", &val);
+	if (val) { xmlrpc_read_int(&chamelium->env, val, &params->hsync_width); xmlrpc_DECREF(val); }
+
+	xmlrpc_struct_find_value(&chamelium->env, res, "vsync_width", &val);
+	if (val) { xmlrpc_read_int(&chamelium->env, val, &params->vsync_width); xmlrpc_DECREF(val); }
+
+	xmlrpc_struct_find_value(&chamelium->env, res, "hfront_porch", &val);
+	if (val) { xmlrpc_read_int(&chamelium->env, val, &params->hfront_porch); xmlrpc_DECREF(val); }
+
+	xmlrpc_struct_find_value(&chamelium->env, res, "vfront_porch", &val);
+	if (val) { xmlrpc_read_int(&chamelium->env, val, &params->vfront_porch); xmlrpc_DECREF(val); }
+
+	xmlrpc_struct_find_value(&chamelium->env, res, "hback_porch", &val);
+	if (val) { xmlrpc_read_int(&chamelium->env, val, &params->hback_porch); xmlrpc_DECREF(val); }
+
+	xmlrpc_struct_find_value(&chamelium->env, res, "vback_porch", &val);
+	if (val) { xmlrpc_read_int(&chamelium->env, val, &params->vback_porch); xmlrpc_DECREF(val); }
+
+	xmlrpc_struct_find_value(&chamelium->env, res, "bpc", &val);
+	if (val) { xmlrpc_read_int(&chamelium->env, val, &params->bpc); xmlrpc_DECREF(val); }
+
+	xmlrpc_struct_find_value(&chamelium->env, res, "clock", &val);
+	if (val) { xmlrpc_read_double(&chamelium->env, val, &params->clock); xmlrpc_DECREF(val); }
+
+	xmlrpc_struct_find_value(&chamelium->env, res, "frame_rate", &val);
+	if (val) { xmlrpc_read_double(&chamelium->env, val, &params->frame_rate); xmlrpc_DECREF(val); }
+
+	xmlrpc_struct_find_value(&chamelium->env, res, "hsync_polarity", &val);
+	if (val) {
+		xmlrpc_bool b;
+		xmlrpc_read_bool(&chamelium->env, val, &b);
+		params->hsync_polarity = b;
+		xmlrpc_DECREF(val);
+	}
+
+	xmlrpc_struct_find_value(&chamelium->env, res, "vsync_polarity", &val);
+	if (val) {
+		xmlrpc_bool b;
+		xmlrpc_read_bool(&chamelium->env, val, &b);
+		params->vsync_polarity = b;
+		xmlrpc_DECREF(val);
+	}
+
+	xmlrpc_struct_find_value(&chamelium->env, res, "interlaced", &val);
+	if (val) {
+		xmlrpc_bool b;
+		xmlrpc_read_bool(&chamelium->env, val, &b);
+		params->interlaced = b;
+		xmlrpc_DECREF(val);
+	}
+
+	xmlrpc_DECREF(res);
+
+	igt_debug("Video params: %dx%d @ %.2f Hz, %d bpc\n",
+		  params->hactive, params->vactive,
+		  params->frame_rate, params->bpc);
+
+	return true;
+}
+
+/**
+ * chamelium_v3_has_audio_support - Check if a port supports audio
+ *
+ * @chamelium: Chamelium instance
+ * @port_id: Port ID to check
+ *
+ * Returns true if the port has audio support.
+ */
+bool chamelium_v3_has_audio_support(struct igt_chamelium_v3 *chamelium,
+				    chamelium_v3_port_id port_id)
+{
+	xmlrpc_value *res;
+	xmlrpc_bool has_support;
+
+	igt_debug("RPC HasAudioSupport(%d)\n", port_id);
+	res = __chamelium_rpc_try(chamelium, "HasAudioSupport", "(i)", port_id);
+	if (!res)
+		return false;
+
+	xmlrpc_read_bool(&chamelium->env, res, &has_support);
+	xmlrpc_DECREF(res);
+
+	return has_support;
+}
+
+/**
+ * chamelium_v3_start_capturing_audio - Start capturing audio from a port
+ *
+ * @chamelium: Chamelium instance
+ * @port_id: Port to capture audio from
+ * @save_to_file: Whether to save captured audio to a file on the Chamelium
+ */
+bool chamelium_v3_start_capturing_audio(struct igt_chamelium_v3 *chamelium,
+					chamelium_v3_port_id port_id,
+					bool save_to_file)
+{
+	xmlrpc_value *res;
+
+	igt_debug("RPC StartCapturingAudio(%d, %s)\n",
+		  port_id, save_to_file ? "true" : "false");
+	res = __chamelium_rpc_try(chamelium, "StartCapturingAudio", "(ib)",
+				 port_id, save_to_file);
+	if (!res)
+		return false;
+	xmlrpc_DECREF(res);
+	return true;
+}
+
+/**
+ * chamelium_v3_stop_capturing_audio - Stop capturing audio from a port
+ *
+ * @chamelium: Chamelium instance
+ * @port_id: Port to stop capturing audio from
+ */
+void chamelium_v3_stop_capturing_audio(struct igt_chamelium_v3 *chamelium,
+				       chamelium_v3_port_id port_id)
+{
+	xmlrpc_value *res;
+
+	igt_debug("RPC StopCapturingAudio(%d)\n", port_id);
+	res = __chamelium_rpc_try(chamelium, "StopCapturingAudio", "(i)",
+				  port_id);
+	if (res)
+		xmlrpc_DECREF(res);
+}
+
+/**
+ * chamelium_v3_get_audio_format - Get the audio capture format
+ *
+ * @chamelium: Chamelium instance
+ * @port_id: Port to query
+ * @rate: Output sampling rate in Hz (or 0 if unknown)
+ * @channels: Output number of channels
+ */
+void chamelium_v3_get_audio_format(struct igt_chamelium_v3 *chamelium,
+				   chamelium_v3_port_id port_id,
+				   int *rate, int *channels)
+{
+	xmlrpc_value *res, *val;
+
+	igt_debug("RPC GetAudioFormat(%d)\n", port_id);
+	res = __chamelium_rpc(chamelium, "GetAudioFormat", "(i)", port_id);
+
+	if (rate) {
+		xmlrpc_struct_find_value(&chamelium->env, res, "rate", &val);
+		if (val) {
+			xmlrpc_read_int(&chamelium->env, val, rate);
+			xmlrpc_DECREF(val);
+		} else {
+			*rate = 0;
+		}
+	}
+
+	if (channels) {
+		xmlrpc_struct_find_value(&chamelium->env, res, "channel", &val);
+		if (val) {
+			xmlrpc_read_int(&chamelium->env, val, channels);
+			xmlrpc_DECREF(val);
+		} else {
+			*channels = 0;
+		}
+	}
+
+	xmlrpc_DECREF(res);
+}
+
+/**
+ * chamelium_v3_get_audio_channel_mapping - Get audio channel mapping
+ *
+ * @chamelium: Chamelium instance
+ * @port_id: Port to query
+ * @mapping: Array of CHAMELIUM_V3_MAX_AUDIO_CHANNELS ints.
+ *           Each element indicates which input channel the capture channel
+ *           is mapped to. -1 means unmapped.
+ */
+void chamelium_v3_get_audio_channel_mapping(struct igt_chamelium_v3 *chamelium,
+					    chamelium_v3_port_id port_id,
+					    int mapping[static CHAMELIUM_V3_MAX_AUDIO_CHANNELS])
+{
+	xmlrpc_value *res, *res_channel;
+	int res_len, i;
+
+	igt_debug("RPC GetAudioChannelMapping(%d)\n", port_id);
+	res = __chamelium_rpc(chamelium, "GetAudioChannelMapping", "(i)", port_id);
+
+	res_len = xmlrpc_array_size(&chamelium->env, res);
+	igt_assert_f(res_len == CHAMELIUM_V3_MAX_AUDIO_CHANNELS,
+		     "Expected %d audio channels, got %d\n",
+		     CHAMELIUM_V3_MAX_AUDIO_CHANNELS, res_len);
+
+	for (i = 0; i < res_len; i++) {
+		xmlrpc_array_read_item(&chamelium->env, res, i, &res_channel);
+		xmlrpc_read_int(&chamelium->env, res_channel, &mapping[i]);
+		xmlrpc_DECREF(res_channel);
+	}
+	xmlrpc_DECREF(res);
+}
+
+/**
+ * chamelium_v3_get_last_infoframe - Get the last received InfoFrame
+ *
+ * @chamelium: Chamelium instance
+ * @port_id: Port to query
+ * @infoframe_type: Type string: "avi", "audio", "mpeg", "vendor", "spd"
+ *
+ * Returns: InfoFrame structure (caller must free with chamelium_v3_infoframe_destroy),
+ *          or NULL if no InfoFrame was received.
+ */
+struct chamelium_v3_infoframe *chamelium_v3_get_last_infoframe(
+	struct igt_chamelium_v3 *chamelium,
+	chamelium_v3_port_id port_id,
+	const char *infoframe_type)
+{
+	xmlrpc_value *res, *val;
+	struct chamelium_v3_infoframe *infoframe;
+	const unsigned char *payload_data;
+	size_t payload_len;
+
+	igt_debug("RPC GetLastInfoFrame(%d, \"%s\")\n", port_id, infoframe_type);
+	res = __chamelium_rpc_try(chamelium, "GetLastInfoFrame", "(is)",
+				  port_id, infoframe_type);
+	if (!res)
+		return NULL;
+
+	infoframe = calloc(1, sizeof(*infoframe));
+
+	xmlrpc_struct_find_value(&chamelium->env, res, "version", &val);
+	if (val) {
+		xmlrpc_read_int(&chamelium->env, val, &infoframe->version);
+		xmlrpc_DECREF(val);
+	}
+
+	xmlrpc_struct_find_value(&chamelium->env, res, "payload", &val);
+	if (val) {
+		xmlrpc_read_base64(&chamelium->env, val, &payload_len,
+				   &payload_data);
+		infoframe->payload = malloc(payload_len);
+		memcpy(infoframe->payload, payload_data, payload_len);
+		infoframe->payload_size = payload_len;
+		xmlrpc_DECREF(val);
+	}
+
+	xmlrpc_DECREF(res);
+
+	return infoframe;
+}
+
+/**
+ * chamelium_v3_infoframe_destroy - Free an InfoFrame structure
+ */
+void chamelium_v3_infoframe_destroy(struct chamelium_v3_infoframe *infoframe)
+{
+	if (infoframe) {
+		free(infoframe->payload);
+		free(infoframe);
+	}
+}
+
+/**
+ * chamelium_v3_capture_frame - Capture current frame from port
+ *
+ * Captures the current displayed frame using DumpPixels API.
+ * Returns RGB data (3 bytes per pixel).
+ *
+ * @chamelium: Chamelium instance
+ * @port_id: Port ID to capture from
+ *
+ * Returns: Frame structure with captured data (caller must free with chamelium_v3_free_frame)
+ */
+struct chamelium_v3_frame *chamelium_v3_capture_frame(struct igt_chamelium_v3 *chamelium,
+						      chamelium_v3_port_id port_id)
+{
+	struct chamelium_v3_frame *frame;
+	struct chamelium_v3_video_params params;
+	xmlrpc_value *res;
+	const unsigned char *data;
+	size_t data_len;
+
+	/* First get video params to know resolution */
+	if (!chamelium_v3_get_video_params(chamelium, port_id, &params)) {
+		igt_warn("Failed to get video params for port %d\n", port_id);
+		return NULL;
+	}
+
+	if (params.hactive <= 0 || params.vactive <= 0) {
+		igt_warn("Invalid video params: %dx%d\n", params.hactive, params.vactive);
+		return NULL;
+	}
+
+	igt_debug("RPC DumpPixels(%d)\n", port_id);
+	res = __chamelium_rpc_try(chamelium, "DumpPixels", "(i)", port_id);
+	if (!res) {
+		igt_warn("DumpPixels RPC failed for port %d\n", port_id);
+		return NULL;
+	}
+
+	/* Extract binary data from XML-RPC response */
+	xmlrpc_read_base64(&chamelium->env, res, &data_len, &data);
+
+	if (chamelium->env.fault_occurred) {
+		igt_warn("Failed to read DumpPixels data: %s\n",
+			 chamelium->env.fault_string);
+		xmlrpc_DECREF(res);
+		return NULL;
+	}
+
+	/* Allocate frame structure */
+	frame = calloc(1, sizeof(*frame));
+	frame->width = params.hactive;
+	frame->height = params.vactive;
+	frame->size = data_len;
+	frame->data = malloc(data_len);
+	memcpy(frame->data, data, data_len);
+
+	xmlrpc_DECREF(res);
+
+	igt_debug("Captured frame: %dx%d, %zu bytes\n",
+		  frame->width, frame->height, frame->size);
+
+	/* Verify data size matches expected RGB (3 bytes per pixel) */
+	size_t expected = (size_t)frame->width * frame->height * 3;
+	if (frame->size != expected) {
+		igt_warn("Frame size mismatch: got %zu, expected %zu\n",
+			 frame->size, expected);
+	}
+
+	return frame;
+}
+
+/**
+ * chamelium_v3_free_frame - Free captured frame memory
+ */
+void chamelium_v3_free_frame(struct chamelium_v3_frame *frame)
+{
+	if (frame) {
+		free(frame->data);
+		free(frame);
+	}
+}
diff --git a/lib/chamelium/v3/igt_chamelium.h b/lib/chamelium/v3/igt_chamelium.h
index 71351e579..a0da1bb6a 100644
--- a/lib/chamelium/v3/igt_chamelium.h
+++ b/lib/chamelium/v3/igt_chamelium.h
@@ -49,4 +49,199 @@ int chamelium_v3_get_children(struct igt_chamelium_v3 *chamelium, chamelium_v3_p
 bool chamelium_v3_is_mst(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id);
 char *chamelium_v3_get_port_name(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id);
 
+/* Port control functions */
+void chamelium_v3_reset(struct igt_chamelium_v3 *chamelium);
+void chamelium_v3_plug(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id);
+void chamelium_v3_unplug(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id);
+bool chamelium_v3_is_plugged(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id);
+void chamelium_v3_apply_edid(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id,
+			     int edid_id);
+
+/* MST (Multi-Stream Transport) functions */
+void chamelium_v3_plug_with_children(struct igt_chamelium_v3 *chamelium,
+				    chamelium_v3_port_id port_id,
+				    chamelium_v3_port_id *children_ids,
+				    int children_count);
+bool chamelium_v3_is_conflict(struct igt_chamelium_v3 *chamelium,
+			    chamelium_v3_port_id port_id_a,
+			    chamelium_v3_port_id port_id_b);
+int chamelium_v3_get_mutually_exclusive_ports(struct igt_chamelium_v3 *chamelium,
+					     chamelium_v3_port_id port_id,
+					     chamelium_v3_port_id **port_ids);
+char *chamelium_v3_get_connector_type(struct igt_chamelium_v3 *chamelium,
+				     chamelium_v3_port_id port_id);
+
+/* Port type detection */
+char *chamelium_v3_get_port_type(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id);
+bool chamelium_v3_port_is_dp(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id);
+bool chamelium_v3_port_is_hdmi(struct igt_chamelium_v3 *chamelium, chamelium_v3_port_id port_id);
+
+/* HPD pulse generation */
+void chamelium_v3_fire_hpd_pulse(struct igt_chamelium_v3 *chamelium,
+				 chamelium_v3_port_id port_id,
+				 int deassert_interval_usec,
+				 int assert_interval_usec,
+				 int repeat_count,
+				 int end_level);
+
+/* EDID creation - returns EDID ID for use with chamelium_v3_apply_edid */
+int chamelium_v3_create_edid(struct igt_chamelium_v3 *chamelium,
+			     const unsigned char *edid_data,
+			     size_t edid_size);
+
+/* Video parameters structure */
+struct chamelium_v3_video_params {
+	int hactive;
+	int vactive;
+	int htotal;
+	int vtotal;
+	int hsync_width;
+	int vsync_width;
+	int hfront_porch;
+	int vfront_porch;
+	int hback_porch;
+	int vback_porch;
+	bool hsync_polarity;
+	bool vsync_polarity;
+	double clock;
+	double frame_rate;
+	int bpc;
+	bool interlaced;
+};
+
+/* Frame capture structure */
+struct chamelium_v3_frame {
+	uint8_t *data;      /* RGB pixel data (3 bytes per pixel) */
+	int width;
+	int height;
+	size_t size;        /* Total data size in bytes */
+};
+
+/**
+ * chamelium_v3_get_video_params - Get video timing parameters from port
+ *
+ * @chamelium: Chamelium instance
+ * @port_id: Port ID to query
+ * @params: Output video parameters structure
+ *
+ * Returns true on success.
+ */
+bool chamelium_v3_get_video_params(struct igt_chamelium_v3 *chamelium,
+				   chamelium_v3_port_id port_id,
+				   struct chamelium_v3_video_params *params);
+
+/**
+ * chamelium_v3_capture_frame - Capture current frame from port
+ *
+ * Captures the current displayed frame using DumpPixels API.
+ * Returns RGB data (3 bytes per pixel).
+ *
+ * @chamelium: Chamelium instance
+ * @port_id: Port ID to capture from
+ *
+ * Returns: Frame structure with captured data (caller must free with chamelium_v3_free_frame)
+ */
+struct chamelium_v3_frame *chamelium_v3_capture_frame(struct igt_chamelium_v3 *chamelium,
+						      chamelium_v3_port_id port_id);
+
+/**
+ * chamelium_v3_free_frame - Free captured frame memory
+ */
+void chamelium_v3_free_frame(struct chamelium_v3_frame *frame);
+
+/*
+ * Port-to-DRM-connector mapping.
+ *
+ * Reads [Chamelium:<connector-name>] sections from .igtrc to map
+ * Chamelium port IDs to DRM connector IDs on the DUT.
+ * This is essential for verifying that plug/unplug actually changes
+ * the real DRM connector state.
+ */
+
+/** struct chamelium_v3_drm_port - A Chamelium port mapped to a DRM connector */
+struct chamelium_v3_drm_port {
+	chamelium_v3_port_id port_id;   /* Chamelium port ID (e.g. 4) */
+	uint32_t connector_id;          /* DRM connector_id from kernel */
+	uint32_t connector_type;        /* DRM_MODE_CONNECTOR_* type */
+	char connector_name[64];        /* DRM connector name e.g. "DP-1" */
+};
+
+/**
+ * chamelium_v3_read_port_mappings - Read port mappings from .igtrc config
+ *
+ * Reads [Chamelium:<name>] sections with ChameliumPortID keys, then finds
+ * the matching DRM connector on the system.
+ *
+ * @drm_fd: Open DRM file descriptor
+ * @ports: Output array of mapped ports (caller must free)
+ * @count: Output number of mapped ports
+ *
+ * Returns true on success.
+ */
+bool chamelium_v3_read_port_mappings(int drm_fd,
+				     struct chamelium_v3_drm_port **ports,
+				     int *count);
+
+/**
+ * chamelium_v3_reprobe_connector - Force-reprobe a DRM connector and return status
+ *
+ * Uses drmModeGetConnector() which triggers a kernel reprobe of the
+ * actual hardware state. This is how V2 verifies real connector status.
+ *
+ * @drm_fd: Open DRM file descriptor
+ * @connector_id: DRM connector ID to reprobe
+ *
+ * Returns: drmModeConnection (DRM_MODE_CONNECTED, DRM_MODE_DISCONNECTED, etc.)
+ */
+drmModeConnection chamelium_v3_reprobe_connector(int drm_fd,
+						 uint32_t connector_id);
+
+/**
+ * chamelium_v3_wait_for_conn_status_change - Poll connector until expected status or timeout
+ *
+ * Mirrors V2 chamelium_wait_for_conn_status_change. Polls with 50ms
+ * interval until the connector reports the expected status.
+ *
+ * @drm_fd: Open DRM file descriptor
+ * @connector_id: DRM connector ID
+ * @expected: Expected connection status
+ * @timeout_secs: Max seconds to wait
+ *
+ * Returns true if the expected status was reached.
+ */
+bool chamelium_v3_wait_for_conn_status_change(int drm_fd,
+					      uint32_t connector_id,
+					      drmModeConnection expected,
+					      int timeout_secs);
+
+/* Audio support */
+#define CHAMELIUM_V3_MAX_AUDIO_CHANNELS 8
+
+bool chamelium_v3_has_audio_support(struct igt_chamelium_v3 *chamelium,
+				    chamelium_v3_port_id port_id);
+bool chamelium_v3_start_capturing_audio(struct igt_chamelium_v3 *chamelium,
+					chamelium_v3_port_id port_id,
+					bool save_to_file);
+void chamelium_v3_stop_capturing_audio(struct igt_chamelium_v3 *chamelium,
+				       chamelium_v3_port_id port_id);
+void chamelium_v3_get_audio_format(struct igt_chamelium_v3 *chamelium,
+				   chamelium_v3_port_id port_id,
+				   int *rate, int *channels);
+void chamelium_v3_get_audio_channel_mapping(struct igt_chamelium_v3 *chamelium,
+					    chamelium_v3_port_id port_id,
+					    int mapping[static CHAMELIUM_V3_MAX_AUDIO_CHANNELS]);
+
+/* InfoFrame support */
+struct chamelium_v3_infoframe {
+	int version;
+	uint8_t *payload;
+	size_t payload_size;
+};
+
+struct chamelium_v3_infoframe *chamelium_v3_get_last_infoframe(
+	struct igt_chamelium_v3 *chamelium,
+	chamelium_v3_port_id port_id,
+	const char *infoframe_type);
+void chamelium_v3_infoframe_destroy(struct chamelium_v3_infoframe *infoframe);
+
 #endif //V3_IGT_CHAMELIUM_H
-- 
2.48.1

