Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAA710E58A
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Sep 2022 10:00:35 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Sep 2022 15:24:42 +0530
Message-Id: <20220919095442.666253-3-ananya.sharma@intel.com>
In-Reply-To: <20220919095442.666253-1-ananya.sharma@intel.com>
References: <20220919095442.666253-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 2/2] tests/kms_universal_plane: Test
 Cleanup
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
 tests/kms_universal_plane.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 104323e7..a421c499 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -107,7 +107,7 @@ functional_test_fini(functional_test_t *test, igt_output_t *output)
 	igt_remove_fb(test->data->drm_fd, &test->red_fb);
 	igt_remove_fb(test->data->drm_fd, &test->yellow_fb);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
 }
 
@@ -135,8 +135,6 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	int num_primary = 0, num_cursor = 0;
 	int i;
 
-	igt_require_pipe(display, pipe);
-
 	igt_info("Testing connector %s using pipe %s\n", igt_output_name(output),
 		 kmstest_pipe_name(pipe));
 
@@ -352,7 +350,7 @@ sanity_test_fini(sanity_test_t *test, igt_output_t *output)
 	igt_remove_fb(test->data->drm_fd, &test->undersized_fb);
 	igt_remove_fb(test->data->drm_fd, &test->blue_fb);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
 }
 
@@ -371,8 +369,6 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	int i;
 	int expect;
 
-	igt_require_pipe(&data->display, pipe);
-
 	igt_output_set_pipe(output, pipe);
 	mode = igt_output_get_mode(output);
 
@@ -469,7 +465,7 @@ pageflip_test_fini(pageflip_test_t *test, igt_output_t *output)
 	igt_remove_fb(test->data->drm_fd, &test->red_fb);
 	igt_remove_fb(test->data->drm_fd, &test->blue_fb);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
 }
 
@@ -484,8 +480,6 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	fd_set fds;
 	int ret = 0;
 
-	igt_require_pipe(&data->display, pipe);
-
 	igt_output_set_pipe(output, pipe);
 
 	pageflip_test_init(&test, output, pipe);
@@ -551,7 +545,7 @@ cursor_leak_test_fini(data_t *data,
 	for (i = 0; i < 10; i++)
 		igt_remove_fb(data->drm_fd, &curs[i]);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 }
 
 static int
@@ -585,7 +579,6 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	int r, g, b;
 	int count1, count2;
 
-	igt_require_pipe(display, pipe);
 	igt_require(display->has_cursor_plane);
 	igt_require_intel(data->drm_fd);
 
@@ -697,7 +690,7 @@ gen9_test_fini(gen9_test_t *test, igt_output_t *output)
 	igt_remove_fb(test->data->drm_fd, &test->smallred_fb);
 	igt_remove_fb(test->data->drm_fd, &test->smallblue_fb);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
 }
 
@@ -714,7 +707,6 @@ pageflip_win_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	int ret = 0;
 
 	igt_skip_on(is_i915_device(data->drm_fd) && data->display_ver < 9);
-	igt_require_pipe(&data->display, pipe);
 
 	igt_output_set_pipe(output, pipe);
 
@@ -805,6 +797,7 @@ igt_main
 
 		igt_require_pipe_crc(data.drm_fd);
 		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
 	}
 
 	igt_subtest_group
-- 
2.25.1
