Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D1198C81
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:23 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:31 +0530
Message-Id: <20220814180908.2553394-15-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 14/51] tests/kms_cursor_legacy: Add support for
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
 tests/kms_cursor_legacy.c | 202 +++++++++++++++++++++++---------------
 1 file changed, 124 insertions(+), 78 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 1b697667..e8361170 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -177,31 +177,21 @@ static void stress(igt_display_t *display,
 	munmap(results, PAGE_SIZE);
 }
 
-static igt_output_t *set_fb_on_crtc(igt_display_t *display, enum pipe pipe, struct igt_fb *fb_info)
+static void set_fb_on_crtc(igt_display_t *display, enum pipe pipe,
+			   igt_output_t *output, struct igt_fb *fb_info)
 {
-	igt_output_t *output;
-
-	for_each_valid_output_on_pipe(display, pipe, output) {
-		drmModeModeInfoPtr mode;
-		igt_plane_t *primary;
-
-		if (output->pending_pipe != PIPE_NONE)
-			continue;
-
-		igt_output_set_pipe(output, pipe);
-		mode = igt_output_get_mode(output);
+	drmModeModeInfoPtr mode;
+	igt_plane_t *primary;
 
-		igt_create_pattern_fb(display->drm_fd,
-			      mode->hdisplay, mode->vdisplay,
-			      DRM_FORMAT_XRGB8888, I915_TILING_NONE, fb_info);
+	igt_output_set_pipe(output, pipe);
+	mode = igt_output_get_mode(output);
 
-		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-		igt_plane_set_fb(primary, fb_info);
+	igt_create_pattern_fb(display->drm_fd,
+		      mode->hdisplay, mode->vdisplay,
+		      DRM_FORMAT_XRGB8888, I915_TILING_NONE, fb_info);
 
-		return output;
-	}
-
-	return NULL;
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, fb_info);
 }
 
 static	igt_plane_t
@@ -236,36 +226,44 @@ static void populate_cursor_args(igt_display_t *display, enum pipe pipe,
 	arg[1] = *arg;
 }
 
