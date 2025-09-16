Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D92CAC599
	for <igt-dev@archiver.kernel.org>; Tue, 16 Sep 2025 09:18:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0F610E75D;
	Tue, 16 Sep 2025 09:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RUCD1y8+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0497310E75E
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Sep 2025 09:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758014291; x=1789550291;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z9pZCoqukvyAcLv+whCnY9JqC38Og3jb2ezNMW4JScE=;
 b=RUCD1y8+Vdm6XAAJ1vMQWilmsyH8U45BXAA0VGmMXTceKOgebNNQtpCb
 5eNoPD3VlTMUAsQXQTqK+i4lViBBcgrwlRlT7Qri9C26sOuDIZs6M29wf
 S/kfW3ztwwndhUJ+yykuOiqiasqJsFmioFcsQqi3fb2fTNq4paPSkPFKU
 i+M/UGQkEAVXhrzUKoT27Hi2qKsdzY7AU+ItHIFQB0jPNitsiUxIOf1zF
 fbWGdiVSLoub9KSM7TY0gNcQ/nInmo1W1z1R2/+1X5XHkTt4/72BKcgxE
 fwEmORPXlh/t+ZEDXP9cIbY5rcgTuPxvYsMTXS++2j42ml8VPcorcW5gH A==;
X-CSE-ConnectionGUID: 3iuZU2iaTAWb+1Y5pHn49Q==
X-CSE-MsgGUID: b+zu7ttdQCirH5JT1fUEyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="59981641"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="59981641"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 02:18:08 -0700
X-CSE-ConnectionGUID: LXyuJ3CJS0GByAdg6FkIYA==
X-CSE-MsgGUID: UqQnsntPT9ynvPkHx0VEjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="175671042"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 02:18:06 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_setmode: Fix clone mode mismatch by
 preferring eDP mode
Date: Tue, 16 Sep 2025 14:48:00 +0530
Message-ID: <20250916091800.1348207-1-jeevan.b@intel.com>
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

If an eDP connector is present, prefer selecting its default mode for
cloning. Some eDP panels support only high refresh rate (HRR) modes,
which may not be compatible with external displays. To avoid invalid
clone configurations and test failures, we choose the default mode
from the eDP connector when available.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_setmode.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 484c3a95f..c901490ed 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -252,6 +252,21 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
 			goto found;
 	}
 
+	/* If an eDP connector is present, prefer selecting its default mode
+	 * for cloning, since internal panels typically dictate the clone mode
+	 * and may have HRR support, making them incompatible with modes
+	 * supported by external displays.
+	 */
+	for (i = 1; i < crtc->connector_count; i++) {
+		drmModeConnector *conn = crtc->cconfs[i].connector;
+
+		if (conn->connector_type == DRM_MODE_CONNECTOR_eDP) {
+			if (crtc->cconfs[i].default_mode.clock < mode->clock)
+				mode = &crtc->cconfs[i].default_mode;
+		}
+		goto found;
+	}
+
 	/*
 	 * If none is found then just pick the default mode from all connectors
 	 * with the smallest clock, hope the other connectors can support it by
-- 
2.43.0

