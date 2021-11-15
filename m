Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B515E6E120
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Nov 2021 15:45:37 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Mon, 15 Nov 2021 20:59:38 +0530
Message-Id: <20211115152938.21269-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20211112122752.29241-1-venkata.sai.patnana@intel.com>
References: <20211112122752.29241-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 i-g-t] tests/i915/kms_dsc: To test modeset on
 dsc with highest mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>

Force dsc enable supports resolutions above 5K in DP.
Bigjoiner does not support force bpp also due to bigjoiner
limitation pipe D we are skipping. In this patch,
changes are done to pick the highest mode rather the default mode.

v2: Updated indentation

Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
---
 tests/i915/kms_dsc.c | 149 +++++++++++++++++++++++++++++--------------
 1 file changed, 102 insertions(+), 47 deletions(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index dcfe8b9669..dff5ce29d2 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -63,8 +63,8 @@ typedef struct {
 	drmModeEncoder *encoder;
 	int crtc;
 	int compression_bpp;
+	int n_pipes;
 	enum pipe pipe;
-	char conn_name[128];
 } data_t;
 
 bool force_dsc_en_orig;
@@ -79,7 +79,7 @@ static void force_dsc_enable(data_t *data)
 {
 	int ret;
 
-	igt_debug ("Forcing DSC enable on %s\n", data->conn_name);
+	igt_debug ("Forcing DSC enable on %s\n", data->output->name);
 	ret = igt_force_dsc_enable(data->drm_fd,
 				      data->output->config.connector);
 	igt_assert_f(ret > 0, "debugfs_write failed");
@@ -90,7 +90,7 @@ static void force_dsc_enable_bpp(data_t *data)
 	int ret;
 
 	igt_debug("Forcing DSC BPP to %d on %s\n",
-		  data->compression_bpp, data->conn_name);
+		  data->compression_bpp, data->output->name);
 	ret = igt_force_dsc_enable_bpp(data->drm_fd,
 					  data->output->config.connector,
 					  data->compression_bpp);
@@ -151,41 +151,55 @@ static bool is_external_panel(drmModeConnector *connector)
 	}
 }
 
-static bool check_dsc_on_connector(data_t *data, uint32_t drmConnector)
+static int sort_drm_modes(const void *a, const void *b)
+{
+	const drmModeModeInfo *mode1 = a, *mode2 = b;
+
+	return (mode1->clock < mode2->clock) - (mode2->clock < mode1->clock);
+}
+
+static igt_output_t *check_dsc_on_connector(data_t *data, uint32_t drmConnector)
 {
 	drmModeConnector *connector;
 	igt_output_t *output;
-
 	connector = drmModeGetConnectorCurrent(data->drm_fd,
 					       drmConnector);
 	if (connector->connection != DRM_MODE_CONNECTED)
-		return false;
+		return NULL;
 
 	output = igt_output_from_connector(&data->display, connector);
-	sprintf(data->conn_name, "%s-%d",
-		kmstest_connector_type_str(connector->connector_type),
-		connector->connector_type_id);
+
+        /* As dsc supports >= 5k modes, we need to supress lower
+         * resolutions.
+	 */
+	qsort(output->config.connector->modes,
+	      output->config.connector->count_modes,
+	      sizeof(drmModeModeInfo),
+	      sort_drm_modes);
+	if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
+	    output->config.connector->modes[0].hdisplay < 5120)
+		return NULL;
 
 	if (!igt_is_dsc_supported(data->drm_fd, connector)) {
 		igt_debug("DSC not supported on connector %s\n",
-			  data->conn_name);
-		return false;
+			  output->name);
+		return NULL;
 	}
 	if (is_external_panel(connector) &&
 	    !igt_is_fec_supported(data->drm_fd, connector)) {
 		igt_debug("DSC cannot be enabled without FEC on %s\n",
-			  data->conn_name);
-		return false;
+			  output->name);
+		return NULL;
 	}
-	data->output = output;
-	return true;
+	return output;
 }
 
 /*
  * Re-probe connectors and do a modeset with DSC
  *
  */
-static void update_display(data_t *data, enum dsc_test_type test_type)
+static void update_display(data_t *data, enum dsc_test_type test_type,
+			   unsigned int drm_format)
 {
 	bool enabled;
 	igt_plane_t *primary;
@@ -194,7 +208,7 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 	igt_output_set_pipe(data->output, PIPE_NONE);
 	igt_display_commit(&data->display);
 
-	igt_debug("DSC is supported on %s\n", data->conn_name);
+	igt_debug("DSC is supported on %s\n", data->output->name);
 	save_force_dsc_en(data);
 	force_dsc_enable(data);
 	if (test_type == test_dsc_compression_bpp) {
@@ -203,8 +217,15 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 	}
 
 	igt_output_set_pipe(data->output, data->pipe);
+	qsort(data->output->config.connector->modes,
+	      data->output->config.connector->count_modes,
+	      sizeof(drmModeModeInfo),
+	      sort_drm_modes);
+	igt_output_override_mode(data->output, &data->output->config.connector->modes[0]);
 	primary = igt_output_get_plane_type(data->output,
 					    DRM_PLANE_TYPE_PRIMARY);
+	igt_skip_on_f(!igt_plane_has_format_mod(primary, drm_format, DRM_FORMAT_MOD_LINEAR),
+		      "plane %s format does not have support \n", igt_format_str(drm_format));
 
 	/* Now set the output to the desired mode */
 	igt_plane_set_fb(primary, &data->fb_test_pattern);
@@ -217,29 +238,33 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 	manual("RGB test pattern without corruption");
 
 	enabled = igt_is_dsc_enabled(data->drm_fd,
-					data->output->config.connector);
+				     data->output->config.connector);
 	restore_force_dsc_en();
