Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0E56E0EE
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Mar 2021 12:00:08 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Mon,  8 Mar 2021 17:30:09 +0530
Message-Id: <20210308120009.1323272-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6] tests/kms_plane_scaling:added test
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
Cc: Mohammed <Mohammed.Khajapasha@intel.com>, Nidhi Gupta <nidhi1.gupta@intel.com>, Khajapasha@freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Nidhi Gupta <nidhi1.gupta@intel.com>

Add plane scaling test descriptions for subtests

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
Cc: Khajapasha, Mohammed <Mohammed.Khajapasha@intel.com>

v2: Modified description for subtests. (Khajapasha)
v3: Removed "the" from each subtest description (Khajapasha)
v4, v5: modified description to be generic. (Khajapasha)
v6: Modified description to be specific (Khajapasha)
---
 tests/kms_plane_scaling.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index c63eb428..b0d4dcf6 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -695,32 +695,38 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_output_t *output;
 
 		igt_subtest_with_dynamic("plane-scaling") {
+			igt_describe("Test plane scaling with overlay planes");
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-plane-scaling", kmstest_pipe_name(pipe))
 					test_plane_scaling_on_pipe(&data, pipe, output);
 		}
 
 		igt_subtest_with_dynamic("scaler-with-pixel-format") {
+			igt_describe("Test plane scaling with pixel formats");
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-scaler-with-pixel-format", kmstest_pipe_name(pipe))
 					test_scaler_with_pixel_format_pipe(&data, pipe, output);
 		}
 
 		igt_subtest_with_dynamic("scaler-with-rotation") {
+			igt_describe("Test plane scaling with rotation");
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-scaler-with-rotation", kmstest_pipe_name(pipe))
 					test_scaler_with_rotation_pipe(&data, pipe, output);
 		}
 
 		igt_subtest_with_dynamic("scaler-with-clipping-clamping") {
+			igt_describe("Test plane scaling with  clipping-clamping");
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-scaler-with-clipping-clamping", kmstest_pipe_name(pipe))
 					test_scaler_with_clipping_clamping_scenario(&data, pipe, output);
 		}
 	}
 
-	igt_subtest_f("2x-scaler-multi-pipe")
+	igt_subtest_f("2x-scaler-multi-pipe") {
+		igt_describe("Test to display planes on connected pipes and runs scaling test on it");
 		test_scaler_with_multi_pipe_plane(&data);
+	}
 
 	igt_fixture
 		igt_display_fini(&data.display);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
