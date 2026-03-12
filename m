Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8671067038
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 14:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989AE10E221;
	Thu, 12 Mar 2026 14:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="G969etwP";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5081210E221
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 14:17:14 +0000 (UTC)
X-UUID: 2987d20c1e1e11f1a39cd589f645bc18-20260312
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=7yWJX4ab5H3g/G4FLoFowZcPWeIrd88QixvHJAzliII=; 
 b=G969etwPSerLigzmeYr09foGsBitTzNruRVKA5ZcYLI03jQRrEZuBkW0n3l5eu4VOL4Am6SHlbtDe80m5HAHQ2Kf/qh4uKzQpUofVe+FR+KEAEBwqcno/mhTfIJF0ejD0jSWC/+VR18hlxyPeMkRHBSsMBLTm0R9eUqRhri1wbs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12, REQID:6e32bc9f-4b03-4ef6-9555-356548f6696a, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:e7bac3a, CLOUDID:916eb993-f8ef-4ca8-bea0-143568f9ca1d,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
 0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
 :0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2987d20c1e1e11f1a39cd589f645bc18-20260312
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1218940187; Thu, 12 Mar 2026 22:17:11 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Mar 2026 22:17:10 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Mar 2026 22:17:10 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 Fei Shao <fshao@chromium.org>
CC: Jani <jani.nikula@intel.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>,
 Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH i-g-t v2] tests/kms_bw: Skip tests when outputs don't support
 the mode
Date: Thu, 12 Mar 2026 22:16:45 +0800
Message-ID: <20260312141709.2334871-1-jason-jh.lin@mediatek.com>
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

The kms_bw test uses hardcoded display timings that may not match
what connected panels support. This causes test failures when forcing
unsupported modes on fixed-mode panels like DSI.

Add output_mode_supported() to check if a mode exists in the
connector's mode list before using it. Skip outputs that don't
support the requested mode during buffer creation, CRC collection,
and cleanup.

For multi-output tests, proceed if at least one output supports
the mode. Skip only if all outputs reject it.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Fei Shao <fshao@chromium.org>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/kms_bw.c | 38 +++++++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 577a0ec2f065..a6cb46e8244f 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -187,6 +187,35 @@ static void force_output_mode(data_t *d, igt_output_t *output,
 	igt_output_override_mode(output, mode);
 }
 
+static bool output_mode_supported(igt_output_t *output, const drmModeModeInfo *mode)
+{
+	drmModeConnector *connector = output->config.connector;
+	int i;
+
+	/* Virtual/forced sinks support all modes */
+	if (!igt_output_is_connected(output))
+		return true;
+
+	for (i = 0; i < connector->count_modes; i++) {
+		drmModeModeInfo *conn_mode = &connector->modes[i];
+
+		if (conn_mode->hdisplay == mode->hdisplay &&
+		    conn_mode->vdisplay == mode->vdisplay &&
+		    conn_mode->vrefresh == mode->vrefresh) {
+			igt_debug("Found matching mode for %dx%d@%dHz on %s\n",
+				  mode->hdisplay, mode->vdisplay, mode->vrefresh,
+				  igt_output_name(output));
+			return true;
+		}
+	}
+
+	igt_info("Mode %dx%d@%dHz not supported by %s (has %d modes)\n",
+		 mode->hdisplay, mode->vdisplay, mode->vrefresh,
+		 igt_output_name(output), connector->count_modes);
+
+	return false;
+}
+
 static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo *mode, bool physical) {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
@@ -195,6 +224,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 	int i = 0, num_pipes = 0;
 	igt_crtc_t *crtc;
 	int ret;
+	bool has_supported_mode = false;
 
 	/* Cannot use igt_display_n_crtcs() due to fused pipes on i915 where they do
 	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
@@ -213,7 +243,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 		crtc = igt_crtc_for_pipe(display, i);
 
 		output = physical ? data->connected_output[i] : data->output[i];
-		if (!output) {
+		if (!output || !output_mode_supported(output, mode)) {
 			continue;
 		}
 
@@ -230,7 +260,9 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 		igt_info("Assigning pipe %s to output %s with mode %s\n",
 			 igt_crtc_name(crtc), igt_output_name(output),
 			 mode->name);
+		has_supported_mode = true;
 	}
+	igt_skip_on_f(!has_supported_mode, "Unsupported mode for all pipes\n");
 
 	ret = igt_display_try_commit_atomic(display,
 					    DRM_MODE_ATOMIC_ALLOW_MODESET |
@@ -242,7 +274,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 
 	for (i = 0; i <= pipe; i++) {
 		output = physical ? data->connected_output[i] : data->output[i];
-		if (!output) {
+		if (!output || !output_mode_supported(output, mode)) {
 			continue;
 		}
 
@@ -253,7 +285,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 
 	for (i = pipe; i >= 0; i--) {
 		output = physical ? data->connected_output[i] : data->output[i];
-		if (!output)
+		if (!output || !output_mode_supported(output, mode))
 			continue;
 
 		igt_remove_fb(display->drm_fd, &buffer[i]);
-- 
2.43.0

