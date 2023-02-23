Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5994410E513
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Feb 2023 15:16:19 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Feb 2023 20:40:04 +0530
Message-Id: <20230223151018.2565040-38-bhanuprakash.modem@intel.com>
In-Reply-To: <20230223151018.2565040-1-bhanuprakash.modem@intel.com>
References: <20230223151018.2565040-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v8 37/51] tests/i915/kms_big_joiner: Negative
 tests for Bigjoiner
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

Add negative tests to validate Bigjoiner or 8K mode.

Example:
* Pipe-D wont support a mode > 5K
* To use 8K mode on a pipe then consecutive pipe must be available & free.

Kernel should reject the commit/modeset if above conditions won't met.

V2:
- Fix redundant negative tests
V3:
- Drop duplicate logic
V4:
- Fix the CRASH in CI

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/i915/kms_big_joiner.c | 208 ++++++++++++++++--------------------
 1 file changed, 91 insertions(+), 117 deletions(-)

diff --git a/tests/i915/kms_big_joiner.c b/tests/i915/kms_big_joiner.c
index 71b2526d6..8be60ea11 100644
--- a/tests/i915/kms_big_joiner.c
+++ b/tests/i915/kms_big_joiner.c
@@ -37,119 +37,47 @@ typedef struct {
 	int n_pipes;
 	enum pipe pipe1;
 	enum pipe pipe2;
-	struct output_data {
-		uint32_t id;
-		int mode_number;
-	} big_joiner_output[2];
+	uint32_t big_joiner_output[2];
 } data_t;
 
 static void test_invalid_modeset(data_t *data)
 {
-	drmModeModeInfo *mode;
+	igt_output_t *output;
 	igt_display_t *display = &data->display;
-	igt_output_t *output, *big_joiner_output = NULL, *second_output = NULL;
 	int ret;
-	igt_pipe_t *pipe;
-	igt_plane_t *plane;
-
-	igt_display_reset(display);
-
-	for_each_connected_output(display, output) {
-		mode = &output->config.connector->modes[0];
-
-		if (data->big_joiner_output[0].id == output->id) {
-			big_joiner_output = output;
-		} else if (second_output == NULL) {
-			second_output = output;
-		}
-	}
 
-	igt_output_set_pipe(big_joiner_output, data->pipe1);
-
-	mode = &big_joiner_output->config.connector->modes[data->big_joiner_output[0].mode_number];
-	igt_output_override_mode(big_joiner_output, mode);
-
-	pipe = &display->pipes[data->pipe1];
-	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+	igt_info("Bigjoiner test on ");
+	for_each_connected_output(display, output){
+		enum pipe p = output->pending_pipe;
+		drmModeModeInfo *mode;
+		igt_pipe_t *pipe;
+		igt_plane_t *plane;
 
-	igt_plane_set_fb(plane, &data->fb);
-	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
-	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
+		if (p == PIPE_NONE)
+			continue;
 
-	igt_display_commit2(display, COMMIT_ATOMIC);
-
-	igt_output_set_pipe(second_output, data->pipe2);
+		mode = igt_output_get_mode(output);
+		igt_info("pipe:%s, output:%s, mode:", kmstest_pipe_name(p), igt_output_name(output));
+		kmstest_dump_mode(mode);
 
-	mode = igt_output_get_mode(second_output);
+		pipe = &display->pipes[p];
+		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 
-	pipe = &display->pipes[data->pipe2];
-	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_plane_set_fb(plane, &data->fb);
+		igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
+		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
+	}
 
-	igt_plane_set_fb(plane, &data->fb);
-	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
-	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
+	igt_assert(!igt_check_bigjoiner_support(display));
 
 	/* This commit is expectd to fail as this pipe is being used for big joiner */
 	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
 					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_assert_lt(ret, 0);
-
-	igt_output_set_pipe(big_joiner_output, PIPE_NONE);
-	igt_output_set_pipe(second_output, PIPE_NONE);
-
-	pipe = &display->pipes[data->pipe1];
-	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-
-	/*
-	 * Do not explicitly set the plane of the second output to NULL,
-	 * as it is the adjacent pipe to the big joiner output and
-	 * setting the big joiner plane to NULL will take care of this.
-	 */
-	igt_plane_set_fb(plane, NULL);
-	igt_display_commit2(display, COMMIT_ATOMIC);
-	igt_output_override_mode(big_joiner_output, NULL);
-
-	igt_output_set_pipe(second_output, data->pipe2);
-
-	mode = igt_output_get_mode(second_output);
-
-	pipe = &display->pipes[data->pipe2];
-	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-
-	igt_plane_set_fb(plane, &data->fb);
-	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
-	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
 
+	igt_display_reset(&data->display);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
-	igt_output_set_pipe(big_joiner_output, data->pipe1);
-
-	mode = &big_joiner_output->config.connector->modes[data->big_joiner_output[0].mode_number];
-	igt_output_override_mode(big_joiner_output, mode);
-
-	pipe = &display->pipes[data->pipe1];
-	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-
-	igt_plane_set_fb(plane, &data->fb);
-	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
-	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
-
-	/* This commit is expected to fail as the adjacent pipe is already in use*/
-	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
-					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 	igt_assert_lt(ret, 0);
-
-	igt_output_set_pipe(big_joiner_output, PIPE_NONE);
-	igt_output_set_pipe(second_output, PIPE_NONE);
-	igt_plane_set_fb(plane, NULL);
-
-	pipe = &display->pipes[data->pipe2];
-	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-	igt_plane_set_fb(plane, NULL);
-
-	igt_display_commit2(display, COMMIT_ATOMIC);
-
-	igt_output_override_mode(big_joiner_output, NULL);
 }
 
 static void test_basic_modeset(data_t *data)
