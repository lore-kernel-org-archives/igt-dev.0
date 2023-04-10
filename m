Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E796910E025
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Apr 2023 06:00:33 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Date: Mon, 10 Apr 2023 11:26:17 +0530
Message-Id: <20230410055617.647705-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/i915/kms_cdclk: Test cleanup
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

To avoid the code duplication, create a new function and use it
across. Also use for_each_pipe() to handle the fused pipes.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_cdclk.c | 114 ++++++++++++++++++++---------------------
 1 file changed, 55 insertions(+), 59 deletions(-)

diff --git a/tests/i915/kms_cdclk.c b/tests/i915/kms_cdclk.c
index 23d9d3b02e2..d09f6e5eb95 100644
--- a/tests/i915/kms_cdclk.c
+++ b/tests/i915/kms_cdclk.c
@@ -46,6 +46,8 @@ typedef struct {
 	igt_display_t display;
 } data_t;
 
+static struct igt_fb fb;
+
 static bool hardware_supported(data_t *data)
 {
         if (intel_display_ver(data->devid) >= 13)
@@ -137,7 +139,6 @@ static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_t *outpu
 	igt_display_t *display = &data->display;
 	int debugfs_fd = data->debugfs_fd;
 	int cdclk_ref, cdclk_new;
-	struct igt_fb fb;
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	int scaling = 50;
@@ -190,7 +191,6 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 	igt_display_t *display = &data->display;
 	int debugfs_fd = data->debugfs_fd;
 	int cdclk_ref, cdclk_new;
-	struct igt_fb fb;
 	igt_plane_t *primary;
 	drmModeModeInfo *mode_hi, *mode_lo, *mode;
 
@@ -237,19 +237,47 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 	igt_remove_fb(display->drm_fd, &fb);
 }
 
+static void prepare_test_for_all_outputs(igt_display_t *display,
+					 drmModeModeInfo* (*get_req_mode)(igt_output_t *))
+{
+	igt_plane_t *plane;
+	igt_output_t *output;
+	drmModeModeInfo *mode, *mode_req;
+	enum pipe pipe;
+
+	for_each_pipe(display, pipe) {
+		for_each_connected_output(display, output) {
+			if (output->pending_pipe != PIPE_NONE)
+				continue;
+
+			mode = igt_output_get_mode(output);
+			igt_assert(mode);
+
+			mode_req = get_req_mode(output);
+
+			igt_output_set_pipe(output, pipe);
+			igt_output_override_mode(output, mode_req);
+
+			plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+			igt_plane_set_fb(plane, &fb);
+			igt_fb_set_size(&fb, plane, mode_req->hdisplay, mode_req->vdisplay);
+			igt_plane_set_size(plane, mode_req->hdisplay, mode_req->vdisplay);
+
+			break;
+		}
+	}
+}
+
 static void test_mode_transition_on_all_outputs(data_t *data)
 {
 	igt_display_t *display = &data->display;
 	int debugfs_fd = data->debugfs_fd;
-	drmModeModeInfo *mode, *mode_hi, *mode_lo;
+	drmModeModeInfo *mode, *mode_hi;
 	igt_output_t *output;
 	int valid_outputs = 0;
 	int cdclk_ref, cdclk_new;
 	uint16_t width = 0, height = 0;
-	struct igt_fb fb;
-	igt_pipe_t *pipe;
-	igt_plane_t *plane;
-	int i = 0, j = 0;
+	enum pipe p;
 
 	do_cleanup_display(display);
 	igt_display_reset(display);
@@ -257,70 +285,39 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	for_each_connected_output(&data->display, output)
 		valid_outputs++;
 
-	i = 0;
-	for_each_connected_output(display, output) {
-		mode = igt_output_get_mode(output);
-		igt_assert(mode);
+	igt_require_f(valid_outputs > 1, "Already covered by mode-transition test.\n");
 
-		width = max(width, mode->hdisplay);
-		height = max(height, mode->vdisplay);
+	for_each_pipe(display, p) {
+		for_each_connected_output(display, output) {
+			if (output->pending_pipe != PIPE_NONE)
+				continue;
 
-		mode_hi = get_highres_mode(output);
-		igt_require(mode_hi != NULL);
+			mode = igt_output_get_mode(output);
+			igt_assert(mode);
 
-		igt_output_set_pipe(output, i);
-		igt_output_override_mode(output, mode_hi);
-		i++;
+			width = max(width, mode->hdisplay);
+			height = max(height, mode->vdisplay);
+
+			mode_hi = get_highres_mode(output);
+			igt_require(mode_hi != NULL);
+
+			igt_output_set_pipe(output, p);
+			igt_output_override_mode(output, mode_hi);
+
+			break;
+		}
 	}
 	igt_require(i915_pipe_output_combo_valid(display));
 	igt_display_reset(display);
 
 	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
 			      DRM_FORMAT_MOD_LINEAR, &fb);
-	i = 0;
-	for_each_connected_output(display, output) {
-		pipe = &display->pipes[i];
-		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-
-		mode = NULL;
-
-		igt_output_set_pipe(output, i);
-		mode = igt_output_get_mode(output);
-		igt_assert(mode);
-
-		mode_lo = get_lowres_mode(output);
-
-		igt_output_override_mode(output, mode_lo);
-		igt_plane_set_fb(plane, &fb);
-		igt_fb_set_size(&fb, plane, mode_lo->hdisplay, mode_lo->vdisplay);
-		igt_plane_set_size(plane, mode_lo->hdisplay, mode_lo->vdisplay);
-		i++;
-	}
 
+	prepare_test_for_all_outputs(display, get_lowres_mode);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	cdclk_ref = get_current_cdclk_freq(debugfs_fd);
 
-	j = 0;
-	for_each_connected_output(display, output) {
-		pipe = &display->pipes[j];
-		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-
-		mode = NULL;
-
-		igt_output_set_pipe(output, j);
-		mode = igt_output_get_mode(output);
-		igt_assert(mode);
-
-		mode_hi = get_highres_mode(output);
-		igt_require(mode_hi != NULL);
-
-		igt_output_override_mode(output, mode_hi);
-		igt_plane_set_fb(plane, &fb);
-		igt_fb_set_size(&fb, plane, mode_hi->hdisplay, mode_hi->vdisplay);
-		igt_plane_set_size(plane, mode_hi->hdisplay, mode_hi->vdisplay);
-		j++;
-	}
-
+	prepare_test_for_all_outputs(display, get_highres_mode);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	cdclk_new = get_current_cdclk_freq(debugfs_fd);
 	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
@@ -328,7 +325,6 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	/* cdclk should bump */
 	igt_assert_lt(cdclk_ref, cdclk_new);
 
-	igt_plane_set_fb(plane, NULL);
 	do_cleanup_display(display);
 	igt_remove_fb(data->drm_fd, &fb);
 }
-- 
2.40.0
