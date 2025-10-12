Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FD9CCD184
	for <igt-dev@archiver.kernel.org>; Sun, 12 Oct 2025 17:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F6310E183;
	Sun, 12 Oct 2025 17:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="tYhctvOT";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0105210E181
 for <igt-dev@lists.freedesktop.org>; Sun, 12 Oct 2025 17:15:07 +0000 (UTC)
X-UUID: fd4f42e8a78e11f08d9e1119e76e3a28-20251013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=GeYBBQSLBusDS1Ksw8LzHXgTJSl8NzcaTZjhWCoMorA=; 
 b=tYhctvOTtSg9F+3S9w6ldp9z0xO/GEzSHdW6L4ZNgzLO0bcAueDL4lDKGpBCxh335loYMI1HQTedsn/wY4Hsnsr+7CuXcrAgOuUkGKapYOoPEHrypaYcc+5aETdf8jMDD+Z0S1pQJJHbnx086lhMajZNYu4H9sGcwOkFU/NNy64=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:3620e1bb-54a9-42e7-b63f-aac3227911fb, IP:0,
 UR
 L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:-5
X-CID-META: VersionHash:a9d874c, CLOUDID:0f9cf750-c509-4cf3-8dc0-fcdaad49a6d3,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
 0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fd4f42e8a78e11f08d9e1119e76e3a28-20251013
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 795096730; Mon, 13 Oct 2025 01:15:02 +0800
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
Subject: [PATCH i-g-t 1/6] tests/kms_hdr: Use original 512x512 fb size on
 devices without scaler
Date: Mon, 13 Oct 2025 01:13:11 +0800
Message-ID: <20251012171459.3773990-2-jason-jh.lin@mediatek.com>
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

Ensure devices without scaler retain the original 512x512 framebuffer
size during plane setup. Previously, all outputs were set to display
resolution size, which may not be supported on devices lacking scaler.
For such hardware, always use 512x512, matching the initial framebuffer
creation, to improve test reliability.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 tests/kms_hdr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 33b6c42a65fb..9c2a91f01e71 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -203,7 +203,11 @@ static void test_bpc_switch_on_output(data_t *data, enum pipe pipe,
 	 * smaller plane size in following tests.
 	 */
 	igt_plane_set_fb(data->primary, &afb);
-	igt_plane_set_size(data->primary, data->w, data->h);
+	if (get_num_scalers(display, pipe) >= 1)
+		igt_plane_set_size(data->primary, data->w, data->h);
+	else
+		igt_plane_set_size(data->primary, 512, 512);
+
 	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
 	if (!ret) {
 		data->w = afb.width;
-- 
2.43.0

