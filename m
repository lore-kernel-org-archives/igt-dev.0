Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657D5C3DA4B
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8F410E5CF;
	Tue,  9 Jul 2024 15:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hPghLcpc";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA2A10E5A6
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:35:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 154192001B;
 Tue,  9 Jul 2024 15:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i6LhT1oQ2nLD4mCQvGKJHZ1wR1hNlw99ZUP+a7YYa1s=;
 b=hPghLcpcKUu46h9AxsA7h+22FHtXcVHHlaMGvFO6pbSz4EIWSWiSMr15rlgWb3kC9gDiVP
 I7a1dz15EbyVZ9d1D7HN88mi5JC0tK7GlM9sR3ocSvx0G93rV4YBQddEpYcrB9EGw5RsPz
 Hkm8trjhXVhLN42pjBZCrtgxPOdqwK8YEgCZoFfK7IK1HHDvlg+LxpwV9Fj9UI9bNYW9YE
 82FoWzYwj5EvvRzt6098KGu4MSM+3BczTvQP1rBO14zZCssAZonEJnpCq/MptLYzGYlDQn
 Uua8NqoPFlKbra/99inTyMYDDJDsNpn1b0ouTToTW6/frX3DeDjIQ9qrw0v3pA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:45 +0200
Subject: [PATCH i-g-t v2 29/39] lib/chamelium/v3: Implement Chamelium port
 autodetection algorithm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-29-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=15009;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=fxmS7P6IK2qaYqpgmd4zXpGy1hr/g4WqrpjyE2lFjvk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViZIjJKl8GqL7wYIKQefUzd21pj5Z4rA3UOB
 YxlbDzTSceJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YmQAKCRAgrS7GWxAs
 4oqfEACtv751/oecUJzKAZCQ5fS8+S+0SImfXbn32b/NRnDPxD4fZmdMv3oKgaltwyDtHLnd6lq
 DsIqE4OsGJ/hg/ov0ryYxiSseZ+Zm9ZRUDktyH1OTvv35kTvGUJTrJxUypHAri9TuzRbyxewe2X
 tc5WveSCyXW7zW7F1s1Y6Y17Er4nc8ocZAyVDdgeG6cSaaxzmJpOEN46owNh8XR/QUQaT24D2tP
 zSmJR8yMA4TZbUbTs2UwoMMldbLZsnvK20FLNbwkfGa0zXbzhgChAbsNTO4K1SdZam1wGA5+yyV
 +KhnqVlFeWNhsoD0WsuPjGx3Gx+KyY+Uk9Ymp4RQJez2qGQz6a+D7bdj6iFQOSqKW4ugInyN9vC
 u9RpgKIJfmP22tTxiShnaJ5Zw7MMLk1mnJoajf8rBCfQZ+0MVs4LzuZ8OfyuuJBHNtcOuJC3pHL
 aCyr91LAHfZW0P4Jf+W6xzYbrXRgrv3SP15p3a04YqyPOFOo+4Xi+exdutluUp6XKHGUvBucGgL
 1BX12B05x0n2iSCsrFw5vLLwdkaeB+jReJHdSD2upl1uJDm48xAYTVnlWJWiRcSNJtDQdLwIoQN
 wvK4JKVItbe1xbQ+nAGRF7b1yZt+OtARhTmNDiunTjQQKkOmmbrv+dhhorrnTngyK10GV1/vo4s
 VGlbLaAob/s6xLg==
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

To streamline the usage of Chamelium, this commit introduces an
autodetection algorithm. Please note that the algorithm may be somewhat
slow, as it needs to identify each port individually.

Note for future contributors: As of now, the RPC call IsPhysicalConnected
is known to be broken. Although it could potentially avoid testing all
ports, it cannot be used at this time.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/chamelium/v3/igt_chamelium.c | 348 ++++++++++++++++++++++++++++++++++++++-
 lib/chamelium/v3/igt_chamelium.h |   2 +-
 lib/igt_kms.c                    |   2 +-
 3 files changed, 349 insertions(+), 3 deletions(-)

