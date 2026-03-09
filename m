Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45573F513F1
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 09:11:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025D010E4AD;
	Mon,  9 Mar 2026 09:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="EKNXMUrK";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBD810E4AD
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 09:11:48 +0000 (UTC)
X-UUID: ff05a1221b9711f1a02d4725871ece0b-20260309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=amZSrnTZ9idNt5GjAXf8Ef7qTAFPGZzn73msmGMNI+I=; 
 b=EKNXMUrK19Z/hcSFuyHkxX3a2w/4dYdgwiJrggJl4FmlcUk99sy3qegMAtLuzUVnhyIuPRsnntouRzPx7Tf58U8omKDBiejsEBPwdPndu3EZTNArcelMZqcQGpm8sV60KVqP/2ietqPXOOQUm/iQvlwnOoYgHjiKHtta6LkDw3E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:ac4b53b7-3ad2-45ff-a8d8-99784deeb18d, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:89c9d04, CLOUDID:0d64075c-a957-4259-bcca-d3af718d7034,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
 0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
 :0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ff05a1221b9711f1a02d4725871ece0b-20260309
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw01.mediatek.com (envelope-from <xiandong.wang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 375926943; Mon, 09 Mar 2026 17:11:45 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 9 Mar 2026 17:11:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 9 Mar 2026 17:11:43 +0800
From: Xiandong Wang <xiandong.wang@mediatek.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Gil Dekel
 <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Xiandong Wang
 <xiandong.wang@mediatek.com>
Subject: [PATCH i-g-t v3 1/1] Skip kms_flip for mtk
Date: Mon, 9 Mar 2026 17:11:36 +0800
Message-ID: <20260309091142.20580-2-xiandong.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260309091142.20580-1-xiandong.wang@mediatek.com>
References: <20260309091142.20580-1-xiandong.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

The MTK DRM driver supports only async‑mode page flips, but the current
kms_flip path still follows the non‑async flow. It sends an ioctl to the
driver and then immediately issues the next ioctl without waiting for the
MTK page flip — that is, without waiting for the CMDQ callback.
This can lead to random failures because the kms_flip flow proceeds
without checking whether the MTK DRM driver has completed the previous frame.
As a result, the next ioctl may arrive before the previous frame is finished,
causing a device‑busy condition. Based on this analysis, the current kms_flip
test flow is not compatible with the MTK driver and therefore needs to be skipped.

Change-Id: I80b23c8c26254a29721ccdc02e69fa5643067c24
Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>
---
 tests/kms_flip.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 49a5f4ed1..69e74e96a 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1824,6 +1824,9 @@ static void run_test(int duration, int flags)
 	if (is_xe_device(drm_fd) && flags & TEST_FENCE_STRESS)
 		return;
 
+	if (is_mtk_device(drm_fd))
+		return;
+
 	if (flags & TEST_BO_TOOBIG && !is_intel_device(drm_fd))
 		return;
 
@@ -1901,6 +1904,9 @@ static void run_pair(int duration, int flags)
 	if (is_xe_device(drm_fd) && flags & TEST_FENCE_STRESS)
 		return;
 
+	if (is_mtk_device(drm_fd))
+		return;
+
 	if (flags & TEST_BO_TOOBIG && !is_intel_device(drm_fd))
 		return;
 
-- 
2.46.0

