Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50768C5CFCF
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 16:15:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F149F10ECBA;
	Tue, 11 Aug 2026 16:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="gxF1Cy+6";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1E510E330
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2026 16:14:23 +0000 (UTC)
X-UUID: b4bfa96e959f11f1b1788b6acf885367-20260812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=jZLJ2aswHiqu6bu1yts88ZdzJuxMAxwXxqSJBMWeK7E=; 
 b=gxF1Cy+6UeWAeWEJFTmqEf+Omj7+M5DwPVnTmHLBeTcKR6ngQBX6VBGXYKRoahCClq8zqOOx6LdUOww1yb8OZ+0sVUhEJof58SdsgLyEiQCRpUnnLzoM7fmyPJxwD28b8dHLOsq6NNQcXjVtX3k1fCnB3G/52nXr5Y+zzm88GaY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19, REQID:98a90c80-8f96-49cc-8aa3-4c8fcd39885d, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:7db8b62, CLOUDID:f791e5a7-8a7b-4c49-a0c0-42d13e7adac0,
 B
 ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
 DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
 AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b4bfa96e959f11f1b1788b6acf885367-20260812
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1558564144; Wed, 12 Aug 2026 00:14:18 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 12 Aug 2026 00:14:17 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 12 Aug 2026 00:14:17 +0800
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
Subject: [PATCH i-g-t v2] tests/kms_plane: Remove redundant CRC frame sequence
 check
Date: Wed, 12 Aug 2026 00:14:00 +0800
Message-ID: <20260811161417.716771-1-jason-jh.lin@mediatek.com>
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

The capture_crc() function validated that the CRC frame sequence
returned by igt_pipe_crc_get_for_frame() matches the expected value.
However, igt_pipe_crc_get_for_frame() already guarantees
crc->frame >= expected via its internal loop:

    do {
        read_one_crc(pipe_crc, crc);
    } while (igt_vblank_before(crc->frame, vblank));

The additional check in capture_crc() is therefore redundant.
Remove it and rely on the library's existing guarantee.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 tests/kms_plane.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 12dfbfe1d82b..fe8ee2ab26ab 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -765,11 +765,6 @@ static int num_unique_crcs(const igt_crc_t crc[], int num_crc)
 static void capture_crc(data_t *data, unsigned int vblank, igt_crc_t *crc)
 {
 	igt_pipe_crc_get_for_frame(data->drm_fd, data->pipe_crc, vblank, crc);
-
-	igt_fail_on_f(!igt_skip_crc_compare && !igt_run_in_simulation() &&
-		      crc->has_valid_frame && crc->frame != vblank,
-		      "Got CRC for the wrong frame (got %u, expected %u). CRC buffer overflow?\n",
-		      crc->frame, vblank);
 }
 
 static void capture_format_crcs_single(data_t *data, igt_crtc_t *crtc,
-- 
2.43.0

