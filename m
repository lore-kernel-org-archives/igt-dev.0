Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6DF10F14C
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Mar 2022 07:08:49 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Mar 2022 12:40:08 +0530
Message-Id: <20220310071008.10811-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5] IGT cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Before starting the next subtest, clean up the states to default
values, those are assumed by other tests.

v2: And also before running the subtest we need to sanitize the system state
to default, since we can't trust the state of previous subtest, used
igt_display_reset() to sanitize the state. (Bhanuprakash Modem)

v3: Added dynamic subtests (Karthik)

Below tests are modified:
	tests/kms_concurrent.c
	tests/kms_sequence.c

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_concurrent.c | 43 +++++++++++++++++++++---------------------
 tests/kms_sequence.c   | 11 +++++++----
 2 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 1b8f4b04..5efe422b 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -82,7 +82,8 @@ static void test_fini(data_t *data, enum pipe pipe, int n_planes,
 	}
 
 	/* reset the constraint on the pipe */
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
 	free(data->plane);
 	data->plane = NULL;
@@ -278,35 +279,30 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
 static void
 run_test(data_t *data, enum pipe pipe, igt_output_t *output)
 {
-	int connected_outs;
-	int n_planes = data->display.pipes[pipe].n_planes;
+	int n_planes;
+
+	igt_display_reset(&data->display);
+	n_planes = data->display.pipes[pipe].n_planes;
 
 	if (!opt.user_seed)
 		opt.seed = time(NULL);
 
-	connected_outs = 0;
-	for_each_valid_output_on_pipe(&data->display, pipe, output) {
-		igt_info("Testing resolution with connector %s using pipe %s with seed %d\n",
-			 igt_output_name(output), kmstest_pipe_name(pipe), opt.seed);
-
-		srand(opt.seed);
+	igt_info("Testing resolution with connector %s using pipe %s with seed %d\n",
+		 igt_output_name(output), kmstest_pipe_name(pipe), opt.seed);
 
-		test_init(data, pipe, n_planes, output);
-
-		igt_fork(child, 1) {
-			test_plane_position_with_output(data, pipe, n_planes, output);
-		}
+	srand(opt.seed);
 
-		test_resolution_with_output(data, pipe, n_planes, output);
+	test_init(data, pipe, n_planes, output);
 
-		igt_waitchildren();
+	igt_fork(child, 1) {
+		test_plane_position_with_output(data, pipe, n_planes, output);
+	}
 
-		test_fini(data, pipe, n_planes, output);
+	test_resolution_with_output(data, pipe, n_planes, output);
 
-		connected_outs++;
-	}
+	igt_waitchildren();
 
-	igt_skip_on(connected_outs == 0);
+	test_fini(data, pipe, n_planes, output);
 }
 
 static void
@@ -316,6 +312,7 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 
 	igt_fixture {
 		int valid_tests = 0;
+		igt_display_reset(&data->display);
 
 		igt_require_pipe(&data->display, pipe);
 		igt_require(data->display.pipes[pipe].n_planes > 0);
@@ -328,9 +325,11 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 
 	igt_describe("Test atomic mode setting concurrently with multiple planes and screen "
 		     "resolution.");
-	igt_subtest_f("pipe-%s", kmstest_pipe_name(pipe))
+	igt_subtest_with_dynamic("mode-setting-concurrently-with-multiple-planes-and-screen-resolution") {
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
-			run_test(data, pipe, output);
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+				run_test(data, pipe, output);
+	}
 }
 
 static int opt_handler(int option, int option_index, void *input)
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index 9c287480..569ea1d9 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -74,9 +74,12 @@ static double elapsed(const struct timespec *start,
 static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 {
 	drmModeModeInfo *mode;
-	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
-
+	igt_display_t *display;
+	
+	igt_display_reset(&data->display);
+	display = &data->display;
+	
 	/* select the pipe we want to use */
 	igt_output_set_pipe(output, data->pipe);
 
@@ -109,8 +112,8 @@ static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
 
-	igt_output_set_pipe(output, PIPE_ANY);
-	igt_display_commit(display);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 }
 
 static int crtc_get_sequence(int fd, struct drm_crtc_get_sequence *cgs)
-- 
2.26.2
