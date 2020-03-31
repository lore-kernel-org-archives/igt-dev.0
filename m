Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5EB6E804
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2020 10:45:13 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Tue, 31 Mar 2020 16:03:30 +0530
Message-Id: <20200331103330.31211-7-anshuman.gupta@intel.com>
In-Reply-To: <20200331103330.31211-1-anshuman.gupta@intel.com>
References: <20200331103330.31211-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 6/6] tests/i915_pm_rpm: lpsp/non-lpsp
 screen mode_set_data
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

Initialize the mode set params for lpsp/non-lpsp screen
based upon their output lpsp capability instead
of edp/non-edp output type.

v2:
- CI failures fixup.
v3:
- changes according to lib function igt_output_is_lpsp_capable
  prefix chnaged to i915_output_is_lpsp_capable.

Acked-by: Martin Peres <martin.peres@linux.intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 53 +++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 4f8124dc..e905cf91 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -94,6 +94,7 @@ struct mode_set_data {
 	drmModeResPtr res;
 	drmModeConnectorPtr connectors[MAX_CONNECTORS];
 	drmModePropertyBlobPtr edids[MAX_CONNECTORS];
+	igt_display_t display;
 
 	uint32_t devid;
 };
@@ -254,29 +255,29 @@ static bool init_modeset_params_for_type(struct mode_set_data *data,
 {
 	drmModeConnectorPtr connector = NULL;
 	drmModeModeInfoPtr mode = NULL;
+	igt_output_t *output = NULL;
+	igt_display_t *display = &data->display;
 
-	if (!data->res)
+	if (!data->res || !display)
 		return false;
 
-	for (int i = 0; i < data->res->count_connectors; i++) {
-		drmModeConnectorPtr c = data->connectors[i];
+	for_each_connected_output(display, output) {
+		drmModeConnectorPtr c = output->config.connector;
 
 		if (type == SCREEN_TYPE_LPSP &&
-		    c->connector_type != DRM_MODE_CONNECTOR_eDP)
+		     !i915_output_is_lpsp_capable(drm_fd, output))
 			continue;
 
 		if (type == SCREEN_TYPE_NON_LPSP &&
-		    c->connector_type == DRM_MODE_CONNECTOR_eDP)
+		    i915_output_is_lpsp_capable(drm_fd, output))
 			continue;
 
-		if (c->connection == DRM_MODE_CONNECTED && c->count_modes) {
-			connector = c;
-			mode = &c->modes[0];
-			break;
-		}
+		connector = c;
+		mode = igt_output_get_mode(output);
+		break;
 	}
 
-	if (!connector)
+	if (!connector || !mode)
 		return false;
 
 	igt_create_pattern_fb(drm_fd, mode->hdisplay, mode->vdisplay,
@@ -397,6 +398,7 @@ static void init_mode_set_data(struct mode_set_data *data)
 		kmstest_set_vt_graphics_mode();
 	}
 
+	igt_display_require(&data->display, drm_fd);
 	data->devid = intel_get_drm_devid(drm_fd);
 	init_modeset_cached_params(&ms_data);
 }
@@ -410,6 +412,8 @@ static void fini_mode_set_data(struct mode_set_data *data)
 		}
 		drmModeFreeResources(data->res);
 	}
+
+	igt_display_fini(&data->display);
 }
 
 static void get_drm_info(struct compare_data *data)
@@ -760,7 +764,7 @@ static void dump_file(int dir, const char *filename)
 	free(contents);
 }
 
-static bool setup_environment(void)
+static bool setup_environment(bool display_disabled)
 {
 	if (has_runtime_pm)
 		goto out;
@@ -772,7 +776,8 @@ static bool setup_environment(void)
 	debugfs = igt_debugfs_dir(drm_fd);
 	igt_require(debugfs != -1);
 
-	init_mode_set_data(&ms_data);
+	if (!display_disabled)
+		init_mode_set_data(&ms_data);
 
 	igt_pm_enable_sata_link_power_management();
 
@@ -785,13 +790,14 @@ static bool setup_environment(void)
 	igt_require(igt_pm_dmc_loaded(debugfs));
 
 out:
-	disable_all_screens(&ms_data);
+	if (!display_disabled)
+		disable_all_screens(&ms_data);
 	dump_file(debugfs, "i915_runtime_pm_status");
 
 	return wait_for_suspended();
 }
 
-static void teardown_environment(void)
+static void teardown_environment(bool display_disabled)
 {
 	close(msr_fd);
 	if (has_pc8)
@@ -801,7 +807,8 @@ static void teardown_environment(void)
 
 	igt_pm_restore_sata_link_power_management();
 
-	fini_mode_set_data(&ms_data);
+	if (!display_disabled)
+		fini_mode_set_data(&ms_data);
 
 	close(debugfs);
 	close(drm_fd);
@@ -2008,7 +2015,7 @@ static struct option long_options[] = {
 igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	igt_subtest("basic-rte") {
-		igt_assert(setup_environment());
+		igt_assert(setup_environment(false));
 		basic_subtest();
 	}
 
@@ -2016,7 +2023,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	 * PC8+. We don't want bug reports from cases where the machine is just
 	 * not properly configured. */
 	igt_fixture
-		igt_require(setup_environment());
+		igt_require(setup_environment(false));
 
 	if (stay)
 		igt_subtest("stay")
@@ -2146,7 +2153,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture
-		teardown_environment();
+		teardown_environment(false);
 
 	igt_subtest("module-reload") {
 		igt_debug("Reload w/o display\n");
@@ -2155,9 +2162,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		igt_kmsg(KMSG_INFO "Reloading i915 w/o display\n");
 		igt_assert_eq(igt_i915_driver_load("disable_display=1 mmio_debug=-1"), 0);
 
-		igt_assert(setup_environment());
+		igt_assert(setup_environment(true));
 		igt_assert(igt_wait(device_in_pci_d3(), 2000, 100));
-		teardown_environment();
+		teardown_environment(true);
 
 		igt_debug("Reload as normal\n");
 		igt_i915_driver_unload();
@@ -2165,11 +2172,11 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		igt_kmsg(KMSG_INFO "Reloading i915 as normal\n");
 		igt_assert_eq(igt_i915_driver_load("mmio_debug=-1"), 0);
 
-		igt_assert(setup_environment());
+		igt_assert(setup_environment(false));
 		igt_assert(igt_wait(device_in_pci_d3(), 2000, 100));
 		if (enable_one_screen_with_type(&ms_data, SCREEN_TYPE_ANY))
 			drm_resources_equal_subtest();
-		teardown_environment();
+		teardown_environment(false);
 
 		/* Remove our mmio_debugging module */
 		igt_i915_driver_unload();
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
