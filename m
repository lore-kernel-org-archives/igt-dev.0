Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF47BCCA470
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 08:05:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D3110E087;
	Fri,  3 Oct 2025 08:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fXz6ACVI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3992410E087
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 08:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759478731; x=1791014731;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oEj/VG5OHSagmENhUcYzUKcdzCSTiQfpaNYzh1gYT70=;
 b=fXz6ACVIqRp+Zn8SbEvysLCJ8kzQ40+wMbR2Qptm82SXZ2X/f17Ikqvc
 BWXN/p/hCfvjE97GR53f2jn6A+UEfu2Aj5JEND3sbzISDin5i+ZbR7t7Q
 tuy2sVwvkHRWLLP185Plv3cvnxNlN8pAGkPp/qST++ZKkXF5yVtHN02S6
 qCSlw959c/g3dMPG1fl4tEc4NLjp9fs1b+EJxnNj4M33mKB9bHIfGgZlS
 hdnnGMels9uWQjeemL5XPHblsUUkrRau3MydvP1loqYTSjZnJcfQpco1/
 qcwxls7J3+G4Xzg0VM/ZfnyZV4c0AGI1l1IMHjUXdlow1sQIpSMjAp6/b w==;
X-CSE-ConnectionGUID: hPzYdhGSQrOe56i3ac7v7w==
X-CSE-MsgGUID: C1QPBw3KTSu1wlsbDtLnAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="84385709"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="84385709"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 01:05:31 -0700
X-CSE-ConnectionGUID: N0l0iwVfSHqxFI2FDsZpvg==
X-CSE-MsgGUID: qf5/eoOLR1Sbn8pHzChqGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; d="scan'208";a="184442949"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 01:05:29 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, swati2.sharma@intel.com, vinod.govindapillai@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/kms_fbcon_fbt: Skip CRC based FBC cursor
 check on simulation
Date: Fri,  3 Oct 2025 13:32:06 +0530
Message-Id: <20251003080206.569347-1-santhosh.reddy.guddati@intel.com>
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

Skip fbc_check_cursor_blinking on simulation as it involves CRC operations
which may cause hangs or false negatives during test execution.

v2: Move the check to fbc_wait_until_update to early return (Jeevan)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_fbcon_fbt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index f3843cdb0..810bc5114 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -183,6 +183,13 @@ static bool fbc_wait_until_update(struct drm_info *drm)
 	if (intel_gen(intel_get_drm_devid(drm->fd)) >= 9) {
 		if (!fbc_wait_until_enabled(drm->debugfs_fd))
 			return false;
+		/*
+		 * Skip cursor blinking check when running in simulation mode.
+		 * CRC operations are significantly slower in simulation,
+		 * so CRC checks are avoided to prevent false negatives.
+		 */
+		if (igt_run_in_simulation())
+			return true;
 
 		return fbc_check_cursor_blinking(drm);
 	} else {
-- 
2.34.1