-	if (test_type == test_dsc_compression_bpp) {
-		igt_debug("Rest compression BPP \n");
-		data->compression_bpp = 0;
-		force_dsc_enable_bpp(data);
-	}
+
+	igt_debug("Reset compression BPP \n");
+	data->compression_bpp = 0;
+	force_dsc_enable_bpp(data);
 
 	igt_assert_f(enabled,
 		     "Default DSC enable failed on Connector: %s Pipe: %s\n",
-		     data->conn_name,
+		     data->output->name,
 		     kmstest_pipe_name(data->pipe));
 }
 
-static void run_test(data_t *data, enum dsc_test_type test_type)
+static void run_test(data_t *data, enum dsc_test_type test_type,
+		     unsigned int drm_format)
 {
 	enum pipe pipe;
 	char test_name[10];
-	drmModeModeInfo *mode = igt_output_get_mode(data->output);
 
-	igt_create_pattern_fb(data->drm_fd, mode->hdisplay,
-			      mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
+	igt_skip_on_f (test_type == test_dsc_compression_bpp &&
+		       data->output->config.connector->modes[0].hdisplay >= 5120,
+		       "Bigjoiner does not support force bpp\n");
+
+	igt_create_pattern_fb(data->drm_fd,
+			      data->output->config.connector->modes[0].hdisplay,
+			      data->output->config.connector->modes[0].vdisplay,
+			      drm_format,
 			      DRM_FORMAT_MOD_LINEAR,
 			      &data->fb_test_pattern);
 
@@ -253,14 +278,19 @@ static void run_test(data_t *data, enum dsc_test_type test_type)
 		}
 
 		snprintf(test_name, sizeof(test_name), "-%dbpp", data->compression_bpp);
-		if (igt_pipe_connector_valid(pipe, data->output)) {
-			data->pipe = pipe;
+		if (!igt_pipe_connector_valid(pipe, data->output))
+			continue;
 
-			igt_dynamic_f("%s-pipe-%s%s", data->output->name,
-					kmstest_pipe_name(pipe),
-					(test_type == test_dsc_compression_bpp) ?
-					 test_name : "")
-				update_display(data, test_type);
+		igt_dynamic_f("%s-pipe-%s%s", data->output->name,
+			      kmstest_pipe_name(pipe),
+			      (test_type == test_dsc_compression_bpp) ?
+			      test_name : "") {
+			igt_require_f((data->output->config.connector->modes[0].hdisplay >= 5120) &&
+				      (pipe < (data->n_pipes - 1)),
+				      "pipe-%s not supported due to bigjoiner limitation\n",
+				      kmstest_pipe_name(pipe));
+			data->pipe = pipe;
+			update_display(data, test_type, drm_format);
 		}
 
 		if (test_type == test_dsc_compression_bpp)
@@ -275,7 +305,17 @@ igt_main
 	data_t data = {};
 	drmModeRes *res;
 	drmModeConnector *connector = NULL;
-	int i, j;
+	igt_output_t *outputs[IGT_MAX_PIPES] = {};
+	igt_output_t *output;
+	int i, j, supported_connectors = 0;
+	struct {
+		unsigned int bpc;
+		int format;
+		char format_str[20];
+	} test_list[] = {
+		{8, DRM_FORMAT_XRGB8888, "XRGB8888"},
+		{10, DRM_FORMAT_XRGB2101010, "XRGB2101010"},
+	};
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 		data.devid = intel_get_drm_devid(data.drm_fd);
@@ -283,14 +323,30 @@ igt_main
 		igt_install_exit_handler(kms_dsc_exit_handler);
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require(res = drmModeGetResources(data.drm_fd));
-	}
-	igt_subtest_with_dynamic("basic-dsc-enable") {
 		for (j = 0; j < res->count_connectors; j++) {
-			if (!check_dsc_on_connector(&data, res->connectors[j]))
-				continue;
-			run_test(&data, test_basic_dsc_enable);
+			output = check_dsc_on_connector(&data, res->connectors[j]);
+
+			if (output)
+				outputs[supported_connectors++] = output;
 		}
+		igt_require_f(supported_connectors, "No DSC supported panel connected.\n");
+		data.n_pipes = 0;
+		for_each_pipe(&data.display, i)
+			data.n_pipes++;
+
 	}
+
+	for (i=0; i < ARRAY_SIZE(test_list); i++) {
+		igt_subtest_with_dynamic_f("basic-dsc-enable-%s",
+					   test_list[i].format_str) {
+			for (j = 0; j < supported_connectors; j++) {
+				data.output = outputs[j];
+				run_test(&data, test_basic_dsc_enable,
+					 test_list[i].format);
+			}
+		}
+	}
+
 	/* currently we are validating compression bpp on XRGB8888 format only */
 	igt_subtest_with_dynamic("XRGB8888-dsc-compression") {
 		uint32_t bpp_list[] = {
@@ -302,13 +358,12 @@ igt_main
 
 		igt_require(intel_display_ver(data.devid) >= 13);
 
-		for (j = 0; j < res->count_connectors; j++) {
-			if (!check_dsc_on_connector(&data, res->connectors[j]))
-				continue;
-
+		for (j = 0; j < supported_connectors; j++) {
+			data.output = outputs[j];
 			for (i = 0; i < ARRAY_SIZE(bpp_list); i++) {
 				data.compression_bpp = bpp_list[i];
-				run_test(&data, test_dsc_compression_bpp);
+				run_test(&data, test_dsc_compression_bpp,
+					 DRM_FORMAT_XRGB8888);
 			}
 		}
 	}
-- 
2.25.1
