Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2054.outbound.protection.outlook.com [40.107.96.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372A510E7E6
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Nov 2023 16:40:20 +0000 (UTC)
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 8 Nov 2023 11:39:53 -0500
Message-ID: <20231108164006.106967-5-harry.wentland@amd.com>
In-Reply-To: <20231108164006.106967-1-harry.wentland@amd.com>
References: <20231108164006.106967-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [RFC PATCH v3 04/12] lib/igt_kms: Introduce drm_colorop
 and COLOR_PIPELINE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We've introduced a new drm_colorop object in DRM. These are
used to make up a color pipeline. Introduce the concept of
this new DRM core object to IGT, including:
 - discovery of drm_colorop objects during init
 - various helper functions for deaing with drm_colorops
 - handling drm_colorops in atomic commit

Along with this we're also introducing a new COLOR_PIPELINE
plane property to track and be able to retrieve the colorops.

v3:
 - Add commit description (Kamil)
 - Add description for public functions (Kamil)
 - Squash with COLOR_PIPELINE patch
 - Remove need for IOCTLs
 - Change colorop discovery to work without IOCTLs
 - move enum drm_colorop_type to drm_mode.h
 - Drop display from colorop prop_enum functions

v2:
 - Iterate through all next drm_colorop objects

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_kms.c | 269 ++++++++++++++++++++++++++++++++++++++++++++++++--
 lib/igt_kms.h |  89 +++++++++++++++++
 2 files changed, 352 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 033fa1e236e8..504ceaf04b2c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -90,6 +90,7 @@
 #define MAX_CONNECTORS 32
 #define MAX_EDID 2
 #define DISPLAY_TILE_BLOCK 0x12
+#define MAX_NUM_COLOROPS 32
 
 static struct {
 	uint32_t connector_type;
@@ -681,6 +682,14 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_ZPOS] = "zpos",
 	[IGT_PLANE_FB_DAMAGE_CLIPS] = "FB_DAMAGE_CLIPS",
 	[IGT_PLANE_SCALING_FILTER] = "SCALING_FILTER",
+	[IGT_PLANE_COLOR_PIPELINE] = "COLOR_PIPELINE",
+};
+
+const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
+	[IGT_COLOROP_TYPE] = "TYPE",
+	[IGT_COLOROP_BYPASS] = "BYPASS",
+	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
+	[IGT_COLOROP_NEXT] = "NEXT",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
@@ -748,6 +757,108 @@ igt_plane_rotations(igt_display_t *display, igt_plane_t *plane,
 	return rotations;
 }
 
+/**
+ * igt_find_colorop:
+ * @display: display on which to look for colorop.
+ * @id: DRM object id of the colorop.
+ *
+ * Returns: An igt_colorop_t if found, or NULL otherwise.
+ */
+igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id)
+{
+	int i;
+
+	/* find corresponding igt_colorop */
+	for (i = 0; i < display->n_colorops; ++i) {
+		igt_colorop_t *colorop = &display->colorops[i];
+
+		if (colorop->id == id)
+			return colorop;
+	}
+
+	return NULL;
+}
+
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
+	props = drmModeObjectGetProperties(fd, colorop->id, DRM_MODE_OBJECT_COLOROP);
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
+	drmModeFreeObjectProperties(props);
+}
+
+static void igt_fill_colorop(igt_display_t *display, igt_plane_t *plane,
+			     igt_colorop_t *colorop, uint32_t id,
+			     char *name)
+{
+	colorop->id = id;
+	colorop->plane = plane;
+
+	if (name)
+		memcpy(colorop->name, name, sizeof(colorop->name));
+
+	igt_fill_colorop_props(display, colorop, IGT_NUM_COLOROP_PROPS, igt_colorop_prop_names);
+}
+
+static void
+igt_fill_plane_color_pipelines(igt_display_t *display, igt_plane_t *plane,
+			       drmModePropertyPtr prop)
+{
+	int i;
+	uint32_t colorop_id;
+
+	plane->num_color_pipelines = 0;
+
+	for (i = 0; i < prop->count_enums; i++) {
+		if (prop->enums[i].value) {
+			igt_colorop_t *colorop = &display->colorops[display->n_colorops++];
+
+			igt_assert(display->n_colorops < MAX_NUM_COLOROPS);
+
+			igt_fill_colorop(display, plane, colorop, prop->enums[i].value, prop->enums[i].name);
+			plane->color_pipelines[plane->num_color_pipelines++] = colorop;
+
+			/* get all NEXT colorops */
+			colorop_id = igt_colorop_get_prop(display, colorop,
+							IGT_COLOROP_NEXT);
+			while (colorop_id) {
+				colorop = &display->colorops[display->n_colorops++];
+				igt_fill_colorop(display, plane, colorop, colorop_id, NULL);
+				colorop_id = igt_colorop_get_prop(display, colorop,
+								IGT_COLOROP_NEXT);
+			}
+		}
+	}
+
+	igt_assert(plane->num_color_pipelines < IGT_NUM_PLANE_COLOR_PIPELINES);
+
+}
+
 /*
  * Retrieve all the properies specified in props_name and store them into
  * plane->props.
@@ -779,6 +890,9 @@ igt_fill_plane_props(igt_display_t *display, igt_plane_t *plane,
 		if (strcmp(prop->name, "rotation") == 0)
 			plane->rotations = igt_plane_rotations(display, plane, prop);
 
+		if (strcmp(prop->name, "COLOR_PIPELINE") == 0)
+			igt_fill_plane_color_pipelines(display, plane, prop);
+
 		drmModeFreeProperty(prop);
 	}
 
@@ -2816,16 +2930,14 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 		igt_assert(plane->drm_plane);
 
 		plane->type = get_drm_plane_type(display->drm_fd, id);
-
-		/*
-		 * TODO: Fill in the rest of the plane properties here and
-		 * move away from the plane per pipe model to align closer
-		 * to the DRM KMS model.
-		 */
 	}
 
 	drmModeFreePlaneResources(plane_resources);
 
