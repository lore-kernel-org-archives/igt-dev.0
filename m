Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE426E8EB
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2020 13:35:26 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Wed, 18 Mar 2020 19:03:26 +0530
Message-Id: <20200318133326.18801-2-mohammed.khajapasha@intel.com>
In-Reply-To: <20200318133326.18801-1-mohammed.khajapasha@intel.com>
References: <20200318133326.18801-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/1] test/kms: Use bare number of crtc index
 to get a pipe
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
List-ID: <igt-dev@lists.freedesktop.org>

In non-continous pipe display,
1. if PIPE_B,C is disabled in kernel, PIPE_A & PIPE_D
get registered with 0,1 indexes in display pipes[] array
and kmstest_pipe_name() always prints PIPE_B for enum pipe 1
which is actually PIPE_D in kernel.
2. And in kernel the possible_crtc bit map is based on
crtc index and for PIPE_D second least bit set in possible_crtc,
macro for_each_pipe_with_valid_output() with enum pipe index
always assumes PIPE_B for second least bit in possible_crtc
but it is PIPE_D in kernel.

To avoid this using bare number of crtc index
to get a pipe from display->pipes[] array to support
non-continuous pipe display.

This is a sample change to review on usage of bare number of
crtc index for each pipe, based upon the review the patch series
https://patchwork.freedesktop.org/series/74431/
will be updated with this change.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 lib/igt_kms.c                 |  22 ++--
 lib/igt_kms.h                 |  26 ++---
 tests/kms_atomic_transition.c | 196 +++++++++++++++++-----------------
 3 files changed, 121 insertions(+), 123 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 849aa346..c2c35c07 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2255,7 +2255,7 @@ report_dup:
 static igt_pipe_t *igt_output_get_driving_pipe(igt_output_t *output)
 {
 	igt_display_t *display = output->display;
-	enum pipe pipe;
+	int idx;
 
 	if (output->pending_pipe == PIPE_NONE) {
 		/*
@@ -2267,12 +2267,12 @@ static igt_pipe_t *igt_output_get_driving_pipe(igt_output_t *output)
 		 * Otherwise, return the pending pipe (ie the pipe that should
 		 * drive this output after the commit()
 		 */
-		pipe = output->pending_pipe;
+		idx = output->pending_pipe;
 	}
 
-	igt_assert(pipe >= 0 && pipe < display->n_pipes);
+	igt_assert(idx >= 0 && idx < display->n_pipes);
 
-	return &display->pipes[pipe];
+	return &display->pipes[idx];
 }
 
 static igt_plane_t *igt_pipe_get_plane(igt_pipe_t *pipe, int plane_idx)
@@ -3660,13 +3660,13 @@ void igt_output_override_mode(igt_output_t *output, const drmModeModeInfo *mode)
 /*
  * igt_output_set_pipe:
  * @output: Target output for which the pipe is being set to
- * @pipe: Display pipe to set to
+ * @idx: Index for a Display pipe to be set
  *
  * This function sets a @pipe to a specific @output connector by
  * setting the CRTC_ID property of the @pipe. The pipe
  * is only activated for all pipes except PIPE_NONE.
  */
-void igt_output_set_pipe(igt_output_t *output, enum pipe pipe)
+void igt_output_set_pipe(igt_output_t *output, int idx)
 {
 	igt_display_t *display = output->display;
 	igt_pipe_t *old_pipe = NULL, *pipe_obj = NULL;;
@@ -3676,12 +3676,12 @@ void igt_output_set_pipe(igt_output_t *output, enum pipe pipe)
 	if (output->pending_pipe != PIPE_NONE)
 		old_pipe = igt_output_get_driving_pipe(output);
 
-	if (pipe != PIPE_NONE)
-		pipe_obj = &display->pipes[pipe];
+	if (idx != PIPE_NONE)
+		pipe_obj = &display->pipes[idx];
 
 	LOG(display, "%s: set_pipe(%s)\n", igt_output_name(output),
-	    kmstest_pipe_name(pipe));
-	output->pending_pipe = pipe;
+	    kmstest_pipe_name(display->pipes[idx].pipe));
+	output->pending_pipe = idx;
 
 	if (old_pipe) {
 		igt_output_t *old_output;
@@ -3697,7 +3697,7 @@ void igt_output_set_pipe(igt_output_t *output, enum pipe pipe)
 		}
 	}
 
