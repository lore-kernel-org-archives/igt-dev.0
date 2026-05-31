Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1807CCD6E4A
	for <igt-dev@archiver.kernel.org>; Sun, 31 May 2026 03:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4046112A5C;
	Sun, 31 May 2026 03:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="HSUtSSfv";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B850F10E437
 for <igt-dev@lists.freedesktop.org>; Sun, 31 May 2026 03:17:52 +0000 (UTC)
X-UUID: 4b8a1d1e5c9f11f18dc8c9802ae25ab1-20260531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=j4nyknRi75BD3BtPrGxvP7s+i6XF4A+4ZCpYLweYefM=; 
 b=HSUtSSfvXWhbAlH/m8+dv+1GeC+aac6og1dJtZ13DmZit9hISZwJVxvUM0xZhZ6aoB/46G5J/6/LBxYcvn9Jx2pwYcS31yI8rM+Ys8Gea+3PL7zCAi/cuvZJt8Jj28QObbrO/d6GtkHB2HUzzytprJFZDmx/YhtxCxLFeTUaM5g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15, REQID:cc1b960e-161b-4d1b-b094-e2eb719525e3, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e276073, CLOUDID:55807c30-3aec-4081-ae32-d2e919a47e1d,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|136|836|865|888|898,TC:-5,Conten
 t:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,O
 SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4b8a1d1e5c9f11f18dc8c9802ae25ab1-20260531
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <jay.liu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 625670538; Sun, 31 May 2026 11:17:46 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 31 May 2026 11:17:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sun, 31 May 2026 11:17:44 +0800
From: Jay Liu <jay.liu@mediatek.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, Paul-PL Chen
 <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>, Sharma Swati2 <swati2.sharma@intel.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jay Liu
 <jay.liu@mediatek.com>
Subject: [PATCH i-g-t v4 0/1] tests/kms_color: Add 10-bit color depth support
 to gamma test for MediaTek
Date: Sun, 31 May 2026 11:17:04 +0800
Message-ID: <20260531031732.16600-1-jay.liu@mediatek.com>
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

Hi,

This patch introduces support for 10-bit color depth in the kms_color test suite to accommodate MediaTek devices that require a 10-bit pipeline to achieve bit-true results during color verification.

Change in v4:
- Refactor lut_value assignment: declare lut_value variable at the beginning of the function and assign it outside the loop to improve code efficiency.
- Rename is_mtk to depth_10bit: use a more descriptive variable name that reflects the actual purpose (10-bit color depth requirement) rather than device vendor.

Change in v3:
- Fix build error in kms_color.c:the previous patch mistakenly changed primary->crtc to primary->pipe, which caused compilation to fail.

Change in v2:
- Replace the depth_10bit variable with is_mtk to simplify the logic.
- Include a code comment to clarify the justification for using 0xFFD0 as the maximum threshold for the Gamma LUT.

Jay Liu (1):
  tests/kms_color: Add 10-bit color depth support to gamma test for
    MediaTek

 tests/kms_color.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

-- 
2.46.0

