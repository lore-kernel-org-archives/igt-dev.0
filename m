Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9F9CCD1B9
	for <igt-dev@archiver.kernel.org>; Tue, 21 Oct 2025 17:39:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8118A10E631;
	Tue, 21 Oct 2025 17:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="GZCwUcUr";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1B410E631
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Oct 2025 17:39:21 +0000 (UTC)
X-UUID: dcb87744aea411f0ae1e63ff8927bad3-20251022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=O9mGX2PCrJdeqcELiT/NogmW6Nx9yDxroZzo9Pwue2Q=; 
 b=GZCwUcUr6rvhPDIjd+BmKhC/zDhHU1S0OrcySHBo4oo6SAUTyeDDaAJsDgRxlG/TwjRP4esIBsSVzHEgGnHegN7V/olHlKuCIti1mUE8tzt5okl2mFBipPhCqzBDCKN/Ch7WxdsP350mvMc4p+Kg+HB+fZTwVgX+MOZzg3dKe8w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:aef4db1e-8cf0-4a4a-be83-3bcb11541f2d, IP:0,
 UR
 L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-25
X-CID-META: VersionHash:a9d874c, CLOUDID:5e9e9fa3-0664-4a8c-b108-b4200d63c6eb,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
 0,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
 OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: dcb87744aea411f0ae1e63ff8927bad3-20251022
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1234801540; Wed, 22 Oct 2025 01:39:14 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 22 Oct 2025 01:39:12 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 22 Oct 2025 01:39:12 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Fei Shao <fshao@chromium.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, Paul-PL Chen
 <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH i-g-t v2 0/5] Add MediaTek devices support
Date: Wed, 22 Oct 2025 01:37:48 +0800
Message-ID: <20251021173912.4050926-1-jason-jh.lin@mediatek.com>
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

This patch series is aimed at extending IGT GPU Tools support for
MediaTek devices. The following changes are included:

- Various test case improvements to allow execution on MediaTek SoCs
- MediaTek-specific handling for debugfs, suspend tests, and pixel format
  requirements
- Improvements to EDID parsing and content protection logic for better
  cross-platform compatibility

Change in v2:
1. rebase on 026eddf6f46f2cad65e8638055c68a15f525505f
2. separate patch 5 to 3 patches for different purposes
3. simplify the parsing logic of EDID padding space

Jason-JH Lin (5):
  tests/kms_hdr: Use original 512x512 fb size on devices without scaler
  tests/kms_content_protection: Add "SDC" to HDCP panel blocklist
  tests/kms_content_protection: Exempt outputs with no EDID sink name
  tests/kms_content_protection: Add MediaTek device support for HDCP
    debugfs
  lib/igt_edid: Fix monitor name parsing and trim EDID string padding

 lib/igt_edid.c                 | 11 +++++++++--
 tests/kms_content_protection.c | 11 +++++++++++
 tests/kms_hdr.c                |  6 +++++-
 3 files changed, 25 insertions(+), 3 deletions(-)

-- 
2.43.0

