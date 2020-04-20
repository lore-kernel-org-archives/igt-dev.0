Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5136E598
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2020 14:03:43 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 20 Apr 2020 15:03:12 +0100
Message-Id: <20200420140312.3401290-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] kms_atomic_transition: Make the available
 pipe discovery dynamic
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
Cc: Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

All of the per-plane tests are run on all available matching pipes. A
natural case for igt_subtest_with_dynamic + igt_dynamic_f

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 tests/kms_atomic_transition.c | 86 +++++++++++++++++++++--------------
 1 file changed, 52 insertions(+), 34 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 44f01109d..d28a8cdf5 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -924,71 +924,89 @@ igt_main
 		for_each_pipe_with_valid_output(&display, pipe, output)
 			run_primary_test(&display, pipe, output);
 
-	igt_subtest("plane-all-transition")
-		for_each_pipe_with_valid_output(&display, pipe, output)
-			run_transition_test(&display, pipe, output, TRANSITION_PLANES, false, false);
+	igt_subtest_with_dynamic("plane-all-transition") {
+		for_each_pipe_with_valid_output(&display, pipe, output) {
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+				run_transition_test(&display, pipe, output, TRANSITION_PLANES, false, false);
+		}
+	}
 
-	igt_subtest("plane-all-transition-fencing")
-		for_each_pipe_with_valid_output(&display, pipe, output)
-			run_transition_test(&display, pipe, output, TRANSITION_PLANES, false, true);
+	igt_subtest_with_dynamic("plane-all-transition-fencing") {
+		for_each_pipe_with_valid_output(&display, pipe, output) {
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+				run_transition_test(&display, pipe, output, TRANSITION_PLANES, false, true);
+		}
+	}
 
-	igt_subtest("plane-all-transition-nonblocking")
-		for_each_pipe_with_valid_output(&display, pipe, output)
-			run_transition_test(&display, pipe, output, TRANSITION_PLANES, true, false);
+	igt_subtest_with_dynamic("plane-all-transition-nonblocking") {
+		for_each_pipe_with_valid_output(&display, pipe, output) {
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+				run_transition_test(&display, pipe, output, TRANSITION_PLANES, true, false);
+		}
+	}
 
-	igt_subtest("plane-all-transition-nonblocking-fencing")
-		for_each_pipe_with_valid_output(&display, pipe, output)
-			run_transition_test(&display, pipe, output, TRANSITION_PLANES, true, true);
+	igt_subtest_with_dynamic("plane-all-transition-nonblocking-fencing") {
+		for_each_pipe_with_valid_output(&display, pipe, output) {
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+				run_transition_test(&display, pipe, output, TRANSITION_PLANES, true, true);
+		}
+	}
 
-	igt_subtest("plane-use-after-nonblocking-unbind")
-		for_each_pipe_with_valid_output(&display, pipe, output)
-			run_transition_test(&display, pipe, output, TRANSITION_AFTER_FREE, true, false);
+	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind") {
+		for_each_pipe_with_valid_output(&display, pipe, output) {
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+				run_transition_test(&display, pipe, output, TRANSITION_AFTER_FREE, true, false);
+		}
+	}
 
-	igt_subtest("plane-use-after-nonblocking-unbind-fencing")
-		for_each_pipe_with_valid_output(&display, pipe, output)
-			run_transition_test(&display, pipe, output, TRANSITION_AFTER_FREE, true, true);
+	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind-fencing") {
+		for_each_pipe_with_valid_output(&display, pipe, output) {
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+				run_transition_test(&display, pipe, output, TRANSITION_AFTER_FREE, true, true);
+		}
+	}
 
 	/*
 	 * Test modeset cases on internal panels separately with a reduced
 	 * number of combinations, to avoid long runtimes due to modesets on
 	 * panels with long power cycle delays.
 	 */
-	igt_subtest("plane-all-modeset-transition")
+	igt_subtest_with_dynamic("plane-all-modeset-transition")
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			if (output_is_internal_panel(output))
 				continue;
-			run_transition_test(&display, pipe, output, TRANSITION_MODESET, false, false);
+
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+				run_transition_test(&display, pipe, output, TRANSITION_MODESET, false, false);
 		}
 
-	igt_subtest("plane-all-modeset-transition-fencing")
+	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing")
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			if (output_is_internal_panel(output))
 				continue;
-			run_transition_test(&display, pipe, output, TRANSITION_MODESET, false, true);
-		}
 
-	igt_subtest("plane-all-modeset-transition-internal-panels") {
-		int tested = 0;
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+				run_transition_test(&display, pipe, output, TRANSITION_MODESET, false, true);
+		}
 
+	igt_subtest_with_dynamic("plane-all-modeset-transition-internal-panels") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			if (!output_is_internal_panel(output))
 				continue;
-			run_transition_test(&display, pipe, output, TRANSITION_MODESET_FAST, false, false);
-			tested++;
+
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+				run_transition_test(&display, pipe, output, TRANSITION_MODESET_FAST, false, false);
 		}
-		igt_skip_on_f(!tested, "No output with internal panel found\n");
 	}
 
-	igt_subtest("plane-all-modeset-transition-fencing-internal-panels") {
-		int tested = 0;
-
+	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing-internal-panels") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
 			if (!output_is_internal_panel(output))
 				continue;
-			run_transition_test(&display, pipe, output, TRANSITION_MODESET_FAST, false, true);
-			tested++;
+
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+				run_transition_test(&display, pipe, output, TRANSITION_MODESET_FAST, false, true);
 		}
-		igt_skip_on_f(!tested, "No output with internal panel found\n");
 	}
 
 	igt_subtest("plane-toggle-modeset-transition")
-- 
2.26.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
