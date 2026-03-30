Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAD3FF4935
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 03:22:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE6410E0DD;
	Mon, 30 Mar 2026 03:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="f96Rnw0u";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEBC10E0DD
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 03:22:12 +0000 (UTC)
X-UUID: a198b1042be711f1ae70033691e9ac7d-20260330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=+HCHV3oINhYPxhrtj9BQu1GvAi9wyd5G4ujPKwD7gY4=; 
 b=f96Rnw0ua+hcx3lwiZ0ZcGTeERQuk7q3TEJ++bOj8HUCd5h4jZXVigbW0TgarCmlK2d5JGE+GwSHG4IU7pkKDcgHmj7mFDTCl+z/iq/OYc++HCkY/6IFLhAPRbJ1GmbBvb568KWcAH0JnYRvFuabYe8ZB6crpdsH5UDgDnOgNsY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:33ab6edf-e688-44ae-9f26-714e6d6c9493, IP:0,
 U
 RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:25
X-CID-META: VersionHash:e7bac3a, CLOUDID:7ce35994-f8ef-4ca8-bea0-143568f9ca1d,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
 0|15|50,EDM:-3,IP:nil,URL:11|85|100|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1
 ,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a198b1042be711f1ae70033691e9ac7d-20260330
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 857580458; Mon, 30 Mar 2026 11:22:07 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 30 Mar 2026 11:22:05 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 30 Mar 2026 11:22:05 +0800
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
Subject: [PATCH i-g-t v5 1/3] tests/kms_content_protection: Add per-CRTC
 framebuffer infrastructure
Date: Mon, 30 Mar 2026 11:20:39 +0800
Message-ID: <20260330032205.467130-2-jason-jh.lin@mediatek.com>
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

Replace global framebuffers (data.red/green) with per-CRTC array
(data.fbs[IGT_MAX_PIPES]) to support multiple outputs with different
resolutions.

Add create_fbs()/remove_fbs() to manage framebuffer lifecycle at
test initialization/cleanup, creating each FB with the resolution of
the first output that can connect to that CRTC.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Fei Shao <fshao@chromium.org>
---
 tests/kms_content_protection.c | 50 +++++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index caf3d7a56ae4..df9ff5efcaa2 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -107,10 +107,15 @@
 
 IGT_TEST_DESCRIPTION("Test content protection (HDCP)");
 
+struct hdcp_test_fbs {
+	struct igt_fb red;
+	struct igt_fb green;
+};
+
 struct data {
 	int drm_fd;
 	igt_display_t display;
-	struct igt_fb red, green;
+	struct hdcp_test_fbs fbs[IGT_MAX_PIPES];
 	unsigned int cp_tests;
 	struct udev_monitor *uevent_monitor;
 	bool is_force_hdcp14;
@@ -991,31 +996,49 @@ static void test_content_protection_cleanup(void)
 		igt_info("CP Prop being UNDESIRED on %s\n", output->name);
 		test_cp_disable(output, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	}
-
-	igt_remove_fb(data.drm_fd, &data.red);
-	igt_remove_fb(data.drm_fd, &data.green);
 }
 
 static void create_fbs(void)
 {
-	uint16_t width = 0, height = 0;
 	drmModeModeInfo *mode;
 	igt_output_t *output;
+	igt_crtc_t *crtc;
 
+	/* Create framebuffers for each connected output's pipe */
 	for_each_connected_output(&data.display, output) {
 		mode = igt_output_get_mode(output);
 		igt_assert(mode);
 
-		width = max(width, mode->hdisplay);
-		height = max(height, mode->vdisplay);
+		/* Find a valid crtc for this output */
+		for_each_crtc(&data.display, crtc) {
+			if (!igt_crtc_connector_valid(crtc, output))
+				continue;
+
+			/* Skip if already created for this crtc */
+			if (data.fbs[crtc->crtc_index].red.fb_id)
+				continue;
+
+			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
+					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+					    1.f, 0.f, 0.f, &data.fbs[crtc->crtc_index].red);
+			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
+					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+					    0.f, 1.f, 0.f, &data.fbs[crtc->crtc_index].green);
+			break;
+		}
 	}
+}
 
-	igt_create_color_fb(data.drm_fd, width, height,
-			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
-			    1.f, 0.f, 0.f, &data.red);
-	igt_create_color_fb(data.drm_fd, width, height,
-			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
-			    0.f, 1.f, 0.f, &data.green);
+static void remove_fbs(void)
+{
+	igt_crtc_t *crtc;
+
+	for_each_crtc(&data.display, crtc) {
+		if (data.fbs[crtc->crtc_index].red.fb_id)
+			igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].red);
+		if (data.fbs[crtc->crtc_index].green.fb_id)
+			igt_remove_fb(data.drm_fd, &data.fbs[crtc->crtc_index].green);
+	}
 }
 
 static const struct {
@@ -1241,6 +1264,7 @@ int igt_main()
 
 	igt_fixture() {
 		test_content_protection_cleanup();
+		remove_fbs();
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
-- 
2.43.0

