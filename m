Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658EA89D7D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2020 06:44:57 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Mon, 23 Mar 2020 12:02:45 +0530
Message-Id: <20200323063248.5261-3-anshuman.gupta@intel.com>
In-Reply-To: <20200323063248.5261-1-anshuman.gupta@intel.com>
References: <20200323063248.5261-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 2/5] tests/i915_pm_lpsp: lpsp platform
 agnostic support
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
Cc: martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Current implementation of lpsp igt test, assumed that every non-edp
panel isn't a lpsp panel but it is not true on TGL anymore,
any HDMI/DP/DSI panel connected on pipe A and connected to PORT_{A,B,C}
can drive LPSP.
Even on older Gen9 platform a DP panel can drive lpsp on Port A.
This requires complete design change in current lpsp igt for a platform
agnostic support.

The new igt approach is relies on connector specific debugfs
attribute i915_lpsp_info, which exposes whether an output is capable
of driving lpsp and whether lpsp is enabled.

v2:
- CI failures fixup.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_lpsp.c | 303 +++++++++++++++++++++++---------------
 1 file changed, 186 insertions(+), 117 deletions(-)

diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index 42938e10..e400c92e 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/i915_pm_lpsp.c
@@ -25,49 +25,125 @@
  */
 
 #include "igt.h"
+#include "igt_kmod.h"
+#include "igt_pm.h"
+#include "igt_sysfs.h"
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
 #include <unistd.h>
 
+#define MAX_SINK_LPSP_INFO_BUF_LEN	5000
 
-static bool supports_lpsp(uint32_t devid)
+#define PWR_DOMAIN_INFO "i915_power_domain_info"
+
+const char *snd_module[10] = {"snd_hda_codec_hdmi", "snd_hda_intel", "snd_hda_codec", "snd_hda_core", NULL};
+
+typedef struct {
+	int drm_fd;
+	int debugfs_fd;
+	uint32_t devid;
+	char *pwr_dmn_info;
+	igt_display_t display;
+	struct igt_fb fb;
+	drmModeModeInfo *mode;
+	igt_output_t *output;
+} data_t;
+
+static void debugfs_read(int fd, const char *param, char *buf, int len)
 {
-	return IS_HASWELL(devid) || IS_BROADWELL(devid);
+	len = igt_debugfs_simple_read(fd, param, buf, len);
+	if (len < 0)
+		igt_assert_eq(len, -ENODEV);
 }
 
-static bool lpsp_is_enabled(int drm_fd)
+static bool lpsp_is_enabled(data_t *data)
 {
-	uint32_t val;
+	char buf[MAX_SINK_LPSP_INFO_BUF_LEN];
+	int fd;
+
+	fd = igt_debugfs_connector_dir(data->drm_fd, data->output->name,
+				       O_RDONLY);
+	igt_require(fd >= 0);
+
+	debugfs_read(fd, "i915_lpsp_info", buf, sizeof(buf));
+	close(fd);
 
-	val = INREG(HSW_PWR_WELL_CTL2);
-	return !(val & HSW_PWR_WELL_STATE_ENABLED);
+	return strstr(buf, "LPSP enabled");
 }
 
-/* The LPSP mode is all about an enabled pipe, but we expect to also be in the
- * low power mode when no pipes are enabled, so do this check anyway. */
-static void screens_disabled_subtest(int drm_fd, drmModeResPtr drm_res)
+/*
+ * The LPSP mode is all about an enabled pipe, but we expect to also be in the
+ * low power mode when no pipes are enabled, so do this check anyway.
+ */
+static void screens_disabled_subtest(data_t *data)
 {
-	kmstest_unset_all_crtcs(drm_fd, drm_res);
-	igt_assert(lpsp_is_enabled(drm_fd));
+	igt_output_t *output;
+	enum pipe pipe;
+	igt_plane_t *primary;
+
+	for_each_pipe_with_single_output(&data->display, pipe, output) {
+		data->output = output;
+		igt_output_set_pipe(data->output, pipe);
+		primary = igt_output_get_plane_type(data->output,
+						    DRM_PLANE_TYPE_PRIMARY);
+		igt_plane_set_fb(primary, NULL);
+		igt_display_commit(&data->display);
+	}
+
+	igt_assert(lpsp_is_enabled(data));
 }
 
