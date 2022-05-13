Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0ABB10F674
 for <igt-dev@lists.freedesktop.org>; Fri, 13 May 2022 11:07:45 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 13 May 2022 16:37:47 +0530
Message-Id: <20220513110747.24831-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2] tests/i915/kms_dsc: IGT cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Remove redundant code and before starting the subtest,
clean up the states to default by igt_display_reset().
Few minor fixes in indentation. Added subtests description.

v2: -minor mistake in subtest name
    -commit was missing after reset, added

Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_dsc.c | 93 ++++++++++++++++++++------------------------
 1 file changed, 43 insertions(+), 50 deletions(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 22d2216e..d0c7c0c7 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -44,13 +44,14 @@
 #include <fcntl.h>
 #include <termios.h>
 
-/* currently dsc compression is verifying on 8bpc frame only */
+IGT_TEST_DESCRIPTION("Test to validate display stream compression");
+
+/* currently dsc is verifed on 8bpc frame only */
 #define XRGB8888_DRM_FORMAT_MIN_BPP 8
 
-enum dsc_test_type
-{
-	test_basic_dsc_enable,
-	test_dsc_compression_bpp
+enum dsc_test_type {
+	TEST_BASIC_DSC_ENABLE,
+	TEST_DSC_COMPRESSION_BPP
 };
 
 typedef struct {
@@ -82,7 +83,7 @@ static void force_dsc_enable(data_t *data)
 
 	igt_debug ("Forcing DSC enable on %s\n", data->conn_name);
 	ret = igt_force_dsc_enable(data->drm_fd,
-				      data->output->config.connector);
+				   data->output->config.connector);
 	igt_assert_f(ret > 0, "debugfs_write failed");
 }
 
@@ -93,8 +94,8 @@ static void force_dsc_enable_bpp(data_t *data)
 	igt_debug("Forcing DSC BPP to %d on %s\n",
 		  data->compression_bpp, data->conn_name);
 	ret = igt_force_dsc_enable_bpp(data->drm_fd,
-					  data->output->config.connector,
-					  data->compression_bpp);
+				       data->output->config.connector,
+				       data->compression_bpp);
 	igt_assert_f(ret > 0, "debugfs_write failed");
 }
 
@@ -121,19 +122,6 @@ static void restore_force_dsc_en(void)
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
@@ -172,7 +160,7 @@ static bool check_dsc_on_connector(data_t *data, uint32_t drmConnector)
 	output = igt_output_from_connector(&data->display, connector);
 
 	/*
-	 * As dsc supports >= 5k modes, we need to suppress lower
+	 * dsc supports >= 5k modes, we need to suppress lower
 	 * resolutions.
 	 */
 	qsort(output->config.connector->modes,
@@ -202,57 +190,58 @@ static bool check_dsc_on_connector(data_t *data, uint32_t drmConnector)
 	return true;
 }
 
-/*
- * Re-probe connectors and do a modeset with DSC
- *
- */
+/* re-probe connectors and do a modeset with DSC */
 static void update_display(data_t *data, enum dsc_test_type test_type)
 {
 	bool enabled;
 	igt_plane_t *primary;
 
-	/* Disable the output first */
-	igt_output_set_pipe(data->output, PIPE_NONE);
+	/* sanitize the state before starting the subtest. */
+	igt_display_reset(&data->display);
 	igt_display_commit(&data->display);
 
 	igt_debug("DSC is supported on %s\n", data->conn_name);
 	save_force_dsc_en(data);
 	force_dsc_enable(data);
-	if (test_type == test_dsc_compression_bpp) {
+	if (test_type == TEST_DSC_COMPRESSION_BPP) {
 		igt_debug("Trying to set BPP to %d\n", data->compression_bpp);
 		force_dsc_enable_bpp(data);
 	}
 
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
 
-	/* Now set the output to the desired mode */
+	/* now set the output to the desired mode */
 	igt_plane_set_fb(primary, &data->fb_test_pattern);
 	igt_display_commit(&data->display);
 
 	/*
-	 * Until we have CRC check support, manually check if RGB test
+	 * until we have CRC check support, manually check if RGB test
 	 * pattern has no corruption.
 	 */
 	manual("RGB test pattern without corruption");
 
 	enabled = igt_is_dsc_enabled(data->drm_fd,
-					data->output->config.connector);
+			             data->output->config.connector);
 	restore_force_dsc_en();
 	igt_debug("Reset compression BPP\n");
 	data->compression_bpp = 0;
 	force_dsc_enable_bpp(data);
 
 	igt_assert_f(enabled,
-		     "Default DSC enable failed on Connector: %s Pipe: %s\n",
+		     "Default DSC enable failed on connector: %s pipe: %s\n",
 		     data->conn_name,
 		     kmstest_pipe_name(data->pipe));
+
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(data->output, PIPE_NONE);
+	igt_display_commit(&data->display);
 }
 
 static void run_test(data_t *data, enum dsc_test_type test_type)
