Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C40410E75A
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Apr 2022 09:03:59 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  7 Apr 2022 14:33:43 +0530
Message-Id: <20220407090343.10067-4-swati2.sharma@intel.com>
In-Reply-To: <20220407090343.10067-1-swati2.sharma@intel.com>
References: <20220407090343.10067-1-swati2.sharma@intel.com>
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
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In this patch, scaling(upscale/downscale/unity)
is tested with various modifiers.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 112 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index ab1e20ea..301cf4e0 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -250,6 +250,46 @@ static bool test_pipe_iteration(data_t *data, enum pipe pipe, int iteration)
 	return true;
 }
 
+static const uint64_t modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	I915_FORMAT_MOD_X_TILED,
+	I915_FORMAT_MOD_Y_TILED,
+	I915_FORMAT_MOD_Yf_TILED,
+	I915_FORMAT_MOD_4_TILED
+};
+
+static void test_scaler_with_modifier_pipe(data_t *d,
+					   int width, int height,
+					   bool is_upscale,
+					   enum pipe pipe,
+					   igt_output_t *output)
+{
+	igt_display_t *display = &d->display;
+	unsigned format = DRM_FORMAT_XRGB8888;
+	igt_plane_t *plane;
+
+	cleanup_crtc(d);
+
+	igt_output_set_pipe(output, pipe);
+
+	for_each_plane_on_pipe(display, pipe, plane) {
+		if (plane->type == DRM_PLANE_TYPE_CURSOR)
+			continue;
+
+		for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
+			uint64_t modifier = modifiers[i];
+
+				if (igt_plane_has_format_mod(plane, format, modifier))
+					check_scaling_pipe_plane_rot(d, plane,
+								     format, modifier,
+								     width, height,
+								     is_upscale,
+								     pipe, output,
+								     IGT_ROTATION_0);
+		}
+	}
+}
+
 static void test_scaler_with_rotation_pipe(data_t *d,
 					   int width, int height,
 					   bool is_upscale,
@@ -778,6 +818,78 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			}
 		}
 
+		igt_describe("Tests upscaling with modifiers, from 20x20 fb.");
+		igt_subtest_with_dynamic("upscale-with-modifier-20x20") {
+			for_each_pipe_with_single_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-%s-upscale-with-modifier", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_scaler_with_modifier_pipe(&data, 20, 20, true, pipe, output);
+		}
+
+		igt_describe("Tests upscaling with modifiers for 0.25 scaling factor.");
+		igt_subtest_with_dynamic("upscale-with-modifier-factor-0-25") {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				drmModeModeInfo *mode;
+
+				mode = igt_output_get_mode(output);
+
+				igt_dynamic_f("pipe-%s-%s-upscale-with-modifier", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_scaler_with_modifier_pipe(&data, 0.25 * mode->hdisplay,
+							0.25 * mode->vdisplay, true, pipe, output);
+			}
+		}
+
+		igt_describe("Tests downscaling with modifiers for 0.25 scaling factor.");
+		igt_subtest_with_dynamic("downscale-with-modifier-factor-0-25") {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				drmModeModeInfo *mode;
+
+				mode = igt_output_get_mode(output);
+
+				igt_dynamic_f("pipe-%s-%s-downscale-with-modifier", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_scaler_with_modifier_pipe(&data, 0.25 * mode->hdisplay,
+							0.25 * mode->vdisplay, false, pipe, output);
+			}
+		}
+
+		igt_describe("Tests downscaling with modifiers for 0.5 scaling factor.");
+		igt_subtest_with_dynamic("downscale-with-modifier-factor-0-5") {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				drmModeModeInfo *mode;
+
+				mode = igt_output_get_mode(output);
+
+				igt_dynamic_f("pipe-%s-%s-downscale-with-modifier", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_scaler_with_modifier_pipe(&data, 0.5 * mode->hdisplay,
+							0.5 * mode->vdisplay, false, pipe, output);
+			}
+		}
+
+		igt_describe("Tests downscaling with modifiers for 0.75 scaling factor.");
+		igt_subtest_with_dynamic("downscale-with-modifier-factor-0-75") {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				drmModeModeInfo *mode;
+
+				mode = igt_output_get_mode(output);
+
+				igt_dynamic_f("pipe-%s-%s-downscale-with-modifier", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_scaler_with_modifier_pipe(&data, 0.75 * mode->hdisplay,
+							0.75 * mode->vdisplay, false, pipe, output);
+			}
+		}
+
+		igt_describe("Tests scaling with modifiers, unity scaling.");
+		igt_subtest_with_dynamic("scaler-with-modifier-unity-scaling") {
+			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				drmModeModeInfo *mode;
+
+				mode = igt_output_get_mode(output);
+
+				igt_dynamic_f("pipe-%s-%s-scaler-with-modifier", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_scaler_with_modifier_pipe(&data, mode->hdisplay,
+							mode->vdisplay, true, pipe, output);
+			}
+		}
+
 		igt_describe("Tests scaling with clipping and clamping.");
 		igt_subtest_with_dynamic("scaler-with-clipping-clamping") {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
-- 
2.25.1
