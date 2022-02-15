Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE95B10E47A
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Feb 2022 12:09:51 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Tue, 15 Feb 2022 17:53:41 +0530
Message-Id: <20220215122344.11168-7-swati2.sharma@intel.com>
In-Reply-To: <20220215122344.11168-1-swati2.sharma@intel.com>
References: <20220215122344.11168-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v4 6/9] tests/kms_plane_scaling: Downscaling on 2 planes
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
v4: -code optimization

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 62 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 2 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 11bf5af9..df0c7959 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -34,6 +34,7 @@ enum {
 	TEST_UPSCALING = 1 << 0,
 	TEST_DOWNSCALING = 1 << 1,
 	TEST_UPSCALING_UPSCALING = 1 << 2,
+	TEST_DOWNSCALING_DOWNSCALING = 1 << 3,
 };
 
 typedef struct {
@@ -370,6 +371,44 @@ __test_planes_upscaling_upscaling(data_t *d, enum pipe pipe, igt_output_t *outpu
 	igt_skip_on_f(ret == -EINVAL, "Scaling op not supported\n");
 }
 
+static void
+__test_planes_downscaling_downscaling(data_t *d, enum pipe pipe, igt_output_t *output,
+				      igt_plane_t *overlay1, igt_plane_t *overlay2,
+				      struct igt_fb *fb1, struct igt_fb *fb2)
+{
+	igt_display_t *display = &d->display;
+	drmModeModeInfo *mode;
+	bool test_complete = false;
+	int width, height;
+	int scaling = 50;
+	int ret;
+
+	mode = igt_output_get_mode(output);
+	width = mode->hdisplay;
+	height = mode->vdisplay;
+
+	igt_plane_set_fb(overlay1, fb1);
+	igt_plane_set_fb(overlay2, fb2);
+
+	while (!test_complete) {
+		/* 1st overlay plane downscaling */
+		igt_plane_set_size(overlay1, (width * scaling) / 100, (height * scaling) / 100);
+		/* 2nd overlay plane downscaling */
+		igt_plane_set_size(overlay2, (width * scaling) / 100, (height * scaling) / 100);
+		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		if (ret != -EINVAL)
+			test_complete = true;
+
+		scaling += 5;
+	}
+
+	igt_plane_set_fb(overlay1, NULL);
+	igt_plane_set_fb(overlay2, NULL);
+
+	igt_skip_on_f(ret == -EINVAL, "Scaling op not supported\n");
+}
+
 static void setup_fb(int fd, int width, int height,
 		     double r, double g, double b,
 		     struct igt_fb *fb)
@@ -384,16 +423,24 @@ static void
 test_plane_scaling_combo(data_t *d, enum pipe pipe, igt_output_t *output, uint32_t flags)
 {
 	igt_display_t *display = &d->display;
-	int width, height;
-
+	int width, height, width1, height1;
+	drmModeModeInfo *mode;
 	cleanup_crtc(d);
 
 	width = height = 20;
 
+	mode = igt_output_get_mode(output);
+	width1 = mode->hdisplay;
+	height = mode->vdisplay;
+
 	if (flags & TEST_UPSCALING_UPSCALING) {
 		setup_fb(display->drm_fd, width, height, 1.0, 0.0, 0.0, &d->fb[1]);
 		setup_fb(display->drm_fd, width, height, 0.0, 1.0, 0.0, &d->fb[2]);
 	}
+	if (flags & TEST_DOWNSCALING_DOWNSCALING) {
+		setup_fb(display->drm_fd, width1, height1, 1.0, 0.0, 0.0, &d->fb[1]);
+		setup_fb(display->drm_fd, width1, height1, 0.0, 1.0, 0.0, &d->fb[2]);
+	}
 
 	igt_output_set_pipe(output, pipe);
 
@@ -412,6 +459,9 @@ test_plane_scaling_combo(data_t *d, enum pipe pipe, igt_output_t *output, uint32
 		if (flags & TEST_UPSCALING_UPSCALING)
 			__test_planes_upscaling_upscaling(d, pipe, output, plane1, plane2,
 							  &d->fb[1], &d->fb[2]);
+		if (flags & TEST_DOWNSCALING_DOWNSCALING)
+			__test_planes_downscaling_downscaling(d, pipe, output, plane1, plane2,
+							      &d->fb[1], &d->fb[2]);
 	}
 
 	igt_remove_fb(display->drm_fd, &d->fb[1]);
@@ -756,6 +806,14 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					test_plane_scaling_combo(&data, pipe, output, TEST_UPSCALING_UPSCALING);
 		}
 
+		igt_describe("Tests downscaling of 2 overlay planes.");
+		igt_subtest_with_dynamic("planes-downscaling-downscaling") {
+			for_each_pipe_with_valid_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-%s-planes-downscaling-downscaling",
+					      kmstest_pipe_name(pipe), igt_output_name(output))
+					test_plane_scaling_combo(&data, pipe, output, TEST_DOWNSCALING_DOWNSCALING);
+		}
+
 		igt_describe("Tests scaling with pixel formats.");
 		igt_subtest_with_dynamic("scaler-with-pixel-format") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-- 
2.25.1
