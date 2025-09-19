Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F2DCAC5A5
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 03:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BEA10E929;
	Fri, 19 Sep 2025 03:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BXMlPoli";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA3410E928
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 03:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758251874; x=1789787874;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zml5xp0UInGPKUL/bmCqJvWtli7ScA8NSQaBhooaXH0=;
 b=BXMlPoliOr9DlYkqXJYP9oUzPQEyALu0QJA7lA989UliJoFEKdbIxygm
 eVGcKyrThIrZpt48j/WDMfedpa+foobarnFtu/Qy7tGwPAoEzrilROnlR
 uStt2JdAOU8We0QOVfvpomqpZMQHsTXzxqykzxPPlpRt1/RMK8U98BsSz
 EIEQd+Cwq1dUNflKTZHr4XgXjEyChRVlGqGCm7eykaH7HeVsyo8L/+c7C
 IdemhyBECIU2oL2stUaze+U+RH8TrZ3fk12iEoUFpLFqdLzK23xIxPbMe
 VirbXWntfL16Pg1tbMWxPtjzkzIeqcUxT8Tt2A5JklQOropDOFyT9UFho g==;
X-CSE-ConnectionGUID: vnZuUADHSueEvTDUn4RSTQ==
X-CSE-MsgGUID: Jqjz2xasTW+oeFJM6ywtTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60526901"
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; d="scan'208";a="60526901"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 20:17:54 -0700
X-CSE-ConnectionGUID: CwLcnY6qTVudpCc8J+SFdg==
X-CSE-MsgGUID: 67St9rznRx2lKem+YuB7uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; d="scan'208";a="179988713"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 20:17:52 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] tests/kms_setmode: Fix clone mode mismatch by
 preferring eDP mode
Date: Fri, 19 Sep 2025 08:47:36 +0530
Message-ID: <20250919031736.1362484-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250919031736.1362484-1-jeevan.b@intel.com>
References: <20250919031736.1362484-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v2: Fix logic for eDP fallback.
v3: Fix comment to say ‘lowest clock mode selected’ instead of
    ‘default mode’.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_setmode.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 48d0c3e1e..135918007 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -256,6 +256,25 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
 		}
 	}
 
+	/* If an eDP connector is present, iterate through its modes and
+	 * pick a mode with lowest clock, since internal panels typically
+	 * dictate the clone mode and may have HRR support, making them
+	 * incompatible with modes supported by external displays.
+	 */
+	for (i = 0; i < crtc->connector_count; i++) {
+		drmModeConnector *conn = crtc->cconfs[i].connector;
+
+		if (conn->connector_type == DRM_MODE_CONNECTOR_eDP) {
+			mode = &conn->modes[0];
+			for (int j = 1; j < conn->count_modes; j++) {
+				if (conn->modes[j].clock < mode->clock)
+					mode = &conn->modes[j];
+			}
+			*mode_ret = *mode;
+			return;
+		}
+	}
+
 	/*
 	 * If none is found then just pick the default mode from all connectors
 	 * with the smallest clock, hope the other connectors can support it by
-- 
2.43.0

