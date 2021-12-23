Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A557510E2FC
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Dec 2021 10:28:17 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Thu, 23 Dec 2021 16:11:45 +0530
Message-Id: <20211223104146.4004-6-swati2.sharma@intel.com>
In-Reply-To: <20211223104146.4004-1-swati2.sharma@intel.com>
References: <20211223104146.4004-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/6] tests/kms_plane_scaling: Upscaling and
 downscaling scenario
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

Did upscaling on first overlay plane and downscaling on second
overlay plane.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 48 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 385defdc..71aeea7c 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -339,6 +339,47 @@ test_downscale_downscale_plane_scaling_on_pipe(data_t *d, enum pipe pipe, igt_ou
         }
 }
 
+static void
+test_upscale_downscale_plane_scaling_on_pipe(data_t *d, enum pipe pipe, igt_output_t *output)
+{
+	drmModeModeInfo *mode;
+	igt_display_t *display = &d->display;
+	igt_pipe_t *pipe_obj = &display->pipes[pipe];
+
+	igt_require(get_num_scalers(d, pipe) > 0);
+
+	mode = igt_output_get_mode(output);
+
+	/* setup display with primary plane */
+	d->plane1 = igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_PRIMARY);
+	prepare_crtc(d, output, pipe, d->plane1, mode);
+
+	d->plane2 = igt_pipe_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 0);
+	d->plane3 = igt_pipe_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 1);
+
+	igt_create_color_pattern_fb(display->drm_fd,
+				    mode->hdisplay / 3, mode->vdisplay / 3,
+				    DRM_FORMAT_XRGB8888,
+				    I915_TILING_NONE,
+				    1.0, 0.0, 0.0, &d->fb[1]);
+	igt_create_color_pattern_fb(display->drm_fd,
+				    mode->hdisplay, mode->vdisplay,
+				    DRM_FORMAT_XRGB8888,
+				    I915_TILING_NONE,
+				    0.0, 1.0, 0.0, &d->fb[2]);
+
+	igt_plane_set_fb(d->plane2, &d->fb[1]);
+	igt_plane_set_fb(d->plane3, &d->fb[2]);
+
+	/* 1st overlay plane upscaling */
+	igt_plane_set_size(d->plane2, mode->hdisplay, mode->vdisplay);
+
+	/* 2nd overlay plane downscaling */
+	igt_plane_set_size(d->plane3, mode->hdisplay - 20, mode->vdisplay - 20);
+
+	igt_display_commit2(display, COMMIT_ATOMIC);
+}
+
 static void test_scaler_with_rotation_pipe(data_t *d, enum pipe pipe,
 					   igt_output_t *output)
 {
@@ -658,6 +699,13 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					test_downscale_downscale_plane_scaling_on_pipe(&data, pipe, output);
 		}
 
+		igt_describe("Tests upscaling and downscaling overlay planes.");
+		igt_subtest_with_dynamic("upscale-downscale-plane-scaling") {
+			for_each_pipe_with_valid_output(&data.display, pipe, output)
+				igt_dynamic_f("%s-pipe-%s-upscale-downscale-plane-scaling", igt_output_name(output), kmstest_pipe_name(pipe))
+					test_upscale_downscale_plane_scaling_on_pipe(&data, pipe, output);
+		}
+
 		igt_describe("Tests scaling with pixel formats.");
 		igt_subtest_with_dynamic("scaler-with-pixel-format") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-- 
2.25.1
