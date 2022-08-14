Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27993989C6
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:12 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:22 +0530
Message-Id: <20220814180908.2553394-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 05/51] tests/kms_atomic_transition: Add support
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_atomic_transition.c | 131 +++++++++++++++++++++++++++++-----
 1 file changed, 114 insertions(+), 17 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 10b21c92..55b8d0e3 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -66,6 +66,9 @@ run_primary_test(data_t *data, enum pipe pipe, igt_output_t *output)
 	int i, ret;
 	unsigned flags = DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET;
 
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
 	igt_output_set_pipe(output, pipe);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
@@ -490,6 +493,9 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 	unsigned flags = 0;
 	int ret;
 
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
 	if (fencing)
 		prepare_fencing(data, pipe);
 	else
@@ -755,8 +761,13 @@ static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 			if (output->pending_pipe != PIPE_NONE)
 				continue;
 
-			mode = igt_output_get_mode(output);
-			break;
+			igt_output_set_pipe(output, pipe);
+			if (igt_test_constraint(&data->display)) {
+				mode = igt_output_get_mode(output);
+				break;
+			} else {
+				igt_output_set_pipe(output, PIPE_NONE);
+			}
 		}
 
 		if (!mode)
@@ -843,8 +854,17 @@ retry:
 				continue;
 
 			igt_output_set_pipe(output, i);
-			mode = igt_output_get_mode(output);
-			break;
+			if (igt_test_constraint(&data->display)) {
+				mode = igt_output_get_mode(output);
+
+				igt_info("(pipe %s + %s), mode:",
+					 kmstest_pipe_name(i), igt_output_name(output));
+				kmstest_dump_mode(mode);
+
+				break;
+			} else {
+				igt_output_set_pipe(output, PIPE_NONE);
+			}
 		}
 
 		if (mode) {
@@ -979,6 +999,21 @@ static void run_modeset_transition(data_t *data, int requested_outputs, bool non
 	run_modeset_tests(data, requested_outputs, nonblocking, fencing);
 }
 
+static bool is_valid_combo(igt_display_t *display,
+			   enum pipe pipe, igt_output_t *output)
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
 static int opt_handler(int opt, int opt_index, void *_data)
 {
 	data_t *data = _data;
@@ -1025,94 +1060,131 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 	igt_describe("Check toggling of primary plane with vblank");
 	igt_subtest("plane-primary-toggle-with-vblank-wait") {
+		bool found = false;
+
+		pipe_count = 0;
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended)
 				break;
 			pipe_count++;
-			run_primary_test(&data, pipe, output);
 
+			if (!is_valid_combo(&data.display, pipe, output))
+				continue;
+
+			found = true;
+			run_primary_test(&data, pipe, output);
 		}
-		pipe_count = 0;
+		igt_require(found);
 	}
 
 	igt_describe("Transition test for all plane combinations");
 	igt_subtest_with_dynamic("plane-all-transition") {
+		pipe_count = 0;
+
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended)
 				break;
 			pipe_count++;
+
+			if (!is_valid_combo(&data.display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&data, pipe, output, TRANSITION_PLANES, false, false);
 			test_cleanup(&data, pipe, output, false);
 		}
-		pipe_count = 0;
 	}
 
 	igt_describe("Transition test for all plane combinations with fencing commit");
 	igt_subtest_with_dynamic("plane-all-transition-fencing") {
+		pipe_count = 0;
+
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended)
 				break;
 			pipe_count++;
+
+			if (!is_valid_combo(&data.display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&data, pipe, output, TRANSITION_PLANES, false, true);
 			test_cleanup(&data, pipe, output, true);
 		}
-		pipe_count = 0;
 	}
 
 	igt_describe("Transition test for all plane combinations with nonblocking commit");
 	igt_subtest_with_dynamic("plane-all-transition-nonblocking") {
+		pipe_count = 0;
+
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended)
 				break;
 			pipe_count++;
+
+			if (!is_valid_combo(&data.display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&data, pipe, output, TRANSITION_PLANES, true, false);
 			test_cleanup(&data, pipe, output, false);
 		}
