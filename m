Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9BD98CBE
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:53 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:55 +0530
Message-Id: <20220814180908.2553394-39-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 38/51] tests/i915/kms_big_joiner: Negative tests
 for Bigjoiner
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_big_joiner.c | 118 ++++++++++++++++++++++++++++++------
 1 file changed, 98 insertions(+), 20 deletions(-)

diff --git a/tests/i915/kms_big_joiner.c b/tests/i915/kms_big_joiner.c
index 7d400616..2e189fc8 100644
--- a/tests/i915/kms_big_joiner.c
+++ b/tests/i915/kms_big_joiner.c
@@ -43,6 +43,44 @@ typedef struct {
 	} big_joiner_output[2];
 } data_t;
 
+static void test_invalid(data_t *data)
+{
+	igt_output_t *output;
+	igt_display_t *display = &data->display;
+	int ret;
+
+	igt_info("Bigjoiner test on ");
+	for_each_connected_output(display, output){
+		enum pipe p = output->pending_pipe;
+		drmModeModeInfo *mode;
+		igt_pipe_t *pipe;
+		igt_plane_t *plane;
+
+		if (p == PIPE_NONE)
+			continue;
+
+		mode = igt_output_get_mode(output);
+		igt_info("pipe:%s, output:%s, mode:", kmstest_pipe_name(p), igt_output_name(output));
+		kmstest_dump_mode(mode);
+
+		pipe = &display->pipes[p];
+		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+
+		igt_plane_set_fb(plane, &data->fb);
+		igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
+		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
+	}
+
+	/* This commit is expectd to fail as this pipe is being used for big joiner */
+	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
+					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+	igt_display_reset(&data->display);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	igt_assert_lt(ret, 0);
+}
+
 static void test_invalid_modeset(data_t *data)
 {
 	drmModeModeInfo *mode;
@@ -261,19 +299,17 @@ igt_main
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
+				data.big_joiner_output[count].mode_number = i;
+				data.big_joiner_output[count].id = output->id;
+				count++;
+
+				width = max(width, mode->hdisplay);
+				height = max(height, mode->vdisplay);
 			}
 			valid_output++;
 		}
@@ -303,13 +339,55 @@ igt_main
 	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
 		     "when the pipe is active with a big joiner modeset");
 	igt_subtest_with_dynamic("invalid-modeset") {
-		igt_require_f(valid_output > 1, "No valid Second output found\n");
-		for (i = 0; i < data.n_pipes - 1; i++) {
-			data.pipe1 = pipe_seq[i];
-			data.pipe2 = pipe_seq[i + 1];
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe_seq[i]),
-						    kmstest_pipe_name(pipe_seq[i + 1]))
-				test_invalid_modeset(&data);
+		enum pipe pipe;
+
+		for_each_pipe_with_valid_output(&data.display, pipe, output) {
+			igt_display_reset(&data.display);
+
+			igt_sort_connector_modes(output->config.connector,
+						 sort_drm_modes_by_res_dsc);
+
+			igt_output_set_pipe(output, pipe);
+			igt_output_override_mode(output,
+						 &output->config.connector->modes[0]);
+			if (!igt_check_bigjoiner_support(&data.display)) {
+				igt_dynamic("single-connector") {
+					test_invalid(&data);
+				}
+			}
+		}
+
+		igt_display_reset(&data.display);
+		for_each_pipe(&data.display, pipe) {
+			for_each_valid_output_on_pipe(&data.display, pipe, output) {
+				if (output->pending_pipe != PIPE_NONE)
+					continue;
+
+				igt_sort_connector_modes(output->config.connector,
+							 sort_drm_modes_by_res_dsc);
+
+				igt_output_set_pipe(output, pipe);
+				igt_output_override_mode(output,
+							 &output->config.connector->modes[0]);
+
+				break;
+			}
+		}
+		if (valid_output > 1 &&
+		    !igt_check_bigjoiner_support(&data.display)) {
+			igt_dynamic("multi-connector") {
+				test_invalid(&data);
+			}
+		}
+
+		if(valid_output > 1) {
+			for (i = 0; i < data.n_pipes - 1; i++) {
+				data.pipe1 = pipe_seq[i];
+				data.pipe2 = pipe_seq[i + 1];
+				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe_seq[i]),
+							    kmstest_pipe_name(pipe_seq[i + 1]))
+					test_invalid_modeset(&data);
+			}
 		}
 	}
 
-- 
2.35.1
