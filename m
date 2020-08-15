Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C596E358
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Aug 2020 12:12:31 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
Date: Sat, 15 Aug 2020 10:46:35 +0530
Message-Id: <20200815051637.2719528-2-kunal1.joshi@intel.com>
In-Reply-To: <20200815051637.2719528-1-kunal1.joshi@intel.com>
References: <20200815051637.2719528-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 1/3] Make basic chamelium function
 accessible to other tests
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
To: igt-dev@lists.freedesktop.org, manasi.d.navare@intel.com, petri.latvala@intel.com
Cc: Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

There are many use case where we can integrate chamelium with other tests,
Migrating some of basic chamelium functions to igt_chamelium lib to avoid
Code rewriting.

v2: Moved one more function reset_state from tests/kms_chamelium to
lib/igt_chamelium.

v3: - Shifted disabling of modeset to igt_kms
    - Replace connection_str with kmstest_connector_status_str (Petri)
    - Generalized require__connector_present (Petri)
    - Avoided using data_chamelium_t struct (Petri)

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 lib/igt_chamelium.c   |  92 ++++++++++++++++++
 lib/igt_chamelium.h   |  33 +++++++
 lib/igt_kms.c         |  14 +++
 lib/igt_kms.h         |   1 +
 tests/kms_chamelium.c | 214 +++++++++++++++---------------------------
 5 files changed, 215 insertions(+), 139 deletions(-)

diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
index d9fab902..d55547db 100644
--- a/lib/igt_chamelium.c
+++ b/lib/igt_chamelium.c
@@ -218,6 +218,98 @@ const char *chamelium_port_get_name(struct chamelium_port *port)
 	return port->name;
 }
 
+void
+chamelium_require_connector_present(struct chamelium_port **ports,
+				    unsigned int type,
+				    int port_count,
+				    int count)
+{
+	int i;
+	int found = 0;
+
+	for (i = 0; i < port_count && !found; i++) {
+		if (chamelium_port_get_type(ports[i]) == type)
+			found++;
+	}
+
+	igt_require_f(found == count,
+		      "port of type %s found %d and required %d\n",
+		      kmstest_connector_type_str(type), found, count);
+}
+
+drmModeConnection
+chamelium_reprobe_connector(igt_display_t *display,
+			    struct chamelium *chamelium,
+			    struct chamelium_port *port)
+{
+	drmModeConnector *connector;
+	drmModeConnection status;
+	igt_output_t *output;
+
+	igt_debug("Reprobing %s...\n", chamelium_port_get_name(port));
+	connector = chamelium_port_get_connector(chamelium, port, true);
+	igt_assert(connector);
+	status = connector->connection;
+
+	/* let's make sure that igt_display is up to date too */
+	output = igt_output_from_connector(display, connector);
+	output->force_reprobe = true;
+	igt_output_refresh(output);
+
+	drmModeFreeConnector(connector);
+	return status;
+}
+
+void
+chamelium_wait_for_connector(igt_display_t *display,
+			     struct chamelium *chamelium,
+			     struct chamelium_port *port,
+			     drmModeConnection status)
+{
+	igt_debug("Waiting for %s to get %s...\n",
+			  chamelium_port_get_name(port),
+			  kmstest_connector_status_str(status));
+
+	/*
+	 * Rely on simple reprobing so we don't fail tests that don't require
+	 * that hpd events work in the event that hpd doesn't work on the system
+	 */
+	igt_until_timeout(HOTPLUG_TIMEOUT) {
+		if (chamelium_reprobe_connector(display,
+						chamelium, port) == status)
+			return;
+
+		usleep(50000);
+	}
+
+	igt_assert_f(false, "Timed out waiting for %s to get %s\n",
+				 chamelium_port_get_name(port),
+				 kmstest_connector_status_str(status));
+}
+
+void
+chamelium_reset_state(igt_display_t *display,
+		      struct chamelium *chamelium,
+		      struct chamelium_port *port,
+		      struct chamelium_port **ports,
+		      int port_count)
+{
+	int p;
+
+	chamelium_reset(chamelium);
+
+	if (port) {
+		chamelium_wait_for_connector(display, chamelium,
+					     port, DRM_MODE_DISCONNECTED);
+	} else {
+		for (p = 0; p < port_count; p++) {
+			port = ports[p];
+			chamelium_wait_for_connector(display, chamelium, port,
+						     DRM_MODE_DISCONNECTED);
+		}
+	}
+}
+
 /**
  * chamelium_destroy_frame_dump:
  * @dump: The frame dump to destroy
diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
index 359f4ab3..92195e8c 100644
--- a/lib/igt_chamelium.h
+++ b/lib/igt_chamelium.h
@@ -32,6 +32,7 @@
 #include <xf86drmMode.h>
 
 #include "igt_debugfs.h"
+#include "igt_kms.h"
 
 struct igt_fb;
 struct edid;
@@ -73,6 +74,16 @@ enum chamelium_infoframe_type {
 	CHAMELIUM_INFOFRAME_VENDOR,
 };
 
+enum test_edid {
+	TEST_EDID_BASE,
+	TEST_EDID_ALT,
+	TEST_EDID_HDMI_AUDIO,
+	TEST_EDID_DP_AUDIO,
+	TEST_EDID_ASPECT_RATIO,
+};
+#define TEST_EDID_COUNT 5
+
+
 struct chamelium_infoframe {
 	int version;
 	size_t payload_size;
@@ -100,6 +111,8 @@ struct chamelium_edid;
  */
 #define CHAMELIUM_MAX_AUDIO_CHANNELS 8
 
