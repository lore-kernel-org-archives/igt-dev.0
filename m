Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D8FCFA47C
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 07:54:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBDE10E1ED;
	Fri, 21 Nov 2025 07:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="UDMtFwEv";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EB610E1ED
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 07:54:12 +0000 (UTC)
X-UUID: 426936bac6af11f08ac0a938fc7cd336-20251121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=WBYYSZ3lHZWSP8imC3LFcjEsPFX4/qvSNhD9/GI6TDI=; 
 b=UDMtFwEvve7+8E+xduWIeOjq+KmD0I0yjnb7NLt/DivtCBGQe8faVBjnTjRTNv4v/HLdREKBdIDRCeDpnUyZNC3n2b/UgxuSAF4l+TWEHltkCYbyjxQZfQkjod71XZjEuZqdom5JfhwUnMebz5Iu5tHGQntd4RkHM1qaux+HpSw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:4c88b6e6-c2dc-4276-a5da-5e600d8c32cd, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:28da2558-17e4-43d2-bf73-55337eed999a,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
 0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 426936bac6af11f08ac0a938fc7cd336-20251121
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 163099561; Fri, 21 Nov 2025 15:54:08 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 21 Nov 2025 15:54:07 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 21 Nov 2025 15:54:06 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Uma <uma.shankar@intel.com>,
 Chaitanya Kumar <chaitanya.kumar.borah@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Fei Shao <fshao@chromium.org>
CC: Jani <jani.nikula@intel.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>,
 Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH i-g-t v2] tests/kms_color: Always use atomic_commit for
 setting color properties
Date: Fri, 21 Nov 2025 15:53:54 +0800
Message-ID: <20251121075406.2006325-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
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

When a driver makes use of gamma_lut, degamma_lut, or ctm properties
from crtc state, these properties are applied only via atomic commit.
This change ensures all relevant properties are properly synchronized
to crtc state during testing.

All upstream drivers that support color management properties also
support atomic commits, so legacy commit handling in kms_color is no
longer needed.

