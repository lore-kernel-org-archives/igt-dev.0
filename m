Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA6E10E3CF
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Sep 2022 07:34:56 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  7 Sep 2022 12:59:15 +0530
Message-Id: <20220907072916.405508-2-ananya.sharma@intel.com>
In-Reply-To: <20220907072916.405508-1-ananya.sharma@intel.com>
References: <20220907072916.405508-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 1/2] tests/kms_universal_plane: Convert
 test to dynamic
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

Modified kms_universal_plane to include dynamic test cases.

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/kms_universal_plane.c | 80 ++++++++++++++++---------------------
 1 file changed, 34 insertions(+), 46 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 3cb6d704..a4e56ddf 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -580,7 +580,6 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	igt_require_pipe(display, pipe);
 	igt_require(display->has_cursor_plane);
-	igt_require_intel(data->drm_fd);
 
 	igt_output_set_pipe(output, pipe);
 	mode = igt_output_get_mode(output);
@@ -706,7 +705,6 @@ gen9_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	int ret = 0;
 
-	igt_require_intel(data->drm_fd);
 	igt_skip_on(data->display_ver < 9);
 	igt_require_pipe(&data->display, pipe);
 
@@ -746,59 +744,51 @@ gen9_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 }
 
 static void
-run_tests_for_pipe(data_t *data, enum pipe pipe)
+run_tests_for_pipe(data_t *data)
 {
 	igt_output_t *output;
 
-	igt_fixture {
-		int valid_tests = 0;
+	struct {
+		const char *name;
+		void(*test_t)(data_t*, enum pipe, igt_output_t*);
+		const char *desc;
+	} tests[] = {
+		{ "universal-plane-functional", functional_test_pipe,
+		  "Check the switching between different primary plane fbs with CRTC off" },
 
-		igt_require_pipe(&data->display, pipe);
+		{ "universal-plane-sanity", sanity_test_pipe,
+		  "Test for scale-up or scale-down using universal plane API without covering CRTC" },
 
-		for_each_valid_output_on_pipe(&data->display, pipe, output)
-			valid_tests++;
+		{ "disable-primary-vs-flip", pageflip_test_pipe,
+		  "Check pageflips while primary plane is disabled before IOCTL or between IOCTL"
+		  "and pageflip execution" },
 
-		igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
-	}
+		{ "cursor-fb-leak", cursor_leak_test_pipe,
+		  "Check for cursor leaks after performing cursor operations" },
+
+		{ "universal-plane-gen9-features", gen9_test_pipe,
+		  "Check if pageflip succeeds in windowed setting"},
+	};
 
-	igt_describe("Check the switching between different primary plane fbs with CRTC off");
-	igt_subtest_f("universal-plane-pipe-%s-functional",
-		      kmstest_pipe_name(pipe))
-		for_each_valid_output_on_pipe(&data->display, pipe, output)
-			functional_test_pipe(data, pipe, output);
-
-	igt_describe("Test for scale-up or scale-down using universal plane API without covering CRTC");
-	igt_subtest_f("universal-plane-pipe-%s-sanity",
-		      kmstest_pipe_name(pipe))
-		for_each_valid_output_on_pipe(&data->display, pipe, output)
-			sanity_test_pipe(data, pipe, output);
-
-	igt_describe("Check pageflips while primary plane is disabled before IOCTL or between IOCTL"
-			" and pageflip execution");
-	igt_subtest_f("disable-primary-vs-flip-pipe-%s",
-		      kmstest_pipe_name(pipe))
-		for_each_valid_output_on_pipe(&data->display, pipe, output)
-			pageflip_test_pipe(data, pipe, output);
-
-	igt_describe("Check for cursor leaks after performing cursor operations");
-	igt_subtest_f("cursor-fb-leak-pipe-%s",
-		      kmstest_pipe_name(pipe))
-		for_each_valid_output_on_pipe(&data->display, pipe, output)
-			cursor_leak_test_pipe(data, pipe, output);
-
-	igt_describe("Check if pageflip succeeds in windowed setting");
-	igt_subtest_f("universal-plane-gen9-features-pipe-%s",
-		      kmstest_pipe_name(pipe))
-		for_each_valid_output_on_pipe(&data->display, pipe, output)
-			gen9_test_pipe(data, pipe, output);
+	int i;
+	enum pipe pipe;
+		for (i = 0; i < ARRAY_SIZE(tests); i++) {
+		igt_describe_f("%s", tests[i].desc);
+		igt_subtest_with_dynamic(tests[i].name) {
+			for_each_pipe_with_single_output(&data->display, pipe, output){
+				igt_display_reset(&data->display);
+				igt_require_intel(data->drm_fd);
+				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),igt_output_name(output))
+					tests[i].test_t(data, pipe, output);
+			}
+		}
+	}
 }
 
 static data_t data;
 
 igt_main
 {
-	enum pipe pipe;
-
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		if (is_i915_device(data.drm_fd))
@@ -810,10 +800,8 @@ igt_main
 		igt_display_require(&data.display, data.drm_fd);
 	}
 
-	for_each_pipe_static(pipe) {
-		igt_subtest_group
-			run_tests_for_pipe(&data, pipe);
-	}
+	igt_subtest_group
+			run_tests_for_pipe(&data);
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-- 
2.25.1
