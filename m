Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE2698D48
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:54 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:56 +0530
Message-Id: <20220814180908.2553394-40-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 39/51] tests/i915/kms_busy: Add support for
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

This patch will add a check to Skip the subtest if a selected pipe/output
combo won't support Bigjoiner or 8K mode.

Example:
* Pipe-D wont support a mode > 5K
* To use 8K mode on a pipe then consecutive pipe must be available & free.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_busy.c | 104 ++++++++++++++++++++++++++++--------------
 1 file changed, 70 insertions(+), 34 deletions(-)

diff --git a/tests/i915/kms_busy.c b/tests/i915/kms_busy.c
index 99a07c2a..15642b99 100644
--- a/tests/i915/kms_busy.c
+++ b/tests/i915/kms_busy.c
@@ -32,15 +32,12 @@ IGT_TEST_DESCRIPTION("Basic check of KMS ABI with busy framebuffers.");
 
 static bool all_pipes = false;
 
-static igt_output_t *
-set_fb_on_crtc(igt_display_t *dpy, int pipe, struct igt_fb *fb)
+static void
+set_fb_on_crtc(igt_display_t *dpy, int pipe,
+	       igt_output_t *output, struct igt_fb *fb)
 {
 	drmModeModeInfoPtr mode;
 	igt_plane_t *primary;
-	igt_output_t *output;
-
-	output = igt_get_single_output_for_pipe(dpy, pipe);
-	igt_require(output);
 
 	igt_output_set_pipe(output, pipe);
 	mode = igt_output_get_mode(output);
@@ -51,8 +48,6 @@ set_fb_on_crtc(igt_display_t *dpy, int pipe, struct igt_fb *fb)
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, fb);
-
-	return output;
 }
 
 static void do_cleanup_display(igt_display_t *dpy)
@@ -136,18 +131,23 @@ static void flip_to_fb(igt_display_t *dpy, int pipe,
 	put_ahnd(ahnd);
 }
 
