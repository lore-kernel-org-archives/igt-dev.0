Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174F86E871
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2020 13:19:40 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue, 7 Apr 2020 16:19:26 +0300
Message-ID: <20200407131926.1350556-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200407131633.1350311-1-arkadiusz.hiler@intel.com>
References: <20200407131633.1350311-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 7/7] tests/kms_chamelium: Test HPD for
 different mode handling scenarios
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

The default scenario is now performing all hotplugs with modes disabled
on all connectors. This is the quickest of the tests and represents
userspace not caring about the new display (e.g. explicitly disabled).

*-hpd-enable-disable-mode covers the most common userspace behavior
where each hotplug event is accompanied by a corresponding enabling /
disabling commit.

*-hpd-with-enabled-mode explicitly targets the scenario where we have
mode enabled and never disable it as we do hotplugs to reproduce the
issue we see with TypeC connectors for ICL and TGL.

v2:
 - refresh igt_display output state after reprobing
 - get mode and set pipe only after we have connector plugged in

v3: fix VGA subtest names (Kunal)

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Issue: https://gitlab.freedesktop.org/drm/intel/issues/323
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c         |   2 +-
 lib/igt_kms.h         |   1 +
 tests/kms_chamelium.c | 315 ++++++++++++++++++++++++++++--------------
 3 files changed, 216 insertions(+), 102 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9d384fc9..67ca362f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1666,7 +1666,7 @@ static void igt_display_log_shift(igt_display_t *display, int shift)
 	igt_assert(display->log_shift >= 0);
 }
 
-static void igt_output_refresh(igt_output_t *output)
+void igt_output_refresh(igt_output_t *output)
 {
 	igt_display_t *display = output->display;
 	unsigned long crtc_idx_mask = 0;
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index cd3fdbc0..adca59ac 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -423,6 +423,7 @@ igt_plane_t *igt_output_get_plane_type_index(igt_output_t *output,
 					     int plane_type, int index);
 igt_output_t *igt_output_from_connector(igt_display_t *display,
     drmModeConnector *connector);
+void igt_output_refresh(igt_output_t *output);
 const drmModeModeInfo *igt_std_1024_mode_get(void);
 
 igt_plane_t *igt_pipe_get_plane_type(igt_pipe_t *pipe, int plane_type);
diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
index 236e1010..77c203d3 100644
--- a/tests/kms_chamelium.c
+++ b/tests/kms_chamelium.c
@@ -45,6 +45,12 @@ enum test_edid {
 };
 #define TEST_EDID_COUNT 5
 
+enum test_modeset_mode {
+	TEST_MODESET_ON,
+	TEST_MODESET_ON_OFF,
+	TEST_MODESET_OFF,
+};
+
 typedef struct {
 	struct chamelium *chamelium;
 	struct chamelium_port **ports;
@@ -111,12 +117,17 @@ reprobe_connector(data_t *data, struct chamelium_port *port)
 {
 	drmModeConnector *connector;
 	drmModeConnection status;
+	igt_output_t *output;
 
 	igt_debug("Reprobing %s...\n", chamelium_port_get_name(port));
 	connector = chamelium_port_get_connector(data->chamelium, port, true);
 	igt_assert(connector);
 	status = connector->connection;
 
+	/* let's make sure that igt_display is up to date too */
+	output = igt_output_from_connector(&data->display, connector);
+	igt_output_refresh(output);
+
 	drmModeFreeConnector(connector);
 	return status;
 }
@@ -294,14 +305,140 @@ reset_state(data_t *data, struct chamelium_port *port)
 	}
 }
 
