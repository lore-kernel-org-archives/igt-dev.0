Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E89EE57CF
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 20:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A0910EA97;
	Wed, 11 Sep 2024 20:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+zeLrF+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA9410EA96
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 20:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726086284; x=1757622284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/8+9fHzocR68dEH15oCuHM1wWH8IJx1Kx1eL1Al+8w0=;
 b=S+zeLrF+R+3D+afcSVZTrW9vo6nJ2UE7RWJcl6u8/y6Bd8ET+KmZ/XM8
 i314PqSG27OpyWniKF/sdBUtOzIYivTOenWpg907zLSeFi+MrjU+oXhaB
 4gsDg2a3WaT0y5lhxs6PKiDFKfFTTfnG31nIAq56tJfDnmkC1Z3s6zCU8
 xxVkYI3/H1NXsE2t7n4lhH+DKA0h0yUksqfw+CJSR0CQ9hh2VqraiMnBI
 a+QI1aHaG7YFa4fNHkAc5/IDLD4h6v7M5cx0SNrcIq4z4WcCdhZaBoeqS
 HkpebkkmpjShBOAEZDgCFG9gLwSI67xy/IR0OSXQrF3Ow2YA4aBExLGYz g==;
X-CSE-ConnectionGUID: pTBSQA4PTRqWgk2wWd/lxQ==
X-CSE-MsgGUID: PHjUbVE/TPOsMdiqJk/YZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="35503420"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="35503420"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:24:44 -0700
X-CSE-ConnectionGUID: dpLfOvj1SE+j8G0E8qYbBw==
X-CSE-MsgGUID: 45qUfsDLRAitYKP69i0frA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="72078276"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 13:24:42 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jouni.hogander@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 1/2] lib/igt_psr: Remove SRD status change check for
 DP2.1 Panel Replay
Date: Thu, 12 Sep 2024 01:54:07 +0530
Message-ID: <20240911202408.1665929-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240911202408.1665929-1-ramanaidu.naladala@intel.com>
References: <20240911202408.1665929-1-ramanaidu.naladala@intel.com>
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
v2: Update null check in if condition

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/igt_psr.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index e3e7577eb..222e05e6c 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -113,12 +113,30 @@ bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 
 bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 {
-	return igt_wait(!psr_active_check(debugfs_fd, mode, output), 40, 1);
+	/*
+	 * TODO: After enabling Panel Replay on DP2.1, observe that the SRD status
+	 * remains in the SRDENT_ON state. Remove the polling mechanism for the SRD
+	 * status change for the DP2.1 output.
+	 */
+	if (output != NULL &&
+	    output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
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
+	if (output != NULL &&
+	    output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
+		return igt_wait(psr_active_check(debugfs_fd, mode, output), 500, 1);
+	else
+		return igt_wait(!psr_active_check(debugfs_fd, mode, output), 500, 1);
 }
 
 static ssize_t psr_write(int debugfs_fd, const char *buf, igt_output_t *output)
-- 
2.43.0

