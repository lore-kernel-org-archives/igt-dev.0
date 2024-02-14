Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7A5C4829F
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 06:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A0B10E085;
	Wed, 14 Feb 2024 06:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lk9CHoBM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4B210E12C
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 06:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707893163; x=1739429163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tFb3kDC8GuZou1gXu6Oynobz4PNQLYLyS7AXg2GAnMA=;
 b=Lk9CHoBMfrX0bX7HMob0CfHs0csCzZbhVjYJdngAU7LcNQJP+mm7F/qM
 dl8EK3lCn4Cz2VnvsDm8odLX1LFBZFUJWgIPfvoJRJFsIhqbB3mZ3L8qB
 uTYwk3hs0YHaHSAAAzQw11d2vR+wAK8EorBVp/SQEgnc0+/VTfDJvSLhT
 DZ9blspt5BnH2v1mXKbVPMuv6Pb0HidHBLWsH7fMiFtV2Tqt3Nis1g95h
 pJWRTLkr1IqeCYsdRh71GW7Pi//BHweNO10a3nAZ4LNxweZSCDyAOoTVn
 t1gRE2NSXHX1w1TnG9SYRF9xxoNZ8ABL2vwLXT/6iJEAxnNb3fLaMPzqG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12645488"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12645488"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:46:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3427655"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:46:02 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [RFC v4 15/22] lib/colorops: Move few helpers to common place to reuse
Date: Wed, 14 Feb 2024 12:09:46 +0530
Message-ID: <20240214063953.1285495-16-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
References: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
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

Move few colorops helpers to common place to reuse.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_color.c          |  73 ++++++++------
 lib/igt_color.h          |  63 ++----------
 tests/kms_color_helper.c | 158 +++++++++++++++++++++++++++++
 tests/kms_color_helper.h |  55 ++++++++++
 tests/kms_colorop.c      | 211 ++++++++++-----------------------------
 tests/kms_colorop.h      | 124 -----------------------
 tests/meson.build        |   1 +
 7 files changed, 324 insertions(+), 361 deletions(-)
 delete mode 100644 tests/kms_colorop.h

diff --git a/lib/igt_color.c b/lib/igt_color.c
index d1ad3e3b8..b1814bdae 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -14,6 +14,51 @@
 #include "igt_core.h"
 #include "igt_x86.h"
 
+const struct igt_color_tf srgb_tf = {2.4f, (float)(1/1.055), (float)(0.055/1.055), (float)(1/12.92), 0.04045f, 0, 0};
+
+const igt_matrix_3x4_t igt_matrix_3x4_50_desat = { {
+	0.5, 0.25, 0.25, 0.0,
+	0.25, 0.5, 0.25, 0.0,
+	0.25, 0.25, 0.5, 0.0
+} };
+
+const igt_matrix_3x4_t igt_matrix_3x4_overdrive = { {
+	1.5, 0.0, 0.0, 0.0,
+	0.0, 1.5, 0.0, 0.0,
+	0.0, 0.0, 1.5, 0.0
+} };
+
+const igt_matrix_3x4_t igt_matrix_3x4_oversaturate = { {
+	1.5,   -0.25, -0.25, 0.0,
+	-0.25,  1.5,  -0.25, 0.0,
+	-0.25, -0.25,  1.5,  0.0
+} };
+
+#if 0
+const igt_matrix_3x4_t igt_matrix_3x4_bt709_enc = { {
+	 0.2126,   0.7152,  0.0722, 0.0,
+	-0.1146, -0.3854,  0.5,    0.0,
+	 0.5,     -0.4542, -0.0458, 0.0
+} };
+
+const igt_matrix_3x4_t igt_matrix_3x4_bt709_dec = { {
+	1.0,  0.0,     1.5748, 0.0,
+	1.0, -0.1873, -0.4681, 0.0,
+	1.0,  1.8556,  0.0,    0.0
+} };
+#else
+const igt_matrix_3x4_t igt_matrix_3x4_bt709_enc = { {
+	 0.2126,   0.7152,   0.0722,  0.0,
+	-0.09991, -0.33609,  0.436,   0.0,
+	 0.615,   -0.55861, -0.05639, 0.0
+} };
+
+const igt_matrix_3x4_t igt_matrix_3x4_bt709_dec = { {
+	1.0,  0.0,      1.28033, 0.0,
+	1.0, -0.21482, -0.38059, 0.0,
+	1.0,  2.12798,  0.0,     0.0
+} };
+#endif
 
 static float clamp(float val, float min, float max)
 {
@@ -62,8 +107,6 @@ void igt_color_srgb_inv_eotf(igt_pixel_t *pixel)
 	pixel->b = igt_color_tf_eval(&inv, pixel->b);
 }
 
