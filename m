Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69372ED7B98
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 10:11:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1241610E569;
	Tue, 14 Apr 2026 10:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Rp+l4BWi";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C516B10E569
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 10:11:14 +0000 (UTC)
X-UUID: 42982dc437ea11f1ae70033691e9ac7d-20260414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Bi4k03Wb8/32qxnrewTvRmZHa+H/Slivm41vqPug4Bg=; 
 b=Rp+l4BWi4ZH/wX+pa2euV458uRi6XEmBwXP2rGxMvVM3MmF4sEjJTAs3O5ekuWT5YLrCOfzPo6rw5QwJbCWH/GRE74il+GHbWIUmmHwyIpisxd/+IoPJM+rktPjjNi1OnxTicuhUKN/5PYLbztK2IDpKUIQ8hZ0Keiyi9ZHkkzs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:098b2c35-2c12-415a-a5dc-87eb617887da, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:78a1688f-6df4-4a3d-a7a4-fbdc42d669ce,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
 15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
 ,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 42982dc437ea11f1ae70033691e9ac7d-20260414
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1220182007; Tue, 14 Apr 2026 18:11:10 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 14 Apr 2026 18:11:09 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 14 Apr 2026 18:11:09 +0800
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
Subject: [PATCH i-g-t] tests/kms_invalid_mode: Allow clock-too-high test on
 non-Intel platforms
Date: Tue, 14 Apr 2026 18:10:54 +0800
Message-ID: <20260414101108.1920755-1-jason-jh.lin@mediatek.com>
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

This change allows the test to run on all platforms by:
- Using a clearly invalid clock value (10 GHz) when max_dotclock is
  unavailable, which any reasonable driver should reject
- Restricting bigjoiner/ultrajoiner logic to Intel devices only

This prevents the test from being marked as IGNORED/SKIP on non-Intel
platforms while maintaining the original test intent of verifying that
drivers properly reject modes with excessively high clock rates.

Tested on MTK platforms where the test now properly executes and
verifies invalid clock validation.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 tests/kms_invalid_mode.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 5edffb649ef4..18d79e59c736 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -126,7 +126,13 @@ adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode)
 {
 	int max_dotclock = data->max_dotclock;
 
-	igt_require(max_dotclock != 0);
+	/*
+	 * If max_dotclock is unavailable (e.g., non-Intel platforms),
+	 * use an obviously invalid value that any driver should reject.
+	 * 10 GHz is well beyond any reasonable hardware capability.
+	 */
+	if (max_dotclock == 0)
+		max_dotclock = 10000000;  /* 10 GHz in kHz */
 
 	/*
 	 * FIXME When we have a fixed mode, the kernel will ignore
@@ -139,21 +145,23 @@ adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode)
 	if (has_scaling_mode_prop(data))
 		return false;
 
-	/*
-	 * Newer platforms can support modes higher than the maximum dot clock
-	 * by using pipe joiner, so set the mode clock twice that of maximum
-	 * dot clock;
-	 */
-	if (can_bigjoiner(data)) {
-		igt_info("Platform supports bigjoiner with %s\n",
-			 data->output->name);
-		max_dotclock *= 2;
-	}
+	if (is_intel_device(data->drm_fd)) {
+		/*
+		 * Newer platforms can support modes higher than the maximum dot clock
+		 * by using pipe joiner, so set the mode clock twice that of maximum
+		 * dot clock;
+		 */
+		if (can_bigjoiner(data)) {
+			igt_info("Platform supports bigjoiner with %s\n",
+				 data->output->name);
+			max_dotclock *= 2;
+		}
 
-	if (can_ultrajoiner(data)) {
-		igt_info("Platform supports ultrajoiner with %s\n",
-			 data->output->name);
-		max_dotclock *= 4;
+		if (can_ultrajoiner(data)) {
+			igt_info("Platform supports ultrajoiner with %s\n",
+				 data->output->name);
+			max_dotclock *= 4;
+		}
 	}
 
 	mode->clock = max_dotclock + 1;
-- 
2.43.0

