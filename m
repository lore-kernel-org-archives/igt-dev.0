Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFC0E99076
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 10:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27B110E919;
	Fri, 10 Apr 2026 10:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="ro6rt3Xm";
	dkim-atps=neutral
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC8A10E161
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 10:08:13 +0000 (UTC)
X-UUID: 2c36403e34c511f1ae70033691e9ac7d-20260410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=XV5e4WqarUWOLLSmLb7eJnwIlQHFjvcNB0/zJdbOn/Q=; 
 b=ro6rt3Xm3Y1WV0OtwlblUyhwBm9xqipFR+S9VYBewdpbKHOdho92OiudH+H6fplciLwYLSDDO03+/ZGywWPCqw+Ar9MNJPdeVstG1su0ts+mpO3bXqaG7/Eno2YfBCpywvy3Lw1RJf+GUe2RlZj7YJcwzOW3++UOlsK85BvcAeg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:f7c8bdf2-46d6-497d-a5e1-40a8d31a2e80, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:e7bac3a, CLOUDID:b8e8b5d5-060f-4ecc-9ee0-121eeeb4a682,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
 15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
 ,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2c36403e34c511f1ae70033691e9ac7d-20260410
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2025462798; Fri, 10 Apr 2026 18:08:08 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 10 Apr 2026 18:08:06 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 10 Apr 2026 18:08:06 +0800
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
Subject: [PATCH i-g-t] tests/kms_rotation_crc: Add MTK device support
Date: Fri, 10 Apr 2026 18:07:31 +0800
Message-ID: <20260410100806.62906-1-jason-jh.lin@mediatek.com>
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

Adapt rotation CRC tests for MTK devices by using Intel-like pipe CRC
approach with explicit vblank synchronization.
MTK devices require a vblank wait to ensure rotation completes before
CRC capture.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 tests/kms_rotation_crc.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 4420053f1c6d..972fe9f56839 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -310,12 +310,12 @@ static void prepare_crtc(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
 	/* defer crtc cleanup + crtc active for later on amd - not valid
 	 * to enable CRTC without a plane active
 	 */
-	if (!is_amdgpu_device(data->gfx_fd))
+	if (is_intel_device(data->gfx_fd) || is_mtk_device(data->gfx_fd))
 		igt_display_commit2(display, COMMIT_ATOMIC);
 	data->pipe_crc = igt_crtc_crc_new(crtc,
 				          IGT_PIPE_CRC_SOURCE_AUTO);
 
-	if (!is_amdgpu_device(data->gfx_fd) && start_crc)
+	if ((is_intel_device(data->gfx_fd) || is_mtk_device(data->gfx_fd)) && start_crc)
 		igt_pipe_crc_start(data->pipe_crc);
 }
 
@@ -324,7 +324,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
 #define TEST_HEIGHT(km) \
 	 min_t((km)->vdisplay, (km)->vdisplay, TEST_MAX_HEIGHT)
 
-static void prepare_fbs(data_t *data, igt_output_t *output,
+static void prepare_fbs(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
 			igt_plane_t *plane, enum rectangle_type rect, uint32_t format)
 {
 	drmModeModeInfo *mode;
@@ -410,6 +410,8 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
 				data->pipe_crc,
 				&data->crc_rect[data->output_crc_in_use][rect].flip_crc);
 		} else {
+			if (is_mtk_device(data->gfx_fd))
+				igt_wait_for_vblank(crtc);
 			igt_pipe_crc_get_current(
 				display->drm_fd, data->pipe_crc,
 				&data->crc_rect[data->output_crc_in_use][rect].flip_crc);
@@ -434,6 +436,8 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
 				&data->crc_rect[data->output_crc_in_use][rect].ref_crc);
 			igt_remove_fb(data->gfx_fd, &data->fb_flip);
 		} else {
+			if (is_mtk_device(data->gfx_fd))
+				igt_wait_for_vblank(crtc);
 			igt_pipe_crc_get_current(
 				display->drm_fd, data->pipe_crc,
 				&data->crc_rect[data->output_crc_in_use][rect].ref_crc);
@@ -472,7 +476,7 @@ static void test_single_case(data_t *data, igt_crtc_t *crtc,
 
 	igt_debug("Testing case %i on pipe %s, format %s\n", rect,
 		  igt_crtc_name(crtc), igt_format_str(format));
-	prepare_fbs(data, output, plane, rect, format);
+	prepare_fbs(data, output, crtc, plane, rect, format);
 
 	igt_plane_set_rotation(plane, data->rotation);
 	if (igt_rotation_90_or_270(data->rotation))
@@ -499,6 +503,8 @@ static void test_single_case(data_t *data, igt_crtc_t *crtc,
 	if (is_amdgpu_device(data->gfx_fd)) {
 		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_output);
 	} else {
+		if (is_mtk_device(data->gfx_fd))
+			igt_wait_for_vblank(crtc);
 		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc,
 								 &crc_output);
 	}
@@ -530,6 +536,8 @@ static void test_single_case(data_t *data, igt_crtc_t *crtc,
 		if (is_amdgpu_device(data->gfx_fd)) {
 			igt_pipe_crc_collect_crc(data->pipe_crc, &crc_output);
 		} else {
+			if (is_mtk_device(data->gfx_fd))
+				igt_wait_for_vblank(crtc);
 			igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc,
 									 &crc_output);
 		}
@@ -701,7 +709,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 						 data->override_fmt, test_bad_format);
 			}
 		}
-		if (is_intel_device(data->gfx_fd)) {
+		if (is_intel_device(data->gfx_fd) || is_mtk_device(data->gfx_fd)) {
 			igt_pipe_crc_stop(data->pipe_crc);
 		}
 	}
-- 
2.43.0

