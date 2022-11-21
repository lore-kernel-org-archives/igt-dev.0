Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79C410E196
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Nov 2022 19:18:06 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id jr19so7911392qtb.7
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Nov 2022 11:18:06 -0800 (PST)
From: Mark Yacoub <markyacoub@chromium.org>
To: igt-dev@lists.freedesktop.org
Date: Mon, 21 Nov 2022 14:17:48 -0500
Message-Id: <20221121191747.2817707-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] Chamelium: Simplify the chamelium test files.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, vsuley@google.com, petri.latvala@intel.com,
 ihf@google.com, amstan@chromium.org, kalin@google.com, seanpaul@chromium.org,
 matthewtlam@google.com, khaled.almahallawy@intel.com, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[Why]
kms_chamelium tests file has grown so much and became a bit big to
manage.
Splitting specific tests like we do for kms_ tests into separate files
puts logically related functionalities into the same place so tests are
more clear.

[How]
1. Rename kms_chamelium_color to chamelium_color to standarize starting
   chamelium test file names which are inside the chamelium/ directory with chamelium_
2. Remove the HPD related tests from the super large kms_chamelium.c
   into into own new files "chamelium_hpd.c"
3. Remove all unused code from kms_chamelium.c
4. Create a chamelium_helper that has all common code between
   kms_chamelium.c and kms_hpd.c

TODO: remove other related tests from kms_chamelium into their own files
and deprecate kms_chamelium completely.

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 lib/monitor_edids/monitor_edids_helper.c      |   2 +-
 ...ms_color_chamelium.c => chamelium_color.c} |   0
 tests/chamelium/chamelium_helper.c            | 239 ++++++
 tests/chamelium/chamelium_helper.h            |  64 ++
 tests/chamelium/chamelium_hpd.c               | 506 ++++++++++++
 tests/chamelium/kms_chamelium.c               | 721 +-----------------
 tests/kms_color_helper.h                      |   2 +-
 tests/meson.build                             |   9 +-
 8 files changed, 819 insertions(+), 724 deletions(-)
 rename tests/chamelium/{kms_color_chamelium.c => chamelium_color.c} (100%)
 create mode 100644 tests/chamelium/chamelium_helper.c
 create mode 100644 tests/chamelium/chamelium_helper.h
 create mode 100644 tests/chamelium/chamelium_hpd.c

