Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F40C624A4
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 07:41:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCB610F452;
	Thu,  3 Sep 2026 07:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="QCRpKOqk";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C498310E51D
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 07:39:31 +0000 (UTC)
X-UUID: 980d0974a76a11f1b1788b6acf885367-20260903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=SWox4jEIFGv0Zo/iLliJB3Qd1GkQammlMCDqUZ/iKRQ=; 
 b=QCRpKOqkviFTRpb3arqyygIh4sGnZIxuquMOxX1AEEii8yfbuKhyAdJ72bVV+KyIsI3GUH+nyGOd13YVjeA9QDcvxpOmC5uFcVWsoqM2anHQREOCh7dvj7VYRPAR9u2aJFgoZmagN7jV6f6EZGT5E2KcZ4upYBQXBXmtUjYEIAI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19, REQID:9b6fd786-38c3-4dbb-91e0-b31010c14b70, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:7db8b62, CLOUDID:29c57423-5869-48e3-bf78-b0f483615649,
 B
 ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
 0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
 OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 980d0974a76a11f1b1788b6acf885367-20260903
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <xiandong.wang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 750193933; Thu, 03 Sep 2026 15:39:28 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 3 Sep 2026 15:39:27 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 3 Sep 2026 15:39:26 +0800
From: Xiandong Wang <xiandong.wang@mediatek.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, Xiandong Wang
 <xiandong.wang@mediatek.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Xiandong Wang
 <xiandong.wang@mediatek.corp-partner.google.com>
Subject: [PATCH i-g-t v1] tests/kms_atomic_transition: Skip blocking
 transitions on MTK
Date: Thu, 3 Sep 2026 15:38:30 +0800
Message-ID: <20260903073900.7877-2-xiandong.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260903073900.7877-1-xiandong.wang@mediatek.com>
References: <20260903073900.7877-1-xiandong.wang@mediatek.com>
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

From: Xiandong Wang <xiandong.wang@mediatek.corp-partner.google.com>

MTK blocking atomic transition commits do not satisfy the immediate page-flip event or out-fence completion check used by this test.

Keep the nonblocking transition variants enabled and skip only the blocking transition variants on MTK. The separate modeset transition tests remain enabled.

This is a temporary test limitation until blocking atomic transition completion is supported by the MTK DRM driver.

---
 tests/kms_atomic_transition.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 37dc77c28..a05a98575 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1288,6 +1288,10 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 		igt_describe(transition_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", transition_tests[i].name) {
+			igt_skip_on_f(is_mtk_device(data.drm_fd) &&
+				      !transition_tests[i].nonblocking,
+				      "MTK blocking atomic transition is currently unsupported\n");
+
 			pipe_count = 0;
 
 			for_each_crtc_with_valid_output(&data.display, crtc,
-- 
2.45.2

