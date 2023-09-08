Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BA010E8F3
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 15:04:11 +0000 (UTC)
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 8 Sep 2023 11:03:11 -0400
Message-ID: <20230908150315.75977-4-harry.wentland@amd.com>
In-Reply-To: <20230908150315.75977-1-harry.wentland@amd.com>
References: <20230908150315.75977-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC PATCH 3/7] lib/igt_kms: Add new COLOR PIPELINE plane
 property
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
 lib/igt_kms.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h | 10 ++++++++++
 2 files changed, 63 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index bb6f2b47e243..9c8c61eac49d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -615,6 +615,7 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_ZPOS] = "zpos",
 	[IGT_PLANE_FB_DAMAGE_CLIPS] = "FB_DAMAGE_CLIPS",
 	[IGT_PLANE_SCALING_FILTER] = "SCALING_FILTER",
+	[IGT_PLANE_COLOR_PIPELINE] = "COLOR_PIPELINE",
 };
 
 const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
@@ -704,6 +705,27 @@ igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id)
 	return NULL;
 }
 
+static void
+igt_fill_plane_color_pipelines(igt_display_t *display, igt_plane_t *plane,
+			       drmModePropertyPtr prop)
+{
+	int i;
+
+	plane->num_color_pipelines = 0;
+
+	for (i = 0; i < prop->count_enums; i++) {
+		igt_colorop_t *colorop = igt_find_colorop(display, prop->enums[i].value);
+
+		if (colorop) {
+			plane->color_pipelines[plane->num_color_pipelines++] = colorop;
+			memcpy(colorop->name, prop->enums[i].name, sizeof(colorop->name));
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
@@ -735,6 +757,9 @@ igt_fill_plane_props(igt_display_t *display, igt_plane_t *plane,
 		if (strcmp(prop->name, "rotation") == 0)
 			plane->rotations = igt_plane_rotations(display, plane, prop);
 
+		if (strcmp(prop->name, "COLOR_PIPELINE") == 0)
+			igt_fill_plane_color_pipelines(display, plane, prop);
+
 		drmModeFreeProperty(prop);
 	}
 
@@ -3994,6 +4019,29 @@ bool igt_colorop_try_prop_enum(igt_display_t *display,
 	return true;
 }
 
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
+
+void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop)
+{
+	igt_assert(igt_plane_is_valid_colorop(plane, colorop));
+
+	plane->assigned_color_pipeline = colorop;
+	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, colorop->name);
+}
+
 void igt_colorop_set_prop_enum(igt_display_t *display,
 			       igt_colorop_t *colorop,
 			       enum igt_atomic_colorop_properties prop,
@@ -4273,6 +4321,11 @@ static int igt_atomic_commit(igt_display_t *display, uint32_t flags, void *user_
 
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
index 6cf50b3c8280..df27ea4ea40a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -318,6 +318,7 @@ enum igt_atomic_plane_properties {
        IGT_PLANE_ZPOS,
        IGT_PLANE_FB_DAMAGE_CLIPS,
        IGT_PLANE_SCALING_FILTER,
+       IGT_PLANE_COLOR_PIPELINE,
        IGT_NUM_PLANE_PROPS
 };
 
@@ -354,6 +355,8 @@ typedef struct igt_display igt_display_t;
 typedef struct igt_pipe igt_pipe_t;
 typedef uint32_t igt_fixed_t;			/* 16.16 fixed point */
 
+#define IGT_NUM_PLANE_COLOR_PIPELINES 4
+
 typedef enum {
 	/* this maps to the kernel API */
 	IGT_ROTATION_0   = 1 << 0,
@@ -423,6 +426,11 @@ typedef struct igt_plane {
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
@@ -767,6 +775,8 @@ extern void igt_plane_set_prop_enum(igt_plane_t *plane,
 
 extern bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop);
 
+extern void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop);
+
 /**
  * igt_colorop_has_prop:
  * @colorop: colorop to check.
-- 
2.42.0
