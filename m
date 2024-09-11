Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A65EE0214
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 08:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DDB10E10F;
	Wed, 11 Sep 2024 08:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bgDYq5+S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7123310E10F
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 08:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726042036; x=1757578036;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oXtB04c9qZvC+gvD0sEknMrHxv4XHXsj7ijPjPSbI2U=;
 b=bgDYq5+SHCt5di4DhoU6vyEu9aVFHxhIS57JcFNPIuR7cGKKs0Qgs495
 JOZ3gCE7Zyrj8/axF8Z7Xl/XjYA1uk5nHR7t7p6KvvFIWEpCGtESVFDvq
 bEFSKzznsU52UlbHVUbxygl7+TOn49GmNorHFZEbgXwZ2kk/Gk4GQUyNU
 mFOmCi91NJKPdEd08GdUABWrxoL+qI0BR367xFgq6RoSxGbQlFWtE00hc
 bAl69mMqWvLZFpSzE1kVQmtgfGtqbPIrFg/pSlXYIw6MY2MyBHTCASJZi
 Vw1qUppc8VkD0xqdmRLGyiQG1VnU6B1+npUSUJ19BShzmLHnJ0fcI6nFj w==;
X-CSE-ConnectionGUID: 1VyvmwuETvSGCvAxExbycQ==
X-CSE-MsgGUID: S4OOtqEQRv+GGB+LsEcHSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="25022593"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="25022593"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 01:07:16 -0700
X-CSE-ConnectionGUID: b8VHhdvuRLuw0ljB1xw9wA==
X-CSE-MsgGUID: Faly+jJKRNaaCUvGhYME1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="72271548"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 01:07:14 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [i-g-t 1/2] Revert "lib/igt_psr: Remove SRD status change check for
 DP2.1 Panel Replay"
Date: Wed, 11 Sep 2024 13:27:44 +0530
Message-ID: <20240911075745.635978-1-bhanuprakash.modem@intel.com>
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

Causing regression in CI BAT.

This reverts commit 99861b72ee396a57712bbd0993f3d037cb3e7d40.

Issue: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2748
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_psr.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 09107cd5b..4e44f44e6 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -114,28 +114,12 @@ bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 
 bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 {
-	/*
-	 * TODO: After enabling Panel Replay on DP2.1, observe that the SRD status
-	 * remains in the SRDENT_ON state. Remove the polling mechanism for the SRD
-	 * status change for the DP2.1 output.
-	 */
-	if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
-		return igt_wait(psr_active_check(debugfs_fd, mode, output), 40, 1);
-	else
-		return igt_wait(!psr_active_check(debugfs_fd, mode, output), 40, 1);
+	return igt_wait(!psr_active_check(debugfs_fd, mode, output), 40, 1);
 }
 
 bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 {
-	/*
-	 * TODO: After enabling Panel Replay on DP2.1, observe that the SRD status
-	 * remains in the SRDENT_ON state. Remove the polling mechanism for the SRD
-	 * status change for the DP2.1 output.
-	 */
-	if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
-		return igt_wait(psr_active_check(debugfs_fd, mode, output), 500, 1);
-	else
-		return igt_wait(!psr_active_check(debugfs_fd, mode, output), 500, 1);
+	return igt_wait(!psr_active_check(debugfs_fd, mode, output), 500, 1);
 }
 
 static ssize_t psr_write(int debugfs_fd, const char *buf, igt_output_t *output)
-- 
2.43.0

