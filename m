Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1E48F15F
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Jul 2022 15:19:50 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id h22so13555979qta.3
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Jul 2022 08:19:50 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: igt-dev@lists.freedesktop.org
Date: Wed, 20 Jul 2022 11:19:40 -0400
Message-Id: <20220720151940.12723-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] lib/chamelium: Support MST connectors on reprobe
 by using connector name
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, petri.latvala@intel.com, ihf@google.com,
 amstan@chromium.org, seanpaul@chromium.org, khaled.almahallawy@intel.com,
 markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[Why]
On unplug, a lone MST connector can become invalid and disappear from
the list of DRM connectors.
When this happens, we can't check for the connector ID as it's no longer
there to check.
Hence, a connector disappearance indicates a disconnect.

Furthermore, on a replug, the connector ID can change as well. The only
thing that remains unchageable is the connector name.

[How]
Do not check for connector connetion state using the connector ID.
Iterate through the current connectors and match with the name.
If a connector disappeared, this means it's now disconnected.
If it's there, return its connection status.
Update the port connector ID with the current connector ID in case it
changed on a replug.

Tested on Volteer with Chamelium V3 connected via a 2-DP-port CableMatters
hub.
Test: kms_chamelium --run-subtest dp-hpd

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 lib/igt_chamelium.c | 52 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 45 insertions(+), 7 deletions(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index d78ddd61..b5e9bbfd 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -266,21 +266,59 @@ chamelium_reprobe_connector(igt_display_t *display,
 			    struct chamelium_port *port)
 {
 	drmModeConnector *connector;
-	drmModeConnection status;
+	drmModeConnection connection_status;
 	igt_output_t *output;
+	drmModeRes* res = drmModeGetResources(display->drm_fd);
+	bool is_connector_found = false;
+	int i;
 
 	igt_debug("Reprobing %s...\n", chamelium_port_get_name(port));
-	connector = chamelium_port_get_connector(chamelium, port, true);
+	for (i = 0; i < res->count_connectors; ++i) {
+		connector = drmModeGetConnector(display->drm_fd, res->connectors[i]);
+		/* If the connector is MST and is now unplugged, the spawned connectors will no
+		   longer be available but can still be counted as part of res->count_connectors */
+		if (!connector) {
+			drmModeFreeConnector(connector);
+			connector = NULL;
+			continue;
+		}
+
+		char connector_name[50];
+		snprintf(connector_name, 50, "%s-%u",
+			kmstest_connector_type_str(connector->connector_type),
+			connector->connector_type_id);
+		if (strcmp(connector_name, port->name) == 0) {
+			is_connector_found = true;
+			break;
+		}
+
+		drmModeFreeConnector(connector);
+		connector = NULL;
+	}
+	drmModeFreeResources(res);
+
+	if (!is_connector_found) {
+		igt_debug("Connector is not found. This indicates it's disconnected.\n");
+		igt_assert(!connector);
+		return DRM_MODE_DISCONNECTED;
+	}
+
 	igt_assert(connector);
-	status = connector->connection;
+	connection_status = connector->connection;
 
-	/* let's make sure that igt_display is up to date too */
+	/* If we still have a connector, let's make sure that igt_display and the port are up to date too */
 	output = igt_output_from_connector(display, connector);
-	output->force_reprobe = true;
-	igt_output_refresh(output);
+	if (output) {
+		output->force_reprobe = true;
+		igt_output_refresh(output);
+	}
+
+	/* If the topology of the connector is MST, the connector ID could have changed. Update the
+	   chamelium port to the current connector ID. */
+	port->connector_id = connector->connector_id;
 
 	drmModeFreeConnector(connector);
-	return status;
+	return connection_status;
 }
 
 /**
-- 
2.37.0.170.g444d1eabd0-goog