diff --git a/lib/monitor_edids/monitor_edids_helper.c b/lib/monitor_edids/monitor_edids_helper.c
index 41f199bd..1cbf1c22 100644
--- a/lib/monitor_edids/monitor_edids_helper.c
+++ b/lib/monitor_edids/monitor_edids_helper.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: MIT
 /*
  * A helper library for parsing and making use of real EDID data from monitors
  * and make them compatible with IGT and Chamelium.
diff --git a/tests/chamelium/kms_color_chamelium.c b/tests/chamelium/chamelium_color.c
similarity index 100%
rename from tests/chamelium/kms_color_chamelium.c
rename to tests/chamelium/chamelium_color.c
diff --git a/tests/chamelium/chamelium_helper.c b/tests/chamelium/chamelium_helper.c
new file mode 100644
index 00000000..59d089fc
--- /dev/null
+++ b/tests/chamelium/chamelium_helper.c
@@ -0,0 +1,239 @@
+// SPDX-License-Identifier: MIT
+/*
+ * A helper library for all Chamelium tests.
+ *
+ * Copyright 2022 Google LLC.
+ *
+ * Authors: Mark Yacoub <markyacoub@chromium.org>
+ */
+
+#include "chamelium_helper.h"
+
+void init_chamelium(data_t *data)
+{
+	int i;
+
+	/* So fbcon doesn't try to reprobe things itself */
+	kmstest_set_vt_graphics_mode();
+
+	data->drm_fd = drm_open_driver_master(DRIVER_ANY);
+	igt_display_require(&data->display, data->drm_fd);
+	igt_require(data->display.is_atomic);
+
+	/*
+	 * XXX: disabling modeset, can be removed when
+	 * igt_display_require will start doing this for us
+	 */
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	/* we need to initalize chamelium after igt_display_require */
+	data->chamelium = chamelium_init(data->drm_fd, &data->display);
+	igt_require(data->chamelium);
+
+	data->ports = chamelium_get_ports(data->chamelium, &data->port_count);
+
+	for (i = 0; i < IGT_CUSTOM_EDID_COUNT; ++i) {
+		data->edids[i] = chamelium_new_edid(data->chamelium,
+						    igt_kms_get_custom_edid(i));
+	}
+}
+
+/* Wait for hotplug and return the remaining time left from timeout */
+bool wait_for_hotplug(struct udev_monitor *mon, int *timeout)
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
+/**
+ * wait_for_connector_after_hotplug:
+ *
+ * Waits for the connector attached to @port to have a status of @status after
+ * it's plugged/unplugged.
+ *
+ */
+void wait_for_connector_after_hotplug(data_t *data, struct udev_monitor *mon,
+				      struct chamelium_port *port,
+				      drmModeConnection status)
+{
+	int timeout = CHAMELIUM_HOTPLUG_TIMEOUT;
+	int hotplug_count = 0;
+
+	igt_debug("Waiting for %s to get %s after a hotplug event...\n",
+		  chamelium_port_get_name(port),
+		  kmstest_connector_status_str(status));
+
+	while (timeout > 0) {
+		if (!wait_for_hotplug(mon, &timeout))
+			break;
+
+		hotplug_count++;
+
+		if (chamelium_reprobe_connector(&data->display, data->chamelium,
+						port) == status)
+			return;
+	}
+
+	igt_assert_f(
+		false,
+		"Timed out waiting for %s to get %s after a hotplug. Current state %s hotplug_count %d\n",
+		chamelium_port_get_name(port),
+		kmstest_connector_status_str(status),
+		kmstest_connector_status_str(chamelium_reprobe_connector(
+			&data->display, data->chamelium, port)),
+		hotplug_count);
+}
+
+/**
+ * enable_output:
+ *
+ * Modesets the connector attached to @port for the assigned @mode and draws the
+ * @fb.
+ *
+ */
+void enable_output(data_t *data, struct chamelium_port *port,
+		   igt_output_t *output, drmModeModeInfo *mode,
+		   struct igt_fb *fb)
+{
+	igt_display_t *display = output->display;
+	igt_plane_t *primary =
+		igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	drmModeConnector *connector =
+		chamelium_port_get_connector(data->chamelium, port, false);
+
+	igt_assert(primary);
+
+	igt_plane_set_size(primary, mode->hdisplay, mode->vdisplay);
+	igt_plane_set_fb(primary, fb);
+	igt_output_override_mode(output, mode);
+
+	/* Clear any color correction values that might be enabled */
+	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
+		igt_pipe_obj_replace_prop_blob(primary->pipe,
+					       IGT_CRTC_DEGAMMA_LUT, NULL, 0);
+	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT))
+		igt_pipe_obj_replace_prop_blob(primary->pipe,
+					       IGT_CRTC_GAMMA_LUT, NULL, 0);
+	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM))
+		igt_pipe_obj_replace_prop_blob(primary->pipe, IGT_CRTC_CTM,
+					       NULL, 0);
+
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	if (chamelium_port_get_type(port) == DRM_MODE_CONNECTOR_VGA)
+		usleep(250000);
+
+	drmModeFreeConnector(connector);
+}
+
+/* Return pipe attached to @outpu.t */
+enum pipe get_pipe_for_output(igt_display_t *display, igt_output_t *output)
+{
+	enum pipe pipe;
+
+	for_each_pipe(display, pipe) {
+		if (igt_pipe_connector_valid(pipe, output)) {
+			return pipe;
+		}
+	}
+
+	igt_assert_f(false, "No pipe found for output %s\n",
+		     igt_output_name(output));
+}
+
+static void chamelium_paint_xr24_pattern(uint32_t *data, size_t width,
+					 size_t height, size_t stride,
+					 size_t block_size)
+{
+	uint32_t colors[] = { 0xff000000, 0xffff0000, 0xff00ff00, 0xff0000ff,
+			      0xffffffff };
+	unsigned i, j;
+
+	for (i = 0; i < height; i++)
+		for (j = 0; j < width; j++)
+			*(data + i * stride / 4 +
+			  j) = colors[((j / block_size) + (i / block_size)) % 5];
+}
+
+/**
+ * chamelium_get_pattern_fb:
+ *
+ * Creates an @fb with an xr24 pattern and returns the fb_id.
+ *
+ */
+int chamelium_get_pattern_fb(data_t *data, size_t width, size_t height,
+			     uint32_t fourcc, size_t block_size,
+			     struct igt_fb *fb)
+{
+	int fb_id;
+	void *ptr;
+
+	igt_assert(fourcc == DRM_FORMAT_XRGB8888);
+
+	fb_id = igt_create_fb(data->drm_fd, width, height, fourcc,
+			      DRM_FORMAT_MOD_LINEAR, fb);
+	igt_assert(fb_id > 0);
+
+	ptr = igt_fb_map_buffer(fb->fd, fb);
+	igt_assert(ptr);
+
+	chamelium_paint_xr24_pattern(ptr, width, height, fb->strides[0],
+				     block_size);
+	igt_fb_unmap_buffer(fb, ptr);
+
+	return fb_id;
+}
+
+/* Generate a simple @fb for the size of @mode. */
+void create_fb_for_mode(data_t *data, struct igt_fb *fb, drmModeModeInfo *mode)
+{
+	int fb_id;
+
+	fb_id = chamelium_get_pattern_fb(data, mode->hdisplay, mode->vdisplay,
+					 DRM_FORMAT_XRGB8888, 64, fb);
+
+	igt_assert(fb_id > 0);
+}
+
+/* Returns the first preferred mode for the connector attached to @port. */
+drmModeModeInfo get_mode_for_port(struct chamelium *chamelium,
+				  struct chamelium_port *port)
+{
+	drmModeConnector *connector =
+		chamelium_port_get_connector(chamelium, port, false);
+	drmModeModeInfo mode;
+	igt_assert(&connector->modes[0] != NULL);
+	memcpy(&mode, &connector->modes[0], sizeof(mode));
+	drmModeFreeConnector(connector);
+	return mode;
+}
+
+/* Returns the igt display output for the connector attached to @port. */
+igt_output_t *get_output_for_port(data_t *data, struct chamelium_port *port)
+{
+	drmModeConnector *connector =
+		chamelium_port_get_connector(data->chamelium, port, true);
+	igt_output_t *output =
+		igt_output_from_connector(&data->display, connector);
+	drmModeFreeConnector(connector);
+	igt_assert(output != NULL);
+	return output;
+}
+
+/* Set the EDID of index @edid to Chamelium's @port. */
+void set_edid(data_t *data, struct chamelium_port *port,
+	      enum igt_custom_edid_type edid)
+{
+	chamelium_port_set_edid(data->chamelium, port, data->edids[edid]);
+}
\ No newline at end of file
diff --git a/tests/chamelium/chamelium_helper.h b/tests/chamelium/chamelium_helper.h
new file mode 100644
index 00000000..d9a91bf7
--- /dev/null
+++ b/tests/chamelium/chamelium_helper.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * A helper library for all Chamelium tests.
+ *
+ * Copyright 2022 Google LLC.
+ *
+ * Authors: Mark Yacoub <markyacoub@chromium.org>
+ */
+
+#ifndef TESTS_CHAMELIUM_CHAMELIUM_HELPER_H
+#define TESTS_CHAMELIUM_CHAMELIUM_HELPER_H
+
+#include "igt.h"
+
+#define ONLINE_TIMEOUT 20 /* seconds */
+
+#define for_each_port(p, port)                                 \
+	for (p = 0, port = data.ports[p]; p < data.port_count; \
+	     p++, port = data.ports[p])
+
+#define connector_subtest(name__, type__)                           \
+	igt_subtest(name__)                                         \
+	for_each_port(p, port) if (chamelium_port_get_type(port) == \
+				   DRM_MODE_CONNECTOR_##type__)
+
+/*
+ * The chamelium data structure is used to store all the information known about
+ * chamelium to run the tests.
+ */
+typedef struct {
+	struct chamelium *chamelium;
+	struct chamelium_port **ports;
+	igt_display_t display;
+	int port_count;
+
+	int drm_fd;
+
+	struct chamelium_edid *edids[IGT_CUSTOM_EDID_COUNT];
+} data_t;
+
+void init_chamelium(data_t *data);
+
+bool wait_for_hotplug(struct udev_monitor *mon, int *timeout);
+void wait_for_connector_after_hotplug(data_t *data, struct udev_monitor *mon,
+				      struct chamelium_port *port,
+				      drmModeConnection status);
+
+void enable_output(data_t *data, struct chamelium_port *port,
+		   igt_output_t *output, drmModeModeInfo *mode,
+		   struct igt_fb *fb);
+enum pipe get_pipe_for_output(igt_display_t *display, igt_output_t *output);
+
+int chamelium_get_pattern_fb(data_t *data, size_t width, size_t height,
+			     uint32_t fourcc, size_t block_size,
+			     struct igt_fb *fb);
+void create_fb_for_mode(data_t *data, struct igt_fb *fb, drmModeModeInfo *mode);
+drmModeModeInfo get_mode_for_port(struct chamelium *chamelium,
+				  struct chamelium_port *port);
+igt_output_t *get_output_for_port(data_t *data, struct chamelium_port *port);
+
+void set_edid(data_t *data, struct chamelium_port *port,
+	      enum igt_custom_edid_type edid);
+
+#endif /* TESTS_CHAMELIUM_CHAMELIUM_HELPER_H */
diff --git a/tests/chamelium/chamelium_hpd.c b/tests/chamelium/chamelium_hpd.c
new file mode 100644
index 00000000..c8f5afe4
--- /dev/null
+++ b/tests/chamelium/chamelium_hpd.c
@@ -0,0 +1,506 @@
+// SPDX-License-Identifier: MIT
+/*
+ * A Chamelium test for testing the HPD functionality.
+ *
+ * Copyright 2022 Google LLC.
+ *
+ * Authors: Mark Yacoub <markyacoub@chromium.org>
+ */
+
+#include "chamelium_helper.h"
+
+#define HPD_STORM_PULSE_INTERVAL_DP 100 /* ms */
+#define HPD_STORM_PULSE_INTERVAL_HDMI 200 /* ms */
+
+#define HPD_TOGGLE_COUNT_VGA 5
+#define HPD_TOGGLE_COUNT_DP_HDMI 15
+#define HPD_TOGGLE_COUNT_FAST 3
+
+enum test_modeset_mode {
+	TEST_MODESET_ON,
+	TEST_MODESET_ON_OFF,
+	TEST_MODESET_OFF,
+};
+
+static void try_suspend_resume_hpd(data_t *data, struct chamelium_port *port,
+				   enum igt_suspend_state state,
+				   enum igt_suspend_test test,
+				   struct udev_monitor *mon, bool connected)
+{
+	drmModeConnection target_state = connected ? DRM_MODE_DISCONNECTED :
+						     DRM_MODE_CONNECTED;
+	int timeout = CHAMELIUM_HOTPLUG_TIMEOUT;
+	int delay;
+	int p;
+
+	igt_flush_uevents(mon);
+
+	delay = igt_get_autoresume_delay(state) * 1000 / 2;
+
+	if (port) {
+		chamelium_schedule_hpd_toggle(data->chamelium, port, delay,
+					      !connected);
+	} else {
+		for (p = 0; p < data->port_count; p++) {
+			port = data->ports[p];
+			chamelium_schedule_hpd_toggle(data->chamelium, port,
+						      delay, !connected);
+		}
+
+		port = NULL;
+	}
+
+	igt_system_suspend_autoresume(state, test);
+	igt_assert(wait_for_hotplug(mon, &timeout));
+	chamelium_assert_reachable(data->chamelium, ONLINE_TIMEOUT);
+
+	if (port) {
+		igt_assert_eq(chamelium_reprobe_connector(
+				      &data->display, data->chamelium, port),
+			      target_state);
+	} else {
+		for (p = 0; p < data->port_count; p++) {
+			drmModeConnection current_state;
+
+			port = data->ports[p];
+			/*
+			 * There could be as many hotplug events sent by
+			 * driver as connectors we scheduled an HPD toggle on
+			 * above, depending on timing. So if we're not seeing
+			 * the expected connector state try to wait for an HPD
+			 * event for each connector/port.
+			 */
+			current_state = chamelium_reprobe_connector(
+				&data->display, data->chamelium, port);
+			if (p > 0 && current_state != target_state) {
+				igt_assert(wait_for_hotplug(mon, &timeout));
+				current_state = chamelium_reprobe_connector(
+					&data->display, data->chamelium, port);
+			}
+
+			igt_assert_eq(current_state, target_state);
+		}
+
+		port = NULL;
+	}
+}
+
+static const char test_basic_hotplug_desc[] =
+	"Check that we get uevents and updated connector status on "
+	"hotplug and unplug";
+static void test_hotplug(data_t *data, struct chamelium_port *port,
+			 int toggle_count, enum test_modeset_mode modeset_mode)
+{
+	int i;
+	enum pipe pipe;
+	struct igt_fb fb = { 0 };
+	drmModeModeInfo mode;
+	struct udev_monitor *mon = igt_watch_uevents();
+	igt_output_t *output = get_output_for_port(data, port);
+
+	igt_modeset_disable_all_outputs(&data->display);
+	chamelium_reset_state(&data->display, data->chamelium, NULL,
+			      data->ports, data->port_count);
+
+	igt_hpd_storm_set_threshold(data->drm_fd, 0);
+
+	for (i = 0; i < toggle_count; i++) {
+		igt_flush_uevents(mon);
+
+		/* Check if we get a sysfs hotplug event */
+		chamelium_plug(data->chamelium, port);
+
+		wait_for_connector_after_hotplug(data, mon, port,
+						 DRM_MODE_CONNECTED);
+		igt_flush_uevents(mon);
+
+		if (modeset_mode == TEST_MODESET_ON_OFF ||
+		    (modeset_mode == TEST_MODESET_ON && i == 0)) {
+			if (i == 0) {
+				/* We can only get mode and pipe once we are
+				 * connected */
+				output = get_output_for_port(data, port);
+				pipe = get_pipe_for_output(&data->display,
+							   output);
+				mode = get_mode_for_port(data->chamelium, port);
+				create_fb_for_mode(data, &fb, &mode);
+			}
+
+			igt_output_set_pipe(output, pipe);
+			enable_output(data, port, output, &mode, &fb);
+		}
+
+		/* Now check if we get a hotplug from disconnection */
+		chamelium_unplug(data->chamelium, port);
+
+		wait_for_connector_after_hotplug(data, mon, port,
+						 DRM_MODE_DISCONNECTED);
+
+		igt_flush_uevents(mon);
+
+		if (modeset_mode == TEST_MODESET_ON_OFF) {
+			igt_output_set_pipe(output, PIPE_NONE);
+			igt_display_commit2(&data->display, COMMIT_ATOMIC);
+		}
+	}
+
+	igt_cleanup_uevents(mon);
+	igt_hpd_storm_reset(data->drm_fd);
+	igt_remove_fb(data->drm_fd, &fb);
+}
+
+static const char test_hotplug_for_each_pipe_desc[] =
+	"Check that we get uevents and updated connector status on "
+	"hotplug and unplug for each pipe with valid output";
+static void test_hotplug_for_each_pipe(data_t *data,
+				       struct chamelium_port *port)
+{
+	igt_output_t *output;
+	enum pipe pipe;
+	struct udev_monitor *mon = igt_watch_uevents();
+
+	chamelium_reset_state(&data->display, data->chamelium, port,
+			      data->ports, data->port_count);
+
+	igt_hpd_storm_set_threshold(data->drm_fd, 0);
+	/* Disconnect if any port got connected */
+	chamelium_unplug(data->chamelium, port);
+	wait_for_connector_after_hotplug(data, mon, port,
+					 DRM_MODE_DISCONNECTED);
+
+	for_each_pipe(&data->display, pipe) {
+		igt_flush_uevents(mon);
+		/* Check if we get a sysfs hotplug event */
+		chamelium_plug(data->chamelium, port);
+		wait_for_connector_after_hotplug(data, mon, port,
+						 DRM_MODE_CONNECTED);
+		igt_flush_uevents(mon);
+		output = get_output_for_port(data, port);
+
+		/* If pipe is valid for output then set it */
+		if (igt_pipe_connector_valid(pipe, output)) {
+			igt_output_set_pipe(output, pipe);
+			igt_display_commit2(&data->display, COMMIT_ATOMIC);
+		}
+
+		chamelium_unplug(data->chamelium, port);
+		wait_for_connector_after_hotplug(data, mon, port,
+						 DRM_MODE_DISCONNECTED);
+		igt_flush_uevents(mon);
+	}
+
+	igt_cleanup_uevents(mon);
+	igt_hpd_storm_reset(data->drm_fd);
+}
+
+static const char test_suspend_resume_hpd_desc[] =
+	"Toggle HPD during suspend, check that uevents are sent and connector "
+	"status is updated";
+static void test_suspend_resume_hpd(data_t *data, struct chamelium_port *port,
+				    enum igt_suspend_state state,
+				    enum igt_suspend_test test)
+{
+	struct udev_monitor *mon = igt_watch_uevents();
+
+	igt_modeset_disable_all_outputs(&data->display);
+	chamelium_reset_state(&data->display, data->chamelium, port,
+			      data->ports, data->port_count);
+
+	/* Make sure we notice new connectors after resuming */
+	try_suspend_resume_hpd(data, port, state, test, mon, false);
+
+	/* Now make sure we notice disconnected connectors after resuming */
+	try_suspend_resume_hpd(data, port, state, test, mon, true);
+
+	igt_cleanup_uevents(mon);
+}
+
+static const char test_suspend_resume_hpd_common_desc[] =
+	"Toggle HPD during suspend on all connectors, check that uevents are "
+	"sent and connector status is updated";
+static void test_suspend_resume_hpd_common(data_t *data,
+					   enum igt_suspend_state state,
+					   enum igt_suspend_test test)
+{
+	struct udev_monitor *mon = igt_watch_uevents();
+	struct chamelium_port *port;
+	int p;
+
+	for (p = 0; p < data->port_count; p++) {
+		port = data->ports[p];
+		igt_debug("Testing port %s\n", chamelium_port_get_name(port));
+	}
+
+	igt_modeset_disable_all_outputs(&data->display);
+	chamelium_reset_state(&data->display, data->chamelium, NULL,
+			      data->ports, data->port_count);
+
+	/* Make sure we notice new connectors after resuming */
+	try_suspend_resume_hpd(data, NULL, state, test, mon, false);
+
+	/* Now make sure we notice disconnected connectors after resuming */
+	try_suspend_resume_hpd(data, NULL, state, test, mon, true);
+
+	igt_cleanup_uevents(mon);
+}
+
+static const char test_hpd_without_ddc_desc[] =
+	"Disable DDC on a VGA connector, check we still get a uevent on hotplug";
+static void test_hpd_without_ddc(data_t *data, struct chamelium_port *port)
+{
+	struct udev_monitor *mon = igt_watch_uevents();
+
+	igt_modeset_disable_all_outputs(&data->display);
+	chamelium_reset_state(&data->display, data->chamelium, port,
+			      data->ports, data->port_count);
+	igt_flush_uevents(mon);
+
+	/* Disable the DDC on the connector and make sure we still get a
+	 * hotplug
+	 */
+	chamelium_port_set_ddc_state(data->chamelium, port, false);
+	chamelium_plug(data->chamelium, port);
+
+	igt_assert(igt_hotplug_detected(mon, CHAMELIUM_HOTPLUG_TIMEOUT));
+	igt_assert_eq(chamelium_reprobe_connector(&data->display,
+						  data->chamelium, port),
+		      DRM_MODE_CONNECTED);
+
+	igt_cleanup_uevents(mon);
+}
+
+static const char test_hpd_storm_detect_desc[] =
+	"Trigger a series of hotplugs in a very small timeframe to simulate a"
+	"bad cable, check the kernel falls back to polling to avoid a hotplug "
+	"storm";
+static void test_hpd_storm_detect(data_t *data, struct chamelium_port *port,
+				  int width)
+{
+	struct udev_monitor *mon;
+	int count = 0;
+
+	igt_require_hpd_storm_ctl(data->drm_fd);
+	igt_modeset_disable_all_outputs(&data->display);
+	chamelium_reset_state(&data->display, data->chamelium, port,
+			      data->ports, data->port_count);
+
+	igt_hpd_storm_set_threshold(data->drm_fd, 1);
+	chamelium_fire_hpd_pulses(data->chamelium, port, width, 10);
+	igt_assert(igt_hpd_storm_detected(data->drm_fd));
+
+	mon = igt_watch_uevents();
+	chamelium_fire_hpd_pulses(data->chamelium, port, width, 10);
+
+	/*
+	 * Polling should have been enabled by the HPD storm at this point,
+	 * so we should only get at most 1 hotplug event
+	 */
+	igt_until_timeout(5)
+		count += igt_hotplug_detected(mon, 1);
+	igt_assert_lt(count, 2);
+
+	igt_cleanup_uevents(mon);
+	igt_hpd_storm_reset(data->drm_fd);
+}
+
+static const char test_hpd_storm_disable_desc[] =
+	"Disable HPD storm detection, trigger a storm and check the kernel "
+	"doesn't detect one";
+static void test_hpd_storm_disable(data_t *data, struct chamelium_port *port,
+				   int width)
+{
+	igt_require_hpd_storm_ctl(data->drm_fd);
+	igt_modeset_disable_all_outputs(&data->display);
+	chamelium_reset_state(&data->display, data->chamelium, port,
+			      data->ports, data->port_count);
+
+	igt_hpd_storm_set_threshold(data->drm_fd, 0);
+	chamelium_fire_hpd_pulses(data->chamelium, port, width, 10);
+	igt_assert(!igt_hpd_storm_detected(data->drm_fd));
+
+	igt_hpd_storm_reset(data->drm_fd);
+}
+
+IGT_TEST_DESCRIPTION("Testing HPD with a Chamelium board");
+igt_main
+{
+	data_t data;
+	struct chamelium_port *port;
+	int p;
+
+	igt_fixture {
+		init_chamelium(&data);
+	}
+
+	igt_describe("DisplayPort tests");
+	igt_subtest_group {
+		igt_fixture {
+			chamelium_require_connector_present(
+				data.ports, DRM_MODE_CONNECTOR_DisplayPort,
+				data.port_count, 1);
+		}
+
+		igt_describe(test_basic_hotplug_desc);
+		connector_subtest("dp-hpd", DisplayPort)
+			test_hotplug(&data, port, HPD_TOGGLE_COUNT_DP_HDMI,
+				     TEST_MODESET_OFF);
+
+		igt_describe(test_basic_hotplug_desc);
+		connector_subtest("dp-hpd-fast", DisplayPort) test_hotplug(
+			&data, port, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
+
+		igt_describe(test_basic_hotplug_desc);
+		connector_subtest("dp-hpd-enable-disable-mode", DisplayPort)
+			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
+				     TEST_MODESET_ON_OFF);
+
+		igt_describe(test_basic_hotplug_desc);
+		connector_subtest("dp-hpd-with-enabled-mode", DisplayPort)
+			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
+				     TEST_MODESET_ON);
+
+		igt_describe(test_hotplug_for_each_pipe_desc);
+		connector_subtest("dp-hpd-for-each-pipe", DisplayPort)
+			test_hotplug_for_each_pipe(&data, port);
+
+		igt_describe(test_suspend_resume_hpd_desc);
+		connector_subtest("dp-hpd-after-suspend", DisplayPort)
+			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_MEM,
+						SUSPEND_TEST_NONE);
+
+		igt_describe(test_suspend_resume_hpd_desc);
+		connector_subtest("dp-hpd-after-hibernate", DisplayPort)
+			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_DISK,
+						SUSPEND_TEST_DEVICES);
+
+		igt_describe(test_hpd_storm_detect_desc);
+		connector_subtest("dp-hpd-storm", DisplayPort)
+			test_hpd_storm_detect(&data, port,
+					      HPD_STORM_PULSE_INTERVAL_DP);
+
+		igt_describe(test_hpd_storm_disable_desc);
+		connector_subtest("dp-hpd-storm-disable", DisplayPort)
+			test_hpd_storm_disable(&data, port,
+					       HPD_STORM_PULSE_INTERVAL_DP);
+	}
+
+	igt_describe("HDMI tests");
+	igt_subtest_group {
+		igt_fixture {
+			chamelium_require_connector_present(
+				data.ports, DRM_MODE_CONNECTOR_HDMIA,
+				data.port_count, 1);
+		}
+
+		igt_describe(test_basic_hotplug_desc);
+		connector_subtest("hdmi-hpd", HDMIA)
+			test_hotplug(&data, port, HPD_TOGGLE_COUNT_DP_HDMI,
+				     TEST_MODESET_OFF);
+
+		igt_describe(test_basic_hotplug_desc);
+		connector_subtest("hdmi-hpd-fast", HDMIA) test_hotplug(
+			&data, port, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
+
+		igt_describe(test_basic_hotplug_desc);
+		connector_subtest("hdmi-hpd-enable-disable-mode", HDMIA)
+			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
+				     TEST_MODESET_ON_OFF);
+
+		igt_describe(test_basic_hotplug_desc);
+		connector_subtest("hdmi-hpd-with-enabled-mode", HDMIA)
+			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
+				     TEST_MODESET_ON);
+
+		igt_describe(test_hotplug_for_each_pipe_desc);
+		connector_subtest("hdmi-hpd-for-each-pipe", HDMIA)
+			test_hotplug_for_each_pipe(&data, port);
+
+		igt_describe(test_suspend_resume_hpd_desc);
+		connector_subtest("hdmi-hpd-after-suspend", HDMIA)
+			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_MEM,
+						SUSPEND_TEST_NONE);
+
+		igt_describe(test_suspend_resume_hpd_desc);
+		connector_subtest("hdmi-hpd-after-hibernate", HDMIA)
+			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_DISK,
+						SUSPEND_TEST_DEVICES);
+
+		igt_describe(test_hpd_storm_detect_desc);
+		connector_subtest("hdmi-hpd-storm", HDMIA)
+			test_hpd_storm_detect(&data, port,
+					      HPD_STORM_PULSE_INTERVAL_HDMI);
+
+		igt_describe(test_hpd_storm_disable_desc);
+		connector_subtest("hdmi-hpd-storm-disable", HDMIA)
+			test_hpd_storm_disable(&data, port,
+					       HPD_STORM_PULSE_INTERVAL_HDMI);
+	}
+
+	igt_describe("VGA tests");
+	igt_subtest_group {
+		igt_fixture {
+			chamelium_require_connector_present(
+				data.ports, DRM_MODE_CONNECTOR_VGA,
+				data.port_count, 1);
+		}
+
+		igt_describe(test_basic_hotplug_desc);
+		connector_subtest("vga-hpd", VGA) test_hotplug(
+			&data, port, HPD_TOGGLE_COUNT_VGA, TEST_MODESET_OFF);
+
+		igt_describe(test_basic_hotplug_desc);
+		connector_subtest("vga-hpd-fast", VGA) test_hotplug(
+			&data, port, HPD_TOGGLE_COUNT_FAST, TEST_MODESET_OFF);
+
+		igt_describe(test_basic_hotplug_desc);
+		connector_subtest("vga-hpd-enable-disable-mode", VGA)
+			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
+				     TEST_MODESET_ON_OFF);
+
+		igt_describe(test_basic_hotplug_desc);
+		connector_subtest("vga-hpd-with-enabled-mode", VGA)
+			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
+				     TEST_MODESET_ON);
+
+		igt_describe(test_suspend_resume_hpd_desc);
+		connector_subtest("vga-hpd-after-suspend", VGA)
+			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_MEM,
+						SUSPEND_TEST_NONE);
+
+		igt_describe(test_suspend_resume_hpd_desc);
+		connector_subtest("vga-hpd-after-hibernate", VGA)
+			test_suspend_resume_hpd(&data, port, SUSPEND_STATE_DISK,
+						SUSPEND_TEST_DEVICES);
+
+		igt_describe(test_hpd_without_ddc_desc);
+		connector_subtest("vga-hpd-without-ddc", VGA)
+			test_hpd_without_ddc(&data, port);
+	}
+
+	igt_describe("Tests that operate on all connectors");
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(data.port_count);
+		}
+
+		igt_describe(test_suspend_resume_hpd_common_desc);
+		igt_subtest("common-hpd-after-suspend")
+			test_suspend_resume_hpd_common(&data, SUSPEND_STATE_MEM,
+						       SUSPEND_TEST_NONE);
+
+		igt_describe(test_suspend_resume_hpd_common_desc);
+		igt_subtest("common-hpd-after-hibernate")
+			test_suspend_resume_hpd_common(&data,
+						       SUSPEND_STATE_DISK,
+						       SUSPEND_TEST_DEVICES);
+	}
+
+	igt_describe(test_hotplug_for_each_pipe_desc);
+	connector_subtest("vga-hpd-for-each-pipe", VGA)
+		test_hotplug_for_each_pipe(&data, port);
+
+	igt_fixture {
+		igt_display_fini(&data.display);
+		close(data.drm_fd);
+	}
+}
diff --git a/tests/chamelium/kms_chamelium.c b/tests/chamelium/kms_chamelium.c
index 3c4b4d75..d11f0271 100644
--- a/tests/chamelium/kms_chamelium.c
+++ b/tests/chamelium/kms_chamelium.c
@@ -24,50 +24,13 @@
  *    Lyude Paul <lyude@redhat.com>
  */
 