+static void chamelium_paint_xr24_pattern(uint32_t *data,
+					 size_t width, size_t height,
+					 size_t stride, size_t block_size)
+{
+	uint32_t colors[] = { 0xff000000,
+			      0xffff0000,
+			      0xff00ff00,
+			      0xff0000ff,
+			      0xffffffff };
+	unsigned i, j;
+
+	for (i = 0; i < height; i++)
+		for (j = 0; j < width; j++)
+			*(data + i * stride / 4 + j) = colors[((j / block_size) + (i / block_size)) % 5];
+}
+
+static int chamelium_get_pattern_fb(data_t *data, size_t width, size_t height,
+				    uint32_t fourcc, size_t block_size,
+				    struct igt_fb *fb)
+{
+	int fb_id;
+	void *ptr;
+
+	igt_assert(fourcc == DRM_FORMAT_XRGB8888);
+
+	fb_id = igt_create_fb(data->drm_fd, width, height, fourcc,
+			      LOCAL_DRM_FORMAT_MOD_NONE, fb);
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
+static void
+enable_output(data_t *data,
+	      struct chamelium_port *port,
+	      igt_output_t *output,
+	      drmModeModeInfo *mode,
+	      struct igt_fb *fb)
+{
+	igt_display_t *display = output->display;
+	igt_plane_t *primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	drmModeConnector *connector = chamelium_port_get_connector(
+	    data->chamelium, port, false);
+
+	igt_assert(primary);
+
+	igt_plane_set_size(primary, mode->hdisplay, mode->vdisplay);
+	igt_plane_set_fb(primary, fb);
+	igt_output_override_mode(output, mode);
+
+	/* Clear any color correction values that might be enabled */
+	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
+		igt_pipe_obj_replace_prop_blob(primary->pipe, IGT_CRTC_DEGAMMA_LUT, NULL, 0);
+	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT))
+		igt_pipe_obj_replace_prop_blob(primary->pipe, IGT_CRTC_GAMMA_LUT, NULL, 0);
+	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM))
+		igt_pipe_obj_replace_prop_blob(primary->pipe, IGT_CRTC_CTM, NULL, 0);
+
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	if (chamelium_port_get_type(port) == DRM_MODE_CONNECTOR_VGA)
+		usleep(250000);
+
+	drmModeFreeConnector(connector);
+}
+
+static enum pipe get_pipe_for_output(igt_display_t *display, igt_output_t *output)
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
+static void create_fb_for_mode(data_t *data, struct igt_fb *fb, drmModeModeInfo *mode)
+{
+	int fb_id;
+
+	fb_id = chamelium_get_pattern_fb(data, mode->hdisplay, mode->vdisplay,
+					 DRM_FORMAT_XRGB8888, 64, fb);
+
+	igt_assert(fb_id > 0);
+}
+
+static drmModeModeInfo get_mode_for_port(struct chamelium *chamelium,
+					 struct chamelium_port *port)
+{
+	drmModeConnector *connector = chamelium_port_get_connector(chamelium,
+								   port, false);
+	drmModeModeInfo mode;
+	igt_assert(&connector->modes[0] != NULL);
+	memcpy(&mode, &connector->modes[0], sizeof(mode));
+	drmModeFreeConnector(connector);
+	return mode;
+}
+
+static igt_output_t *get_output_for_port(data_t *data,
+					 struct chamelium_port *port)
+{
+	drmModeConnector *connector = chamelium_port_get_connector(data->chamelium,
+								   port, false);
+	igt_output_t *output = igt_output_from_connector(&data->display,
+							 connector);
+	drmModeFreeConnector(connector);
+	igt_assert(output != NULL);
+	return output;
+}
+
 static const char test_basic_hotplug_desc[] =
 	"Check that we get uevents and updated connector status on "
 	"hotplug and unplug";
 static void
