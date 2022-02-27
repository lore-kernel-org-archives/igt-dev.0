Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714E310E5AD
 for <igt-dev@lists.freedesktop.org>; Sun, 27 Feb 2022 16:16:53 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 27 Feb 2022 22:00:53 +0530
Message-Id: <20220227163057.28703-5-swati2.sharma@intel.com>
In-Reply-To: <20220227163057.28703-1-swati2.sharma@intel.com>
References: <20220227163057.28703-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v8 4/8] tests/kms_plane_scaling: Addition of 0.75
 scaling factor downscaling tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index ddcefdcc..5630333e 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -481,6 +481,19 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			}
 		}
 
+		igt_describe("Tests downscaling with pixel formats for 0.75 scaling factor.");
+		igt_subtest_with_dynamic("downscale-with-pixel-format-factor-0-75") {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				drmModeModeInfo *mode;
+
+				mode = igt_output_get_mode(output);
+
+				igt_dynamic_f("pipe-%s-%s-downscale-with-pixel-format", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_scaler_with_pixel_format_pipe(&data, 0.75 * mode->hdisplay,
+							0.75 * mode->vdisplay, false, pipe, output);
+			}
+		}
+
 		igt_describe("Tests scaling with pixel formats, unity scaling.");
 		igt_subtest_with_dynamic("scaler-with-pixel-format-unity-scaling") {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
@@ -540,6 +553,19 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			}
 		}
 
+		igt_describe("Tests downscaling with tiling rotation for 0.75 scaling factor.");
+		igt_subtest_with_dynamic("downscale-with-rotation-factor-0-75") {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				drmModeModeInfo *mode;
+
+				mode = igt_output_get_mode(output);
+
+				igt_dynamic_f("pipe-%s-%s-downscale-with-rotation", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_scaler_with_rotation_pipe(&data, 0.75 * mode->hdisplay,
+							0.75 * mode->vdisplay, false, pipe, output);
+			}
+		}
+
 		igt_describe("Tests scaling with tiling rotation, unity scaling.");
 		igt_subtest_with_dynamic("scaler-with-rotation-unity-scaling") {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
-- 
2.25.1
