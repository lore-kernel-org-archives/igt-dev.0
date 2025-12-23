Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D675E6FE24
	for <igt-dev@archiver.kernel.org>; Tue, 23 Dec 2025 18:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B806610E2AF;
	Tue, 23 Dec 2025 18:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="hOhZ+rtl";
	dkim-atps=neutral
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D191410E2AF
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Dec 2025 18:32:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766514756; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NEQ3D0PgRzCsT9cwMWKo8PlEzmPdRz6cZSlg6Z74YpwBqlOUVb9hzslHLFzIHZp0zJSnlsViah1LLwI/5rA3Hd2Edz5VWDD/ZHrdUxXE1vdc9dWGFzdPxsDxOa1ehSVSEJ8HKFqcsdQQe7iA++TrQz8AlwC5Mf6NrDY2SpR9dOY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766514756;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=TB6nSjXshCKlnsWx+gty8kQmd3C+Akt9RdGO3EYyfM4=; 
 b=JFQ4NKiFpV1IH2CGZPqI2aI0lyhN2ka+hfa1R7OxVD7V6L/8EbkFsNJsgJtNhgvtbQ1E6slQ2jiG4ESKDhmgseK5VIiOtZqyUVaMX2unUNnWai2WQfyS+kSlXTxY5e6LcEhNlI/0yAkltYqzp0DYZJBX7P3uCTPALIS3t4CWJPU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766514756; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=TB6nSjXshCKlnsWx+gty8kQmd3C+Akt9RdGO3EYyfM4=;
 b=hOhZ+rtld7bkjjbh/Kfeuiwl9lOwZpK7n/yOB2necrrsJLa947b4wbpsMuPaPVW5
 mQg978V3FNmiS5kQWtLZqlAfDoc6PXEK3Typo2rAa8T8Px76lOjSnKpVx4sbb/Ty30Z
 gtG8HUFKoo6WiWj+ajZMV0gk6MTih+cCt5zJ1iI4=
Received: by mx.zohomail.com with SMTPS id 1766514754253705.753703046655;
 Tue, 23 Dec 2025 10:32:34 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:31:52 -0300
Subject: [PATCH v2 06/10] tests/kms_colorop: Allow specifying CRTC
 (post-blend) colorops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-post-blend-colorops-v2-6-f40aca9795bd@collabora.com>
References: <20251223-post-blend-colorops-v2-0-f40aca9795bd@collabora.com>
In-Reply-To: <20251223-post-blend-colorops-v2-0-f40aca9795bd@collabora.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, harry.wentland@amd.com, leo.liu@amd.com, 
 daniels@collabora.com, leandro.ribeiro@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766514731; l=17600;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=tvHYzqXeQFclmR+m4RuAxc95Tf3nrfufznLzTmS1r0w=;
 b=BNLFSD8wr7fXlQj+E8HTWcbD6M3HB1f/wCdLKIczBDnawMObnOKrpLJDGk5skiMlsBD1sFofB
 TiXkPLGY/8+A8GphKNF4kpLiGlfNuN092OVbmdHEp2BxFOqJ+8LYmT1
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

Rework the test array and functions to allow specifying the colorops for
the CRTC (post-blend) pipeline as well.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 tests/kms_colorop.c | 229 +++++++++++++++++++++++++++++++---------------------
 1 file changed, 136 insertions(+), 93 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 7cfbbb988..5315ede93 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -18,7 +18,7 @@
  * SUBTEST: check_colorop_ids
  * Description: Verify that all igt_colorop_t IDs are unique across planes and CRTCs
  *
- * SUBTEST: plane-%s-%s
+ * SUBTEST: %s-%s
  * Description: Tests DRM colorop properties on a plane
  * Driver requirement: amdgpu
  * Functionality: kms_core
@@ -27,41 +27,41 @@
  *
  * arg[1]:
  *
