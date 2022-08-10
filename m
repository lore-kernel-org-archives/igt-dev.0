Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6D38ABC4
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Aug 2022 10:55:08 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 10 Aug 2022 16:22:12 +0530
Message-Id: <20220810105212.1774656-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/kms_atomic_transition: Convert tests to
 dynamic
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

Convert the existing subtests to dynamic subtests at pipe/output
level. And create an array of structures to populate subtests to
avoid code duplication.

This patch will also sanitize the system state before starting the
subtest with igt_display_reset().

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_atomic_transition.c | 290 ++++++++++++----------------------
 1 file changed, 98 insertions(+), 192 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 10b21c92..137ad705 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -66,6 +66,7 @@ run_primary_test(data_t *data, enum pipe pipe, igt_output_t *output)
 	int i, ret;
 	unsigned flags = DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET;
 
+	igt_display_reset(&data->display);
 	igt_output_set_pipe(output, pipe);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
@@ -937,6 +938,7 @@ retry:
 	}
 
 	set_combinations(data, 0, NULL);
+	igt_display_reset(&data->display);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 	if (is_i915_device(data->drm_fd)) {
@@ -972,11 +974,14 @@ static void run_modeset_transition(data_t *data, int requested_outputs, bool non
 		}
 	}
 
-	igt_require_f(num_outputs >= requested_outputs,
-		      "Should have at least %i outputs, found %i\n",
-		      requested_outputs, num_outputs);
+	if (num_outputs < requested_outputs) {
+		igt_debug("Should have at least %i outputs, found %i\n",
+			  requested_outputs, num_outputs);
+		return;
+	}
 
-	run_modeset_tests(data, requested_outputs, nonblocking, fencing);
+	igt_dynamic_f("%ix-outputs", requested_outputs)
+		run_modeset_tests(data, requested_outputs, nonblocking, fencing);
 }
 
 static int opt_handler(int opt, int opt_index, void *_data)