Update the test logic to always use igt_display_commit_atomic with
DRM_MODE_ATOMIC_ALLOW_MODESET for all color management operations.
This simplifies code and guarantees correct validation of gamma,
degamma, and ctm properties.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 tests/kms_color.c | 47 ++++++++++++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index c424083b7fd4..0d2baf8f8aad 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -125,12 +125,12 @@ static bool test_pipe_degamma(data_t *data,
 	disable_ctm(primary->pipe);
 	disable_gamma(primary->pipe);
 	set_degamma(data, primary->pipe, degamma_linear);
-	igt_display_commit(&data->display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
 	/* Draw solid colors with linear degamma transformation. */
 	paint_rectangles(data, mode, red_green_blue, &fb);
 	igt_plane_set_fb(primary, &fb);
-	igt_display_commit(&data->display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 	igt_wait_for_vblank(data->drm_fd,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
@@ -142,7 +142,7 @@ static bool test_pipe_degamma(data_t *data,
 	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
 	igt_plane_set_fb(primary, &fb);
 	set_degamma(data, primary->pipe, degamma_full);
-	igt_display_commit(&data->display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 	igt_wait_for_vblank(data->drm_fd,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
@@ -156,7 +156,7 @@ static bool test_pipe_degamma(data_t *data,
 	disable_degamma(primary->pipe);
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
-	igt_display_commit(&data->display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 	igt_remove_fb(data->drm_fd, &fb);
 	igt_remove_fb(data->drm_fd, &fb_modeset);
 
@@ -215,12 +215,12 @@ static bool test_pipe_gamma(data_t *data,
 	disable_ctm(primary->pipe);
 	disable_degamma(primary->pipe);
 	set_gamma(data, primary->pipe, gamma_full);
-	igt_display_commit(&data->display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
 	/* Draw solid colors with no gamma transformation. */
 	paint_rectangles(data, mode, red_green_blue, &fb);
 	igt_plane_set_fb(primary, &fb);
-	igt_display_commit(&data->display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 	igt_wait_for_vblank(data->drm_fd,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
@@ -231,7 +231,7 @@ static bool test_pipe_gamma(data_t *data,
 	 */
 	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
 	igt_plane_set_fb(primary, &fb);
-	igt_display_commit(&data->display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 	igt_wait_for_vblank(data->drm_fd,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
@@ -245,7 +245,7 @@ static bool test_pipe_gamma(data_t *data,
 	disable_gamma(primary->pipe);
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
-	igt_display_commit(&data->display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 	igt_remove_fb(data->drm_fd, &fb);
 	igt_remove_fb(data->drm_fd, &fb_modeset);
 
@@ -312,12 +312,12 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	disable_degamma(primary->pipe);
 	disable_gamma(primary->pipe);
 	disable_ctm(primary->pipe);
-	igt_display_commit(&data->display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
 	/* Draw solid colors with no gamma transformation. */
 	paint_rectangles(data, mode, red_green_blue, &fb);
 	igt_plane_set_fb(primary, &fb);
-	igt_display_commit(&data->display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 	igt_wait_for_vblank(data->drm_fd,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
@@ -334,7 +334,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
 		red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
 	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->pipe->crtc_id,
 					  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
-	igt_display_commit(&data->display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 	igt_wait_for_vblank(data->drm_fd,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
@@ -351,11 +351,11 @@ static bool test_pipe_legacy_gamma(data_t *data,
 
 	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->pipe->crtc_id,
 					  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
-	igt_display_commit(&data->display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
-	igt_display_commit(&data->display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 	igt_remove_fb(data->drm_fd, &fb);
 	igt_remove_fb(data->drm_fd, &fb_modeset);
 
@@ -384,6 +384,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
 	uint16_t *red_lut, *green_lut, *blue_lut;
 	struct drm_color_lut *lut;
 	drmModePropertyBlobPtr blob;
+	igt_display_t *display = &data->display;
 	igt_output_t *output = data->output;
 	bool ret = true;
 
@@ -399,7 +400,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
 	disable_degamma(primary->pipe);
 	disable_ctm(primary->pipe);
 	disable_gamma(primary->pipe);
-	igt_display_commit(&data->display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
 	/*
 	 * Set a degama & gamma LUT and a CTM using the
@@ -411,7 +412,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
 	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM))
 		set_ctm(primary->pipe, ctm_identity);
 	set_gamma(data, primary->pipe, gamma_zero);
-	igt_display_commit(&data->display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
 	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT)) {
 		blob = get_blob(data, primary->pipe, IGT_CRTC_DEGAMMA_LUT);
@@ -466,7 +467,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
 					  primary->pipe->crtc_id,
 					  legacy_lut_size,
 					  red_lut, green_lut, blue_lut), 0);
-	igt_display_commit(&data->display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
 	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
 		igt_assert(get_blob(data, primary->pipe,
@@ -493,7 +494,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
 end:
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
-	igt_display_commit(&data->display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
 	free_lut(degamma_linear);
 	free_lut(gamma_zero);
@@ -572,12 +573,12 @@ static bool test_pipe_ctm(data_t *data,
 	igt_debug("color after[2] %f,%f,%f\n", after[2].r, after[2].g, after[2].b);
 
 	disable_ctm(primary->pipe);
-	igt_display_commit(&data->display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
 	paint_rectangles(data, mode, after, &fb);
 	igt_plane_set_fb(primary, &fb);
 	set_ctm(primary->pipe, ctm_identity);
-	igt_display_commit(&data->display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 	igt_wait_for_vblank(data->drm_fd,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_software);
@@ -586,7 +587,7 @@ static bool test_pipe_ctm(data_t *data,
 	paint_rectangles(data, mode, before, &fb);
 	igt_plane_set_fb(primary, &fb);
 	set_ctm(primary->pipe, ctm_matrix);
-	igt_display_commit(&data->display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 	igt_wait_for_vblank(data->drm_fd,
 			    display->pipes[primary->pipe->pipe].crtc_offset);
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_hardware);
@@ -600,7 +601,7 @@ static bool test_pipe_ctm(data_t *data,
 	disable_ctm(primary->pipe);
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
-	igt_display_commit(&data->display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 	igt_remove_fb(data->drm_fd, &fb);
 	igt_remove_fb(data->drm_fd, &fb_modeset);
 
@@ -689,7 +690,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
 		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB, BROADCAST_RGB_FULL);
 		paint_rectangles(data, mode, red_green_blue_limited, &fb);
 		igt_plane_set_fb(primary, &fb);
-		igt_display_commit(&data->display);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 		igt_wait_for_vblank(data->drm_fd,
 				display->pipes[primary->pipe->pipe].crtc_offset);
 		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_full);
@@ -698,7 +699,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
 		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB, BROADCAST_RGB_16_235);
 		paint_rectangles(data, mode, red_green_blue_full, &fb);
 		igt_plane_set_fb(primary, &fb);
-		igt_display_commit(&data->display);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 		igt_wait_for_vblank(data->drm_fd,
 				display->pipes[primary->pipe->pipe].crtc_offset);
 		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_limited);
-- 
2.43.0