- * @XR24-XR24:				XRGB8888 framebuffer and writeback buffer
- * @XR30-XR30:				XRGB2101010 framebuffer and writeback buffer
+ * @XR24-XR24:					XRGB8888 framebuffer and writeback buffer
+ * @XR30-XR30:					XRGB2101010 framebuffer and writeback buffer
  *
  * arg[2]:
  *
- * @bypass:				Bypass Color Pipeline
- * @srgb_eotf:				sRGB EOTF
- * @srgb_inv_eotf:			sRGB Inverse EOTF
- * @srgb_eotf-srgb_inv_eotf:		sRGB EOTF -> sRGB Inverse EOTF
- * @srgb_eotf-srgb_inv_eotf-srgb_eotf:  sRGB EOTF -> sRGB Inverse EOTF -> sRGB EOTF
- * @srgb_inv_eotf_lut:			sRGB Inverse EOTF Custom LUT
- * @srgb_inv_eotf_lut-srgb_eotf_lut:	sRGB Inverse EOTF Custom LUT -> sRGB EOTF Custom LUT
- * @bt2020_inv_oetf:			BT.2020 Inverse OETF
- * @bt2020_oetf:			BT.2020 OETF
- * @bt2020_inv_oetf-bt2020_oetf:	BT.2020 Inverse OETF > BT.2020 OETF
- * @pq_eotf:				PQ EOTF
- * @pq_inv_eotf:			PQ Inverse EOTF
- * @pq_eotf-pq_inv_eotf:		PQ EOTF -> PQ Inverse EOTF
- * @pq_125_eotf:			PQ EOTF for [0.0, 125.0] optical range
- * @pq_125_inv_eotf:			PQ Inverse EOTF for [0.0, 125.0] optical range
- * @pq_125_eotf-pq_125_inv_eotf:	PQ EOTF -> PQ Inverse EOTF with [0.0, 125.0] optical range
- * @pq_125_eotf-pq_125_inv_eotf-pq_125_eotf: PQ EOTF -> PQ Inverse EOTF -> PQ EOTF with [0.0, 125.0] optical range
- * @gamma_2_2_inv_oetf:			Gamma 2.2 Inverse OETF
- * @gamma_2_2_inv_oetf-gamma_2_2_oetf:	Gamma 2.2 Inverse OETF -> Gamma 2.2 OETF
- * @gamma_2_2_inv_oetf-gamma_2_2_oetf-gamma_2_2_inv_oetf: Gamma 2.2 Inverse OETF -> Gamma 2.2 OETF -> Gamma 2.2 Inverse OETF
- * @ctm_3x4_50_desat:			3x4 matrix doing a 50% desaturation
- * @ctm_3x4_overdrive:			3x4 matrix overdring all values by 50%
- * @ctm_3x4_oversaturate:		3x4 matrix oversaturating values
- * @ctm_3x4_bt709_enc:			BT709 encoding matrix
- * @ctm_3x4_bt709_dec:			BT709 decoding matrix
- * @ctm_3x4_bt709_enc_dec:		BT709 encoding matrix, followed by decoding matrix
- * @ctm_3x4_bt709_dec_enc:		BT709 decoding matrix, followed by encoding matrix
- * @multiply_125:			Multiplier by 125
- * @multiply_inv_125:			Multiplier by inverse of 125
- * @3dlut_17_12_rgb:			3D LUT with length 17, color depth 12, and traversal order = RGB
+ * @bypass:					Bypass Color Pipeline
+ * @plane-srgb_eotf:				sRGB EOTF
+ * @plane-srgb_inv_eotf:			sRGB Inverse EOTF
+ * @plane-srgb_eotf-srgb_inv_eotf:		sRGB EOTF -> sRGB Inverse EOTF
+ * @plane-srgb_eotf-srgb_inv_eotf-srgb_eotf:	sRGB EOTF -> sRGB Inverse EOTF -> sRGB EOTF
+ * @plane-srgb_inv_eotf_lut:			sRGB Inverse EOTF Custom LUT
+ * @plane-srgb_inv_eotf_lut-srgb_eotf_lut:	sRGB Inverse EOTF Custom LUT -> sRGB EOTF Custom LUT
+ * @plane-bt2020_inv_oetf:			BT.2020 Inverse OETF
+ * @plane-bt2020_oetf:				BT.2020 OETF
+ * @plane-bt2020_inv_oetf-bt2020_oetf:		BT.2020 Inverse OETF > BT.2020 OETF
+ * @plane-pq_eotf:				PQ EOTF
+ * @plane-pq_inv_eotf:				PQ Inverse EOTF
+ * @plane-pq_eotf-pq_inv_eotf:			PQ EOTF -> PQ Inverse EOTF
+ * @plane-pq_125_eotf:				PQ EOTF for [0.0, 125.0] optical range
+ * @plane-pq_125_inv_eotf:			PQ Inverse EOTF for [0.0, 125.0] optical range
+ * @plane-pq_125_eotf-pq_125_inv_eotf:		PQ EOTF -> PQ Inverse EOTF with [0.0, 125.0] optical range
+ * @plane-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf: PQ EOTF -> PQ Inverse EOTF -> PQ EOTF with [0.0, 125.0] optical range
+ * @plane-gamma_2_2_inv_oetf:			Gamma 2.2 Inverse OETF
+ * @plane-gamma_2_2_inv_oetf-gamma_2_2_oetf:	Gamma 2.2 Inverse OETF -> Gamma 2.2 OETF
+ * @plane-gamma_2_2_inv_oetf-gamma_2_2_oetf-gamma_2_2_inv_oetf: Gamma 2.2 Inverse OETF -> Gamma 2.2 OETF -> Gamma 2.2 Inverse OETF
+ * @plane-ctm_3x4_50_desat:			3x4 matrix doing a 50% desaturation
+ * @plane-ctm_3x4_overdrive:			3x4 matrix overdring all values by 50%
+ * @plane-ctm_3x4_oversaturate:			3x4 matrix oversaturating values
+ * @plane-ctm_3x4_bt709_enc:			BT709 encoding matrix
+ * @plane-ctm_3x4_bt709_dec:			BT709 decoding matrix
+ * @plane-ctm_3x4_bt709_enc_dec:		BT709 encoding matrix, followed by decoding matrix
+ * @plane-ctm_3x4_bt709_dec_enc:		BT709 decoding matrix, followed by encoding matrix
+ * @plane-multiply_125:				Multiplier by 125
+ * @plane-multiply_inv_125:			Multiplier by inverse of 125
+ * @plane-3dlut_17_12_rgb:			3D LUT with length 17, color depth 12, and traversal order = RGB
  *
  */
 
