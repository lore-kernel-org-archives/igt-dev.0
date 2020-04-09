Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C6E6EB47
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2020 05:49:59 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Thu,  9 Apr 2020 11:09:49 +0530
Message-Id: <20200409053951.26929-4-anshuman.gupta@intel.com>
In-Reply-To: <20200409053951.26929-1-anshuman.gupta@intel.com>
References: <20200409053951.26929-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v5 3/5] tests/i915_pm_lpsp: lpsp platform
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
Cc: jani.nikula@intel.com, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Current implementation of lpsp igt test, assumed that every non-edp
panel isn't a lpsp panel but it is not true on TGL anymore,
any HDMI/DP/DSI panel connected on pipe A and connected to PORT_{A,B,C}
can drive LPSP.
Even on older Gen9 platform a DP panel can drive lpsp on Port A.
This requires complete design change in current lpsp igt for a platform
agnostic support.

The new igt approach is relies on connector specific
i915_lpsp_capability and i915_lpsp_status debugfs attributes,
these debugfs exposes whether an output is capable of driving lpsp
and lpsp is enabled.

Nuking edp-native and non-edp test, introducing a new dynamic
igt subtest kms-lpsp, which validates lpsp on each connected output
and skip the subtest if output is not lpsp capable.

v2:
- CI failures fixup.
v3:
- removed unloading of snd_modules. [Martin]
v4:
- Don't test non-lpsp(if lpsp disabled), no ROI to test that.
- nuke panel-fitter test.
v5:
- Added dynamic subtest and igt changes according to kernel
  debugfs i915_lpsp_status changes.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_lpsp.c | 285 +++++++++++++++-----------------------
 1 file changed, 114 insertions(+), 171 deletions(-)

diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index 08f82e7c..7be23e6c 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/i915_pm_lpsp.c
@@ -25,210 +25,153 @@
  */
 
 #include "igt.h"
+#include "igt_kmod.h"
+#include "igt_pm.h"
+#include "igt_sysfs.h"
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
 #include <unistd.h>
 
+#define MAX_SINK_LPSP_INFO_BUF_LEN	4096
 
-static bool supports_lpsp(uint32_t devid)
-{
-	return IS_HASWELL(devid) || IS_BROADWELL(devid);
-}
+#define PWR_DOMAIN_INFO "i915_power_domain_info"
 
-static bool lpsp_is_enabled(int drm_fd)
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
+static bool lpsp_is_enabled(data_t *data)
 {
-	uint32_t val;
+	char buf[MAX_SINK_LPSP_INFO_BUF_LEN];
+	int len;
 
-	val = INREG(HSW_PWR_WELL_CTL2);
-	return !(val & HSW_PWR_WELL_STATE_ENABLED);
-}
+	len = igt_debugfs_simple_read(data->debugfs_fd, "i915_lpsp_status",
+				      buf, sizeof(buf));
+	if (len < 0)
+		igt_assert_eq(len, -ENODEV);
 
-/* The LPSP mode is all about an enabled pipe, but we expect to also be in the
- * low power mode when no pipes are enabled, so do this check anyway. */
-static void screens_disabled_subtest(int drm_fd, drmModeResPtr drm_res)
-{
-	kmstest_unset_all_crtcs(drm_fd, drm_res);
-	igt_assert(lpsp_is_enabled(drm_fd));
+	return strstr(buf, "LPSP: enabled");
 }
 
