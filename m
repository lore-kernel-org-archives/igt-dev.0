Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7F2C4450B
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 09:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188AE10E8C2;
	Mon, 13 Jul 2026 09:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6C3c/TY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFD510E5A1
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 09:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783936705; x=1815472705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/evXXOtTsqm/T2CqL08v5zo2rjkrxR/WYoqFBamnfZs=;
 b=S6C3c/TYH1z9oqRtnQin/Y7QGmb7bKUQ1QPTKEEz9O6l3AXh1vGQAjSC
 9T4f69zvK/lEPPhelJBbH8VQ/Xi/24V1Ifneat5EDclpAtIgJ+oXogBWK
 YZtWIFD35R8uwd83KgDYvpCewbeJtO/YVJroDWCV285R5FVE+rXN8L9Ml
 va4yf/sD6mW3Tw2n7icKywj+8P4bZCTcVqpfKH4lSXBu5AQyPCicNwWJl
 wqZof79Bv7FJSZgZEcS1JEmIRWaB89DT4Azn15rqEXhWZdEnFXFBGtMD3
 0IwfOKyjscsiiPu/N7vglGCDOvrkVHtFQUdmz+Aaxzxe/xrfnbBxR2sBI g==;
X-CSE-ConnectionGUID: ByApuo6vRAaJvY6t9H8jpA==
X-CSE-MsgGUID: 65rs92TgRfy02YBIICEGew==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88221133"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="88221133"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 02:58:25 -0700
X-CSE-ConnectionGUID: USRB75XTQmGYJ+SpNwDhPQ==
X-CSE-MsgGUID: ppKkLt8PTBWpOg5ZjV82fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="285594328"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa002.jf.intel.com with ESMTP; 13 Jul 2026 02:58:23 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, sowmiya.s@intel.com, swati2.sharma@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_force_connector_basic: re-baseline
 connection state before comparing
Date: Mon, 13 Jul 2026 15:28:19 +0530
Message-Id: <20260713095819.4020111-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713080227.3989038-1-suraj.kandpal@intel.com>
References: <20260713080227.3989038-1-suraj.kandpal@intel.com>
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

force_connector_state compares the end-of-subtest connection state
against a snapshot taken once in igt_fixture(). That snapshot can be
stale (e.g. adaptor still initializing, HPD disturbed by earlier
power transitions) or reflect a leftover force flag from a previous
subtest or from igt_handle_spurious_hpd(), causing spurious failures.

Take a fresh baseline inside the subtest, after clearing any
leftover force with FORCE_CONNECTOR_UNSPECIFIED, and compare against
that.

Assisted-by: GitHub Copilot:Claude Opus 4.7
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_force_connector_basic.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
index 4ea6b0e8c..c4252ea02 100644
--- a/tests/kms_force_connector_basic.c
+++ b/tests/kms_force_connector_basic.c
@@ -177,7 +177,7 @@ static void force_load_detect(int drm_fd, drmModeConnectorPtr connector, drmMode
 static void force_connector_state(int drm_fd, drmModeConnectorPtr connector)
 {
 	igt_display_t display;
-	drmModeConnector *temp;
+	drmModeConnector *baseline, *temp;
 
 	igt_display_require(&display, drm_fd);
 
@@ -185,6 +185,10 @@ static void force_connector_state(int drm_fd, drmModeConnectorPtr connector)
 	igt_display_reset(&display);
 	igt_display_commit(&display);
 
+	kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_UNSPECIFIED);
+	baseline = drmModeGetConnector(drm_fd, connector->connector_id);
+	igt_assert(baseline);
+
 	/* Force the connector on and check the reported values. */
 	kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON);
 	temp = drmModeGetConnectorCurrent(drm_fd,
@@ -207,9 +211,10 @@ static void force_connector_state(int drm_fd, drmModeConnectorPtr connector)
 				FORCE_CONNECTOR_UNSPECIFIED);
 	temp = drmModeGetConnectorCurrent(drm_fd,
 					  connector->connector_id);
-	igt_assert_eq(temp->connection, connector->connection);
+	igt_assert_eq(temp->connection, baseline->connection);
 	drmModeFreeConnector(temp);
 
+	drmModeFreeConnector(baseline);
 	igt_display_fini(&display);
 }
 
-- 
2.34.1

