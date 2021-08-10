Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901FF89FA5
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 12:00:19 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Tue, 10 Aug 2021 17:30:38 +0530
Message-Id: <20210810120038.339259-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_busy: Limit the execution to
 single connector
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, Karthik B S <karthik.b.s@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

As part of reducing the CI time, we restricted the execution
to two pipes (first & last), which also introduced running the
tests on all connectors.

	commit 030c28d099a5c6793c92e2b22c8e9abd3d340fdc
	tests/kms_busy: Limit the execution to two pipes

With that change in multi-display configuration, we run the test
multiple times on the same pipe with different connectors, which
increases the CI time.

This patch will fix the logic to run the tests on a single
connector only.

V2:
* Fix the crash in no-display configs

Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_busy.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/tests/kms_busy.c b/tests/kms_busy.c
index a60ff6b05..19ac36b40 100644
--- a/tests/kms_busy.c
+++ b/tests/kms_busy.c
@@ -40,6 +40,7 @@ set_fb_on_crtc(igt_display_t *dpy, int pipe, struct igt_fb *fb)
 	igt_output_t *output;

 	output = igt_get_single_output_for_pipe(dpy, pipe);
+	igt_require(output);

 	igt_output_set_pipe(output, pipe);
 	mode = igt_output_get_mode(output);
@@ -336,6 +337,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)

 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&display, fd);
+		igt_display_require_output(&display);

 		/* Get active pipes. */
 		for_each_pipe(&display, pipe)
@@ -348,9 +350,8 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_describe("Test for basic check of KMS ABI with busy framebuffers.");
 	igt_subtest_with_dynamic("basic") { /* just run on the first pipe */
 		enum pipe pipe;
-		igt_output_t *output;

-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe(&display, pipe) {
 			igt_dynamic("flip")
 				test_flip(&display, pipe, false);
 			igt_dynamic("modeset")
@@ -361,11 +362,10 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)

 	igt_subtest_with_dynamic("basic-hang") {
 		enum pipe pipe;
-		igt_output_t *output;
 		igt_hang_t hang = igt_allow_hang(display.drm_fd, 0, 0);
 		errno = 0;

-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe(&display, pipe) {
 			if (!all_pipes && pipe != active_pipes[0] &&
 					  pipe != active_pipes[last_pipe])
 				continue;
@@ -381,11 +381,10 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)

 	igt_subtest_with_dynamic("extended-pageflip-modeset-hang-oldfb") {
 		enum pipe pipe;
-		igt_output_t *output;
 		igt_hang_t hang = igt_allow_hang(display.drm_fd, 0, 0);
 		errno = 0;

-		for_each_pipe_with_valid_output(&display, pipe, output) {
+		for_each_pipe(&display, pipe) {
 			if (!all_pipes && pipe != active_pipes[0] &&
 					  pipe != active_pipes[last_pipe])
 				continue;
@@ -400,14 +399,13 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	for (i = 0; i < sizeof(tests) / sizeof (tests[0]); i++) {
 		igt_subtest_with_dynamic(tests[i].name) {
 			enum pipe pipe;
-			igt_output_t *output;
 			igt_hang_t hang;
 			errno = 0;

 			igt_require(display.is_atomic);
 			hang = igt_allow_hang(display.drm_fd, 0, 0);

-			for_each_pipe_with_valid_output(&display, pipe, output) {
+			for_each_pipe(&display, pipe) {
 				if (!all_pipes && pipe != active_pipes[0] &&
 						  pipe != active_pipes[last_pipe])
 					continue;
--
2.32.0
