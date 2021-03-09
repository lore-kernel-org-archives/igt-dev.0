Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2605F6E8B5
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Mar 2021 08:50:34 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Tue,  9 Mar 2021 14:20:31 +0530
Message-Id: <20210309085031.1389207-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20210308120009.1323272-1-arundhati.hagaragi@intel.com>
References: <20210308120009.1323272-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v7] tests/kms_plane_scaling: Add plane
 scaling test descriptions for subtests
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
Cc: Khajapasha Mohammed <Mohammed.Khajapasha@intel.com>, Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Nidhi Gupta <nidhi1.gupta@intel.com>

Add plane scaling test descriptions for subtests.
Plane scaling with tiling rotation, pixel formats, overlay planes and with
clipping and clamping

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
Cc: Khajapasha Mohammed <Mohammed.Khajapasha@intel.com>

v1-v7 : Review Comments (Khaja)
---
 tests/kms_plane_scaling.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index c63eb428..6702f768 100644
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
+			igt_describe("Test plane scaling with clipping-clamping");
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
