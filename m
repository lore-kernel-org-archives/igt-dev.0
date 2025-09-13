Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24653CA101F
	for <igt-dev@archiver.kernel.org>; Sat, 13 Sep 2025 00:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8DDD10E16F;
	Sat, 13 Sep 2025 00:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gRMO2VyR";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FE810E16F
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Sep 2025 00:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757721839;
 bh=EHUkTMfC/C/eHe0eVQFCMj9yRMfBY9VCjy3eOOBJKiU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=gRMO2VyR5EcUr0iYZ9FLRCgRVzsBNbqpNHJ9gjYeY2L+nm/VwwGuRJPBk6V16NGUd
 HP3WZ0H+dGX0f1DijxzMr/bpdxLFVpJO2HRHB4/3uIb4X5TgqkPOipya2A+CF6vJhU
 d6/+KBdiYVL+DQOxBbZ4XnESyc9+z0uI+AIeavPF94uzmYeYEG8z6kFFu8l7WIO7uP
 5bWQaDPPqzYLSZeeYKzjfs4JLyExYqtKAQa3BV2qc/IJ27iwPwYcUd4XYjKtI0FOCn
 7kfIlh/tFeWA+oNO7Qs0ccReOEemEPrx1kiDhiITgg+PSI/VL+NXQxtZjbbeu5AMUU
 EzY6i1Y3Uroig==
Received: from [127.0.1.1] (unknown
 [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 66CED17E1091;
 Sat, 13 Sep 2025 02:03:58 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 12 Sep 2025 20:02:55 -0400
Subject: [PATCH 3/9] lib/igt_kms: Move color pipeline properties in
 igt_plane_t to struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250912-post-blend-colorops-v1-3-83fc62420cba@collabora.com>
References: <20250912-post-blend-colorops-v1-0-83fc62420cba@collabora.com>
In-Reply-To: <20250912-post-blend-colorops-v1-0-83fc62420cba@collabora.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: Alex Hung <alex.hung@amd.com>, harry.wentland@amd.com, leo.liu@amd.com, 
 daniels@collabora.com, leandro.ribeiro@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
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

In preparation for supporting post-blend colorops, which will require
adding the same properties related to color pipelines currently in
igt_plane_t for igt_pipe_t, move those to a separate
igt_color_pipelines_t type. This will allow more of the color pipeline
code to be reused between planes and pipes.

Also remove "plane" from the names of identifiers related to this struct
as they're no longer exclusive to planes.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 lib/igt_kms.c          | 30 +++++++++++++++---------------
 lib/igt_kms.h          | 16 ++++++++++------
 tests/kms_colorop.c    | 14 +++++++-------
 tests/kms_properties.c |  4 ++--
 4 files changed, 34 insertions(+), 30 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index d5c5db082e2b4c321f8872be7eea039a502d693d..6c4c308bf09b9f07eadddcc9830c26e8055d194c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -852,13 +852,13 @@ static void igt_fill_colorop(igt_display_t *display,
 }
 
 static void
-igt_fill_plane_color_pipelines(igt_display_t *display, igt_plane_t *plane,
+igt_fill_color_pipelines(igt_display_t *display, igt_color_pipelines_t *pipelines,
 			       drmModePropertyPtr prop)
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
@@ -881,7 +881,7 @@ igt_fill_plane_color_pipelines(igt_display_t *display, igt_plane_t *plane,
 		}
 	}
 
-	igt_assert(plane->num_color_pipelines < IGT_NUM_PLANE_COLOR_PIPELINES);
+	igt_assert(pipelines->num_color_pipelines < IGT_NUM_COLOR_PIPELINES);
 
 }
 
@@ -917,7 +917,7 @@ igt_fill_plane_props(igt_display_t *display, igt_plane_t *plane,
 			plane->rotations = igt_plane_rotations(display, plane, prop);
 
 		if (strcmp(prop->name, "COLOR_PIPELINE") == 0)
-			igt_fill_plane_color_pipelines(display, plane, prop);
+			igt_fill_color_pipelines(display, &plane->color_pipelines, prop);
 
 		drmModeFreeProperty(prop);
 	}
@@ -4399,20 +4399,20 @@ bool igt_plane_check_prop_is_mutable(igt_plane_t *plane,
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
@@ -4430,9 +4430,9 @@ bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop)
  */
 void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop)
 {
-	igt_assert(igt_plane_is_valid_colorop(plane, colorop));
+	igt_assert(igt_is_valid_colorop(&plane->color_pipelines, colorop));
 
-	plane->assigned_color_pipeline = colorop;
+	plane->color_pipelines.assigned_color_pipeline = colorop;
 	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, colorop->name);
 }
 
