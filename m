Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3F8C27C5E
	for <igt-dev@archiver.kernel.org>; Mon, 10 Jun 2024 16:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7F010E4C5;
	Mon, 10 Jun 2024 16:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i1/SSFn7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722BF10E4C1
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jun 2024 16:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718037775; x=1749573775;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gFtolrcpP/so/SuR38+GBPFUgwNSkcGUKyVdgogDI0o=;
 b=i1/SSFn7kuyfsyzm6vbS+VAiZ1Y5dLKlMUWesH6oVmUPbXH14h1wv6wM
 0mJElWW8y4r7iYMcB1szT6YUF2WaNxs/zhDdEDKohtn0kDuIw02sJAzp6
 DmrV4TUgx6b6L8zHLIbFD3PdNyeCOvHJJOmKXj+677qFgjS/ZCc3q2z4O
 FiTKzfjn2fODlocGlioX/oNUt3gPV9eRdH3xZJifi7Hi7281cMm24tfTa
 2mjp+I05wBdsekiv5SB0VDhG/gO+ZLJTaq1/qtLiZeWLNA73s6xUhrTpi
 ZLSvGtq4d9fkZB+V1mOBu/vP7HLqPvIIikTnU2y+hoKe9WmvPeXG/D6h3 A==;
X-CSE-ConnectionGUID: 7O5Pz00HQGOMZ2lloEjSmA==
X-CSE-MsgGUID: ZZk9hgfpTeWUkTyiwcODYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25819712"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="25819712"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:42:55 -0700
X-CSE-ConnectionGUID: 7jSfLjDXRL2v/+sv3L3LGA==
X-CSE-MsgGUID: ekTx7hiASXqqwEEY3KNh8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39681342"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:42:53 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Jeevan B <jeevan.b@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 5/9] tests/kms_hdmi_inject: Test cleanup
Date: Mon, 10 Jun 2024 22:04:53 +0530
Message-ID: <20240610163457.3711476-6-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240610163457.3711476-1-bhanuprakash.modem@intel.com>
References: <20240610163457.3711476-1-bhanuprakash.modem@intel.com>
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

