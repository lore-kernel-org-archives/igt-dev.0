Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B75F10E67C
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 10:33:25 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 26 Sep 2022 15:58:08 +0530
Message-Id: <20220926102808.28373-3-nidhi1.gupta@intel.com>
In-Reply-To: <20220926102808.28373-1-nidhi1.gupta@intel.com>
References: <20220926102808.28373-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/2] tests/i915/kms_psr2_su: Convert
 tests to dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Jeevan B <jeevan.b@intel.com>

Converting the existing subtests to dynamic subtests.
Adding support for each_pipe, currently PSR2 is supported on
few pipes so breaking the loop for other pipes currently.

v2: Add commit message and change break to continue. (Jouni)
v3: Check for pipe supporting PSR2 or not and then add to dynamic subtest. (Jouni)
v4: Check PSR2 support once in fixture then iterate pipes. (Jouni)

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/i915/kms_psr2_su.c | 93 ++++++++++++++++++++++++++--------------
 1 file changed, 62 insertions(+), 31 deletions(-)

diff --git a/tests/i915/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
index caccf713..3a0d241f 100644
--- a/tests/i915/kms_psr2_su.c
+++ b/tests/i915/kms_psr2_su.c
@@ -123,7 +123,7 @@ static void display_fini(data_t *data)
 	igt_display_fini(&data->display);
 }
 
-static void prepare(data_t *data)
+static void prepare(data_t *data, igt_output_t *output)
 {
 	igt_plane_t *primary;
 
@@ -154,14 +154,14 @@ static void prepare(data_t *data)
 		data->cr = igt_get_cairo_ctx(data->drm_fd, &data->fb[0]);
 	}
 
-	primary = igt_output_get_plane_type(data->output,
+	primary = igt_output_get_plane_type(output,
 					    DRM_PLANE_TYPE_PRIMARY);
 
 	igt_plane_set_fb(primary, &data->fb[0]);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
-static bool update_screen_and_test(data_t *data)
+static bool update_screen_and_test(data_t *data, igt_output_t *output)
 {
 	uint16_t su_blocks;
 	bool ret = false;
@@ -170,7 +170,7 @@ static bool update_screen_and_test(data_t *data)
 	case PAGE_FLIP: {
 		igt_plane_t *primary;
 
-		primary = igt_output_get_plane_type(data->output,
+		primary = igt_output_get_plane_type(output,
 						    DRM_PLANE_TYPE_PRIMARY);
 
 		if (igt_plane_has_prop(primary, IGT_PLANE_FB_DAMAGE_CLIPS)) {
@@ -222,7 +222,7 @@ static bool update_screen_and_test(data_t *data)
 	return ret;
 }
 
-static void run(data_t *data)
+static void run(data_t *data, igt_output_t *output)
 {
 	bool result = false;
 
@@ -236,18 +236,18 @@ static void run(data_t *data)
 
 		r = read(data->change_screen_timerfd, &exp, sizeof(exp));
 		if (r == sizeof(uint64_t) && exp)
-			result = update_screen_and_test(data);
+			result = update_screen_and_test(data, output);
 	}
 
 	igt_assert_f(result,
 		     "No matching selective update blocks read from debugfs\n");
 }
 
-static void cleanup(data_t *data)
+static void cleanup(data_t *data, igt_output_t *output)
 {
 	igt_plane_t *primary;
 
-	primary = igt_output_get_plane_type(data->output,
+	primary = igt_output_get_plane_type(output,
 					    DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
@@ -260,13 +260,35 @@ static void cleanup(data_t *data)
 	igt_remove_fb(data->drm_fd, &data->fb[0]);
 }
 
+static int check_psr2_support(data_t *data, enum pipe pipe)
+{
+	int status;
+
+	igt_output_t *output;
+	igt_display_t *display = &data->display;
+
+	igt_display_reset(display);
+	output = data->output;
+	igt_output_set_pipe(output, pipe);
+
+	prepare(data, output);
+	status = psr_wait_entry(data->debugfs_fd, PSR_MODE_2);
+	cleanup(data, output);
+
+	return status;
+}
+
 igt_main
 {
 	data_t data = {};
+	enum pipe pipe;
+	int r, i;
+	igt_output_t *outputs[IGT_MAX_PIPES];
+	int pipes[IGT_MAX_PIPES];
+	int n_pipes = 0;
 
 	igt_fixture {
 		struct itimerspec interval;
-		int r;
 
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
@@ -287,12 +309,6 @@ igt_main
 			      "Error enabling PSR2\n");
 		data.op = FRONTBUFFER;
 		data.format = DRM_FORMAT_XRGB8888;
-		prepare(&data);
-		r = psr_wait_entry(data.debugfs_fd, PSR_MODE_2);
-		cleanup(&data);
-		if (!r)
-			psr_print_debugfs(data.debugfs_fd);
-		igt_require_f(r, "PSR2 can not be enabled\n");
 
 		/* blocking timerfd */
 		data.change_screen_timerfd = timerfd_create(CLOCK_MONOTONIC, 0);
@@ -304,6 +320,14 @@ igt_main
 		interval.it_interval.tv_sec = interval.it_value.tv_sec;
 		r = timerfd_settime(data.change_screen_timerfd, 0, &interval, NULL);
 		igt_require_f(r != -1, "Error setting timerfd\n");
+
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (check_psr2_support(&data, pipe)) {
+				pipes[n_pipes] = pipe;
+				outputs[n_pipes] = data.output;
+				n_pipes++;
+			}
+		}
 	}
 
 	for (data.op = PAGE_FLIP; data.op < LAST; data.op++) {
@@ -312,26 +336,33 @@ igt_main
 		while (*format != DRM_FORMAT_INVALID) {
 			data.format = *format++;
 			igt_describe("Test that selective update works when screen changes");
-			igt_subtest_f("%s-%s", op_str(data.op), igt_format_str(data.format)) {
-				if (data.op == FRONTBUFFER &&
-				    intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 12) {
-					/*
-					 * FIXME: Display 12+ platforms now have PSR2
-					 * selective fetch enabled by default but we
-					 * still can't properly handle frontbuffer
-					 * rendering, so right it does full frame
-					 * fetches at every frontbuffer rendering.
-					 * So it is expected that this test will fail
-					 * in display 12+ platform for now.
-					 */
-					igt_skip("PSR2 selective fetch is doing full frame fetches for frontbuffer rendering\n");
+			igt_subtest_with_dynamic_f("%s-%s", op_str(data.op), igt_format_str(data.format)) {
+				for (i = 0; i < n_pipes; i++) {
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
+							igt_output_name(outputs[i])) {
+						igt_output_set_pipe(outputs[i], pipes[i]);
+						if (data.op == FRONTBUFFER &&
+						    intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 12) {
+							/*
+							 * FIXME: Display 12+ platforms now have PSR2
+							 * selective fetch enabled by default but we
+							 * still can't properly handle frontbuffer
+							 * rendering, so right it does full frame
+							 * fetches at every frontbuffer rendering.
+							 * So it is expected that this test will fail
+							 * in display 12+ platform for now.
+							 */
+							igt_skip("PSR2 selective fetch is doing full frame fetches for frontbuffer rendering\n");
+						}
+						prepare(&data, outputs[i]);
+						run(&data, outputs[i]);
+						cleanup(&data, outputs[i]);
+					}
 				}
-				prepare(&data);
-				run(&data);
-				cleanup(&data);
 			}
 		}
 	}
+
 	igt_fixture {
 		close(data.debugfs_fd);
 		display_fini(&data);
-- 
2.36.0
