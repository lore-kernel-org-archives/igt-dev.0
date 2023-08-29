Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E618110E38B
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Aug 2023 14:42:18 +0000 (UTC)
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Aug 2023 20:08:19 +0530
Message-Id: <20230829143821.1417623-8-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20230829143821.1417623-1-chaitanya.kumar.borah@intel.com>
References: <20230829143821.1417623-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 7/9] tests/kms_color: Add CTM tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chaitanya.kumar.borah@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add test cases to validate color conversion using CTM matrix.
We use a frame with RGB color bars and convert one color to
another using the plane CSC block.

Also added tests to program CTM with varying co-effs based on
usecases.

ToDo: This patch needs to broken down to smaller logical patches.

Co-developed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_color.c | 219 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 215 insertions(+), 4 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index d00ba13a1..2f874a59a 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -1631,10 +1631,6 @@ static bool plane_cp_test_2(data_t *data, igt_plane_t *plane)
 	return true;
 }
 
-#undef HAS_PRE_CSC
-#undef HAS_CSC
-#undef HAS_POST_CSC
-#undef HAS_COLOR_CONVERSION_CAP
 
 static void
 run_colorpipeline_tests_for_plane(data_t *data, enum pipe p,
@@ -1651,6 +1647,205 @@ run_colorpipeline_tests_for_plane(data_t *data, enum pipe p,
 	test_cleanup(data);
 }
 
+static bool test_plane_ctm(data_t *data,
+			   igt_plane_t *plane,
+			   const color_t *before,
+			   const color_t *after,
+			   const double *ctm_matrix)
+{
+	const double ctm_identity[] = {
+		1.0, 0.0, 0.0,
+		0.0, 1.0, 0.0,
+		0.0, 0.0, 1.0
+	};
+	struct drm_color_ctm *ctm1, *ctm2;
+	igt_output_t *output = data->output;
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode = data->mode;
+	struct igt_fb fb;
+	igt_crc_t crc_software, crc_hardware;
+	igt_pipe_crc_t *pipe_crc = data->pipe_crc;
+	bool ret = true;
+	uint32_t color_pipeline, blob_id = 0;
+	struct drm_color_pipeline cp;
+	struct drm_color_op_data *color_op_data;
+	uint32_t old_blob_id;
+
+	igt_info("Plane CTM test is running on pipe-%s plane-%d(%s)\n",
+		 kmstest_pipe_name(plane->pipe->pipe), plane->index,
+		 kmstest_plane_type_name(plane->type));
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GET_COLOR_PIPELINE));
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_SET_COLOR_PIPELINE));
+
+	igt_output_set_pipe(output, plane->pipe->pipe);
+
+	/* Create a framebuffer at the size of the output. */
+	igt_assert(igt_create_fb(data->drm_fd,
+				 mode->hdisplay,
+				 mode->vdisplay,
+				 data->drm_format,
+				 DRM_FORMAT_MOD_LINEAR,
+				 &fb));
+
+	igt_plane_set_fb(plane, &fb);
+
+	disable_degamma(plane->pipe);
+	disable_gamma(plane->pipe);
+	disable_ctm(plane->pipe);
+
+	/* Reset all color hardware blocks in pipeline by setting blob as NULL */
+	igt_plane_replace_prop_blob(plane, IGT_PLANE_SET_COLOR_PIPELINE, NULL, 0);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	color_pipeline = get_color_pipeline(data, plane, HAS_CSC);
+	igt_info("ctm color pipeline %d\n", color_pipeline);
+
+	color_op_data = calloc(1, sizeof(struct drm_color_op_data));
+	cp.num = color_pipeline;
+	cp.size = sizeof(struct drm_color_op_data);
+	cp.data = color_op_data;
+
+	/* Without CTM transformation. */
+	paint_rectangles(data, mode, after, &fb);
+	igt_plane_set_fb(plane, &fb);
+
+	color_op_data[0].name = DRM_CB_CSC;
+	ctm1 = create_ctm(ctm_identity);
+	igt_assert(drmModeCreatePropertyBlob(display->drm_fd,
+					     ctm1, sizeof(struct drm_color_ctm), &blob_id) == 0);
+	color_op_data[0].blob_id = blob_id;
+
+	/* Enable CTM hardware with unity matrix */
+	igt_plane_replace_prop_blob(plane, IGT_PLANE_SET_COLOR_PIPELINE, &cp,
+				    sizeof(struct drm_color_pipeline));
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[plane->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(pipe_crc, &crc_software);
+
+	/* With CTM transformation. */
+	paint_rectangles(data, mode, before, &fb);
+	igt_plane_set_fb(plane, &fb);
+
+	ctm2 = create_ctm(ctm_matrix);
+	old_blob_id = color_op_data[0].blob_id;
+	igt_assert(drmModeCreatePropertyBlob(display->drm_fd,
+					     ctm2, sizeof(struct drm_color_ctm), &blob_id) == 0);
+	color_op_data[0].blob_id = blob_id;
+
+	/* Now change the matrix co-effs based on desired  color conversion */
+	igt_plane_replace_prop_blob(plane, IGT_PLANE_SET_COLOR_PIPELINE, &cp,
+				    sizeof(struct drm_color_pipeline));
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[plane->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(pipe_crc, &crc_hardware);
+
+	/* Clean up old blob */
+	drmModeDestroyPropertyBlob(display->drm_fd,
+				   old_blob_id);
+	free(ctm1);
+	/* Verify that the CRC of the software computed ouutput
+	 * is equal to the CRC of the CTM matrix transformation
+	 * output.
+	 */
+	ret &= igt_skip_crc_compare || igt_check_crc_equal(&crc_software, &crc_hardware);
+
+	/****** Reset Pipe Line *******/
+	igt_plane_replace_prop_blob(plane, IGT_PLANE_SET_COLOR_PIPELINE, NULL, 0);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	drmModeDestroyPropertyBlob(display->drm_fd,
+				   color_op_data[0].blob_id);
+	free(ctm2);
+
+	igt_plane_set_fb(plane, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	return ret;
+}
+
+#undef HAS_PRE_CSC
+#undef HAS_CSC
+#undef HAS_POST_CSC
+#undef HAS_COLOR_CONVERSION_CAP
+
+static void run_ctm_tests_for_plane(data_t *data,
+				    enum pipe pipe,
+				    const color_t *fb_colors,
+				    const double *ctm,
+				    int iter)
+{
+	igt_plane_t *plane;
+	double delta;
+
+	color_t red_green_blue[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+
+	test_setup(data, pipe);
+
+	data->color_depth = 8;
+	delta = 1.0 / (1 << data->color_depth);
+	data->drm_format = DRM_FORMAT_XRGB8888;
+	data->mode = igt_output_get_mode(data->output);
+
+	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), data->output->name) {
+		bool result = false;
+		int i, count = 0;
+		/* Run only for two planes */
+		int first_plane = 0;
+		int last_plane = 1;
+
+		for_each_plane_on_pipe(&data->display, pipe, plane) {
+			if (j__ != first_plane && j__ != last_plane)
+				continue;
+
+			if (!iter) {
+				color_t expected_colors[3];
+
+				memcpy(&expected_colors, fb_colors, sizeof(expected_colors));
+				result |= test_plane_ctm(data, plane,
+							 red_green_blue,
+							 expected_colors, ctm);
+			}
+
+			for (i = 0; i < iter; i++) {
+				color_t expected_colors[3] = {
+					fb_colors[0],
+					fb_colors[1],
+					fb_colors[2],
+				};
+
+				transform_color(&expected_colors[0], ctm, delta * (i - (iter / 2)));
+				transform_color(&expected_colors[1], ctm, delta * (i - (iter / 2)));
+				transform_color(&expected_colors[2], ctm, delta * (i - (iter / 2)));
+
+				result |= test_plane_ctm(data, plane,
+							 fb_colors,
+							 expected_colors, ctm);
+
+				if (result)
+					break;
+			}
+
+			igt_assert(result);
+			count++;
+		}
+
+		if (!count)
+			igt_skip("No valid planes found.\n");
+	}
+
+	test_cleanup(data);
+}
+
 static void
 run_tests_for_pipe(data_t *data)
 {
@@ -1837,6 +2032,22 @@ run_tests_for_pipe(data_t *data)
 		}
 	}
 
+	for (i = 0; i < ARRAY_SIZE(ctm_tests); i++) {
+		igt_describe_f("%s", ctm_tests[i].desc);
+		igt_subtest_with_dynamic_f("plane-%s", ctm_tests[i].name) {
+			for_each_pipe(&data->display, pipe) {
+				if (pipe != active_pipes[0] &&
+				    pipe != active_pipes[last_pipe])
+					continue;
+
+				run_ctm_tests_for_plane(data, pipe,
+							ctm_tests[i].fb_colors,
+							ctm_tests[i].ctm,
+							ctm_tests[i].iter);
+			}
+		}
+	}
+
 	igt_fixture
 		igt_require(data->display.is_atomic);
 
-- 
2.25.1
