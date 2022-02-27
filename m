Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E4110E5BB
 for <igt-dev@lists.freedesktop.org>; Sun, 27 Feb 2022 16:16:57 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 27 Feb 2022 22:00:55 +0530
Message-Id: <20220227163057.28703-7-swati2.sharma@intel.com>
In-Reply-To: <20220227163057.28703-1-swati2.sharma@intel.com>
References: <20220227163057.28703-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v8 6/8] tests/kms_plane_scaling: Downscaling on 2 planes
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
v7: -rename tests
    -add 0.75 scaling factor test (Petri)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 58 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index eb353459..45081ab4 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -30,6 +30,7 @@ IGT_TEST_DESCRIPTION("Test display plane scaling");
 
 enum scaler_combo_test_type {
 	TEST_PLANES_UPSCALE = 0,
+	TEST_PLANES_DOWNSCALE,
 };
 
 typedef struct {
@@ -343,6 +344,12 @@ __test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
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
 
@@ -370,15 +377,21 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
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
@@ -713,6 +726,51 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 							pipe, output, TEST_PLANES_UPSCALE);
 				}
 		}
+
+		igt_describe("Tests downscaling of 2 planes for 0.25 scaling factor.");
+		igt_subtest_with_dynamic("planes-downscale-factor-0-25") {
+			for_each_pipe_with_single_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-%s-planes-downscale", kmstest_pipe_name(pipe), igt_output_name(output)) {
+					drmModeModeInfo *mode;
+
+					mode = igt_output_get_mode(output);
+
+					test_planes_scaling_combo(&data,
+							0.25 * mode->hdisplay, 0.25 * mode->vdisplay,
+							0.25 * mode->hdisplay, 0.25 * mode->vdisplay,
+							pipe, output, TEST_PLANES_DOWNSCALE);
+				}
+		}
+
+		igt_describe("Tests downscaling of 2 planes for 0.5 scaling factor.");
+		igt_subtest_with_dynamic("planes-downscale-factor-0-5") {
+			for_each_pipe_with_single_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-%s-planes-downscale", kmstest_pipe_name(pipe), igt_output_name(output)) {
+					drmModeModeInfo *mode;
+
+					mode = igt_output_get_mode(output);
+
+					test_planes_scaling_combo(&data,
+							0.5 * mode->hdisplay, 0.5 * mode->vdisplay,
+							0.5 * mode->hdisplay, 0.5 * mode->vdisplay,
+							pipe, output, TEST_PLANES_DOWNSCALE);
+				}
+		}
+
+		igt_describe("Tests downscaling of 2 planes for 0.75 scaling factor.");
+		igt_subtest_with_dynamic("planes-downscale-factor-0-75") {
+			for_each_pipe_with_single_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-%s-planes-downscale", kmstest_pipe_name(pipe), igt_output_name(output)) {
+					drmModeModeInfo *mode;
+
+					mode = igt_output_get_mode(output);
+
+					test_planes_scaling_combo(&data,
+							0.75 * mode->hdisplay, 0.75 * mode->vdisplay,
+							0.75 * mode->hdisplay, 0.75 * mode->vdisplay,
+							pipe, output, TEST_PLANES_DOWNSCALE);
+				}
+		}
 	}
 
 	igt_describe("Tests scaling with multi-pipe scenario.");
-- 
2.25.1