@@ -163,7 +91,7 @@ static void test_basic_modeset(data_t *data)
 	igt_display_reset(display);
 
 	for_each_connected_output(display, output) {
-		if (data->big_joiner_output[0].id == output->id) {
+		if (data->big_joiner_output[0] == output->id) {
 			big_joiner_output = output;
 			break;
 		}
@@ -171,7 +99,9 @@ static void test_basic_modeset(data_t *data)
 
 	igt_output_set_pipe(big_joiner_output, data->pipe1);
 
-	mode = &big_joiner_output->config.connector->modes[data->big_joiner_output[0].mode_number];
+	igt_sort_connector_modes(big_joiner_output->config.connector,
+				 sort_drm_modes_by_res_dsc);
+	mode = &big_joiner_output->config.connector->modes[0];
 	igt_output_override_mode(big_joiner_output, mode);
 
 	pipe = &display->pipes[data->pipe1];
@@ -200,7 +130,7 @@ static void test_dual_display(data_t *data)
 	igt_display_reset(display);
 
 	for_each_connected_output(display, output) {
-		if (data->big_joiner_output[count].id == output->id) {
+		if (data->big_joiner_output[count] == output->id) {
 			big_joiner_output[count] = output;
 			count++;
 		}
@@ -213,7 +143,9 @@ static void test_dual_display(data_t *data)
 	igt_output_set_pipe(big_joiner_output[1], data->pipe2);
 
 	/* Set up first big joiner output on Pipe A*/
-	mode = &big_joiner_output[0]->config.connector->modes[data->big_joiner_output[0].mode_number];
+	igt_sort_connector_modes(big_joiner_output[0]->config.connector,
+				 sort_drm_modes_by_res_dsc);
+	mode = &big_joiner_output[0]->config.connector->modes[0];
 	igt_output_override_mode(big_joiner_output[0], mode);
 
 	pipe = &display->pipes[data->pipe1];
@@ -224,7 +156,9 @@ static void test_dual_display(data_t *data)
 	igt_plane_set_size(plane1, mode->hdisplay, mode->vdisplay);
 
 	/* Set up second big joiner output on Pipe C*/
-	mode = &big_joiner_output[1]->config.connector->modes[data->big_joiner_output[1].mode_number];
+	igt_sort_connector_modes(big_joiner_output[1]->config.connector,
+				 sort_drm_modes_by_res_dsc);
+	mode = &big_joiner_output[1]->config.connector->modes[0];
 	igt_output_override_mode(big_joiner_output[1], mode);
 
 	pipe = &display->pipes[data->pipe2];
@@ -261,19 +195,15 @@ igt_main
 		igt_require(data.display.is_atomic);
 
 		for_each_connected_output(&data.display, output) {
-			if (count < 2) {
-				for (i = 0; i < output->config.connector->count_modes; i++) {
-					mode = &output->config.connector->modes[i];
-					if (mode->hdisplay > MAX_HDISPLAY_PER_PIPE) {
-						data.big_joiner_output[count].mode_number = i;
-						data.big_joiner_output[count].id = output->id;
-						count++;
-
-						width = max(width, mode->hdisplay);
-						height = max(height, mode->vdisplay);
-						break;
-					}
-				}
+			igt_sort_connector_modes(output->config.connector,
+						 sort_drm_modes_by_res_dsc);
+
+			mode = &output->config.connector->modes[0];
+			if (mode->hdisplay > MAX_HDISPLAY_PER_PIPE) {
+				data.big_joiner_output[count++] = output->id;
+
+				width = max(width, mode->hdisplay);
+				height = max(height, mode->vdisplay);
 			}
 			valid_output++;
 		}
@@ -303,14 +233,58 @@ igt_main
 	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
 		     "when the pipe is active with a big joiner modeset");
 	igt_subtest_with_dynamic("invalid-modeset") {
-		igt_require_f(valid_output > 1, "No valid Second output found\n");
-		for (i = 0; i < data.n_pipes - 1; i++) {
-			data.pipe1 = pipe_seq[i];
-			data.pipe2 = pipe_seq[i + 1];
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe_seq[i]),
-						    kmstest_pipe_name(pipe_seq[i + 1]))
+		data.pipe1 = pipe_seq[j - 1];
+
+		igt_display_reset(&data.display);
+		for_each_connected_output(&data.display, output) {
+			if (data.big_joiner_output[0] != output->id)
+				continue;
+
+			igt_sort_connector_modes(output->config.connector,
+						 sort_drm_modes_by_res_dsc);
+
+			igt_output_set_pipe(output, data.pipe1);
+			igt_output_override_mode(output, &output->config.connector->modes[0]);
+
+			igt_dynamic_f("pipe-%s-%s",
+				      kmstest_pipe_name(data.pipe1),
+				      igt_output_name(output))
 				test_invalid_modeset(&data);
 		}
+
+		if(valid_output > 1) {
+			for (i = 0; i < data.n_pipes - 1; i++) {
+				igt_output_t *first_output = NULL, *second_output = NULL;
+
+				data.pipe1 = pipe_seq[i];
+				data.pipe2 = pipe_seq[i + 1];
+
+				igt_display_reset(&data.display);
+				for_each_connected_output(&data.display, output) {
+					igt_sort_connector_modes(output->config.connector,
+								 sort_drm_modes_by_res_dsc);
+
+					if (data.big_joiner_output[0] == output->id) {
+						first_output = output;
+						igt_output_set_pipe(output, data.pipe1);
+						igt_output_override_mode(output, &output->config.connector->modes[0]);
+					} else if (second_output == NULL) {
+						second_output = output;
+						igt_output_set_pipe(output, data.pipe2);
+						igt_output_override_mode(output, &output->config.connector->modes[0]);
+
+						break;
+					}
+				}
+
+				igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
+					      kmstest_pipe_name(data.pipe1),
+					      igt_output_name(first_output),
+					      kmstest_pipe_name(data.pipe2),
+					      igt_output_name(second_output))
+					test_invalid_modeset(&data);
+			}
+		}
 	}
 
 	igt_describe("Verify simultaneous modeset on 2 big joiner outputs");
-- 
2.39.1
