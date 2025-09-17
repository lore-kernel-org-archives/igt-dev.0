Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCBCCAC59A
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 14:43:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6CC10E85A;
	Wed, 17 Sep 2025 14:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DmSmG8Nr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E07A10E85A
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 14:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758120203; x=1789656203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oMqeNb38sM7y3uelckUuqjc0LmG4YOGKvX4c8i6kgJ0=;
 b=DmSmG8NrxXuKuGIRMViYnBu6uV7/yMP03Wwx6YBeXq4kEEsZVWG8aiRH
 gUkBdfIk2IiyrTE2XGJwC/hv/PqKP9d8tSAq7CJfGE4d1++o+YKvfNFlb
 JlcIlQ5rLSvICzBvPkykAOpTS1ORQVDerViL8GYhgWIOG6YobJ9XVkUoD
 qy6M+oZRsLrCd2lVcpY3VkH1G4aoL/UltslqH0351aCdpy86lXLpISu+Y
 eXECx8MMOAXHQ2AoaMSTexijQGWKiz+02Z6GP/B6hJNHpj4lanjoLBrKv
 o94l/ycaJXyD7ER00zcV+criCY+x1/WeJ8fz1qYdnBMwhI5utxd3x2Nxv A==;
X-CSE-ConnectionGUID: NzzyVeDbRZy6gBYyBb8/Uw==
X-CSE-MsgGUID: 9/QCQTzzTPKsrs8dm+/3WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="64250012"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="64250012"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 07:43:23 -0700
X-CSE-ConnectionGUID: J6rBId4jRn+fLnFRiGqRnQ==
X-CSE-MsgGUID: tvcRQoe4SgOVJ0A6KCKvwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="175062337"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 07:43:22 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] tests/kms_setmode: Fix clone mode mismatch by
 preferring eDP mode
Date: Wed, 17 Sep 2025 20:13:08 +0530
Message-ID: <20250917144308.1355953-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917144308.1355953-1-jeevan.b@intel.com>
References: <20250917144308.1355953-1-jeevan.b@intel.com>
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

v2: Fix logic for eDP fallback.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_setmode.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 49fc45043..43d1fc914 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -256,6 +256,25 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
 		}
 	}
 
+	/* If an eDP connector is present, prefer selecting its default mode
+	 * for cloning, since internal panels typically dictate the clone mode
+	 * and may have HRR support, making them incompatible with modes
+	 * supported by external displays.
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

