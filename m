Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67726F48B
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 14:51:28 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Thu,  3 Jun 2021 20:10:01 +0530
Message-Id: <20210603144022.28176-2-venkata.sai.patnana@intel.com>
In-Reply-To: <20210603144022.28176-1-venkata.sai.patnana@intel.com>
References: <20210603144022.28176-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 i-g-t 02/23] kms_color_helper: Add helper
 functions for plane color mgmt
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Add helper functions to support Plane color management properties.

v2:
* Fix LUT size calculation logic (Bhanu)
v3:
* Remove redundant checks & drop unnecessary temp variables (Uma)
* Fix the hardcoded precision data (Bhanu)
* Fix the LUT creation logic by obtaining segment data (Uma)
* Restructure the helper functions to update plane props (Uma)
v4:
* Restructure to manage the memory (alloc & free) by the caller (Uma)

Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>
---
 tests/kms_color_helper.c | 144 +++++++++++++++++++++++++++++++++++++++
 tests/kms_color_helper.h |  25 +++++++
 2 files changed, 169 insertions(+)

diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 5f223a8812..a14a97999e 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -232,6 +232,150 @@ void disable_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop)
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
+struct drm_color_lut_ext *create_linear_lut(segment_data_t *info)
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
+			val = (index == 0) ? /* First entry is Zero. */
+				0 : start + entry * ((end - start) * 1.0 / entry_count);
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
+	igt_plane_replace_prop_blob(plane, IGT_PLANE_GAMMA_LUT, lut, size);
+}
+
+void set_plane_degamma(igt_plane_t *plane,
+		char *mode,
+		struct drm_color_lut_ext *lut,
+		uint32_t size)
+{
+	igt_plane_set_prop_enum(plane, IGT_PLANE_DEGAMMA_MODE, mode);
+	igt_plane_replace_prop_blob(plane, IGT_PLANE_DEGAMMA_LUT, lut, size);
+}
+
+void set_plane_ctm(igt_plane_t *plane, const double *coefficients)
+{
+	struct drm_color_ctm ctm;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ctm.matrix); i++) {
+		if (coefficients[i] < 0) {
+			ctm.matrix[i] =
+				(int64_t) (-coefficients[i] *
+				((int64_t) 1L << 32));
+			ctm.matrix[i] |= 1ULL << 63;
+		} else
+			ctm.matrix[i] =
+				(int64_t) (coefficients[i] *
+				((int64_t) 1L << 32));
+	}
+
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
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 88890724c2..945cc475e3 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -64,6 +64,14 @@ typedef struct {
 	double coeffs[];
 } gamma_lut_t;
 
+typedef struct {
+	uint32_t segment_count;
+	struct drm_color_lut_range *segment_data;
+	uint32_t entries_count;
+} segment_data_t;
+
+#define MIN(a, b) ((a) < (b) ? (a) : (b))
+
 void paint_gradient_rectangles(data_t *data,
 			       drmModeModeInfo *mode,
 			       color_t *colors,
@@ -90,10 +98,27 @@ void set_gamma(data_t *data,
 void set_ctm(igt_pipe_t *pipe, const double *coefficients);
 void disable_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop);
 
+drmModePropertyPtr get_plane_gamma_degamma_mode(igt_plane_t *plane,
+	enum igt_atomic_plane_properties prop);
+void clear_segment_data(segment_data_t *info);
+struct drm_color_lut_ext *create_linear_lut(segment_data_t *info);
+struct drm_color_lut_ext *create_max_lut(segment_data_t *info);
+segment_data_t *get_segment_data(data_t *data, uint64_t blob_id, char *mode);
+void set_plane_gamma(igt_plane_t *plane,
+	char *mode, struct drm_color_lut_ext *lut, uint32_t size);
+void set_plane_degamma(igt_plane_t *plane,
+	char *mode, struct drm_color_lut_ext *lut, uint32_t size);
+void set_plane_ctm(igt_plane_t *plane, const double *coefficients);
+void disable_plane_prop(igt_plane_t *plane, enum igt_atomic_plane_properties prop);
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
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