-		pipe_count = 0;
 	}
 
 	igt_describe("Transition test for all plane combinations with nonblocking and fencing commit");
 	igt_subtest_with_dynamic("plane-all-transition-nonblocking-fencing") {
+		pipe_count = 0;
+
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended)
 				break;
 			pipe_count++;
+
+			if (!is_valid_combo(&data.display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&data, pipe, output, TRANSITION_PLANES, true, true);
 			test_cleanup(&data, pipe, output, true);
 		}
-		pipe_count = 0;
 	}
 
 	igt_describe("Transition test with non blocking commit and make sure commit of disabled plane has "
 		       "to complete before atomic commit on that plane");
 	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind") {
+		pipe_count = 0;
+
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended)
 				break;
 			pipe_count++;
+
+			if (!is_valid_combo(&data.display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&data, pipe, output, TRANSITION_AFTER_FREE, true, false);
 			test_cleanup(&data, pipe, output, false);
 		}
-		pipe_count = 0;
 	}
 
 	igt_describe("Transition test with non blocking and fencing commit and make sure commit of "
 		       "disabled plane has to complete before atomic commit on that plane");
 	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind-fencing") {
+		pipe_count = 0;
+
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended)
 				break;
 			pipe_count++;
+
+			if (!is_valid_combo(&data.display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&data, pipe, output, TRANSITION_AFTER_FREE, true, true);
 			test_cleanup(&data, pipe, output, true);
 		}
-		pipe_count = 0;
 	}
 
 	/*
@@ -1122,78 +1194,103 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	 */
 	igt_describe("Modeset test for all plane combinations");
 	igt_subtest_with_dynamic("plane-all-modeset-transition") {
+		pipe_count = 0;
+
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended)
 				break;
 			pipe_count++;
+
 			if (output_is_internal_panel(output))
 				continue;
 
+			if (!is_valid_combo(&data.display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&data, pipe, output, TRANSITION_MODESET, false, false);
 			test_cleanup(&data, pipe, output, false);
 		}
-		pipe_count = 0;
 	}
 
 	igt_describe("Modeset test for all plane combinations with fencing commit");
 	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing") {
+		pipe_count = 0;
+
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended)
 				break;
 			pipe_count++;
+
 			if (output_is_internal_panel(output))
 				continue;
 
+			if (!is_valid_combo(&data.display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&data, pipe, output, TRANSITION_MODESET, false, true);
 			test_cleanup(&data, pipe, output, true);
 		}
-		pipe_count = 0;
 	}
 
 	igt_describe("Modeset test for all plane combinations on internal panels");
 	igt_subtest_with_dynamic("plane-all-modeset-transition-internal-panels") {
+		pipe_count = 0;
+
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended)
 				break;
 			pipe_count++;
+
 			if (!output_is_internal_panel(output))
 				continue;
 
+			if (!is_valid_combo(&data.display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&data, pipe, output, TRANSITION_MODESET_FAST, false, false);
 			test_cleanup(&data, pipe, output, false);
 		}
-		pipe_count = 0;
 	}
 
 	igt_describe("Modeset test for all plane combinations on internal panels with fencing commit");
 	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing-internal-panels") {
+		pipe_count = 0;
+
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended)
 				break;
 			pipe_count++;
+
 			if (!output_is_internal_panel(output))
 				continue;
 
+			if (!is_valid_combo(&data.display, pipe, output))
+				continue;
+
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&data, pipe, output, TRANSITION_MODESET_FAST, false, true);
 			test_cleanup(&data, pipe, output, true);
 		}
-		pipe_count = 0;
 	}
 
 	igt_describe("Check toggling and modeset transition on plane");
 	igt_subtest("plane-toggle-modeset-transition") {
+		pipe_count = 0;
+
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended)
 				break;
 			pipe_count++;
+
+			if (!is_valid_combo(&data.display, pipe, output))
+				continue;
+
 			run_transition_test(&data, pipe, output, TRANSITION_MODESET_DISABLE, false, false);
 			test_cleanup(&data, pipe, output, false);
 		}
-		pipe_count = 0;
 	}
 
 	igt_describe("Modeset transition tests for combinations of crtc enabled");
-- 
2.35.1
