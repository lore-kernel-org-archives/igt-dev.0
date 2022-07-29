Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F70C8D664
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Jul 2022 15:52:59 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 29 Jul 2022 21:24:05 +0530
Message-Id: <20220729155405.23029-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms: Tests sanitization
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

At the beginning of the test we need to reset and
set the pipe output to NULL so that the CRTCs are freed
and then set CRTC. Most of the i-g-t have igt_display_reset()
which is resetting basic pipes, connectors and planes to
default values; however we are not committing those changes.
In this patch, have made those changes which help in sanitizing
system state before starting the subtest.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/gem_exec_reloc.c      |  1 +
 tests/i915/kms_busy.c            |  3 +++
 tests/i915/kms_fence_pin_leak.c  |  3 +++
 tests/i915/kms_legacy_colorkey.c |  2 ++
 tests/i915/kms_mmap_write_crc.c  |  2 +-
 tests/i915/kms_pwrite_crc.c      |  3 +++
 tests/kms_color.c                |  5 +++++
 tests/kms_content_protection.c   |  6 ++++++
 tests/kms_cursor_crc.c           |  1 +
 tests/kms_flip_event_leak.c      |  3 +++
 tests/kms_lease.c                |  3 +++
 tests/kms_pipe_crc_basic.c       |  5 +++++
 tests/kms_plane.c                |  1 +
 tests/kms_prime.c                |  1 +
 tests/kms_sequence.c             |  1 +
 tests/kms_vblank.c               |  1 +
 tests/prime_mmap_kms.c           |  3 +++
 18 files changed, 64 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index 1f5d13e4e..7382bbe56 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -927,6 +927,7 @@ static void scanout(int i915,
 	uint64_t *map;
 
 	igt_display_reset(dpy);
+	igt_display_commit(dpy);
 
 	output = igt_get_single_output_for_pipe(dpy, PIPE_A);
 	igt_require(output);
diff --git a/tests/i915/kms_busy.c b/tests/i915/kms_busy.c
index 99a07c2ae..d7f0f0144 100644
--- a/tests/i915/kms_busy.c
+++ b/tests/i915/kms_busy.c
@@ -39,6 +39,9 @@ set_fb_on_crtc(igt_display_t *dpy, int pipe, struct igt_fb *fb)
 	igt_plane_t *primary;
 	igt_output_t *output;
 
+	igt_display_reset(dpy);
+	igt_display_commit(dpy);
+
 	output = igt_get_single_output_for_pipe(dpy, pipe);
 	igt_require(output);
 
diff --git a/tests/i915/kms_fence_pin_leak.c b/tests/i915/kms_fence_pin_leak.c
index 16eb595fd..68574081f 100644
--- a/tests/i915/kms_fence_pin_leak.c
+++ b/tests/i915/kms_fence_pin_leak.c
@@ -195,6 +195,9 @@ static void run_test(data_t *data)
 	igt_output_t *output;
 	enum pipe p;
 
+	igt_display_reset(display);
+	igt_display_commit(display);
+
 	for_each_pipe_with_valid_output(display, p, output) {
 		run_single_test(data, p, output);
 
diff --git a/tests/i915/kms_legacy_colorkey.c b/tests/i915/kms_legacy_colorkey.c
index 5b2fd64ba..0fe250ed1 100644
--- a/tests/i915/kms_legacy_colorkey.c
+++ b/tests/i915/kms_legacy_colorkey.c
@@ -63,6 +63,8 @@ igt_main
 		     "only works for sprite planes.\n");
 	igt_subtest_with_dynamic("basic") {
 		for_each_pipe(&display, p) {
+			igt_display_reset(&display);
+			igt_display_commit(&display);
 			igt_dynamic_f("pipe-%s", kmstest_pipe_name(p)) {
 				for_each_plane_on_pipe(&display, p, plane) {
 					bool is_valid = (plane->type == DRM_PLANE_TYPE_PRIMARY ||
diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
index a57938b5b..129ad1a1c 100644
--- a/tests/i915/kms_mmap_write_crc.c
+++ b/tests/i915/kms_mmap_write_crc.c
@@ -173,6 +173,7 @@ static void prepare_crtc(data_t *data)
 	drmModeModeInfo *mode;
 
 	igt_display_reset(display);
+	igt_display_commit(display);
 
 	/* select the pipe we want to use */
 	igt_output_set_pipe(output, data->pipe);
@@ -273,7 +274,6 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
 	}
 
 	igt_describe("Tests that caching mode has become UC/WT and flushed using mmap write");
-
 	igt_subtest_with_dynamic("main") {
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
diff --git a/tests/i915/kms_pwrite_crc.c b/tests/i915/kms_pwrite_crc.c
index 584e6a19c..41b233dac 100644
--- a/tests/i915/kms_pwrite_crc.c
+++ b/tests/i915/kms_pwrite_crc.c
@@ -110,6 +110,9 @@ static void prepare_crtc(data_t *data)
 	igt_output_t *output = data->output;
 	drmModeModeInfo *mode;
 
+	igt_display_reset(display);
+	igt_display_commit(display);
+
 	/* select the pipe we want to use */
 	igt_output_set_pipe(output, data->pipe);
 
diff --git a/tests/kms_color.c b/tests/kms_color.c
index c202547e5..764c44e59 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -700,6 +700,7 @@ static void test_setup(data_t *data, enum pipe p)
 	igt_require(data->output);
 
 	igt_display_reset(&data->display);
+	igt_display_commit(&data->display);
 }
 
 static void test_cleanup(data_t *data)
@@ -818,6 +819,7 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 			continue;
 
 		igt_display_reset(&data->display);
+		igt_display_commit(&data->display);
 		igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
 		igt_output_set_pipe(output, p);
 		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
@@ -836,6 +838,7 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 
 		igt_dynamic_f("pipe-%s-%s-gamma", kmstest_pipe_name(p), output->name) {
 			igt_display_reset(&data->display);
+			igt_display_commit(&data->display);
 			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
 
 			ret = test_pipe_gamma(data, data->primary);
@@ -846,6 +849,7 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 
 		igt_dynamic_f("pipe-%s-%s-degamma", kmstest_pipe_name(p), output->name) {
 			igt_display_reset(&data->display);
+			igt_display_commit(&data->display);
 			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
 
 			ret = test_pipe_degamma(data, data->primary);
@@ -856,6 +860,7 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 
 		igt_dynamic_f("pipe-%s-%s-ctm", kmstest_pipe_name(p), output->name) {
 			igt_display_reset(&data->display);
+			igt_display_commit(&data->display);
 			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
 
 			ret = test_pipe_ctm(data, data->primary,
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 3041f1cdd..d86b0b7d2 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -510,6 +510,9 @@ test_content_protection(enum igt_commit_style s, int content_type)
 		igt_require_f(igt_kmod_is_loaded("mei_hdcp"),
 			      "mei_hdcp module is not loaded\n");
 
+	igt_display_reset(display);
+	igt_display_commit(display);
+
 	for_each_connected_output(display, output) {
 		if (!output_hdcp_capable(output, content_type))
 			continue;
@@ -598,6 +601,9 @@ test_content_protection_mst(int content_type)
 	enum pipe pipe;
 	igt_output_t *mst_output[IGT_MAX_PIPES], *hdcp_mst_output[IGT_MAX_PIPES];
 
+	igt_display_reset(display);
+	igt_display_commit(display);
+
 	for_each_pipe(display, pipe)
 		max_pipe++;
 
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index f07a045a3..f39ca9b39 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -465,6 +465,7 @@ static void prepare_crtc(data_t *data, int cursor_w, int cursor_h)
 	igt_output_t *output = data->output;
 
 	igt_display_reset(display);
+	igt_display_commit(display);
 
 	/* select the pipe we want to use */
 	igt_output_set_pipe(output, data->pipe);
diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index ac201293b..a8a3a45d9 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -48,6 +48,9 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
 	struct igt_fb fb[2];
 	int fd, ret;
 
+	igt_display_reset(&data->display);
+	igt_display_commit(&data->display);
+
 	/* select the pipe we want to use */
 	igt_output_set_pipe(output, pipe);
 
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 0bf102a6d..a506f51a6 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -817,6 +817,9 @@ static void run_test(data_t *data, void (*testfunc)(data_t *))
 	enum pipe p;
 	unsigned int valid_tests = 0;
 
+	igt_display_reset(display);
+	igt_display_commit(display);
+
 	for_each_pipe_with_valid_output(display, p, output) {
 		igt_info("Beginning %s on pipe %s, connector %s\n",
 			 igt_subtest_name(),
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 2ff40f72e..56a547a28 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -77,6 +77,7 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 	int c, j;
 
 	igt_display_reset(display);
+	igt_display_commit(display);
 
 	igt_output_set_pipe(output, pipe);
 	mode = igt_output_get_mode(output);
@@ -182,6 +183,8 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output)
 	struct igt_fb fb0, fb1;
 
 	igt_display_reset(display);
+	igt_display_commit(display);
+
 	igt_output_set_pipe(output, pipe);
 
 	mode = igt_output_get_mode(output);
@@ -238,6 +241,8 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
 	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, "auto");
 
 	igt_display_reset(display);
+	igt_display_commit(display);
+
 	igt_output_set_pipe(output, pipe);
 
 	mode = igt_output_get_mode(output);
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index c885a813e..cd5ae3858 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -78,6 +78,7 @@ static void test_init(data_t *data, enum pipe pipe)
 	igt_require(data->display.pipes[pipe].n_planes > 0);
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
 	igt_display_reset(&data->display);
+	igt_display_commit(&data->display);
 }
 
 static void test_fini(data_t *data)
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 1ad4b3a63..6a90ca68f 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -87,6 +87,7 @@ static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
 	igt_require_f(found, "No valid connector/pipe found\n");
 
 	igt_display_reset(display);
+	igt_display_commit(display);
 	igt_output_set_pipe(output, *pipe);
 	return output;
 }
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index 1655d7d1b..06d3a516c 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -78,6 +78,7 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 	igt_plane_t *primary;
 
 	igt_display_reset(&data->display);
+	igt_display_commit(&data->display);
 
 	/* select the pipe we want to use */
 	igt_output_set_pipe(output, data->pipe);
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index e65e8522a..56516753b 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -73,6 +73,7 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 	igt_plane_t *primary;
 
 	igt_display_reset(display);
+	igt_display_commit(display);
 
 	/* select the pipe we want to use */
 	igt_output_set_pipe(output, data->pipe);
diff --git a/tests/prime_mmap_kms.c b/tests/prime_mmap_kms.c
index 8b127a13c..05ecaa197 100644
--- a/tests/prime_mmap_kms.c
+++ b/tests/prime_mmap_kms.c
@@ -189,6 +189,9 @@ static void run_test(gpu_process_t *gpu)
 	igt_output_t *output;
 	enum pipe pipe;
 
+	igt_display_reset(display);
+	igt_display_commit(display);
+
 	for_each_pipe_with_valid_output(display, pipe, output) {
 		int prime_fd;
 
-- 
2.25.1
