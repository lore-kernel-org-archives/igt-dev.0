Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FCAC5DF7E
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 12:43:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B6010EAF0;
	Tue, 18 Aug 2026 12:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U4iuyqUr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44BD10EAF0
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 12:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787056804; x=1818592804;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/rxsdNJARcg2i5dJIkaQtsp3q9MikKzTSU76figgt9Y=;
 b=U4iuyqUrqfadPJZDhkVi5gtwQaBRQGoqtWupWqGVaA0JnP1DOV5IhSFX
 OZvxVd42GKmlrmnYtzTuHRbVUtHctNchZzFXCAs9o1DTGtyAY+7d/Kkf7
 ZR0BNzt+YA7sdigIO8S0cGvSaSoclrbuUPdVpSjCUzkq/NVj7K7wy7ETF
 9Yt5VHdzfpQ+fF9Pvn0kvNdgmrLGlDHcuI5+Zk9DazZFN4htYnSIVxE/n
 bMvm1G9ijWOjDxP17xpVBulVYN1ds69wdd2ooRc16NRgcFcoG9CkznL1M
 aAn7AHJzD9k0P8cCvUeya5agcBnVFThmW2+D+73czqD/boZlJ/iKfCz0b A==;
X-CSE-ConnectionGUID: HI2uJIR1RKOkkM0/rMZLGg==
X-CSE-MsgGUID: Na2uTLqyTuyKf77gTxf2kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87402372"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="87402372"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 05:40:04 -0700
X-CSE-ConnectionGUID: 5/3koyzoRf+ctDfXJDtvAA==
X-CSE-MsgGUID: 2ytBWVs+SCOgD93+wMj+8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="262589704"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.106])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 05:40:01 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH i-g-t 6/6] tests/intel/xe_pmu: Disable VFs before restoring
 sched params
Date: Tue, 18 Aug 2026 14:39:30 +0200
Message-ID: <d0b59bb2a7b41f0087ed85e71cfdce29ea21b902.1787056235.git.marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787056235.git.marcin.bernatowicz@linux.intel.com>
References: <cover.1787056235.git.marcin.bernatowicz@linux.intel.com>
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

Restore scheduling defaults after VFs are disabled rather than while they
are still active, matching the cleanup order already used by
xe_sriov_scheduling. Resetting scheduling parameters of active VFs can
leave cleanup incomplete and cause subsequent VF probing to fail.

Assisted-by: Copilot:Claude-Opus-5
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 tests/intel/xe_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 2d1bc1f61..a8ceac46c 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -1023,8 +1023,8 @@ static void unprovision_and_disable_vfs(int fd)
 {
 	int ret;
 
-	ret = __xe_sriov_admin_bulk_restore_sched_defaults(fd);
 	xe_sriov_disable_vfs_restore_auto_provisioning(fd);
+	ret = __xe_sriov_admin_bulk_restore_sched_defaults(fd);
 	/* abort to avoid execution of next tests with enabled VFs */
 	igt_abort_on_f(igt_sriov_get_enabled_vfs(fd) > 0,
 		       "Failed to disable VF(s)");
-- 
2.43.0

