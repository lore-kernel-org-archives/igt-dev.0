Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3466E9AB
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2020 05:37:31 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Fri, 16 Oct 2020 11:15:21 +0530
Message-Id: <20201016054521.29658-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC, i-g-t] Added dynamic subtests for accurate reporting
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_atomic_interruptible.c | 28 +++++++++++++-----
 tests/kms_flip_tiling.c          | 50 ++++++++++++++++++++++----------
 tests/kms_plane_scaling.c        | 28 +++++++++++++-----
 tests/kms_rotation_crc.c         |  3 +-
 4 files changed, 77 insertions(+), 32 deletions(-)

diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index e5ccdf5b..7bffc501 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -284,47 +284,61 @@ igt_main
 		igt_require_sw_sync();
 	}
 
-	igt_subtest("legacy-setmode")
+	igt_subtest_with_dynamic("legacy-setmode") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 			run_plane_test(&display, pipe, output, test_legacy_modeset, DRM_PLANE_TYPE_PRIMARY);
 			break;
 		}
+	}
 
-	igt_subtest("atomic-setmode")
+	igt_subtest_with_dynamic("atomic-setmode") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 			run_plane_test(&display, pipe, output, test_atomic_modeset, DRM_PLANE_TYPE_PRIMARY);
 			break;
 		}
+	}
 
-	igt_subtest("legacy-dpms")
+	igt_subtest_with_dynamic("legacy-dpms") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 			run_plane_test(&display, pipe, output, test_legacy_dpms, DRM_PLANE_TYPE_PRIMARY);
 			break;
 		}
+	}
 
-	igt_subtest("legacy-pageflip")
+	igt_subtest_with_dynamic("legacy-pageflip") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 			run_plane_test(&display, pipe, output, test_pageflip, DRM_PLANE_TYPE_PRIMARY);
 			break;
 		}
+	}
 
-	igt_subtest("legacy-cursor")
+	igt_subtest_with_dynamic("legacy-cursor") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 			run_plane_test(&display, pipe, output, test_setcursor, DRM_PLANE_TYPE_CURSOR);
 			break;
 		}
+	}
 
-	igt_subtest("universal-setplane-primary")
+	igt_subtest_with_dynamic("universal-setplane-primary") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 			run_plane_test(&display, pipe, output, test_setplane, DRM_PLANE_TYPE_PRIMARY);
 			break;
 		}
+	}
 
-	igt_subtest("universal-setplane-cursor")
+	igt_subtest_with_dynamic("universal-setplane-cursor") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 			run_plane_test(&display, pipe, output, test_setplane, DRM_PLANE_TYPE_CURSOR);
 			break;
 		}
+	}
 
 	/* TODO: legacy gamma_set/get, object set/getprop, getcrtc, getconnector */
 	igt_fixture {
diff --git a/tests/kms_flip_tiling.c b/tests/kms_flip_tiling.c
index fb79de15..44dd3adb 100644
--- a/tests/kms_flip_tiling.c
+++ b/tests/kms_flip_tiling.c
@@ -173,7 +173,7 @@ igt_main
 	 * generated and compared to the reference one.
 	 */
 
-	igt_subtest_f("flip-changes-tiling") {
+	igt_subtest_with_dynamic("flip-changes-tiling") {
 		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_X_TILED,
 				       LOCAL_DRM_FORMAT_MOD_NONE };
 		enum pipe pipe;
@@ -181,11 +181,13 @@ igt_main
 		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
 			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
 
-		for_each_pipe_with_valid_output(&data.display, pipe, output)
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 			test_flip_tiling(&data, pipe, output, tiling);
+		}
 	}
 
-	igt_subtest_f("flip-changes-tiling-Y") {
+	igt_subtest_with_dynamic("flip-changes-tiling-Y") {
 		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Y_TILED,
 				       LOCAL_DRM_FORMAT_MOD_NONE };
 		enum pipe pipe;
@@ -197,11 +199,13 @@ igt_main
 
 		igt_require(data.gen >= 9);
 
-		for_each_pipe_with_valid_output(&data.display, pipe, output)
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 			test_flip_tiling(&data, pipe, output, tiling);
+		}
 	}
 
-	igt_subtest_f("flip-changes-tiling-Yf") {
+	igt_subtest_with_dynamic("flip-changes-tiling-Yf") {
 		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Yf_TILED,
 				       LOCAL_DRM_FORMAT_MOD_NONE };
 		enum pipe pipe;
@@ -213,8 +217,10 @@ igt_main
 
 		igt_require(data.gen >= 9);
 
-		for_each_pipe_with_valid_output(&data.display, pipe, output)
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 			test_flip_tiling(&data, pipe, output, tiling);
+		}
 	}
 
 	/*
@@ -225,7 +231,7 @@ igt_main
 	 * reference one.
 	 */
 
-	igt_subtest_f("flip-X-tiled") {
+	igt_subtest_with_dynamic("flip-X-tiled") {
 		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_X_TILED,
 				       LOCAL_I915_FORMAT_MOD_X_TILED };
 		enum pipe pipe;
@@ -233,11 +239,13 @@ igt_main
 		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
 			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
 
-		for_each_pipe_with_valid_output(&data.display, pipe, output)
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 			test_flip_tiling(&data, pipe, output, tiling);
+		}
 	}
 
