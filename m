Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2496010FC14
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Apr 2022 07:59:01 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 14 Apr 2022 13:30:58 +0530
Message-Id: <20220414080058.5887-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms: IGT cleanup
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

Before running the subtest we need to sanitize the system state
to default, since we can't trust the state of previous subtest, used
igt_display_reset() to sanitize the state.

Replace newly defined function in particular test with existing library
function.

Below tests are modified:
	tests/kms_concurrent.c
	tests/kms_sequence.c

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_concurrent.c | 39 ++++++++++++++-------------------------
 tests/kms_sequence.c   |  6 ++++--
 2 files changed, 18 insertions(+), 27 deletions(-)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index dc1e36f2..622d3335 100644
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
@@ -289,35 +290,28 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
 static void
 run_test(data_t *data, enum pipe pipe, igt_output_t *output)
 {
-	int connected_outs;
 	int n_planes = data->display.pipes[pipe].n_planes;
+	igt_display_reset(&data->display);
 
 	if (!opt.user_seed)
 		opt.seed = time(NULL);
 
-	connected_outs = 0;
-	for_each_valid_output_on_pipe(&data->display, pipe, output) {
-		igt_info("Testing resolution with connector %s using pipe %s with seed %d\n",
-			 igt_output_name(output), kmstest_pipe_name(pipe), opt.seed);
+	igt_info("Testing resolution with connector %s using pipe %s with seed %d\n",
+		 igt_output_name(output), kmstest_pipe_name(pipe), opt.seed);
 
-		srand(opt.seed);
+	srand(opt.seed);
 
-		test_init(data, pipe, n_planes, output);
+	test_init(data, pipe, n_planes, output);
 
-		igt_fork(child, 1) {
-			test_plane_position_with_output(data, pipe, n_planes, output);
-		}
-
-		test_resolution_with_output(data, pipe, n_planes, output);
-
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
@@ -326,15 +320,10 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 	igt_output_t *output;
 
 	igt_fixture {
-		int valid_tests = 0;
-
 		igt_require_pipe(&data->display, pipe);
 		igt_require(data->display.pipes[pipe].n_planes > 0);
 
-		for_each_valid_output_on_pipe(&data->display, pipe, output)
-			valid_tests++;
-
-		igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
+		igt_display_require_output(&data->display);
 	}
 
 	igt_describe("Test atomic mode setting concurrently with multiple planes and screen "
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index 9c287480..ca25e041 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -77,6 +77,8 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
 
+	igt_display_reset(&data->display);
+
 	/* select the pipe we want to use */
 	igt_output_set_pipe(output, data->pipe);
 
@@ -109,8 +111,8 @@ static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
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