@@ -1006,7 +1011,54 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 {
 	igt_output_t *output;
 	enum pipe pipe;
-	int i, count = 0;
+	struct {
+		const char *name;
+		enum transition_type type;
+		bool nonblocking;
+		bool fencing;
+		const char *desc;
+	} transition_tests[] = {
+		{ "plane-all-transition", TRANSITION_PLANES, false, false,
+		  "Transition test for all plane combinations" },
+		{ "plane-all-transition-fencing", TRANSITION_PLANES, false, true,
+		  "Transition test for all plane combinations with fencing commit" },
+		{ "plane-all-transition-nonblocking", TRANSITION_PLANES, true, false,
+		  "Transition test for all plane combinations with nonblocking commit" },
+		{ "plane-all-transition-nonblocking-fencing", TRANSITION_PLANES, true, true,
+		  "Transition test for all plane combinations with nonblocking and fencing commit" },
+		{ "plane-use-after-nonblocking-unbind", TRANSITION_AFTER_FREE, true, false,
+		  "Transition test with non blocking commit and make sure commit of disabled plane has "
+		       "to complete before atomic commit on that plane" },
+		{ "plane-use-after-nonblocking-unbind-fencing", TRANSITION_AFTER_FREE, true, true,
+		  "Transition test with non blocking and fencing commit and make sure commit of "
+		       "disabled plane has to complete before atomic commit on that plane" },
+		{ "plane-all-modeset-transition", TRANSITION_MODESET, false, false,
+		  "Modeset test for all plane combinations" },
+		{ "plane-all-modeset-transition-fencing", TRANSITION_MODESET, false, true,
+		  "Modeset test for all plane combinations with fencing commit" },
+		{ "plane-all-modeset-transition-internal-panels", TRANSITION_MODESET_FAST, false, false,
+		  "Modeset test for all plane combinations on internal panels" },
+		{ "plane-all-modeset-transition-fencing-internal-panels", TRANSITION_MODESET_FAST, false, true,
+		  "Modeset test for all plane combinations on internal panels with fencing commit" },
+		{ "plane-toggle-modeset-transition", TRANSITION_MODESET_DISABLE, false, false,
+		  "Check toggling and modeset transition on plane" },
+	};
+	struct {
+		const char *name;
+		bool nonblocking;
+		bool fencing;
+		const char *desc;
+	} modeset_tests[] = {
+		{ "modeset-transition", false, false,
+		  "Modeset transition tests for combinations of crtc enabled" },
+		{ "modeset-transition-fencing", false, true,
+		  "Modeset transition tests for combinations of crtc enabled with fencing commit" },
+		{ "modeset-transition-nonblocking", true, false,
+		  "Modeset transition tests for combinations of crtc enabled with nonblocking commit" },
+		{ "modeset-transition-nonblocking-fencing", true, true,
+		  "Modeset transition tests for combinations of crtc enabled with nonblocking and fencing commit" },
+	};
+	int i, j, count = 0;
 	int pipe_count = 0;
 
 	igt_fixture {
@@ -1024,208 +1076,62 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	}
 
 	igt_describe("Check toggling of primary plane with vblank");
-	igt_subtest("plane-primary-toggle-with-vblank-wait") {
-		for_each_pipe_with_valid_output(&data.display, pipe, output) {
-			if (pipe_count == 2 * count && !data.extended)
-				break;
-			pipe_count++;
-			run_primary_test(&data, pipe, output);
-
-		}
-		pipe_count = 0;
-	}
-
-	igt_describe("Transition test for all plane combinations");
-	igt_subtest_with_dynamic("plane-all-transition") {
-		for_each_pipe_with_valid_output(&data.display, pipe, output) {
-			if (pipe_count == 2 * count && !data.extended)
-				break;
-			pipe_count++;
-			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&data, pipe, output, TRANSITION_PLANES, false, false);
-			test_cleanup(&data, pipe, output, false);
-		}
-		pipe_count = 0;
-	}
-
-	igt_describe("Transition test for all plane combinations with fencing commit");
-	igt_subtest_with_dynamic("plane-all-transition-fencing") {
-		for_each_pipe_with_valid_output(&data.display, pipe, output) {
-			if (pipe_count == 2 * count && !data.extended)
-				break;
-			pipe_count++;
-			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&data, pipe, output, TRANSITION_PLANES, false, true);
-			test_cleanup(&data, pipe, output, true);
-		}
-		pipe_count = 0;
-	}
-
-	igt_describe("Transition test for all plane combinations with nonblocking commit");
-	igt_subtest_with_dynamic("plane-all-transition-nonblocking") {
-		for_each_pipe_with_valid_output(&data.display, pipe, output) {
-			if (pipe_count == 2 * count && !data.extended)
-				break;
-			pipe_count++;
-			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&data, pipe, output, TRANSITION_PLANES, true, false);
-			test_cleanup(&data, pipe, output, false);
-		}
-		pipe_count = 0;
-	}
-
-	igt_describe("Transition test for all plane combinations with nonblocking and fencing commit");
-	igt_subtest_with_dynamic("plane-all-transition-nonblocking-fencing") {
-		for_each_pipe_with_valid_output(&data.display, pipe, output) {
-			if (pipe_count == 2 * count && !data.extended)
-				break;
-			pipe_count++;
-			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&data, pipe, output, TRANSITION_PLANES, true, true);
-			test_cleanup(&data, pipe, output, true);
-		}
-		pipe_count = 0;
-	}
-
-	igt_describe("Transition test with non blocking commit and make sure commit of disabled plane has "
-		       "to complete before atomic commit on that plane");
-	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind") {
-		for_each_pipe_with_valid_output(&data.display, pipe, output) {
-			if (pipe_count == 2 * count && !data.extended)
-				break;
-			pipe_count++;
-			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&data, pipe, output, TRANSITION_AFTER_FREE, true, false);
-			test_cleanup(&data, pipe, output, false);
-		}
-		pipe_count = 0;
-	}
-
-	igt_describe("Transition test with non blocking and fencing commit and make sure commit of "
-		       "disabled plane has to complete before atomic commit on that plane");
-	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind-fencing") {
-		for_each_pipe_with_valid_output(&data.display, pipe, output) {
-			if (pipe_count == 2 * count && !data.extended)
-				break;
-			pipe_count++;
-			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&data, pipe, output, TRANSITION_AFTER_FREE, true, true);
-			test_cleanup(&data, pipe, output, true);
-		}
-		pipe_count = 0;
-	}
-
-	/*
-	 * Test modeset cases on internal panels separately with a reduced
-	 * number of combinations, to avoid long runtimes due to modesets on
-	 * panels with long power cycle delays.
-	 */
-	igt_describe("Modeset test for all plane combinations");
-	igt_subtest_with_dynamic("plane-all-modeset-transition") {
-		for_each_pipe_with_valid_output(&data.display, pipe, output) {
-			if (pipe_count == 2 * count && !data.extended)
-				break;
-			pipe_count++;
-			if (output_is_internal_panel(output))
-				continue;
-
-			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&data, pipe, output, TRANSITION_MODESET, false, false);
-			test_cleanup(&data, pipe, output, false);
-		}
-		pipe_count = 0;
-	}
-
-	igt_describe("Modeset test for all plane combinations with fencing commit");
-	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing") {
-		for_each_pipe_with_valid_output(&data.display, pipe, output) {
-			if (pipe_count == 2 * count && !data.extended)
-				break;
-			pipe_count++;
-			if (output_is_internal_panel(output))
-				continue;
-
-			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&data, pipe, output, TRANSITION_MODESET, false, true);
-			test_cleanup(&data, pipe, output, true);
-		}
-		pipe_count = 0;
-	}
-
-	igt_describe("Modeset test for all plane combinations on internal panels");
-	igt_subtest_with_dynamic("plane-all-modeset-transition-internal-panels") {
-		for_each_pipe_with_valid_output(&data.display, pipe, output) {
-			if (pipe_count == 2 * count && !data.extended)
-				break;
-			pipe_count++;
-			if (!output_is_internal_panel(output))
-				continue;
-
-			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&data, pipe, output, TRANSITION_MODESET_FAST, false, false);
-			test_cleanup(&data, pipe, output, false);
-		}
+	igt_subtest_with_dynamic("plane-primary-toggle-with-vblank-wait") {
 		pipe_count = 0;
-	}
 