-	igt_output_set_prop_value(output, IGT_CONNECTOR_CRTC_ID, pipe == PIPE_NONE ? 0 : display->pipes[pipe].crtc_id);
+	igt_output_set_prop_value(output, IGT_CONNECTOR_CRTC_ID, idx == PIPE_NONE ? 0 : display->pipes[idx].crtc_id);
 
 	igt_output_refresh(output);
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b534ae64..bcef88b6 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -362,7 +362,7 @@ typedef struct {
 	struct kmstest_connector_config config;
 	char *name;
 	bool force_reprobe;
-	enum pipe pending_pipe;
+	int pending_pipe;
 	bool use_override_mode;
 	drmModeModeInfo override_mode;
 
@@ -415,7 +415,7 @@ void igt_display_require_output_on_pipe(igt_display_t *display, enum pipe pipe);
 const char *igt_output_name(igt_output_t *output);
 drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
 void igt_output_override_mode(igt_output_t *output, const drmModeModeInfo *mode);
-void igt_output_set_pipe(igt_output_t *output, enum pipe pipe);
+void igt_output_set_pipe(igt_output_t *output, int idx);
 igt_plane_t *igt_output_get_plane(igt_output_t *output, int plane_idx);
 igt_plane_t *igt_output_get_plane_type(igt_output_t *output, int plane_type);
 int igt_output_count_plane_type(igt_output_t *output, int plane_type);
@@ -467,9 +467,9 @@ static inline bool igt_output_is_connected(igt_output_t *output)
  *
  * Checks whether the given pipe and output can be used together.
  */
-#define igt_pipe_connector_valid(pipe, output) \
+#define igt_pipe_connector_valid(idx, output) \
 	(igt_output_is_connected((output)) && \
-	       (output->config.valid_crtc_idx_mask & (1 << (pipe))))
+	       (output->config.valid_crtc_idx_mask & (1 << (idx))))
 
 #define for_each_if(condition) if (!(condition)) {} else
 
@@ -517,7 +517,7 @@ static inline bool igt_output_is_connected(igt_output_t *output)
 /**
  * for_each_pipe_with_valid_output:
  * @display: a pointer to an #igt_display_t structure
- * @pipe: The pipe for which this @pipe / @output combination is valid.
+ * @idx: The CRTC index for which this @pipe / @output combination is valid.
  * @output: The output for which this @pipe / @output combination is valid.
  *
  * This for loop is called over all connected outputs. This function
@@ -527,12 +527,12 @@ static inline bool igt_output_is_connected(igt_output_t *output)
  * for_each_pipe_with_single_output(), if you only need an
  * output for a single pipe, use igt_get_single_output_for_pipe().
  */
-#define for_each_pipe_with_valid_output(display, pipe, output) \
-	for (int con__ = (pipe) = 0; \
-	     assert(igt_can_fail()), (pipe) < igt_display_get_n_pipes((display)) && con__ < (display)->n_outputs; \
-	     con__ = (con__ + 1 < (display)->n_outputs) ? con__ + 1 : (pipe = pipe + 1, 0)) \
+#define for_each_pipe_with_valid_output(display, idx, output) \
+	for (int con__ = (idx) = 0; \
+	     assert(igt_can_fail()), (idx) < igt_display_get_n_pipes((display)) && con__ < (display)->n_outputs; \
+	     con__ = (con__ + 1 < (display)->n_outputs) ? con__ + 1 : (idx = idx + 1, 0)) \
 		for_each_if ((((output) = &(display)->outputs[con__]), \
-			     igt_pipe_connector_valid((pipe), (output))))
+			     igt_pipe_connector_valid((idx), (output))))
 
 igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
 					   igt_output_t **chosen_outputs);
@@ -568,9 +568,9 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
 	for_each_connected_output((display), (output)) \
 		for_each_if (igt_pipe_connector_valid((pipe), (output)))
 