-
-
 void igt_color_srgb_eotf(igt_pixel_t *pixel)
 {
 	pixel->r = igt_color_tf_eval(&srgb_tf, pixel->r);
@@ -126,7 +169,6 @@ void igt_color_ctm_3x4_bt709_dec(igt_pixel_t *pixel)
 	igt_color_apply_3x4_ctm(pixel, &igt_matrix_3x4_bt709_dec);
 }
 
-
 int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], int num_transforms)
 {
 	uint32_t *line = NULL;
@@ -304,7 +346,6 @@ bool igt_cmp_fb_pixels(igt_fb_t *fb1, igt_fb_t *fb2, uint8_t up, uint8_t down)
 	return matched;
 }
 
-
 void igt_dump_fb(igt_display_t *display, igt_fb_t *fb,
 		 const char *path_name, const char *file_name)
 {
@@ -318,27 +359,3 @@ void igt_dump_fb(igt_display_t *display, igt_fb_t *fb,
 	igt_assert_eq(status, CAIRO_STATUS_SUCCESS);
 	cairo_surface_destroy(fb_surface_out);
 }
-
-void igt_colorop_set_ctm_3x4(igt_display_t *display,
-			     igt_colorop_t *colorop,
-			     const igt_matrix_3x4_t *matrix)
-{
-	struct drm_color_ctm_3x4 ctm;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(ctm.matrix); i++) {
-		if (matrix->m[i] < 0) {
-			ctm.matrix[i] =
-				(int64_t) (-matrix->m[i] *
-				((int64_t) 1L << 32));
-			ctm.matrix[i] |= 1ULL << 63;
-		} else {
-			ctm.matrix[i] =
-				(int64_t) (matrix->m[i] *
-				((int64_t) 1L << 32));
-		}
-	}
-
-	/* set blob property */
-	igt_colorop_replace_prop_blob(colorop, IGT_COLOROP_DATA, &ctm, sizeof(ctm));
-}
diff --git a/lib/igt_color.h b/lib/igt_color.h
index 55f0d2dc4..46c399cd5 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -19,8 +19,6 @@ struct igt_color_tf {
     float g, a,b,c,d,e,f;
 };
 
