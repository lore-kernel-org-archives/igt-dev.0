Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65559CD8C8E
	for <igt-dev@archiver.kernel.org>; Sat,  6 Jun 2026 09:07:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E7E10E245;
	Sat,  6 Jun 2026 09:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="jJJ6MiRF";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C6F10E245
 for <igt-dev@lists.freedesktop.org>; Sat,  6 Jun 2026 09:07:03 +0000 (UTC)
X-UUID: 11e2cfba618711f1b1788b6acf885367-20260606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=15Q1q++cqV2v9/GF+U80AAebeq503kKtjgQRXfOR3eQ=; 
 b=jJJ6MiRFPZntCdI/u6fmvaZNrC6iAV7KhY1LGItk9r7IDMdHJq2XGjR8l0KD7BFnfKN7GxEF0RYC7S3upmaykvobJHm0nptlgjXVxeKUBodsNe7jeDAceYznaGScoGNms1P2QkQmgZ4NWNOpITEy5BeZao4SBBZ5EOgRhOmasHc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15, REQID:41bde038-ad2f-448c-9601-1555851b6759, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e276073, CLOUDID:e3e2bda4-9ef7-4489-861a-e83b251ece46,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|836|865|888|898,TC:-5,
 Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,C
 OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 11e2cfba618711f1b1788b6acf885367-20260606
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <jay.liu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1310551580; Sat, 06 Jun 2026 17:06:57 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 6 Jun 2026 17:06:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 6 Jun 2026 17:06:55 +0800
From: Jay Liu <jay.liu@mediatek.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, Paul-PL Chen
 <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>, Sharma Swati2 <swati2.sharma@intel.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jay Liu
 <jay.liu@mediatek.com>
Subject: [PATCH v5 1/1] tests/kms_color: Add 10-bit color depth support to
 gamma test for MediaTek
Date: Sat, 6 Jun 2026 17:05:36 +0800
Message-ID: <20260606090557.8879-2-jay.liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260606090557.8879-1-jay.liu@mediatek.com>
References: <20260606090557.8879-1-jay.liu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

MediaTek display hardware has specific color processing requirements that
differ from other vendors. This patch addresses two key aspects:

1. MediaTek devices require a 10-bit color pipeline to achieve bit-accurate
   (bit-true) gamma test results. Unlike other devices that work correctly
   with 8-bit color depth (DRM_FORMAT_XRGB8888), MediaTek hardware needs
   10-bit color depth (DRM_FORMAT_XRGB2101010) to properly validate gamma
   LUT operations without precision loss.

2. MediaTek's Gamma LUT maps 10-bit input data (0-1023) to 12-bit output
   (0-4095). When gamma correction is disabled, the hardware defaults to
   outputting 4092 for maximum input values. To pass the legacy gamma test
   which expects consistent behavior, the LUT maximum entry must be set to
   0xffd0 (which maps to 4092 in 12-bit) instead of 0xffff. This ensures
   the test produces bit-true results matching the hardware behavior.

The test now automatically detects MediaTek devices and applies the
appropriate color depth and LUT configuration.

Signed-off-by: Jay Liu <jay.liu@mediatek.com>
---
 tests/kms_color.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 565edb2dc..dc3432df5 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -265,6 +265,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	drmModeCrtc *drm_crtc;
 	uint32_t i, legacy_lut_size;
 	uint16_t *red_lut, *green_lut, *blue_lut;
+	uint16_t lut_value;
 	drmModeModeInfo *mode = data->mode;
 	struct igt_fb fb_modeset, fb;
 	igt_crc_t crc_fullgamma, crc_fullcolors;
@@ -288,7 +289,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	fb_id = igt_create_fb(data->drm_fd,
 			      mode->hdisplay,
 			      mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
+			      data->drm_format,
 			      DRM_FORMAT_MOD_LINEAR,
 			      &fb);
 	igt_assert(fb_id);
@@ -296,7 +297,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	fb_modeset_id = igt_create_fb(data->drm_fd,
 				      mode->hdisplay,
 				      mode->vdisplay,
-				      DRM_FORMAT_XRGB8888,
+				      data->drm_format,
 				      DRM_FORMAT_MOD_LINEAR,
 				      &fb_modeset);
 	igt_assert(fb_modeset_id);
@@ -321,9 +322,22 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
 	igt_plane_set_fb(primary, &fb);
 
+	/*
+	 * The MediaTek Gamma LUT maps 10bit input data to 12bit output.
+	 * In this test case, the maximum input value is 1023.
+	 * When the Gamma function is disabled, the data defaults to a 4092 output.
+	 * To achieve bit true results, the Gamma LUT maximum must be set to 4092.
+	 * Note that 0xffd0 represents 16-bit, which maps to 4092 in 12-bit depth.
+	 */
+	if (is_mtk_device(data->drm_fd))
+		lut_value = 0xffd0;
+	else
+		lut_value = 0xffff;
+
 	red_lut[0] = green_lut[0] = blue_lut[0] = 0;
 	for (i = 1; i < legacy_lut_size; i++)
-		red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
+		red_lut[i] = green_lut[i] = blue_lut[i] = lut_value;
+
 	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->crtc->crtc_id,
 					  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
 	igt_display_commit(&data->display);
@@ -752,14 +766,17 @@ static void
 run_gamma_degamma_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 				 bool (*test_t)(data_t*, igt_plane_t*))
 {
+	bool depth_10bit = is_mtk_device(data->drm_fd);
+
 	test_setup(data, crtc);
 
 	/*
-	 * We assume an 8bits depth per color for degamma/gamma LUTs
+	 * We assume an 8bits or 10bits depth per color for degamma/gamma LUTs
 	 * for CRC checks with framebuffer references.
+	 * MediaTek requires 10-bit pipeline for accurate (bit true) color processing.
 	 */
-	data->color_depth = 8;
-	data->drm_format = DRM_FORMAT_XRGB8888;
+	data->color_depth = depth_10bit ? 10 : 8;
+	data->drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 : DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
 	igt_require(crtc_output_combo_valid(data, crtc));
-- 
2.45.2

