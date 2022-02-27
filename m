Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63F1510E5AD
 for <igt-dev@lists.freedesktop.org>; Sun, 27 Feb 2022 16:16:55 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 27 Feb 2022 22:00:54 +0530
Message-Id: <20220227163057.28703-6-swati2.sharma@intel.com>
In-Reply-To: <20220227163057.28703-1-swati2.sharma@intel.com>
References: <20220227163057.28703-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v8 5/8] tests/kms_plane_scaling: Upscaling on 2 planes
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

i915 driver supports 2 scalers per pipe. Added test case
to upscale 2 planes simultaneously on single pipe.

v2: -add check for min 2 scalers
    -add igt_require() for overlay planes, fixes CRASH on KBL
v3: -test modified for n planes (Ville)
v4: -modularized the code
    -removed i915 dependency (Ville)
v5: -added primary plane back (Ville)
    -whitespace fixed (Ville)
v6: -rebase
    -modified tests after rebase for consistency and more coverage
    (Petri)
v7: -renaming tests

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 122 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 5630333e..eb353459 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -28,6 +28,10 @@
 
 IGT_TEST_DESCRIPTION("Test display plane scaling");
 
+enum scaler_combo_test_type {
+	TEST_PLANES_UPSCALE = 0,
+};
+
 typedef struct {
 	uint32_t devid;
 	int drm_fd;
@@ -317,6 +321,86 @@ static void find_connected_pipe(igt_display_t *display, bool second, enum pipe *
 		igt_require_f(found, "No valid outputs found\n");
 }
 
+static void
+__test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
+			    enum pipe pipe, igt_output_t *output,
+			    igt_plane_t *p1, igt_plane_t *p2,
+			    struct igt_fb *fb1, struct igt_fb *fb2,
+			    enum scaler_combo_test_type test_type)
+{
+	igt_display_t *display = &d->display;
+	drmModeModeInfo *mode;
+	int ret;
+
+	mode = igt_output_get_mode(output);
+
+	igt_plane_set_fb(p1, fb1);
+	igt_plane_set_fb(p2, fb2);
+
+	if (test_type == TEST_PLANES_UPSCALE) {
+		/* first plane upscaling */
+		igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
+		/* second plane upscaling */
+		igt_plane_set_size(p2, mode->hdisplay - 20, mode->vdisplay - 20);
+	}
+
+	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+	igt_plane_set_fb(p1, NULL);
+	igt_plane_set_fb(p2, NULL);
+
+	igt_skip_on_f(ret == -EINVAL || ret == -ERANGE,
+		      "Scaling op not supported by driver\n");
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
+test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
+			  enum pipe pipe, igt_output_t *output,
+			  enum scaler_combo_test_type test_type)
+{
+	igt_display_t *display = &d->display;
+
+	cleanup_crtc(d);
+
+	igt_output_set_pipe(output, pipe);
+
+	if (test_type == TEST_PLANES_UPSCALE) {
+		setup_fb(display->drm_fd, w1, h1, 1.0, 0.0, 0.0, &d->fb[1]);
+		setup_fb(display->drm_fd, w2, h2, 0.0, 1.0, 0.0, &d->fb[2]);
+	}
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
+		__test_planes_scaling_combo(d, w1, h1, w2, h2,
+					    pipe, output, p1, p2,
+					    &d->fb[1], &d->fb[2],
+					    test_type);
+	}
+
+	igt_remove_fb(display->drm_fd, &d->fb[1]);
+	igt_remove_fb(display->drm_fd, &d->fb[2]);
+}
+
 static void test_scaler_with_multi_pipe_plane(data_t *d)
 {
 	igt_display_t *display = &d->display;
@@ -591,6 +675,44 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 							mode->vdisplay + 100, false, pipe, output);
 			}
 		}
+
+		igt_describe("Tests upscaling of 2 planes, from 20x20 fb.");
+		igt_subtest_with_dynamic("planes-upscale-20x20") {
+			for_each_pipe_with_single_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-%s-planes-upscale", kmstest_pipe_name(pipe), igt_output_name(output))
+					test_planes_scaling_combo(&data, 20, 20, 20, 20,
+							pipe, output, TEST_PLANES_UPSCALE);
+		}
+
+		igt_describe("Tests upscaling of 2 planes for 0.25 scaling factor.");
+		igt_subtest_with_dynamic("planes-upscale-factor-0-25") {
+			for_each_pipe_with_single_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-%s-planes-upscale", kmstest_pipe_name(pipe), igt_output_name(output)) {
+					drmModeModeInfo *mode;
+
+					mode = igt_output_get_mode(output);
+
+					test_planes_scaling_combo(&data,
+							0.25 * mode->hdisplay, 0.25 * mode->vdisplay,
+							0.25 * mode->hdisplay, 0.25 * mode->vdisplay,
+							pipe, output, TEST_PLANES_UPSCALE);
+				}
+		}
+
+		igt_describe("Tests scaling of 2 planes, unity scaling.");
+		igt_subtest_with_dynamic("planes-scaling-unity-scaling") {
+			for_each_pipe_with_single_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-%s-planes-unity-scaling", kmstest_pipe_name(pipe), igt_output_name(output)) {
+					drmModeModeInfo *mode;
+
+					mode = igt_output_get_mode(output);
+
+					test_planes_scaling_combo(&data,
+							mode->hdisplay, mode->vdisplay,
+							mode->hdisplay, mode->vdisplay,
+							pipe, output, TEST_PLANES_UPSCALE);
+				}
+		}
 	}
 
 	igt_describe("Tests scaling with multi-pipe scenario.");
-- 
2.25.1
