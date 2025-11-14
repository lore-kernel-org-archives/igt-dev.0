Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DF8CE8D66
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 17:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CBB410EAE8;
	Fri, 14 Nov 2025 17:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zr9w+Lfj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A2610EAE3
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 17:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763140947; x=1794676947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EXXpOxCDrD8SpZbp+lPIGBW8qsSOEIyz2Oo6JHIl/ds=;
 b=Zr9w+Lfjr5JsBPN8GjS63Lcze2Kh9t0c4XO54rn7g3wT1VxCR6y3CwqT
 vjPH7zYWAQEc8PLPIZiBTiSKAhzRJlcvb1cO1XsW7CMIHYu/hBHG8H0J6
 WMIZqr088TQgHmhUQcUs+7FyuBIOsiINMac2BTM15LHv4StoCvw+xDlXg
 zrrQZjPVGh1iRGmES9HYsIcRUj+Cih6F+b92CoRGEp+blfnvLJ/O8h9TQ
 YMLoVSFrhZXOLinmVA/Ll8u2I+a+tJfqIxpKsOPNUNbNSYsV0m4suj8a1
 n0+9OBicwUUYgsS1TJvQc54culqpi3FkPjsRK32EWoONvz/AZFqeKa5O/ w==;
X-CSE-ConnectionGUID: +bPl/ytESUKg8wGQE150fA==
X-CSE-MsgGUID: 70C/+J8+SYSF/gRSE1r0lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82871435"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82871435"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 09:22:27 -0800
X-CSE-ConnectionGUID: yueT885ET7aQ/Sf2Rg+cuQ==
X-CSE-MsgGUID: 7nD+5FNlRju2zafkPspurQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194981374"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 09:22:25 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v4 02/23] tests/kms_color: Move color pipeline helpers into
 kms_color_helper
Date: Fri, 14 Nov 2025 22:58:47 +0530
Message-Id: <20251114172908.1027816-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251114172908.1027816-1-swati2.sharma@intel.com>
References: <20251114172908.1027816-1-swati2.sharma@intel.com>
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

Refactor kms_color and kms_colorop by moving common color pipeline
functions into kms_color_helper.[ch]. This consolidates LUT setup,
matrix configuration, and colorop mapping logic, reducing duplication
between tests.

In addition, LUT and matrix reference data are now defined in lib/
with extern declarations, avoiding multiple-definition issues.
The 3DLUT table is marked static const to prevent accidental writes.

This change prepares the groundwork for adding more color pipeline
tests while keeping kms_color and kms_colorop focused on test logic.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_color.c          |  52 +++++++++-
 lib/igt_color.h          |  77 ++++++--------
 lib/igt_color_lut.h      |   2 +-
 tests/kms_color_helper.c | 202 ++++++++++++++++++++++++++++++++++++
 tests/kms_color_helper.h |  56 +++++++++-
 tests/kms_colorop.c      | 215 +--------------------------------------
 tests/kms_colorop.h      |  69 -------------
 tests/meson.build        |   1 +
 8 files changed, 344 insertions(+), 330 deletions(-)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 6a306bda2..e66d6fe54 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -16,6 +16,56 @@
 #include "igt_core.h"
 #include "igt_x86.h"
 