+#define HOTPLUG_TIMEOUT 20 /* seconds */
+
 void chamelium_deinit_rpc_only(struct chamelium *chamelium);
 struct chamelium *chamelium_init_rpc_only(void);
 struct chamelium *chamelium_init(int drm_fd);
@@ -113,6 +126,26 @@ drmModeConnector *chamelium_port_get_connector(struct chamelium *chamelium,
 					       struct chamelium_port *port,
 					       bool reprobe);
 const char *chamelium_port_get_name(struct chamelium_port *port);
+void
+chamelium_require_connector_present(struct chamelium_port **ports,
+				    unsigned int type,
+				    int port_count,
+				    int count);
+drmModeConnection
+chamelium_reprobe_connector(igt_display_t *display,
+			    struct chamelium *chamelium,
+			    struct chamelium_port *port);
+void
+chamelium_wait_for_connector(igt_display_t *display,
+			     struct chamelium *chamelium,
+			     struct chamelium_port *port,
+			     drmModeConnection status);
+void
+chamelium_reset_state(igt_display_t *display,
+		      struct chamelium *chamelium,
+		      struct chamelium_port *port,
+		      struct chamelium_port **ports,
+		      int port_count);
 
 bool chamelium_wait_reachable(struct chamelium *chamelium, int timeout);
 void chamelium_assert_reachable(struct chamelium *chamelium, int timeout);
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f57972f1..4157075a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2254,6 +2254,20 @@ const drmModeModeInfo *igt_std_1024_mode_get(void)
 	return &std_1024_mode;
 }
 
+void igt_disable_modeset(igt_display_t *display)
+{
+	int i;
+
+	for (i = 0; i < display->n_outputs; i++) {
+		igt_output_t *output = &display->outputs[i];
+
+		igt_output_set_pipe(output, PIPE_NONE);
+	}
+
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+}
+
 static void igt_pipe_fini(igt_pipe_t *pipe)
 {
 	free(pipe->planes);
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 26dc9f5f..47091c18 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -438,6 +438,7 @@ igt_output_t *igt_output_from_connector(igt_display_t *display,
     drmModeConnector *connector);
 void igt_output_refresh(igt_output_t *output);
 const drmModeModeInfo *igt_std_1024_mode_get(void);
+void igt_disable_modeset(igt_display_t *display);
 
 igt_plane_t *igt_pipe_get_plane_type(igt_pipe_t *pipe, int plane_type);
 int igt_pipe_count_plane_type(igt_pipe_t *pipe, int plane_type);
diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
index e1c81e01..529e6403 100644
--- a/tests/kms_chamelium.c
+++ b/tests/kms_chamelium.c
@@ -36,15 +36,6 @@
 #include <string.h>
 #include <stdatomic.h>
 
-enum test_edid {
-	TEST_EDID_BASE,
-	TEST_EDID_ALT,
-	TEST_EDID_HDMI_AUDIO,
-	TEST_EDID_DP_AUDIO,
-	TEST_EDID_ASPECT_RATIO,
-};
-#define TEST_EDID_COUNT 5
-
 enum test_modeset_mode {
 	TEST_MODESET_ON,
 	TEST_MODESET_ON_OFF,
@@ -62,7 +53,6 @@ typedef struct {
 	struct chamelium_edid *edids[TEST_EDID_COUNT];
 } data_t;
 
-#define HOTPLUG_TIMEOUT 20 /* seconds */
 #define ONLINE_TIMEOUT 20 /* seconds */
 
 #define HPD_STORM_PULSE_INTERVAL_DP 100 /* ms */
@@ -97,78 +87,6 @@ get_connectors_link_status_failed(data_t *data, bool *link_status_failed)
 	}
 }
 
