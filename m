Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A118F6EC4A
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Dec 2020 05:58:38 +0000 (UTC)
From: nidhi1.gupta@intel.com
Date: Fri, 11 Dec 2020 11:37:06 +0530
Message-Id: <20201211060706.14347-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_atomic_transition:reduce
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
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>, juha-pekka.heikkila@intel.com, uma.shanker@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Nidhi Gupta <nidhi1.gupta@intel.com>

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

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_atomic_transition.c | 55 +++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 12 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index a71bbe10..9e7c8e8a 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -205,6 +205,33 @@ static void set_sprite_wh(igt_display_t *display, enum pipe pipe,
 #define is_atomic_check_plane_size_errno(errno) \
 		(errno == -EINVAL)
 
+static bool skip_plane(igt_display_t *display, igt_plane_t *plane)
+{
+	int index = plane->index;
+
+	if (!is_i915_device(display->drm_fd))
+		return false;
+
+	if (plane->type == DRM_PLANE_TYPE_CURSOR)
+		return false;
+
+	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
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
 static void setup_parms(igt_display_t *display, enum pipe pipe,
 			const drmModeModeInfo *mode,
 			struct igt_fb *primary_fb,
@@ -230,8 +257,12 @@ static void setup_parms(igt_display_t *display, enum pipe pipe,
 		cursor_height = mode->vdisplay;
 
 	for_each_plane_on_pipe(display, pipe, plane) {
+
 		int i = plane->index;
 
+		if (skip_plane(display, plane))
+			continue;
+
 		if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
 			parms[i].fb = primary_fb;
 			parms[i].width = mode->hdisplay;
@@ -932,46 +963,46 @@ igt_main
 	}
 
 	igt_subtest("plane-primary-toggle-with-vblank-wait")
-		for_each_pipe_with_valid_output(&display, pipe, output)
+		for_each_pipe_with_single_output(&display, pipe, output)
 			run_primary_test(&display, pipe, output);
 
 	igt_subtest_with_dynamic("plane-all-transition") {
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_single_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&display, pipe, output, TRANSITION_PLANES, false, false);
 		}
 	}
 
 	igt_subtest_with_dynamic("plane-all-transition-fencing") {
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_single_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&display, pipe, output, TRANSITION_PLANES, false, true);
 		}
 	}
 
 	igt_subtest_with_dynamic("plane-all-transition-nonblocking") {
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_single_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&display, pipe, output, TRANSITION_PLANES, true, false);
 		}
 	}
 
 	igt_subtest_with_dynamic("plane-all-transition-nonblocking-fencing") {
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_single_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&display, pipe, output, TRANSITION_PLANES, true, true);
 		}
 	}
 
 	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind") {
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_single_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&display, pipe, output, TRANSITION_AFTER_FREE, true, false);
 		}
 	}
 
 	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind-fencing") {
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_single_output(&display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&display, pipe, output, TRANSITION_AFTER_FREE, true, true);
 		}
@@ -983,7 +1014,7 @@ igt_main
 	 * panels with long power cycle delays.
 	 */
 	igt_subtest_with_dynamic("plane-all-modeset-transition")
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_single_output(&display, pipe, output) {
 			if (output_is_internal_panel(output))
 				continue;
 
@@ -992,7 +1023,7 @@ igt_main
 		}
 
 	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing")
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_single_output(&display, pipe, output) {
 			if (output_is_internal_panel(output))
 				continue;
 
@@ -1001,7 +1032,7 @@ igt_main
 		}
 
 	igt_subtest_with_dynamic("plane-all-modeset-transition-internal-panels") {
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_single_output(&display, pipe, output) {
 			if (!output_is_internal_panel(output))
 				continue;
 
@@ -1011,7 +1042,7 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing-internal-panels") {
-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe_with_single_output(&display, pipe, output) {
 			if (!output_is_internal_panel(output))
 				continue;
 
@@ -1021,7 +1052,7 @@ igt_main
 	}
 
 	igt_subtest("plane-toggle-modeset-transition")
-		for_each_pipe_with_valid_output(&display, pipe, output)
+		for_each_pipe_with_single_output(&display, pipe, output)
 			run_transition_test(&display, pipe, output, TRANSITION_MODESET_DISABLE, false, false);
 
 	for (i = 1; i <= IGT_MAX_PIPES; i++) {
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
