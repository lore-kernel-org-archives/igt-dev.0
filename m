Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765116E23B
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Mar 2021 12:56:57 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Thu, 11 Mar 2021 02:19:18 +0530
Message-Id: <20210310204918.7072-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [v2 i-g-t] tests/kms_busy: Limit the execution to two
 pipes
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
Cc: Latvala Petri <petri.latvala@intel.com>, Kunche Kishore <kishore.kunche@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

As all pipes are symmetric, restrict the execution to two pipes
can save lot of CI time.

If we want to execute on all pipes, we need to pass an extra
argument "-e" indicates extended.

Example: ./build/tests/kms_busy -e --r basic

V2:
* Fix the typo in args handler (Petri)

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Latvala Petri <petri.latvala@intel.com>
Cc: Kunche Kishore <kishore.kunche@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_busy.c | 138 ++++++++++++++++++++++++++---------------------
 1 file changed, 77 insertions(+), 61 deletions(-)

diff --git a/tests/kms_busy.c b/tests/kms_busy.c
index df1f8e11a..f87483785 100644
--- a/tests/kms_busy.c
+++ b/tests/kms_busy.c
@@ -30,6 +30,15 @@
 
 IGT_TEST_DESCRIPTION("Basic check of KMS ABI with busy framebuffers.");
 
+/* restricted pipe count */
+#define CRTC_RESTRICT_CNT 2
+
+static bool all_pipes = false;
+
+#define for_each_pipe_with_valid_output_limited(display, pipe, output, pipe_count) \
+	for_each_pipe_with_valid_output(display, pipe, output) \
+			for_each_if(pipe_count-- > 0)
+
 static igt_output_t *
 set_fb_on_crtc(igt_display_t *dpy, int pipe, struct igt_fb *fb)
 {
@@ -287,10 +296,41 @@ static void test_pageflip_modeset_hang(igt_display_t *dpy, enum pipe pipe)
 	igt_remove_fb(dpy->drm_fd, &fb);
 }
 
