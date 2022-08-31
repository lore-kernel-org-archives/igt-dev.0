Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5299710E32D
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Aug 2022 12:07:38 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 31 Aug 2022 17:38:49 +0530
Message-Id: <20220831120849.28883-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_dsc: Modify compressed bpp
 test
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

Modified compressed bpp test to input bpc. Made
corresponding changes in debugfs entry.
Max DSC input BPC for ICL is 10 and for TGL+ is 12;
added check for the same. Also, renamed few functions
and removed irrelevant checks.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c        |  10 +--
 lib/igt_kms.h        |   4 +-
 tests/i915/kms_dsc.c | 146 +++++++++++++++++++------------------------
 3 files changed, 71 insertions(+), 89 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1ba3bd2aa..5d348383d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5525,20 +5525,20 @@ int igt_force_dsc_enable(int drmfd, char *connector_name)
 }
 
 /*
- * igt_force_dsc_enable_bpp:
+ * igt_force_dsc_enable_bpc:
  * @drmfd: A drm file descriptor
  * @connector_name: Name of the libdrm connector we're going to use
- * @bpp: Compressed bpp to be used with DSC
+ * @bpc: Input BPC
  *
  * Returns: No. of bytes written or negative error code, in case of failure.
  */
-int igt_force_dsc_enable_bpp(int drmfd, char *connector_name, int bpp)
+int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc)
 {
 	char buf[20] = {0};
 
-	sprintf(buf, "%d", bpp);
+	sprintf(buf, "%d", bpc);
 
-	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_bpp", buf);
+	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_bpc", buf);
 }
 
 /*
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index a2cf0937b..3d78c37f1 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -953,8 +953,8 @@ bool igt_is_fec_supported(int drmfd, char *connector_name);
 bool igt_is_dsc_enabled(int drmfd, char *connector_name);
 bool igt_is_force_dsc_enabled(int drmfd, char *connector_name);
 int igt_force_dsc_enable(int drmfd, char *connector_name);
-int igt_force_dsc_enable_bpp(int drmfd, char *connector_name,
-			     int bpp);
+int igt_force_dsc_enable_bpc(int drmfd, char *connector_name,
+			     int bpc);
 int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name);
 
 unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index be15238e3..330fc050b 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -44,14 +44,13 @@
 #include <fcntl.h>
 #include <termios.h>
 
-IGT_TEST_DESCRIPTION("Test to validate display stream compression");
-
 #define HDISPLAY_5K	5120
-#define DSC_MIN_BPP	8
+
+IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
 enum dsc_test_type {
-	TEST_BASIC_DSC,
-	TEST_DSC_BPP
+	TEST_DSC_BASIC,
+	TEST_DSC_BPC
 };
 
 typedef struct {
@@ -60,7 +59,7 @@ typedef struct {
 	igt_display_t display;
 	struct igt_fb fb_test_pattern;
 	igt_output_t *output;
-	int compression_bpp;
+	int input_bpc;
 	int n_pipes;
 	enum pipe pipe;
 } data_t;
@@ -71,13 +70,15 @@ int force_dsc_restore_fd = -1;
 const struct {
 	const int format;
 	const char format_str[20];
-} test_list[] = {
+} format_list[] = {
 	{DRM_FORMAT_XYUV8888, "XYUV8888"},
 	{DRM_FORMAT_XRGB2101010, "XRGB2101010"},
 	{DRM_FORMAT_XRGB16161616F, "XRGB16161616F"},
 	{DRM_FORMAT_YUYV, "YUYV"},
 };
 
+uint32_t bpc_list[] = {12, 10, 8};
+
 static inline void manual(const char *expected)
 {
 	igt_debug_interactive_mode_check("all", expected);
@@ -93,15 +94,15 @@ static void force_dsc_enable(data_t *data)
 	igt_assert_f(ret > 0, "debugfs_write failed");
 }
 
-static void force_dsc_enable_bpp(data_t *data)
+static void force_dsc_enable_bpc(data_t *data)
 {
 	int ret;
 
-	igt_debug("Forcing DSC BPP to %d on %s\n",
-		  data->compression_bpp, data->output->name);
-	ret = igt_force_dsc_enable_bpp(data->drm_fd,
+	igt_debug("Forcing input DSC BPC to %d on %s\n",
+		  data->input_bpc, data->output->name);
+	ret = igt_force_dsc_enable_bpc(data->drm_fd,
 				       data->output->name,
-				       data->compression_bpp);
+				       data->input_bpc);
 	igt_assert_f(ret > 0, "debugfs_write failed");
 }
 
@@ -165,39 +166,6 @@ static bool check_dsc_on_connector(data_t *data)
 	return true;
 }
 
-/* Force dsc enable supports resolutions above 5K in DP */
-static bool check_5k_dp_test_constraint(data_t *data)
-{
-	igt_output_t *output = data->output;
-	drmModeConnector *connector = output->config.connector;
-	drmModeModeInfo *mode = get_highres_mode(output);
-
-	if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
-	    mode->hdisplay < HDISPLAY_5K) {
-		igt_debug("Force dsc enable does not support res. < 5K in %s\n",
-			   output->name);
-		return false;
-	}
-
-	return true;
-}
-
-static bool check_big_joiner_test_constraint(data_t *data,
-					     enum dsc_test_type test_type)
-{
-	igt_output_t *output = data->output;
-	drmModeModeInfo *mode = get_highres_mode(output);
-
-	if (test_type == TEST_DSC_BPP &&
-	    mode->hdisplay >= HDISPLAY_5K) {
-		igt_debug("Bigjoiner does not support force bpp on %s\n",
-			   output->name);
-		return false;
-	}
-
-	return true;
-}
-
 static bool check_big_joiner_pipe_constraint(data_t *data)
 {
 	igt_output_t *output = data->output;
@@ -213,7 +181,7 @@ static bool check_big_joiner_pipe_constraint(data_t *data)
 	return true;
 }
 
