Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EBC10E0FC
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Dec 2022 10:27:15 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 23 Dec 2022 15:57:39 +0530
Message-Id: <20221223102739.2900-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Add test to
 validate max source size
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Swati2 Sharma <swati2.sharma@intel.com>

Test is added for i915 devices to validate max source size.
This test is expected to pass for platforms having
11 <= display ver < 14 since for these platforms max source
size supported is 5120. For remaining platforms this test is
expected to fail since max source size supported is 4096.
In this test, we are creating 4k fb and trying to upscale it to
5k on a 5k monitor. Platforms having max source size of 5120
will be able to do it, and for remaining platforms its expected
to get -EINVAL.

Signed-off-by: Swati2 Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 64 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 4c621cce..170e8c28 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -26,6 +26,8 @@
 #include "igt_vec.h"
 #include <math.h>
 
+#define HDISPLAY_5K 5120
+
 IGT_TEST_DESCRIPTION("Test display plane scaling");
 
 enum scaler_combo_test_type {
@@ -674,6 +676,49 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
 	igt_remove_fb(display->drm_fd, &d->fb[2]);
 }
 
+static void
+test_max_source_size(data_t *d, enum pipe pipe, igt_output_t *output)
+{
+	igt_display_t *display = &d->display;
+	int w_4k = 4096, h_4k = 2160;
+	int w_5k = 5120, h_5k = 2880;
+	igt_plane_t *plane;
+	int ret;
+
+	cleanup_crtc(d);
+
+	igt_output_set_pipe(output, pipe);
+
+	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_require(plane);
+
+	igt_create_color_pattern_fb(display->drm_fd,
+				    w_4k, h_4k,
+				    DRM_FORMAT_XRGB8888,
+				    I915_TILING_NONE,
+				    1.0, 0.0, 0.0, &d->fb[0]);
+
+	igt_plane_set_fb(plane, &d->fb[0]);
+	igt_plane_set_size(plane, w_5k, h_5k);
+
+	/* This commit is expected to pass for platforms having
+	 * 11 <= display ver < 14 since for these platforms max source
+	 * size supported is 5120. For remaining platforms, this test is
+	 * expected to fail since max source size supported is 4096.
+	 * In dmesg we can find: size is out of scaler range in the case
+	 * of failure.
+	 * */
+	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+	if (intel_display_ver(d->devid) >= 11 && intel_display_ver(d->devid) < 14)
+		igt_assert_eq(ret, 0);
+	else
+		igt_assert_eq(ret, -EINVAL);
+
+	igt_plane_set_fb(plane, NULL);
+	igt_remove_fb(display->drm_fd, &d->fb[0]);
+}
+
 static void
 test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
 {
@@ -970,6 +1015,25 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			}
 		}
 
+		igt_fixture
+			igt_require_f(data.devid, "This test is valid only for i915 devices\n");
+
+		igt_describe("Test for max source size.");
+		igt_subtest_with_dynamic("max-source-size") {
+			for_each_pipe_with_valid_output(&data.display, pipe, output) {
+					drmModeModeInfo *mode;
+
+					mode = igt_output_get_mode(output);
+
+					if (mode->hdisplay < HDISPLAY_5K)
+						continue;
+
+					igt_dynamic_f("pipe-%s-%s-max-source-size",
+					       kmstest_pipe_name(pipe), igt_output_name(output))
+					test_max_source_size(&data, pipe, output);
+			}
+		}
+
 		igt_describe("Negative test for number of scalers per pipe.");
 		igt_subtest_with_dynamic("invalid-num-scalers") {
 			for_each_pipe_with_valid_output(&data.display, pipe, output)
-- 
2.25.1
