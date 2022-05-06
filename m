Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F170610E669
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 05:48:01 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 May 2022 11:14:43 +0530
Message-Id: <20220506054446.3228224-13-bhanuprakash.modem@intel.com>
In-Reply-To: <20220506054446.3228224-1-bhanuprakash.modem@intel.com>
References: <20220506054446.3228224-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v4 12/15] kms_color_helper: Add helper functions to
 support logarithmic gamma mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>

Add helper functions to support logarithmic gamma mode

v2:
* Refactor the logic (Bhanu)

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color_helper.c | 123 +++++++++++++++++++++++++++++++++++++++
 tests/kms_color_helper.h |  15 +++++
 2 files changed, 138 insertions(+)

diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index cf8dfee1..2f50e2e7 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -172,6 +172,30 @@ gamma_lut_t *generate_table(int lut_size, double exp)
 	return gamma;
 }
 
+gamma_lut_t *generate_table_unity(segment_data_t *info)
+{
+	uint32_t segment, entry, index = 0;
+	double val;
+	int i = 0;
+	gamma_lut_t *gamma = alloc_lut(info->entries_count);
+	igt_assert(gamma);
+
+	for (segment = 0; segment < info->segment_count; segment++) {
+		uint32_t entry_count = info->segment_data[segment].count;
+		uint32_t start = (segment == 0) ? 0 : (1 << (segment - 1));
+		uint32_t end = 1 << segment;
+
+		for (entry = 0; entry < entry_count; entry++) {
+			val = start + entry * ((end - start) * 1.0 / entry_count);
+
+			set_rgb(&gamma->coeffs[i++], val);
+			index++;
+		}
+	}
+
+	return gamma;
+}
+
 gamma_lut_t *generate_table_max(int lut_size)
 {
 	gamma_lut_t *gamma = alloc_lut(lut_size);
@@ -242,6 +266,31 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
 	return lut;
 }
 
+struct drm_color_lut *coeffs_to_lut_adv(data_t *data,
+					const gamma_lut_t *gamma,
+					int max_hw_value)
+{
+	struct drm_color_lut *lut;
+	int i, lut_size = gamma->size;
+	uint32_t max_value = (1 << 16) - 1;
+
+	lut = malloc(sizeof(struct drm_color_lut) * lut_size);
+	igt_assert(lut);
+
+	for (i = 0; i < lut_size; i++) {
+		double scaling_factor = (double)max_value / (double)max_hw_value;
+		uint32_t r = MIN((gamma->coeffs[i].r * scaling_factor), max_value);
+		uint32_t g = MIN((gamma->coeffs[i].g * scaling_factor), max_value);
+		uint32_t b = MIN((gamma->coeffs[i].b * scaling_factor), max_value);
+
+		lut[i].red = r;
+		lut[i].green = g;
+		lut[i].blue = b;
+	}
+
+	return lut;
+}
+
 void set_degamma(data_t *data,
 		 igt_pipe_t *pipe,
 		 const gamma_lut_t *gamma)
@@ -255,6 +304,15 @@ void set_degamma(data_t *data,
 	free(lut);
 }
 
+void set_pipe_gamma(igt_pipe_t *pipe,
+		    uint64_t value,
+		    struct drm_color_lut *lut,
+		    uint32_t size)
+{
+	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_GAMMA_MODE, value);
+	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_GAMMA_LUT, lut, size);
+}
+
 void set_gamma(data_t *data,
 	       igt_pipe_t *pipe, const gamma_lut_t *gamma)
 {
@@ -301,6 +359,23 @@ void disable_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop)
 		igt_pipe_obj_replace_prop_blob(pipe, prop, NULL, 0);
 }
 
