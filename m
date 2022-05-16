Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41CA10E880
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 14:06:51 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 16 May 2022 19:31:54 +0530
Message-Id: <20220516140201.3428227-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20220516140201.3428227-1-bhanuprakash.modem@intel.com>
References: <20220516140201.3428227-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V4 04/11] tests/kms_cursor_legacy: Test Cleanup
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

Clear the system state before exiting the subtest.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_legacy.c | 84 ++++++++++++++++++++++++++++++---------
 1 file changed, 66 insertions(+), 18 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 1e0b2a79..b9134688 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -496,6 +496,12 @@ static void flip(igt_display_t *display,
 
 	munmap(results, PAGE_SIZE);
 
+	/* Clean-up */
+	igt_output_set_pipe(output, PIPE_NONE);
+	if (flip_pipe != cursor_pipe)
+		igt_output_set_pipe(output2, PIPE_NONE);
+	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
 	igt_remove_fb(display->drm_fd, &fb_info);
 	if (flip_pipe != cursor_pipe)
 		igt_remove_fb(display->drm_fd, &fb_info2);
@@ -526,6 +532,7 @@ static void basic_flip_cursor(igt_display_t *display,
 	uint64_t ahnd = 0;
 	igt_spin_t *spin;
 	int i, miss1 = 0, miss2 = 0, delta;
+	igt_output_t *output;
 
 	if (flags & BASIC_BUSY)
 	{
@@ -536,7 +543,7 @@ static void basic_flip_cursor(igt_display_t *display,
 	if (mode >= flip_test_atomic)
 		igt_require(display->is_atomic);
 
-	igt_require(set_fb_on_crtc(display, pipe, &fb_info));
+	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
 	set_cursor_on_pipe(display, pipe, &cursor_fb);
@@ -638,6 +645,10 @@ static void basic_flip_cursor(igt_display_t *display,
 	if (miss1 || miss2)
 		igt_info("Failed to evade %i vblanks and missed %i page flips\n", miss1, miss2);
 
+	/* Clean-up */
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
 	igt_remove_fb(display->drm_fd, &fb_info);
 	igt_remove_fb(display->drm_fd, &cursor_fb);
 
@@ -687,11 +698,12 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
 	enum pipe pipe = find_connected_pipe(display, false);
 	volatile unsigned long *shared;
 	cpu_set_t mask, oldmask;
+	igt_output_t *output;
 
 	if (mode >= flip_test_atomic)
 		igt_require(display->is_atomic);
 
-	igt_require(set_fb_on_crtc(display, pipe, &fb_info));
+	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
 	set_cursor_on_pipe(display, pipe, &cursor_fb);
@@ -788,6 +800,10 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
 		sched_setaffinity(0, sizeof(oldmask), &oldmask);
 	}
 
+	/* Clean-up */
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
 	igt_remove_fb(display->drm_fd, &fb_info);
 	igt_remove_fb(display->drm_fd, &cursor_fb);
 
@@ -803,7 +819,7 @@ static void nonblocking_modeset_vs_cursor(igt_display_t *display, int loops)
 	igt_output_t *output;
 	enum pipe pipe = find_connected_pipe(display, false);
 	struct drm_mode_cursor arg[2];
-	igt_plane_t *cursor = NULL, *plane;
+	igt_plane_t *cursor = NULL;
 
 	igt_require(display->is_atomic);
 	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
@@ -812,16 +828,6 @@ static void nonblocking_modeset_vs_cursor(igt_display_t *display, int loops)
 	populate_cursor_args(display, pipe, arg, &cursor_fb);
 	arg[0].flags |= DRM_MODE_CURSOR_BO;
 
-	for_each_plane_on_pipe(display, pipe, plane) {
-		if (plane->type != DRM_PLANE_TYPE_CURSOR)
-			continue;
-
-		cursor = plane;
-		break;
-	}
-
-	igt_skip_on(!cursor);
-
 	/*
 	 * Start disabled. No way around it, since the first atomic
 	 * commit may be unreliable with amount of events sent.
@@ -942,7 +948,6 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 
 	arg2[1].x = arg2[1].y = 192;
 
-
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
 	igt_fork(child, 2) {
@@ -1056,6 +1061,11 @@ done:
 	shared[0] = 1;
 	igt_waitchildren();
 
+	/* Clean-up */
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_output_set_pipe(output2, PIPE_NONE);
+	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
 	igt_remove_fb(display->drm_fd, &fb_info);
 	igt_remove_fb(display->drm_fd, &fb2_info);
 	igt_remove_fb(display->drm_fd, &cursor_fb);
@@ -1150,6 +1160,10 @@ static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloo
 		     "Failed to meet cursor update expectations in %d out of %d iterations\n",
 		     fail_count, nloops);
 
+	/* Clean-up */
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
 	igt_remove_fb(display->drm_fd, &fb_info);
 	igt_remove_fb(display->drm_fd, &cursor_fb);
 	munmap((void *)shared, PAGE_SIZE);
@@ -1263,6 +1277,11 @@ static void two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool
 				    vrefresh[child]*target[child], vrefresh[child]*target[child] / 2);
 	}
 
+	/* Clean-up */
+	igt_output_set_pipe(outputs[0], PIPE_NONE);
+	igt_output_set_pipe(outputs[1], PIPE_NONE);
+	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
 	igt_remove_fb(display->drm_fd, &fb_info[0]);
 	igt_remove_fb(display->drm_fd, &fb_info[1]);
 	igt_remove_fb(display->drm_fd, &cursor_fb);
@@ -1277,11 +1296,12 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 	unsigned vblank_start;
 	enum pipe pipe = find_connected_pipe(display, false);
 	igt_crc_t crcs[3];
+	igt_output_t *output;
 
 	if (atomic)
 		igt_require(display->is_atomic);
 
-	igt_require(set_fb_on_crtc(display, pipe, &fb_info));
+	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
 	populate_cursor_args(display, pipe, arg, &cursor_fb);
@@ -1320,6 +1340,10 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 		igt_assert_crc_equal(&crcs[i], &crcs[2]);
 	}
 
