Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050B3EF06EE
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 02:04:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AD710E0F0;
	Mon,  9 Feb 2026 02:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="BdJq/5vF";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB0510E0F0
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 02:04:07 +0000 (UTC)
X-UUID: 996254d4055b11f1b7fc4fdb8733b2bc-20260209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=GKbNKp4CbXAW4hyltGFwm1hwsC5mzfAc4tTmhkGaAFs=; 
 b=BdJq/5vFYzxpdEhnhVCtliNssQqdkfw9AJ9HkvpJeLy6QaIiAyOl8HAYQnygZSIvQ+8g8IksSyxDk6iHFHPGefRtuHssr5rlaEG1Ih75wOap6ZWHV83Anvclg8yZhItNPQucplON1GMjV2I1EenOd5bv/oGXAPsN6rllNkTgHC8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:34ca544a-ae74-41dd-b817-c1fb8301b322, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:89c9d04, CLOUDID:dcb878f0-16bd-4243-b4ca-b08ca08ab1d8,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
 0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
 :0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 996254d4055b11f1b7fc4fdb8733b2bc-20260209
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <xiandong.wang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 118498191; Mon, 09 Feb 2026 10:03:59 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 9 Feb 2026 10:03:58 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 9 Feb 2026 10:03:58 +0800
From: Xiandong Wang <xiandong.wang@mediatek.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, Gil Dekel <gildekel@google.com>, 
 Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, xiandong.wang
 <xiandong.wang@mediatek.corp-partner.google.com>
Subject: [PATCH i-g-t 1/1] Skip kms_flip for mtk
Date: Mon, 9 Feb 2026 10:03:52 +0800
Message-ID: <20260209020357.32744-1-xiandong.wang@mediatek.com>
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

From: "xiandong.wang" <xiandong.wang@mediatek.corp-partner.google.com>

Change-Id: I80b23c8c26254a29721ccdc02e69fa5643067c24
Signed-off-by: xiandong.wang <xiandong.wang@mediatek.corp-partner.google.com>
---
 tests/kms_flip.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index a74e69c6f..9524a9d4e 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1826,6 +1826,9 @@ static void run_test(int duration, int flags)
 	if (is_xe_device(drm_fd) && flags & TEST_FENCE_STRESS)
 		return;
 
+       if (is_mtk_device(drm_fd))
+               return;
+
 	if (flags & TEST_BO_TOOBIG && !is_intel_device(drm_fd))
 		return;
 
@@ -1903,6 +1906,9 @@ static void run_pair(int duration, int flags)
 	if (is_xe_device(drm_fd) && flags & TEST_FENCE_STRESS)
 		return;
 
+       if (is_mtk_device(drm_fd))
+               return;
+
 	if (flags & TEST_BO_TOOBIG && !is_intel_device(drm_fd))
 		return;
 
-- 
2.46.0

