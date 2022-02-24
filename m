Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22FCE10F85F
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Feb 2022 09:58:21 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Feb 2022 15:42:20 +0530
Message-Id: <20220224101224.12319-5-swati2.sharma@intel.com>
In-Reply-To: <20220224101224.12319-1-swati2.sharma@intel.com>
References: <20220224101224.12319-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v6 4/8] tests/kms_plane_scaling: Downscaling on 2 planes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Added test case to downscale 2 planes simultaneously.
i915 driver supports max of 3:1 downscaling limit.

v2: -add check for min 2 scalers
    -add igt_require() for overlay planes, fixes CRASH on KBL
v3: -test modified for n planes (Ville)
v4: -code optimization
v5: -limiting while loop (Ville)
v6: -rebase
    -modified tests after rebase for consistency and more coverage
     (Petri)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 44 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index e7ebd3ee..8ed75ab6 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -31,6 +31,7 @@ IGT_TEST_DESCRIPTION("Test display plane scaling");
 
 enum scaler_combo_test_type {
 	TEST_PLANES_UPSCALE = 0,
+	TEST_PLANES_DOWNSCALE,
 };
 
 typedef struct {
@@ -493,6 +494,12 @@ __test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
 		/* second plane upscaling */
 		igt_plane_set_size(p2, mode->hdisplay - 20, mode->vdisplay - 20);
 	}
+	if (test_type == TEST_PLANES_DOWNSCALE) {
+		/* first plane downscaling */
+		igt_plane_set_size(p1, w1, h1);
+		/* second plane downscaling */
+		igt_plane_set_size(p2, w2, h2);
+	}
 
 	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
@@ -519,15 +526,21 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
 			  enum scaler_combo_test_type test_type)
 {
 	igt_display_t *display = &d->display;
+	drmModeModeInfo *mode;
 
 	cleanup_crtc(d);
 
 	igt_output_set_pipe(output, pipe);
+	mode = igt_output_get_mode(output);
 
 	if (test_type == TEST_PLANES_UPSCALE) {
 		setup_fb(display->drm_fd, w1, h1, 1.0, 0.0, 0.0, &d->fb[1]);
 		setup_fb(display->drm_fd, w2, h2, 0.0, 1.0, 0.0, &d->fb[2]);
 	}
+	if (test_type == TEST_PLANES_DOWNSCALE) {
+		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, 1.0, 0.0, 0.0, &d->fb[1]);
+		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, 0.0, 1.0, 0.0, &d->fb[2]);
+	}
 
 	for (int k = 0; k < display->pipes[pipe].n_planes; k++) {
 		igt_plane_t *p1, *p2;
@@ -824,6 +837,37 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 							pipe, output, TEST_PLANES_UPSCALE);
 				}
 		}
+
+		igt_describe("Tests downscaling of 2 planes, scaling factor 4.");
+		igt_subtest_with_dynamic("planes-downscale-factor-4") {
+			for_each_pipe_with_single_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-%s-planes-downscale", kmstest_pipe_name(pipe), igt_output_name(output)) {
+					drmModeModeInfo *mode;
+
+					mode = igt_output_get_mode(output);
+
+					test_planes_scaling_combo(&data,
+							mode->hdisplay / 4, mode->vdisplay / 4,
+							mode->hdisplay / 4, mode->vdisplay / 4,
+							pipe, output, TEST_PLANES_DOWNSCALE);
+				}
+		}
+
+		igt_describe("Tests downscaling of 2 planes, scaling factor 2.");
+		igt_subtest_with_dynamic("planes-downscale-factor-2") {
+			for_each_pipe_with_single_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-%s-planes-downscale", kmstest_pipe_name(pipe), igt_output_name(output)) {
+					drmModeModeInfo *mode;
+
+					mode = igt_output_get_mode(output);
+
+					test_planes_scaling_combo(&data,
+							mode->hdisplay / 2, mode->vdisplay / 2,
+							mode->hdisplay / 2, mode->vdisplay / 2,
+							pipe, output, TEST_PLANES_DOWNSCALE);
+				}
+		}
+
 	}
 
 	igt_describe("Tests scaling with multi-pipe scenario.");
-- 
2.25.1
