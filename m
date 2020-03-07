Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2623B6E262
 for <igt-dev@lists.freedesktop.org>; Sat,  7 Mar 2020 21:19:30 +0000 (UTC)
From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Date: Sun,  8 Mar 2020 02:47:51 +0530
Message-Id: <20200307211751.22125-4-mohammed.khajapasha@intel.com>
In-Reply-To: <20200307211751.22125-1-mohammed.khajapasha@intel.com>
References: <20200307211751.22125-1-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] kms/test: Pass correct pipe value to
 print pipe name
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

currently kmstest_pipe_name() fn gets the pipe index
value to print the pipe name, but with non-contiguous
display, pipe index is not always same as pipe name.

for example: if PIPE_A is disabled in kernel, PIPE_B,C & D
get registered with 0,1 & 2 indexes in mode config's crtc list
and kmstest_pipe_name() always prints PIPE_A for 0 index
which is actually PIPE_B in kernel.

Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
---
 tests/kms_atomic_transition.c   |  2 +-
 tests/kms_available_modes_crc.c |  8 +++++--
 tests/kms_busy.c                | 18 +++++++--------
 tests/kms_ccs.c                 |  3 ++-
 tests/kms_color.c               | 28 ++++++++++++-----------
 tests/kms_color_chamelium.c     | 24 +++++++++++---------
 tests/kms_concurrent.c          |  6 +++--
 tests/kms_cursor_crc.c          | 33 +++++++++++++++------------
 tests/kms_cursor_edge_walk.c    | 18 ++++++++-------
 tests/kms_cursor_legacy.c       | 21 +++++++++++------
 tests/kms_dp_dsc.c              |  5 ++++-
 tests/kms_lease.c               |  9 +++++---
 tests/kms_pipe_crc_basic.c      | 17 ++++++++------
 tests/kms_plane.c               | 40 +++++++++++++++++++--------------
 tests/kms_plane_alpha_blend.c   | 23 ++++++++++---------
 tests/kms_plane_cursor.c        | 16 +++++++------
 tests/kms_plane_lowres.c        | 14 +++++++-----
 tests/kms_plane_multiple.c      | 14 +++++++-----
 tests/kms_plane_scaling.c       | 17 +++++++++-----
 tests/kms_prime.c               |  2 +-
 tests/kms_properties.c          |  9 +++++---
 tests/kms_rotation_crc.c        |  3 ++-
 tests/kms_sequence.c            |  4 ++--
 tests/kms_universal_plane.c     | 19 +++++++---------
 tests/kms_vblank.c              | 11 +++++----
 25 files changed, 213 insertions(+), 151 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 44f01109..e8302b74 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -355,7 +355,7 @@ static void setup_parms(igt_display_t *display, enum pipe pipe,
 			alpha, sprite_width, sprite_height);
 
 	igt_info("Running test on pipe %s with resolution %dx%d and sprite size %dx%d alpha %i\n",
-		 kmstest_pipe_name(pipe), mode->hdisplay, mode->vdisplay,
+		 kmstest_pipe_name(display->pipes[pipe].pipe), mode->hdisplay, mode->vdisplay,
 		 sprite_width, sprite_height, alpha);
 }
 
