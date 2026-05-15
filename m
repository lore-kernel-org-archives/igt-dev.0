Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6A6CD343F
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 07:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485CD10F445;
	Fri, 15 May 2026 07:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="WD3TjbGX";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671A710E099
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 07:29:44 +0000 (UTC)
X-UUID: d3683878502f11f1a3561939bc42ff46-20260515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qcQOr0v7iJjSGW6wcl0aV9h5uZfTaPMroDUXhSOeGYQ=; 
 b=WD3TjbGX+jd2SF5tLNgQ2yVecPQAlH6GCjgX4/22OiO73p56Bi86yhq813g2xPSo1+Q6p9u4nBwQ/zMrNhGVNhedoHRS3h5pOsGyijioq+xJ4oCcMoJwxCYDCxwQOHx6N0UtTiX6B2oRVKI3yGsFaijIJmwMeBmd64u2wcbToFE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14, REQID:36865833-4371-4cab-a10e-1cc3d5058779, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:9091e75, CLOUDID:4da962e1-02d4-4065-accc-97789b7ab0e5,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
 ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
 ,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d3683878502f11f1a3561939bc42ff46-20260515
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1019587260; Fri, 15 May 2026 15:29:36 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 15 May 2026 15:29:35 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 15 May 2026 15:29:35 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Fei Shao <fshao@chromium.org>
CC: Jani <jani.nikula@intel.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, Manasi Navare
 <navaremanasi@google.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH i-g-t 1/2] tests/kms_cursor_crc: Add extra vblank to support
 MediaTek platform
Date: Fri, 15 May 2026 15:28:39 +0800
Message-ID: <20260515072934.495031-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260515072934.495031-1-jason-jh.lin@mediatek.com>
References: <20260515072934.495031-1-jason-jh.lin@mediatek.com>
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

Add MediaTek to vblank_wait_count=2 devices (like AMD/MSM) to ensure
cursor updates are fully synchronized before CRC capture.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 tests/kms_cursor_crc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 1e062c38b668..1249171dec56 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -345,9 +345,9 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
 		igt_display_commit(display);
 
 		/* Wait for two more vblanks since cursor updates may not
-		 * synchronized to the same frame on AMD HW
+		 * be synchronized to the same frame on AMD and MediaTek HW
 		 */
-		if (is_amdgpu_device(data->drm_fd))
+		if (is_amdgpu_device(data->drm_fd) || is_mtk_device(data->drm_fd))
 			igt_wait_for_vblank_count(data->crtc,
 						  data->vblank_wait_count);
 
@@ -1300,10 +1300,12 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		igt_require_pipe_crc(data.drm_fd);
 
 		/* Wait for two more vblanks since cursor updates may not
-		 * synchronized to the same frame on AMD HW
+		 * be synchronized to the same frame on AMD and MediaTek HW
 		 */
 		data.vblank_wait_count =
-			(is_msm_device(data.drm_fd) || is_amdgpu_device(data.drm_fd)) ? 2 : 1;
+			(is_msm_device(data.drm_fd) ||
+			 is_amdgpu_device(data.drm_fd) ||
+			 is_mtk_device(data.drm_fd)) ? 2 : 1;
 	}
 
 	data.cursor_max_w = cursor_width;
-- 
2.43.0