-test_basic_hotplug(data_t *data, struct chamelium_port *port, int toggle_count)
+test_hotplug(data_t *data, struct chamelium_port *port, int toggle_count,
+	     enum test_modeset_mode modeset_mode)
 {
-	struct udev_monitor *mon = igt_watch_hotplug();
 	int i;
+	enum pipe pipe;
+	struct igt_fb fb = {0};
+	drmModeModeInfo mode;
+	struct udev_monitor *mon = igt_watch_hotplug();
+	igt_output_t *output = get_output_for_port(data, port);
 
 	reset_state(data, NULL);
 	igt_hpd_storm_set_threshold(data->drm_fd, 0);
@@ -316,15 +453,36 @@ test_basic_hotplug(data_t *data, struct chamelium_port *port, int toggle_count)
 						 DRM_MODE_CONNECTED);
 		igt_flush_hotplugs(mon);
 
+		if (modeset_mode == TEST_MODESET_ON_OFF ||
+		    (modeset_mode == TEST_MODESET_ON && i == 0 )) {
+			if (i == 0) {
+				/* We can only get mode and pipe once we are connected */
+				pipe = get_pipe_for_output(&data->display, output);
+				mode = get_mode_for_port(data->chamelium, port);
+				create_fb_for_mode(data, &fb, &mode);
+			}
+
+			igt_output_set_pipe(output, pipe);
+			enable_output(data, port, output, &mode, &fb);
+		}
+
 		/* Now check if we get a hotplug from disconnection */
 		chamelium_unplug(data->chamelium, port);
 
 		wait_for_connector_after_hotplug(data, mon, port,
 						 DRM_MODE_DISCONNECTED);
+
+		igt_flush_hotplugs(mon);
+
+		if (modeset_mode == TEST_MODESET_ON_OFF) {
+			igt_output_set_pipe(output, PIPE_NONE);
+			igt_display_commit2(&data->display, COMMIT_ATOMIC);
+		}
 	}
 
 	igt_cleanup_hotplug(mon);
 	igt_hpd_storm_reset(data->drm_fd);
+	igt_remove_fb(data->drm_fd, &fb);
 }
 
 static const struct edid *get_edid(enum test_edid edid);
@@ -530,10 +688,7 @@ prepare_output(data_t *data, struct chamelium_port *port, enum test_edid edid)
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
-	drmModeConnector *connector =
-		chamelium_port_get_connector(data->chamelium, port, false);
 	enum pipe pipe;
-	bool found = false;
 
 	/* The chamelium's default EDID has a lot of resolutions, way more then
 	 * we need to test. Additionally the default EDID doesn't support HDMI
@@ -546,101 +701,17 @@ prepare_output(data_t *data, struct chamelium_port *port, enum test_edid edid)
 
 	igt_display_reset(display);
 
-	output = igt_output_from_connector(display, connector);
+	output = get_output_for_port(data, port);
 
 	/* Refresh pipe to update connected status */
 	igt_output_set_pipe(output, PIPE_NONE);
 
-	for_each_pipe(display, pipe) {
-		if (!igt_pipe_connector_valid(pipe, output))
-			continue;
-
-		found = true;
-		break;
-	}
-
-	igt_assert_f(found, "No pipe found for output %s\n", igt_output_name(output));
-
+	pipe = get_pipe_for_output(display, output);
 	igt_output_set_pipe(output, pipe);
 