-	igt_subtest_f("flip-Y-tiled") {
+	igt_subtest_with_dynamic("flip-Y-tiled") {
 		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Y_TILED,
 				       LOCAL_I915_FORMAT_MOD_Y_TILED };
 		enum pipe pipe;
@@ -250,10 +258,12 @@ igt_main
 		igt_require(data.gen >= 9);
 
 		for_each_pipe_with_valid_output(&data.display, pipe, output)
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 			test_flip_tiling(&data, pipe, output, tiling);
+		}
 	}
 
-	igt_subtest_f("flip-Yf-tiled") {
+	igt_subtest_with_dynamic("flip-Yf-tiled") {
 		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Yf_TILED,
 				       LOCAL_I915_FORMAT_MOD_Yf_TILED };
 		enum pipe pipe;
@@ -266,7 +276,9 @@ igt_main
 		igt_require(data.gen >= 9);
 
 		for_each_pipe_with_valid_output(&data.display, pipe, output)
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 			test_flip_tiling(&data, pipe, output, tiling);
+		}
 	}
 
 	/*
@@ -277,7 +289,7 @@ igt_main
 	 * reference one.
 	 */
 
-	igt_subtest_f("flip-to-X-tiled") {
+	igt_subtest_with_dynamic("flip-to-X-tiled") {
 		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
 				       LOCAL_I915_FORMAT_MOD_X_TILED };
 		enum pipe pipe;
@@ -285,11 +297,13 @@ igt_main
 		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
 			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
 
-		for_each_pipe_with_valid_output(&data.display, pipe, output)
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 			test_flip_tiling(&data, pipe, output, tiling);
+		}
 	}
 
-	igt_subtest_f("flip-to-Y-tiled") {
+	igt_subtest_with_dynamic("flip-to-Y-tiled") {
 		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
 				       LOCAL_I915_FORMAT_MOD_Y_TILED };
 		enum pipe pipe;
@@ -301,11 +315,13 @@ igt_main
 
 		igt_require(data.gen >= 9);
 
-		for_each_pipe_with_valid_output(&data.display, pipe, output)
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 			test_flip_tiling(&data, pipe, output, tiling);
+		}
 	}
 
-	igt_subtest_f("flip-to-Yf-tiled") {
+	igt_subtest_with_dynamic("flip-to-Yf-tiled") {
 		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
 				       LOCAL_I915_FORMAT_MOD_Yf_TILED };
 		enum pipe pipe;
@@ -317,8 +333,10 @@ igt_main
 
 		igt_require(data.gen >= 9);
 
-		for_each_pipe_with_valid_output(&data.display, pipe, output)
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 			test_flip_tiling(&data, pipe, output, tiling);
+		}
 	}
 
 	igt_fixture {
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index ecd2c2e3..6ef50d4d 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -694,21 +694,33 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			igt_require(get_num_scalers(&data, pipe) > 0);
 		}
 
-		igt_subtest_f("pipe-%s-plane-scaling", kmstest_pipe_name(pipe))
-			for_each_valid_output_on_pipe(&data.display, pipe, output)
+		igt_subtest_with_dynamic("pipe-%s-plane-scaling", kmstest_pipe_name(pipe)) {
+			for_each_valid_output_on_pipe(&data.display, pipe, output) {
+				igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				test_plane_scaling_on_pipe(&data, pipe, output);
+			}
+		}
 
-		igt_subtest_f("pipe-%s-scaler-with-pixel-format", kmstest_pipe_name(pipe))
-			for_each_valid_output_on_pipe(&data.display, pipe, output)
+		igt_subtest_with_dynamic("pipe-%s-scaler-with-pixel-format", kmstest_pipe_name(pipe)) {
+			for_each_valid_output_on_pipe(&data.display, pipe, output) {
+				igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				test_scaler_with_pixel_format_pipe(&data, pipe, output);
+			}
+		}
 
-		igt_subtest_f("pipe-%s-scaler-with-rotation", kmstest_pipe_name(pipe))
-			for_each_valid_output_on_pipe(&data.display, pipe, output)
+		igt_subtest_with_dynamic("pipe-%s-scaler-with-rotation", kmstest_pipe_name(pipe)) {
+			for_each_valid_output_on_pipe(&data.display, pipe, output) {
+				igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				test_scaler_with_rotation_pipe(&data, pipe, output);
+			}
+		}
 
-		igt_subtest_f("pipe-%s-scaler-with-clipping-clamping", kmstest_pipe_name(pipe))
-			for_each_valid_output_on_pipe(&data.display, pipe, output)
+		igt_subtest_with_dynamic("pipe-%s-scaler-with-clipping-clamping", kmstest_pipe_name(pipe)) {
+			for_each_valid_output_on_pipe(&data.display, pipe, output) {
+				igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				test_scaler_with_clipping_clamping_scenario(&data, pipe, output);
+			}
+		}
 	}
 
 	igt_subtest_f("2x-scaler-multi-pipe")
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index ffcc2cc2..3ab80346 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -939,7 +939,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	 * exhaust-fences should be last test, if it fails we may OOM in
 	 * the following subtests otherwise.
 	 */
-	igt_subtest_f("exhaust-fences") {
+	igt_subtest_with_dynamic("exhaust-fences") {
 		enum pipe pipe;
 		igt_output_t *output;
 
@@ -947,6 +947,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_display_require_output(&data.display);
 
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 			igt_plane_t *primary = &data.display.pipes[pipe].planes[0];
 
 			test_plane_rotation_exhaust_fences(&data, pipe, output, primary);
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
