Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CADC25B76
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 14:30:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA5910E23F;
	Wed,  5 Jun 2024 14:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AWwlokZz";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE4810E65A
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 14:30:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3101040012;
 Wed,  5 Jun 2024 14:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1717597820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FKoxCsp3g4ts30HlbTwhqqWdLqA7wpqEKoxa38OTG70=;
 b=AWwlokZzOTp2fone2JyO4RnHQgSIBMJLVhD6uCG5BZ0UZzc8uDWbKS+nYW5l91QlJ1mkLx
 HP9RGPXBhaAdtLOCq+F7UwDzGlcBQjb2Yf10oGUKdKpqXgaQ52Pnfk2Kt/AhWVkyi/u15p
 cnzh6Aer+fSfl2dS1eofdswnDiy+4gjUazfhEjQC6MVEfnyUedTcHAgFZ9QNxVMJR5Ph8p
 VIpSF5y43158UMZzO1a9HAo14LuYyXZ2YFnFPfZsPWGTrnU5Z0iQ2+OaKUzOhSifcUcv6d
 E6D0V/NwoRmb5fififAVbpjd+3LgsFgeqB5g4Qe2KMCxk6GIHQ5eApmavIOlrg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 05 Jun 2024 16:30:17 +0200
Subject: [PATCH i-g-t RFC 05/13] lib/chamelium: Implement all RPC calls for
 the chamelium v3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-dev-remove-static-ports-v1-5-665f25b7a4db@bootlin.com>
References: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
In-Reply-To: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=40417;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=DJCQXSIh3cgwb/uALB2LVM1CuJdCAhHn8U2GAIR51Ks=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmYHZ3NzRcCmeArBFPxcRQ/VqkkmLP+CHjzlnNd
 hlIvG3oO4iJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZmB2dwAKCRAgrS7GWxAs
 4oC0D/4owCVPGJzrGBQUuppFkL0LIJAJ1D9e+3t/iyRSTfe3ZONRpi5FvlfIz/vqGfSB1FsGDWx
 cynX0/N5w/OIKDpm+oKNay6mBPpfOMdnLTuueWDwyz7nbyj+uYba5v0DfyScoP1hhG4gC6jRltT
 QaAC1bBn+kBXIQpNxYLQCAHjuy953iX7Ddk112Psjg+0pyqyvz2sB5FuGaDmMFXi/SD0uzYD+4X
 Hedqj4in/R5CARm9IB4uOEozGIqYdGvtHNsskvpo4NQjgQgjZTDmcbri0X/IQitUy8z/zgRsCh0
 wMqpRPlEb0B3eoCXO5hV3WbQ1/IKpj9kG8lj9OZFgWSmogfOjOJwxjIgEf+kDBXDeAVzrU2pjts
 nKGCkbNArSKjvfK1Sp/dfFB8tkl1yakjQzMrzwVykmekFdFTElubKB3Ydw1ptan04B9/HF2AM6R
 sa8cZaLGs1DErcuX1oIlAzuitnkIPKZq7dsWQIHax17GnDj1O2XtQTfESAINTfePCNjVFrlrYEx
 NsQcwMofPj7gSa1vqByZxlLhlkHf19wUVhKvLc2eRH7FrsH/8DgYJGRWRq49LUAnia1BQQVOIpv
 61sX/NBf0VTTu0FF8VrtBSgfkWgXDohGBNnU4pwO8gxjRdwKxeEiu9uvRZdduq3JKDvLuuyH8fk
 Kqdbo66KHw0OKDQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

Introduce all the RPC calls supported by the Chamelium v3. This commmit is
not split enough, many RPC calls are introduced at the same time, some
code is in common with chamelium v2...

I will split this in many different commits:
- Introduce igt_get_pipe_for_output, this is used in few tests and is
  needed for my work in chamelium.
- Introduce `igt_wait_for_connector_status`, which allows busy waiting for
  a connector becoming connected. It is in common with the chamelium v2,
  but I made it more generic.
- Introduce `igt_get_connector_from_name`, extracted from the v2 code.
- Configuration reading/auto port detection (which needs to be polished
  and simplified).
- The introduction of all RPC calls can be either split in many commits
  and put near the tests which require them.
- In addition to the RPC calls, some helpers are useful when manipulating
  video capture from the chamelium. The functions are taken from the v2
  and I will put them in common with the v2 wrapper.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/chamelium/v3/igt_chamelium.c | 1023 +++++++++++++++++++++++++++++++++++++-
 lib/chamelium/v3/igt_chamelium.h |  114 ++++-
 2 files changed, 1133 insertions(+), 4 deletions(-)

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
index 9579bd2cd9f8..8a3cf8db2169 100644
--- a/lib/chamelium/v3/igt_chamelium.c
+++ b/lib/chamelium/v3/igt_chamelium.c
@@ -1,9 +1,1026 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#include <igt_core.h>
+#include <xmlrpc-c/base.h>
+#include <xmlrpc-c/client.h>
+#include <math.h>
+#include <igt_rc.h>
 #include "igt_chamelium.h"
+#include "igt_core.h"
+#include "drm_mode.h"
 
