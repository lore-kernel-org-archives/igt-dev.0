Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCFC89A5C
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Dec 2020 05:57:48 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Fri, 18 Dec 2020 11:36:35 +0530
Message-Id: <20201218060635.8416-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v5] tests/kms_atomic_transition:reduce
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

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_atomic_transition.c | 57 +++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 02206f0a..3baaddc5 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -120,6 +120,30 @@ static void configure_fencing(igt_plane_t *plane)
 	igt_assert_eq(ret, 0);
 }
 
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
 wm_setup_plane(igt_display_t *display, enum pipe pipe,
 	       uint32_t mask, struct plane_parms *parms, bool fencing)
@@ -135,6 +159,9 @@ wm_setup_plane(igt_display_t *display, enum pipe pipe,
 	for_each_plane_on_pipe(display, pipe, plane) {
 		int i = plane->index;
 
+		if (skip_plane(display, plane))
+			continue;
+
 		if (!mask || !(parms[i].mask & mask)) {
 			if (plane->values[IGT_PLANE_FB_ID]) {
 				igt_plane_set_fb(plane, NULL);
@@ -935,11 +962,16 @@ igt_main
 	}
 
 	igt_subtest("plane-primary-toggle-with-vblank-wait")
-		for_each_pipe_with_valid_output(&display, pipe, output)
+		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2)
+				break;
 			run_primary_test(&display, pipe, output);
+		}
 
 	igt_subtest_with_dynamic("plane-all-transition") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2)
+				break;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&display, pipe, output, TRANSITION_PLANES, false, false);
 		}
@@ -947,6 +979,8 @@ igt_main
 
 	igt_subtest_with_dynamic("plane-all-transition-fencing") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2)
+				break;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&display, pipe, output, TRANSITION_PLANES, false, true);
 		}
@@ -954,6 +988,8 @@ igt_main
 
 	igt_subtest_with_dynamic("plane-all-transition-nonblocking") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2)
+				break;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&display, pipe, output, TRANSITION_PLANES, true, false);
 		}
@@ -961,6 +997,8 @@ igt_main
 
 	igt_subtest_with_dynamic("plane-all-transition-nonblocking-fencing") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2)
+				break;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&display, pipe, output, TRANSITION_PLANES, true, true);
 		}
@@ -968,6 +1006,8 @@ igt_main
 
 	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2)
+				break;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&display, pipe, output, TRANSITION_AFTER_FREE, true, false);
 		}
@@ -975,6 +1015,8 @@ igt_main
 
 	igt_subtest_with_dynamic("plane-use-after-nonblocking-unbind-fencing") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2)
+				break;
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
 				run_transition_test(&display, pipe, output, TRANSITION_AFTER_FREE, true, true);
 		}
@@ -987,6 +1029,8 @@ igt_main
 	 */
 	igt_subtest_with_dynamic("plane-all-modeset-transition")
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2)
+				break;
 			if (output_is_internal_panel(output))
 				continue;
 
@@ -996,6 +1040,8 @@ igt_main
 
 	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing")
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2)
+				break;
 			if (output_is_internal_panel(output))
 				continue;
 
@@ -1005,6 +1051,8 @@ igt_main
 
 	igt_subtest_with_dynamic("plane-all-modeset-transition-internal-panels") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2)
+				break;
 			if (!output_is_internal_panel(output))
 				continue;
 
@@ -1015,6 +1063,8 @@ igt_main
 
 	igt_subtest_with_dynamic("plane-all-modeset-transition-fencing-internal-panels") {
 		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2)
+				break;
 			if (!output_is_internal_panel(output))
 				continue;
 
@@ -1024,8 +1074,11 @@ igt_main
 	}
 
 	igt_subtest("plane-toggle-modeset-transition")
-		for_each_pipe_with_valid_output(&display, pipe, output)
+		for_each_pipe_with_valid_output(&display, pipe, output) {
+			if (pipe >= 2)
+				break;
 			run_transition_test(&display, pipe, output, TRANSITION_MODESET_DISABLE, false, false);
+		}
 
 	igt_subtest_with_dynamic("modeset-transition") {
 		for (i = 1; i <= count; i++) {
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
