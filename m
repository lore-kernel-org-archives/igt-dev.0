Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF6B10E38B
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Aug 2023 14:42:13 +0000 (UTC)
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Aug 2023 20:08:16 +0530
Message-Id: <20230829143821.1417623-5-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20230829143821.1417623-1-chaitanya.kumar.borah@intel.com>
References: <20230829143821.1417623-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/9] tests/kms_color: Add helper to search
 for a color pipeline
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

The caller of the helper sends the capabilities/color blocks it desires
as an argument. If a color pipeline with desired capabilities is present
the pipeline number is returned or else it returns 0 which indicates
no color pipeline was found.

Co-developed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_color.c | 102 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 667eb2168..22f957534 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -1066,6 +1066,108 @@ static void run_plane_color_test(data_t *data, enum pipe pipe,
 		igt_skip("No valid planes found.\n");
 }
 
+#define HAS_PRE_CSC  BIT(0)
+#define HAS_CSC      BIT(1)
+#define HAS_POST_CSC BIT(2)
+#define HAS_COLOR_CONVERSION_CAP (HAS_PRE_CSC |\
+			HAS_CSC | HAS_POST_CSC)
+
+uint32_t get_color_op_cap(enum color_op_block name);
+drmModePropertyPtr get_plane_property(igt_plane_t *plane,
+				      enum igt_atomic_plane_properties prop);
+uint64_t get_color_pipeline(data_t *data,
+			    igt_plane_t *plane, uint8_t capabilities);
+
+uint32_t get_color_op_cap(enum color_op_block name)
+{
+	switch (name) {
+	case DRM_CB_PRE_CSC:
+		return HAS_PRE_CSC;
+	case DRM_CB_POST_CSC:
+		return HAS_POST_CSC;
+	case DRM_CB_CSC:
+		return HAS_CSC;
+	case DRM_CB_PRIVATE:
+	case DRM_CB_INVAL:
+	default:
+		return 0;
+	}
+}
+
+drmModePropertyPtr get_plane_property(igt_plane_t *plane,
+				      enum igt_atomic_plane_properties prop)
+{
+	igt_display_t *display = plane->pipe->display;
+	uint32_t prop_id = plane->props[prop];
+	drmModePropertyPtr drmProp;
+
+	igt_assert(prop_id);
+
+	drmProp = drmModeGetProperty(display->drm_fd, prop_id);
+
+	igt_assert(drmProp);
+	igt_assert(drmProp->count_enums);
+
+	return drmProp;
+}
+
+/*
+ * search for a color pipeline in a plane with desired capabilities
+ */
+uint64_t get_color_pipeline(data_t *data,
+			    igt_plane_t *plane, uint8_t capabilities)
+{
+	drmModePropertyPtr pipeline_prop;
+	struct drm_color_op *color_op;
+	uint32_t color_pipeline_caps = 0;
+	uint64_t color_pipeline = 0;
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GET_COLOR_PIPELINE));
+
+	pipeline_prop = get_plane_property(plane, IGT_PLANE_GET_COLOR_PIPELINE);
+	for (int i = 0; i < pipeline_prop->count_enums; i++) {
+		uint64_t blob_id;
+
+		igt_info("Color Pipeline : \"%s\" number: %lld\n", pipeline_prop->enums[i].name,
+			 pipeline_prop->enums[i].value);
+
+		blob_id = pipeline_prop->enums[i].value;
+		if (blob_id) {
+			drmModePropertyBlobPtr blob = NULL;
+
+			blob = drmModeGetPropertyBlob(data->drm_fd, blob_id);
+			igt_assert(blob);
+			igt_assert(blob->length);
+			color_op = blob->data;
+			igt_info(" color_op num %ld\n", blob->length / sizeof(struct drm_color_op));
+
+			for (int j = 0; j < blob->length / sizeof(struct drm_color_op); j++) {
+				igt_info("  color_op [%d]\n", j);
+				igt_info("   name %d\n", color_op[j].name);
+				igt_info("   type %d\n", color_op[j].type);
+
+				color_pipeline_caps |= get_color_op_cap(color_op[j].name);
+			}
+			drmModeFreePropertyBlob(blob);
+		}
+
+		if (((color_pipeline_caps) & (capabilities)) == (capabilities)) {
+			color_pipeline = blob_id;
+			break;
+		}
+
+		color_pipeline_caps = 0;
+	}
+
+	drmModeFreeProperty(pipeline_prop);
+	return color_pipeline;
+}
+
+#undef HAS_PRE_CSC
+#undef HAS_CSC
+#undef HAS_POST_CSC
+#undef HAS_COLOR_CONVERSION_CAP
+
 static void
 run_colorpipeline_tests_for_plane(data_t *data, enum pipe p,
 				  bool (*test_t)(data_t*, igt_plane_t*))
-- 
2.25.1
