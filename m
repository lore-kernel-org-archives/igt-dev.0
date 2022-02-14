Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B274C10E286
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Feb 2022 15:01:25 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Mon, 14 Feb 2022 20:30:09 +0530
Message-Id: <20220214150009.26815-17-jeevan.b@intel.com>
In-Reply-To: <20220214150009.26815-1-jeevan.b@intel.com>
References: <20220214150009.26815-1-jeevan.b@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 16/16] tests/kms_plane_scaling: Use
 tiling 4 if platform has support for it
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
Cc: juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Mika Kahola <mika.kahola@intel.com>

Switch using tiling 4 if a platform has support for it. For DG2 tiling 4
is superseeds Y tiling.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_plane_scaling.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 1ab7e5ce..4baa8855 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -45,6 +45,7 @@ typedef struct {
 	igt_plane_t *plane3;
 	igt_plane_t *plane4;
 	bool extended;
+	bool has_4tile;
 } data_t;
 
 static int get_num_scalers(data_t* d, enum pipe pipe)
@@ -250,6 +251,9 @@ static void test_scaler_with_rotation_pipe(data_t *d, enum pipe pipe,
 	uint64_t modifier = is_i915_device(d->drm_fd) ?
 		I915_FORMAT_MOD_Y_TILED : DRM_FORMAT_MOD_LINEAR;
 
+	if (d->has_4tile)
+		modifier = I915_FORMAT_MOD_4_TILED;
+
 	igt_require(get_num_scalers(d, pipe) > 0);
 
 	igt_output_set_pipe(output, pipe);
@@ -285,7 +289,8 @@ static const uint64_t modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	I915_FORMAT_MOD_X_TILED,
 	I915_FORMAT_MOD_Y_TILED,
-	I915_FORMAT_MOD_Yf_TILED
+	I915_FORMAT_MOD_Yf_TILED,
+	I915_FORMAT_MOD_4_TILED
 };
 
 static void test_scaler_with_pixel_format_pipe(data_t *d, enum pipe pipe, igt_output_t *output)
@@ -531,6 +536,7 @@ test_scaler_with_clipping_clamping_scenario(data_t *d, enum pipe pipe, igt_outpu
 	igt_pipe_t *pipe_obj = &d->display.pipes[pipe];
 	drmModeModeInfo *mode;
 	struct igt_vec tested_formats1;
+	uint64_t modifier = d->has_4tile ? I915_FORMAT_MOD_4_TILED : I915_FORMAT_MOD_Y_TILED;
 
 	igt_require(get_num_scalers(d, pipe) >= 2);
 
@@ -567,7 +573,7 @@ test_scaler_with_clipping_clamping_scenario(data_t *d, enum pipe pipe, igt_outpu
 
 			igt_create_pattern_fb(d->drm_fd,
 					      mode->hdisplay, mode->vdisplay, f2,
-					      I915_FORMAT_MOD_Y_TILED,
+					      modifier,
 					      &d->fb[2]);
 
 			__test_scaler_with_clipping_clamping_scenario(d, mode);
@@ -613,10 +619,9 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	igt_output_t *output1, *output2;
 	drmModeModeInfo *mode1, *mode2;
 	enum pipe pipe1, pipe2;
-	bool has_4tile = intel_get_device_info(intel_get_drm_devid(d->drm_fd))->has_4tile;
 	uint64_t modifier;
 
-	if (is_i915_device(display->drm_fd) && has_4tile)
+	if (is_i915_device(display->drm_fd) && d->has_4tile)
 		modifier = I915_FORMAT_MOD_4_TILED;
 	else if (is_i915_device(display->drm_fd))
 		modifier = I915_FORMAT_MOD_Y_TILED;
@@ -721,6 +726,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		data.devid = is_i915_device(data.drm_fd) ?
 			intel_get_drm_devid(data.drm_fd) : 0;
 		igt_require(data.display.is_atomic);
+		data.has_4tile = is_i915_device(data.drm_fd) &&
+				 intel_get_device_info(intel_get_drm_devid(data.drm_fd))->has_4tile;
 	}
 
 	igt_subtest_group {
-- 
2.17.1
