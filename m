Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233E6CCFA05
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 15:12:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3C110EAFE;
	Fri,  7 Nov 2025 15:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YIMrPUjB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2694E10EAF6
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 15:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762528372; x=1794064372;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w+oBlTqnJO3tHjR/ipE1k615LMW2OQR7L+1t75LnM9g=;
 b=YIMrPUjBY7m7xXS5O7jYndB4mEbDh7UCw4T2TNldXzOwVcBftSMjFNOT
 FG0XuBI+uozl5KZ86ZLKAL8/0MGYkThVfuxNT7xny/l9vlG+/eceFlS81
 ch8IxswNjQnaVyffLpaJuRG+DWcB7gel25o41qVjmocJInYPi6V0D3a/t
 QG1eptpZVSvrgmBi3sfc3AlTgLtfFr3jcCOcJ+ri9JARyyBBtVX0U+Ub7
 XuHZJdRRf7Lw4RFGccTX7idSlPf3WBZyVtWerOcE3KL+0dSB8zxvoqEfL
 QY7JRfbCCGWdjSnh9NXSchNjNnTVcxLGZG7vXmAuNYqqDybHha20/3/N4 w==;
X-CSE-ConnectionGUID: WjwHTu6sRJ+hWk2mGJbdMQ==
X-CSE-MsgGUID: 5Epd0v3+R72YS6c65eMleQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="68539679"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="68539679"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 07:12:51 -0800
X-CSE-ConnectionGUID: k7UPka/6S8+q6QV+5rei7A==
X-CSE-MsgGUID: 8CjvW/FoRBGxvr8+ro52sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="211502172"
Received: from live-gta-imageloader.fm.intel.com (HELO
 DUT4025LNL.fm.intel.com) ([10.105.8.193])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 07:12:51 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH v3] tests/intel/xe_pmu: Tie preempt timeout to exec quantum
Date: Fri,  7 Nov 2025 15:12:52 +0000
Message-ID: <20251107151251.6323-2-jonathan.cavitt@intel.com>
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
preempt timeout value to be equal to the exec quantum value.  Also,
reset the preempt timeout value on test end in
unprovision_and_disable_vfs.

v2:
- Multiply exec quantum by 1 instead of 2 to get the preempt timeout
  (Michal)
- Compress the vf and pf exec quantum and preempt timeout values into a
  single define (VF_EXEC_QUANTUM), and operate on that using a
  PF_MULTIPLIER and PT_TO_EQ_RATIO to generate the requested values for
  xe_sriov_set_exec_quantum_ms and xe_sriov_set_preempt_timeout_us in
  enable_and_provision_vfs (jcavitt)

v3:
- Revert conversion to defined macros and just add pf_preempt_timeout
  and vf_preempt_timeout as variables (Michal)

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_pmu.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 9525655ba2..bc6688744f 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -974,6 +974,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 static unsigned int enable_and_provision_vfs(int fd)
 {
 	unsigned int gt, num_vfs;
+	int pf_preempt_timeout = 64000, vf_preempt_timeout = 32000;
 	int pf_exec_quantum = 64, vf_exec_quantum = 32, vf;
 
 	igt_require(igt_sriov_is_pf(fd));
@@ -987,12 +988,18 @@ static unsigned int enable_and_provision_vfs(int fd)
 	num_vfs = igt_sriov_get_enabled_vfs(fd);
 	igt_require(num_vfs == 2);
 
-	/* Set 32ms for VF execution quantum and 64ms for PF execution quantum */
+	/*
+	 * Set 32ms for VF execution quantum and 64ms for PF execution quantum.
+	 * Set the preempt timeout for the VF and PF to equal their execution quantum.
+	 */
 	xe_for_each_gt(fd, gt) {
 		xe_sriov_set_sched_if_idle(fd, gt, 0);
-		for (int fn = 0; fn <= num_vfs; fn++)
+		for (int fn = 0; fn <= num_vfs; fn++) {
 			xe_sriov_set_exec_quantum_ms(fd, fn, gt, fn ? vf_exec_quantum :
 						     pf_exec_quantum);
+			xe_sriov_set_preempt_timeout_us(fd, fn, gt, fn ? vf_preempt_timeout :
+							pf_preempt_timeout);
+		}
 	}
 
 	/* probe VFs */
@@ -1011,8 +1018,10 @@ static void unprovision_and_disable_vfs(int fd)
 
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

