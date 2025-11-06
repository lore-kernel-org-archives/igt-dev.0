Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23514CCFA13
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 22:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAB110E9E0;
	Thu,  6 Nov 2025 22:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NwwLEt8V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482D910E9E0
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 22:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762467171; x=1794003171;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GMu8XKnDne7gq3YMR8YETUZmYWbuakZZPRPmIo/m1Nk=;
 b=NwwLEt8VhsLCxtU0Qg8m+ZZ89G0D2xhTyIAegoXuOTVEg/ZRMZsS3lPG
 GeCJnaY0Z9BRVzAczgT8kxLSkt1EAqM6luQjNw3q2Ib2fxhiXfQaLmz6n
 JAPH3gICHeTico35ALerY98VcOf9vVHRySqk+sWgEtTKRUYFcP8c9/6uA
 G5h/upfWDXQ3q4AevmombGzeDzFpK/aIlEdZenef+3ApXZLxLIduTeRa0
 tE8J6bIhoxQmswWkhYCV5oRKTvzrZbTQP+0MaRLnMymr1prKmi+LDoeIt
 R9PCZB13o+yyTDc+AgvYX9Buc4vfpYU5LQz35luCvgpwebgE5+czHuHb3 g==;
X-CSE-ConnectionGUID: 0kw/1lKfQ0OFszjquZyEPg==
X-CSE-MsgGUID: avEa+nBHTNilw9LET5yeBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="74908769"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="74908769"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 14:12:50 -0800
X-CSE-ConnectionGUID: eeHM6ITRSfeKps/mtIUppw==
X-CSE-MsgGUID: n/3QZA2RRC+Tac5YEO5lCA==
X-ExtLoop1: 1
Received: from dut4025lnl.fm.intel.com ([10.105.8.193])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 14:12:49 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH] tests/intel/xe_pmu: Tie preempt timeout to exec quantum
Date: Thu,  6 Nov 2025 22:12:49 +0000
Message-ID: <20251106221248.260255-2-jonathan.cavitt@intel.com>
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

When updating the exec quantum in enable_and_provision_vfs, update the
preempt timeout value to be double the exec quantum value.  Also, reset
the preempt timeout value on test end in unprovision_and_disable_vfs.
The value for the preempt timeout here was chosen because it's what
we've used historically for cases like this.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_pmu.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 9525655ba2..e7c2d82da4 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -987,12 +987,18 @@ static unsigned int enable_and_provision_vfs(int fd)
 	num_vfs = igt_sriov_get_enabled_vfs(fd);
 	igt_require(num_vfs == 2);
 
-	/* Set 32ms for VF execution quantum and 64ms for PF execution quantum */
+	/*
+	 * Set 32ms for VF execution quantum and 64ms for PF execution quantum.
+	 * Set the preempt timeout for the VF and PF to be double their execution quantum.
+	 */
 	xe_for_each_gt(fd, gt) {
 		xe_sriov_set_sched_if_idle(fd, gt, 0);
-		for (int fn = 0; fn <= num_vfs; fn++)
+		for (int fn = 0; fn <= num_vfs; fn++) {
 			xe_sriov_set_exec_quantum_ms(fd, fn, gt, fn ? vf_exec_quantum :
 						     pf_exec_quantum);
+			xe_sriov_set_preempt_timeout_us(fd, fn, gt, 2000 *
+							(fn ? vf_exec_quantum : pf_exec_quantum));
+		}
 	}
 
 	/* probe VFs */
@@ -1011,8 +1017,10 @@ static void unprovision_and_disable_vfs(int fd)
 
 	xe_for_each_gt(fd, gt) {
 		xe_sriov_set_sched_if_idle(fd, gt, 0);
-		for (int fn = 0; fn <= num_vfs; fn++)
+		for (int fn = 0; fn <= num_vfs; fn++) {
 			xe_sriov_set_exec_quantum_ms(fd, fn, gt, 0);
+			xe_sriov_set_preempt_timeout_us(fd, fn, gt, 0);
+		}
 	}
 
 	xe_sriov_disable_vfs_restore_auto_provisioning(fd);
-- 
2.43.0