-igt_main
+static int opt_handler(int opt, int opt_index, void *data)
+{
+	switch (opt) {
+		case 'e':
+			all_pipes = true;
+			break;
+		default:
+			return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+const char *help_str =
+	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n";
+
+igt_main_args("e:", NULL, help_str, opt_handler, NULL)
 {
 	igt_display_t display = { .drm_fd = -1, .n_pipes = IGT_MAX_PIPES };
-	enum pipe n;
+
+	int crtc_count;
+	int i;
+	struct {
+		const char *name;
+		bool modeset;
+		bool hang_newfb;
+		bool reset;
+	} tests[] = {
+		{ "extended-pageflip-hang-oldfb", false, false, false },
+		{ "extended-pageflip-hang-newfb", false, true, false },
+		{ "extended-modeset-hang-oldfb", true, false, false },
+		{ "extended-modeset-hang-newfb", true, true, false },
+		{ "extended-modeset-hang-oldfb-with-reset", true, false, true },
+		{ "extended-modeset-hang-newfb-with-reset", true, true, true },
+	};
 
 	igt_fixture {
 		int fd = drm_open_driver_master(DRIVER_INTEL);
@@ -305,84 +345,60 @@ igt_main
 
 	/* XXX Extend to cover atomic rendering tests to all planes + legacy */
 
-	igt_subtest_with_dynamic("basic") { /* just run on the first pipe */
+	igt_subtest_with_dynamic("basic") {
 		enum pipe pipe;
 		igt_output_t *output;
+		crtc_count = (all_pipes)? display.n_pipes : CRTC_RESTRICT_CNT;
 
-		for_each_pipe_with_valid_output(&display, pipe, output) {
-			igt_dynamic("flip")
+		for_each_pipe_with_valid_output_limited(&display, pipe, output, crtc_count) {
+			igt_dynamic_f("flip-pipe-%s", kmstest_pipe_name(pipe))
 				test_flip(&display, pipe, false);
-			igt_dynamic("modeset")
+			igt_dynamic_f("modeset-pipe-%s", kmstest_pipe_name(pipe))
 				test_flip(&display, pipe, true);
-			break;
 		}
 	}
 
-	for_each_pipe_static(n) igt_subtest_group {
-		igt_hang_t hang;
-
-		errno = 0;
-
-		igt_fixture {
-			igt_display_require_output_on_pipe(&display, n);
-		}
-
-		igt_subtest_f("basic-flip-pipe-%s", kmstest_pipe_name(n)) {
-			test_flip(&display, n, false);
-		}
-		igt_subtest_f("basic-modeset-pipe-%s", kmstest_pipe_name(n)) {
+	igt_subtest_with_dynamic("extended-pageflip-modeset-hang-oldfb") {
+		enum pipe pipe;
+		igt_output_t *output;
+		crtc_count = (all_pipes)? display.n_pipes : CRTC_RESTRICT_CNT;
 
-			test_flip(&display, n, true);
-		}
+		for_each_pipe_with_valid_output_limited(&display, pipe, output, crtc_count) {
+			igt_hang_t hang = igt_allow_hang(display.drm_fd, 0, 0);
+			errno = 0;
 
-		igt_fixture {
-			hang = igt_allow_hang(display.drm_fd, 0, 0);
-		}
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+				test_pageflip_modeset_hang(&display, pipe);
 
-		igt_subtest_f("extended-pageflip-modeset-hang-oldfb-pipe-%s",
-			      kmstest_pipe_name(n)) {
-			test_pageflip_modeset_hang(&display, n);
+			igt_disallow_hang(display.drm_fd, hang);
 		}
+	}
 
-		igt_fixture
-			igt_require(display.is_atomic);
-
-		igt_subtest_f("extended-pageflip-hang-oldfb-pipe-%s",
-			      kmstest_pipe_name(n))
-			test_hang(&display, n, false, false);
-
-		igt_subtest_f("extended-pageflip-hang-newfb-pipe-%s",
-			      kmstest_pipe_name(n))
-			test_hang(&display, n, false, true);
-
-		igt_subtest_f("extended-modeset-hang-oldfb-pipe-%s",
-			      kmstest_pipe_name(n))
-			test_hang(&display, n, true, false);
-
-		igt_subtest_f("extended-modeset-hang-newfb-pipe-%s",
-			      kmstest_pipe_name(n))
-			test_hang(&display, n, true, true);
+	for (i = 0; i < sizeof(tests) / sizeof (tests[0]); i++) {
+		igt_subtest_with_dynamic(tests[i].name) {
+			enum pipe pipe;
+			igt_output_t *output;
+			crtc_count = (all_pipes)? display.n_pipes : CRTC_RESTRICT_CNT;
 
-		igt_subtest_f("extended-modeset-hang-oldfb-with-reset-pipe-%s",
-			      kmstest_pipe_name(n)) {
-			igt_set_module_param_int(display.drm_fd, "force_reset_modeset_test", 1);
+			for_each_pipe_with_valid_output_limited(&display, pipe, output, crtc_count) {
+				igt_hang_t hang;
+				errno = 0;
 
-			test_hang(&display, n, true, false);
+				igt_require(display.is_atomic);
+				hang = igt_allow_hang(display.drm_fd, 0, 0);
 
-			igt_set_module_param_int(display.drm_fd, "force_reset_modeset_test", 0);
-		}
+				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+					if (tests[i].reset)
+						igt_set_module_param_int(display.drm_fd, "force_reset_modeset_test", 1);
 
-		igt_subtest_f("extended-modeset-hang-newfb-with-reset-pipe-%s",
-			      kmstest_pipe_name(n)) {
-			igt_set_module_param_int(display.drm_fd, "force_reset_modeset_test", 1);
+					test_hang(&display, pipe, tests[i].modeset, tests[i].hang_newfb);
 
-			test_hang(&display, n, true, true);
+					if (tests[i].reset)
+						igt_set_module_param_int(display.drm_fd, "force_reset_modeset_test", 0);
+				}
 
-			igt_set_module_param_int(display.drm_fd, "force_reset_modeset_test", 0);
-		}
-
-		igt_fixture {
-			igt_disallow_hang(display.drm_fd, hang);
+				igt_disallow_hang(display.drm_fd, hang);
+			}
 		}
 	}
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
