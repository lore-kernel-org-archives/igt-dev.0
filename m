Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D7CE6FE24
	for <igt-dev@archiver.kernel.org>; Tue, 23 Dec 2025 18:32:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928BB10E2AF;
	Tue, 23 Dec 2025 18:32:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="OVKRDniQ";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDF710E2B3
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Dec 2025 18:32:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766514750; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SkHrB5yhftZDfJcTOMF9+acz06b54MrNaA9tn4yGpx1BnsCFZKLpKOGULcsYQD83Z3ioVP3m/IsTZTQJjAZVJbYgjq6V6K0fgfhIVF0On5n4deJ1J2cE+CrklijaxSqtFmdOCBMaHOQyw2DeXh9Gr0LPFQYdfMi5smV2HWZT/AI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766514750;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=y7QTiTIoNNMh0k5T76vPhLxdZt7L4vzja2CIr5/7NX4=; 
 b=dbYzRe7amxcxLJvNJlHf7PCWWURQEMO2LLCYGZ7SYb2tF8XLRA08sIRDhF7y+W92nV7r4H2kqZOJaO6f7//GktZGyA68QoHAK83vE23dvqNsKwHHDdwKQw8KXqcHiSNKjc+L+JTJ65vUoksmQIi+5N/kTt4vbak55x4eMG5THAE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766514750; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=y7QTiTIoNNMh0k5T76vPhLxdZt7L4vzja2CIr5/7NX4=;
 b=OVKRDniQD9D4Smu/Amr8o8WRxCjXPg0oU8hAxtZnaKlmwkkbUZz7wy5MLBMbTPfu
 Zg2WH/pkv84ug5qTC3XyPAo9roj4lawqZJfPx/T1N7t4w3M3gFJhahqMdQyZVtpNHpo
 yqEHDszJj3uUc2p5E0JuIsmplZ75gN4w5A8xYLyg=
Received: by mx.zohomail.com with SMTPS id 1766514747490769.1996742204972;
 Tue, 23 Dec 2025 10:32:27 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:31:50 -0300
Subject: [PATCH v2 04/10] lib/igt_kms: Support CRTC (post-blend) colorops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-post-blend-colorops-v2-4-f40aca9795bd@collabora.com>
References: <20251223-post-blend-colorops-v2-0-f40aca9795bd@collabora.com>
In-Reply-To: <20251223-post-blend-colorops-v2-0-f40aca9795bd@collabora.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, harry.wentland@amd.com, leo.liu@amd.com, 
 daniels@collabora.com, leandro.ribeiro@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766514731; l=10670;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=sFwVjLMLlfc23tm0XH5rBGh5us6swJva1T0bVwsxkjY=;
 b=idKeqEIORs3aUsjyJj7ykGE2x/kxVRCWBtO2h0hOxW5iNvzE6AFGTp3wogHzTv9+qTvT4ZmSO
 SwoQ1f7kqPyD3wNK3ORjNrNTxQvUEpPb8dwbMHVuwkh/xPryu+6Poy1
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

Add support for the CRTC (post-blend) color pipeline API. This involves
* setting the required client cap
* retrieving the color pipelines and contained colorops in the
  COLOR_PIPELINE property of the CRTC
* ignoring CRTC properties that are considered deprecated when using the
  post-blend color pipeline API

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 lib/igt_kms.c            | 69 +++++++++++++++++++++++++++++++++++++++++++-----
 lib/igt_kms.h            |  5 ++++
 tests/kms_color.c        |  7 +++++
 tests/kms_color_helper.c |  3 +++
 tests/kms_colorop.c      |  4 +++
 5 files changed, 82 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e1505c33c..771cc0f24 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -729,6 +729,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
 	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
 	[IGT_CRTC_SCALING_FILTER] = "SCALING_FILTER",
 	[IGT_CRTC_SHARPNESS_STRENGTH] = "SHARPNESS_STRENGTH",
+	[IGT_CRTC_COLOR_PIPELINE] = "COLOR_PIPELINE",
 };
 
 const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
@@ -987,6 +988,9 @@ igt_fill_pipe_props(igt_display_t *display, igt_crtc_t *pipe,
 			break;
 		}
 
