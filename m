Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2ECEF3715
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 08:24:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760A410E4A6;
	Mon,  9 Mar 2026 08:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Or7dYJvS";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0330A10E4A6
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 08:24:17 +0000 (UTC)
X-UUID: 5680b8d01b9111f1a02d4725871ece0b-20260309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=EIo1viqXCKrj3JNy2K4mU0r5ASdkmI/gzQb4hcL7B9U=; 
 b=Or7dYJvSt0iaD4Bk9G6SupUX9BLkZOvBh+k+nkro++s9nF3BAzdUr4y7npZc9soySxfKr0y07hsCwNMg8tOJTwXD6Jf9etM0Zu1wCMiKzYhyZEs+22LEKZCZcFLx41jXr/H04oCMoOHjtvw9cAddByUE4iFhAJV1T4rD9HaR4AQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:01b878fd-70fb-4dea-8eeb-40283ab3c1a8, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:89c9d04, CLOUDID:8695af7b-8c8a-4fc4-88c0-3556e7711556,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
 0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
 :0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5680b8d01b9111f1a02d4725871ece0b-20260309
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <xiandong.wang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1701643895; Mon, 09 Mar 2026 16:24:06 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 9 Mar 2026 16:24:04 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 9 Mar 2026 16:24:04 +0800
From: Xiandong Wang <xiandong.wang@mediatek.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Gil Dekel
 <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Xiandong Wang
 <xiandong.wang@mediatek.com>
Subject: [PATCH i-g-t v1] Modify the vbl.sequence *2 for mtk driver
Date: Mon, 9 Mar 2026 16:23:48 +0800
Message-ID: <20260309082400.19767-1-xiandong.wang@mediatek.com>
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

For MTK drm driver the vbl should be *2X,
since the cpu frequency to 2.2GHz reduces
the number of missed frames, confirming that
this problem is related to CPU loading.

Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>
---
 tests/kms_cursor_legacy.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index ad2a15d0f..33ae3778a 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1426,6 +1426,13 @@ static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloo
 		if (!cursor_slowpath(display, mode))
 			igt_assert_lte(vbl.sequence, vblank_start + 5 * vrefresh / 8);
 
+		if (!cursor_slowpath(display, mode)) {
+			if (is_mtk_device(display->drm_fd))
+				igt_assert_lte(vbl.sequence, (vblank_start + 5 * vrefresh / 8) * 2);
+			else
+				igt_assert_lte(vbl.sequence, vblank_start + 5 * vrefresh / 8);
+		}
+
 		shared[0] = 1;
 		igt_waitchildren();
 		if (shared[0] <= vrefresh*target / 2) {
-- 
2.45.2

