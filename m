Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4B4CCFA13
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 23:21:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B3710E9FD;
	Thu,  6 Nov 2025 23:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lW2whOV1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1096210E9F9
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 23:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762471282; x=1794007282;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R1ZCCGUfrbzjM/Bqg6Zd2Cs9+J9fnVuqgOZvzOHITUU=;
 b=lW2whOV1e1/XxWk/nxU5aYXh1uGCDc+jfxJmF3iZJhJVAOpxbnFuTUGC
 8O5PzKiyAFrgnjolhjpRzX6MAc3SPNZzgRD8vgHlQOvw7ZX2o2lr+SQgL
 ezdng2B/1LFX/VI5ZbU2m8YA6NhPyX4NdzQQ5SfTgsaZ2z8cu+h+LuY0O
 MqIHn7qUwcapfJplUQRkEgVQsS3wYEhUt9OxZLxzaAFmg/GGTS8aFMtQj
 mufqq2VoYgsb+htyJC/tgR0Su9qn3LTMyXqAAmpALq4Lb+DrEw33Ep2Pz
 lWzSVhXXqR/7uylHsPPYCiFQLlFdO+XFHBlrZVE2BnpTbN7XjbOByszAR Q==;
X-CSE-ConnectionGUID: /r6x5eHlTOOZxkBNJ9Hxew==
X-CSE-MsgGUID: Obj1PaCYQLS8SntRYL5eLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="75736326"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="75736326"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 15:21:21 -0800
X-CSE-ConnectionGUID: 6PekM5A7RmehQe2XZSAGvg==
X-CSE-MsgGUID: KBEul59IT72I9S+M1J+IbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="218632299"
Received: from dut4025lnl.fm.intel.com ([10.105.8.193])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 15:21:21 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH v2] tests/intel/xe_pmu: Tie preempt timeout to exec quantum
Date: Thu,  6 Nov 2025 23:21:21 +0000
Message-ID: <20251106232120.277273-2-jonathan.cavitt@intel.com>
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

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_pmu.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 9525655ba2..23c8c0bb57 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -971,10 +971,13 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	assert_within_epsilon_up_down(max[0], orig_max, tolerance, 0.15f);
 }
 
+#define VF_EXEC_QUANTUM	32
+#define PF_MULTIPLIER	2
+#define PT_TO_EQ_RATIO	1000
 static unsigned int enable_and_provision_vfs(int fd)
 {
 	unsigned int gt, num_vfs;
-	int pf_exec_quantum = 64, vf_exec_quantum = 32, vf;
+	int target_dur_ms, vf;
 
 	igt_require(igt_sriov_is_pf(fd));
 	igt_require(igt_sriov_get_enabled_vfs(fd) == 0);
@@ -987,12 +990,19 @@ static unsigned int enable_and_provision_vfs(int fd)
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
-			xe_sriov_set_exec_quantum_ms(fd, fn, gt, fn ? vf_exec_quantum :
-						     pf_exec_quantum);
+		for (int fn = 0; fn <= num_vfs; fn++) {
+			target_dur_ms = VF_EXEC_QUANTUM;
+			target_dur_ms *= fn ? 1 : PF_MULTIPLIER;
+			xe_sriov_set_exec_quantum_ms(fd, fn, gt, target_dur_ms);
+			xe_sriov_set_preempt_timeout_us(fd, fn, gt,
+							PT_TO_EQ_RATIO * target_dur_ms);
+		}
 	}
 
 	/* probe VFs */
@@ -1000,7 +1010,7 @@ static unsigned int enable_and_provision_vfs(int fd)
 	for (vf = 1; vf <= num_vfs; vf++)
 		igt_sriov_bind_vf_drm_driver(fd, vf);
 
-	total_exec_quantum = pf_exec_quantum + (num_vfs * vf_exec_quantum);
+	total_exec_quantum = (PF_MULTIPLIER + num_vfs) * VF_EXEC_QUANTUM;
 
 	return num_vfs;
 }
@@ -1011,8 +1021,10 @@ static void unprovision_and_disable_vfs(int fd)
 
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

