Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825896E966
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2020 19:58:54 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Fri, 29 May 2020 22:58:50 +0300
Message-Id: <20200529195850.8664-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/kms_chamelium: Wait for the sink to
 reconnect after an FSM DPMS-off
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

After Chamelium does an FSM signaling by deasserting its HPD, in
response to which the test's FSM handler disables the output with a
DPMS-off, we have to make sure that Chamelium has reasserted its HPD
before we re-enable the output with DPMS-on (for instance to avoid link
training errors, or enable the output in the wrong TypeC mode). To
ensure this wait for the connector state to become asserted.

On TypeC connectors with an enabled mode the IOM firmware will signal a
connected state (via a connect hotplug interrupt delivered to the
driver) in a deferred way only after the mode is disabled. So wait for
the connected state after DPMS-off.

Reported-and-tested-by: Kunal Joshi <kunal1.joshi@intel.com>
Cc: Hiler Arkadiusz <arkadiusz.hiler@intel.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_chamelium.c | 47 ++++++++++++++++++++++++++++++---------------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index ff4644f8f..ed92bc782 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -243,6 +243,35 @@ struct fsm_monitor_args {
 	struct udev_monitor *mon;
 };
 
+static bool wait_for_connected_state(int drm_fd,
+				     int *connectors, int connector_count)
+{
+	igt_assert(connector_count > 0);
+
+	igt_until_timeout(CHAMELIUM_HOTPLUG_DETECTION_DELAY) {
+		bool connected;
+
+		for (int i = 0; i < connector_count; i++) {
+			drmModeConnector *connector =
+				drmModeGetConnector(drm_fd, connectors[i]);
+
+			connected = connector->connection == DRM_MODE_CONNECTED;
+
+			drmModeFreeConnector(connector);
+
+			if (!connected)
+				break;
+		}
+
+		if (connected)
+			return true;
+
+		usleep(50000);
+	}
+
+	return false;
+}
+
 /*
  * Whenever resolutions or other factors change with the display output, the
  * Chamelium's display receivers need to be fully reset in order to perform any
@@ -272,6 +301,8 @@ static void *chamelium_fsm_mon(void *data)
 	connector = chamelium_port_get_connector(args->chamelium, args->port,
 						 false);
 	kmstest_set_connector_dpms(drm_fd, connector, DRM_MODE_DPMS_OFF);
+	wait_for_connected_state(drm_fd, &args->port->connector_id, 1);
+
 	kmstest_set_connector_dpms(drm_fd, connector, DRM_MODE_DPMS_ON);
 
 	drmModeFreeConnector(connector);
@@ -2560,7 +2591,6 @@ bool chamelium_wait_all_configured_ports_connected(struct chamelium *chamelium,
 	drmModeConnector *connector;
 	char **group_list;
 	char *group;
-	bool ret = true;
 
 	int connectors[CHAMELIUM_MAX_PORTS];
 	int connectors_count = 0;
@@ -2614,20 +2644,7 @@ bool chamelium_wait_all_configured_ports_connected(struct chamelium *chamelium,
 		return true;
 	}
 
-	igt_until_timeout(CHAMELIUM_HOTPLUG_DETECTION_DELAY) {
-		ret = true;
-		for (int i = 0; i < connectors_count; ++i) {
-			connector = drmModeGetConnector(drm_fd, connectors[i]);
-			if (connector->connection != DRM_MODE_CONNECTED)
-				ret = false;
-			drmModeFreeConnector(connector);
-		}
-
-		if (ret)
-			break;
-	}
-
-	return ret;
+	return wait_for_connected_state(drm_fd, connectors, connectors_count);
 }
 
 igt_constructor {
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
