Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543B0E6FE23
	for <igt-dev@archiver.kernel.org>; Tue, 23 Dec 2025 18:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083E710E2B6;
	Tue, 23 Dec 2025 18:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="lCknW4th";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C912910E2B6
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Dec 2025 18:32:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766514746; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=gCsIz9FktbZh8GrcO43tAeYs7WfydPlh2k/kY1DzI/PwU/uWuO6XHqgPLnMQ9fMn2vacacQAZQtaITmWESi36XM1eS/nGCStMe2Dhib/edsQQIrWlDNEOOV/t0k1kS8pW6NyyZsbMNbaZQ1EB9/tAxF5qsA9WYeUnW12teScklQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766514746;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=u/03xzGPi2axslD+1d4mACB7VpXj49wgf9u8msSG6w4=; 
 b=W5tfx6d+HBT7R71xmxlZ+WtW8SdEIY9fGmBJ9yuPZFgz6LJYnmpAb95pAXh1mpvNwUnzXESWo69f5fGxilcuazlOVJOcJJEDpM5/C2JGbd4WD/ZfOsiW1QKTCp9I3WxpC38rRsawKF8g4KK4qgJ552gmdQQtXLkvWF5rg6SX/Gg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766514746; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=u/03xzGPi2axslD+1d4mACB7VpXj49wgf9u8msSG6w4=;
 b=lCknW4thV/n145RNDw/MA3IEXgAiXK+KElw5Vurq1K3Y2EYWDoc/uriT87UrV5pu
 anoU5ag14p1g+c3UWqmKrEM6TqC+c/NEP4NAT7UKDy7zELtoeNl21l3wcZkRtnuWhmf
 cRSk8V6LhKac1itYY5O0p76gcy3/6btjiNb68VUk=
Received: by mx.zohomail.com with SMTPS id 176651474424074.55538120737799;
 Tue, 23 Dec 2025 10:32:24 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:31:49 -0300
Subject: [PATCH v2 03/10] lib/igt_kms: Move color pipeline properties in
 igt_plane_t to struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-post-blend-colorops-v2-3-f40aca9795bd@collabora.com>
References: <20251223-post-blend-colorops-v2-0-f40aca9795bd@collabora.com>
In-Reply-To: <20251223-post-blend-colorops-v2-0-f40aca9795bd@collabora.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, harry.wentland@amd.com, leo.liu@amd.com, 
 daniels@collabora.com, leandro.ribeiro@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766514731; l=8773;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=YvDYurggiCLeOa8fsDbI4/TBg+40bpZZ54MT60nGRqs=;
 b=Sr1DvWyakWL0kZo26gagUKMNpPZKZie2PsAIBxqdGcGvGhK0YGltAQqneZgvrP7PUzfRq3viV
 7rL8Nhq59xUCbIHRnsUroXc+PUqTROiXzo+S8csJfBNz2vq7VtGcVMF
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
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

From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

In preparation for supporting CRTC (post-blend) colorops, which will
require adding the same properties related to color pipelines currently
in igt_plane_t for igt_pipe_t, move those to a separate
igt_color_pipelines_t type. This will allow more of the color pipeline
code to be reused between planes and pipes.

Also remove "plane" from the names of identifiers related to this struct
as they're no longer exclusive to planes.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 lib/igt_kms.c          | 32 ++++++++++++++++----------------
 lib/igt_kms.h          | 16 ++++++++++------
 tests/kms_colorop.c    | 14 +++++++-------
 tests/kms_properties.c |  4 ++--
 4 files changed, 35 insertions(+), 31 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c648180fa..e1505c33c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -852,13 +852,13 @@ static void igt_fill_colorop(igt_display_t *display,
 }
 
 static void
