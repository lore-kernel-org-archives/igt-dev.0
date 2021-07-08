Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BE66E944
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jul 2021 17:00:10 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Thu,  8 Jul 2021 22:18:59 +0530
Message-Id: <20210708164902.18250-2-venkata.sai.patnana@intel.com>
In-Reply-To: <20210708164902.18250-1-venkata.sai.patnana@intel.com>
References: <20210708164902.18250-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 1/4] tests/kms_dp_dsc: Add a subtest to
 force DSC output BPP
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
List-ID: <igt-dev@lists.freedesktop.org>

From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>

This subtest uses the accepted DSC BPPs and tries to
force a modeset by setting a certain BPP as the output
BPP for a connector.

Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Cc: Navare Manasi D <manasi.d.navare@intel.com>
Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
---
 tests/kms_dp_dsc.c | 203 ++++++++++++++++++++++++++++-----------------
 1 file changed, 126 insertions(+), 77 deletions(-)

diff --git a/tests/kms_dp_dsc.c b/tests/kms_dp_dsc.c
index 3fb9852e9e..08414e316e 100644
--- a/tests/kms_dp_dsc.c
+++ b/tests/kms_dp_dsc.c
@@ -44,23 +44,26 @@
 #include <fcntl.h>
 #include <termios.h>
 
+/* currently dsc compression is verifying on 8bpc frame only */
+#define XRGB8888_DRM_FORMAT_MIN_BPP 8
+
 enum dsc_test_type
 {
-	test_basic_dsc_enable
+	test_basic_dsc_enable,
+	test_dsc_compression_bpp
 };
 
 typedef struct {
 	int drm_fd;
 	int debugfs_fd;
-	uint32_t id;
+	uint32_t devid;
 	igt_display_t display;
 	struct igt_fb fb_test_pattern;
 	igt_output_t *output;
 	int mode_valid;
-	drmModeModeInfo *mode;
-	drmModeConnector *connector;
 	drmModeEncoder *encoder;
 	int crtc;
+	int compression_bpp;
 	enum pipe pipe;
 	char conn_name[128];
 } data_t;
@@ -121,6 +124,22 @@ static void force_dp_dsc_enable(data_t *data)
 	igt_assert_f(ret > 0, "debugfs_write failed");
 }
 
+static void force_dp_dsc_enable_bpp(data_t *data)
+{
+	int ret;
+	char file_name[128] = {0};
+	char buffer[20];
+
+	sprintf(buffer, "%d", data->compression_bpp);
+	strcpy(file_name, data->conn_name);
+	strcat(file_name, "/i915_dsc_bpp");
+	igt_debug("Forcing DSC BPP to %d on %s\n",
+		  data->compression_bpp, data->conn_name);
+	ret = igt_sysfs_write(data->debugfs_fd, file_name,
+			      buffer, sizeof(buffer));
+	igt_assert_f(ret > 0, "debugfs_write failed");
+}
+
 static bool is_force_dsc_enabled(data_t *data)
 {
 	char file_name[128] = {0};
@@ -165,6 +184,7 @@ static void test_cleanup(data_t *data)
 		primary = igt_output_get_plane_type(data->output,
 						    DRM_PLANE_TYPE_PRIMARY);
 		igt_plane_set_fb(primary, NULL);
+		igt_output_set_pipe(data->output, PIPE_NONE);
 		igt_display_commit(&data->display);
 	}
 }
@@ -174,6 +194,37 @@ static void kms_dp_dsc_exit_handler(int sig)
 	restore_force_dsc_en();
 }
 
