Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E70310E114
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Oct 2023 13:51:38 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Oct 2023 19:22:19 +0530
Message-Id: <20231009135219.29612-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2] tests/kms_concurrent: remove pipe dependency in
 subtest name
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

Remove pipe dependency in subtest name and give some
meaningful name to subtest.

v2: -use for_each_pipe_with_valid_output() since these tests
     depends upon resolution
    -drop pipe from data_t

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_concurrent.c | 38 +++++++++-----------------------------
 1 file changed, 9 insertions(+), 29 deletions(-)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index d9cb197de..fd2c88fcc 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -30,24 +30,13 @@
  * Description: Test atomic mode setting concurrently with multiple planes and
  *              screen resolution
  *
- * SUBTEST: pipe-%s
+ * SUBTEST: multi-plane-atomic-resolution
  * Description: Test atomic mode setting concurrently with multiple planes and
- *              screen resolution on %arg[1].
+ *              screen resolution.
  * Driver requirement: i915, xe
  * Functionality: kms_core
  * Mega feature: General Display Features
  * Test category: functionality test
- *
- * arg[1]:
- *
- * @A:      pipe A
- * @B:      pipe B
- * @C:      pipe C
- * @D:      pipe D
- * @E:      pipe E
- * @F:      pipe F
- * @G:      pipe G
- * @H:      pipe H
  */
 
 IGT_TEST_DESCRIPTION("Test atomic mode setting concurrently with multiple planes and screen resolution");
@@ -341,20 +330,14 @@ run_test(data_t *data, enum pipe pipe, igt_output_t *output)
 }
 
 static void
-run_tests_for_pipe(data_t *data, enum pipe pipe)
+run_tests_for_pipe(data_t *data)
 {
 	igt_output_t *output;
-
-	igt_fixture {
-		igt_require_pipe(&data->display, pipe);
-		igt_require(data->display.pipes[pipe].n_planes > 0);
-
-		igt_display_require_output(&data->display);
-	}
+	enum pipe pipe;
 
 	igt_describe("Test atomic mode setting concurrently with multiple planes and screen "
 		     "resolution.");
-	igt_subtest_with_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+	igt_subtest_with_dynamic("multi-plane-atomic-resolution") {
 		for_each_valid_output_on_pipe(&data->display, pipe, output) {
 			igt_display_reset(&data->display);
 
@@ -363,7 +346,8 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 				continue;
 
 			igt_output_set_pipe(output, PIPE_NONE);
-			igt_dynamic_f("%s", igt_output_name(output))
+			igt_require(data->display.pipes[pipe].n_planes > 0);
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
 				run_test(data, pipe, output);
 		}
 	}
@@ -405,21 +389,17 @@ static data_t data;
 
 igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
-	enum pipe pipe;
-
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require(data.display.is_atomic);
+		igt_display_require_output(&data.display);
 		if (is_intel_device(data.drm_fd))
 			intel_allocator_multiprocess_start();
 	}
 
-	for_each_pipe_static(pipe) {
-		igt_subtest_group
-			run_tests_for_pipe(&data, pipe);
-	}
+	run_tests_for_pipe(&data);
 
 	igt_fixture {
 		if (is_intel_device(data.drm_fd))
-- 
2.25.1
