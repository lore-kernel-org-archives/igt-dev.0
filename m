Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7F4CAC593
	for <igt-dev@archiver.kernel.org>; Sat, 13 Sep 2025 00:04:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A5A10E323;
	Sat, 13 Sep 2025 00:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OXmXN/yG";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691C110E16F
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Sep 2025 00:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757721841;
 bh=wLlwk+KyaEOm+x4omYRI1afyk+Ag5S8j+x5KkfiS19o=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=OXmXN/yGQ4gRFXie5mzPGM3tvOmlUMJfBG5SqLp5E5LwaFuZgyqipnAgCw8Vop1i1
 llLmFjvPikzTtDs/n7mOPQHZ21S34+JFkotJU8HWMjXRZbx8Vft9h7Bzj2zsCSw7t3
 fPvom9mELpRk7fUsloepH+wyjTDniC5FIhIM1fkcO0htCfCQiyXz++mCWM1Z4yUUC3
 ueGABfB1D/9oLDiUsvUfySWKw7DigGMCLR3brZLWLVFw3Vh7BCTYqW38ktlTZKT1RX
 66SvooQMZUzyMHVw+PJJrTHHlJBm32AcNPVzGIwQ9CydgZ4ik6OpuObubvwnZJGrcF
 bBGVtytuj531Q==
Received: from [127.0.1.1] (unknown
 [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0D34617E129D;
 Sat, 13 Sep 2025 02:03:59 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 12 Sep 2025 20:02:56 -0400
Subject: [PATCH 4/9] lib/igt_kms: Support post-blend colorops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250912-post-blend-colorops-v1-4-83fc62420cba@collabora.com>
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

Add support for the post-blend color pipeline API. This involves
* setting the required client cap
* retrieving the color pipelines and contained colorops in the
  COLOR_PIPELINE property of the CRTC
* ignoring CRTC properties that are considered deprecated when using the
  post-blend color pipeline API

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 lib/igt_kms.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++++------
 lib/igt_kms.h |  5 +++++
 2 files changed, 68 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 6c4c308bf09b9f07eadddcc9830c26e8055d194c..379f4963d63cdd370f56da9704ccb947fdd57fe0 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -729,6 +729,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
 	[IGT_CRTC_OUT_FENCE_PTR] = "OUT_FENCE_PTR",
 	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
 	[IGT_CRTC_SCALING_FILTER] = "SCALING_FILTER",
+	[IGT_CRTC_COLOR_PIPELINE] = "COLOR_PIPELINE",
 };
 
 const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
@@ -986,6 +987,9 @@ igt_fill_pipe_props(igt_display_t *display, igt_pipe_t *pipe,
 			break;
 		}
 
+		if (strcmp(prop->name, "COLOR_PIPELINE") == 0)
+			igt_fill_color_pipelines(display, &pipe->color_pipelines, prop);
+
 		drmModeFreeProperty(prop);
 	}
 
@@ -2723,22 +2727,29 @@ static void igt_plane_reset(igt_plane_t *plane)
 
 static void igt_pipe_reset(igt_pipe_t *pipe)
 {
+	igt_display_t *display = pipe->display;
+
 	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_MODE_ID, 0);
 	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_ACTIVE, 0);
 	igt_pipe_obj_clear_prop_changed(pipe, IGT_CRTC_OUT_FENCE_PTR);
 
-	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_CTM))
-		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_CTM, 0);
+	if (!display->has_post_blend_color_pipeline) {
+		if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_CTM))
+			igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_CTM, 0);
 
-	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_GAMMA_LUT))
-		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_GAMMA_LUT, 0);
+		if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_GAMMA_LUT))
+			igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_GAMMA_LUT, 0);
 
-	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_DEGAMMA_LUT))
-		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_DEGAMMA_LUT, 0);
+		if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_DEGAMMA_LUT))
+			igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_DEGAMMA_LUT, 0);
+	}
 
 	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_SCALING_FILTER))
 		igt_pipe_obj_set_prop_enum(pipe, IGT_CRTC_SCALING_FILTER, "Default");
 
+	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_COLOR_PIPELINE))
+		igt_pipe_obj_set_prop_enum(pipe, IGT_CRTC_COLOR_PIPELINE, "Bypass");
+
 	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_VRR_ENABLED))
 		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_VRR_ENABLED, 0);
 
@@ -3111,6 +3122,9 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
 		display->has_plane_color_pipeline = 1;
 
