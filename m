Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC0010EB14
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jan 2022 13:34:56 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Fri, 21 Jan 2022 19:18:31 +0530
Message-Id: <20220121134833.28740-5-swati2.sharma@intel.com>
In-Reply-To: <20220121134833.28740-1-swati2.sharma@intel.com>
References: <20220121134833.28740-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2 4/6] tests/kms_plane_scaling: Downscaling on 2 planes
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

Added test case to downscale 2 planes simultaneously.
i915 driver supports max of 3:1 downscaling limit.

v2: -add check for min 2 scalers
    -add igt_require() for overlay planes, fixes CRASH on KBL

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 65 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 158a6eee..17853344 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -284,6 +284,64 @@ test_upscale_upscale_plane_scaling_on_pipe(data_t *d, enum pipe pipe, igt_output
 	igt_display_commit2(display, COMMIT_ATOMIC);
 }
 
+static void
+test_downscale_downscale_plane_scaling_on_pipe(data_t *d, enum pipe pipe, igt_output_t *output)
+{
+	drmModeModeInfo *mode;
+	igt_display_t *display = &d->display;
+	igt_pipe_t *pipe_obj = &display->pipes[pipe];
+	bool test_complete = false;
+	int scaling = 50;
+	int ret;
+
+	while (!test_complete) {
+		igt_require(get_num_scalers(d, pipe) >= 2);
+
+		mode = igt_output_get_mode(output);
+
+		/* setup display with primary plane */
+		d->plane1 = igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_PRIMARY);
+		prepare_crtc(d, output, pipe, d->plane1, mode);
+
+		d->plane2 = igt_pipe_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 0);
+		igt_require(d->plane2);
+		d->plane3 = igt_pipe_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 1);
+		igt_require(d->plane3);
+
+		igt_create_color_pattern_fb(display->drm_fd,
+                                            mode->hdisplay, mode->vdisplay,
+                                            DRM_FORMAT_XRGB8888,
+                                            I915_TILING_NONE,
+                                            1.0, 0.0, 0.0, &d->fb[1]);
+		igt_create_color_pattern_fb(display->drm_fd,
+                                            mode->hdisplay, mode->vdisplay,
+                                            DRM_FORMAT_XRGB8888,
+                                            I915_TILING_NONE,
+                                            0.0, 1.0, 0.0, &d->fb[2]);
+
+		igt_plane_set_fb(d->plane2, &d->fb[1]);
+		igt_plane_set_fb(d->plane3, &d->fb[2]);
+
+		/* 1st overlay plane downscaling */
+		igt_plane_set_size(d->plane2, (mode->hdisplay * scaling) / 100, (mode->vdisplay * scaling) / 100);
+		/* 2nd overlay plane downscaling */
+		igt_plane_set_size(d->plane3, (mode->hdisplay * scaling) / 100, (mode->vdisplay * scaling) / 100);
+
+		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		if (ret != -EINVAL) {
+			igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+			test_complete = true;
+			}
+
+		scaling += 5;
+
+		/* cleanup */
+		igt_remove_fb(display->drm_fd, &d->fb[1]);
+		igt_remove_fb(display->drm_fd, &d->fb[2]);
+	}
+}
+
 static void test_scaler_with_rotation_pipe(data_t *d, enum pipe pipe,
 					   igt_output_t *output)
 {
@@ -596,6 +654,13 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					test_upscale_upscale_plane_scaling_on_pipe(&data, pipe, output);
 		}
 
+		igt_describe("Tests downscaling of 2 overlay planes.");
+		igt_subtest_with_dynamic("downscale-downscale-plane-scaling") {
+			for_each_pipe_with_valid_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-%s-downscale-downscale-plane-scaling", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_downscale_downscale_plane_scaling_on_pipe(&data, pipe, output);
+		}
+
 		igt_describe("Tests scaling with pixel formats.");
 		igt_subtest_with_dynamic("scaler-with-pixel-format") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-- 
2.25.1
