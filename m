Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34BCECE582
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 07:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2B610E727;
	Tue, 10 Sep 2024 07:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f010CN58";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD2910E6A0
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 07:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725953982; x=1757489982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=17+VGgrozS1+d7e5SZeXGwkgKrSH2wFSurMzbfgk6h0=;
 b=f010CN58xvauWLlY8sZPW8P4Jtm2IP2XlRgIT7MOgG199YrdmIPOLNbf
 yeYc5CxJi6VQcRM+PasO/AEwMawCyCVsnRgBgc9zasgy6T4etdddkvOGd
 KuPinkf25caVS+LBiUjpQDYd85CZXSb+0aqjExenYuLhgVQjLKsxWxiBQ
 veVv6PVD+nLM1LgfnY5djU0L/FYU9GXVBrjsCqdyWt8uyoyRt0Fv/vzIQ
 J12rbhA5+pF+KvLVJYCa0w9HBaXDlyWjhb9uNqDvff/EwFMQqOeMF0OEK
 YpuJvtTocQ4Ur7YW6tXPwkfoHWNGIQXYY0QWRgdd1PZDJcRxVmFt+Z/Gd g==;
X-CSE-ConnectionGUID: +PGWjl1IQjaRHt5+MepBFg==
X-CSE-MsgGUID: pjDQFBZ1S6qX2NujBJqMSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24843753"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="24843753"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 00:39:42 -0700
X-CSE-ConnectionGUID: US9cqHhPT1Gja+lpfSYyWA==
X-CSE-MsgGUID: /Z0qUVePRBGre4tBLYhYvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="90233647"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 00:39:40 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH v2 1/2] lib/igt_psr: Remove SRD status change check for DP2.1
 Panel Replay
Date: Tue, 10 Sep 2024 13:09:07 +0530
Message-ID: <20240910073908.1608661-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240910073908.1608661-1-ramanaidu.naladala@intel.com>
References: <20240910073908.1608661-1-ramanaidu.naladala@intel.com>
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

