Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102896E117
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2020 13:06:48 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Tue, 31 Mar 2020 14:58:23 +0300
Message-Id: <20200331115824.2481-2-mika.kahola@intel.com>
In-Reply-To: <20200331115824.2481-1-mika.kahola@intel.com>
References: <20200331115824.2481-1-mika.kahola@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] Revert "tests/kms_concurrent: Test
 maximum number of planes supported by the platform"
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
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This reverts commit 2b65609b1de355ca501b58b7b03208f81c87b585.
---
 tests/kms_concurrent.c | 102 +++++++++++++++++++++++------------------
 1 file changed, 57 insertions(+), 45 deletions(-)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 1403e990..c212f6ec 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -199,25 +199,6 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
 	free(size);
 }
 
-static int test_bandwidth(data_t *data, enum pipe pipe, igt_output_t *output)
-{
-
-	int n_planes = data->display.pipes[pipe].n_planes;
-	int i;
-	int ret;
-
-	igt_pipe_refresh(&data->display, pipe, true);
-
-	for (i = 1; i <= n_planes; i++) {
-		prepare_planes(data, pipe, i, output);
-		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC | DRM_MODE_ATOMIC_TEST_ONLY);
-		if (ret != 0)
-			break;
-	}
-
-	return i - 1;
-}
-
 static void
 test_plane_position_with_output(data_t *data, enum pipe pipe, int max_planes,
 				igt_output_t *output)
@@ -231,7 +212,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe, int max_planes,
 	i = 0;
 	while (i < iterations || loop_forever) {
 		prepare_planes(data, pipe, max_planes, output);
-		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+		igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 
 		for (int c = 0; c < max_planes; c++)
 			igt_remove_fb(data->drm_fd, &data->fb[c]);
@@ -268,17 +249,44 @@ get_lowres_mode(data_t *data, const drmModeModeInfo *mode_default,
 	return mode;
 }
 
-static void
+static int
 test_resolution_with_output(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	const drmModeModeInfo *mode_hi, *mode_lo;
 	int iterations = opt.iterations < 1 ? 1 : opt.iterations;
 	bool loop_forever = opt.iterations == LOOP_FOREVER ? true : false;
-	int i;
+	int i, c, ret;
+	int max_planes = data->display.pipes[pipe].n_planes;
+	igt_plane_t *primary;
+	drmModeModeInfo *mode;
 
 	i = 0;
 	while (i < iterations || loop_forever) {
 		igt_output_set_pipe(output, pipe);
+		for (c = 0; c < max_planes; c++) {
+			igt_plane_t *plane = igt_output_get_plane(output, c);
+
+			if (plane->type != DRM_PLANE_TYPE_PRIMARY)
+				continue;
+			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+			data->plane[primary->index] = primary;
+			mode = igt_output_get_mode(output);
+			igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+						DRM_FORMAT_XRGB8888,
+						LOCAL_I915_FORMAT_MOD_X_TILED,
+						0.0f, 0.0f, 1.0f,
+						&data->fb[primary->index]);
+			igt_plane_set_fb(data->plane[primary->index], &data->fb[primary->index]);
+			ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+			if (ret) {
+				igt_plane_set_fb(data->plane[i], NULL);
+				igt_remove_fb(data->drm_fd, &data->fb[i]);
+				data->plane[i] = NULL;
+				break;
+			}
+		}
+		max_planes = c;
+		igt_assert_lt(0, max_planes);
 
 		mode_hi = igt_output_get_mode(output);
 		mode_lo = get_lowres_mode(data, mode_hi, output);
@@ -293,35 +301,48 @@ test_resolution_with_output(data_t *data, enum pipe pipe, igt_output_t *output)
 
 		i++;
 	}
+
+	return max_planes;
 }
 
 static void
-run_test(data_t *data, enum pipe pipe, int max_planes, igt_output_t *output)
+run_test(data_t *data, enum pipe pipe, igt_output_t *output)
 {
+	int connected_outs;
+	int n_planes = data->display.pipes[pipe].n_planes;
+	int max_planes = n_planes;
+
 	if (!opt.user_seed)
 		opt.seed = time(NULL);
 
-	igt_info("Testing resolution with connector %s using pipe %s with seed %d\n",
-		 igt_output_name(output), kmstest_pipe_name(pipe), opt.seed);
+	connected_outs = 0;
+	for_each_valid_output_on_pipe(&data->display, pipe, output) {
+		igt_info("Testing resolution with connector %s using pipe %s with seed %d\n",
+			 igt_output_name(output), kmstest_pipe_name(pipe), opt.seed);
 
-	test_init(data, pipe, max_planes, output);
-	igt_fork(child, 1) {
-		test_plane_position_with_output(data, pipe, max_planes, output);
-	}
+		test_init(data, pipe, n_planes, output);
+		max_planes = test_resolution_with_output(data, pipe, output);
+
+		igt_fork(child, 1) {
+			test_plane_position_with_output(data, pipe, max_planes, output);
+		}
 
-	test_resolution_with_output(data, pipe, output);
+		test_resolution_with_output(data, pipe, output);
 
-	igt_waitchildren();
+		igt_waitchildren();
 
-	test_fini(data, pipe, max_planes, output);
+		test_fini(data, pipe, n_planes, output);
 
+		connected_outs++;
+	}
+
+	igt_skip_on(connected_outs == 0);
 }
 
 static void
 run_tests_for_pipe(data_t *data, enum pipe pipe)
 {
 	igt_output_t *output;
-	int max_planes;
 
 	igt_fixture {
 		int valid_tests = 0;
@@ -335,18 +356,9 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 		igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
 	}
 
-	igt_subtest_f("pipe-%s", kmstest_pipe_name(pipe)) {
-		for_each_valid_output_on_pipe(&data->display, pipe, output) {
-			int n_planes = data->display.pipes[pipe].n_planes;
-
-			test_init(data, pipe, n_planes, output);
-			max_planes = test_bandwidth(data, pipe, output);
-			test_fini(data, pipe, n_planes, output);
-
-			igt_display_reset(&data->display);
-			run_test(data, pipe, max_planes, output);
-		}
-	}
+	igt_subtest_f("pipe-%s", kmstest_pipe_name(pipe))
+		for_each_valid_output_on_pipe(&data->display, pipe, output)
+			run_test(data, pipe, output);
 }
 
 static int opt_handler(int option, int option_index, void *input)
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
