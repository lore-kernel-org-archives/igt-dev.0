Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4B510E8F3
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 15:04:09 +0000 (UTC)
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 8 Sep 2023 11:03:10 -0400
Message-ID: <20230908150315.75977-3-harry.wentland@amd.com>
In-Reply-To: <20230908150315.75977-1-harry.wentland@amd.com>
References: <20230908150315.75977-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC PATCH 2/7] lib/igt_kms: Introduce drm_colorop object
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Simon Ser <contact@emersion.fr>,
 Alexander Goins <agoins@nvidia.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Xaver Hugl <xaver.hugl@gmail.com>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>, Victoria
 Brekenfeld <victoria@system76.com>, Joshua Ashton <joshua@froggi.es>,
 Daniel Vetter <daniel@ffwll.ch>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Alexander Goins <agoins@nvidia.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Michel Dänzer <mdaenzer@redhat.com>
Cc: Aleix Pol <aleixpol@kde.org>
Cc: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Victoria Brekenfeld <victoria@system76.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Naseer Ahmed <quic_naseer@quicinc.com>
Cc: Christopher Braga <quic_cbraga@quicinc.com>
---
 lib/igt_kms.c | 184 +++++++++++++++++++++++++++++++++++++++++++++++++-
 lib/igt_kms.h |  91 +++++++++++++++++++++++++
 2 files changed, 273 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c548414867c2..bb6f2b47e243 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -617,6 +617,13 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_SCALING_FILTER] = "SCALING_FILTER",
 };
 
+const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
+	[IGT_COLOROP_TYPE] = "TYPE",
+	[IGT_COLOROP_BYPASS] = "BYPASS",
+	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
+	[IGT_COLOROP_NEXT] = "NEXT",
+};
+
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
 	[IGT_CRTC_CTM] = "CTM",
 	[IGT_CRTC_GAMMA_LUT] = "GAMMA_LUT",
@@ -682,6 +689,21 @@ igt_plane_rotations(igt_display_t *display, igt_plane_t *plane,
 	return rotations;
 }
 
+igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id)
+{
+	int i;
+
+	/* find corresponding igt_colorop */
+	for (i = 0; i < display->n_colorops; ++i) {
+		igt_colorop_t *colorop = &display->colorops[i];
+
+		if (colorop->drm_colorop->colorop_id == id)
+			return colorop;
+	}
+
+	return NULL;
+}
+
 /*
  * Retrieve all the properies specified in props_name and store them into
  * plane->props.
@@ -722,6 +744,40 @@ igt_fill_plane_props(igt_display_t *display, igt_plane_t *plane,
 	drmModeFreeObjectProperties(props);
 }
 
+/*
+ * Retrieve all the properies specified in props_name and store them into
+ * colorop->props.
+ */
+static void
+igt_fill_colorop_props(igt_display_t *display, igt_colorop_t *colorop,
+		       int num_props, const char * const prop_names[])
+{
+	drmModeObjectPropertiesPtr props;
+	int i, j, fd;
+
+	fd = display->drm_fd;
+
+	props = drmModeObjectGetProperties(fd, colorop->drm_colorop->colorop_id, DRM_MODE_OBJECT_COLOROP);
+	igt_assert(props);
+
+	for (i = 0; i < props->count_props; i++) {
+		drmModePropertyPtr prop =
+			drmModeGetProperty(fd, props->props[i]);
+
+		for (j = 0; j < num_props; j++) {
+			if (strcmp(prop->name, prop_names[j]) != 0)
+				continue;
+
+			colorop->props[j] = props->props[i];
+			break;
+		}
+
+		drmModeFreeProperty(prop);
+	}
+
+	drmModeFreeObjectProperties(props);
+}
+
 /*
  * Retrieve all the properies specified in props_name and store them into
  * config->atomic_props_crtc and config->atomic_props_connector.
@@ -2624,7 +2680,8 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 {
 	drmModeRes *resources;
 	drmModePlaneRes *plane_resources;
-	int i;
+	drmModeColoropRes *colorop_resources;
+	int i, j;
 	bool is_intel_dev;
 
 	memset(display, 0, sizeof(igt_display_t));
@@ -2709,17 +2766,47 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 
 	drmModeFreePlaneResources(plane_resources);
 
+	/* get all colorop resources */
+	colorop_resources = drmModeGetColoropResources(display->drm_fd);
+
+	if (colorop_resources) {
+		display->n_colorops = colorop_resources->count_colorops;
+		display->colorops = calloc(sizeof(igt_colorop_t), display->n_colorops);
+		igt_assert_f(display->colorops, "Failed to allocate memory for %d colorops\n", display->n_colorops);
+
+		for (i = 0; i < colorop_resources->count_colorops; ++i) {
+			igt_colorop_t *colorop = &display->colorops[i];
+			uint32_t id = colorop_resources->colorops[i];
+
+			colorop->drm_colorop = drmModeGetColorop(display->drm_fd, id);
+			igt_assert(colorop->drm_colorop);
+
+			igt_fill_colorop_props(display, colorop, IGT_NUM_COLOROP_PROPS, igt_colorop_prop_names);
+
+			for (j = 0; j < display->n_planes; ++j)
+				if (display->planes[j].drm_plane->plane_id == colorop->drm_colorop->plane_id)
+					colorop->plane = &display->planes[j];
+
+		}
+
+
+
+		drmModeFreeColoropResources(colorop_resources);
+	}
+
+
 	for_each_pipe(display, i) {
 		igt_pipe_t *pipe = &display->pipes[i];
 		igt_plane_t *plane;
 		int p = 1, crtc_mask = 0;
-		int j, type;
+		int type;
 		uint8_t last_plane = 0, n_planes = 0;
 
 		pipe->display = display;
 		pipe->plane_cursor = -1;
 		pipe->plane_primary = -1;
 		pipe->planes = NULL;
+		pipe->colorops = NULL;
 		pipe->num_primary_planes = 0;
 
 		igt_fill_pipe_props(display, pipe, IGT_NUM_CRTC_PROPS, igt_crtc_prop_names);
@@ -3001,6 +3088,15 @@ void igt_display_fini(igt_display_t *display)
 	if (is_xe_device(drm_fd))
 		xe_device_put(drm_fd);
 
+	for (i = 0; i < display->n_colorops; ++i) {
+		igt_colorop_t *colorop = &display->colorops[i];
+
+		if (colorop->drm_colorop) {
+			drmModeFreeColorop(colorop->drm_colorop);
+			colorop->drm_colorop = NULL;
+		}
+	}
+
 	for (i = 0; i < display->n_planes; ++i) {
 		igt_plane_t *plane = &display->planes[i];
 
@@ -3336,6 +3432,43 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_pipe_t *pipe,
 	}
 }
 
