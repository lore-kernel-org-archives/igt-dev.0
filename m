Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B91610E2EA
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Apr 2022 10:44:58 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 25 Apr 2022 15:42:20 +0530
Message-Id: <20220425101220.24874-2-karthik.b.s@intel.com>
In-Reply-To: <20220425101220.24874-1-karthik.b.s@intel.com>
References: <20220425101220.24874-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/2] tests/kms_async_flips: Convert tests
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

v2: -Get the mode after igt_display_reset() (Bhanu)

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_async_flips.c | 135 ++++++++++++++++++++++------------------
 1 file changed, 75 insertions(+), 60 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 1b5af111..eeeb8a40 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -59,6 +59,7 @@ typedef struct {
 	int frame_count;
 	bool flip_pending;
 	bool extended;
+	enum pipe pipe;
 } data_t;
 
 static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
@@ -135,24 +136,10 @@ static void require_monotonic_timestamp(int fd)
 		      "Monotonic timestamps not supported\n");
 }
 
-static enum pipe get_pipe_for_output(igt_display_t *display, igt_output_t *output)
-{
-	enum pipe pipe;
-
-	for_each_pipe(display, pipe) {
-		if (igt_pipe_connector_valid(pipe, output))
-			return pipe;
-	}
-
-	igt_assert_f(false, "No pipe found for output %s\n",
-		     igt_output_name(output));
-}
-
 static void test_init(data_t *data)
 {
 	int i;
 	uint32_t width, height;
-	enum pipe pipe;
 	igt_plane_t *plane;
 	static uint32_t prev_output_id;
 	drmModeModeInfo *mode;
@@ -160,16 +147,14 @@ static void test_init(data_t *data)
 	igt_display_reset(&data->display);
 	igt_display_commit(&data->display);
 
-	pipe = get_pipe_for_output(&data->display, data->output);
-
 	mode = igt_output_get_mode(data->output);
 	width = mode->hdisplay;
 	height = mode->vdisplay;
 
-	data->crtc_id = data->display.pipes[pipe].crtc_id;
+	data->crtc_id = data->display.pipes[data->pipe].crtc_id;
 	data->refresh_rate = mode->vrefresh;
 
-	igt_output_set_pipe(data->output, pipe);
+	igt_output_set_pipe(data->output, data->pipe);
 	plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 
 	if (prev_output_id != data->output->id) {
@@ -573,6 +558,7 @@ igt_main_args("e", NULL, help_str, opt_handler, &data)
 {
 	int i;
 	igt_output_t *output;
+	enum pipe pipe;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -587,69 +573,98 @@ igt_main_args("e", NULL, help_str, opt_handler, &data)
 	igt_describe("Verify the async flip functionality and the fps during async flips");
 	igt_subtest_group {
 		igt_describe("Wait for page flip events in between successive asynchronous flips");
-		igt_subtest("async-flip-with-page-flip-events") {
-			for_each_connected_output(&data.display, output) {
-				data.output = output;
-				test_async_flip(&data, false);
-
-				if (!data.extended)
-					break;
+		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
+			for_each_pipe_static(pipe) {
+				for_each_valid_output_on_pipe(&data.display, pipe, output) {
+					igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe)) {
+						data.output = output;
+						data.pipe = pipe;
+						test_async_flip(&data, false);
+					}
+
+					if (!data.extended)
+						break;
+				}
 			}
 		}
 
 		igt_describe("Alternate between sync and async flips");
-		igt_subtest("alternate-sync-async-flip") {
-			for_each_connected_output(&data.display, output) {
-				data.output = output;
-				test_async_flip(&data, true);
-
-				if (!data.extended)
-					break;
+		igt_subtest_with_dynamic("alternate-sync-async-flip") {
+			for_each_pipe_static(pipe) {
+				for_each_valid_output_on_pipe(&data.display, pipe, output) {
+					igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe)) {
+						data.output = output;
+						data.pipe = pipe;
+						test_async_flip(&data, true);
+					}
+
+					if (!data.extended)
+						break;
+				}
 			}
 		}
 
-
 		igt_describe("Verify that the async flip timestamp does not coincide with either previous or next vblank");
-		igt_subtest("test-time-stamp") {
-			for_each_connected_output(&data.display, output) {
-				data.output = output;
-				test_timestamp(&data);
-
-				if (!data.extended)
+		igt_subtest_with_dynamic("test-time-stamp") {
+			for_each_pipe_static(pipe) {
+				for_each_valid_output_on_pipe(&data.display, pipe, output) {
+					igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe)) {
+						data.output = output;
+						data.pipe = pipe;
+						test_timestamp(&data);
+					}
+
+					if (!data.extended)
 					break;
+				}
 			}
 		}
 
 		igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip");
-		igt_subtest("test-cursor") {
-			for_each_connected_output(&data.display, output) {
-				data.output = output;
-				test_cursor(&data);
-
-				if (!data.extended)
-					break;
+		igt_subtest_with_dynamic("test-cursor") {
+			for_each_pipe_static(pipe) {
+				for_each_valid_output_on_pipe(&data.display, pipe, output) {
+					igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe)) {
+						data.output = output;
+						data.pipe = pipe;
+						test_cursor(&data);
+					}
+
+					if (!data.extended)
+						break;
+				}
 			}
 		}
 
 		igt_describe("Negative case to verify if changes in fb are rejected from kernel as expected");
-		igt_subtest("invalid-async-flip") {
-			for_each_connected_output(&data.display, output) {
-				data.output = output;
-				test_invalid(&data);
-
-				if (!data.extended)
-					break;
+		igt_subtest_with_dynamic("invalid-async-flip") {
+			for_each_pipe_static(pipe) {
+				for_each_valid_output_on_pipe(&data.display, pipe, output) {
+					igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe)) {
+						data.output = output;
+						data.pipe = pipe;
+						test_invalid(&data);
+					}
+
+					if (!data.extended)
+						break;
+				}
 			}
 		}
 
 		igt_describe("Use CRC to verify async flip scans out the correct framebuffer");
-		igt_subtest("crc") {
-			for_each_connected_output(&data.display, output) {
-				data.output = output;
-				test_crc(&data);
-
-				if (!data.extended)
-					break;
+		igt_subtest_with_dynamic("crc") {
+			for_each_pipe_static(pipe) {
+				for_each_valid_output_on_pipe(&data.display, pipe, output) {
+					igt_dynamic_f("%s-pipe-%s", output->name, kmstest_pipe_name(pipe)) {
+						data.output = output;
+						data.pipe = pipe;
+						test_crc(&data);
+					}
+
+					if (!data.extended)
+						break;
+				}
 			}
 		}
 
-- 
2.22.0
