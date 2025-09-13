Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EF4CAC594
	for <igt-dev@archiver.kernel.org>; Sat, 13 Sep 2025 00:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B32510ECF1;
	Sat, 13 Sep 2025 00:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MiMg9Cho";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0457310ECF1
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Sep 2025 00:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757721843;
 bh=sbkBQQxaFPI21OzpX8jwctNF5Xtb771KvnsgHVuVMbk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=MiMg9ChowSeYJjhE3x92a2G/P47Mg0SXjay2ZBCntN8kRiaZxSRm5MwbUjCGVJhwm
 u2kGDCI9ksAI3PVMQ/hLet283QU5EY/74kZGGksu/t8pIbAx1nx0o2Gbf8ZoUvBiYL
 lMcEX0BJZJu6vfhRh/+f+AAJqdYdBwne5P4sUtuu6+xJ7PezSl2r+kht+yCcijRLS4
 rkIkTzsy1ocTxKm0fKZSI7PoF8Bl3CD1j9T57cYMGf6nsFqPsfN2PsrkyVF++zBLK8
 xAHf/8Af1Ooac+Wdys6WYGZTd8FOdkleY7Xwa1CK9LSteRtfwvuBRdXY0GPUwXDiBi
 2xgV5A6s9Nc1w==
Received: from [127.0.1.1] (unknown
 [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C92DC17E12BB;
 Sat, 13 Sep 2025 02:04:02 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 12 Sep 2025 20:02:58 -0400
Subject: [PATCH 6/9] tests/kms_colorop: Allow specifying post-blend
 colorops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250912-post-blend-colorops-v1-6-83fc62420cba@collabora.com>
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

Rework the test array and functions to allow specifying the colorops for
the post-blend pipeline as well.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 tests/kms_colorop.c | 146 +++++++++++++++++++++++++++++++++-------------------
 1 file changed, 94 insertions(+), 52 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 025a25c638bfa0d90e1ccc81be36758b69749be9..a19b1a19314d08491eab9977227a98605a26f915 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -390,7 +390,6 @@ static void set_colorop(igt_display_t *display,
 }
 
 static void set_color_pipeline(igt_display_t *display,
-			       igt_plane_t *plane,
 			       kms_colorop_t *colorops[],
 			       igt_colorop_t *color_pipeline)
 {
@@ -398,8 +397,6 @@ static void set_color_pipeline(igt_display_t *display,
 	int prop_val = 0;
 	int i;
 
-	igt_plane_set_color_pipeline(plane, color_pipeline);
-
 	for (i = 0; colorops[i]; i++)
 		set_colorop(display, colorops[i]);
 
@@ -418,11 +415,34 @@ static void set_color_pipeline(igt_display_t *display,
 	}
 }
 
-static void set_color_pipeline_bypass(igt_plane_t *plane)
+static void set_plane_color_pipeline(igt_display_t *display,
+			       igt_plane_t *plane,
+			       kms_colorop_t *colorops[],
+			       igt_colorop_t *color_pipeline)
+{
+	igt_plane_set_color_pipeline(plane, color_pipeline);
+	set_color_pipeline(display, colorops, color_pipeline);
+}
+
+static void set_pipe_color_pipeline(igt_display_t *display,
+			       igt_pipe_t *pipe,
+			       kms_colorop_t *colorops[],
+			       igt_colorop_t *color_pipeline)
+{
+	igt_pipe_set_color_pipeline(pipe, color_pipeline);
+	set_color_pipeline(display, colorops, color_pipeline);
+}
+
+static void set_plane_color_pipeline_bypass(igt_plane_t *plane)
 {
 	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
 }
 
+static void set_pipe_color_pipeline_bypass(igt_pipe_t *pipe)
+{
+	igt_pipe_obj_set_prop_enum(pipe, IGT_CRTC_COLOR_PIPELINE, "Bypass");
+}
+
 static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
 {
 	if (is_vkms_device(in->fd))
@@ -444,25 +464,28 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
 
 #define MAX_COLOROPS 5
 
-static void apply_transforms(kms_colorop_t *colorops[], igt_fb_t *sw_transform_fb)
+static void apply_transforms(kms_colorop_t *pre_blend_colorops[], kms_colorop_t *post_blend_colorops[], igt_fb_t *sw_transform_fb)
 {
-	int i;
-	igt_pixel_transform transforms[MAX_COLOROPS];
+	int i, j;
+	igt_pixel_transform transforms[MAX_COLOROPS * 2];
 
-	for (i = 0; colorops[i]; i++)
-		transforms[i] = colorops[i]->transform;
+	for (i = 0, j = 0; pre_blend_colorops[i]; i++, j++)
+		transforms[j] = pre_blend_colorops[i]->transform;
+	for (i = 0; post_blend_colorops[i]; i++, j++)
+		transforms[j] = post_blend_colorops[i]->transform;
 
-	igt_color_transform_pixels(sw_transform_fb, transforms, i);
+	igt_color_transform_pixels(sw_transform_fb, transforms, j);
 }
 
-static void colorop_plane_test(igt_display_t *display,
+static void colorop_test(igt_display_t *display,
 			       igt_output_t *output,
 			       igt_plane_t *plane,
 			       igt_fb_t *input_fb,
 			       igt_fb_t *output_fb,
 			       __u32 fourcc_in,
 			       __u32 fourcc_out,
-			       kms_colorop_t *colorops[])
+			       kms_colorop_t *pre_blend_colorops[],
+			       kms_colorop_t *post_blend_colorops[])
 {
 	igt_colorop_t *color_pipeline = NULL;
 	igt_fb_t sw_transform_fb;
@@ -473,7 +496,8 @@ static void colorop_plane_test(igt_display_t *display,
 
 	/* reset color pipeline*/
 
-	set_color_pipeline_bypass(plane);
+	set_plane_color_pipeline_bypass(plane);
+	set_pipe_color_pipeline_bypass(plane->pipe);
 
 	/* Commit */
 	igt_plane_set_fb(plane, input_fb);
@@ -495,23 +519,36 @@ static void colorop_plane_test(igt_display_t *display,
 
 	igt_assert(igt_cmp_fb_pixels(input_fb, &sw_transform_fb, 0, 0));
 
-	apply_transforms(colorops, &sw_transform_fb);
+	apply_transforms(pre_blend_colorops, post_blend_colorops, &sw_transform_fb);
 #if DUMP_FBS
 	igt_dump_fb(display, &sw_transform_fb, ".", "sw_transform");
 #endif
 	/* discover and set COLOR PIPELINE */
 
-	if (!colorops[0]) {
+	if (!pre_blend_colorops[0]) {
 		/* bypass test */
-		set_color_pipeline_bypass(plane);
+		set_plane_color_pipeline_bypass(plane);
 	} else {
 		/* get COLOR_PIPELINE enum */
-		color_pipeline = get_color_pipeline(display, &plane->color_pipeline, colorops);
+		color_pipeline = get_color_pipeline(display, &plane->color_pipelines, pre_blend_colorops);
 
 		/* skip test if we can't find applicable pipeline */
 		igt_skip_on(!color_pipeline);
 
-		set_color_pipeline(display, plane, colorops, color_pipeline);
+		set_plane_color_pipeline(display, plane, pre_blend_colorops, color_pipeline);
+	}
+
+	if (!post_blend_colorops[0]) {
+		/* bypass test */
+		set_pipe_color_pipeline_bypass(plane->pipe);
+	} else {
+		/* get COLOR_PIPELINE enum */
+		color_pipeline = get_color_pipeline(display, &plane->pipe->color_pipelines, post_blend_colorops);
+
+		/* skip test if we can't find applicable pipeline */
+		igt_skip_on(!color_pipeline);
+
+		set_pipe_color_pipeline(display, plane->pipe, post_blend_colorops, color_pipeline);
 	}
 
 	igt_output_set_writeback_fb(output, output_fb);
@@ -529,7 +566,8 @@ static void colorop_plane_test(igt_display_t *display,
 	igt_assert(compare_with_bracket(&sw_transform_fb, output_fb));
 
 	/* reset color pipeline*/
-	set_color_pipeline_bypass(plane);
+	set_plane_color_pipeline_bypass(plane);
+	set_pipe_color_pipeline_bypass(plane->pipe);
 
 	/* Commit */
 	igt_plane_set_fb(plane, input_fb);
@@ -613,36 +651,37 @@ igt_main
 {
 
 	struct {
-		kms_colorop_t *colorops[MAX_COLOROPS];
+		kms_colorop_t *pre_blend_colorops[MAX_COLOROPS];
+		kms_colorop_t *post_blend_colorops[MAX_COLOROPS];
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
@@ -703,6 +742,7 @@ igt_main
 				plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 				igt_assert(plane);
 				igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
+				igt_require(igt_pipe_obj_has_prop(plane->pipe, IGT_CRTC_COLOR_PIPELINE));
 
 				fb_id = igt_create_color_pattern_fb(display.drm_fd,
 								mode.hdisplay, mode.vdisplay,
@@ -723,16 +763,17 @@ igt_main
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
+							tests[i].pre_blend_colorops,
+							tests[i].post_blend_colorops);
 			}
 
 			igt_fixture {
@@ -743,7 +784,8 @@ igt_main
 			}
 		}
 	}
-	igt_describe("Tests getting and setting COLOR_PIPELINE property on plane");
+
+	igt_describe("Tests getting and setting COLOR_PIPELINE property on CRTC and plane");
 	igt_fixture {
 		igt_display_fini(&display);
 		drm_close_driver(display.drm_fd);

-- 
2.50.1

