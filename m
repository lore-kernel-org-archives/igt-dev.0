Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000D9CD4F59
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 08:53:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63DF10E108;
	Thu,  5 Sep 2024 08:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EDdVJSE9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B097B10E079
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 08:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725526428; x=1757062428;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=17+VGgrozS1+d7e5SZeXGwkgKrSH2wFSurMzbfgk6h0=;
 b=EDdVJSE9hxNs6m2JeDDt+6EH8rZBMp4W2HTSn2fFE9Fo2oA8veiiCO0a
 GKDf7Ddhq0efeK9aqnA7GpZBlRExftMMrqKsduU+jPJFGyfqrhsfXQjsm
 thI+uT5+TI37eMUQQCniPYvzicOwu9QdEg9vCSXgVwFrHTBiniOHSLj2J
 s3AWMMp8cFoD9rbgsbSRce9xRemT2KYKdHQoK7En5d1DdOb/YFqeJs+ns
 G0zDarN2g/tTO43QKv8v7016g7D0Sy0dkuf5CE5TOGLdlWw73nYtQ42jp
 fQK7LQL+bJj5RXmxMA2ts62mpqj2n/RP9uqZIaun2eqodTd5f6rggwx0Q g==;
X-CSE-ConnectionGUID: iwKVTVeRRCK7YP70TCjN3A==
X-CSE-MsgGUID: 4q6NC6M9TE+ZX8zKoGw60g==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24031632"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="24031632"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 01:53:48 -0700
X-CSE-ConnectionGUID: p8kPr3EPRM60Sslf/KL7FQ==
X-CSE-MsgGUID: dpVa7O0aSj6GdbXEP+CqIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="70474424"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 01:53:46 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 1/1] lib/igt_psr: Remove SRD status change check for
 DP2.1 Panel Replay
Date: Thu,  5 Sep 2024 14:23:15 +0530
Message-ID: <20240905085315.1566848-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240905085315.1566848-1-ramanaidu.naladala@intel.com>
References: <20240905085315.1566848-1-ramanaidu.naladala@intel.com>
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

We do not have ALPM on the DP2.1 Panel Replay. Due to this, the
SRD_STATUS [SRD State] doesn't change from SRDENT_ON after Panel
Replay is enabled until it gets disabled. As a result, the igt
tests fail. To resolve this issue, add a condition to skip the
check in the 'psr_wait_update' and 'psr_long_wait_update'
functions for DP2.1 PR.

v1: Update change for all users of psr_wait_update and
    psr_long_wait_update. (Jouni)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/igt_psr.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index e3e7577eb..2677d4822 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -113,12 +113,28 @@ bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 
 bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 {
-	return igt_wait(!psr_active_check(debugfs_fd, mode, output), 40, 1);
+	/*
+	 * TODO: After enabling Panel Replay on DP2.1, observe that the SRD status
+	 * remains in the SRDENT_ON state. Remove the polling mechanism for the SRD
+	 * status change for the DP2.1 output.
+	 */
+	if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
+		return igt_wait(psr_active_check(debugfs_fd, mode, output), 40, 1);
+	else
+		return igt_wait(!psr_active_check(debugfs_fd, mode, output), 40, 1);
 }
 
 bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 {
-	return igt_wait(!psr_active_check(debugfs_fd, mode, output), 500, 1);
+	/*
+	 * TODO: After enabling Panel Replay on DP2.1, observe that the SRD status
+	 * remains in the SRDENT_ON state. Remove the polling mechanism for the SRD
+	 * status change for the DP2.1 output.
+	 */
+	if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
+		return igt_wait(psr_active_check(debugfs_fd, mode, output), 500, 1);
+	else
+		return igt_wait(!psr_active_check(debugfs_fd, mode, output), 500, 1);
 }
 
 static ssize_t psr_write(int debugfs_fd, const char *buf, igt_output_t *output)
-- 
2.43.0

