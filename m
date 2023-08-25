Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A0A10E62A
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 08:33:43 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 swati2.sharma@intel.com
Date: Fri, 25 Aug 2023 13:55:39 +0530
Message-Id: <20230825082541.905799-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20230825082541.905799-1-bhanuprakash.modem@intel.com>
References: <20230825082541.905799-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 3/5] tests/i915/kms_big_joiner: Fix Bigjoiner
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
V3: - Fix the logic to avoid the retry
V4: - consistent naming for bigjoiner

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_big_joiner.c | 106 +++++++++++++++++++++---------------
 1 file changed, 61 insertions(+), 45 deletions(-)

diff --git a/tests/i915/kms_big_joiner.c b/tests/i915/kms_big_joiner.c
index ae38e02c5..cf6d1cd74 100644
--- a/tests/i915/kms_big_joiner.c
+++ b/tests/i915/kms_big_joiner.c
@@ -31,10 +31,13 @@
  */
 #include "igt.h"
 
-#define MAX_HDISPLAY_PER_PIPE 5120
-
 IGT_TEST_DESCRIPTION("Test big joiner");
 
+struct bigjoiner_output {
+	uint32_t output_id;
+	drmModeModeInfo mode;
+};
+
 typedef struct {
 	int drm_fd;
 	igt_display_t display;
@@ -42,9 +45,11 @@ typedef struct {
 	int n_pipes;
 	enum pipe pipe1;
 	enum pipe pipe2;
-	uint32_t big_joiner_output[2];
+	struct bigjoiner_output output[2];
 } data_t;
 
+static int max_dotclock;
+
 /**
  * SUBTEST: invalid-modeset
  * Description: Verify if the modeset on the adjoining pipe is rejected when
@@ -107,7 +112,7 @@ static void test_invalid_modeset(data_t *data)
 static void test_basic_modeset(data_t *data)
 {
 	drmModeModeInfo *mode;
-	igt_output_t *output, *big_joiner_output = NULL;
+	igt_output_t *output, *bigjoiner_output = NULL;
 	igt_display_t *display = &data->display;
 	igt_pipe_t *pipe;
 	igt_plane_t *plane;
@@ -115,18 +120,16 @@ static void test_basic_modeset(data_t *data)
 	igt_display_reset(display);
 
 	for_each_connected_output(display, output) {
-		if (data->big_joiner_output[0] == output->id) {
-			big_joiner_output = output;
+		if (data->output[0].output_id == output->id) {
+			bigjoiner_output = output;
 			break;
 		}
 	}
 
-	igt_output_set_pipe(big_joiner_output, data->pipe1);
+	igt_output_set_pipe(bigjoiner_output, data->pipe1);
 
-	igt_sort_connector_modes(big_joiner_output->config.connector,
-				 sort_drm_modes_by_res_dsc);
-	mode = &big_joiner_output->config.connector->modes[0];
-	igt_output_override_mode(big_joiner_output, mode);
+	mode = &data->output[0].mode;
+	igt_output_override_mode(bigjoiner_output, mode);
 
 	pipe = &display->pipes[data->pipe1];
 	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
@@ -137,7 +140,7 @@ static void test_basic_modeset(data_t *data)
 
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
-	igt_output_set_pipe(big_joiner_output, PIPE_NONE);
+	igt_output_set_pipe(bigjoiner_output, PIPE_NONE);
 	igt_plane_set_fb(plane, NULL);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 }
@@ -154,7 +157,7 @@ static void test_basic_modeset(data_t *data)
 static void test_dual_display(data_t *data)
 {
 	drmModeModeInfo *mode;
-	igt_output_t *output, *big_joiner_output[2];
+	igt_output_t *output, *bigjoiner_output[2];
 	igt_display_t *display = &data->display;
 	igt_pipe_t *pipe;
 	igt_plane_t *plane1, *plane2;
@@ -163,8 +166,8 @@ static void test_dual_display(data_t *data)
 	igt_display_reset(display);
 
 	for_each_connected_output(display, output) {
-		if (data->big_joiner_output[count] == output->id) {
-			big_joiner_output[count] = output;
+		if (data->output[count].output_id == output->id) {
+			bigjoiner_output[count] = output;
 			count++;
 		}
 
@@ -172,14 +175,12 @@ static void test_dual_display(data_t *data)
 			break;
 	}
 
-	igt_output_set_pipe(big_joiner_output[0], data->pipe1);
-	igt_output_set_pipe(big_joiner_output[1], data->pipe2);
+	igt_output_set_pipe(bigjoiner_output[0], data->pipe1);
+	igt_output_set_pipe(bigjoiner_output[1], data->pipe2);
 
 	/* Set up first big joiner output on Pipe A*/
-	igt_sort_connector_modes(big_joiner_output[0]->config.connector,
-				 sort_drm_modes_by_res_dsc);
-	mode = &big_joiner_output[0]->config.connector->modes[0];
-	igt_output_override_mode(big_joiner_output[0], mode);
+	mode = &data->output[0].mode;
+	igt_output_override_mode(bigjoiner_output[0], mode);
 
 	pipe = &display->pipes[data->pipe1];
 	plane1 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
@@ -189,10 +190,8 @@ static void test_dual_display(data_t *data)
 	igt_plane_set_size(plane1, mode->hdisplay, mode->vdisplay);
 
 	/* Set up second big joiner output on Pipe C*/
-	igt_sort_connector_modes(big_joiner_output[1]->config.connector,
-				 sort_drm_modes_by_res_dsc);
-	mode = &big_joiner_output[1]->config.connector->modes[0];
-	igt_output_override_mode(big_joiner_output[1], mode);
+	mode = &data->output[1].mode;
+	igt_output_override_mode(bigjoiner_output[1], mode);
 
 	pipe = &display->pipes[data->pipe2];
 	plane2 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
@@ -204,13 +203,23 @@ static void test_dual_display(data_t *data)
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
 	/* Clean up */
-	igt_output_set_pipe(big_joiner_output[0], PIPE_NONE);
-	igt_output_set_pipe(big_joiner_output[1], PIPE_NONE);
+	igt_output_set_pipe(bigjoiner_output[0], PIPE_NONE);
+	igt_output_set_pipe(bigjoiner_output[1], PIPE_NONE);
 	igt_plane_set_fb(plane1, NULL);
 	igt_plane_set_fb(plane2, NULL);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 }
 
