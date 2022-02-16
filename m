Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3085A10E794
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Feb 2022 12:08:19 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Wed, 16 Feb 2022 17:52:13 +0530
Message-Id: <20220216122217.16507-6-swati2.sharma@intel.com>
In-Reply-To: <20220216122217.16507-1-swati2.sharma@intel.com>
References: <20220216122217.16507-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v5 5/9] tests/kms_plane_scaling: Upscaling on 2 planes
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

i915 driver supports 2 scalers per pipe. Added test case
to upscale 2 planes simultaneously on single pipe.

v2: -add check for min 2 scalers
    -add igt_require() for overlay planes, fixes CRASH on KBL
v3: -test modified for n planes (Ville)
v4: -modularized the code
    -removed i915 dependency (Ville)
v5: -added primary plane back (Ville)
    -whitespace fixed (Ville)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 85 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 0be7dc0c..a9088814 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -32,6 +32,7 @@ IGT_TEST_DESCRIPTION("Test display plane scaling");
 enum scaler_test_type {
 	TEST_UPSCALING = 0,
 	TEST_DOWNSCALING,
+	TEST_UPSCALING_UPSCALING,
 };
 
 typedef struct {
@@ -340,6 +341,83 @@ test_plane_scaling(data_t *d, enum pipe pipe, igt_output_t *output, enum scaler_
 	}
 }
 
+static void
+__test_planes_upscaling_upscaling(data_t *d, enum pipe pipe, igt_output_t *output,
+				  igt_plane_t *plane1, igt_plane_t *plane2,
+				  struct igt_fb *fb1, struct igt_fb *fb2)
+{
+	igt_display_t *display = &d->display;
+	drmModeModeInfo *mode;
+	int width, height;
+	int ret;
+
+	mode = igt_output_get_mode(output);
+	width = mode->hdisplay;
+	height = mode->vdisplay;
+
+	igt_plane_set_fb(plane1, fb1);
+	igt_plane_set_fb(plane2, fb2);
+
+	/* first plane upscaling */
+	igt_plane_set_size(plane1, width, height);
+	/* second plane upscaling */
+	igt_plane_set_size(plane2, width - 20, height - 20);
+	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+	igt_plane_set_fb(plane1, NULL);
+	igt_plane_set_fb(plane2, NULL);
+
+	igt_skip_on_f(ret == -EINVAL || ret == -ERANGE, "Scaling op not supported by driver\n");
+	igt_assert_eq(ret, 0);
+}
+
+static void setup_fb(int fd, int width, int height,
+		     double r, double g, double b,
+		     struct igt_fb *fb)
+{
+	igt_create_color_pattern_fb(fd, width, height,
+				    DRM_FORMAT_XRGB8888,
+				    I915_TILING_NONE,
+				    r, g, b, fb);
+}
+
+static void
+test_plane_scaling_combo(data_t *d, enum pipe pipe, igt_output_t *output, enum scaler_test_type test_type)
+{
+	igt_display_t *display = &d->display;
+	int width, height;
+
+	cleanup_crtc(d);
+
+	width = height = 20;
+
+	if (test_type == TEST_UPSCALING_UPSCALING) {
+		setup_fb(display->drm_fd, width, height, 1.0, 0.0, 0.0, &d->fb[1]);
+		setup_fb(display->drm_fd, width, height, 0.0, 1.0, 0.0, &d->fb[2]);
+	}
+
+	igt_output_set_pipe(output, pipe);
+
+	for (int k = 0; k < display->pipes[pipe].n_planes; k++) {
+		igt_plane_t *p1, *p2;
+
+		p1 = &display->pipes[pipe].planes[k];
+		igt_require(p1);
+		p2 = &display->pipes[pipe].planes[k+1];
+		igt_require(p2);
+
+		if (p1->type == DRM_PLANE_TYPE_CURSOR || p2->type == DRM_PLANE_TYPE_CURSOR)
+				continue;
+
+		if (test_type == TEST_UPSCALING_UPSCALING)
+			__test_planes_upscaling_upscaling(d, pipe, output, p1, p2,
+							  &d->fb[1], &d->fb[2]);
+	}
+
+	igt_remove_fb(display->drm_fd, &d->fb[1]);
+	igt_remove_fb(display->drm_fd, &d->fb[2]);
+}
+
 static bool test_pipe_iteration(data_t *data, enum pipe pipe, int iteration)
 {
 	if (!is_i915_device(data->drm_fd) ||
@@ -671,6 +749,13 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					test_plane_scaling(&data, pipe, output, TEST_DOWNSCALING);
 		}
 
+		igt_describe("Tests upscaling of 2 planes.");
+		igt_subtest_with_dynamic("planes-upscaling-upscaling") {
+			for_each_pipe_with_single_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-%s-planes-upscaling-upscaling", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_plane_scaling_combo(&data, pipe, output, TEST_UPSCALING_UPSCALING);
+		}
+
 		igt_describe("Tests scaling with pixel formats.");
 		igt_subtest_with_dynamic("scaler-with-pixel-format") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-- 
2.25.1
