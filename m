Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8700C61DD3
	for <igt-dev@archiver.kernel.org>; Fri,  4 Sep 2026 02:00:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B97710F807;
	Fri,  4 Sep 2026 02:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="GD2DpSiu";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945A310F3A4
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Sep 2026 01:59:33 +0000 (UTC)
X-UUID: 3ec8bbfca80411f1b1788b6acf885367-20260904
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bJTOFBFTUqnNbXtBnrF0VV1Jouo9Ds5gf4HfKoSxfPU=; 
 b=GD2DpSiuhY+HddVgM530s4uVY4BybNkr8ghQqxwQiG+qPXtvvDEYpwnVhWVAowTHxYwKih5mMK7K0MEM5gsrxDfDowGfEcrm81JXiQyWgxhdxdMi7SyOCQNzGb6oVzP8oEZiyK2KigY/XU0nEUZ4hp4rKmJgNBCTWgUUkLGlyi0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19, REQID:f9cbee82-4a73-467f-b362-0a5f77b564ef, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:7db8b62, CLOUDID:a3b56b96-8382-4d0c-b42c-b0965a0d23b4,
 B
 ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
 0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
 OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3ec8bbfca80411f1b1788b6acf885367-20260904
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <xiandong.wang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1398952747; Fri, 04 Sep 2026 09:59:21 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 4 Sep 2026 09:59:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 4 Sep 2026 09:59:19 +0800
From: Xiandong Wang <xiandong.wang@mediatek.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, Xiandong Wang
 <xiandong.wang@mediatek.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH i-g-t v2] tests/kms_atomic_transition: Skip blocking
 transitions on MTK
Date: Fri, 4 Sep 2026 09:58:54 +0800
Message-ID: <20260904015911.19651-2-xiandong.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260904015911.19651-1-xiandong.wang@mediatek.com>
References: <20260904015911.19651-1-xiandong.wang@mediatek.com>
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

MTK blocking atomic transition commits do not satisfy the
immediate page-flip event or out-fence completion check used by
this test.

Keep nonblocking transition variants enabled and skip only the
blocking transition variants on MTK. The separate modeset
transition tests remain enabled.

This is a temporary test limitation until blocking atomic
transition completion is supported by the MTK DRM driver.
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

