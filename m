Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456D310F07B
 for <igt-dev@lists.freedesktop.org>; Wed, 25 May 2022 06:37:30 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 May 2022 12:07:35 +0530
Message-Id: <20220525063735.17892-3-swati2.sharma@intel.com>
In-Reply-To: <20220525063735.17892-1-swati2.sharma@intel.com>
References: <20220525063735.17892-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/i915/kms_dsc: IGT cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In this patch, removed redundant code. Also, before starting the
subtest, cleaned up the states to default by igt_display_reset().
Few minor fixes in indentation. Also, added subtests description.

v2: -minor mistake in subtest name
    -commit was missing after reset, added
v3: -fixed styling error
    -replaced drm calls with igt wrappers
v4: -added igt_display_require_output() in igt_fixture
    -modularized code, added func() for checks
    -added func() to get highest mode
v5: -minor fixes
v6: -made modifications based on lib changes
v7: -added igt_fixture

Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_dsc.c | 280 +++++++++++++++++++++++--------------------
 1 file changed, 148 insertions(+), 132 deletions(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 3b6c31c2..c94c64c4 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -44,13 +44,14 @@
 #include <fcntl.h>
 #include <termios.h>
 
-/* currently dsc compression is verifying on 8bpc frame only */
-#define XRGB8888_DRM_FORMAT_MIN_BPP 8
+IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
-enum dsc_test_type
-{
-	test_basic_dsc_enable,
-	test_dsc_compression_bpp
+#define HDISPLAY_5K	5120
+#define XRGB8888_DRM_FORMAT_MIN_BPP	8
+
+enum dsc_test_type {
+	TEST_BASIC_DSC_ENABLE,
+	TEST_DSC_COMPRESSION_BPP
 };
 
 typedef struct {
@@ -59,9 +60,6 @@ typedef struct {
 	igt_display_t display;
 	struct igt_fb fb_test_pattern;
 	igt_output_t *output;
-	int mode_valid;
-	drmModeEncoder *encoder;
-	int crtc;
 	int compression_bpp;
 	int n_pipes;
 	enum pipe pipe;
@@ -79,7 +77,7 @@ static void force_dsc_enable(data_t *data)
 {
 	int ret;
 
-	igt_debug ("Forcing DSC enable on %s\n", data->output->name);
+	igt_debug("Forcing DSC enable on %s\n", data->output->name);
 	ret = igt_force_dsc_enable(data->drm_fd,
 				   data->output->name);
 	igt_assert_f(ret > 0, "debugfs_write failed");
@@ -120,19 +118,6 @@ static void restore_force_dsc_en(void)
 	force_dsc_restore_fd = -1;
 }
 
-static void test_cleanup(data_t *data)
-{
-	igt_plane_t *primary;
-
-	if (data->output) {
-		primary = igt_output_get_plane_type(data->output,
-						    DRM_PLANE_TYPE_PRIMARY);
-		igt_plane_set_fb(primary, NULL);
-		igt_output_set_pipe(data->output, PIPE_NONE);
-		igt_display_commit(&data->display);
-	}
-}
-
 static void kms_dsc_exit_handler(int sig)
 {
 	restore_force_dsc_en();
@@ -145,199 +130,230 @@ static int sort_drm_modes(const void *a, const void *b)
 	return (mode1->clock < mode2->clock) - (mode2->clock < mode1->clock);
 }
 
-static bool check_dsc_on_connector(data_t *data, uint32_t drmConnector)
+static drmModeModeInfo *get_highres_mode(igt_output_t *output)
 {
-	drmModeConnector *connector;
-	igt_output_t *output;
-
-	connector = drmModeGetConnectorCurrent(data->drm_fd,
-					       drmConnector);
-	if (connector->connection != DRM_MODE_CONNECTED)
-		return false;
-
-	output = igt_output_from_connector(&data->display, connector);
+	drmModeConnector *connector = output->config.connector;
+	drmModeModeInfo *highest_mode = NULL;
 
-	/*
-	 * As dsc supports >= 5k modes, we need to suppress lower
-	 * resolutions.
-	 */
-	qsort(output->config.connector->modes,
-	      output->config.connector->count_modes,
+	qsort(connector->modes,
+	      connector->count_modes,
 	      sizeof(drmModeModeInfo),
 	      sort_drm_modes);
-	if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
-	    output->config.connector->modes[0].hdisplay < 5120)
-		return NULL;
 
-	if (!igt_is_dsc_supported(data->drm_fd, data->output->name)) {
+	highest_mode = &connector->modes[0];
+
+	return highest_mode;
+}
+
+static bool check_dsc_on_connector(data_t *data)
+{
+	igt_output_t *output = data->output;
+
+	if (!igt_is_dsc_supported(data->drm_fd, output->name)) {
 		igt_debug("DSC not supported on connector %s\n",
-			  data->output->name);
+			  output->name);
 		return false;
 	}
 
 	if (!output_is_internal_panel(output) &&
 	    !igt_is_fec_supported(data->drm_fd, output->name)) {
 		igt_debug("DSC cannot be enabled without FEC on %s\n",
-			  data->output->name);
+			  output->name);
 		return false;
 	}
 
-	data->output = output;
 	return true;
 }
 
-/*
- * Re-probe connectors and do a modeset with DSC
- *
- */
+static bool check_big_joiner_test_constraint(data_t *data,
+					     enum dsc_test_type test_type)
+{
+	igt_output_t *output = data->output;
+	drmModeModeInfo *mode = get_highres_mode(output);
+
+	if (test_type == TEST_DSC_COMPRESSION_BPP &&
+	    mode->hdisplay >= HDISPLAY_5K) {
+		igt_debug("Bigjoiner does not support force bpp on %s\n",
+			   output->name);
+		return false;
+	}
+
+	return true;
+}
+
+static bool check_big_joiner_pipe_constraint(data_t *data)
+{
+	igt_output_t *output = data->output;
+	drmModeModeInfo *mode = get_highres_mode(output);
+
+	if (mode->hdisplay >= HDISPLAY_5K &&
+	    data->pipe == (data->n_pipes - 1)) {
+		igt_debug("Pipe-%s not supported due to bigjoiner limitation\n",
+			   kmstest_pipe_name(data->pipe));
+		return false;
+	}
+
+	return true;
+}
+
+static bool check_dp_gen11_constraint(data_t *data)
+{
+	igt_output_t *output = data->output;
+	uint32_t devid = intel_get_drm_devid(data->drm_fd);
+	drmModeConnector *connector = output->config.connector;
+
+	if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) &&
+	    (data->pipe == PIPE_A) && IS_GEN11(devid)) {
+		igt_debug("DSC not supported on pipe A on external DP in gen11 platforms\n");
+		return false;
+	}
+
+	return true;
+}
+
+static void test_cleanup(data_t *data)
+{
+	igt_output_t *output = data->output;
+	igt_plane_t *primary;
+
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, NULL);
+
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_remove_fb(data->drm_fd, &data->fb_test_pattern);
+}
+
+/* re-probe connectors and do a modeset with DSC */
 static void update_display(data_t *data, enum dsc_test_type test_type)
 {
 	bool enabled;
 	igt_plane_t *primary;
+	drmModeModeInfo *mode;
+	igt_output_t *output = data->output;
+	igt_display_t *display = &data->display;
 
-	/* Disable the output first */
-	igt_output_set_pipe(data->output, PIPE_NONE);
-	igt_display_commit(&data->display);
+	/* sanitize the state before starting the subtest */
+	igt_display_reset(display);
+	igt_display_commit(display);
 
 	igt_debug("DSC is supported on %s\n", data->output->name);
 	save_force_dsc_en(data);
 	force_dsc_enable(data);
-	if (test_type == test_dsc_compression_bpp) {
+
+	if (test_type == TEST_DSC_COMPRESSION_BPP) {
 		igt_debug("Trying to set BPP to %d\n", data->compression_bpp);
 		force_dsc_enable_bpp(data);
 	}
 
-	igt_output_set_pipe(data->output, data->pipe);
-	qsort(data->output->config.connector->modes,
-			data->output->config.connector->count_modes,
-			sizeof(drmModeModeInfo),
-			sort_drm_modes);
-	igt_output_override_mode(data->output, &data->output->config.connector->modes[0]);
-	primary = igt_output_get_plane_type(data->output,
-					    DRM_PLANE_TYPE_PRIMARY);
+	igt_output_set_pipe(output, data->pipe);
+
+	mode = get_highres_mode(output);
+	igt_require(mode != NULL);
+	igt_output_override_mode(output, mode);
+
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_create_pattern_fb(data->drm_fd,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR,
+			      &data->fb_test_pattern);
 
-	/* Now set the output to the desired mode */
 	igt_plane_set_fb(primary, &data->fb_test_pattern);
-	igt_display_commit(&data->display);
+	igt_display_commit(display);
 
-	/*
-	 * Until we have CRC check support, manually check if RGB test
+	/* until we have CRC check support, manually check if RGB test
 	 * pattern has no corruption.
 	 */
 	manual("RGB test pattern without corruption");
 
-	enabled = igt_is_dsc_enabled(data->drm_fd,
-				     data->output->name);
+	enabled = igt_is_dsc_enabled(data->drm_fd, output->name);
 	restore_force_dsc_en();
 	igt_debug("Reset compression BPP\n");
 	data->compression_bpp = 0;
 	force_dsc_enable_bpp(data);
 
 	igt_assert_f(enabled,
-		     "Default DSC enable failed on Connector: %s Pipe: %s\n",
-		     data->output->name,
+		     "Default DSC enable failed on connector: %s pipe: %s\n",
+		     output->name,
 		     kmstest_pipe_name(data->pipe));
+
+	test_cleanup(data);
 }
 
-static void run_test(data_t *data, enum dsc_test_type test_type)
+static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpp)
 {
-	enum pipe pipe;
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
 	char test_name[10];
+	enum pipe pipe;
 
-	igt_skip_on_f(test_type == test_dsc_compression_bpp &&
-		      data->output->config.connector->modes[0].hdisplay >= 5120,
-		      "bigjoiner does not support force bpp\n");
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		data->compression_bpp = bpp;
+		data->output = output;
+		data->pipe = pipe;
 
-	igt_create_pattern_fb(data->drm_fd,
-			      data->output->config.connector->modes[0].hdisplay,
-			      data->output->config.connector->modes[0].vdisplay,
-			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &data->fb_test_pattern);
+		if (!check_dsc_on_connector(data))
+			continue;
 
-	for_each_pipe(&data->display, pipe) {
-		uint32_t devid = intel_get_drm_devid(data->drm_fd);
+		if (!check_big_joiner_test_constraint(data, test_type))
+			continue;
 
-		if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
-		    pipe == PIPE_A && IS_GEN11(devid)) {
-			igt_debug("DSC not supported on Pipe A on external DP in Gen11 platforms\n");
+		if (!check_dp_gen11_constraint(data))
 			continue;
-		}
 
-		snprintf(test_name, sizeof(test_name), "-%dbpp", data->compression_bpp);
-		if (!igt_pipe_connector_valid(pipe, data->output))
+		if (!check_big_joiner_pipe_constraint(data))
 			continue;
 
-		igt_dynamic_f("%s-pipe-%s%s", data->output->name,
-			      kmstest_pipe_name(pipe),
-			      (test_type == test_dsc_compression_bpp) ?
-			      test_name : "") {
-			data->pipe = pipe;
-			igt_skip_on_f((data->output->config.connector->modes[0].hdisplay >= 5120) &&
-				      (pipe  == (data->n_pipes - 1)),
-				      "pipe-%s not supported due to bigjoiner limitation\n",
-				      kmstest_pipe_name(pipe));
+		snprintf(test_name, sizeof(test_name), "-%dbpp", data->compression_bpp);
+		igt_dynamic_f("pipe-%s-%s%s",  kmstest_pipe_name(data->pipe), data->output->name,
+			     (test_type == TEST_DSC_COMPRESSION_BPP) ? test_name : "")
 			update_display(data, test_type);
-
-		}
-		if (test_type == test_dsc_compression_bpp)
-			break;
 	}
