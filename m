Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A50C53A7
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Aug 2022 08:54:26 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 18 Aug 2022 14:19:07 +0530
Message-Id: <20220818084908.427352-2-ananya.sharma@intel.com>
In-Reply-To: <20220818084908.427352-1-ananya.sharma@intel.com>
References: <20220818084908.427352-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/2] tests/kms_universal_plane: Test
 cleanup
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

Before running the subtest we need to sanitize the system
state to default,used igt_display_reset() to sanitize the state.

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/kms_universal_plane.c | 32 +++++++++++---------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 3cb6d704..68807183 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -107,7 +107,7 @@ functional_test_fini(functional_test_t *test, igt_output_t *output)
 	igt_remove_fb(test->data->drm_fd, &test->red_fb);
 	igt_remove_fb(test->data->drm_fd, &test->yellow_fb);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
 }
 
@@ -135,7 +135,7 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	int num_primary = 0, num_cursor = 0;
 	int i;
 
-	igt_require_pipe(display, pipe);
+	igt_display_reset(display);
 
 	igt_info("Testing connector %s using pipe %s\n", igt_output_name(output),
 		 kmstest_pipe_name(pipe));
@@ -345,7 +345,7 @@ sanity_test_fini(sanity_test_t *test, igt_output_t *output)
 	igt_remove_fb(test->data->drm_fd, &test->undersized_fb);
 	igt_remove_fb(test->data->drm_fd, &test->blue_fb);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
 }
 
@@ -364,7 +364,7 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	int i;
 	int expect;
 
-	igt_require_pipe(&data->display, pipe);
+	igt_display_reset(&data->display);
 
 	igt_output_set_pipe(output, pipe);
 	mode = igt_output_get_mode(output);
@@ -462,7 +462,7 @@ pageflip_test_fini(pageflip_test_t *test, igt_output_t *output)
 	igt_remove_fb(test->data->drm_fd, &test->red_fb);
 	igt_remove_fb(test->data->drm_fd, &test->blue_fb);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
 }
 
@@ -477,7 +477,7 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	fd_set fds;
 	int ret = 0;
 
-	igt_require_pipe(&data->display, pipe);
+	igt_display_reset(&data->display);
 
 	igt_output_set_pipe(output, pipe);
 
@@ -544,7 +544,7 @@ cursor_leak_test_fini(data_t *data,
 	for (i = 0; i < 10; i++)
 		igt_remove_fb(data->drm_fd, &curs[i]);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 }
 
 static int
@@ -578,7 +578,7 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	int r, g, b;
 	int count1, count2;
 
-	igt_require_pipe(display, pipe);
+	igt_display_reset(display);
 	igt_require(display->has_cursor_plane);
 	igt_require_intel(data->drm_fd);
 
@@ -690,7 +690,7 @@ gen9_test_fini(gen9_test_t *test, igt_output_t *output)
 	igt_remove_fb(test->data->drm_fd, &test->smallred_fb);
 	igt_remove_fb(test->data->drm_fd, &test->smallblue_fb);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
 }
 
@@ -706,9 +706,9 @@ gen9_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	int ret = 0;
 
+	igt_display_reset(&data->display);
 	igt_require_intel(data->drm_fd);
 	igt_skip_on(data->display_ver < 9);
-	igt_require_pipe(&data->display, pipe);
 
 	igt_output_set_pipe(output, pipe);
 
@@ -750,17 +750,6 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 {
 	igt_output_t *output;
 
-	igt_fixture {
-		int valid_tests = 0;
-
-		igt_require_pipe(&data->display, pipe);
-
-		for_each_valid_output_on_pipe(&data->display, pipe, output)
-			valid_tests++;
-
-		igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
-	}
-
 	igt_describe("Check the switching between different primary plane fbs with CRTC off");
 	igt_subtest_f("universal-plane-pipe-%s-functional",
 		      kmstest_pipe_name(pipe))
@@ -808,6 +797,7 @@ igt_main
 
 		igt_require_pipe_crc(data.drm_fd);
 		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
 	}
 
 	for_each_pipe_static(pipe) {
-- 
2.25.1
