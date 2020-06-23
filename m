Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C364E6E99C
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2020 13:39:05 +0000 (UTC)
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date: Tue, 23 Jun 2020 19:04:16 +0530
Message-Id: <20200623133416.4275-4-ankit.k.nautiyal@intel.com>
In-Reply-To: <20200623133416.4275-1-ankit.k.nautiyal@intel.com>
References: <20200623133416.4275-1-ankit.k.nautiyal@intel.com>
Subject: [igt-dev] [Patch][i-g-t v3 3/3] lib: Use generic names for APIs
 that handle uevents
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
List-ID: <igt-dev@lists.freedesktop.org>

The functions for handling uevents are named with "_hotplug" as suffix
such as igt_watch_hotplug(). Earlier hotplug was the only uevent that
was requested to be detected, but in fact, these APIs are generic and
can be used for detecting other uevents too.

Currently we have tests like kms_lease, kms_content_protection using
the uevent handling infrastructure for detecting uevents other than
hotplug.

This patch renames the functions and replace the "_hotplug" suffix
with "_uevents".

v2: Rebase

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Suggested-by: Ramalingam C <ramalingam.c@intel.com>
Suggested-by: Hiler, Arkadiusz <arkadiusz.hiler@intel.com>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
---
 lib/igt_kms.c                  | 30 ++++++++++++++--------------
 lib/igt_kms.h                  |  6 +++---
 tests/kms_chamelium.c          | 36 +++++++++++++++++-----------------
 tests/kms_content_protection.c |  6 +++---
 tests/kms_flip.c               |  6 +++---
 tests/kms_lease.c              |  6 +++---
 6 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1af74d08..27f85859 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4156,13 +4156,13 @@ void igt_reset_connectors(void)
 }
 
 /**
- * igt_watch_hotplug:
+ * igt_watch_uevents:
  *
- * Begin monitoring udev for sysfs hotplug events.
+ * Begin monitoring udev for sysfs uevents.
  *
- * Returns: a udev monitor for detecting hotplugs on
+ * Returns: a udev monitor for detecting uevents on
  */
