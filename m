Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23746C02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 18:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53B310E968;
	Wed, 12 Feb 2025 18:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OXbzwQ16";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C43A10E968
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 18:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739386098; x=1770922098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7oBvYfiOfhbYtJwSIrCoEuWWU89bHH1H0oQ2dBytwJg=;
 b=OXbzwQ16MZ7eF9Hp06PyqTP+X2VTiJziUyGmkzOaWZXKBOYfqIEgvhJq
 HzzPcdgOQlOrj655sa6H1FAk+Sb+29FL+UNUjI/484Y6vFaQdOyQ5eA1k
 d3wc/yklBMjfkZUV1qLwo5j50C9qfG5Q14hHScFyNA0hVlcz6BIgLNhA3
 1U/ZZK6Ltf6heUhfwcx7wh0tHR5BjitLftNBvt9N7drs431mztwc2RzNU
 ZQJbcbyjtlPvC2P+hdsHhjS8knnzxnj08NzFrrynaIsdxZHU38N+eK+IR
 MBzr5NopKnI4QWBiHApSXG2VJ1O7xnbbOxVxWc+iygba2H+VD+3PasJQl g==;
X-CSE-ConnectionGUID: 22r/FH/gQHCywNxtAz49ow==
X-CSE-MsgGUID: lP6V4GlZQ0O77XWZd/BVXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40209781"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="40209781"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 10:48:18 -0800
X-CSE-ConnectionGUID: EGMQRXmOSbe51MOPtlADyA==
X-CSE-MsgGUID: zOhHgQ7JSYa5YSa94i662A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117028637"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.17.221])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 10:48:15 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v2 i-g-t 2/5] lib/xe/xe_sriov_provisioning: Add helper to
 check default scheduling attributes
Date: Wed, 12 Feb 2025 19:47:54 +0100
Message-Id: <20250212184757.586071-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250212184757.586071-1-marcin.bernatowicz@linux.intel.com>
References: <20250212184757.586071-1-marcin.bernatowicz@linux.intel.com>
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
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
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
index 4d6ad88ce..aa265247e 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -721,3 +721,45 @@ void xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_nu
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
index 9d0c2ed85..4f2a4c13e 100644
--- a/lib/xe/xe_sriov_provisioning.h
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -147,5 +147,6 @@ int __xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_n
 				  enum xe_sriov_sched_priority value);
 void xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,
 				 enum xe_sriov_sched_priority value);
+void xe_sriov_require_default_scheduling_attributes(int pf);
 
 #endif /* __XE_SRIOV_PROVISIONING_H__ */
-- 
2.31.1

