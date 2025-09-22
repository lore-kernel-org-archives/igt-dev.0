Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84FECAC5A7
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 04:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD0310E3A0;
	Mon, 22 Sep 2025 04:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R5sGh8tf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6198A10E3A7
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 04:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758516200; x=1790052200;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q+x4NEB6lNkA8nPGqUkDaT5s4AIk3OrFiVcMZdZMefE=;
 b=R5sGh8tfZWMYlFyxdjKNbXTzvfDOW6b8MZ8NMQifgmZPyN4g1DeDetrL
 +grprnqKWFJ1UDHH1B9CosjyVGUT/Amz5b9t1V40QRR4IcdoroaFnzimN
 HxNj8YfPWPPhCta7ZP/48pDPKIHkp8qqHFNx/GahshjUggpMWf1J0Lgco
 8q5KA/z9pb+jCi3J+mAti39M7u4VHHGePuX6AItMuf0QecTx+wWNpxA4N
 l4j3UoeKkvllI+BOfF6F9h+dEl7Msbwh0wXJ8B77jHqB8j9b6pGKepKT5
 5ZQkAVWsCFHOn16Wpvt7KZ0aoYxHf/tP0nNjxMvNVdLtOSOlUAtyS0rR+ w==;
X-CSE-ConnectionGUID: 5gdRrHNMRj6e4BRPGfg7sw==
X-CSE-MsgGUID: EFu+y5B6Tk2AC/YBVg4ytA==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="60467139"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="60467139"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2025 21:43:20 -0700
X-CSE-ConnectionGUID: 10WKYbcdQQqv9EwmZOv2Cw==
X-CSE-MsgGUID: cBoVkQg6SY2ZhTdZ7XCu4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="207344514"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2025 21:43:18 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] tests/kms_setmode: Fix clone mode mismatch by
 preferring eDP mode
Date: Mon, 22 Sep 2025 10:12:49 +0530
Message-ID: <20250922044249.1374338-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922044249.1374338-1-jeevan.b@intel.com>
References: <20250922044249.1374338-1-jeevan.b@intel.com>
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

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13780
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

