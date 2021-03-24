Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F199889AB2
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Mar 2021 08:14:17 +0000 (UTC)
From: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Date: Wed, 24 Mar 2021 13:44:41 +0530
Message-Id: <20210324081441.1084322-1-arundhati.hagaragi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Add plane scaling
 test descriptions for subtests
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
Cc: Khajapasha Mohammed <mohammed.khajapasha@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Add plane scaling test descriptions for subtests.
Plane scaling with tiling rotation, pixel formats, overlay planes and with
clipping and clamping

Signed-off-by: Arundhati Hagaragi <arundhati.hagaragi@intel.com>
Cc: Khajapasha Mohammed <mohammed.khajapasha@intel.com>
---
 tests/kms_plane_scaling.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index c63eb428..941f3e54 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -694,24 +694,28 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	igt_subtest_group {
 		igt_output_t *output;
 
+		igt_describe("Test plane scaling with overlay planes");
 		igt_subtest_with_dynamic("plane-scaling") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-plane-scaling", kmstest_pipe_name(pipe))
 					test_plane_scaling_on_pipe(&data, pipe, output);
 		}
 
+		igt_describe("Test plane scaling with pixel formats");
 		igt_subtest_with_dynamic("scaler-with-pixel-format") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-scaler-with-pixel-format", kmstest_pipe_name(pipe))
 					test_scaler_with_pixel_format_pipe(&data, pipe, output);
 		}
 
+		igt_describe("Test plane scaling with rotation");
 		igt_subtest_with_dynamic("scaler-with-rotation") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-scaler-with-rotation", kmstest_pipe_name(pipe))
 					test_scaler_with_rotation_pipe(&data, pipe, output);
 		}
 
+		igt_describe("Test plane scaling with clipping and clamping");
 		igt_subtest_with_dynamic("scaler-with-clipping-clamping") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-scaler-with-clipping-clamping", kmstest_pipe_name(pipe))
@@ -719,6 +723,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
+	igt_describe("Test to display planes on connected pipes and runs scaling test on it");
 	igt_subtest_f("2x-scaler-multi-pipe")
 		test_scaler_with_multi_pipe_plane(&data);
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