+	/* Clean-up */
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
 	igt_remove_fb(display->drm_fd, &fb_info);
 	igt_remove_fb(display->drm_fd, &cursor_fb);
 }
@@ -1335,6 +1359,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 	igt_plane_t *plane_primary = igt_pipe_get_plane_type(pipe_connected, DRM_PLANE_TYPE_PRIMARY);
 	igt_crc_t crcs[2], test_crc;
 	uint64_t ahnd;
+	igt_output_t *output;
 
 	igt_require_intel(display->drm_fd);
 	ahnd = get_reloc_ahnd(display->drm_fd, 0);
@@ -1342,7 +1367,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 	if (atomic)
 		igt_require(display->is_atomic);
 
-	igt_require(set_fb_on_crtc(display, pipe, &fb_info[0]));
+	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info[0])));
 	igt_create_color_pattern_fb(display->drm_fd, fb_info[0].width, fb_info[0].height,
 				    DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_X_TILED, .1, .1, .1, &fb_info[1]);
 
@@ -1411,6 +1436,10 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 		igt_assert_crc_equal(&crcs[i], &test_crc);
 	}
 
+	/* Clean-up */
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
 	igt_pipe_crc_stop(pipe_crc);
 	igt_remove_fb(display->drm_fd, &fb_info[1]);
 	igt_remove_fb(display->drm_fd, &fb_info[0]);
@@ -1485,6 +1514,9 @@ igt_main
 	igt_describe("Test checks how many cursor updates we can fit between vblanks "
 		    "on all pipes with different modes, priority and number of processes");
 	igt_subtest_group {
+		igt_fixture
+			igt_display_require_output(&display);
+
 		igt_subtest("nonblocking-modeset-vs-cursor-atomic")
 			nonblocking_modeset_vs_cursor(&display, 1);
 
@@ -1510,6 +1542,9 @@ igt_main
 			{ "2x-long-nonblocking-modeset-vs-cursor-atomic", 15, true, true },
 		};
 
+		igt_fixture
+			igt_display_require_output(&display);
+
 		for (i = 0; i < ARRAY_SIZE(tests); i++) {
 			igt_subtest(tests[i].name)
 				two_screens_flip_vs_cursor(&display,
@@ -1533,6 +1568,9 @@ igt_main
 			{ "2x-long-cursor-vs-flip-atomic", 50, true },
 		};
 
+		igt_fixture
+			igt_display_require_output(&display);
+
 		for (i = 0; i < ARRAY_SIZE(tests); i++) {
 			igt_subtest(tests[i].name)
 				two_screens_cursor_vs_flip(&display,
@@ -1544,8 +1582,10 @@ igt_main
 	/*Test description for cursor-crc tests*/
 	igt_describe("Test will first does a page flip and then cursor update");
 	igt_subtest_group {
-		igt_fixture
+		igt_fixture {
 			igt_require_pipe_crc(display.drm_fd);
+			igt_display_require_output(&display);
+		}
 
 		igt_subtest("flip-vs-cursor-crc-legacy")
 			flip_vs_cursor_crc(&display, false);
@@ -1557,8 +1597,10 @@ igt_main
 	/*Test description for busy-crc tests*/
 	igt_describe("this test perform a busy bo update followed by a cursor update");
 	igt_subtest_group {
-		igt_fixture
+		igt_fixture {
 			igt_require_pipe_crc(display.drm_fd);
+			igt_display_require_output(&display);
+		}
 
 		igt_subtest("flip-vs-cursor-busy-crc-legacy")
 			flip_vs_cursor_busy_crc(&display, false);
@@ -1576,6 +1618,9 @@ igt_main
 						"and full screen primary plane. "
 			"toggle: which toggles cursor visibility and make sure cursor moves between updates.");
 		igt_subtest_group {
+			igt_fixture
+				igt_display_require_output(&display);
+
 			igt_subtest_with_dynamic_f("%s-flip-before-cursor", prefix[i]) {
 				for (j = 0; j <= flip_test_last; j++) {
 					igt_dynamic_f("%s", modes[j])
@@ -1605,6 +1650,9 @@ igt_main
 	igt_describe("The essence of the basic test is that neither the cursor nor the "
 		     "nonblocking flip stall the application of the next");
 	igt_subtest_group {
+		igt_fixture
+			igt_display_require_output(&display);
+
 		igt_subtest_with_dynamic("flip-vs-cursor") {
 			for (i = 0; i <= flip_test_last; i++) {
 				igt_dynamic_f("%s", modes[i])
-- 
2.35.1
