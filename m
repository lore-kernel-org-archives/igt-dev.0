Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42E710EAFA
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jan 2022 13:35:00 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Fri, 21 Jan 2022 19:18:33 +0530
Message-Id: <20220121134833.28740-7-swati2.sharma@intel.com>
In-Reply-To: <20220121134833.28740-1-swati2.sharma@intel.com>
References: <20220121134833.28740-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2 6/6] tests/kms_plane_scaling: Add negative test to
 check num of scalers
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

To validate i915 supports max of 2 scalers, applied upscaling on
3 planes simultaneously. This is a negative test and commit is expected
to fail.

v2: -add check for min 2 scalers
    -add igt_require() for overlay planes, fixes CRASH on KBL

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 62 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index f5457bc7..d6a88829 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -385,6 +385,61 @@ test_upscale_downscale_plane_scaling_on_pipe(data_t *d, enum pipe pipe, igt_outp
 	igt_display_commit2(display, COMMIT_ATOMIC);
 }
 
+static void
+test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
+{
+	drmModeModeInfo *mode;
+	igt_display_t *display = &d->display;
+	igt_pipe_t *pipe_obj = &display->pipes[pipe];
+
+	igt_require(get_num_scalers(d, pipe) >= 2);
+
+	mode = igt_output_get_mode(output);
+
+	/* setup display with primary plane */
+	d->plane1 = igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_PRIMARY);
+	prepare_crtc(d, output, pipe, d->plane1, mode);
+
+	d->plane2 = igt_pipe_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 0);
+	igt_require(d->plane2);
+	d->plane3 = igt_pipe_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 1);
+	igt_require(d->plane3);
+	d->plane4 = igt_pipe_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 2);
+	igt_require(d->plane4);
+
+	igt_create_color_pattern_fb(display->drm_fd,
+                                    mode->hdisplay / 3, mode->vdisplay / 3,
+                                    DRM_FORMAT_XRGB8888,
+                                    I915_TILING_NONE,
+                                    1.0, 0.0, 0.0, &d->fb[1]);
+	igt_create_color_pattern_fb(display->drm_fd,
+                                    mode->hdisplay / 3, mode->vdisplay / 3,
+                                    DRM_FORMAT_XRGB8888,
+                                    I915_TILING_NONE,
+                                    0.0, 1.0, 0.0, &d->fb[2]);
+	igt_create_color_pattern_fb(display->drm_fd,
+                                    mode->hdisplay / 3, mode->vdisplay / 3,
+                                    DRM_FORMAT_XRGB8888,
+                                    I915_TILING_NONE,
+                                    0.0, 0.0, 1.0, &d->fb[3]);
+
+	igt_plane_set_fb(d->plane2, &d->fb[1]);
+	igt_plane_set_fb(d->plane3, &d->fb[2]);
+	igt_plane_set_fb(d->plane4, &d->fb[3]);
+
+	/* 1st plane upscaling */
+	igt_plane_set_size(d->plane2, mode->hdisplay, mode->vdisplay);
+
+	/* 2nd plane upscaling */
+	igt_plane_set_size(d->plane3, mode->hdisplay, mode->vdisplay);
+
+	/* 3rd plane upscaling */
+	igt_plane_set_size(d->plane4, mode->hdisplay, mode->vdisplay);
+
+	/* This commit is expectd to fail as we can have max 2 scalers/pipe */
+	igt_assert_eq(igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL), -EINVAL);
+}
+
 static void test_scaler_with_rotation_pipe(data_t *d, enum pipe pipe,
 					   igt_output_t *output)
 {
@@ -711,6 +766,13 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					test_upscale_downscale_plane_scaling_on_pipe(&data, pipe, output);
 		}
 
+		igt_describe("Negative test for number of scalers per pipe.");
+		igt_subtest_with_dynamic("invalid-num-scalers") {
+			for_each_pipe_with_valid_output(&data.display, pipe, output)
+				igt_dynamic_f("%s-pipe-%s-invalid-num-scalers", igt_output_name(output), kmstest_pipe_name(pipe))
+					test_invalid_num_scalers(&data, pipe, output);
+		}
+
 		igt_describe("Tests scaling with pixel formats.");
 		igt_subtest_with_dynamic("scaler-with-pixel-format") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-- 
2.25.1
