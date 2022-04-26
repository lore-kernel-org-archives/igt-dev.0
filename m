Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA0C10E376
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Apr 2022 19:04:35 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 27 Apr 2022 00:31:12 +0530
Message-Id: <20220426190112.254042-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v1] tests/kms: IGT cleanup by sanitizing the
 system state
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

Before running the subtest we need to sanitize the system state to
default, Therefore using igt_display_reset() to sanitize the state.

Below tests are modified:
	tests/i915/kms_fence_pin_leak.c
	tests/kms_universal_plane.c

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/i915/kms_fence_pin_leak.c |  5 +++--
 tests/kms_universal_plane.c     | 15 ++++++++++-----
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/tests/i915/kms_fence_pin_leak.c b/tests/i915/kms_fence_pin_leak.c
index 16eb595f..906b3708 100644
--- a/tests/i915/kms_fence_pin_leak.c
+++ b/tests/i915/kms_fence_pin_leak.c
@@ -124,6 +124,7 @@ static void run_single_test(data_t *data, enum pipe pipe, igt_output_t *output)
 	struct igt_fb fb[2];
 	int i;
 
+	igt_display_reset(display);
 	igt_output_set_pipe(output, pipe);
 
 	mode = igt_output_get_mode(output);
@@ -180,8 +181,8 @@ static void run_single_test(data_t *data, enum pipe pipe, igt_output_t *output)
 	}
 
 	igt_plane_set_fb(primary, NULL);
-	igt_output_set_pipe(output, PIPE_ANY);
-	igt_display_commit(display);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
 	igt_remove_fb(data->drm_fd, &fb[1]);
 	igt_remove_fb(data->drm_fd, &fb[0]);
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 3cb6d704..1a6502a4 100644
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
 
+	igt_display_reset(display);
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
 
+	igt_display_reset(display);
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
