Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D5FCCD18D
	for <igt-dev@archiver.kernel.org>; Sun, 12 Oct 2025 17:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC4E10E181;
	Sun, 12 Oct 2025 17:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="slzchRvh";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D035510E185
 for <igt-dev@lists.freedesktop.org>; Sun, 12 Oct 2025 17:15:08 +0000 (UTC)
X-UUID: fd857250a78e11f08d9e1119e76e3a28-20251013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1D1vssRIvbaoXfPfhbO7JItUW1+1f3EEGIErl5PBMPo=; 
 b=slzchRvhJwQKTs0I5BfL7lcjYk/k7yyQ+UlAtCGANctNHp57h89TNEnoa6BNyttb6NZFf2ya7bxu5xIZVPxovtJjc9AUOwBmd6MXXG7E/j7MAckZiGUcthTicc+AdyAe0++iyihL/PK33PvMaHlVygSlHj6YTm9iflohbAKIFvI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:c263c488-410c-4307-a949-bdfb9b45b6db, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:0e9cf750-c509-4cf3-8dc0-fcdaad49a6d3,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
 0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fd857250a78e11f08d9e1119e76e3a28-20251013
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1143233325; Mon, 13 Oct 2025 01:15:02 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
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
Subject: [PATCH i-g-t 2/6] tests/kms_plane: Add support for planar-settings on
 non-Intel devices
Date: Mon, 13 Oct 2025 01:13:12 +0800
Message-ID: <20251012171459.3773990-3-jason-jh.lin@mediatek.com>
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

Add an is_intel_device() check before invoking Intel-specific
requirements in the planar-settings test.
This allows the test to run on non-Intel devices by skipping
Intel-only pixel format settings checks.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 tests/kms_plane.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index f7b672c7a01e..8dac41b24b33 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1256,9 +1256,11 @@ static void test_planar_settings(data_t *data)
 	 * changed to if(..)
 	 */
 	igt_require_f(data->display.is_atomic, "Atomic mode-set not supported\n");
-	igt_require_intel(data->drm_fd);
-	devid = intel_get_drm_devid(data->drm_fd);
-	igt_require(intel_display_ver(devid) >= 9);
+	if (is_intel_device(data->drm_fd)) {
+		igt_require_intel(data->drm_fd);
+		devid = intel_get_drm_devid(data->drm_fd);
+		igt_require(intel_display_ver(devid) >= 9);
+	}
 
 	output = igt_get_single_output_for_pipe(&data->display, pipe);
 	igt_require(output);
-- 
2.43.0