-igt_fill_plane_color_pipelines(igt_display_t *display, igt_plane_t *plane,
-			       drmModePropertyPtr prop)
+igt_fill_color_pipelines(igt_display_t *display, igt_color_pipelines_t *pipelines,
+			 drmModePropertyPtr prop)
 {
 	int i;
 	uint32_t colorop_id;
 
-	plane->num_color_pipelines = 0;
+	pipelines->num_color_pipelines = 0;
 
 	for (i = 0; i < prop->count_enums; i++) {
 		if (prop->enums[i].value) {
@@ -867,7 +867,7 @@ igt_fill_plane_color_pipelines(igt_display_t *display, igt_plane_t *plane,
 			igt_assert(display->n_colorops < MAX_NUM_COLOROPS);
 
 			igt_fill_colorop(display, colorop, prop->enums[i].value, prop->enums[i].name);
-			plane->color_pipelines[plane->num_color_pipelines++] = colorop;
+			pipelines->color_pipelines[pipelines->num_color_pipelines++] = colorop;
 
 			/* get all NEXT colorops */
 			colorop_id = igt_colorop_get_prop(display, colorop,
@@ -882,7 +882,7 @@ igt_fill_plane_color_pipelines(igt_display_t *display, igt_plane_t *plane,
 		}
 	}
 
-	igt_assert(plane->num_color_pipelines < IGT_NUM_PLANE_COLOR_PIPELINES);
+	igt_assert(pipelines->num_color_pipelines < IGT_NUM_COLOR_PIPELINES);
 
 }
 
@@ -918,7 +918,7 @@ igt_fill_plane_props(igt_display_t *display, igt_plane_t *plane,
 			plane->rotations = igt_plane_rotations(display, plane, prop);
 
 		if (strcmp(prop->name, "COLOR_PIPELINE") == 0)
-			igt_fill_plane_color_pipelines(display, plane, prop);
+			igt_fill_color_pipelines(display, &plane->color_pipelines, prop);
 
 		drmModeFreeProperty(prop);
 	}
@@ -4427,20 +4427,20 @@ bool igt_plane_check_prop_is_mutable(igt_plane_t *plane,
 }
 
 /**
- * igt_plane_is_valid_colorop:
- * @plane: Target plane.
+ * igt_is_valid_colorop:
+ * @pipelines: Target color pipelines.
  * @colorop: Colorop to check.
  *
  * Returns: True if the given @colorop is a valid color pipeline on
- * the given @plane
+ * the given @pipelines
  */
-bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop)
+bool igt_is_valid_colorop(igt_color_pipelines_t *pipelines, igt_colorop_t *colorop)
 {
 	int i;
 	bool found = false;
 
-	for (i = 0; i < plane->num_color_pipelines; i++) {
-		if (plane->color_pipelines[i] == colorop) {
+	for (i = 0; i < pipelines->num_color_pipelines; i++) {
+		if (pipelines->color_pipelines[i] == colorop) {
 			found = true;
 			break;
 		}
@@ -4458,9 +4458,9 @@ bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop)
  */
 void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop)
 {
-	igt_assert(igt_plane_is_valid_colorop(plane, colorop));
+	igt_assert(igt_is_valid_colorop(&plane->color_pipelines, colorop));
 
-	plane->assigned_color_pipeline = colorop;
+	plane->color_pipelines.assigned_color_pipeline = colorop;
 	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, colorop->name);
 }
 
@@ -4846,8 +4846,8 @@ static int igt_atomic_commit(igt_display_t *display, uint32_t flags, void *user_
 			if (plane->changed)
 				igt_atomic_prepare_plane_commit(plane, pipe_obj, req);
 
-			if (plane->assigned_color_pipeline)
-				igt_atomic_prepare_colorop_commit(plane->assigned_color_pipeline,
+			if (plane->color_pipelines.assigned_color_pipeline)
+				igt_atomic_prepare_colorop_commit(plane->color_pipelines.assigned_color_pipeline,
 								  pipe_obj, req);
 		}
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 2ea1b4f55..11b895b5a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -382,7 +382,7 @@ typedef struct igt_display igt_display_t;
 typedef struct igt_crtc igt_crtc_t;
 typedef uint32_t igt_fixed_t;			/* 16.16 fixed point */
 
-#define IGT_NUM_PLANE_COLOR_PIPELINES 4
+#define IGT_NUM_COLOR_PIPELINES 4
 
 typedef enum {
 	/* this maps to the kernel API */
@@ -423,6 +423,13 @@ typedef struct igt_colorop {
 
 } igt_colorop_t;
 
+typedef struct igt_color_pipelines {
+	igt_colorop_t *color_pipelines[IGT_NUM_COLOR_PIPELINES];
+	int num_color_pipelines;
+
+	igt_colorop_t *assigned_color_pipeline;
+} igt_color_pipelines_t;
+
 typedef struct igt_plane {
 	/*< private >*/
 	igt_crtc_t *pipe;
@@ -461,10 +468,7 @@ typedef struct igt_plane {
 	uint32_t *async_formats;
 	int async_format_mod_count;
 
-	igt_colorop_t *color_pipelines[IGT_NUM_PLANE_COLOR_PIPELINES];
-	int num_color_pipelines;
-
-	igt_colorop_t *assigned_color_pipeline;
+	igt_color_pipelines_t color_pipelines;
 } igt_plane_t;
 
 /*
@@ -899,7 +903,7 @@ extern void igt_plane_replace_prop_blob(igt_plane_t *plane,
 					enum igt_atomic_plane_properties prop,
 					const void *ptr, size_t length);
 
-extern bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop);
+extern bool igt_is_valid_colorop(igt_color_pipelines_t *pipelines, igt_colorop_t *colorop);
 
 extern void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop);
 
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 6bce0ab05..255832b63 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -242,16 +242,16 @@ static bool map_to_pipeline(igt_display_t *display,
 }
 
 static igt_colorop_t *get_color_pipeline(igt_display_t *display,
-					 igt_plane_t *plane,
+					 igt_color_pipelines_t *pipelines,
 					 kms_colorop_t *colorops[])
 {
 	igt_colorop_t *colorop = NULL;
 	int i;
 
 	/* go through all color pipelines */
-	for (i = 0; i < plane->num_color_pipelines; ++i) {
-		if (map_to_pipeline(display, plane->color_pipelines[i], colorops)) {
-			colorop = plane->color_pipelines[i];
+	for (i = 0; i < pipelines->num_color_pipelines; ++i) {
+		if (map_to_pipeline(display, pipelines->color_pipelines[i], colorops)) {
+			colorop = pipelines->color_pipelines[i];
 			break;
 		}
 	}
@@ -460,7 +460,7 @@ static void colorop_plane_test(igt_display_t *display,
 		set_color_pipeline_bypass(plane);
 	} else {
 		/* get COLOR_PIPELINE enum */
-		color_pipeline = get_color_pipeline(display, plane, colorops);
+		color_pipeline = get_color_pipeline(display, &plane->color_pipelines, colorops);
 
 		/* skip test if we can't find applicable pipeline */
 		igt_skip_on(!color_pipeline);
@@ -514,8 +514,8 @@ static void check_plane_colorop_ids(igt_display_t *display)
 
 			g_hash_table_add(plane_set, GINT_TO_POINTER(plane->drm_plane->plane_id));
 
-			for (colorop_idx = 0; colorop_idx < plane->num_color_pipelines; colorop_idx++) {
-				next = plane->color_pipelines[colorop_idx];
+			for (colorop_idx = 0; colorop_idx < plane->color_pipelines.num_color_pipelines; colorop_idx++) {
+				next = plane->color_pipelines.color_pipelines[colorop_idx];
 				while (next) {
 					/* Check if the ID already exists in the set */
 					if (g_hash_table_contains(id_set, GINT_TO_POINTER(next->id))) {
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 62e936bc5..41f4e4145 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -246,9 +246,9 @@ static void run_colorop_property_tests(igt_display_t *display, enum pipe pipe, i
 			 kmstest_pipe_name(pipe), plane->index, kmstest_plane_type_name(plane->type), output->name);
 
 		/* iterate over all color pipelines on plane */
-		for (i = 0; i < plane->num_color_pipelines; ++i) {
+		for (i = 0; i < plane->color_pipelines.num_color_pipelines; ++i) {
 			/* iterate over all colorops in pipeline*/
-			colorop = plane->color_pipelines[i];
+			colorop = plane->color_pipelines.color_pipelines[i];
 			while (colorop) {
 				igt_info("Testing colorop properties on %s.#%d.#%d-%s (output: %s)\n",
 					  kmstest_pipe_name(pipe), plane->index, colorop->id,

-- 
2.51.0

