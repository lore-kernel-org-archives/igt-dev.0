Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C46AC61DB2
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 05:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C234310E0F6;
	Fri, 13 Jun 2025 05:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="geGWWKXx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCDE10E0F6
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jun 2025 05:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749792781; x=1781328781;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ls4TJFRrL6hOLhWZIdDh6OYnMxH/qnsb7cw2SSQyvh0=;
 b=geGWWKXxyfZvx1Kpir2LnyIyK1MXUejifC0SU0H+pTaIZWIOx//LIRKb
 EbsRpiuo1St0HEqE8ZZjDRocU29Ea5kP3Qa4CQYaGwzl1+CgvrJxFausJ
 8pfI46fHPGVBf1PukgEcYBuyzwhRF3U2qpaqB1OnJXWgbdOPJ9lzJyhv4
 LkPcr0VePawN6yUqfG/u+4Foqz7JlN2TpKDIdXnZmti6mI9kHPjB6k9KK
 7Vt7u0itgIqdcxHhXxE+h1yDhZ7EAY3fCmWygYPkh6jpgul4Nhehv+XQ+
 LnVZSfd4clgRHZpV+yAQDdj02oPrijrGP8rvc7dfW95oqv7etAx1iSGHI Q==;
X-CSE-ConnectionGUID: Xa/XJ9UoT3SEweYFSfDRgQ==
X-CSE-MsgGUID: jMJODnkfQlKRcfPomBejjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51871665"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="51871665"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 22:33:00 -0700
X-CSE-ConnectionGUID: nszq3BE8S22kazc/steAHA==
X-CSE-MsgGUID: foX8xLvPTESKIavKdB/8FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="147608828"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 22:32:58 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_setmode: Find compatible mode for eDP before
 selecting default mode
Date: Fri, 13 Jun 2025 11:18:48 +0530
Message-Id: <20250613054848.3279961-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
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

This change finds a common mode for eDP before falling back to default mode.
It avoids unnecessary failures by not selecting an unsupported mode for eDP.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_setmode.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 484c3a95f..6e7e5942a 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -252,6 +252,21 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
 			goto found;
 	}
 
+	/*
+	 * If eDP is present, try its modes to find a compatible one.
+	 */
+	for (int c = 0; c < crtc->connector_count; c++) {
+		drmModeConnector *conn = crtc->cconfs[c].connector;
+		if (conn->connector_type == DRM_MODE_CONNECTOR_eDP) {
+			for (i = 0; i < conn->count_modes; i++) {
+				mode = &conn->modes[i];
+				if (crtc_supports_mode(crtc, mode))
+					goto found;
+			}
+		break;
+		}
+	}
+
 	/*
 	 * If none is found then just pick the default mode from all connectors
 	 * with the smallest clock, hope the other connectors can support it by
-- 
2.25.1

