Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560BDC27C5E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 05:01:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A375310E41F;
	Tue, 11 Jun 2024 05:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VHX5fFgr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A98F10E41F
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 05:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718082100; x=1749618100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gFtolrcpP/so/SuR38+GBPFUgwNSkcGUKyVdgogDI0o=;
 b=VHX5fFgrRrB/GBWA5omRADw1hOEC+yB73OrJL9abjR8D73rdE8u4XeTi
 mEN/QiHu8rc4OjLnlm9hDRU3kysXPm8MxO5CF03kriah8fArDgXv82p7w
 LZOcXcZnD8QpwUYRQq7WW9kLn6n3r6zlxHztlVO9d7lJjtwUEBi896ECO
 TjLMXX2VRIblOiOma6+RkmLXJGwRd2rOFG7iRJEpm9j0QFcum4O2qxu55
 ZqB1atPPCRL1zIqErfTqFPueDmsQPDvAWIkhjvZfChkFpk1nMGAE62WVR
 P3Q1tswcB6Cd54wTKg8KsYwIsV1W9fw1sJQXQQShBZ1xxfSK6EAMuiUMz g==;
X-CSE-ConnectionGUID: HrKOGeJGT6K2ZOaVvRibtw==
X-CSE-MsgGUID: Qzk00+F2Qiuhle3njr+CCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14997498"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="14997498"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 22:01:39 -0700
X-CSE-ConnectionGUID: ES3S0wBTTPaMS7NqUMxURQ==
X-CSE-MsgGUID: h0z87fNrRxOzND0H/sT7lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="39981229"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 22:01:38 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Jeevan B <jeevan.b@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 4/8] tests/kms_hdmi_inject: Test cleanup
Date: Tue, 11 Jun 2024 10:23:44 +0530
Message-ID: <20240611045348.3727239-5-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
References: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
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

From: Kunal Joshi <kunal1.joshi@intel.com>

Make sure the below points in IGT cleanup:

 - Sanitize the state before starting the subtest.
 - Clear the states before exiting the subtest.
 - Update existing libdrm APIs with IGT kms APIs.
 - Other misc (Ex: update deprecated APIs/macros/enums, FB leaks etc..)

v2: (Bhanu)
 - Rebase
 - Initialize pointers with NULL
 - Update connector type HDMI checks

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_hdmi_inject.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index dce74fac0..d28be38e4 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -80,14 +80,15 @@ static drmModeConnector *
 get_connector(int drm_fd, drmModeRes *res)
 {
 	int i;
-	drmModeConnector *connector;
+	drmModeConnector *connector = NULL;
 
 	for (i = 0; i < res->count_connectors; i++) {
 
 		connector =
 			drmModeGetConnectorCurrent(drm_fd, res->connectors[i]);
 
-		if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA)
+		if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+		    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB)
 			break;
 
 		drmModeFreeConnector(connector);
@@ -243,6 +244,7 @@ igt_main
 
 	igt_fixture {
 		drmModeFreeConnector(connector);
+		drmModeFreeResources(res);
 		drm_close_driver(drm_fd);
 	}
 }
-- 
2.43.2

