Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C7610E56D
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Feb 2022 14:30:34 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Feb 2022 20:14:33 +0530
Message-Id: <20220225144436.17718-6-swati2.sharma@intel.com>
In-Reply-To: <20220225144436.17718-1-swati2.sharma@intel.com>
References: <20220225144436.17718-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v7 5/8] tests/kms_plane_scaling: Upscaling and
 downscaling scenario
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

Upscaling on first plane and downscaling on second plane.

v2: -add check for min 2 scalers
    -add igt_require() for overlay planes, fixes CRASH on KBL
v3: -test modified for n planes (Ville)
v4: -code optimization
v5: -limiting while loop and few other changes based on prev. patches
v6: -rebase
    -modified tests after rebase for consistency and more coverage
    (Petri)
v7: -rename tests
    -added 0.75 scaling factor downscaling tests (Petri)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 108 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 83debe5d..6fc10d59 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -32,6 +32,7 @@ IGT_TEST_DESCRIPTION("Test display plane scaling");
 enum scaler_combo_test_type {
 	TEST_PLANES_UPSCALE = 0,
 	TEST_PLANES_DOWNSCALE,
+	TEST_PLANES_UPSCALE_DOWNSCALE
 };
 
 typedef struct {
@@ -52,6 +53,84 @@ typedef struct {
 	bool extended;
 } data_t;
 
+const struct {
+	const char * const describe;
+	const char * const name;
+	const double sf_plane1;
+	const double sf_plane2;
+} upscale_downscale_tests[] = {
+		{
+			"Tests upscaling (20x20) and downscaling (scaling factor 0.25) of 2 planes.",
+			"planes-upscale-20x20-downscale-factor-0-25",
+			0.0,
+			0.25,
+		},
+		{
+			"Tests upscaling (20x20) and downscaling (scaling factor 0.5) of 2 planes.",
+			"planes-upscale-20x20-downscale-factor-0-5",
+			0.0,
+			0.5,
+		},
+		{
+			"Tests upscaling (20x20) and downscaling (scaling factor 0.75) of 2 planes.",
+			"planes-upscale-20x20-downscale-factor-0-75",
+			0.0,
+			0.75,
+		},
+		{
+			"Tests upscaling (scaling factor 0.25) and downscaling (scaling factor 0.25) of 2 planes.",
+			"planes-upscale-factor-0-25-downscale-factor-0-25",
+			0.25,
+			0.25,
+		},
+		{
+			"Tests upscaling (scaling factor 0.25) and downscaling (scaling factor 0.5) of 2 planes.",
+			"planes-upscale-factor-0-25-downscale-factor-0-5",
+			0.25,
+			0.5,
+		},
+		{
+			"Tests upscaling (scaling factor 0.25) and downscaling (scaling factor 0.75) of 2 planes.",
+			"planes-upscale-factor-0-25-downscale-factor-0-75",
+			0.25,
+			0.75,
+		},
+		{
+			"Tests scaling (unity) and downscaling (scaling factor 0.25) of 2 planes.",
+			"planes-unity-scaling-downscale-factor-0-25",
+			1.0,
+			0.25,
+		},
+		{
+			"Tests scaling (unity) and downscaling (scaling factor 0.5) of 2 planes.",
+			"planes-unity-scaling-downscale-factor-0-5",
+			1.0,
+			0.5,
+		},
+		{
+			"Tests scaling (unity) and downscaling (scaling factor 0.75) of 2 planes.",
+			"planes-unity-scaling-downscale-factor-0-75",
+			1.0,
+			0.75,
+		},
+};
+
+static int get_width(drmModeModeInfo *mode, double scaling_factor)
+{
+	if (scaling_factor == 0.0)
+		return 20;
+	else
+		return mode->hdisplay * scaling_factor;
+}
+
+static int get_height(drmModeModeInfo *mode, double scaling_factor)
+{
+	if (scaling_factor == 0.0)
+		return 20;
+	else
+		return mode->vdisplay * scaling_factor;
+}
+
 static int get_num_scalers(data_t* d, enum pipe pipe)
 {
 	if (!is_i915_device(d->drm_fd))
@@ -500,6 +579,12 @@ __test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
 		/* second plane downscaling */
 		igt_plane_set_size(p2, w2, h2);
 	}
+	if (test_type == TEST_PLANES_UPSCALE_DOWNSCALE) {
+		/* first plane upscaling */
+		igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
+		/* second plane downscaling */
+		igt_plane_set_size(p2, w2, h2);
+	}
 
 	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
@@ -541,6 +626,10 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
 		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, 1.0, 0.0, 0.0, &d->fb[1]);
 		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, 0.0, 1.0, 0.0, &d->fb[2]);
 	}
+	if (test_type == TEST_PLANES_UPSCALE_DOWNSCALE) {
+		setup_fb(display->drm_fd, w1, h1, 1.0, 0.0, 0.0, &d->fb[1]);
+		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, 0.0, 1.0, 0.0, &d->fb[2]);
+	}
 
 	for (int k = 0; k < display->pipes[pipe].n_planes; k++) {
 		igt_plane_t *p1, *p2;
@@ -882,6 +971,25 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 							pipe, output, TEST_PLANES_DOWNSCALE);
 				}
 		}
+
+		for (int index = 0; index < ARRAY_SIZE(upscale_downscale_tests); index++) {
+			igt_describe(upscale_downscale_tests[index].describe);
+			igt_subtest_with_dynamic(upscale_downscale_tests[index].name) {
+			for_each_pipe_with_single_output(&data.display, pipe, output)
+				igt_dynamic_f("pipe-%s-%s-planes-upscale-downscale", kmstest_pipe_name(pipe), igt_output_name(output)) {
+					drmModeModeInfo *mode;
+
+					mode = igt_output_get_mode(output);
+
+					test_planes_scaling_combo(&data,
+							get_width(mode, upscale_downscale_tests[index].sf_plane1),
+							get_height(mode, upscale_downscale_tests[index].sf_plane1),
+							get_width(mode, upscale_downscale_tests[index].sf_plane2),
+							get_height(mode,upscale_downscale_tests[index].sf_plane2),
+							pipe, output, TEST_PLANES_UPSCALE_DOWNSCALE);
+				}
+			}
+		}
 	}
 
 	igt_describe("Tests scaling with multi-pipe scenario.");
-- 
2.25.1
