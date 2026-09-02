Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9103C61DD6
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 18:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BAA10E3FC;
	Wed,  2 Sep 2026 18:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="leJyz9sJ";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97D110F317
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 18:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=My4vz3A/NwXvLngQJjrAazYVUEFkiHrMidvQ+S60tHE=; b=
 leJyz9sJ4MTcB/j0o26C/+pxgI617EwTg/TIUDA4ZKUEvgbE0IOf93K34BmsiOsjwgTi9Te4f7Wkz
 OLUoPtPTNYMUWQArd9CaLLxCj1jeCPPDsoWkdbkxDW39uEdI6lu1jrg1614kaDlXzz4nvHVFiD7LY
 Lca+cXR5TP4Ec+/w7lFz9RL6xTGmGAqI7gLN1jYqubZG6VHbwHicsNccJ5BisMYiPwuKY2zXCAIiu
 44QDdlAReO4nclrsXoyGNckrIF8+n9hXHvwehp38l1X9PNf02cix9WHsGyTByaG6eShtqpVbSMilS
 uJ+xXNNii8DzQIIzaOX8FegeICrzfBkuoA==;
Received: from 113.red-79-144-92.dynamicip.rima-tde.net ([79.144.92.113]
 helo=killbill) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x1pGL-00DxQx-DJ; Wed, 02 Sep 2026 20:00:41 +0200
From: Melissa Wen <mwen@igalia.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Alex Hung <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland <harry.wentland@amd.com>,
 Uma Shankar <uma.shankar@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v5 8/8] lib/igt_kms: add macros to iterate color
 pipelines and colorops
Date: Wed,  2 Sep 2026 19:58:08 +0200
Message-ID: <20260902180016.303482-9-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902180016.303482-1-mwen@igalia.com>
References: <20260902180016.303482-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Walking a plane's color pipelines, and the colorop chain of a given
pipeline, is open-coded in eight places across lib and the colorop tests.
Add for_each_color_pipeline() to iterate over all color pipelines
supported by a plane and for_each_colorop_in_pipeline() to iterate over
all colorops of a pipeline.

The chain walk in igt_fill_plane_color_pipelines() now stores the next
colorop reached by the NEXT property (which is immutable and doesn't
change after being discovered) and, as a consequence, igt_find_colorop()
becomes unused and is removed.

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---

v4:
- new patch, suggested by Jani
v5:
- store next colorop, now igt_colorop_next and igt_find_colorop are
  unnecessary
- use igt_unique for macro iterator
---
 lib/igt_kms.c              | 76 ++++++++++++--------------------------
 lib/igt_kms.h              | 32 ++++++++++++++--
 tests/kms_colorop.c        | 17 +++------
 tests/kms_colorop_helper.c | 40 +++++++-------------
 tests/kms_properties.c     | 17 +++------
 5 files changed, 77 insertions(+), 105 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index cabe60a31..6329e42eb 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -794,28 +794,6 @@ igt_plane_rotations(igt_display_t *display, igt_plane_t *plane,
 	return rotations;
 }
 
-/**
- * igt_find_colorop:
- * @display: display on which to look for colorop.
- * @id: DRM object id of the colorop.
- *
- * Returns: An igt_colorop_t if found, or NULL otherwise.
- */
-igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id)
-{
-	int i;
-
-	/* find corresponding igt_colorop */
-	for (i = 0; i < display->n_colorops; ++i) {
-		igt_colorop_t *colorop = &display->colorops[i];
-
-		if (colorop->id == id)
-			return colorop;
-	}
-
-	return NULL;
-}
-
 /*
  * Retrieve all the properies specified in props_name and store them into
  * colorop->props.
@@ -873,28 +851,34 @@ igt_fill_plane_color_pipelines(igt_display_t *display, igt_plane_t *plane,
 
 	for (i = 0; i < prop->count_enums; i++) {
 		if (prop->enums[i].value) {
-			igt_colorop_t *colorop = &display->colorops[display->n_colorops++];
+			igt_colorop_t *colorop;
 
 			igt_assert(display->n_colorops < MAX_NUM_COLOROPS);
+			colorop = &display->colorops[display->n_colorops++];
 
 			igt_fill_colorop(display, plane, colorop, prop->enums[i].value, prop->enums[i].name);
 			plane->color_pipelines[plane->num_color_pipelines++] = colorop;
 
 			/* get all NEXT colorops */
 			colorop_id = igt_colorop_get_prop(display, colorop,
-							IGT_COLOROP_NEXT);
+							  IGT_COLOROP_NEXT);
 			while (colorop_id) {
-				colorop = &display->colorops[display->n_colorops++];
+				igt_colorop_t *next;
+
 				igt_assert(display->n_colorops < MAX_NUM_COLOROPS);
-				igt_fill_colorop(display, plane, colorop, colorop_id, NULL);
+				next = &display->colorops[display->n_colorops++];
+				igt_fill_colorop(display, plane, next, colorop_id, NULL);
+
+				colorop->next = next;
+				colorop = next;
+
 				colorop_id = igt_colorop_get_prop(display, colorop,
-								IGT_COLOROP_NEXT);
+								  IGT_COLOROP_NEXT);
 			}
 		}
 	}
 
 	igt_assert(plane->num_color_pipelines < IGT_NUM_PLANE_COLOR_PIPELINES);