@@ -344,7 +344,6 @@ static void set_colorop(igt_display_t *display,
 }
 
 static void set_color_pipeline(igt_display_t *display,
-			       igt_plane_t *plane,
 			       kms_colorop_t *colorops[],
 			       igt_colorop_t *color_pipeline)
 {
@@ -352,8 +351,6 @@ static void set_color_pipeline(igt_display_t *display,
 	int prop_val = 0;
 	int i;
 
-	igt_plane_set_color_pipeline(plane, color_pipeline);
-
 	for (i = 0; colorops[i]; i++)
 		set_colorop(display, colorops[i]);
 
@@ -372,11 +369,34 @@ static void set_color_pipeline(igt_display_t *display,
 	}
 }
 
-static void set_color_pipeline_bypass(igt_plane_t *plane)
+static void set_plane_color_pipeline(igt_display_t *display,
+				     igt_plane_t *plane,
+				     kms_colorop_t *colorops[],
+				     igt_colorop_t *color_pipeline)
+{
+	igt_plane_set_color_pipeline(plane, color_pipeline);
+	set_color_pipeline(display, colorops, color_pipeline);
+}
+
+static void set_pipe_color_pipeline(igt_display_t *display,
+				    igt_crtc_t *pipe,
+				    kms_colorop_t *colorops[],
+				    igt_colorop_t *color_pipeline)
+{
+	igt_pipe_set_color_pipeline(pipe, color_pipeline);
+	set_color_pipeline(display, colorops, color_pipeline);
+}
+
+static void set_plane_color_pipeline_bypass(igt_plane_t *plane)
 {
 	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
 }
 
+static void set_pipe_color_pipeline_bypass(igt_crtc_t *pipe)
+{
+	igt_pipe_obj_set_prop_enum(pipe, IGT_CRTC_COLOR_PIPELINE, "Bypass");
+}
+
 static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
 {
 	/* Each driver is expected to have its own bracket, i.e., by trial and error */
@@ -397,25 +417,30 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
 
 #define MAX_COLOROPS 5
 
-static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_fb)
+static void apply_transforms(kms_colorop_t *plane_colorops[],
+			     kms_colorop_t *crtc_colorops[],
+			     igt_fb_t *sw_transform_fb)
 {
-	int i;
-	igt_pixel_transform transforms[MAX_COLOROPS];
+	int i, j;
+	igt_pixel_transform transforms[MAX_COLOROPS * 2];
 
-	for (i = 0; colorops[i]; i++)
-		transforms[i] = colorops[i]->transform;
+	for (i = 0, j = 0; plane_colorops[i]; i++, j++)
+		transforms[j] = plane_colorops[i]->transform;
+	for (i = 0; crtc_colorops[i]; i++, j++)
+		transforms[j] = crtc_colorops[i]->transform;
 
-	igt_color_transform_pixels(sw_transform_fb, transforms, i);
+	igt_color_transform_pixels(sw_transform_fb, transforms, j);
 }
 
-static void colorop_plane_test(igt_display_t *display,
-			       igt_output_t *output,
-			       igt_plane_t *plane,
-			       igt_fb_t *input_fb,
-			       igt_fb_t *output_fb,
-			       __u32 fourcc_in,
-			       __u32 fourcc_out,
-			       kms_colorop_t *colorops[])
+static void colorop_test(igt_display_t *display,
+			 igt_output_t *output,
+			 igt_plane_t *plane,
+			 igt_fb_t *input_fb,
+			 igt_fb_t *output_fb,
+			 __u32 fourcc_in,
+			 __u32 fourcc_out,
+			 kms_colorop_t *plane_colorops[],
+			 kms_colorop_t *crtc_colorops[])
 {
 	igt_colorop_t *color_pipeline = NULL;
 	igt_fb_t sw_transform_fb;
@@ -426,7 +451,8 @@ static void colorop_plane_test(igt_display_t *display,
 
 	/* reset color pipeline*/
 
-	set_color_pipeline_bypass(plane);
+	set_plane_color_pipeline_bypass(plane);
+	set_pipe_color_pipeline_bypass(plane->pipe);
 
 	/* Commit */
 	igt_plane_set_fb(plane, input_fb);
@@ -448,24 +474,37 @@ static void colorop_plane_test(igt_display_t *display,
 
 	igt_assert(igt_cmp_fb_pixels(input_fb, &sw_transform_fb, 0, 0));
 
-	apply_transforms(colorops, &sw_transform_fb);
+	apply_transforms(plane_colorops, crtc_colorops, &sw_transform_fb);
 
 	if (data.dump_check)
 		igt_dump_fb(display, &sw_transform_fb, ".", "sw_transform");
 
 	/* discover and set COLOR PIPELINE */
 
-	if (!colorops[0]) {
+	if (!plane_colorops[0]) {
+		/* bypass test */
+		set_plane_color_pipeline_bypass(plane);
+	} else {
+		/* get COLOR_PIPELINE enum */
+		color_pipeline = get_color_pipeline(display, &plane->color_pipelines, plane_colorops);
+
+		/* skip test if we can't find applicable pipeline */
+		igt_skip_on(!color_pipeline);
+
+		set_plane_color_pipeline(display, plane, plane_colorops, color_pipeline);
+	}
+
+	if (!crtc_colorops[0]) {
 		/* bypass test */
-		set_color_pipeline_bypass(plane);
+		set_pipe_color_pipeline_bypass(plane->pipe);
 	} else {
 		/* get COLOR_PIPELINE enum */
-		color_pipeline = get_color_pipeline(display, &plane->color_pipelines, colorops);
+		color_pipeline = get_color_pipeline(display, &plane->pipe->color_pipelines, crtc_colorops);
 
 		/* skip test if we can't find applicable pipeline */
 		igt_skip_on(!color_pipeline);
 
-		set_color_pipeline(display, plane, colorops, color_pipeline);
+		set_pipe_color_pipeline(display, plane->pipe, crtc_colorops, color_pipeline);
 	}
 
 	igt_output_set_writeback_fb(output, output_fb);
@@ -483,7 +522,8 @@ static void colorop_plane_test(igt_display_t *display,
 	igt_assert(compare_with_bracket(&sw_transform_fb, output_fb));
 
 	/* reset color pipeline*/
-	set_color_pipeline_bypass(plane);
+	set_plane_color_pipeline_bypass(plane);
+	set_pipe_color_pipeline_bypass(plane->pipe);
 
 	/* Commit */
 	igt_plane_set_fb(plane, input_fb);
@@ -586,39 +626,40 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 {
 
 	struct {
-		kms_colorop_t *colorops[MAX_COLOROPS];
+		kms_colorop_t *plane_colorops[MAX_COLOROPS];
+		kms_colorop_t *crtc_colorops[MAX_COLOROPS];
 		const char *name;
 	} tests[] = {
-		{ { NULL }, "bypass" },
-		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
-		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
-		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" },
-		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, &kms_colorop_srgb_eotf_2, NULL }, "srgb_eotf-srgb_inv_eotf-srgb_eotf" },
-		{ { &kms_colorop_srgb_inv_eotf_lut, NULL }, "srgb_inv_eotf_lut" },
-		{ { &kms_colorop_srgb_inv_eotf_lut, &kms_colorop_srgb_eotf_lut, NULL }, "srgb_inv_eotf_lut-srgb_eotf_lut" },
-		{ { &kms_colorop_bt2020_inv_oetf, NULL }, "bt2020_inv_oetf" },
-		{ { &kms_colorop_bt2020_oetf, NULL }, "bt2020_oetf" },
-		{ { &kms_colorop_bt2020_inv_oetf, &kms_colorop_bt2020_oetf, NULL }, "bt2020_inv_oetf-bt2020_oetf" },
-		{ { &kms_colorop_pq_eotf, NULL }, "pq_eotf" },
-		{ { &kms_colorop_pq_inv_eotf, NULL }, "pq_inv_eotf" },
-		{ { &kms_colorop_pq_eotf, &kms_colorop_pq_inv_eotf, NULL }, "pq_eotf-pq_inv_eotf" },
-		{ { &kms_colorop_pq_125_eotf, NULL }, "pq_125_eotf" },
-		{ { &kms_colorop_pq_125_inv_eotf, NULL }, "pq_125_inv_eotf" },
-		{ { &kms_colorop_pq_125_eotf, &kms_colorop_pq_125_inv_eotf, NULL }, "pq_125_eotf-pq_125_inv_eotf" },
-		{ { &kms_colorop_pq_125_eotf, &kms_colorop_pq_125_inv_eotf, &kms_colorop_pq_125_eotf_2, NULL }, "pq_125_eotf-pq_125_inv_eotf-pq_125_eotf" },
-		{ { &kms_colorop_gamma_22_inv_oetf, NULL }, "gamma_2_2_inv_oetf" },
-		{ { &kms_colorop_gamma_22_inv_oetf, &kms_colorop_gamma_22_oetf, NULL }, "gamma_2_2_inv_oetf-gamma_2_2_oetf" },
-		{ { &kms_colorop_gamma_22_inv_oetf, &kms_colorop_gamma_22_oetf, &kms_colorop_gamma_22_inv_oetf, NULL }, "gamma_2_2_inv_oetf-gamma_2_2_oetf-gamma_2_2_inv_oetf" },
-		{ { &kms_colorop_ctm_3x4_50_desat, NULL }, "ctm_3x4_50_desat" },
-		{ { &kms_colorop_ctm_3x4_overdrive, NULL }, "ctm_3x4_overdrive" },
-		{ { &kms_colorop_ctm_3x4_oversaturate, NULL }, "ctm_3x4_oversaturate" },
-		{ { &kms_colorop_ctm_3x4_bt709_enc, NULL }, "ctm_3x4_bt709_enc" },
-		{ { &kms_colorop_ctm_3x4_bt709_dec, NULL }, "ctm_3x4_bt709_dec" },
-		{ { &kms_colorop_ctm_3x4_bt709_enc, &kms_colorop_ctm_3x4_bt709_dec, NULL }, "ctm_3x4_bt709_enc_dec" },
-		{ { &kms_colorop_ctm_3x4_bt709_dec, &kms_colorop_ctm_3x4_bt709_enc, NULL }, "ctm_3x4_bt709_dec_enc" },
-		{ { &kms_colorop_multiply_125, NULL }, "multiply_125" },
-		{ { &kms_colorop_multiply_inv_125, NULL }, "multiply_inv_125" },
-		{ { &kms_colorop_3dlut_17_12_rgb, NULL }, "3dlut_17_12_rgb" },
+		{ { NULL }, { NULL }, "bypass" },
+		{ { &kms_colorop_srgb_eotf, NULL }, { NULL }, "plane-srgb_eotf" },
+		{ { &kms_colorop_srgb_inv_eotf, NULL }, { NULL }, "plane-srgb_inv_eotf" },
+		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, { NULL }, "plane-srgb_eotf-srgb_inv_eotf" },
+		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, &kms_colorop_srgb_eotf_2, NULL }, { NULL }, "plane-srgb_eotf-srgb_inv_eotf-srgb_eotf" },
+		{ { &kms_colorop_srgb_inv_eotf_lut, NULL }, { NULL }, "plane-srgb_inv_eotf_lut" },
+		{ { &kms_colorop_srgb_inv_eotf_lut, &kms_colorop_srgb_eotf_lut, NULL }, { NULL }, "plane-srgb_inv_eotf_lut-srgb_eotf_lut" },
+		{ { &kms_colorop_bt2020_inv_oetf, NULL }, { NULL }, "plane-bt2020_inv_oetf" },
+		{ { &kms_colorop_bt2020_oetf, NULL }, { NULL }, "plane-bt2020_oetf" },
+		{ { &kms_colorop_bt2020_inv_oetf, &kms_colorop_bt2020_oetf, NULL }, { NULL }, "plane-bt2020_inv_oetf-bt2020_oetf" },
+		{ { &kms_colorop_pq_eotf, NULL }, { NULL }, "plane-pq_eotf" },
+		{ { &kms_colorop_pq_inv_eotf, NULL }, { NULL }, "plane-pq_inv_eotf" },
+		{ { &kms_colorop_pq_eotf, &kms_colorop_pq_inv_eotf, NULL }, { NULL }, "plane-pq_eotf-pq_inv_eotf" },
+		{ { &kms_colorop_pq_125_eotf, NULL }, { NULL }, "plane-pq_125_eotf" },
+		{ { &kms_colorop_pq_125_inv_eotf, NULL }, { NULL }, "plane-pq_125_inv_eotf" },
+		{ { &kms_colorop_pq_125_eotf, &kms_colorop_pq_125_inv_eotf, NULL }, { NULL }, "plane-pq_125_eotf-pq_125_inv_eotf" },
+		{ { &kms_colorop_pq_125_eotf, &kms_colorop_pq_125_inv_eotf, &kms_colorop_pq_125_eotf_2, NULL }, { NULL }, "plane-pq_125_eotf-pq_125_inv_eotf-pq_125_eotf" },
+		{ { &kms_colorop_gamma_22_inv_oetf, NULL }, { NULL }, "plane-gamma_2_2_inv_oetf" },
+		{ { &kms_colorop_gamma_22_inv_oetf, &kms_colorop_gamma_22_oetf, NULL }, { NULL }, "plane-gamma_2_2_inv_oetf-gamma_2_2_oetf" },
+		{ { &kms_colorop_gamma_22_inv_oetf, &kms_colorop_gamma_22_oetf, &kms_colorop_gamma_22_inv_oetf, NULL }, { NULL }, "plane-gamma_2_2_inv_oetf-gamma_2_2_oetf-gamma_2_2_inv_oetf" },
+		{ { &kms_colorop_ctm_3x4_50_desat, NULL }, { NULL }, "plane-ctm_3x4_50_desat" },
+		{ { &kms_colorop_ctm_3x4_overdrive, NULL }, { NULL }, "plane-ctm_3x4_overdrive" },
+		{ { &kms_colorop_ctm_3x4_oversaturate, NULL }, { NULL }, "plane-ctm_3x4_oversaturate" },
+		{ { &kms_colorop_ctm_3x4_bt709_enc, NULL }, { NULL }, "plane-ctm_3x4_bt709_enc" },
+		{ { &kms_colorop_ctm_3x4_bt709_dec, NULL }, { NULL }, "plane-ctm_3x4_bt709_dec" },
+		{ { &kms_colorop_ctm_3x4_bt709_enc, &kms_colorop_ctm_3x4_bt709_dec, NULL }, { NULL }, "plane-ctm_3x4_bt709_enc_dec" },
+		{ { &kms_colorop_ctm_3x4_bt709_dec, &kms_colorop_ctm_3x4_bt709_enc, NULL }, { NULL }, "plane-ctm_3x4_bt709_dec_enc" },
+		{ { &kms_colorop_multiply_125, NULL }, { NULL }, "plane-multiply_125" },
+		{ { &kms_colorop_multiply_inv_125, NULL }, { NULL }, "plane-multiply_inv_125" },
+		{ { &kms_colorop_3dlut_17_12_rgb, NULL }, { NULL }, "plane-3dlut_17_12_rgb" },
 	};
 
 	struct {
@@ -687,6 +728,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 				plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 				igt_assert(plane);
 				igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
+				igt_require(igt_pipe_obj_has_prop(plane->pipe, IGT_CRTC_COLOR_PIPELINE));
 
 				fb_id = igt_create_color_pattern_fb(display.drm_fd,
 								mode.hdisplay, mode.vdisplay,
@@ -707,16 +749,17 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 			}
 
 			for (i = 0; i < ARRAY_SIZE(tests); i++) {
-				igt_describe("Check color ops on a plane");
-				igt_subtest_f("plane-%s-%s", formats[j].name, tests[i].name)
-					colorop_plane_test(&display,
+				igt_describe("Check pre-blend colorops on a plane and post-blend colorops on a CRTC");
+				igt_subtest_f("%s-%s", formats[j].name, tests[i].name)
+					colorop_test(&display,
 							output,
 							plane,
 							&input_fb,
 							&output_fb,
 							formats[j].fourcc_in,
 							formats[j].fourcc_out,
-							tests[i].colorops);
+							tests[i].plane_colorops,
+							tests[i].crtc_colorops);
 			}
 
 			igt_fixture() {

-- 
2.51.0