-const struct igt_color_tf srgb_tf = {2.4f, (float)(1/1.055), (float)(0.055/1.055), (float)(1/12.92), 0.04045f, 0, 0};
-
 typedef struct igt_pixel {
 	float r;
 	float g;
@@ -38,50 +36,16 @@ typedef struct igt_matrix_3x4 {
 	float m[12];
 } igt_matrix_3x4_t;
 
-const igt_matrix_3x4_t igt_matrix_3x4_50_desat = { {
-	0.5, 0.25, 0.25, 0.0,
-	0.25, 0.5, 0.25, 0.0,
-	0.25, 0.25, 0.5, 0.0
-} };
-
-const igt_matrix_3x4_t igt_matrix_3x4_overdrive = { {
-	1.5, 0.0, 0.0, 0.0,
-	0.0, 1.5, 0.0, 0.0,
-	0.0, 0.0, 1.5, 0.0
-} };
-
-const igt_matrix_3x4_t igt_matrix_3x4_oversaturate = { {
-	1.5,   -0.25, -0.25, 0.0,
-	-0.25,  1.5,  -0.25, 0.0,
-	-0.25, -0.25,  1.5,  0.0
-} };
-
-#if 0
-const igt_matrix_3x4_t igt_matrix_3x4_bt709_enc = { {
-	 0.2126,   0.7152,  0.0722, 0.0,
-	-0.1146, -0.3854,  0.5,    0.0,
-	 0.5,     -0.4542, -0.0458, 0.0
-} };
-
-const igt_matrix_3x4_t igt_matrix_3x4_bt709_dec = { {
-	1.0,  0.0,     1.5748, 0.0,
-	1.0, -0.1873, -0.4681, 0.0,
-	1.0,  1.8556,  0.0,    0.0
-} };
-#else
-const igt_matrix_3x4_t igt_matrix_3x4_bt709_enc = { {
-	 0.2126,   0.7152,   0.0722,  0.0,
-	-0.09991, -0.33609,  0.436,   0.0,
-	 0.615,   -0.55861, -0.05639, 0.0
-} };
-
-const igt_matrix_3x4_t igt_matrix_3x4_bt709_dec = { {
-	1.0,  0.0,      1.28033, 0.0,
-	1.0, -0.21482, -0.38059, 0.0,
-	1.0,  2.12798,  0.0,     0.0
-} };
-#endif
+typedef bool (*compare_fb_t)(igt_fb_t *in, igt_fb_t *out);
+typedef int (*transform_fb)(igt_fb_t *in);
+typedef int (*transform_pixel)(igt_pixel_t *pixel);
 
+extern const struct igt_color_tf srgb_tf;
+extern const igt_matrix_3x4_t igt_matrix_3x4_50_desat;
+extern const igt_matrix_3x4_t igt_matrix_3x4_overdrive;
+extern const igt_matrix_3x4_t igt_matrix_3x4_oversaturate;
+extern const igt_matrix_3x4_t igt_matrix_3x4_bt709_enc;
+extern const igt_matrix_3x4_t igt_matrix_3x4_bt709_dec;
 
 bool igt_cmp_fb_component(uint16_t comp1, uint16_t comp2, uint8_t up, uint8_t down);
 bool igt_cmp_fb_pixels(igt_fb_t *fb1, igt_fb_t *fb2, uint8_t up, uint8_t down);
@@ -93,14 +57,7 @@ typedef void (*igt_pixel_transform)(igt_pixel_t *pixel);
 
 int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], int num_transforms);
 
-/* colorop helpers */
-
-void igt_colorop_set_ctm_3x4(igt_display_t *display,
-			     igt_colorop_t *colorop,
-			     const igt_matrix_3x4_t *matrix);
-
 /* transformations */
-
 void igt_color_srgb_inv_eotf(igt_pixel_t *pixel);
 void igt_color_srgb_eotf(igt_pixel_t *pixel);
 
@@ -111,4 +68,4 @@ void igt_color_ctm_3x4_bt709_dec(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_bt709_enc(igt_pixel_t *pixel);
 
 
-#endif
\ No newline at end of file
+#endif
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 143dff43e..02e5b975a 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -388,3 +388,161 @@ void invalid_ctm_matrix_sizes(data_t *data, enum pipe p)
 	free(ptr);
 }
 
