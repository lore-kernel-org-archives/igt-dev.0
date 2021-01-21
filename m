Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB6E6E904
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Jan 2021 19:32:25 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Fri, 22 Jan 2021 01:02:43 +0530
Message-Id: <20210121193243.1479242-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_atomic_transition:Add subtest
 description
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

Added description for all subtests

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
---
 tests/kms_atomic_transition.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 02206f0a..3e37435c 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -934,10 +934,12 @@ igt_main
 			count++;
 	}
 
+	igt_describe("Check toggling of primary plane with vblank");
 	igt_subtest("plane-primary-toggle-with-vblank-wait")
 		for_each_pipe_with_valid_output(&display, pipe, output)
 			run_primary_test(&display, pipe, output);
 
+	igt_describe("Transition test for all plane combinations");
 	igt_subtest_with_dynamic("plane-all-transition") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
@@ -945,6 +947,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Transition test for all plane combinations with fencing commit");
 	igt_subtest_with_dynamic("plane-all-transition-fencing") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
@@ -952,6 +955,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Transition test for all plane combinations with nonblocking commit");
 	igt_subtest_with_dynamic("plane-all-transition-nonblocking") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
@@ -959,6 +963,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Transition test for all plane combinations with nonblocking and fencing commit");
 	igt_subtest_with_dynamic("plane-all-transition-nonblocking-fencing") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
@@ -966,6 +971,8 @@ igt_main
 		}
 	}
 
+	igt_describe("Transition test with non blocking commit and make sure commit of disabled plane"
+			"has to complete before atomic commit on that plane");
 	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
@@ -973,6 +980,8 @@ igt_main
 		}
 	}
 
+	igt_describe("Transition test with non blocking and fencing commit and make sure commit of disabled plane"
+			"has to complete before atomic commit on that plane");
 	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind-fencing") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
@@ -985,6 +994,7 @@ igt_main
 	 * number of combinations, to avoid long runtimes due to modesets on
 	 * panels with long power cycle delays.
 	 */
+	igt_describe("Modeset test for all plane combinations");
 	igt_subtest_with_dynamic("plane-all-modeset-transition")
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			if (output_is_internal_panel(output))
@@ -994,6 +1004,7 @@ igt_main
 				run_transition_test(&display, pipe, output, TRANSITION_MODESET, false, false);
 		}
 
+	igt_describe("Modeset test for all plane combinations with fencing commit");
 	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing")
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			if (output_is_internal_panel(output))
@@ -1003,6 +1014,7 @@ igt_main
 				run_transition_test(&display, pipe, output, TRANSITION_MODESET, false, true);
 		}
 
+	igt_describe("Modeset test for all plane combinations on internal panels");
 	igt_subtest_with_dynamic("plane-all-modeset-transition-internal-panels") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			if (!output_is_internal_panel(output))
@@ -1013,6 +1025,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Modeset test for all plane combinations on internal panels with fencing commit");
 	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing-internal-panels") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			if (!output_is_internal_panel(output))
@@ -1023,10 +1036,12 @@ igt_main
 		}
 	}
 
+	igt_describe("Check toggling and modeset transition on plane");
 	igt_subtest("plane-toggle-modeset-transition")
 		for_each_pipe_with_valid_output(&display, pipe, output)
 			run_transition_test(&display, pipe, output, TRANSITION_MODESET_DISABLE, false, false);
 
+	igt_describe("Modeset transition tests for combinations of crtc enabled");
 	igt_subtest_with_dynamic("modeset-transition") {
 		for (i = 1; i <= count; i++) {
 			igt_dynamic_f("%ix-outputs", i)
@@ -1034,6 +1049,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Modeset transition tests for combinations of crtc enabled with nonblocking commit");
 	igt_subtest_with_dynamic("modeset-transition-nonblocking") {
 		for (i = 1; i <= count; i++) {
 			igt_dynamic_f("%ix-outputs", i)
@@ -1041,6 +1057,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Modeset transition tests for combinations of crtc enabled with fencing commit");
 	igt_subtest_with_dynamic("modeset-transition-fencing") {
 		for (i = 1; i <= count; i++) {
 			igt_dynamic_f("%ix-outputs", i)
@@ -1048,6 +1065,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Modeset transition tests for combinations of crtc enabled with nonblocking and commit");
 	igt_subtest_with_dynamic("modeset-transition-nonblocking-fencing") {
 		for (i = 1; i <= count; i++) {
 			igt_dynamic_f("%ix-outputs", i)
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
