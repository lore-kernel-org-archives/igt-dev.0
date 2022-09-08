Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1521010EAEC
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Sep 2022 13:18:43 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  8 Sep 2022 18:44:16 +0530
Message-Id: <20220908131417.17308-2-jeevan.b@intel.com>
In-Reply-To: <20220908131417.17308-1-jeevan.b@intel.com>
References: <20220908131417.17308-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915/kms_psr2_su: Convert tests
 to dynamic
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

Converting the existing subtests to dynamic subtests.
Adding support for each_pipe, currently PSR2 is supported on
PIPE_A so breaking the loop for other pipes currently.

v2: Add commit message and change break to continue. (Jouni)
v3: Check for pipe supporting PSR2 or not and then add to dynamic subtest. (Jouni)

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/i915/kms_psr2_su.c | 63 +++++++++++++++++++++++++---------------
 1 file changed, 40 insertions(+), 23 deletions(-)

diff --git a/tests/i915/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
index caccf713..f63f1483 100644
--- a/tests/i915/kms_psr2_su.c
+++ b/tests/i915/kms_psr2_su.c
@@ -260,13 +260,30 @@ static void cleanup(data_t *data)
 	igt_remove_fb(data->drm_fd, &data->fb[0]);
 }
 
+static int check_psr2_support(data_t *data, enum pipe pipe, int x)
+{
+	igt_output_t *output;
+	igt_display_t *display = &data->display;
+
+	igt_display_reset(display);
+	output = data->output;
+	igt_output_set_pipe(output, pipe);
+
+	prepare(data);
+	x = psr_wait_entry(data->debugfs_fd, PSR_MODE_2);
+	cleanup(data);
+
+	return x;
+}
+
 igt_main
 {
 	data_t data = {};
+	enum pipe pipe;
+	int r;
 
 	igt_fixture {
 		struct itimerspec interval;
-		int r;
 
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
@@ -287,12 +304,6 @@ igt_main
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
@@ -312,23 +323,29 @@ igt_main
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
+					if (check_psr2_support(&data, pipe, r)) {
+						igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+							if (data.op == FRONTBUFFER &&
+							    intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 12) {
+								/*
+								 * FIXME: Display 12+ platforms now have PSR2
+								 * selective fetch enabled by default but we
+								 * still can't properly handle frontbuffer
+								 * rendering, so right it does full frame
+								 * fetches at every frontbuffer rendering.
+								 * So it is expected that this test will fail
+								 * in display 12+ platform for now.
+								 */
+								igt_skip("PSR2 selective fetch is doing full frame fetches for frontbuffer rendering\n");
+							}
+							prepare(&data);
+							run(&data);
+							cleanup(&data);
+						}
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
