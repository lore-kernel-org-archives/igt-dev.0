Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B539BC44506
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 08:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6485310E586;
	Mon, 13 Jul 2026 08:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AtUcp/3z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC3F10E586
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 08:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783929758; x=1815465758;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lrwozX0xOOymW9BncgrAQFzRH43ILjWXK/Y/Qf7TZNk=;
 b=AtUcp/3zOTucTWpDpbOUcL9tikfwK9zVPZWeGJCaMm/u0km15/NTjKLc
 4ZCUMl5qxGDLhKV39efNlfbUB8R/nrId4j3uNfn+F9H+UDfYv13p1yybc
 Qkb5UHV5Qud32p1w4UOXbVUB3Tr2P6ywd6CSpYWSTnWYypOiIqJkFAyH1
 3PAD/4HwqhOTKynAKGyX3tJX3Lq/tN2LzwwspWSnFXwmWYCBAlMP4lISP
 iDnC8M8go02RmY5qulivkl++naRFdjOpcizXtUhi8IDr3yb9oGPVX4IFX
 mz69NVXejtOBTxri5pIyvglNjSM+Msb0+edOEXBuq9CtP/aGZhcW0Upo3 Q==;
X-CSE-ConnectionGUID: A8hwCBOQT+22zErcmOV8eQ==
X-CSE-MsgGUID: pn8ZpXBqR/KjaXMhCU5f4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95900592"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="95900592"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 01:02:38 -0700
X-CSE-ConnectionGUID: Vkv8u+WBTKSMvMUIqBboaw==
X-CSE-MsgGUID: 6PGyN/e9SSKRBtX0bueHwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="249116242"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 13 Jul 2026 01:02:36 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, sowmiya.s@intel.com, swati2.sharma@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t] tests/kms_force_connector_basic: re-baseline connector
 state before comparing
Date: Mon, 13 Jul 2026 13:32:28 +0530
Message-Id: <20260713080227.3989038-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

force_connector_state and force_edid compare against a snapshot of
the connector taken once in igt_fixture(). When a later probe
enumerates a different connection state or mode set than that
snapshot (e.g. a DP-to-HDMI adaptor still initializing, or HPD
disturbed by display power transitions), the subtests fail even
though the force paths under test work correctly.

Re-sample the connector inside each subtest after its own setup
has settled, and compare against that baseline.

Assisted-by: GitHub Copilot:Claude Opus 4.7
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_force_connector_basic.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
index 4ea6b0e8c..5bb3b870c 100644
--- a/tests/kms_force_connector_basic.c
+++ b/tests/kms_force_connector_basic.c
@@ -177,7 +177,7 @@ static void force_load_detect(int drm_fd, drmModeConnectorPtr connector, drmMode
 static void force_connector_state(int drm_fd, drmModeConnectorPtr connector)
 {
 	igt_display_t display;
-	drmModeConnector *temp;
+	drmModeConnector *baseline, *temp;
 
 	igt_display_require(&display, drm_fd);
 
@@ -185,6 +185,9 @@ static void force_connector_state(int drm_fd, drmModeConnectorPtr connector)
 	igt_display_reset(&display);
 	igt_display_commit(&display);
 
+	baseline = drmModeGetConnector(drm_fd, connector->connector_id);
+	igt_assert(baseline);
+
 	/* Force the connector on and check the reported values. */
 	kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON);
 	temp = drmModeGetConnectorCurrent(drm_fd,
@@ -207,15 +210,16 @@ static void force_connector_state(int drm_fd, drmModeConnectorPtr connector)
 				FORCE_CONNECTOR_UNSPECIFIED);
 	temp = drmModeGetConnectorCurrent(drm_fd,
 					  connector->connector_id);
-	igt_assert_eq(temp->connection, connector->connection);
+	igt_assert_eq(temp->connection, baseline->connection);
 	drmModeFreeConnector(temp);
 
+	drmModeFreeConnector(baseline);
 	igt_display_fini(&display);
 }
 
 static void force_edid(int drm_fd, drmModeConnectorPtr connector)
 {
-	drmModeConnector *temp;
+	drmModeConnector *baseline, *temp;
 
 	kmstest_force_connector(drm_fd, connector,
 				FORCE_CONNECTOR_ON);
@@ -223,6 +227,9 @@ static void force_edid(int drm_fd, drmModeConnectorPtr connector)
 					  connector->connector_id);
 	drmModeFreeConnector(temp);
 
+	baseline = drmModeGetConnector(drm_fd, connector->connector_id);
+	igt_assert(baseline);
+
 	/* Test edid forcing. */
 	kmstest_force_edid(drm_fd, connector,
 			   igt_kms_get_base_edid());
@@ -249,9 +256,10 @@ static void force_edid(int drm_fd, drmModeConnectorPtr connector)
 	 * The connector should now have the same number of modes that
 	 * it started with.
 	 */
-	igt_assert_eq(temp->count_modes, connector->count_modes);
+	igt_assert_eq(temp->count_modes, baseline->count_modes);
 	drmModeFreeConnector(temp);
 
+	drmModeFreeConnector(baseline);
 }
 
 static void prune_stale_modes(int drm_fd, drmModeConnectorPtr connector)
-- 
2.34.1

