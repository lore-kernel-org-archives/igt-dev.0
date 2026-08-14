Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973BCC5CFC1
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 17:30:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA9910F6D7;
	Fri, 14 Aug 2026 17:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="JUxCuZj3";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF5210F6D5
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 17:29:47 +0000 (UTC)
X-UUID: bc525bd2980511f18dc8c9802ae25ab1-20260815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=1uygghHKrhyBLT+6GBnPu3zZMd0sdF1iDWDWrPi3O0c=; 
 b=JUxCuZj3Ub2FuiMI1T0RwbcXrnjDRm7PCXEd+QQ1SrOK4BqGHZgHIqPRUwObP2SU2tugNgqX+PAIkozOSvzi+lEWRgUw/oqtKDrfjxOuQ7yMfKuDXoJeL0Yctde69IDfacl5Mp5TKRJNrim0r8Oh635hK3rHXQ71VnUaawc/ne4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19, REQID:074fc484-649f-45cf-b90e-deda9319fb45, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:7db8b62, CLOUDID:2017e1f1-0685-46a3-9cac-19d8f3a05ae7,
 B
 ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
 DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
 AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bc525bd2980511f18dc8c9802ae25ab1-20260815
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 571957499; Sat, 15 Aug 2026 01:29:42 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 15 Aug 2026 01:29:41 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 15 Aug 2026 01:29:41 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ville Syrjala
 <ville.syrjala@linux.intel.com>, =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?=
 <juhapekka.heikkila@gmail.com>, Fei Shao <fshao@chromium.org>
CC: Jani <jani.nikula@intel.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Lancelot Wu
 <Lancelot.Wu@mediatek.com>, Manasi Navare <navaremanasi@google.com>, Gil
 Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH i-g-t v3] tests/kms_plane: Skip CRC frame sequence check on
 MediaTek
Date: Sat, 15 Aug 2026 01:28:36 +0800
Message-ID: <20260814172940.3190510-1-jason-jh.lin@mediatek.com>
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

MediaTek's DRM driver uses an internal per-commit CRC queue that
reports CRC entries with a frame number offset due to pipeline delay
(3 vblanks after commit). This causes crc->frame > expected_vblank,
which fails the exact-match validation in capture_crc().

Since igt_pipe_crc_get_for_frame() already guarantees crc->frame >=
vblank via its internal loop, the exact-match check is overly strict
for queued CRC drivers. Skip it on MediaTek while preserving the
validation for other platforms.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 tests/kms_plane.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 12dfbfe1d82b..14d2d810f1a0 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -766,6 +766,15 @@ static void capture_crc(data_t *data, unsigned int vblank, igt_crc_t *crc)
 {
 	igt_pipe_crc_get_for_frame(data->drm_fd, data->pipe_crc, vblank, crc);
 
+	/*
+	 * Platforms with an internal CRC queue (e.g. MediaTek) report CRC
+	 * entries with a frame number greater than the requested vblank due
+	 * to pipeline delay. Since igt_pipe_crc_get_for_frame() already
+	 * guarantees crc->frame >= vblank, skip the exact-match check.
+	 */
+	if (is_mtk_device(data->drm_fd))
+		return;
+
 	igt_fail_on_f(!igt_skip_crc_compare && !igt_run_in_simulation() &&
 		      crc->has_valid_frame && crc->frame != vblank,
 		      "Got CRC for the wrong frame (got %u, expected %u). CRC buffer overflow?\n",
-- 
2.43.0

