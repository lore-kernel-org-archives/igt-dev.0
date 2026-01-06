Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7141C47BDD
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 10:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9A510E4E0;
	Tue,  6 Jan 2026 10:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="mqDa6jy4";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E199E10E4E4
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 10:22:37 +0000 (UTC)
X-UUID: 8f2ef3dceae911f0942a039f3f28ce95-20260106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=uGVhvwa+fko0OGEunI+ypdEyoIQ+799+SeCRCezdP0M=; 
 b=mqDa6jy42AJa+FUwhyXAI5g7K1tNijRdzCRMIojsBh5WIHnbDgvzWkgS7QJP8OtNi91v7+nXWjWcHhkUTMmPfQBDYhxQRrqh7tLY1H/2PYJCz4qzGsfKTEE99URNyrIb4VEahGsQehf+DLdY3LfSM64L+SV1xhzjNS7R0yClu6g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9, REQID:dcd176e3-ba9a-4b31-b9bb-c3832bb1a867, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:5047765, CLOUDID:d9b2251c-569f-4a0f-9948-b21a1d8a5571,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
 0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
 A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8f2ef3dceae911f0942a039f3f28ce95-20260106
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 869986202; Tue, 06 Jan 2026 18:22:09 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 18:22:08 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 18:22:08 +0800
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
Subject: [PATCH i-g-t 1/1] tests/kms_content_protection: Re-create framebuffer
 before each modeset
Date: Tue, 6 Jan 2026 18:21:51 +0800
Message-ID: <20260106102207.2530864-1-jason-jh.lin@mediatek.com>
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

The red and green framebuffers were previously created only once at
the beginning of the test. If the test runs on multiple outputs with
different resolutions, the pre-created framebuffer's size might not
match the mode of a subsequent output, causing the modeset to fail.

This patch moves the framebuffer creation logic inside the
modeset_with_fb() function. This ensures that for every modeset
operation, a new framebuffer is created with dimensions that
perfectly match the current output's mode, preventing potential
modeset failures on systems with multiple displays of varying
resolutions.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 tests/kms_content_protection.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 377bab9a3afb..980091871679 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -250,6 +250,13 @@ static void modeset_with_fb(const enum pipe pipe, igt_output_t *output,
 
 	mode = igt_output_get_mode(output);
 
+	igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    1.f, 0.f, 0.f, &data.red);
+	igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    0.f, 1.f, 0.f, &data.green);
+
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, &data.red);
 	igt_fb_set_size(&data.red, primary, mode->hdisplay, mode->vdisplay);
-- 
2.43.0

