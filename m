Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28846E7D9
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Sep 2021 16:48:08 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu,  2 Sep 2021 19:44:59 +0300
Message-Id: <20210902164508.20104-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20210902164508.20104-1-ville.syrjala@linux.intel.com>
References: <20210902164508.20104-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 02/11] tests/kms_rotation_crc: Use
 igt_plane_has_rotation()
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Use igt_plane_has_rotation() instead of these annoying
hand rolled gen checks.

Also fix up the bogus CHV checks to match reality. Since
the test doesn't probe the final configuration with a
TEST_ONLY atomic commit we must still manually filter
out any case that would pass the basic rotation check but
fail later.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_rotation_crc.c | 35 ++++++++++++-----------------------
 1 file changed, 12 insertions(+), 23 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 2c66cd7c4e31..2101003d6b71 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -493,9 +493,6 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 		for (c = 0; c < num_rectangle_types; c++)
 			data->crc_rect[data->output_crc_in_use][c].valid = false;
 
-		if (is_i915_device(data->gfx_fd) && IS_CHERRYVIEW(data->devid) && pipe != PIPE_B)
-			continue;
-
 		/* restricting the execution to 2 pipes to reduce execution time*/
 		if (pipe_count == 2 * connected_outputs && !data->extended)
 			break;
@@ -505,6 +502,11 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 
 		plane = igt_output_get_plane_type(output, plane_type);
 		igt_require(igt_plane_has_prop(plane, IGT_PLANE_ROTATION));
+		igt_require(igt_plane_has_rotation(plane, data->rotation));
+		/* CHV can't rotate and reflect simultaneously */
+		igt_require(!is_i915_device(data->gfx_fd) ||
+			    !IS_CHERRYVIEW(data->devid) ||
+			    data->rotation != (IGT_ROTATION_180 | IGT_REFLECT_X));
 
 		prepare_crtc(data, output, pipe, plane, true);
 
@@ -738,13 +740,14 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 						     && intel_display_ver(data->devid) < 11)
 							continue;
 
-						if (igt_rotation_90_or_270(planeconfigs[i].rotation)
-						    && intel_display_ver(data->devid) >= 13)
+						if (!igt_plane_has_rotation(p[0].plane,
+									    planeconfigs[i].rotation))
 							continue;
 
-						if (igt_rotation_90_or_270(planeconfigs[j].rotation)
-						    && intel_display_ver(data->devid) >= 13)
+						if (!igt_plane_has_rotation(p[1].plane,
+									    planeconfigs[j].rotation))
 							continue;
+
 						/*
 						 * if using packed formats crc's will be
 						 * same and can store them so there's
@@ -892,6 +895,7 @@ static void test_plane_rotation_exhaust_fences(data_t *data,
 	int i;
 
 	igt_require(igt_plane_has_prop(plane, IGT_PLANE_ROTATION));
+	igt_require(igt_plane_has_rotation(plane, IGT_ROTATION_0 | IGT_ROTATION_90));
 	igt_require(gem_available_fences(display->drm_fd) > 0);
 
 	prepare_crtc(data, output, pipe, plane, false);
@@ -1048,10 +1052,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_subtest_f("%s-rotation-%s",
 			      plane_test_str(subtest->plane),
 			      rot_test_str(subtest->rot)) {
-			if (is_i915_device(data.gfx_fd)) {
-				igt_require(!igt_rotation_90_or_270(subtest->rot) ||
-					    (gen >= 9 && gen < 13));
-			} else if (is_amdgpu_device(data.gfx_fd)) {
+			if (is_amdgpu_device(data.gfx_fd)) {
 				data.override_fmt = DRM_FORMAT_XRGB8888;
 				if (igt_rotation_90_or_270(subtest->rot))
 					data.override_tiling = AMD_FMT_MOD |
@@ -1067,7 +1068,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 	igt_describe("Rotation test with 90 degree for a plane of gen9+ with given position");
 	igt_subtest_f("sprite-rotation-90-pos-100-0") {
-		igt_require(gen >=9 && gen < 13);
 		data.rotation = IGT_ROTATION_90;
 		data.pos_x = 100,
 		data.pos_y = 0;
@@ -1082,7 +1082,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		  * so apart from this, any other gen11+ pixel format
 		  * can be used which doesn't support 90/270 degree
 		  * rotation */
-		igt_require(gen >=9 && gen < 13);
 		data.rotation = IGT_ROTATION_90;
 		data.override_fmt = gen < 11 ? DRM_FORMAT_RGB565 : DRM_FORMAT_Y212;
 		test_plane_rotation(&data, DRM_PLANE_TYPE_PRIMARY, true);
@@ -1091,7 +1090,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 	igt_describe("Checking unsupported tiling for gen9+ with 90 degree of rotation");
 	igt_subtest_f("bad-tiling") {
-		igt_require(gen >=9 && gen < 13);
 		data.rotation = IGT_ROTATION_90;
 		data.override_tiling = I915_FORMAT_MOD_X_TILED;
 		test_plane_rotation(&data, DRM_PLANE_TYPE_PRIMARY, true);
@@ -1103,12 +1101,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_subtest_f("primary-%s-reflect-x-%s",
 			      tiling_test_str(reflect_x->tiling),
 			      rot_test_str(reflect_x->rot)) {
-			igt_require(gen >= 10 ||
-				    (IS_CHERRYVIEW(data.devid) && reflect_x->rot == IGT_ROTATION_0
-				     && reflect_x->tiling == I915_FORMAT_MOD_X_TILED));
 			data.rotation = (IGT_REFLECT_X | reflect_x->rot);
-			igt_require(!(gen >= 13 &&
-				      igt_rotation_90_or_270(data.rotation)));
 			data.override_tiling = reflect_x->tiling;
 			test_plane_rotation(&data, DRM_PLANE_TYPE_PRIMARY, false);
 		}
@@ -1116,7 +1109,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 	igt_describe("Rotation test on both planes by making them fully visible");
 	igt_subtest_f("multiplane-rotation") {
-		igt_require(gen >= 9);
 		cleanup_crtc(&data);
 		data.planepos[0].origo = p_top | p_left;
 		data.planepos[0].x = .2f;
@@ -1130,7 +1122,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	igt_describe("Rotation test on both planes by cropping left/top corner of primary plane and"
 			"right/top corner of sprite plane");
 	igt_subtest_f("multiplane-rotation-cropping-top") {
-		igt_require(gen >= 9);
 		cleanup_crtc(&data);
 		data.planepos[0].origo = p_top | p_left;
 		data.planepos[0].x = -.05f;
@@ -1144,7 +1135,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	igt_describe("Rotation test on both planes by cropping left/bottom corner of primary plane"
 			"and right/bottom corner of sprite plane");
 	igt_subtest_f("multiplane-rotation-cropping-bottom") {
-		igt_require(gen >= 9);
 		cleanup_crtc(&data);
 		data.planepos[0].origo = p_bottom | p_left;
 		data.planepos[0].x = -.05f;
@@ -1164,7 +1154,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		enum pipe pipe;
 		igt_output_t *output;
 
-		igt_require(gen >= 9 && gen < 13);
 		igt_display_require_output(&data.display);
 
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
-- 
2.31.1
