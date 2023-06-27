Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763F810E0C2
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 11:33:34 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Jun 2023 17:02:47 +0530
Message-Id: <20230627113250.669971-3-swati2.sharma@intel.com>
In-Reply-To: <20230627113250.669971-1-swati2.sharma@intel.com>
References: <20230627113250.669971-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/5] tests/i915/kms_dsc: use uint32_t test
 flag
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

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_dsc.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index c033a2ff0..4b5e034bf 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -34,11 +34,11 @@
 
 IGT_TEST_DESCRIPTION("Test to validate display stream compression");
 
-enum dsc_test_type {
-	TEST_DSC_BASIC,
-	TEST_DSC_BPC,
-	TEST_DSC_FORMAT,
-	TEST_DSC_OUTPUT_FORMAT,
+enum {
+	TEST_DSC_BASIC = 1 << 0,
+	TEST_DSC_BPC = 1 << 1,
+	TEST_DSC_FORMAT = 1 << 2,
+	TEST_DSC_OUTPUT_FORMAT = 1 << 3,
 };
 
 typedef struct {
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
@@ -214,13 +214,14 @@ reset:
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
+	char n1[20] = {0}, n2[20] = {0}, n3[20] = {0};
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
 		data->output_format = output_format;
@@ -242,15 +243,14 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
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
+			snprintf(n1, sizeof(n1), "-%s", kmstest_dsc_output_format_str(data->output_format));
+		if (test_type & TEST_DSC_FORMAT)
+			snprintf(n2, sizeof(n2), "-%s", igt_format_str(data->plane_format));
+		if (test_type & TEST_DSC_BPC)
+			snprintf(n3, sizeof(n3), "-%dbpc", data->input_bpc);
 
-		igt_dynamic_f("pipe-%s-%s%s",  kmstest_pipe_name(data->pipe), data->output->name, name)
+		igt_dynamic_f("pipe-%s-%s%s%s%s",  kmstest_pipe_name(data->pipe), data->output->name, n1, n2, n3)
 			update_display(data, test_type);
 
 		if (data->limited)
@@ -322,7 +322,7 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 	igt_subtest_with_dynamic("dsc-with-bpc-formats") {
 		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
 			for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
-				test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
+				test_dsc(&data, TEST_DSC_BPC | TEST_DSC_FORMAT, bpc_list[j],
 				format_list[k], DSC_FORMAT_RGB);
 			}
 		}
-- 
2.25.1
