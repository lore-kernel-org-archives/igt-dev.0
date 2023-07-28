Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E660210E67A
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jul 2023 07:49:26 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Jul 2023 13:19:05 +0530
Message-Id: <20230728074913.939188-3-swati2.sharma@intel.com>
In-Reply-To: <20230728074913.939188-1-swati2.sharma@intel.com>
References: <20230728074913.939188-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v4 02/10] tests/i915/kms_dsc: use uint32_t test flag
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

Instead of using enum, use uinit32_t test flag. It is helpful,
if we need to implement feature combination tests.

v2: -use #define (Ankit)
    -use 2D char array (Ankit)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/i915/kms_dsc.c | 50 +++++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 22 deletions(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 23ccbca00..99d35a7ff 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -34,12 +34,12 @@
 
 IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
-enum dsc_test_type {
-	TEST_DSC_BASIC,
-	TEST_DSC_BPC,
-	TEST_DSC_FORMAT,
-	TEST_DSC_OUTPUT_FORMAT,
-};
+#define LEN		20
+
+#define TEST_DSC_BASIC		(0<<0)
+#define TEST_DSC_BPC		(1<<0)
+#define TEST_DSC_FORMAT		(1<<1)
+#define TEST_DSC_OUTPUT_FORMAT	(1<<2)
 
 typedef struct {
 	int drm_fd;
@@ -111,7 +111,7 @@ static void test_cleanup(data_t *data)
 }
 
 /* re-probe connectors and do a modeset with DSC */
-static void update_display(data_t *data, enum dsc_test_type test_type)
+static void update_display(data_t *data, uint32_t test_type)
 {
 	int ret;
 	bool enabled;
@@ -130,12 +130,12 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 	save_force_dsc_en(data->drm_fd, data->output);
 	force_dsc_enable(data->drm_fd, data->output);
 
-	if (test_type == TEST_DSC_BPC) {
+	if (test_type & TEST_DSC_BPC) {
 		igt_debug("Trying to set input BPC to %d\n", data->input_bpc);
 		force_dsc_enable_bpc(data->drm_fd, data->output, data->input_bpc);
 	}
 
-	if (test_type == TEST_DSC_OUTPUT_FORMAT) {
+	if (test_type & TEST_DSC_OUTPUT_FORMAT) {
 		igt_debug("Trying to set DSC %s output format\n",
 			   kmstest_dsc_output_format_str(data->output_format));
 		force_dsc_output_format(data->drm_fd, data->output, data->output_format);
@@ -214,13 +214,18 @@ reset:
 	igt_assert_eq(ret, 0);
 }
 
-static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
-		     unsigned int plane_format, enum dsc_output_format output_format)
+static void test_dsc(data_t *data, uint32_t test_type, int bpc,
+		     unsigned int plane_format,
+		     enum dsc_output_format output_format)
 {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
-	char name[20];
 	enum pipe pipe;
+	char name[3][LEN] = {
+				{0},
+				{0},
+				{0},
+			    };
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
 		data->output_format = output_format;
@@ -242,15 +247,15 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
 		if (!check_gen11_bpc_constraint(data->drm_fd, data->output, data->input_bpc))
 			continue;
 
-		if (test_type == TEST_DSC_BPC)
-			snprintf(name, sizeof(name), "-%dbpc-%s", data->input_bpc, igt_format_str(data->plane_format));
-		else if (test_type == TEST_DSC_OUTPUT_FORMAT)
-			snprintf(name, sizeof(name), "-%s-%s", kmstest_dsc_output_format_str(data->output_format),
-							       igt_format_str(data->plane_format));
-		else
-			snprintf(name, sizeof(name), "-%s", igt_format_str(data->plane_format));
+		if (test_type & TEST_DSC_OUTPUT_FORMAT)
+			snprintf(&name[0][0], LEN, "-%s", kmstest_dsc_output_format_str(data->output_format));
+		if (test_type & TEST_DSC_FORMAT)
+			snprintf(&name[1][0], LEN, "-%s", igt_format_str(data->plane_format));
+		if (test_type & TEST_DSC_BPC)
+			snprintf(&name[2][0], LEN, "-%dbpc", data->input_bpc);
 
-		igt_dynamic_f("pipe-%s-%s%s",  kmstest_pipe_name(data->pipe), data->output->name, name)
+		igt_dynamic_f("pipe-%s-%s%s%s%s",  kmstest_pipe_name(data->pipe), data->output->name,
+			      &name[0][0], &name[1][0], &name[2][0])
 			update_display(data, test_type);
 
 		if (data->limited)
@@ -322,8 +327,9 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 	igt_subtest_with_dynamic("dsc-with-bpc-formats") {
 		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
 			for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
-				test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
-				format_list[k], DSC_FORMAT_RGB);
+				test_dsc(&data, TEST_DSC_BPC | TEST_DSC_FORMAT,
+				bpc_list[j], format_list[k],
+				DSC_FORMAT_RGB);
 			}
 		}
 	}
-- 
2.25.1
