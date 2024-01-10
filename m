Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81CB810E75A
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 11:29:45 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 2/2] tests/intel/kms_big_joiner: add new test for force
 bigjoiner
Date: Wed, 10 Jan 2024 17:09:06 +0530
Message-Id: <20240110113906.523857-3-kunal1.joshi@intel.com>
In-Reply-To: <20240110113906.523857-1-kunal1.joshi@intel.com>
References: <20240110113906.523857-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Earlier bigjoiner was enabled only for below cases
a) for mode having hdisplay > 5k
b) if clock requirement were higher than 1 pipe could handle

https://patchwork.freedesktop.org/series/124730/
With above series we can force bigjoiner without such constraints.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_big_joiner.c | 82 +++++++++++++++++++++++++++++++++---
 1 file changed, 76 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index aba2adfbe..33b3c4114 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_big_joiner.c
@@ -46,8 +46,10 @@
  *
  * SUBTEST: 2x-modeset
  * Description: Verify simultaneous modeset on 2 big joiner outputs
+ *
+ * SUBTEST: force-bigjoiner
+ * Description: Verify bigjoiner on non bigjoiner outputs by force
  */
-
 IGT_TEST_DESCRIPTION("Test big joiner");
 
 struct bigjoiner_output {
@@ -67,6 +69,18 @@ typedef struct {
 
 static int max_dotclock;
 
+static void force_big_joiner_on_all_outputs(data_t *data, bool enable)
+{
+	igt_output_t *output;
+
+	for_each_connected_output(&data->display, output)
+		/*
+		 * Force big joiner on output
+		 */
+		igt_force_bigjoiner_enable(data->drm_fd, output->name, enable);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
 static void test_invalid_modeset(data_t *data)
 {
 	igt_output_t *output;
@@ -107,6 +121,48 @@ static void test_invalid_modeset(data_t *data)
 	igt_assert_lt(ret, 0);
 }
 
+static void force_bigjoiner_basic(data_t *data, int simultaneous_bigjoner)
+{
+	int no_of_outputs;
+	drmModeModeInfo *mode;
+	igt_output_t *output;
+	igt_display_t *display = &data->display;
+	enum pipe pipe;
+	struct igt_fb *primary_fb = malloc(data->n_pipes * sizeof(struct igt_fb));
+	igt_plane_t **primary = malloc(data->n_pipes * sizeof(igt_plane_t *));
+
+	igt_display_reset(display);
+	pipe = 0;
+	no_of_outputs = 0;
+
+	force_big_joiner_on_all_outputs(data, true);
+	for_each_connected_output(display, output) {
+		igt_sort_connector_modes(output->config.connector, sort_drm_modes_by_clk_dsc);
+		mode = &output->config.connector->modes[0];
+		igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 1.0, 0.0, 0.0, &primary_fb[no_of_outputs]);
+		igt_output_override_mode(output, mode);
+		igt_output_set_pipe(output, pipe);
+		primary[no_of_outputs] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+		igt_plane_set_fb(primary[no_of_outputs], &primary_fb[no_of_outputs]);
+		igt_info("Using (pipe %s + %s) to run the subtest with mode %dx%d@%d.\n",
+				kmstest_pipe_name(pipe), igt_output_name(output),
+				output->override_mode.hdisplay, output->override_mode.vdisplay, output->override_mode.vrefresh);
+		no_of_outputs++;
+		pipe = pipe + 2;
+		if (pipe >= data->n_pipes || no_of_outputs >= simultaneous_bigjoner)
+			break;
+	}
+	if (no_of_outputs != simultaneous_bigjoner)
+		igt_skip("Can't test all outputs\n");
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	for_each_connected_output(display, output) {
+		igt_output_set_pipe(output, PIPE_NONE);
+	}
+	force_big_joiner_on_all_outputs(data, false);
+}
+
 static void test_basic_modeset(data_t *data)
 {
 	drmModeModeInfo *mode;
@@ -257,24 +313,27 @@ igt_main
 			j++;
 		}
 
-		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
-
-		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_LINEAR, &data.fb);
 	}
 
 	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
 	igt_subtest_with_dynamic("basic") {
+		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
+		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
+				      DRM_FORMAT_MOD_LINEAR, &data.fb);
 		for (i = 0; i < data.n_pipes - 1; i++) {
 			data.pipe1 = pipe_seq[i];
 			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
 				test_basic_modeset(&data);
 		}
+		igt_remove_fb(data.drm_fd, &data.fb);
 	}
 
 	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
 		     "when the pipe is active with a big joiner modeset");
 	igt_subtest_with_dynamic("invalid-modeset") {
+		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
+		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
+				      DRM_FORMAT_MOD_LINEAR, &data.fb);
 		data.pipe1 = pipe_seq[j - 1];
 
 		igt_display_reset(&data.display);
@@ -323,11 +382,15 @@ igt_main
 					test_invalid_modeset(&data);
 			}
 		}
+		igt_remove_fb(data.drm_fd, &data.fb);
 	}
 
 	igt_describe("Verify simultaneous modeset on 2 big joiner outputs");
 	igt_subtest_with_dynamic("2x-modeset") {
 		igt_require_f(count > 1, "2 outputs with big joiner modes are required\n");
+		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
+				      DRM_FORMAT_MOD_LINEAR, &data.fb);
+
 		igt_require_f(data.n_pipes > 3, "Minumum of 4 pipes are required\n");
 		for (i = 0; (i + 2) < data.n_pipes - 1; i++) {
 			data.pipe1 = pipe_seq[i];
@@ -335,10 +398,17 @@ igt_main
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe_seq[i]), kmstest_pipe_name(pipe_seq[i + 2]))
 				test_dual_display(&data);
 		}
+		igt_remove_fb(data.drm_fd, &data.fb);
+	}
+
+	igt_describe("Verify bigjoiner on non bigjoiner outputs by force");
+	igt_subtest_with_dynamic("force-bigjoiner") {
+		for (i = 1; i  < valid_output+1; i++)
+			igt_dynamic_f("%dx", i)
+				force_bigjoiner_basic(&data, i);
 	}
 
 	igt_fixture {
-		igt_remove_fb(data.drm_fd, &data.fb);
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
-- 
2.25.1