-static void
-require_connector_present(data_t *data, unsigned int type)
-{
-	int i;
-	bool found = false;
-
-	for (i = 0; i < data->port_count && !found; i++) {
-		if (chamelium_port_get_type(data->ports[i]) == type)
-			found = true;
-	}
-
-	igt_require_f(found, "No port of type %s was found\n",
-		      kmstest_connector_type_str(type));
-}
-
-static drmModeConnection
-reprobe_connector(data_t *data, struct chamelium_port *port)
-{
-	drmModeConnector *connector;
-	drmModeConnection status;
-	igt_output_t *output;
-
-	igt_debug("Reprobing %s...\n", chamelium_port_get_name(port));
-	connector = chamelium_port_get_connector(data->chamelium, port, true);
-	igt_assert(connector);
-	status = connector->connection;
-
-	/* let's make sure that igt_display is up to date too */
-	output = igt_output_from_connector(&data->display, connector);
-	output->force_reprobe = true;
-	igt_output_refresh(output);
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
 /* Wait for hotplug and return the remaining time left from timeout */
 static bool wait_for_hotplug(struct udev_monitor *mon, int *timeout)
 {
@@ -196,7 +114,8 @@ wait_for_connector_after_hotplug(data_t *data, struct udev_monitor *mon,
 	int hotplug_count = 0;
 
 	igt_debug("Waiting for %s to get %s after a hotplug event...\n",
-		  chamelium_port_get_name(port), connection_str(status));
+			  chamelium_port_get_name(port),
+			  kmstest_connector_status_str(status));
 
 	while (timeout > 0) {
 		if (!wait_for_hotplug(mon, &timeout))
@@ -204,13 +123,15 @@ wait_for_connector_after_hotplug(data_t *data, struct udev_monitor *mon,
 
 		hotplug_count++;
 
-		if (reprobe_connector(data, port) == status)
+		if (chamelium_reprobe_connector(&data->display, data->chamelium,
+						port) == status)
 			return;
 	}
 
 	igt_assert_f(false, "Timed out waiting for %s to get %s after a hotplug. Current state %s hotplug_count %d\n",
-		  chamelium_port_get_name(port), connection_str(status),
-		  connection_str(reprobe_connector(data, port)), hotplug_count);
+			    chamelium_port_get_name(port),
+			    kmstest_connector_status_str(status),
+			    kmstest_connector_status_str(chamelium_reprobe_connector(&data->display, data->chamelium, port)), hotplug_count);
 }
 
 
@@ -282,30 +203,6 @@ check_analog_bridge(data_t *data, struct chamelium_port *port)
 	return false;
 }
 
-static void
-reset_state(data_t *data, struct chamelium_port *port)
-{
-	int p, i;
-
-	for (i = 0; i < data->display.n_outputs; i++) {
-		igt_output_t *output = &data->display.outputs[i];
-		igt_output_set_pipe(output, PIPE_NONE);
-	}
-
-	igt_display_commit2(&data->display, COMMIT_ATOMIC);
-
-	chamelium_reset(data->chamelium);
-
-	if (port) {
-		wait_for_connector(data, port, DRM_MODE_DISCONNECTED);
-	} else {
-		for (p = 0; p < data->port_count; p++) {
-			port = data->ports[p];
-			wait_for_connector(data, port, DRM_MODE_DISCONNECTED);
-		}
-	}
-}
-
 static void chamelium_paint_xr24_pattern(uint32_t *data,
 					 size_t width, size_t height,
 					 size_t stride, size_t block_size)