+		if (strcmp(prop->name, "COLOR_PIPELINE") == 0)
+			igt_fill_color_pipelines(display, &pipe->color_pipelines, prop);
+
 		drmModeFreeProperty(prop);
 	}
 
@@ -2743,22 +2747,29 @@ static void igt_plane_reset(igt_plane_t *plane)
 
 static void igt_pipe_reset(igt_crtc_t *pipe)
 {
+	igt_display_t *display = pipe->display;
+
 	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_MODE_ID, 0);
 	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_ACTIVE, 0);
 	igt_pipe_obj_clear_prop_changed(pipe, IGT_CRTC_OUT_FENCE_PTR);
 
-	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_CTM))
-		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_CTM, 0);
+	if (!display->has_crtc_color_pipeline) {
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
 
@@ -3791,6 +3802,25 @@ igt_atomic_ignore_plane_prop(igt_crtc_t *pipe, uint32_t prop)
 	}
 }
 
+static bool
+igt_atomic_ignore_pipe_prop(igt_crtc_t *pipe, uint32_t prop)
+{
+	igt_display_t *display = pipe->display;
+
+	switch (prop) {
+	case IGT_CRTC_CTM:
+	case IGT_CRTC_GAMMA_LUT:
+	case IGT_CRTC_GAMMA_LUT_SIZE:
+	case IGT_CRTC_DEGAMMA_LUT:
+	case IGT_CRTC_DEGAMMA_LUT_SIZE:
+		return display->has_crtc_color_pipeline;
+	case IGT_CRTC_COLOR_PIPELINE:
+		return !display->has_crtc_color_pipeline;
+	default:
+		return false;
+	}
+}
+
 /*
  * Add position and fb changes of a plane to the atomic property set
  */
@@ -4464,6 +4494,22 @@ void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop)
 	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, colorop->name);
 }
 
