Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EC86E825
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Mar 2021 06:42:11 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
Date: Tue, 23 Mar 2021 11:46:39 +0530
Message-Id: <20210323061639.26460-3-karthik.b.s@intel.com>
In-Reply-To: <20210323061639.26460-1-karthik.b.s@intel.com>
References: <20210323061639.26460-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_atomic_transition: Reset the
 pipe_count variable
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
Cc: kunal1.joshi@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

The pipe_count variable is not being reset after every subtest.
This is not causing any issue when running the subtests individually,
but when running the full test only the first subtest runs
and all the other subtests get skipped.

To fix this, reset the pipe_count variable after every subtest.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_atomic_transition.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 90df7e33..431824d0 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1002,7 +1002,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	}
 
 	igt_describe("Check toggling of primary plane with vblank");
-	igt_subtest("plane-primary-toggle-with-vblank-wait")
+	igt_subtest("plane-primary-toggle-with-vblank-wait") {
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended)
 				break;
@@ -1010,6 +1010,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			run_primary_test(&data, pipe, output);
 
 		}
+		pipe_count = 0;
+	}
 
 	igt_describe("Transition test for all plane combinations");
 	igt_subtest_with_dynamic("plane-all-transition") {
@@ -1021,6 +1023,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				run_transition_test(&data, pipe, output, TRANSITION_PLANES, false, false);
 			test_cleanup(&data, pipe, output, false);
 		}
+		pipe_count = 0;
 	}
 
 	igt_describe("Transition test for all plane combinations with fencing commit");
@@ -1033,6 +1036,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				run_transition_test(&data, pipe, output, TRANSITION_PLANES, false, true);
 			test_cleanup(&data, pipe, output, true);
 		}
+		pipe_count = 0;
 	}
 
 	igt_describe("Transition test for all plane combinations with nonblocking commit");
@@ -1045,6 +1049,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				run_transition_test(&data, pipe, output, TRANSITION_PLANES, true, false);
 			test_cleanup(&data, pipe, output, false);
 		}
+		pipe_count = 0;
 	}
 
 	igt_describe("Transition test for all plane combinations with nonblocking and fencing commit");
@@ -1057,6 +1062,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				run_transition_test(&data, pipe, output, TRANSITION_PLANES, true, true);
 			test_cleanup(&data, pipe, output, true);
 		}
+		pipe_count = 0;
 	}
 
 	igt_describe("Transition test with non blocking commit and make sure commit of disabled plane has "
@@ -1070,6 +1076,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				run_transition_test(&data, pipe, output, TRANSITION_AFTER_FREE, true, false);
 			test_cleanup(&data, pipe, output, false);
 		}
+		pipe_count = 0;
 	}
 
 	igt_describe("Transition test with non blocking and fencing commit and make sure commit of "
@@ -1083,6 +1090,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				run_transition_test(&data, pipe, output, TRANSITION_AFTER_FREE, true, true);
 			test_cleanup(&data, pipe, output, true);
 		}
+		pipe_count = 0;
 	}
 
 	/*
@@ -1091,7 +1099,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	 * panels with long power cycle delays.
 	 */
 	igt_describe("Modeset test for all plane combinations");
-	igt_subtest_with_dynamic("plane-all-modeset-transition")
+	igt_subtest_with_dynamic("plane-all-modeset-transition") {
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended)
 				break;
@@ -1103,9 +1111,11 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				run_transition_test(&data, pipe, output, TRANSITION_MODESET, false, false);
 			test_cleanup(&data, pipe, output, false);
 		}
+		pipe_count = 0;
+	}
 
 	igt_describe("Modeset test for all plane combinations with fencing commit");
-	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing")
+	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing") {
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended)
 				break;
@@ -1117,6 +1127,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				run_transition_test(&data, pipe, output, TRANSITION_MODESET, false, true);
 			test_cleanup(&data, pipe, output, true);
 		}
+		pipe_count = 0;
+	}
 
 	igt_describe("Modeset test for all plane combinations on internal panels");
 	igt_subtest_with_dynamic("plane-all-modeset-transition-internal-panels") {
@@ -1131,6 +1143,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				run_transition_test(&data, pipe, output, TRANSITION_MODESET_FAST, false, false);
 			test_cleanup(&data, pipe, output, false);
 		}
+		pipe_count = 0;
 	}
 
 	igt_describe("Modeset test for all plane combinations on internal panels with fencing commit");
@@ -1146,10 +1159,11 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				run_transition_test(&data, pipe, output, TRANSITION_MODESET_FAST, false, true);
 			test_cleanup(&data, pipe, output, true);
 		}
+		pipe_count = 0;
 	}
 
 	igt_describe("Check toggling and modeset transition on plane");
-	igt_subtest("plane-toggle-modeset-transition")
+	igt_subtest("plane-toggle-modeset-transition") {
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended)
 				break;
@@ -1157,6 +1171,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			run_transition_test(&data, pipe, output, TRANSITION_MODESET_DISABLE, false, false);
 			test_cleanup(&data, pipe, output, false);
 		}
+		pipe_count = 0;
+	}
 
 	igt_describe("Modeset transition tests for combinations of crtc enabled");
 	igt_subtest_with_dynamic("modeset-transition") {
-- 
2.22.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
