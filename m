Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23AB46E970
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2020 10:31:58 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Thu,  7 May 2020 15:52:08 +0530
Message-Id: <20200507102210.23599-4-anshuman.gupta@intel.com>
In-Reply-To: <20200507102210.23599-1-anshuman.gupta@intel.com>
References: <20200507102210.23599-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v7 3/5] tests/i915_pm_lpsp: lpsp platform
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
Cc: jani.nikula@intel.com
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

Skip screens-disabled test for platform which support DC states.
screens-disabled test is only valid for the platforms like HSW/BDW
where PG1 is Always-ON power domain, so these platform test lpsp
with all screen disabled i.e validate PG2 when all screen are
disabled.
DC state i.e DMC f/w supported platforms don't have any ROI to validate
screens-disabled subtest as existing dc*-dpms i915_pm_dc
subtest already validate it implicitly.

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
v6:
- Avoided pipe big joiner by using 4k or lesser mode,
  so igt will not fail when pipe big joiner patches will
  land to kernel.
v7:
- Combined [v6 4/6] patch to this patch, skip the screens-disabled
  subtest for DC state supported platforms. [Animesh]

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_lpsp.c | 313 ++++++++++++++++++--------------------
 1 file changed, 147 insertions(+), 166 deletions(-)

diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index 08f82e7c..46937efb 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/i915_pm_lpsp.c
@@ -25,210 +25,191 @@
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
+	igt_skip_on(strstr(buf, "LPSP: not supported"));
+
+	return strstr(buf, "LPSP: enabled");
 }
 
-static uint32_t create_fb(int drm_fd, int width, int height)
+static bool dmc_supported(int debugfs)
 {
-	struct igt_fb fb;
+	char buf[15];
+	int len;
 
-	return igt_create_pattern_fb(drm_fd, width, height, DRM_FORMAT_XRGB8888,
-				     LOCAL_DRM_FORMAT_MOD_NONE, &fb);
+	len = igt_sysfs_read(debugfs, "i915_dmc_info", buf, sizeof(buf) - 1);
+
+	if (len < 0)
+		return false;
+	else
+		return true;
 }
 
-static void edp_subtest(int drm_fd, drmModeResPtr drm_res,
-			drmModeConnectorPtr *drm_connectors, uint32_t devid,
-			bool use_panel_fitter)
+/*
+ * The LPSP mode is all about an enabled pipe, but we expect to also be in the
+ * low power mode when no pipes are enabled, so do this check anyway.
+ */
+static void screens_disabled_subtest(data_t *data)
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
+	igt_output_t *output;
+	int valid_output = 0;
+	enum pipe pipe;
+
+	for_each_pipe_with_single_output(&data->display, pipe, output) {
+		data->output = output;
+		igt_output_set_pipe(data->output, PIPE_NONE);
+		igt_display_commit(&data->display);
+		valid_output++;
 	}
+
+	igt_require_f(valid_output, "No connected output found\n");
+	igt_assert_f(lpsp_is_enabled(data), "lpsp is not enabled\n%s:\n%s\n",
+		     PWR_DOMAIN_INFO, data->pwr_dmn_info =
+		     igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
 }
 
-static void non_edp_subtest(int drm_fd, drmModeResPtr drm_res,
-			    drmModeConnectorPtr *drm_connectors)
+static void setup_lpsp_output(data_t *data)
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
 
-		if (c->connector_type == DRM_MODE_CONNECTOR_eDP)
-			continue;
-		if (c->connection != DRM_MODE_CONNECTED)
-			continue;
+static void test_cleanup(data_t *data)
+{
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
 
-		if (c->count_modes) {
-			connector = c;
-			mode = &c->modes[0];
-			break;
+static void test_lpsp(data_t *data)
+{
+	drmModeConnectorPtr c = data->output->config.connector;
+	int i;
+
+	/* LPSP is low power single pipe usages i.e. PIPE_A */
+	igt_require(igt_pipe_connector_valid(PIPE_A, data->output));
+	igt_require_f(i915_output_is_lpsp_capable(data->drm_fd, data->output),
+		      "output is not lpsp capable\n");
+
+	data->mode = igt_output_get_mode(data->output);
+
+	/* For LPSP avoid pipe big joiner by atleast 4k mode */
+	if (data->mode->hdisplay > 3860 && data->mode->vdisplay > 2160)
+		for (i = 1; i < c->count_modes; i++) {
+			if (c->modes[i].hdisplay <= 3860 &&
+			    c->modes[i].vdisplay <= 2160) {
+				data->mode = &c->modes[i];
+				igt_output_override_mode(data->output,
+							 data->mode);
+				break;
+			}
 		}
-	}
-	igt_require(connector);
-
-	crtc_id = kmstest_find_crtc_for_connector(drm_fd, drm_res, connector,
-						  0);
-	buffer_id = create_fb(drm_fd, mode->hdisplay, mode->vdisplay);
-
-	igt_assert(buffer_id);
-	igt_assert(mode);
 
-	rc = drmModeSetCrtc(drm_fd, crtc_id, buffer_id, 0, 0,
-			    &connector->connector_id, 1, mode);
-	igt_assert_eq(rc, 0);
+	igt_require(data->mode->hdisplay <= 3860 &&
+		    data->mode->vdisplay <= 2160);
 
-	igt_assert(!lpsp_is_enabled(drm_fd));
+	setup_lpsp_output(data);
+	igt_assert_f(lpsp_is_enabled(data), "%s: lpsp is not enabled\n%s:\n%s\n",
+		     data->output->name, PWR_DOMAIN_INFO, data->pwr_dmn_info =
+		     igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
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
+		kmstest_set_vt_graphics_mode();
+		data.devid = intel_get_drm_devid(data.drm_fd);
+		igt_display_require(&data.display, data.drm_fd);
+		igt_require(igt_pm_dmc_loaded(data.debugfs_fd));
+	}
 
-		igt_require(supports_lpsp(devid));
+	igt_describe("This test validates lpsp while all crtc are disabled");
+	igt_subtest("screens-disabled") {
+		igt_require_f(!dmc_supported(data.debugfs_fd),
+			      "DC states supported platform don't have ROI for this subtest\n");
+		screens_disabled_subtest(&data);
+	}
 
-		intel_register_access_init(&mmio_data, intel_get_pci_device(), 0, drm_fd);
+	igt_describe("This test validates lpsp on all connected outputs on low power PIPE_A");
+	igt_subtest_with_dynamic_f("kms-lpsp") {
+		igt_display_t *display = &data.display;
+		igt_output_t *output;
 
-		kmstest_set_vt_graphics_mode();
-	}
+		for_each_connected_output(display, output) {
+			igt_dynamic_f("kms-lpsp-%s",
+				      kmstest_connector_type_str(output->config.connector->connector_type)) {
+				data.output = output;
+				test_lpsp(&data);
+			}
 
-	igt_subtest("screens-disabled")
-		screens_disabled_subtest(drm_fd, drm_res);
-	igt_subtest("edp-native")
-		edp_subtest(drm_fd, drm_res, drm_connectors, devid, false);
-	igt_subtest("non-edp")
-		non_edp_subtest(drm_fd, drm_res, drm_connectors);
+			test_cleanup(&data);
+		}
+	}
 
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
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