+/* Colorops definitions */
+static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_colorop_t *desired)
+{
+	switch (desired->type) {
+	case KMS_COLOROP_ENUMERATED_LUT1D:
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE);
+	case KMS_COLOROP_CTM_3X4:
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CTM_3X4);
+	case KMS_COLOROP_CUSTOM_LUT1D:
+	case KMS_COLOROP_LUT3D:
+	default:
+		return false;
+	}
+}
+
+/**
+ * Iterate color pipeline that begins with colorop and try to map
+ * colorops[] to it.
+ */
+static bool map_to_pipeline(igt_display_t *display,
+			    igt_colorop_t *colorop,
+			    kms_colorop_t *colorops[])
+{
+	igt_colorop_t *next = colorop;
+	kms_colorop_t *current_op;
+	int i = 0;
+	int prop_val = 0;
+
+	current_op = colorops[i++];
+	if (!current_op)
+		return false;
+
+	while (next) {
+		if (can_use_colorop(display, next, current_op)) {
+			current_op->colorop = next;
+			current_op = colorops[i++];
+			if (!current_op)
+				break;
+		}
+		prop_val = igt_colorop_get_prop(display, next,
+						IGT_COLOROP_NEXT);
+		next = igt_find_colorop(display, prop_val);
+	}
+
+	if (current_op) {
+		/* we failed to map the pipeline */
+
+		/* clean up colorops[i].colorop mappings */
+		for(i = 0, current_op = colorops[0]; current_op; current_op = colorops[i++])
+			current_op->colorop = NULL;
+
+		return false;
+	}
+
+	return true;
+}
+
+igt_colorop_t *get_color_pipeline(igt_display_t *display,
+				  igt_plane_t *plane,
+				  kms_colorop_t *colorops[])
+{
+	igt_colorop_t *colorop = NULL;
+	int i;
+
+	/* go through all color pipelines */
+	for (i = 0; i < plane->num_color_pipelines; ++i) {
+		if (map_to_pipeline(display, plane->color_pipelines[i], colorops)) {
+			colorop = plane->color_pipelines[i];
+			break;
+		}
+	}
+
+	return colorop;
+}
+
+void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
+{
+	igt_assert(colorop->colorop);
+	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 0);
+
+	/* TODO set to desired value from kms_colorop_t */
+	switch (colorop->type) {
+	case KMS_COLOROP_ENUMERATED_LUT1D:
+		switch (colorop->enumerated_lut1d_info.tf) {
+		case KMS_COLOROP_LUT1D_SRGB_EOTF:
+			igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, "sRGB EOTF");
+			break;
+		case KMS_COLOROP_LUT1D_SRGB_INV_EOTF:
+			igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, "sRGB Inverse EOTF");
+			break;
+		case KMS_COLOROP_LUT1D_PQ_EOTF:
+		case KMS_COLOROP_LUT1D_PQ_INV_EOTF:
+		default:
+			igt_fail(IGT_EXIT_FAILURE);
+		}
+		break;
+	case KMS_COLOROP_CTM_3X4:
+		igt_colorop_set_ctm_3x4(display, colorop->colorop, colorop->matrix_3x4);
+		break;
+	case KMS_COLOROP_CUSTOM_LUT1D:
+	case KMS_COLOROP_LUT3D:
+	default:
+		igt_fail(IGT_EXIT_FAILURE);
+	}
+}
+
+void set_color_pipeline(igt_display_t *display,
+			igt_plane_t *plane,
+			kms_colorop_t *colorops[],
+			igt_colorop_t *color_pipeline)
+{
+	igt_colorop_t *next;
+	int prop_val = 0;
+	int i;
+
+	igt_plane_set_color_pipeline(plane, color_pipeline);
+
+	for(i = 0; colorops[i]; i++)
+		set_colorop(display, colorops[i]);
+
+	/* set unused ops in pipeline to bypass */
+	next = color_pipeline;
+	i = 0;
+	while (next) {
+		if (!colorops[i] || colorops[i]->colorop != next)
+			igt_colorop_set_prop_value(next, IGT_COLOROP_BYPASS, 1);
+		else
+			i++;
+
+		prop_val = igt_colorop_get_prop(display, next,
+						IGT_COLOROP_NEXT);
+		next = igt_find_colorop(display, prop_val);
+	}
+}
+
+void igt_colorop_set_ctm_3x4(igt_display_t *display,
+			     igt_colorop_t *colorop,
+			     const igt_matrix_3x4_t *matrix)
+{
+	struct drm_color_ctm_3x4 ctm;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ctm.matrix); i++) {
+		if (matrix->m[i] < 0) {
+			ctm.matrix[i] =
+				(int64_t) (-matrix->m[i] *
+				((int64_t) 1L << 32));
+			ctm.matrix[i] |= 1ULL << 63;
+		} else {
+			ctm.matrix[i] =
+				(int64_t) (matrix->m[i] *
+				((int64_t) 1L << 32));
+		}
+	}
+
+	/* set blob property */
+	igt_colorop_replace_prop_blob(colorop, IGT_COLOROP_DATA, &ctm, sizeof(ctm));
+}
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 23463b944..566615ad9 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -36,6 +36,7 @@
 #include "drm.h"
 #include "drmtest.h"
 #include "igt.h"
