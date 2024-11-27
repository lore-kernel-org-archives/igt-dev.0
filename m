Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44388D6D237
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 20:03:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2BE10EBE5;
	Wed, 27 Nov 2024 20:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQGXUYuB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C421210EBE5
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 20:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732737809; x=1764273809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Rfg4lRvcIHvvDM3I2cQ2WcN/ou2GYbCtcCwSG7/UUo=;
 b=FQGXUYuBCsqr5LfCfRqM0PJzIB1dpw7VkCYf2JnMIBybGWx/N5qb/1I8
 a3xZ1rnOzk+7RX8ISzpPQFpZscVEULv2kcD0UEMK0c5BPqMrWVxULh+9Q
 N3ERNeHF1/Mp4CrV948wwV+AJ5WnbHwMSr5NHLfFILoEf/h06RsD+DCfS
 Ff62sEBSIlUOj2D7bkyxpL5n0eDV8Vu+G/GQHqROv00298CbgZbTb4moN
 FiYf5BZrFWItut9tj8bgo/stjlArHpFTBmEh//MgIVkwmoPUT2wrT99Vp
 24TXE9TF5mUn8ymGD3Bl8vdAcG1KBjCSagZcLhLnIUz/B37C23PL33zXh Q==;
X-CSE-ConnectionGUID: ZHppaHQzT66f93wXsL1yDg==
X-CSE-MsgGUID: k7nFsu5uT2yeNlfDbcGtYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="44344254"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="44344254"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 12:03:29 -0800
X-CSE-ConnectionGUID: 75AiKOwDRaGURONIqrDl9g==
X-CSE-MsgGUID: afoRJzVQSdWyix9ZN6lVzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="96484711"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.81.89])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 12:03:26 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 3/4] lib/xe/xe_sriov_provisioning: Add helper to check
 default scheduling attributes
Date: Wed, 27 Nov 2024 21:03:01 +0100
Message-Id: <20241127200302.1376594-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241127200302.1376594-1-marcin.bernatowicz@linux.intel.com>
References: <20241127200302.1376594-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Introduce a function to validate default SR-IOV scheduling attributes
for VFs and PF. This function skips the test if non-default attributes
are detected. The default attributes verified include:

- exec_quantum_ms set to 0 (infinite execution quantum)
- preempt_timeout_us set to 0 (infinite preemption timeout)
- sched_if_idle set to false
- reset_engine set to false
- sched_priority set to XE_SRIOV_SCHED_PRIORITY_LOW

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 lib/xe/xe_sriov_provisioning.c | 42 ++++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_provisioning.h |  1 +
 2 files changed, 43 insertions(+)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index a1c94daf0..0c5cd01fd 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -519,3 +519,45 @@ void xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_nu
 {
 	igt_fail_on(__xe_sriov_set_sched_priority(pf, vf_num, gt_num, value));
 }
+
+/**
+ * xe_sriov_require_default_scheduling_attributes - Ensure default SR-IOV scheduling attributes
+ * @pf_fd: PF device file descriptor
+ *
+ * Skips the current test if non-default SR-IOV scheduling attributes are set.
+ *
+ * Default scheduling attributes are as follows for each VF and PF:
+ * - exec_quantum_ms equals zero (meaning infinity)
+ * - preempt_timeout_us equals zero (meaning infinity)
+ * - sched_if_idle equals false
+ * - reset_engine equals false
+ * - sched_priority equals XE_SRIOV_SCHED_PRIORITY_LOW
+ */
+void xe_sriov_require_default_scheduling_attributes(int pf)
+{
+	unsigned int totalvfs = igt_sriov_get_total_vfs(pf);
+	enum xe_sriov_sched_priority sched_priority;
+	bool sched_if_idle, reset_engine;
+	uint32_t eq, pt;
+	unsigned int gt;
+
+	xe_for_each_gt(pf, gt) {
+		igt_skip_on(__xe_sriov_get_sched_if_idle(pf, gt, &sched_if_idle));
+		igt_require_f(!sched_if_idle, "sched_if_idle != false on gt%u\n", gt);
+		igt_skip_on(__xe_sriov_get_engine_reset(pf, gt, &reset_engine));
+		igt_require_f(!reset_engine, "reset_engine != false on gt%u\n", gt);
+
+		for (unsigned int vf_num = 0; vf_num <= totalvfs; ++vf_num) {
+			igt_skip_on(__xe_sriov_get_exec_quantum_ms(pf, vf_num, gt, &eq));
+			igt_require_f(eq == 0, "exec_quantum_ms != 0 on gt%u/VF%u\n", gt, vf_num);
+
+			igt_skip_on(__xe_sriov_get_preempt_timeout_us(pf, vf_num, gt, &pt));
+			igt_require_f(pt == 0, "preempt_timeout_us != 0 on gt%u/VF%u\n",
+				      gt, vf_num);
+
+			igt_skip_on(__xe_sriov_get_sched_priority(pf, vf_num, gt, &sched_priority));
+			igt_require_f(sched_priority == XE_SRIOV_SCHED_PRIORITY_LOW,
+				      "sched_priority != LOW on gt%u/VF%u\n", gt, vf_num);
+		}
+	}
+}
diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
index 8e85985b7..4ddf3149f 100644
--- a/lib/xe/xe_sriov_provisioning.h
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -99,5 +99,6 @@ int __xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_n
 				  enum xe_sriov_sched_priority value);
 void xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,
 				 enum xe_sriov_sched_priority value);
+void xe_sriov_require_default_scheduling_attributes(int pf);
 
 #endif /* __XE_SRIOV_PROVISIONING_H__ */
-- 
2.31.1

