Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8364310E283
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Feb 2023 17:29:34 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 17 Feb 2023 23:01:48 +0530
Message-Id: <20230217173148.12411-3-swati2.sharma@intel.com>
In-Reply-To: <20230217173148.12411-1-swati2.sharma@intel.com>
References: <20230217173148.12411-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v8 2/2] tests/i915/kms_dsc: Enable
 validation for VDSC output formats
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

Existing i-g-t is extended to enable validation for VDSC output
formats. Output format is selected as per driver policy.For ex:
If a mode is supported in both RGB and YCbCr420 output formats
by the sink, i915 driver policy is to try RGB first and fall
back to YCbCr420, if mode cannot be shown using RGB.

To test DSC output format, a debugfs entry is created to force
this output format. However, before setting debugfs entry, we
have checked capability i.e. output format is supported by both
platform and sink.

Also, each mode doesn't support all output formats; so if both
sink and platform support an output format, we will do a try
commit with each mode till we get a successful commit.

v2: -used is_dsc_ycbcr420_supported() (Ankit)
    -handled try-commit correctly (Ankit)
    -instead of flag use enum for output formats (Ankit)
v3: -instead of global count, pass count as para (Ankit)
    -print output format (Ankit)
v4: -optimized while loop (Jouni)
    -used only try commit (Jouni)
    -fixed get_next_mode() (Jouni)
v5: -made generic test to validate all output formats (Jani N)
v6: -fixed assert (Jouni)
    -if mode == NULL output_format debugfs reset didn't happen, fixed
v7: -indentation fixes (Kamil)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com> (v5)
---
 lib/igt_kms.c               |  18 ++++++
 lib/igt_kms.h               |   1 +
 tests/i915/kms_dsc.c        | 118 +++++++++++++++++++++++++++++-------
 tests/i915/kms_dsc_helper.c |  36 +++++++++++
 tests/i915/kms_dsc_helper.h |   4 ++
 5 files changed, 154 insertions(+), 23 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 8c7dd85b8..439069e1e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -966,6 +966,24 @@ const char *kmstest_scaling_filter_str(int filter)
 	return find_type_name(scaling_filter_names, filter);
 }
 
