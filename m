Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1756E42E
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jun 2021 16:00:31 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id k8so8854530lja.4
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jun 2021 09:00:31 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue, 15 Jun 2021 19:00:20 +0300
Message-Id: <20210615160022.31610-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210615160022.31610-1-juhapekka.heikkila@gmail.com>
References: <20210615160022.31610-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/4] tests/kms_ccs: separate ccs modifiers
 to separate subtests
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

Current kms_ccs test is not revealing if some ccs modifier fails
as long as there's at least one modifier not failing. Separate all
ccs modifiers onto their own tests making testing individual ccs
modifiers easier and not hiding failures.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_ccs.c | 156 +++++++++++++++++++++---------------------------
 1 file changed, 67 insertions(+), 89 deletions(-)

diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index a3eac1f8f..62850c1b2 100644
--- a/tests/kms_ccs.c
+++ b/tests/kms_ccs.c
@@ -41,6 +41,7 @@ enum test_flags {
 	TEST_BAD_CCS_HANDLE		= 1 << 6,
 	TEST_BAD_AUX_STRIDE		= 1 << 7,
 	TEST_RANDOM			= 1 << 8,
+	TEST_ALL_PLANES			= 1 << 9,
 };
 
 #define TEST_FAIL_ON_ADDFB2 \
@@ -92,11 +93,11 @@ static const struct {
 	uint64_t modifier;
 	const char *str;
 } ccs_modifiers[] = {
-	{LOCAL_I915_FORMAT_MOD_Y_TILED_CCS, "LOCAL_I915_FORMAT_MOD_Y_TILED_CCS"},
-	{LOCAL_I915_FORMAT_MOD_Yf_TILED_CCS, "LOCAL_I915_FORMAT_MOD_Yf_TILED_CCS"},
-	{LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, "LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS"},
-	{LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC, "LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC"},
-	{LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS, "LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS"},
+	{LOCAL_I915_FORMAT_MOD_Y_TILED_CCS, "y_tiled_ccs"},
+	{LOCAL_I915_FORMAT_MOD_Yf_TILED_CCS, "yf_tiled_ccs"},
+	{LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, "y_tiled_gen12_rc_ccs"},
+	{LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC, "y_tiled_gen12_rc_ccs_cc"},
+	{LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS, "y_tiled_gen12_mc_ccs"},
 };
 
 static bool check_ccs_planes;
@@ -507,37 +508,53 @@ static int test_ccs(data_t *data)
 	return valid_tests;
 }
 
-static int __test_output(data_t *data)
+static void test_output(data_t *data, const char* testformatstring)
 {
-	igt_display_t *display = &data->display;
-	int i, valid_tests = 0;
-
-	data->output = igt_get_single_output_for_pipe(display, data->pipe);
-	igt_require(data->output);
-
-	igt_output_set_pipe(data->output, data->pipe);
-
-	for (i = 0; i < ARRAY_SIZE(ccs_modifiers); i++) {
-		int j;
+	igt_fixture {
+		data->output = igt_get_single_output_for_pipe(&data->display,
+							      data->pipe);
+		igt_output_set_pipe(data->output, data->pipe);
+	}
 
+	for (int i = 0; i < ARRAY_SIZE(ccs_modifiers); i++) {
 		data->ccs_modifier = ccs_modifiers[i].modifier;
-		igt_debug("Modifier in use: %s\n", ccs_modifiers[i].str);
-		for (j = 0; j < ARRAY_SIZE(formats); j++) {
-			data->format = formats[j];
-			valid_tests += test_ccs(data);
+
+		igt_subtest_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
+			      testformatstring, ccs_modifiers[i].str ) {
+			int valid_tests = 0;
+			igt_require(data->output);
+
+			if (data->flags == TEST_RANDOM)
+				igt_info("Testing with seed %d\n", data->seed);
+
+			if (data->flags & TEST_ALL_PLANES) {
+				igt_display_require_output_on_pipe(&data->display, data->pipe);
+
+				for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
+					for (int j = 0; j < ARRAY_SIZE(formats); j++) {
+						data->format = formats[j];
+						valid_tests += test_ccs(data);
+					}
+				}
+			} else {
+				for (int j = 0; j < ARRAY_SIZE(formats); j++) {
+					data->format = formats[j];
+					valid_tests += test_ccs(data);
+				}
+			}
+			igt_require_f(valid_tests > 0,
+				      "no valid tests for %s on pipe %s\n",
+				      ccs_modifiers[i].str,
+				      kmstest_pipe_name(data->pipe));
 		}
 	}
 
-	igt_output_set_pipe(data->output, PIPE_NONE);
-	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
-
-	return valid_tests;
-}
-
-static void test_output(data_t *data)
-{
-	int valid_tests = __test_output(data);
-	igt_require_f(valid_tests > 0, "CCS not supported, skipping\n");
+	igt_fixture {
+		igt_output_set_pipe(data->output, PIPE_NONE);
+		igt_display_commit2(&data->display, data->display.is_atomic ?
+				    COMMIT_ATOMIC : COMMIT_LEGACY);
+		data->plane = NULL;
+	}
 }
 
 static int opt_handler(int opt, int opt_index, void *opt_data)