@@ -260,7 +249,7 @@ static void run_test(data_t *data, enum dsc_test_type test_type)
 	enum pipe pipe;
 	char test_name[10];
 
-	igt_skip_on_f(test_type == test_dsc_compression_bpp &&
+	igt_skip_on_f(test_type == TEST_DSC_COMPRESSION_BPP &&
 		      data->output->config.connector->modes[0].hdisplay >= 5120,
 		      "bigjoiner does not support force bpp\n");
 
@@ -276,7 +265,7 @@ static void run_test(data_t *data, enum dsc_test_type test_type)
 
 		if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
 		    pipe == PIPE_A && IS_GEN11(devid)) {
-			igt_debug("DSC not supported on Pipe A on external DP in Gen11 platforms\n");
+			igt_debug("DSC not supported on pipe A on external DP in gen11 platforms\n");
 			continue;
 		}
 
@@ -284,9 +273,8 @@ static void run_test(data_t *data, enum dsc_test_type test_type)
 		if (!igt_pipe_connector_valid(pipe, data->output))
 			continue;
 
-		igt_dynamic_f("%s-pipe-%s%s", data->output->name,
-			      kmstest_pipe_name(pipe),
-			      (test_type == test_dsc_compression_bpp) ?
+		igt_dynamic_f("pipe-%s-%s-%s",  kmstest_pipe_name(pipe), data->output->name,
+			      (test_type == TEST_DSC_COMPRESSION_BPP) ?
 			      test_name : "") {
 			data->pipe = pipe;
 			igt_skip_on_f((data->output->config.connector->modes[0].hdisplay >= 5120) &&
@@ -294,9 +282,9 @@ static void run_test(data_t *data, enum dsc_test_type test_type)
 				      "pipe-%s not supported due to bigjoiner limitation\n",
 				      kmstest_pipe_name(pipe));
 			update_display(data, test_type);
-
 		}
-		if (test_type == test_dsc_compression_bpp)
+
+		if (test_type == TEST_DSC_COMPRESSION_BPP)
 			break;
 	}
 
@@ -307,8 +295,8 @@ igt_main
 {
 	data_t data = {};
 	drmModeRes *res;
-	drmModeConnector *connector = NULL;
 	int i, j;
+
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 		data.devid = intel_get_drm_devid(data.drm_fd);
@@ -320,19 +308,27 @@ igt_main
 		for_each_pipe(&data.display, i)
 			data.n_pipes++;
 	}
+
+	igt_describe("Tests basic display stream compression functionality if supported "
+		     "by a connector by forcing DSC on all connectors that support it "
+		     "with default parameters");
 	igt_subtest_with_dynamic("basic-dsc-enable") {
 		for (j = 0; j < res->count_connectors; j++) {
 			if (!check_dsc_on_connector(&data, res->connectors[j]))
 				continue;
-			run_test(&data, test_basic_dsc_enable);
+			run_test(&data, TEST_BASIC_DSC_ENABLE);
 		}
 	}
+
 	/* currently we are validating compression bpp on XRGB8888 format only */
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
 
@@ -344,15 +340,12 @@ igt_main
 
 			for (i = 0; i < ARRAY_SIZE(bpp_list); i++) {
 				data.compression_bpp = bpp_list[i];
-				run_test(&data, test_dsc_compression_bpp);
+				run_test(&data, TEST_DSC_COMPRESSION_BPP);
 			}
 		}
 	}
 
 	igt_fixture {
-		if (connector)
-			drmModeFreeConnector(connector);
-		test_cleanup(&data);
 		drmModeFreeResources(res);
 		igt_display_fini(&data.display);
 		close(data.drm_fd);
-- 
2.25.1