+static bool check_dsc_on_connector(data_t *data, uint32_t drmConnector)
+{
+	drmModeConnector *connector;
+	igt_output_t *output;
+
+	connector = drmModeGetConnectorCurrent(data->drm_fd,
+					       drmConnector);
+	if (connector->connection != DRM_MODE_CONNECTED ||
+	    ((connector->connector_type != DRM_MODE_CONNECTOR_eDP) &&
+	    (connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort)))
+		return false;
+
+	output = igt_output_from_connector(&data->display, connector);
+	sprintf(data->conn_name, "%s-%d",
+		kmstest_connector_type_str(connector->connector_type),
+		connector->connector_type_id);
+
+	if (!is_dp_dsc_supported(data)) {
+		igt_debug("DSC not supported on connector %s\n",
+			  data->conn_name);
+		return false;
+	}
+	if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
+	    !is_dp_fec_supported(data)) {
+		igt_debug("DSC cannot be enabled without FEC on %s\n",
+			  data->conn_name);
+		return false;
+	}
+	data->output = output;
+	return true;
+}
 
 /*
  * Re-probe connectors and do a modeset with DSC
@@ -181,54 +232,52 @@ static void kms_dp_dsc_exit_handler(int sig)
  */
 static void update_display(data_t *data, enum dsc_test_type test_type)
 {
+	bool enabled;
 	igt_plane_t *primary;
-	data->connector = data->output->config.connector;
 
 	/* Disable the output first */
 	igt_output_set_pipe(data->output, PIPE_NONE);
 	igt_display_commit(&data->display);
 
-	if (test_type == test_basic_dsc_enable) {
-		bool enabled;
+	igt_debug("DSC is supported on %s\n", data->conn_name);
+	save_force_dsc_en(data);
+	force_dp_dsc_enable(data);
+	if (test_type == test_dsc_compression_bpp) {
+		igt_debug("Trying to set BPP to %d\n", data->compression_bpp);
+		force_dp_dsc_enable_bpp(data);
+	}
 
-		igt_debug("DSC is supported on %s\n", data->conn_name);
-		save_force_dsc_en(data);
-		force_dp_dsc_enable(data);
+	igt_output_set_pipe(data->output, data->pipe);
+	primary = igt_output_get_plane_type(data->output,
+					    DRM_PLANE_TYPE_PRIMARY);
 
-		igt_output_set_pipe(data->output, data->pipe);
-		primary = igt_output_get_plane_type(data->output,
-						    DRM_PLANE_TYPE_PRIMARY);
+	/* Now set the output to the desired mode */
+	igt_plane_set_fb(primary, &data->fb_test_pattern);
+	igt_display_commit(&data->display);
 
-		/* Now set the output to the desired mode */
-		igt_plane_set_fb(primary, &data->fb_test_pattern);
-		igt_display_commit(&data->display);
+	/*
+	 * Until we have CRC check support, manually check if RGB test
+	 * pattern has no corruption.
+	 */
+	manual("RGB test pattern without corruption");
 
-		/*
-		 * Until we have CRC check support, manually check if RGB test
-		 * pattern has no corruption.
-		 */
-		manual("RGB test pattern without corruption");
-
-		enabled = is_dp_dsc_enabled(data);
-		restore_force_dsc_en();
-
-		igt_assert_f(enabled,
-			     "Default DSC enable failed on Connector: %s Pipe: %s\n",
-			     data->conn_name,
-			     kmstest_pipe_name(data->pipe));
-	} else {
-		igt_assert(!"Unknown test type\n");
-	}
+	enabled = is_dp_dsc_enabled(data);
+	restore_force_dsc_en();
+
+	igt_assert_f(enabled,
+		     "Default DSC enable failed on Connector: %s Pipe: %s\n",
+		     data->conn_name,
+		     kmstest_pipe_name(data->pipe));
 }
 
