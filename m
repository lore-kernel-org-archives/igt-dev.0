Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C38410E4F2
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 05:47:42 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 May 2022 11:14:34 +0530
Message-Id: <20220506054446.3228224-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20220506054446.3228224-1-bhanuprakash.modem@intel.com>
References: <20220506054446.3228224-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v4 03/15] kms_color_helper: Add helper functions for
 plane color mgmt
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add helper functions to support Plane color management properties.

v2: (Pekka)
* Rename linear LUT to unity LUT
* Remove Intel specific logic from helper functions
* New function to fill ctm matrix
* Zero LUT for invalid lut_size tests
v3:
* Commit 'no (de)gamma' without LUT (Bhanu)
v4:
* Rebase

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color_helper.c | 180 +++++++++++++++++++++++++++++++++++++--
 tests/kms_color_helper.h |  29 +++++++
 2 files changed, 203 insertions(+), 6 deletions(-)

diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 3ef124cd..cf8dfee1 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -267,23 +267,31 @@ void set_gamma(data_t *data,
 	free(lut);
 }
 
-void set_ctm(igt_pipe_t *pipe, const double *coefficients)
+static void
+fill_ctm_matrix(struct drm_color_ctm *ctm, const double *coefficients)
 {
-	struct drm_color_ctm ctm;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(ctm.matrix); i++) {
+	igt_assert(ctm && coefficients);
+
+	for (i = 0; i < ARRAY_SIZE(ctm->matrix); i++) {
 		if (coefficients[i] < 0) {
-			ctm.matrix[i] =
+			ctm->matrix[i] =
 				(int64_t) (-coefficients[i] *
 				((int64_t) 1L << 32));
-			ctm.matrix[i] |= 1ULL << 63;
+			ctm->matrix[i] |= 1ULL << 63;
 		} else
-			ctm.matrix[i] =
+			ctm->matrix[i] =
 				(int64_t) (coefficients[i] *
 				((int64_t) 1L << 32));
 	}
+}
+
+void set_ctm(igt_pipe_t *pipe, const double *coefficients)
+{
+	struct drm_color_ctm ctm;
 
+	fill_ctm_matrix(&ctm, coefficients);
 	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_CTM, &ctm, sizeof(ctm));
 }
 
@@ -293,6 +301,136 @@ void disable_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop)
 		igt_pipe_obj_replace_prop_blob(pipe, prop, NULL, 0);
 }
 
