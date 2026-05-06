Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D9ACD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 10:01:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8307D10E6DA;
	Wed,  6 May 2026 10:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="sfCfNUIq";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF1510E6DA
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 10:01:34 +0000 (UTC)
X-UUID: 8dba2a42493211f1a4e839cc21f16abe-20260506
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=RfSKkgtRon5iLvcPUa6EWCp/fXIgVzzzjyhGcd7FEwo=; 
 b=sfCfNUIqdDHBjEUoHH3MSCknWjlKi8cOlLiiYGCe2GmRJ7mVQwzY9zIOwq8sbwDCJHb+IQBx3VJPAp07Qr4HowAbdb6M0Zp5PGgI64UEOeREPh+2FSVeQ2yxdks+R6f77HdvVUd1vbrCoKgg94NRfNDRn+ITecK9AuBbE5/2/fE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:f72bf0e3-8f08-4c9a-b87e-0d0755b822aa, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:ccfb0571-3b7f-4b26-b2f9-40f0deecb36d,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
 15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
 ,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8dba2a42493211f1a4e839cc21f16abe-20260506
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <xiandong.wang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 449528723; Wed, 06 May 2026 18:01:30 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 6 May 2026 18:01:28 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 6 May 2026 18:01:28 +0800
From: Xiandong Wang <xiandong.wang@mediatek.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Gil Dekel
 <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Xiandong Wang
 <Xiandong.Wang@mediatek.com>
Subject: [PATCH i-g-t v3 0/1] Improve kms_cursor_legacy robustness on MTK
Date: Wed, 6 May 2026 18:01:10 +0800
Message-ID: <20260506100126.9827-1-xiandong.wang@mediatek.com>
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

From: Xiandong Wang <Xiandong.Wang@mediatek.com>

This series improves the robustness of kms_cursor_legacy test on MTK
platforms by relaxing timing assertions that were causing intermittent
failures under high system load.

The changes are based on the understanding that MTK display hardware
uses a frame-based processing model where cursor updates can take longer
under heavy load due to hardware scheduling characteristics. The relaxed
assertions maintain test validity while avoiding false positives.

Changes in v3:
- Add detailed explanation of MTK hardware characteristics
- Document the rationale for 4x threshold multiplier
- Clarify why the changes don't affect other platforms

Changes in v2:
- Remove MTK-specific guard in flip_vs_cursor() per review feedback
- Use threshold variable approach for better code clarity
- Addressed review comments from Jason-JH Lin

Testing:
- Verified on MTK platforms under various load conditions
- No regressions observed on Intel platforms
- Test still catches real timing issues

Xiandong Wang (1):
  tests/kms_cursor_legacy: relax checks on MTK

 tests/kms_cursor_legacy.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

-- 
2.45.2

