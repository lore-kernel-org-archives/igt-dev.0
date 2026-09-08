Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A48C79FA0
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 07:49:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202C610EA8F;
	Tue,  8 Sep 2026 07:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="p51RnCH8";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B697D10EAAA
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 07:49:06 +0000 (UTC)
X-UUID: c176d4dcab5911f1b1788b6acf885367-20260908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=0T2gAbYO42BXrqgmGIMWEwm1HicJTNkk9uSDxLOz3rg=; 
 b=p51RnCH8HkCilARVKHGH5Iczmd/A2o45fk/GIqutO8LAupSP4fG3sJu4jBKZw0NPwnDqF9rM5M2HKi5IetRyU56/EMMpupoJkkkOVKpCUSmGe1qKDkgZB8sFL7EHoWpCskJzjwtLIghdI93fd+B4EIXRsQtpLRg+wglDNUr7U5g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19, REQID:c8b839d7-76de-430e-a00b-8f37b51e466e, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:7db8b62, CLOUDID:c3a282dc-e2a3-4c41-83fa-4adacd638ae3,
 B
 ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
 99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
 :0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c176d4dcab5911f1b1788b6acf885367-20260908
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw01.mediatek.com (envelope-from <xiandong.wang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 716290613; Tue, 08 Sep 2026 15:49:01 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 8 Sep 2026 15:48:59 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 8 Sep 2026 15:48:59 +0800
From: Xiandong Wang <xiandong.wang@mediatek.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, Xiandong Wang
 <xiandong.wang@mediatek.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH i-g-t v3 0/1] kms_atomic_transition: Skip unsupported blocking
 transitions on MTK
Date: Tue, 8 Sep 2026 15:48:38 +0800
Message-ID: <20260908074849.29238-1-xiandong.wang@mediatek.com>
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

MTK DRM does not currently provide the immediate page-flip event or
out-fence completion required by the blocking atomic-transition tests.

Skip only those blocking variants on MTK. The nonblocking variants and
the separate modeset-transition tests remain enabled, so coverage for
the supported paths is retained.

Changes in v3:
- Add the missing Signed-off-by trailer.

Changes in v2:
- Use the MediaTek author e-mail address.
- Fold commit-message body lines to 65 columns.

Xiandong Wang (1):
  tests/kms_atomic_transition: Skip blocking transitions on MTK

 tests/kms_atomic_transition.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.45.2
