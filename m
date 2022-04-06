Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E5F10E26D
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Apr 2022 16:29:25 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Apr 2022 21:59:06 +0530
Message-Id: <20220406162906.6057-4-swati2.sharma@intel.com>
In-Reply-To: <20220406162906.6057-1-swati2.sharma@intel.com>
References: <20220406162906.6057-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/kms_plane_scaling: Tests to
 validate modifiers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In this patch, various scaling(upscale/downscale/unity)
is tested with various modifiers.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 72 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index ab1e20ea..a5ea7d03 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -778,6 +778,78 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			}
 		}
 
+		igt_describe("Tests upscaling with modifiers, from 20x20 fb.");
+		igt_subtest_with_dynamic("upscale-with-modifiers-20x20") {
+			for_each_pipe_with_single_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-%s-upscale-with-modifier", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_scaler_with_modifier_pipe(&data, 20, 20, true, pipe, output);
+		}
+
+		igt_describe("Tests upscaling with modifiers for 0.25 scaling factor.");
+		igt_subtest_with_dynamic("upscale-with-modifiers-factor-0-25") {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				drmModeModeInfo *mode;
+
+				mode = igt_output_get_mode(output);
+
+				igt_dynamic_f("pipe-%s-%s-upscale-with-modifiers", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_scaler_with_pixel_format_pipe(&data, 0.25 * mode->hdisplay,
+							0.25 * mode->vdisplay, true, pipe, output);
+			}
+		}
+
+		igt_describe("Tests downscaling with modifiers for 0.25 scaling factor.");
+		igt_subtest_with_dynamic("downscale-with-modifiers-factor-0-25") {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				drmModeModeInfo *mode;
+
+				mode = igt_output_get_mode(output);
+
+				igt_dynamic_f("pipe-%s-%s-downscale-with-modifiers", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_scaler_with_pixel_format_pipe(&data, 0.25 * mode->hdisplay,
+							0.25 * mode->vdisplay, false, pipe, output);
+			}
+		}
+
+		igt_describe("Tests downscaling with modifiers for 0.5 scaling factor.");
+		igt_subtest_with_dynamic("downscale-with-modifiers-factor-0-5") {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				drmModeModeInfo *mode;
+
+				mode = igt_output_get_mode(output);
+
+				igt_dynamic_f("pipe-%s-%s-downscale-with-modifiers", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_scaler_with_pixel_format_pipe(&data, 0.5 * mode->hdisplay,
+							0.5 * mode->vdisplay, false, pipe, output);
+			}
+		}
+
+		igt_describe("Tests downscaling with modifiers for 0.75 scaling factor.");
+		igt_subtest_with_dynamic("downscale-with-modifiers-factor-0-75") {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				drmModeModeInfo *mode;
+
+				mode = igt_output_get_mode(output);
+
+				igt_dynamic_f("pipe-%s-%s-downscale-with-pixel-format", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_scaler_with_modifiers_pipe(&data, 0.75 * mode->hdisplay,
+							0.75 * mode->vdisplay, false, pipe, output);
+			}
+		}
+
+		igt_describe("Tests scaling with modifiers, unity scaling.");
+		igt_subtest_with_dynamic("scaler-with-modifiers-unity-scaling") {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				drmModeModeInfo *mode;
+
+				mode = igt_output_get_mode(output);
+
+				igt_dynamic_f("pipe-%s-%s-scaler-with-modifiers", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_scaler_with_modifiers_pipe(&data, mode->hdisplay,
+							mode->vdisplay, true, pipe, output);
+			}
+		}
+
 		igt_describe("Tests scaling with clipping and clamping.");
 		igt_subtest_with_dynamic("scaler-with-clipping-clamping") {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
-- 
2.25.1
