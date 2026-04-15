Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B85F9D0FB
	for <igt-dev@archiver.kernel.org>; Wed, 15 Apr 2026 01:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DD610E02D;
	Wed, 15 Apr 2026 01:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ouKZbfm7";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A13A10E02D
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Apr 2026 01:51:39 +0000 (UTC)
X-UUID: a18aff9a386d11f19a16598d5ca7f8ec-20260415
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ImKO6w3z7xClejhUlro7vxYiZod8W99sst87rSslW9c=; 
 b=ouKZbfm7TFG3GxUUaMGPw7Dh192g+XBFZo+npSt7ySY35px8rCevBpQEPHc1MyVD4YegepVWG1zRGR+hss2WvLAHMplmtZWCK1b+NQhlo2v6PpR06k3GH0Gs7CIWc40Efg3cg9LIENuhtXNd9jdceSwBLVIopcihdgzkYqZ410E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:192ae331-03a1-467a-9169-0b0bfe0ea546, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:bfa2f194-f8ef-4ca8-bea0-143568f9ca1d,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
 15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
 ,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a18aff9a386d11f19a16598d5ca7f8ec-20260415
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 296331950; Wed, 15 Apr 2026 09:51:33 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 15 Apr 2026 09:51:32 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 15 Apr 2026 09:51:32 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Fei Shao <fshao@chromium.org>
CC: Jani <jani.nikula@intel.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>,
 Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2] tests/kms_invalid_mode: Allow clock-too-high test on
 non-Intel platforms
Date: Wed, 15 Apr 2026 09:51:02 +0800
Message-ID: <20260415015132.2297990-1-jason-jh.lin@mediatek.com>
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

The clock-too-high subtest was being skipped on non-Intel platforms
because igt_get_max_dotclock() returns 0 when reading from
Intel-specific debugfs fails.

This change allows the test to run on all platforms by using -1 as an
invalid clock value when max_dotclock is unavailable. The -1 converts
to UINT_MAX for unsigned int, which clearly exceeds any reasonable
hardware limit and should be rejected by all drivers.

This prevents the test from being marked as IGNORED/SKIP on non-Intel
platforms while maintaining the original test intent of verifying that
drivers properly reject modes with excessively high clock rates.

Tested on MTK platforms where the test now properly executes
and verifies clock validation.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
Suggested-by: Jani Nikula<jani.nikula@intel.com>
---
 tests/kms_invalid_mode.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 5edffb649ef4..78ab965ede91 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -126,7 +126,15 @@ adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode)
 {
 	int max_dotclock = data->max_dotclock;
 
-	igt_require(max_dotclock != 0);
+	/*
+	 * If max_dotclock is unavailable (e.g., non-Intel platforms),
+	 * use -1 as an invalid clock value. This will be converted to
+	 * UINT_MAX, which clearly exceeds any reasonable hardware limit.
+	 */
+	if (max_dotclock == 0) {
+		mode->clock = -1;
+		return true;
+	}
 
 	/*
 	 * FIXME When we have a fixed mode, the kernel will ignore
-- 
2.43.0