@@ -441,7 +338,11 @@ test_hotplug(data_t *data, struct chamelium_port *port, int toggle_count,
 	struct udev_monitor *mon = igt_watch_uevents();
 	igt_output_t *output = get_output_for_port(data, port);
 
-	reset_state(data, NULL);
+	igt_disable_modeset(&data->display);
+	chamelium_reset_state(&data->display, data->chamelium, NULL,
+			      data->ports, data->port_count);
+
+
 	igt_hpd_storm_set_threshold(data->drm_fd, 0);
 
 	for (i = 0; i < toggle_count; i++) {
@@ -506,11 +407,14 @@ test_edid_read(data_t *data, struct chamelium_port *port, enum test_edid edid)
 	const struct edid *raw_edid;
 	uint64_t edid_blob_id;
 
-	reset_state(data, port);
+	igt_disable_modeset(&data->display);
+	chamelium_reset_state(&data->display, data->chamelium,
+		      port, data->ports, data->port_count);
 
 	set_edid(data, port, edid);
 	chamelium_plug(data->chamelium, port);
-	wait_for_connector(data, port, DRM_MODE_CONNECTED);
+	chamelium_wait_for_connector(&data->display, data->chamelium, port,
+				     DRM_MODE_CONNECTED);
 
 	igt_skip_on(check_analog_bridge(data, port));
 
@@ -562,7 +466,10 @@ try_suspend_resume_hpd(data_t *data, struct chamelium_port *port,
 	chamelium_assert_reachable(data->chamelium, ONLINE_TIMEOUT);
 
 	if (port) {
-		igt_assert_eq(reprobe_connector(data, port), target_state);
+		igt_assert_eq(chamelium_reprobe_connector(&data->display,
+							  data->chamelium,
+							  port),
+							  target_state);
 	} else {
 		for (p = 0; p < data->port_count; p++) {
 			drmModeConnection current_state;
@@ -575,10 +482,10 @@ try_suspend_resume_hpd(data_t *data, struct chamelium_port *port,
 			 * the expected connector state try to wait for an HPD
 			 * event for each connector/port.
 			 */
-			current_state = reprobe_connector(data, port);
+			current_state = chamelium_reprobe_connector(&data->display, data->chamelium, port);
 			if (p > 0 && current_state != target_state) {
 				igt_assert(wait_for_hotplug(mon, &timeout));
-				current_state = reprobe_connector(data, port);
+				current_state = chamelium_reprobe_connector(&data->display, data->chamelium, port);
 			}
 
 			igt_assert_eq(current_state, target_state);
@@ -598,7 +505,9 @@ test_suspend_resume_hpd(data_t *data, struct chamelium_port *port,
 {
 	struct udev_monitor *mon = igt_watch_uevents();
 
-	reset_state(data, port);
+	igt_disable_modeset(&data->display);
+	chamelium_reset_state(&data->display, data->chamelium,
+		      port, data->ports, data->port_count);
 
 	/* Make sure we notice new connectors after resuming */
 	try_suspend_resume_hpd(data, port, state, test, mon, false);
@@ -625,7 +534,9 @@ test_suspend_resume_hpd_common(data_t *data, enum igt_suspend_state state,
 		igt_debug("Testing port %s\n", chamelium_port_get_name(port));
 	}
 
-	reset_state(data, NULL);
+	igt_disable_modeset(&data->display);
+	chamelium_reset_state(&data->display, data->chamelium, NULL,
+			      data->ports, data->port_count);
 
 	/* Make sure we notice new connectors after resuming */
 	try_suspend_resume_hpd(data, NULL, state, test, mon, false);
@@ -651,7 +562,9 @@ test_suspend_resume_edid_change(data_t *data, struct chamelium_port *port,
 	bool link_status_failed[2][data->port_count];
 	int p;
 
-	reset_state(data, port);
+	igt_disable_modeset(&data->display);
+	chamelium_reset_state(&data->display, data->chamelium,
+		      port, data->ports, data->port_count);
 
 	/* Catch the event and flush all remaining ones. */
 	igt_assert(igt_hotplug_detected(mon, HOTPLUG_TIMEOUT));
@@ -662,7 +575,8 @@ test_suspend_resume_edid_change(data_t *data, struct chamelium_port *port,
 	chamelium_plug(data->chamelium, port);
 	igt_assert(igt_hotplug_detected(mon, HOTPLUG_TIMEOUT));
 
-	wait_for_connector(data, port, DRM_MODE_CONNECTED);
+	chamelium_wait_for_connector(&data->display, data->chamelium, port,
+				     DRM_MODE_CONNECTED);
 
 	/*
 	 * Change the edid before we suspend. On resume, the machine should
@@ -698,7 +612,8 @@ prepare_output(data_t *data, struct chamelium_port *port, enum test_edid edid)
 	set_edid(data, port, edid);
 
 	chamelium_plug(data->chamelium, port);
-	wait_for_connector(data, port, DRM_MODE_CONNECTED);
+	chamelium_wait_for_connector(&data->display, data->chamelium, port,
+				     DRM_MODE_CONNECTED);
 
 	igt_display_reset(display);
 
@@ -796,7 +711,9 @@ static void test_display_one_mode(data_t *data, struct chamelium_port *port,
 	igt_output_t *output;
 	igt_plane_t *primary;
 
-	reset_state(data, port);
+	igt_disable_modeset(&data->display);
+	chamelium_reset_state(&data->display, data->chamelium,
+		      port, data->ports, data->port_count);
 
 	output = prepare_output(data, port, TEST_EDID_BASE);
 	connector = chamelium_port_get_connector(data->chamelium, port, false);
@@ -841,7 +758,9 @@ static void test_display_all_modes(data_t *data, struct chamelium_port *port,
 		 * let's reset state each mode so we will get the
 		 * HPD pulses realibably
 		 */
-		reset_state(data, port);
+		igt_disable_modeset(&data->display);
+		chamelium_reset_state(&data->display, data->chamelium,
+		      port, data->ports, data->port_count);
 
 		/*
 		 * modes may change due to mode pruining and link issues, so we
@@ -897,7 +816,9 @@ test_display_frame_dump(data_t *data, struct chamelium_port *port)
 		 * let's reset state each mode so we will get the
 		 * HPD pulses realibably
 		 */
-		reset_state(data, port);
+		igt_disable_modeset(&data->display);
+		chamelium_reset_state(&data->display, data->chamelium,
+		      port, data->ports, data->port_count);
 
 		/*
 		 * modes may change due to mode pruining and link issues, so we
@@ -1034,7 +955,9 @@ static void test_mode_timings(data_t *data, struct chamelium_port *port)
 		 * let's reset state each mode so we will get the
 		 * HPD pulses realibably
 		 */
-		reset_state(data, port);
+		igt_disable_modeset(&data->display);
+		chamelium_reset_state(&data->display, data->chamelium,
+		      port, data->ports, data->port_count);
 
 		/*
 		 * modes may change due to mode pruining and link issues, so we
@@ -1181,7 +1104,9 @@ static void test_display_aspect_ratio(data_t *data, struct chamelium_port *port)
 
 	igt_require(chamelium_supports_get_last_infoframe(data->chamelium));
 
-	reset_state(data, port);
+	igt_disable_modeset(&data->display);
+	chamelium_reset_state(&data->display, data->chamelium,
+		      port, data->ports, data->port_count);
 
 	output = prepare_output(data, port, TEST_EDID_ASPECT_RATIO);
 	connector = chamelium_port_get_connector(data->chamelium, port, false);
@@ -1911,7 +1836,9 @@ test_display_audio(data_t *data, struct chamelium_port *port,
 	alsa = alsa_init();
 	igt_assert(alsa);
 
-	reset_state(data, port);
+	igt_disable_modeset(&data->display);
+	chamelium_reset_state(&data->display, data->chamelium,
+		      port, data->ports, data->port_count);
 
 	output = prepare_output(data, port, edid);
 	connector = chamelium_port_get_connector(data->chamelium, port, false);
@@ -1992,7 +1919,9 @@ test_display_audio_edid(data_t *data, struct chamelium_port *port,
 
 	igt_require(eld_is_supported());
 
-	reset_state(data, port);
+	igt_disable_modeset(&data->display);
+	chamelium_reset_state(&data->display, data->chamelium,
+		      port, data->ports, data->port_count);
 
 	output = prepare_output(data, port, edid);
 	connector = chamelium_port_get_connector(data->chamelium, port, false);
@@ -2432,7 +2361,9 @@ static void test_display_planes_random(data_t *data,
 
 	srand(time(NULL));
 
-	reset_state(data, port);
+	igt_disable_modeset(&data->display);
+	chamelium_reset_state(&data->display, data->chamelium,
+		      port, data->ports, data->port_count);
 
 	/* Find the connector and pipe. */
 	output = prepare_output(data, port, TEST_EDID_BASE);
@@ -2535,7 +2466,9 @@ test_hpd_without_ddc(data_t *data, struct chamelium_port *port)
 {
 	struct udev_monitor *mon = igt_watch_uevents();
 
-	reset_state(data, port);
+	igt_disable_modeset(&data->display);
+	chamelium_reset_state(&data->display, data->chamelium,
+		      port, data->ports, data->port_count);
 	igt_flush_uevents(mon);
 
 	/* Disable the DDC on the connector and make sure we still get a
@@ -2545,7 +2478,9 @@ test_hpd_without_ddc(data_t *data, struct chamelium_port *port)
 	chamelium_plug(data->chamelium, port);
 
 	igt_assert(igt_hotplug_detected(mon, HOTPLUG_TIMEOUT));
-	igt_assert_eq(reprobe_connector(data, port), DRM_MODE_CONNECTED);
+	igt_assert_eq(chamelium_reprobe_connector(&data->display,
+						  data->chamelium, port),
+						  DRM_MODE_CONNECTED);
 
 	igt_cleanup_uevents(mon);
 }
@@ -2561,7 +2496,9 @@ test_hpd_storm_detect(data_t *data, struct chamelium_port *port, int width)
 	int count = 0;
 
 	igt_require_hpd_storm_ctl(data->drm_fd);
-	reset_state(data, port);
+	igt_disable_modeset(&data->display);
+	chamelium_reset_state(&data->display, data->chamelium,
+		      port, data->ports, data->port_count);
 
 	igt_hpd_storm_set_threshold(data->drm_fd, 1);
 	chamelium_fire_hpd_pulses(data->chamelium, port, width, 10);
@@ -2589,7 +2526,9 @@ static void
 test_hpd_storm_disable(data_t *data, struct chamelium_port *port, int width)
 {
 	igt_require_hpd_storm_ctl(data->drm_fd);
-	reset_state(data, port);
+	igt_disable_modeset(&data->display);
+	chamelium_reset_state(&data->display, data->chamelium,
+		      port, data->ports, data->port_count);
 
 	igt_hpd_storm_set_threshold(data->drm_fd, 0);
 	chamelium_fire_hpd_pulses(data->chamelium, port,
@@ -2673,8 +2612,7 @@ igt_main
 	igt_describe("DisplayPort tests");
 	igt_subtest_group {
 		igt_fixture {
-			require_connector_present(
-			    &data, DRM_MODE_CONNECTOR_DisplayPort);
+			chamelium_require_connector_present(data.ports, DRM_MODE_CONNECTOR_DisplayPort, data.port_count, 1);
 		}
 
 		igt_describe(test_basic_hotplug_desc);
@@ -2782,8 +2720,7 @@ igt_main
 	igt_describe("HDMI tests");
 	igt_subtest_group {
 		igt_fixture {
-			require_connector_present(
-			    &data, DRM_MODE_CONNECTOR_HDMIA);
+			chamelium_require_connector_present(data.ports, DRM_MODE_CONNECTOR_HDMIA, data.port_count, 1);
 		}
 
 		igt_describe(test_basic_hotplug_desc);
@@ -2957,8 +2894,7 @@ igt_main
 	igt_describe("VGA tests");
 	igt_subtest_group {
 		igt_fixture {
-			require_connector_present(
-			    &data, DRM_MODE_CONNECTOR_VGA);
+			chamelium_require_connector_present(data.ports, DRM_MODE_CONNECTOR_VGA, data.port_count, 1);
 		}
 
 		igt_describe(test_basic_hotplug_desc);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
