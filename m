Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4689C10EC70
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 16:04:09 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 21:29:46 +0530
Message-Id: <20220922160004.2041598-35-bhanuprakash.modem@intel.com>
In-Reply-To: <20220922160004.2041598-1-bhanuprakash.modem@intel.com>
References: <20220922160004.2041598-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 34/52] tests/kms_universal_plane: Add support
 for Bigjoiner
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

V2: - Use updated helper name

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_universal_plane.c | 94 +++++++++++++++++++++++++++++++++----
 1 file changed, 84 insertions(+), 10 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 432f56ba..e0277727 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -373,6 +373,9 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	igt_require_pipe(&data->display, pipe);
 
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
 	igt_output_set_pipe(output, pipe);
 	mode = igt_output_get_mode(output);
 
@@ -486,6 +489,9 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	igt_require_pipe(&data->display, pipe);
 
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
 	igt_output_set_pipe(output, pipe);
 
 	pageflip_test_init(&test, output, pipe);
@@ -589,6 +595,9 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_require(display->has_cursor_plane);
 	igt_require_intel(data->drm_fd);
 
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
 	igt_output_set_pipe(output, pipe);
 	mode = igt_output_get_mode(output);
 
@@ -716,6 +725,9 @@ pageflip_win_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_skip_on(is_i915_device(data->drm_fd) && data->display_ver < 9);
 	igt_require_pipe(&data->display, pipe);
 
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
 	igt_output_set_pipe(output, pipe);
 
 	gen9_test_init(&test, output, pipe);
@@ -751,6 +763,22 @@ pageflip_win_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	gen9_test_fini(&test, output);
 }
 
+static bool
+pipe_output_combo_valid(igt_display_t *display,
+			enum pipe pipe, igt_output_t *output)
+{
+	bool ret = true;
+
+	igt_display_reset(display);
+
+	igt_output_set_pipe(output, pipe);
+	if (!i915_pipe_output_combo_valid(display))
+		ret = false;
+	igt_output_set_pipe(output, PIPE_NONE);
+
+	return ret;
+}
+
 static void
 run_tests_for_pipe(data_t *data, enum pipe pipe)
 {
@@ -769,34 +797,79 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 
 	igt_describe("Check the switching between different primary plane fbs with CRTC off");
 	igt_subtest_f("universal-plane-pipe-%s-functional",
-		      kmstest_pipe_name(pipe))
-		for_each_valid_output_on_pipe(&data->display, pipe, output)
+		      kmstest_pipe_name(pipe)) {
+		bool found = false;
+
+		for_each_valid_output_on_pipe(&data->display, pipe, output) {
+			if (!pipe_output_combo_valid(&data->display, pipe, output))
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
+			if (!pipe_output_combo_valid(&data->display, pipe, output))
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
+			if (!pipe_output_combo_valid(&data->display, pipe, output))
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
+			if (!pipe_output_combo_valid(&data->display, pipe, output))
+				continue;
+
+			found = true;
 			cursor_leak_test_pipe(data, pipe, output);
+		}
+		igt_require_f(found, "No valid pipe/output combo found.\n");
+	}
 
 	igt_describe("Check if pageflip succeeds in windowed setting");
 	igt_subtest_f("universal-plane-pageflip-windowed-pipe-%s",
-		      kmstest_pipe_name(pipe))
-		for_each_valid_output_on_pipe(&data->display, pipe, output)
+		      kmstest_pipe_name(pipe)) {
+		bool found = false;
+
+		for_each_valid_output_on_pipe(&data->display, pipe, output) {
+			if (!pipe_output_combo_valid(&data->display, pipe, output))
+				continue;
+
+			found = true;
 			pageflip_win_test_pipe(data, pipe, output);
+		}
+		igt_require_f(found, "No valid pipe/output combo found.\n");
+	}
 }
 
 static data_t data;
@@ -814,6 +887,7 @@ igt_main
 
 		igt_require_pipe_crc(data.drm_fd);
 		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
 	}
 
 	for_each_pipe_static(pipe) {
-- 
2.37.3
