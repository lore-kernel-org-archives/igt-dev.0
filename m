Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C47CDB466
	for <igt-dev@archiver.kernel.org>; Sun, 21 Jun 2026 08:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE32510E23A;
	Sun, 21 Jun 2026 08:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="d4asZWOI";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B043F10E23A
 for <igt-dev@lists.freedesktop.org>; Sun, 21 Jun 2026 08:44:53 +0000 (UTC)
X-UUID: 75d299ca6d4d11f1b1788b6acf885367-20260621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=kDEN0c9gT+wWl95pvULe7sAPnW5CIUnmxX/1wd+KRSY=; 
 b=d4asZWOI4laxJEiVE5ntl4Wl9+pcX7uJ/kN/J1l9yaovW+BNE2Bz3iFNloPs5PVbqyNH9xbzVldPXQ2D8AKsvaXWUNwl/N/fxOloM8v4RB3VOLoYKBvFppalJWoPDaEcGqIPuevlZaDWl/KXSTx/QITjMXnrDZOSAaKY2XM1RX0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17, REQID:e21c0087-35f8-4db1-b69e-c1065e279b09, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
 ION:release,TS:-50
X-CID-META: VersionHash:d497b38, CLOUDID:ea6b58a5-9ef7-4489-861a-e83b251ece46,
 B
 ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50,EDM:
 2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0
 ,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 75d299ca6d4d11f1b1788b6acf885367-20260621
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 218238913; Sun, 21 Jun 2026 16:44:48 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 21 Jun 2026 16:44:46 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sun, 21 Jun 2026 16:44:46 +0800
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
Subject: [PATCH i-g-t v2 0/2] Add CPU idle state control for accurate vblank
 timing
Date: Sun, 21 Jun 2026 16:43:26 +0800
Message-ID: <20260621084445.614024-1-jason-jh.lin@mediatek.com>
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

This series adds a new subtest "basic-no-cpu-idle" to kms_setmode for
platforms that lack get_scanout_position() implementation.

Background:
On platforms without get_scanout_position() support, vblank timestamps
are captured at IRQ handler entry time without scanline-based correction.
When CPU enters deep sleep states (C2+), the wakeup latency (~150us) can
cause timestamp jitter that exceeds the 1-scanline accuracy threshold,
resulting in test failures.
This issue was observed on MediaTek platforms where single-CRTC tests
had high failure rates (~50-80%) due to CPU entering deep sleep between
vblank IRQs, while dual-CRTC tests passed consistently because the
staggered IRQs kept CPU more active.

Solution:
Rather than modifying the existing "basic" test (which would hide a real
issue), this series adds:

1. A general API in lib/igt_pm to control CPU idle states
2. A new "basic-no-cpu-idle" subtest that:
   - Disables deep CPU sleep before running timing verification
   - Gracefully skips on platforms without CPU idle control support
   - Allows platforms to verify timestamp implementation correctness,
     separate from CPU idle interference

This approach will not hide bugs by modifying existing tests, but instead
provide separate test results:
- "basic": Shows real-world behavior (may fail due to CPU idle)
- "basic-no-cpu-idle": Verifies timestamp accuracy without interference

Once get_scanout_position() is implemented, timestamps will be accurately
compensated regardless of CPU idle states, making both tests pass.

---

Change in V2:
1. Move CPU idle control APIs from lib/igt_kms to lib/igt_pm
2. Add a new subtest instead of modifying existing tests

---

Jason-JH Lin (2):
  lib/igt_pm: Add CPU idle state control for vblank timing stability
  tests/kms_setmode: Add basic-no-cpu-idle subtest

 lib/igt_pm.c        | 75 +++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_pm.h        |  2 ++
 tests/kms_setmode.c | 32 +++++++++++++++++++
 3 files changed, 109 insertions(+)

-- 
2.43.0