+
+/*
+ * Add colorop properties
+ */
+static void
+igt_atomic_prepare_colorop_commit(igt_colorop_t *colorop, igt_pipe_t *pipe,
+	drmModeAtomicReq *req)
+{
+	igt_display_t *display = pipe->display;
+	int i;
+
+	igt_assert(colorop->drm_colorop);
+
+	LOG(display,
+	    "populating colorop data: %s.%d\n",
+	    kmstest_pipe_name(pipe->pipe),
+	    colorop->drm_colorop->colorop_id);
+
+	/* TODO handle future colorop->next pointer */
+
+	for (i = 0; i < IGT_NUM_COLOROP_PROPS; i++) {
+		if (!igt_colorop_is_prop_changed(colorop, i))
+			continue;
+
+		/* it's an error to try an unsupported feature */
+		igt_assert(colorop->props[i]);
+
+		igt_debug("colorop %s.%d: Setting property \"%s\" to 0x%"PRIx64"/%"PRIi64"\n",
+			kmstest_pipe_name(pipe->pipe), colorop->drm_colorop->colorop_id, igt_colorop_prop_names[i],
+			colorop->values[i], colorop->values[i]);
+
+		igt_assert_lt(0, drmModeAtomicAddProperty(req, colorop->drm_colorop->colorop_id,
+						  colorop->props[i],
+						  colorop->values[i]));
+	}
+}
+
 /*
  * Properties that can be changed through legacy SetProperty:
  * - Obviously not the XYWH SRC/CRTC coordinates.
@@ -3783,6 +3916,25 @@ uint64_t igt_plane_get_prop(igt_plane_t *plane, enum igt_atomic_plane_properties
 					plane->drm_plane->plane_id, plane->props[prop]);
 }
 
+/**
+ * igt_colorop_get_prop:
+ * @colorop: Target colorop.
+ * @prop: Property to check.
+ *
+ * Return current value on a colorop for a given property.
+ *
+ * Returns: The value the property is set to, if this
+ * is a blob, the blob id is returned. This can be passed
+ * to drmModeGetPropertyBlob() to get the contents of the blob.
+ */
+uint64_t igt_colorop_get_prop(igt_display_t *display, igt_colorop_t *colorop, enum igt_atomic_colorop_properties prop)
+{
+	igt_assert(igt_colorop_has_prop(colorop, prop));
+
+	return igt_mode_object_get_prop(display, DRM_MODE_OBJECT_COLOROP,
+					colorop->drm_colorop->colorop_id, colorop->props[prop]);
+}
+
 static bool igt_mode_object_get_prop_enum_value(int drm_fd, uint32_t id, const char *str, uint64_t *val)
 {
 	drmModePropertyPtr prop = drmModeGetProperty(drm_fd, id);
@@ -3825,6 +3977,34 @@ void igt_plane_set_prop_enum(igt_plane_t *plane,
 	igt_assert(igt_plane_try_prop_enum(plane, prop, val));
 }
 
+bool igt_colorop_try_prop_enum(igt_display_t *display,
+			       igt_colorop_t *colorop,
+			       enum igt_atomic_colorop_properties prop,
+			       const char *val)
+{
+	uint64_t uval;
+
+	igt_assert(colorop->props[prop]);
+
+	if (!igt_mode_object_get_prop_enum_value(display->drm_fd,
+						 colorop->props[prop], val, &uval))
+		return false;
+
+	igt_colorop_set_prop_value(colorop, prop, uval);
+	return true;
+}
+
+void igt_colorop_set_prop_enum(igt_display_t *display,
+			       igt_colorop_t *colorop,
+			       enum igt_atomic_colorop_properties prop,
+			       const char *val)
+{
+	bool result = false;
+	result = igt_colorop_try_prop_enum(display, colorop, prop, val);
+	igt_assert(result);
+}
+
+
 /**
  * igt_plane_replace_prop_blob:
  * @plane: plane to set property on.
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 1b6988c17aeb..6cf50b3c8280 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -321,6 +321,19 @@ enum igt_atomic_plane_properties {
        IGT_NUM_PLANE_PROPS
 };
 
+enum igt_atomic_colorop_properties {
+	IGT_COLOROP_TYPE,
+	IGT_COLOROP_BYPASS,
+	IGT_COLOROP_CURVE_1D_TYPE,
+	IGT_COLOROP_NEXT,
+	IGT_NUM_COLOROP_PROPS
+};
+
+/* TODO move to libdrm header?? */
+enum drm_colorop_type {
+	DRM_COLOROP_1D_CURVE
+};
+
 /**
  * igt_plane_prop_names
  *
@@ -329,6 +342,14 @@ enum igt_atomic_plane_properties {
  */
 extern const char * const igt_plane_prop_names[];
 
+/**
+ * igt_colorop_prop_names
+ *
+ * igt_colorop_prop_names contains a list of colorop property names,
+ * as indexed by the igt_atomic_colorop_properties enum.
+ */
+extern const char * const igt_colorop_prop_names[];
+
 typedef struct igt_display igt_display_t;
 typedef struct igt_pipe igt_pipe_t;
 typedef uint32_t igt_fixed_t;			/* 16.16 fixed point */
@@ -351,6 +372,24 @@ static inline bool igt_rotation_90_or_270(igt_rotation_t rotation)
 	return rotation & (IGT_ROTATION_90 | IGT_ROTATION_270);
 }
 
