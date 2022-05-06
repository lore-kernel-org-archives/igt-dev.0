Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AF410EFC5
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 06:13:52 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 May 2022 11:11:00 +0530
Message-Id: <20220506054100.27458-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_lowres: Convert test to
 dynamic
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

Covert the existing subtests to dynamic subtests at pipe/output level.
Also, move igt_display_reset() to the begining to the function to reset
display even in case of failures.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_plane_lowres.c | 112 ++++++++++++++++++++++++++-------------
 1 file changed, 75 insertions(+), 37 deletions(-)

diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 3f3f77c8..4c660efe 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -166,6 +166,7 @@ test_planes_on_pipe_with_output(data_t *data, igt_plane_t *plane, uint64_t modif
 	igt_plane_t *primary;
 	igt_crc_t crc_lowres, crc_hires1, crc_hires2;
 
+	igt_display_reset(&data->display);
 	igt_output_set_pipe(data->output, data->pipe);
 
 	primary = compatible_main_plane(plane, data->output, data->devid);
@@ -245,8 +246,6 @@ test_planes_on_pipe_with_output(data_t *data, igt_plane_t *plane, uint64_t modif
 	igt_remove_fb(data->drm_fd, &data->ref_hires.fb);
 	igt_remove_fb(data->drm_fd, &data->ref_lowres.fb);
 
-	igt_display_reset(&data->display);
-
 	return tested;
 }
 
@@ -256,17 +255,6 @@ test_planes_on_pipe(data_t *data, uint64_t modifier)
 	igt_plane_t *plane;
 	unsigned tested = 0;
 
-	igt_require_pipe(&data->display, data->pipe);
-	igt_display_require_output_on_pipe(&data->display, data->pipe);
-	igt_skip_on(!igt_display_has_format_mod(&data->display,
-						DRM_FORMAT_XRGB8888, modifier));
-
-	data->output = igt_get_single_output_for_pipe(&data->display, data->pipe);
-	igt_require(data->output);
-
-	igt_info("Testing connector %s using pipe %s\n",
-		 igt_output_name(data->output), kmstest_pipe_name(data->pipe));
-
 	for_each_plane_on_pipe(&data->display, data->pipe, plane)
 		tested += test_planes_on_pipe_with_output(data, plane, modifier);
 
@@ -280,6 +268,7 @@ igt_main
 {
 	data_t data = {};
 	enum pipe pipe;
+	igt_output_t *output;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -293,30 +282,79 @@ igt_main
 		igt_require(data.display.is_atomic);
 	}
 
-	for_each_pipe_static(pipe) {
-		data.pipe = pipe;
-		igt_describe("Tests the visibility of the planes when switching between "
-			     "high and low resolution with tiling as none.");
-		igt_subtest_f("pipe-%s-tiling-none", kmstest_pipe_name(pipe))
-			test_planes_on_pipe(&data, DRM_FORMAT_MOD_LINEAR);
-
-		igt_describe("Tests the visibility of the planes when switching between "
-			     "high and low resolution with x-tiling.");
-		igt_subtest_f("pipe-%s-tiling-x", kmstest_pipe_name(pipe))
-			test_planes_on_pipe(&data, I915_FORMAT_MOD_X_TILED);
-
-		igt_describe("Tests the visibility of the planes when switching between "
-			     "high and low resolution with y-tiling.");
-		igt_subtest_f("pipe-%s-tiling-y", kmstest_pipe_name(pipe))
-			test_planes_on_pipe(&data, I915_FORMAT_MOD_Y_TILED);
-
-		igt_describe("Tests the visibility of the planes when switching between "
-			     "high and low resolution with yf-tiling.");
-		igt_subtest_f("pipe-%s-tiling-yf", kmstest_pipe_name(pipe))
-			test_planes_on_pipe(&data, I915_FORMAT_MOD_Yf_TILED);
-
-		igt_subtest_f("pipe-%s-tiling-4", kmstest_pipe_name(pipe))
-			test_planes_on_pipe(&data, I915_FORMAT_MOD_4_TILED);
+	igt_describe("Tests the visibility of the planes when switching between "
+		     "high and low resolution with tiling as none.");
+	igt_subtest_with_dynamic("tiling-none") {
+		igt_skip_on(!igt_display_has_format_mod(&data.display,
+							DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR));
+		for_each_pipe(&data.display, pipe) {
+			for_each_valid_output_on_pipe(&data.display, pipe, output) {
+				data.pipe = pipe;
+				data.output = output;
+				igt_dynamic_f("%s-pipe-%s", data.output->name, kmstest_pipe_name(pipe))
+					test_planes_on_pipe(&data, DRM_FORMAT_MOD_LINEAR);
+			}
+		}
+	}
+
+	igt_describe("Tests the visibility of the planes when switching between "
+		     "high and low resolution with x-tiling.");
+	igt_subtest_with_dynamic("tiling-x") {
+		igt_skip_on(!igt_display_has_format_mod(&data.display,
+							DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_X_TILED));
+		for_each_pipe(&data.display, pipe) {
+			for_each_valid_output_on_pipe(&data.display, pipe, output) {
+				data.pipe = pipe;
+				data.output = output;
+				igt_dynamic_f("%s-pipe-%s", data.output->name, kmstest_pipe_name(pipe))
+					test_planes_on_pipe(&data, I915_FORMAT_MOD_X_TILED);
+			}
+		}
+	}
+
+	igt_describe("Tests the visibility of the planes when switching between "
+		     "high and low resolution with y-tiling.");
+	igt_subtest_with_dynamic("tiling-y") {
+		igt_skip_on(!igt_display_has_format_mod(&data.display,
+							DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_Y_TILED));
+		for_each_pipe(&data.display, pipe) {
+			for_each_valid_output_on_pipe(&data.display, pipe, output) {
+				data.pipe = pipe;
+				data.output = output;
+				igt_dynamic_f("%s-pipe-%s", data.output->name, kmstest_pipe_name(pipe))
+					test_planes_on_pipe(&data, I915_FORMAT_MOD_Y_TILED);
+			}
+		}
+	}
+
+	igt_describe("Tests the visibility of the planes when switching between "
+		     "high and low resolution with yf-tiling.");
+	igt_subtest_with_dynamic("tiling-yf") {
+		igt_skip_on(!igt_display_has_format_mod(&data.display,
+							DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_Yf_TILED));
+		for_each_pipe(&data.display, pipe) {
+			for_each_valid_output_on_pipe(&data.display, pipe, output) {
+				data.pipe = pipe;
+				data.output = output;
+				igt_dynamic_f("%s-pipe-%s", data.output->name, kmstest_pipe_name(pipe))
+					test_planes_on_pipe(&data, I915_FORMAT_MOD_Yf_TILED);
+			}
+		}
+	}
+
+	igt_describe("Tests the visibility of the planes when switching between "
+		     "high and low resolution with 4-tiling.");
+	igt_subtest_with_dynamic("tiling-4") {
+		igt_skip_on(!igt_display_has_format_mod(&data.display,
+							DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_4_TILED));
+		for_each_pipe(&data.display, pipe) {
+			for_each_valid_output_on_pipe(&data.display, pipe, output) {
+				data.pipe = pipe;
+				data.output = output;
+				igt_dynamic_f("%s-pipe-%s", data.output->name, kmstest_pipe_name(pipe))
+					test_planes_on_pipe(&data, I915_FORMAT_MOD_4_TILED);
+			}
+		}
 	}
 
 	igt_fixture {
-- 
2.22.0
