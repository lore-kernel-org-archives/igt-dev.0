Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6CDC44501
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 09:56:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6306C10F7E6;
	Fri, 10 Jul 2026 09:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uu2Gl7Dw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D89910F7E6
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 09:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783677377; x=1815213377;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x3grSskQTEjIIu3SbxkHcT6Rnt8WYzQsL7ceAhQA+bI=;
 b=Uu2Gl7DwMh/TsRiKrQUtj0bkoSrNhe9SB2qZUKIPDTKivhx32WYJ+S6e
 FCBBQVqCGmLjVaia//YN6o/J8F33aY6GmMR7NvW+9v4Eq+g0J77qh9yqz
 GmZ+r7qrfnilxBh3KbXujYqpIzKiE+vYMObPFZlHSBkZl3zlYguajlgNs
 uylH5ujQP87svZhN6qoOLsjMajvKUIyYFE/hZgyanugmaSao6bpIbTYpo
 PTwLFNarLAHNIdQDuNo/cpM8RLMZd9Q4SvOBBwU3iykpYl53ZH9htyaMD
 FdivelU/EhJfXcld/OCQfzREOktmY2j2q1d7xFQga2UgC/8KO7RX3wkp/ Q==;
X-CSE-ConnectionGUID: P6M35JLgQNimG+KR/QY87g==
X-CSE-MsgGUID: qTVHFfQQQ4i0wmcrh7bbNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84232228"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84232228"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 02:56:17 -0700
X-CSE-ConnectionGUID: /BPDovK6QoiYPuOda0aiHw==
X-CSE-MsgGUID: ATpcyi5iTpStrM173FZhUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="279253614"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 02:56:14 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_force_connector_basic: fix
 force-connector-state for HDMI 2.1
Date: Fri, 10 Jul 2026 15:49:24 +0530
Message-ID: <20260710101924.2741256-1-sowmiya.s@intel.com>
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

Remove igt_display_reset() before igt_display_commit() in
force_connector_state(). The reset disables all CRTCs, causing the
display engine to transition to a lower DC state (DC6/DC9), which
cuts power to the HDMI PHY. HDMI 2.1 monitors de-assert HPD when
the PHY loses power, so FORCE_CONNECTOR_UNSPECIFIED reads HPD=LOW
and reports disconnected, failing the state-restore assertion.

Re-probe the connector after the commit to capture its accurate
natural state as the baseline for the FORCE_CONNECTOR_UNSPECIFIED
check.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_force_connector_basic.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
index 4ea6b0e8c..ec8b0e25f 100644
--- a/tests/kms_force_connector_basic.c
+++ b/tests/kms_force_connector_basic.c
@@ -181,10 +181,14 @@ static void force_connector_state(int drm_fd, drmModeConnectorPtr connector)
 
 	igt_display_require(&display, drm_fd);
 
-	/* Reset display before attempt to use it. */
-	igt_display_reset(&display);
 	igt_display_commit(&display);
 
+	/* Re-probe to get the connector's original state with HPD accurate. */
+	temp = drmModeGetConnector(drm_fd, connector->connector_id);
+	igt_require(temp);
+	connector->connection = temp->connection;
+	drmModeFreeConnector(temp);
+
 	/* Force the connector on and check the reported values. */
 	kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON);
 	temp = drmModeGetConnectorCurrent(drm_fd,
-- 
2.43.0

