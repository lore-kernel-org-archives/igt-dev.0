Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56BF10E87C
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Nov 2022 16:29:09 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 11 Nov 2022 21:54:09 +0530
Message-Id: <20221111162409.15242-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_psr2_su: Cleanup
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

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Sanitize the system state before starting the subtest.

Signed-off-by: Jeevan B	<jeevan.b@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_psr2_su.c | 112 +++++++++++++++------------------------
 1 file changed, 44 insertions(+), 68 deletions(-)

diff --git a/tests/i915/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
index 84dc30c3..785dff30 100644
--- a/tests/i915/kms_psr2_su.c
+++ b/tests/i915/kms_psr2_su.c
@@ -92,41 +92,20 @@ typedef struct {
 	uint32_t screen_changes;
 } data_t;
 
-static void setup_output(data_t *data)
-{
-	igt_display_t *display = &data->display;
-	igt_output_t *output;
-	enum pipe pipe;
-
-	for_each_pipe_with_valid_output(display, pipe, output) {
-		drmModeConnectorPtr c = output->config.connector;
-
-		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
-			continue;
-
-		igt_output_set_pipe(output, pipe);
-		data->output = output;
-		data->mode = igt_output_get_mode(output);
-
-		return;
-	}
-}
-
-static void display_init(data_t *data)
-{
-	igt_display_require(&data->display, data->drm_fd);
-	setup_output(data);
-}
-
 static void display_fini(data_t *data)
 {
 	igt_display_fini(&data->display);
 }
 
-static void prepare(data_t *data, igt_output_t *output)
+static void prepare(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_plane_t *primary;
+	igt_display_t *display = &data->display;
+
+	igt_display_reset(display);
+	igt_output_set_pipe(output, pipe);
 
+	data->mode = igt_output_get_mode(output);
 	/* all green frame */
 	igt_create_color_fb(data->drm_fd,
 			    data->mode->hdisplay, data->mode->vdisplay,
@@ -243,13 +222,14 @@ static void run(data_t *data, igt_output_t *output)
 		     "No matching selective update blocks read from debugfs\n");
 }
 
-static void cleanup(data_t *data, igt_output_t *output)
+static void cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_plane_t *primary;
 
 	primary = igt_output_get_plane_type(output,
 					    DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(output, pipe);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 	if (data->op == PAGE_FLIP)
@@ -262,18 +242,17 @@ static void cleanup(data_t *data, igt_output_t *output)
 
 static int check_psr2_support(data_t *data, enum pipe pipe)
 {
-	int status;
+	bool status = false;
 
-	igt_output_t *output;
-	igt_display_t *display = &data->display;
+	igt_output_t *output = data->output;
+	drmModeConnectorPtr c = data->output->config.connector;
 
-	igt_display_reset(display);
-	output = data->output;
-	igt_output_set_pipe(output, pipe);
+	if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
+		return status;
 
-	prepare(data, output);
+	prepare(data, pipe, output);
 	status = psr_wait_entry(data->debugfs_fd, PSR_MODE_2);
-	cleanup(data, output);
+	cleanup(data, pipe, output);
 
 	return status;
 }
@@ -282,10 +261,7 @@ igt_main
 {
 	data_t data = {};
 	enum pipe pipe;
-	int r, i;
-	igt_output_t *outputs[IGT_MAX_PIPES * IGT_MAX_PIPES];
-	int pipes[IGT_MAX_PIPES * IGT_MAX_PIPES];
-	int n_pipes = 0;
+	int r;
 
 	igt_fixture {
 		struct itimerspec interval;
@@ -301,7 +277,8 @@ igt_main
 		igt_require_f(intel_display_ver(intel_get_drm_devid(data.drm_fd)) < 13,
 			      "Registers used by this test do not work on display 13\n");
 
-		display_init(&data);
+		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
 
 		/* Test if PSR2 can be enabled */
 		igt_require_f(psr_enable(data.drm_fd,
@@ -320,43 +297,42 @@ igt_main
 		interval.it_interval.tv_sec = interval.it_value.tv_sec;
 		r = timerfd_settime(data.change_screen_timerfd, 0, &interval, NULL);
 		igt_require_f(r != -1, "Error setting timerfd\n");
-
-		for_each_pipe_with_valid_output(&data.display, pipe, data.output) {
-			if (check_psr2_support(&data, pipe)) {
-				pipes[n_pipes] = pipe;
-				outputs[n_pipes] = data.output;
-				n_pipes++;
-			}
-		}
 	}
 
 	for (data.op = PAGE_FLIP; data.op < LAST; data.op++) {
 		const uint32_t *format = formats[data.op];
+		igt_fixture {
+			if (data.op == FRONTBUFFER &&
+			    intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 12) {
+				/*
+				 * FIXME: Display 12+ platforms now have PSR2
+				 * selective fetch enabled by default but we
+				 * still can't properly handle frontbuffer
+				 * rendering, so right it does full frame
+				 * fetches at every frontbuffer rendering.
+				 * So it is expected that this test will fail
+				 * in display 12+ platform for now.
+				 */
+				igt_info("PSR2 selective fetch is doing full frame fetches for frontbuffer rendering\n");
+				continue;
+			}
+		}
 
 		while (*format != DRM_FORMAT_INVALID) {
 			data.format = *format++;
 			igt_describe("Test that selective update works when screen changes");
 			igt_subtest_with_dynamic_f("%s-%s", op_str(data.op), igt_format_str(data.format)) {
-				for (i = 0; i < n_pipes; i++) {
-					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipes[i]),
-							igt_output_name(outputs[i])) {
-						igt_output_set_pipe(outputs[i], pipes[i]);
-						if (data.op == FRONTBUFFER &&
-						    intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 12) {
-							/*
-							 * FIXME: Display 12+ platforms now have PSR2
-							 * selective fetch enabled by default but we
-							 * still can't properly handle frontbuffer
-							 * rendering, so right it does full frame
-							 * fetches at every frontbuffer rendering.
-							 * So it is expected that this test will fail
-							 * in display 12+ platform for now.
-							 */
-							igt_skip("PSR2 selective fetch is doing full frame fetches for frontbuffer rendering\n");
+				for_each_pipe(&data.display, pipe) {
+					for_each_valid_output_on_pipe(&data.display, pipe, data.output) {
+						if (!check_psr2_support(&data, pipe))
+							continue;
+
+						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+								igt_output_name(data.output)) {
+							prepare(&data, pipe, data.output);
+							run(&data, data.output);
+							cleanup(&data, pipe, data.output);
 						}
-						prepare(&data, outputs[i]);
-						run(&data, outputs[i]);
-						cleanup(&data, outputs[i]);
 					}
 				}
 			}
-- 
2.36.0
