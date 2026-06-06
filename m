Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC70CD8C8E
	for <igt-dev@archiver.kernel.org>; Sat,  6 Jun 2026 09:07:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413D310E245;
	Sat,  6 Jun 2026 09:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="bDo6oSqZ";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF35D10E633
 for <igt-dev@lists.freedesktop.org>; Sat,  6 Jun 2026 09:07:03 +0000 (UTC)
X-UUID: 1030c294618711f1b1788b6acf885367-20260606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=njc18WEnFMFTlmEYjQky7DZAaiEn6+7Z1AXXtyHym3Y=; 
 b=bDo6oSqZfq+JVvZXzz+ubd9Hyyxm6RDxoh3YJBefq7xhxJ1skPQS6OisabRYO2wegeQK+YbdJXj9Z31CxpBaF9+RHfFJYYfE+UzBdIww3t/CA9yHauozDDQF2wajJkeav5s0Xey5WENUmyaXkbqwTXoHYLLDUD2z+yEkxeD/3xQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15, REQID:740ecd71-9eab-4920-bfd3-9fbe9aad92cb, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e276073, CLOUDID:23af2b50-23b6-41e0-a310-51c498ab6908,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|136|836|865|888|898,TC:-5,Conten
 t:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,O
 SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1030c294618711f1b1788b6acf885367-20260606
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <jay.liu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 859782042; Sat, 06 Jun 2026 17:06:54 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 6 Jun 2026 17:06:53 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 6 Jun 2026 17:06:52 +0800
From: Jay Liu <jay.liu@mediatek.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, Paul-PL Chen
 <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>, Sharma Swati2 <swati2.sharma@intel.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jay Liu
 <jay.liu@mediatek.com>
Subject: [PATCH i-g-t v5 0/1] tests/kms_color: Add 10-bit color depth support
 to gamma test for MediaTek
Date: Sat, 6 Jun 2026 17:05:35 +0800
Message-ID: <20260606090557.8879-1-jay.liu@mediatek.com>
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

Change in v5:
- Fix typo in comment: s/Medaitek/MediaTek
- Fix comment formatting: s/0xFFFD0/0xffd0 and add space before "which"
- Simplify depth_10bit initialization: bool depth_10bit = is_mtk_device(data->drm_fd)
- Remove redundant if statement that set depth_10bit
- Improve commit message to explain "why" MediaTek requires these changes:
  * Why 10-bit color depth is needed (bit-accurate validation without precision loss)
  * Why LUT maximum is set to 0xffd0 instead of 0xffff (hardware mapping behavior)

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

 tests/kms_color.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

-- 
2.45.2