-static uint32_t create_fb(int drm_fd, int width, int height)
+/*
+ * The LPSP mode is all about an enabled pipe, but we expect to also be in the
+ * low power mode when no pipes are enabled, so do this check anyway.
+ */
+static void screens_disabled_subtest(data_t *data)
 {
-	struct igt_fb fb;
+	igt_output_t *output;
+	int valid_output = 0;
+	enum pipe pipe;
+
+	for_each_pipe_with_single_output(&data->display, pipe, output) {
+		data->output = output;
+		igt_output_set_pipe(data->output, PIPE_NONE);
+		igt_display_commit(&data->display);
+		valid_output++;
+	}
 
-	return igt_create_pattern_fb(drm_fd, width, height, DRM_FORMAT_XRGB8888,
-				     LOCAL_DRM_FORMAT_MOD_NONE, &fb);
+	igt_require_f(valid_output, "No connected output found\n");
+	igt_assert_f(lpsp_is_enabled(data), "lpsp is not enabled\n%s:\n%s\n",
+		     PWR_DOMAIN_INFO, data->pwr_dmn_info =
+		     igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
 }
 
-static void edp_subtest(int drm_fd, drmModeResPtr drm_res,
-			drmModeConnectorPtr *drm_connectors, uint32_t devid,
-			bool use_panel_fitter)
+static void setup_lpsp_output(data_t *data)
 {
-	int i, rc;
-	uint32_t crtc_id = 0, buffer_id = 0;
-	drmModeConnectorPtr connector = NULL;
-	drmModeModeInfoPtr mode = NULL;
-	drmModeModeInfo std_1024_mode = {
-		.clock = 65000,
-		.hdisplay = 1024,
-		.hsync_start = 1048,
-		.hsync_end = 1184,
-		.htotal = 1344,
-		.hskew = 0,
-		.vdisplay = 768,
-		.vsync_start = 771,
-		.vsync_end = 777,
-		.vtotal = 806,
-		.vscan = 0,
-		.vrefresh = 60,
-		.flags = 0xA,
-		.type = 0x40,
-		.name = "Custom 1024x768",
-	};
-
-	kmstest_unset_all_crtcs(drm_fd, drm_res);
-
-	for (i = 0; i < drm_res->count_connectors; i++) {
-		drmModeConnectorPtr c = drm_connectors[i];
-
-		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
-			continue;
-		if (c->connection != DRM_MODE_CONNECTED)
-			continue;
-
-		if (!use_panel_fitter && c->count_modes) {
-			connector = c;
-			mode = &c->modes[0];
-			break;
-		}
-		if (use_panel_fitter) {
-			connector = c;
-
-			/* This is one of the modes Xorg creates for panels, so
-			 * it should work just fine. Notice that Gens that
-			 * support LPSP are too new for panels with native
-			 * 1024x768 resolution, so this should force the panel
-			 * fitter. */
-			igt_assert(c->count_modes &&
-				   c->modes[0].hdisplay > 1024);
-			igt_assert(c->count_modes &&
-				   c->modes[0].vdisplay > 768);
-			mode = &std_1024_mode;
-			break;
-		}
-	}
-	igt_require(connector);
-
-	crtc_id = kmstest_find_crtc_for_connector(drm_fd, drm_res, connector,
-						  0);
-	buffer_id = create_fb(drm_fd, mode->hdisplay, mode->vdisplay);
-
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
-		else
-			igt_assert(lpsp_is_enabled(drm_fd));
-	} else {
-		igt_assert(lpsp_is_enabled(drm_fd));
-	}
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
 
-static void non_edp_subtest(int drm_fd, drmModeResPtr drm_res,
-			    drmModeConnectorPtr *drm_connectors)
+static void test_cleanup(data_t *data)
 {
-	int i, rc;
-	uint32_t crtc_id = 0, buffer_id = 0;
-	drmModeConnectorPtr connector = NULL;
-	drmModeModeInfoPtr mode = NULL;
-
-	kmstest_unset_all_crtcs(drm_fd, drm_res);
-
-	for (i = 0; i < drm_res->count_connectors; i++) {
-		drmModeConnectorPtr c = drm_connectors[i];
-
-		if (c->connector_type == DRM_MODE_CONNECTOR_eDP)
-			continue;
-		if (c->connection != DRM_MODE_CONNECTED)
-			continue;
-
-		if (c->count_modes) {
-			connector = c;
-			mode = &c->modes[0];
-			break;
-		}
-	}
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
-
-	igt_assert(!lpsp_is_enabled(drm_fd));
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
 }
 
-#define MAX_CONNECTORS 32
+static void test_lpsp(data_t *data)
+{
+	/* LPSP is low power single pipe usages i.e. PIPE_A */
+	igt_require(igt_pipe_connector_valid(PIPE_A, data->output));
+	igt_require_f(i915_output_is_lpsp_capable(data->drm_fd, data->output),
+		      "output is not lpsp capable\n");
+
+	data->mode = igt_output_get_mode(data->output);
+	setup_lpsp_output(data);
+	igt_assert_f(lpsp_is_enabled(data), "%s: lpsp is not enabled\n%s:\n%s\n",
+		     data->output->name, PWR_DOMAIN_INFO, data->pwr_dmn_info =
+		     igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
+}
 
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
-	igt_subtest("edp-native")
-		edp_subtest(drm_fd, drm_res, drm_connectors, devid, false);
-	igt_subtest("non-edp")
-		non_edp_subtest(drm_fd, drm_res, drm_connectors);
+		screens_disabled_subtest(&data);
 
-	igt_fixture {
-		int i;
+	igt_describe("This test validates lpsp on all connected outputs on low power PIPE_A");
+	igt_subtest_with_dynamic_f("kms-lpsp") {
+		igt_display_t *display = &data.display;
+		igt_output_t *output;
 
-		intel_register_access_fini(&mmio_data);
-		for (i = 0; i < drm_res->count_connectors; i++)
-			drmModeFreeConnector(drm_connectors[i]);
-		drmModeFreeResources(drm_res);
-		close(drm_fd);
+		for_each_connected_output(display, output) {
+			igt_dynamic_f("kms-lpsp-%s", output->name) {
+				data.output = output;
+				test_lpsp(&data);
+			}
+
+			test_cleanup(&data);
+		}
+	}
+
+	igt_fixture {
+		free(data.pwr_dmn_info);
+		close(data.drm_fd);
+		igt_display_fini(&data.display);
 	}
 }
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