+	/* init colorops */
+	display->colorops = calloc(sizeof(igt_colorop_t), MAX_NUM_COLOROPS);
+	display->n_colorops = 0;
+
 	for_each_pipe(display, i) {
 		igt_pipe_t *pipe = &display->pipes[i];
 		igt_plane_t *plane;
@@ -3463,6 +3575,45 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_pipe_t *pipe,
 	}
 }
 
+/*
+ * Add colorop properties
+ */
+static void
+igt_atomic_prepare_colorop_commit(igt_colorop_t *colorop, igt_pipe_t *pipe,
+	drmModeAtomicReq *req)
+{
+	igt_display_t *display = pipe->display;
+	int i, next_val;
+
+	while (colorop) {
+		LOG(display,
+		    "populating colorop data: %s.%d\n",
+		    kmstest_pipe_name(pipe->pipe),
+		    colorop->id);
+
+		for (i = 0; i < IGT_NUM_COLOROP_PROPS; i++) {
+			if (!igt_colorop_is_prop_changed(colorop, i))
+				continue;
+
+			/* it's an error to try an unsupported feature */
+			igt_assert(colorop->props[i]);
+
+			igt_debug("colorop %s.%d: Setting property \"%s\" to 0x%"PRIx64"/%"PRIi64"\n",
+				kmstest_pipe_name(pipe->pipe), colorop->id, igt_colorop_prop_names[i],
+				colorop->values[i], colorop->values[i]);
+
+			igt_assert_lt(0, drmModeAtomicAddProperty(req, colorop->id,
+							colorop->props[i],
+							colorop->values[i]));
+		}
+
+		/* get next colorop */
+		next_val = igt_colorop_get_prop(display, colorop,
+						IGT_COLOROP_NEXT);
+		colorop = igt_find_colorop(display, next_val);
+	}
+}
+
 /*
  * Properties that can be changed through legacy SetProperty:
  * - Obviously not the XYWH SRC/CRTC coordinates.
@@ -3910,6 +4061,25 @@ uint64_t igt_plane_get_prop(igt_plane_t *plane, enum igt_atomic_plane_properties
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
+					colorop->id, colorop->props[prop]);
+}
+
 static bool igt_mode_object_get_prop_enum_value(int drm_fd, uint32_t id, const char *str, uint64_t *val)
 {
 	drmModePropertyPtr prop = drmModeGetProperty(drm_fd, id);
@@ -3970,6 +4140,44 @@ void igt_plane_set_prop_enum(igt_plane_t *plane,
 	igt_assert(igt_plane_try_prop_enum(plane, prop, val));
 }
 
+/**
+ * igt_plane_is_valid_colorop:
+ * @plane: Target plane.
+ * @colorop: Colorop to check.
+ *
+ * Returns: True if the given @colorop is a valid color pipeline on
+ * the given @plane
+ */
+bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop)
+{
+	int i;
+	bool found = false;
+
+	for (i = 0; i < plane->num_color_pipelines; i++) {
+		if (plane->color_pipelines[i] == colorop) {
+			found = true;
+			break;
+		}
+	}
+
+	return found;
+}
+/**
+ * igt_plane_set_color_pipeline:
+ * @plane: Target plane.
+ * @colorop: Colorop to set as color pipeline.
+ *
+ * This function sets the given @colorop as color pipeline on @plane, or fails
+ * the test if it's an invalid color pipeline for the plane.
+ */
+void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop)
+{
+	igt_assert(igt_plane_is_valid_colorop(plane, colorop));
+
+	plane->assigned_color_pipeline = colorop;
+	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, colorop->name);
+}
+
 /**
  * igt_plane_replace_prop_blob:
  * @plane: plane to set property on.
@@ -4002,6 +4210,50 @@ igt_plane_replace_prop_blob(igt_plane_t *plane, enum igt_atomic_plane_properties
 	igt_plane_set_prop_changed(plane, prop);
 }
 
+/**
+ * igt_colorop_try_prop_enum:
+ * @colorop: Target colorop.
+ * @prop: Property to check.
+ * @val: Value to set.
+ *
+ * Returns: False if the given @colorop doesn't have the enum @prop or
+ * failed to set the enum property @val else True.
+ */
+bool igt_colorop_try_prop_enum(igt_colorop_t *colorop,
+			       enum igt_atomic_colorop_properties prop,
+			       const char *val)
+{
+	igt_display_t *display = colorop->plane->pipe->display;
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
+/**
+ * igt_colorop_set_prop_enum:
+ * @plane: Target plane.
+ * @prop: Property to check.
+ * @val: Value to set.
+ *
+ * This function tries to set given enum property @prop value @val to
+ * the given @colorop, and terminate the execution if its failed.
+ */
+void igt_colorop_set_prop_enum(igt_colorop_t *colorop,
+			       enum igt_atomic_colorop_properties prop,
+			       const char *val)
+{
+	bool result = false;
+	result = igt_colorop_try_prop_enum(colorop, prop, val);
+	igt_assert(result);
+}
+
 /**
  * igt_output_get_prop:
  * @output: Target output.
@@ -4274,6 +4526,11 @@ static int igt_atomic_commit(igt_display_t *display, uint32_t flags, void *user_
 
 			if (plane->changed)
 				igt_atomic_prepare_plane_commit(plane, pipe_obj, req);
+
+			/* TODO iterate over assigned color pipeline and prepare colorop commit */
+			if (plane->assigned_color_pipeline)
+				igt_atomic_prepare_colorop_commit(plane->assigned_color_pipeline,
+								  pipe_obj, req);
 		}
 
 	}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 0ebb2c640b81..e121f0ca6e41 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -326,9 +326,18 @@ enum igt_atomic_plane_properties {
        IGT_PLANE_SCALING_FILTER,
        IGT_PLANE_HOTSPOT_X,
        IGT_PLANE_HOTSPOT_Y,
+       IGT_PLANE_COLOR_PIPELINE,
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
 /**
  * igt_plane_prop_names
  *
@@ -337,10 +346,20 @@ enum igt_atomic_plane_properties {
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
 
+#define IGT_NUM_PLANE_COLOR_PIPELINES 4
+
 typedef enum {
 	/* this maps to the kernel API */
 	IGT_ROTATION_0   = 1 << 0,
@@ -366,6 +385,20 @@ static inline bool igt_rotation_90_or_270(igt_rotation_t rotation)
 	return rotation & (IGT_ROTATION_90 | IGT_ROTATION_270);
 }
 