+drmModePropertyPtr get_pipe_gamma_degamma_mode(igt_pipe_t *pipe,
+					       enum igt_atomic_crtc_properties prop)
+{
+	igt_display_t *display = pipe->display;
+	uint32_t prop_id = pipe->props[prop];
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
 drmModePropertyPtr get_plane_gamma_degamma_mode(igt_plane_t *plane,
 				enum igt_atomic_plane_properties prop)
 {
@@ -387,6 +462,7 @@ segment_data_t *get_segment_data(data_t *data,
 	info->segment_data = malloc(sizeof(struct drm_color_lut_range) * info->segment_count);
 	igt_assert(info->segment_data);
 
+	info->entries_count = 0;
 	for (i = 0; i < info->segment_count; i++) {
 		info->entries_count += lut_range[i].count;
 		info->segment_data[i] = lut_range[i];
@@ -397,6 +473,53 @@ segment_data_t *get_segment_data(data_t *data,
 	return info;
 }
 
+void set_advance_gamma(data_t *data, igt_pipe_t *pipe, enum gamma_type type)
+{
+	igt_display_t *display = &data->display;
+	gamma_lut_t *gamma_log;
+	drmModePropertyPtr gamma_mode = NULL;
+	segment_data_t *segment_info = NULL;
+	struct drm_color_lut *lut = NULL;
+	int lut_size = 0;
+	int max_hw_value = 0;
+
+	drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES, 1);
+	gamma_mode = get_pipe_gamma_degamma_mode(pipe, IGT_CRTC_GAMMA_MODE);
+
+	for (int i = 0; i < gamma_mode->count_enums; i++) {
+		if (!strcmp(gamma_mode->enums[i].name, "logarithmic gamma")) {
+			segment_info = get_segment_data(data,
+							gamma_mode->enums[i].value,
+							gamma_mode->enums[i].name);
+			lut_size = sizeof(struct drm_color_lut) *
+					  segment_info->entries_count;
+			max_hw_value = segment_info->segment_data[segment_info->segment_count - 1].end;
+			gamma_log->size = segment_info->entries_count;
+
+			if (type == UNITY_GAMMA) {
+				gamma_log = generate_table_unity(segment_info);
+				lut = coeffs_to_lut_adv(data, gamma_log, max_hw_value);
+			} else if (type == MAX_GAMMA) {
+				gamma_log = generate_table_max(segment_info->entries_count);
+				lut = coeffs_to_lut(data, gamma_log, data->color_depth, 0);
+			}
+			if (is_i915_device(data->drm_fd))
+				lut[0].red = lut[0].green = lut[0].blue = 0;
+
+			set_pipe_gamma(pipe, gamma_mode->enums[i].value,
+				       lut, lut_size);
+			igt_display_commit2(display, display->is_atomic
+					    ? COMMIT_ATOMIC : COMMIT_LEGACY);
+			break;
+		}
+	}
+	drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES, 0);
+	free(gamma_log);
+	free(lut);
+	clear_segment_data(segment_info);
+	drmModeFreeProperty(gamma_mode);
+}
+
 void set_plane_gamma(igt_plane_t *plane,
 		char *mode,
 		struct drm_color_lut_ext *lut,
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 33674f73..fbc4bf99 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -73,6 +73,11 @@ typedef struct {
 	uint32_t entries_count;
 } segment_data_t;
 
+enum gamma_type {
+	UNITY_GAMMA,
+	MAX_GAMMA
+};
+
 #define MIN(a, b) ((a) < (b) ? (a) : (b))
 
 bool panel_supports_deep_color(int fd, drmModeConnector *connector);
@@ -90,10 +95,14 @@ void free_lut(gamma_lut_t *gamma);
 gamma_lut_t *generate_table(int lut_size, double exp);
 gamma_lut_t *generate_table_max(int lut_size);
 gamma_lut_t *generate_table_zero(int lut_size);
+gamma_lut_t *generate_table_unity(segment_data_t *info);
 struct drm_color_lut *coeffs_to_lut(data_t *data,
 				    const gamma_lut_t *gamma,
 				    uint32_t color_depth,
 				    int off);
+struct drm_color_lut *coeffs_to_lut_adv(data_t *data,
+						const gamma_lut_t *gamma,
+						int max_hw_value);
 void set_degamma(data_t *data,
 		 igt_pipe_t *pipe,
 		 const gamma_lut_t *gamma);
@@ -103,12 +112,18 @@ void set_gamma(data_t *data,
 void set_ctm(igt_pipe_t *pipe, const double *coefficients);
 void disable_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop);
 
+drmModePropertyPtr get_pipe_gamma_degamma_mode(igt_pipe_t *pipe,
+					       enum igt_atomic_crtc_properties
+					       prop);
 drmModePropertyPtr get_plane_gamma_degamma_mode(igt_plane_t *plane,
 	enum igt_atomic_plane_properties prop);
 void clear_segment_data(segment_data_t *info);
 struct drm_color_lut_ext *create_unity_lut(segment_data_t *info);
 struct drm_color_lut_ext *create_max_lut(segment_data_t *info);
 segment_data_t *get_segment_data(data_t *data, uint64_t blob_id, char *mode);
+void set_pipe_gamma(igt_pipe_t *pipe, uint64_t value,
+		    struct drm_color_lut *lut, uint32_t size);
+void set_advance_gamma(data_t *data, igt_pipe_t *pipe, enum gamma_type type);
 void set_plane_gamma(igt_plane_t *plane,
 	char *mode, struct drm_color_lut_ext *lut, uint32_t size);
 void set_plane_degamma(igt_plane_t *plane,
-- 
2.35.1
