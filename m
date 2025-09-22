Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604E2CAC5A7
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 04:02:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7183610E3A0;
	Mon, 22 Sep 2025 04:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9pEIv8+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE5B10E030
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 04:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758513740; x=1790049740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cUbwbNYq1y/S67efiPSqWsPJQ4z7QFpP5F0rlALT02k=;
 b=m9pEIv8+7M04mn6rQC94Islgw9ZrNKCL6V5kxsSp2YASMAcHEmnl37sI
 TGGcYY2s6cE5RpmWpIQvtVUr/EnJaLbcPa0FP48RmuvOlbLHyW8sjFfCO
 hSVIAbhbgmmYYM/fZArlzzqBYkqakYLtDFN2BDwNoghl3W872Q4HDjbQr
 8B8GIZttaZnujZuL40mSR4gqn6BY9tnfXppCqYeTpY9Uh04BLGuzVrhUj
 kY9jK+hGzePn5KJpLScr4fWhYo2iKH1n34D89O6p2TTLWL4DtOOhY14+z
 5qfHAYvbm/6kRlWVmr4pITCwAtZWCYgKP59sBMggDxJlhn+lLdZ3CCSB1 Q==;
X-CSE-ConnectionGUID: 3WdKDMGoQSWmZgkHIYl4qA==
X-CSE-MsgGUID: QUdn5Cp2TxCkLY9wg95SWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="48347801"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="48347801"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2025 21:02:09 -0700
X-CSE-ConnectionGUID: SOu6HkRgR3un6t/dMe2WFA==
X-CSE-MsgGUID: GTTNsA9qSUaD8i93oGKAwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="176192678"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 21:02:06 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] tests/kms_setmode: Fix clone mode mismatch by
 preferring eDP mode
Date: Mon, 22 Sep 2025 09:31:51 +0530
Message-ID: <20250922040151.1374078-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922040151.1374078-1-jeevan.b@intel.com>
References: <20250922040151.1374078-1-jeevan.b@intel.com>
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

If an eDP connector is present, prefer selecting its lowest clock mode for
cloning. Some eDP panels support only high refresh rate (HRR) modes,
which may not match modes supported by external displays. To avoid invalid
clone configurations and test failures, we choose the lowest clock mode
from the eDP connector when available.

v2: Fix logic for eDP fallback.
v3: Fix comment to say ‘lowest clock mode selected’ instead of
    ‘default mode’.
v4: Update commit message.

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

