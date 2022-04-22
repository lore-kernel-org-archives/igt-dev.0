Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73E710E54A
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 15:18:46 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 22 Apr 2022 20:50:48 +0530
Message-Id: <20220422152050.20386-3-nidhi1.gupta@intel.com>
In-Reply-To: <20220422152050.20386-1-nidhi1.gupta@intel.com>
References: <20220422152050.20386-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms : Added dynamic test cases
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Modified kms_sequence and kms_concurrent to include
dynamic test cases.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_concurrent.c |  6 ++-
 tests/kms_sequence.c   | 88 +++++++++++++++++++++---------------------
 2 files changed, 48 insertions(+), 46 deletions(-)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 622d3335..82b2021e 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -328,9 +328,11 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 
 	igt_describe("Test atomic mode setting concurrently with multiple planes and screen "
 		     "resolution.");
-	igt_subtest_f("pipe-%s", kmstest_pipe_name(pipe))
+	igt_subtest_with_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
-			run_test(data, pipe, output);
+			igt_dynamic_f("%s", igt_output_name(output))
+				run_test(data, pipe, output);
+	}
 }
 
 static int opt_handler(int option, int option_index, void *input)
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index ca25e041..1655d7d1 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -140,54 +140,45 @@ static void run_test(data_t *data, int fd, void (*testfunc)(data_t *, int, int))
 {
 	int nchildren =
 		data->flags & FORKED ? sysconf(_SC_NPROCESSORS_ONLN) : 1;
-	igt_display_t *display = &data->display;
-	igt_output_t *output;
-	enum pipe p;
-	unsigned int valid_tests = 0;
-
-	for_each_pipe_with_valid_output(display, p, output) {
-		data->pipe = p;
-		prepare_crtc(data, fd, output);
-
-		igt_info("Beginning %s on pipe %s, connector %s (%d threads)\n",
-			 igt_subtest_name(),
-			 kmstest_pipe_name(data->pipe),
-			 igt_output_name(output),
-			 nchildren);
-
-		if (data->flags & BUSY) {
-			struct drm_crtc_queue_sequence cqs;
-
-			memset(&cqs, 0, sizeof(cqs));
-			cqs.crtc_id = data->crtc_id;
-			cqs.flags = DRM_CRTC_SEQUENCE_RELATIVE;
-			cqs.sequence = 120 + 12;
-			igt_assert_eq(crtc_queue_sequence(fd, &cqs), 0);
-		}
+	igt_output_t *output = data->output;
 
-		igt_fork(child, nchildren)
-			testfunc(data, fd, nchildren);
-		igt_waitchildren();
+	prepare_crtc(data, fd, output);
 
-		if (data->flags & BUSY) {
-			struct drm_event_vblank buf;
-			igt_assert_eq(read(fd, &buf, sizeof(buf)), sizeof(buf));
-		}
+	igt_info("Beginning %s on pipe %s, connector %s (%d threads)\n",
+		 igt_subtest_name(),
+		 kmstest_pipe_name(data->pipe),
+		 igt_output_name(output),
+		 nchildren);
 
-		igt_assert(poll(&(struct pollfd){fd, POLLIN}, 1, 0) == 0);
+	if (data->flags & BUSY) {
+		struct drm_crtc_queue_sequence cqs;
 
-		igt_info("\n%s on pipe %s, connector %s: PASSED\n\n",
-			 igt_subtest_name(),
-			 kmstest_pipe_name(data->pipe),
-			 igt_output_name(output));
+		memset(&cqs, 0, sizeof(cqs));
+		cqs.crtc_id = data->crtc_id;
+		cqs.flags = DRM_CRTC_SEQUENCE_RELATIVE;
+		cqs.sequence = 120 + 12;
+		igt_assert_eq(crtc_queue_sequence(fd, &cqs), 0);
+	}
+
+	igt_fork(child, nchildren)
+	testfunc(data, fd, nchildren);
+	igt_waitchildren();
 
-		/* cleanup what prepare_crtc() has done */
-		cleanup_crtc(data, fd, output);
-		valid_tests++;
+	if (data->flags & BUSY) {
+		struct drm_event_vblank buf;
+
+		igt_assert_eq(read(fd, &buf, sizeof(buf)), sizeof(buf));
 	}
 
-	igt_require_f(valid_tests,
-		      "no valid crtc/connector combinations found\n");
+	igt_assert(poll(&(struct pollfd){fd, POLLIN}, 1, 0) == 0);
+
+	igt_info("\n%s on pipe %s, connector %s: PASSED\n\n",
+		 igt_subtest_name(),
+		 kmstest_pipe_name(data->pipe),
+		 igt_output_name(output));
+
+	/* cleanup what prepare_crtc() has done */
+	cleanup_crtc(data, fd, output);
 }
 
 static void sequence_get(data_t *data, int fd, int nchildren)
@@ -255,6 +246,8 @@ static void sequence_queue(data_t *data, int fd, int nchildren)
 igt_main
 {
 	int fd;
+	igt_output_t *output;
+	enum pipe p;
 	data_t data;
 	const struct {
 		const char *name;
@@ -280,6 +273,7 @@ igt_main
 		fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, fd);
+		igt_display_require_output(&data.display);
 	}
 
 	for (f = funcs; f->name; f++) {
@@ -289,9 +283,15 @@ igt_main
 
 			igt_describe("This is a test of drmCrtcGetSequence and "
 				     "drmCrtcQueueSequence");
-			igt_subtest_f("%s-%s", f->name, m->name) {
-				data.flags = m->flags;
-				run_test(&data, fd, f->func);
+			igt_subtest_with_dynamic_f("%s-%s", f->name, m->name) {
+				for_each_pipe_with_valid_output(&data.display, p, output) {
+					igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(p)) {
+						data.pipe = p;
+						data.output = output;
+						data.flags = m->flags;
+						run_test(&data, fd, f->func);
+					}
+				}
 			}
 		}
 	}
-- 
2.26.2