-#define for_each_plane_on_pipe(display, pipe, plane)			\
-	for (int j__ = 0; assert(igt_can_fail()), (plane) = &(display)->pipes[(pipe)].planes[j__], \
-		     j__ < (display)->pipes[(pipe)].n_planes; j__++)
+#define for_each_plane_on_pipe(display, idx, plane)			\
+	for (int j__ = 0; assert(igt_can_fail()), (plane) = &(display)->pipes[(idx)].planes[j__], \
+		     j__ < (display)->pipes[(idx)].n_planes; j__++)
 
 #define IGT_FIXED(i,f)	((i) << 16 | (f))
 
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 44f01109..e391eb62 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -51,7 +51,7 @@ pthread_t *thread;
 int *seqno;
 
 static void
-run_primary_test(igt_display_t *display, enum pipe pipe, igt_output_t *output)
+run_primary_test(igt_display_t *display, int idx, igt_output_t *output)
 {
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
@@ -59,7 +59,7 @@ run_primary_test(igt_display_t *display, enum pipe pipe, igt_output_t *output)
 	int i, ret;
 	unsigned flags = DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET;
 
-	igt_output_set_pipe(output, pipe);
+	igt_output_set_pipe(output, idx);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
 	mode = igt_output_get_mode(output);
@@ -77,13 +77,13 @@ run_primary_test(igt_display_t *display, enum pipe pipe, igt_output_t *output)
 		igt_display_commit2(display, COMMIT_ATOMIC);
 
 		if (!(i & 1))
-			igt_wait_for_vblank(display->drm_fd, pipe);
+			igt_wait_for_vblank(display->drm_fd, idx);
 
 		igt_plane_set_fb(primary, (i & 1) ? &fb : NULL);
 		igt_display_commit2(display, COMMIT_ATOMIC);
 
 		if (i & 1)
-			igt_wait_for_vblank(display->drm_fd, pipe);
+			igt_wait_for_vblank(display->drm_fd, idx);
 
 		igt_plane_set_fb(primary, (i & 1) ? NULL : &fb);
 	}
@@ -119,7 +119,7 @@ static void configure_fencing(igt_plane_t *plane)
 }
 
 static int