-static void test_flip(igt_display_t *dpy, int pipe, bool modeset)
+static void test_flip(igt_display_t *dpy, int pipe,
+		      igt_output_t *output, bool modeset)
 {
 	struct igt_fb fb[2];
 	int warmup[] = { 0, 1, 0, -1 };
 	struct timespec tv = {};
-	igt_output_t *output;
 	int timeout;
 
 	if (modeset)
 		igt_require(dpy->is_atomic);
 
-	output = set_fb_on_crtc(dpy, pipe, &fb[0]);
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
+	igt_display_reset(dpy);
+
+	set_fb_on_crtc(dpy, pipe, output, &fb[0]);
 	igt_display_commit2(dpy, COMMIT_LEGACY);
 
 	igt_create_pattern_fb(dpy->drm_fd,
@@ -224,13 +224,18 @@ static void test_atomic_commit_hang(igt_display_t *dpy, igt_plane_t *primary,
 }
 
 static void test_hang(igt_display_t *dpy,
-		      enum pipe pipe, bool modeset, bool hang_newfb)
+		      enum pipe pipe, igt_output_t *output,
+		      bool modeset, bool hang_newfb)
 {
 	struct igt_fb fb[2];
-	igt_output_t *output;
 	igt_plane_t *primary;
 
-	output = set_fb_on_crtc(dpy, pipe, &fb[0]);
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
+	igt_display_reset(dpy);
+
+	set_fb_on_crtc(dpy, pipe, output, &fb[0]);
 	igt_display_commit2(dpy, COMMIT_ATOMIC);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
@@ -265,16 +270,22 @@ static void test_hang(igt_display_t *dpy,
 	igt_remove_fb(dpy->drm_fd, &fb[0]);
 }
 
-static void test_pageflip_modeset_hang(igt_display_t *dpy, enum pipe pipe)
+static void
+test_pageflip_modeset_hang(igt_display_t *dpy,
+			   igt_output_t *output, enum pipe pipe)
 {
 	struct igt_fb fb;
 	struct drm_event_vblank ev;
-	igt_output_t *output;
 	igt_plane_t *primary;
 	igt_spin_t *t;
 	uint64_t ahnd = get_reloc_ahnd(dpy->drm_fd, 0);
 
-	output = set_fb_on_crtc(dpy, pipe, &fb);
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
+	igt_display_reset(dpy);
+
+	set_fb_on_crtc(dpy, pipe, output, &fb);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
 	igt_display_commit2(dpy, dpy->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
@@ -299,6 +310,21 @@ static void test_pageflip_modeset_hang(igt_display_t *dpy, enum pipe pipe)
 	igt_remove_fb(dpy->drm_fd, &fb);
 }
 
+static bool
+is_valid_combo(igt_display_t *dpy, igt_output_t *output, enum pipe pipe)
+{
+	bool ret = true;
+
+	igt_display_reset(dpy);
+
+	igt_output_set_pipe(output, pipe);
+	if (!igt_test_constraint(dpy))
+		ret = false;
+	igt_output_set_pipe(output, PIPE_NONE);
+
+	return ret;
+}
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	switch (opt) {
@@ -319,7 +345,8 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
 	igt_display_t display = { .drm_fd = -1, .n_pipes = IGT_MAX_PIPES };
 
-	enum pipe active_pipes[IGT_MAX_PIPES];
+	enum pipe pipe, active_pipes[IGT_MAX_PIPES];
+	igt_output_t *output;
 	uint32_t last_pipe = 0;
 	int i;
 	struct {
@@ -338,7 +365,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		int fd = drm_open_driver_master(DRIVER_INTEL);
-		enum pipe pipe;
 
 		igt_require_gem(fd);
 		gem_require_mmap_device_coherent(fd);
@@ -358,63 +384,72 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 	igt_describe("Test for basic check of KMS ABI with busy framebuffers.");
 	igt_subtest_with_dynamic("basic") { /* just run on the first pipe */
-		enum pipe pipe;
+		for_each_pipe_with_single_output(&display, pipe, output) {
+			if (!is_valid_combo(&display, output, pipe))
+				continue;
 
-		for_each_pipe(&display, pipe) {
 			igt_dynamic("flip")
-				test_flip(&display, pipe, false);
+				test_flip(&display, pipe, output, false);
 			igt_dynamic("modeset")
-				test_flip(&display, pipe, true);
+				test_flip(&display, pipe, output, true);
 			break;
 		}
 	}
 
 	igt_subtest_with_dynamic("basic-hang") {
-		enum pipe pipe;
 		igt_hang_t hang = igt_allow_hang(display.drm_fd, 0, 0);
 		errno = 0;
 
-		for_each_pipe(&display, pipe) {
+		for_each_pipe_with_single_output(&display, pipe, output) {
+			if (!is_valid_combo(&display, output, pipe))
+				continue;
+
 			if (!all_pipes && pipe != active_pipes[0] &&
 					  pipe != active_pipes[last_pipe])
 				continue;
 
 			igt_dynamic_f("flip-pipe-%s", kmstest_pipe_name(pipe))
-				test_flip(&display, pipe, false);
+				test_flip(&display, pipe, output, false);
 			igt_dynamic_f("modeset-pipe-%s", kmstest_pipe_name(pipe))
-				test_flip(&display, pipe, true);
+				test_flip(&display, pipe, output, true);
 		}
 
 		igt_disallow_hang(display.drm_fd, hang);
 	}
 
 	igt_subtest_with_dynamic("extended-pageflip-modeset-hang-oldfb") {
-		enum pipe pipe;
 		igt_hang_t hang = igt_allow_hang(display.drm_fd, 0, 0);
 		errno = 0;
 
-		for_each_pipe(&display, pipe) {
+		for_each_pipe_with_single_output(&display, pipe, output) {
+			if (!is_valid_combo(&display, output, pipe))
+				continue;
+
 			if (!all_pipes && pipe != active_pipes[0] &&
 					  pipe != active_pipes[last_pipe])
 				continue;
 
 			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
-				test_pageflip_modeset_hang(&display, pipe);
+				test_pageflip_modeset_hang(&display, output, pipe);
 		}
 
 		igt_disallow_hang(display.drm_fd, hang);
 	}
 
 	for (i = 0; i < sizeof(tests) / sizeof (tests[0]); i++) {
+		igt_fixture
+			igt_require(display.is_atomic);
+
 		igt_subtest_with_dynamic(tests[i].name) {
-			enum pipe pipe;
 			igt_hang_t hang;
 			errno = 0;
 
-			igt_require(display.is_atomic);
 			hang = igt_allow_hang(display.drm_fd, 0, 0);
 
-			for_each_pipe(&display, pipe) {
+			for_each_pipe_with_single_output(&display, pipe, output) {
+				if (!is_valid_combo(&display, output, pipe))
+					continue;
+
 				if (!all_pipes && pipe != active_pipes[0] &&
 						  pipe != active_pipes[last_pipe])
 					continue;
@@ -423,7 +458,8 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 					if (tests[i].reset)
 						igt_set_module_param_int(display.drm_fd, "force_reset_modeset_test", 1);
 
-					test_hang(&display, pipe, tests[i].modeset, tests[i].hang_newfb);
+					test_hang(&display, pipe, output,
+						  tests[i].modeset, tests[i].hang_newfb);
 
 					if (tests[i].reset)
 						igt_set_module_param_int(display.drm_fd, "force_reset_modeset_test", 0);
-- 
2.35.1
