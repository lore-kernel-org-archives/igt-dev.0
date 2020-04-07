Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BE46E872
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2020 13:16:45 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue, 7 Apr 2020 16:16:28 +0300
Message-ID: <20200407131633.1350311-2-arkadiusz.hiler@intel.com>
In-Reply-To: <20200407131633.1350311-1-arkadiusz.hiler@intel.com>
References: <20200407131633.1350311-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/7] tests/kms_dp_dsc: Explicitly enable
 mode before DSC checks
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

The test was depending on a leftover mode set by something external
(usually fbcon) in order to work.

Let's create the FB once ahead of any testing, set a mode and check for
DSC support.

Few extra cleanups:
 * remove unused fields in data_t
 * properly free connector
 * don't recreate FB while iterating over pipes

Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
---
 tests/kms_dp_dsc.c | 73 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 53 insertions(+), 20 deletions(-)

diff --git a/tests/kms_dp_dsc.c b/tests/kms_dp_dsc.c
index e2e3aaa0..7107fe59 100644
--- a/tests/kms_dp_dsc.c
+++ b/tests/kms_dp_dsc.c
@@ -52,15 +52,11 @@ enum dsc_test_type
 typedef struct {
 	int drm_fd;
 	int debugfs_fd;
-	uint32_t id;
 	igt_display_t display;
 	struct igt_fb fb_test_pattern;
 	igt_output_t *output;
-	int mode_valid;
 	drmModeModeInfo *mode;
 	drmModeConnector *connector;
-	drmModeEncoder *encoder;
-	int crtc;
 	enum pipe pipe;
 	char conn_name[128];
 } data_t;
@@ -168,7 +164,6 @@ static void test_cleanup(data_t *data)
 						    DRM_PLANE_TYPE_PRIMARY);
 		igt_plane_set_fb(primary, NULL);
 		igt_display_commit(&data->display);
-		igt_remove_fb(data->drm_fd, &data->fb_test_pattern);
 	}
 }
 
@@ -185,8 +180,6 @@ static void kms_dp_dsc_exit_handler(int sig)
 static void update_display(data_t *data, enum dsc_test_type test_type)
 {
 	igt_plane_t *primary;
-	data->mode = igt_output_get_mode(data->output);
-	data->connector = data->output->config.connector;
 
 	if (data->connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
 	    data->pipe == PIPE_A) {
@@ -206,11 +199,6 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 		force_dp_dsc_enable(data);
 
 		igt_output_set_pipe(data->output, data->pipe);
-		igt_create_pattern_fb(data->drm_fd, data->mode->hdisplay,
-				      data->mode->vdisplay,
-				      DRM_FORMAT_XRGB8888,
-				      LOCAL_DRM_FORMAT_MOD_NONE,
-				      &data->fb_test_pattern);
 		primary = igt_output_get_plane_type(data->output,
 						    DRM_PLANE_TYPE_PRIMARY);
 
@@ -236,16 +224,52 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 	}
 }
 
-static void run_test(data_t *data, igt_output_t *output,
-		     enum dsc_test_type test_type)
+static void prepare_output(data_t *data, igt_output_t *output)
 {
+	igt_plane_t *primary;
 	enum pipe pipe;
+	bool found = false;
+	drmModeModeInfo *mode;
 
-	for_each_pipe(&data->display, pipe) {
+	igt_display_reset(&data->display);
 
+	for_each_pipe(&data->display, pipe) {
 		if (igt_pipe_connector_valid(pipe, output)) {
 			data->pipe = pipe;
 			data->output = output;
+			data->connector = data->output->config.connector;
+			found = true;
+			break;
+		}
+	}
+
+	igt_assert_f(found, "No valid pipe for connector %s\n", data->conn_name);
+
+	mode = igt_output_get_mode(data->output);
+
+	igt_output_set_pipe(data->output, data->pipe);
+	igt_create_pattern_fb(data->drm_fd, mode->hdisplay,
+			      mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      LOCAL_DRM_FORMAT_MOD_NONE,
+			      &data->fb_test_pattern);
+
+	igt_output_set_pipe(data->output, data->pipe);
+	primary = igt_output_get_plane_type(data->output,
+					    DRM_PLANE_TYPE_PRIMARY);
+
+	igt_plane_set_fb(primary, &data->fb_test_pattern);
+	igt_display_commit(&data->display);
+}
+
+static void run_test(data_t *data, enum dsc_test_type test_type)
+{
+	enum pipe pipe;
+
+	for_each_pipe(&data->display, pipe) {
+
+		if (igt_pipe_connector_valid(pipe, data->output)) {
+			data->pipe = pipe;
 			update_display(data, test_type);
 			test_cleanup(data);
 		}
@@ -281,31 +305,40 @@ igt_main
 				if (connector->connection != DRM_MODE_CONNECTED ||
 				    connector->connector_type !=
 				    tests[test_cnt])
-					continue;
+					goto loop_cleanup;
+
 				output = igt_output_from_connector(&data.display, connector);
 				sprintf(data.conn_name, "%s-%d",
 					kmstest_connector_type_str(connector->connector_type),
 					connector->connector_type_id);
+
+				/* we need to have output enabled to do the DSC checks below */
+				prepare_output(&data, output);
+
 				if(!is_dp_dsc_supported(&data)) {
 					igt_debug("DSC not supported on connector %s \n",
 						  data.conn_name);
-					continue;
+					goto loop_cleanup;
 				}
+
 				if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
 				    !is_dp_fec_supported(&data)) {
 					igt_debug("DSC cannot be enabled without FEC on %s\n",
 						  data.conn_name);
-					continue;
+					goto loop_cleanup;
 				}
 				test_conn_cnt++;
-				run_test(&data, output, test_basic_dsc_enable);
+				run_test(&data, test_basic_dsc_enable);
+
+loop_cleanup:
+				drmModeFreeConnector(connector);
+				igt_remove_fb(data.drm_fd, &data.fb_test_pattern);
 			}
 			igt_skip_on(test_conn_cnt == 0);
 		}
 	}
 
 	igt_fixture {
-		drmModeFreeConnector(connector);
 		drmModeFreeResources(res);
 		close(data.debugfs_fd);
 		close(data.drm_fd);
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
