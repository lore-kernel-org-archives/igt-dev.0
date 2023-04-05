Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4655210E8B7
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Apr 2023 09:49:50 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	karthik.b.s@intel.com
Date: Wed,  5 Apr 2023 15:15:37 +0530
Message-Id: <20230405094537.302827-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230331065029.3869109-3-bhanuprakash.modem@intel.com>
References: <20230331065029.3869109-3-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 2/7] tests/i915/kms_big_joiner: Fix Bigjoiner
 checks
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

Bigjoiner will come in the picture when the resolution > 5K or
clock > max dot-clock. Add a support to check the selected mode
clock is greater than the max dot-clock.

V2: - Handle both 5k & max dot clock cases
    - Other minor cleanups

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_big_joiner.c | 84 ++++++++++++++++++++++++-------------
 1 file changed, 55 insertions(+), 29 deletions(-)

diff --git a/tests/i915/kms_big_joiner.c b/tests/i915/kms_big_joiner.c
index 8be60ea1176..bd4541ce469 100644
--- a/tests/i915/kms_big_joiner.c
+++ b/tests/i915/kms_big_joiner.c
@@ -26,10 +26,13 @@
 
 #include "igt.h"
 
-#define MAX_HDISPLAY_PER_PIPE 5120
-
 IGT_TEST_DESCRIPTION("Test big joiner");
 
