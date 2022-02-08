Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3B810E667
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Feb 2022 05:36:54 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Tue,  8 Feb 2022 11:20:36 +0530
Message-Id: <20220208055039.31306-7-swati2.sharma@intel.com>
In-Reply-To: <20220208055039.31306-1-swati2.sharma@intel.com>
References: <20220208055039.31306-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 6/9] tests/kms_plane_scaling: Downscaling on 2 planes
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

v3: -test modified for n planes (Ville)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 79 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index f813c5b4..5dac5fb3 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -32,6 +32,7 @@ IGT_TEST_DESCRIPTION("Test display plane scaling");
 /* Test flags. */
 enum {
         TEST_UP_UP_SCALING = 1 << 0,
+        TEST_DOWN_DOWN_SCALING = 1 << 1,
 };
 
 typedef struct {
@@ -415,6 +416,74 @@ __test_plane_up_up_scaling(data_t *d, enum pipe pipe, igt_output_t *output)
 	}
 }
 
+static void
+__test_plane_down_down_scaling(data_t *d, enum pipe pipe, igt_output_t *output)
+{
+	igt_display_t *display = &d->display;
+	drmModeModeInfo *mode;
+	bool test_complete;
+	int width, height;
+	int scaling;
+	int ret;
+
+	cleanup_crtc(d);
+
+	igt_output_set_pipe(output, pipe);
+	mode = igt_output_get_mode(output);
+	width = mode->hdisplay;
+	height = mode->vdisplay;
+
+	for (int k = 0; k < display->pipes[pipe].n_planes; k++) {
+		test_complete = false;
+		scaling = 50;
+
+		while (!test_complete) {
+			igt_plane_t *plane1, *plane2;
+
+			plane1 = &display->pipes[pipe].planes[k];
+			igt_require(plane1);
+			plane2 = &display->pipes[pipe].planes[k+1];
+			igt_require(plane2);
+
+			if (plane1->type == DRM_PLANE_TYPE_PRIMARY || plane1->type == DRM_PLANE_TYPE_CURSOR ||
+			    plane2->type == DRM_PLANE_TYPE_PRIMARY || plane2->type ==DRM_PLANE_TYPE_CURSOR)
+					break;
+
+			igt_create_color_pattern_fb(display->drm_fd,
+						    width, height,
+						    DRM_FORMAT_XRGB8888,
+						    I915_TILING_NONE,
+						    1.0, 0.0, 0.0, &d->fb[1]);
+			igt_create_color_pattern_fb(display->drm_fd,
+						    width, height,
+						    DRM_FORMAT_XRGB8888,
+						    I915_TILING_NONE,
+						    0.0, 1.0, 0.0, &d->fb[2]);
+
+			igt_plane_set_fb(plane1, &d->fb[1]);
+			igt_plane_set_fb(plane2, &d->fb[2]);
+
+			/* 1st overlay plane downscaling */
+			igt_plane_set_size(plane1, (width * scaling) / 100, (height * scaling) / 100);
+			/* 2nd overlay plane downscaling */
+			igt_plane_set_size(plane2, (width * scaling) / 100, (height * scaling) / 100);
+
+			ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+			if (ret != -EINVAL)
+				test_complete = true;
+
+			scaling += 5;
+
+			/* cleanup */
+			igt_plane_set_fb(plane1, NULL);
+			igt_plane_set_fb(plane2, NULL);
+			igt_remove_fb(display->drm_fd, &d->fb[1]);
+			igt_remove_fb(display->drm_fd, &d->fb[2]);
+		}
+	}
+}
+
 static void
 test_plane_scaling_combo(data_t *d, enum pipe pipe, igt_output_t *output, uint32_t flags)
 {
@@ -422,6 +491,8 @@ test_plane_scaling_combo(data_t *d, enum pipe pipe, igt_output_t *output, uint32
 
 	if (flags & TEST_UP_UP_SCALING)
 		__test_plane_up_up_scaling(d, pipe, output);
+	if (flags & TEST_DOWN_DOWN_SCALING)
+		__test_plane_down_down_scaling(d, pipe, output);
 }
 
 static bool test_pipe_iteration(data_t *data, enum pipe pipe, int iteration)
@@ -763,6 +834,14 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					test_plane_scaling_combo(&data, pipe, output, TEST_UP_UP_SCALING);
 		}
 
+		igt_describe("Tests downscaling of 2 overlay planes.");
+		igt_subtest_with_dynamic("plane-down-down-scaling") {
+			for_each_pipe_with_valid_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-%s-plane-down-down-scaling",
+					      kmstest_pipe_name(pipe), igt_output_name(output))
+					test_plane_scaling_combo(&data, pipe, output, TEST_DOWN_DOWN_SCALING);
+		}
+
 		igt_describe("Tests scaling with pixel formats.");
 		igt_subtest_with_dynamic("scaler-with-pixel-format") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-- 
2.25.1
