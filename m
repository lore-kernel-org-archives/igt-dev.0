Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFD210E790
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Feb 2022 12:08:17 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Wed, 16 Feb 2022 17:52:12 +0530
Message-Id: <20220216122217.16507-5-swati2.sharma@intel.com>
In-Reply-To: <20220216122217.16507-1-swati2.sharma@intel.com>
References: <20220216122217.16507-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v5 4/9] tests/kms_plane_scaling: Downscaling each plane
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

Subtest for testing downscaling for each plane
individually (checked 1 plane per "class" like
we do in other tests).

v2: -set modifier as LINEAR (Ville)
    -shared code for upscaling and downscaling tests (Ville)
    -removed num_scaler() check and added try_commit() (Ville)
v3: -corrected while loop (Ville)
    -added assert() (Ville)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 56 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 9ecda31c..0be7dc0c 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -31,6 +31,7 @@ IGT_TEST_DESCRIPTION("Test display plane scaling");
 
 enum scaler_test_type {
 	TEST_UPSCALING = 0,
+	TEST_DOWNSCALING,
 };
 
 typedef struct {
@@ -265,6 +266,49 @@ __test_plane_upscaling(data_t *d, igt_plane_t *plane,
 	igt_assert_eq(ret, 0);
 }
 
+static void
+__test_plane_downscaling(data_t *d, igt_plane_t *plane,
+		         enum pipe pipe, igt_output_t *output)
+{
+	igt_display_t *display = &d->display;
+	int width, height;
+	drmModeModeInfo *mode;
+	bool test_complete = false;
+	int scaling = 50;
+	int ret;
+
+	cleanup_crtc(d);
+
+	igt_output_set_pipe(output, pipe);
+	mode = igt_output_get_mode(output);
+	width = mode->hdisplay;
+	height = mode->vdisplay;
+
+	igt_create_color_pattern_fb(display->drm_fd,
+				    width, height,
+				    DRM_FORMAT_XRGB8888,
+				    I915_TILING_NONE,
+				    1.0, 0.0, 0.0, &d->fb[0]);
+
+	igt_plane_set_fb(plane, &d->fb[0]);
+
+	while(!test_complete && scaling < 100) {
+		igt_plane_set_size(plane, (width * scaling) / 100, (height * scaling) / 100);
+		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		if (ret != -EINVAL)
+			test_complete = true;
+
+		scaling += 5;
+	}
+
+	igt_plane_set_fb(plane, NULL);
+	igt_remove_fb(display->drm_fd, &d->fb[0]);
+
+	igt_skip_on_f(ret == -EINVAL || ret == -ERANGE, "Scaling op not supported by driver\n");
+	igt_assert_eq(ret, 0);
+}
+
 static void
 test_plane_scaling(data_t *d, enum pipe pipe, igt_output_t *output, enum scaler_test_type test_type)
 {
@@ -284,9 +328,12 @@ test_plane_scaling(data_t *d, enum pipe pipe, igt_output_t *output, enum scaler_
 			uint32_t format = plane->drm_plane->formats[j];
 			if (test_format(d, &tested_formats, format) &&
 			    igt_plane_has_format_mod(plane, format, modifier) &&
-			    can_scale(d, format))
+			    can_scale(d, format)) {
 				if (test_type == TEST_UPSCALING)
 					__test_plane_upscaling(d, plane, pipe, output);
+				if (test_type == TEST_DOWNSCALING)
+					__test_plane_downscaling(d, plane, pipe, output);
+			}
 		}
 
 		igt_vec_fini(&tested_formats);
@@ -617,6 +664,13 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					test_plane_scaling(&data, pipe, output, TEST_UPSCALING);
 		}
 
+		igt_describe("Tests plane downscaling.");
+		igt_subtest_with_dynamic("plane-downscaling") {
+			for_each_pipe_with_single_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-%s-downscaling", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_plane_scaling(&data, pipe, output, TEST_DOWNSCALING);
+		}
+
 		igt_describe("Tests scaling with pixel formats.");
 		igt_subtest_with_dynamic("scaler-with-pixel-format") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-- 
2.25.1