+struct big_joiner_output {
+	uint32_t output_id;
+	drmModeModeInfo mode;
+};
+
 typedef struct {
 	int drm_fd;
 	igt_display_t display;
@@ -37,7 +40,7 @@ typedef struct {
 	int n_pipes;
 	enum pipe pipe1;
 	enum pipe pipe2;
-	uint32_t big_joiner_output[2];
+	struct big_joiner_output output[2];
 } data_t;
 
 static void test_invalid_modeset(data_t *data)
@@ -91,7 +94,7 @@ static void test_basic_modeset(data_t *data)
 	igt_display_reset(display);
 
 	for_each_connected_output(display, output) {
-		if (data->big_joiner_output[0] == output->id) {
+		if (data->output[0].output_id == output->id) {
 			big_joiner_output = output;
 			break;
 		}
@@ -99,9 +102,7 @@ static void test_basic_modeset(data_t *data)
 
 	igt_output_set_pipe(big_joiner_output, data->pipe1);
 
-	igt_sort_connector_modes(big_joiner_output->config.connector,
-				 sort_drm_modes_by_res_dsc);
-	mode = &big_joiner_output->config.connector->modes[0];
+	mode = &data->output[0].mode;
 	igt_output_override_mode(big_joiner_output, mode);
 
 	pipe = &display->pipes[data->pipe1];
@@ -130,7 +131,7 @@ static void test_dual_display(data_t *data)
 	igt_display_reset(display);
 
 	for_each_connected_output(display, output) {
-		if (data->big_joiner_output[count] == output->id) {
+		if (data->output[count].output_id == output->id) {
 			big_joiner_output[count] = output;
 			count++;
 		}
@@ -143,9 +144,7 @@ static void test_dual_display(data_t *data)
 	igt_output_set_pipe(big_joiner_output[1], data->pipe2);
 
 	/* Set up first big joiner output on Pipe A*/
-	igt_sort_connector_modes(big_joiner_output[0]->config.connector,
-				 sort_drm_modes_by_res_dsc);
-	mode = &big_joiner_output[0]->config.connector->modes[0];
+	mode = &data->output[0].mode;
 	igt_output_override_mode(big_joiner_output[0], mode);
 
 	pipe = &display->pipes[data->pipe1];
@@ -156,9 +155,7 @@ static void test_dual_display(data_t *data)
 	igt_plane_set_size(plane1, mode->hdisplay, mode->vdisplay);
 
 	/* Set up second big joiner output on Pipe C*/
-	igt_sort_connector_modes(big_joiner_output[1]->config.connector,
-				 sort_drm_modes_by_res_dsc);
-	mode = &big_joiner_output[1]->config.connector->modes[0];
+	mode = &data->output[1].mode;
 	igt_output_override_mode(big_joiner_output[1], mode);
 
 	pipe = &display->pipes[data->pipe2];
@@ -186,6 +183,8 @@ igt_main
 	int valid_output = 0, i, count = 0, j = 0;
 	uint16_t width = 0, height = 0;
 	enum pipe pipe_seq[IGT_MAX_PIPES];
+	int max_dotclock;
+	bool retry = false;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
@@ -194,13 +193,39 @@ igt_main
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require(data.display.is_atomic);
 
+		max_dotclock = igt_get_max_dotclock(data.drm_fd);
+retry:
 		for_each_connected_output(&data.display, output) {
+			int idx;
+			bool found = false;
+
+			/*
+			 * Check if the output is already considered as
+			 * a Bigjoiner supported.
+			 */
+			for (idx = 0; idx < count; idx++) {
+				if (data.output[idx].output_id == output->id) {
+					found = true;
+					break;
+				}
+			}
+
+			if (found)
+				continue;
+
+			/*
+			 * Bigjoiner will come in the picture when
+			 * the resolution > 5K or clock > max-dot-clock.
+			 */
 			igt_sort_connector_modes(output->config.connector,
-						 sort_drm_modes_by_res_dsc);
+						 retry ? sort_drm_modes_by_clk_dsc :
+							 sort_drm_modes_by_res_dsc);
 
 			mode = &output->config.connector->modes[0];
-			if (mode->hdisplay > MAX_HDISPLAY_PER_PIPE) {
-				data.big_joiner_output[count++] = output->id;
+			if (igt_bigjoiner_possible(mode, max_dotclock)) {
+				data.output[count].output_id = output->id;
+				memcpy(&data.output[count].mode, mode, sizeof(drmModeModeInfo));
+				count++;
 
 				width = max(width, mode->hdisplay);
 				height = max(height, mode->vdisplay);
@@ -208,6 +233,11 @@ igt_main
 			valid_output++;
 		}
 
+		if (!retry) {
+			retry = true;
+			goto retry;
+		}
+
 		data.n_pipes = 0;
 		for_each_pipe(&data.display, i) {
 			data.n_pipes++;
@@ -215,7 +245,7 @@ igt_main
 			j++;
 		}
 
-		igt_require_f(count > 0, "No output with 5k+ mode found\n");
+		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
 
 		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
 				      DRM_FORMAT_MOD_LINEAR, &data.fb);
@@ -237,14 +267,12 @@ igt_main
 
 		igt_display_reset(&data.display);
 		for_each_connected_output(&data.display, output) {
-			if (data.big_joiner_output[0] != output->id)
+			if (data.output[0].output_id != output->id)
 				continue;
 
-			igt_sort_connector_modes(output->config.connector,
-						 sort_drm_modes_by_res_dsc);
-
+			mode = &data.output[0].mode;
 			igt_output_set_pipe(output, data.pipe1);
-			igt_output_override_mode(output, &output->config.connector->modes[0]);
+			igt_output_override_mode(output, mode);
 
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(data.pipe1),
@@ -261,17 +289,15 @@ igt_main
 
 				igt_display_reset(&data.display);
 				for_each_connected_output(&data.display, output) {
-					igt_sort_connector_modes(output->config.connector,
-								 sort_drm_modes_by_res_dsc);
-
-					if (data.big_joiner_output[0] == output->id) {
+					if (data.output[0].output_id == output->id) {
 						first_output = output;
+						mode = &data.output[0].mode;
+
 						igt_output_set_pipe(output, data.pipe1);
-						igt_output_override_mode(output, &output->config.connector->modes[0]);
+						igt_output_override_mode(output, mode);
 					} else if (second_output == NULL) {
 						second_output = output;
 						igt_output_set_pipe(output, data.pipe2);
-						igt_output_override_mode(output, &output->config.connector->modes[0]);
 
 						break;
 					}
-- 
2.40.0
