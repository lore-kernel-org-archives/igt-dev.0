Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF85510E7F0
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jan 2024 07:33:25 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [v2 3/3] tests/intel/kms_dsc: add new subtest
Date: Thu, 11 Jan 2024 13:05:02 +0530
Message-Id: <20240111073502.151340-4-swati2.sharma@intel.com>
In-Reply-To: <20240111073502.151340-1-swati2.sharma@intel.com>
References: <20240111073502.151340-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add new subtest to validate dsc and big joiner usecase.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 3433e0907..f94ad55b8 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -50,6 +50,7 @@
  * arg[1]:
  *
  * @basic:                        DSC with default parameters
+ * @with-bigjoiner:               DSC with default parameters and big joiner
  * @with-bpc:                     DSC with certain input BPC for the connector
  * @with-bpc-formats:             DSC with certain input BPC for the connector and diff formats
  * @with-formats:                 DSC with default parameters and creating fb with diff formats
@@ -69,6 +70,7 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 #define TEST_DSC_FORMAT		(1<<1)
 #define TEST_DSC_OUTPUT_FORMAT	(1<<2)
 #define TEST_DSC_FRACTIONAL_BPP (1<<3)
+#define TEST_DSC_BIGJOINER	(1<<4)
 
 typedef struct {
 	int drm_fd;
@@ -125,6 +127,10 @@ static void test_reset(data_t *data)
 	igt_debug("Reset DSC output format\n");
 	data->output_format = DSC_FORMAT_RGB;
 	force_dsc_output_format(data->drm_fd, data->output, data->output_format);
+
+	restore_force_dsc_en();
+	restore_force_dsc_fractional_bpp_en();
+	restore_force_dsc_bigjoiner_en();
 }
 
 static void test_cleanup(data_t *data)
@@ -177,6 +183,12 @@ static void update_display(data_t *data, uint32_t test_type)
 		force_dsc_fractional_bpp_enable(data->drm_fd, data->output);
 	}
 
+	if (test_type & TEST_DSC_BIGJOINER) {
+		igt_debug("DSC big joiner is supported on %s\n", data->output->name);
+		save_force_dsc_bigjoiner_en(data->drm_fd, data->output);
+		force_dsc_bigjoiner_enable(data->drm_fd, data->output);
+	}
+
 	igt_output_set_pipe(output, data->pipe);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
@@ -235,9 +247,6 @@ static void update_display(data_t *data, uint32_t test_type)
 				mode->vrefresh,
 				enabled ? "ON" : "OFF");
 
-	restore_force_dsc_en();
-	restore_force_dsc_fractional_bpp_en();
-
 	if (test_type & TEST_DSC_BPC) {
 		current_bpc = igt_get_pipe_current_bpc(data->drm_fd, data->pipe);
 		igt_skip_on_f(data->input_bpc != current_bpc,
@@ -264,12 +273,16 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
 	enum pipe pipe;
+	int max_pipes = 0;
 	char name[3][LEN] = {
 				{0},
 				{0},
 				{0},
 			    };
 
+	for_each_pipe(display, pipe)
+		max_pipes++;
+
 	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
@@ -283,6 +296,9 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 		      check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe)))
 			continue;
 
+		if ((test_type & TEST_DSC_BIGJOINER) && data->pipe == max_pipes - 1)
+			continue;
+
 		if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
 		    (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
 						     data->output, data->output_format)))
@@ -349,6 +365,13 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 			test_dsc(&data, TEST_DSC_BASIC, DEFAULT_BPC,
 				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
 
+	igt_describe("Tests basic display stream compression functionality with big joiner "
+		     "if supported by a connector by forcing DSC and big joiner on all connectors "
+		     "that support it with default parameters");
+	igt_subtest_with_dynamic("dsc-with-bigjoiner")
+			test_dsc(&data, TEST_DSC_BASIC | TEST_DSC_BIGJOINER, DEFAULT_BPC,
+				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
+
 	igt_describe("Tests basic display stream compression functionality if supported "
 		     "by a connector by forcing DSC on all connectors that support it "
 		     "with default parameters and creating fb with diff formats");
-- 
2.25.1
