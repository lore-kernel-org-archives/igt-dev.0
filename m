Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE8910E661
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Feb 2022 05:36:37 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Tue,  8 Feb 2022 11:20:32 +0530
Message-Id: <20220208055039.31306-3-swati2.sharma@intel.com>
In-Reply-To: <20220208055039.31306-1-swati2.sharma@intel.com>
References: <20220208055039.31306-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 2/9] tests/kms_plane_scaling: Add output name in
 dynamic subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 4e2be7f2..1cf62841 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -550,21 +550,21 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_describe("Tests scaling with pixel formats.");
 		igt_subtest_with_dynamic("scaler-with-pixel-format") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-scaler-with-pixel-format", kmstest_pipe_name(pipe))
+				igt_dynamic_f("pipe-%s-%s-scaler-with-pixel-format", kmstest_pipe_name(pipe), igt_output_name(output))
 					test_scaler_with_pixel_format_pipe(&data, pipe, output);
 		}
 
 		igt_describe("Tests scaling with tiling rotation.");
 		igt_subtest_with_dynamic("scaler-with-rotation") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-scaler-with-rotation", kmstest_pipe_name(pipe))
+				igt_dynamic_f("pipe-%s-%s-scaler-with-rotation", kmstest_pipe_name(pipe), igt_output_name(output))
 					test_scaler_with_rotation_pipe(&data, pipe, output);
 		}
 
 		igt_describe("Tests scaling with clipping and clamping.");
 		igt_subtest_with_dynamic("scaler-with-clipping-clamping") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-scaler-with-clipping-clamping", kmstest_pipe_name(pipe))
+				igt_dynamic_f("pipe-%s-%s-scaler-with-clipping-clamping", kmstest_pipe_name(pipe), igt_output_name(output))
 					test_scaler_with_clipping_clamping_scenario(&data, pipe, output);
 		}
 	}
-- 
2.25.1
