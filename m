Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E872389DFB
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2020 08:49:29 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Mon, 23 Mar 2020 10:48:28 +0200
Message-Id: <20200323084828.20695-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_chamelium: Fix waiting for
 hotplug uevents
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
List-ID: <igt-dev@lists.freedesktop.org>

The driver can emit multiple hotplug events in response to a hotplug
interrupt, which may cause tests fail receiving a spurious early hotplug
event and concluding that an expected state didn't get set. Let's use
Arek's idea and wait for multiple hotplug events - with the current 20s
timeout - rechecking if the expected state got set after each hotplug.

The reasons for multiple hotplug events I noticed are:
- Both a get connector IOCTL and an HPD interrupt can generate a hotplug
  event.
- Resetting chamelium results in an intermittent state where HPD gets
  asserted, generating a hotplug connect uevent, then HPD gets
  deasserted generating the expected hotplug disconnect uevent.

Suggested-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 tests/kms_chamelium.c | 83 ++++++++++++++++++++++++++-----------------
 1 file changed, 50 insertions(+), 33 deletions(-)

diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
index 3d0b429a9..665ff4c91 100644
--- a/tests/kms_chamelium.c
+++ b/tests/kms_chamelium.c
@@ -157,6 +157,51 @@ wait_for_connector(data_t *data, struct chamelium_port *port,
 		  chamelium_port_get_name(port), connection_str(status));
 }
 
+/* Wait for hotplug and return the remaining time left from timeout */
+static bool wait_for_hotplug(struct udev_monitor *mon, int *timeout)
+{
+	struct timespec start, end;
+	int elapsed;
+	bool detected;
+
+	igt_assert_eq(igt_gettime(&start), 0);
+	detected = igt_hotplug_detected(mon, *timeout);
+	igt_assert_eq(igt_gettime(&end), 0);
+
+	elapsed = igt_time_elapsed(&start, &end);
+	igt_assert_lte(0, elapsed);
+	*timeout = max(0, *timeout - elapsed);
+
+	return detected;
+}
+
+static void
+wait_for_connector_after_hotplug(data_t *data, struct udev_monitor *mon,
+				 struct chamelium_port *port,
+				 drmModeConnection status)
+{
+	int timeout = HOTPLUG_TIMEOUT;
+	int hotplug_count = 0;
+
+	igt_debug("Waiting for %s to get %s after a hotplug event...\n",
+		  chamelium_port_get_name(port), connection_str(status));
+
+	while (timeout > 0) {
+		if (!wait_for_hotplug(mon, &timeout))
+			break;
+
+		hotplug_count++;
+
+		if (reprobe_connector(data, port) == status)
+			return;
+	}
+
+	igt_assert_f(false, "Timed out waiting for %s to get %s after a hotplug. Current state %s hotplug_count %d\n",
+		  chamelium_port_get_name(port), connection_str(status),
+		  connection_str(reprobe_connector(data, port)), hotplug_count);
+}
+
+
 static int chamelium_vga_modes[][2] = {
 	{ 1600, 1200 },
 	{ 1920, 1200 },
@@ -250,7 +295,6 @@ test_basic_hotplug(data_t *data, struct chamelium_port *port, int toggle_count)
 {
 	struct udev_monitor *mon = igt_watch_hotplug();
 	int i;
-	drmModeConnection status;
 
 	reset_state(data, NULL);
 	igt_hpd_storm_set_threshold(data->drm_fd, 0);
@@ -260,25 +304,16 @@ test_basic_hotplug(data_t *data, struct chamelium_port *port, int toggle_count)
 
 		/* Check if we get a sysfs hotplug event */
 		chamelium_plug(data->chamelium, port);
-		igt_assert_f(igt_hotplug_detected(mon, HOTPLUG_TIMEOUT),
-			     "Timed out waiting for hotplug uevent\n");
-		status = reprobe_connector(data, port);
-		igt_assert_f(status == DRM_MODE_CONNECTED,
-			     "Invalid connector status after hotplug: "
-			     "got %s, expected connected\n",
-			     connection_str(status));
 
+		wait_for_connector_after_hotplug(data, mon, port,
+						 DRM_MODE_CONNECTED);
 		igt_flush_hotplugs(mon);
 
 		/* Now check if we get a hotplug from disconnection */
 		chamelium_unplug(data->chamelium, port);
-		igt_assert_f(igt_hotplug_detected(mon, HOTPLUG_TIMEOUT),
-			     "Timed out waiting for unplug uevent\n");
-		status = reprobe_connector(data, port);
-		igt_assert_f(status == DRM_MODE_DISCONNECTED,
-			     "Invalid connector status after hotplug: "
-			     "got %s, expected disconnected\n",
-			     connection_str(status));
+
+		wait_for_connector_after_hotplug(data, mon, port,
+						 DRM_MODE_DISCONNECTED);
 	}
 
 	igt_cleanup_hotplug(mon);
@@ -328,24 +363,6 @@ test_edid_read(data_t *data, struct chamelium_port *port, enum test_edid edid)
 	drmModeFreeConnector(connector);
 }
 
-/* Wait for hotplug and return the remaining time left from timeout */
-static bool wait_for_hotplug(struct udev_monitor *mon, int *timeout)
-{
-	struct timespec start, end;
-	int elapsed;
-	bool detected;
-
-	igt_assert_eq(igt_gettime(&start), 0);
-	detected = igt_hotplug_detected(mon, *timeout);
-	igt_assert_eq(igt_gettime(&end), 0);
-
-	elapsed = igt_time_elapsed(&start, &end);
-	igt_assert_lte(0, elapsed);
-	*timeout = max(0, *timeout - elapsed);
-
-	return detected;
-}
-
 static void
 try_suspend_resume_hpd(data_t *data, struct chamelium_port *port,
 		       enum igt_suspend_state state, enum igt_suspend_test test,
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