-static uint32_t create_fb(int drm_fd, int width, int height)
+static void check_output_lpsp(data_t *data)
 {
-	struct igt_fb fb;
+	if (igt_output_is_lpsp_capable(data->drm_fd, data->output))
+		igt_assert_f(lpsp_is_enabled(data), "%s: lpsp is not enabled\n%s:\n%s\n",
+			     data->output->name, PWR_DOMAIN_INFO, data->pwr_dmn_info =
+			     igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
+	else
+		igt_assert(!lpsp_is_enabled(data));
+}
 
-	return igt_create_pattern_fb(drm_fd, width, height, DRM_FORMAT_XRGB8888,
-				     LOCAL_DRM_FORMAT_MOD_NONE, &fb);
+static void setup_lpsp_output(data_t *data)
+{
+	igt_plane_t *primary;
+
+	/* set output pipe = PIPE_A for LPSP */
+	igt_output_set_pipe(data->output, PIPE_A);
+	primary = igt_output_get_plane_type(data->output,
+					    DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, NULL);
+	igt_create_pattern_fb(data->drm_fd,
+			      data->mode->hdisplay, data->mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      LOCAL_DRM_FORMAT_MOD_NONE,
+			      &data->fb);
+	igt_plane_set_fb(primary, &data->fb);
+	igt_display_commit(&data->display);
+}
+
+static void cleanup_lpsp_output(data_t *data)
+{
+	igt_plane_t *primary;
+
+	if (!data->output)
+		return;
+
+	primary = igt_output_get_plane_type(data->output,
+					    DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(data->output, PIPE_NONE);
+	igt_display_commit(&data->display);
+	igt_remove_fb(data->drm_fd, &data->fb);
+	data->output = NULL;
 }
 
-static void edp_subtest(int drm_fd, drmModeResPtr drm_res,
-			drmModeConnectorPtr *drm_connectors, uint32_t devid,
-			bool use_panel_fitter)
+static void edp_subtest(data_t *data, bool use_panel_fitter)
 {
-	int i, rc;
-	uint32_t crtc_id = 0, buffer_id = 0;
-	drmModeConnectorPtr connector = NULL;
-	drmModeModeInfoPtr mode = NULL;
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	int valid_output;
+
 	drmModeModeInfo std_1024_mode = {
 		.clock = 65000,
 		.hdisplay = 1024,
@@ -86,23 +162,17 @@ static void edp_subtest(int drm_fd, drmModeResPtr drm_res,
 		.name = "Custom 1024x768",
 	};
 
-	kmstest_unset_all_crtcs(drm_fd, drm_res);
-
-	for (i = 0; i < drm_res->count_connectors; i++) {
-		drmModeConnectorPtr c = drm_connectors[i];
+	for_each_connected_output(display, output) {
+		drmModeConnectorPtr c = output->config.connector;
 
 		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
 			continue;
-		if (c->connection != DRM_MODE_CONNECTED)
+		if (!igt_pipe_connector_valid(PIPE_A, output))
 			continue;
 
-		if (!use_panel_fitter && c->count_modes) {
-			connector = c;
-			mode = &c->modes[0];
-			break;
-		}
+		data->output = output;
+
 		if (use_panel_fitter) {
-			connector = c;
 
 			/* This is one of the modes Xorg creates for panels, so
 			 * it should work just fine. Notice that Gens that
@@ -113,124 +183,123 @@ static void edp_subtest(int drm_fd, drmModeResPtr drm_res,
 				   c->modes[0].hdisplay > 1024);
 			igt_assert(c->count_modes &&
 				   c->modes[0].vdisplay > 768);
-			mode = &std_1024_mode;
-			break;
+			data->mode = &std_1024_mode;
+			igt_output_override_mode(output, data->mode);
+		} else {
+			data->mode = igt_output_get_mode(output);
 		}
-	}
-	igt_require(connector);
 
-	crtc_id = kmstest_find_crtc_for_connector(drm_fd, drm_res, connector,
-						  0);
-	buffer_id = create_fb(drm_fd, mode->hdisplay, mode->vdisplay);
+		setup_lpsp_output(data);
+
+		if (use_panel_fitter && IS_HASWELL(data->devid))
+			igt_assert(!lpsp_is_enabled(data));
+		else
+			check_output_lpsp(data);
 
-	igt_assert(buffer_id);
-	igt_assert(connector);
-	igt_assert(mode);
+		cleanup_lpsp_output(data);
+		valid_output++;
+	}
 
-	rc = drmModeSetCrtc(drm_fd, crtc_id, buffer_id, 0, 0,
-			    &connector->connector_id, 1, mode);
-	igt_assert_eq(rc, 0);
+	igt_require_f(valid_output, "No edp connector found\n");
+}
 
-	if (use_panel_fitter) {
-		if (IS_HASWELL(devid))
-			igt_assert(!lpsp_is_enabled(drm_fd));
-		else
-			igt_assert(lpsp_is_enabled(drm_fd));
-	} else {
-		igt_assert(lpsp_is_enabled(drm_fd));
+static bool unload_snd_hda_core_module(void)
+{
+	int i;
+
+	/* unbind snd_hda_intel */
+	kick_snd_hda_intel();
+
+	for (i = 0; snd_module[i]; i++) {
+		if (igt_kmod_is_loaded(snd_module[i]) &&
+		    igt_kmod_unload(snd_module[i], KMOD_REMOVE_FORCE)) {
+			igt_warn("Could not unload %s\n", snd_module[i]);
+			igt_kmod_list_loaded();
+			igt_lsof("/dev/snd");
+			return false;
+		}
 	}
+
+	return true;
 }
 
-static void non_edp_subtest(int drm_fd, drmModeResPtr drm_res,
-			    drmModeConnectorPtr *drm_connectors)
+static void load_snd_hda_core_module(void)
 {
-	int i, rc;
-	uint32_t crtc_id = 0, buffer_id = 0;
-	drmModeConnectorPtr connector = NULL;
-	drmModeModeInfoPtr mode = NULL;
+	igt_kmod_load("snd_hda_core", NULL);
+}
+
+static void non_edp_subtest(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	int valid_output;
 
-	kmstest_unset_all_crtcs(drm_fd, drm_res);
+	/* DP/HDMI panel requires to drive lpsp without audio */
+	igt_require(unload_snd_hda_core_module());
 
-	for (i = 0; i < drm_res->count_connectors; i++) {
-		drmModeConnectorPtr c = drm_connectors[i];
+	for_each_connected_output(display, output) {
+		drmModeConnectorPtr c = output->config.connector;
 
 		if (c->connector_type == DRM_MODE_CONNECTOR_eDP)
 			continue;
 		if (c->connection != DRM_MODE_CONNECTED)
 			continue;
+		if (!igt_pipe_connector_valid(PIPE_A, output))
+			continue;
 
-		if (c->count_modes) {
-			connector = c;
-			mode = &c->modes[0];
-			break;
-		}
+		data->output = output;
+		data->mode = igt_output_get_mode(output);
+		setup_lpsp_output(data);
+		check_output_lpsp(data);
+		cleanup_lpsp_output(data);
+		load_snd_hda_core_module();
+		valid_output++;
 	}
-	igt_require(connector);
-
-	crtc_id = kmstest_find_crtc_for_connector(drm_fd, drm_res, connector,
-						  0);
-	buffer_id = create_fb(drm_fd, mode->hdisplay, mode->vdisplay);
 
-	igt_assert(buffer_id);
-	igt_assert(mode);
-
-	rc = drmModeSetCrtc(drm_fd, crtc_id, buffer_id, 0, 0,
-			    &connector->connector_id, 1, mode);
-	igt_assert_eq(rc, 0);
-
-	igt_assert(!lpsp_is_enabled(drm_fd));
+	igt_require_f(valid_output, "No non-edp connector found\n");
 }
 
-#define MAX_CONNECTORS 32
-
-int drm_fd;
-uint32_t devid;
-drmModeResPtr drm_res;
-drmModeConnectorPtr drm_connectors[MAX_CONNECTORS];
-struct intel_mmio_data mmio_data;
+IGT_TEST_DESCRIPTION("These tests validates display Low Power Single Pipe configurations");
 igt_main
 {
-	igt_fixture {
-		int i;
-
-		drm_fd = drm_open_driver_master(DRIVER_INTEL);
-		igt_require(drm_fd >= 0);
-
-		devid = intel_get_drm_devid(drm_fd);
+	data_t data = {};
 
-		drm_res = drmModeGetResources(drm_fd);
-		igt_require(drm_res);
-		igt_assert(drm_res->count_connectors <= MAX_CONNECTORS);
-
-		for (i = 0; i < drm_res->count_connectors; i++)
-			drm_connectors[i] = drmModeGetConnectorCurrent(drm_fd,
-							drm_res->connectors[i]);
+	igt_fixture {
 
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		igt_require(data.drm_fd >= 0);
+		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
+		igt_require(data.debugfs_fd >= 0);
 		igt_pm_enable_audio_runtime_pm();
-
-		igt_require(supports_lpsp(devid));
-
-		intel_register_access_init(&mmio_data, intel_get_pci_device(), 0, drm_fd);
-
 		kmstest_set_vt_graphics_mode();
+		data.devid = intel_get_drm_devid(data.drm_fd);
+		igt_display_require(&data.display, data.drm_fd);
+		igt_require(igt_pm_dmc_loaded(data.debugfs_fd));
 	}
 
+	igt_describe("This test validates lpsp while all crtc are disabled");
 	igt_subtest("screens-disabled")
-		screens_disabled_subtest(drm_fd, drm_res);
+		screens_disabled_subtest(&data);
+	igt_describe("This test validates lpsp on eDP panel");
 	igt_subtest("edp-native")
-		edp_subtest(drm_fd, drm_res, drm_connectors, devid, false);
+		edp_subtest(&data, false);
+	igt_fixture
+		cleanup_lpsp_output(&data);
+	igt_describe("This test validates lpsp on eDP panel while forcing panel_fitter");
 	igt_subtest("edp-panel-fitter")
-		edp_subtest(drm_fd, drm_res, drm_connectors, devid, true);
+		edp_subtest(&data, true);
+	igt_fixture
+		cleanup_lpsp_output(&data);
+	igt_describe("This test validates lpsp on DP/HDMI/DSI panels");
 	igt_subtest("non-edp")
-		non_edp_subtest(drm_fd, drm_res, drm_connectors);
+		non_edp_subtest(&data);
+	igt_fixture
+		cleanup_lpsp_output(&data);
 
 	igt_fixture {
-		int i;
-
-		intel_register_access_fini(&mmio_data);
-		for (i = 0; i < drm_res->count_connectors; i++)
-			drmModeFreeConnector(drm_connectors[i]);
-		drmModeFreeResources(drm_res);
-		close(drm_fd);
+		free(data.pwr_dmn_info);
+		load_snd_hda_core_module();
+		close(data.drm_fd);
+		igt_display_fini(&data.display);
 	}
 }
-- 
2.25.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
