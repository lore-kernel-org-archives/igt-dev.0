Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D25C10E38B
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Aug 2023 14:42:17 +0000 (UTC)
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Aug 2023 20:08:18 +0530
Message-Id: <20230829143821.1417623-7-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20230829143821.1417623-1-chaitanya.kumar.borah@intel.com>
References: <20230829143821.1417623-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/9] tests/kms_color: Add test to switch
 color pipeline
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

If the currently enabled pipeline does not have the hardware
block needed for certain usecase, while its available in
another color pipeline exposed by driver. User can switch the
pipeline and use block from the new pipeline.

In this test, color pipeline 1 is enabled with pre-csc.
Now a 3D Lut operation is desired which is available only
in pipleline 2. Pipeline is switched and 3d Lut is enabled.

Co-developed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_color.c | 157 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 157 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index a0159a0de..d00ba13a1 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -1071,6 +1071,7 @@ static void run_plane_color_test(data_t *data, enum pipe pipe,
 #define HAS_POST_CSC BIT(2)
 #define HAS_COLOR_CONVERSION_CAP (HAS_PRE_CSC |\
 			HAS_CSC | HAS_POST_CSC)
+#define HAS_3DLUT    BIT(3)
 
 #define MIN(a, b) ((a) < (b) ? (a) : (b))
 
@@ -1089,6 +1090,10 @@ struct color_conversion_pipeline_info {
 	segment_data_t *post_csc_seg_data;
 };
 
+struct _3d_lut_colorpipeline_info {
+	segment_data_t *seg_data;
+};
+
 uint32_t get_color_op_cap(enum color_op_block name);
 drmModePropertyPtr get_plane_property(igt_plane_t *plane,
 				      enum igt_atomic_plane_properties prop);
@@ -1098,6 +1103,8 @@ segment_data_t *get_segment_data(data_t *data,
 				 uint64_t blob_id);
 void parse_color_conv_pipeline(data_t *data, uint64_t color_pipeline,
 			       struct color_conversion_pipeline_info *cp_info);
+void parse_3d_lut_pipeline(data_t *data, uint64_t color_pipeline,
+			   struct _3d_lut_colorpipeline_info *cp_info);
 void clear_pipeline_seg_info(struct color_conversion_pipeline_info cp_info);
 void destroy_csc_pipeline_blobs(data_t *data,
 				struct color_conversion_pipeline_info cp_info);
@@ -1114,6 +1121,8 @@ uint32_t get_color_op_cap(enum color_op_block name)
 		return HAS_POST_CSC;
 	case DRM_CB_CSC:
 		return HAS_CSC;
+	case DRM_CB_3D_LUT:
+		return HAS_3DLUT;
 	case DRM_CB_PRIVATE:
 	case DRM_CB_INVAL:
 	default:
@@ -1251,6 +1260,31 @@ void parse_color_conv_pipeline(data_t *data, uint64_t color_pipeline,
 	drmModeFreePropertyBlob(blob);
 }
 
+/* helper to parse segment data for 3D LUT */
+void parse_3d_lut_pipeline(data_t *data, uint64_t color_pipeline,
+			   struct _3d_lut_colorpipeline_info *cp_info)
+{
+	drmModePropertyBlobPtr blob = NULL;
+	struct drm_color_op *color_op;
+
+	blob = drmModeGetPropertyBlob(data->drm_fd, color_pipeline);
+	igt_assert(blob);
+	igt_assert(blob->length);
+	color_op = blob->data;
+
+	for (int j = 0; j < blob->length / sizeof(struct drm_color_op); j++) {
+		if (color_op[j].blob_id) {
+			if (color_op[j].name == DRM_CB_3D_LUT) {
+				cp_info->seg_data =
+					get_segment_data(data, color_op[j].blob_id);
+				break;
+			}
+		}
+	}
+
+	drmModeFreePropertyBlob(blob);
+}
+
 void clear_pipeline_seg_info(struct color_conversion_pipeline_info cp_info)
 {
 	free(cp_info.pre_csc_seg_data);
@@ -1478,6 +1512,125 @@ static bool plane_cp_test_1(data_t *data, igt_plane_t *plane)
 	return true;
 }
 
