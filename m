Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C678B89349
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Jan 2021 11:00:13 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Tue,  5 Jan 2021 16:38:43 +0530
Message-Id: <20210105110843.29189-1-nidhi1.gupta@intel.com>
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
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

v1: All the subtests are using for_each_pipe_with_valid_output
function which will execute on all the possible
combination of pipe and output to reduce the execution
time replaced the function with
for_each_pipe_with_single_output this will loop over all
the pipes but at most once.

v2: kms_atomic_transition test is taking minimum of
69.5s time to execute on CI. To reduce the execution
time this patch will add the change which will run
the test on 1 HDR plane, 1 SDR UV plane, 1 SDR Y plane
and skip the rest of the planes.

v3: combined v1 and v2 in one patch.

v4: -restricted execution of all the subtests to
    2 pipes. (Uma)
    -Modified skip_plane() function. (Uma)

v5: -added a extended flag, if it is set but the user
    test will be executed on all the pipes otherwise will be
    executed only on 2 pipes. (Karthik)

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_atomic_transition.c | 136 +++++++++++++++++++++++++++-------
 1 file changed, 110 insertions(+), 26 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 02206f0a..1d0faa67 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -50,6 +50,10 @@ int *timeline;
 pthread_t *thread;
 int *seqno;
 
+typedef struct {
+	bool extended;
+} data_t;
+
 static void
 run_primary_test(igt_display_t *display, enum pipe pipe, igt_output_t *output)
 {
@@ -120,8 +124,35 @@ static void configure_fencing(igt_plane_t *plane)
 	igt_assert_eq(ret, 0);
 }
 
+static bool skip_plane(igt_display_t *display, data_t *data, igt_plane_t *plane)
+{
+	int index = plane->index;
+
+	if (data->extended)
+		return false;
+
+	if (!is_i915_device(display->drm_fd))
+		return false;
+
+	if (plane->type == DRM_PLANE_TYPE_CURSOR)
+		return false;
+
+	if (intel_gen(intel_get_drm_devid(display->drm_fd)) < 11)
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
+wm_setup_plane(igt_display_t *display, data_t *data, enum pipe pipe,
 	       uint32_t mask, struct plane_parms *parms, bool fencing)
 {
 	igt_plane_t *plane;
@@ -135,6 +166,9 @@ wm_setup_plane(igt_display_t *display, enum pipe pipe,
 	for_each_plane_on_pipe(display, pipe, plane) {
 		int i = plane->index;
 
+		if (skip_plane(display, data, plane))
+			continue;
+
 		if (!mask || !(parms[i].mask & mask)) {
 			if (plane->values[IGT_PLANE_FB_ID]) {
 				igt_plane_set_fb(plane, NULL);
@@ -205,7 +239,8 @@ static void set_sprite_wh(igt_display_t *display, enum pipe pipe,
 #define is_atomic_check_plane_size_errno(errno) \
 		(errno == -EINVAL)
 
-static void setup_parms(igt_display_t *display, enum pipe pipe,
+static void setup_parms(igt_display_t *display, data_t *data,
+			enum pipe pipe,
 			const drmModeModeInfo *mode,
 			struct igt_fb *primary_fb,
 			struct igt_fb *argb_fb,
@@ -298,7 +333,7 @@ static void setup_parms(igt_display_t *display, enum pipe pipe,
 		set_sprite_wh(display, pipe, parms, sprite_fb,
 			      alpha, sprite_width, sprite_height);
 
-		wm_setup_plane(display, pipe, (1 << n_planes) - 1, parms, false);
+		wm_setup_plane(display, data, pipe, (1 << n_planes) - 1, parms, false);
 		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 		igt_assert(!is_atomic_check_failure_errno(ret));
 
@@ -437,7 +472,7 @@ static void wait_for_transition(igt_display_t *display, enum pipe pipe, bool non
  * so test this and make sure it works.
  */
 static void
-run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output,
+run_transition_test(igt_display_t *display, data_t *data, enum pipe pipe, igt_output_t *output,
 		enum transition_type type, bool nonblocking, bool fencing)
 {
 	struct igt_fb fb, argb_fb, sprite_fb;
@@ -470,7 +505,7 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 
 	igt_output_set_pipe(output, pipe);
 
-	wm_setup_plane(display, pipe, 0, NULL, false);
+	wm_setup_plane(display, data, pipe, 0, NULL, false);
 
 	if (flags & DRM_MODE_ATOMIC_ALLOW_MODESET) {
 		igt_output_set_pipe(output, PIPE_NONE);
@@ -482,7 +517,7 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
-	setup_parms(display, pipe, mode, &fb, &argb_fb, &sprite_fb, parms, &iter_max);
+	setup_parms(display, data, pipe, mode, &fb, &argb_fb, &sprite_fb, parms, &iter_max);
 
 	/*
 	 * In some configurations the tests may not run to completion with all
@@ -490,7 +525,7 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 	 * planes to fix this
 	 */
 	while (1) {
-		wm_setup_plane(display, pipe, iter_max - 1, parms, false);
+		wm_setup_plane(display, data, pipe, iter_max - 1, parms, false);
 
 		if (fencing)
 			igt_pipe_request_out_fence(pipe_obj);
@@ -524,7 +559,7 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 	if (type == TRANSITION_AFTER_FREE) {
 		int fence_fd = -1;
 
-		wm_setup_plane(display, pipe, 0, parms, fencing);
+		wm_setup_plane(display, data, pipe, 0, parms, fencing);
 
 		atomic_commit(display, pipe, flags, (void *)(unsigned long)0, fencing);
 		if (fencing) {
@@ -560,7 +595,7 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 
 		igt_output_set_pipe(output, pipe);
 
-		if (!wm_setup_plane(display, pipe, i, parms, fencing))
+		if (!wm_setup_plane(display, data, pipe, i, parms, fencing))
 			continue;
 
 		atomic_commit(display, pipe, flags, (void *)(unsigned long)i, fencing);
@@ -569,7 +604,7 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 		if (type == TRANSITION_MODESET_DISABLE) {
 			igt_output_set_pipe(output, PIPE_NONE);
 
-			if (!wm_setup_plane(display, pipe, 0, parms, fencing))
+			if (!wm_setup_plane(display, data, pipe, 0, parms, fencing))
 				continue;
 
 			atomic_commit(display, pipe, flags, (void *) 0UL, fencing);
@@ -586,7 +621,7 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 				    n_enable_planes < pipe_obj->n_planes)
 					continue;
 
-				if (!wm_setup_plane(display, pipe, j, parms, fencing))
+				if (!wm_setup_plane(display, data, pipe, j, parms, fencing))
 					continue;
 
 				if (type >= TRANSITION_MODESET)
@@ -595,7 +630,7 @@ run_transition_test(igt_display_t *display, enum pipe pipe, igt_output_t *output
 				atomic_commit(display, pipe, flags, (void *)(unsigned long) j, fencing);
 				wait_for_transition(display, pipe, nonblocking, fencing);
 
-				if (!wm_setup_plane(display, pipe, i, parms, fencing))
+				if (!wm_setup_plane(display, data, pipe, i, parms, fencing))
 					continue;
 
 				if (type >= TRANSITION_MODESET)
@@ -913,7 +948,30 @@ static bool output_is_internal_panel(igt_output_t *output)
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
 	igt_display_t display;
 	igt_output_t *output;
@@ -935,48 +993,63 @@ igt_main
 	}
 
 	igt_subtest("plane-primary-toggle-with-vblank-wait")
-		for_each_pipe_with_valid_output(&display, pipe, output)
+		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2 && !data.extended)
+				break;
 			run_primary_test(&display, pipe, output);
+		}
 
 	igt_subtest_with_dynamic("plane-all-transition") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2 && !data.extended)
+				break;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&display, pipe, output, TRANSITION_PLANES, false, false);
+				run_transition_test(&display, &data, pipe, output, TRANSITION_PLANES, false, false);
 		}
 	}
 
 	igt_subtest_with_dynamic("plane-all-transition-fencing") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2 && !data.extended)
+				break;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&display, pipe, output, TRANSITION_PLANES, false, true);
+				run_transition_test(&display, &data, pipe, output, TRANSITION_PLANES, false, true);
 		}
 	}
 
 	igt_subtest_with_dynamic("plane-all-transition-nonblocking") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2 && !data.extended)
+				break;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&display, pipe, output, TRANSITION_PLANES, true, false);
+				run_transition_test(&display, &data, pipe, output, TRANSITION_PLANES, true, false);
 		}
 	}
 
 	igt_subtest_with_dynamic("plane-all-transition-nonblocking-fencing") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2 && data.extended)
+				break;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&display, pipe, output, TRANSITION_PLANES, true, true);
+				run_transition_test(&display, &data, pipe, output, TRANSITION_PLANES, true, true);
 		}
 	}
 
 	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2 && !data.extended)
