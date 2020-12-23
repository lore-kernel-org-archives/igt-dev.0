Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1E889DCF
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Dec 2020 12:34:59 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Wed, 23 Dec 2020 18:13:17 +0530
Message-Id: <20201223124317.20676-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling:added test
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
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_plane_scaling.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 89b82416..38abb5f5 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -695,32 +695,42 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_output_t *output;
 
 		igt_subtest_with_dynamic("plane-scaling") {
+			igt_describe("The test intend to test plane scaling with overlay planes");
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-plane-scaling", kmstest_pipe_name(pipe))
 					test_plane_scaling_on_pipe(&data, pipe, output);
 		}
 
 		igt_subtest_with_dynamic("scaler-with-pixel-format") {
+			igt_describe("The test intend to check plane scaling in combination with pixel"
+				     "formats");
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-scaler-with-pixel-format", kmstest_pipe_name(pipe))
 					test_scaler_with_pixel_format_pipe(&data, pipe, output);
 		}
 
 		igt_subtest_with_dynamic("scaler-with-rotation") {
+			igt_describe("The test intend to check plane scaling in combination with"
+				     "rotation");
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-scaler-with-rotation", kmstest_pipe_name(pipe))
 					test_scaler_with_rotation_pipe(&data, pipe, output);
 		}
 
 		igt_subtest_with_dynamic("scaler-with-clipping-clamping") {
+			igt_describe("The test intend to check plane scale in combination with"
+				     "clipping-clamping");
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-scaler-with-clipping-clamping", kmstest_pipe_name(pipe))
 					test_scaler_with_clipping_clamping_scenario(&data, pipe, output);
 		}
 	}
 
-	igt_subtest_f("2x-scaler-multi-pipe")
+	igt_subtest_f("2x-scaler-multi-pipe") {
+		igt_describe("Test intend to display primary and overlay planes on two connected pipes"
+			     "and runs the plane scaling tests on both the pipes");
 		test_scaler_with_multi_pipe_plane(&data);
+	}
 
 	igt_fixture
 		igt_display_fini(&data.display);
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
