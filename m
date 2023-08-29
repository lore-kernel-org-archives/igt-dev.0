Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4E310E394
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Aug 2023 14:42:21 +0000 (UTC)
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Aug 2023 20:08:21 +0530
Message-Id: <20230829143821.1417623-10-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20230829143821.1417623-1-chaitanya.kumar.borah@intel.com>
References: <20230829143821.1417623-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 9/9] tests/kms_color: Add test to
 demonstrate vendor specific color operations
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

Intel SDR planes have support for fixed function CSC. Demonstrate how
the new uAPI can be used to program this.

Co-developed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_color.c | 115 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 2f874a59a..60a0512dd 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -1072,6 +1072,7 @@ static void run_plane_color_test(data_t *data, enum pipe pipe,
 #define HAS_COLOR_CONVERSION_CAP (HAS_PRE_CSC |\
 			HAS_CSC | HAS_POST_CSC)
 #define HAS_3DLUT    BIT(3)
+#define HAS_PRIVATE    BIT(4)
 
 #define MIN(a, b) ((a) < (b) ? (a) : (b))
 
@@ -1124,6 +1125,7 @@ uint32_t get_color_op_cap(enum color_op_block name)
 	case DRM_CB_3D_LUT:
 		return HAS_3DLUT;
 	case DRM_CB_PRIVATE:
+		return HAS_PRIVATE;
 	case DRM_CB_INVAL:
 	default:
 		return 0;
@@ -1769,6 +1771,116 @@ static bool test_plane_ctm(data_t *data,
 	return ret;
 }
 
+static bool plane_ovl_fixed_func(data_t *data, igt_plane_t *plane)
+{
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode = data->mode;
+	igt_output_t *output = data->output;
+	struct igt_fb fb;
+	uint64_t color_pipeline = 0;
+	struct drm_color_pipeline cp;
+	drmModePropertyBlobPtr blob = NULL;
+	struct drm_color_op *color_op;
+	struct drm_color_op_data *color_op_data;
+	uint32_t blob_id;
+	bool ff_csc = false;
+	struct i915_color_op_data ff_data;
+
+	if (!is_i915_device(data->drm_fd))
+		igt_skip("Skipping as test only applicable for i915\n");
+
+	igt_info("Plane Color Pipeline test is running on pipe-%s plane-%d(%s)\n",
+		 kmstest_pipe_name(plane->pipe->pipe), plane->index,
+		 kmstest_plane_type_name(plane->type));
+
+	if (plane->type != DRM_PLANE_TYPE_OVERLAY) {
+		igt_info("Skipping as test only applicable for overlay planes\n");
+		return true;
+	}
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
+	/* Find the pipeline with private color op */
+	color_pipeline = get_color_pipeline(data, plane, HAS_PRIVATE);
+
+	if (!color_pipeline)
+		igt_skip("No valid pipeline found\n");
+
+	igt_info("color pipeline found %ld\n", color_pipeline);
+
+	/* Find the color op which can perform fix function CSC */
+	blob = drmModeGetPropertyBlob(data->drm_fd, color_pipeline);
+	igt_assert(blob);
+	igt_assert(blob->length);
+	color_op = blob->data;
+
+	for (int j = 0; j < blob->length / sizeof(struct drm_color_op); j++) {
+		if (color_op[j].name == DRM_CB_PRIVATE &&
+		    color_op[j].private_flags == I915_COLOR_OP_FIXED_FUNC_CSC) {
+			ff_csc = true;
+			break;
+		}
+	}
+
+	drmModeFreePropertyBlob(blob);
+
+	if (ff_csc) {
+		/* If found, go ahead and setup the pipeline */
+		color_op_data = calloc(1, sizeof(struct drm_color_op_data));
+		cp.num = color_pipeline;
+		cp.size = sizeof(struct drm_color_op_data);
+		cp.data = color_op_data;
+
+		color_op_data[0].name = DRM_CB_PRIVATE;
+
+		/* set up data to invoke desired CSC opeartion */
+		ff_data.flag = I915_COLOR_OP_FIXED_FUNC_CSC;
+		ff_data.csc_type = I915_CSC_YUV2020_TO_RGB2020;
+
+		/* create a blob for the data */
+		igt_assert(drmModeCreatePropertyBlob(display->drm_fd,
+						     &ff_data, sizeof(struct i915_color_op_data),
+						     &blob_id) == 0);
+		color_op_data[0].blob_id = blob_id;
+
+		/* set color pipeline with desired values */
+		igt_plane_replace_prop_blob(plane, IGT_PLANE_SET_COLOR_PIPELINE, &cp,
+					    sizeof(struct drm_color_pipeline));
+		igt_display_commit2(display, COMMIT_ATOMIC);
+
+	} else {
+		igt_skip("Skipping as fixed function hardware not found");
+	}
+
+	/****** Reset Pipe Line *******/
+	igt_plane_replace_prop_blob(plane, IGT_PLANE_SET_COLOR_PIPELINE, NULL, 0);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	/* destroy blob as it's job is done */
+	drmModeDestroyPropertyBlob(display->drm_fd,
+				   color_op_data[0].blob_id);
+
+	igt_plane_set_fb(plane, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	return true;
+}
+
 #undef HAS_PRE_CSC
 #undef HAS_CSC
 #undef HAS_POST_CSC
@@ -1987,6 +2099,9 @@ run_tests_for_pipe(data_t *data)
 		  "Find a color pipeline with pre-csc and then program the block."
 		  "Then find a color pipeline with 3D lut and program the block"
 		},
+		{ "plane-ovl-fixed-func", plane_ovl_fixed_func,
+		  "Test is to demo how a vendor specific fixed function hardware can be detected and programmed"
+		},
 	};
 	enum pipe active_pipes[IGT_MAX_PIPES];
 	uint32_t last_pipe = 0;
-- 
2.25.1