@@ -570,6 +587,22 @@ igt_main_args("cs:", NULL, help_str, opt_handler, &data)
 {
 	enum pipe pipe;
 
+	const struct {
+		const enum test_flags	flags;
+		const char		*testname;
+		const char		*description;
+	} tests[] = {
+		{TEST_BAD_PIXEL_FORMAT, "bad-pixel-format", "Test bad pixel format with given CCS modifier"},
+		{TEST_BAD_ROTATION_90, "bad-rotation-90", "Test 90 degree rotation with given CCS modifier"},
+		{TEST_CRC, "crc-primary-basic", "Test primary plane CRC compatibility with given CCS modifier"},
+		{TEST_CRC | TEST_ROTATE_180, "crc-primary-rotation-180", "Test 180 degree rotation with given CCS modifier"},
+		{TEST_RANDOM, "random-ccs-data", "Test random CCS data"},
+		{TEST_NO_AUX_BUFFER, "missing-ccs-buffer", "Test missing CCS buffer with given CCS modifier"},
+		{TEST_BAD_CCS_HANDLE, "ccs-on-another-bo", "Test CCS with different BO with given modifier"},
+		{TEST_BAD_AUX_STRIDE, "bad-aux-stride", "Test with bad AUX stride with given CCS modifier"},
+		{TEST_CRC | TEST_ALL_PLANES, "crc-sprite-planes-basic", "Test sprite plane CRC compatibility with given CCS modifier"},
+	};
+
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 
@@ -584,68 +617,13 @@ igt_main_args("cs:", NULL, help_str, opt_handler, &data)
 	}
 
 	for_each_pipe_static(pipe) {
-		const char *pipe_name = kmstest_pipe_name(pipe);
-
 		data.pipe = pipe;
 
-		data.flags = TEST_BAD_PIXEL_FORMAT;
-		igt_describe("Test bad pixel format with given CCS modifier");
-		igt_subtest_f("pipe-%s-bad-pixel-format", pipe_name)
-			test_output(&data);
-
-		data.flags = TEST_BAD_ROTATION_90;
-		igt_describe("Test 90 degree rotation with given CCS modifier");
-		igt_subtest_f("pipe-%s-bad-rotation-90", pipe_name)
-			test_output(&data);
-
-		data.flags = TEST_CRC;
-		igt_describe("Test primary plane CRC compatibility with given CCS modifier");
-		igt_subtest_f("pipe-%s-crc-primary-basic", pipe_name)
-			test_output(&data);
-
-		data.flags = TEST_CRC | TEST_ROTATE_180;
-		igt_describe("Test 180 degree rotation with given CCS modifier");
-		igt_subtest_f("pipe-%s-crc-primary-rotation-180", pipe_name)
-			test_output(&data);
-
-		data.flags = TEST_CRC;
-		igt_describe("Test sprite plane CRC compatibility with given CCS modifier");
-		igt_subtest_f("pipe-%s-crc-sprite-planes-basic", pipe_name) {
-			int valid_tests = 0;
-
-			igt_display_require_output_on_pipe(&data.display, data.pipe);
-
-			for_each_plane_on_pipe(&data.display, data.pipe, data.plane) {
-				valid_tests += __test_output(&data);
-			}
-
-			igt_require_f(valid_tests > 0,
-				      "CCS not supported, skipping\n");
-		}
-
-		data.plane = NULL;
-
-		data.flags = TEST_RANDOM;
-		igt_describe("Test random CCS data");
-		igt_subtest_f("pipe-%s-random-ccs-data", pipe_name) {
-			igt_info("Testing with seed %d\n", data.seed);
-			test_output(&data);
+		for (int c = 0; c < ARRAY_SIZE(tests); c++) {
+			data.flags = tests[c].flags;
+			igt_describe(tests[c].description);
+			test_output(&data, tests[c].testname);
 		}
-
-		data.flags = TEST_NO_AUX_BUFFER;
-		igt_describe("Test missing CCS buffer with given CCS modifier");
-		igt_subtest_f("pipe-%s-missing-ccs-buffer", pipe_name)
-			test_output(&data);
-
-		data.flags = TEST_BAD_CCS_HANDLE;
-		igt_describe("Test CCS with different BO with given modifier");
-		igt_subtest_f("pipe-%s-ccs-on-another-bo", pipe_name)
-			test_output(&data);
-
-		data.flags = TEST_BAD_AUX_STRIDE;
-		igt_describe("Test with bad AUX stride with given CCS modifier");
-		igt_subtest_f("pipe-%s-bad-aux-stride", pipe_name)
-			test_output(&data);
 	}
 
 	igt_fixture
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
