Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A5FCD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 06:47:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC65610E084;
	Wed, 20 May 2026 06:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="joPTnIc8";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A41110E084
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 06:46:57 +0000 (UTC)
X-UUID: aff6d566541711f1b5a00d44d12bea5a-20260520
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=aDasiSiMgg1uxb3NV5wD3mmd5gD5UU/WgoHLn8IrCCM=; 
 b=joPTnIc8lvL3aEvJKGKT0bIwThaQSmRQ6dYDCufLdGjzJIrby0AwfvLOaNkWP0S+tF5K3eQsUs75ihyDQ7wh53KDRS8VAsZFuXwvRVCkqzT99wzigxiAWIN9zASaGP4WtB0TIqE1i0ohKnthLXP92rBH5aXekXVxcG6MSdRpLqc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14, REQID:5e241e42-0563-4bd6-b67c-4b32b4215374, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:9091e75, CLOUDID:02812746-e650-4d81-a877-d298d8f44b5d,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
 ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
 ,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: aff6d566541711f1b5a00d44d12bea5a-20260520
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 948337206; Wed, 20 May 2026 14:46:53 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 20 May 2026 14:46:52 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 20 May 2026 14:46:52 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ville Syrjala
 <ville.syrjala@linux.intel.com>, Fei Shao <fshao@chromium.org>
CC: Jani <jani.nikula@intel.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, Manasi Navare
 <navaremanasi@google.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH i-g-t 2/2] tests/kms_setmode: Disable CPU deep sleep for
 accurate vblank timestamps
Date: Wed, 20 May 2026 14:46:26 +0800
Message-ID: <20260520064651.3266598-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260520064651.3266598-1-jason-jh.lin@mediatek.com>
References: <20260520064651.3266598-1-jason-jh.lin@mediatek.com>
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

Use igt_disable_cpu_deep_sleep() to prevent CPU wakeup latency that
affects vblank timestamp acquisition.

This addresses vblank timing stability issues on MediaTek platforms
where CPU entering idle states can cause ~200us timestamp jitter and
test failures.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 tests/kms_setmode.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 1f2849bc26cf..40e79ab95ae7 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -1060,6 +1060,9 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 		igt_require(drm_resources);
 
 		max_dotclock = igt_get_max_dotclock(drm_fd);
+
+		/* Disable CPU deep sleep to ensure stable vblank timing */
+		igt_disable_cpu_deep_sleep(drm_fd, true);
 	}
 
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
@@ -1075,6 +1078,9 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture() {
+		/* Restore CPU idle states */
+		igt_disable_cpu_deep_sleep(drm_fd, false);
+
 		drmModeFreeResources(drm_resources);
 		drm_close_driver(drm_fd);
 	}
-- 
2.43.0

