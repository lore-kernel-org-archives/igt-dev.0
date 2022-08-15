Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E39D3ABF
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Aug 2022 19:48:01 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id j6so6300620qkl.10
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Aug 2022 12:48:01 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: igt-dev@lists.freedesktop.org
Date: Mon, 15 Aug 2022 15:47:55 -0400
Message-Id: <20220815194755.1123655-1-markyacoub@chromium.org>
In-Reply-To: <20220720151940.12723-1-markyacoub@chromium.org>
References: <20220720151940.12723-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2] lib/chamelium: Use MST Path property to
 reprobe an MST connector.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[Why]
On replugs, MST connectors can change their names and IDs. The only
constant thing is their path property.

[How]
If a connector has a PATH prop, it's a MST connector.
On reprobe, look for MST connector with the same PATH prop.

Tested on Volteer with Chamelium V3 connected via a 2-DP-port CableMatters
hub.
Test: kms_chamelium --run-subtest dp-hpd

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 lib/igt_chamelium.c | 116 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 107 insertions(+), 9 deletions(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 7b790064..b2ce4174 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -105,6 +105,7 @@ struct chamelium_port {
 	int connector_id;
 	char *name;
 	bool adapter_allowed;
+	char *connector_path;
 };
 
 struct chamelium_frame_dump {
@@ -266,21 +267,97 @@ chamelium_reprobe_connector(igt_display_t *display,
 			    struct chamelium_port *port)
 {
 	drmModeConnector *connector;
-	drmModeConnection status;
+	drmModeConnection connection_status;
 	igt_output_t *output;
+	bool is_mst_port = !!port->connector_path;
 
 	igt_debug("Reprobing %s...\n", chamelium_port_get_name(port));
-	connector = chamelium_port_get_connector(chamelium, port, true);
+
+	if (is_mst_port)
+	{
+		int drm_fd = display->drm_fd;
+		drmModeRes *res = drmModeGetResources(drm_fd);
+		bool is_connector_found = false;
+		int i;
+
+		for (i = 0; i < res->count_connectors; ++i)
+		{
+			char connector_name[50];
+			uint64_t path_blob_id;
+			drmModePropertyBlobPtr path_blob = NULL;
+
+			connector = drmModeGetConnector(drm_fd, res->connectors[i]);
+			/* If the connector is now unplugged, the spawned connectors will no
+			   longer be available but can still be counted as part of
+			   res->count_connectors */
+			if (!connector)
+			{
+				drmModeFreeConnector(connector);
+				connector = NULL;
+				continue;
+			}
+
+			/* If the post is MST, it must have a path property - skip if not */
+			if (!kmstest_get_property(drm_fd, connector->connector_id,
+									  DRM_MODE_OBJECT_CONNECTOR, "PATH", NULL,
+									  &path_blob_id, NULL))
+			{
+				drmModeFreeConnector(connector);
+				connector = NULL;
+				continue;
+			}
+
+			igt_assert(path_blob =
+						   drmModeGetPropertyBlob(drm_fd, path_blob_id));
+			/* With MST, the only thing that is guaranteed to persist between
+			   plugs and unplugs is the PATH property. Verify that it matches
+			   what we previously saved. */
+			if (strcmp(path_blob->data, port->connector_path) == 0)
+			{
+				is_connector_found = true;
+				/* Update name and connector ID they can change between plugs and
+				   unplugs */
+				port->connector_id = connector->connector_id;
+				snprintf(connector_name, 50, "%s-%u",
+						 kmstest_connector_type_str(connector->connector_type),
+						 connector->connector_type_id);
+				port->name = strdup(connector_name);
+
+				drmModeFreePropertyBlob(path_blob);
+				break;
+			}
+
+			drmModeFreePropertyBlob(path_blob);
+			drmModeFreeConnector(connector);
+			connector = NULL;
+		}
+		drmModeFreeResources(res);
+
+		if (!is_connector_found)
+		{
+			igt_assert(!connector);
+			return DRM_MODE_DISCONNECTED;
+		}
+	}
+	else
+	{
+		connector = chamelium_port_get_connector(chamelium, port, true);
+	}
+
 	igt_assert(connector);
-	status = connector->connection;
+	connection_status = connector->connection;
 
-	/* let's make sure that igt_display is up to date too */
+	/* If we still have a connector, let's make sure that igt_display and
+	   the port are up to date too */
 	output = igt_output_from_connector(display, connector);
-	output->force_reprobe = true;
-	igt_output_refresh(output);
+	if (output)
+	{
+		output->force_reprobe = true;
+		igt_output_refresh(output);
+	}
 
 	drmModeFreeConnector(connector);
-	return status;
+	return connection_status;
 }
 
 /**
@@ -2272,6 +2349,23 @@ static size_t chamelium_get_video_ports(struct chamelium *chamelium,
 	return port_ids_len;
 }
 
+static void chamelium_set_port_path(struct chamelium_port *port,
+									uint32_t connector_id,
+									int drm_fd)
+{
+	uint64_t path_blob_id;
+	drmModePropertyBlobPtr path_blob = NULL;
+
+	if (kmstest_get_property(drm_fd, connector_id, DRM_MODE_OBJECT_CONNECTOR,
+							 "PATH", NULL, &path_blob_id, NULL))
+	{
+		igt_assert(path_blob = drmModeGetPropertyBlob(drm_fd, path_blob_id));
+		port->connector_path = strdup(path_blob->data);
+
+		drmModeFreePropertyBlob(path_blob);
+	}
+}
+
 static bool chamelium_read_port_mappings(struct chamelium *chamelium,
 					 int drm_fd)
 {
@@ -2345,6 +2439,9 @@ static bool chamelium_read_port_mappings(struct chamelium *chamelium,
 			if (strcmp(name, map_name) == 0)
 				port->connector_id = connector->connector_id;
 
+			chamelium_set_port_path(port, connector->connector_id,
+									drm_fd);
+
 			drmModeFreeConnector(connector);
 		}
 		if (!port->connector_id) {
@@ -2566,10 +2663,11 @@ static bool chamelium_autodiscover(struct chamelium *chamelium, int drm_fd)
 
 		connector = drmModeGetConnectorCurrent(drm_fd, conn_id);
 		snprintf(conn_name, sizeof(conn_name), "%s-%u",
-			 kmstest_connector_type_str(connector->connector_type),
-			 connector->connector_type_id);
+				 kmstest_connector_type_str(connector->connector_type),
+				 connector->connector_type_id);
 		drmModeFreeConnector(connector);
 		port->name = strdup(conn_name);
+		chamelium_set_port_path(port, port->connector_id, drm_fd);
 	}
 
 	elapsed_ns = igt_nsec_elapsed(&start);
-- 
2.37.1.595.g718a3a8f04-goog
