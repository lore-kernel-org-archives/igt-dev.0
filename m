Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286D46E48E
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jun 2021 10:28:09 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Tue, 22 Jun 2021 15:54:54 +0530
Message-Id: <20210622102454.8922-5-venkata.sai.patnana@intel.com>
In-Reply-To: <20210622102454.8922-1-venkata.sai.patnana@intel.com>
References: <20210622102454.8922-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/5] tests/kms_dp_dsc: Assign all data
 realted members together
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

Currently, members connector and output mode of the data are set separately,
than the other data related members like conn_name and output.
Move these assignments together and cleanup unused variables.

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
---
 tests/kms_dp_dsc.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/tests/kms_dp_dsc.c b/tests/kms_dp_dsc.c
index 462a7b51..47f0bdf0 100644
--- a/tests/kms_dp_dsc.c
+++ b/tests/kms_dp_dsc.c
@@ -61,7 +61,6 @@ typedef struct {
 	igt_output_t *output;
 	int mode_valid;
 	drmModeModeInfo *mode;
-	drmModeConnector *connector;
 	drmModeEncoder *encoder;
 	int crtc;
 	int compression_bpp;
@@ -142,7 +141,6 @@ static void kms_dp_dsc_exit_handler(int sig)
 static bool check_dsc_on_connector(data_t *data, uint32_t drmConnector)
 {
 	drmModeConnector *connector;
-	igt_output_t *output;
 
 	connector = drmModeGetConnectorCurrent(data->drm_fd,
 					       drmConnector);
@@ -151,7 +149,7 @@ static bool check_dsc_on_connector(data_t *data, uint32_t drmConnector)
 	    (connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort)))
 		return false;
 
-	output = igt_output_from_connector(&data->display, connector);
+	data->output = igt_output_from_connector(&data->display, connector);
 	sprintf(data->conn_name, "%s-%d",
 		kmstest_connector_type_str(connector->connector_type),
 		connector->connector_type_id);
@@ -167,7 +165,7 @@ static bool check_dsc_on_connector(data_t *data, uint32_t drmConnector)
 			  data->conn_name);
 		return false;
 	}
-	data->output = output;
+	data->mode = igt_output_get_mode(data->output);
 	return true;
 }
 
@@ -179,7 +177,6 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 {
 	bool enabled;
 	igt_plane_t *primary;
-	data->connector = data->output->config.connector;
 
 	/* Disable the output first */
 	igt_output_set_pipe(data->output, PIPE_NONE);
@@ -217,12 +214,11 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 		     kmstest_pipe_name(data->pipe));
 }
 
-static void run_test(data_t *data, igt_output_t *output,
-		     enum dsc_test_type test_type)
+static void run_test(data_t *data, enum dsc_test_type test_type)
 {
 	enum pipe pipe;
 
-	data->mode = igt_output_get_mode(output);
+	data->mode = igt_output_get_mode(data->output);
 	igt_create_pattern_fb(data->drm_fd, data->mode->hdisplay,
 			      data->mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
@@ -233,17 +229,16 @@ static void run_test(data_t *data, igt_output_t *output,
 		if (is_i915_device(data->drm_fd)) {
 			uint32_t devid = intel_get_drm_devid(data->drm_fd);
 
-			if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
+			if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
 			    pipe == PIPE_A && IS_GEN11(devid)) {
 				igt_debug("DSC not supported on Pipe A on external DP in Gen11 platforms\n");
 				continue;
 			}
 		}
 
-		igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe))
-			if (igt_pipe_connector_valid(pipe, output)) {
+		igt_dynamic_f("%s-pipe-%s", data->output->name, kmstest_pipe_name(pipe))
+			if (igt_pipe_connector_valid(pipe, data->output)) {
 				data->pipe = pipe;
-				data->output = output;
 				update_display(data, test_type);
 				test_cleanup(data);
 			}
@@ -276,7 +271,7 @@ igt_main
 			if (!check_dsc_on_connector(&data, res->connectors[j]))
 				continue;
 			test_conn_cnt++;
-			run_test(&data, data.output, test_basic_dsc_enable);
+			run_test(&data, test_basic_dsc_enable);
 		}
 		igt_skip_on_f(test_conn_cnt == 0, "DSC not supported on any connector\n");
 	}
@@ -290,7 +285,7 @@ igt_main
 				if (!check_dsc_on_connector(&data, res->connectors[j]))
 					continue;
 				test_conn_cnt++;
-				run_test(&data, data.output, test_dsc_compression_bpp);
+				run_test(&data, test_dsc_compression_bpp);
 			}
 			igt_skip_on_f(test_conn_cnt == 0, "DSC not supported on any connector\n");
 		}
-- 
2.32.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
