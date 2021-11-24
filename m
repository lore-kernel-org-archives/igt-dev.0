Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71EEB6EB9C
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Nov 2021 15:24:41 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Wed, 24 Nov 2021 20:37:59 +0530
Message-Id: <20211124150800.21338-3-venkata.sai.patnana@intel.com>
In-Reply-To: <20211124150800.21338-1-venkata.sai.patnana@intel.com>
References: <20211124150800.21338-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/i915/kms_dsc: optimiz logic for
 dsc checks
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

Also optimize logic as below:
Instead of checking the connectors dsc support in
each subtest, check at the starting of the test and
preserve the status to use all over the subtests.

Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
---
 tests/i915/kms_dsc.c | 68 +++++++++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 32 deletions(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 967a1b8ab2..43665c4286 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -65,7 +65,6 @@ typedef struct {
 	int compression_bpp;
 	int n_pipes;
 	enum pipe pipe;
-	char conn_name[128];
 } data_t;
 
 bool force_dsc_en_orig;
@@ -80,7 +79,7 @@ static void force_dsc_enable(data_t *data)
 {
 	int ret;
 
-	igt_debug ("Forcing DSC enable on %s\n", data->conn_name);
+	igt_debug ("Forcing DSC enable on %s\n", data->output->name);
 	ret = igt_force_dsc_enable(data->drm_fd,
 				      data->output->config.connector);
 	igt_assert_f(ret > 0, "debugfs_write failed");
@@ -91,7 +90,7 @@ static void force_dsc_enable_bpp(data_t *data)
 	int ret;
 
 	igt_debug("Forcing DSC BPP to %d on %s\n",
-		  data->compression_bpp, data->conn_name);
+		  data->compression_bpp, data->output->name);
 	ret = igt_force_dsc_enable_bpp(data->drm_fd,
 					  data->output->config.connector,
 					  data->compression_bpp);
@@ -159,15 +158,14 @@ static int sort_drm_modes(const void *a, const void *b)
 	return (mode1->clock < mode2->clock) - (mode2->clock < mode1->clock);
 }
 
-static bool check_dsc_on_connector(data_t *data, uint32_t drmConnector)
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
 
@@ -183,23 +181,18 @@ static bool check_dsc_on_connector(data_t *data, uint32_t drmConnector)
 	    output->config.connector->modes[0].hdisplay < 5120)
 		return NULL;
 
-	sprintf(data->conn_name, "%s-%d",
-		kmstest_connector_type_str(connector->connector_type),
-		connector->connector_type_id);
-
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
@@ -216,7 +209,7 @@ static void update_display(data_t *data, enum dsc_test_type test_type,
 	igt_output_set_pipe(data->output, PIPE_NONE);
 	igt_display_commit(&data->display);
 
-	igt_debug("DSC is supported on %s\n", data->conn_name);
+	igt_debug("DSC is supported on %s\n", data->output->name);
 	save_force_dsc_en(data);
 	force_dsc_enable(data);
 	if (test_type == test_dsc_compression_bpp) {
@@ -226,9 +219,9 @@ static void update_display(data_t *data, enum dsc_test_type test_type,
 
 	igt_output_set_pipe(data->output, data->pipe);
 	qsort(data->output->config.connector->modes,
-			data->output->config.connector->count_modes,
-			sizeof(drmModeModeInfo),
-			sort_drm_modes);
+	      data->output->config.connector->count_modes,
+	      sizeof(drmModeModeInfo),
+	      sort_drm_modes);
 	igt_output_override_mode(data->output, &data->output->config.connector->modes[0]);
 	primary = igt_output_get_plane_type(data->output,
 					    DRM_PLANE_TYPE_PRIMARY);
@@ -246,7 +239,7 @@ static void update_display(data_t *data, enum dsc_test_type test_type,
 	manual("RGB test pattern without corruption");
 
 	enabled = igt_is_dsc_enabled(data->drm_fd,
-					data->output->config.connector);
+				     data->output->config.connector);
 	restore_force_dsc_en();
 	igt_debug("Reset compression BPP\n");
 	data->compression_bpp = 0;
@@ -254,7 +247,7 @@ static void update_display(data_t *data, enum dsc_test_type test_type,
 
 	igt_assert_f(enabled,
 		     "Default DSC enable failed on Connector: %s Pipe: %s\n",
-		     data->conn_name,
+		     data->output->name,
 		     kmstest_pipe_name(data->pipe));
 }
 
@@ -297,9 +290,10 @@ static void run_test(data_t *data, enum dsc_test_type test_type,
 				      (pipe  == (data->n_pipes - 1)),
 				      "pipe-%s not supported due to bigjoiner limitation\n",
 				      kmstest_pipe_name(pipe));
-			update_display(data, test_type, drm_format);
 
+			update_display(data, test_type, drm_format);
 		}
+
 		if (test_type == test_dsc_compression_bpp)
 			break;
 	}
@@ -312,7 +306,9 @@ igt_main
 	data_t data = {};
 	drmModeRes *res;
 	drmModeConnector *connector = NULL;
-	int i, j;
+	igt_output_t *outputs[IGT_MAX_PIPES] = {};
+	igt_output_t *output;
+	int i, j, supported_connectors = 0;
 	struct {
 		unsigned int bpc;
 		int format;
@@ -328,20 +324,30 @@ igt_main
 		igt_install_exit_handler(kms_dsc_exit_handler);
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require(res = drmModeGetResources(data.drm_fd));
+		for (j = 0; j < res->count_connectors; j++) {
+			output = check_dsc_on_connector(&data, res->connectors[j]);
+
+			if (output)
+				outputs[supported_connectors++] = output;
+		}
+		igt_require_f(supported_connectors, "No DSC supported panel connected.\n");
 		data.n_pipes = 0;
 		for_each_pipe(&data.display, i)
 			data.n_pipes++;
+
 	}
+
 	for (i = 0; i < ARRAY_SIZE(test_list); i++) {
-		igt_subtest_with_dynamic("basic-dsc-enable") {
-			for (j = 0; j < res->count_connectors; j++) {
-				if (!check_dsc_on_connector(&data, res->connectors[j]))
-					continue;
+		igt_subtest_with_dynamic_f("basic-dsc-enable-%s",
+					   test_list[i].format_str) {
+			for (j = 0; j < supported_connectors; j++) {
+				data.output = outputs[j];
 				run_test(&data, test_basic_dsc_enable,
 					 test_list[i].format);
 			}
 		}
 	}
+
 	/* currently we are validating compression bpp on XRGB8888 format only */
 	igt_subtest_with_dynamic("XRGB8888-dsc-compression") {
 		uint32_t bpp_list[] = {
@@ -353,10 +359,8 @@ igt_main
 
 		igt_require(intel_display_ver(data.devid) >= 13);
 
-		for (j = 0; j < res->count_connectors; j++) {
-			if (!check_dsc_on_connector(&data, res->connectors[j]))
-				continue;
-
+		for (j = 0; j < supported_connectors; j++) {
+			data.output = outputs[j];
 			for (i = 0; i < ARRAY_SIZE(bpp_list); i++) {
 				data.compression_bpp = bpp_list[i];
 				run_test(&data, test_dsc_compression_bpp,
-- 
2.25.1
