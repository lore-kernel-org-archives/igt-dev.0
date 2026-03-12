Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C666F103E2FC
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 01:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CBE10E337;
	Thu, 12 Mar 2026 01:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Peos1PKS";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04D710E16B
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 01:25:19 +0000 (UTC)
X-UUID: 50ac7aa21db211f1a39cd589f645bc18-20260312
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=9EqqdIItIoBfBK8bEgvDJ6KxwZPcKhii4uxbyWMmamU=; 
 b=Peos1PKSYPkFytjRnbLjQFTNgExSrKtqqo6JctHKTyb5WBhsR6xx7QsSELXy9RbzReQT7tHH89wn/M6TeDxWf1Cj+moSscEKHVnycfZFBvDBeZ7QvDBzMbV32c4Gs935IMI+LM3dRFLZm75ePBdC0wzJSrP3RjKRp6v8emGM0Bk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:8bc475c0-c4c9-41ae-b303-d82ece2bd437, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:2355cd7b-8c8a-4fc4-88c0-3556e7711556,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
 0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
 :0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 50ac7aa21db211f1a39cd589f645bc18-20260312
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com (envelope-from <xiandong.wang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 761201078; Thu, 12 Mar 2026 09:25:12 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Mar 2026 09:25:10 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Mar 2026 09:25:10 +0800
From: Xiandong Wang <xiandong.wang@mediatek.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Gil Dekel
 <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Xiandong Wang
 <Xiandong.Wang@mediatek.com>
Subject: [PATCH i-g-t v3 1/1] skip kms_flip case for mtk driver
Date: Thu, 12 Mar 2026 09:24:58 +0800
Message-ID: <20260312012507.23682-2-xiandong.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260312012507.23682-1-xiandong.wang@mediatek.com>
References: <20260312012507.23682-1-xiandong.wang@mediatek.com>
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

Signed-off-by: Xiandong Wang <Xiandong.Wang@mediatek.com>
---
 tests/kms_flip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 49a5f4ed1..29a24c6f0 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -2095,6 +2095,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 		igt_display_require(&display, drm_fd);
 
+		igt_skip_on(is_mtk_device(drm_fd));
+
 		kmstest_set_vt_graphics_mode();
 		igt_install_exit_handler(kms_flip_exit_handler);
 		get_timestamp_format();
-- 
2.46.0

