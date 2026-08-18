Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B01C5DF7D
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 12:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EE610EB0B;
	Tue, 18 Aug 2026 12:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MyKUqG9E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6B210E3EB
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 12:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787056794; x=1818592794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iduUV7pBN8O0ooYOjpR5Q8ngoIu99wmzIe3kZdPYmUs=;
 b=MyKUqG9EBFws8E5wzZkto9ccmNP7V72ElqyiOHOV8r451CrtxyNGnVn6
 Vurzm8l9rJQ7klhOjFdOipgejTcWJcrWdLCstprDivAWPEGyoI7PtKLJk
 PRII5BxvkOeHaKkM+l2N2pbL+PCAejQMpqptS6BSrxoN19ImQ3LYLfjG4
 WrkXzXjn+b5iV9xj2L9j2QdljX+JqEBmK42OKRr81mt6bMzf6VxsTNyKT
 7kSuIv3Pxp6ihLiJH8CwApXvXOuIYMJ7zi4oGlIHgZk/s8RY2qja+nqu3
 xZcXUgR2YbQXv3qvXV1IxBifa0MzrFuMvrr0M4OSQ//vCMFAYdAK6jEBy g==;
X-CSE-ConnectionGUID: 955PHLvcR0OtERgxh1X9HA==
X-CSE-MsgGUID: 8McMLMaHS9mGlZWG9fJNuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98910947"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98910947"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 05:39:54 -0700
X-CSE-ConnectionGUID: Z7UR+EG7QwG38IsPUWZUFw==
X-CSE-MsgGUID: xX+9wVWRTXixeNS+MF0fUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="263886582"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.106])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 05:39:52 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH i-g-t 4/6] lib/xe/xe_sriov_admin: Add bulk scheduling params
 setter
Date: Tue, 18 Aug 2026 14:39:28 +0200
Message-ID: <17c3a7f8e02e94f11b7beb6e3359dbd8afeb4567.1787056235.git.marcin.bernatowicz@linux.intel.com>
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

Provisioning execution quantum, preemption timeout and priority is not
order independent. Priority above LOW combined with infinite timeslicing
is a risky state, which can be left via PAUSE/FLR, so timeslicing has to
be programmed before priority is raised.

Add struct xe_sriov_sched_params and a bulk setter that enforces that
order, and that rejects infinite execution quantum or preemption timeout.
Together with xe_sriov_admin_bulk_restore_sched_defaults(), which now
lowers priority first, callers get a safe setup and cleanup pair without
having to open code the sequence.

Assisted-by: Copilot:Claude-Opus-5
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 lib/xe/xe_sriov_admin.c | 53 +++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_admin.h | 20 ++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/lib/xe/xe_sriov_admin.c b/lib/xe/xe_sriov_admin.c
index 0433ddcfc..2f47d0965 100644
--- a/lib/xe/xe_sriov_admin.c
+++ b/lib/xe/xe_sriov_admin.c
@@ -505,6 +505,59 @@ void xe_sriov_admin_bulk_set_sched_priority(int pf_fd,
 	igt_assert_eq(0, __xe_sriov_admin_bulk_set_sched_priority(pf_fd, prio));
 }
 
