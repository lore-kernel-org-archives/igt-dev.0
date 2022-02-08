Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9195710E667
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Feb 2022 05:36:43 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Tue,  8 Feb 2022 11:20:35 +0530
Message-Id: <20220208055039.31306-6-swati2.sharma@intel.com>
In-Reply-To: <20220208055039.31306-1-swati2.sharma@intel.com>
References: <20220208055039.31306-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 5/9] tests/kms_plane_scaling: Upscaling on 2 planes
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
to upscale 2 overlay planes simultaneously on single pipe.

v2: -add check for min 2 scalers
    -add igt_require() for overlay planes, fixes CRASH on KBL

v3: -test modified for n planes (Ville)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 74 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 22563fac..f813c5b4 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -29,6 +29,11 @@
 
 IGT_TEST_DESCRIPTION("Test display plane scaling");
 
+/* Test flags. */
+enum {
+        TEST_UP_UP_SCALING = 1 << 0,
+};
+
 typedef struct {
 	uint32_t devid;
 	int drm_fd;
@@ -358,6 +363,67 @@ test_plane_downscaling(data_t *d, enum pipe pipe, igt_output_t *output)
 	}
 }
 
+static void
+__test_plane_up_up_scaling(data_t *d, enum pipe pipe, igt_output_t *output)
+{
+	drmModeModeInfo *mode;
+	int width, height;
+	igt_display_t *display = &d->display;
+
+	cleanup_crtc(d);
+
+	igt_output_set_pipe(output, pipe);
+	mode = igt_output_get_mode(output);
+	width = height = 20;
+
+	for (int k = 0; k < display->pipes[pipe].n_planes; k++) {
+		igt_plane_t *plane1, *plane2;
+
+		plane1 = &display->pipes[pipe].planes[k];
+		igt_require(plane1);
+		plane2 = &display->pipes[pipe].planes[k+1];
+		igt_require(plane2);
+
+		if (plane1->type == DRM_PLANE_TYPE_PRIMARY  || plane1->type == DRM_PLANE_TYPE_CURSOR ||
+		    plane2->type == DRM_PLANE_TYPE_PRIMARY || plane2->type ==DRM_PLANE_TYPE_CURSOR)
+				continue;
+
+		igt_create_color_pattern_fb(display->drm_fd,
+					    width, height,
+					    DRM_FORMAT_XRGB8888,
+					    I915_TILING_NONE,
+					    1.0, 0.0, 0.0, &d->fb[1]);
+		igt_create_color_pattern_fb(display->drm_fd,
+					    width, height,
+					    DRM_FORMAT_XRGB8888,
+					    I915_TILING_NONE,
+					    0.0, 1.0, 0.0, &d->fb[2]);
+
+		igt_plane_set_fb(plane1, &d->fb[1]);
+		igt_plane_set_fb(plane2, &d->fb[2]);
+
+		/* 1st overlay plane upscaling */
+		igt_plane_set_size(plane1, mode->hdisplay, mode->vdisplay);
+		/* 2nd overlay plane upscaling */
+		igt_plane_set_size(plane2, mode->hdisplay - 20, mode->vdisplay - 20);
+		igt_display_commit2(display, COMMIT_ATOMIC);
+
+		igt_plane_set_fb(plane1, NULL);
+		igt_plane_set_fb(plane2, NULL);
+		igt_remove_fb(display->drm_fd, &d->fb[1]);
+		igt_remove_fb(display->drm_fd, &d->fb[2]);
+	}
+}
+
+static void
+test_plane_scaling_combo(data_t *d, enum pipe pipe, igt_output_t *output, uint32_t flags)
+{
+	igt_require(get_num_scalers(d, pipe) >= 2);
+
+	if (flags & TEST_UP_UP_SCALING)
+		__test_plane_up_up_scaling(d, pipe, output);
+}
+
 static bool test_pipe_iteration(data_t *data, enum pipe pipe, int iteration)
 {
 	if (!is_i915_device(data->drm_fd) ||
@@ -689,6 +755,14 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					test_plane_downscaling(&data, pipe, output);
 		}
 
+		igt_describe("Tests upscaling of 2 overlay planes.");
+		igt_subtest_with_dynamic("plane-up-up-scaling") {
+			for_each_pipe_with_single_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-%s-plane-up-up-scaling",
+					      kmstest_pipe_name(pipe), igt_output_name(output))
+					test_plane_scaling_combo(&data, pipe, output, TEST_UP_UP_SCALING);
+		}
+
 		igt_describe("Tests scaling with pixel formats.");
 		igt_subtest_with_dynamic("scaler-with-pixel-format") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-- 
2.25.1
