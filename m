Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2736F6F492
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 14:51:57 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Thu,  3 Jun 2021 20:10:09 +0530
Message-Id: <20210603144022.28176-10-venkata.sai.patnana@intel.com>
In-Reply-To: <20210603144022.28176-1-venkata.sai.patnana@intel.com>
References: <20210603144022.28176-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 i-g-t 10/23] kms_color_helper: Add helper
 functions to support logarithmic gamma mode
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

From: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>

Add helper functions to support logarithmic gamma mode

v5: Move all compute/set logic to advance gamma mode function
v4: Removed unnecessary code and checks
    Makes the changes more generic
v3: calculate luts using gamma coefficients(Uma Shankar)

Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>
---
 tests/kms_color_helper.c | 132 ++++++++++++++++++++++++++++++++++++++-
 tests/kms_color_helper.h |  16 +++++
 2 files changed, 147 insertions(+), 1 deletion(-)

diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index a14a97999e..36a9964cbf 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -24,6 +24,8 @@
 
 #include "kms_color_helper.h"
 
+#define DRM_CLIENT_CAP_ADVANCE_GAMMA_MODES     6
+
 void paint_gradient_rectangles(data_t *data,
 			       drmModeModeInfo *mode,
 			       color_t *colors,
@@ -166,7 +168,8 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
 		 * Mask the lower bits not provided by the framebuffer so we
 		 * can do CRC comparisons.
 		 */
-		v &= mask;
+		if (intel_gen(data->devid) < 13)
+			v &= mask;
 
 		lut[i].red = v;
 		lut[i].green = v;
@@ -181,6 +184,33 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
 	return lut;
 }
 
+struct drm_color_lut *coeffs_to_logarithmic_lut(data_t *data,
+						const gamma_lut_t *gamma,
+						uint32_t color_depth,
+						int off)
+{
+	struct drm_color_lut *lut;
+	int i, lut_size = gamma->size;
+	/* This is the maximum value due to 16 bit precision in hardware. */
+	uint32_t max_hw_value = (1 << 16) - 1;
+	uint32_t v;
+	unsigned int max_segment_value = 1 << 24;
+	double scaling_factor;
+
+	lut = malloc(sizeof(struct drm_color_lut) * lut_size);
+
+	for (i = 0; i < lut_size; i++) {
+		scaling_factor = (double)max_hw_value / (double)max_segment_value;
+		v = (double)gamma->coeffs[i] * (double)scaling_factor;
+		v =  MIN(v, max_hw_value);
+		lut[i].red = v;
+		lut[i].green = v;
+		lut[i].blue = v;
+	}
+
+	return lut;
+}
+
 void set_degamma(data_t *data,
 		 igt_pipe_t *pipe,
 		 const gamma_lut_t *gamma)
@@ -194,6 +224,15 @@ void set_degamma(data_t *data,
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
@@ -232,6 +271,51 @@ void disable_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop)
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
+gamma_lut_t *pipe_create_linear_lut(segment_data_t *info)
+{
+	uint32_t segment, entry, index = 0;
+	double val;
+	int i = 0;
+	gamma_lut_t *gamma = alloc_lut(info->entries_count);
+
+	igt_assert(gamma);
+
+	gamma->size = info->entries_count;
+	for (segment = 0; segment < info->segment_count; segment++) {
+		uint32_t entry_count = info->segment_data[segment].count;
+		uint32_t start = (segment == 0) ? 0 : (1 << (segment - 1));
+		uint32_t end = 1 << segment;
+
+		for (entry = 0; entry < entry_count; entry++) {
+			val = (index == 0) ? /* First entry is Zero. */
+				0 : start + entry *
+				((end - start) * 1.0 / entry_count);
+
+			gamma->coeffs[i++] = val;
+			index++;
+		}
+	}
+
+	return gamma;
+}
+
 drmModePropertyPtr get_plane_gamma_degamma_mode(igt_plane_t *plane,
 				enum igt_atomic_plane_properties prop)
 {
@@ -322,6 +406,7 @@ segment_data_t *get_segment_data(data_t *data,
 	info->segment_data = malloc(sizeof(struct drm_color_lut_range) * info->segment_count);
 	igt_assert(info->segment_data);
 
+	info->entries_count = 0;
 	for (i = 0; i < info->segment_count; i++) {
 		info->entries_count += lut_range[i].count;
 		info->segment_data[i] = lut_range[i];
@@ -332,6 +417,51 @@ segment_data_t *get_segment_data(data_t *data,
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
+			if (type == LINEAR_GAMMA) {
+				gamma_log = pipe_create_linear_lut(segment_info);
+				lut = coeffs_to_logarithmic_lut(data,
+								gamma_log,
+								data->color_depth,
+								0);
+			} else if (type == MAX_GAMMA) {
+				gamma_log = generate_table_max(segment_info->entries_count);
+				gamma_log->size = segment_info->entries_count;
+				lut = coeffs_to_lut(data, gamma_log,
+						    data->color_depth, 0);
+			}
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
index 945cc475e3..14d42d29cc 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -70,6 +70,11 @@ typedef struct {
 	uint32_t entries_count;
 } segment_data_t;
 
+enum gamma_type {
+	LINEAR_GAMMA,
+	MAX_GAMMA
+};
+
 #define MIN(a, b) ((a) < (b) ? (a) : (b))
 
 void paint_gradient_rectangles(data_t *data,
@@ -89,6 +94,10 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
 				    const gamma_lut_t *gamma,
 				    uint32_t color_depth,
 				    int off);
+struct drm_color_lut *coeffs_to_logarithmic_lut(data_t *data,
+						const gamma_lut_t *gamma,
+						uint32_t color_depth,
+						int off);
 void set_degamma(data_t *data,
 		 igt_pipe_t *pipe,
 		 const gamma_lut_t *gamma);
@@ -98,12 +107,19 @@ void set_gamma(data_t *data,
 void set_ctm(igt_pipe_t *pipe, const double *coefficients);
 void disable_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop);
 
+drmModePropertyPtr get_pipe_gamma_degamma_mode(igt_pipe_t *pipe,
+					       enum igt_atomic_crtc_properties
+					       prop);
 drmModePropertyPtr get_plane_gamma_degamma_mode(igt_plane_t *plane,
 	enum igt_atomic_plane_properties prop);
 void clear_segment_data(segment_data_t *info);
+gamma_lut_t *pipe_create_linear_lut(segment_data_t *info);
 struct drm_color_lut_ext *create_linear_lut(segment_data_t *info);
 struct drm_color_lut_ext *create_max_lut(segment_data_t *info);
 segment_data_t *get_segment_data(data_t *data, uint64_t blob_id, char *mode);
+void set_pipe_gamma(igt_pipe_t *pipe, uint64_t value,
+		    struct drm_color_lut *lut, uint32_t size);
+void set_advance_gamma(data_t *data, igt_pipe_t *pipe, enum gamma_type type);
 void set_plane_gamma(igt_plane_t *plane,
 	char *mode, struct drm_color_lut_ext *lut, uint32_t size);
 void set_plane_degamma(igt_plane_t *plane,
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
