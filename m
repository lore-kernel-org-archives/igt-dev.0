Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FA598F24
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Aug 2022 05:13:48 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  5 Aug 2022 10:38:14 +0530
Message-Id: <20220805050815.820130-2-ananya.sharma@intel.com>
In-Reply-To: <20220805050815.820130-1-ananya.sharma@intel.com>
References: <20220805050815.820130-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/2] tests/kms_universal_plane: Test
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
 tests/kms_universal_plane.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 3cb6d704..bd0900a2 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -107,7 +107,7 @@ functional_test_fini(functional_test_t *test, igt_output_t *output)
 	igt_remove_fb(test->data->drm_fd, &test->red_fb);
 	igt_remove_fb(test->data->drm_fd, &test->yellow_fb);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
 }
 
@@ -135,6 +135,7 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	int num_primary = 0, num_cursor = 0;
 	int i;
 
+	igt_display_reset(&data->display);
 	igt_require_pipe(display, pipe);
 
 	igt_info("Testing connector %s using pipe %s\n", igt_output_name(output),
@@ -345,7 +346,7 @@ sanity_test_fini(sanity_test_t *test, igt_output_t *output)
 	igt_remove_fb(test->data->drm_fd, &test->undersized_fb);
 	igt_remove_fb(test->data->drm_fd, &test->blue_fb);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
 }
 
@@ -364,6 +365,7 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	int i;
 	int expect;
 
+	igt_display_reset(&data->display);
 	igt_require_pipe(&data->display, pipe);
 
 	igt_output_set_pipe(output, pipe);
@@ -462,7 +464,7 @@ pageflip_test_fini(pageflip_test_t *test, igt_output_t *output)
 	igt_remove_fb(test->data->drm_fd, &test->red_fb);
 	igt_remove_fb(test->data->drm_fd, &test->blue_fb);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
 }
 
@@ -477,6 +479,7 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	fd_set fds;
 	int ret = 0;
 
+	igt_display_reset(&data->display);
 	igt_require_pipe(&data->display, pipe);
 
 	igt_output_set_pipe(output, pipe);
@@ -544,7 +547,7 @@ cursor_leak_test_fini(data_t *data,
 	for (i = 0; i < 10; i++)
 		igt_remove_fb(data->drm_fd, &curs[i]);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 }
 
 static int
@@ -578,6 +581,7 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	int r, g, b;
 	int count1, count2;
 
+	igt_display_reset(&data->display);
 	igt_require_pipe(display, pipe);
 	igt_require(display->has_cursor_plane);
 	igt_require_intel(data->drm_fd);
@@ -690,7 +694,7 @@ gen9_test_fini(gen9_test_t *test, igt_output_t *output)
 	igt_remove_fb(test->data->drm_fd, &test->smallred_fb);
 	igt_remove_fb(test->data->drm_fd, &test->smallblue_fb);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
 }
 
@@ -706,6 +710,7 @@ gen9_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	int ret = 0;
 
+	igt_display_reset(&data->display);
 	igt_require_intel(data->drm_fd);
 	igt_skip_on(data->display_ver < 9);
 	igt_require_pipe(&data->display, pipe);
-- 
2.25.1
