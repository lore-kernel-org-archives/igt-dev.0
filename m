Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4847F1093181
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 07:34:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB06B10E960;
	Fri, 20 Mar 2026 07:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Rt4oIxzn";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6D510E960
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 07:34:19 +0000 (UTC)
X-UUID: 31bff3d4242f11f1a39cd589f645bc18-20260320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=yaiAp9AcQ5OxfgDSJFn22pkjbxlXjTCUOw0NecCMTYg=; 
 b=Rt4oIxznUNeviZvSVXbtVA3qrSkV6kmm48oGv97hdSc6vNbCv4RxJsRgIkSTvubPBSM0T43VUPZdjNdAEmBRBijoOY0bmwOoujTYpQIQVGDmZaqFOmcM8+7zx9HelXCresW/SFuOvdotogD/lHV2IZebN/MD+0twX5DuwrJNY3U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:39a8e7db-57dd-49e3-805d-d8f9d0f1402f, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:93e1f0d4-060f-4ecc-9ee0-121eeeb4a682,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
 0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
 :0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 31bff3d4242f11f1a39cd589f645bc18-20260320
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <jay.liu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1157863793; Fri, 20 Mar 2026 15:34:14 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 20 Mar 2026 15:34:12 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 20 Mar 2026 15:34:12 +0800
From: Jay Liu <jay.liu@mediatek.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, Paul-PL Chen
 <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jay Liu
 <jay.liu@mediatek.com>
Subject: [PATCH i-g-t v1] tests/kms_color: Add 10-bit color depth support to
 gamma test for MediaTek
Date: Fri, 20 Mar 2026 15:33:58 +0800
Message-ID: <20260320073409.17337-1-jay.liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
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

1.Add 10-bit color depth flow to gamma test for MediaTek devices, which only
support bit-true results with 10-bit data. The test now selects 8-bit or
10-bit color depth and framebuffer format based on device type.

2. Change the maximum gamma LUT value from 4095 to 4092 for MediaTek devices.

Signed-off-by: Jay Liu <jay.liu@mediatek.com>
---
 tests/kms_color.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 565edb2dc..27fc08ab9 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -288,7 +288,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	fb_id = igt_create_fb(data->drm_fd,
 			      mode->hdisplay,
 			      mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
+			      data->drm_format,
 			      DRM_FORMAT_MOD_LINEAR,
 			      &fb);
 	igt_assert(fb_id);
@@ -296,7 +296,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	fb_modeset_id = igt_create_fb(data->drm_fd,
 				      mode->hdisplay,
 				      mode->vdisplay,
-				      DRM_FORMAT_XRGB8888,
+				      data->drm_format,
 				      DRM_FORMAT_MOD_LINEAR,
 				      &fb_modeset);
 	igt_assert(fb_modeset_id);
@@ -322,8 +322,16 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	igt_plane_set_fb(primary, &fb);
 
 	red_lut[0] = green_lut[0] = blue_lut[0] = 0;
-	for (i = 1; i < legacy_lut_size; i++)
-		red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
+	for (i = 1; i < legacy_lut_size; i++) {
+		/*
+		 * Use 4092 for mtk gamma LUT to remap all values
+		 * to max red/green/blue.
+		 */
+		if (is_mtk_device(data->drm_fd))
+			red_lut[i] = green_lut[i] = blue_lut[i] = 0xffd0;
+		else
+			red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
+	}
 	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->crtc->crtc_id,
 					  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
 	igt_display_commit(&data->display);
@@ -752,14 +760,20 @@ static void
 run_gamma_degamma_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 				 bool (*test_t)(data_t*, igt_plane_t*))
 {
+	bool depth_10bit = false;
+
 	test_setup(data, crtc);
 
+	/* MediaTek can only support bit-ture in 10-bit depth pre color */
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
+	data->color_depth = depth_10bit ? 10 : 8;
+	data->drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 : DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
 	igt_require(crtc_output_combo_valid(data, crtc));
-- 
2.46.0

