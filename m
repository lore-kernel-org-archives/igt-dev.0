Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5113210E676
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Feb 2022 05:37:38 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Tue,  8 Feb 2022 11:20:38 +0530
Message-Id: <20220208055039.31306-9-swati2.sharma@intel.com>
In-Reply-To: <20220208055039.31306-1-swati2.sharma@intel.com>
References: <20220208055039.31306-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 8/9] tests/kms_plane_scaling: Add negative test to
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
 tests/kms_plane_scaling.c | 73 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 882859ab..29e85aa3 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -567,6 +567,71 @@ test_plane_scaling_combo(data_t *d, enum pipe pipe, igt_output_t *output, uint32
 		__test_plane_up_down_scaling(d, pipe, output);
 }
 
+static void
+test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
+{
+	igt_display_t *display = &d->display;
+	igt_pipe_t *pipe_obj = &display->pipes[pipe];
+	drmModeModeInfo *mode;
+	int width, height;
+
+	cleanup_crtc(d);
+
+	igt_require(get_num_scalers(d, pipe) >= 2);
+	igt_output_set_pipe(output, pipe);
+	mode = igt_output_get_mode(output);
+	width = height = 20;
+
+	d->plane1 = igt_pipe_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 0);
+	igt_require(d->plane1);
+	d->plane2 = igt_pipe_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 1);
+	igt_require(d->plane2);
+	d->plane3 = igt_pipe_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 2);
+	igt_require(d->plane3);
+
+	igt_create_color_pattern_fb(display->drm_fd,
+                                    width, height,
+                                    DRM_FORMAT_XRGB8888,
+                                    I915_TILING_NONE,
+                                    1.0, 0.0, 0.0, &d->fb[1]);
+	igt_create_color_pattern_fb(display->drm_fd,
+                                    width, height,
+                                    DRM_FORMAT_XRGB8888,
+                                    I915_TILING_NONE,
+                                    0.0, 1.0, 0.0, &d->fb[2]);
+	igt_create_color_pattern_fb(display->drm_fd,
+                                    width, height,
+                                    DRM_FORMAT_XRGB8888,
+                                    I915_TILING_NONE,
+                                    0.0, 0.0, 1.0, &d->fb[3]);
+
+	igt_plane_set_fb(d->plane1, &d->fb[1]);
+	igt_plane_set_fb(d->plane2, &d->fb[2]);
+	igt_plane_set_fb(d->plane3, &d->fb[3]);
+
+	/* 1st plane upscaling */
+	igt_plane_set_size(d->plane1, mode->hdisplay, mode->vdisplay);
+
+	/* 2nd plane upscaling */
+	igt_plane_set_size(d->plane2, mode->hdisplay, mode->vdisplay);
+
+	/* 3rd plane upscaling */
+	igt_plane_set_size(d->plane3, mode->hdisplay, mode->vdisplay);
+
+	/* This commit is expectd to fail as we can have max 2 scalers/pipe
+	 * In dmesg, you can find: Too many scaling requests 3 > 2
+	 * */
+	igt_assert_eq(igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL), -EINVAL);
+
+	/* cleanup */
+	igt_plane_set_fb(d->plane1, NULL);
+	igt_plane_set_fb(d->plane2, NULL);
+	igt_plane_set_fb(d->plane3, NULL);
+	igt_remove_fb(display->drm_fd, &d->fb[1]);
+	igt_remove_fb(display->drm_fd, &d->fb[2]);
+	igt_remove_fb(display->drm_fd, &d->fb[3]);
+}
+
 static bool test_pipe_iteration(data_t *data, enum pipe pipe, int iteration)
 {
 	if (!is_i915_device(data->drm_fd) ||
@@ -922,6 +987,14 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					test_plane_scaling_combo(&data, pipe, output, TEST_UP_DOWN_SCALING);
 		}
 
+		igt_describe("Negative test for number of scalers per pipe.");
+		igt_subtest_with_dynamic("invalid-num-scalers") {
+			for_each_pipe_with_valid_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-%s-invalid-num-scalers",
+					       kmstest_pipe_name(pipe), igt_output_name(output))
+					test_invalid_num_scalers(&data, pipe, output);
+		}
+
 		igt_describe("Tests scaling with pixel formats.");
 		igt_subtest_with_dynamic("scaler-with-pixel-format") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-- 
2.25.1