-#include "config.h"
-#include "igt.h"
-#include "igt_vc4.h"
-#include "igt_edid.h"
+#include "chamelium_helper.h"
 #include "igt_eld.h"
 #include "igt_infoframe.h"
 #include "monitor_edids/dp_edids.h"
 #include "monitor_edids/hdmi_edids.h"
 #include "monitor_edids/monitor_edids_helper.h"
 
-#include <fcntl.h>
-#include <pthread.h>
-#include <string.h>
-#include <stdatomic.h>
-// #include <stdio.h>
-
-// struct chamelium_edid;
-
-enum test_modeset_mode {
-	TEST_MODESET_ON,
-	TEST_MODESET_ON_OFF,
-	TEST_MODESET_OFF,
-};
-
-typedef struct {
-	struct chamelium *chamelium;
-	struct chamelium_port **ports;
-	igt_display_t display;
-	int port_count;
-
-	int drm_fd;
-
-	struct chamelium_edid *edids[IGT_CUSTOM_EDID_COUNT];
-} data_t;
-
-#define ONLINE_TIMEOUT 20 /* seconds */
-
-#define HPD_STORM_PULSE_INTERVAL_DP 100 /* ms */
-#define HPD_STORM_PULSE_INTERVAL_HDMI 200 /* ms */
-
-#define HPD_TOGGLE_COUNT_VGA 5
-#define HPD_TOGGLE_COUNT_DP_HDMI 15
-#define HPD_TOGGLE_COUNT_FAST 3
-
 static void
 get_connectors_link_status_failed(data_t *data, bool *link_status_failed)
 {
@@ -93,54 +56,6 @@ get_connectors_link_status_failed(data_t *data, bool *link_status_failed)
 	}
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
-static void
-wait_for_connector_after_hotplug(data_t *data, struct udev_monitor *mon,
-				 struct chamelium_port *port,
-				 drmModeConnection status)
-{
-	int timeout = CHAMELIUM_HOTPLUG_TIMEOUT;
-	int hotplug_count = 0;
-
-	igt_debug("Waiting for %s to get %s after a hotplug event...\n",
-			  chamelium_port_get_name(port),
-			  kmstest_connector_status_str(status));
-
-	while (timeout > 0) {
-		if (!wait_for_hotplug(mon, &timeout))
-			break;
-
-		hotplug_count++;
-
-		if (chamelium_reprobe_connector(&data->display, data->chamelium,
-						port) == status)
-			return;
-	}
-
-	igt_assert_f(false, "Timed out waiting for %s to get %s after a hotplug. Current state %s hotplug_count %d\n",
-			    chamelium_port_get_name(port),
-			    kmstest_connector_status_str(status),
-			    kmstest_connector_status_str(chamelium_reprobe_connector(&data->display, data->chamelium, port)), hotplug_count);
-}
-
-
 static int chamelium_vga_modes[][2] = {
 	{ 1600, 1200 },
 	{ 1920, 1200 },
@@ -209,244 +124,6 @@ check_analog_bridge(data_t *data, struct chamelium_port *port)
 	return false;
 }
 
