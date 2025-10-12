Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CB3CCD18D
	for <igt-dev@archiver.kernel.org>; Sun, 12 Oct 2025 17:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE9E10E18C;
	Sun, 12 Oct 2025 17:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="E76Nr0pL";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12AA10E17D
 for <igt-dev@lists.freedesktop.org>; Sun, 12 Oct 2025 17:15:07 +0000 (UTC)
X-UUID: fdabcaeaa78e11f08d9e1119e76e3a28-20251013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=At5roZsp9WlQ0t6X4D5KXbJqXYM5yvcqOfuwD17ZHXg=; 
 b=E76Nr0pLB3rBeS4y/AlxIZaZJeubhXC6dIgcxvvnO2ShoQdUwSWFlFNN9BEIX6SfTI5ANHTKV72sEKI1WDyH7NEh93BBihM4cEkB71w/Uh1RHvrrr4zUakyD40dAvWoFT1k4Ji9RjEXnN9eSjzGE3O9mdB7dKZNL2pFp5Bfpgf4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:740cbc3f-fc2a-401b-a642-ad2e8438654b, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:59074c02-eaf8-4c8c-94de-0bc39887e077,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
 0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fdabcaeaa78e11f08d9e1119e76e3a28-20251013
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2012099813; Mon, 13 Oct 2025 01:15:03 +0800
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
Subject: [PATCH i-g-t 3/6] tests/kms_pipe_crc_basic: Use SUSPEND_TEST_DEVICES
 for MediaTek devices
Date: Mon, 13 Oct 2025 01:13:13 +0800
Message-ID: <20251012171459.3773990-4-jason-jh.lin@mediatek.com>
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

Update suspend test logic to use SUSPEND_TEST_DEVICES instead of
SUSPEND_TEST_NONE if running on MediaTek devices. This change
avoids use of RTC suspend commands that are not supported by MediaTek
platforms, improving test compatibility on MediaTek hardware.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 tests/kms_pipe_crc_basic.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index f1760d577d4e..9750d014cbb1 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -428,10 +428,16 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
 					if (tests[i].flags & TEST_SUSPEND) {
+						enum igt_suspend_test test = SUSPEND_TEST_NONE;
+
 						test_read_crc(&data, pipe, output, 0);
 
+						/* rtcwake cmd is not supported on MTK devices */
+						if (is_mtk_device(data.drm_fd))
+							test = SUSPEND_TEST_DEVICES;
+
 						igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
-									      SUSPEND_TEST_NONE);
+									      test);
 
 						test_read_crc(&data, pipe, output, 0);
 					} else if (tests[i].flags & TEST_HANG) {
-- 
2.43.0