+static const struct type_name dsc_output_format_names[] = {
+	{ DSC_FORMAT_RGB, "RGB" },
+	{ DSC_FORMAT_YCBCR420, "YCBCR420" },
+	{ DSC_FORMAT_YCBCR444, "YCBCR444" },
+	{}
+};
+
+/**
+ * kmstest_dsc_output_format_str:
+ * @output_format: DSC_FORMAT_* output format value
+ *
+ * Returns: A string representing the output format @output format.
+ */
+const char *kmstest_dsc_output_format_str(int output_format)
+{
+	return find_type_name(dsc_output_format_names, output_format);
+}
+
 static const struct type_name connector_type_names[] = {
 	{ DRM_MODE_CONNECTOR_Unknown, "Unknown" },
 	{ DRM_MODE_CONNECTOR_VGA, "VGA" },
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 52d144d27..6c304bcd8 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -116,6 +116,7 @@ const char *kmstest_encoder_type_str(int type);
 const char *kmstest_connector_status_str(int status);
 const char *kmstest_connector_type_str(int type);
 const char *kmstest_scaling_filter_str(int filter);
+const char *kmstest_dsc_output_format_str(int output_format);
 
 void kmstest_dump_mode(drmModeModeInfo *mode);
 #define MAX_HDISPLAY_PER_PIPE 5120
diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index b3c5e60c7..15ef9654b 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -36,7 +36,8 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
 enum dsc_test_type {
 	TEST_DSC_BASIC,
-	TEST_DSC_BPC
+	TEST_DSC_BPC,
+	TEST_DSC_OUTPUT_FORMAT,
 };
 
 typedef struct {
@@ -44,6 +45,7 @@ typedef struct {
 	uint32_t devid;
 	igt_display_t display;
 	struct igt_fb fb_test_pattern;
+	enum dsc_output_format output_format;
 	unsigned int plane_format;
 	igt_output_t *output;
 	int input_bpc;
@@ -52,7 +54,8 @@ typedef struct {
 	enum pipe pipe;
 } data_t;
 
-static int format_list[] =  {DRM_FORMAT_XYUV8888, DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB16161616F, DRM_FORMAT_YUYV};
+static int output_format_list[] = {DSC_FORMAT_YCBCR420, DSC_FORMAT_YCBCR444};
+static int format_list[] = {DRM_FORMAT_XYUV8888, DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB16161616F, DRM_FORMAT_YUYV};
 static uint32_t bpc_list[] = {12, 10, 8};
 
 static inline void manual(const char *expected)
@@ -72,6 +75,17 @@ static drmModeModeInfo *get_highres_mode(igt_output_t *output)
 	return highest_mode;
 }
 
+static drmModeModeInfo *get_next_mode(igt_output_t *output, int index)
+{
+	drmModeConnector *connector = output->config.connector;
+	drmModeModeInfo *next_mode = NULL;
+
+	if (index < connector->count_modes)
+		next_mode = &connector->modes[index];
+
+	return next_mode;
+}
+
 static bool check_big_joiner_pipe_constraint(data_t *data)
 {
 	igt_output_t *output = data->output;
@@ -87,6 +101,17 @@ static bool check_big_joiner_pipe_constraint(data_t *data)
 	return true;
 }
 
+static void test_reset(data_t *data)
+{
+	igt_debug("Reset input BPC\n");
+	data->input_bpc = 0;
+	force_dsc_enable_bpc(data->drm_fd, data->output, data->input_bpc);
+
+	igt_debug("Reset DSC output format\n");
+	data->output_format = DSC_FORMAT_RGB;
+	force_dsc_output_format(data->drm_fd, data->output, data->output_format);
+}
+
 static void test_cleanup(data_t *data)
 {
 	igt_output_t *output = data->output;
@@ -102,7 +127,9 @@ static void test_cleanup(data_t *data)
 /* re-probe connectors and do a modeset with DSC */
 static void update_display(data_t *data, enum dsc_test_type test_type)
 {
+	int ret;
 	bool enabled;
+	int index = 0;
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	igt_output_t *output = data->output;
@@ -121,26 +148,48 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 		force_dsc_enable_bpc(data->drm_fd, data->output, data->input_bpc);
 	}
 
-	igt_output_set_pipe(output, data->pipe);
-
-	mode = get_highres_mode(output);
-	igt_require(mode != NULL);
-	igt_output_override_mode(output, mode);
+	if (test_type == TEST_DSC_OUTPUT_FORMAT) {
+		igt_debug("Trying to set DSC %s output format\n",
+			   kmstest_dsc_output_format_str(data->output_format));
+		force_dsc_output_format(data->drm_fd, data->output, data->output_format);
+	}
 
+	igt_output_set_pipe(output, data->pipe);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
 	igt_skip_on(!igt_plane_has_format_mod(primary, data->plane_format,
 		    DRM_FORMAT_MOD_LINEAR));
 
-	igt_create_pattern_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      data->plane_format,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &data->fb_test_pattern);
+	do {
+		if (data->output_format == DSC_FORMAT_RGB) {
+			mode = get_highres_mode(output);
+		} else {
+			mode = get_next_mode(output, index);
+			index++;
+		}
 
-	igt_plane_set_fb(primary, &data->fb_test_pattern);
-	igt_display_commit(display);
+		if (mode == NULL)
+			goto reset;
+
+		igt_output_override_mode(output, mode);
+
+		igt_create_pattern_fb(data->drm_fd,
+				      mode->hdisplay,
+				      mode->vdisplay,
+				      data->plane_format,
+				      DRM_FORMAT_MOD_LINEAR,
+				      &data->fb_test_pattern);
+		igt_plane_set_fb(primary, &data->fb_test_pattern);
+
+		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		if (data->output_format == DSC_FORMAT_RGB || ret == 0)
+			break;
+
+		igt_remove_fb(data->drm_fd, &data->fb_test_pattern);
+	} while (1);
+
+	if (ret != 0)
+		goto reset;
 
 	/* until we have CRC check support, manually check if RGB test
 	 * pattern has no corruption.
@@ -155,20 +204,22 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 				enabled ? "ON" : "OFF");
 
 	restore_force_dsc_en();
-	igt_debug("Reset compression BPC\n");
-	data->input_bpc = 0;
-	force_dsc_enable_bpc(data->drm_fd, data->output, data->input_bpc);
 
 	igt_assert_f(enabled,
 		     "Default DSC enable failed on connector: %s pipe: %s\n",
 		     output->name,
 		     kmstest_pipe_name(data->pipe));
 
+reset:
+	test_reset(data);
+
 	test_cleanup(data);
+	igt_skip_on(mode == NULL);
+	igt_assert_eq(ret, 0);
 }
 
 static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
-		     unsigned int plane_format)
+		     unsigned int plane_format, enum dsc_output_format output_format)
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
@@ -176,6 +227,7 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
 	enum pipe pipe;
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
+		data->output_format = output_format;
 		data->plane_format = plane_format;
 		data->input_bpc = bpc;
 		data->output = output;
@@ -184,6 +236,10 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
 		if (!check_dsc_on_connector(data->drm_fd, data->output))
 			continue;
 
+		if (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
+						    data->output, data->output_format))
+			continue;
+
 		if (!check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe))
 			continue;
 
@@ -195,6 +251,9 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
 
 		if (test_type == TEST_DSC_BPC)
 			snprintf(name, sizeof(name), "-%dbpc-%s", data->input_bpc, igt_format_str(data->plane_format));
+		else if (test_type == TEST_DSC_OUTPUT_FORMAT)
+			snprintf(name, sizeof(name), "-%s-%s", kmstest_dsc_output_format_str(data->output_format),
+							       igt_format_str(data->plane_format));
 		else
 			snprintf(name, sizeof(name), "-%s", igt_format_str(data->plane_format));
 
@@ -226,14 +285,16 @@ igt_main
 		     "by a connector by forcing DSC on all connectors that support it "
 		     "with default parameters");
 	igt_subtest_with_dynamic("dsc-basic")
-			test_dsc(&data, TEST_DSC_BASIC, 0, DRM_FORMAT_XRGB8888);
+			test_dsc(&data, TEST_DSC_BASIC, 0,
+				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
 
 	igt_describe("Tests basic display stream compression functionality if supported "
 		     "by a connector by forcing DSC on all connectors that support it "
 		     "with default parameters and creating fb with diff formats");
 	igt_subtest_with_dynamic("dsc-with-formats") {
 		for (int k = 0; k < ARRAY_SIZE(format_list); k++)
-			test_dsc(&data, TEST_DSC_BASIC, 0, format_list[k]);
+			test_dsc(&data, TEST_DSC_BASIC, 0,
+				 format_list[k], DSC_FORMAT_RGB);
 	}
 
 	igt_describe("Tests basic display stream compression functionality if supported "
@@ -241,7 +302,8 @@ igt_main
 		     "with certain input BPC for the connector");
 	igt_subtest_with_dynamic("dsc-with-bpc") {
 		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
-			test_dsc(&data, TEST_DSC_BPC, bpc_list[j], DRM_FORMAT_XRGB8888);
+			test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
+				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
 	}
 
 	igt_describe("Tests basic display stream compression functionality if supported "
@@ -250,11 +312,21 @@ igt_main
 	igt_subtest_with_dynamic("dsc-with-bpc-formats") {
 		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
 			for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
-				test_dsc(&data, TEST_DSC_BPC, bpc_list[j], format_list[k]);
+				test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
+				format_list[k], DSC_FORMAT_RGB);
 			}
 		}
 	}
 
+	igt_describe("Tests basic display stream compression functionality if supported "
+		     "by a connector by forcing DSC and output format on all connectors "
+		     "that support it");
+	igt_subtest_with_dynamic("dsc-with-output-formats") {
+		for (int k = 0; k < ARRAY_SIZE(output_format_list); k++)
+			test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, 0, DRM_FORMAT_XRGB8888,
+				 output_format_list[k]);
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		close(data.drm_fd);
diff --git a/tests/i915/kms_dsc_helper.c b/tests/i915/kms_dsc_helper.c
index e2c278c7a..02d1a4848 100644
--- a/tests/i915/kms_dsc_helper.c
+++ b/tests/i915/kms_dsc_helper.c
@@ -97,3 +97,39 @@ bool check_gen11_bpc_constraint(int drmfd, igt_output_t *output, int input_bpc)
 
 	return true;
 }
+
+void force_dsc_output_format(int drmfd, igt_output_t *output,
+			     enum dsc_output_format output_format)
+{
+	int ret;
+
+	igt_debug("Forcing DSC %s output format on %s\n",
+		  kmstest_dsc_output_format_str(output_format), output->name);
+	ret = igt_force_dsc_output_format(drmfd, output->name, output_format);
+	igt_assert_f(ret == 0, "forcing dsc output format debugfs_write failed\n");
+}
+
+/* YCbCr420 DSC is supported on display version 14+ with DSC1.2a */
+static bool is_dsc_output_format_supported_by_platform(int disp_ver, enum dsc_output_format output_format)
+{
+	if (disp_ver < 14 && output_format == DSC_FORMAT_YCBCR420) {
+		igt_debug("Output format DSC YCBCR420 not supported on D13 and older platforms\n");
+		return false;
+	}
+
+	return true;
+}
+
+bool is_dsc_output_format_supported(int drmfd, int disp_ver, igt_output_t *output,
+				    enum dsc_output_format output_format)
+{
+	if (!(igt_is_dsc_output_format_supported_by_sink(drmfd, output->name, output_format)) &&
+	     (is_dsc_output_format_supported_by_platform(disp_ver, output_format))) {
+		    igt_debug("DSC %s output format not supported on connector %s\n",
+			       kmstest_dsc_output_format_str(output_format),
+			       output->name);
+			return false;
+		}
+
+	return true;
+}
diff --git a/tests/i915/kms_dsc_helper.h b/tests/i915/kms_dsc_helper.h
index fe479dac4..244293cd0 100644
--- a/tests/i915/kms_dsc_helper.h
+++ b/tests/i915/kms_dsc_helper.h
@@ -31,5 +31,9 @@ void kms_dsc_exit_handler(int sig);
 bool check_dsc_on_connector(int drmfd, igt_output_t *output);
 bool check_gen11_dp_constraint(int drmfd, igt_output_t *output, enum pipe pipe);
 bool check_gen11_bpc_constraint(int drmfd, igt_output_t *output, int input_bpc);
+void force_dsc_output_format(int drmfd, igt_output_t *output,
+			     enum dsc_output_format output_format);
+bool is_dsc_output_format_supported(int disp_ver, int drmfd, igt_output_t *output,
+				    enum dsc_output_format output_format);
 
 #endif
-- 
2.25.1
