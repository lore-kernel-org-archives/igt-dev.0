Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3E889F6E
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Jan 2021 05:41:08 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Tue, 12 Jan 2021 11:19:42 +0530
Message-Id: <20210112054942.30780-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6] tests/kms_atomic_transition:reduce
 execution time
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
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>, uma.shanker@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

kms_atomic_transition test is taking minimum of
69.5s time to execute on CI. To reduce the execution
time this patch will add the change which will run
the test on 1 HDR plane, 1 SDR UV plane, 1 SDR Y plane
and skip the rest of the planes.

v4: -restricted execution of all the subtests to
    2 pipes. (Uma)
    -Modified skip_plane() function. (Uma)

v5: -added a extended flag, if it is set by the user
    test will be executed on all the pipes otherwise will be
    executed only on 2 pipes. (Karthik)

v6: -in previous version extended flag and display passed in
     separate structures now added a data_t structure which includes
     igt_display_t, extended flag and drm_fd in single structure. (Uma)

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_atomic_transition.c | 403 ++++++++++++++++++++--------------
 1 file changed, 244 insertions(+), 159 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 02206f0a..3c0567fc 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -45,13 +45,19 @@ struct plane_parms {
 	uint32_t width, height, mask;
 };
 
+typedef struct {
+	int drm_fd;
+	igt_display_t display;
+	bool extended;
+} data_t;
+
 /* globals for fence support */
 int *timeline;
 pthread_t *thread;
 int *seqno;
 
 static void
-run_primary_test(igt_display_t *display, enum pipe pipe, igt_output_t *output)
+run_primary_test(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
@@ -65,34 +71,34 @@ run_primary_test(igt_display_t *display, enum pipe pipe, igt_output_t *output)
 	mode = igt_output_get_mode(output);
 
 	igt_plane_set_fb(primary, NULL);
-	ret = igt_display_try_commit_atomic(display, flags, NULL);
+	ret = igt_display_try_commit_atomic(&data->display, flags, NULL);
 	igt_skip_on_f(ret == -EINVAL, "Primary plane cannot be disabled separately from output\n");
 
-	igt_create_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
+	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 		      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, &fb);
 
 	igt_plane_set_fb(primary, &fb);
 
 	for (i = 0; i < 4; i++) {
-		igt_display_commit2(display, COMMIT_ATOMIC);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		if (!(i & 1))
-			igt_wait_for_vblank(display->drm_fd,
-					display->pipes[pipe].crtc_offset);
+			igt_wait_for_vblank(data->drm_fd,
+					data->display.pipes[pipe].crtc_offset);
 
 		igt_plane_set_fb(primary, (i & 1) ? &fb : NULL);
-		igt_display_commit2(display, COMMIT_ATOMIC);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		if (i & 1)
-			igt_wait_for_vblank(display->drm_fd,
-					display->pipes[pipe].crtc_offset);
+			igt_wait_for_vblank(data->drm_fd,
+					data->display.pipes[pipe].crtc_offset);
 
 		igt_plane_set_fb(primary, (i & 1) ? NULL : &fb);
 	}
 
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
-	igt_remove_fb(display->drm_fd, &fb);
+	igt_remove_fb(data->drm_fd, &fb);
 }
 
 static void *fence_inc_thread(void *arg)
@@ -120,8 +126,35 @@ static void configure_fencing(igt_plane_t *plane)
 	igt_assert_eq(ret, 0);
 }
 
+static bool skip_plane(data_t *data, igt_plane_t *plane)
+{
+	int index = plane->index;
+
+	if (data->extended)
+		return false;
+
+	if (!is_i915_device(data->drm_fd))
+		return false;
+
+	if (plane->type == DRM_PLANE_TYPE_CURSOR)
+		return false;
+
+	if (intel_gen(intel_get_drm_devid(data->drm_fd)) < 11)
+		return false;
+
+	/*
+	 * Test 1 HDR plane, 1 SDR UV plane, 1 SDR Y plane.
+	 *
+	 * Kernel registers planes in the hardware Z order:
+	 * 0,1,2 HDR planes
+	 * 3,4 SDR UV planes
+	 * 5,6 SDR Y planes
+	 */
+	return index != 0 && index != 3 && index != 5;
+}
+
 static int