-static void chamelium_paint_xr24_pattern(uint32_t *data,
-					 size_t width, size_t height,
-					 size_t stride, size_t block_size)
-{
-	uint32_t colors[] = { 0xff000000,
-			      0xffff0000,
-			      0xff00ff00,
-			      0xff0000ff,
-			      0xffffffff };
-	unsigned i, j;
-
-	for (i = 0; i < height; i++)
-		for (j = 0; j < width; j++)
-			*(data + i * stride / 4 + j) = colors[((j / block_size) + (i / block_size)) % 5];
-}
-
-static int chamelium_get_pattern_fb(data_t *data, size_t width, size_t height,
-				    uint32_t fourcc, size_t block_size,
-				    struct igt_fb *fb)
-{
-	int fb_id;
-	void *ptr;
-
-	igt_assert(fourcc == DRM_FORMAT_XRGB8888);
-
-	fb_id = igt_create_fb(data->drm_fd, width, height, fourcc,
-			      DRM_FORMAT_MOD_LINEAR, fb);
-	igt_assert(fb_id > 0);
-
-	ptr = igt_fb_map_buffer(fb->fd, fb);
-	igt_assert(ptr);
-
-	chamelium_paint_xr24_pattern(ptr, width, height, fb->strides[0],
-				     block_size);
-	igt_fb_unmap_buffer(fb, ptr);
-
-	return fb_id;
-}
-
-static void
-enable_output(data_t *data,
-	      struct chamelium_port *port,
-	      igt_output_t *output,
-	      drmModeModeInfo *mode,
-	      struct igt_fb *fb)
-{
-	igt_display_t *display = output->display;
-	igt_plane_t *primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	drmModeConnector *connector = chamelium_port_get_connector(
-	    data->chamelium, port, false);
-
-	igt_assert(primary);
-
-	igt_plane_set_size(primary, mode->hdisplay, mode->vdisplay);
-	igt_plane_set_fb(primary, fb);
-	igt_output_override_mode(output, mode);
-
-	/* Clear any color correction values that might be enabled */
-	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
-		igt_pipe_obj_replace_prop_blob(primary->pipe, IGT_CRTC_DEGAMMA_LUT, NULL, 0);
-	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT))
-		igt_pipe_obj_replace_prop_blob(primary->pipe, IGT_CRTC_GAMMA_LUT, NULL, 0);
-	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM))
-		igt_pipe_obj_replace_prop_blob(primary->pipe, IGT_CRTC_CTM, NULL, 0);
-
-	igt_display_commit2(display, COMMIT_ATOMIC);
-
-	if (chamelium_port_get_type(port) == DRM_MODE_CONNECTOR_VGA)
-		usleep(250000);
-
-	drmModeFreeConnector(connector);
-}
-
-static enum pipe get_pipe_for_output(igt_display_t *display, igt_output_t *output)
-{
-	enum pipe pipe;
-
-	for_each_pipe(display, pipe) {
-		if (igt_pipe_connector_valid(pipe, output)) {
-			return pipe;
-		}
-	}
-
-	igt_assert_f(false, "No pipe found for output %s\n",
-		     igt_output_name(output));
-}
-
-static void create_fb_for_mode(data_t *data, struct igt_fb *fb, drmModeModeInfo *mode)
-{
-	int fb_id;
-
-	fb_id = chamelium_get_pattern_fb(data, mode->hdisplay, mode->vdisplay,
-					 DRM_FORMAT_XRGB8888, 64, fb);
-
-	igt_assert(fb_id > 0);
-}
-
-static drmModeModeInfo get_mode_for_port(struct chamelium *chamelium,
-					 struct chamelium_port *port)
-{
-	drmModeConnector *connector = chamelium_port_get_connector(chamelium,
-								   port, false);
-	drmModeModeInfo mode;
-	igt_assert(&connector->modes[0] != NULL);
-	memcpy(&mode, &connector->modes[0], sizeof(mode));
-	drmModeFreeConnector(connector);
-	return mode;
-}
-
-static igt_output_t *get_output_for_port(data_t *data,
-					 struct chamelium_port *port)
-{
-	drmModeConnector *connector =
-		chamelium_port_get_connector(data->chamelium, port, true);
-	igt_output_t *output = igt_output_from_connector(&data->display,
-							 connector);
-	drmModeFreeConnector(connector);
-	igt_assert(output != NULL);
-	return output;
-}
-
-static const char test_hotplug_for_each_pipe_desc[] =
-	"Check that we get uevents and updated connector status on "
-	"hotplug and unplug for each pipe with valid output";
-static void
-test_hotplug_for_each_pipe(data_t *data, struct chamelium_port *port)
-{
-	igt_output_t *output;
-	enum pipe pipe;
-	struct udev_monitor *mon = igt_watch_uevents();
-
-	chamelium_reset_state(&data->display,
-			      data->chamelium,
-			      port,
-			      data->ports,
-			      data->port_count);
-
-	igt_hpd_storm_set_threshold(data->drm_fd, 0);
-	/* Disconnect if any port got connected */
-	chamelium_unplug(data->chamelium, port);
-	wait_for_connector_after_hotplug(data, mon, port,
-			DRM_MODE_DISCONNECTED);
-
-	for_each_pipe(&data->display, pipe) {
-		igt_flush_uevents(mon);
-		/* Check if we get a sysfs hotplug event */
-		chamelium_plug(data->chamelium, port);
-		wait_for_connector_after_hotplug(data, mon, port,
-				DRM_MODE_CONNECTED);
-		igt_flush_uevents(mon);
-		output = get_output_for_port(data, port);
-
-		/* If pipe is valid for output then set it */
-		if (igt_pipe_connector_valid(pipe, output)) {
-			igt_output_set_pipe(output, pipe);
-			igt_display_commit2(&data->display, COMMIT_ATOMIC);
-		}
-
-		chamelium_unplug(data->chamelium, port);
-		wait_for_connector_after_hotplug(data, mon, port,
-				DRM_MODE_DISCONNECTED);
-		igt_flush_uevents(mon);
-	}
-
-	igt_cleanup_uevents(mon);
-	igt_hpd_storm_reset(data->drm_fd);
-}
-
-static const char test_basic_hotplug_desc[] =
-	"Check that we get uevents and updated connector status on "
-	"hotplug and unplug";
-static void
-test_hotplug(data_t *data, struct chamelium_port *port, int toggle_count,
-	     enum test_modeset_mode modeset_mode)
-{
-	int i;
-	enum pipe pipe;
-	struct igt_fb fb = {0};
-	drmModeModeInfo mode;
-	struct udev_monitor *mon = igt_watch_uevents();
-	igt_output_t *output = get_output_for_port(data, port);
-
-	igt_modeset_disable_all_outputs(&data->display);
-	chamelium_reset_state(&data->display, data->chamelium, NULL,
-			      data->ports, data->port_count);
-
-
-	igt_hpd_storm_set_threshold(data->drm_fd, 0);
-
-	for (i = 0; i < toggle_count; i++) {
-		igt_flush_uevents(mon);
-
-		/* Check if we get a sysfs hotplug event */
-		chamelium_plug(data->chamelium, port);
-
-		wait_for_connector_after_hotplug(data, mon, port,
-						 DRM_MODE_CONNECTED);
-		igt_flush_uevents(mon);
-
-		if (modeset_mode == TEST_MODESET_ON_OFF ||
-		    (modeset_mode == TEST_MODESET_ON && i == 0 )) {
-			if (i == 0) {
-				/* We can only get mode and pipe once we are connected */
-				output = get_output_for_port(data, port);
-				pipe = get_pipe_for_output(&data->display, output);
-				mode = get_mode_for_port(data->chamelium, port);
-				create_fb_for_mode(data, &fb, &mode);
-			}
-
-			igt_output_set_pipe(output, pipe);
-			enable_output(data, port, output, &mode, &fb);
-		}
-
-		/* Now check if we get a hotplug from disconnection */
-		chamelium_unplug(data->chamelium, port);
-
-		wait_for_connector_after_hotplug(data, mon, port,
-						 DRM_MODE_DISCONNECTED);
-
-		igt_flush_uevents(mon);
-
-		if (modeset_mode == TEST_MODESET_ON_OFF) {
-			igt_output_set_pipe(output, PIPE_NONE);
-			igt_display_commit2(&data->display, COMMIT_ATOMIC);
-		}
-	}
-
-	igt_cleanup_uevents(mon);
-	igt_hpd_storm_reset(data->drm_fd);
-	igt_remove_fb(data->drm_fd, &fb);
-}
-
-static void set_edid(data_t *data, struct chamelium_port *port,
-		     enum igt_custom_edid_type edid)
-{
-	chamelium_port_set_edid(data->chamelium, port, data->edids[edid]);
-}
-
 static const char igt_custom_edid_type_read_desc[] =
 	"Make sure the EDID exposed by KMS is the same as the screen's";
 static void
