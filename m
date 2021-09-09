Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8246E5BD
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Sep 2021 15:30:55 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu,  9 Sep 2021 18:30:37 +0300
Message-Id: <20210909153047.16729-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20210909153047.16729-1-ville.syrjala@linux.intel.com>
References: <20210909153047.16729-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 01/11] lib/kms: Add
 igt_plane_has_rotation()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Probe the supported rotations for each plane from the kernel
This should let us eliminate tons of hand rolled gen checks all over.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 41 +++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h | 16 ++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index cc38f5a25334..6b0639f628b9 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -612,6 +612,41 @@ const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
 	[IGT_CONNECTOR_DITHERING_MODE] = "dithering mode",
 };
 
+const char * const igt_rotation_names[] = {
+	[0] = "rotate-0",
+	[1] = "rotate-90",
+	[2] = "rotate-180",
+	[3] = "rotate-270",
+	[4] = "reflect-x",
+	[5] = "reflect-y",
+};
+
+static unsigned int
+igt_plane_rotations(igt_display_t *display, igt_plane_t *plane,
+		    drmModePropertyPtr prop)
+{
+	unsigned int rotations = 0;
+
+	igt_assert_eq(prop->flags & DRM_MODE_PROP_LEGACY_TYPE,
+		      DRM_MODE_PROP_BITMASK);
+	igt_assert_eq(prop->count_values, prop->count_enums);
+
+	for (int i = 0; i < ARRAY_SIZE(igt_rotation_names); i++) {
+		for (int j = 0; j < prop->count_enums; j++) {
+			if (strcmp(igt_rotation_names[i], prop->enums[j].name))
+				continue;
+
+			/* various places assume the uabi uses specific bit values */
+			igt_assert_eq(prop->values[j], i);
+
+			rotations |= 1 << i;
+		}
+	}
+	igt_assert_neq(rotations, 0);
+
+	return rotations;
+}
+
 /*
  * Retrieve all the properies specified in props_name and store them into
  * plane->props.
@@ -640,9 +675,15 @@ igt_fill_plane_props(igt_display_t *display, igt_plane_t *plane,
 			break;
 		}
 
+		if (strcmp(prop->name, "rotation") == 0)
+			plane->rotations = igt_plane_rotations(display, plane, prop);
+
 		drmModeFreeProperty(prop);
 	}
 
+	if (!plane->rotations)
+		plane->rotations = IGT_ROTATION_0;
+
 	drmModeFreeObjectProperties(props);
 }
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index ed598f164a59..b6cbf937166f 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -358,6 +358,8 @@ typedef struct igt_plane {
 		uint64_t values[IGT_NUM_COLOR_RANGES];
 	} color_range;
 
+	igt_rotation_t rotations;
+
 	uint64_t changed;
 	uint32_t props[IGT_NUM_PLANE_PROPS];
 	uint64_t values[IGT_NUM_PLANE_PROPS];
@@ -491,6 +493,20 @@ void igt_fb_set_position(struct igt_fb *fb, igt_plane_t *plane,
 void igt_fb_set_size(struct igt_fb *fb, igt_plane_t *plane,
 	uint32_t w, uint32_t h);
 
+/**
+ * igt_plane_has_rotation:
+ * @plane: Plane pointer for which rotation is to be queried
+ * @rotation: Plane rotation value (0, 90, 180, 270)
+ *
+ * Check whether @plane potentially supports the given @rotation.
+ * Note that @rotation may still rejected later due to other
+ * constraints (eg. incompatible pixel format or modifier).
+ */
+static inline bool igt_plane_has_rotation(igt_plane_t *plane, igt_rotation_t rotation)
+{
+	return (plane->rotations & rotation) == rotation;
+}
+
 void igt_wait_for_vblank(int drm_fd, int crtc_offset);
 void igt_wait_for_vblank_count(int drm_fd, int crtc_offset, int count);
 
-- 
2.31.1