+/*
+ * Find a color pipeline with pre-csc and then program the block.
+ * Then find a color pipeline with 3D lut and program the block
+ */
+static bool plane_cp_test_2(data_t *data, igt_plane_t *plane)
+{
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode = data->mode;
+	igt_output_t *output = data->output;
+	struct igt_fb fb;
+	uint64_t color_pipeline = 0, _3d_cp_num = 0;
+	struct color_conversion_pipeline_info cp_info;
+	struct _3d_lut_colorpipeline_info _3d_cp_info;
+	struct drm_color_pipeline cp;
+	struct drm_color_op_data *color_op_data;
+	struct drm_color_lut_ext *pre_csc_lut, *_3d_lut;
+	uint32_t blob_id;
+	int lut_size = 0;
+
+	igt_info("Plane Color Pipeline test is running on pipe-%s plane-%d(%s)\n",
+		 kmstest_pipe_name(plane->pipe->pipe), plane->index,
+		 kmstest_plane_type_name(plane->type));
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GET_COLOR_PIPELINE));
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_SET_COLOR_PIPELINE));
+
+	igt_output_set_pipe(output, plane->pipe->pipe);
+
+	igt_assert(igt_create_fb(data->drm_fd,
+				 mode->hdisplay,
+				 mode->vdisplay,
+				 data->drm_format,
+				 DRM_FORMAT_MOD_LINEAR,
+				 &fb));
+
+	igt_plane_set_fb(plane, &fb);
+
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	/* Identify color pipeline with pre-csc hardware block */
+	color_pipeline = get_color_pipeline(data, plane, HAS_PRE_CSC);
+
+	color_op_data = calloc(1, sizeof(struct drm_color_op_data));
+	cp.num = color_pipeline;
+	cp.size = sizeof(struct drm_color_op_data);
+	cp.data = color_op_data;
+
+	/* Parse and detect the capability of the pre-csc hardware unit */
+	parse_color_conv_pipeline(data, color_pipeline, &cp_info);
+	igt_assert(cp_info.pre_csc_seg_data);
+
+	/* Set Pre-CSC */
+	color_op_data[0].name = DRM_CB_PRE_CSC;
+	lut_size = sizeof(struct drm_color_lut_ext) *
+	cp_info.pre_csc_seg_data->entries_count;
+	pre_csc_lut = create_linear_lut(cp_info.pre_csc_seg_data);
+	igt_assert(drmModeCreatePropertyBlob(display->drm_fd,
+					     pre_csc_lut, lut_size, &blob_id) == 0);
+	color_op_data[0].blob_id = blob_id;
+
+	/*
+	 * Enable pre-csc hardware unity alone in pipeline by populating
+	 * color_op_data with just 1 entry for pre-csc
+	 */
+	igt_plane_replace_prop_blob(plane, IGT_PLANE_SET_COLOR_PIPELINE, &cp,
+				    sizeof(struct drm_color_pipeline));
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	/*
+	 * Now locate hardware pipeline with support for 3D LUT
+	 * This can be different from the currently programmed pipeline number.
+	 * 3D LUT in this case is in pipeline no 2, while 1 is the currently
+	 * enabled pipeline. Hence this will require a pipeline switch.
+	 */
+	_3d_cp_num = get_color_pipeline(data, plane, HAS_3DLUT);
+
+	parse_3d_lut_pipeline(data, _3d_cp_num, &_3d_cp_info);
+	igt_assert(_3d_cp_info.seg_data);
+
+	cp.num = _3d_cp_num;
+
+	color_op_data[0].name = DRM_CB_3D_LUT;
+	lut_size = sizeof(struct drm_color_lut_ext) *
+			_3d_cp_info.seg_data->entries_count;
+	_3d_lut = create_linear_lut(_3d_cp_info.seg_data);
+	igt_assert(drmModeCreatePropertyBlob(display->drm_fd,
+					     _3d_lut, lut_size, &blob_id) == 0);
+	color_op_data[0].blob_id = blob_id;
+
+	/*
+	 * Set color pipeline with 3d lut as color_op along with pipeline
+	 * number having the respective support.
+	 * Since othe hardware blocks are not needed, no need to make any additional
+	 * entry in the data structure array. Driver is expected to disable all the
+	 * color hardware blocks and will only enable 3d LUT requested by the
+	 * SET_COLOR_PIPELINE property.
+	 */
+	igt_plane_replace_prop_blob(plane, IGT_PLANE_SET_COLOR_PIPELINE, &cp,
+				    sizeof(struct drm_color_pipeline));
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	/* Clean up Pre-CSC */
+	drmModeDestroyPropertyBlob(display->drm_fd,
+				   color_op_data[0].blob_id);
+	free(pre_csc_lut);
+
+	/* Reset Pipe Line */
+	igt_plane_replace_prop_blob(plane, IGT_PLANE_SET_COLOR_PIPELINE, NULL, 0);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	/* Clean up 3D-LUT */
+	drmModeDestroyPropertyBlob(display->drm_fd,
+				   color_op_data[0].blob_id);
+	free(_3d_lut);
+	free(color_op_data);
+
+	return true;
+}
+
 #undef HAS_PRE_CSC
 #undef HAS_CSC
 #undef HAS_POST_CSC
@@ -1635,6 +1788,10 @@ run_tests_for_pipe(data_t *data)
 		  "Find a color pipeline with pre-csc,csc and post-csc pipeline."
 		  "Set up all blocks and then set only pre-csc"
 		},
+		{ "plane-cp-test-2", plane_cp_test_2,
+		  "Find a color pipeline with pre-csc and then program the block."
+		  "Then find a color pipeline with 3D lut and program the block"
+		},
 	};
 	enum pipe active_pipes[IGT_MAX_PIPES];
 	uint32_t last_pipe = 0;
-- 
2.25.1