@@ -485,120 +162,6 @@ igt_custom_edid_type_read(data_t *data, struct chamelium_port *port, enum igt_cu
 	drmModeFreeConnector(connector);
 }
 
-static void
-try_suspend_resume_hpd(data_t *data, struct chamelium_port *port,
-		       enum igt_suspend_state state, enum igt_suspend_test test,
-		       struct udev_monitor *mon, bool connected)
-{
-	drmModeConnection target_state = connected ? DRM_MODE_DISCONNECTED :
-						     DRM_MODE_CONNECTED;
-	int timeout = CHAMELIUM_HOTPLUG_TIMEOUT;
-	int delay;
-	int p;
-
-	igt_flush_uevents(mon);
-
-	delay = igt_get_autoresume_delay(state) * 1000 / 2;
-
-	if (port) {
-		chamelium_schedule_hpd_toggle(data->chamelium, port, delay,
-					      !connected);
-	} else {
-		for (p = 0; p < data->port_count; p++) {
-			port = data->ports[p];
-			chamelium_schedule_hpd_toggle(data->chamelium, port,
-						      delay, !connected);
-		}
-
-		port = NULL;
-	}
-
-	igt_system_suspend_autoresume(state, test);
-	igt_assert(wait_for_hotplug(mon, &timeout));
-	chamelium_assert_reachable(data->chamelium, ONLINE_TIMEOUT);
-
-	if (port) {
-		igt_assert_eq(chamelium_reprobe_connector(&data->display,
-							  data->chamelium,
-							  port),
-							  target_state);
-	} else {
-		for (p = 0; p < data->port_count; p++) {
-			drmModeConnection current_state;
-
-			port = data->ports[p];
-			/*
-			 * There could be as many hotplug events sent by
-			 * driver as connectors we scheduled an HPD toggle on
-			 * above, depending on timing. So if we're not seeing
-			 * the expected connector state try to wait for an HPD
-			 * event for each connector/port.
-			 */
-			current_state = chamelium_reprobe_connector(&data->display, data->chamelium, port);
-			if (p > 0 && current_state != target_state) {
-				igt_assert(wait_for_hotplug(mon, &timeout));
-				current_state = chamelium_reprobe_connector(&data->display, data->chamelium, port);
-			}
-
-			igt_assert_eq(current_state, target_state);
-		}
-
-		port = NULL;
-	}
-}
-
-static const char test_suspend_resume_hpd_desc[] =
-	"Toggle HPD during suspend, check that uevents are sent and connector "
-	"status is updated";
-static void
-test_suspend_resume_hpd(data_t *data, struct chamelium_port *port,
-			enum igt_suspend_state state,
-			enum igt_suspend_test test)
-{
-	struct udev_monitor *mon = igt_watch_uevents();
-
-	igt_modeset_disable_all_outputs(&data->display);
-	chamelium_reset_state(&data->display, data->chamelium,
-			      port, data->ports, data->port_count);
-
-	/* Make sure we notice new connectors after resuming */
-	try_suspend_resume_hpd(data, port, state, test, mon, false);
-
-	/* Now make sure we notice disconnected connectors after resuming */
-	try_suspend_resume_hpd(data, port, state, test, mon, true);
-
-	igt_cleanup_uevents(mon);
-}
-
-static const char test_suspend_resume_hpd_common_desc[] =
-	"Toggle HPD during suspend on all connectors, check that uevents are "
-	"sent and connector status is updated";
-static void
-test_suspend_resume_hpd_common(data_t *data, enum igt_suspend_state state,
-			       enum igt_suspend_test test)
-{
-	struct udev_monitor *mon = igt_watch_uevents();
-	struct chamelium_port *port;
-	int p;
-
-	for (p = 0; p < data->port_count; p++) {
-		port = data->ports[p];
-		igt_debug("Testing port %s\n", chamelium_port_get_name(port));
-	}
-
-	igt_modeset_disable_all_outputs(&data->display);
-	chamelium_reset_state(&data->display, data->chamelium, NULL,
-			      data->ports, data->port_count);
-
-	/* Make sure we notice new connectors after resuming */
-	try_suspend_resume_hpd(data, NULL, state, test, mon, false);
-
-	/* Now make sure we notice disconnected connectors after resuming */
-	try_suspend_resume_hpd(data, NULL, state, test, mon, true);
-
-	igt_cleanup_uevents(mon);
-}
-
 static const char test_suspend_resume_edid_change_desc[] =
 	"Simulate a screen being unplugged and another screen being plugged "
 	"during suspend, check that a uevent is sent and connector status is "