+				break;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&display, pipe, output, TRANSITION_AFTER_FREE, true, false);
+				run_transition_test(&display, &data, pipe, output, TRANSITION_AFTER_FREE, true, false);
 		}
 	}
 
 	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind-fencing") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2 && !data.extended)
+				break;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&display, pipe, output, TRANSITION_AFTER_FREE, true, true);
+				run_transition_test(&display, &data, pipe, output, TRANSITION_AFTER_FREE, true, true);
 		}
 	}
 
@@ -987,45 +1060,56 @@ igt_main
 	 */
 	igt_subtest_with_dynamic("plane-all-modeset-transition")
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2 && !data.extended)
+				break;
 			if (output_is_internal_panel(output))
 				continue;
 
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&display, pipe, output, TRANSITION_MODESET, false, false);
+				run_transition_test(&display, &data, pipe, output, TRANSITION_MODESET, false, false);
 		}
 
 	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing")
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2 && !data.extended)
+				break;
 			if (output_is_internal_panel(output))
 				continue;
 
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&display, pipe, output, TRANSITION_MODESET, false, true);
+				run_transition_test(&display, &data, pipe, output, TRANSITION_MODESET, false, true);
 		}
 
 	igt_subtest_with_dynamic("plane-all-modeset-transition-internal-panels") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2 && !data.extended)
+				break;
 			if (!output_is_internal_panel(output))
 				continue;
 
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&display, pipe, output, TRANSITION_MODESET_FAST, false, false);
+				run_transition_test(&display, &data, pipe, output, TRANSITION_MODESET_FAST, false, false);
 		}
 	}
 
 	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing-internal-panels") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2 && !data.extended)
+				break;
 			if (!output_is_internal_panel(output))
 				continue;
 
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				run_transition_test(&display, pipe, output, TRANSITION_MODESET_FAST, false, true);
+				run_transition_test(&display, &data, pipe, output, TRANSITION_MODESET_FAST, false, true);
 		}
 	}
 
 	igt_subtest("plane-toggle-modeset-transition")
-		for_each_pipe_with_valid_output(&display, pipe, output)
-			run_transition_test(&display, pipe, output, TRANSITION_MODESET_DISABLE, false, false);
+		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2 && !data.extended)
+				break;
+			run_transition_test(&display, &data, pipe, output, TRANSITION_MODESET_DISABLE, false, false);
+		}
 
 	igt_subtest_with_dynamic("modeset-transition") {
 		for (i = 1; i <= count; i++) {
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
