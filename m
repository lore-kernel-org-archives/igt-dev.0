Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35D66E043
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Feb 2021 02:52:13 +0000 (UTC)
From: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
Date: Fri, 26 Feb 2021 02:52:10 +0000
Message-ID: <3994960cbc7145ec8535145a021e2e91@intel.com>
References: <20210219090037.655641-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210219090037.655641-1-arundhati.hagaragi@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_atomic_transition:Add
 subtest description
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
To: "Hagaragi, Arundhati" <arundhati.hagaragi@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

LGTM
Reviewed-by: Nidhi Gupta

-----Original Message-----
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com> 
Sent: Friday, February 19, 2021 2:31 PM
To: igt-dev@lists.freedesktop.org
Cc: Hagaragi, Arundhati <arundhati.hagaragi@intel.com>; Gupta; Gupta, Nidhi1 <nidhi1.gupta@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_atomic_transition:Add subtest description

Added description for all subtests

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
---
 tests/kms_atomic_transition.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c index e75cc637..9689bf4d 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -993,6 +993,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			count++;
 	}
 
+	igt_describe("Check toggling of primary plane with vblank");
 	igt_subtest("plane-primary-toggle-with-vblank-wait")
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended) @@ -1002,6 +1003,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 		}
 
+	igt_describe("Transition test for all plane combinations");
 	igt_subtest_with_dynamic("plane-all-transition") {
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended) @@ -1012,6 +1014,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
+	igt_describe("Transition test for all plane combinations with fencing 
+commit");
 	igt_subtest_with_dynamic("plane-all-transition-fencing") {
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended) @@ -1022,6 +1025,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
+	igt_describe("Transition test for all plane combinations with 
+nonblocking commit");
 	igt_subtest_with_dynamic("plane-all-transition-nonblocking") {
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended) @@ -1032,6 +1036,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
+	igt_describe("Transition test for all plane combinations with 
+nonblocking and fencing commit");
 	igt_subtest_with_dynamic("plane-all-transition-nonblocking-fencing") {
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended) @@ -1042,6 +1047,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
+	igt_describe("Transition test with non blocking commit and make sure commit of disabled plane has "
+		       "to complete before atomic commit on that plane");
 	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind") {
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended) @@ -1052,6 +1059,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
+	igt_describe("Transition test with non blocking and fencing commit and make sure commit of "
+		       "disabled plane has to complete before atomic commit on that 
+plane");
 	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind-fencing") {
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended) @@ -1067,6 +1076,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	 * number of combinations, to avoid long runtimes due to modesets on
 	 * panels with long power cycle delays.
 	 */
+	igt_describe("Modeset test for all plane combinations");
 	igt_subtest_with_dynamic("plane-all-modeset-transition")
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended) @@ -1079,6 +1089,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				run_transition_test(&data, pipe, output, TRANSITION_MODESET, false, false);
 		}
 
+	igt_describe("Modeset test for all plane combinations with fencing 
+commit");
 	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing")
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended) @@ -1091,6 +1102,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				run_transition_test(&data, pipe, output, TRANSITION_MODESET, false, true);
 		}
 
+	igt_describe("Modeset test for all plane combinations on internal 
+panels");
 	igt_subtest_with_dynamic("plane-all-modeset-transition-internal-panels") {
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended) @@ -1104,6 +1116,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
+	igt_describe("Modeset test for all plane combinations on internal 
+panels with fencing commit");
 	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing-internal-panels") {
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended) @@ -1117,6 +1130,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
+	igt_describe("Check toggling and modeset transition on plane");
 	igt_subtest("plane-toggle-modeset-transition")
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			if (pipe_count == 2 * count && !data.extended) @@ -1125,6 +1139,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			run_transition_test(&data, pipe, output, TRANSITION_MODESET_DISABLE, false, false);
 		}
 
+	igt_describe("Modeset transition tests for combinations of crtc 
+enabled");
 	igt_subtest_with_dynamic("modeset-transition") {
 		for (i = 1; i <= count; i++) {
 			igt_dynamic_f("%ix-outputs", i)
@@ -1132,6 +1147,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
+	igt_describe("Modeset transition tests for combinations of crtc 
+enabled with nonblocking commit");
 	igt_subtest_with_dynamic("modeset-transition-nonblocking") {
 		for (i = 1; i <= count; i++) {
 			igt_dynamic_f("%ix-outputs", i)
@@ -1139,6 +1155,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
+	igt_describe("Modeset transition tests for combinations of crtc 
+enabled with fencing commit");
 	igt_subtest_with_dynamic("modeset-transition-fencing") {
 		for (i = 1; i <= count; i++) {
 			igt_dynamic_f("%ix-outputs", i)
@@ -1146,6 +1163,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
+	igt_describe("Modeset transition tests for combinations of crtc enabled with nonblocking &"
+		       " fencing commit");
 	igt_subtest_with_dynamic("modeset-transition-nonblocking-fencing") {
 		for (i = 1; i <= count; i++) {
 			igt_dynamic_f("%ix-outputs", i)
--
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
