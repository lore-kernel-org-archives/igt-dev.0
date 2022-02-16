Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80D910E795
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Feb 2022 12:08:23 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Wed, 16 Feb 2022 17:52:15 +0530
Message-Id: <20220216122217.16507-8-swati2.sharma@intel.com>
In-Reply-To: <20220216122217.16507-1-swati2.sharma@intel.com>
References: <20220216122217.16507-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v5 7/9] tests/kms_plane_scaling: Upscaling and
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

Upscaling on first plane and downscaling on second plane.

v2: -add check for min 2 scalers
    -add igt_require() for overlay planes, fixes CRASH on KBL
v3: -test modified for n planes (Ville)
v4: -code optimization
v5: -limiting while loop and few other changes based on prev. patches

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 56 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 1262a8ee..797322c4 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -34,6 +34,7 @@ enum scaler_test_type {
 	TEST_DOWNSCALING,
 	TEST_UPSCALING_UPSCALING,
 	TEST_DOWNSCALING_DOWNSCALING,
+	TEST_UPSCALING_DOWNSCALING,
 };
 
 typedef struct {
@@ -411,6 +412,45 @@ __test_planes_downscaling_downscaling(data_t *d, enum pipe pipe, igt_output_t *o
 	igt_assert_eq(ret, 0);
 }
 
+static void
+__test_planes_upscaling_downscaling(data_t *d, enum pipe pipe, igt_output_t *output,
+				    igt_plane_t *plane1, igt_plane_t *plane2,
+				    struct igt_fb *fb1, struct igt_fb *fb2)
+{
+	igt_display_t *display = &d->display;
+	bool test_complete = false;
+	drmModeModeInfo *mode;
+	int width, height;
+	int scaling = 50;
+	int ret;
+
+	mode = igt_output_get_mode(output);
+	width = mode->hdisplay;
+	height = mode->vdisplay;
+
+	igt_plane_set_fb(plane1, fb1);
+	igt_plane_set_fb(plane2, fb2);
+
+	while (!test_complete && scaling < 100) {
+		/* first plane upscaling */
+		igt_plane_set_size(plane1, width, height);
+		/* second plane downscaling */
+		igt_plane_set_size(plane2, (width * scaling) / 100, (height * scaling) / 100);
+		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		if (ret != -EINVAL)
+			test_complete = true;
+
+		scaling += 5;
+	}
+
+	igt_plane_set_fb(plane1, NULL);
+	igt_plane_set_fb(plane2, NULL);
+
+	igt_skip_on_f(ret == -EINVAL || ret == -ERANGE, "Scaling op not supported by driver\n");
+	igt_assert_eq(ret, 0);
+}
+
 static void setup_fb(int fd, int width, int height,
 		     double r, double g, double b,
 		     struct igt_fb *fb)
@@ -443,6 +483,10 @@ test_plane_scaling_combo(data_t *d, enum pipe pipe, igt_output_t *output, enum s
 		setup_fb(display->drm_fd, width1, height1, 1.0, 0.0, 0.0, &d->fb[1]);
 		setup_fb(display->drm_fd, width1, height1, 0.0, 1.0, 0.0, &d->fb[2]);
 	}
+	if (test_type == TEST_UPSCALING_DOWNSCALING) {
+		setup_fb(display->drm_fd, width, height, 1.0, 0.0, 0.0, &d->fb[1]);
+		setup_fb(display->drm_fd, width1, height1, 0.0, 1.0, 0.0, &d->fb[2]);
+	}
 
 	igt_output_set_pipe(output, pipe);
 
@@ -463,7 +507,9 @@ test_plane_scaling_combo(data_t *d, enum pipe pipe, igt_output_t *output, enum s
 		if (test_type == TEST_DOWNSCALING_DOWNSCALING)
 			__test_planes_downscaling_downscaling(d, pipe, output, p1, p2,
 							      &d->fb[1], &d->fb[2]);
-
+		if (test_type == TEST_UPSCALING_DOWNSCALING)
+			__test_planes_upscaling_downscaling(d, pipe, output, p1, p2,
+							    &d->fb[1], &d->fb[2]);
 	}
 
 	igt_remove_fb(display->drm_fd, &d->fb[1]);
@@ -816,6 +862,14 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 					test_plane_scaling_combo(&data, pipe, output, TEST_DOWNSCALING_DOWNSCALING);
 		}
 
+		igt_describe("Tests upscaling and downscaling of 2 planes.");
+		igt_subtest_with_dynamic("planes-upscaling-downscaling") {
+			for_each_pipe_with_valid_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-%s-planes-upscaling-downscaling",
+					       kmstest_pipe_name(pipe), igt_output_name(output))
+					test_plane_scaling_combo(&data, pipe, output, TEST_UPSCALING_DOWNSCALING);
+		}
+
 		igt_describe("Tests scaling with pixel formats.");
 		igt_subtest_with_dynamic("scaler-with-pixel-format") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
-- 
2.25.1
