Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E09A98E39
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:57 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:58 +0530
Message-Id: <20220814180908.2553394-42-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 41/51] tests/i915/kms_cdclk: Add support for
 Bigjoiner
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

As many 2x tests are currently running on Pipe-A & B only, those
tests will always SKIP if there is any 8K supported panel in the
config. Instead of Skipping the test, add some intelligence to
the subtest to identify the valid pipe/output combo to execute
the subtest.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_cdclk.c | 93 +++++++++++++++++++++++-------------------
 1 file changed, 51 insertions(+), 42 deletions(-)

diff --git a/tests/i915/kms_cdclk.c b/tests/i915/kms_cdclk.c
index 002b631c..78abfedd 100644
--- a/tests/i915/kms_cdclk.c
+++ b/tests/i915/kms_cdclk.c
@@ -243,20 +243,17 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	int debugfs_fd = data->debugfs_fd;
 	drmModeModeInfo *mode, *mode_hi, *mode_lo;
 	igt_output_t *output;
-	int valid_outputs = 0;
 	int cdclk_ref, cdclk_new;
 	uint16_t width = 0, height = 0;
 	struct igt_fb fb;
 	igt_pipe_t *pipe;
 	igt_plane_t *plane;
-	int i = 0, j = 0;
+	enum pipe p, active_pipes[IGT_MAX_PIPES];
+	int i = 0, active_pipe_count = 0;
 
 	do_cleanup_display(display);
 	igt_display_reset(display);
 
-	for_each_connected_output(&data->display, output)
-		valid_outputs++;
-
 	for_each_connected_output(display, output) {
 		mode = igt_output_get_mode(output);
 		igt_assert(mode);
@@ -269,52 +266,59 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 
 	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
 			      DRM_FORMAT_MOD_LINEAR, &fb);
-	i = 0;
+
 	for_each_connected_output(display, output) {
-		pipe = &display->pipes[i];
-		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		for_each_pipe(display, p) {
+			mode = NULL;
 
-		mode = NULL;
+			igt_output_set_pipe(output, p);
+			mode = igt_output_get_mode(output);
+			igt_assert(mode);
 
-		igt_output_set_pipe(output, i);
-		mode = igt_output_get_mode(output);
-		igt_assert(mode);
+			mode_hi = get_highres_mode(output);
+			igt_require(mode_hi != NULL);
+
+			igt_output_override_mode(output, mode_hi);
+			if (!igt_test_constraint(display)) {
+				igt_output_set_pipe(output, PIPE_NONE);
+				continue;
+			}
 
-		mode_lo = get_lowres_mode(output);
+			active_pipes[active_pipe_count++] = p;
+			pipe = &display->pipes[p];
+			plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+			igt_plane_set_fb(plane, &fb);
+			igt_fb_set_size(&fb, plane, mode_hi->hdisplay, mode_hi->vdisplay);
+			igt_plane_set_size(plane, mode_hi->hdisplay, mode_hi->vdisplay);
 
-		igt_output_override_mode(output, mode_lo);
-		igt_plane_set_fb(plane, &fb);
-		igt_fb_set_size(&fb, plane, mode_lo->hdisplay, mode_lo->vdisplay);
-		igt_plane_set_size(plane, mode_lo->hdisplay, mode_lo->vdisplay);
-		i++;
+			break;
+		}
 	}
 
 	igt_display_commit2(display, COMMIT_ATOMIC);
-	cdclk_ref = get_current_cdclk_freq(debugfs_fd);
+	cdclk_new = get_current_cdclk_freq(debugfs_fd);
 
-	j = 0;
 	for_each_connected_output(display, output) {
-		pipe = &display->pipes[j];
-		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		for (i = 0; i < active_pipe_count; i++) {
+			pipe = &display->pipes[active_pipes[i]];
+			plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 
-		mode = NULL;
+			mode = NULL;
+			igt_output_set_pipe(output, i);
+			mode = igt_output_get_mode(output);
+			igt_assert(mode);
 
-		igt_output_set_pipe(output, j);
-		mode = igt_output_get_mode(output);
-		igt_assert(mode);
-
-		mode_hi = get_highres_mode(output);
-		igt_require(mode_hi != NULL);
+			mode_lo = get_lowres_mode(output);
 
-		igt_output_override_mode(output, mode_hi);
-		igt_plane_set_fb(plane, &fb);
-		igt_fb_set_size(&fb, plane, mode_hi->hdisplay, mode_hi->vdisplay);
-		igt_plane_set_size(plane, mode_hi->hdisplay, mode_hi->vdisplay);
-		j++;
+			igt_output_override_mode(output, mode_lo);
+			igt_plane_set_fb(plane, &fb);
+			igt_fb_set_size(&fb, plane, mode_lo->hdisplay, mode_lo->vdisplay);
+			igt_plane_set_size(plane, mode_lo->hdisplay, mode_lo->vdisplay);
+		}
 	}
 
 	igt_display_commit2(display, COMMIT_ATOMIC);
-	cdclk_new = get_current_cdclk_freq(debugfs_fd);
+	cdclk_ref = get_current_cdclk_freq(debugfs_fd);
 	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
 
 	/* cdclk should bump */
@@ -332,13 +336,18 @@ static void run_cdclk_test(data_t *data, uint32_t flags)
 	enum pipe pipe;
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
-		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
-			if (igt_pipe_connector_valid(pipe, output)) {
-				if (flags & TEST_PLANESCALING)
-					test_plane_scaling(data, pipe, output);
-				if (flags & TEST_MODETRANSITION)
-					test_mode_transition(data, pipe, output);
-			}
+		igt_output_set_pipe(output, pipe);
+		if (!igt_test_constraint(display)) {
+			igt_output_set_pipe(output, PIPE_NONE);
+			continue;
+		}
+
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
+			if (flags & TEST_PLANESCALING)
+				test_plane_scaling(data, pipe, output);
+			if (flags & TEST_MODETRANSITION)
+				test_mode_transition(data, pipe, output);
+		}
 	}
 }
 
-- 
2.35.1