-struct udev_monitor *igt_watch_hotplug(void)
+struct udev_monitor *igt_watch_uevents(void)
 {
 	struct udev *udev;
 	struct udev_monitor *mon;
@@ -4230,7 +4230,7 @@ bool event_detected(struct udev_monitor *mon, int timeout_secs,
 
 /**
  * igt_connector_event_detected:
- * @mon: A udev monitor initialized with #igt_watch_hotplug
+ * @mon: A udev monitor initialized with #igt_watch_uevents
  * @conn_id: Connector id of the Connector for which the property change is
  * expected.
  * @prop_id: Property id for which the change is expected.
@@ -4252,7 +4252,7 @@ bool igt_connector_event_detected(struct udev_monitor *mon, uint32_t conn_id,
 
 /**
  * igt_hotplug_detected:
- * @mon: A udev monitor initialized with #igt_watch_hotplug
+ * @mon: A udev monitor initialized with #igt_watch_uevents
  * @timeout_secs: How long to wait for a hotplug event to occur.
  *
  * Detect if a hotplug event was received since we last checked the monitor.
@@ -4270,7 +4270,7 @@ bool igt_hotplug_detected(struct udev_monitor *mon, int timeout_secs)
 
 /**
  * igt_lease_change_detected:
- * @mon: A udev monitor initialized with #igt_watch_hotplug
+ * @mon: A udev monitor initialized with #igt_watch_uevents
  * @timeout_secs: How long to wait for a lease change event to occur.
  *
  * Detect if a lease change event was received since we last checked the monitor.
@@ -4287,12 +4287,12 @@ bool igt_lease_change_detected(struct udev_monitor *mon, int timeout_secs)
 }
 
 /**
- * igt_flush_hotplugs:
- * @mon: A udev monitor initialized with #igt_watch_hotplug
+ * igt_flush_uevents:
+ * @mon: A udev monitor initialized with #igt_watch_uevents
  *
- * Get rid of any pending hotplug events
+ * Get rid of any pending uevents
  */
-void igt_flush_hotplugs(struct udev_monitor *mon)
+void igt_flush_uevents(struct udev_monitor *mon)
 {
 	struct udev_device *dev;
 
@@ -4301,12 +4301,12 @@ void igt_flush_hotplugs(struct udev_monitor *mon)
 }
 
 /**
- * igt_cleanup_hotplug:
- * @mon: A udev monitor initialized with #igt_watch_hotplug
+ * igt_cleanup_uevents:
+ * @mon: A udev monitor initialized with #igt_watch_uevents
  *
- * Cleanup the resources allocated by #igt_watch_hotplug
+ * Cleanup the resources allocated by #igt_watch_uevents
  */
-void igt_cleanup_hotplug(struct udev_monitor *mon)
+void igt_cleanup_uevents(struct udev_monitor *mon)
 {
 	struct udev *udev = udev_monitor_get_udev(mon);
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 539f6c5a..416e737c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -774,15 +774,15 @@ const struct edid *igt_kms_get_dp_audio_edid(void);
 const struct edid *igt_kms_get_4k_edid(void);
 const struct edid *igt_kms_get_3d_edid(void);
 
-struct udev_monitor *igt_watch_hotplug(void);
+struct udev_monitor *igt_watch_uevents(void);
 bool igt_hotplug_detected(struct udev_monitor *mon,
 			  int timeout_secs);
 bool igt_lease_change_detected(struct udev_monitor *mon,
 			       int timeout_secs);
 bool igt_connector_event_detected(struct udev_monitor *mon, uint32_t conn_id,
 				  uint32_t prop_id, int timeout_msecs);
-void igt_flush_hotplugs(struct udev_monitor *mon);
-void igt_cleanup_hotplug(struct udev_monitor *mon);
+void igt_flush_uevents(struct udev_monitor *mon);
+void igt_cleanup_uevents(struct udev_monitor *mon);
 
 bool igt_display_has_format_mod(igt_display_t *display, uint32_t format, uint64_t modifier);
 bool igt_plane_has_format_mod(igt_plane_t *plane, uint32_t format, uint64_t modifier);
diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
index 7d3e0643..e1c81e01 100644
--- a/tests/kms_chamelium.c
+++ b/tests/kms_chamelium.c
@@ -438,21 +438,21 @@ test_hotplug(data_t *data, struct chamelium_port *port, int toggle_count,
 	enum pipe pipe;
 	struct igt_fb fb = {0};
 	drmModeModeInfo mode;
-	struct udev_monitor *mon = igt_watch_hotplug();
+	struct udev_monitor *mon = igt_watch_uevents();
 	igt_output_t *output = get_output_for_port(data, port);
 
 	reset_state(data, NULL);
 	igt_hpd_storm_set_threshold(data->drm_fd, 0);
 
 	for (i = 0; i < toggle_count; i++) {
-		igt_flush_hotplugs(mon);
+		igt_flush_uevents(mon);
 
 		/* Check if we get a sysfs hotplug event */
 		chamelium_plug(data->chamelium, port);
 
 		wait_for_connector_after_hotplug(data, mon, port,
 						 DRM_MODE_CONNECTED);
-		igt_flush_hotplugs(mon);
+		igt_flush_uevents(mon);
 
 		if (modeset_mode == TEST_MODESET_ON_OFF ||
 		    (modeset_mode == TEST_MODESET_ON && i == 0 )) {
@@ -473,7 +473,7 @@ test_hotplug(data_t *data, struct chamelium_port *port, int toggle_count,
 		wait_for_connector_after_hotplug(data, mon, port,
 						 DRM_MODE_DISCONNECTED);
 
-		igt_flush_hotplugs(mon);
+		igt_flush_uevents(mon);
 
 		if (modeset_mode == TEST_MODESET_ON_OFF) {
 			igt_output_set_pipe(output, PIPE_NONE);
@@ -481,7 +481,7 @@ test_hotplug(data_t *data, struct chamelium_port *port, int toggle_count,
 		}
 	}
 
-	igt_cleanup_hotplug(mon);
+	igt_cleanup_uevents(mon);
 	igt_hpd_storm_reset(data->drm_fd);
 	igt_remove_fb(data->drm_fd, &fb);
 }
@@ -540,7 +540,7 @@ try_suspend_resume_hpd(data_t *data, struct chamelium_port *port,
 	int delay;
 	int p;
 
-	igt_flush_hotplugs(mon);
+	igt_flush_uevents(mon);
 
 	delay = igt_get_autoresume_delay(state) * 1000 / 2;
 
@@ -596,7 +596,7 @@ test_suspend_resume_hpd(data_t *data, struct chamelium_port *port,
 			enum igt_suspend_state state,
 			enum igt_suspend_test test)
 {
-	struct udev_monitor *mon = igt_watch_hotplug();
+	struct udev_monitor *mon = igt_watch_uevents();
 
 	reset_state(data, port);
 
@@ -606,7 +606,7 @@ test_suspend_resume_hpd(data_t *data, struct chamelium_port *port,
 	/* Now make sure we notice disconnected connectors after resuming */
 	try_suspend_resume_hpd(data, port, state, test, mon, true);
 
-	igt_cleanup_hotplug(mon);
+	igt_cleanup_uevents(mon);
 }
 
 static const char test_suspend_resume_hpd_common_desc[] =
@@ -616,7 +616,7 @@ static void
 test_suspend_resume_hpd_common(data_t *data, enum igt_suspend_state state,
 			       enum igt_suspend_test test)
 {
-	struct udev_monitor *mon = igt_watch_hotplug();
+	struct udev_monitor *mon = igt_watch_uevents();
 	struct chamelium_port *port;
 	int p;
 
@@ -633,7 +633,7 @@ test_suspend_resume_hpd_common(data_t *data, enum igt_suspend_state state,
 	/* Now make sure we notice disconnected connectors after resuming */
 	try_suspend_resume_hpd(data, NULL, state, test, mon, true);
 
-	igt_cleanup_hotplug(mon);
+	igt_cleanup_uevents(mon);
 }
 
 static const char test_suspend_resume_edid_change_desc[] =
@@ -647,7 +647,7 @@ test_suspend_resume_edid_change(data_t *data, struct chamelium_port *port,
 				enum test_edid edid,
 				enum test_edid alt_edid)
 {
-	struct udev_monitor *mon = igt_watch_hotplug();
+	struct udev_monitor *mon = igt_watch_uevents();
 	bool link_status_failed[2][data->port_count];
 	int p;
 
@@ -655,7 +655,7 @@ test_suspend_resume_edid_change(data_t *data, struct chamelium_port *port,
 
 	/* Catch the event and flush all remaining ones. */
 	igt_assert(igt_hotplug_detected(mon, HOTPLUG_TIMEOUT));
-	igt_flush_hotplugs(mon);
+	igt_flush_uevents(mon);
 
 	/* First plug in the port */
 	set_edid(data, port, edid);
@@ -672,7 +672,7 @@ test_suspend_resume_edid_change(data_t *data, struct chamelium_port *port,
 
 	get_connectors_link_status_failed(data, link_status_failed[0]);
 
-	igt_flush_hotplugs(mon);
+	igt_flush_uevents(mon);
 
 	igt_system_suspend_autoresume(state, test);
 	igt_assert(igt_hotplug_detected(mon, HOTPLUG_TIMEOUT));
@@ -2533,10 +2533,10 @@ static const char test_hpd_without_ddc_desc[] =
 static void
 test_hpd_without_ddc(data_t *data, struct chamelium_port *port)
 {
-	struct udev_monitor *mon = igt_watch_hotplug();
+	struct udev_monitor *mon = igt_watch_uevents();
 
 	reset_state(data, port);
-	igt_flush_hotplugs(mon);
+	igt_flush_uevents(mon);
 
 	/* Disable the DDC on the connector and make sure we still get a
 	 * hotplug
@@ -2547,7 +2547,7 @@ test_hpd_without_ddc(data_t *data, struct chamelium_port *port)
 	igt_assert(igt_hotplug_detected(mon, HOTPLUG_TIMEOUT));
 	igt_assert_eq(reprobe_connector(data, port), DRM_MODE_CONNECTED);
 
-	igt_cleanup_hotplug(mon);
+	igt_cleanup_uevents(mon);
 }
 
 static const char test_hpd_storm_detect_desc[] =
@@ -2567,7 +2567,7 @@ test_hpd_storm_detect(data_t *data, struct chamelium_port *port, int width)
 	chamelium_fire_hpd_pulses(data->chamelium, port, width, 10);
 	igt_assert(igt_hpd_storm_detected(data->drm_fd));
 
-	mon = igt_watch_hotplug();
+	mon = igt_watch_uevents();
 	chamelium_fire_hpd_pulses(data->chamelium, port, width, 10);
 
 	/*
@@ -2578,7 +2578,7 @@ test_hpd_storm_detect(data_t *data, struct chamelium_port *port, int width)
 		count += igt_hotplug_detected(mon, 1);
 	igt_assert_lt(count, 2);
 
-	igt_cleanup_hotplug(mon);
+	igt_cleanup_uevents(mon);
 	igt_hpd_storm_reset(data->drm_fd);
 }
 
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index a80aa5bb..303ed418 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -567,10 +567,10 @@ igt_main
 	igt_subtest("uevent") {
 		igt_require(data.display.is_atomic);
 		data.cp_tests = CP_UEVENT;
-		data.uevent_monitor = igt_watch_hotplug();
-		igt_flush_hotplugs(data.uevent_monitor);
+		data.uevent_monitor = igt_watch_uevents();
+		igt_flush_uevents(data.uevent_monitor);
 		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
-		igt_cleanup_hotplug(data.uevent_monitor);
+		igt_cleanup_uevents(data.uevent_monitor);
 	}
 
 	/*
diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index b7b42f85..3a7314ad 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1212,7 +1212,7 @@ static void calibrate_ts(struct test_output *o, int crtc_idx)
 static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 				   int crtc_count, int duration_ms)
 {
-	struct udev_monitor *mon = igt_watch_hotplug();
+	struct udev_monitor *mon = igt_watch_uevents();
 	unsigned bo_size = 0;
 	bool vblank = true;
 	bool retried = false;
@@ -1261,7 +1261,7 @@ static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 retry:
 	kmstest_unset_all_crtcs(drm_fd, resources);
 
-	igt_flush_hotplugs(mon);
+	igt_flush_uevents(mon);
 
 	if (set_mode(o, o->fb_ids[0], 0, 0)) {
 		/* We may fail to apply the mode if there are hidden
@@ -1351,7 +1351,7 @@ out:
 
 	free_test_output(o);
 
-	igt_cleanup_hotplug(mon);
+	igt_cleanup_uevents(mon);
 }
 
 static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 927c2315..2e6cf9b0 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -1238,9 +1238,9 @@ static void lease_uevent(data_t *data)
 	struct local_drm_mode_list_lessees mll;
 	struct udev_monitor *uevent_monitor;
 
-	uevent_monitor = igt_watch_hotplug();
+	uevent_monitor = igt_watch_uevents();
 
-	igt_flush_hotplugs(uevent_monitor);
+	igt_flush_uevents(uevent_monitor);
 
 	lease_fd = create_simple_lease(data->master.fd, data);
 
@@ -1260,7 +1260,7 @@ static void lease_uevent(data_t *data)
 	igt_assert_eq(list_lessees(data->master.fd, &mll), 0);
 	igt_assert_eq(mll.count_lessees, 0);
 
-	igt_cleanup_hotplug(uevent_monitor);
+	igt_cleanup_uevents(uevent_monitor);
 }
 
 igt_main
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