-
 }
 
 /*
@@ -3810,13 +3794,14 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_crtc_t *crtc,
  * Add colorop properties
  */
 static void
-igt_atomic_prepare_colorop_commit(igt_colorop_t *colorop, igt_crtc_t *crtc,
+igt_atomic_prepare_colorop_commit(igt_colorop_t *color_pipeline, igt_crtc_t *crtc,
 				  drmModeAtomicReq *req)
 {
 	igt_display_t *display = crtc->display;
-	int i, next_val;
+	igt_colorop_t *colorop;
+	int i;
 
-	while (colorop) {
+	for_each_colorop_in_pipeline(color_pipeline, colorop) {
 		LOG(display,
 		    "populating colorop data: %s.%d\n",
 		    igt_crtc_name(crtc),
@@ -3838,11 +3823,6 @@ igt_atomic_prepare_colorop_commit(igt_colorop_t *colorop, igt_crtc_t *crtc,
 							colorop->props[i],
 							colorop->values[i]));
 		}
-
-		/* get next colorop */
-		next_val = igt_colorop_get_prop(display, colorop,
-						IGT_COLOROP_NEXT);
-		colorop = igt_find_colorop(display, next_val);
 	}
 }
 
@@ -4415,18 +4395,16 @@ bool igt_plane_check_prop_is_mutable(igt_plane_t *plane,
  */
 bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop)
 {
-	int i;
-	bool found = false;
+	igt_colorop_t *color_pipeline;
 
-	for (i = 0; i < plane->num_color_pipelines; i++) {
-		if (plane->color_pipelines[i] == colorop) {
-			found = true;
-			break;
-		}
+	for_each_color_pipeline(plane, color_pipeline) {
+		if (color_pipeline == colorop)
+			return true;
 	}
 
-	return found;
+	return false;
 }
+
 /**
  * igt_plane_set_color_pipeline:
  * @plane: Target plane.
@@ -4932,15 +4910,9 @@ display_commit_changed(igt_display_t *display, enum igt_commit_style s)
 				 * so already-committed property values aren't re-emitted on
 				 * the next commit.
 				 */
-				colorop = plane->assigned_color_pipeline;
-				while (colorop) {
-					uint32_t next_val;
-
+				for_each_colorop_in_pipeline(plane->assigned_color_pipeline,
+							     colorop)
 					colorop->changed = 0;
-					next_val = igt_colorop_get_prop(display, colorop,
-									IGT_COLOROP_NEXT);
-					colorop = igt_find_colorop(display, next_val);
-				}
 
 				fd = plane->values[IGT_PLANE_IN_FENCE_FD];
 				if (fd != -1)
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 23615dd91..0187ad9a1 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -415,17 +415,18 @@ static inline bool igt_rotation_90_or_270(igt_rotation_t rotation)
 }
 
 typedef struct _igt_plane igt_plane_t;
+typedef struct _igt_colorop igt_colorop_t;
 
-typedef struct {
+typedef struct _igt_colorop {
 	uint32_t id;
 	igt_plane_t *plane;
+	igt_colorop_t *next;
 
 	char name[DRM_PROP_NAME_LEN];
 
 	uint64_t changed;
 	uint32_t props[IGT_NUM_COLOROP_PROPS];
 	uint64_t values[IGT_NUM_COLOROP_PROPS];
-
 } igt_colorop_t;
 
 struct igt_format_mods {
@@ -1027,6 +1028,31 @@ uint64_t igt_colorop_get_prop(igt_display_t *display, igt_colorop_t *colorop, en
 		igt_colorop_set_prop_changed(colorop, prop); \
 	} while (0)
 
+/**
+ * for_each_color_pipeline:
+ * @plane: plane to which the color pipelines belong
+ * @color_pipeline: the color pipeline to iterate
+ *
+ * Iterates through all color pipelines supported by @plane. If no color
+ * pipeline is supported, nothing happens.
+ */
+#define for_each_color_pipeline(plane, color_pipeline) \
+	for (int igt_unique(__i) = 0; \
+	     igt_unique(__i) < (plane)->num_color_pipelines && \
+	     ((color_pipeline) = (plane)->color_pipelines[igt_unique(__i)], true); \
+	     igt_unique(__i)++)
+
+/**
+ * for_each_colorop_in_pipeline:
+ * @pipeline: the first colorop in a color pipeline
+ * @colorop: the colorop to iterate
+ *
+ * Iterates through a color pipeline, starting from an initial colorop pointer
+ * and extending to all subsequent colorops pointed to by next.
+ */
+#define for_each_colorop_in_pipeline(pipeline, colorop) \
+	for ((colorop) = (pipeline); (colorop); \
+	     (colorop) = (colorop)->next)
 
 extern bool igt_colorop_has_prop_enum_value(igt_colorop_t *colorop,
 					    enum igt_atomic_colorop_properties prop,
@@ -1380,8 +1406,6 @@ uint64_t igt_get_writeback_fb_id(igt_output_t *output);
 void igt_detach_crtc(igt_display_t *display, igt_output_t *output);
 void igt_get_and_wait_out_fence(igt_output_t *output);
 
-igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
-
 bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
 				   int drm_mode);
 int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 2bee1eecd..1585c0ae2 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -365,10 +365,8 @@ static void colorop_plane_test(igt_display_t *display,
 static void check_plane_colorop_ids(igt_display_t *display)
 {
 	igt_plane_t *plane;
-	int colorop_idx;
-	igt_colorop_t *next;
+	igt_colorop_t *colorop, *color_pipeline;
 	igt_crtc_t *crtc;
-	int prop_val = 0;
 
 	/* Use hash tables to track drm_planes and unique IDs */
 	GHashTable *plane_set = g_hash_table_new(g_direct_hash, g_direct_equal);
@@ -383,18 +381,15 @@ static void check_plane_colorop_ids(igt_display_t *display)
 
 			g_hash_table_add(plane_set, GINT_TO_POINTER(plane->drm_plane->plane_id));
 
-			for (colorop_idx = 0; colorop_idx < plane->num_color_pipelines; colorop_idx++) {
-				next = plane->color_pipelines[colorop_idx];
-				while (next) {
+			for_each_color_pipeline(plane, color_pipeline) {
+				for_each_colorop_in_pipeline(color_pipeline, colorop) {
 					/* Check if the ID already exists in the set */
-					if (g_hash_table_contains(id_set, GINT_TO_POINTER(next->id))) {
+					if (g_hash_table_contains(id_set, GINT_TO_POINTER(colorop->id))) {
 						igt_fail_on_f(true, "Duplicate colorop ID %u found on plane %d\n",
-						next->id, plane->drm_plane->plane_id);
+						colorop->id, plane->drm_plane->plane_id);
 					}
 
-					g_hash_table_add(id_set, GINT_TO_POINTER(next->id));
-					prop_val = igt_colorop_get_prop(display, next, IGT_COLOROP_NEXT);
-					next = igt_find_colorop(display, prop_val);
+					g_hash_table_add(id_set, GINT_TO_POINTER(colorop->id));
 				}
 			}
 		}
diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index a109c1b06..34b0f4901 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -278,29 +278,25 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
  * colorops[] to it.
  */
 static bool map_to_pipeline(igt_display_t *display,
-			    igt_colorop_t *colorop,
+			    igt_colorop_t *color_pipeline,
 			    kms_colorop_t *colorops[])
 {
-	igt_colorop_t *next = colorop;
+	igt_colorop_t *colorop;
 	kms_colorop_t *current_op;
 	int i = 0;
-	int prop_val = 0;
 
 	current_op = colorops[i];
 	i++;
 	igt_require(current_op);
 
-	while (next) {
-		if (can_use_colorop(display, next, current_op)) {
-			current_op->colorop = next;
+	for_each_colorop_in_pipeline(color_pipeline, colorop) {
+		if (can_use_colorop(display, colorop, current_op)) {
+			current_op->colorop = colorop;
 			current_op = colorops[i];
 			i++;
 			if (!current_op)
 				break;
 		}
-		prop_val = igt_colorop_get_prop(display, next,
-						IGT_COLOROP_NEXT);
-		next = igt_find_colorop(display, prop_val);
 	}
 
 	if (current_op) {
@@ -320,18 +316,16 @@ igt_colorop_t *get_color_pipeline(igt_display_t *display,
 			          igt_plane_t *plane,
 				  kms_colorop_t *colorops[])
 {
-	igt_colorop_t *colorop = NULL;
-	int i;
+	igt_colorop_t *color_pipeline;
 
 	/* go through all color pipelines */
-	for (i = 0; i < plane->num_color_pipelines; ++i) {
-		if (map_to_pipeline(display, plane->color_pipelines[i], colorops)) {
-			colorop = plane->color_pipelines[i];
-			break;
+	for_each_color_pipeline(plane, color_pipeline) {
+		if (map_to_pipeline(display, color_pipeline, colorops)) {
+			return color_pipeline;
 		}
 	}
 
-	return colorop;
+	return NULL;
 }
 
 static void fill_custom_1dlut(igt_display_t *display, kms_colorop_t *colorop)
@@ -426,8 +420,7 @@ void set_color_pipeline(igt_display_t *display,
 			kms_colorop_t *colorops[],
 			igt_colorop_t *color_pipeline)
 {
-	igt_colorop_t *next;
-	int prop_val = 0;
+	igt_colorop_t *colorop;
 	int i;
 
 	igt_plane_set_color_pipeline(plane, color_pipeline);
@@ -436,17 +429,12 @@ void set_color_pipeline(igt_display_t *display,
 		set_colorop(display, colorops[i]);
 
 	/* set unused ops in pipeline to bypass */
-	next = color_pipeline;
 	i = 0;
-	while (next) {
-		if (!colorops[i] || colorops[i]->colorop != next)
-			igt_colorop_set_prop_value(next, IGT_COLOROP_BYPASS, 1);
+	for_each_colorop_in_pipeline(color_pipeline, colorop) {
+		if (!colorops[i] || colorops[i]->colorop != colorop)
+			igt_colorop_set_prop_value(colorop, IGT_COLOROP_BYPASS, 1);
 		else
 			i++;
-
-		prop_val = igt_colorop_get_prop(display, next,
-						IGT_COLOROP_NEXT);
-		next = igt_find_colorop(display, prop_val);
 	}
 }
 
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 76aadd162..ba07d68d6 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -239,9 +239,7 @@ static void run_colorop_property_tests(igt_display_t *display,
 {
 	struct igt_fb fb, afb;
 	igt_plane_t *plane;
-	igt_colorop_t *colorop;
-	int i;
-	int colorop_id = 0;
+	igt_colorop_t *colorop, *color_pipeline;
 
 	prepare_crtc(display, crtc, output,
 		     &fb);
@@ -268,23 +266,18 @@ static void run_colorop_property_tests(igt_display_t *display,
 		}
 
 		/* iterate over all color pipelines on plane */
-		for (i = 0; i < plane->num_color_pipelines; ++i) {
-			/* iterate over all colorops in pipeline*/
-			colorop = plane->color_pipelines[i];
-			igt_plane_set_color_pipeline(plane, colorop);
+		for_each_color_pipeline(plane, color_pipeline) {
+			igt_plane_set_color_pipeline(plane, color_pipeline);
 			igt_display_commit2(display, COMMIT_ATOMIC);
 
-			while (colorop) {
+			/* iterate over all colorops in pipeline*/
+			for_each_colorop_in_pipeline(color_pipeline, colorop) {
 				igt_info("Testing colorop properties on %s.#%d.#%d-%s (output: %s)\n",
 					  igt_crtc_name(crtc), plane->index,
 					  colorop->id,
 					  kmstest_plane_type_name(plane->type), output->name);
 				test_properties(display->drm_fd, DRM_MODE_OBJECT_COLOROP, colorop->id,
 						atomic, display->has_plane_color_pipeline);
-
-				colorop_id = igt_colorop_get_prop(display, colorop,
-								IGT_COLOROP_NEXT);
-				colorop = igt_find_colorop(display, colorop_id);
 			}
 		}
 
-- 
2.53.0

