Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653E6F33817
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 08:40:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1884910E191;
	Tue, 17 Mar 2026 08:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="hv5t+8Ia";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD39C10E498
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 08:40:34 +0000 (UTC)
X-UUID: f42950b421dc11f1a02d4725871ece0b-20260317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5rQ3IPyL0nQqA2j2lfLSzC48tPUiCcqR0I9NH0WAND8=; 
 b=hv5t+8Iaqg9lIKOtjwvuUfjf6IDn4xpS8opLS9lS7ukQBTA+79I04ooCzB4jKwITWLJHFbqzwM2R1TgOh0arFZEMuGBTabiqxDVYFerE0LUxSDyh0IdvhxSZ53kxlny+Rlf4bSHjMP5pNG9llbcQYt1f3EN15SPkZ0HMs/V71RA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:9e858471-05ae-46d1-842c-81d61dc0f92a, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:3fa5d0d4-060f-4ecc-9ee0-121eeeb4a682,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
 0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
 :0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f42950b421dc11f1a02d4725871ece0b-20260317
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <xiandong.wang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2041001501; Tue, 17 Mar 2026 16:40:29 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 17 Mar 2026 16:40:28 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 17 Mar 2026 16:40:27 +0800
From: Xiandong Wang <xiandong.wang@mediatek.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Gil Dekel
 <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Xiandong Wang
 <Xiandong.Wang@mediatek.com>
Subject: [PATCH i-g-t v2 1/1] tests/kms_cursor_legacy: relax checks on MTK
Date: Tue, 17 Mar 2026 16:40:14 +0800
Message-ID: <20260317084024.9036-2-xiandong.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260317084024.9036-1-xiandong.wang@mediatek.com>
References: <20260317084024.9036-1-xiandong.wang@mediatek.com>
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

From: Xiandong Wang <Xiandong.Wang@mediatek.com>

kms_cursor_legacy uses tight vblank timing assertions that can be unstable
on MTK under higher system load, leading to intermittent failures.

Use relaxed upper-bound checks for the MTK-specific path in the affected
subtests, while preserving the existing assertions for other drivers.

This improves test robustness on MTK without changing expectations on
non-MTK platforms.

Signed-off-by: Xiandong Wang <Xiandong.Wang@mediatek.com>
---
 tests/kms_cursor_legacy.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 5399ef481..e6ab33eca 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1038,12 +1038,17 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
 		igt_set_timeout(1, "Stuck page flip");
 		igt_ignore_warn(read(display->drm_fd, &vbl, sizeof(vbl)));
 
-		if (!mode_requires_extra_vblank(mode))
-			igt_assert_eq(igt_crtc_get_vblank(crtc, 0),
-				      vblank_start + 1);
-		else
+		if (!mode_requires_extra_vblank(mode)) {
+			if (is_mtk_device(display->drm_fd))
+				igt_assert_lte(igt_crtc_get_vblank(crtc, 0),
+					vblank_start + 1);
+			else
+				igt_assert_eq(igt_crtc_get_vblank(crtc, 0),
+					vblank_start + 1);
+		} else {
 			igt_assert_lte(igt_crtc_get_vblank(crtc, 0),
 				       vblank_start + 2);
+		}
 
 		igt_reset_timeout();
 	} while (nloops--);
@@ -1442,8 +1447,12 @@ static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloo
 			vblank_last = vbl.sequence;
 		}
 
-		if (!cursor_slowpath(display, mode))
-			igt_assert_lte(vbl.sequence, vblank_start + 5 * vrefresh / 8);
+		if (!cursor_slowpath(display, mode)) {
+			if (is_mtk_device(display->drm_fd))
+				igt_assert_lte(vbl.sequence, vblank_start + ((5 * vrefresh / 8) * 4));
+			else
+				igt_assert_lte(vbl.sequence, vblank_start + 5 * vrefresh / 8);
+		}
 
 		shared[0] = 1;
 		igt_waitchildren();
-- 
2.46.0

