Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2841ECCD18D
	for <igt-dev@archiver.kernel.org>; Sun, 12 Oct 2025 17:15:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE4510E187;
	Sun, 12 Oct 2025 17:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="kyhQPxll";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FCE10E189
 for <igt-dev@lists.freedesktop.org>; Sun, 12 Oct 2025 17:15:12 +0000 (UTC)
X-UUID: fdb673aaa78e11f0b33aeb1e7f16c2b6-20251013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JvSMofLEAul4Q3iBpvRwg8d+4Hah7NkNdpp0VbFueZ4=; 
 b=kyhQPxllVeh1w8crMjn1+/IveyX8dqfxBENXksp9ioway1101vHjIZSF2Cg8Aqkd6loO9zVG28hgpKzl1Aq5v+SVoOdxZ1U01QcBexzq742kGvEMOgzyxSNwRypt3H5zXfTTAOjdKT3qsT3z+5CHFugrnxDriw09At0tmQ0upW4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:6d4e5504-1a2f-40e8-844a-e637cd8bb543, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:62074c02-eaf8-4c8c-94de-0bc39887e077,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
 0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fdb673aaa78e11f0b33aeb1e7f16c2b6-20251013
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1804700262; Mon, 13 Oct 2025 01:15:03 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 13 Oct 2025 01:14:59 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Mon, 13 Oct 2025 01:14:59 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen <paul-pl.chen@mediatek.com>, Gil Dekel <gildekel@google.com>, Yacoub
 <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH i-g-t 5/6] tests/kms_content_protection: Add MediaTek device
 support
Date: Mon, 13 Oct 2025 01:13:15 +0800
Message-ID: <20251012171459.3773990-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
References: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
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

Add is_mtk_device() check and support for reading
"mtk_hdcp_sink_capability" from debugfs to enable HDCP tests on
MediaTek platforms. Add "SDC" to the HDCP panel blocklist for
improved compatibility. Also, mark outputs with no EDID sink name
as test exempt to avoid unnecessary failures.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 tests/kms_content_protection.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 51fc1d3be99f..2620631a62d7 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -141,6 +141,7 @@ __u8 facsimile_srm[] = {
  */
 static const char *const hdcp_blocklist[] = {
 	"DPF90435", /* Example monitor name */
+	"SDC",
 	/* Add more monitor names here as needed */
 };
 
@@ -509,6 +510,8 @@ static bool sink_hdcp_capable(igt_output_t *output)
 	 */
 	if (is_intel_device(data.drm_fd))
 		debugfs_read(fd, "i915_hdcp_sink_capability", buf);
+	else if (is_mtk_device(data.drm_fd))
+		debugfs_read(fd, "mtk_hdcp_sink_capability", buf);
 	else
 		debugfs_read(fd, "hdcp_sink_capability", buf);
 
@@ -531,6 +534,8 @@ static bool sink_hdcp2_capable(igt_output_t *output)
 	/* FIXME: XE specific debugfs as mentioned above. */
 	if (is_intel_device(data.drm_fd))
 		debugfs_read(fd, "i915_hdcp_sink_capability", buf);
+	else if (is_mtk_device(data.drm_fd))
+		debugfs_read(fd, "mtk_hdcp_sink_capability", buf);
 	else
 		debugfs_read(fd, "hdcp_sink_capability", buf);
 
@@ -617,6 +622,12 @@ static bool is_output_hdcp_test_exempt(igt_output_t *output)
 
 	drmModeFreePropertyBlob(edid_blob);
 
+	/* Not all monitors have sink names */
+	if (sink_name[0] == '\0') {
+		igt_debug("no sink name\n");
+		return true;
+	}
+
 	return igt_is_panel_blocked(sink_name, hdcp_blocklist, ARRAY_SIZE(hdcp_blocklist));
 }
 
-- 
2.43.0