-void chamelium_v3_init(void)
+struct igt_chamelium_rpc {
+	xmlrpc_env env;
+	xmlrpc_client *client;
+	char *url;
+
+	struct igt_list_head port_mapping;
+};
+
+struct igt_chamelium_rpc_frame_dump {
+	unsigned char *bgr;
+	size_t size;
+	int width;
+	int height;
+	chamelium_port_id port_id;
+	double timestamp;
+	int sequence;
+};
+
+static void chamelium_rpc_port_mapping_free(struct chamelium_rpc_port_mapping *port_mapping)
+{
+	igt_list_del(&port_mapping->link);
+	free(port_mapping->connector_name);
+	free(port_mapping);
+}
+
+/**
+ * chamelium_rpc_init() - Initialize the RPC connexion with a chamelium
+ *
+ * @url: URL to connect to the chamelium
+ * @url_len: length of the url
+ *
+ * Returns a chamelium_rpc pointer, which must be freed by chamelium_rpc_uninit;
+ */
+struct igt_chamelium_rpc *chamelium_rpc_init(char *url, size_t url_len)
+{
+	struct igt_chamelium_rpc *chamelium = malloc(sizeof(struct igt_chamelium_rpc));
+	struct xmlrpc_clientparms clientparms;
+	struct xmlrpc_curl_xportparms curlparms;
+
+	if (!chamelium)
+		return NULL;
+
+	memset(chamelium, 0, sizeof(*chamelium));
+	memset(&clientparms, 0, sizeof(clientparms));
+	memset(&curlparms, 0, sizeof(curlparms));
+
+	/* curl's timeout is in milliseconds */
+	curlparms.timeout = 10 * 1000;
+
+	clientparms.transport = "curl";
+	clientparms.transportparmsP = &curlparms;
+	clientparms.transportparm_size = XMLRPC_CXPSIZE(timeout);
+
+	/* Setup the libxmlrpc context */
+	xmlrpc_env_init(&chamelium->env);
+	xmlrpc_client_setup_global_const(&chamelium->env);
+	xmlrpc_client_create(&chamelium->env, XMLRPC_CLIENT_NO_FLAGS, PACKAGE,
+			     PACKAGE_VERSION, &clientparms, 0, &chamelium->client);
+	if (chamelium->env.fault_occurred) {
+		igt_debug("Failed to init xmlrpc: %s\n",
+			  chamelium->env.fault_string);
+		goto error;
+	}
+
+	chamelium->url = strdup(url);
+	IGT_INIT_LIST_HEAD(&chamelium->port_mapping);
+
+	return chamelium;
+error:
+	chamelium_rpc_uninit(chamelium);
+	return NULL;
+}
+
+/**
+ * chamelium_rpc_init_from_config() - Initialize the RPC connexion with a chamelium from the config
+ * file
+ *
+ * Returns a chamelium_rpc pointer, which must be freed by chamelium_rpc_uninit;
+ */
+struct igt_chamelium_rpc *chamelium_rpc_init_from_config(void)
+{
+	struct igt_chamelium_rpc *chamelium;
+	GError *error = NULL;
+	char *url;
+
+	if (!igt_key_file) {
+		igt_debug("No configuration file available for chamelium\n");
+		return NULL;
+	}
+
+	url = g_key_file_get_string(igt_key_file, "Chamelium", "URL", &error);
+	if (!url) {
+		igt_debug("Couldn't read chamelium URL from config file: %s\n", error->message);
+		return false;
+	}
+
+	chamelium = chamelium_rpc_init(url, strlen(url));
+	free(url);
+	return chamelium;
+}
+
+const struct chamelium_rpc_port_mapping *chamelium_rpc_find_port_mapping_by_id
+	(struct igt_chamelium_rpc *chamelium, chamelium_port_id port_id)
+{
+	struct chamelium_rpc_port_mapping *tmp, *pos;
+
+	igt_list_for_each_entry_safe(pos, tmp, &chamelium->port_mapping, link) {
+		if (pos->port_id == port_id)
+			return pos;
+	}
+	return NULL;
+}
+
+drmModeConnectorPtr
+chamelium_rpc_port_mapping_get_connector(const struct chamelium_rpc_port_mapping *chamelium_port_mapping,
+					 int drm_fd)
+{
+	return igt_get_connector_from_name(drm_fd, chamelium_port_mapping->connector_name);
+}
+
+struct igt_list_head *chamelium_rpc_get_port_mapping(struct igt_chamelium_rpc *chamelium)
+{
+	return &chamelium->port_mapping;
+}
+
+static void chamelium_rpc_port_mapping_info_list(struct igt_list_head *head)
+{
+	struct chamelium_rpc_port_mapping *tmp, *pos;
+
+	igt_list_for_each_entry_safe(pos, tmp, head, link) {
+		igt_info("\t%s: port_id=%d parent_id=%d is_children=%d adapter_allowed=%d\n",
+			 pos->connector_name, pos->port_id, pos->parent_id, pos->is_children,
+			 pos->adapter_allowed);
+	}
+}
+
+void chamelium_rpc_fill_port_mapping(struct igt_chamelium_rpc *chamelium, int drm_fd)
+{
+	struct chamelium_rpc_port_mapping *tmp, *port_mapping;
+	GError *error = NULL;
+	char **group_list;
+	drmModeRes *res;
+	drmModeRes *res_2;
+	bool connected;
+	char *map_name;
+	int i;
+	char name[50];
+	bool found;
+	bool trust_config = false;
+	chamelium_port_id *port_ids;
+	int chamelium_port_count;
+	drmModeConnector *connector;
+	unsigned int *already_connected_connector_ids = malloc(0);
+	int already_connected_connector_ids_count = 0;
+
+	IGT_LIST_HEAD(tmp_mapping);
+
+	/* Extract current port mapping from config file */
+	if (igt_key_file) {
+		group_list = g_key_file_get_groups(igt_key_file, NULL);
+		for (i = 0; group_list[i]; i++) {
+			if (strstr(group_list[i], "Chamelium:")) {
+				tmp = malloc(sizeof(*tmp));
+				map_name = group_list[i] + (sizeof("Chamelium:") - 1);
+
+				tmp->connector_name = strdup(map_name);
+				tmp->port_id = g_key_file_get_integer(igt_key_file, group_list[i],
+								      "ChameliumPortID",
+								      &error);
+				if (error) {
+					igt_info("Skipping malformed entry %s: %s\n",
+						 group_list[i], error->message);
+					free(tmp->connector_name);
+					free(tmp);
+					continue;
+				}
+
+				if (g_key_file_has_key(igt_key_file, group_list[i],
+						       "AdapterAllowed", NULL)) {
+					tmp->adapter_allowed = g_key_file_get_boolean(igt_key_file,
+										      group_list[i],
+										      "AdapterAllowed",
+										      &error);
+					if (error) {
+						igt_info("Skipping malformed entry %s: %s\n",
+							 group_list[i], error->message);
+						free(tmp->connector_name);
+						free(tmp);
+						continue;
+					}
+				} else {
+					tmp->adapter_allowed = false;
+				}
+
+				if (g_key_file_has_key(igt_key_file, group_list[i],
+						       "ChameliumParentId", NULL)) {
+					tmp->parent_id = g_key_file_get_integer(igt_key_file,
+										group_list[i],
+										"ChameliumParentId",
+										&error);
+					tmp->is_children = true;
+					if (error) {
+						igt_info("Skipping malformed entry %s: %s\n",
+							 group_list[i],
+							 error->message);
+						free(tmp->connector_name);
+						free(tmp);
+						continue;
+					}
+				} else {
+					tmp->parent_id = 0;
+					tmp->is_children = false;
+				}
+
+				igt_list_add(&tmp->link, &tmp_mapping);
+			}
+			free(group_list[i]);
+		}
+		free(group_list);
+
+		trust_config = g_key_file_get_boolean(igt_key_file, "Chamelium", "TrustConfig",
+						      &error);
+	}
+
+	if (trust_config) {
+		igt_list_for_each_entry_safe(port_mapping, tmp, &tmp_mapping, link) {
+			igt_list_del(&port_mapping->link);
+			igt_list_add(&port_mapping->link, &chamelium->port_mapping);
+		}
+	} else {
+		/* Attempt to find direct connection connectors (no MST here) */
+		chamelium_reset_rpc(chamelium);
+		res = drmModeGetResources(drm_fd);
+		if (!res)
+			return;
+
+		for (i = 0; i < res->count_connectors; i++) {
+			connector = drmModeGetConnector(drm_fd, res->connectors[i]);
+
+			/* We have to generate the connector name on our own */
+			snprintf(name, 50, "%s-%u",
+				 kmstest_connector_type_str(connector->connector_type),
+				 connector->connector_type_id);
+
+			igt_debug("Attempt to find the port mapping of %s (connector_id=%d)\n",
+				  name, connector->connector_id);
+
+			/* If not found, try to auto-detect the chamelium port */
+			if (connector->connection == DRM_MODE_CONNECTED) {
+				igt_warn("The connector %s is reported as connected, impossible to perform autodetection, skip it.\n",
+					 name);
+				already_connected_connector_ids_count++;
+				already_connected_connector_ids = calloc(already_connected_connector_ids_count,
+									 sizeof(*already_connected_connector_ids));
+				already_connected_connector_ids[already_connected_connector_ids_count - 1] = connector->connector_id;
+				drmModeFreeConnector(connector);
+				continue;
+			}
+
+			chamelium_port_count = chamelium_get_supported_ports_rpc(chamelium,
+										 &port_ids);
+			igt_debug("Connector %s not found in config, plug all chamelium port to find the correct port_id\n",
+				  name);
+			for (int i_2 = 0; i_2 < chamelium_port_count; i_2++) {
+				chamelium_reset_rpc(chamelium);
+				if (chamelium_is_pysical_plugged_rpc(chamelium, port_ids[i_2])) {
+					chamelium_apply_edid_rpc(chamelium, port_ids[i_2], 0);
+					chamelium_plug_rpc(chamelium, port_ids[i_2]);
+					connected = igt_wait_for_connector_status(drm_fd,
+										  connector->connector_id,
+										  5.0,
+										  DRM_MODE_CONNECTED);
+					if (connected) {
+						tmp = malloc(sizeof(*tmp));
+						tmp->connector_name = strdup(name);
+						tmp->port_id = port_ids[i_2];
+						tmp->adapter_allowed = false;
+						tmp->is_children = false;
+						tmp->parent_id = false;
+						igt_list_add(&tmp->link, &chamelium->port_mapping);
+						igt_info("Connector %s detected on port_id %d\n",
+							 name, tmp->port_id);
+					}
+				}
+			}
+			free(port_ids);
+			drmModeFreeConnector(connector);
+		}
+
+		/*
+		 * Insert the remaning connectors if they are MST children and their parent are
+		 * found
+		 */
+		int prev_count = 0;
+
+		while (prev_count != igt_list_length(&tmp_mapping)) {
+			prev_count = igt_list_length(&tmp_mapping);
+			igt_list_for_each_entry_safe(port_mapping, tmp, &tmp_mapping, link) {
+				if (!port_mapping->is_children) {
+					igt_warn("The connector %s is not detected and is not an MST children, skipping it.\n",
+						 port_mapping->connector_name);
+					chamelium_rpc_port_mapping_free(port_mapping);
+					continue;
+				}
+				if (!chamelium_rpc_find_port_mapping_by_id(chamelium,
+									   port_mapping->parent_id)) {
+					igt_debug("The parent of %s is not found yet, keeping it for the next iteration\n",
+						  port_mapping->connector_name);
+					continue;
+				}
+				igt_list_del(&port_mapping->link);
+				igt_list_add(&port_mapping->link, &chamelium->port_mapping);
+			}
+		}
+
+		igt_list_for_each_entry_safe(port_mapping, tmp, &tmp_mapping, link) {
+			igt_warn("The configured connector %s is not a physical port nor a MST children in the Chamelium\n",
+				 port_mapping->connector_name);
+			chamelium_rpc_port_mapping_free(port_mapping);
+		}
+	}
+
+	igt_info("Port mapping found after scanning:\n");
+	chamelium_rpc_port_mapping_info_list(&chamelium->port_mapping);
+	free(already_connected_connector_ids);
+}
+
+/**
+ * chamelium_deinit() - Free the resources used by a chamelium_rpc
+ *
+ * @chamelium_rpc: The Chamelium instance to free
+ *
+ * Frees the resources used by a connection to the chamelium that was set up
+ * with chamelium_rpc_init().
+ */
+void chamelium_rpc_uninit(struct igt_chamelium_rpc *chamelium_rpc)
+{
+	struct chamelium_rpc_port_mapping *port_mapping, *tmp_port_mapping;
+
+	/* Destroy any EDIDs we created to make sure we don't leak them */
+	igt_list_for_each_entry_safe(port_mapping, tmp_port_mapping, &chamelium_rpc->port_mapping,
+				     link) {
+		chamelium_rpc_port_mapping_free(port_mapping);
+	}
+	free(chamelium_rpc);
+}
+
+static xmlrpc_value *__chamelium_rpc(struct igt_chamelium_rpc *chamelium_rpc,
+				     const char *method_name,
+				     const char *format_str,
+				     ...)
+{
+	xmlrpc_value *res;
+	va_list va_args;
+
+	if (chamelium_rpc->env.fault_occurred) {
+		xmlrpc_env_clean(&chamelium_rpc->env);
+		xmlrpc_env_init(&chamelium_rpc->env);
+	}
+	va_start(va_args, format_str);
+	xmlrpc_client_call2f_va(&chamelium_rpc->env, chamelium_rpc->client,
+				chamelium_rpc->url, method_name, format_str, &res,
+				va_args);
+	va_end(va_args);
+	igt_assert_f(!chamelium_rpc->env.fault_occurred,
+		     "Chamelium RPC call[%s] failed: %s\n", method_name,
+		     chamelium_rpc->env.fault_string);
+	return res;
+}
+
+unsigned int chamelium_get_connector_type_rpc(struct igt_chamelium_rpc *chamelium_rpc,
+					      chamelium_port_id port)
+{
+	xmlrpc_value *res;
+	const char *port_type_str;
+	unsigned int port_type;
+
+	res = __chamelium_rpc(chamelium_rpc, "GetConnectorType", "(i)", port);
+
+	xmlrpc_read_string(&chamelium_rpc->env, res, &port_type_str);
+
+	if (strcmp(port_type_str, "DP") == 0)
+		port_type = DRM_MODE_CONNECTOR_DisplayPort;
+	else if (strcmp(port_type_str, "HDMI") == 0)
+		port_type = DRM_MODE_CONNECTOR_HDMIA;
+	else if (strcmp(port_type_str, "VGA") == 0)
+		port_type = DRM_MODE_CONNECTOR_VGA;
+	else
+		port_type = DRM_MODE_CONNECTOR_Unknown;
+
+	free((void *)port_type_str);
+	xmlrpc_DECREF(res);
+
+	return port_type;
+}
+
+void chamelium_reset_rpc(struct igt_chamelium_rpc *chamelium_rpc)
+{
+	igt_debug("RPC Reset()\n");
+	xmlrpc_DECREF(__chamelium_rpc(chamelium_rpc, "Reset", "()"));
+}
+
+void chamelium_get_mac_rpc(struct igt_chamelium_rpc *chamelium_rpc, char mac[6])
+{
+	xmlrpc_value *res;
+	const char *mac_str;
+
+	igt_debug("RPC GetMacAddress()\n");
+	res = __chamelium_rpc(chamelium_rpc, "GetMacAddress", "()");
+
+	xmlrpc_read_string(&chamelium_rpc->env, res, &mac_str);
+
+	igt_assert_eq(sscanf(mac_str, "%hhx:%hhx:%hhx:%hhx:%hhx:%hhx%*c", &mac[0], &mac[1],
+			     &mac[2], &mac[3], &mac[4], &mac[5]), 6);
+
+	free((void *) mac_str);
+	xmlrpc_DECREF(res);
+}
+
+/*
+ * The caller must free the returned pointer
+ */
+char *chamelium_get_port_name_rpc(struct igt_chamelium_rpc *chamelium_rpc,
+				  chamelium_port_id port_id)
+{
+	xmlrpc_value *res;
+	const char *port_name;
+
+	igt_debug("RPC GetPortName(%d)\n", port_id);
+	res = __chamelium_rpc(chamelium_rpc, "GetPortName", "(i)", port_id);
+
+	xmlrpc_read_string(&chamelium_rpc->env, res, &port_name);
+
+	xmlrpc_DECREF(res);
+
+	return port_name;
+}
+
+/*
+ * The caller must free the returned pointer
+ */
+int chamelium_get_supported_ports_rpc(struct igt_chamelium_rpc *chamelium_rpc,
+				      chamelium_port_id **port_ids)
+{
+	xmlrpc_value *res, *res_port;
+	int port_count, i;
+
+	igt_debug("RPC GetSupportedPorts()\n");
+	res = __chamelium_rpc(chamelium_rpc, "GetSupportedPorts", "()");
+
+	port_count = xmlrpc_array_size(&chamelium_rpc->env, res);
+	*port_ids = calloc(port_count, sizeof(**port_ids));
+
+	for (i = 0; i < port_count; i++) {
+		xmlrpc_array_read_item(&chamelium_rpc->env, res, i, &res_port);
+		xmlrpc_read_int(&chamelium_rpc->env, res_port, &(*port_ids)[i]);
+		xmlrpc_DECREF(res_port);
+	}
+	xmlrpc_DECREF(res);
+
+	return port_count;
+}
+
+/*
+ * The caller must free the returned pointer
+ */
+int chamelium_get_children_rpc(struct igt_chamelium_rpc *chamelium_rpc, chamelium_port_id port_id,
+			       chamelium_port_id **port_ids)
+{
+	xmlrpc_value *res, *res_port;
+	int port_count, i;
+
+	igt_debug("RPC GetChildren(%d)\n", port_id);
+	res = __chamelium_rpc(chamelium_rpc, "GetChildren", "(i)", port_id);
+
+	port_count = xmlrpc_array_size(&chamelium_rpc->env, res);
+	*port_ids = calloc(port_count, sizeof(**port_ids));
+
+	for (i = 0; i < port_count; i++) {
+		xmlrpc_array_read_item(&chamelium_rpc->env, res, i, &res_port);
+		xmlrpc_read_int(&chamelium_rpc->env, res_port, &(*port_ids)[i]);
+		xmlrpc_DECREF(res_port);
+	}
+	xmlrpc_DECREF(res);
+
+	return port_count;
+}
+
+bool chamelium_is_mst_rpc(struct igt_chamelium_rpc *chamelium_rpc, chamelium_port_id port_id)
+{
+	xmlrpc_value *res;
+	xmlrpc_bool is_mst;
+
+	igt_debug("RPC IsMst(%d)\n", port_id);
+	res = __chamelium_rpc(chamelium_rpc, "IsMst", "(i)", port_id);
+
+	xmlrpc_read_bool(&chamelium_rpc->env, res, &is_mst);
+
+	xmlrpc_DECREF(res);
+
+	return is_mst;
+}
+
+bool chamelium_has_audio_support_rpc(struct igt_chamelium_rpc *chamelium_rpc,
+				     chamelium_port_id port_id)
+{
+	xmlrpc_value *res;
+	xmlrpc_bool has_audio_support;
+
+	igt_debug("RPC HasAudioSupport(%d)\n", port_id);
+	res = __chamelium_rpc(chamelium_rpc, "HasAudioSupport", "(i)", port_id);
+	xmlrpc_read_bool(&chamelium_rpc->env, res, &has_audio_support);
+
+	xmlrpc_DECREF(res);
+
+	return has_audio_support;
+}
+
+bool chamelium_has_video_support_rpc(struct igt_chamelium_rpc *chamelium_rpc,
+				     chamelium_port_id port_id)
+{
+	xmlrpc_value *res;
+	xmlrpc_bool has_video_support;
+
+	igt_debug("RPC HasVideoSupport(%d)\n", port_id);
+	res = __chamelium_rpc(chamelium_rpc, "HasVideoSupport", "(i)", port_id);
+	xmlrpc_read_bool(&chamelium_rpc->env, res, &has_video_support);
+
+	xmlrpc_DECREF(res);
+
+	return has_video_support;
+}
+
+chamelium_edid_id chamelium_create_edid_rpc(struct igt_chamelium_rpc *chamelium_rpc,
+					    const struct edid *edid)
+{
+	xmlrpc_value *res;
+	chamelium_edid_id edid_id;
+
+	igt_debug("RPC CreateEdid(...)\n");
+	res = __chamelium_rpc(chamelium_rpc, "CreateEdid", "(6)",
+			      edid, edid_get_size(edid));
+	xmlrpc_read_int(&chamelium_rpc->env, res, &edid_id);
+	xmlrpc_DECREF(res);
+
+	return edid_id;
+}
+
+void chamelium_destroy_edid_rpc(struct igt_chamelium_rpc *chamelium_rpc, chamelium_edid_id edid_id)
+{
+	igt_debug("RPC DestroyEdid(%d)\n", edid_id);
+	xmlrpc_DECREF(__chamelium_rpc(chamelium_rpc, "DestroyEdid", "(i)", edid_id));
+}
+
+/*
+ * The caller must free the returned pointer
+ */
+const struct edid *chamelium_read_edid_rpc(struct igt_chamelium_rpc *chamelium_rpc,
+					   chamelium_port_id port_id)
+{
+	xmlrpc_value *res;
+	const struct edid *edid;
+	size_t edid_size;
+
+	igt_debug("RPC ReadEdid(%d)\n", port_id);
+	res = __chamelium_rpc(chamelium_rpc, "ReadEdid", "(i)", port_id);
+	xmlrpc_read_base64(&chamelium_rpc->env, res, &edid_size, (const unsigned char **)&edid);
+
+	xmlrpc_DECREF(res);
+
+	return edid;
+}
+
+void chamelium_apply_edid_rpc(struct igt_chamelium_rpc *chamelium_rpc,
+			      chamelium_port_id port_id, chamelium_edid_id edid_id)
+{
+	igt_debug("RPC ApplyEdid(%d, %d)\n", port_id, edid_id);
+	xmlrpc_DECREF(__chamelium_rpc(chamelium_rpc, "ApplyEdid", "(ii)", port_id, edid_id));
+}
+
+bool chamelium_is_conflict_rpc(struct igt_chamelium_rpc *chamelium_rpc,
+			       chamelium_port_id port_id_a, chamelium_port_id port_id_b)
+{
+	xmlrpc_value *res;
+	xmlrpc_bool conflict;
+
+	igt_debug("RPC IsConflict(%d, %d)\n", port_id_a, port_id_b);
+	res = __chamelium_rpc(chamelium_rpc, "IsConflict", "(ii)", port_id_a, port_id_b);
+	xmlrpc_read_bool(&chamelium_rpc->env, res, &conflict);
+
+	xmlrpc_DECREF(res);
+
+	return conflict;
+}
+
+/*
+ * The caller must free the returned pointer
+ */
+const chamelium_port_id *chamelium_get_mutually_exclusive_ports_rpc
+	(struct igt_chamelium_rpc *chamelium_rpc, chamelium_port_id port_id)
+{
+	chamelium_port_id *port_ids;
+	xmlrpc_value *res, *res_port;
+	int port_count;
+
+	igt_debug("RPC GetMutuallyExclusivePorts(%d)\n", port_id);
+	res = __chamelium_rpc(chamelium_rpc, "GetMutuallyExclusivePorts", "(i)", port_id);
+
+	port_count = xmlrpc_array_size(&chamelium_rpc->env, res);
+	port_ids = calloc(port_count, sizeof(*port_ids));
+
+	for (; port_count > 0; port_count--) {
+		xmlrpc_array_read_item(&chamelium_rpc->env, res, port_count - 1, &res_port);
+		xmlrpc_read_int(&chamelium_rpc->env, res_port, &port_ids[port_count - 1]);
+		xmlrpc_DECREF(res_port);
+	}
+	xmlrpc_DECREF(res);
+
+	return port_ids;
+}
+
+bool chamelium_is_plugged_rpc(struct igt_chamelium_rpc *chamelium_rpc, chamelium_port_id port_id)
+{
+	xmlrpc_value *res;
+	xmlrpc_bool plugged;
+
+	igt_debug("RPC IsPlugged(%d)\n", port_id);
+	res = __chamelium_rpc(chamelium_rpc, "IsPlugged", "(i)", port_id);
+	xmlrpc_read_bool(&chamelium_rpc->env, res, &plugged);
+
+	xmlrpc_DECREF(res);
+
+	return plugged;
+}
+
+void chamelium_plug_rpc(struct igt_chamelium_rpc *chamelium_rpc, chamelium_port_id port_id)
+{
+	igt_debug("RPC Plug(%d)\n", port_id);
+	xmlrpc_DECREF(__chamelium_rpc(chamelium_rpc, "Plug", "(i)", port_id));
+}
+
+void chamelium_plug_with_children_rpc(struct igt_chamelium_rpc *chamelium_rpc,
+				      chamelium_port_id port_id, chamelium_port_id *children,
+				      size_t children_port_count)
+{
+	xmlrpc_value *tmp;
+	xmlrpc_value *children_array = xmlrpc_array_new(&chamelium_rpc->env);
+
+	for (int i = 0; i < children_port_count; i++) {
+		tmp = xmlrpc_int_new(&chamelium_rpc->env, children[i]);
+		xmlrpc_array_append_item(&chamelium_rpc->env, children_array, tmp);
+		xmlrpc_DECREF(tmp);
+	}
+
+	igt_debug("RPC PlugWithChildren(%d, ...)\n", port_id);
+	xmlrpc_DECREF(__chamelium_rpc(chamelium_rpc, "PlugWithChildren", "(iA)", port_id,
+				      children_array));
+	xmlrpc_DECREF(children_array);
+}
+
+void chamelium_unplug_rpc(struct igt_chamelium_rpc *chamelium_rpc, chamelium_port_id port_id)
+{
+	igt_debug("RPC Unplug(%d)\n", port_id);
+	xmlrpc_DECREF(__chamelium_rpc(chamelium_rpc, "Unplug", "(i)", port_id));
+}
+
+void chamelium_unplug_hpd_rpc(struct igt_chamelium_rpc *chamelium_rpc, chamelium_port_id port_id)
+{
+	igt_debug("RPC UnplugHPD(%d)\n", port_id);
+	xmlrpc_DECREF(__chamelium_rpc(chamelium_rpc, "UnplugHPD", "(i)", port_id));
+}
+
+void chamelium_fire_hpd_pulse_rpc(struct igt_chamelium_rpc *chamelium_rpc,
+				  chamelium_port_id port_id, int deassert_interval_usec,
+				  int assert_interval_usec, int repeat_count, int end_level)
 {
-	igt_info("Using chamelium v3\n");
+	igt_debug("RPC FireHpdPulse(%d, %d, %d, %d, ...)\n", port_id, deassert_interval_usec,
+		  assert_interval_usec, repeat_count);
+
+	xmlrpc_DECREF(__chamelium_rpc(chamelium_rpc, "FireHpdPulse", "(iiiib)", port_id,
+				      deassert_interval_usec, assert_interval_usec,
+				      repeat_count, end_level));
+}
+
+void chamelium_fire_mixed_hpd_pulses_rpc(struct igt_chamelium_rpc *chamelium_rpc,
+					 chamelium_port_id port_id, int *widths_msec,
+					 size_t widths_msec_count)
+{
+	xmlrpc_value *tmp;
+	xmlrpc_value *widths_msec_array = xmlrpc_array_new(&chamelium_rpc->env);
+
+	for (int i = 0; i < widths_msec_count; i++) {
+		tmp = xmlrpc_int_new(&chamelium_rpc->env, widths_msec[i]);
+		xmlrpc_array_append_item(&chamelium_rpc->env, widths_msec_array, tmp);
+		xmlrpc_DECREF(tmp);
+	}
+
+	igt_debug("RPC FireMixedHpdPulses(%d, ...)\n", port_id);
+
+	xmlrpc_DECREF(__chamelium_rpc(chamelium_rpc, "FireMixedHpdPulses", "(iA)", port_id,
+				      widths_msec_array));
+	xmlrpc_DECREF(widths_msec_array);
+}
+
+void chamelium_schedule_hpd_toggle_rpc(struct igt_chamelium_rpc *chamelium_rpc,
+				       chamelium_port_id port_id, int delay_ms, bool end_level)
+{
+	igt_debug("RPC ScheduleHpdToggle(%d, %d, %d)\n", port_id, delay_ms, end_level);
+	xmlrpc_DECREF(__chamelium_rpc(chamelium_rpc, "ScheduleHpdToggle", "(iib)", port_id,
+				      delay_ms, end_level));
+}
+
+bool chamelium_port_wait_video_input_stable_rpc(struct igt_chamelium_rpc *chamelium_rpc,
+						chamelium_port_id port_id,
+						int timeout_secs)
+{
+	xmlrpc_value *res;
+	xmlrpc_bool is_on;
+
+	igt_debug("RPC WaitVideoInputStable(%d, %d)\n", port_id, timeout_secs);
+	res = __chamelium_rpc(chamelium_rpc, "WaitVideoInputStable", "(ii)",
+			      port_id, timeout_secs);
+
+	xmlrpc_read_bool(&chamelium_rpc->env, res, &is_on);
+	xmlrpc_DECREF(res);
+
+	return is_on;
+}
+
+bool chamelium_is_pysical_plugged_rpc(struct igt_chamelium_rpc *chamelium_rpc,
+				      chamelium_port_id port_id)
+{
+	xmlrpc_value *res;
+	xmlrpc_bool plugged;
+
+	igt_debug("RPC IsPhysicalPlugged(%d)\n", port_id);
+	res = __chamelium_rpc(chamelium_rpc, "IsPhysicalPlugged", "(i)", port_id);
+	xmlrpc_read_bool(&chamelium_rpc->env, res, &plugged);
+
+	xmlrpc_DECREF(res);
+
+	return plugged;
+}
+
+/*
+ * The caller must free the returned pointer
+ */
+const chamelium_port_id *chamelium_probe_ports_rpc(struct igt_chamelium_rpc *chamelium_rpc)
+{
+	chamelium_port_id *port_ids;
+	xmlrpc_value *res, *res_port;
+	int port_count;
+
+	igt_debug("RPC ProbePorts()\n");
+	res = __chamelium_rpc(chamelium_rpc, "ProbePorts", "()");
+
+	port_count = xmlrpc_array_size(&chamelium_rpc->env, res);
+	port_ids = calloc(port_count, sizeof(*port_ids));
+
+	for (; port_count > 0; port_count--) {
+		xmlrpc_array_read_item(&chamelium_rpc->env, res, port_count - 1, &res_port);
+		xmlrpc_read_int(&chamelium_rpc->env, res_port, &port_ids[port_count - 1]);
+		xmlrpc_DECREF(res_port);
+	}
+	xmlrpc_DECREF(res);
+
+	return port_ids;
+}
+
+void chamelium_port_get_resolution_rpc(struct igt_chamelium_rpc *chamelium_rpc,
+				       chamelium_port_id port_id,
+				       int *x, int *y)
+{
+	xmlrpc_value *res, *res_x, *res_y;
+
+	igt_debug("RPC DetectResolution(%d)\n", port_id);
+	res = __chamelium_rpc(chamelium_rpc, "DetectResolution", "(i)",
+			      port_id);
+
+	xmlrpc_array_read_item(&chamelium_rpc->env, res, 0, &res_x);
+	xmlrpc_array_read_item(&chamelium_rpc->env, res, 1, &res_y);
+	xmlrpc_read_int(&chamelium_rpc->env, res_x, x);
+	xmlrpc_read_int(&chamelium_rpc->env, res_y, y);
+
+	xmlrpc_DECREF(res_x);
+	xmlrpc_DECREF(res_y);
+	xmlrpc_DECREF(res);
+}
+
+void chamelium_capture_video_rpc(struct igt_chamelium_rpc *chamelium_rpc,
+				 chamelium_port_id port_id, int frame_count)
+{
+	igt_debug("RPC CaptureVideo(%d, %d)\n", port_id, frame_count);
+	xmlrpc_DECREF(__chamelium_rpc(chamelium_rpc, "CaptureVideo", "(iinnnn)", port_id,
+				      frame_count));
+}
+
+void chamelium_port_get_captured_resolution_rpc(struct igt_chamelium_rpc *chamelium_rpc,
+						int *width, int *height)
+{
+	xmlrpc_value *res, *res_width, *res_height;
+
+	igt_debug("RPC GetCapturedResolution()\n");
+	res = __chamelium_rpc(chamelium_rpc, "GetCapturedResolution", "()");
+
+	xmlrpc_array_read_item(&chamelium_rpc->env, res, 0, &res_width);
+	xmlrpc_array_read_item(&chamelium_rpc->env, res, 1, &res_height);
+	xmlrpc_read_int(&chamelium_rpc->env, res_width, width);
+	xmlrpc_read_int(&chamelium_rpc->env, res_height, height);
+
+	xmlrpc_DECREF(res_width);
+	xmlrpc_DECREF(res_height);
+	xmlrpc_DECREF(res);
+}
+
+static void read_int_from_xml_struct(struct igt_chamelium_rpc *chamelium_rpc,
+				     xmlrpc_value *struct_val, const char *key,
+				     int *dst)
+{
+	xmlrpc_value *val = NULL;
+
+	xmlrpc_struct_find_value(&chamelium_rpc->env, struct_val, key, &val);
+	if (val) {
+		xmlrpc_read_int(&chamelium_rpc->env, val, dst);
+		xmlrpc_DECREF(val);
+	} else {
+		*dst = -1;
+	}
+}
+
+void chamelium_get_captured_frame_metadata_rpc(struct igt_chamelium_rpc *chamelium_rpc,
+					       unsigned int index, int *width, int *height,
+					       double *timestamp, chamelium_port_id *port_id,
+					       int *sequence, size_t *size)
+{
+	xmlrpc_value *res, *tmp;
+
+	igt_debug("RPC GetCapturedFrameMetadata(%d)\n", index);
+	res = __chamelium_rpc(chamelium_rpc, "GetCapturedFrameMetadata", "(i)", index);
+
+	read_int_from_xml_struct(chamelium_rpc, res, "width", width);
+	read_int_from_xml_struct(chamelium_rpc, res, "height", height);
+	read_int_from_xml_struct(chamelium_rpc, res, "port_id", port_id);
+	read_int_from_xml_struct(chamelium_rpc, res, "sequence", sequence);
+	read_int_from_xml_struct(chamelium_rpc, res, "size", (int *)size);
+
+	xmlrpc_struct_find_value(&chamelium_rpc->env, res, "timestamp", &tmp);
+	if (tmp) {
+		xmlrpc_read_double(&chamelium_rpc->env, tmp, timestamp);
+		xmlrpc_DECREF(tmp);
+	} else {
+		*timestamp = NAN;
+	}
+
+	xmlrpc_DECREF(res);
+}
+
+/*
+ * The caller must free the returned pointer
+ */
+struct igt_chamelium_rpc_frame_dump *chamelium_read_captured_frame_rpc
+	(struct igt_chamelium_rpc *chamelium_rpc, unsigned int index)
+{
+	struct igt_chamelium_rpc_frame_dump *frame;
+	xmlrpc_value *res;
+
+	frame = malloc(sizeof(*frame));
+
+	chamelium_get_captured_frame_metadata_rpc(chamelium_rpc, index, &frame->width,
+						  &frame->height, &frame->timestamp,
+						  &frame->port_id, &frame->sequence,
+						  &frame->size);
+
+	igt_debug("RPC ReadCapturedFrame(%d)\n", index);
+	res = __chamelium_rpc(chamelium_rpc, "ReadCapturedFrame", "(i)", index);
+
+	xmlrpc_read_base64(&chamelium_rpc->env, res, &frame->size, (void *)&frame->bgr);
+
+	xmlrpc_DECREF(res);
+
+	return frame;
+}
+
+void chamelium_port_get_video_params_rpc(struct igt_chamelium_rpc *chamelium_rpc,
+					 chamelium_port_id port_id,
+					 struct igt_chamelium_rpc_video_params *params)
+{
+	xmlrpc_value *res, *tmp;
+
+	igt_debug("RPC GetVideoParams(%d)\n", port_id);
+	res = __chamelium_rpc(chamelium_rpc, "GetVideoParams", "(i)", port_id);
+
+	xmlrpc_struct_find_value(&chamelium_rpc->env, res, "clock", &tmp);
+	if (tmp) {
+		xmlrpc_read_double(&chamelium_rpc->env, tmp, &params->clock);
+		xmlrpc_DECREF(tmp);
+	} else {
+		params->clock = NAN;
+	}
+
+	read_int_from_xml_struct(chamelium_rpc, res, "htotal", &params->htotal);
+	read_int_from_xml_struct(chamelium_rpc, res, "hactive", &params->hactive);
+	read_int_from_xml_struct(chamelium_rpc, res, "hsync_offset",
+				 &params->hsync_offset);
+	read_int_from_xml_struct(chamelium_rpc, res, "hsync_width",
+				 &params->hsync_width);
+	read_int_from_xml_struct(chamelium_rpc, res, "hsync_polarity",
+				 &params->hsync_polarity);
+	read_int_from_xml_struct(chamelium_rpc, res, "vtotal", &params->vtotal);
+	read_int_from_xml_struct(chamelium_rpc, res, "vactive", &params->vactive);
+	read_int_from_xml_struct(chamelium_rpc, res, "vsync_offset",
+				 &params->vsync_offset);
+	read_int_from_xml_struct(chamelium_rpc, res, "vsync_width",
+				 &params->vsync_width);
+	read_int_from_xml_struct(chamelium_rpc, res, "vsync_polarity",
+				 &params->vsync_polarity);
+
+	xmlrpc_DECREF(res);
+}
+
+bool chamelium_has_audio_board_rpc(struct igt_chamelium_rpc *chamelium_rpc)
+{
+	xmlrpc_value *res;
+	xmlrpc_bool has_audio_board;
+
+	igt_debug("RPC HasAudioBoard()\n");
+	res = __chamelium_rpc(chamelium_rpc, "HasAudioBoard", "()");
+	xmlrpc_read_bool(&chamelium_rpc->env, res, &has_audio_board);
+
+	xmlrpc_DECREF(res);
+
+	return has_audio_board;
+}
+
+igt_constructor {
+	/* Frame dumps can be large, so we need to be able to handle very large
+	 * responses
+	 *
+	 * Limit here is 15MB
+	 */
+	xmlrpc_limit_set(XMLRPC_XML_SIZE_LIMIT_ID, 15728640);
+}
+
+// TODO: Move it somewhere else
+drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name)
+{
+	drmModeResPtr res = drmModeGetResources(drm_fd);
+	int i;
+
+	if (!res)
+		return 0;
+
+	for (i = 0; i < res->count_connectors; i++) {
+		char name[50];
+		bool found;
+
+		drmModeConnectorPtr connector = drmModeGetConnector(drm_fd, res->connectors[i]);
+
+		/* We have to generate the connector name on our own */
+		snprintf(name, 50, "%s-%u",
+			 kmstest_connector_type_str(connector->connector_type),
+			 connector->connector_type_id);
+
+
+		if (strcmp(port_name, name) == 0) {
+			drmModeFreeResources(res);
+			return connector;
+		}
+		drmModeFreeConnector(connector);
+	}
+	drmModeFreeResources(res);
+	return NULL;
+}
+
+static double elapsed(const struct timespec *start, const struct timespec *end)
+{
+	return (end->tv_sec - start->tv_sec) + 1e-9 * (end->tv_nsec - start->tv_nsec);
+}
+
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode)
+{
+	drmModeConnector *connector;
+	struct timespec start, end;
+
+	clock_gettime(CLOCK_MONOTONIC, &start);
+	clock_gettime(CLOCK_MONOTONIC, &end);
+
+	while (elapsed(&start, &end) <= timeout) {
+		connector = drmModeGetConnector(drm_fd, connector_id);
+		if (connector->connection == drm_mode) {
+			free(connector);
+			return true;
+		}
+		free(connector);
+		clock_gettime(CLOCK_MONOTONIC, &end);
+	}
+
+	igt_debug("Timeout waiting for connection status %d on connector %d\n", drm_mode,
+		  connector_id);
+	return false;
+}
+
+enum pipe igt_get_pipe_for_output(igt_display_t *display,
+				  igt_output_t *output)
+{
+	enum pipe pipe;
+
+	for_each_pipe(display, pipe) {
+		if ((igt_output_is_connected((output)) &&
+		     (output->config.valid_crtc_idx_mask & (1 << (pipe)))))
+			return pipe;
+	}
+
+	igt_assert_f(false, "No pipe found for output %s\n", igt_output_name(output));
 }