diff --git a/lib/chamelium/v3/igt_chamelium.c b/lib/chamelium/v3/igt_chamelium.c
index 736e593a465e..e5810e06dbc6 100644
--- a/lib/chamelium/v3/igt_chamelium.c
+++ b/lib/chamelium/v3/igt_chamelium.c
@@ -7,6 +7,7 @@
 #include "igt_core.h"
 #include "igt_kms.h"
 #include "igt_rc.h"
+#include "igt_kms.h"
 
 #define CHAMELIUM_CONFIG_SECTION "Chameliumv3"
 #define CHAMELIUM_CONFIG_URL "URL"
@@ -341,6 +342,330 @@ static void chamelium_v3_port_mapping_info_list(struct igt_list_head *head)
 	}
 }
 
+/**
+ * list_contains() - Search an element in the list
+ *
+ * @list: Pointer to the list to search into
+ * @list_len: Length of the list
+ * @value: Value to search in the list
+ *
+ * Returns true if @list contains @value
+ */
+static bool list_contains(const uint32_t *list, int list_len, uint32_t value)
+{
+	igt_assert(list);
+	for (int i = 0; i < list_len; i++) {
+		if (list[i] == value)
+			return true;
+	}
+	return false;
+}
+
+/**
+ * get_list_diff() - Compute and return the difference between two lists
+ *
+ * @list_a: Pointer to the first list to compare
+ * @list_a_len: Length of the first list
+ * @list_b: Pointer to the second list to compare
+ * @list_b_len: Length of the second list
+ * @diff: Out pointer for the difference. Can be null to only count new elements.
+ *
+ * Returns the number of element which are in @list_a but not in @list_b.
+ */
+static int
+get_list_diff(const uint32_t *list_a, int list_a_len, const uint32_t *list_b, int list_b_len,
+	      uint32_t **diff)
+{
+	int diff_len = 0;
+
+	igt_assert(list_a);
+	igt_assert(list_b);
+
+	if (diff)
+		*diff = malloc(0);
+
+	for (int i = 0; i < list_a_len; i++) {
+		if (!list_contains(list_b, list_b_len, list_a[i])) {
+			if (diff) {
+				*diff = reallocarray(*diff, diff_len + 1, sizeof(**diff));
+				igt_assert(*diff);
+				(*diff)[diff_len] = list_a[i];
+			}
+
+			diff_len++;
+		}
+	}
+
+	return diff_len;
+}
+
+/**
+ * chamelium_v3_wait_for_new_connectors() - Wait for new connector to appear
+ *
+ * @list_a: Pointer to the first list to compare
+ * @list_a_len: Length of the first list
+ * @list_b: Pointer to the second list to compare
+ * @list_b_len: Length of the second list
+ * @diff: Out pointer for the difference. Can be null.
+ *
+ * Returns the number of element which differ between the two lists.
+ */
+static int chamelium_v3_wait_for_new_connectors(uint32_t **newly_connected,
+						const uint32_t *already_connected,
+						int already_connected_count, int drm_fd)
+{
+	int newly_connected_count;
+	struct timespec start, end;
+
+	igt_assert(newly_connected);
+	igt_assert(already_connected);
+	igt_assert(drm_fd);
+
+	clock_gettime(CLOCK_MONOTONIC, &start);
+	clock_gettime(CLOCK_MONOTONIC, &end);
+	do {
+		if (*newly_connected)
+			free(*newly_connected);
+		newly_connected_count = igt_get_connected_connectors(drm_fd, newly_connected);
+		clock_gettime(CLOCK_MONOTONIC, &end);
+	} while (get_list_diff(*newly_connected, newly_connected_count,
+			       already_connected, already_connected_count,
+			       NULL) == 0 &&
+		 igt_time_elapsed(&start, &end) <= igt_default_detect_timeout());
+
+	return newly_connected_count;
+}
+
+/**
+ * chamelium_v3_autodetect_non_mst_port() - Attempt to detect a port without MST
+ *
+ * @chamelium: Chamelium to use
+ * @drm_fd: drm file descriptor used to get the connected connectors
+ * @port: Chamlium port to use
+ *
+ * It will plug the chamelium @port and attempt to find a newly connected connector in DRM. It will
+ * add this mapping in the chamelium structure.
+ */
+static void
+chamelium_v3_autodetect_non_mst_port(struct igt_chamelium_v3 *chamelium, int drm_fd,
+				     chamelium_v3_port_id port)
+{
+	int newly_connected_count, already_connected_count, diff_len;
+	uint32_t *newly_connected = NULL, *already_connected = NULL;
+	struct chamelium_v3_port_mapping *mapping;
+	drmModeConnectorPtr connector;
+	char *port_name;
+	uint32_t *diff = NULL;
+
+	port_name = chamelium_v3_get_port_name(chamelium, port);
+	chamelium_v3_reset(chamelium);
+
+	/*
+	 * Hard sleep is required here as we don't know how long it will take for the device under
+	 * test to properly detect the port disconnection.
+	 */
+	sleep(igt_default_detect_timeout());
+
+	already_connected_count = igt_get_connected_connectors(drm_fd, &already_connected);
+
+	chamelium_v3_apply_edid(chamelium, port, 0);
+	chamelium_v3_plug(chamelium, port);
+
+	newly_connected_count = chamelium_v3_wait_for_new_connectors(&newly_connected,
+								     already_connected,
+								     already_connected_count,
+								     drm_fd);
+
+	diff_len = get_list_diff(newly_connected, newly_connected_count,
+				 already_connected, already_connected_count, &diff);
+
+	if (diff_len == 0) {
+		igt_info("\t\t\tNo newly connected connector, assuming this port is not connected.\n");
+	} else if (diff_len > 1) {
+		igt_info("\t\t\tMore than one new connectors connected, this is not supported by autodetection.\n");
+	} else {
+		igt_info("\t\t\tFound one connector (%d) connected to the port %d (%s)\n", diff[0],
+			 port, port_name);
+
+		connector = drmModeGetConnector(drm_fd, diff[0]);
+		igt_assert(connector);
+		mapping = chamelium_v3_port_mapping_alloc();
+		mapping->port_id = port;
+		igt_assert(asprintf(&mapping->connector_name, "%s-%u",
+				    kmstest_connector_type_str(connector->connector_type),
+				    connector->connector_type_id) != -1);
+		igt_list_add(&mapping->link, &chamelium->port_mapping);
+		drmModeFreeConnector(connector);
+	}
+
+	free(already_connected);
+	free(newly_connected);
+	free(diff);
+	free(port_name);
+}
+
+/**
+ * chamelium_v3_autodetect_mst_children_port() - Attempt to find the mapping between a children port
+ *	and a MST path
+ *
+ * @chamelium: Chamelium to use
+ * @drm_fd: drm file descriptor to detect the connector
+ * @port: parent port of the children port
+ * @children: children port
+ *
+ * It will plug the chamelium @port and @children and attempt to find a newly connected connector in
+ * DRM. It will add this mapping in the chamelium structure.
+ */
+static void
+chamelium_v3_autodetect_mst_children_port(struct igt_chamelium_v3 *chamelium, int drm_fd,
+					  chamelium_v3_port_id port, chamelium_v3_port_id children)
+{
+	struct chamelium_v3_port_mapping *mapping;
+	drmModePropertyBlobPtr path_blob;
+	struct timespec start, end;
+	uint32_t *newly_connected = NULL;
+	char *port_name;
+
+	igt_assert(chamelium);
+	igt_assert(drm_fd);
+
+	port_name = chamelium_v3_get_port_name(chamelium, children);
+	chamelium_v3_reset(chamelium);
+	chamelium_v3_apply_edid(chamelium, port, 0);
+	chamelium_v3_apply_edid(chamelium, children, 0);
+	chamelium_v3_plug_with_children(chamelium, port, &children, 1);
+
+	/*
+	 * Waiting for a connector not already in the mappings
+	 */
+	clock_gettime(CLOCK_MONOTONIC, &start);
+	clock_gettime(CLOCK_MONOTONIC, &end);
+	while (igt_time_elapsed(&start, &end) <= igt_default_detect_timeout()) {
+		if (newly_connected)
+			free(newly_connected);
+
+		for (int i = 0; i < igt_get_connected_connectors(drm_fd, &newly_connected); i++) {
+			path_blob = kmstest_get_path_blob(drm_fd, newly_connected[i]);
+
+			if (path_blob) {
+				struct chamelium_v3_port_mapping *tmp, *pos;
+				bool found = false;
+
+				igt_list_for_each_entry_safe(pos, tmp, &chamelium->port_mapping,
+							     link) {
+					if (strcmp((const char *)path_blob->data, pos->mst_path)
+					    == 0) {
+						found = true;
+					}
+				}
+				if (!found) {
+					igt_info("\t\t\tFound one children connector (%d) connected to the port %d (%s)\n",
+						 newly_connected[i], children, port_name);
+
+					mapping = chamelium_v3_port_mapping_alloc();
+					mapping->port_id = children;
+					mapping->is_children = true;
+					mapping->parent_id = port;
+					mapping->mst_path = strndup(path_blob->data,
+								    path_blob->length);
+					drmModeFreePropertyBlob(path_blob);
+					igt_list_add(&mapping->link, &chamelium->port_mapping);
+					free(port_name);
+					return;
+				}
+				drmModeFreePropertyBlob(path_blob);
+			}
+		}
+
+		clock_gettime(CLOCK_MONOTONIC, &end);
+	}
+	free(port_name);
+}
+
+/**
+ * chamelium_v3_autodetect_mst_children_port() - Attempt to find the mapping between a MST port, its
+ *	children and their MST path
+ *
+ * @chamelium: Chamelium to use
+ * @drm_fd: drm file descriptor to detect the connector
+ * @port: MST port
+ *
+ * It will plug the chamelium @port and its children and attempt to find a mapping between them and
+ * a drm connector. It will add this mapping in the chamelium structure.
+ */
+static void
+chamelium_v3_autodetect_mst_port(struct igt_chamelium_v3 *chamelium, int drm_fd,
+				 chamelium_v3_port_id port)
+{
+	int already_connected_count, newly_connected_count;
+	uint32_t *already_connected = NULL, *newly_connected = NULL;
+	chamelium_v3_port_id *children_ports = NULL;
+	struct chamelium_v3_port_mapping *mapping;
+	int diff_len, children_port_count;
+	drmModePropertyBlobPtr path_blob;
+	char *port_name;
+	uint32_t *diff = NULL;
+
+	port_name = chamelium_v3_get_port_name(chamelium, port);
+	chamelium_v3_reset(chamelium);
+
+	/*
+	 * Hard sleep is required here as we don't know how long it will take for the device under
+	 * test to properly detect the port disconnection.
+	 */
+	sleep(igt_default_detect_timeout());
+
+	already_connected_count = igt_get_connected_connectors(drm_fd, &already_connected);
+
+	chamelium_v3_apply_edid(chamelium, port, 0);
+	chamelium_v3_plug(chamelium, port);
+
+	newly_connected_count = chamelium_v3_wait_for_new_connectors(&newly_connected,
+								     already_connected,
+								     already_connected_count,
+								     drm_fd);
+
+	diff_len = get_list_diff(newly_connected, newly_connected_count,
+				 already_connected, already_connected_count,
+				 &diff);
+
+	if (diff_len == 0) {
+		igt_info("\t\t\tNo newly connected connector, assuming this port is not connected.\n");
+	} else if (diff_len > 1) {
+		igt_info("\t\t\tMore than one new connectors connected, this is not supported by autodetection.\n");
+	} else {
+		igt_info("\t\t\tFound one connector (%d) connected to the port %d (%s). Autodetecting MST children...\n",
+			 diff[0], port, port_name);
+		path_blob = kmstest_get_path_blob(drm_fd, diff[0]);
+
+		if (path_blob) {
+			mapping = chamelium_v3_port_mapping_alloc();
+			mapping->port_id = port;
+			mapping->is_children = false;
+			mapping->mst_path = strndup(path_blob->data, path_blob->length);
+			drmModeFreePropertyBlob(path_blob);
+			igt_list_add(&mapping->link, &chamelium->port_mapping);
+
+			children_port_count = chamelium_v3_get_children(chamelium, port,
+									&children_ports);
+
+			for (int i = 0; i < children_port_count; i++) {
+				chamelium_v3_autodetect_mst_children_port(chamelium, drm_fd, port,
+									  children_ports[i]);
+			}
+
+			free(children_ports);
+		} else {
+			igt_info("\t\t\tNo PATH blob found for this connector. Assuming this DUT does not support MST and skip this port.\n");
+		}
+	}
+
+	free(already_connected);
+	free(newly_connected);
+	free(diff);
+	free(port_name);
+}
+
 /**
  * chamelium_v3_fill_port_mapping() - Read the configuration file and fill the port_mapping
  *	structure.
@@ -350,7 +675,7 @@ static void chamelium_v3_port_mapping_info_list(struct igt_list_head *head)
  * It will read the configuration file searching for a Cv3 configuration. If this configuration does
  * not exist or is empty, it will try to read a Cv2 configuration.
  */