+/**
+ * igt_pipe_set_color_pipeline:
+ * @pipe: Target pipe.
+ * @colorop: Colorop to set as color pipeline.
+ *
+ * This function sets the given @colorop as color pipeline on @pipe, or fails
+ * the test if it's an invalid color pipeline for the pipe.
+ */
+void igt_pipe_set_color_pipeline(igt_crtc_t *pipe, igt_colorop_t *colorop)
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
@@ -4770,6 +4816,13 @@ static void igt_atomic_prepare_crtc_commit(igt_crtc_t *pipe_obj, drmModeAtomicRe
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
 
@@ -4838,6 +4891,10 @@ static int igt_atomic_commit(igt_display_t *display, uint32_t flags, void *user_
 		if (pipe_obj->changed)
 			igt_atomic_prepare_crtc_commit(pipe_obj, req);
 
+		if (pipe_obj->color_pipelines.assigned_color_pipeline)
+			igt_atomic_prepare_colorop_commit(pipe_obj->color_pipelines.assigned_color_pipeline,
+							  pipe_obj, req);
+
 		for_each_plane_on_pipe(display, pipe, plane) {
 			/* skip planes that are handled by another pipe */
 			if (plane->ref->pipe != pipe_obj)
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 11b895b5a..b717757fc 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -165,6 +165,7 @@ enum igt_atomic_crtc_properties {
        IGT_CRTC_VRR_ENABLED,
        IGT_CRTC_SCALING_FILTER,
        IGT_CRTC_SHARPNESS_STRENGTH,
+       IGT_CRTC_COLOR_PIPELINE,
        IGT_NUM_CRTC_PROPS
 };
 
@@ -505,6 +506,8 @@ struct igt_crtc {
 	uint32_t crtc_offset;
 
 	int32_t out_fence_fd;
+
+	igt_color_pipelines_t color_pipelines;
 };
 
 typedef struct {
@@ -542,6 +545,7 @@ struct igt_display {
 	bool is_atomic;
 	bool has_virt_cursor_plane;
 	bool has_plane_color_pipeline;
+	bool has_crtc_color_pipeline;
 	bool first_commit;
 
 	uint64_t *modifiers;
@@ -906,6 +910,7 @@ extern void igt_plane_replace_prop_blob(igt_plane_t *plane,
 extern bool igt_is_valid_colorop(igt_color_pipelines_t *pipelines, igt_colorop_t *colorop);
 
 extern void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop);
+extern void igt_pipe_set_color_pipeline(igt_crtc_t *pipe, igt_colorop_t *colorop);
 
 
 /**
diff --git a/tests/kms_color.c b/tests/kms_color.c
index 74ead943a..0f8ca2cf4 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -94,6 +94,7 @@ static bool test_pipe_degamma(data_t *data,
 	int fb_id, fb_modeset_id;
 	bool ret;
 
+	igt_require(!data->display.has_crtc_color_pipeline);
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
 
@@ -183,6 +184,7 @@ static bool test_pipe_gamma(data_t *data,
 	int fb_id, fb_modeset_id;
 	bool ret;
 
+	igt_require(!data->display.has_crtc_color_pipeline);
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
 
 	gamma_full = generate_table_max(data->gamma_lut_size);
@@ -271,6 +273,8 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	int fb_id, fb_modeset_id;
 	bool ret;
 
+	igt_require(!data->display.has_crtc_color_pipeline);
+
 	drm_crtc = drmModeGetCrtc(data->drm_fd, primary->pipe->crtc_id);
 	legacy_lut_size = drm_crtc->gamma_size;
 	drmModeFreeCrtc(drm_crtc);
@@ -378,6 +382,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
 	igt_output_t *output = data->output;
 	bool ret = true;
 
+	igt_require(!data->display.has_crtc_color_pipeline);
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
 
 	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
@@ -514,6 +519,7 @@ static bool test_pipe_ctm(data_t *data,
 	igt_crc_t crc_software, crc_hardware;
 	int fb_id, fb_modeset_id;
 
+	igt_require(!data->display.has_crtc_color_pipeline);
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
 
 	igt_output_set_crtc(output, primary->pipe);
@@ -546,6 +552,7 @@ static bool test_pipe_ctm(data_t *data,
 	 * rounding issues and inaccuracies leading to crc mismatch.
 	 */
 	if (is_intel_device(data->drm_fd) && memcmp(before, after, sizeof(color_t))) {
+		igt_require(!data->display.has_crtc_color_pipeline);
 		igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
 
 		gamma_linear = generate_table(256, 1.0);
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 9e68ef334..3724237db 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -351,12 +351,14 @@ invalid_lut_sizes(data_t *data, enum pipe p,
 void
 invalid_gamma_lut_sizes(data_t *data, enum pipe p)
 {
+	igt_require(!data->display.has_crtc_color_pipeline);
 	invalid_lut_sizes(data, p, IGT_CRTC_GAMMA_LUT, data->gamma_lut_size);
 }
 
 void
 invalid_degamma_lut_sizes(data_t *data, enum pipe p)
 {
+	igt_require(!data->display.has_crtc_color_pipeline);
 	invalid_lut_sizes(data, p, IGT_CRTC_DEGAMMA_LUT, data->degamma_lut_size);
 }
 
@@ -366,6 +368,7 @@ void invalid_ctm_matrix_sizes(data_t *data, enum pipe p)
 	igt_crtc_t *pipe = igt_crtc_for_pipe(display, p);
 	void *ptr;
 
+	igt_require(!data->display.has_crtc_color_pipeline);
 	igt_require(igt_pipe_obj_has_prop(pipe, IGT_CRTC_CTM));
 
 	ptr = malloc(sizeof(struct drm_color_ctm) * 4);
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 255832b63..d53022807 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -620,12 +620,16 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		igt_display_require(&display, display.drm_fd);
 		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
 			display.has_plane_color_pipeline = 1;
+		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_CRTC_COLOR_PIPELINE, 1) == 0)
+			display.has_crtc_color_pipeline = 1;
 
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&display, display.drm_fd);
 		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
 			display.has_plane_color_pipeline = 1;
+		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_CRTC_COLOR_PIPELINE, 1) == 0)
+			display.has_crtc_color_pipeline = 1;
 
 		igt_require(display.is_atomic);
 	}

-- 
2.51.0

