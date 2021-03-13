Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278CB898BE
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Mar 2021 20:05:57 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Sat, 13 Mar 2021 12:05:49 -0800
Message-Id: <20210313200549.16973-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] Revert "tests/kms_plane_scaling: Add plane
 scaling test descriptions for subtests"
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This reverts commit b0c056b3513e58332887dc50847f359da3e74e53.

Tests are failing with the following signature due to this commit:

Starting subtest: plane-scaling
documenting dynamic subsubtests is impossible, document the subtest instead.please refer to lib/igt_core documentation
kms_plane_scaling: ../lib/igt_core.c:359: internal_assert: Assertion `0' failed.
Received signal SIGABRT.
Stack trace:
 #0 [fatal_sig_handler+0xd6]
 #1 [killpg+0x40]
 #2 [gsignal+0xc7]
 #3 [abort+0x141]
 #4 [uselocale+0x33a]
 #5 [__assert_fail+0x42]
 #6 [internal_assert+0x101]
 #7 [igt_describe_f+0x95]
 #8 [__real_main704+0xa45]
 #9 [main+0x3f]
 #10 [__libc_start_main+0xe7]
 #11 [_start+0x2a]

Cc: Petri Latvala <petri.latvala@intel.com>
Reported-by: Jani Saarinen <jani.saarinen@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/kms_plane_scaling.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index e8bf78e776..c63eb428f2 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -695,38 +695,32 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_output_t *output;
 
 		igt_subtest_with_dynamic("plane-scaling") {
-			igt_describe("Test plane scaling with overlay planes");
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-plane-scaling", kmstest_pipe_name(pipe))
 					test_plane_scaling_on_pipe(&data, pipe, output);
 		}
 
 		igt_subtest_with_dynamic("scaler-with-pixel-format") {
-			igt_describe("Test plane scaling with pixel formats");
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-scaler-with-pixel-format", kmstest_pipe_name(pipe))
 					test_scaler_with_pixel_format_pipe(&data, pipe, output);
 		}
 
 		igt_subtest_with_dynamic("scaler-with-rotation") {
-			igt_describe("Test plane scaling with rotation");
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-scaler-with-rotation", kmstest_pipe_name(pipe))
 					test_scaler_with_rotation_pipe(&data, pipe, output);
 		}
 
 		igt_subtest_with_dynamic("scaler-with-clipping-clamping") {
-			igt_describe("Test plane scaling with clipping-clamping");
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-scaler-with-clipping-clamping", kmstest_pipe_name(pipe))
 					test_scaler_with_clipping_clamping_scenario(&data, pipe, output);
 		}
 	}
 
-	igt_subtest_f("2x-scaler-multi-pipe") {
-		igt_describe("Test multi plane scaling with connected outputs for pipes");
+	igt_subtest_f("2x-scaler-multi-pipe")
 		test_scaler_with_multi_pipe_plane(&data);
-	}
 
 	igt_fixture
 		igt_display_fini(&data.display);
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