-void chamelium_v3_fill_port_mapping(struct igt_chamelium_v3 *chamelium)
+void chamelium_v3_fill_port_mapping(struct igt_chamelium_v3 *chamelium, int drm_fd)
 {
 	if (igt_key_file) {
 		chamelium_v3_fill_port_mapping_from_config_v3(chamelium);
@@ -358,6 +683,27 @@ void chamelium_v3_fill_port_mapping(struct igt_chamelium_v3 *chamelium)
 			chamelium_v3_fill_port_mapping_from_config_v2(chamelium);
 	}
 
+	if (igt_list_empty(&chamelium->port_mapping)) {
+		chamelium_v3_port_id *ports;
+		char *port_name;
+		int port_count;
+
+		igt_info("Chamelium configuration empty, autodetecting...\n");
+		igt_info("\tAutodetect ports:\n");
+		ports = NULL;
+		port_count = chamelium_v3_get_supported_ports(chamelium, &ports);
+		for (int i = 0; i < port_count; i++) {
+			port_name = chamelium_v3_get_port_name(chamelium, ports[i]);
+			igt_info("\t\tAutodetect port %d (%s)...\n", ports[i], port_name);
+			if (!chamelium_v3_is_mst(chamelium, ports[i]))
+				chamelium_v3_autodetect_non_mst_port(chamelium, drm_fd, ports[i]);
+			else
+				chamelium_v3_autodetect_mst_port(chamelium, drm_fd, ports[i]);
+			free(port_name);
+		}
+		free(ports);
+	}
+
 	chamelium_v3_port_mapping_info_list(&chamelium->port_mapping);
 }
 
