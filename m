Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA11210E852
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Mar 2023 15:57:08 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Mar 2023 21:29:31 +0530
Message-Id: <20230309155931.5089-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Reorg
 max-source-size subtest
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

The i915-max-source-size test has a restriction that it will
only run on displays with a resolution of 3840x2160. Initially,
the test was written to be executed with a single output,
so on a multi-display setup, even if there was a display with a
resolution of 3840x2160, the test would skip if the first
output didn't support that resolution.

To address this issue, the test has been modified so that it
can run on each valid connector per pipe.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 126 +++++++++++++++++---------------------
 1 file changed, 57 insertions(+), 69 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index c6c6f3ec6..a8bd38ee6 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -26,9 +26,6 @@
 #include "igt_vec.h"
 #include <math.h>
 
-#define HDISPLAY_4K	3840
-#define VDISPLAY_4K	2160
-
 IGT_TEST_DESCRIPTION("Test display plane scaling");
 
 enum scaler_combo_test_type {
@@ -55,6 +52,13 @@ struct invalid_paramtests {
 	} params[8];
 };
 
+static const struct invalid_paramtests i915_paramtests[] = {
+	{
+		.testname = "i915-max-src-size",
+		.planesize = {3840, 2160},
+	},
+};
+
 const struct {
 	const char * const describe;
 	const char * const name;
@@ -1014,73 +1018,35 @@ static drmModeModeInfo *find_mode(data_t *data, igt_output_t *output, const uint
  *		max_dst_w = 8192
  *		max_dst_h = 8192
  */
-
-static void i915_max_source_size_test(data_t *d)
+static void i915_max_source_size_test(data_t *d, enum pipe pipe, igt_output_t *output,
+				      drmModeModeInfo *mode, const uint32_t planesize[])
 {
-	enum pipe pipe = PIPE_A;
-	drmModeModeInfo *mode = NULL;
-	igt_output_t *output;
 	igt_fb_t fb;
 	igt_plane_t *plane;
 	int rval;
 
-	static const struct invalid_paramtests paramtests[] = {
-		{
-			.testname = "max-src-size",
-			.planesize = {3840, 2160},
-		},
-	};
-
-	igt_fixture {
-		igt_require_intel(d->drm_fd);
-
-		output = igt_get_single_output_for_pipe(&d->display, pipe);
-		igt_require(output);
-
-		mode = igt_output_get_mode(output);
-		igt_require(mode->hdisplay >= HDISPLAY_4K && mode->vdisplay >= VDISPLAY_4K);
+	igt_output_set_pipe(output, pipe);
+	igt_output_override_mode(output, mode);
+	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
-		igt_output_set_pipe(output, pipe);
-		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_create_fb(d->drm_fd, 5120, 4320,
+		      DRM_FORMAT_XRGB8888,
+		      DRM_FORMAT_MOD_NONE,
+		      &fb);
 
-		igt_create_fb(d->drm_fd, 5120, 4320,
-			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_NONE,
-			      &fb);
-	}
-
-	igt_describe("test for validating max source size.");
-	igt_subtest_with_dynamic("i915-max-source-size") {
-		for (uint32_t i = 0; i < ARRAY_SIZE(paramtests); i++) {
-			/*
-			 * Need to find mode with lowest vrefresh else
-			 * we can exceed cdclk limits.
-			 */
-			mode = find_mode(d, output, paramtests[i].planesize);
-			if (mode) {
-				igt_output_override_mode(output, mode);
-				igt_dynamic(paramtests[i].testname) {
-					igt_plane_set_position(plane, 0, 0);
-					igt_plane_set_fb(plane, &fb);
-					igt_plane_set_size(plane,
-							   paramtests[i].planesize[0],
-							   paramtests[i].planesize[1]);
+	igt_plane_set_position(plane, 0, 0);
+	igt_plane_set_fb(plane, &fb);
+	igt_plane_set_size(plane, planesize[0], planesize[1]);
 
-				rval = igt_display_try_commit2(&d->display, COMMIT_ATOMIC);
+	rval = igt_display_try_commit2(&d->display, COMMIT_ATOMIC);
 
-				if (intel_display_ver(d->devid) < 11 || intel_display_ver(d->devid) >= 14)
-					igt_assert_eq(rval, -EINVAL);
-				else
-					igt_assert_eq(rval, 0);
-				}
-			}
-		}
-	}
+	if (intel_display_ver(d->devid) < 11 || intel_display_ver(d->devid) >= 14)
+		igt_assert_eq(rval, -EINVAL);
+	else
+		igt_assert_eq(rval, 0);
 
-	igt_fixture {
-		igt_remove_fb(d->drm_fd, &fb);
-		igt_output_set_pipe(output, PIPE_NONE);
-	}
+	igt_plane_set_fb(plane, NULL);
+	cleanup_fbs(d);
 }
 
 static int opt_handler(int opt, int opt_index, void *_data)
@@ -1233,21 +1199,43 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			}
 		}
 
-		igt_describe("Negative test for number of scalers per pipe.");
-		igt_subtest_with_dynamic("invalid-num-scalers") {
-			for_each_pipe_with_valid_output(&data.display, pipe, output)
-				igt_dynamic_f("pipe-%s-%s-invalid-num-scalers",
-					       kmstest_pipe_name(pipe), igt_output_name(output))
-					test_invalid_num_scalers(&data, pipe, output);
+		for (int index = 0; index < ARRAY_SIZE(i915_paramtests); index++) {
+			igt_describe("Test for validating max source size.");
+			igt_subtest_with_dynamic(i915_paramtests[index].testname) {
+				igt_require_intel(data.drm_fd);
+				for_each_pipe(&data.display, pipe) {
+					for_each_valid_output_on_pipe(&data.display, pipe, output) {
+						drmModeModeInfo *mode = NULL;
+						/*
+						 * Need to find mode with lowest vrefresh else
+						 * we can exceed cdclk limits.
+						 */
+						mode = find_mode(&data, output, i915_paramtests[index].planesize);
+						if (mode) {
+							igt_dynamic_f("pipe-%s-%s-i915-max-source-size",
+								       kmstest_pipe_name(pipe), igt_output_name(output))
+								i915_max_source_size_test(&data, pipe, output, mode,
+											  i915_paramtests[index].planesize);
+						}
+						continue;
+					}
+					break;
+				}
+			}
 		}
+
+		igt_describe("Negative test for number of scalers per pipe.");
+			igt_subtest_with_dynamic("invalid-num-scalers") {
+				for_each_pipe_with_valid_output(&data.display, pipe, output)
+					igt_dynamic_f("pipe-%s-%s-invalid-num-scalers",
+						       kmstest_pipe_name(pipe), igt_output_name(output))
+						test_invalid_num_scalers(&data, pipe, output);
+			}
 	}
 
 	igt_subtest_group
 		invalid_parameter_tests(&data);
 
-	igt_subtest_group
-		i915_max_source_size_test(&data);
-
 	igt_describe("Tests scaling with multi-pipe.");
 	igt_subtest_f("2x-scaler-multi-pipe")
 		test_scaler_with_multi_pipe_plane(&data);
-- 
2.25.1
