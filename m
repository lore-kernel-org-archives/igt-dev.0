Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C1AC48BC4
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 06:45:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3462D10E585;
	Wed, 14 Feb 2024 06:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jfTCjtMs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1BE10E3CB
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 06:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707893157; x=1739429157;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=be2YLQy9jj3EysRW4NRmM3aJWevF6Ddu3nqXZzYoGnw=;
 b=jfTCjtMstmCNlj+1SDXsKoAKSiOjxqsYbEQB3ZqWbzxbI23modWlCdb/
 22zTfFjELQUifFXwbhfiQ6UNjzhNmu4QEiAut/8uTCbRtddSMxyALXRKP
 7dfjABRcCIMMG0P7VClD4hvRFGJWY4HSqX3oaVnaF4S093T5nM3RwZEdt
 8H+jSs8P5cgFww3hfKzPFRx+2XE+3vHktmrN8Ej6kevu1zCps0CXlqpDG
 06DxynLOs8Fp64qWfgOvTD8VCoeG5tcTcNJyjmw45epJnD4GERAvBWf8P
 WgT22qI+sj5XdGcOeciUZf2QB/iuilV7dFNBepqlch4peouYwvL/C5PAj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12645473"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12645473"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:45:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3427618"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:45:56 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC v4 11/22] lib/igt_color: Add support for 3x4 matrices
Date: Wed, 14 Feb 2024 12:09:42 +0530
Message-ID: <20240214063953.1285495-12-bhanuprakash.modem@intel.com>
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

From: Harry Wentland <harry.wentland@amd.com>

Also add a few matrices for testing.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++++-
 lib/igt_color.h | 71 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 158 insertions(+), 1 deletion(-)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index b8e6a86b0..d1ad3e3b8 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -9,6 +9,7 @@
 #include <errno.h>
 #include <math.h>
 
+#include "drmtest.h"
 #include "igt_color.h"
 #include "igt_core.h"
 #include "igt_x86.h"
@@ -70,6 +71,62 @@ void igt_color_srgb_eotf(igt_pixel_t *pixel)
 	pixel->b = igt_color_tf_eval(&srgb_tf, pixel->b);
 }
 
+static void igt_color_apply_3x4_ctm(igt_pixel_t *pixel, const igt_matrix_3x4_t *matrix)
+{
+	igt_pixel_t result;
+
+	memcpy(&result, pixel, sizeof(result));
+
+	result.r = matrix->m[0] * pixel->r +
+		   matrix->m[1] * pixel->g +
+		   matrix->m[2] * pixel->b +
+		   matrix->m[3];
+
+	result.g = matrix->m[4] * pixel->r +
+		   matrix->m[5] * pixel->g +
+		   matrix->m[6] * pixel->b +
+		   matrix->m[7];
+
+	result.b = matrix->m[8] * pixel->r +
+		   matrix->m[9] * pixel->g +
+		   matrix->m[10] * pixel->b +
+		   matrix->m[11];
+
+	memcpy(pixel, &result, sizeof(result));
+
+}
+
+void igt_color_ctm_3x4_50_desat(igt_pixel_t *pixel)
+{
+	/* apply a 50% desat matrix */
+	igt_color_apply_3x4_ctm(pixel, &igt_matrix_3x4_50_desat);
+}
+
+void igt_color_ctm_3x4_overdrive(igt_pixel_t *pixel)
+{
+	/* apply a 50% desat matrix */
+	igt_color_apply_3x4_ctm(pixel, &igt_matrix_3x4_overdrive);
+}
+
+void igt_color_ctm_3x4_oversaturate(igt_pixel_t *pixel)
+{
+	/* apply a 50% desat matrix */
+	igt_color_apply_3x4_ctm(pixel, &igt_matrix_3x4_oversaturate);
+}
+
+void igt_color_ctm_3x4_bt709_enc(igt_pixel_t *pixel)
+{
+	/* apply a 50% desat matrix */
+	igt_color_apply_3x4_ctm(pixel, &igt_matrix_3x4_bt709_enc);
+}
+
+void igt_color_ctm_3x4_bt709_dec(igt_pixel_t *pixel)
+{
+	/* apply a 50% desat matrix */
+	igt_color_apply_3x4_ctm(pixel, &igt_matrix_3x4_bt709_dec);
+}
+
+
 int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], int num_transforms)
 {
 	uint32_t *line = NULL;
@@ -136,6 +193,11 @@ int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], i
 			for (i = 0; i < num_transforms; i++)
 				transforms[i](&pixel);
 
+			/* clip */
+			pixel.r = fmax(fmin(pixel.r, 1.0), 0.0);
+			pixel.g = fmax(fmin(pixel.g, 1.0), 0.0);
+			pixel.b = fmax(fmin(pixel.b, 1.0), 0.0);
+
 			/* de-normalize back to 8-bit */
 			pixel.r *= (0xff);
 			pixel.g *= (0xff);
@@ -255,4 +317,28 @@ void igt_dump_fb(igt_display_t *display, igt_fb_t *fb,
 	status = cairo_surface_write_to_png(fb_surface_out, filepath_out);
 	igt_assert_eq(status, CAIRO_STATUS_SUCCESS);
 	cairo_surface_destroy(fb_surface_out);
-}
\ No newline at end of file
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
diff --git a/lib/igt_color.h b/lib/igt_color.h
index ce72a025a..55f0d2dc4 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -27,6 +27,62 @@ typedef struct igt_pixel {
 	float b;
 } igt_pixel_t;
 
+typedef struct igt_matrix_3x4 {
+	/*
+	 * out   matrix          in
+	 * |R|   |0  1  2  3 |   | R |
+	 * |G| = |4  5  6  7 | x | G |
+	 * |B|   |8  9  10 12|   | B |
+	 *                       |1.0|
+	 */
+	float m[12];
+} igt_matrix_3x4_t;
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
+
+
 bool igt_cmp_fb_component(uint16_t comp1, uint16_t comp2, uint8_t up, uint8_t down);
 bool igt_cmp_fb_pixels(igt_fb_t *fb1, igt_fb_t *fb2, uint8_t up, uint8_t down);
 
@@ -37,7 +93,22 @@ typedef void (*igt_pixel_transform)(igt_pixel_t *pixel);
 
 int igt_color_transform_pixels(igt_fb_t *fb, igt_pixel_transform transforms[], int num_transforms);
 
+/* colorop helpers */
+
+void igt_colorop_set_ctm_3x4(igt_display_t *display,
+			     igt_colorop_t *colorop,
+			     const igt_matrix_3x4_t *matrix);
+
+/* transformations */
+
 void igt_color_srgb_inv_eotf(igt_pixel_t *pixel);
 void igt_color_srgb_eotf(igt_pixel_t *pixel);
 
+void igt_color_ctm_3x4_50_desat(igt_pixel_t *pixel);
+void igt_color_ctm_3x4_overdrive(igt_pixel_t *pixel);
+void igt_color_ctm_3x4_oversaturate(igt_pixel_t *pixel);
+void igt_color_ctm_3x4_bt709_dec(igt_pixel_t *pixel);
+void igt_color_ctm_3x4_bt709_enc(igt_pixel_t *pixel);
+
+
 #endif
\ No newline at end of file
-- 
2.43.0