+static bool bigjoiner_mode_found(drmModeConnector *connector,
+				 int (*sort_method)(const void *, const void*),
+				 drmModeModeInfo *mode)
+{
+	igt_sort_connector_modes(connector, sort_method);
+	*mode = connector->modes[0];
+
+	return igt_bigjoiner_possible(mode, max_dotclock);
+}
+
 igt_main
 {
 	data_t data;
@@ -227,13 +236,24 @@ igt_main
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require(data.display.is_atomic);
 
-		for_each_connected_output(&data.display, output) {
-			igt_sort_connector_modes(output->config.connector,
-						 sort_drm_modes_by_res_dsc);
+		max_dotclock = igt_get_max_dotclock(data.drm_fd);
 
-			mode = &output->config.connector->modes[0];
-			if (mode->hdisplay > MAX_HDISPLAY_PER_PIPE) {
-				data.big_joiner_output[count++] = output->id;
+		for_each_connected_output(&data.display, output) {
+			bool found = false;
+			drmModeConnector *connector = output->config.connector;
+
+			/*
+			 * Bigjoiner will come in to the picture when the
+			 * resolution > 5K or clock > max-dot-clock.
+			 */
+			found = (bigjoiner_mode_found(connector, sort_drm_modes_by_res_dsc, mode) ||
+				 bigjoiner_mode_found(connector, sort_drm_modes_by_clk_dsc, mode)) ?
+					true : false;
+
+			if (found) {
+				data.output[count].output_id = output->id;
+				memcpy(&data.output[count].mode, mode, sizeof(drmModeModeInfo));
+				count++;
 
 				width = max(width, mode->hdisplay);
 				height = max(height, mode->vdisplay);
@@ -248,7 +268,7 @@ igt_main
 			j++;
 		}
 
-		igt_require_f(count > 0, "No output with 5k+ mode found\n");
+		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
 
 		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
 				      DRM_FORMAT_MOD_LINEAR, &data.fb);
@@ -270,14 +290,12 @@ igt_main
 
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
@@ -294,17 +312,15 @@ igt_main
 
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
