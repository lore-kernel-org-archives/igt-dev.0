Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D1E89ADC
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Dec 2019 10:51:06 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Thu, 26 Dec 2019 16:20:21 +0530
Message-Id: <1577357423-6663-2-git-send-email-kunal1.joshi@intel.com>
In-Reply-To: <1577357423-6663-1-git-send-email-kunal1.joshi@intel.com>
References: <1577357423-6663-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/3] Make basic chamelium function
 accessible to other tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

There are many uses cases where we can integrate chamelium with other 
tests,Migrating basic chamelium functions to igt_chamelium lib to avoid
code rewriting.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 lib/igt_chamelium.c   | 50 ++++++++++++++++++++++++++++++++++++++++
 lib/igt_chamelium.h   | 20 ++++++++++++++++
 tests/kms_chamelium.c | 64 +--------------------------------------------------
 3 files changed, 71 insertions(+), 63 deletions(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index 9971f51..29949bb 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -132,6 +132,56 @@ static struct chamelium *cleanup_instance;
 static void chamelium_do_calculate_fb_crc(cairo_surface_t *fb_surface,
 					  igt_crc_t *out);
 
+drmModeConnection
+reprobe_connector(struct data_chamelium_t *data, struct chamelium_port *port)
+{
+	drmModeConnector *connector;
+	drmModeConnection status;
+
+	igt_debug("Reprobing %s...\n", chamelium_port_get_name(port));
+	connector = chamelium_port_get_connector(data->chamelium, port, true);
+	igt_assert(connector);
+	status = connector->connection;
+
+	drmModeFreeConnector(connector);
+	return status;
+}
+
+const char *connection_str(drmModeConnection c)
+{
+	switch (c) {
+	case DRM_MODE_CONNECTED:
+		return "connected";
+	case DRM_MODE_DISCONNECTED:
+		return "disconnected";
+	case DRM_MODE_UNKNOWNCONNECTION:
+		return "unknown";
+	}
+	assert(0); /* unreachable */
+}
+
+void
+wait_for_connector(struct data_chamelium_t *data, struct chamelium_port *port,
+		   drmModeConnection status)
+{
+	igt_debug("Waiting for %s to get %s...\n",
+		chamelium_port_get_name(port), connection_str(status));
+
+	/*
+	 * Rely on simple reprobing so we don't fail tests that don't require
+	 * that hpd events work in the event that hpd doesn't work on the system
+	 */
+	igt_until_timeout(HOTPLUG_TIMEOUT) {
+	if (reprobe_connector(data, port) == status)
+		return;
+
+	usleep(50000);
+
+	}
+	igt_assert_f(false, "Timed out waiting for %s to get %s\n",
+		chamelium_port_get_name(port), connection_str(status));
+}
+
 /**
  * chamelium_get_ports:
  * @chamelium: The Chamelium instance to use
diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
index 08705a9..3ce78a2 100644
--- a/lib/igt_chamelium.h
+++ b/lib/igt_chamelium.h
@@ -25,6 +25,8 @@
 
 #ifndef IGT_CHAMELIUM_H
 #define IGT_CHAMELIUM_H
+#define TEST_EDID_COUNT 2
+#define HOTPLUG_TIMEOUT 20
 
 #include "config.h"
 
@@ -32,6 +34,7 @@
 #include <xf86drmMode.h>
 
 #include "igt_debugfs.h"
+#include "igt_kms.h"
 
 struct igt_fb;
 struct edid;
@@ -81,6 +84,17 @@ struct chamelium_infoframe {
 
 struct chamelium_edid;
 
+struct data_chamelium_t {
+	struct chamelium *chamelium;
+	struct chamelium_port **ports;
+	igt_display_t display;
+	int port_count;
+
+	int drm_fd;
+
+	struct chamelium_edid *edids[TEST_EDID_COUNT];
+};
+
 /**
  * CHAMELIUM_MAX_PORTS: the maximum number of ports supported by igt_chamelium.
  *
@@ -210,4 +224,10 @@ void chamelium_destroy_frame_dump(struct chamelium_frame_dump *dump);
 void chamelium_destroy_audio_file(struct chamelium_audio_file *audio_file);
 void chamelium_infoframe_destroy(struct chamelium_infoframe *infoframe);
 
+drmModeConnection
+reprobe_connector(struct data_chamelium_t *data, struct chamelium_port *port);
+const char *connection_str(drmModeConnection c);
+void
+wait_for_connector(struct data_chamelium_t *data, struct chamelium_port *port,
+		   drmModeConnection status);
 #endif /* IGT_CHAMELIUM_H */
diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
index 5c4a189..da2037b 100644
--- a/tests/kms_chamelium.c
+++ b/tests/kms_chamelium.c
@@ -43,20 +43,9 @@ enum test_edid {
 	TEST_EDID_DP_AUDIO,
 	TEST_EDID_ASPECT_RATIO,
 };
-#define TEST_EDID_COUNT 5
 
-typedef struct {
-	struct chamelium *chamelium;
-	struct chamelium_port **ports;
-	igt_display_t display;
-	int port_count;
-
-	int drm_fd;
+typedef struct data_chamelium_t data_t;
 
-	struct chamelium_edid *edids[TEST_EDID_COUNT];
-} data_t;
-
-#define HOTPLUG_TIMEOUT 20 /* seconds */
 #define ONLINE_TIMEOUT 20 /* seconds */
 
 #define HPD_STORM_PULSE_INTERVAL_DP 100 /* ms */
@@ -106,57 +95,6 @@ require_connector_present(data_t *data, unsigned int type)
 		      kmstest_connector_type_str(type));
 }
 
-static drmModeConnection
-reprobe_connector(data_t *data, struct chamelium_port *port)
-{
-	drmModeConnector *connector;
-	drmModeConnection status;
-
-	igt_debug("Reprobing %s...\n", chamelium_port_get_name(port));
-	connector = chamelium_port_get_connector(data->chamelium, port, true);
-	igt_assert(connector);
-	status = connector->connection;
-
-	drmModeFreeConnector(connector);
-	return status;
-}
-
-static const char *connection_str(drmModeConnection c)
-{
-	switch (c) {
-	case DRM_MODE_CONNECTED:
-		return "connected";
-	case DRM_MODE_DISCONNECTED:
-		return "disconnected";
-	case DRM_MODE_UNKNOWNCONNECTION:
-		return "unknown";
-	}
-	assert(0); /* unreachable */
-}
-
-static void
-wait_for_connector(data_t *data, struct chamelium_port *port,
-		   drmModeConnection status)
-{
-	igt_debug("Waiting for %s to get %s...\n",
-		  chamelium_port_get_name(port), connection_str(status));
-
-	/*
-	 * Rely on simple reprobing so we don't fail tests that don't require
-	 * that hpd events work in the event that hpd doesn't work on the system
-	 */
-	igt_until_timeout(HOTPLUG_TIMEOUT) {
-		if (reprobe_connector(data, port) == status) {
-			return;
-		}
-
-		usleep(50000);
-	}
-
-	igt_assert_f(false, "Timed out waiting for %s to get %s\n",
-		  chamelium_port_get_name(port), connection_str(status));
-}
-
 static int chamelium_vga_modes[][2] = {
 	{ 1600, 1200 },
 	{ 1920, 1200 },
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
