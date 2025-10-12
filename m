Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31418CCD187
	for <igt-dev@archiver.kernel.org>; Sun, 12 Oct 2025 17:15:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9F110E17D;
	Sun, 12 Oct 2025 17:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="c7sOWP9L";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD29610E17D
 for <igt-dev@lists.freedesktop.org>; Sun, 12 Oct 2025 17:15:08 +0000 (UTC)
X-UUID: fdacdcf0a78e11f08d9e1119e76e3a28-20251013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kgFEVyGeAvrIPMWg2gRtVdS6oFLYY0YtnIwnFj6tVkk=; 
 b=c7sOWP9LuxE1fYPmNOBPvBvBzN5LxA7baLrvYgxoGNavwjICaocR03fZ3rd08mYth+wVe3H2pW+ErHVCZj0l5kc4Hr8CMejPlNPTlf6gKZpAusj49KqF0HT1ha2bCSabuJ9+EgjjLXrhXCp2DPK5sURjhbxZiM67NELGcqtAvsg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:e8704dd8-199c-4db5-927b-b98addf1b2dd, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:e30b0c06-56ed-4a2f-9417-82fff695211e,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
 0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fdacdcf0a78e11f08d9e1119e76e3a28-20251013
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 102664403; Mon, 13 Oct 2025 01:15:03 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 13 Oct 2025 01:15:01 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Mon, 13 Oct 2025 01:14:59 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen <paul-pl.chen@mediatek.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH i-g-t 4/6] lib/igt_kms: Add support for mtk_current_bpc
 debugfs in bpc-switch test
Date: Mon, 13 Oct 2025 01:13:14 +0800
Message-ID: <20251012171459.3773990-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
References: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
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

Add support for the "mtk_current_bpc" debugfs entry when detecting bpc
on MediaTek devices. This allows bpc-switch tests to work properly with
MTK platforms by reading the correct debugfs property.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 lib/igt_kms.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9ee03e870927..1662e6d61f50 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6261,6 +6261,8 @@ unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe)
 		strcpy(debugfs_name, "i915_current_bpc");
 	else if (is_amdgpu_device(drmfd))
 		strcpy(debugfs_name, "amdgpu_current_bpc");
+	else if (is_mtk_device(drmfd))
+		strcpy(debugfs_name, "mtk_current_bpc");
 
 	res = igt_debugfs_simple_read(fd, debugfs_name, buf, sizeof(buf));
 	igt_require(res > 0);
-- 
2.43.0

