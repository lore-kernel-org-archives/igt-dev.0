Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E646210F286
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Aug 2022 06:10:18 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 17 Aug 2022 11:35:36 +0530
Message-Id: <20220817060536.10553-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_psr2_su: Convert tests to
 dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: nidhi1.gupta@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Converting the existing subtests to dynamic subtests.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/i915/kms_psr2_su.c | 64 +++++++++++++++++++++++++---------------
 1 file changed, 41 insertions(+), 23 deletions(-)

diff --git a/tests/i915/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
index caccf713..fcc3105b 100644
--- a/tests/i915/kms_psr2_su.c
+++ b/tests/i915/kms_psr2_su.c
@@ -123,9 +123,15 @@ static void display_fini(data_t *data)
 	igt_display_fini(&data->display);
 }
 
-static void prepare(data_t *data)
+static void prepare(data_t *data, enum pipe pipe)
 {
 	igt_plane_t *primary;
+	igt_output_t *output;
+	igt_display_t *display = &data->display;
+
+	igt_display_reset(display);
+	output = data->output;
+	igt_output_set_pipe(output, pipe);
 
 	/* all green frame */
 	igt_create_color_fb(data->drm_fd,
@@ -263,6 +269,7 @@ static void cleanup(data_t *data)
 igt_main
 {
 	data_t data = {};
+	enum pipe pipe;
 
 	igt_fixture {
 		struct itimerspec interval;
@@ -287,12 +294,17 @@ igt_main
 			      "Error enabling PSR2\n");
 		data.op = FRONTBUFFER;
 		data.format = DRM_FORMAT_XRGB8888;
-		prepare(&data);
-		r = psr_wait_entry(data.debugfs_fd, PSR_MODE_2);
-		cleanup(&data);
-		if (!r)
-			psr_print_debugfs(data.debugfs_fd);
-		igt_require_f(r, "PSR2 can not be enabled\n");
+
+		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+			if (pipe != PIPE_A)
+				break;
+			prepare(&data, pipe);
+			r = psr_wait_entry(data.debugfs_fd, PSR_MODE_2);
+			cleanup(&data);
+			if (!r)
+				psr_print_debugfs(data.debugfs_fd);
+			igt_require_f(r, "PSR2 can not be enabled\n");
+		}
 
 		/* blocking timerfd */
 		data.change_screen_timerfd = timerfd_create(CLOCK_MONOTONIC, 0);
@@ -312,23 +324,29 @@ igt_main
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
+				for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
+					if (pipe != PIPE_A)
+		                                break;
+					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+						if (data.op == FRONTBUFFER &&
+						    intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 12) {
+						/*
+						 * FIXME: Display 12+ platforms now have PSR2
+						 * selective fetch enabled by default but we
+						 * still can't properly handle frontbuffer
+						 * rendering, so right it does full frame
+						 * fetches at every frontbuffer rendering.
+						 * So it is expected that this test will fail
+						 * in display 12+ platform for now.
+						 */
+						igt_skip("PSR2 selective fetch is doing full frame fetches for frontbuffer rendering\n");
+						}
+					prepare(&data, pipe);
+					run(&data);
+					cleanup(&data);
+					}
 				}
-				prepare(&data);
-				run(&data);
-				cleanup(&data);
 			}
 		}
 	}
-- 
2.36.0
