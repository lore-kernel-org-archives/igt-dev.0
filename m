Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63BAFF4936
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 03:22:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F70610E111;
	Mon, 30 Mar 2026 03:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="J5MUmsff";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F1910E0FF
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 03:22:12 +0000 (UTC)
X-UUID: a1b1c6302be711f1ae70033691e9ac7d-20260330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Sx1ro55A2IVQ6TZBKWTbJt+Rb6P8G7y0KmOe/FjXSI8=; 
 b=J5MUmsffDomzgkcD7w1R4ibDyJ8YAdtZo8OmrczO0EoMKriwE1tbtrxhTUoyqbCYRlfH++7g2UBJ6/7+y67d7MrLdu9j4g7JTiSATBj2Z1G5mxRF61qVbTMdEu13CXfbDptPd17Cre5RXWAO9LNecZiBOzW1LdX1fZxsrfWyFlM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:d9d55b6c-a02e-44c9-a68c-5e6d10240adf, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:e7bac3a, CLOUDID:92af4b3f-41ee-42eb-90dd-1068410e1f48,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
 0|15|50,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:
 0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a1b1c6302be711f1ae70033691e9ac7d-20260330
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 187442690; Mon, 30 Mar 2026 11:22:07 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 30 Mar 2026 11:22:06 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 30 Mar 2026 11:22:06 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Fei Shao <fshao@chromium.org>
CC: Jani <jani.nikula@intel.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>,
 Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH i-g-t v5 3/3] tests/kms_content_protection: Add FB cleanup for
 MST tests
Date: Mon, 30 Mar 2026 11:20:41 +0800
Message-ID: <20260330032205.467130-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260330032205.467130-1-jason-jh.lin@mediatek.com>
References: <20260330032205.467130-1-jason-jh.lin@mediatek.com>
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

Reuse create_fbs() framebuffers for initial MST setup to avoid
unnecessary recreation.

When igt_override_all_active_output_modes_to_fit_bw() changes modes:
- Detach planes before removing FBs
- Recreate FBs with new dimensions
- Re-attach planes

Add test cleanup: detach planes and remove all MST FBs to prevent
resource leaks.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
Suggested-by: Karthik B.S <karthik.b.s@intel.com>
Reviewed-by: Fei Shao <fshao@chromium.org>
---
 tests/kms_content_protection.c | 44 +++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index b302d4cfd47d..7a5d49106074 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -945,9 +945,33 @@ test_content_protection_mst(int content_type)
 		bool found = igt_override_all_active_output_modes_to_fit_bw(display);
 		igt_require_f(found, "No valid mode combo found for MST modeset\n");
 
-		for (count = 0; count < valid_outputs; count++)
-			prepare_modeset_on_mst_output(hdcp_mst_output[count], false);
+		/* Detach planes before removing framebuffers */
+		for (count = 0; count < valid_outputs; count++) {
+			crtc = igt_output_get_driving_crtc(hdcp_mst_output[count]);
+			prepare_modeset_on_mst_output(hdcp_mst_output[count], crtc, false);
+		}
+		igt_display_commit2(display, COMMIT_ATOMIC);
+
+		/* Need to re-prepare after mode override */
+		for (count = 0; count < valid_outputs; count++) {
+			drmModeModeInfo *mode;
+
+			crtc = igt_output_get_driving_crtc(hdcp_mst_output[count]);
+
+			igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].red);
+			igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].green);
+
+			mode = igt_output_get_mode(hdcp_mst_output[count]);
+
+			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
+					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+					    1.f, 0.f, 0.f, &data.fbs[crtc->crtc_index].red);
+			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
+					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+					    0.f, 1.f, 0.f, &data.fbs[crtc->crtc_index].green);
 
+			prepare_modeset_on_mst_output(hdcp_mst_output[count], crtc, false);
+		}
 		ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
 		igt_require_f(ret == 0, "Commit failure during MST modeset\n");
 	}
@@ -973,8 +997,9 @@ test_content_protection_mst(int content_type)
 	/*
 	 * Verify if CP is still enabled on other outputs by disabling CP on the first output.
 	 */
+	crtc = igt_output_get_driving_crtc(hdcp_mst_output[0]);
 	igt_debug("CP Prop being UNDESIRED on %s\n", hdcp_mst_output[0]->name);
-	test_cp_disable(hdcp_mst_output[0], COMMIT_ATOMIC);
+	test_cp_disable(hdcp_mst_output[0], crtc, COMMIT_ATOMIC);
 
 	/* CP is expected to be still enabled on other outputs*/
 	for (i = 1; i < valid_outputs; i++) {
@@ -985,6 +1010,19 @@ test_content_protection_mst(int content_type)
 
 	if (data.cp_tests & CP_LIC)
 		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 1);
+
+	/* Detach planes before removing framebuffers */
+	for (count = 0; count < valid_outputs; count++) {
+		crtc = igt_output_get_driving_crtc(hdcp_mst_output[count]);
+		prepare_modeset_on_mst_output(hdcp_mst_output[count], crtc, false);
+	}
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	for (count = 0; count < valid_outputs; count++) {
+		crtc = igt_output_get_driving_crtc(hdcp_mst_output[count]);
+		igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].red);
+		igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].green);
+	}
 }
 
 
-- 
2.43.0

