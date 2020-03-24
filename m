Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EA06E161
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2020 13:17:33 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Tue, 24 Mar 2020 18:36:27 +0530
Message-Id: <20200324130630.9388-3-anshuman.gupta@intel.com>
In-Reply-To: <20200324130630.9388-1-anshuman.gupta@intel.com>
References: <20200324130630.9388-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 2/5] tests/i915_pm_lpsp: lpsp platform
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
v3:
- removed unloading of snd_modules. [Martin]

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_lpsp.c | 277 ++++++++++++++++++++++----------------
 1 file changed, 158 insertions(+), 119 deletions(-)

diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index 42938e10..8fcbca8f 100644
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
 
-	val = INREG(HSW_PWR_WELL_CTL2);
-	return !(val & HSW_PWR_WELL_STATE_ENABLED);
+	fd = igt_debugfs_connector_dir(data->drm_fd, data->output->name,
+				       O_RDONLY);
+	igt_require(fd >= 0);
+
+	debugfs_read(fd, "i915_lpsp_info", buf, sizeof(buf));
+	close(fd);
+
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
+	igt_plane_t *primary;
+	int valid_output = 0;
+	enum pipe pipe;
+
+	for_each_pipe_with_single_output(&data->display, pipe, output) {
+		data->output = output;
+		igt_output_set_pipe(data->output, PIPE_NONE);
+		igt_display_commit(&data->display);
+		valid_output++;
+	}
+
+	igt_require_f(valid_output, "No connected output found\n");
+	igt_assert_f(lpsp_is_enabled(data), "%s: lpsp is not enabled\n%s:\n%s\n",
+		     data->output->name, PWR_DOMAIN_INFO, data->pwr_dmn_info =
+		     igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
 }
 
-static uint32_t create_fb(int drm_fd, int width, int height)
+static void check_output_lpsp(data_t *data)
 {
-	struct igt_fb fb;
+	if (i915_output_is_lpsp_capable(data->drm_fd, data->output))
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
 }
 
-static void edp_subtest(int drm_fd, drmModeResPtr drm_res,
-			drmModeConnectorPtr *drm_connectors, uint32_t devid,
-			bool use_panel_fitter)
+static void cleanup_lpsp_output(data_t *data)
 {
-	int i, rc;
-	uint32_t crtc_id = 0, buffer_id = 0;
-	drmModeConnectorPtr connector = NULL;
-	drmModeModeInfoPtr mode = NULL;
+	igt_plane_t *primary;
+
+	if (!data->output || data->output->pending_pipe == PIPE_NONE)
+		return;
+
+	primary = igt_output_get_plane_type(data->output,
+					    DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(data->output, PIPE_NONE);
+	igt_display_commit(&data->display);
+	igt_remove_fb(data->drm_fd, &data->fb);
+	data->output = NULL;
+}
+
+static void edp_subtest(data_t *data, bool use_panel_fitter)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	int valid_output = 0;
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
@@ -113,124 +183,93 @@ static void edp_subtest(int drm_fd, drmModeResPtr drm_res,
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
 
-	igt_assert(buffer_id);
-	igt_assert(connector);
-	igt_assert(mode);
-
-	rc = drmModeSetCrtc(drm_fd, crtc_id, buffer_id, 0, 0,
-			    &connector->connector_id, 1, mode);
-	igt_assert_eq(rc, 0);
-
-	if (use_panel_fitter) {
-		if (IS_HASWELL(devid))
-			igt_assert(!lpsp_is_enabled(drm_fd));
+		if (use_panel_fitter && IS_HASWELL(data->devid))
+			igt_assert(!lpsp_is_enabled(data));
 		else
-			igt_assert(lpsp_is_enabled(drm_fd));
-	} else {
-		igt_assert(lpsp_is_enabled(drm_fd));
+			check_output_lpsp(data);
+
+		cleanup_lpsp_output(data);
+		valid_output++;
 	}
+
+	igt_require_f(valid_output, "No edp connector found\n");
 }
 
-static void non_edp_subtest(int drm_fd, drmModeResPtr drm_res,
-			    drmModeConnectorPtr *drm_connectors)
+static void non_edp_subtest(data_t *data)
 {
-	int i, rc;
-	uint32_t crtc_id = 0, buffer_id = 0;
-	drmModeConnectorPtr connector = NULL;
-	drmModeModeInfoPtr mode = NULL;
-
-	kmstest_unset_all_crtcs(drm_fd, drm_res);
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	int valid_output = 0;
 
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
+		valid_output++;
 	}
-	igt_require(connector);
-
-	crtc_id = kmstest_find_crtc_for_connector(drm_fd, drm_res, connector,
-						  0);
-	buffer_id = create_fb(drm_fd, mode->hdisplay, mode->vdisplay);
-
-	igt_assert(buffer_id);
-	igt_assert(mode);
-
-	rc = drmModeSetCrtc(drm_fd, crtc_id, buffer_id, 0, 0,
-			    &connector->connector_id, 1, mode);
-	igt_assert_eq(rc, 0);
 
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
-
-		drm_res = drmModeGetResources(drm_fd);
-		igt_require(drm_res);
-		igt_assert(drm_res->count_connectors <= MAX_CONNECTORS);
+	data_t data = {};
 
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
