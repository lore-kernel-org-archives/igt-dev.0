Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D530E6E12D
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2020 06:01:33 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Thu, 12 Nov 2020 11:31:24 +0530
Message-Id: <20201112060124.25189-2-mohammed.khajapasha@intel.com>
In-Reply-To: <20201112060124.25189-1-mohammed.khajapasha@intel.com>
References: <20201112060124.25189-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/1] tests/kms_plane_scaling: Don't run
 plane scaler tests on each output
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
Cc: petri.latvala@intel.com, juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Don't run plane scaler tests on each output of a pipe.
We probably don't need to test plane scaler tests on each
output of a pipe.

$ time ./build/tests/kms_plane_scaling
- real    17m6.593s
+ real    6m33.515s

Cc: petri.latvala@intel.com
Cc: mika.kahola@intel.com
Cc: juha-pekka.heikkila@intel.com
Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
---
 tests/kms_plane_scaling.c | 44 +++++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index ecd2c2e30..39acad6cd 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -238,6 +238,8 @@ static void test_scaler_with_rotation_pipe(data_t *d, enum pipe pipe,
 	uint64_t tiling = is_i915_device(d->drm_fd) ?
 		LOCAL_I915_FORMAT_MOD_Y_TILED : LOCAL_DRM_FORMAT_MOD_NONE;
 
+	igt_require(get_num_scalers(d, pipe) > 0);
+
 	igt_output_set_pipe(output, pipe);
 	for_each_plane_on_pipe(display, pipe, plane) {
 		if (plane->type == DRM_PLANE_TYPE_CURSOR)
@@ -278,6 +280,8 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, enum pipe pipe, igt_ou
 	igt_display_t *display = &d->display;
 	igt_plane_t *plane;
 
+	igt_require(get_num_scalers(d, pipe) > 0);
+
 	igt_output_set_pipe(output, pipe);
 
 	for_each_plane_on_pipe(display, pipe, plane) {
@@ -351,6 +355,8 @@ test_plane_scaling_on_pipe(data_t *d, enum pipe pipe, igt_output_t *output)
 	uint64_t tiling = is_i915_device(display->drm_fd) ?
 		LOCAL_I915_FORMAT_MOD_X_TILED : LOCAL_DRM_FORMAT_MOD_NONE;
 
+	igt_require(get_num_scalers(d, pipe) > 0);
+
 	igt_skip_on(!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888,
 						tiling));
 
@@ -685,30 +691,32 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_require(data.display.is_atomic);
 	}
 
-	for_each_pipe_static(pipe) igt_subtest_group {
+	igt_subtest_group {
 		igt_output_t *output;
 
-		igt_fixture {
-			igt_display_require_output_on_pipe(&data.display, pipe);
-
-			igt_require(get_num_scalers(&data, pipe) > 0);
+		igt_subtest_with_dynamic("plane-scaling") {
+			for_each_pipe_with_single_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-plane-scaling", kmstest_pipe_name(pipe))
+					test_plane_scaling_on_pipe(&data, pipe, output);
 		}
 
-		igt_subtest_f("pipe-%s-plane-scaling", kmstest_pipe_name(pipe))
-			for_each_valid_output_on_pipe(&data.display, pipe, output)
-				test_plane_scaling_on_pipe(&data, pipe, output);
-
-		igt_subtest_f("pipe-%s-scaler-with-pixel-format", kmstest_pipe_name(pipe))
-			for_each_valid_output_on_pipe(&data.display, pipe, output)
-				test_scaler_with_pixel_format_pipe(&data, pipe, output);
+		igt_subtest_with_dynamic("scaler-with-pixel-format") {
+			for_each_pipe_with_single_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-scaler-with-pixel-format", kmstest_pipe_name(pipe))
+					test_scaler_with_pixel_format_pipe(&data, pipe, output);
+		}
 
-		igt_subtest_f("pipe-%s-scaler-with-rotation", kmstest_pipe_name(pipe))
-			for_each_valid_output_on_pipe(&data.display, pipe, output)
-				test_scaler_with_rotation_pipe(&data, pipe, output);
+		igt_subtest_with_dynamic("scaler-with-rotation") {
+			for_each_pipe_with_single_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-scaler-with-rotation", kmstest_pipe_name(pipe))
+					test_scaler_with_rotation_pipe(&data, pipe, output);
+		}
 
-		igt_subtest_f("pipe-%s-scaler-with-clipping-clamping", kmstest_pipe_name(pipe))
-			for_each_valid_output_on_pipe(&data.display, pipe, output)
-				test_scaler_with_clipping_clamping_scenario(&data, pipe, output);
+		igt_subtest_with_dynamic("scaler-with-clipping-clamping") {
+			for_each_pipe_with_single_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-scaler-with-rotation", kmstest_pipe_name(pipe))
+					test_scaler_with_clipping_clamping_scenario(&data, pipe, output);
+		}
 	}
 
 	igt_subtest_f("2x-scaler-multi-pipe")
-- 
2.29.2.154.g7f7ebe054a

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