diff --git a/lib/chamelium/v3/igt_chamelium.h b/lib/chamelium/v3/igt_chamelium.h
index 1848f66b574f..01e1357b5226 100644
--- a/lib/chamelium/v3/igt_chamelium.h
+++ b/lib/chamelium/v3/igt_chamelium.h
@@ -3,6 +3,118 @@
 #ifndef V3_IGT_CHAMELIUM_H
 #define V3_IGT_CHAMELIUM_H
 
-void chamelium_v3_init(void);
+#include "config.h"
+
+#include <stdbool.h>
+#include <stddef.h>
+#include <xf86drmMode.h>
+
+#include "igt_debugfs.h"
+#include "igt_kms.h"
+#include "igt_list.h"
+
+#include "igt_edid.h"
+
+struct igt_chamelium_rpc;
+struct igt_chamelium_rpc_frame_dump;
+
+typedef int chamelium_port_id;
+typedef int chamelium_edid_id;
+
+struct igt_chamelium_rpc_video_params {
+	double clock;
+	int htotal, hactive, hsync_offset, hsync_width, hsync_polarity;
+	int vtotal, vactive, vsync_offset, vsync_width, vsync_polarity;
+};
+
+struct chamelium_rpc_port_mapping {
+	struct igt_list_head link;
+	chamelium_port_id port_id;
+	bool is_children;
+	chamelium_port_id parent_id;
+	char *connector_name;
+	bool adapter_allowed;
+};
+
+struct igt_chamelium_rpc *chamelium_rpc_init_from_config(void);
+struct igt_chamelium_rpc *chamelium_rpc_init(char *url, size_t url_len);
+const struct chamelium_rpc_port_mapping *
+chamelium_rpc_find_port_mapping_by_id(struct igt_chamelium_rpc *chamelium,
+				      chamelium_port_id port_id);
+drmModeConnectorPtr
+chamelium_rpc_port_mapping_get_connector(const struct chamelium_rpc_port_mapping *chamelium_port_mapping,
+					 int drm_fd);
+struct igt_list_head *chamelium_rpc_get_port_mapping(struct igt_chamelium_rpc *chamelium);
+void chamelium_rpc_fill_port_mapping(struct igt_chamelium_rpc *chamelium, int drm_fd);
+void chamelium_rpc_uninit(struct igt_chamelium_rpc *chamelium_rpc);
+
+/* Move this somewhere else */
+drmModeConnectorPtr igt_get_connector_from_name(int drm_fd, const char *port_name);
+bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
+				   int drm_mode);
+enum pipe igt_get_pipe_for_output(igt_display_t *display, igt_output_t *output);
+
+unsigned int chamelium_get_connector_type_rpc(struct igt_chamelium_rpc *chamelium,
+					      chamelium_port_id port);
+void chamelium_reset_rpc(struct igt_chamelium_rpc *chamelium);
+void chamelium_get_mac_rpc(struct igt_chamelium_rpc *chamelium, char mac[6]);
+char *chamelium_get_port_name_rpc(struct igt_chamelium_rpc *chamelium, chamelium_port_id port_id);
+int chamelium_get_supported_ports_rpc(struct igt_chamelium_rpc *chamelium,
+				      chamelium_port_id **port_ids);
+int chamelium_get_children_rpc(struct igt_chamelium_rpc *chamelium, chamelium_port_id port_id,
+			       chamelium_port_id **port_ids);
+bool chamelium_is_mst_rpc(struct igt_chamelium_rpc *chamelium, chamelium_port_id port_id);
+bool chamelium_has_audio_support_rpc(struct igt_chamelium_rpc *chamelium,
+				     chamelium_port_id port_id);
+bool chamelium_has_video_support_rpc(struct igt_chamelium_rpc *chamelium,
+				     chamelium_port_id port_id);
+chamelium_edid_id chamelium_create_edid_rpc(struct igt_chamelium_rpc *chamelium,
+					    const struct edid *edid);
+void chamelium_destroy_edid_rpc(struct igt_chamelium_rpc *chamelium, chamelium_edid_id edid_id);
+const struct edid *chamelium_read_edid_rpc(struct igt_chamelium_rpc *chamelium,
+					   chamelium_port_id port_id);
+void chamelium_apply_edid_rpc(struct igt_chamelium_rpc *chamelium, chamelium_port_id port_id,
+			      chamelium_edid_id edid_id);
+bool chamelium_is_conflict_rpc(struct igt_chamelium_rpc *chamelium, chamelium_port_id port_id_a,
+			       chamelium_port_id port_id_b);
+const chamelium_port_id *
+chamelium_get_mutually_exclusive_ports_rpc(struct igt_chamelium_rpc *chamelium,
+					   chamelium_port_id port_id);
+bool chamelium_is_plugged_rpc(struct igt_chamelium_rpc *chamelium, chamelium_port_id port_id);
+void chamelium_plug_rpc(struct igt_chamelium_rpc *chamelium, chamelium_port_id port_id);
+void chamelium_plug_with_children_rpc(struct igt_chamelium_rpc *chamelium,
+				      chamelium_port_id port_id, chamelium_port_id *children,
+				      size_t children_port_count);
+void chamelium_unplug_rpc(struct igt_chamelium_rpc *chamelium, chamelium_port_id port_id);
+void chamelium_unplug_hpd_rpc(struct igt_chamelium_rpc *chamelium, chamelium_port_id port_id);
+void chamelium_fire_hpd_pulse_rpc(struct igt_chamelium_rpc *chamelium, chamelium_port_id port_id,
+				  int deassert_interval_usec, int assert_interval_usec,
+				  int repeat_count, int end_level);
+void chamelium_fire_mixed_hpd_pulses_rpc(struct igt_chamelium_rpc *chamelium,
+					 chamelium_port_id port_id, int *widths_msec,
+					 size_t widths_msec_count);
+void chamelium_schedule_hpd_toggle_rpc(struct igt_chamelium_rpc *chamelium,
+				       chamelium_port_id port_id, int delay_ms, bool end_level);
+bool chamelium_port_wait_video_input_stable_rpc(struct igt_chamelium_rpc *chamelium,
+						chamelium_port_id port_id, int timeout_secs);
+bool chamelium_is_pysical_plugged_rpc(struct igt_chamelium_rpc *chamelium,
+				      chamelium_port_id port_id);
+const chamelium_port_id *chamelium_probe_ports_rpc(struct igt_chamelium_rpc *chamelium);
+void chamelium_port_get_resolution_rpc(struct igt_chamelium_rpc *chamelium,
+				       chamelium_port_id port_id, int *x, int *y);
+void chamelium_capture_video_rpc(struct igt_chamelium_rpc *chamelium, chamelium_port_id port_id,
+				 int frame_count);
+void chamelium_port_get_captured_resolution_rpc(struct igt_chamelium_rpc *chamelium, int *width,
+						int *height);
+void chamelium_get_captured_frame_metadata_rpc(struct igt_chamelium_rpc *chamelium,
+					       unsigned int index, int *width, int *height,
+					       double *timestamp, chamelium_port_id *port_id,
+					       int *sequence, size_t *size);
+struct igt_chamelium_rpc_frame_dump *
+chamelium_read_captured_frame_rpc(struct igt_chamelium_rpc *chamelium, unsigned int index);
+void chamelium_port_get_video_params_rpc(struct igt_chamelium_rpc *chamelium,
+					 chamelium_port_id port_id,
+					 struct igt_chamelium_rpc_video_params *params);
+bool chamelium_has_audio_board_rpc(struct igt_chamelium_rpc *chamelium);
 
 #endif //V3_IGT_CHAMELIUM_H

-- 
2.43.2

