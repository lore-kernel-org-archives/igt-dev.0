Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF40A98C95
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:24 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:32 +0530
Message-Id: <20220814180908.2553394-16-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 15/51] tests/kms_display_modes: Add support for
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

As many 2x tests are currently running on Pipe-A & B only, those
tests will always SKIP if there is any 8K supported panel in the
config. Instead of Skipping the test, add some intelligence to
the subtest to identify the valid pipe/output combo to execute
the subtest.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_display_modes.c | 104 +++++++++++++++++++++++---------------
 1 file changed, 62 insertions(+), 42 deletions(-)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index eff30cbb..816efcf8 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -34,31 +34,26 @@ typedef struct {
 	int n_pipes;
 } data_t;
 
-static void run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
+static void run_extendedmode_basic(data_t *data,
+				   enum pipe pipe1, igt_output_t *output1,
+				   enum pipe pipe2, igt_output_t *output2)
 {
 	struct igt_fb fb, fbs[2];
 	drmModeModeInfo *mode[2];
-	igt_output_t *output, *extended_output[2];
 	igt_display_t *display = &data->display;
 	igt_plane_t *plane[2];
 	igt_pipe_crc_t *pipe_crc[2] = { 0 };
 	igt_crc_t ref_crc[2], crc[2];
-	int count = 0, width, height;
+	int width, height;
 	cairo_t *cr;
 
-	for_each_connected_output(display, output) {
-		extended_output[count] = output;
-		count++;
+	igt_display_reset(display);
 
-		if (count > 1)
-			break;
-	}
-
-	igt_output_set_pipe(extended_output[0], pipe1);
-	igt_output_set_pipe(extended_output[1], pipe2);
+	igt_output_set_pipe(output1, pipe1);
+	igt_output_set_pipe(output2, pipe2);
 
-	mode[0] = igt_output_get_mode(extended_output[0]);
-	mode[1] = igt_output_get_mode(extended_output[1]);
+	mode[0] = igt_output_get_mode(output1);
+	mode[1] = igt_output_get_mode(output2);
 
 	pipe_crc[0] = igt_pipe_crc_new(data->drm_fd, pipe1, INTEL_PIPE_CRC_SOURCE_AUTO);
 	pipe_crc[1] = igt_pipe_crc_new(data->drm_fd, pipe2, INTEL_PIPE_CRC_SOURCE_AUTO);
@@ -115,8 +110,8 @@ static void run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
 	igt_pipe_crc_free(pipe_crc[0]);
 	igt_pipe_crc_free(pipe_crc[1]);
 
-	igt_output_set_pipe(extended_output[0], PIPE_NONE);
-	igt_output_set_pipe(extended_output[1], PIPE_NONE);
+	igt_output_set_pipe(output1, PIPE_NONE);
+	igt_output_set_pipe(output2, PIPE_NONE);
 
 	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe1],
 			  DRM_PLANE_TYPE_PRIMARY), NULL);
@@ -129,43 +124,68 @@ static void run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
 	igt_assert_crc_equal(&crc[1], &ref_crc[1]);
 }
 
+#define for_each_connected_output_local(display, output)		\
+	for (int j__ = 0;  assert(igt_can_fail()), j__ < (display)->n_outputs; j__++)	\
+		for_each_if ((((output) = &(display)->outputs[j__]), \
+			      igt_output_is_connected((output))))
+
+#define for_each_valid_output_on_pipe_local(display, pipe, output) \
+	for_each_connected_output_local((display), (output)) \
+		for_each_if (igt_pipe_connector_valid((pipe), (output)))
+
+static void run_extendedmode_test(data_t *data) {
+	enum pipe pipe1, pipe2;
+	igt_output_t *output1, *output2;
+	igt_display_t *display = &data->display;
+
+	igt_display_reset(display);
+
+	for_each_pipe(display, pipe1) {
+		for_each_valid_output_on_pipe(display, pipe1, output1) {
+			for_each_pipe(display, pipe2) {
+				if (pipe1 == pipe2)
+					continue;
+
+				for_each_valid_output_on_pipe_local(display, pipe2, output2) {
+					if (output1 == output2)
+						continue;
+
+					igt_display_reset(display);
+
+					igt_output_set_pipe(output1, pipe1);
+					igt_output_set_pipe(output2, pipe2);
+
+					if (!igt_test_constraint(display))
+						continue;
+
+					igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
+						      kmstest_pipe_name(pipe1),
+						      igt_output_name(output1),
+						      kmstest_pipe_name(pipe2),
+						      igt_output_name(output2))
+						run_extendedmode_basic(data,
+								pipe1, output1,
+								pipe2, output2);
+				}
+			}
+		}
+	}
+}
+
 igt_main
 {
 	data_t data;
-	int valid_output = 0, i, j = 0;
-	igt_output_t *output;
-	int pipe[IGT_MAX_PIPES];
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
-
-		for_each_connected_output(&data.display, output) {
-			valid_output++;
-
-			if (valid_output > 1)
-				break;
-		}
-
-		data.n_pipes = 0;
-		for_each_pipe(&data.display, i) {
-			data.n_pipes++;
-			pipe[j] = i;
-			j++;
-		}
-
-		igt_require_f(valid_output > 1, "No valid second output found\n");
+		igt_display_require_output(&data.display);
 	}
 
 	igt_describe("Test for validating display extended mode with a pair of connected displays");
-	igt_subtest_with_dynamic("extended-mode-basic") {
-		for (i = 0; i < data.n_pipes - 1; i++) {
-			igt_dynamic_f("pipe-%s%s", kmstest_pipe_name(pipe[i]),
-					kmstest_pipe_name(pipe[i+1]));
-			run_extendedmode_basic(&data, pipe[i], pipe[i+1]);
-		}
-	}
+	igt_subtest_with_dynamic("extended-mode-basic")
+		run_extendedmode_test(&data);
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-- 
2.35.1
