Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A63110E662
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Feb 2022 05:36:39 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Tue,  8 Feb 2022 11:20:33 +0530
Message-Id: <20220208055039.31306-4-swati2.sharma@intel.com>
In-Reply-To: <20220208055039.31306-1-swati2.sharma@intel.com>
References: <20220208055039.31306-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 3/9] tests/kms_plane_scaling: Upscaling each plane
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

Subtest for testing upscaling for each plane
individually (checked 1 plane per "class" like
we do in other tests)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 65 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 1cf62841..25e91659 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -230,6 +230,64 @@ static bool test_format(data_t *data,
 	return true;
 }
 
+static void
+__test_plane_upscaling(data_t *d, igt_plane_t *plane,
+		       enum pipe pipe, igt_output_t *output)
+{
+	igt_display_t *display = &d->display;
+	int width, height;
+	drmModeModeInfo *mode;
+
+	cleanup_crtc(d);
+
+	igt_output_set_pipe(output, pipe);
+	mode = igt_output_get_mode(output);
+	width = height = 20;
+
+	igt_create_color_pattern_fb(display->drm_fd,
+                                    width, height,
+                                    DRM_FORMAT_XRGB8888,
+                                    I915_TILING_NONE,
+                                    1.0, 0.0, 0.0, &d->fb[0]);
+
+	igt_plane_set_fb(plane, &d->fb[0]);
+	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	igt_plane_set_fb(plane, NULL);
+	igt_remove_fb(display->drm_fd, &d->fb[0]);
+}
+
+static void
+test_plane_upscaling(data_t *d, enum pipe pipe, igt_output_t *output)
+{
+	igt_display_t *display = &d->display;
+	igt_plane_t *plane;
+	uint64_t modifier = is_i915_device(d->drm_fd) ?
+		I915_FORMAT_MOD_Y_TILED : DRM_FORMAT_MOD_LINEAR;
+
+	igt_require(get_num_scalers(d, pipe) > 0);
+
+	for_each_plane_on_pipe(display, pipe, plane) {
+		struct igt_vec tested_formats;
+
+		if (plane->type == DRM_PLANE_TYPE_CURSOR)
+			continue;
+
+		igt_vec_init(&tested_formats, sizeof(uint32_t));
+
+		for (int j = 0; j < plane->drm_plane->count_formats; j++) {
+			uint32_t format = plane->drm_plane->formats[j];
+			if (test_format(d, &tested_formats, format) &&
+			    igt_plane_has_format_mod(plane, format, modifier) &&
+			    can_scale(d, format))
+					__test_plane_upscaling(d, plane, pipe, output);
+		}
+
+		igt_vec_fini(&tested_formats);
+	}
+}
+
 static bool test_pipe_iteration(data_t *data, enum pipe pipe, int iteration)
 {
 	if (!is_i915_device(data->drm_fd) ||
@@ -547,6 +605,13 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	igt_subtest_group {
 		igt_output_t *output;
 
+		igt_describe("Tests plane upscaling.");
+		igt_subtest_with_dynamic("plane-upscaling") {
+			for_each_pipe_with_single_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-%s-upscaling", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_plane_upscaling(&data, pipe, output);
+		}
+
 		igt_describe("Tests scaling with pixel formats.");
 		igt_subtest_with_dynamic("scaler-with-pixel-format") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-- 
2.25.1