@@ -4819,8 +4819,8 @@ static int igt_atomic_commit(igt_display_t *display, uint32_t flags, void *user_
 				igt_atomic_prepare_plane_commit(plane, pipe_obj, req);
 
 			/* TODO iterate over assigned color pipeline and prepare colorop commit */
-			if (plane->assigned_color_pipeline)
-				igt_atomic_prepare_colorop_commit(plane->assigned_color_pipeline,
+			if (plane->color_pipelines.assigned_color_pipeline)
+				igt_atomic_prepare_colorop_commit(plane->color_pipelines.assigned_color_pipeline,
 								  pipe_obj, req);
 		}
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index c4e0c3b671c03c3728305d80c60aa95f799c6c54..31ef916218e3b073f97a0b0d18479acead9a6e61 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -403,7 +403,7 @@ typedef struct igt_display igt_display_t;
 typedef struct igt_pipe igt_pipe_t;
 typedef uint32_t igt_fixed_t;			/* 16.16 fixed point */
 
-#define IGT_NUM_PLANE_COLOR_PIPELINES 4
+#define IGT_NUM_COLOR_PIPELINES 4
 
 typedef enum {
 	/* this maps to the kernel API */
@@ -444,6 +444,13 @@ typedef struct igt_colorop {
 
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
 	igt_pipe_t *pipe;
@@ -482,10 +489,7 @@ typedef struct igt_plane {
 	uint32_t *async_formats;
 	int async_format_mod_count;
 
-	igt_colorop_t *color_pipelines[IGT_NUM_PLANE_COLOR_PIPELINES];
-	int num_color_pipelines;
-
-	igt_colorop_t *assigned_color_pipeline;
+	igt_color_pipelines_t color_pipelines;
 } igt_plane_t;
 
 /*
@@ -895,7 +899,7 @@ extern void igt_plane_replace_prop_blob(igt_plane_t *plane,
 					enum igt_atomic_plane_properties prop,
 					const void *ptr, size_t length);
 
-extern bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop);
+extern bool igt_is_valid_colorop(igt_color_pipelines_t *pipelines, igt_colorop_t *colorop);
 
 extern void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop);
 
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index b66a11b2bd9f48a7351a049a6e4a9752c2b4f386..e63876d608c3f1bee60e60d3137cbafef70acc4f 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -288,16 +288,16 @@ static bool map_to_pipeline(igt_display_t *display,
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
@@ -506,7 +506,7 @@ static void colorop_plane_test(igt_display_t *display,
 		set_color_pipeline_bypass(plane);
 	} else {
 		/* get COLOR_PIPELINE enum */
-		color_pipeline = get_color_pipeline(display, plane, colorops);
+		color_pipeline = get_color_pipeline(display, &plane->color_pipeline, colorops);
 
 		/* skip test if we can't find applicable pipeline */
 		igt_skip_on(!color_pipeline);
@@ -561,8 +561,8 @@ static void check_plane_colorop_ids(igt_display_t *display)
 
 			g_hash_table_add(plane_set, GINT_TO_POINTER(plane->drm_plane->plane_id));
 
-			for (colorop_idx = 0; colorop_idx < plane->num_color_pipelines; colorop_idx++) {
-				next = plane->color_pipelines[colorop_idx];
+			for (colorop_idx = 0; colorop_idx < plane->color_pipelines.num_color_pipelines; colorop_idx++) {
+				next = plane->color_pipelines.color_pipelines[colorop_idx];
 				while (next) {
 					/* Check if the ID already exists in the set */
 					if (g_hash_table_contains(id_set, GINT_TO_POINTER(next->id))) {
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index a4d73fe1b664518c9b0d837b302a67912d38f378..084f7cdc04fcace28d9cab317a2679bf23bd9c31 100644
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
 					kmstest_pipe_name(pipe), plane->index, colorop->id, kmstest_plane_type_name(plane->type), output->name);

-- 
2.50.1

