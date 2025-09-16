Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7AACAC598
	for <igt-dev@archiver.kernel.org>; Tue, 16 Sep 2025 08:00:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD3210E301;
	Tue, 16 Sep 2025 08:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WxurOpBb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61C510E301
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Sep 2025 08:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758009618; x=1789545618;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DNN9b7JI2sK5QZWEHNrZquEuTEs18dEjlh0MgCxyKeo=;
 b=WxurOpBbXCo6vjpAnItgpfSRshZVBwKi8tuO/PVu6/0kJPKLdfPkIbEE
 ArHAsKWFWZ4w2f0dZYU+EA52wjMEP3F+26x2oHotkIR9JmF2mwgQyTLlb
 r5roih2aTx3yOWLKYsPM4Idn35mE1Yi4DzgbXV+Co2T7b5UVVgiusqfcb
 DoBZLjd/aNLZxEtU1FdHYQvHyXqSlL4/tGJtL5lpHWfMVLe069+lff/YV
 7jqcp6aFpv6p2AxoCQzjpjXZlGsgIisEvWSgyU1soL+C8DiDgbq78ItX9
 ip+OrLLm0mYkikMndr7aAfpbP9fkxiNtWdtJCkxMW9p2PAaxlJZqp49nA g==;
X-CSE-ConnectionGUID: NGtt5YjfS6WiOxOeMyCSSw==
X-CSE-MsgGUID: USmcXt2DTBWZB3XoEdNlxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60210024"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="60210024"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 01:00:14 -0700
X-CSE-ConnectionGUID: 9+gKC2phROugl6qhD56YBA==
X-CSE-MsgGUID: I4nGJ6ZRRxCVW1TCwzYfYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="179157255"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 01:00:13 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_setmode: Fix clone mode mismatch by
 preferring eDP mode
Date: Tue, 16 Sep 2025 13:30:01 +0530
Message-ID: <20250916080001.1339181-1-jeevan.b@intel.com>
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

v2: Fix 'goto' when fitting mode is found.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_setmode.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 484c3a95f..62cb8c453 100644
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
+				goto found;
+		}
+	}
+
 	/*
 	 * If none is found then just pick the default mode from all connectors
 	 * with the smallest clock, hope the other connectors can support it by
-- 
2.43.0