@@ -2468,85 +2031,6 @@ static void test_display_planes_random(data_t *data,
 	igt_remove_fb(data->drm_fd, &result_fb);
 }
 
-static const char test_hpd_without_ddc_desc[] =
-	"Disable DDC on a VGA connector, check we still get a uevent on hotplug";
-static void
-test_hpd_without_ddc(data_t *data, struct chamelium_port *port)
-{
-	struct udev_monitor *mon = igt_watch_uevents();
-
-	igt_modeset_disable_all_outputs(&data->display);
-	chamelium_reset_state(&data->display, data->chamelium,
-			      port, data->ports, data->port_count);
-	igt_flush_uevents(mon);
-
-	/* Disable the DDC on the connector and make sure we still get a
-	 * hotplug
-	 */
-	chamelium_port_set_ddc_state(data->chamelium, port, false);
-	chamelium_plug(data->chamelium, port);
-
-	igt_assert(igt_hotplug_detected(mon, CHAMELIUM_HOTPLUG_TIMEOUT));
-	igt_assert_eq(chamelium_reprobe_connector(&data->display,
-						  data->chamelium, port),
-						  DRM_MODE_CONNECTED);
-
-	igt_cleanup_uevents(mon);
-}
-
-static const char test_hpd_storm_detect_desc[] =
-	"Trigger a series of hotplugs in a very small timeframe to simulate a"
-	"bad cable, check the kernel falls back to polling to avoid a hotplug "
-	"storm";
-static void
-test_hpd_storm_detect(data_t *data, struct chamelium_port *port, int width)
-{
-	struct udev_monitor *mon;
-	int count = 0;
-
-	igt_require_hpd_storm_ctl(data->drm_fd);
-	igt_modeset_disable_all_outputs(&data->display);
-	chamelium_reset_state(&data->display, data->chamelium,
-			      port, data->ports, data->port_count);
-
-	igt_hpd_storm_set_threshold(data->drm_fd, 1);
-	chamelium_fire_hpd_pulses(data->chamelium, port, width, 10);
-	igt_assert(igt_hpd_storm_detected(data->drm_fd));
-
-	mon = igt_watch_uevents();
-	chamelium_fire_hpd_pulses(data->chamelium, port, width, 10);
-
-	/*
-	 * Polling should have been enabled by the HPD storm at this point,
-	 * so we should only get at most 1 hotplug event
-	 */
-	igt_until_timeout(5)
-		count += igt_hotplug_detected(mon, 1);
-	igt_assert_lt(count, 2);
-
-	igt_cleanup_uevents(mon);
-	igt_hpd_storm_reset(data->drm_fd);
-}
-
-static const char test_hpd_storm_disable_desc[] =
-	"Disable HPD storm detection, trigger a storm and check the kernel "
-	"doesn't detect one";
-static void
-test_hpd_storm_disable(data_t *data, struct chamelium_port *port, int width)
-{
-	igt_require_hpd_storm_ctl(data->drm_fd);
-	igt_modeset_disable_all_outputs(&data->display);
-	chamelium_reset_state(&data->display, data->chamelium,
-			      port, data->ports, data->port_count);
-
-	igt_hpd_storm_set_threshold(data->drm_fd, 0);
-	chamelium_fire_hpd_pulses(data->chamelium, port,
-				  width, 10);
-	igt_assert(!igt_hpd_storm_detected(data->drm_fd));
-
-	igt_hpd_storm_reset(data->drm_fd);
-}
-
 static const char igt_edid_stress_resolution_desc[] =
 	"Stress test the DUT by testing multiple EDIDs, one right after the other,"
 	"and ensure their validity by check the real screen resolution vs the"
