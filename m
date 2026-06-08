Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE03CD8C90
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 02:28:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A4410EC35;
	Mon,  8 Jun 2026 02:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="MKvm/bT6";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BC810EC34
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 02:28:20 +0000 (UTC)
X-UUID: b25faec662e111f18dc8c9802ae25ab1-20260608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=EgFmjvP9EUfemBX07u/zA8OR5ZmC0s8iKdp4hMKo4zk=; 
 b=MKvm/bT6aTZ+Zfii0j5e3nkooqrZ9rY2qskCk0UwA6tTb9tTiu+AmvJ3zY/Oz7eXC9fLX5XCWlvqtAWUcZ/hAqq3a6In5bPQrSsrEADy/klKAMtyhRBpGA1IibotxqyPfVaAdMSzn/lzGtv8N8WC5x8lfe1KuNr61z/6KP7yh68=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15, REQID:0a4ed076-7e5c-474e-8f9e-0608da4dca0d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e276073, CLOUDID:e126f93d-478d-4046-b9e4-1eabacd041e4,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
 15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
 ,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b25faec662e111f18dc8c9802ae25ab1-20260608
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 398068799; Mon, 08 Jun 2026 10:28:12 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Jun 2026 10:28:10 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 8 Jun 2026 10:28:10 +0800
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
Subject: [PATCH i-g-t] tests/kms_plane: Relax CRC frame sequence validation
Date: Mon, 8 Jun 2026 10:27:47 +0800
Message-ID: <20260608022810.48438-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

The capture_crc() function validates that the CRC frame sequence
returned by igt_pipe_crc_get_for_frame() matches the expected value.
The current check uses exact equality (!=), however the library
function igt_pipe_crc_get_for_frame() uses >= comparison internally:

    do {
        read_one_crc(pipe_crc, crc);
        ...
    } while (igt_vblank_before(crc->frame, vblank));

The function loops while crc->frame < vblank, returning the first
CRC where crc->frame >= expected, not necessarily an exact match.

This strict validation can cause test failures on drivers that
report CRC entries with frame sequences larger than expected. This
happens when drivers use internal queuing mechanisms to ensure CRC
values are correctly correlated with their corresponding frames.

Example without internal queue (continuous CRC reporting):
  - Driver generates CRC entries continuously every frame
  - Frame sequence increments sequentially
  - Test finds exact matches for all expected frames → PASS

Example with internal queue (per-commit CRC reporting):
  - Driver queues CRC and reports with current frame sequence
  - Due to queue processing delay, reported sequence > expected
  - For the last CRC, test adds +1 to expected (per IGT logic)
  - Library's >= comparison returns valid CRC
  - capture_crc's != check fails on last frame → FAIL

Relax the validation to use < comparison instead of !=, which:
1. Aligns with igt_pipe_crc_get_for_frame() internal behavior
2. Accepts CRC entries with frame >= expected (valid cases)
3. Still catches real errors where frame < expected, indicating
   CRC buffer overflow or stale data

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 tests/kms_plane.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index f21006784bfc..548506290c9b 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -766,9 +766,13 @@ static void capture_crc(data_t *data, unsigned int vblank, igt_crc_t *crc)
 {
 	igt_pipe_crc_get_for_frame(data->drm_fd, data->pipe_crc, vblank, crc);
 
+	/*
+	 * igt_pipe_crc_get_for_frame uses >= comparison, so we check the same.
+	 * Getting a frame < expected indicates CRC buffer overflow or timing issue.
+	 */
 	igt_fail_on_f(!igt_skip_crc_compare && !igt_run_in_simulation() &&
-		      crc->has_valid_frame && crc->frame != vblank,
-		      "Got CRC for the wrong frame (got %u, expected %u). CRC buffer overflow?\n",
+		      crc->has_valid_frame && crc->frame < vblank,
+		      "Got CRC for the wrong frame (got %u, expected >= %u). CRC buffer overflow?\n",
 		      crc->frame, vblank);
 }
 
-- 
2.43.0

