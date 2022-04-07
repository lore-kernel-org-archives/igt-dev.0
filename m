Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9CA210E6A9
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Apr 2022 09:03:55 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  7 Apr 2022 14:33:41 +0530
Message-Id: <20220407090343.10067-2-swati2.sharma@intel.com>
In-Reply-To: <20220407090343.10067-1-swati2.sharma@intel.com>
References: <20220407090343.10067-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/kms_plane_scaling: Fix modifier
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

The current test takes around 500.454s/connector/pipe on DG2
to complete. CI per test execution timeout is 120s.
In this test, we have fixed modifier as LINEAR and looped
through all the pixel formats which is the sole purpose of
this test. With this change, execution time has reduced to
340.297s.
To validate scaling with modifiers separate tests will be
introduced.

Cc: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 45 ++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index b91039b0..435b2f61 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -327,17 +327,11 @@ static void test_scaler_with_rotation_pipe(data_t *d,
 	}
 }
 
-static const uint64_t modifiers[] = {
-	DRM_FORMAT_MOD_LINEAR,
-	I915_FORMAT_MOD_X_TILED,
-	I915_FORMAT_MOD_Y_TILED,
-	I915_FORMAT_MOD_Yf_TILED
-};
-
 static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height, bool is_upscale,
 					       enum pipe pipe, igt_output_t *output)
 {
 	igt_display_t *display = &d->display;
+	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	igt_plane_t *plane;
 
 	cleanup_crtc(d);
@@ -345,33 +339,30 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height,
 	igt_output_set_pipe(output, pipe);
 
 	for_each_plane_on_pipe(display, pipe, plane) {
+		struct igt_vec tested_formats;
+
 		if (plane->type == DRM_PLANE_TYPE_CURSOR)
 			continue;
 
-		for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
-			uint64_t modifier = modifiers[i];
-			struct igt_vec tested_formats;
+		igt_vec_init(&tested_formats, sizeof(uint32_t));
 
-			igt_vec_init(&tested_formats, sizeof(uint32_t));
-
-			for (int j = 0; j < plane->drm_plane->count_formats; j++) {
-				uint32_t format = plane->drm_plane->formats[j];
-
-				if (!test_pipe_iteration(d, pipe, j))
-					continue;
+		for (int j = 0; j < plane->drm_plane->count_formats; j++) {
+			uint32_t format = plane->drm_plane->formats[j];
 
-				if (test_format(d, &tested_formats, format) &&
-				    igt_plane_has_format_mod(plane, format, modifier) &&
-				    can_scale(d, format))
-					check_scaling_pipe_plane_rot(d, plane,
-								     format, modifier,
-								     width, height,
-								     is_upscale,
-								     pipe, output, IGT_ROTATION_0);
-			}
+			if (!test_pipe_iteration(d, pipe, j))
+				continue;
 
-			igt_vec_fini(&tested_formats);
+			if (test_format(d, &tested_formats, format) &&
+			    igt_plane_has_format_mod(plane, format, modifier) &&
+			    can_scale(d, format))
+			    check_scaling_pipe_plane_rot(d, plane,
+							 format, modifier,
+							 width, height,
+							 is_upscale,
+							 pipe, output, IGT_ROTATION_0);
 		}
+
+		igt_vec_fini(&tested_formats);
 	}
 }
 
-- 
2.25.1