-	drmModeFreeConnector(connector);
-
 	return output;
 }
 
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
-			      LOCAL_DRM_FORMAT_MOD_NONE, fb);
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
 static void do_test_display(data_t *data, struct chamelium_port *port,
 			    igt_output_t *output, drmModeModeInfo *mode,
 			    uint32_t fourcc, enum chamelium_check check,
@@ -2539,13 +2610,27 @@ igt_main
 
 		igt_describe(test_basic_hotplug_desc);
 		connector_subtest("dp-hpd", DisplayPort)
-			test_basic_hotplug(&data, port,
-					   HPD_TOGGLE_COUNT_DP_HDMI);
+			test_hotplug(&data, port,
+				     HPD_TOGGLE_COUNT_DP_HDMI,
+				     TEST_MODESET_OFF);
 
 		igt_describe(test_basic_hotplug_desc);
 		connector_subtest("dp-hpd-fast", DisplayPort)
-			test_basic_hotplug(&data, port,
-					   HPD_TOGGLE_COUNT_FAST);
+			test_hotplug(&data, port,
+				     HPD_TOGGLE_COUNT_FAST,
+				     TEST_MODESET_OFF);
+
+		igt_describe(test_basic_hotplug_desc);
+		connector_subtest("dp-hpd-enable-disable-mode", DisplayPort)
+			test_hotplug(&data, port,
+				     HPD_TOGGLE_COUNT_FAST,
+				     TEST_MODESET_ON_OFF);
+
+		igt_describe(test_basic_hotplug_desc);
+		connector_subtest("dp-hpd-with-enabled-mode", DisplayPort)
+			test_hotplug(&data, port,
+				     HPD_TOGGLE_COUNT_FAST,
+				     TEST_MODESET_ON);
 
 		igt_describe(test_edid_read_desc);
 		connector_subtest("dp-edid-read", DisplayPort) {
@@ -2634,13 +2719,27 @@ igt_main
 
 		igt_describe(test_basic_hotplug_desc);
 		connector_subtest("hdmi-hpd", HDMIA)
-			test_basic_hotplug(&data, port,
-					   HPD_TOGGLE_COUNT_DP_HDMI);
+			test_hotplug(&data, port,
+				     HPD_TOGGLE_COUNT_DP_HDMI,
+				     TEST_MODESET_OFF);
 
 		igt_describe(test_basic_hotplug_desc);
 		connector_subtest("hdmi-hpd-fast", HDMIA)
-			test_basic_hotplug(&data, port,
-					   HPD_TOGGLE_COUNT_FAST);
+			test_hotplug(&data, port,
+				     HPD_TOGGLE_COUNT_FAST,
+				     TEST_MODESET_OFF);
+
+		igt_describe(test_basic_hotplug_desc);
+		connector_subtest("hdmi-hpd-enable-disable-mode", HDMIA)
+			test_hotplug(&data, port,
+				     HPD_TOGGLE_COUNT_FAST,
+				     TEST_MODESET_ON_OFF);
+
+		igt_describe(test_basic_hotplug_desc);
+		connector_subtest("hdmi-hpd-with-enabled-mode", HDMIA)
+			test_hotplug(&data, port,
+				     HPD_TOGGLE_COUNT_FAST,
+				     TEST_MODESET_ON);
 
 		igt_describe(test_edid_read_desc);
 		connector_subtest("hdmi-edid-read", HDMIA) {
@@ -2795,11 +2894,25 @@ igt_main
 
 		igt_describe(test_basic_hotplug_desc);
 		connector_subtest("vga-hpd", VGA)
-			test_basic_hotplug(&data, port, HPD_TOGGLE_COUNT_VGA);
+			test_hotplug(&data, port, HPD_TOGGLE_COUNT_VGA,
+				     TEST_MODESET_OFF);
 
 		igt_describe(test_basic_hotplug_desc);
 		connector_subtest("vga-hpd-fast", VGA)
-			test_basic_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST);
+			test_hotplug(&data, port, HPD_TOGGLE_COUNT_FAST,
+				     TEST_MODESET_OFF);
+
+		igt_describe(test_basic_hotplug_desc);
+		connector_subtest("vga-hpd-enable-disable-mode", VGA)
+			test_hotplug(&data, port,
+				     HPD_TOGGLE_COUNT_FAST,
+				     TEST_MODESET_ON_OFF);
+
+		igt_describe(test_basic_hotplug_desc);
+		connector_subtest("vga-hpd-with-enabled-mode", VGA)
+			test_hotplug(&data, port,
+				     HPD_TOGGLE_COUNT_FAST,
+				     TEST_MODESET_ON);
 
 		igt_describe(test_edid_read_desc);
 		connector_subtest("vga-edid-read", VGA) {
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