-	igt_describe("Modeset test for all plane combinations on internal panels with fencing commit");
-	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing-internal-panels") {
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended)
 				break;
-			pipe_count++;
-			if (!output_is_internal_panel(output))
-				continue;
-
-			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&data, pipe, output, TRANSITION_MODESET_FAST, false, true);
-			test_cleanup(&data, pipe, output, true);
-		}
-		pipe_count = 0;
-	}
 
-	igt_describe("Check toggling and modeset transition on plane");
-	igt_subtest("plane-toggle-modeset-transition") {
-		for_each_pipe_with_valid_output(&data.display, pipe, output) {
-			if (pipe_count == 2 * count && !data.extended)
-				break;
 			pipe_count++;
-			run_transition_test(&data, pipe, output, TRANSITION_MODESET_DISABLE, false, false);
-			test_cleanup(&data, pipe, output, false);
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
+				run_primary_test(&data, pipe, output);
 		}
-		pipe_count = 0;
 	}
 
-	igt_describe("Modeset transition tests for combinations of crtc enabled");
-	igt_subtest_with_dynamic("modeset-transition") {
-		for (i = 1; i <= count; i++) {
-			igt_dynamic_f("%ix-outputs", i)
-				run_modeset_transition(&data, i, false, false);
-		}
-	}
+	for (i = 0; i < ARRAY_SIZE(transition_tests); i++) {
+		igt_describe(transition_tests[i].desc);
+		igt_subtest_with_dynamic_f("%s", transition_tests[i].name) {
+			pipe_count = 0;
+
+			for_each_pipe_with_valid_output(&data.display, pipe, output) {
+				/*
+				 * Test modeset cases on internal panels separately with a reduced
+				 * number of combinations, to avoid long runtimes due to modesets on
+				 * panels with long power cycle delays.
+				 */
+				if (((transition_tests[i].type == TRANSITION_MODESET) ||
+				     (transition_tests[i].type == TRANSITION_MODESET_FAST)) &&
+				    output_is_internal_panel(output))
+					continue;
 
-	igt_describe("Modeset transition tests for combinations of crtc enabled with nonblocking commit");
-	igt_subtest_with_dynamic("modeset-transition-nonblocking") {
-		for (i = 1; i <= count; i++) {
-			igt_dynamic_f("%ix-outputs", i)
-				run_modeset_transition(&data, i, true, false);
-		}
-	}
+				if (pipe_count == 2 * count && !data.extended)
+					break;
 
-	igt_describe("Modeset transition tests for combinations of crtc enabled with fencing commit");
-	igt_subtest_with_dynamic("modeset-transition-fencing") {
-		for (i = 1; i <= count; i++) {
-			igt_dynamic_f("%ix-outputs", i)
-				run_modeset_transition(&data, i, false, true);
+				pipe_count++;
+				igt_dynamic_f("pipe-%s-%s",
+					      kmstest_pipe_name(pipe),
+					      igt_output_name(output)) {
+					run_transition_test(&data, pipe, output,
+							    transition_tests[i].type,
+							    transition_tests[i].nonblocking,
+							    transition_tests[i].fencing);
+
+					test_cleanup(&data, pipe, output,
+						     transition_tests[i].fencing);
+				}
+			}
 		}
 	}
 
-	igt_describe("Modeset transition tests for combinations of crtc enabled with nonblocking &"
-		       " fencing commit");
-	igt_subtest_with_dynamic("modeset-transition-nonblocking-fencing") {
-		for (i = 1; i <= count; i++) {
-			igt_dynamic_f("%ix-outputs", i)
-				run_modeset_transition(&data, i, true, true);
+	for (i = 0; i < ARRAY_SIZE(modeset_tests); i++) {
+		igt_describe_f("%s", modeset_tests[i].desc);
+		igt_subtest_with_dynamic_f("%s", modeset_tests[i].name) {
+			for (j = 1; j <= count; j++) {
+				run_modeset_transition(&data, j,
+						       modeset_tests[i].nonblocking,
+						       modeset_tests[i].fencing);
+			}
 		}
 	}
 
-- 
2.35.1