-static void run_test(data_t *data, igt_output_t *output,
-		     enum dsc_test_type test_type)
+static void run_test(data_t *data, enum dsc_test_type test_type)
 {
 	enum pipe pipe;
+	char test_name[10];
+	drmModeModeInfo *mode = igt_output_get_mode(data->output);
 
-	data->mode = igt_output_get_mode(output);
-	igt_create_pattern_fb(data->drm_fd, data->mode->hdisplay,
-			      data->mode->vdisplay,
+	igt_create_pattern_fb(data->drm_fd, mode->hdisplay,
+			      mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
 			      LOCAL_DRM_FORMAT_MOD_NONE,
 			      &data->fb_test_pattern);
@@ -237,19 +286,26 @@ static void run_test(data_t *data, igt_output_t *output,
 		if (is_i915_device(data->drm_fd)) {
 			uint32_t devid = intel_get_drm_devid(data->drm_fd);
 
-			if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
+			if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
 			    pipe == PIPE_A && IS_GEN11(devid)) {
 				igt_debug("DSC not supported on Pipe A on external DP in Gen11 platforms\n");
 				continue;
 			}
 		}
 
-		if (igt_pipe_connector_valid(pipe, output)) {
+		snprintf(test_name, sizeof(test_name), "-%dbpp", data->compression_bpp);
+		if (igt_pipe_connector_valid(pipe, data->output)) {
 			data->pipe = pipe;
-			data->output = output;
-			update_display(data, test_type);
-			test_cleanup(data);
+
+			igt_dynamic_f("%s-pipe-%s%s", data->output->name,
+					kmstest_pipe_name(pipe),
+					(test_type == test_dsc_compression_bpp) ?
+					 test_name : "")
+				update_display(data, test_type);
 		}
+
+		if (test_type == test_dsc_compression_bpp)
+			break;
 	}
 
 	igt_remove_fb(data->drm_fd, &data->fb_test_pattern);
@@ -258,59 +314,52 @@ static void run_test(data_t *data, igt_output_t *output,
 igt_main
 {
 	data_t data = {};
-	igt_output_t *output;
 	drmModeRes *res;
 	drmModeConnector *connector = NULL;
-	int i, test_conn_cnt, test_cnt;
-	int tests[] = {DRM_MODE_CONNECTOR_eDP, DRM_MODE_CONNECTOR_DisplayPort};
-
+	int i, j;
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		igt_require_intel(data.drm_fd);
+		data.devid = intel_get_drm_devid(data.drm_fd);
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
 		igt_install_exit_handler(kms_dp_dsc_exit_handler);
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require(res = drmModeGetResources(data.drm_fd));
 	}
+	igt_subtest_with_dynamic("basic-dsc-enable") {
+		for (j = 0; j < res->count_connectors; j++) {
+			if (!check_dsc_on_connector(&data, res->connectors[j]))
+				continue;
+			run_test(&data, test_basic_dsc_enable);
+		}
+	}
+	/* currently we are validating compression bpp on XRGB8888 format only */
+	igt_subtest_with_dynamic("XRGB8888-dsc-compression") {
+		uint32_t bpp_list[] = {
+			XRGB8888_DRM_FORMAT_MIN_BPP,
+			(XRGB8888_DRM_FORMAT_MIN_BPP  +
+			 (XRGB8888_DRM_FORMAT_MIN_BPP * 3) - 1) / 2,
+			(XRGB8888_DRM_FORMAT_MIN_BPP * 3) - 1
+		};
+
+		igt_require(intel_display_ver(data.devid) >= 13);
+
+		for (j = 0; j < res->count_connectors; j++) {
+			if (!check_dsc_on_connector(&data, res->connectors[j]))
+				continue;
 
-	for (test_cnt = 0; test_cnt < ARRAY_SIZE(tests); test_cnt++) {
-		igt_describe("Validate display stream compression functionality if supported on "
-			       "DP/eDP connector");
-		igt_subtest_f("basic-dsc-enable-%s",
-			      kmstest_connector_type_str(tests[test_cnt])) {
-			test_conn_cnt = 0;
-			for (i = 0; i < res->count_connectors; i++) {
-				connector = drmModeGetConnectorCurrent(data.drm_fd,
-								       res->connectors[i]);
-				if (connector->connection != DRM_MODE_CONNECTED ||
-				    connector->connector_type !=
-				    tests[test_cnt])
-					continue;
-				output = igt_output_from_connector(&data.display, connector);
-				sprintf(data.conn_name, "%s-%d",
-					kmstest_connector_type_str(connector->connector_type),
-					connector->connector_type_id);
-				if(!is_dp_dsc_supported(&data)) {
-					igt_debug("DSC not supported on connector %s \n",
-						  data.conn_name);
-					continue;
-				}
-				if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
-				    !is_dp_fec_supported(&data)) {
-					igt_debug("DSC cannot be enabled without FEC on %s\n",
-						  data.conn_name);
-					continue;
-				}
-				test_conn_cnt++;
-				run_test(&data, output, test_basic_dsc_enable);
+			for (i = 0; i < ARRAY_SIZE(bpp_list); i++) {
+				data.compression_bpp = bpp_list[i];
+				run_test(&data, test_dsc_compression_bpp);
 			}
-			igt_skip_on(test_conn_cnt == 0);
 		}
 	}
 
 	igt_fixture {
 		if (connector)
 			drmModeFreeConnector(connector);
+		test_cleanup(&data);
 		drmModeFreeResources(res);
 		close(data.debugfs_fd);
 		close(data.drm_fd);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