-static bool check_dp_gen11_constraint(data_t *data)
+static bool check_gen11_dp_constraint(data_t *data)
 {
 	igt_output_t *output = data->output;
 	uint32_t devid = intel_get_drm_devid(data->drm_fd);
@@ -228,6 +196,19 @@ static bool check_dp_gen11_constraint(data_t *data)
 	return true;
 }
 
+/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
+static bool check_gen11_bpc_constraint(data_t *data)
+{
+	uint32_t devid = intel_get_drm_devid(data->drm_fd);
+
+	if (IS_GEN11(devid) && data->input_bpc == 12) {
+		igt_debug("Input bpc 12 not supported on gen11 platforms\n");
+		return false;
+	}
+
+	return true;
+}
+
 static void test_cleanup(data_t *data)
 {
 	igt_output_t *output = data->output;
@@ -257,9 +238,9 @@ static void update_display(data_t *data, enum dsc_test_type test_type, unsigned
 	save_force_dsc_en(data);
 	force_dsc_enable(data);
 
-	if (test_type == TEST_DSC_BPP) {
-		igt_debug("Trying to set BPP to %d\n", data->compression_bpp);
-		force_dsc_enable_bpp(data);
+	if (test_type == TEST_DSC_BPC) {
+		igt_debug("Trying to set input BPC to %d\n", data->input_bpc);
+		force_dsc_enable_bpc(data);
 	}
 
 	igt_output_set_pipe(output, data->pipe);
@@ -289,10 +270,16 @@ static void update_display(data_t *data, enum dsc_test_type test_type, unsigned
 	manual("RGB test pattern without corruption");
 
 	enabled = igt_is_dsc_enabled(data->drm_fd, output->name);
+	igt_info("Current mode is: %dx%d @%dHz -- DSC is: %s\n",
+				mode->hdisplay,
+				mode->vdisplay,
+				mode->vrefresh,
+				enabled ? "ON" : "OFF");
+
 	restore_force_dsc_en();
-	igt_debug("Reset compression BPP\n");
-	data->compression_bpp = 0;
-	force_dsc_enable_bpp(data);
+	igt_debug("Reset compression BPC\n");
+	data->input_bpc = 0;
+	force_dsc_enable_bpc(data);
 
 	igt_assert_f(enabled,
 		     "Default DSC enable failed on connector: %s pipe: %s\n",
@@ -302,8 +289,8 @@ static void update_display(data_t *data, enum dsc_test_type test_type, unsigned
 	test_cleanup(data);
 }
 
-
-static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpp, unsigned int plane_format)
+static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
+		     unsigned int plane_format)
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
@@ -311,27 +298,24 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpp, unsign
 	enum pipe pipe;
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
-		data->compression_bpp = bpp;
+		data->input_bpc = bpc;
 		data->output = output;
 		data->pipe = pipe;
 
 		if (!check_dsc_on_connector(data))
 			continue;
 
-		if (!check_5k_dp_test_constraint(data))
-			continue;
-
-		if (!check_big_joiner_test_constraint(data, test_type))
+		if (!check_gen11_dp_constraint(data))
 			continue;
 
-		if (!check_dp_gen11_constraint(data))
+		if (!check_gen11_bpc_constraint(data))
 			continue;
 
 		if (!check_big_joiner_pipe_constraint(data))
 			continue;
 
-		if (test_type == TEST_DSC_BPP)
-			snprintf(name, sizeof(name), "-%dbpp", data->compression_bpp);
+		if (test_type == TEST_DSC_BPC)
+			snprintf(name, sizeof(name), "-%dbpc-%s", data->input_bpc, igt_format_str(plane_format));
 		else
 			snprintf(name, sizeof(name), "-%s", igt_format_str(plane_format));
 
@@ -352,6 +336,7 @@ igt_main
 		igt_install_exit_handler(kms_dsc_exit_handler);
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
+		igt_require(intel_display_ver(data.devid) >= 11);
 		data.n_pipes = 0;
 		for_each_pipe(&data.display, i)
 			data.n_pipes++;
@@ -361,36 +346,33 @@ igt_main
 		     "by a connector by forcing DSC on all connectors that support it "
 		     "with default parameters");
 	igt_subtest_with_dynamic("basic-dsc")
-			test_dsc(&data, TEST_BASIC_DSC, 0, DRM_FORMAT_XRGB8888);
+			test_dsc(&data, TEST_DSC_BASIC, 0, DRM_FORMAT_XRGB8888);
 
 	igt_describe("Tests basic display stream compression functionality if supported "
 		     "by a connector by forcing DSC on all connectors that support it "
 		     "with default parameters and creating fb with diff formats");
 	igt_subtest_with_dynamic("dsc-with-formats") {
-		for (int k = 0; k < ARRAY_SIZE(test_list); k++)
-			test_dsc(&data, TEST_BASIC_DSC, 0, test_list[k].format);
+		for (int k = 0; k < ARRAY_SIZE(format_list); k++)
+			test_dsc(&data, TEST_DSC_BASIC, 0, format_list[k].format);
 	}
 
-	igt_fixture
-		igt_require(intel_display_ver(data.devid) >= 13);
+	igt_describe("Tests basic display stream compression functionality if supported "
+		     "by a connector by forcing DSC on all connectors that support it "
+		     "with certain input BPC for the connector");
+	igt_subtest_with_dynamic("dsc-with-bpc") {
+		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
+			test_dsc(&data, TEST_DSC_BPC, bpc_list[j], DRM_FORMAT_XRGB8888);
+	}
 
-	/*
-	 * Output bpp/compressed bpp supported is 8 to 23 (pipe_bpp - 1)
-	 * i.e. 8 to 23. So, here we are considering compressed bpp as min(8), mean (8+23/2)
-	 * and max(23).
-	 */
 	igt_describe("Tests basic display stream compression functionality if supported "
 		     "by a connector by forcing DSC on all connectors that support it "
-		     "with certain BPP as the output BPP for the connector");
-	igt_subtest_with_dynamic("dsc-with-bpp") {
-		uint32_t bpp_list[] = {
-			DSC_MIN_BPP,
-			(DSC_MIN_BPP  + (DSC_MIN_BPP * 3) - 1) / 2,
-			(DSC_MIN_BPP * 3) - 1
-		};
-
-		for (int j = 0; j < ARRAY_SIZE(bpp_list); j++)
-			test_dsc(&data, TEST_DSC_BPP, bpp_list[j], DRM_FORMAT_XRGB8888);
+		     "with certain input BPC for the connector with diff formats");
+	igt_subtest_with_dynamic("dsc-with-bpc-formats") {
+		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
+			for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
+				test_dsc(&data, TEST_DSC_BPC, bpc_list[j], format_list[k].format);
+			}
+		}
 	}
 
 	igt_fixture {
-- 
2.25.1
