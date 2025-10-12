Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678D3CCD187
	for <igt-dev@archiver.kernel.org>; Sun, 12 Oct 2025 17:15:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEDB10E185;
	Sun, 12 Oct 2025 17:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="m75IBlWZ";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2B310E181
 for <igt-dev@lists.freedesktop.org>; Sun, 12 Oct 2025 17:15:08 +0000 (UTC)
X-UUID: fd4e0aaea78e11f08d9e1119e76e3a28-20251013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=cqHF4EMeDbvBaT453PUCa9bmwm04oTT6iVNewtwtd1s=; 
 b=m75IBlWZ0CTN8TBC+PbxA3XApeDRxkOOLPYMyAfmm242gh/X4dEA/3oMHr2/PbMs3FAlk7NJHrDuaT87yfjyXHMhzBYcJ+y8coO7irG5Mt/HALilKDgY2LXta356ye+wNIzSfwNzS9+JF0JWXJR4ViwT60vWKopPIshRtfJwsz0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:18d21da1-32a6-45c6-9c91-1f89b6735c66, IP:0,
 UR
 L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:-5
X-CID-META: VersionHash:a9d874c, CLOUDID:20ca13b9-795c-4f99-91f3-c115e0d49051,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
 0,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
 OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fd4e0aaea78e11f08d9e1119e76e3a28-20251013
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2025081928; Mon, 13 Oct 2025 01:15:02 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 13 Oct 2025 01:14:59 +0800
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
Subject: [PATCH i-g-t 0/6] Add MediaTek devices support
Date: Mon, 13 Oct 2025 01:13:10 +0800
Message-ID: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
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

Jason-JH Lin (6):
  tests/kms_hdr: Use original 512x512 fb size on devices without scaler
  tests/kms_plane: Add support for planar-settings on non-Intel devices
  tests/kms_pipe_crc_basic: Use SUSPEND_TEST_DEVICES for MediaTek
    devices
  lib/igt_kms: Add support for mtk_current_bpc debugfs in bpc-switch
    test
  tests/kms_content_protection: Add MediaTek device support
  lib/igt_edid: Fix monitor name parsing and trim EDID string padding

 lib/igt_edid.c                 | 13 ++++++++++---
 lib/igt_kms.c                  |  2 ++
 tests/kms_content_protection.c | 11 +++++++++++
 tests/kms_hdr.c                |  6 +++++-
 tests/kms_pipe_crc_basic.c     |  8 +++++++-
 tests/kms_plane.c              |  8 +++++---
 6 files changed, 40 insertions(+), 8 deletions(-)

-- 
2.43.0

