Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9752CD6E4A
	for <igt-dev@archiver.kernel.org>; Sun, 31 May 2026 03:18:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6249F10E437;
	Sun, 31 May 2026 03:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="YBnFav7/";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE49510E437
 for <igt-dev@lists.freedesktop.org>; Sun, 31 May 2026 03:17:53 +0000 (UTC)
X-UUID: 4dbcdc165c9f11f18dc8c9802ae25ab1-20260531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=e+ywisV7L0TnfhVcWHGzFKaSRH7apv1lwctop1kPMaA=; 
 b=YBnFav7/2K7xzr7PtZVRIgDP/R3rd03VvzL3SVXoZI4oaPZ2CNr0WeYnbmLJlD5GbMu96ZbtMQoW/dCDlTWozHMPzqyBuW1eCA+/dbgpnXaeuwMbB9946BuahST/GC02tFDuMxRkIaJO5uj3x28XEPZsHeOXV5oUKJfM77aClbw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15, REQID:59128fe7-4354-484f-a7e5-b7245c016ac7, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e276073, CLOUDID:6d807c30-3aec-4081-ae32-d2e919a47e1d,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|836|865|888|898,TC:-5,
 Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,C
 OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4dbcdc165c9f11f18dc8c9802ae25ab1-20260531
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <jay.liu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1211206521; Sun, 31 May 2026 11:17:49 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 31 May 2026 11:17:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sun, 31 May 2026 11:17:48 +0800
From: Jay Liu <jay.liu@mediatek.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, Paul-PL Chen
 <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>, Sharma Swati2 <swati2.sharma@intel.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jay Liu
 <jay.liu@mediatek.com>
Subject: [PATCH v4 1/1] tests/kms_color: Add 10-bit color depth support to
 gamma test for MediaTek
Date: Sun, 31 May 2026 11:17:05 +0800
Message-ID: <20260531031732.16600-2-jay.liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260531031732.16600-1-jay.liu@mediatek.com>
References: <20260531031732.16600-1-jay.liu@mediatek.com>
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

1. Add 10-bit color depth flow to gamma test for MediaTek devices, which only support bit-true results with 10-bit data. The test now selects 8-bit or 10-bit color depth and framebuffer format based on device type.

2. To satisfy the legacy gamma test requirements, the MTK Gamma LUT limit should be set to 4092, in the current 16-bit LUT design, setting the entry to 0xffd0 ensures the driver maps it correctly to 4092.

Signed-off-by: Jay Liu <jay.liu@mediatek.com>
---
 tests/kms_color.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 565edb2dc..4c32591aa 100644
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
+	 * The Medaitek Gamma LUT maps 10bit input data to 12bit output.
+	 * In this test case, the maximum input value is 1023.
+	 * When the Gamma function is disabled, the data defaults to a 4092 output.
+	 * To achieve bit true results, the Gamma LUT maximum must be set to 4092.
+	 * Note that 0xFFFD0 represents 16-bit,which maps to 4092 in 12-bit depth.
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
@@ -752,14 +766,22 @@ static void
 run_gamma_degamma_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 				 bool (*test_t)(data_t*, igt_plane_t*))
 {
+	bool depth_10bit = false;
+
 	test_setup(data, crtc);
 
+	/* MediaTek requires 10-bit pipeline for accurate (bit true) color processing */
+	if (is_mtk_device(data->drm_fd))
+		depth_10bit = true;
+
 	/*
-	 * We assume an 8bits depth per color for degamma/gamma LUTs
+	 * We assume an 8bits or 10bits depth per color for degamma/gamma LUTs
 	 * for CRC checks with framebuffer references.
 	 */
-	data->color_depth = 8;
-	data->drm_format = DRM_FORMAT_XRGB8888;
+
+	/* MediaTek requires 10-bit pipeline for accurate (bit true) color processing */
+	data->color_depth = depth_10bit ? 10 : 8;
+	data->drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 : DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
 	igt_require(crtc_output_combo_valid(data, crtc));
-- 
2.46.0

