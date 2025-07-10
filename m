Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A425C83F09
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 07:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E132610E885;
	Thu, 10 Jul 2025 07:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l94ZsNol";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDEC10E885
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 07:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752131142; x=1783667142;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cZD8Mw4Ghf/GtXeOqAtymZXAf19/2Bxavh4iue/L4oo=;
 b=l94ZsNoltnmr+cs8mi2MW2Oe01Bn+BWx3S2ZfN4z4Y9ikZ2dqivVmsHv
 gU62pFzTn1cE80CuXVEsmfpO8UoscpnBpolPQ46w7ff4pQIfxcb7u/a/o
 TGC8TP2kkQmMSognk/mXghxN28Gf3WeponoJL2qOLmyE28xQuDu2DXt4S
 /FTla4BQHBhH1bQJvcomHPVNB5tTRcswjdPQLF9Wz/WAYiIExTh1CrOfy
 VtB6SJP94zbZEXn3sHoQyvngZOoDS1HzHevBsaRi0ffsxKsYcB5QQxp3+
 2pGIbuJ07y4FE1oTBsSdMNCOUwC5wpQYQCPIyvIhmJmycWg6AQ8TEfQQa A==;
X-CSE-ConnectionGUID: 5DQgNF79SmiTzLNltE+A0Q==
X-CSE-MsgGUID: ZIy8DexmSJi65EZxPYYQLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65853215"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="65853215"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 00:05:41 -0700
X-CSE-ConnectionGUID: FpLE0e0+Rg6bV7Ku6+Kmdw==
X-CSE-MsgGUID: QSK7LdBwSVC8YePyAeJ15g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="155403501"
Received: from unknown (HELO jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com)
 ([10.227.90.91])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 00:05:39 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_setmode: Fix clone mode mismatch by
 preferring eDP mode
Date: Thu, 10 Jul 2025 12:35:27 +0530
Message-ID: <20250710070527.188720-1-jeevan.b@intel.com>
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
 tests/kms_setmode.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 484c3a95f..462313e5a 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -252,12 +252,28 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
 			goto found;
 	}
 
+	/* If an eDP connector is present, prefer selecting its default mode
+	 * for cloning, since internal panels typically dictate the clone mode
+	 * and may have HRR support, making them incompatible with modes
+	 * supported by external displays.
+	 */
+	mode = &crtc->cconfs[0].default_mode;
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
 	 * scaling etc.
 	 */
-	mode = &crtc->cconfs[0].default_mode;
+
 	for (i = 1; i < crtc->connector_count; i++)
 		if (crtc->cconfs[i].default_mode.clock < mode->clock)
 			mode = &crtc->cconfs[i].default_mode;
-- 
2.43.0

