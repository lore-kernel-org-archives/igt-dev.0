Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334251067034
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 14:15:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB4410EA24;
	Thu, 12 Mar 2026 14:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="fX/hxFEC";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43BB10EA24
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 14:15:50 +0000 (UTC)
X-UUID: f5ea6c201e1d11f1a02d4725871ece0b-20260312
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=oRWb8x0yLU+uPHDjEazJ2WQqSdEZn/mnpE8utchXJ4I=; 
 b=fX/hxFECNUjdRUa+d0YnyXLq7xAF7eJkl5GdCFu+LVCocqT4oMQfvfrRkeYSM8GqIpU4pXf5IwRlF/Rt21xIAJ4It/3Qnf4WzfbZloN0PMy9YP+9R8F0OGH86PiLRtNm1eWnhuk+hBxvWJrfnc4pEwJbi0cRADb+f4VVkEhqHSM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:4369ce72-e430-49e2-91af-39990cf75240, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:1fb5eff9-dfaf-419f-9dd3-d093c7e8f968,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
 0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
 :0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f5ea6c201e1d11f1a02d4725871ece0b-20260312
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 175959316; Thu, 12 Mar 2026 22:15:45 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Mar 2026 22:15:44 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Mar 2026 22:15:43 +0800
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
Subject: [PATCH i-g-t v2] tests/kms_plane: Add vblank waits for MediaTek CRC
 timing
Date: Thu, 12 Mar 2026 22:15:14 +0800
Message-ID: <20260312141541.2333628-1-jason-jh.lin@mediatek.com>
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

On MediaTek hardware, CRC generation requires additional time to
stabilize after certain operations. This patch adds targeted vblank
waits for two specific scenarios:

1. Pixel format changes: After a format change in
   capture_format_crcs_single(), the CRC hardware needs at least one
   vblank to generate valid CRC values for the new format. Without
   this wait, tests may read stale or transitional CRC values.

2. Cursor plane updates: In test_plane_position_with_output(), cursor
   plane updates are non-blocking on MediaTek hardware. A vblank wait
   ensures the CRC reflects the updated plane configuration.

These waits are guarded by is_mtk_device() checks to avoid affecting
other platforms.

Fixes failures in:
- pixel-format: CRC mismatch due to reading before format stabilization
- plane-position-hole: pipe-A-plane-3 failures with cursor plane

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 tests/kms_plane.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 6a78c9ff0941..d9cd04e6a3c5 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -351,6 +351,14 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
 
 	igt_display_commit(&data->display);
 
+	/*
+	 * On MediaTek hardware, cursor plane updates are non-blocking and
+	 * CRC needs time to reflect the new plane configuration. Wait for
+	 * a vblank to ensure the update has taken effect.
+	 */
+	if (is_mtk_device(data->drm_fd) && sprite->type == DRM_PLANE_TYPE_CURSOR)
+		igt_wait_for_vblank(crtc);
+
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
 	igt_assert_crc_equal(reference_crc, &crc);
 
@@ -760,6 +768,14 @@ static void capture_format_crcs_single(data_t *data, igt_crtc_t *crtc,
 
 	igt_remove_fb(data->drm_fd, &old_fb);
 
+	/*
+	 * On MediaTek hardware, CRC generation needs time to stabilize after
+	 * a pixel format change. Wait for at least one vblank to ensure the
+	 * CRC hardware has updated for the new format.
+	 */
+	if (is_mtk_device(data->drm_fd))
+		igt_wait_for_vblank(crtc);
+
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc[0]);
 }
 
-- 
2.43.0