+drmModePropertyPtr get_plane_gamma_degamma_mode(igt_plane_t *plane,
+				enum igt_atomic_plane_properties prop)
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
+struct drm_color_lut_ext *create_unity_lut(segment_data_t *info)
+{
+	uint32_t val, segment, entry, index = 0;
+	uint32_t max_val = 0xffffffff;
+	struct drm_color_lut_ext *lut = malloc(sizeof(struct drm_color_lut_ext) * info->entries_count);
+	igt_assert(lut);
+
+	for (segment = 0; segment < info->segment_count; segment++) {
+		uint32_t entry_count = info->segment_data[segment].count;
+		uint32_t start = info->segment_data[segment].start;
+		uint32_t end = info->segment_data[segment].end;
+
+		for (entry = 1; entry <= entry_count; entry++) {
+			val = start + entry * ((end - start) * 1.0 / entry_count);
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
+	uint32_t max_val = 0xffffffff;
+
+	lut = malloc(sizeof(struct drm_color_lut_ext) * info->entries_count);
+	igt_assert(lut);
+
+	for (i = 0; i < info->entries_count; i++)
+		lut[i].red = lut[i].green = lut[i].blue = max_val;
+
+	return lut;
+}
+
+void clear_segment_data(segment_data_t *info)
+{
+	if (!info)
+		return;
+
+	free(info->segment_data);
+	free(info);
+}
+
+segment_data_t *get_segment_data(data_t *data,
+				uint64_t blob_id, char *mode)
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
+	lut_range = (struct drm_color_lut_range *) blob->data;
+	info->segment_count = blob->length / sizeof(lut_range[0]);
+	igt_assert(info->segment_count);
+
+	info->segment_data = malloc(sizeof(struct drm_color_lut_range) * info->segment_count);
+	igt_assert(info->segment_data);
+
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
+void set_plane_gamma(igt_plane_t *plane,
+		char *mode,
+		struct drm_color_lut_ext *lut,
+		uint32_t size)
+{
+	igt_plane_set_prop_enum(plane, IGT_PLANE_GAMMA_MODE, mode);
+	if (size)
+		igt_plane_replace_prop_blob(plane, IGT_PLANE_GAMMA_LUT, lut, size);
+}
+
+void set_plane_degamma(igt_plane_t *plane,
+		char *mode,
+		struct drm_color_lut_ext *lut,
+		uint32_t size)
+{
+	igt_plane_set_prop_enum(plane, IGT_PLANE_DEGAMMA_MODE, mode);
+	if (size)
+		igt_plane_replace_prop_blob(plane, IGT_PLANE_DEGAMMA_LUT, lut, size);
+}
+
+void set_plane_ctm(igt_plane_t *plane, const double *coefficients)
+{
+	struct drm_color_ctm ctm;
+
+	fill_ctm_matrix(&ctm, coefficients);
+	igt_plane_replace_prop_blob(plane, IGT_PLANE_CTM, &ctm, sizeof(ctm));
+}
+
+void disable_plane_prop(igt_plane_t *plane, enum igt_atomic_plane_properties prop)
+{
+	if (igt_plane_has_prop(plane, prop))
+		igt_plane_replace_prop_blob(plane, prop, NULL, 0);
+}
+
 drmModePropertyBlobPtr
 get_blob(data_t *data, igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop)
 {
@@ -326,6 +464,19 @@ pipe_set_property_blob_id(igt_pipe_t *pipe,
 	return ret;
 }
 
+static int
+plane_set_property_blob(igt_display_t *display,
+			igt_plane_t *plane,
+			enum igt_atomic_plane_properties prop,
+			void *ptr, size_t length)
+{
+	igt_plane_replace_prop_blob(plane, prop, ptr, length);
+
+	return igt_display_try_commit2(display,
+				       display->is_atomic ?
+				       COMMIT_ATOMIC : COMMIT_LEGACY);
+}
+
 int
 pipe_set_property_blob(igt_pipe_t *pipe,
 		       enum igt_atomic_crtc_properties prop,
@@ -371,6 +522,23 @@ invalid_lut_sizes(data_t *data, enum pipe p,
 	free(lut);
 }
 
+void
+invalid_plane_lut_sizes(igt_display_t *display,
+			igt_plane_t *plane,
+			enum igt_atomic_plane_properties prop,
+			size_t lut_size)
+{
+	void *lut = malloc(lut_size * 2);
+	igt_assert(lut);
+
+	memset(lut, 0, (lut_size * 2));
+	igt_assert_eq(plane_set_property_blob(display, plane, prop, lut, 1), -EINVAL);
+	igt_assert_eq(plane_set_property_blob(display, plane, prop, lut, lut_size + 1), -EINVAL);
+	igt_assert_eq(plane_set_property_blob(display, plane, prop, lut, lut_size - 1), -EINVAL);
+
+	free(lut);
+}
+
 void
 invalid_gamma_lut_sizes(data_t *data, enum pipe p)
 {
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index a6665b1f..33674f73 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -67,6 +67,14 @@ typedef struct {
 	color_t coeffs[];
 } gamma_lut_t;
 
+typedef struct {
+	uint32_t segment_count;
+	struct drm_color_lut_range *segment_data;
+	uint32_t entries_count;
+} segment_data_t;
+
+#define MIN(a, b) ((a) < (b) ? (a) : (b))
+
 bool panel_supports_deep_color(int fd, drmModeConnector *connector);
 uint64_t get_max_bpc(igt_output_t *output);
 void paint_gradient_rectangles(data_t *data,
@@ -95,10 +103,31 @@ void set_gamma(data_t *data,
 void set_ctm(igt_pipe_t *pipe, const double *coefficients);
 void disable_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop);
 
+drmModePropertyPtr get_plane_gamma_degamma_mode(igt_plane_t *plane,
+	enum igt_atomic_plane_properties prop);
+void clear_segment_data(segment_data_t *info);
+struct drm_color_lut_ext *create_unity_lut(segment_data_t *info);
+struct drm_color_lut_ext *create_max_lut(segment_data_t *info);
+segment_data_t *get_segment_data(data_t *data, uint64_t blob_id, char *mode);
+void set_plane_gamma(igt_plane_t *plane,
+	char *mode, struct drm_color_lut_ext *lut, uint32_t size);
+void set_plane_degamma(igt_plane_t *plane,
+	char *mode, struct drm_color_lut_ext *lut, uint32_t size);
+void set_plane_ctm(igt_plane_t *plane, const double *coefficients);
+void disable_plane_prop(igt_plane_t *plane, enum igt_atomic_plane_properties prop);
+void invalid_plane_lut_sizes(igt_display_t *display,
+			   igt_plane_t *plane,
+			   enum igt_atomic_plane_properties prop,
+			   size_t lut_size);
+
 #define disable_degamma(pipe) disable_prop(pipe, IGT_CRTC_DEGAMMA_LUT)
 #define disable_gamma(pipe) disable_prop(pipe, IGT_CRTC_GAMMA_LUT)
 #define disable_ctm(pipe) disable_prop(pipe, IGT_CRTC_CTM)
 
+#define disable_plane_degamma(plane) disable_plane_prop(plane, IGT_PLANE_DEGAMMA_LUT)
+#define disable_plane_gamma(plane) disable_plane_prop(plane, IGT_PLANE_GAMMA_LUT)
+#define disable_plane_ctm(plane) disable_plane_prop(plane, IGT_PLANE_CTM)
+
 drmModePropertyBlobPtr get_blob(data_t *data, igt_pipe_t *pipe,
 				enum igt_atomic_crtc_properties prop);
 bool crc_equal(igt_crc_t *a, igt_crc_t *b);
-- 
2.35.1
