Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FDBC43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 01:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F35910E6A2;
	Mon, 29 Jun 2026 01:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="BVLNO/s2";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463E110E6A2
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 01:54:19 +0000 (UTC)
X-UUID: 6de578e8735d11f18dc8c9802ae25ab1-20260629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=7dMGv2omqRYqgJIw73qelK6jpVXzSt1dIHTFqV/zXMw=; 
 b=BVLNO/s21t+uBeA1N64E0fM/rR/d63P8A2p9Bvc+5yaw3K7dhTEejylCUMa4P/r4fdarfuGCd4Y1vZHtYxAmLT8CX9Dsef5khqhP86duNUalM19sGLk6iKCOEFq0efJBh5YxNVsRoJJJeNnBzff5m0sB1/s1ymCWlxLEi69tfFI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17, REQID:783b496a-2e13-40bc-a7ab-6fd8ae6b6452, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:d497b38, CLOUDID:82993bee-45e6-4692-a476-3f71842ee83b,
 B
 ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50,EDM:
 -3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:
 0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6de578e8735d11f18dc8c9802ae25ab1-20260629
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2062652263; Mon, 29 Jun 2026 09:54:13 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 29 Jun 2026 09:54:12 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 29 Jun 2026 09:54:12 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ville Syrjala
 <ville.syrjala@linux.intel.com>, Fei Shao <fshao@chromium.org>
CC: Jani <jani.nikula@intel.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Lancelot Wu
 <Lancelot.Wu@mediatek.com>, Manasi Navare <navaremanasi@google.com>, Gil
 Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH i-g-t] tests/kms_content_protection: Skip MST outputs in
 SST-style tests
Date: Mon, 29 Jun 2026 09:53:55 +0800
Message-ID: <20260629015411.32130-1-jason-jh.lin@mediatek.com>
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

MST (Multi-Stream Transport) outputs require topology-wide HDCP
authentication which is handled by dedicated dp-mst-* subtests.
Running SST-style tests on MST outputs can cause issues because:

1. MST HDCP authentication involves the entire topology (hub + monitors)
2. Per-connector HDCP state management differs from SST
3. The dp-mst-lic-type-0/1 subtests are specifically designed to test
   MST HDCP scenarios

Skip MST outputs in get_hdcp_outputs() when running non-MST subtests
to ensure proper test isolation.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 tests/kms_content_protection.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index d931ce7682be..9d1728ed82a6 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -751,6 +751,11 @@ static int get_hdcp_outputs(igt_display_t *display, int content_type,
 			continue;
 		}
 
+		if (igt_get_dp_mst_connector_id(output) >= 0) {
+			igt_info("Skipping HDCP test on %s, MST output should use dp-mst-* tests\n",
+				 output->name);
+			continue;
+		}
 
 		if (count < MAX_HDCP_OUTPUTS)
 			hdcp_outputs[count++] = output;
-- 
2.43.0