@@ -2673,58 +2157,21 @@ static void edid_resolution_list(data_t *data, struct chamelium_port *port)
 	drmModeFreeConnector(connector);
 }
 
-#define for_each_port(p, port)            \
-	for (p = 0, port = data.ports[p]; \
-	     p < data.port_count;         \
-	     p++, port = data.ports[p])
-
-#define connector_subtest(name__, type__)                    \
-	igt_subtest(name__)                                  \
-		for_each_port(p, port)                       \
-			if (chamelium_port_get_type(port) == \
-			    DRM_MODE_CONNECTOR_ ## type__)
-
 #define connector_dynamic_subtest(name__, type__)            \
 	igt_subtest_with_dynamic(name__)                     \
 		for_each_port(p, port)                       \
 			if (chamelium_port_get_type(port) == \
 			    DRM_MODE_CONNECTOR_ ## type__)
 
-
-static data_t data;
-
 IGT_TEST_DESCRIPTION("Tests requiring a Chamelium board");
 igt_main
 {
+	data_t data;
 	struct chamelium_port *port;
 	int p;
-	size_t i;
 
 	igt_fixture {
-		/* So fbcon doesn't try to reprobe things itself */
-		kmstest_set_vt_graphics_mode();
-
-		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
-		igt_display_require(&data.display, data.drm_fd);
-		igt_require(data.display.is_atomic);
-
-		/*
-		 * XXX: disabling modeset, can be removed when
-		 * igt_display_require will start doing this for us
-		 */
-		igt_display_commit2(&data.display, COMMIT_ATOMIC);
-
-		/* we need to initalize chamelium after igt_display_require */
-		data.chamelium = chamelium_init(data.drm_fd, &data.display);
-		igt_require(data.chamelium);
-
-		data.ports = chamelium_get_ports(data.chamelium,
-						 &data.port_count);
-
-		for (i = 0; i < IGT_CUSTOM_EDID_COUNT; ++i) {
-			data.edids[i] = chamelium_new_edid(data.chamelium,
-							   igt_kms_get_custom_edid(i));
-		}
+		init_chamelium(&data);
 	}
 
 	igt_describe("DisplayPort tests");
@@ -2734,30 +2181,6 @@ igt_main
 							    data.port_count, 1);
 		}
 
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("dp-hpd", DisplayPort)
-			test_hotplug(&data, port,
-				     HPD_TOGGLE_COUNT_DP_HDMI,
-				     TEST_MODESET_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("dp-hpd-fast", DisplayPort)
-			test_hotplug(&data, port,
-				     HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("dp-hpd-enable-disable-mode", DisplayPort)
-			test_hotplug(&data, port,
-				     HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("dp-hpd-with-enabled-mode", DisplayPort)
-			test_hotplug(&data, port,
-				     HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON);
-
 		igt_describe(igt_custom_edid_type_read_desc);
 		connector_subtest("dp-edid-read", DisplayPort) {
 			igt_custom_edid_type_read(&data, port, IGT_CUSTOM_EDID_BASE);
@@ -2779,28 +2202,6 @@ igt_main
 		connector_subtest("dp-edid-resolution-list", DisplayPort)
 			edid_resolution_list(&data, port);
 
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("dp-hpd-after-suspend", DisplayPort)
-			test_suspend_resume_hpd(&data, port,
-						SUSPEND_STATE_MEM,
-						SUSPEND_TEST_NONE);
-
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("dp-hpd-after-hibernate", DisplayPort)
-			test_suspend_resume_hpd(&data, port,
-						SUSPEND_STATE_DISK,
-						SUSPEND_TEST_DEVICES);
-
-		igt_describe(test_hpd_storm_detect_desc);
-		connector_subtest("dp-hpd-storm", DisplayPort)
-			test_hpd_storm_detect(&data, port,
-					      HPD_STORM_PULSE_INTERVAL_DP);
-
-		igt_describe(test_hpd_storm_disable_desc);
-		connector_subtest("dp-hpd-storm-disable", DisplayPort)
-			test_hpd_storm_disable(&data, port,
-					       HPD_STORM_PULSE_INTERVAL_DP);
-
 		igt_describe(test_suspend_resume_edid_change_desc);
 		connector_subtest("dp-edid-change-during-suspend", DisplayPort)
 			test_suspend_resume_edid_change(&data, port,
@@ -2849,10 +2250,6 @@ igt_main
 		connector_subtest("dp-audio-edid", DisplayPort)
 			test_display_audio_edid(&data, port,
 						IGT_CUSTOM_EDID_DP_AUDIO);
-
-		igt_describe(test_hotplug_for_each_pipe_desc);
-		connector_subtest("dp-hpd-for-each-pipe", DisplayPort)
-			test_hotplug_for_each_pipe(&data, port);
 	}
 
 	igt_describe("HDMI tests");
@@ -2862,30 +2259,6 @@ igt_main
 							    data.port_count, 1);
 		}
 
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("hdmi-hpd", HDMIA)
-			test_hotplug(&data, port,
-				     HPD_TOGGLE_COUNT_DP_HDMI,
-				     TEST_MODESET_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("hdmi-hpd-fast", HDMIA)
-			test_hotplug(&data, port,
-				     HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("hdmi-hpd-enable-disable-mode", HDMIA)
-			test_hotplug(&data, port,
-				     HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("hdmi-hpd-with-enabled-mode", HDMIA)
-			test_hotplug(&data, port,
-				     HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON);
-
 		igt_describe(igt_custom_edid_type_read_desc);
 		connector_subtest("hdmi-edid-read", HDMIA) {
 			igt_custom_edid_type_read(&data, port, IGT_CUSTOM_EDID_BASE);
@@ -2902,28 +2275,6 @@ igt_main
 			edid_stress_resolution(&data, port, HDMI_EDIDS_NON_4K,
 					       ARRAY_SIZE(HDMI_EDIDS_NON_4K));
 
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("hdmi-hpd-after-suspend", HDMIA)
-			test_suspend_resume_hpd(&data, port,
-						SUSPEND_STATE_MEM,
-						SUSPEND_TEST_NONE);
-
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("hdmi-hpd-after-hibernate", HDMIA)
-			test_suspend_resume_hpd(&data, port,
-						SUSPEND_STATE_DISK,
-						SUSPEND_TEST_DEVICES);
-
-		igt_describe(test_hpd_storm_detect_desc);
-		connector_subtest("hdmi-hpd-storm", HDMIA)
-			test_hpd_storm_detect(&data, port,
-					      HPD_STORM_PULSE_INTERVAL_HDMI);
-
-		igt_describe(test_hpd_storm_disable_desc);
-		connector_subtest("hdmi-hpd-storm-disable", HDMIA)
-			test_hpd_storm_disable(&data, port,
-					       HPD_STORM_PULSE_INTERVAL_HDMI);
-
 		igt_describe(test_suspend_resume_edid_change_desc);
 		connector_subtest("hdmi-edid-change-during-suspend", HDMIA)
 			test_suspend_resume_edid_change(&data, port,
@@ -3038,10 +2389,6 @@ igt_main
 		igt_describe(test_display_aspect_ratio_desc);
 		connector_subtest("hdmi-aspect-ratio", HDMIA)
 			test_display_aspect_ratio(&data, port);
-
-		igt_describe(test_hotplug_for_each_pipe_desc);
-		connector_subtest("hdmi-hpd-for-each-pipe", HDMIA)
-			test_hotplug_for_each_pipe(&data, port);
 	}
 
 	igt_describe("VGA tests");
@@ -3051,80 +2398,18 @@ igt_main
 							    data.port_count, 1);
 		}
 
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("vga-hpd", VGA)
-			test_hotplug(&data, port, HPD_TOGGLE_COUNT_VGA,
-				     TEST_MODESET_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("vga-hpd-fast", VGA)
-			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("vga-hpd-enable-disable-mode", VGA)
-			test_hotplug(&data, port,
-				     HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON_OFF);
-
-		igt_describe(test_basic_hotplug_desc);
-		connector_subtest("vga-hpd-with-enabled-mode", VGA)
-			test_hotplug(&data, port,
-				     HPD_TOGGLE_COUNT_FAST,
-				     TEST_MODESET_ON);
-
 		igt_describe(igt_custom_edid_type_read_desc);
 		connector_subtest("vga-edid-read", VGA) {
 			igt_custom_edid_type_read(&data, port, IGT_CUSTOM_EDID_BASE);
 			igt_custom_edid_type_read(&data, port, IGT_CUSTOM_EDID_ALT);
 		}
 
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("vga-hpd-after-suspend", VGA)
-			test_suspend_resume_hpd(&data, port,
-						SUSPEND_STATE_MEM,
-						SUSPEND_TEST_NONE);
-
-		igt_describe(test_suspend_resume_hpd_desc);
-		connector_subtest("vga-hpd-after-hibernate", VGA)
-			test_suspend_resume_hpd(&data, port,
-						SUSPEND_STATE_DISK,
-						SUSPEND_TEST_DEVICES);
-
-		igt_describe(test_hpd_without_ddc_desc);
-		connector_subtest("vga-hpd-without-ddc", VGA)
-			test_hpd_without_ddc(&data, port);
-
 		igt_describe(test_display_all_modes_desc);
 		connector_subtest("vga-frame-dump", VGA)
 			test_display_all_modes(&data, port, DRM_FORMAT_XRGB8888,
 					       CHAMELIUM_CHECK_ANALOG, 1);
 	}
 
-	igt_describe("Tests that operate on all connectors");
-	igt_subtest_group {
-
-		igt_fixture {
-			igt_require(data.port_count);
-		}
-
-		igt_describe(test_suspend_resume_hpd_common_desc);
-		igt_subtest("common-hpd-after-suspend")
-			test_suspend_resume_hpd_common(&data,
-						       SUSPEND_STATE_MEM,
-						       SUSPEND_TEST_NONE);
-
-		igt_describe(test_suspend_resume_hpd_common_desc);
-		igt_subtest("common-hpd-after-hibernate")
-			test_suspend_resume_hpd_common(&data,
-						       SUSPEND_STATE_DISK,
-						       SUSPEND_TEST_DEVICES);
-	}
-
-	igt_describe(test_hotplug_for_each_pipe_desc);
-	connector_subtest("vga-hpd-for-each-pipe", VGA)
-		test_hotplug_for_each_pipe(&data, port);
-
 	igt_fixture {
 		igt_display_fini(&data.display);
 		close(data.drm_fd);
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index f0ae30e3..9d3b5cf6 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -27,7 +27,7 @@
 
 /*
  * This header is for code that is shared between kms_color.c and
- * kms_color_chamelium.c. Reusability elsewhere can be questionable.
+ * chamelium_color.c. Reusability elsewhere can be questionable.
  */
 
 #include <math.h>
diff --git a/tests/meson.build b/tests/meson.build
index 12e53e0b..83a1bc39 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -260,6 +260,7 @@ msm_progs = [
 
 chamelium_progs = [
 	'kms_chamelium',
+	'chamelium_hpd',
 ]
 
 test_deps = [ igt_deps ]
@@ -308,7 +309,7 @@ endforeach
 if chamelium.found()
 	foreach prog : chamelium_progs
 		test_executables += executable(prog,
-				 join_paths('chamelium', prog + '.c'),
+				 [join_paths('chamelium', prog + '.c'), join_paths('chamelium', 'chamelium_helper.c')],
 				 dependencies : test_deps,
 				 install_dir : libexecdir,
 				 install_rpath : libexecdir_rpathdir,
@@ -435,13 +436,13 @@ test_executables += executable('kms_color',
 test_list += 'kms_color'
 
 if chamelium.found()
-       test_executables += executable('kms_color_chamelium',
-                             [ 'chamelium/kms_color_chamelium.c', 'kms_color_helper.c' ],
+       test_executables += executable('chamelium_color',
+                             [ 'chamelium/chamelium_color.c', 'kms_color_helper.c' ],
                              dependencies : test_deps + [ chamelium ],
                              install_dir : libexecdir,
                              install_rpath : libexecdir_rpathdir,
                              install : true)
-       test_list += 'kms_color_chamelium'
+       test_list += 'chamelium_color'
 endif
 
 test_executables += executable('sw_sync', 'sw_sync.c',
-- 
2.38.1.584.g0f3c55d4c2-goog
