Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B066E1B5
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jun 2021 05:31:02 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Fri, 11 Jun 2021 10:50:00 +0530
Message-Id: <20210611052005.303-12-venkata.sai.patnana@intel.com>
In-Reply-To: <20210611052005.303-1-venkata.sai.patnana@intel.com>
References: <20210611052005.303-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 12/17] tests/kms_dp_dsc: Add a subtest to
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>

This subtest uses the accepted DSC BPPs and tries to
force a modeset by setting a certain BPP as the output
BPP for a connector.

Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com> (v7)
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Cc: Navare Manasi D <manasi.d.navare@intel.com>
Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
---
 tests/kms_dp_dsc.c | 181 ++++++++++++++++++++++++++++-----------------
 1 file changed, 113 insertions(+), 68 deletions(-)

diff --git a/tests/kms_dp_dsc.c b/tests/kms_dp_dsc.c
index 8bd2102447..71d655af70 100644
--- a/tests/kms_dp_dsc.c
+++ b/tests/kms_dp_dsc.c
@@ -44,15 +44,19 @@
 #include <fcntl.h>
 #include <termios.h>
 
+/* currently dsc compression is verifying on 8bpc frame only */
+#define DRM_FORMAT_BPC	8
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
@@ -61,6 +65,7 @@ typedef struct {
 	drmModeConnector *connector;
 	drmModeEncoder *encoder;
 	int crtc;
+	int compression_bpp;
 	enum pipe pipe;
 	char conn_name[128];
 } data_t;
@@ -121,6 +126,22 @@ static void force_dp_dsc_enable(data_t *data)
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
+	strcat(file_name, "/i915_dsc_bpp_support");
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
@@ -174,6 +195,37 @@ static void kms_dp_dsc_exit_handler(int sig)
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
@@ -181,6 +233,7 @@ static void kms_dp_dsc_exit_handler(int sig)
  */
 static void update_display(data_t *data, enum dsc_test_type test_type)
 {
+	bool enabled;
 	igt_plane_t *primary;
 	data->connector = data->output->config.connector;
 
@@ -188,37 +241,35 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
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
 
 static void run_test(data_t *data, igt_output_t *output,
@@ -244,12 +295,16 @@ static void run_test(data_t *data, igt_output_t *output,
 			}
 		}
 
-		if (igt_pipe_connector_valid(pipe, output)) {
-			data->pipe = pipe;
-			data->output = output;
-			update_display(data, test_type);
-			test_cleanup(data);
-		}
+		igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe))
+			if (igt_pipe_connector_valid(pipe, output)) {
+				data->pipe = pipe;
+				data->output = output;
+				update_display(data, test_type);
+				test_cleanup(data);
+			}
+
+		if (test_type == test_dsc_compression_bpp)
+			break;
 	}
 
 	igt_remove_fb(data->drm_fd, &data->fb_test_pattern);
@@ -258,57 +313,47 @@ static void run_test(data_t *data, igt_output_t *output,
 igt_main
 {
 	data_t data = {};
-	igt_output_t *output;
 	drmModeRes *res;
 	drmModeConnector *connector;
-	int i, test_conn_cnt, test_cnt;
-	int tests[] = {DRM_MODE_CONNECTOR_eDP, DRM_MODE_CONNECTOR_DisplayPort};
-
+	int i, j, test_conn_cnt;
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
-
-	for (test_cnt = 0; test_cnt < ARRAY_SIZE(tests); test_cnt++) {
-		igt_describe("Validate display stream compression functionality if supported on "
-			       "DP/eDP connector");
-		igt_subtest_f("basic-dsc-enable-%s",
-			      kmstest_connector_type_str(tests[test_cnt])) {
+	igt_subtest_with_dynamic("basic-dsc-enable") {
+		test_conn_cnt = 0;
+		for (j = 0; j < res->count_connectors; j++) {
+			if (!check_dsc_on_connector(&data, res->connectors[j]))
+				continue;
+			test_conn_cnt++;
+			run_test(&data, data.output, test_basic_dsc_enable);
+		}
+		igt_skip_on_f(test_conn_cnt == 0, "DSC not supported on any connector\n");
+	}
+	/* currently we are validating compression bpp on XRGB8888 format only */
+	for (i = DRM_FORMAT_BPC; i <= ((DRM_FORMAT_BPC*3)-1); i++) {
+		igt_subtest_with_dynamic_f("dsc-%dbpp-compression-XRGB8888", i) {
 			test_conn_cnt = 0;
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
+			data.compression_bpp = i;
+			igt_require(intel_display_ver(data.devid) >= 13);
+			for (j = 0; j < res->count_connectors; j++) {
+				if (!check_dsc_on_connector(&data, res->connectors[j]))
 					continue;
-				}
 				test_conn_cnt++;
-				run_test(&data, output, test_basic_dsc_enable);
+				run_test(&data, data.output, test_dsc_compression_bpp);
 			}
-			igt_skip_on(test_conn_cnt == 0);
+			igt_skip_on_f(test_conn_cnt == 0, "DSC not supported on any connector\n");
 		}
 	}
 
 	igt_fixture {
+		test_cleanup(&data);
 		drmModeFreeConnector(connector);
 		drmModeFreeResources(res);
 		close(data.debugfs_fd);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