diff --git a/tests/kms_available_modes_crc.c b/tests/kms_available_modes_crc.c
index ed43d1fb..2cc1370d 100644
--- a/tests/kms_available_modes_crc.c
+++ b/tests/kms_available_modes_crc.c
@@ -298,6 +298,8 @@ test_one_mode(data_t* data, igt_output_t *output, igt_plane_t* plane,
 		return false;
 
 	if (prepare_crtc(data, output, plane, mode)) {
+		igt_display_t *display;
+
 		igt_plane_set_fb(plane, &data->fb);
 		igt_fb_set_size(&data->fb, plane, data->fb.width, data->fb.height);
 		igt_plane_set_size(plane, data->fb.width, data->fb.height);
@@ -307,13 +309,15 @@ test_one_mode(data_t* data, igt_output_t *output, igt_plane_t* plane,
 		igt_wait_for_vblank(data->gfx_fd, pipe);
 		igt_pipe_crc_get_current(data->gfx_fd, data->pipe_crc, &current_crc);
 
+		display = &data->display;
+
 		if (plane->type != DRM_PLANE_TYPE_CURSOR) {
 			if (!igt_check_crc_equal(&current_crc,
 				&data->fullscreen_crc)) {
 				igt_warn("crc mismatch. connector %s using pipe %s" \
 					" plane index %d mode %.4s\n",
 					igt_output_name(output),
-					kmstest_pipe_name(pipe),
+					kmstest_pipe_name(display->pipes[pipe].pipe),
 					plane->index,
 					(char *)&mode);
 				rVal++;
@@ -324,7 +328,7 @@ test_one_mode(data_t* data, igt_output_t *output, igt_plane_t* plane,
 				igt_warn("crc mismatch. connector %s using pipe %s" \
 					" plane index %d mode %.4s\n",
 					igt_output_name(output),
-					kmstest_pipe_name(pipe),
+					kmstest_pipe_name(display->pipes[pipe].pipe),
 					plane->index,
 					(char *)&mode);
 				rVal++;
diff --git a/tests/kms_busy.c b/tests/kms_busy.c
index eaf2b297..6c0461f0 100644
--- a/tests/kms_busy.c
+++ b/tests/kms_busy.c
@@ -327,13 +327,13 @@ igt_main
 		}
 
 		igt_subtest_f("basic-flip-pipe-%s",
-			kmstest_pipe_name(n)) {
+			kmstest_pipe_name(display.pipes[n].pipe)) {
 			igt_require(gem_has_ring(display.drm_fd, eb_ring(e)));
 
 			test_flip(&display, eb_ring(e), n, false);
 		}
 		igt_subtest_f("basic-modeset-pipe-%s",
-			kmstest_pipe_name(n)) {
+			kmstest_pipe_name(display.pipes[n].pipe)) {
 			igt_require(gem_has_ring(display.drm_fd, eb_ring(e)));
 
 			test_flip(&display, eb_ring(e), n, true);
@@ -346,7 +346,7 @@ igt_main
 		}
 
 		igt_subtest_f("extended-pageflip-modeset-hang-oldfb-%s-pipe-%s",
-				e->name, kmstest_pipe_name(n)) {
+				e->name, kmstest_pipe_name(display.pipes[n].pipe)) {
 			igt_require(gem_has_ring(display.drm_fd, eb_ring(e)));
 
 			test_pageflip_modeset_hang(&display, eb_ring(e), n);
@@ -356,23 +356,23 @@ igt_main
 			igt_require(display.is_atomic);
 
 		igt_subtest_f("extended-pageflip-hang-oldfb-%s-pipe-%s",
-				e->name, kmstest_pipe_name(n))
+				e->name, kmstest_pipe_name(display.pipes[n].pipe))
 			test_hang(&display, eb_ring(e), n, false, false);
 
 		igt_subtest_f("extended-pageflip-hang-newfb-%s-pipe-%s",
-				e->name, kmstest_pipe_name(n))
+				e->name, kmstest_pipe_name(display.pipes[n].pipe))
 			test_hang(&display, eb_ring(e), n, false, true);
 
 		igt_subtest_f("extended-modeset-hang-oldfb-%s-pipe-%s",
-				e->name, kmstest_pipe_name(n))
+				e->name, kmstest_pipe_name(display.pipes[n].pipe))
 			test_hang(&display, eb_ring(e), n, true, false);
 
 		igt_subtest_f("extended-modeset-hang-newfb-%s-pipe-%s",
-				e->name, kmstest_pipe_name(n))
+				e->name, kmstest_pipe_name(display.pipes[n].pipe))
 			test_hang(&display, eb_ring(e), n, true, true);
 
 		igt_subtest_f("extended-modeset-hang-oldfb-with-reset-%s-pipe-%s",
-				e->name, kmstest_pipe_name(n)) {
+				e->name, kmstest_pipe_name(display.pipes[n].pipe)) {
 			igt_set_module_param_int("force_reset_modeset_test", 1);
 
 			test_hang(&display, eb_ring(e), n, true, false);
@@ -381,7 +381,7 @@ igt_main
 		}
 
 		igt_subtest_f("extended-modeset-hang-newfb-with-reset-%s-pipe-%s",
-				e->name, kmstest_pipe_name(n)) {
+				e->name, kmstest_pipe_name(display.pipes[n].pipe)) {
 			igt_set_module_param_int("force_reset_modeset_test", 1);
 
 			test_hang(&display, eb_ring(e), n, true, true);
diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index c2864030..e4ba2fa1 100644
--- a/tests/kms_ccs.c
+++ b/tests/kms_ccs.c
@@ -475,7 +475,8 @@ igt_main_args("c", NULL, help_str, opt_handler, NULL)
 	}
 
 	for_each_pipe_static(&data.display, pipe) {
-		const char *pipe_name = kmstest_pipe_name(pipe);
+		igt_display_t *display = &data.display;
+		const char *pipe_name = kmstest_pipe_name(display->pipes[pipe].pipe);
 
 		data.pipe = pipe;
 
diff --git a/tests/kms_color.c b/tests/kms_color.c
index 18077306..a7173745 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -619,6 +619,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	igt_plane_t *primary;
 	double delta;
 	int i;
+	const char *pipe_name;
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
 		{ 0.0, 1.0, 0.0 },
@@ -631,6 +632,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 		igt_require(p < data->display.n_pipes);
 
 		pipe = &data->display.pipes[p];
+		pipe_name = kmstest_pipe_name(pipe->pipe);
 		igt_require(pipe->n_planes >= 0);
 
 		primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
@@ -661,7 +663,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	data->color_depth = 8;
 	delta = 1.0 / (1 << data->color_depth);
 
-	igt_subtest_f("pipe-%s-ctm-red-to-blue", kmstest_pipe_name(p)) {
+	igt_subtest_f("pipe-%s-ctm-red-to-blue", pipe_name) {
 		color_t blue_green_blue[] = {
 			{ 0.0, 0.0, 1.0 },
 			{ 0.0, 1.0, 0.0 },
@@ -674,7 +676,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 					 blue_green_blue, ctm));
 	}
 
-	igt_subtest_f("pipe-%s-ctm-green-to-red", kmstest_pipe_name(p)) {
+	igt_subtest_f("pipe-%s-ctm-green-to-red", pipe_name) {
 		color_t red_red_blue[] = {
 			{ 1.0, 0.0, 0.0 },
 			{ 1.0, 0.0, 0.0 },
@@ -687,7 +689,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 					 red_red_blue, ctm));
 	}
 
-	igt_subtest_f("pipe-%s-ctm-blue-to-red", kmstest_pipe_name(p)) {
+	igt_subtest_f("pipe-%s-ctm-blue-to-red", pipe_name) {
 		color_t red_green_red[] = {
 			{ 1.0, 0.0, 0.0 },
 			{ 0.0, 1.0, 0.0 },
@@ -704,7 +706,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	 * the it depends on the hardware we're dealing with, we can
 	 * either get clamped or rounded values and we also need to
 	 * account for odd number of items in the LUTs. */
-	igt_subtest_f("pipe-%s-ctm-0-25", kmstest_pipe_name(p)) {
+	igt_subtest_f("pipe-%s-ctm-0-25", pipe_name) {
 		color_t expected_colors[] = {
 			{ 0.0, }, { 0.0, }, { 0.0, }
 		};
@@ -725,7 +727,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 		igt_assert(success);
 	}
 
-	igt_subtest_f("pipe-%s-ctm-0-5", kmstest_pipe_name(p)) {
+	igt_subtest_f("pipe-%s-ctm-0-5", pipe_name) {
 		color_t expected_colors[] = {
 			{ 0.0, }, { 0.0, }, { 0.0, }
 		};
@@ -746,7 +748,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 		igt_assert(success);
 	}
 
-	igt_subtest_f("pipe-%s-ctm-0-75", kmstest_pipe_name(p)) {
+	igt_subtest_f("pipe-%s-ctm-0-75", pipe_name) {
 		color_t expected_colors[] = {
 			{ 0.0, }, { 0.0, }, { 0.0, }
 		};
@@ -767,7 +769,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 		igt_assert(success);
 	}
 
-	igt_subtest_f("pipe-%s-ctm-max", kmstest_pipe_name(p)) {
+	igt_subtest_f("pipe-%s-ctm-max", pipe_name) {
 		color_t full_rgb[] = {
 			{ 1.0, 0.0, 0.0 },
 			{ 0.0, 1.0, 0.0 },
@@ -785,7 +787,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 					 full_rgb, ctm));
 	}
 
-	igt_subtest_f("pipe-%s-ctm-negative", kmstest_pipe_name(p)) {
+	igt_subtest_f("pipe-%s-ctm-negative", pipe_name) {
 		color_t all_black[] = {
 			{ 0.0, 0.0, 0.0 },
 			{ 0.0, 0.0, 0.0 },
@@ -799,20 +801,20 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	}
 
 #if 0
-	igt_subtest_f("pipe-%s-ctm-limited-range", kmstest_pipe_name(p))
+	igt_subtest_f("pipe-%s-ctm-limited-range", pipe_name)
 		test_pipe_limited_range_ctm(data, primary);
 #endif
 
-	igt_subtest_f("pipe-%s-degamma", kmstest_pipe_name(p))
+	igt_subtest_f("pipe-%s-degamma", pipe_name)
 		test_pipe_degamma(data, primary);
 
-	igt_subtest_f("pipe-%s-gamma", kmstest_pipe_name(p))
+	igt_subtest_f("pipe-%s-gamma", pipe_name)
 		test_pipe_gamma(data, primary);
 
-	igt_subtest_f("pipe-%s-legacy-gamma", kmstest_pipe_name(p))
+	igt_subtest_f("pipe-%s-legacy-gamma", pipe_name)
 		test_pipe_legacy_gamma(data, primary);
 
-	igt_subtest_f("pipe-%s-legacy-gamma-reset", kmstest_pipe_name(p))
+	igt_subtest_f("pipe-%s-legacy-gamma-reset", pipe_name)
 		test_pipe_legacy_gamma_reset(data, primary);
 
 	igt_fixture {
diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index 65a4812b..8a41aa58 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -510,6 +510,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	igt_pipe_t *pipe;
 	igt_plane_t *primary;
 	double delta;
+	char *pipe_name;
 	int i;
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
@@ -522,6 +523,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 		igt_require(p < data->display.n_pipes);
 
 		pipe = &data->display.pipes[p];
+		pipe_name = kmstest_pipe_name(pipe->pipe);
 		igt_require(pipe->n_planes >= 0);
 
 		primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
@@ -549,7 +551,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	delta = 1.0 / (1 << data->color_depth);
 
 	igt_describe("Compare after applying ctm matrix & identity matrix");
-	igt_subtest_f("pipe-%s-ctm-red-to-blue", kmstest_pipe_name(p)) {
+	igt_subtest_f("pipe-%s-ctm-red-to-blue", pipe_name) {
 		color_t blue_green_blue[] = {
 			{ 0.0, 0.0, 1.0 },
 			{ 0.0, 1.0, 0.0 },
@@ -563,7 +565,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	}
 
 	igt_describe("Compare after applying ctm matrix & identity matrix");
-	igt_subtest_f("pipe-%s-ctm-green-to-red", kmstest_pipe_name(p)) {
+	igt_subtest_f("pipe-%s-ctm-green-to-red", pipe_name) {
 		color_t red_red_blue[] = {
 			{ 1.0, 0.0, 0.0 },
 			{ 1.0, 0.0, 0.0 },
@@ -577,7 +579,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	}
 
 	igt_describe("Compare after applying ctm matrix & identity matrix");
-	igt_subtest_f("pipe-%s-ctm-blue-to-red", kmstest_pipe_name(p)) {
+	igt_subtest_f("pipe-%s-ctm-blue-to-red", pipe_name) {
 		color_t red_green_red[] = {
 			{ 1.0, 0.0, 0.0 },
 			{ 0.0, 1.0, 0.0 },
@@ -596,7 +598,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	 * account for odd number of items in the LUTs.
 	 */
 	igt_describe("Compare after applying ctm matrix & identity matrix");
-	igt_subtest_f("pipe-%s-ctm-0-25", kmstest_pipe_name(p)) {
+	igt_subtest_f("pipe-%s-ctm-0-25", pipe_name) {
 		color_t expected_colors[] = {
 			{ 0.0, }, { 0.0, }, { 0.0, }
 		};
@@ -618,7 +620,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	}
 
 	igt_describe("Compare after applying ctm matrix & identity matrix");
-	igt_subtest_f("pipe-%s-ctm-0-5", kmstest_pipe_name(p)) {
+	igt_subtest_f("pipe-%s-ctm-0-5", pipe_name) {
 		color_t expected_colors[] = {
 			{ 0.0, }, { 0.0, }, { 0.0, }
 		};
@@ -640,7 +642,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	}
 
 	igt_describe("Compare after applying ctm matrix & identity matrix");
-	igt_subtest_f("pipe-%s-ctm-0-75", kmstest_pipe_name(p)) {
+	igt_subtest_f("pipe-%s-ctm-0-75", pipe_name) {
 		color_t expected_colors[] = {
 			{ 0.0, }, { 0.0, }, { 0.0, }
 		};
@@ -662,7 +664,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	}
 
 	igt_describe("Compare after applying ctm matrix & identity matrix");
-	igt_subtest_f("pipe-%s-ctm-max", kmstest_pipe_name(p)) {
+	igt_subtest_f("pipe-%s-ctm-max", pipe_name) {
 		color_t full_rgb[] = {
 			{ 1.0, 0.0, 0.0 },
 			{ 0.0, 1.0, 0.0 },
@@ -682,7 +684,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	}
 
 	igt_describe("Compare after applying ctm matrix & identity matrix");
-	igt_subtest_f("pipe-%s-ctm-negative", kmstest_pipe_name(p)) {
+	igt_subtest_f("pipe-%s-ctm-negative", pipe_name) {
 		color_t all_black[] = {
 			{ 0.0, 0.0, 0.0 },
 			{ 0.0, 0.0, 0.0 },
@@ -696,15 +698,15 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	}
 
 	igt_describe("Compare after applying ctm matrix & identity matrix");
-	igt_subtest_f("pipe-%s-ctm-limited-range", kmstest_pipe_name(p))
+	igt_subtest_f("pipe-%s-ctm-limited-range", pipe_name)
 		test_pipe_limited_range_ctm(data, primary);
 
 	igt_describe("Compare maxed out gamma LUT and solid color linear LUT");
-	igt_subtest_f("pipe-%s-degamma", kmstest_pipe_name(p))
+	igt_subtest_f("pipe-%s-degamma", pipe_name)
 		test_pipe_degamma(data, primary);
 
 	igt_describe("Compare maxed out gamma LUT and solid color linear LUT");
-	igt_subtest_f("pipe-%s-gamma", kmstest_pipe_name(p))
+	igt_subtest_f("pipe-%s-gamma", pipe_name)
 		test_pipe_gamma(data, primary);
 
 	igt_fixture {
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 34e4a8bd..78ef13ec 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -308,7 +308,8 @@ run_test(data_t *data, enum pipe pipe, igt_output_t *output)
 	connected_outs = 0;
 	for_each_valid_output_on_pipe(&data->display, pipe, output) {
 		igt_info("Testing resolution with connector %s using pipe %s with seed %d\n",
-			 igt_output_name(output), kmstest_pipe_name(pipe), opt.seed);
+			 igt_output_name(output),
+			 kmstest_pipe_name(data->display.pipes[pipe].pipe), opt.seed);
 
 		test_init(data, pipe, n_planes, output);
 
@@ -345,7 +346,8 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 		igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
 	}
 
-	igt_subtest_f("pipe-%s", kmstest_pipe_name(pipe))
+	igt_subtest_f("pipe-%s",
+			kmstest_pipe_name(data->display.pipes[pipe].pipe))
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
 			run_test(data, pipe, output);
 }
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index b337da9c..c8d92283 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -681,33 +681,38 @@ static void test_rapid_movement(data_t *data)
 static void run_tests_on_pipe(data_t *data, enum pipe pipe)
 {
 	int cursor_size;
+	igt_display_t *display;
+	const char *pipe_name;
 
 	igt_fixture {
 		data->pipe = pipe;
+		display = &data->display;
 		data->output = igt_get_single_output_for_pipe(&data->display, pipe);
 		igt_require(data->output);
 	}
 
-	igt_subtest_f("pipe-%s-cursor-size-change", kmstest_pipe_name(pipe))
+	pipe_name = kmstest_pipe_name(display->pipes[pipe].pipe);
+
+	igt_subtest_f("pipe-%s-cursor-size-change", pipe_name)
 		run_test(data, test_cursor_size,
 			 data->cursor_max_w, data->cursor_max_h);
 
-	igt_subtest_f("pipe-%s-cursor-alpha-opaque", kmstest_pipe_name(pipe))
+	igt_subtest_f("pipe-%s-cursor-alpha-opaque",pipe_name)
 		run_test(data, test_cursor_opaque, data->cursor_max_w, data->cursor_max_h);
 
-	igt_subtest_f("pipe-%s-cursor-alpha-transparent", kmstest_pipe_name(pipe))
+	igt_subtest_f("pipe-%s-cursor-alpha-transparent",pipe_name)
 		run_test(data, test_cursor_transparent, data->cursor_max_w, data->cursor_max_h);
 
 	igt_fixture
 		create_cursor_fb(data, data->cursor_max_w, data->cursor_max_h);
 
-	igt_subtest_f("pipe-%s-cursor-dpms", kmstest_pipe_name(pipe)) {
+	igt_subtest_f("pipe-%s-cursor-dpms", pipe_name) {
 		data->flags = TEST_DPMS;
 		run_test(data, test_crc_random, data->cursor_max_w, data->cursor_max_h);
 	}
 	data->flags = 0;
 
-	igt_subtest_f("pipe-%s-cursor-suspend", kmstest_pipe_name(pipe)) {
+	igt_subtest_f("pipe-%s-cursor-suspend", pipe_name) {
 		data->flags = TEST_SUSPEND;
 		run_test(data, test_crc_random, data->cursor_max_w, data->cursor_max_h);
 	}
@@ -728,16 +733,16 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
 		}
 
 		/* Using created cursor FBs to test cursor support */
-		igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen", kmstest_pipe_name(pipe), w, h)
+		igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen", pipe_name, w, h)
 			run_test(data, test_crc_onscreen, w, h);
-		igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen", kmstest_pipe_name(pipe), w, h)
+		igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen", pipe_name, w, h)
 			run_test(data, test_crc_offscreen, w, h);
-		igt_subtest_f("pipe-%s-cursor-%dx%d-sliding", kmstest_pipe_name(pipe), w, h)
+		igt_subtest_f("pipe-%s-cursor-%dx%d-sliding", pipe_name, w, h)
 			run_test(data, test_crc_sliding, w, h);
-		igt_subtest_f("pipe-%s-cursor-%dx%d-random", kmstest_pipe_name(pipe), w, h)
+		igt_subtest_f("pipe-%s-cursor-%dx%d-random", pipe_name, w, h)
 			run_test(data, test_crc_random, w, h);
 
-		igt_subtest_f("pipe-%s-cursor-%dx%d-rapid-movement", kmstest_pipe_name(pipe), w, h) {
+		igt_subtest_f("pipe-%s-cursor-%dx%d-rapid-movement", pipe_name, w, h) {
 			run_test(data, test_rapid_movement, w, h);
 		}
 
@@ -757,19 +762,19 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
 		}
 
 		/* Using created cursor FBs to test cursor support */
-		igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen", kmstest_pipe_name(pipe), w, h) {
+		igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen", pipe_name, w, h) {
 			igt_require(has_nonsquare_cursors(data));
 			run_test(data, test_crc_onscreen, w, h);
 		}
-		igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen", kmstest_pipe_name(pipe), w, h) {
+		igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen", pipe_name, w, h) {
 			igt_require(has_nonsquare_cursors(data));
 			run_test(data, test_crc_offscreen, w, h);
 		}
-		igt_subtest_f("pipe-%s-cursor-%dx%d-sliding", kmstest_pipe_name(pipe), w, h) {
+		igt_subtest_f("pipe-%s-cursor-%dx%d-sliding", pipe_name, w, h) {
 			igt_require(has_nonsquare_cursors(data));
 			run_test(data, test_crc_sliding, w, h);
 		}
-		igt_subtest_f("pipe-%s-cursor-%dx%d-random", kmstest_pipe_name(pipe), w, h) {
+		igt_subtest_f("pipe-%s-cursor-%dx%d-random", pipe_name, w, h) {
 			igt_require(has_nonsquare_cursors(data));
 			run_test(data, test_crc_random, w, h);
 		}
diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 600848f8..f6d5a87a 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -325,35 +325,37 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	}
 
 	for_each_pipe_static(&data.display, data.pipe) {
+		const char *pipe_name;
+		igt_display_t *display;
+
 		igt_subtest_group {
 			igt_fixture {
 				igt_display_require_output_on_pipe(&data.display, data.pipe);
 				data.output = igt_get_single_output_for_pipe(&data.display, data.pipe);
 			}
 
+			display = &data.display;
+			pipe_name = kmstest_pipe_name(display->pipes[data.pipe].pipe);
+
 			for (data.curw = 64; data.curw <= 256; data.curw *= 2) {
 				data.curh = data.curw;
 
 				igt_fixture
 					igt_require(data.curw <= max_curw && data.curh <= max_curh);
 
-				igt_subtest_f("pipe-%s-%dx%d-left-edge",
-					kmstest_pipe_name(data.pipe),
+				igt_subtest_f("pipe-%s-%dx%d-left-edge", pipe_name,
 					data.curw, data.curh)
 					test_crtc(&data, EDGE_LEFT);
 
-				igt_subtest_f("pipe-%s-%dx%d-right-edge",
-					kmstest_pipe_name(data.pipe),
+				igt_subtest_f("pipe-%s-%dx%d-right-edge", pipe_name,
 					data.curw, data.curh)
 					test_crtc(&data, EDGE_RIGHT);
 
-				igt_subtest_f("pipe-%s-%dx%d-top-edge",
-					kmstest_pipe_name(data.pipe),
+				igt_subtest_f("pipe-%s-%dx%d-top-edge", pipe_name,
 					data.curw, data.curh)
 					test_crtc(&data, EDGE_TOP);
 
-				igt_subtest_f("pipe-%s-%dx%d-bottom-edge",
-					kmstest_pipe_name(data.pipe),
+				igt_subtest_f("pipe-%s-%dx%d-bottom-edge", pipe_name,
 					data.curw, data.curh)
 					test_crtc(&data, EDGE_BOTTOM);
 			}
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 4be9b114..c556e4d9 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -396,7 +396,8 @@ static void flip(igt_display_t *display,
 	cursor_pipe = find_connected_pipe(display, !!cursor_pipe);
 
 	igt_info("Using pipe %s for page flip, pipe %s for cursor\n",
-		  kmstest_pipe_name(flip_pipe), kmstest_pipe_name(cursor_pipe));
+		  kmstest_pipe_name(display->pipes[flip_pipe].pipe),
+		  kmstest_pipe_name(display->pipes[cursor_pipe].pipe));
 
 	if (mode >= flip_test_atomic)
 		igt_require(display->is_atomic);
@@ -1383,19 +1384,25 @@ igt_main
 				igt_skip_on(n >= display.n_pipes);
 			}
 
-			igt_subtest_f("pipe-%s-single-bo", kmstest_pipe_name(n))
+			igt_subtest_f("pipe-%s-single-bo",
+					kmstest_pipe_name(display.pipes[n].pipe))
 				stress(&display, n, 1, DRM_MODE_CURSOR_BO, 20);
-			igt_subtest_f("pipe-%s-single-move", kmstest_pipe_name(n))
+			igt_subtest_f("pipe-%s-single-move",
+					kmstest_pipe_name(display.pipes[n].pipe))
 				stress(&display, n, 1, DRM_MODE_CURSOR_MOVE, 20);
 
-			igt_subtest_f("pipe-%s-forked-bo", kmstest_pipe_name(n))
+			igt_subtest_f("pipe-%s-forked-bo",
+					kmstest_pipe_name(display.pipes[n].pipe))
 				stress(&display, n, ncpus, DRM_MODE_CURSOR_BO, 20);
-			igt_subtest_f("pipe-%s-forked-move", kmstest_pipe_name(n))
+			igt_subtest_f("pipe-%s-forked-move",
+					kmstest_pipe_name(display.pipes[n].pipe))
 				stress(&display, n, ncpus, DRM_MODE_CURSOR_MOVE, 20);
 
-			igt_subtest_f("pipe-%s-torture-bo", kmstest_pipe_name(n))
+			igt_subtest_f("pipe-%s-torture-bo",
+					kmstest_pipe_name(display.pipes[n].pipe))
 				stress(&display, n, -ncpus, DRM_MODE_CURSOR_BO, 20);
-			igt_subtest_f("pipe-%s-torture-move", kmstest_pipe_name(n))
+			igt_subtest_f("pipe-%s-torture-move",
+					kmstest_pipe_name(display.pipes[n].pipe))
 				stress(&display, n, -ncpus, DRM_MODE_CURSOR_MOVE, 20);
 		}
 	}
diff --git a/tests/kms_dp_dsc.c b/tests/kms_dp_dsc.c
index e2e3aaa0..04bf1059 100644
--- a/tests/kms_dp_dsc.c
+++ b/tests/kms_dp_dsc.c
@@ -185,6 +185,8 @@ static void kms_dp_dsc_exit_handler(int sig)
 static void update_display(data_t *data, enum dsc_test_type test_type)
 {
 	igt_plane_t *primary;
+	igt_display_t *display;
+
 	data->mode = igt_output_get_mode(data->output);
 	data->connector = data->output->config.connector;
 
@@ -226,11 +228,12 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 
 		enabled = is_dp_dsc_enabled(data);
 		restore_force_dsc_en();
+		display = &data->display;
 
 		igt_assert_f(enabled,
 			     "Default DSC enable failed on Connector: %s Pipe: %s\n",
 			     data->conn_name,
-			     kmstest_pipe_name(data->pipe));
+			     kmstest_pipe_name(display->pipes[data->pipe].pipe));
 	} else {
 		igt_assert(!"Unknown test type\n");
 	}
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 927c2315..e246dea5 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -293,6 +293,7 @@ static int paint_fb(int drm_fd, struct igt_fb *fb, const char *test_name,
 static void simple_lease(data_t *data)
 {
 	lease_t lease;
+	igt_display_t *display;
 
 	/* Create a valid lease */
 	igt_assert_eq(make_lease(data, &lease), 0);
@@ -302,9 +303,11 @@ static void simple_lease(data_t *data)
 	/* Set a mode on the leased output */
 	igt_assert_eq(0, prepare_crtc(&lease, data->connector_id, data->crtc_id));
 
+	display = &lease.display;
 	/* Paint something attractive */
 	paint_fb(lease.fd, &lease.primary_fb, "simple_lease",
-		 lease.mode->name, igt_output_name(lease.output), kmstest_pipe_name(data->pipe));
+		 lease.mode->name, igt_output_name(lease.output),
+		 kmstest_pipe_name(display->pipes[data->pipe].pipe));
 	igt_debug_wait_for_keypress("lease");
 	cleanup_crtc(&lease,
 		     connector_id_to_output(&lease.display, data->connector_id));
@@ -862,7 +865,7 @@ static void run_test(data_t *data, void (*testfunc)(data_t *))
 	for_each_pipe_with_valid_output(display, p, output) {
 		igt_info("Beginning %s on pipe %s, connector %s\n",
 			 igt_subtest_name(),
-			 kmstest_pipe_name(p),
+			 kmstest_pipe_name(display->pipes[p].pipe),
 			 igt_output_name(output));
 
 		data->pipe = p;
@@ -876,7 +879,7 @@ static void run_test(data_t *data, void (*testfunc)(data_t *))
 
 		igt_info("\n%s on pipe %s, connector %s: PASSED\n\n",
 			 igt_subtest_name(),
-			 kmstest_pipe_name(p),
+			 kmstest_pipe_name(display->pipes[p].pipe),
 			 igt_output_name(output));
 
 		valid_tests++;
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 9f0af59f..4dc1b2a0 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -73,7 +73,7 @@ static void test_read_crc(data_t *data, enum pipe pipe, unsigned flags)
 
 	igt_skip_on(pipe >= data->display.n_pipes);
 	igt_require_f(output, "No connector found for pipe %s\n",
-		      kmstest_pipe_name(pipe));
+		      kmstest_pipe_name(display->pipes[pipe].pipe));
 
 	igt_display_reset(display);
 	igt_output_set_pipe(output, pipe);
@@ -174,19 +174,22 @@ igt_main
 		test_bad_source(&data);
 
 	for_each_pipe_static(&data.display, pipe) {
-		igt_subtest_f("read-crc-pipe-%s", kmstest_pipe_name(pipe))
+		const char *pipe_name;
+
+		pipe_name = kmstest_pipe_name((&data.display)->pipes[pipe].pipe);
+		igt_subtest_f("read-crc-pipe-%s", pipe_name)
 			test_read_crc(&data, pipe, 0);
 
-		igt_subtest_f("read-crc-pipe-%s-frame-sequence", kmstest_pipe_name(pipe))
+		igt_subtest_f("read-crc-pipe-%s-frame-sequence", pipe_name)
 			test_read_crc(&data, pipe, TEST_SEQUENCE);
 
-		igt_subtest_f("nonblocking-crc-pipe-%s", kmstest_pipe_name(pipe))
+		igt_subtest_f("nonblocking-crc-pipe-%s", pipe_name)
 			test_read_crc(&data, pipe, TEST_NONBLOCK);
 
-		igt_subtest_f("nonblocking-crc-pipe-%s-frame-sequence", kmstest_pipe_name(pipe))
+		igt_subtest_f("nonblocking-crc-pipe-%s-frame-sequence", pipe_name)
 			test_read_crc(&data, pipe, TEST_SEQUENCE | TEST_NONBLOCK);
 
-		igt_subtest_f("suspend-read-crc-pipe-%s", kmstest_pipe_name(pipe)) {
+		igt_subtest_f("suspend-read-crc-pipe-%s", pipe_name) {
 			igt_skip_on(pipe >= data.display.n_pipes);
 
 			test_read_crc(&data, pipe, 0);
@@ -197,7 +200,7 @@ igt_main
 			test_read_crc(&data, pipe, 0);
 		}
 
-		igt_subtest_f("hang-read-crc-pipe-%s", kmstest_pipe_name(pipe)) {
+		igt_subtest_f("hang-read-crc-pipe-%s", pipe_name) {
 			igt_hang_t hang = igt_allow_hang(data.drm_fd, 0, 0);
 
 			test_read_crc(&data, pipe, 0);
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index d65b827d..e5ce666e 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -171,7 +171,8 @@ test_plane_position_with_output(data_t *data,
 	igt_crc_t crc, crc2;
 
 	igt_info("Testing connector %s using pipe %s plane %d\n",
-		 igt_output_name(output), kmstest_pipe_name(pipe), plane);
+		 igt_output_name(output),
+		 kmstest_pipe_name(data->display.pipes[pipe].pipe), plane);
 
 	igt_output_set_pipe(output, pipe);
 
@@ -307,7 +308,8 @@ test_plane_panning_with_output(data_t *data,
 	igt_crc_t crc;
 
 	igt_info("Testing connector %s using pipe %s plane %d\n",
-		 igt_output_name(output), kmstest_pipe_name(pipe), plane);
+		 igt_output_name(output),
+		 kmstest_pipe_name(data->display.pipes[pipe].pipe), plane);
 
 	igt_output_set_pipe(output, pipe);
 
@@ -659,7 +661,8 @@ static bool test_format_plane_colors(data_t *data, enum pipe pipe,
 
 	if (crc_mismatch_count)
 		igt_warn("CRC mismatches with format " IGT_FORMAT_FMT " on %s.%u with %d/%d solid colors tested (0x%X)\n",
-			 IGT_FORMAT_ARGS(format), kmstest_pipe_name(pipe),
+			 IGT_FORMAT_ARGS(format),
+			 kmstest_pipe_name(data->display.pipes[pipe].pipe),
 			 plane->index, crc_mismatch_count, data->num_colors, crc_mismatch_mask);
 
 	return result;
@@ -674,7 +677,7 @@ static bool test_format_plane_rgb(data_t *data, enum pipe pipe,
 {
 	igt_info("Testing format " IGT_FORMAT_FMT " / modifier 0x%" PRIx64 " on %s.%u\n",
 		 IGT_FORMAT_ARGS(format), modifier,
-		 kmstest_pipe_name(pipe), plane->index);
+		 kmstest_pipe_name(data->display.pipes[pipe].pipe), plane->index);
 
 	return test_format_plane_colors(data, pipe, plane,
 					format, modifier,
@@ -714,7 +717,7 @@ static bool test_format_plane_yuv(data_t *data, enum pipe pipe,
 				 IGT_FORMAT_ARGS(format), modifier,
 				 igt_color_encoding_to_str(e),
 				 igt_color_range_to_str(r),
-				 kmstest_pipe_name(pipe), plane->index);
+				 kmstest_pipe_name(data->display.pipes[pipe].pipe), plane->index);
 
 			result &= test_format_plane_colors(data, pipe, plane,
 							   format, modifier,
@@ -747,7 +750,8 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 	uint64_t width, height;
 	igt_crc_t ref_crc[ARRAY_SIZE(colors_extended)];
 	bool result = true;
-
+	const char *pipe_name =
+		kmstest_pipe_name(data->display.pipes[pipe].pipe);
 	/*
 	 * No clamping test for cursor plane
 	 */
@@ -773,13 +777,13 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 
 	igt_debug("Testing connector %s on %s plane %s.%u\n",
 		  igt_output_name(output), kmstest_plane_type_name(plane->type),
-		  kmstest_pipe_name(pipe), plane->index);
+		  pipe_name, plane->index);
 
 	igt_pipe_crc_start(data->pipe_crc);
 
 	igt_info("Testing format " IGT_FORMAT_FMT " / modifier 0x%" PRIx64 " on %s.%u\n",
 		 IGT_FORMAT_ARGS(format), modifier,
-		 kmstest_pipe_name(pipe), plane->index);
+		 pipe_name, plane->index);
 
 	if (data->display.is_atomic) {
 		struct igt_fb test_fb;
@@ -938,44 +942,46 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 static void
 run_tests_for_pipe_plane(data_t *data, enum pipe pipe)
 {
+	const char *pipe_name =
+		kmstest_pipe_name(data->display.pipes[pipe].pipe);
+
 	igt_fixture {
 		igt_skip_on(pipe >= data->display.n_pipes);
 		igt_require(data->display.pipes[pipe].n_planes > 0);
 	}
 
-	igt_subtest_f("pixel-format-pipe-%s-planes",
-		      kmstest_pipe_name(pipe))
+	igt_subtest_f("pixel-format-pipe-%s-planes", pipe_name)
 		test_pixel_formats(data, pipe);
 
 	igt_subtest_f("pixel-format-pipe-%s-planes-source-clamping",
-		      kmstest_pipe_name(pipe)) {
+		      pipe_name) {
 		data->crop = 4;
 		test_pixel_formats(data, pipe);
 	}
 
 	data->crop = 0;
 	igt_subtest_f("plane-position-covered-pipe-%s-planes",
-		      kmstest_pipe_name(pipe))
+		      pipe_name)
 		test_plane_position(data, pipe, TEST_POSITION_FULLY_COVERED);
 
 	igt_subtest_f("plane-position-hole-pipe-%s-planes",
-		      kmstest_pipe_name(pipe))
+		      pipe_name)
 		test_plane_position(data, pipe, 0);
 
 	igt_subtest_f("plane-position-hole-dpms-pipe-%s-planes",
-		      kmstest_pipe_name(pipe))
+		      pipe_name)
 		test_plane_position(data, pipe, TEST_DPMS);
 
 	igt_subtest_f("plane-panning-top-left-pipe-%s-planes",
-		      kmstest_pipe_name(pipe))
+		      pipe_name)
 		test_plane_panning(data, pipe, TEST_PANNING_TOP_LEFT);
 
 	igt_subtest_f("plane-panning-bottom-right-pipe-%s-planes",
-		      kmstest_pipe_name(pipe))
+		      pipe_name)
 		test_plane_panning(data, pipe, TEST_PANNING_BOTTOM_RIGHT);
 
 	igt_subtest_f("plane-panning-bottom-right-suspend-pipe-%s-planes",
-		      kmstest_pipe_name(pipe))
+		      pipe_name)
 		test_plane_panning(data, pipe, TEST_PANNING_BOTTOM_RIGHT |
 					       TEST_SUSPEND_RESUME);
 }
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 9bd00e94..35182d58 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -514,6 +514,9 @@ static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, bool blend,
 
 static void run_subtests(data_t *data, enum pipe pipe)
 {
+	const char *pipe_name;
+
+	pipe_name = kmstest_pipe_name((&data->display)->pipes[pipe].pipe);
 	igt_fixture {
 		bool found = false;
 		igt_plane_t *plane;
@@ -528,34 +531,34 @@ static void run_subtests(data_t *data, enum pipe pipe)
 		}
 
 		igt_require_f(found, "Found no plane on pipe %s with alpha blending supported\n",
-			      kmstest_pipe_name(pipe));
+			      pipe_name);
 	}
 
-	igt_subtest_f("pipe-%s-alpha-basic", kmstest_pipe_name(pipe))
+	igt_subtest_f("pipe-%s-alpha-basic", pipe_name)
 		run_test_on_pipe_planes(data, pipe, false, true, basic_alpha);
 
-	igt_subtest_f("pipe-%s-alpha-7efc", kmstest_pipe_name(pipe))
+	igt_subtest_f("pipe-%s-alpha-7efc", pipe_name)
 		run_test_on_pipe_planes(data, pipe, false, true, alpha_7efc);
 
-	igt_subtest_f("pipe-%s-coverage-7efc", kmstest_pipe_name(pipe))
+	igt_subtest_f("pipe-%s-coverage-7efc", pipe_name)
 		run_test_on_pipe_planes(data, pipe, true, true, coverage_7efc);
 
-	igt_subtest_f("pipe-%s-coverage-vs-premult-vs-constant", kmstest_pipe_name(pipe))
+	igt_subtest_f("pipe-%s-coverage-vs-premult-vs-constant", pipe_name)
 		run_test_on_pipe_planes(data, pipe, true, false, coverage_premult_constant);
 
-	igt_subtest_f("pipe-%s-alpha-transparant-fb", kmstest_pipe_name(pipe))
+	igt_subtest_f("pipe-%s-alpha-transparant-fb", pipe_name)
 		run_test_on_pipe_planes(data, pipe, false, false, argb_transparant);
 
-	igt_subtest_f("pipe-%s-alpha-opaque-fb", kmstest_pipe_name(pipe))
+	igt_subtest_f("pipe-%s-alpha-opaque-fb", pipe_name)
 		run_test_on_pipe_planes(data, pipe, false, false, argb_opaque);
 
-	igt_subtest_f("pipe-%s-constant-alpha-min", kmstest_pipe_name(pipe))
+	igt_subtest_f("pipe-%s-constant-alpha-min", pipe_name)
 		run_test_on_pipe_planes(data, pipe, true, false, constant_alpha_min);
 
-	igt_subtest_f("pipe-%s-constant-alpha-mid", kmstest_pipe_name(pipe))
+	igt_subtest_f("pipe-%s-constant-alpha-mid", pipe_name)
 		run_test_on_pipe_planes(data, pipe, true, false, constant_alpha_mid);
 
-	igt_subtest_f("pipe-%s-constant-alpha-max", kmstest_pipe_name(pipe))
+	igt_subtest_f("pipe-%s-constant-alpha-max", pipe_name)
 		run_test_on_pipe_planes(data, pipe, true, false, constant_alpha_max);
 }
 
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 91ba1513..74b305a6 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -316,22 +316,24 @@ igt_main
 		igt_display_require_output(&data.display);
 	}
 
-	for_each_pipe_static(&data.display, pipe)
+	for_each_pipe_static(&data.display, pipe) {
+		const char *pipe_name;
+
+		pipe_name = kmstest_pipe_name((&data.display)->pipes[pipe].pipe);
+
 		for (i = 0; i < ARRAY_SIZE(cursor_sizes); ++i) {
 			int size = cursor_sizes[i];
 
-			igt_subtest_f("pipe-%s-overlay-size-%d",
-				      kmstest_pipe_name(pipe), size)
+			igt_subtest_f("pipe-%s-overlay-size-%d", pipe_name, size)
 				test_cursor_overlay(&data, size, pipe);
 
-			igt_subtest_f("pipe-%s-primary-size-%d",
-				      kmstest_pipe_name(pipe), size)
+			igt_subtest_f("pipe-%s-primary-size-%d", pipe_name, size)
 				test_cursor_primary(&data, size, pipe);
 
-			igt_subtest_f("pipe-%s-viewport-size-%d",
-				      kmstest_pipe_name(pipe), size)
+			igt_subtest_f("pipe-%s-viewport-size-%d", pipe_name, size)
 				test_cursor_viewport(&data, size, pipe);
 		}
+	}
 
 	igt_fixture {
 		igt_display_fini(&data.display);
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index a31cad62..57c01a9a 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -268,7 +268,8 @@ test_planes_on_pipe(data_t *data, uint64_t modifier)
 	igt_require(data->output);
 
 	igt_info("Testing connector %s using pipe %s\n",
-		 igt_output_name(data->output), kmstest_pipe_name(data->pipe));
+		 igt_output_name(data->output),
+		 kmstest_pipe_name((&data->display)->pipes[data->pipe].pipe));
 
 	for_each_plane_on_pipe(&data->display, data->pipe, plane) {
 		data->output = igt_get_single_output_for_pipe(&data->display, data->pipe);
@@ -286,6 +287,7 @@ igt_main
 {
 	data_t data = {};
 	enum pipe pipe;
+	const char *pipe_name;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -301,16 +303,18 @@ igt_main
 
 	for_each_pipe_static(&data.display, pipe) {
 		data.pipe = pipe;
-		igt_subtest_f("pipe-%s-tiling-none", kmstest_pipe_name(pipe))
+		pipe_name = kmstest_pipe_name((&data.display)->pipes[pipe].pipe);
+
+		igt_subtest_f("pipe-%s-tiling-none", pipe_name)
 			test_planes_on_pipe(&data, LOCAL_DRM_FORMAT_MOD_NONE);
 
-		igt_subtest_f("pipe-%s-tiling-x", kmstest_pipe_name(pipe))
+		igt_subtest_f("pipe-%s-tiling-x", pipe_name)
 			test_planes_on_pipe(&data, LOCAL_I915_FORMAT_MOD_X_TILED);
 
-		igt_subtest_f("pipe-%s-tiling-y", kmstest_pipe_name(pipe))
+		igt_subtest_f("pipe-%s-tiling-y", pipe_name)
 			test_planes_on_pipe(&data, LOCAL_I915_FORMAT_MOD_Y_TILED);
 
-		igt_subtest_f("pipe-%s-tiling-yf", kmstest_pipe_name(pipe))
+		igt_subtest_f("pipe-%s-tiling-yf", pipe_name)
 			test_planes_on_pipe(&data, LOCAL_I915_FORMAT_MOD_Yf_TILED);
 	}
 
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 7954fef1..c651960d 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -327,7 +327,8 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 		c--;
 
 	igt_info("Testing connector %s using pipe %s with %d planes %s with seed %d\n",
-		 igt_output_name(output), kmstest_pipe_name(pipe), c,
+		 igt_output_name(output),
+		 kmstest_pipe_name(data->display.pipes[pipe].pipe), c,
 		 info, opt.seed);
 
 	i = 0;
@@ -376,21 +377,24 @@ test_plane_position(data_t *data, enum pipe pipe, uint64_t tiling)
 static void
 run_tests_for_pipe(data_t *data, enum pipe pipe)
 {
+	const char *pipe_name =
+		kmstest_pipe_name(data->display.pipes[pipe].pipe);
+
 	igt_fixture {
 		igt_skip_on(pipe >= data->display.n_pipes);
 		igt_require(data->display.pipes[pipe].n_planes > 0);
 	}
 
-	igt_subtest_f("atomic-pipe-%s-tiling-x", kmstest_pipe_name(pipe))
+	igt_subtest_f("atomic-pipe-%s-tiling-x", pipe_name)
 		test_plane_position(data, pipe, LOCAL_I915_FORMAT_MOD_X_TILED);
 
-	igt_subtest_f("atomic-pipe-%s-tiling-y", kmstest_pipe_name(pipe))
+	igt_subtest_f("atomic-pipe-%s-tiling-y", pipe_name)
 		test_plane_position(data, pipe, LOCAL_I915_FORMAT_MOD_Y_TILED);
 
-	igt_subtest_f("atomic-pipe-%s-tiling-yf", kmstest_pipe_name(pipe))
+	igt_subtest_f("atomic-pipe-%s-tiling-yf", pipe_name)
 		test_plane_position(data, pipe, LOCAL_I915_FORMAT_MOD_Yf_TILED);
 
-	igt_subtest_f("atomic-pipe-%s-tiling-none", kmstest_pipe_name(pipe))
+	igt_subtest_f("atomic-pipe-%s-tiling-none", pipe_name)
 		test_plane_position(data, pipe, LOCAL_DRM_FORMAT_MOD_NONE);
 }
 
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index d3a3ef61..b1c19ded 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -407,7 +407,8 @@ test_plane_scaling_on_pipe(data_t *d, enum pipe pipe, igt_output_t *output)
 						  DRM_PLANE_TYPE_OVERLAY, 0);
 
 	if (!d->plane2) {
-		igt_debug("Plane-2 doesnt exist on pipe %s\n", kmstest_pipe_name(pipe));
+		igt_debug("Plane-2 doesnt exist on pipe %s\n",
+				kmstest_pipe_name(display->pipes[pipe].pipe));
 		return;
 	}
 
@@ -451,7 +452,8 @@ test_plane_scaling_on_pipe(data_t *d, enum pipe pipe, igt_output_t *output)
 	d->plane3 = igt_pipe_get_plane_type_index(pipe_obj,
 						  DRM_PLANE_TYPE_OVERLAY, 1);
 	if(!d->plane3) {
-		igt_debug("Plane-3 doesnt exist on pipe %s\n", kmstest_pipe_name(pipe));
+		igt_debug("Plane-3 doesnt exist on pipe %s\n",
+				kmstest_pipe_name(display->pipes[pipe].pipe));
 		return;
 	}
 
@@ -702,6 +704,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 	for_each_pipe_static(&data.display, pipe) igt_subtest_group {
 		igt_output_t *output;
+		const char *pipe_name;
 
 		igt_fixture {
 			igt_display_require_output_on_pipe(&data.display, pipe);
@@ -709,19 +712,21 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			igt_require(get_num_scalers(&data, pipe) > 0);
 		}
 
-		igt_subtest_f("pipe-%s-plane-scaling", kmstest_pipe_name(pipe))
+		pipe_name = kmstest_pipe_name((&data.display)->pipes[pipe].pipe);
+
+		igt_subtest_f("pipe-%s-plane-scaling", pipe_name)
 			for_each_valid_output_on_pipe(&data.display, pipe, output)
 				test_plane_scaling_on_pipe(&data, pipe, output);
 
-		igt_subtest_f("pipe-%s-scaler-with-pixel-format", kmstest_pipe_name(pipe))
+		igt_subtest_f("pipe-%s-scaler-with-pixel-format", pipe_name)
 			for_each_valid_output_on_pipe(&data.display, pipe, output)
 				test_scaler_with_pixel_format_pipe(&data, pipe, output);
 
-		igt_subtest_f("pipe-%s-scaler-with-rotation", kmstest_pipe_name(pipe))
+		igt_subtest_f("pipe-%s-scaler-with-rotation", pipe_name)
 			for_each_valid_output_on_pipe(&data.display, pipe, output)
 				test_scaler_with_rotation_pipe(&data, pipe, output);
 
-		igt_subtest_f("pipe-%s-scaler-with-clipping-clamping", kmstest_pipe_name(pipe))
+		igt_subtest_f("pipe-%s-scaler-with-clipping-clamping", pipe_name)
 			for_each_valid_output_on_pipe(&data.display, pipe, output)
 				test_scaler_with_clipping_clamping_scenario(&data, pipe, output);
 	}
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 3241c514..287b13d1 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -76,7 +76,7 @@ static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
 	output = igt_get_single_output_for_pipe(display, pipe);
 
 	igt_require_f(output, "No connector found for pipe %s\n",
-		      kmstest_pipe_name(pipe));
+		      kmstest_pipe_name(display->pipes[pipe].pipe));
 
 	igt_display_reset(display);
 	igt_output_set_pipe(output, pipe);
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index b743f9d6..b02fda0c 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -192,7 +192,8 @@ static void run_plane_property_tests(igt_display_t *display, enum pipe pipe, igt
 
 	for_each_plane_on_pipe(display, pipe, plane) {
 		igt_info("Testing plane properties on %s.#%d-%s (output: %s)\n",
-			 kmstest_pipe_name(pipe), plane->index, kmstest_plane_type_name(plane->type), output->name);
+			 kmstest_pipe_name(display->pipes[pipe].pipe),
+			 plane->index, kmstest_plane_type_name(plane->type), output->name);
 
 		test_properties(display->drm_fd, DRM_MODE_OBJECT_PLANE, plane->drm_plane->plane_id, atomic);
 	}
@@ -206,7 +207,8 @@ static void run_crtc_property_tests(igt_display_t *display, enum pipe pipe, igt_
 
 	prepare_pipe(display, pipe, output, &fb);
 
-	igt_info("Testing crtc properties on %s (output: %s)\n", kmstest_pipe_name(pipe), output->name);
+	igt_info("Testing crtc properties on %s (output: %s)\n",
+			kmstest_pipe_name(display->pipes[pipe].pipe), output->name);
 
 	test_properties(display->drm_fd, DRM_MODE_OBJECT_CRTC, display->pipes[pipe].crtc_id, atomic);
 
@@ -220,7 +222,8 @@ static void run_connector_property_tests(igt_display_t *display, enum pipe pipe,
 	if (pipe != PIPE_NONE)
 		prepare_pipe(display, pipe, output, &fb);
 
-	igt_info("Testing connector properties on output %s (pipe: %s)\n", output->name, kmstest_pipe_name(pipe));
+	igt_info("Testing connector properties on output %s (pipe: %s)\n",
+			output->name, kmstest_pipe_name(display->pipes[pipe].pipe));
 
 	test_properties(display->drm_fd, DRM_MODE_OBJECT_CONNECTOR, output->id, atomic);
 
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 164eade8..d381756a 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -323,7 +323,8 @@ static void test_single_case(data_t *data, enum pipe pipe,
 	igt_crc_t crc_output;
 	int ret;
 
-	igt_debug("Testing case %i on pipe %s, format %s\n", rect, kmstest_pipe_name(pipe), igt_format_str(format));
+	igt_debug("Testing case %i on pipe %s, format %s\n", rect,
+			kmstest_pipe_name(display->pipes[pipe].pipe), igt_format_str(format));
 	prepare_fbs(data, output, plane, rect, format);
 
 	igt_plane_set_rotation(plane, data->rotation);
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index ff2d73cd..5508401e 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -170,7 +170,7 @@ static void run_test(data_t *data, int fd, void (*testfunc)(data_t *, int, int))
 
 		igt_info("Beginning %s on pipe %s, connector %s (%d threads)\n",
 			 igt_subtest_name(),
-			 kmstest_pipe_name(data->pipe),
+			 kmstest_pipe_name(display->pipes[data->pipe].pipe),
 			 igt_output_name(output),
 			 nchildren);
 
@@ -197,7 +197,7 @@ static void run_test(data_t *data, int fd, void (*testfunc)(data_t *, int, int))
 
 		igt_info("\n%s on pipe %s, connector %s: PASSED\n\n",
 			 igt_subtest_name(),
-			 kmstest_pipe_name(data->pipe),
+			 kmstest_pipe_name(display->pipes[data->pipe].pipe),
 			 igt_output_name(output));
 
 		/* cleanup what prepare_crtc() has done */
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index fefb15d9..772822c9 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -138,7 +138,7 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_skip_on(pipe >= display->n_pipes);
 
 	igt_info("Testing connector %s using pipe %s\n", igt_output_name(output),
-		 kmstest_pipe_name(pipe));
+		 kmstest_pipe_name(data->display.pipes[pipe].pipe));
 
 	functional_test_init(&test, output, pipe);
 
@@ -746,6 +746,7 @@ static void
 run_tests_for_pipe(data_t *data, enum pipe pipe)
 {
 	igt_output_t *output;
+	const char *pipe_name;
 
 	igt_fixture {
 		int valid_tests = 0;
@@ -758,28 +759,24 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 		igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
 	}
 
-	igt_subtest_f("universal-plane-pipe-%s-functional",
-		      kmstest_pipe_name(pipe))
+	pipe_name = kmstest_pipe_name(data->display.pipes[pipe].pipe);
+	igt_subtest_f("universal-plane-pipe-%s-functional", pipe_name)
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
 			functional_test_pipe(data, pipe, output);
 
-	igt_subtest_f("universal-plane-pipe-%s-sanity",
-		      kmstest_pipe_name(pipe))
+	igt_subtest_f("universal-plane-pipe-%s-sanity", pipe_name)
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
 			sanity_test_pipe(data, pipe, output);
 
-	igt_subtest_f("disable-primary-vs-flip-pipe-%s",
-		      kmstest_pipe_name(pipe))
+	igt_subtest_f("disable-primary-vs-flip-pipe-%s", pipe_name)
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
 			pageflip_test_pipe(data, pipe, output);
 
-	igt_subtest_f("cursor-fb-leak-pipe-%s",
-		      kmstest_pipe_name(pipe))
+	igt_subtest_f("cursor-fb-leak-pipe-%s", pipe_name)
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
 			cursor_leak_test_pipe(data, pipe, output);
 
-	igt_subtest_f("universal-plane-gen9-features-pipe-%s",
-		      kmstest_pipe_name(pipe))
+	igt_subtest_f("universal-plane-gen9-features-pipe-%s", pipe_name)
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
 			gen9_test_pipe(data, pipe, output);
 }
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 3cd57364..b75c97d8 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -124,7 +124,8 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
 		igt_require(igt_setup_runtime_pm(fd));
 
 	igt_info("Beginning %s on pipe %s, connector %s\n",
-		 igt_subtest_name(), kmstest_pipe_name(data->pipe),
+		 igt_subtest_name(),
+		 kmstest_pipe_name(display->pipes[data->pipe].pipe),
 		 igt_output_name(output));
 
 	if (!(data->flags & NOHANG))
@@ -163,7 +164,9 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
 		igt_post_hang_ring(fd, hang);
 
 	igt_info("\n%s on pipe %s, connector %s: PASSED\n\n",
-		 igt_subtest_name(), kmstest_pipe_name(data->pipe), igt_output_name(output));
+		 igt_subtest_name(),
+		 kmstest_pipe_name(display->pipes[data->pipe].pipe),
+		 igt_output_name(output));
 
 	/* cleanup what prepare_crtc() has done */
 	cleanup_crtc(data, fd, output);
@@ -440,7 +443,7 @@ static void run_subtests_for_pipe(data_t *data)
 				continue;
 
 			igt_subtest_f("pipe-%s-%s-%s",
-				      kmstest_pipe_name(data->pipe),
+				      kmstest_pipe_name(data->display.pipes[data->pipe].pipe),
 				      f->name, m->name) {
 				for_each_valid_output_on_pipe(&data->display, data->pipe, data->output) {
 					data->flags = m->flags | NOHANG;
@@ -453,7 +456,7 @@ static void run_subtests_for_pipe(data_t *data)
 				continue;
 
 			igt_subtest_f("pipe-%s-%s-%s-hang",
-				      kmstest_pipe_name(data->pipe),
+				      kmstest_pipe_name(data->display.pipes[data->pipe].pipe),
 				      f->name, m->name) {
 				igt_hang_t hang;
 
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