diff --git a/lib/chamelium/v3/igt_chamelium.h b/lib/chamelium/v3/igt_chamelium.h
index 834f446f4317..0d2e481f6cca 100644
--- a/lib/chamelium/v3/igt_chamelium.h
+++ b/lib/chamelium/v3/igt_chamelium.h
@@ -51,7 +51,7 @@ struct chamelium_v3_port_mapping {
 struct igt_chamelium_v3 *chamelium_v3_init(char *url);
 struct igt_chamelium_v3 *chamelium_v3_init_from_config(void);
 
-void chamelium_v3_fill_port_mapping(struct igt_chamelium_v3 *chamelium);
+void chamelium_v3_fill_port_mapping(struct igt_chamelium_v3 *chamelium, int drm_fd);
 struct igt_list_head *chamelium_v3_get_port_mapping(struct igt_chamelium_v3 *chamelium);
 struct chamelium_v3_port_mapping *
 chamelium_v3_get_port_mapping_for_chamelium_port_id(struct igt_chamelium_v3 *chamelium,
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a30bb483594c..974d9c5f02e7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2910,7 +2910,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 			struct chamelium_v3_port_mapping *mapping, *tmp;
 
 			chamelium_v3_reset(chamelium);
-			chamelium_v3_fill_port_mapping(chamelium);
+			chamelium_v3_fill_port_mapping(chamelium, drm_fd);
 
 			igt_list_for_each_entry_safe(mapping, tmp,
 						     chamelium_v3_get_port_mapping(chamelium),

-- 
2.44.2

