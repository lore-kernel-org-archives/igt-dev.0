Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DE510E38B
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Aug 2023 14:42:15 +0000 (UTC)
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Aug 2023 20:08:17 +0530
Message-Id: <20230829143821.1417623-6-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20230829143821.1417623-1-chaitanya.kumar.borah@intel.com>
References: <20230829143821.1417623-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/9] tests/kms_color: Add test setting and
 changing a plane color pipeline
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

Identify a plane color pipeline with support for pre-csc, CTM and
post-csc hardware blocks.

Enable all these hardware blocks with unity lut values and co-effs,
by creating blobs and sending the same with SET_COLOR_PIPELINE property.
Later change pre-csc hardware unit from unity to max lut co-effs keeping
the rest of the hardware blocks intact.

ToDo: Break the change down to smaller parts with the helpers going to
separate patch.

Co-developed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_color.c | 322 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 321 insertions(+), 1 deletion(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 22f957534..a0159a0de 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -1072,11 +1072,38 @@ static void run_plane_color_test(data_t *data, enum pipe pipe,
 #define HAS_COLOR_CONVERSION_CAP (HAS_PRE_CSC |\
 			HAS_CSC | HAS_POST_CSC)
 
+#define MIN(a, b) ((a) < (b) ? (a) : (b))
+
+/* Structure to store information regarding lut ranges */
+typedef struct {
+	uint32_t segment_count;
+	struct drm_color_lut_range *segment_data;
+	uint32_t entries_count;
+} segment_data_t;
+
+struct color_conversion_pipeline_info {
+	u32 pre_csc_blob_id;
+	u32 csc_blob_id;
+	u32 post_csc_blob_id;
+	segment_data_t *pre_csc_seg_data;
+	segment_data_t *post_csc_seg_data;
+};
+
 uint32_t get_color_op_cap(enum color_op_block name);
 drmModePropertyPtr get_plane_property(igt_plane_t *plane,
 				      enum igt_atomic_plane_properties prop);
 uint64_t get_color_pipeline(data_t *data,
 			    igt_plane_t *plane, uint8_t capabilities);
+segment_data_t *get_segment_data(data_t *data,
+				 uint64_t blob_id);
+void parse_color_conv_pipeline(data_t *data, uint64_t color_pipeline,
+			       struct color_conversion_pipeline_info *cp_info);
+void clear_pipeline_seg_info(struct color_conversion_pipeline_info cp_info);
+void destroy_csc_pipeline_blobs(data_t *data,
+				struct color_conversion_pipeline_info cp_info);
+struct drm_color_lut_ext *create_linear_lut(segment_data_t *info);
+struct drm_color_lut_ext *create_max_lut(segment_data_t *info);
+struct drm_color_ctm *create_ctm(const double *ctm_coefficients);
 
 uint32_t get_color_op_cap(enum color_op_block name)
 {
@@ -1163,6 +1190,294 @@ uint64_t get_color_pipeline(data_t *data,
 	return color_pipeline;
 }
 
+/* helper to extract segment data from a blob */
+segment_data_t *get_segment_data(data_t *data,
+				 uint64_t blob_id)
+{
+	drmModePropertyBlobPtr blob;
+	struct drm_color_lut_range *lut_range = NULL;
+	segment_data_t *info = NULL;
+	uint32_t i;
+
+	blob = drmModeGetPropertyBlob(data->drm_fd, blob_id);
+	igt_assert(blob);
+	igt_assert(blob->length);
+
+	info = malloc(sizeof(segment_data_t));
+	igt_assert(info);
+
+	lut_range = (struct drm_color_lut_range *)blob->data;
+	info->segment_count = blob->length / sizeof(lut_range[0]);
+	igt_assert(info->segment_count);
+
+	info->segment_data = malloc(sizeof(struct drm_color_lut_range) * info->segment_count);
+	igt_assert(info->segment_data);
+
+	info->entries_count = 0;
+	for (i = 0; i < info->segment_count; i++) {
+		info->entries_count += lut_range[i].count;
+		info->segment_data[i] = lut_range[i];
+	}
+
+	drmModeFreePropertyBlob(blob);
+
+	return info;
+}
+
+/* helper to parse segment data for pre-csc and post-csc blocks */
+void parse_color_conv_pipeline(data_t *data, uint64_t color_pipeline,
+			       struct color_conversion_pipeline_info *cp_info)
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
+			if (color_op[j].name == DRM_CB_PRE_CSC) {
+				cp_info->pre_csc_seg_data =
+					get_segment_data(data, color_op[j].blob_id);
+			} else if (color_op[j].name == DRM_CB_POST_CSC) {
+				cp_info->post_csc_seg_data =
+					get_segment_data(data, color_op[j].blob_id);
+			}
+		}
+	}
+
+	drmModeFreePropertyBlob(blob);
+}
+
+void clear_pipeline_seg_info(struct color_conversion_pipeline_info cp_info)
+{
+	free(cp_info.pre_csc_seg_data);
+	free(cp_info.post_csc_seg_data);
+}
+
+void destroy_csc_pipeline_blobs(data_t *data,
+				struct color_conversion_pipeline_info cp_info)
+{
+	if (cp_info.pre_csc_blob_id)
+		igt_assert(drmModeDestroyPropertyBlob(data->drm_fd,
+						      cp_info.pre_csc_blob_id) == 0);
+	if (cp_info.csc_blob_id)
+		igt_assert(drmModeDestroyPropertyBlob(data->drm_fd,
+						      cp_info.csc_blob_id) == 0);
+	if (cp_info.post_csc_blob_id)
+		igt_assert(drmModeDestroyPropertyBlob(data->drm_fd,
+						      cp_info.post_csc_blob_id) == 0);
+}
+
+struct drm_color_lut_ext *create_linear_lut(segment_data_t *info)
+{
+	uint32_t val, segment, entry, index = 0;
+	uint32_t max_val = 0xffffffff;
+	struct drm_color_lut_ext *lut = malloc(sizeof(struct drm_color_lut_ext) *
+					       info->entries_count);
+
+	igt_assert(lut);
+
+	for (segment = 0; segment < info->segment_count; segment++) {
+		uint32_t entry_count = info->segment_data[segment].count;
+		uint32_t start = info->segment_data[segment].start;
+		uint32_t end = info->segment_data[segment].end;
+
+		for (entry = 1; entry <= entry_count; entry++) {
+			val = (index == 0) ? /* First entry is Zero. */
+			       0 : start + entry * ((end - start) * 1.0 / entry_count);
+
+			lut[index].red = lut[index].green = lut[index].blue = MIN(val, max_val);
+
+			index++;
+		}
+	}
+
+	return lut;
+}
+
+struct drm_color_lut_ext *create_max_lut(segment_data_t *info)
+{
+	int i;
+	struct drm_color_lut_ext *lut;
+	/* ToDo: Determine max value for Lut taking h/w precision into account */
+	uint32_t max_val = 0xffffffff;
+
+	lut = malloc(sizeof(struct drm_color_lut_ext) * info->entries_count);
+	igt_assert(lut);
+
+	lut[0].red = lut[0].green = lut[0].blue = 0; /* First entry is Zero. */
+
+	for (i = 1; i < info->entries_count; i++)
+		lut[i].red = lut[i].green = lut[i].blue = max_val;
+
+	return lut;
+}
+
+struct drm_color_ctm *create_ctm(const double *ctm_coefficients)
+{
+	struct drm_color_ctm *ctm;
+	int i;
+
+	ctm = malloc(sizeof(struct drm_color_ctm));
+	igt_assert(ctm);
+
+	for (i = 0; i < ARRAY_SIZE(ctm->matrix); i++) {
+		if (ctm_coefficients[i] < 0) {
+			ctm->matrix[i] =
+				(int64_t)(-ctm_coefficients[i] *
+						((int64_t)1L << 32));
+			ctm->matrix[i] |= 1ULL << 63;
+		} else {
+			ctm->matrix[i] =
+				(int64_t)(ctm_coefficients[i] *
+						((int64_t)1L << 32));
+		}
+	}
+
+	return ctm;
+}
+
+/*
+ * Find a color pipeline with pre-csc,csc and post-csc pipeline.
+ * Set up all blocks and then set only pre-csc
+ */
+static bool plane_cp_test_1(data_t *data, igt_plane_t *plane)
+{
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode = data->mode;
+	igt_output_t *output = data->output;
+	struct igt_fb fb;
+	uint64_t color_pipeline = 0;
+	struct color_conversion_pipeline_info cp_info;
+	struct drm_color_pipeline cp;
+	struct drm_color_op_data *color_op_data;
+	struct drm_color_ctm *ctm;
+	struct drm_color_lut_ext *pre_csc_lut, *post_csc_lut;
+	uint32_t blob_id;
+	const double ctm_coefficients[] = {
+		1.0, 0.0, 0.0,
+		0.0, 1.0, 0.0,
+		0.0, 0.0, 1.0
+	};
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
+	/* Find the pipeline with pre-csc, ctm and post-csc hardware unit */
+	color_pipeline = get_color_pipeline(data, plane, HAS_COLOR_CONVERSION_CAP);
+
+	if (!color_pipeline) {
+		igt_info("No pipeline with caps 0x%lx\n", HAS_COLOR_CONVERSION_CAP);
+		return true;
+	}
+
+	igt_info("color pipeline %ld\n", color_pipeline);
+
+	/* Parse the pipeline data and get capabilities for the respective hardware blocks */
+	parse_color_conv_pipeline(data, color_pipeline, &cp_info);
+	igt_assert(cp_info.pre_csc_seg_data);
+	igt_assert(cp_info.post_csc_seg_data);
+
+	/*
+	 * Allocate color_op_data with 3 entries representing the hardware units
+	 * which needs to be updated. This will be updated with the actual lut
+	 * and CTM co-effs and passed to driver using SET_COLOR_PIPELINE property.
+	 */
+	color_op_data = calloc(1, sizeof(struct drm_color_op_data) * 3);
+	cp.num = color_pipeline;
+	cp.size = sizeof(struct drm_color_op_data) * 3;
+	cp.data = color_op_data;
+
+	/* Set Pre-CSC */
+	color_op_data[0].name = DRM_CB_PRE_CSC;
+	lut_size = sizeof(struct drm_color_lut_ext) *
+			cp_info.pre_csc_seg_data->entries_count;
+	pre_csc_lut = create_linear_lut(cp_info.pre_csc_seg_data);
+	igt_assert(drmModeCreatePropertyBlob(display->drm_fd,
+					     pre_csc_lut, lut_size, &blob_id) == 0);
+	color_op_data[0].blob_id = blob_id;
+	cp_info.pre_csc_blob_id = blob_id;
+
+	/* Set CTM */
+	color_op_data[1].name = DRM_CB_CSC;
+	ctm = create_ctm(ctm_coefficients);
+	igt_assert(drmModeCreatePropertyBlob(display->drm_fd,
+					     ctm, sizeof(struct drm_color_ctm), &blob_id) == 0);
+	color_op_data[1].blob_id = blob_id;
+	cp_info.csc_blob_id = blob_id;
+
+	/* Set Post-CSC */
+	color_op_data[2].name = DRM_CB_POST_CSC;
+	lut_size = sizeof(struct drm_color_lut_ext) *
+	cp_info.post_csc_seg_data->entries_count;
+	post_csc_lut = create_linear_lut(cp_info.post_csc_seg_data);
+	igt_assert(drmModeCreatePropertyBlob(display->drm_fd,
+					     post_csc_lut, lut_size, &blob_id) == 0);
+	color_op_data[2].blob_id = blob_id;
+	cp_info.post_csc_blob_id = blob_id;
+
+	/* Data structure with values for all blocks is ready. Send the same to driver */
+	igt_plane_replace_prop_blob(plane, IGT_PLANE_SET_COLOR_PIPELINE, &cp,
+				    sizeof(struct drm_color_pipeline));
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	/*
+	 * Now the Color pipeline with pre-csc, ctm and post-csc is enabled
+	 * Lets change just the pre-csc unit in hardware
+	 */
+	if (color_op_data[0].blob_id) {
+		drmModeDestroyPropertyBlob(display->drm_fd,
+					   color_op_data[0].blob_id);
+		free(pre_csc_lut);
+
+		lut_size = sizeof(struct drm_color_lut_ext) *
+				cp_info.pre_csc_seg_data->entries_count;
+
+		pre_csc_lut = create_max_lut(cp_info.pre_csc_seg_data);
+		igt_assert(drmModeCreatePropertyBlob(display->drm_fd,
+						     pre_csc_lut, lut_size, &blob_id) == 0);
+
+		color_op_data[0].blob_id = blob_id;
+		cp_info.pre_csc_blob_id = blob_id;
+		igt_plane_replace_prop_blob(plane, IGT_PLANE_SET_COLOR_PIPELINE, &cp,
+					    sizeof(struct drm_color_pipeline));
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	}
+
+	/* Reset Pipeline */
+	igt_plane_replace_prop_blob(plane, IGT_PLANE_SET_COLOR_PIPELINE, NULL, 0);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	destroy_csc_pipeline_blobs(data, cp_info);
+	free(ctm);
+	free(pre_csc_lut);
+	free(post_csc_lut);
+	free(color_op_data);
+	clear_pipeline_seg_info(cp_info);
+
+	return true;
+}
+
 #undef HAS_PRE_CSC
 #undef HAS_CSC
 #undef HAS_POST_CSC
@@ -1315,7 +1630,12 @@ run_tests_for_pipe(data_t *data)
 		const char *name;
 		bool (*test_t)(data_t*, igt_plane_t*);
 		const char *desc;
-	} plane_colorpipeline_tests[] = {};
+	} plane_colorpipeline_tests[] = {
+		{ "plane-cp-test-1", plane_cp_test_1,
+		  "Find a color pipeline with pre-csc,csc and post-csc pipeline."
+		  "Set up all blocks and then set only pre-csc"
+		},
+	};
 	enum pipe active_pipes[IGT_MAX_PIPES];
 	uint32_t last_pipe = 0;
 	int i;
-- 
2.25.1
