Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632DD6E0ED
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2020 13:40:47 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue,  9 Jun 2020 16:40:33 +0300
Message-Id: <20200609134033.29883-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] kms_atomic_transition: Avoid duplicate
 dynamic subtest names
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

In commit b943d64f95bc ("kms_atomic_transition: Make the available
pipe discovery dynamic") the subtests of kms_atomic_transition were
split into dynamic subtests. What avoided scrutiny however was that
the looping uses for_each_pipe_with_valid_output, which gives you
every valid pipe/output combo, so just using the pipe name as the
dynamic subtest name causes duplicates, resulting in weird CI results.

As the nature of the original test was a stress test for watermarks,
keep the full combo rather than switching to
for_each_pipe_with_single_output, but use the output name as well in
the dynamic subtest name.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/kms_atomic_transition.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index d28a8cdf..754a4969 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -926,42 +926,42 @@ igt_main
 
 	igt_subtest_with_dynamic("plane-all-transition") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
-			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&display, pipe, output, TRANSITION_PLANES, false, false);
 		}
 	}
 
 	igt_subtest_with_dynamic("plane-all-transition-fencing") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
-			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&display, pipe, output, TRANSITION_PLANES, false, true);
 		}
 	}
 
 	igt_subtest_with_dynamic("plane-all-transition-nonblocking") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
-			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&display, pipe, output, TRANSITION_PLANES, true, false);
 		}
 	}
 
 	igt_subtest_with_dynamic("plane-all-transition-nonblocking-fencing") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
-			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&display, pipe, output, TRANSITION_PLANES, true, true);
 		}
 	}
 
 	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
-			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&display, pipe, output, TRANSITION_AFTER_FREE, true, false);
 		}
 	}
 
 	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind-fencing") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
-			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&display, pipe, output, TRANSITION_AFTER_FREE, true, true);
 		}
 	}
@@ -976,7 +976,7 @@ igt_main
 			if (output_is_internal_panel(output))
 				continue;
 
-			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&display, pipe, output, TRANSITION_MODESET, false, false);
 		}
 
@@ -985,7 +985,7 @@ igt_main
 			if (output_is_internal_panel(output))
 				continue;
 
-			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&display, pipe, output, TRANSITION_MODESET, false, true);
 		}
 
@@ -994,7 +994,7 @@ igt_main
 			if (!output_is_internal_panel(output))
 				continue;
 
-			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&display, pipe, output, TRANSITION_MODESET_FAST, false, false);
 		}
 	}
@@ -1004,7 +1004,7 @@ igt_main
 			if (!output_is_internal_panel(output))
 				continue;
 
-			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&display, pipe, output, TRANSITION_MODESET_FAST, false, true);
 		}
 	}
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