-static enum pipe find_connected_pipe(igt_display_t *display, bool second)
+static enum pipe
+find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 {
-	enum pipe pipe, first = PIPE_NONE;
-	igt_output_t *output;
-	igt_output_t *first_output = NULL;
+	enum pipe pipe;
+	bool first_output = false;
 	bool found = false;
 
 	if (!second) {
 		igt_pipe_crc_free(pipe_crc);
 		pipe_crc = NULL;
-
-		/* Clear display, events will be eaten by commit.. */
-		igt_display_reset(display);
 	}
 
-	for_each_pipe_with_valid_output(display, pipe, output) {
-		if (first == pipe || output == first_output)
-			continue;
+	/* Clear display, events will be eaten by commit.. */
+	igt_display_reset(display);
 
-		if (second) {
-			first = pipe;
-			first_output = output;
-			second = false;
-			continue;
-		}
+	for_each_pipe(display, pipe) {
+		for_each_valid_output_on_pipe(display, pipe, *output) {
+			if((*output)->pending_pipe != PIPE_NONE)
+				continue;
 
-		found = true;
-		break;
+			igt_output_set_pipe(*output, pipe);
+			if (igt_test_constraint(display)) {
+				found = true;
+
+				if (second) {
+					first_output = true;
+					second = false;
+					found = false;
+				}
+				break;
+			}
+			igt_output_set_pipe(*output, PIPE_NONE);
+		}
+		if (found)
+			break;
 	}
 
+	igt_display_reset(display);
 	if (first_output)
 		igt_require_f(found, "No second valid output found\n");
 	else
@@ -429,10 +427,9 @@ static void flip(igt_display_t *display,
 	results = mmap(NULL, PAGE_SIZE, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(results != MAP_FAILED);
 
-	igt_display_reset(display);
-
-	flip_pipe = find_connected_pipe(display, !!flip_pipe);
-	cursor_pipe = find_connected_pipe(display, !!cursor_pipe);
+	flip_pipe = find_connected_pipe(display, !!flip_pipe, &output);
+	cursor_pipe = find_connected_pipe(display, !!cursor_pipe, &output2);
+	igt_skip_on(!output || !output2);
 
 	igt_info("Using pipe %s for page flip, pipe %s for cursor\n",
 		  kmstest_pipe_name(flip_pipe), kmstest_pipe_name(cursor_pipe));
@@ -446,15 +443,15 @@ static void flip(igt_display_t *display,
 					DRM_PLANE_TYPE_OVERLAY));
 	}
 
-	igt_require((output = set_fb_on_crtc(display, flip_pipe, &fb_info)));
+	set_fb_on_crtc(display, flip_pipe, output, &fb_info);
 	if (flip_pipe != cursor_pipe) {
-		igt_require((output2 = set_fb_on_crtc(display, cursor_pipe, &fb_info2)));
+		set_fb_on_crtc(display, cursor_pipe, output2, &fb_info2);
 
 		if (try_commit(display)) {
 			override_output_modes(display, output, output2);
 
-			igt_require((output = set_fb_on_crtc(display, flip_pipe, &fb_info)));
-			igt_require((output2 = set_fb_on_crtc(display, cursor_pipe, &fb_info2)));
+			set_fb_on_crtc(display, flip_pipe, output, &fb_info);
+			set_fb_on_crtc(display, cursor_pipe, output2, &fb_info2);
 		}
 	}
 
@@ -546,7 +543,7 @@ static void basic_flip_cursor(igt_display_t *display,
 	struct drm_event_vblank vbl;
 	struct igt_fb fb_info, cursor_fb, cursor_fb2, argb_fb;
 	unsigned vblank_start;
-	enum pipe pipe = find_connected_pipe(display, false);
+	enum pipe pipe;
 	uint64_t ahnd = 0;
 	igt_spin_t *spin;
 	int i, miss1 = 0, miss2 = 0, delta;
@@ -562,7 +559,13 @@ static void basic_flip_cursor(igt_display_t *display,
 	if (mode >= flip_test_atomic)
 		igt_require(display->is_atomic);
 
-	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
+	pipe = find_connected_pipe(display, false, &output);
+	igt_require(output);
+
+	igt_info("Using pipe %s & %s\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
+	set_fb_on_crtc(display, pipe, output, &fb_info);
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
 	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
@@ -717,7 +720,7 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
 	struct igt_fb fb_info, cursor_fb, cursor_fb2, argb_fb;
 	unsigned vblank_start;
 	int target, cpu;
-	enum pipe pipe = find_connected_pipe(display, false);
+	enum pipe pipe;
 	volatile unsigned long *shared;
 	cpu_set_t mask, oldmask;
 	igt_output_t *output;
@@ -726,7 +729,13 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
 	if (mode >= flip_test_atomic)
 		igt_require(display->is_atomic);
 
-	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
+	pipe = find_connected_pipe(display, false, &output);
+	igt_require(output);
+
+	igt_info("Using pipe %s & %s\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
+	set_fb_on_crtc(display, pipe, output, &fb_info);
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
 	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
@@ -843,12 +852,18 @@ static void nonblocking_modeset_vs_cursor(igt_display_t *display, int loops)
 {
 	struct igt_fb fb_info, cursor_fb;
 	igt_output_t *output;
-	enum pipe pipe = find_connected_pipe(display, false);
+	enum pipe pipe;
 	struct drm_mode_cursor arg[2];
 	igt_plane_t *primary, *cursor = NULL;
 
 	igt_require(display->is_atomic);
-	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
+	pipe = find_connected_pipe(display, false, &output);
+	igt_require(output);
+
+	igt_info("Using pipe %s & %s\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
+	set_fb_on_crtc(display, pipe, output, &fb_info);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
 	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
@@ -935,8 +950,7 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 {
 	struct drm_mode_cursor arg1[2], arg2[2];
 	struct igt_fb fb_info, fb2_info, cursor_fb;
-	enum pipe pipe = find_connected_pipe(display, false);
-	enum pipe pipe2 = find_connected_pipe(display, true);
+	enum pipe pipe, pipe2;
 	igt_output_t *output, *output2;
 	bool enabled = false;
 	volatile unsigned long *shared;
@@ -952,22 +966,28 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 		igt_require(drmGetCap(display->drm_fd, DRM_CAP_CRTC_IN_VBLANK_EVENT, &val) == 0);
 	}
 
+	if (atomic)
+		igt_require(display->is_atomic);
+
 	shared = mmap(NULL, PAGE_SIZE, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(shared != MAP_FAILED);
 
-	igt_fail_on(modeset && !atomic);
+	pipe = find_connected_pipe(display, false, &output);
+	pipe2 = find_connected_pipe(display, true, &output2);
+	igt_skip_on(!output || !output2);
 
-	if (atomic)
-		igt_require(display->is_atomic);
+	igt_info("Using pipe %s & %s and pipe %s & %s\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output),
+		 kmstest_pipe_name(pipe2), igt_output_name(output2));
 
-	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
-	igt_require((output2 = set_fb_on_crtc(display, pipe2, &fb2_info)));
+	set_fb_on_crtc(display, pipe, output, &fb_info);
+	set_fb_on_crtc(display, pipe2, output2, &fb2_info);
 
 	if (try_commit(display)) {
 		override_output_modes(display, output, output2);
 
-		igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
-		igt_require((output2 = set_fb_on_crtc(display, pipe2, &fb2_info)));
+		set_fb_on_crtc(display, pipe, output, &fb_info);
+		set_fb_on_crtc(display, pipe2, output2, &fb2_info);
 	}
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
@@ -1120,7 +1140,7 @@ static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloo
 	unsigned vblank_start, vblank_last;
 	volatile unsigned long *shared;
 	long target;
-	enum pipe pipe = find_connected_pipe(display, false);
+	enum pipe pipe;
 	igt_output_t *output;
 	uint32_t vrefresh;
 	int fail_count;
@@ -1132,7 +1152,13 @@ static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloo
 	shared = mmap(NULL, PAGE_SIZE, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(shared != MAP_FAILED);
 
-	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
+	pipe = find_connected_pipe(display, false, &output);
+	igt_require(output);
+
+	igt_info("Using pipe %s & %s\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
+	set_fb_on_crtc(display, pipe, output, &fb_info);
 	vrefresh = igt_output_get_mode(output)->vrefresh;
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
@@ -1224,10 +1250,7 @@ static void two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool
 	struct igt_fb fb_info[2], cursor_fb;
 	volatile unsigned long *shared;
 	int target[2];
-	enum pipe pipe[2] = {
-		find_connected_pipe(display, false),
-		find_connected_pipe(display, true)
-	};
+	enum pipe pipe[2];
 	igt_output_t *outputs[2];
 	igt_plane_t *cursors[2];
 
@@ -1237,14 +1260,22 @@ static void two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool
 	if (atomic)
 		igt_require(display->is_atomic);
 
-	igt_require((outputs[0] = set_fb_on_crtc(display, pipe[0], &fb_info[0])));
-	igt_require((outputs[1] = set_fb_on_crtc(display, pipe[1], &fb_info[1])));
+	pipe[0] = find_connected_pipe(display, false, &outputs[0]);
+	pipe[1] = find_connected_pipe(display, true, &outputs[1]);
+	igt_skip_on(!outputs[0] || !outputs[1]);
+
+	igt_info("Using pipe %s & %s and pipe %s & %s\n",
+		 kmstest_pipe_name(pipe[0]), igt_output_name(outputs[0]),
+		 kmstest_pipe_name(pipe[1]), igt_output_name(outputs[1]));
+
+	set_fb_on_crtc(display, pipe[0], outputs[0], &fb_info[0]);
+	set_fb_on_crtc(display, pipe[1], outputs[1], &fb_info[1]);
 
 	if (try_commit(display)) {
 		override_output_modes(display, outputs[0], outputs[1]);
 
-		igt_require((outputs[0] = set_fb_on_crtc(display, pipe[0], &fb_info[0])));
-		igt_require((outputs[1] = set_fb_on_crtc(display, pipe[1], &fb_info[1])));
+		set_fb_on_crtc(display, pipe[0], outputs[0], &fb_info[0]);
+		set_fb_on_crtc(display, pipe[1], outputs[1], &fb_info[1]);
 	}
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
@@ -1345,7 +1376,7 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 	struct drm_event_vblank vbl;
 	struct igt_fb fb_info, cursor_fb;
 	unsigned vblank_start;
-	enum pipe pipe = find_connected_pipe(display, false);
+	enum pipe pipe;
 	igt_crc_t crcs[3];
 	igt_output_t *output;
 	igt_plane_t *cursor;
@@ -1353,7 +1384,13 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 	if (atomic)
 		igt_require(display->is_atomic);
 
-	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
+	pipe = find_connected_pipe(display, false, &output);
+	igt_require(output);
+
+	igt_info("Using pipe %s & %s\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
+	set_fb_on_crtc(display, pipe, output, &fb_info);
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
 	populate_cursor_args(display, pipe, arg, &cursor_fb);
@@ -1409,9 +1446,9 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 	struct drm_event_vblank vbl;
 	struct igt_fb fb_info[2], cursor_fb;
 	unsigned vblank_start;
-	enum pipe pipe = find_connected_pipe(display, false);
-	igt_pipe_t *pipe_connected = &display->pipes[pipe];
-	igt_plane_t *plane_primary = igt_pipe_get_plane_type(pipe_connected, DRM_PLANE_TYPE_PRIMARY);
+	enum pipe pipe;
+	igt_pipe_t *pipe_connected;
+	igt_plane_t *plane_primary;
 	igt_crc_t crcs[2], test_crc;
 	uint64_t ahnd;
 	igt_output_t *output;
@@ -1423,7 +1460,16 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 	if (atomic)
 		igt_require(display->is_atomic);
 
-	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info[0])));
+	pipe = find_connected_pipe(display, false, &output);
+	igt_require(output);
+
+	igt_info("Using pipe %s & %s\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
+	pipe_connected = &display->pipes[pipe];
+	plane_primary = igt_pipe_get_plane_type(pipe_connected, DRM_PLANE_TYPE_PRIMARY);
+
+	set_fb_on_crtc(display, pipe, output, &fb_info[0]);
 	igt_create_color_pattern_fb(display->drm_fd, fb_info[0].width, fb_info[0].height,
 				    DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_X_TILED, .1, .1, .1, &fb_info[1]);
 
-- 
2.35.1
