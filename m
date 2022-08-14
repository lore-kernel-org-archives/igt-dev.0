Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A5598CBE
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:48 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:51 +0530
Message-Id: <20220814180908.2553394-35-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 34/51] tests/kms_universal_plane: Add support for
 Bigjoiner
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

This patch will add a check to Skip the subtest if a selected pipe/output
combo won't support Bigjoiner or 8K mode.

Example:
* Pipe-D wont support a mode > 5K
* To use 8K mode on a pipe then consecutive pipe must be available & free.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_universal_plane.c | 93 +++++++++++++++++++++++++++++++++----
 1 file changed, 83 insertions(+), 10 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 3cb6d704..52f7c107 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -366,6 +366,9 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	igt_require_pipe(&data->display, pipe);
 
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
 	igt_output_set_pipe(output, pipe);
 	mode = igt_output_get_mode(output);
 
@@ -479,6 +482,9 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	igt_require_pipe(&data->display, pipe);
 
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
 	igt_output_set_pipe(output, pipe);
 
 	pageflip_test_init(&test, output, pipe);
@@ -582,6 +588,9 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_require(display->has_cursor_plane);
 	igt_require_intel(data->drm_fd);
 
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
 	igt_output_set_pipe(output, pipe);
 	mode = igt_output_get_mode(output);
 
@@ -710,6 +719,9 @@ gen9_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_skip_on(data->display_ver < 9);
 	igt_require_pipe(&data->display, pipe);
 
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
 	igt_output_set_pipe(output, pipe);
 
 	gen9_test_init(&test, output, pipe);
@@ -745,6 +757,21 @@ gen9_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	gen9_test_fini(&test, output);
 }
 
+static bool
+is_valid_combo(igt_display_t *display, enum pipe pipe, igt_output_t *output)
+{
+	bool ret = true;
+
+	igt_display_reset(display);
+
+	igt_output_set_pipe(output, pipe);
+	if (!igt_test_constraint(display))
+		ret = false;
+	igt_output_set_pipe(output, PIPE_NONE);
+
+	return ret;
+}
+
 static void
 run_tests_for_pipe(data_t *data, enum pipe pipe)
 {
@@ -763,34 +790,79 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 
 	igt_describe("Check the switching between different primary plane fbs with CRTC off");
 	igt_subtest_f("universal-plane-pipe-%s-functional",
-		      kmstest_pipe_name(pipe))
-		for_each_valid_output_on_pipe(&data->display, pipe, output)
+		      kmstest_pipe_name(pipe)) {
+		bool found = false;
+
+		for_each_valid_output_on_pipe(&data->display, pipe, output) {
+			if (!is_valid_combo(&data->display, pipe, output))
+				continue;
+
+			found = true;
 			functional_test_pipe(data, pipe, output);
+		}
+		igt_require_f(found, "No valid pipe/output combo found.\n");
+	}
 
 	igt_describe("Test for scale-up or scale-down using universal plane API without covering CRTC");
 	igt_subtest_f("universal-plane-pipe-%s-sanity",
-		      kmstest_pipe_name(pipe))
-		for_each_valid_output_on_pipe(&data->display, pipe, output)
+		      kmstest_pipe_name(pipe)) {
+		bool found = false;
+
+		for_each_valid_output_on_pipe(&data->display, pipe, output) {
+			if (!is_valid_combo(&data->display, pipe, output))
+				continue;
+
+			found = true;
 			sanity_test_pipe(data, pipe, output);
+		}
+		igt_require_f(found, "No valid pipe/output combo found.\n");
+	}
 
 	igt_describe("Check pageflips while primary plane is disabled before IOCTL or between IOCTL"
 			" and pageflip execution");
 	igt_subtest_f("disable-primary-vs-flip-pipe-%s",
-		      kmstest_pipe_name(pipe))
-		for_each_valid_output_on_pipe(&data->display, pipe, output)
+		      kmstest_pipe_name(pipe)) {
+		bool found = false;
+
+		for_each_valid_output_on_pipe(&data->display, pipe, output) {
+			if (!is_valid_combo(&data->display, pipe, output))
+				continue;
+
+			found = true;
 			pageflip_test_pipe(data, pipe, output);
+		}
+		igt_require_f(found, "No valid pipe/output combo found.\n");
+	}
 
 	igt_describe("Check for cursor leaks after performing cursor operations");
 	igt_subtest_f("cursor-fb-leak-pipe-%s",
-		      kmstest_pipe_name(pipe))
-		for_each_valid_output_on_pipe(&data->display, pipe, output)
+		      kmstest_pipe_name(pipe)) {
+		bool found = false;
+
+		for_each_valid_output_on_pipe(&data->display, pipe, output) {
+			if (!is_valid_combo(&data->display, pipe, output))
+				continue;
+
+			found = true;
 			cursor_leak_test_pipe(data, pipe, output);
+		}
+		igt_require_f(found, "No valid pipe/output combo found.\n");
+	}
 
 	igt_describe("Check if pageflip succeeds in windowed setting");
 	igt_subtest_f("universal-plane-gen9-features-pipe-%s",
-		      kmstest_pipe_name(pipe))
-		for_each_valid_output_on_pipe(&data->display, pipe, output)
+		      kmstest_pipe_name(pipe)) {
+		bool found = false;
+
+		for_each_valid_output_on_pipe(&data->display, pipe, output) {
+			if (!is_valid_combo(&data->display, pipe, output))
+				continue;
+
+			found = true;
 			gen9_test_pipe(data, pipe, output);
+		}
+		igt_require_f(found, "No valid pipe/output combo found.\n");
+	}
 }
 
 static data_t data;
@@ -808,6 +880,7 @@ igt_main
 
 		igt_require_pipe_crc(data.drm_fd);
 		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
 	}
 
 	for_each_pipe_static(pipe) {
-- 
2.35.1