+typedef struct igt_plane igt_plane_t;
+
+typedef struct igt_colorop {
+	/*< private >*/
+	igt_pipe_t *pipe;
+
+	drmModeColorop *drm_colorop;
+
+	igt_plane_t *plane;
+
+	char name[DRM_PROP_NAME_LEN];
+
+	uint64_t changed;
+	uint32_t props[IGT_NUM_COLOROP_PROPS];
+	uint64_t values[IGT_NUM_COLOROP_PROPS];
+
+} igt_colorop_t;
+
 typedef struct igt_plane {
 	/*< private >*/
 	igt_pipe_t *pipe;
@@ -404,6 +443,7 @@ struct igt_pipe {
 	int plane_cursor;
 	int plane_primary;
 	igt_plane_t *planes;
+	igt_colorop_t *colorops;
 
 	uint64_t changed;
 	uint32_t props[IGT_NUM_CRTC_PROPS];
@@ -442,9 +482,11 @@ struct igt_display {
 	int log_shift;
 	int n_pipes;
 	int n_planes;
+	int n_colorops;
 	int n_outputs;
 	igt_output_t *outputs;
 	igt_plane_t *planes;
+	igt_colorop_t *colorops;
 	igt_pipe_t *pipes;
 	bool has_cursor_plane;
 	bool is_atomic;
@@ -721,6 +763,53 @@ extern void igt_plane_set_prop_enum(igt_plane_t *plane,
 				    enum igt_atomic_plane_properties prop,
 				    const char *val);
 
+
+
+extern bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop);
+
+/**
+ * igt_colorop_has_prop:
+ * @colorop: colorop to check.
+ * @prop: Property to check.
+ *
+ * Check whether colorop supports a given property.
+ *
+ * Returns: True if the property is supported, otherwise false.
+ */
+static inline bool
+igt_colorop_has_prop(igt_colorop_t *colorop, enum igt_atomic_colorop_properties prop)
+{
+	return colorop->props[prop];
+}
+
+uint64_t igt_colorop_get_prop(igt_display_t *display, igt_colorop_t *colorop, enum igt_atomic_colorop_properties prop);
+
+#define igt_colorop_is_prop_changed(colorop, prop) \
+	(!!((colorop)->changed & (1 << (prop))))
+
+#define igt_colorop_set_prop_changed(colorop, prop) \
+	(colorop)->changed |= 1 << (prop)
+
+#define igt_colorop_clear_prop_changed(colorop, prop) \
+	(colorop)->changed &= ~(1 << (prop))
+
+#define igt_colorop_set_prop_value(colorop, prop, value) \
+	do { \
+		colorop->values[prop] = value; \
+		igt_colorop_set_prop_changed(colorop, prop); \
+	} while (0)
+
+
+extern bool igt_colorop_try_prop_enum(igt_display_t *display,
+				      igt_colorop_t *colorop,
+				      enum igt_atomic_colorop_properties prop,
+				      const char *val);
+
+extern void igt_colorop_set_prop_enum(igt_display_t *display,
+				      igt_colorop_t *colorop,
+				      enum igt_atomic_colorop_properties prop,
+				      const char *val);
+
 extern void igt_plane_replace_prop_blob(igt_plane_t *plane,
 					enum igt_atomic_plane_properties prop,
 					const void *ptr, size_t length);
@@ -1005,4 +1094,6 @@ bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool i915_pipe_output_combo_valid(igt_display_t *display);
 
+igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
+
 #endif /* __IGT_KMS_H__ */
-- 
2.42.0
