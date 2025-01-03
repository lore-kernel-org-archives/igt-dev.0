Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0AAE77188
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jan 2025 15:33:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BD610E8E4;
	Fri,  3 Jan 2025 15:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P1Q4rao1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A5E10E8E4
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jan 2025 15:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735918426; x=1767454426;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mmaYfpjJ51yf3q2xkxEAbyrIo7mz0grqAJ0iVcVzhRw=;
 b=P1Q4rao1loRjiBa09qb1jAJgrYt05KBQEiU3OYjs8s+A90HJLCzfBi6D
 1VTAQcty53frcZxVVjXhsoUwIttfIoyO0w4vwbqDB6ylBefGtfQ8VPDT8
 IR8MZN0Lod0nraDjfQpBukXQ26210VMDCmPqQLbf+tKHHHFBIgnqfoLpr
 e7KkzsikHQQ9nXy/z7fFASBhPJ8jNEa2pCqSGIwT7o2sqVvH2HyArR0LQ
 XUP236bV365oU2cUjzTd7g8aWmttM5h+P+3rgRqw8a2khTeW9R6lALUZD
 INfijuqrhiKwvGluuBmML//NRKOHcgzJSy39IOP2wukCyYYqTqhqrfsvP Q==;
X-CSE-ConnectionGUID: iSdTL+KrRLONPcxa4fAexg==
X-CSE-MsgGUID: +0cBm6uIT7+yRh6vUWmsHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="39847999"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="39847999"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 07:33:46 -0800
X-CSE-ConnectionGUID: 4uF7RRMSSWy4R/kQVTOCDA==
X-CSE-MsgGUID: 1R3goqe6QeOg31fWaK5TfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105867565"
Received: from unknown (HELO rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.227.89.206])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 07:33:43 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, karthik.b.s@intel.com, jeevan.b@intel.com,
 kunal1.joshi@intel.com, luca@coelho.fi,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2] lib/igt_kms: Backup connector modes before sorting
Date: Fri,  3 Jan 2025 21:03:33 +0530
Message-Id: <20250103153333.4253-1-santhosh.reddy.guddati@intel.com>
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

Backup connector modes before sorting to ensure the original mode
is not changed if the joiner is not found.This will skip updating
connector->mode[0] if joiner is not available.

v2: Dont sort the modes, instead check for the required modes (Luca Coelho)

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13287
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_kms.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a67d17c4f..95e3059f7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6418,14 +6418,13 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 {
 	bool found = false;
 
-	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
-	found = igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dotclock);
-	if (!found) {
-		igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
-		found = igt_bigjoiner_possible(drm_fd, &connector->modes[0], max_dotclock);
+	for (int i=0; i< connector->count_modes; i++) {
+		if (igt_bigjoiner_possible(drm_fd, &connector->modes[i], max_dotclock)) {
+			*mode = connector->modes[i];
+			found = true;
+			break;
+		}
 	}
-	if (found)
-		*mode = connector->modes[0];
 	return found;
 }
 
@@ -6462,14 +6461,14 @@ bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
 {
 	bool found = false;
 
-	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
-	found = igt_ultrajoiner_possible(&connector->modes[0], max_dotclock);
-	if (!found) {
-		igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
-		found = igt_ultrajoiner_possible(&connector->modes[0], max_dotclock);
+	for (int i = 0; i < connector->count_modes; i++) {
+		if (igt_ultrajoiner_possible(&connector->modes[i], max_dotclock)) {
+			*mode = connector->modes[i];
+			found = true;
+			break;
+		}
 	}
-	if (found)
-		*mode = connector->modes[0];
+
 	return found;
 }
 
-- 
2.34.1