-
-	igt_remove_fb(data->drm_fd, &data->fb_test_pattern);
 }
 
 igt_main
 {
 	data_t data = {};
-	drmModeRes *res;
-	drmModeConnector *connector = NULL;
-	int i, j;
+	int i;
+
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
 		igt_install_exit_handler(kms_dsc_exit_handler);
 		igt_display_require(&data.display, data.drm_fd);
-		igt_require(res = drmModeGetResources(data.drm_fd));
+		igt_display_require_output(&data.display);
 		data.n_pipes = 0;
 		for_each_pipe(&data.display, i)
 			data.n_pipes++;
 	}
-	igt_subtest_with_dynamic("basic-dsc-enable") {
-		for (j = 0; j < res->count_connectors; j++) {
-			if (!check_dsc_on_connector(&data, res->connectors[j]))
-				continue;
-			run_test(&data, test_basic_dsc_enable);
-		}
-	}
-	/* currently we are validating compression bpp on XRGB8888 format only */
+
+	igt_describe("Tests basic display stream compression functionality if supported "
+		     "by a connector by forcing DSC on all connectors that support it "
+		     "with default parameters");
+	igt_subtest_with_dynamic("basic-dsc-enable")
+			test_dsc(&data, TEST_BASIC_DSC_ENABLE, 0);
+
+	igt_fixture
+		igt_require(intel_display_ver(data.devid) >= 13);
+
+	igt_describe("Tests basic display stream compression functionality if supported "
+		     "by a connector by forcing DSC on all connectors that support it "
+		     "with certain BPP as the output BPP for the connector");
 	igt_subtest_with_dynamic("XRGB8888-dsc-compression") {
 		uint32_t bpp_list[] = {
 			XRGB8888_DRM_FORMAT_MIN_BPP,
 			(XRGB8888_DRM_FORMAT_MIN_BPP  +
-			 (XRGB8888_DRM_FORMAT_MIN_BPP * 3) - 1) / 2,
+			(XRGB8888_DRM_FORMAT_MIN_BPP * 3) - 1) / 2,
 			(XRGB8888_DRM_FORMAT_MIN_BPP * 3) - 1
 		};
 
-		igt_require(intel_display_ver(data.devid) >= 13);
-
-		for (j = 0; j < res->count_connectors; j++) {
-			if (!check_dsc_on_connector(&data, res->connectors[j]))
-				continue;
-
-			for (i = 0; i < ARRAY_SIZE(bpp_list); i++) {
-				data.compression_bpp = bpp_list[i];
-				run_test(&data, test_dsc_compression_bpp);
-			}
-		}
+		for (int j = 0; j < ARRAY_SIZE(bpp_list); j++)
+			test_dsc(&data, TEST_DSC_COMPRESSION_BPP, bpp_list[j]);
 	}
 
 	igt_fixture {
-		if (connector)
-			drmModeFreeConnector(connector);
-		test_cleanup(&data);
-		drmModeFreeResources(res);
 		igt_display_fini(&data.display);
 		close(data.drm_fd);
 	}
-- 
2.25.1
