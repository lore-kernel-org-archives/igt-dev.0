Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FF2CD6E4A
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 05:02:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A6810EBCB;
	Tue,  2 Jun 2026 05:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HJzsAp8J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E6E10EBCB
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 05:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780376555; x=1811912555;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C9bTpP9YW5oQYlAkZpgxW6GX1tiUwn/cSmW4uJU39zU=;
 b=HJzsAp8JodPUbzizfpD5lPln7eFgV+H73o7pOWh/aBfKDuuDZ0YxXLh+
 tJnAhZClfGGc7FKaCMcN9bnaPLzxbqyNdTYXPSGjRF/PzCzdTbLsmvqDR
 veKWH7gQp5j3bJiEds+icTM/VVi3vI8N1T8nxJ9ENpw83zLO2YDuy1a/5
 sCv2HUR2n6uJQpSHBKCk20BPBZHEAdwXHm056AykxQDGN8Ys5dzun+tEc
 tICAQWpKe64rH8YkoOFiCfUKR2yc90TTjATVgCEEuGPW+9BHIStPXQh/J
 K6LQKi2vHLnuFhmLYSL2Pq8TDkPEGnSpLHANsr32Wn3FugT6A3Uxb+ZFJ w==;
X-CSE-ConnectionGUID: QJ8IIXo6QZGN3KzYJoOLFg==
X-CSE-MsgGUID: /5JDYl/XQ3OMCBQjMnUw8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="92535677"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="92535677"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 22:02:35 -0700
X-CSE-ConnectionGUID: GSM5z8CaSM+pHMZc5enN0A==
X-CSE-MsgGUID: kmwwbb+RT3mVS148RF1ZKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="267659947"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 22:02:33 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_bw: fix connected output count when
 connectors exceed pipe count
Date: Tue,  2 Jun 2026 10:54:07 +0530
Message-ID: <20260602052407.3326517-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
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

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_bw.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index f695b25d8..8067186b0 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -132,6 +132,22 @@ static void test_init(data_t *data, bool physical)
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
+		data->connected_output[data->connected_outputs++] = output;
+	}
+
+	/*
+	 * Populate pipe-indexed data (output[], mode[], w[], h[]) capped at
+	 * max_pipes, since these arrays are indexed by crtc/pipe number.
+	 */
 	for (i = 0; i < display->n_outputs && i < max_pipes; i++) {
 		if (!data->crtc[i] && !physical)
 			continue;
@@ -139,10 +155,8 @@ static void test_init(data_t *data, bool physical)
 		output = &display->outputs[i];
 		data->output[i] = output;
 
-		/* Only allow physically connected displays for the tests. */
 		if (!igt_output_is_connected(output))
 			continue;
-		data->connected_output[data->connected_outputs++] = output;
 
 		igt_assert(kmstest_get_connector_default_mode(
 			data->fd, output->config.connector, &data->mode[i]));
@@ -151,7 +165,6 @@ static void test_init(data_t *data, bool physical)
 		data->h[i] = data->mode[i].vdisplay;
 	}
 
-
 	igt_require(data->output[0]);
 	igt_display_reset(display);
 }
-- 
2.43.0

