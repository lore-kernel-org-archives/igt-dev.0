Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A1EFF4936
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 03:22:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B56310E101;
	Mon, 30 Mar 2026 03:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="iDdE+i1x";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA0D10E0DD
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 03:22:14 +0000 (UTC)
X-UUID: a17e41c02be711f19a16598d5ca7f8ec-20260330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=i6Almx8jcRMAhNjYSysPelyxUBemt1r+lrx4LzxntS0=; 
 b=iDdE+i1x2yVgWI22oR+V95Emj7yOoq7TOFP/1Pw9BAJXgqHJsDfAdsAC8bwJNTRrhR1rLnbtWOorXyZMsnJN9CMMW4mAd+TuyM76xwggikMtbbRHjApai+HmyvNcTlnHGqIpkYpkDym9jp/lFg8OsXaCM/PLtekynd4F9BLeazI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:59c42db9-a3a0-4b2a-81d1-dbd9d166b0df, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:e7bac3a, CLOUDID:f588d68e-6df4-4a3d-a7a4-fbdc42d669ce,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
 0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
 :0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a17e41c02be711f19a16598d5ca7f8ec-20260330
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 7020029; Mon, 30 Mar 2026 11:22:07 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 30 Mar 2026 11:22:05 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 30 Mar 2026 11:22:05 +0800
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
Subject: [PATCH i-g-t v5 0/3] Optimize framebuffer management
Date: Mon, 30 Mar 2026 11:20:38 +0800
Message-ID: <20260330032205.467130-1-jason-jh.lin@mediatek.com>
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

Refactor framebuffer management to improve reusability:
- Create framebuffers once per CRTC at test initialization via
  create_fbs() and reuse them across all subtests
- Centralize cleanup in remove_fbs() called at test fixture end
- Use per-CRTC framebuffer array (data.fbs[IGT_MAX_PIPES]) indexed
  by crtc->crtc_index instead of single global framebuffers

Each framebuffer is created with the actual resolution of the first
output that can connect to that CRTC, avoiding buffer size mismatch
issues (e.g., 3504x2190 panel incorrectly using 3840x2160 buffer).

For MST tests, multiple outputs share bandwidth and may require mode
override to fit within bandwidth constraints. When mode override
changes the resolution, properly detach planes before removing the
existing framebuffers, then recreate them with the new dimensions.

---

Change in v5:
1.Split the commit v4 into 3 logical patches for easier bisecting
2.Remove output_get_driving_crtc_assert() helper function and use
igt_output_get_driving_crtc() directly without assertions
3.Remove the unnecessary CRTC index check in igt_main()

---

Jason-JH Lin (3):
  tests/kms_content_protection: Add per-CRTC framebuffer infrastructure
  tests/kms_content_protection: Pass crtc parameter and use per-CRTC FBs
  tests/kms_content_protection: Add FB cleanup for MST tests

 tests/kms_content_protection.c | 168 ++++++++++++++++++++++++---------
 1 file changed, 121 insertions(+), 47 deletions(-)

-- 
2.43.0

