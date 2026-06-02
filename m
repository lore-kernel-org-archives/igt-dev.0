Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5290CCD6E57
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 14:14:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E9910F20F;
	Tue,  2 Jun 2026 14:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R7hhjUGs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5232810F207
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 14:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780409673; x=1811945673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K4YYBvGbJwIa2Dywy84Xctf2MuTVa+6shZjUqUoOCb0=;
 b=R7hhjUGsmZXEWacev/Unew7SwzZh6EXuOVk7mMiru+tZv2mqvLhAiJwK
 ur2MLOO7mh2tvMyD3Z/KNptvp5VjXtShrRMT+1v0B+CnDPLfG5IqiPWPR
 1KbJXEKnzKcaxPHzshKkj44Of3rSJq1v6NKuWVsp4aRsyFs5pxUeEE/PP
 Zi8IwiW4Gg0NjktAn5PnGo7fUjOKc5xwIAvr/tKtHf5V5ru3I+UqeD500
 y+y1F8n7DLDlcD8fUJl92Mzv9tIpZfvqJUoF76W/4D3tdnQC7ubYi0Oej
 w0sOOOdYEptVX9xSoyU0c3VRhElS4C5MEfCb7W4pOSZndD0ujqIDDrBaD Q==;
X-CSE-ConnectionGUID: JI3qORzuREiIIvOIAWWFaA==
X-CSE-MsgGUID: sujDhzy+TDO4vQ6+NseN2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="106642615"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="106642615"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 07:14:33 -0700
X-CSE-ConnectionGUID: XAA5TQgFR3q5GJgCgNzrvQ==
X-CSE-MsgGUID: oJlNGiHIQhWCy+435WxXhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="282026286"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 07:14:31 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_bw: Fix connected output count when
 connectors exceed pipe count
Date: Tue,  2 Jun 2026 20:06:10 +0530
Message-ID: <20260602143610.3343318-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602052407.3326517-1-sowmiya.s@intel.com>
References: <20260602052407.3326517-1-sowmiya.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Decouple connected output counting from the pipe-capped loop in
test_init(). The original single loop capped at max_pipes never
iterates connectors at index >= max_pipes. On platforms where
connectors outnumber pipes (e.g. eDP, DP-1, DP-2, DP-3, HDMI = 5
connectors, 4 pipes), this causes connected_outputs to be
undercounted, making connected-linear-tiling subtests skip even
when enough displays are physically connected.

v2: Fix potential overflow in connected_output array (Karthik)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_bw.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index f695b25d8..42b7a0123 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -132,6 +132,19 @@ static void test_init(data_t *data, bool physical)
 			igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 	}
 
+	/*
+	 * Scan ALL connectors to count connected outputs. Do not cap at
+	 * max_pipes: the number of connectors can exceed the number of pipes
+	 * and capping would silently drop connectors at indices >= max_pipes.
+	 */
+	for (i = 0; i < display->n_outputs; i++) {
+		output = &display->outputs[i];
+		if (!igt_output_is_connected(output))
+			continue;
+		if (data->connected_outputs < IGT_MAX_PIPES)
+			data->connected_output[data->connected_outputs++] = output;
+	}
+
 	for (i = 0; i < display->n_outputs && i < max_pipes; i++) {
 		if (!data->crtc[i] && !physical)
 			continue;
@@ -139,10 +152,8 @@ static void test_init(data_t *data, bool physical)
 		output = &display->outputs[i];
 		data->output[i] = output;
 
-		/* Only allow physically connected displays for the tests. */
 		if (!igt_output_is_connected(output))
 			continue;
-		data->connected_output[data->connected_outputs++] = output;
 
 		igt_assert(kmstest_get_connector_default_mode(
 			data->fd, output->config.connector, &data->mode[i]));
@@ -151,7 +162,6 @@ static void test_init(data_t *data, bool physical)
 		data->h[i] = data->mode[i].vdisplay;
 	}
 
-
 	igt_require(data->output[0]);
 	igt_display_reset(display);
 }
-- 
2.43.0