+#include "igt_color.h"
 #include "igt_edid.h"
 
 
@@ -53,6 +54,12 @@ typedef struct {
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 
+	bool builtin_mode;
+	bool custom_mode;
+	bool list_modes;
+	bool dump_check;
+	int mode_index;
+
 	uint32_t drm_format;
 	uint32_t color_depth;
 	uint64_t degamma_lut_size;
@@ -115,5 +122,53 @@ void invalid_gamma_lut_sizes(data_t *data, enum pipe p);
 void invalid_degamma_lut_sizes(data_t *data, enum pipe p);
 void invalid_ctm_matrix_sizes(data_t *data, enum pipe p);
 
+/* Colorops Test version definitions */
+typedef enum kms_colorop_type {
+	KMS_COLOROP_ENUMERATED_LUT1D,
+	KMS_COLOROP_CUSTOM_LUT1D,
+	KMS_COLOROP_CTM_3X4,
+	KMS_COLOROP_LUT3D
+} kms_colorop_type_t;
+
+typedef enum kms_colorop_lut1d_tf {
+	KMS_COLOROP_LUT1D_SRGB_EOTF,
+	KMS_COLOROP_LUT1D_SRGB_INV_EOTF,
+	KMS_COLOROP_LUT1D_PQ_EOTF,
+	KMS_COLOROP_LUT1D_PQ_INV_EOTF,
+} kms_colorop_lut1d_tf_t;
+
+typedef struct kms_colorop_enumerated_lut1d_info {
+	kms_colorop_lut1d_tf_t tf;
+} kms_colorop_enumerated_lut1d_info_t;
+
+typedef struct kms_colorop {
+	kms_colorop_type_t type;
+
+	union {
+		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
+		const igt_matrix_3x4_t *matrix_3x4;
+	};
+
+	const char *name;
+
+	igt_pixel_transform transform;
+
+	/* Mapped colorop */
+	igt_colorop_t *colorop;
+
+} kms_colorop_t;
+
+/* colorop helpers */
+igt_colorop_t *get_color_pipeline(igt_display_t *display, igt_plane_t *plane,
+			      kms_colorop_t *colorops[]);
+void set_colorop(igt_display_t *display, kms_colorop_t *colorop);
+void set_color_pipeline(igt_display_t *display, igt_plane_t *plane,
+			      kms_colorop_t *colorops[], igt_colorop_t *color_pipeline);
+void igt_colorop_set_ctm_3x4(igt_display_t *display,
+			     igt_colorop_t *colorop,
+			     const igt_matrix_3x4_t *matrix);
+
+#define set_color_pipeline_bypass(plane)  igt_plane_set_prop_enum((plane), IGT_PLANE_COLOR_PIPELINE, "Bypass")
+
 #endif
 
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 72e59725d..26cf87ec2 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -20,12 +20,9 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
-#include "igt.h"
-#include "igt_color.h"
+#include "kms_color_helper.h"
 #include "sw_sync.h"
 
-#include "kms_colorop.h"
-
 /**
  * TEST: kms colorop
  * Category: Display
@@ -53,6 +50,59 @@
  *
  */
 
+kms_colorop_t kms_colorop_srgb_eotf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_SRGB_EOTF
+	},
+	.name = "srgb_eotf",
+	.transform = &igt_color_srgb_eotf
+};
+
+kms_colorop_t kms_colorop_srgb_inv_eotf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_SRGB_INV_EOTF
+	},
+	.name = "srgb_inv_eotf",
+	.transform = &igt_color_srgb_inv_eotf
+};
+
+kms_colorop_t kms_colorop_ctm_3x4_50_desat = {
+	.type = KMS_COLOROP_CTM_3X4,
+	.matrix_3x4 = &igt_matrix_3x4_50_desat,
+	.name = "ctm_3x4_50_desat",
+	.transform = &igt_color_ctm_3x4_50_desat
+};
+
+kms_colorop_t kms_colorop_ctm_3x4_overdrive = {
+	.type = KMS_COLOROP_CTM_3X4,
+	.matrix_3x4 = &igt_matrix_3x4_overdrive,
+	.name = "ctm_3x4_overdrive",
+	.transform = &igt_color_ctm_3x4_overdrive
+};
+
+kms_colorop_t kms_colorop_ctm_3x4_oversaturate = {
+	.type = KMS_COLOROP_CTM_3X4,
+	.matrix_3x4 = &igt_matrix_3x4_oversaturate,
+	.name = "ctm_3x4_oversaturate",
+	.transform = &igt_color_ctm_3x4_oversaturate
+};
+
+kms_colorop_t kms_colorop_ctm_3x4_bt709_enc = {
+	.type = KMS_COLOROP_CTM_3X4,
+	.matrix_3x4 = &igt_matrix_3x4_bt709_enc,
+	.name = "ctm_3x4_bt709_enc",
+	.transform = &igt_color_ctm_3x4_bt709_enc
+};
+
+kms_colorop_t kms_colorop_ctm_3x4_bt709_dec = {
+	.type = KMS_COLOROP_CTM_3X4,
+	.matrix_3x4 = &igt_matrix_3x4_bt709_dec,
+	.name = "ctm_3x4_bt709_dec",
+	.transform = &igt_color_ctm_3x4_bt709_dec
+};
+
 /* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
 static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 				    drmModeModeInfo override_mode)
@@ -89,16 +139,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	return !ret;
 }
 
-/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
-typedef struct {
-	bool builtin_mode;
-	bool custom_mode;
-	bool list_modes;
-	bool dump_check;
-	int mode_index;
-	drmModeModeInfo user_mode;
-} data_t;
-
 static data_t data;
 
 /* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
@@ -134,7 +174,7 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display)
 			igt_output_set_pipe(output, pipe);
 
 			if (data.custom_mode)
-				override_mode = data.user_mode;
+				override_mode = *data.mode;
 			if (data.builtin_mode)
 				override_mode = output->config.connector->modes[data.mode_index];
 
@@ -184,147 +224,6 @@ static void get_and_wait_out_fence(igt_output_t *output)
 	output->writeback_out_fence_fd = -1;
 }
 
-static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_colorop_t *desired)
-{
-	switch (desired->type) {
-	case KMS_COLOROP_ENUMERATED_LUT1D:
-		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE);
-	case KMS_COLOROP_CTM_3X4:
-		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CTM_3X4);
-	case KMS_COLOROP_CUSTOM_LUT1D:
-	case KMS_COLOROP_LUT3D:
-	default:
-		return false;
-	}
-}
-
-/**
- * Iterate color pipeline that begins with colorop and try to map
- * colorops[] to it.
- */
-static bool map_to_pipeline(igt_display_t *display,
-			    igt_colorop_t *colorop,
-			    kms_colorop_t *colorops[])
-{
-	igt_colorop_t *next = colorop;
-	kms_colorop_t *current_op;
-	int i = 0;
-	int prop_val = 0;
-
-	current_op = colorops[i];
-	i++;
-	igt_require(current_op);
-
-	while (next) {
-		if (can_use_colorop(display, next, current_op)) {
-			current_op->colorop = next;
-			current_op = colorops[i];
-			i++;
-			if (!current_op)
-				break;
-		}
-		prop_val = igt_colorop_get_prop(display, next,
-						IGT_COLOROP_NEXT);
-		next = igt_find_colorop(display, prop_val);
-	}
-
-	if (current_op) {
-		/* we failed to map the pipeline */
-
-		/* clean up colorops[i].colorop mappings */
-		for(i = 0, current_op = colorops[0]; current_op; current_op = colorops[i++])
-			current_op->colorop = NULL;
-
-		return false;
-	}
-
-	return true;
-}
-
-static igt_colorop_t *get_color_pipeline(igt_display_t *display,
-					 igt_plane_t *plane,
-					 kms_colorop_t *colorops[])
-{
-	igt_colorop_t *colorop = NULL;
-	int i;
-
-	/* go through all color pipelines */
-	for (i = 0; i < plane->num_color_pipelines; ++i) {
-		if (map_to_pipeline(display, plane->color_pipelines[i], colorops)) {
-			colorop = plane->color_pipelines[i];
-			break;
-		}
-	}
-
-	return colorop;
-}
-
-static void set_colorop(igt_display_t *display,
-			kms_colorop_t *colorop)
-{
-	igt_assert(colorop->colorop);
-	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 0);
-
-	/* TODO set to desired value from kms_colorop_t */
-	switch (colorop->type) {
-	case KMS_COLOROP_ENUMERATED_LUT1D:
-		switch (colorop->enumerated_lut1d_info.tf) {
-		case KMS_COLOROP_LUT1D_SRGB_EOTF:
-			igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, "sRGB EOTF");
-			break;
-		case KMS_COLOROP_LUT1D_SRGB_INV_EOTF:
-			igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, "sRGB Inverse EOTF");
-			break;
-		case KMS_COLOROP_LUT1D_PQ_EOTF:
-		case KMS_COLOROP_LUT1D_PQ_INV_EOTF:
-		default:
-			igt_fail(IGT_EXIT_FAILURE);
-		}
-		break;
-	case KMS_COLOROP_CTM_3X4:
-		igt_colorop_set_ctm_3x4(display, colorop->colorop, colorop->matrix_3x4);
-		break;
-	case KMS_COLOROP_CUSTOM_LUT1D:
-	case KMS_COLOROP_LUT3D:
-	default:
-		igt_fail(IGT_EXIT_FAILURE);
-	}
-}
-
-static void set_color_pipeline(igt_display_t *display,
-			       igt_plane_t *plane,
-			       kms_colorop_t *colorops[],
-			       igt_colorop_t *color_pipeline)
-{
-	igt_colorop_t *next;
-	int prop_val = 0;
-	int i;
-
-	igt_plane_set_color_pipeline(plane, color_pipeline);
-
-	for(i = 0; colorops[i]; i++)
-		set_colorop(display, colorops[i]);
-
-	/* set unused ops in pipeline to bypass */
-	next = color_pipeline;
-	i = 0;
-	while (next) {
-		if (!colorops[i] || colorops[i]->colorop != next)
-			igt_colorop_set_prop_value(next, IGT_COLOROP_BYPASS, 1);
-		else
-			i++;
-
-		prop_val = igt_colorop_get_prop(display, next,
-						IGT_COLOROP_NEXT);
-		next = igt_find_colorop(display, prop_val);
-	}
-}
-
-static void set_color_pipeline_bypass(igt_plane_t *plane)
-{
-	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
-}
-
 static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
 {
 	if (is_vkms_device(in->fd))
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
deleted file mode 100644
index 30278ca4e..000000000
--- a/tests/kms_colorop.h
+++ /dev/null
@@ -1,124 +0,0 @@
-/*
- * Copyright 2023 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#ifndef __KMS_COLOROP_H__
-#define __KMS_COLOROP_H__
-
-#include "igt_color.h"
-
-typedef bool (*compare_fb_t)(igt_fb_t *in, igt_fb_t *out);
-
-typedef int (*transform_fb)(igt_fb_t *in);
-
-typedef int (*transform_pixel)(igt_pixel_t *pixel);
-
-/* Test version definitions */
-typedef enum kms_colorop_type {
-	KMS_COLOROP_ENUMERATED_LUT1D,
-	KMS_COLOROP_CUSTOM_LUT1D,
-	KMS_COLOROP_CTM_3X4,
-	KMS_COLOROP_LUT3D
-} kms_colorop_type_t;
-
-typedef enum kms_colorop_lut1d_tf {
-	KMS_COLOROP_LUT1D_SRGB_EOTF,
-	KMS_COLOROP_LUT1D_SRGB_INV_EOTF,
-	KMS_COLOROP_LUT1D_PQ_EOTF,
-	KMS_COLOROP_LUT1D_PQ_INV_EOTF,
-} kms_colorop_lut1d_tf_t;
-
-typedef struct kms_colorop_enumerated_lut1d_info {
-	kms_colorop_lut1d_tf_t tf;
-} kms_colorop_enumerated_lut1d_info_t;
-
-typedef struct kms_colorop {
-	kms_colorop_type_t type;
-
-	union {
-		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
-		const igt_matrix_3x4_t *matrix_3x4;
-	};
-
-	const char *name;
-
-	igt_pixel_transform transform;
-
-	/* Mapped colorop */
-	igt_colorop_t *colorop;
-
-} kms_colorop_t;
-
-kms_colorop_t kms_colorop_srgb_eotf = {
-	.type = KMS_COLOROP_ENUMERATED_LUT1D,
-	.enumerated_lut1d_info = {
-		.tf = KMS_COLOROP_LUT1D_SRGB_EOTF
-	},
-	.name = "srgb_eotf",
-	.transform = &igt_color_srgb_eotf
-};
-
-kms_colorop_t kms_colorop_srgb_inv_eotf = {
-	.type = KMS_COLOROP_ENUMERATED_LUT1D,
-	.enumerated_lut1d_info = {
-		.tf = KMS_COLOROP_LUT1D_SRGB_INV_EOTF
-	},
-	.name = "srgb_inv_eotf",
-	.transform = &igt_color_srgb_inv_eotf
-};
-
-kms_colorop_t kms_colorop_ctm_3x4_50_desat = {
-	.type = KMS_COLOROP_CTM_3X4,
-	.matrix_3x4 = &igt_matrix_3x4_50_desat,
-	.name = "ctm_3x4_50_desat",
-	.transform = &igt_color_ctm_3x4_50_desat
-};
-
-kms_colorop_t kms_colorop_ctm_3x4_overdrive = {
-	.type = KMS_COLOROP_CTM_3X4,
-	.matrix_3x4 = &igt_matrix_3x4_overdrive,
-	.name = "ctm_3x4_overdrive",
-	.transform = &igt_color_ctm_3x4_overdrive
-};
-
-kms_colorop_t kms_colorop_ctm_3x4_oversaturate = {
-	.type = KMS_COLOROP_CTM_3X4,
-	.matrix_3x4 = &igt_matrix_3x4_oversaturate,
-	.name = "ctm_3x4_oversaturate",
-	.transform = &igt_color_ctm_3x4_oversaturate
-};
-
-kms_colorop_t kms_colorop_ctm_3x4_bt709_enc = {
-	.type = KMS_COLOROP_CTM_3X4,
-	.matrix_3x4 = &igt_matrix_3x4_bt709_enc,
-	.name = "ctm_3x4_bt709_enc",
-	.transform = &igt_color_ctm_3x4_bt709_enc
-};
-
-kms_colorop_t kms_colorop_ctm_3x4_bt709_dec = {
-	.type = KMS_COLOROP_CTM_3X4,
-	.matrix_3x4 = &igt_matrix_3x4_bt709_dec,
-	.name = "ctm_3x4_bt709_dec",
-	.transform = &igt_color_ctm_3x4_bt709_dec
-};
-
-
-#endif /* __KMS_COLOROP_H__ */
diff --git a/tests/meson.build b/tests/meson.build
index b37e5b6d3..4dec687db 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -352,6 +352,7 @@ extra_sources = {
 	'dumb_buffer': ['dumb_buffer.c' ],
 	'testdisplay': [ 'testdisplay_hotplug.c' ],
 	'kms_color':  [ 'kms_color_helper.c' ],
+	'kms_colorop':  [ 'kms_color_helper.c' ],
 	'kms_chamelium_audio': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_color':  [ 'kms_color_helper.c' ],
 	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
-- 
2.43.0