-wm_setup_plane(igt_display_t *display, enum pipe pipe,
+wm_setup_plane(data_t *data, enum pipe pipe,
 	       uint32_t mask, struct plane_parms *parms, bool fencing)
 {
 	igt_plane_t *plane;
@@ -132,9 +165,12 @@ wm_setup_plane(igt_display_t *display, enum pipe pipe,
 	* because most of the modeset operations must be fast
 	* later on.
 	*/
-	for_each_plane_on_pipe(display, pipe, plane) {
+	for_each_plane_on_pipe(&data->display, pipe, plane) {
 		int i = plane->index;
 
+		if (skip_plane(data, plane))
+			continue;
+
 		if (!mask || !(parms[i].mask & mask)) {
 			if (plane->values[IGT_PLANE_FB_ID]) {
 				igt_plane_set_fb(plane, NULL);
@@ -173,13 +209,13 @@ enum transition_type {
 	TRANSITION_MODESET_DISABLE,
 };
 
-static void set_sprite_wh(igt_display_t *display, enum pipe pipe,
+static void set_sprite_wh(data_t *data, enum pipe pipe,
 			  struct plane_parms *parms, struct igt_fb *sprite_fb,
 			  bool alpha, unsigned w, unsigned h)
 {
 	igt_plane_t *plane;
 
-	for_each_plane_on_pipe(display, pipe, plane) {
+	for_each_plane_on_pipe(&data->display, pipe, plane) {
 		int i = plane->index;
 
 		if (plane->type == DRM_PLANE_TYPE_PRIMARY ||
@@ -193,8 +229,8 @@ static void set_sprite_wh(igt_display_t *display, enum pipe pipe,
 		parms[i].height = h;
 	}
 
-	igt_remove_fb(display->drm_fd, sprite_fb);
-	igt_create_fb(display->drm_fd, w, h,
+	igt_remove_fb(data->drm_fd, sprite_fb);
+	igt_create_fb(data->drm_fd, w, h,
 		      alpha ? DRM_FORMAT_ARGB8888 : DRM_FORMAT_XRGB8888,
 		      LOCAL_DRM_FORMAT_MOD_NONE, sprite_fb);
 }
@@ -205,7 +241,7 @@ static void set_sprite_wh(igt_display_t *display, enum pipe pipe,
 #define is_atomic_check_plane_size_errno(errno) \
 		(errno == -EINVAL)
 
-static void setup_parms(igt_display_t *display, enum pipe pipe,
+static void setup_parms(data_t *data, enum pipe pipe,
 			const drmModeModeInfo *mode,
 			struct igt_fb *primary_fb,
 			struct igt_fb *argb_fb,
@@ -216,20 +252,20 @@ static void setup_parms(igt_display_t *display, enum pipe pipe,
 	uint64_t cursor_width, cursor_height;
 	unsigned sprite_width, sprite_height, prev_w, prev_h;
 	bool max_sprite_width, max_sprite_height, alpha = true;
-	uint32_t n_planes = display->pipes[pipe].n_planes;
+	uint32_t n_planes = data->display.pipes[pipe].n_planes;
 	uint32_t n_overlays = 0, overlays[n_planes];
 	igt_plane_t *plane;
 	uint32_t iter_mask = 3;
 
-	do_or_die(drmGetCap(display->drm_fd, DRM_CAP_CURSOR_WIDTH, &cursor_width));
+	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &cursor_width));
 	if (cursor_width >= mode->hdisplay)
 		cursor_width = mode->hdisplay;
 
-	do_or_die(drmGetCap(display->drm_fd, DRM_CAP_CURSOR_HEIGHT, &cursor_height));
+	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_HEIGHT, &cursor_height));
 	if (cursor_height >= mode->vdisplay)
 		cursor_height = mode->vdisplay;
 
-	for_each_plane_on_pipe(display, pipe, plane) {
+	for_each_plane_on_pipe(&data->display, pipe, plane) {
 		int i = plane->index;
 
 		if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
@@ -272,10 +308,10 @@ static void setup_parms(igt_display_t *display, enum pipe pipe,
 		}
 	}
 
-	igt_create_fb(display->drm_fd, cursor_width, cursor_height,
+	igt_create_fb(data->drm_fd, cursor_width, cursor_height,
 		      DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE, argb_fb);
 
-	igt_create_fb(display->drm_fd, cursor_width, cursor_height,
+	igt_create_fb(data->drm_fd, cursor_width, cursor_height,
 		      DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE, sprite_fb);
 
 	*iter_max = iter_mask + 1;
@@ -295,11 +331,11 @@ static void setup_parms(igt_display_t *display, enum pipe pipe,
 	while (!max_sprite_width && !max_sprite_height) {
 		int ret;
 
-		set_sprite_wh(display, pipe, parms, sprite_fb,
+		set_sprite_wh(data, pipe, parms, sprite_fb,
 			      alpha, sprite_width, sprite_height);
 
-		wm_setup_plane(display, pipe, (1 << n_planes) - 1, parms, false);
-		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		wm_setup_plane(data, pipe, (1 << n_planes) - 1, parms, false);
+		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 		igt_assert(!is_atomic_check_failure_errno(ret));
 
 		if (!is_atomic_check_plane_size_errno(ret)) {
@@ -327,7 +363,7 @@ static void setup_parms(igt_display_t *display, enum pipe pipe,
 			igt_assert_f(n_planes >= 3, "No planes left to proceed with!");
 			if (n_overlays > 0) {
 				uint32_t plane_to_remove = hars_petruska_f54_1_random_unsafe_max(n_overlays);
-				removed_plane = &display->pipes[pipe].planes[overlays[plane_to_remove]];
+				removed_plane = &data->display.pipes[pipe].planes[overlays[plane_to_remove]];
 				igt_plane_set_fb(removed_plane, NULL);
 				while (plane_to_remove < (n_overlays - 1)) {
 					overlays[plane_to_remove] = overlays[plane_to_remove + 1];
@@ -353,7 +389,7 @@ static void setup_parms(igt_display_t *display, enum pipe pipe,
 			max_sprite_height = true;
 	}
 
-	set_sprite_wh(display, pipe, parms, sprite_fb,
+	set_sprite_wh(data, pipe, parms, sprite_fb,
 			alpha, sprite_width, sprite_height);
 
 	igt_info("Running test on pipe %s with resolution %dx%d and sprite size %dx%d alpha %i\n",
@@ -361,14 +397,14 @@ static void setup_parms(igt_display_t *display, enum pipe pipe,
 		 sprite_width, sprite_height, alpha);
 }
 
-static void prepare_fencing(igt_display_t *display, enum pipe pipe)
+static void prepare_fencing(data_t *data, enum pipe pipe)
 {
 	igt_plane_t *plane;
 	int n_planes;
 
 	igt_require_sw_sync();
 
-	n_planes = display->pipes[pipe].n_planes;
+	n_planes = data->display.pipes[pipe].n_planes;
 	timeline = calloc(sizeof(*timeline), n_planes);
 	igt_assert_f(timeline != NULL, "Failed to allocate memory for timelines\n");
 	thread = calloc(sizeof(*thread), n_planes);
@@ -376,15 +412,15 @@ static void prepare_fencing(igt_display_t *display, enum pipe pipe)
 	seqno = calloc(sizeof(*seqno), n_planes);
 	igt_assert_f(seqno != NULL, "Failed to allocate memory for seqno\n");
 
-	for_each_plane_on_pipe(display, pipe, plane)
+	for_each_plane_on_pipe(&data->display, pipe, plane)
 		timeline[plane->index] = sw_sync_timeline_create();
 }
 
-static void unprepare_fencing(igt_display_t *display, enum pipe pipe)
+static void unprepare_fencing(data_t *data, enum pipe pipe)
 {
 	igt_plane_t *plane;
 
-	for_each_plane_on_pipe(display, pipe, plane)
+	for_each_plane_on_pipe(&data->display, pipe, plane)
 		close(timeline[plane->index]);
 
 	free(timeline);
@@ -392,12 +428,12 @@ static void unprepare_fencing(igt_display_t *display, enum pipe pipe)
 	free(seqno);
 }
 
-static void atomic_commit(igt_display_t *display, enum pipe pipe, unsigned int flags, void *data, bool fencing)
+static void atomic_commit(data_t *data_v, enum pipe pipe, unsigned int flags, void *data, bool fencing)
 {
 	if (fencing)
-		igt_pipe_request_out_fence(&display->pipes[pipe]);
+		igt_pipe_request_out_fence(&data_v->display.pipes[pipe]);
 
-	igt_display_commit_atomic(display, flags, data);
+	igt_display_commit_atomic(&data_v->display, flags, data);
 }
 
 static int fd_completed(int fd)
@@ -410,10 +446,10 @@ static int fd_completed(int fd)
 	return ret;
 }
 
-static void wait_for_transition(igt_display_t *display, enum pipe pipe, bool nonblocking, bool fencing)
+static void wait_for_transition(data_t *data, enum pipe pipe, bool nonblocking, bool fencing)
 {
 	if (fencing) {
-		int fence_fd = display->pipes[pipe].out_fence_fd;
+		int fence_fd = data->display.pipes[pipe].out_fence_fd;
 
 		if (!nonblocking)
 			igt_assert(fd_completed(fence_fd));
@@ -421,9 +457,9 @@ static void wait_for_transition(igt_display_t *display, enum pipe pipe, bool non
 		igt_assert(sync_fence_wait(fence_fd, 30000) == 0);
 	} else {
 		if (!nonblocking)
-			igt_assert(fd_completed(display->drm_fd));
+			igt_assert(fd_completed(data->drm_fd));
 
-		drmHandleEvent(display->drm_fd, &drm_events);
+		drmHandleEvent(data->drm_fd, &drm_events);
 	}
 }
 
@@ -437,20 +473,20 @@ static void wait_for_transition(igt_display_t *display, enum pipe pipe, bool non
  * so test this and make sure it works.
  */
 static void
-run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output,
+run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 		enum transition_type type, bool nonblocking, bool fencing)
 {
 	struct igt_fb fb, argb_fb, sprite_fb;
 	drmModeModeInfo *mode, override_mode;
 	igt_plane_t *plane;
-	igt_pipe_t *pipe_obj = &display->pipes[pipe];
+	igt_pipe_t *pipe_obj = &data->display.pipes[pipe];
 	uint32_t iter_max, i;
 	struct plane_parms parms[pipe_obj->n_planes];
 	unsigned flags = 0;
 	int ret;
 
 	if (fencing)
-		prepare_fencing(display, pipe);
+		prepare_fencing(data, pipe);
 	else
 		flags |= DRM_MODE_PAGE_FLIP_EVENT;
 
@@ -465,24 +501,24 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 	/* try to force a modeset */
 	override_mode.flags ^= DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NHSYNC;
 
-	igt_create_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
+	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 		      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, &fb);
 
 	igt_output_set_pipe(output, pipe);
 
-	wm_setup_plane(display, pipe, 0, NULL, false);
+	wm_setup_plane(data, pipe, 0, NULL, false);
 
 	if (flags & DRM_MODE_ATOMIC_ALLOW_MODESET) {
 		igt_output_set_pipe(output, PIPE_NONE);
 
-		igt_display_commit2(display, COMMIT_ATOMIC);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		igt_output_set_pipe(output, pipe);
 	}
 
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	setup_parms(display, pipe, mode, &fb, &argb_fb, &sprite_fb, parms, &iter_max);
+	setup_parms(data, pipe, mode, &fb, &argb_fb, &sprite_fb, parms, &iter_max);
 
 	/*
 	 * In some configurations the tests may not run to completion with all
@@ -490,19 +526,19 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 	 * planes to fix this
 	 */
 	while (1) {
-		wm_setup_plane(display, pipe, iter_max - 1, parms, false);
+		wm_setup_plane(data, pipe, iter_max - 1, parms, false);
 
 		if (fencing)
 			igt_pipe_request_out_fence(pipe_obj);
 
-		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 		igt_assert(!is_atomic_check_failure_errno(ret));
 
 		if (!is_atomic_check_plane_size_errno(ret) || pipe_obj->n_planes < 3)
 			break;
 
 		ret = 0;
-		for_each_plane_on_pipe(display, pipe, plane) {
+		for_each_plane_on_pipe(&data->display, pipe, plane) {
 			i = plane->index;
 
 			if (plane->type == DRM_PLANE_TYPE_PRIMARY ||
@@ -519,33 +555,33 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 			igt_skip("Cannot run tests without proper size sprite planes\n");
 	}
 
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 	if (type == TRANSITION_AFTER_FREE) {
 		int fence_fd = -1;
 
-		wm_setup_plane(display, pipe, 0, parms, fencing);
+		wm_setup_plane(data, pipe, 0, parms, fencing);
 
-		atomic_commit(display, pipe, flags, (void *)(unsigned long)0, fencing);
+		atomic_commit(data, pipe, flags, (void *)(unsigned long)0, fencing);
 		if (fencing) {
 			fence_fd = pipe_obj->out_fence_fd;
 			pipe_obj->out_fence_fd = -1;
 		}
 
 		/* force planes to be part of commit */
-		for_each_plane_on_pipe(display, pipe, plane) {
+		for_each_plane_on_pipe(&data->display, pipe, plane) {
 			if (parms[plane->index].mask)
 				igt_plane_set_position(plane, 0, 0);
 		}
 
-		igt_display_commit2(display, COMMIT_ATOMIC);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		if (fence_fd != -1) {
 			igt_assert(fd_completed(fence_fd));
 			close(fence_fd);
 		} else {
-			igt_assert(fd_completed(display->drm_fd));
-			wait_for_transition(display, pipe, false, fencing);
+			igt_assert(fd_completed(data->drm_fd));
+			wait_for_transition(data, pipe, false, fencing);
 		}
 		goto cleanup;
 	}
@@ -560,20 +596,20 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 
 		igt_output_set_pipe(output, pipe);
 
-		if (!wm_setup_plane(display, pipe, i, parms, fencing))
+		if (!wm_setup_plane(data, pipe, i, parms, fencing))
 			continue;
 
-		atomic_commit(display, pipe, flags, (void *)(unsigned long)i, fencing);
-		wait_for_transition(display, pipe, nonblocking, fencing);
+		atomic_commit(data, pipe, flags, (void *)(unsigned long)i, fencing);
+		wait_for_transition(data, pipe, nonblocking, fencing);
 
 		if (type == TRANSITION_MODESET_DISABLE) {
 			igt_output_set_pipe(output, PIPE_NONE);
 
-			if (!wm_setup_plane(display, pipe, 0, parms, fencing))
+			if (!wm_setup_plane(data, pipe, 0, parms, fencing))
 				continue;
 
-			atomic_commit(display, pipe, flags, (void *) 0UL, fencing);
-			wait_for_transition(display, pipe, nonblocking, fencing);
+			atomic_commit(data, pipe, flags, (void *) 0UL, fencing);
+			wait_for_transition(data, pipe, nonblocking, fencing);
 		} else {
 			uint32_t j;
 
@@ -586,44 +622,44 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 				    n_enable_planes < pipe_obj->n_planes)
 					continue;
 
-				if (!wm_setup_plane(display, pipe, j, parms, fencing))
+				if (!wm_setup_plane(data, pipe, j, parms, fencing))
 					continue;
 
 				if (type >= TRANSITION_MODESET)
 					igt_output_override_mode(output, &override_mode);
 
-				atomic_commit(display, pipe, flags, (void *)(unsigned long) j, fencing);
-				wait_for_transition(display, pipe, nonblocking, fencing);
+				atomic_commit(data, pipe, flags, (void *)(unsigned long) j, fencing);
+				wait_for_transition(data, pipe, nonblocking, fencing);
 
-				if (!wm_setup_plane(display, pipe, i, parms, fencing))
+				if (!wm_setup_plane(data, pipe, i, parms, fencing))
 					continue;
 
 				if (type >= TRANSITION_MODESET)
 					igt_output_override_mode(output, NULL);
 
-				atomic_commit(display, pipe, flags, (void *)(unsigned long) i, fencing);
-				wait_for_transition(display, pipe, nonblocking, fencing);
+				atomic_commit(data, pipe, flags, (void *)(unsigned long) i, fencing);
+				wait_for_transition(data, pipe, nonblocking, fencing);
 			}
 		}
 	}
 
 cleanup:
 	if (fencing)
-		unprepare_fencing(display, pipe);
+		unprepare_fencing(data, pipe);
 
 	igt_output_set_pipe(output, PIPE_NONE);
 
-	for_each_plane_on_pipe(display, pipe, plane)
+	for_each_plane_on_pipe(&data->display, pipe, plane)
 		igt_plane_set_fb(plane, NULL);
 
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	igt_remove_fb(display->drm_fd, &fb);
-	igt_remove_fb(display->drm_fd, &argb_fb);
-	igt_remove_fb(display->drm_fd, &sprite_fb);
+	igt_remove_fb(data->drm_fd, &fb);
+	igt_remove_fb(data->drm_fd, &argb_fb);
+	igt_remove_fb(data->drm_fd, &sprite_fb);
 }
 
-static void commit_display(igt_display_t *display, unsigned event_mask, bool nonblocking)
+static void commit_display(data_t *data, unsigned event_mask, bool nonblocking)
 {
 	unsigned flags;
 	int num_events = igt_hweight(event_mask);
@@ -633,7 +669,7 @@ static void commit_display(igt_display_t *display, unsigned event_mask, bool non
 	if (nonblocking)
 		flags |= DRM_MODE_ATOMIC_NONBLOCK;
 
-	igt_display_commit_atomic(display, flags, NULL);
+	igt_display_commit_atomic(&data->display, flags, NULL);
 
 	igt_debug("Event mask: %x, waiting for %i events\n", event_mask, num_events);
 
@@ -645,7 +681,7 @@ static void commit_display(igt_display_t *display, unsigned event_mask, bool non
 		struct drm_event_vblank *vblank = (void *)buf;
 
 		igt_set_timeout(3, "Timed out while reading drm_fd\n");
-		ret = read(display->drm_fd, buf, sizeof(buf));
+		ret = read(data->drm_fd, buf, sizeof(buf));
 		igt_reset_timeout();
 		if (ret < 0 && (errno == EINTR || errno == EAGAIN))
 			continue;
@@ -661,23 +697,23 @@ static void commit_display(igt_display_t *display, unsigned event_mask, bool non
 	igt_reset_timeout();
 }
 
-static unsigned set_combinations(igt_display_t *display, unsigned mask, struct igt_fb *fb)
+static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 {
 	igt_output_t *output;
 	enum pipe pipe;
 	unsigned event_mask = 0;
 	int i;
 
-	for (i = 0; i < display->n_outputs; i++)
-		igt_output_set_pipe(&display->outputs[i], PIPE_NONE);
+	for (i = 0; i < data->display.n_outputs; i++)
+		igt_output_set_pipe(&data->display.outputs[i], PIPE_NONE);
 
-	for_each_pipe(display, pipe) {
-		igt_plane_t *plane = igt_pipe_get_plane_type(&display->pipes[pipe],
+	for_each_pipe(&data->display, pipe) {
+		igt_plane_t *plane = igt_pipe_get_plane_type(&data->display.pipes[pipe],
 			DRM_PLANE_TYPE_PRIMARY);
 		drmModeModeInfo *mode = NULL;
 
 		if (!(mask & (1 << pipe))) {
-			if (igt_pipe_is_prop_changed(display, pipe, IGT_CRTC_ACTIVE)) {
+			if (igt_pipe_is_prop_changed(&data->display, pipe, IGT_CRTC_ACTIVE)) {
 				event_mask |= 1 << pipe;
 				igt_plane_set_fb(plane, NULL);
 			}
@@ -687,7 +723,7 @@ static unsigned set_combinations(igt_display_t *display, unsigned mask, struct i
 
 		event_mask |= 1 << pipe;
 
-		for_each_valid_output_on_pipe(display, pipe, output) {
+		for_each_valid_output_on_pipe(&data->display, pipe, output) {
 			if (output->pending_pipe != PIPE_NONE)
 				continue;
 
@@ -707,16 +743,16 @@ static unsigned set_combinations(igt_display_t *display, unsigned mask, struct i
 	return event_mask;
 }
 
-static void refresh_primaries(igt_display_t *display, int mask)
+static void refresh_primaries(data_t  *data, int mask)
 {
 	enum pipe pipe;
 	igt_plane_t *plane;
 
-	for_each_pipe(display, pipe) {
+	for_each_pipe(&data->display, pipe) {
 		if (!((1 << pipe) & mask))
 			continue;
 
-		for_each_plane_on_pipe(display, pipe, plane)
+		for_each_plane_on_pipe(&data->display, pipe, plane)
 			if (plane->type == DRM_PLANE_TYPE_PRIMARY)
 				igt_plane_set_position(plane, 0, 0);
 	}
@@ -737,7 +773,7 @@ static void collect_crcs_mask(igt_pipe_crc_t **pipe_crcs, unsigned mask, igt_crc
 	}
 }
 
-static void run_modeset_tests(igt_display_t *display, int howmany, bool nonblocking, bool fencing)
+static void run_modeset_tests(data_t *data, int howmany, bool nonblocking, bool fencing)
 {
 	struct igt_fb fbs[2];
 	int i, j = 0;
@@ -746,33 +782,33 @@ static void run_modeset_tests(igt_display_t *display, int howmany, bool nonblock
 	igt_output_t *output;
 	unsigned width = 0, height = 0;
 
-	for (i = 0; i < display->n_outputs; i++)
-		igt_output_set_pipe(&display->outputs[i], PIPE_NONE);
+	for (i = 0; i < data->display.n_outputs; i++)
+		igt_output_set_pipe(&data->display.outputs[i], PIPE_NONE);
 
-	for_each_connected_output(display, output) {
+	for_each_connected_output(&data->display, output) {
 		drmModeModeInfo *mode = igt_output_get_mode(output);
 
 		width = max(width, mode->hdisplay);
 		height = max(height, mode->vdisplay);
 	}
 
-	igt_create_pattern_fb(display->drm_fd, width, height,
+	igt_create_pattern_fb(data->drm_fd, width, height,
 				   DRM_FORMAT_XRGB8888, 0, &fbs[0]);
-	igt_create_color_pattern_fb(display->drm_fd, width, height,
+	igt_create_color_pattern_fb(data->drm_fd, width, height,
 				    DRM_FORMAT_XRGB8888, 0, .5, .5, .5, &fbs[1]);
 
-	for_each_pipe(display, i) {
-		igt_pipe_t *pipe = &display->pipes[i];
+	for_each_pipe(&data->display, i) {
+		igt_pipe_t *pipe = &data->display.pipes[i];
 		igt_plane_t *plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 		drmModeModeInfo *mode = NULL;
 
 		/* count enable pipes to set max iteration */
 		j += 1;
 
-		if (is_i915_device(display->drm_fd))
-			pipe_crcs[i] = igt_pipe_crc_new(display->drm_fd, i, INTEL_PIPE_CRC_SOURCE_AUTO);
+		if (is_i915_device(data->drm_fd))
+			pipe_crcs[i] = igt_pipe_crc_new(data->drm_fd, i, INTEL_PIPE_CRC_SOURCE_AUTO);
 
-		for_each_valid_output_on_pipe(display, i, output) {
+		for_each_valid_output_on_pipe(&data->display, i, output) {
 			if (output->pending_pipe != PIPE_NONE)
 				continue;
 
@@ -787,7 +823,7 @@ static void run_modeset_tests(igt_display_t *display, int howmany, bool nonblock
 			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
 
 			if (fencing)
-				igt_pipe_request_out_fence(&display->pipes[i]);
+				igt_pipe_request_out_fence(&data->display.pipes[i]);
 		} else {
 			igt_plane_set_fb(plane, NULL);
 		}
@@ -795,7 +831,7 @@ static void run_modeset_tests(igt_display_t *display, int howmany, bool nonblock
 
 	iter_max = 1 << j;
 
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 	for (i = 0; i < iter_max; i++) {
 		igt_crc_t crcs[5][IGT_MAX_PIPES];
@@ -804,11 +840,11 @@ static void run_modeset_tests(igt_display_t *display, int howmany, bool nonblock
 		if (igt_hweight(i) > howmany)
 			continue;
 
-		event_mask = set_combinations(display, i, &fbs[0]);
+		event_mask = set_combinations(data, i, &fbs[0]);
 		if (!event_mask && i)
 			continue;
 
-		commit_display(display, event_mask, nonblocking);
+		commit_display(data, event_mask, nonblocking);
 
 		collect_crcs_mask(pipe_crcs, i, crcs[0]);
 
@@ -819,30 +855,30 @@ static void run_modeset_tests(igt_display_t *display, int howmany, bool nonblock
 			if (igt_hweight(i) < howmany && igt_hweight(j) < howmany)
 				continue;
 
-			event_mask = set_combinations(display, j, &fbs[1]);
+			event_mask = set_combinations(data, j, &fbs[1]);
 			if (!event_mask)
 				continue;
 
-			commit_display(display, event_mask, nonblocking);
+			commit_display(data, event_mask, nonblocking);
 
 			collect_crcs_mask(pipe_crcs, j, crcs[1]);
 
-			refresh_primaries(display, j);
-			commit_display(display, j, nonblocking);
+			refresh_primaries(data, j);
+			commit_display(data, j, nonblocking);
 			collect_crcs_mask(pipe_crcs, j, crcs[2]);
 
-			event_mask = set_combinations(display, i, &fbs[0]);
+			event_mask = set_combinations(data, i, &fbs[0]);
 			if (!event_mask)
 				continue;
 
-			commit_display(display, event_mask, nonblocking);
+			commit_display(data, event_mask, nonblocking);
 			collect_crcs_mask(pipe_crcs, i, crcs[3]);
 
-			refresh_primaries(display, i);
-			commit_display(display, i, nonblocking);
+			refresh_primaries(data, i);
+			commit_display(data, i, nonblocking);
 			collect_crcs_mask(pipe_crcs, i, crcs[4]);
 
-			if (!is_i915_device(display->drm_fd))
+			if (!is_i915_device(data->drm_fd))
 				continue;
 
 			for (int k = 0; k < IGT_MAX_PIPES; k++) {
@@ -857,28 +893,28 @@ static void run_modeset_tests(igt_display_t *display, int howmany, bool nonblock
 		}
 	}
 
-	set_combinations(display, 0, NULL);
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	set_combinations(data, 0, NULL);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	if (is_i915_device(display->drm_fd)) {
-		for_each_pipe(display, i)
+	if (is_i915_device(data->drm_fd)) {
+		for_each_pipe(&data->display, i)
 			igt_pipe_crc_free(pipe_crcs[i]);
 	}
 
-	igt_remove_fb(display->drm_fd, &fbs[1]);
-	igt_remove_fb(display->drm_fd, &fbs[0]);
+	igt_remove_fb(data->drm_fd, &fbs[1]);
+	igt_remove_fb(data->drm_fd, &fbs[0]);
 }
 
-static void run_modeset_transition(igt_display_t *display, int requested_outputs, bool nonblocking, bool fencing)
+static void run_modeset_transition(data_t *data, int requested_outputs, bool nonblocking, bool fencing)
 {
 	igt_output_t *outputs[IGT_MAX_PIPES] = {};
 	int num_outputs = 0;
 	enum pipe pipe;
 
-	for_each_pipe(display, pipe) {
+	for_each_pipe(&data->display, pipe) {
 		igt_output_t *output;
 
-		for_each_valid_output_on_pipe(display, pipe, output) {
+		for_each_valid_output_on_pipe(&data->display, pipe, output) {
 			int i;
 
 			for (i = pipe - 1; i >= 0; i--)
@@ -897,7 +933,7 @@ static void run_modeset_transition(igt_display_t *display, int requested_outputs
 		      "Should have at least %i outputs, found %i\n",
 		      requested_outputs, num_outputs);
 
-	run_modeset_tests(display, requested_outputs, nonblocking, fencing);
+	run_modeset_tests(data, requested_outputs, nonblocking, fencing);
 }
 
 static bool output_is_internal_panel(igt_output_t *output)
@@ -913,70 +949,108 @@ static bool output_is_internal_panel(igt_output_t *output)
 	}
 }
 
-igt_main
+static int opt_handler(int opt, int opt_index, void *_data)
+{
+	data_t *data = _data;
+
+	switch (opt) {
+	case 'e':
+		data->extended = true;
+		break;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static const struct option long_opts[] = {
+	{ .name = "extended", .has_arg = false, .val = 'e', },
+	{}
+};
+
+static const char help_str[] =
+	"  --extended\t\tRun the extended tests\n";
+
+static data_t data;
+
+igt_main_args("", long_opts, help_str, opt_handler, &data)
 {
-	igt_display_t display;
 	igt_output_t *output;
 	enum pipe pipe;
 	int i, count = 0;
 
 	igt_fixture {
-		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		kmstest_set_vt_graphics_mode();
 
-		igt_display_require(&display, display.drm_fd);
-		igt_require(display.is_atomic);
+		igt_display_require(&data.display, data.drm_fd);
+		igt_require(&data.display.is_atomic);
 
-		igt_display_require_output(&display);
+		igt_display_require_output(&data.display);
 
-		for_each_connected_output(&display, output)
+		for_each_connected_output(&data.display, output)
 			count++;
 	}
 
 	igt_subtest("plane-primary-toggle-with-vblank-wait")
-		for_each_pipe_with_valid_output(&display, pipe, output)
-			run_primary_test(&display, pipe, output);
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			if (pipe >= 2 && !data.extended)
+				break;
+			run_primary_test(&data, pipe, output);
+
+		}
 
 	igt_subtest_with_dynamic("plane-all-transition") {
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			if (pipe >= 2 && !data.extended)
+				break;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&display, pipe, output, TRANSITION_PLANES, false, false);
+				run_transition_test(&data, pipe, output, TRANSITION_PLANES, false, false);
 		}
 	}
 
 	igt_subtest_with_dynamic("plane-all-transition-fencing") {
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			if (pipe >= 2 && !data.extended)
+				break;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&display, pipe, output, TRANSITION_PLANES, false, true);
+				run_transition_test(&data, pipe, output, TRANSITION_PLANES, false, true);
 		}
 	}
 
 	igt_subtest_with_dynamic("plane-all-transition-nonblocking") {
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			if (pipe >= 2 && !data.extended)
+				break;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&display, pipe, output, TRANSITION_PLANES, true, false);
+				run_transition_test(&data, pipe, output, TRANSITION_PLANES, true, false);
 		}
 	}
 
 	igt_subtest_with_dynamic("plane-all-transition-nonblocking-fencing") {
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			if (pipe >= 2 && !data.extended)
+				break;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&display, pipe, output, TRANSITION_PLANES, true, true);
+				run_transition_test(&data, pipe, output, TRANSITION_PLANES, true, true);
 		}
 	}
 
 	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind") {
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			if (pipe >= 2 && !data.extended)
+				break;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&display, pipe, output, TRANSITION_AFTER_FREE, true, false);
+				run_transition_test(&data, pipe, output, TRANSITION_AFTER_FREE, true, false);
 		}
 	}
 
 	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind-fencing") {
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			if (pipe >= 2 && !data.extended)
+				break;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&display, pipe, output, TRANSITION_AFTER_FREE, true, true);
+				run_transition_test(&data, pipe, output, TRANSITION_AFTER_FREE, true, true);
 		}
 	}
 
@@ -986,76 +1060,87 @@ igt_main
 	 * panels with long power cycle delays.
 	 */
 	igt_subtest_with_dynamic("plane-all-modeset-transition")
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			if (pipe >= 2 && !data.extended)
+				break;
 			if (output_is_internal_panel(output))
 				continue;
 
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&display, pipe, output, TRANSITION_MODESET, false, false);
+				run_transition_test(&data, pipe, output, TRANSITION_MODESET, false, false);
 		}
 
 	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing")
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			if (pipe >= 2 && !data.extended)
+				break;
 			if (output_is_internal_panel(output))
 				continue;
 
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&display, pipe, output, TRANSITION_MODESET, false, true);
+				run_transition_test(&data, pipe, output, TRANSITION_MODESET, false, true);
 		}
 
 	igt_subtest_with_dynamic("plane-all-modeset-transition-internal-panels") {
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			if (pipe >= 2 && !data.extended)
+				break;
 			if (!output_is_internal_panel(output))
 				continue;
 
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&display, pipe, output, TRANSITION_MODESET_FAST, false, false);
+				run_transition_test(&data, pipe, output, TRANSITION_MODESET_FAST, false, false);
 		}
 	}
 
 	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing-internal-panels") {
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			if (pipe >= 2 && !data.extended)
+				break;
 			if (!output_is_internal_panel(output))
 				continue;
 
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&display, pipe, output, TRANSITION_MODESET_FAST, false, true);
+				run_transition_test(&data, pipe, output, TRANSITION_MODESET_FAST, false, true);
 		}
 	}
 
 	igt_subtest("plane-toggle-modeset-transition")
-		for_each_pipe_with_valid_output(&display, pipe, output)
-			run_transition_test(&display, pipe, output, TRANSITION_MODESET_DISABLE, false, false);
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			if (pipe >= 2 && !data.extended)
+				break;
+			run_transition_test(&data, pipe, output, TRANSITION_MODESET_DISABLE, false, false);
+		}
 
 	igt_subtest_with_dynamic("modeset-transition") {
 		for (i = 1; i <= count; i++) {
 			igt_dynamic_f("%ix-outputs", i)
-				run_modeset_transition(&display, i, false, false);
+				run_modeset_transition(&data, i, false, false);
 		}
 	}
 
 	igt_subtest_with_dynamic("modeset-transition-nonblocking") {
 		for (i = 1; i <= count; i++) {
 			igt_dynamic_f("%ix-outputs", i)
-				run_modeset_transition(&display, i, true, false);
+				run_modeset_transition(&data, i, true, false);
 		}
 	}
 
 	igt_subtest_with_dynamic("modeset-transition-fencing") {
 		for (i = 1; i <= count; i++) {
 			igt_dynamic_f("%ix-outputs", i)
-				run_modeset_transition(&display, i, false, true);
+				run_modeset_transition(&data, i, false, true);
 		}
 	}
 
 	igt_subtest_with_dynamic("modeset-transition-nonblocking-fencing") {
 		for (i = 1; i <= count; i++) {
 			igt_dynamic_f("%ix-outputs", i)
-				run_modeset_transition(&display, i, true, true);
+				run_modeset_transition(&data, i, true, true);
 		}
 	}
 
 	igt_fixture {
-		igt_display_fini(&display);
+		igt_display_fini(&data.display);
 	}
 }
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