+	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE, 1) == 0)
+		display->has_post_blend_color_pipeline = 1;
+
 	plane_resources = drmModeGetPlaneResources(display->drm_fd);
 	igt_assert(plane_resources);
 
@@ -3764,6 +3778,30 @@ igt_atomic_ignore_plane_prop(igt_pipe_t *pipe, uint32_t prop)
 	return false;
 }
 
+static bool
+igt_atomic_ignore_pipe_prop(igt_pipe_t *pipe, uint32_t prop)
+{
+	igt_display_t *display = pipe->display;
+
+	if (display->has_post_blend_color_pipeline) {
+		switch (prop) {
+		case IGT_CRTC_CTM:
+		case IGT_CRTC_GAMMA_LUT:
+		case IGT_CRTC_DEGAMMA_LUT:
+			return true;
+		default:
+			return false;
+		}
+	} else {
+		switch (prop) {
+		case IGT_CRTC_COLOR_PIPELINE:
+			return true;
+		default:
+			return false;
+		}
+	}
+}
+
 /*
  * Add position and fb changes of a plane to the atomic property set
  */
@@ -4436,6 +4474,14 @@ void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop)
 	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, colorop->name);
 }
 
+void igt_pipe_set_color_pipeline(igt_pipe_t *pipe, igt_colorop_t *colorop)
+{
+	igt_assert(igt_is_valid_colorop(&pipe->color_pipelines, colorop));
+
+	pipe->color_pipelines.assigned_color_pipeline = colorop;
+	igt_pipe_obj_set_prop_enum(pipe, IGT_CRTC_COLOR_PIPELINE, colorop->name);
+}
+
 /**
  * igt_plane_replace_prop_blob:
  * @plane: plane to set property on.
@@ -4742,6 +4788,13 @@ static void igt_atomic_prepare_crtc_commit(igt_pipe_t *pipe_obj, drmModeAtomicRe
 	int i;
 
 	for (i = 0; i < IGT_NUM_CRTC_PROPS; i++) {
+		if (igt_atomic_ignore_pipe_prop(pipe_obj, i)) {
+			igt_debug("CRTC %s: Ignoring property \"%s\" to 0x%"PRIx64"/%"PRIi64"\n",
+					  kmstest_pipe_name(pipe_obj->pipe), igt_plane_prop_names[i],
+					  pipe_obj->values[i], pipe_obj->values[i]);
+			continue;
+		}
+
 		if (!igt_pipe_obj_is_prop_changed(pipe_obj, i))
 			continue;
 
@@ -4810,6 +4863,10 @@ static int igt_atomic_commit(igt_display_t *display, uint32_t flags, void *user_
 		if (pipe_obj->changed)
 			igt_atomic_prepare_crtc_commit(pipe_obj, req);
 
+		if (pipe_obj->color_pipelines.assigned_color_pipeline)
+			igt_atomic_prepare_colorop_commit(pipe_obj->color_pipelines.assigned_color_pipeline,
+											  pipe_obj, req);
+
 		for_each_plane_on_pipe(display, pipe, plane) {
 			/* skip planes that are handled by another pipe */
 			if (plane->ref->pipe != pipe_obj)
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 31ef916218e3b073f97a0b0d18479acead9a6e61..b4d9fd902d3c9e3226684f155a70e3535d48c4e4 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -165,6 +165,7 @@ enum igt_atomic_crtc_properties {
        IGT_CRTC_OUT_FENCE_PTR,
        IGT_CRTC_VRR_ENABLED,
        IGT_CRTC_SCALING_FILTER,
+       IGT_CRTC_COLOR_PIPELINE,
        IGT_NUM_CRTC_PROPS
 };
 
@@ -521,6 +522,8 @@ struct igt_pipe {
 	uint32_t crtc_offset;
 
 	int32_t out_fence_fd;
+
+	igt_color_pipelines_t color_pipelines;
 };
 
 typedef struct {
@@ -558,6 +561,7 @@ struct igt_display {
 	bool is_atomic;
 	bool has_virt_cursor_plane;
 	bool has_plane_color_pipeline;
+	bool has_post_blend_color_pipeline;
 	bool first_commit;
 
 	uint64_t *modifiers;
@@ -902,6 +906,7 @@ extern void igt_plane_replace_prop_blob(igt_plane_t *plane,
 extern bool igt_is_valid_colorop(igt_color_pipelines_t *pipelines, igt_colorop_t *colorop);
 
 extern void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop);
+extern void igt_pipe_set_color_pipeline(igt_pipe_t *pipe, igt_colorop_t *colorop);
 
 
 /**

-- 
2.50.1