+typedef struct igt_plane igt_plane_t;
+
+typedef struct igt_colorop {
+	uint32_t id;
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
@@ -399,6 +432,11 @@ typedef struct igt_plane {
 	uint64_t *modifiers;
 	uint32_t *formats;
 	int format_mod_count;
+
+	igt_colorop_t *color_pipelines[IGT_NUM_PLANE_COLOR_PIPELINES];
+	int num_color_pipelines;
+
+	igt_colorop_t *assigned_color_pipeline;
 } igt_plane_t;
 
 /*
@@ -457,9 +495,11 @@ struct igt_display {
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
@@ -791,6 +831,53 @@ extern void igt_plane_set_prop_enum(igt_plane_t *plane,
 				    enum igt_atomic_plane_properties prop,
 				    const char *val);
 
+
+
+extern bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop);
+
+extern void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop);
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
+extern bool igt_colorop_try_prop_enum(igt_colorop_t *colorop,
+				      enum igt_atomic_colorop_properties prop,
+				      const char *val);
+
+extern void igt_colorop_set_prop_enum(igt_colorop_t *colorop,
+				      enum igt_atomic_colorop_properties prop,
+				      const char *val);
+
 extern void igt_plane_replace_prop_blob(igt_plane_t *plane,
 					enum igt_atomic_plane_properties prop,
 					const void *ptr, size_t length);
@@ -1200,4 +1287,6 @@ bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
 int get_num_scalers(int drm_fd, enum pipe pipe);
 
+igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
+
 #endif /* __IGT_KMS_H__ */
-- 
2.42.0