+const struct igt_color_tf srgb_eotf = {2.4f, (float)(1/1.055), (float)(0.055/1.055), (float)(1/12.92), 0.04045f, 0, 0};
+const struct igt_color_tf bt2020_inv_oetf = {(float)(1/0.45f), (float)(1/1.0993f), (float)(0.0993f/1.0993f), (float)(1/4.5f), (float)(0.081), 0, 0};
+const struct igt_color_tf_pq pq_eotf = {-107/128.0f, 1.0f, 32/2523.0f, 2413/128.0f, -2392/128.0f, 8192/1305.0f};
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
+
+igt_1dlut_t igt_1dlut_srgb_inv_eotf = { {
+} };
+
+igt_1dlut_t igt_1dlut_srgb_eotf = { {
+} };
+
+const char * const kms_colorop_lut1d_tf_names[KMS_COLOROP_LUT1D_NUM_ENUMS] = {
+	[KMS_COLOROP_LUT1D_SRGB_EOTF] = "sRGB EOTF",
+	[KMS_COLOROP_LUT1D_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+	[KMS_COLOROP_LUT1D_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
+	[KMS_COLOROP_LUT1D_BT2020_OETF] = "BT.2020 OETF",
+	[KMS_COLOROP_LUT1D_PQ_EOTF] = "PQ EOTF",
+	[KMS_COLOROP_LUT1D_PQ_INV_EOTF] = "PQ Inverse EOTF",
+	[KMS_COLOROP_LUT1D_PQ_125_EOTF] = "PQ 125 EOTF",
+	[KMS_COLOROP_LUT1D_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
+};
 
 static float clamp(float val, float min, float max)
 {
@@ -220,7 +270,7 @@ igt_get_lut3d_index_blue_fast(int r, int g, int b, long dim, int components)
 }
 
 /* algorithm from https://github.com/AcademySoftwareFoundation/OpenColorIO/blob/main/src/OpenColorIO/ops/lut3d/Lut3DOpCPU.cpp#L422 */
-static void igt_color_3dlut_tetrahedral(igt_pixel_t *pixel, igt_3dlut_t *lut3d, long m_dim)
+static void igt_color_3dlut_tetrahedral(igt_pixel_t *pixel, const igt_3dlut_t *lut3d, long m_dim)
 {
 	int n000, n100, n010, n001, n110, n101, n011, n111;
 	float m_step = (float) m_dim - 1.0f;
diff --git a/lib/igt_color.h b/lib/igt_color.h
index 0e1dc84e2..c88b9838c 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -28,28 +28,25 @@ struct igt_color_tf_pq {
 	float A, B, C, D, E, F, G;
 };
 
-
-const struct igt_color_tf srgb_eotf = {2.4f, (float)(1/1.055), (float)(0.055/1.055), (float)(1/12.92), 0.04045f, 0, 0};
-const struct igt_color_tf bt2020_inv_oetf = {(float)(1/0.45f), (float)(1/1.0993f), (float)(0.0993f/1.0993f), (float)(1/4.5f), (float)(0.081), 0, 0};
-
-const struct igt_color_tf_pq pq_eotf = {-107/128.0f, 1.0f, 32/2523.0f, 2413/128.0f, -2392/128.0f, 8192/1305.0f };
-
 typedef struct igt_pixel {
 	float r;
 	float g;
 	float b;
 } igt_pixel_t;
 
-typedef struct igt_1dlut {
-	struct drm_color_lut32 lut[MAX_COLOR_LUT_ENTRIES];
-} igt_1dlut_t;
-
-igt_1dlut_t igt_1dlut_srgb_inv_eotf = { {
-} };
-
+typedef enum kms_colorop_lut1d_tf {
+	KMS_COLOROP_LUT1D_SRGB_EOTF,
+	KMS_COLOROP_LUT1D_SRGB_INV_EOTF,
+	KMS_COLOROP_LUT1D_BT2020_INV_OETF,
+	KMS_COLOROP_LUT1D_BT2020_OETF,
+	KMS_COLOROP_LUT1D_PQ_EOTF,
+	KMS_COLOROP_LUT1D_PQ_INV_EOTF,
+	KMS_COLOROP_LUT1D_PQ_125_EOTF,
+	KMS_COLOROP_LUT1D_PQ_125_INV_EOTF,
+	KMS_COLOROP_LUT1D_NUM_ENUMS
+} kms_colorop_lut1d_tf_t;
 
-igt_1dlut_t igt_1dlut_srgb_eotf = { {
-} };
+extern const char * const kms_colorop_lut1d_tf_names[KMS_COLOROP_LUT1D_NUM_ENUMS];
 
 typedef struct igt_matrix_3x4 {
 	/*
@@ -62,35 +59,26 @@ typedef struct igt_matrix_3x4 {
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
+typedef struct igt_1dlut {
+	struct drm_color_lut32 lut[MAX_COLOR_LUT_ENTRIES];
+} igt_1dlut_t;
+
+typedef bool (*compare_fb_t)(igt_fb_t *in, igt_fb_t *out);
+typedef int (*transform_fb)(igt_fb_t *in);
+typedef int (*transform_pixel)(igt_pixel_t *pixel);
+
+extern const struct igt_color_tf srgb_eotf;
+extern const struct igt_color_tf bt2020_inv_oetf;
+extern const struct igt_color_tf_pq pq_eotf;
+
+extern const igt_matrix_3x4_t igt_matrix_3x4_50_desat;
+extern const igt_matrix_3x4_t igt_matrix_3x4_overdrive;
+extern const igt_matrix_3x4_t igt_matrix_3x4_oversaturate;
+extern const igt_matrix_3x4_t igt_matrix_3x4_bt709_enc;
+extern const igt_matrix_3x4_t igt_matrix_3x4_bt709_dec;
+
+extern igt_1dlut_t igt_1dlut_srgb_inv_eotf;
+extern igt_1dlut_t igt_1dlut_srgb_eotf;
 
 bool igt_cmp_fb_component(uint16_t comp1, uint16_t comp2, uint8_t up, uint8_t down);
 bool igt_cmp_fb_pixels(igt_fb_t *fb1, igt_fb_t *fb2, uint8_t up, uint8_t down);
@@ -118,7 +106,6 @@ void igt_colorop_set_3dlut(igt_display_t *display,
 			   const igt_3dlut_norm_t *lut3d,
 			   const size_t lut_size);
 
-
 /* transformations */
 
 void igt_color_srgb_inv_eotf(igt_pixel_t *pixel);
diff --git a/lib/igt_color_lut.h b/lib/igt_color_lut.h
index b5c149c3d..046a28504 100644
--- a/lib/igt_color_lut.h
+++ b/lib/igt_color_lut.h
@@ -27,7 +27,7 @@ typedef struct igt_3dlut {
  * A 3D LUT table with 17x17x17 entries for Traversal order RGB.
  * It can be generated by scripts/convert_3dlut.py
  */
-igt_3dlut_t igt_3dlut_17_rgb = { {
+static const igt_3dlut_t igt_3dlut_17_rgb = { {
 	{ .red = 0.000000, .green = 0.000000, .blue = 0.000000 },
 	{ .red = 0.175580, .green = 0.003419, .blue = 0.006838 },
 	{ .red = 0.338706, .green = 0.015140, .blue = 0.012454 },
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 143dff43e..40431a855 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -388,3 +388,205 @@ void invalid_ctm_matrix_sizes(data_t *data, enum pipe p)
 	free(ptr);
 }
 
+/* Colorops definitions */
+static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_colorop_t *desired)
+{
+	switch (desired->type) {
+	case KMS_COLOROP_ENUMERATED_LUT1D:
+		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE &&
+		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_CURVE_1D_TYPE, kms_colorop_lut1d_tf_names[desired->enumerated_lut1d_info.tf]))
+			return true;
+		return false;
+	case KMS_COLOROP_CTM_3X4:
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CTM_3X4);
+	case KMS_COLOROP_CUSTOM_LUT1D:
+		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_LUT)
+			return true;
+		return false;
+	case KMS_COLOROP_MULTIPLIER:
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_MULTIPLIER);
+	case KMS_COLOROP_LUT3D:
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_3D_LUT);
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
+	current_op = colorops[i];
+	i++;
+	igt_require(current_op);
+
+	while (next) {
+		if (can_use_colorop(display, next, current_op)) {
+			current_op->colorop = next;
+			current_op = colorops[i];
+			i++;
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
+		for (i = 0, current_op = colorops[0]; current_op; current_op = colorops[i++])
+			current_op->colorop = NULL;
+
+		return false;
+	}
+
+	return true;
+}
+
+igt_colorop_t *get_color_pipeline(igt_display_t *display,
+				 igt_plane_t *plane,
+				 kms_colorop_t *colorops[])
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
+static void fill_custom_1dlut(igt_display_t *display, kms_colorop_t *colorop)
+{
+	uint64_t lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
+	igt_pixel_t pixel;
+	float index;
+	int i;
+
+	for (i = 0; i < lut_size; i++) {
+		index = i / (float) lut_size;
+
+		pixel.r = index;
+		pixel.g = index;
+		pixel.b = index;
+
+		colorop->transform(&pixel);
+
+		colorop->lut1d->lut[i].red = pixel.r * UINT_MAX;
+		colorop->lut1d->lut[i].green = pixel.g * UINT_MAX;
+		colorop->lut1d->lut[i].blue = pixel.b * UINT_MAX;
+	}
+}
+
+static void configure_3dlut(igt_display_t *display, kms_colorop_t *colorop, uint64_t size)
+{
+	uint64_t lut_size = 0;
+	uint64_t i;
+	igt_3dlut_norm_t *igt_3dlut;
+
+	/* Convert 3DLUT floating points to u16 required by colorop API */
+	lut_size = size * size * size;
+	igt_3dlut = (igt_3dlut_norm_t *) malloc(sizeof(struct drm_color_lut32) * lut_size);
+	for (i = 0; i < lut_size; i++) {
+		const struct igt_color_lut_float *lut_f = &colorop->lut3d->lut[i];
+
+		igt_3dlut->lut[i].red = round((double)lut_f->red * UINT_MAX);
+		igt_3dlut->lut[i].green = round((double)lut_f->green * UINT_MAX);
+		igt_3dlut->lut[i].blue = round((double)lut_f->blue * UINT_MAX);
+	}
+
+	igt_colorop_set_3dlut(display, colorop->colorop, igt_3dlut, lut_size * sizeof(struct drm_color_lut32));
+	free(igt_3dlut);
+}
+
+void set_colorop(igt_display_t *display,
+		 kms_colorop_t *colorop)
+{
+	enum drm_colorop_lut3d_interpolation_type interpolation;
+	uint64_t lut_size = 0;
+	uint64_t mult = 1;
+
+	igt_assert(colorop->colorop);
+	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 0);
+
+	switch (colorop->type) {
+	case KMS_COLOROP_ENUMERATED_LUT1D:
+		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, kms_colorop_lut1d_tf_names[colorop->enumerated_lut1d_info.tf]);
+		break;
+	case KMS_COLOROP_CTM_3X4:
+		igt_colorop_set_ctm_3x4(display, colorop->colorop, colorop->matrix_3x4);
+		break;
+	case KMS_COLOROP_CUSTOM_LUT1D:
+		fill_custom_1dlut(display, colorop);
+		lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
+		igt_colorop_set_custom_1dlut(display, colorop->colorop, colorop->lut1d, lut_size * sizeof(struct drm_color_lut32));
+		break;
+	case KMS_COLOROP_MULTIPLIER:
+		mult = colorop->multiplier * (mult << 32);	/* convert double to fixed number */
+		igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_MULTIPLIER, mult);
+		break;
+	case KMS_COLOROP_LUT3D:
+		lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
+		interpolation = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_LUT3D_INTERPOLATION);
+
+		/* Check driver's lut size, color depth and interpolation with kms_colorop */
+		igt_skip_on(colorop->lut3d_info.size != lut_size);
+		igt_skip_on(colorop->lut3d_info.interpolation != interpolation);
+
+		configure_3dlut(display, colorop, lut_size);
+		break;
+	default:
+		igt_fail(IGT_EXIT_FAILURE);
+	}
+}
+
+void set_color_pipeline(igt_display_t *display,
+		        igt_plane_t *plane,
+		        kms_colorop_t *colorops[],
+		        igt_colorop_t *color_pipeline)
+{
+	igt_colorop_t *next;
+	int prop_val = 0;
+	int i;
+
+	igt_plane_set_color_pipeline(plane, color_pipeline);
+
+	for (i = 0; colorops[i]; i++)
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
+void set_color_pipeline_bypass(igt_plane_t *plane)
+{
+	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
+}
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 23463b944..eb56c0586 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -36,9 +36,9 @@
 #include "drm.h"
 #include "drmtest.h"
 #include "igt.h"
+#include "igt_color.h"
 #include "igt_edid.h"
 
-
 /* Internal */
 typedef struct {
 	double r, g, b;
@@ -53,6 +53,12 @@ typedef struct {
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
@@ -115,5 +121,53 @@ void invalid_gamma_lut_sizes(data_t *data, enum pipe p);
 void invalid_degamma_lut_sizes(data_t *data, enum pipe p);
 void invalid_ctm_matrix_sizes(data_t *data, enum pipe p);
 
+/* Test version definitions */
+typedef enum kms_colorop_type {
+	KMS_COLOROP_ENUMERATED_LUT1D,
+	KMS_COLOROP_CUSTOM_LUT1D,
+	KMS_COLOROP_CTM_3X4,
+	KMS_COLOROP_MULTIPLIER,
+	KMS_COLOROP_LUT3D
+} kms_colorop_type_t;
+
+typedef struct kms_colorop_enumerated_lut1d_info {
+	kms_colorop_lut1d_tf_t tf;
+} kms_colorop_enumerated_lut1d_info_t;
+
+typedef struct kms_colorop_lut3d_info {
+	uint32_t size;
+	enum drm_colorop_lut3d_interpolation_type interpolation;
+} kms_colorop_lut3d_info_t;
+
+typedef struct kms_colorop {
+	kms_colorop_type_t type;
+
+	union {
+		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
+		igt_1dlut_t *lut1d;
+		const igt_3dlut_t *lut3d;
+		const igt_matrix_3x4_t *matrix_3x4;
+		double multiplier;
+	};
+
+	kms_colorop_lut3d_info_t lut3d_info;
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
+				  kms_colorop_t *colorops[]);
+void set_colorop(igt_display_t *display, kms_colorop_t *colorop);
+void set_color_pipeline(igt_display_t *display, igt_plane_t *plane,
+		        kms_colorop_t *colorops[], igt_colorop_t *color_pipeline);
+void set_color_pipeline_bypass(igt_plane_t *plane);
+
 #endif
 
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 2ae854c5c..91024709a 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -23,6 +23,7 @@
 
 #include "igt.h"
 #include "igt_color.h"
+#include "kms_color_helper.h"
 #include "sw_sync.h"
 #include "kms_colorop.h"
 
@@ -135,16 +136,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
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
@@ -180,7 +171,7 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display, __u32 four
 			igt_output_set_pipe(output, pipe);
 
 			if (data.custom_mode)
-				override_mode = data.user_mode;
+				override_mode = *data.mode;
 			if (data.builtin_mode)
 				override_mode = output->config.connector->modes[data.mode_index];
 
@@ -230,208 +221,6 @@ static void get_and_wait_out_fence(igt_output_t *output)
 	output->writeback_out_fence_fd = -1;
 }
 
-static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_colorop_t *desired)
-{
-	switch (desired->type) {
-	case KMS_COLOROP_ENUMERATED_LUT1D:
-		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE &&
-		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_CURVE_1D_TYPE, kms_colorop_lut1d_tf_names[desired->enumerated_lut1d_info.tf]))
-			return true;
-		return false;
-	case KMS_COLOROP_CTM_3X4:
-		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CTM_3X4);
-	case KMS_COLOROP_CUSTOM_LUT1D:
-		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_LUT)
-			return true;
-		return false;
-	case KMS_COLOROP_MULTIPLIER:
-		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_MULTIPLIER);
-	case KMS_COLOROP_LUT3D:
-		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_3D_LUT);
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
-		for (i = 0, current_op = colorops[0]; current_op; current_op = colorops[i++])
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
-static void fill_custom_1dlut(igt_display_t *display, kms_colorop_t *colorop)
-{
-	uint64_t lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
-	igt_pixel_t pixel;
-	float index;
-	int i;
-
-	for (i = 0; i < lut_size; i++) {
-		index = i / (float) lut_size;
-
-		pixel.r = index;
-		pixel.g = index;
-		pixel.b = index;
-
-		colorop->transform(&pixel);
-
-		colorop->lut1d->lut[i].red = pixel.r * UINT_MAX;
-		colorop->lut1d->lut[i].green = pixel.g * UINT_MAX;
-		colorop->lut1d->lut[i].blue = pixel.b * UINT_MAX;
-	}
-}
-
-static void configure_3dlut(igt_display_t *display, kms_colorop_t *colorop, uint64_t size)
-{
-	uint64_t lut_size = 0;
-	uint64_t i;
-	igt_3dlut_norm_t *igt_3dlut;
-
-	/* Convert 3DLUT floating points to u16 required by colorop API */
-	lut_size = size * size * size;
-	igt_3dlut = (igt_3dlut_norm_t *) malloc(sizeof(struct drm_color_lut32) * lut_size);
-	for (i = 0; i < lut_size; i++) {
-		struct igt_color_lut_float *lut_f = &colorop->lut3d->lut[i];
-
-		igt_3dlut->lut[i].red = round((double)lut_f->red * UINT_MAX);
-		igt_3dlut->lut[i].green = round((double)lut_f->green * UINT_MAX);
-		igt_3dlut->lut[i].blue = round((double)lut_f->blue * UINT_MAX);
-	}
-
-	igt_colorop_set_3dlut(display, colorop->colorop, igt_3dlut, lut_size * sizeof(struct drm_color_lut32));
-	free(igt_3dlut);
-}
-
-static void set_colorop(igt_display_t *display,
-			kms_colorop_t *colorop)
-{
-	enum drm_colorop_lut3d_interpolation_type interpolation;
-	uint64_t lut_size = 0;
-	uint64_t mult = 1;
-
-	igt_assert(colorop->colorop);
-	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 0);
-
-	switch (colorop->type) {
-	case KMS_COLOROP_ENUMERATED_LUT1D:
-		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, kms_colorop_lut1d_tf_names[colorop->enumerated_lut1d_info.tf]);
-		break;
-	case KMS_COLOROP_CTM_3X4:
-		igt_colorop_set_ctm_3x4(display, colorop->colorop, colorop->matrix_3x4);
-		break;
-	case KMS_COLOROP_CUSTOM_LUT1D:
-		fill_custom_1dlut(display, colorop);
-		lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
-		igt_colorop_set_custom_1dlut(display, colorop->colorop, colorop->lut1d, lut_size * sizeof(struct drm_color_lut32));
-		break;
-	case KMS_COLOROP_MULTIPLIER:
-		mult = colorop->multiplier * (mult << 32);	/* convert double to fixed number */
-		igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_MULTIPLIER, mult);
-		break;
-	case KMS_COLOROP_LUT3D:
-		lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
-		interpolation = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_LUT3D_INTERPOLATION);
-
-		/* Check driver's lut size, color depth and interpolation with kms_colorop */
-		igt_skip_on(colorop->lut3d_info.size != lut_size);
-		igt_skip_on(colorop->lut3d_info.interpolation != interpolation);
-
-		configure_3dlut(display, colorop, lut_size);
-		break;
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
-	for (i = 0; colorops[i]; i++)
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
index 7fc88d6ca..75f860c40 100644
--- a/tests/kms_colorop.h
+++ b/tests/kms_colorop.h
@@ -26,75 +26,6 @@
 
 #include "igt_color.h"
 
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
-	KMS_COLOROP_MULTIPLIER,
-	KMS_COLOROP_LUT3D
-} kms_colorop_type_t;
-
-typedef enum kms_colorop_lut1d_tf {
-	KMS_COLOROP_LUT1D_SRGB_EOTF,
-	KMS_COLOROP_LUT1D_SRGB_INV_EOTF,
-	KMS_COLOROP_LUT1D_BT2020_INV_OETF,
-	KMS_COLOROP_LUT1D_BT2020_OETF,
-	KMS_COLOROP_LUT1D_PQ_EOTF,
-	KMS_COLOROP_LUT1D_PQ_INV_EOTF,
-	KMS_COLOROP_LUT1D_PQ_125_EOTF,
-	KMS_COLOROP_LUT1D_PQ_125_INV_EOTF,
-	KMS_COLOROP_LUT1D_NUM_ENUMS
-} kms_colorop_lut1d_tf_t;
-
-const char * const kms_colorop_lut1d_tf_names[KMS_COLOROP_LUT1D_NUM_ENUMS] = {
-	[KMS_COLOROP_LUT1D_SRGB_EOTF] = "sRGB EOTF",
-	[KMS_COLOROP_LUT1D_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
-	[KMS_COLOROP_LUT1D_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
-	[KMS_COLOROP_LUT1D_BT2020_OETF] = "BT.2020 OETF",
-	[KMS_COLOROP_LUT1D_PQ_EOTF] = "PQ EOTF",
-	[KMS_COLOROP_LUT1D_PQ_INV_EOTF] = "PQ Inverse EOTF",
-	[KMS_COLOROP_LUT1D_PQ_125_EOTF] = "PQ 125 EOTF",
-	[KMS_COLOROP_LUT1D_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
-};
-
-typedef struct kms_colorop_enumerated_lut1d_info {
-	kms_colorop_lut1d_tf_t tf;
-} kms_colorop_enumerated_lut1d_info_t;
-
-typedef struct kms_colorop_lut3d_info {
-	uint32_t size;
-	enum drm_colorop_lut3d_interpolation_type interpolation;
-} kms_colorop_lut3d_info_t;
-
-typedef struct kms_colorop {
-	kms_colorop_type_t type;
-
-	union {
-		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
-		igt_1dlut_t *lut1d;
-		igt_3dlut_t *lut3d;
-		const igt_matrix_3x4_t *matrix_3x4;
-		double multiplier;
-	};
-
-	kms_colorop_lut3d_info_t lut3d_info;
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
 kms_colorop_t kms_colorop_srgb_eotf = {
 	.type = KMS_COLOROP_ENUMERATED_LUT1D,
 	.enumerated_lut1d_info = {
diff --git a/tests/meson.build b/tests/meson.build
index 467481c28..054296f65 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -378,6 +378,7 @@ extra_sources = {
 	'dumb_buffer': ['dumb_buffer.c' ],
 	'testdisplay': [ 'testdisplay_hotplug.c' ],
 	'kms_color':  [ 'kms_color_helper.c' ],
+	'kms_colorop':  [ 'kms_color_helper.c' ],
 	'kms_chamelium_audio': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_color':  [ 'kms_color_helper.c', join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
-- 
2.25.1