-wm_setup_plane(igt_display_t *display, enum pipe pipe,
+wm_setup_plane(igt_display_t *display, int idx,
 	       uint32_t mask, struct plane_parms *parms, bool fencing)
 {
 	igt_plane_t *plane;
@@ -130,7 +130,7 @@ wm_setup_plane(igt_display_t *display, enum pipe pipe,
 	* because most of the modeset operations must be fast
 	* later on.
 	*/
-	for_each_plane_on_pipe(display, pipe, plane) {
+	for_each_plane_on_pipe(display, idx, plane) {
 		int i = plane->index;
 
 		if (!mask || !(parms[i].mask & mask)) {
@@ -171,13 +171,13 @@ enum transition_type {
 	TRANSITION_MODESET_DISABLE,
 };
 
-static void set_sprite_wh(igt_display_t *display, enum pipe pipe,
+static void set_sprite_wh(igt_display_t *display, int idx,
 			  struct plane_parms *parms, struct igt_fb *sprite_fb,
 			  bool alpha, unsigned w, unsigned h)
 {
 	igt_plane_t *plane;
 
-	for_each_plane_on_pipe(display, pipe, plane) {
+	for_each_plane_on_pipe(display, idx, plane) {
 		int i = plane->index;
 
 		if (plane->type == DRM_PLANE_TYPE_PRIMARY ||
@@ -203,7 +203,7 @@ static void set_sprite_wh(igt_display_t *display, enum pipe pipe,
 #define is_atomic_check_plane_size_errno(errno) \
 		(errno == -EINVAL)
 
-static void setup_parms(igt_display_t *display, enum pipe pipe,
+static void setup_parms(igt_display_t *display, int idx,
 			const drmModeModeInfo *mode,
 			struct igt_fb *primary_fb,
 			struct igt_fb *argb_fb,
@@ -214,7 +214,7 @@ static void setup_parms(igt_display_t *display, enum pipe pipe,
 	uint64_t cursor_width, cursor_height;
 	unsigned sprite_width, sprite_height, prev_w, prev_h;
 	bool max_sprite_width, max_sprite_height, alpha = true;
-	uint32_t n_planes = display->pipes[pipe].n_planes;
+	uint32_t n_planes = display->pipes[idx].n_planes;
 	uint32_t n_overlays = 0, overlays[n_planes];
 	igt_plane_t *plane;
 	uint32_t iter_mask = 3;
@@ -227,7 +227,7 @@ static void setup_parms(igt_display_t *display, enum pipe pipe,
 	if (cursor_height >= mode->vdisplay)
 		cursor_height = mode->vdisplay;
 
-	for_each_plane_on_pipe(display, pipe, plane) {
+	for_each_plane_on_pipe(display, idx, plane) {
 		int i = plane->index;
 
 		if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
@@ -293,10 +293,10 @@ static void setup_parms(igt_display_t *display, enum pipe pipe,
 	while (!max_sprite_width && !max_sprite_height) {
 		int ret;
 
-		set_sprite_wh(display, pipe, parms, sprite_fb,
+		set_sprite_wh(display, idx, parms, sprite_fb,
 			      alpha, sprite_width, sprite_height);
 
-		wm_setup_plane(display, pipe, (1 << n_planes) - 1, parms, false);
+		wm_setup_plane(display, idx, (1 << n_planes) - 1, parms, false);
 		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 		igt_assert(!is_atomic_check_failure_errno(ret));
 
@@ -325,7 +325,7 @@ static void setup_parms(igt_display_t *display, enum pipe pipe,
 			igt_assert_f(n_planes >= 3, "No planes left to proceed with!");
 			if (n_overlays > 0) {
 				uint32_t plane_to_remove = hars_petruska_f54_1_random_unsafe_max(n_overlays);
-				removed_plane = &display->pipes[pipe].planes[overlays[plane_to_remove]];
+				removed_plane = &display->pipes[idx].planes[overlays[plane_to_remove]];
 				igt_plane_set_fb(removed_plane, NULL);
 				while (plane_to_remove < (n_overlays - 1)) {
 					overlays[plane_to_remove] = overlays[plane_to_remove + 1];
@@ -351,22 +351,22 @@ static void setup_parms(igt_display_t *display, enum pipe pipe,
 			max_sprite_height = true;
 	}
 
-	set_sprite_wh(display, pipe, parms, sprite_fb,
+	set_sprite_wh(display, idx, parms, sprite_fb,
 			alpha, sprite_width, sprite_height);
 
 	igt_info("Running test on pipe %s with resolution %dx%d and sprite size %dx%d alpha %i\n",
-		 kmstest_pipe_name(pipe), mode->hdisplay, mode->vdisplay,
+		 kmstest_pipe_name(display->pipes[idx].pipe), mode->hdisplay, mode->vdisplay,
 		 sprite_width, sprite_height, alpha);
 }
 
-static void prepare_fencing(igt_display_t *display, enum pipe pipe)
+static void prepare_fencing(igt_display_t *display, int idx)
 {
 	igt_plane_t *plane;
 	int n_planes;
 
 	igt_require_sw_sync();
 
-	n_planes = display->pipes[pipe].n_planes;
+	n_planes = display->pipes[idx].n_planes;
 	timeline = calloc(sizeof(*timeline), n_planes);
 	igt_assert_f(timeline != NULL, "Failed to allocate memory for timelines\n");
 	thread = calloc(sizeof(*thread), n_planes);
@@ -374,15 +374,15 @@ static void prepare_fencing(igt_display_t *display, enum pipe pipe)
 	seqno = calloc(sizeof(*seqno), n_planes);
 	igt_assert_f(seqno != NULL, "Failed to allocate memory for seqno\n");
 
-	for_each_plane_on_pipe(display, pipe, plane)
+	for_each_plane_on_pipe(display, idx, plane)
 		timeline[plane->index] = sw_sync_timeline_create();
 }
 
-static void unprepare_fencing(igt_display_t *display, enum pipe pipe)
+static void unprepare_fencing(igt_display_t *display, int idx)
 {
 	igt_plane_t *plane;
 
-	for_each_plane_on_pipe(display, pipe, plane)
+	for_each_plane_on_pipe(display, idx, plane)
 		close(timeline[plane->index]);
 
 	free(timeline);
@@ -390,10 +390,10 @@ static void unprepare_fencing(igt_display_t *display, enum pipe pipe)
 	free(seqno);
 }
 
-static void atomic_commit(igt_display_t *display, enum pipe pipe, unsigned int flags, void *data, bool fencing)
+static void atomic_commit(igt_display_t *display, int idx, unsigned int flags, void *data, bool fencing)
 {
 	if (fencing)
-		igt_pipe_request_out_fence(&display->pipes[pipe]);
+		igt_pipe_request_out_fence(&display->pipes[idx]);
 
 	igt_display_commit_atomic(display, flags, data);
 }
@@ -408,10 +408,10 @@ static int fd_completed(int fd)
 	return ret;
 }
 
-static void wait_for_transition(igt_display_t *display, enum pipe pipe, bool nonblocking, bool fencing)
+static void wait_for_transition(igt_display_t *display, int idx, bool nonblocking, bool fencing)
 {
 	if (fencing) {
-		int fence_fd = display->pipes[pipe].out_fence_fd;
+		int fence_fd = display->pipes[idx].out_fence_fd;
 
 		if (!nonblocking)
 			igt_assert(fd_completed(fence_fd));
@@ -435,20 +435,20 @@ static void wait_for_transition(igt_display_t *display, enum pipe pipe, bool non
  * so test this and make sure it works.
  */
 static void
-run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output,
+run_transition_test(igt_display_t *display, int idx, igt_output_t *output,
 		enum transition_type type, bool nonblocking, bool fencing)
 {
 	struct igt_fb fb, argb_fb, sprite_fb;
 	drmModeModeInfo *mode, override_mode;
 	igt_plane_t *plane;
-	igt_pipe_t *pipe_obj = &display->pipes[pipe];
+	igt_pipe_t *pipe_obj = &display->pipes[idx];
 	uint32_t iter_max, i;
 	struct plane_parms parms[pipe_obj->n_planes];
 	unsigned flags = 0;
 	int ret;
 
 	if (fencing)
-		prepare_fencing(display, pipe);
+		prepare_fencing(display, idx);
 	else
 		flags |= DRM_MODE_PAGE_FLIP_EVENT;
 
@@ -466,21 +466,21 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 	igt_create_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
 		      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, &fb);
 
-	igt_output_set_pipe(output, pipe);
+	igt_output_set_pipe(output, idx);
 
-	wm_setup_plane(display, pipe, 0, NULL, false);
+	wm_setup_plane(display, idx, 0, NULL, false);
 
 	if (flags & DRM_MODE_ATOMIC_ALLOW_MODESET) {
 		igt_output_set_pipe(output, PIPE_NONE);
 
 		igt_display_commit2(display, COMMIT_ATOMIC);
 
-		igt_output_set_pipe(output, pipe);
+		igt_output_set_pipe(output, idx);
 	}
 
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
-	setup_parms(display, pipe, mode, &fb, &argb_fb, &sprite_fb, parms, &iter_max);
+	setup_parms(display, idx, mode, &fb, &argb_fb, &sprite_fb, parms, &iter_max);
 
 	/*
 	 * In some configurations the tests may not run to completion with all
@@ -488,7 +488,7 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 	 * planes to fix this
 	 */
 	while (1) {
-		wm_setup_plane(display, pipe, iter_max - 1, parms, false);
+		wm_setup_plane(display, idx, iter_max - 1, parms, false);
 
 		if (fencing)
 			igt_pipe_request_out_fence(pipe_obj);
@@ -500,7 +500,7 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 			break;
 
 		ret = 0;
-		for_each_plane_on_pipe(display, pipe, plane) {
+		for_each_plane_on_pipe(display, idx, plane) {
 			i = plane->index;
 
 			if (plane->type == DRM_PLANE_TYPE_PRIMARY ||
@@ -522,16 +522,16 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 	if (type == TRANSITION_AFTER_FREE) {
 		int fence_fd = -1;
 
-		wm_setup_plane(display, pipe, 0, parms, fencing);
+		wm_setup_plane(display, idx, 0, parms, fencing);
 
-		atomic_commit(display, pipe, flags, (void *)(unsigned long)0, fencing);
+		atomic_commit(display, idx, flags, (void *)(unsigned long)0, fencing);
 		if (fencing) {
 			fence_fd = pipe_obj->out_fence_fd;
 			pipe_obj->out_fence_fd = -1;
 		}
 
 		/* force planes to be part of commit */
-		for_each_plane_on_pipe(display, pipe, plane) {
+		for_each_plane_on_pipe(display, idx, plane) {
 			if (parms[plane->index].mask)
 				igt_plane_set_position(plane, 0, 0);
 		}
@@ -543,7 +543,7 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 			close(fence_fd);
 		} else {
 			igt_assert(fd_completed(display->drm_fd));
-			wait_for_transition(display, pipe, false, fencing);
+			wait_for_transition(display, idx, false, fencing);
 		}
 		goto cleanup;
 	}
@@ -556,22 +556,22 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 		    n_enable_planes < pipe_obj->n_planes)
 			continue;
 
-		igt_output_set_pipe(output, pipe);
+		igt_output_set_pipe(output, idx);
 
-		if (!wm_setup_plane(display, pipe, i, parms, fencing))
+		if (!wm_setup_plane(display, idx, i, parms, fencing))
 			continue;
 
-		atomic_commit(display, pipe, flags, (void *)(unsigned long)i, fencing);
-		wait_for_transition(display, pipe, nonblocking, fencing);
+		atomic_commit(display, idx, flags, (void *)(unsigned long)i, fencing);
+		wait_for_transition(display, idx, nonblocking, fencing);
 
 		if (type == TRANSITION_MODESET_DISABLE) {
 			igt_output_set_pipe(output, PIPE_NONE);
 
-			if (!wm_setup_plane(display, pipe, 0, parms, fencing))
+			if (!wm_setup_plane(display, idx, 0, parms, fencing))
 				continue;
 
-			atomic_commit(display, pipe, flags, (void *) 0UL, fencing);
-			wait_for_transition(display, pipe, nonblocking, fencing);
+			atomic_commit(display, idx, flags, (void *) 0UL, fencing);
+			wait_for_transition(display, idx, nonblocking, fencing);
 		} else {
 			uint32_t j;
 
@@ -584,34 +584,34 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 				    n_enable_planes < pipe_obj->n_planes)
 					continue;
 
-				if (!wm_setup_plane(display, pipe, j, parms, fencing))
+				if (!wm_setup_plane(display, idx, j, parms, fencing))
 					continue;
 
 				if (type >= TRANSITION_MODESET)
 					igt_output_override_mode(output, &override_mode);
 
-				atomic_commit(display, pipe, flags, (void *)(unsigned long) j, fencing);
-				wait_for_transition(display, pipe, nonblocking, fencing);
+				atomic_commit(display, idx, flags, (void *)(unsigned long) j, fencing);
+				wait_for_transition(display, idx, nonblocking, fencing);
 
-				if (!wm_setup_plane(display, pipe, i, parms, fencing))
+				if (!wm_setup_plane(display, idx, i, parms, fencing))
 					continue;
 
 				if (type >= TRANSITION_MODESET)
 					igt_output_override_mode(output, NULL);
 
-				atomic_commit(display, pipe, flags, (void *)(unsigned long) i, fencing);
-				wait_for_transition(display, pipe, nonblocking, fencing);
+				atomic_commit(display, idx, flags, (void *)(unsigned long) i, fencing);
+				wait_for_transition(display, idx, nonblocking, fencing);
 			}
 		}
 	}
 
 cleanup:
 	if (fencing)
-		unprepare_fencing(display, pipe);
+		unprepare_fencing(display, idx);
 
 	igt_output_set_pipe(output, PIPE_NONE);
 
-	for_each_plane_on_pipe(display, pipe, plane)
+	for_each_plane_on_pipe(display, idx, plane)
 		igt_plane_set_fb(plane, NULL);
 
 	igt_display_commit2(display, COMMIT_ATOMIC);
@@ -662,29 +662,29 @@ static void commit_display(igt_display_t *display, unsigned event_mask, bool non
 static unsigned set_combinations(igt_display_t *display, unsigned mask, struct igt_fb *fb)
 {
 	igt_output_t *output;
-	enum pipe pipe;
+	int idx = 0;
 	unsigned event_mask = 0;
 
 	for_each_connected_output(display, output)
 		igt_output_set_pipe(output, PIPE_NONE);
 
-	for_each_pipe(display, pipe) {
-		igt_plane_t *plane = igt_pipe_get_plane_type(&display->pipes[pipe],
+	for_each_pipe(display, idx) {
+		igt_plane_t *plane = igt_pipe_get_plane_type(&display->pipes[idx],
 			DRM_PLANE_TYPE_PRIMARY);
 		drmModeModeInfo *mode = NULL;
 
-		if (!(mask & (1 << pipe))) {
-			if (igt_pipe_is_prop_changed(display, pipe, IGT_CRTC_ACTIVE)) {
-				event_mask |= 1 << pipe;
+		if (!(mask & (1 << idx))) {
+			if (igt_pipe_is_prop_changed(display, idx, IGT_CRTC_ACTIVE)) {
+				event_mask |= 1 << idx;
 				igt_plane_set_fb(plane, NULL);
 			}
 
 			continue;
 		}
 
-		event_mask |= 1 << pipe;
+		event_mask |= 1 << idx;
 
-		for_each_valid_output_on_pipe(display, pipe, output) {
+		for_each_valid_output_on_pipe(display, idx, output) {
 			if (output->pending_pipe != PIPE_NONE)
 				continue;
 
@@ -695,7 +695,7 @@ static unsigned set_combinations(igt_display_t *display, unsigned mask, struct i
 		if (!mode)
 			return 0;
 
-		igt_output_set_pipe(output, pipe);
+		igt_output_set_pipe(output, idx);
 		igt_plane_set_fb(plane, fb);
 		igt_fb_set_size(fb, plane, mode->hdisplay, mode->vdisplay);
 		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
@@ -706,14 +706,14 @@ static unsigned set_combinations(igt_display_t *display, unsigned mask, struct i
 
 static void refresh_primaries(igt_display_t *display, int mask)
 {
-	enum pipe pipe;
+	int idx;
 	igt_plane_t *plane;
 
-	for_each_pipe(display, pipe) {
-		if (!((1 << pipe) & mask))
+	for_each_pipe(display, idx) {
+		if (!((1 << idx) & mask))
 			continue;
 
-		for_each_plane_on_pipe(display, pipe, plane)
+		for_each_plane_on_pipe(display, idx, plane)
 			if (plane->type == DRM_PLANE_TYPE_PRIMARY)
 				igt_plane_set_position(plane, 0, 0);
 	}
@@ -862,20 +862,20 @@ static void run_modeset_transition(igt_display_t *display, int requested_outputs
 {
 	igt_output_t *outputs[IGT_MAX_PIPES] = {};
 	int num_outputs = 0;
-	enum pipe pipe;
+	int idx;
 
-	for_each_pipe(display, pipe) {
+	for_each_pipe(display, idx) {
 		igt_output_t *output;
 
-		for_each_valid_output_on_pipe(display, pipe, output) {
+		for_each_valid_output_on_pipe(display, idx, output) {
 			int i;
 
-			for (i = pipe - 1; i >= 0; i--)
+			for (i = idx - 1; i >= 0; i--)
 				if (outputs[i] == output)
 					break;
 
 			if (i < 0) {
-				outputs[pipe] = output;
+				outputs[idx] = output;
 				num_outputs++;
 				break;
 			}
@@ -906,8 +906,7 @@ igt_main
 {
 	igt_display_t display;
 	igt_output_t *output;
-	enum pipe pipe;
-	int i;
+	int i, idx = 0;
 
 	igt_fixture {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -921,32 +920,31 @@ igt_main
 	}
 
 	igt_subtest("plane-primary-toggle-with-vblank-wait")
-		for_each_pipe_with_valid_output(&display, pipe, output)
-			run_primary_test(&display, pipe, output);
+		for_each_pipe_with_valid_output(&display, idx, output)
+			run_primary_test(&display, idx, output);
 
 	igt_subtest("plane-all-transition")
-		for_each_pipe_with_valid_output(&display, pipe, output)
-			run_transition_test(&display, pipe, output, TRANSITION_PLANES, false, false);
-
+		for_each_pipe_with_valid_output(&display, idx, output)
+			run_transition_test(&display, idx, output, TRANSITION_PLANES, false, false);
 	igt_subtest("plane-all-transition-fencing")
-		for_each_pipe_with_valid_output(&display, pipe, output)
-			run_transition_test(&display, pipe, output, TRANSITION_PLANES, false, true);
+		for_each_pipe_with_valid_output(&display, idx, output)
+			run_transition_test(&display, idx, output, TRANSITION_PLANES, false, true);
 
 	igt_subtest("plane-all-transition-nonblocking")
-		for_each_pipe_with_valid_output(&display, pipe, output)
-			run_transition_test(&display, pipe, output, TRANSITION_PLANES, true, false);
+		for_each_pipe_with_valid_output(&display, idx, output)
+			run_transition_test(&display, idx, output, TRANSITION_PLANES, true, false);
 
 	igt_subtest("plane-all-transition-nonblocking-fencing")
-		for_each_pipe_with_valid_output(&display, pipe, output)
-			run_transition_test(&display, pipe, output, TRANSITION_PLANES, true, true);
+		for_each_pipe_with_valid_output(&display, idx, output)
+			run_transition_test(&display, idx, output, TRANSITION_PLANES, true, true);
 
 	igt_subtest("plane-use-after-nonblocking-unbind")
-		for_each_pipe_with_valid_output(&display, pipe, output)
-			run_transition_test(&display, pipe, output, TRANSITION_AFTER_FREE, true, false);
+		for_each_pipe_with_valid_output(&display, idx, output)
+			run_transition_test(&display, idx, output, TRANSITION_AFTER_FREE, true, false);
 
 	igt_subtest("plane-use-after-nonblocking-unbind-fencing")
-		for_each_pipe_with_valid_output(&display, pipe, output)
-			run_transition_test(&display, pipe, output, TRANSITION_AFTER_FREE, true, true);
+		for_each_pipe_with_valid_output(&display, idx, output)
+			run_transition_test(&display, idx, output, TRANSITION_AFTER_FREE, true, true);
 
 	/*
 	 * Test modeset cases on internal panels separately with a reduced
@@ -954,26 +952,26 @@ igt_main
 	 * panels with long power cycle delays.
 	 */
 	igt_subtest("plane-all-modeset-transition")
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_valid_output(&display, idx, output) {
 			if (output_is_internal_panel(output))
 				continue;
-			run_transition_test(&display, pipe, output, TRANSITION_MODESET, false, false);
+			run_transition_test(&display, idx, output, TRANSITION_MODESET, false, false);
 		}
 
 	igt_subtest("plane-all-modeset-transition-fencing")
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_valid_output(&display, idx, output) {
 			if (output_is_internal_panel(output))
 				continue;
-			run_transition_test(&display, pipe, output, TRANSITION_MODESET, false, true);
+			run_transition_test(&display, idx, output, TRANSITION_MODESET, false, true);
 		}
 
 	igt_subtest("plane-all-modeset-transition-internal-panels") {
 		int tested = 0;
 
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_valid_output(&display, idx, output) {
 			if (!output_is_internal_panel(output))
 				continue;
-			run_transition_test(&display, pipe, output, TRANSITION_MODESET_FAST, false, false);
+			run_transition_test(&display, idx, output, TRANSITION_MODESET_FAST, false, false);
 			tested++;
 		}
 		igt_skip_on_f(!tested, "No output with internal panel found\n");
@@ -982,20 +980,20 @@ igt_main
 	igt_subtest("plane-all-modeset-transition-fencing-internal-panels") {
 		int tested = 0;
 
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_valid_output(&display, idx, output) {
 			if (!output_is_internal_panel(output))
 				continue;
-			run_transition_test(&display, pipe, output, TRANSITION_MODESET_FAST, false, true);
+			run_transition_test(&display, idx, output, TRANSITION_MODESET_FAST, false, true);
 			tested++;
 		}
 		igt_skip_on_f(!tested, "No output with internal panel found\n");
 	}
 
 	igt_subtest("plane-toggle-modeset-transition")
-		for_each_pipe_with_valid_output(&display, pipe, output)
-			run_transition_test(&display, pipe, output, TRANSITION_MODESET_DISABLE, false, false);
+		for_each_pipe_with_valid_output(&display, idx, output)
+			run_transition_test(&display, idx, output, TRANSITION_MODESET_DISABLE, false, false);
 
-	for (i = 1; i <= IGT_MAX_PIPES; i++) {
+	for (i = 1; i <= display.n_pipes; i++) {
 		igt_subtest_f("%ix-modeset-transitions", i)
 			run_modeset_transition(&display, i, false, false);
 
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
