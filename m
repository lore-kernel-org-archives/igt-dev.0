Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B993310E1A8
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Apr 2022 16:29:25 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Apr 2022 21:59:05 +0530
Message-Id: <20220406162906.6057-3-swati2.sharma@intel.com>
In-Reply-To: <20220406162906.6057-1-swati2.sharma@intel.com>
References: <20220406162906.6057-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/kms_plane_scaling: Fix modifier
 and format
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

Again, these tests timeouts in CI. Here fixed modifier and
format and looped only for rotations to validate scaling with
different rotations.
---
 tests/kms_plane_scaling.c | 60 ++++++---------------------------------
 1 file changed, 8 insertions(+), 52 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 435b2f61..ab1e20ea 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -196,35 +196,6 @@ static const igt_rotation_t rotations[] = {
 	IGT_ROTATION_270,
 };
 
-static bool can_rotate(data_t *d, unsigned format, uint64_t modifier,
-		       igt_rotation_t rot)
-{
-	if (!is_i915_device(d->drm_fd))
-		return true;
-
-	switch (format) {
-	case DRM_FORMAT_RGB565:
-		if (intel_display_ver(d->devid) >= 11)
-			break;
-		/* fall through */
-	case DRM_FORMAT_C8:
-	case DRM_FORMAT_XRGB16161616F:
-	case DRM_FORMAT_XBGR16161616F:
-	case DRM_FORMAT_ARGB16161616F:
-	case DRM_FORMAT_ABGR16161616F:
-	case DRM_FORMAT_Y210:
-	case DRM_FORMAT_Y212:
-	case DRM_FORMAT_Y216:
-	case DRM_FORMAT_XVYU12_16161616:
-	case DRM_FORMAT_XVYU16161616:
-		return false;
-	default:
-		break;
-	}
-
-	return true;
-}
-
 static bool can_scale(data_t *d, unsigned format)
 {
 	if (!is_i915_device(d->drm_fd))
@@ -286,6 +257,7 @@ static void test_scaler_with_rotation_pipe(data_t *d,
 					   igt_output_t *output)
 {
 	igt_display_t *display = &d->display;
+	unsigned format = DRM_FORMAT_XRGB8888;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	igt_plane_t *plane;
 
@@ -299,30 +271,14 @@ static void test_scaler_with_rotation_pipe(data_t *d,
 
 		for (int i = 0; i < ARRAY_SIZE(rotations); i++) {
 			igt_rotation_t rot = rotations[i];
-			struct igt_vec tested_formats;
-
-			igt_vec_init(&tested_formats, sizeof(uint32_t));
-
-			for (int j = 0; j < plane->drm_plane->count_formats; j++) {
-				unsigned format = plane->drm_plane->formats[j];
 
-				if (!test_pipe_iteration(d, pipe, j))
-					continue;
-
-				if (test_format(d, &tested_formats, format) &&
-				    igt_plane_has_format_mod(plane, format, modifier) &&
-				    igt_plane_has_rotation(plane, rot) &&
-				    can_rotate(d, format, modifier, rot) &&
-				    can_scale(d, format))
+				if (igt_plane_has_rotation(plane, rot))
 					check_scaling_pipe_plane_rot(d, plane,
 								     format, modifier,
 								     width, height,
 								     is_upscale,
 								     pipe, output,
 								     rot);
-			}
-
-			igt_vec_fini(&tested_formats);
 		}
 	}
 }
@@ -750,14 +706,14 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			}
 		}
 
-		igt_describe("Tests upscaling with tiling rotation, from 20x20 fb.");
+		igt_describe("Tests upscaling with rotation, from 20x20 fb.");
 		igt_subtest_with_dynamic("upscale-with-rotation-20x20") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-%s-upscale-with-rotation", kmstest_pipe_name(pipe), igt_output_name(output))
 					test_scaler_with_rotation_pipe(&data, 20, 20, true, pipe, output);
 		}
 
-		igt_describe("Tests upscaling with tiling rotation for 0.25 scaling factor.");
+		igt_describe("Tests upscaling with rotation for 0.25 scaling factor.");
 		igt_subtest_with_dynamic("upscale-with-rotation-factor-0-25") {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
 				drmModeModeInfo *mode;
@@ -770,7 +726,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			}
 		}
 
-		igt_describe("Tests downscaling with tiling rotation for 0.25 scaling factor.");
+		igt_describe("Tests downscaling with rotation for 0.25 scaling factor.");
 		igt_subtest_with_dynamic("downscale-with-rotation-factor-0-25") {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
 				drmModeModeInfo *mode;
@@ -783,7 +739,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			}
 		}
 
-		igt_describe("Tests downscaling with tiling rotation for 0.5 scaling factor.");
+		igt_describe("Tests downscaling with rotation for 0.5 scaling factor.");
 		igt_subtest_with_dynamic("downscale-with-rotation-factor-0-5") {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
 				drmModeModeInfo *mode;
@@ -796,7 +752,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			}
 		}
 
-		igt_describe("Tests downscaling with tiling rotation for 0.75 scaling factor.");
+		igt_describe("Tests downscaling with rotation for 0.75 scaling factor.");
 		igt_subtest_with_dynamic("downscale-with-rotation-factor-0-75") {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
 				drmModeModeInfo *mode;
@@ -809,7 +765,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			}
 		}
 
-		igt_describe("Tests scaling with tiling rotation, unity scaling.");
+		igt_describe("Tests scaling with rotation, unity scaling.");
 		igt_subtest_with_dynamic("scaler-with-rotation-unity-scaling") {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
 				drmModeModeInfo *mode;
-- 
2.25.1