+/**
+ * __xe_sriov_admin_bulk_set_sched_params - Set scheduling parameters for PF and all VFs
+ * @pf_fd:  PF device file descriptor.
+ * @params: Scheduling parameters to apply.
+ *
+ * Applies execution quantum and preemption timeout before priority, so that a
+ * priority above LOW is never active while timeslicing is still infinite.
+ *
+ * Both &xe_sriov_sched_params.exec_quantum_ms and
+ * &xe_sriov_sched_params.preempt_timeout_us must be non-zero. Use
+ * __xe_sriov_admin_bulk_restore_sched_defaults() to restore infinite timeslicing.
+ *
+ * Returns: 0 on success or negative errno on error.
+ */
+int __xe_sriov_admin_bulk_set_sched_params(int pf_fd,
+					   const struct xe_sriov_sched_params *params)
+{
+	int ret;
+
+	if (igt_warn_on_f(!params->exec_quantum_ms || !params->preempt_timeout_us,
+			  "Infinite timeslicing requires restoring defaults: eq=%u pt=%u\n",
+			  params->exec_quantum_ms, params->preempt_timeout_us))
+		return -EINVAL;
+
+	ret = __xe_sriov_admin_bulk_set_exec_quantum_ms(pf_fd, params->exec_quantum_ms);
+	if (igt_warn_on_f(ret, "Failed to bulk set exec quantum=%u: %d\n",
+			  params->exec_quantum_ms, ret))
+		return ret;
+
+	ret = __xe_sriov_admin_bulk_set_preempt_timeout_us(pf_fd, params->preempt_timeout_us);
+	if (igt_warn_on_f(ret, "Failed to bulk set preempt timeout=%u: %d\n",
+			  params->preempt_timeout_us, ret))
+		return ret;
+
+	ret = __xe_sriov_admin_bulk_set_sched_priority(pf_fd, params->priority);
+	if (igt_warn_on_f(ret, "Failed to bulk set sched priority=%d: %d\n",
+			  params->priority, ret))
+		return ret;
+
+	return 0;
+}
+
+/**
+ * xe_sriov_admin_bulk_set_sched_params - Assert wrapper for bulk scheduling params update
+ * @pf_fd:  PF device file descriptor.
+ * @params: Scheduling parameters to apply.
+ */
+void xe_sriov_admin_bulk_set_sched_params(int pf_fd,
+					  const struct xe_sriov_sched_params *params)
+{
+	igt_assert_eq(0, __xe_sriov_admin_bulk_set_sched_params(pf_fd, params));
+}
+
 /**
  * __xe_sriov_admin_vf_stop - Issue stop command for a VF
  * @pf_fd:  PF device file descriptor.
diff --git a/lib/xe/xe_sriov_admin.h b/lib/xe/xe_sriov_admin.h
index 4eb9c83a6..6d482f8bf 100644
--- a/lib/xe/xe_sriov_admin.h
+++ b/lib/xe/xe_sriov_admin.h
@@ -13,6 +13,22 @@
 
 struct igt_sysfs_choice;
 
+/**
+ * struct xe_sriov_sched_params - Scheduling parameters for a function
+ * @exec_quantum_ms: Execution quantum in milliseconds
+ * @preempt_timeout_us: Preemption timeout in microseconds
+ * @priority: Scheduling priority
+ *
+ * Zero @exec_quantum_ms or zero @preempt_timeout_us means infinity, which is
+ * only valid together with %XE_SRIOV_SCHED_PRIORITY_LOW. Use
+ * xe_sriov_admin_bulk_restore_sched_defaults() to return to that state.
+ */
+struct xe_sriov_sched_params {
+	uint32_t exec_quantum_ms;
+	uint32_t preempt_timeout_us;
+	enum xe_sriov_sched_priority priority;
+};
+
 bool xe_sriov_admin_is_present(int pf_fd);
 
 int  __xe_sriov_admin_set_exec_quantum_ms(int pf_fd, unsigned int vf_num, uint32_t eq_ms);
@@ -48,6 +64,10 @@ int __xe_sriov_admin_bulk_set_sched_priority(int pf_fd,
 					     enum xe_sriov_sched_priority prio);
 void xe_sriov_admin_bulk_set_sched_priority(int pf_fd,
 					    enum xe_sriov_sched_priority prio);
+int __xe_sriov_admin_bulk_set_sched_params(int pf_fd,
+					   const struct xe_sriov_sched_params *params);
+void xe_sriov_admin_bulk_set_sched_params(int pf_fd,
+					  const struct xe_sriov_sched_params *params);
 
 int  __xe_sriov_admin_vf_stop(int pf_fd, unsigned int vf_num);
 void  xe_sriov_admin_vf_stop(int pf_fd, unsigned int vf_num);
-- 
2.43.0

