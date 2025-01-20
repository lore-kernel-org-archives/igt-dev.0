Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FCDC02182
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 20:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA5510E0F9;
	Mon, 20 Jan 2025 20:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JwTZJrky";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F5310E0F9
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 20:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737405300; x=1768941300;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xwa7r7aBea2QQOW7QB62YrG2tYp3bU70xIS4XM4TLLY=;
 b=JwTZJrkybOgE2XFRLQZA8YTolGGJz4ZqLZQAlphflVRLMtEfFcw6mriL
 htgLfgsI6qvoBeR+XYpbNDCuKfJp4hAfckEuDq/SGwxsJnjS+L21OMH7I
 KYmFRrBQrMMNUnU5oqSWGa3ZDSZjuEy2NuB0B7baaDBeF+8bjJx4gwRN7
 8DLwyYZoO9x2DHN1V86F88R6zGjVLfpM8SlvPy90azEgbYGDV19Ajc/sx
 b9GUewBDp3MS12UQZOLi0sn/Epz7nrO9DGXBeGIrWu/JOKUx5oJKYt6Mq
 ox/5yUdS/pHXOTW3RT1DRR3ke6aWXRrjl+/ylJuMAD9BOKcobGgBnpeND A==;
X-CSE-ConnectionGUID: q1wDLESqSSqpsHRImejThA==
X-CSE-MsgGUID: IxUV7tVDTs6RcIni0IjZ5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37723115"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; d="scan'208";a="37723115"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 12:35:00 -0800
X-CSE-ConnectionGUID: xuk6ebVhR/eD6r/ufs8+sw==
X-CSE-MsgGUID: 5fannXeoR7WHmc2jBxOBhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107519777"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.116.103])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 12:34:58 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH i-g-t 1/4] lib/xe/xe_sriov_provisioning: Add scheduling
 attributes accessors
Date: Mon, 20 Jan 2025 21:34:42 +0100
Message-Id: <20250120203445.16285-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250120203445.16285-1-marcin.bernatowicz@linux.intel.com>
References: <20250120203445.16285-1-marcin.bernatowicz@linux.intel.com>
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

Add helper functions to get and set SR-IOV provisioning scheduling
attributes. These functions provide an interface for accessing
provisioning attributes such as execution quantum, preemption timeout,
schedule if idle policy, schedule priority, and engine reset policy.

Include both returning and asserting versions to handle errors
appropriately.

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
 lib/xe/xe_sriov_provisioning.c | 369 ++++++++++++++++++++++++++++++++-
 lib/xe/xe_sriov_provisioning.h |  53 +++++
 2 files changed, 421 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index 22035ffd8..4e3fbaae2 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -6,10 +6,11 @@
 #include <errno.h>
 
 #include "igt_core.h"
+#include "igt_sriov_device.h"
 #include "intel_chipset.h"
 #include "linux_scaffold.h"
-#include "xe/xe_mmio.h"
 #include "xe/xe_query.h"
+#include "xe/xe_mmio.h"
 #include "xe/xe_sriov_debugfs.h"
 #include "xe/xe_sriov_provisioning.h"
 
@@ -296,3 +297,369 @@ bool xe_sriov_is_shared_res_provisionable(int pf, enum xe_sriov_shared_res res,
 
 	return true;
 }
+
+/**
+ * __xe_sriov_get_exec_quantum_ms - Read the execution quantum in milliseconds for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Pointer to store the read value
+ *
+ * Reads the execution quantum in milliseconds for the given PF device @pf,
+ * VF number @vf_num on GT @gt_num.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_get_exec_quantum_ms(int pf, unsigned int vf_num,
+				   unsigned int gt_num, uint32_t *value)
+{
+	return __xe_sriov_pf_debugfs_get_u32(pf, vf_num, gt_num, "exec_quantum_ms", value);
+}
+
+/**
+ * xe_sriov_get_exec_quantum_ms - Get the execution quantum in milliseconds for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ *
+ * A throwing version of __xe_sriov_get_exec_quantum_ms().
+ * Instead of returning an error code, it returns the value read and
+ * asserts in case of an error.
+ *
+ * Return: Execution quantum in milliseconds assigned to a given VF. Asserts in case of failure.
+ */
+uint32_t xe_sriov_get_exec_quantum_ms(int pf, unsigned int vf_num,
+				      unsigned int gt_num)
+{
+	uint32_t value;
+
+	igt_fail_on(__xe_sriov_get_exec_quantum_ms(pf, vf_num, gt_num, &value));
+
+	return value;
+}
+
+/**
+ * __xe_sriov_set_exec_quantum_ms - Set the execution quantum in milliseconds for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Value to set
+ *
+ * Sets the execution quantum in milliseconds for the given PF device @pf,
+ * VF number @vf_num on GT @gt_num.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_set_exec_quantum_ms(int pf, unsigned int vf_num,
+				   unsigned int gt_num, uint32_t value)
+{
+	return __xe_sriov_pf_debugfs_set_u32(pf, vf_num, gt_num, "exec_quantum_ms", value);
+}
+
+/**
+ * xe_sriov_set_exec_quantum_ms - Set the execution quantum in milliseconds for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Value to set
+ *
+ * A throwing version of __xe_sriov_set_exec_quantum_ms().
+ * Instead of returning an error code, it asserts in case of an error.
+ */
+void xe_sriov_set_exec_quantum_ms(int pf, unsigned int vf_num,
+				  unsigned int gt_num, uint32_t value)
+{
+	igt_fail_on(__xe_sriov_set_exec_quantum_ms(pf, vf_num, gt_num, value));
+}
+
+/**
+ * __xe_sriov_get_preempt_timeout_us - Get the preemption timeout in microseconds for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Pointer to store the read value
+ *
+ * Reads the preemption timeout in microseconds for the given PF device @pf,
+ * VF number @vf_num on GT @gt_num.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_get_preempt_timeout_us(int pf, unsigned int vf_num,
+				      unsigned int gt_num, uint32_t *value)
+{
+	return __xe_sriov_pf_debugfs_get_u32(pf, vf_num, gt_num, "preempt_timeout_us", value);
+}
+
+/**
+ * xe_sriov_get_preempt_timeout_us - Get the preemption timeout in microseconds for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ *
+ * A throwing version of __xe_sriov_get_preempt_timeout_us().
+ * Instead of returning an error code, it returns the value read and
+ * asserts in case of an error.
+ *
+ * Return: Preemption timeout in microseconds assigned to a given VF.
+ * Asserts in case of failure.
+ */
+uint32_t xe_sriov_get_preempt_timeout_us(int pf, unsigned int vf_num,
+					 unsigned int gt_num)
+{
+	uint32_t value;
+
+	igt_fail_on(__xe_sriov_get_preempt_timeout_us(pf, vf_num, gt_num, &value));
+
+	return value;
+}
+
+/**
+ * __xe_sriov_set_preempt_timeout_us - Set the preemption timeout in microseconds for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Value to set
+ *
+ * Sets the preemption timeout in microseconds for the given PF device @pf,
+ * VF number @vf_num on GT @gt_num.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_set_preempt_timeout_us(int pf, unsigned int vf_num,
+				      unsigned int gt_num, uint32_t value)
+{
+	return __xe_sriov_pf_debugfs_set_u32(pf, vf_num, gt_num, "preempt_timeout_us", value);
+}
+
+/**
+ * xe_sriov_set_preempt_timeout_us - Set the preemption timeout in microseconds for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Value to set
+ *
+ * A throwing version of __xe_sriov_set_preempt_timeout_us().
+ * Instead of returning an error code, it asserts in case of an error.
+ */
+void xe_sriov_set_preempt_timeout_us(int pf, unsigned int vf_num,
+				     unsigned int gt_num, uint32_t value)
+{
+	igt_fail_on(__xe_sriov_set_preempt_timeout_us(pf, vf_num, gt_num, value));
+}
+
+/**
+ * __xe_sriov_get_engine_reset - Get the engine reset policy status for a given GT
+ * @pf: PF device file descriptor
+ * @gt_num: GT number
+ * @value: Pointer to store the read engine reset policy status
+ *
+ * Reads the engine reset status for the given PF device @pf on GT @gt_num.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_get_engine_reset(int pf, unsigned int gt_num, bool *value)
+{
+	return __xe_sriov_pf_debugfs_get_boolean(pf, 0, gt_num, "reset_engine", value);
+}
+
+/**
+ * xe_sriov_get_engine_reset - Get the engine reset policy status for a given GT
+ * @pf: PF device file descriptor
+ * @gt_num: GT number
+ *
+ * A throwing version of __xe_sriov_get_engine_reset().
+ * Instead of returning an error code, it returns the engine reset status
+ * and asserts in case of an error.
+ *
+ * Return: The engine reset status for the given GT.
+ *         Asserts in case of failure.
+ */
+bool xe_sriov_get_engine_reset(int pf, unsigned int gt_num)
+{
+	bool value;
+
+	igt_fail_on(__xe_sriov_get_engine_reset(pf, gt_num, &value));
+
+	return value;
+}
+
+/**
+ * __xe_sriov_set_engine_reset - Set the engine reset policy for a given GT
+ * @pf: PF device file descriptor
+ * @gt_num: GT number
+ * @value: Engine reset policy status to set
+ *
+ * Sets the engine reset policy for the given PF device @pf on GT @gt_num.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_set_engine_reset(int pf, unsigned int gt_num, bool value)
+{
+	return __xe_sriov_pf_debugfs_set_boolean(pf, 0, gt_num, "reset_engine", value);
+}
+
+/**
+ * xe_sriov_set_engine_reset - Set the engine reset policy for a given GT
+ * @pf: PF device file descriptor
+ * @gt_num: GT number
+ * @value: Engine reset policy status to set
+ *
+ * A throwing version of __xe_sriov_set_engine_reset().
+ * Instead of returning an error code, it asserts in case of an error.
+ */
+void xe_sriov_set_engine_reset(int pf, unsigned int gt_num, bool value)
+{
+	igt_fail_on(__xe_sriov_set_engine_reset(pf, gt_num, value));
+}
+
+/**
+ * __xe_sriov_get_sched_if_idle - Get the scheduling if idle policy for a given GT
+ * @pf: PF device file descriptor
+ * @gt_num: GT number
+ * @value: Pointer to store the read scheduling if idle policy status
+ *
+ * Reads the scheduling if idle policy status for the given PF device @pf on GT @gt_num.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_get_sched_if_idle(int pf, unsigned int gt_num, bool *value)
+{
+	return __xe_sriov_pf_debugfs_get_boolean(pf, 0, gt_num, "sched_if_idle", value);
+}
+
+/**
+ * xe_sriov_get_sched_if_idle - Get the scheduling if idle policy for a given GT
+ * @pf: PF device file descriptor
+ * @gt_num: GT number
+ *
+ * A throwing version of __xe_sriov_get_sched_if_idle().
+ * Instead of returning an error code, it returns the scheduling if idle policy status
+ * and asserts in case of an error.
+ *
+ * Return: The scheduling if idle status for the given GT.
+ *         Asserts in case of failure.
+ */
+bool xe_sriov_get_sched_if_idle(int pf, unsigned int gt_num)
+{
+	bool value;
+
+	igt_fail_on(__xe_sriov_get_sched_if_idle(pf, gt_num, &value));
+
+	return value;
+}
+
+/**
+ * __xe_sriov_set_sched_if_idle - Set the scheduling if idle policy status for a given GT
+ * @pf: PF device file descriptor
+ * @gt_num: GT number
+ * @value: Scheduling if idle policy status to set
+ *
+ * Sets the scheduling if idle policy status for the given PF device @pf on GT @gt_num.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value)
+{
+	return __xe_sriov_pf_debugfs_set_boolean(pf, 0, gt_num, "sched_if_idle", value);
+}
+
+/**
+ * xe_sriov_set_sched_if_idle - Set the scheduling if idle status policy for a given GT
+ * @pf: PF device file descriptor
+ * @gt_num: GT number
+ * @value: Scheduling if idle policy status to set
+ *
+ * A throwing version of __xe_sriov_set_sched_if_idle().
+ * Instead of returning an error code, it asserts in case of an error.
+ */
+void xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value)
+{
+	igt_fail_on(__xe_sriov_set_sched_if_idle(pf, gt_num, value));
+}
+
+/**
+ * __xe_sriov_get_sched_priority - Get the scheduling priority for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Pointer to store the read scheduling priority
+ *
+ * Reads the scheduling priority for the given PF device @pf,
+ * VF number @vf_num on GT @gt_num.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_get_sched_priority(int pf, unsigned int vf_num,
+				  unsigned int gt_num,
+				  enum xe_sriov_sched_priority *value)
+{
+	uint32_t priority;
+	int ret;
+
+	ret = __xe_sriov_pf_debugfs_get_u32(pf, vf_num, gt_num, "sched_priority", &priority);
+	if (igt_debug_on_f(ret, "Failed to read sched_priority attribute for GT%u\n", gt_num))
+		return ret;
+
+	if (priority <= XE_SRIOV_SCHED_PRIORITY_HIGH) {
+		*value = (enum xe_sriov_sched_priority)priority;
+		return 0;
+	}
+
+	return -ERANGE;
+}
+
+/**
+ * xe_sriov_get_sched_priority - Get the scheduling priority for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ *
+ * A throwing version of __xe_sriov_get_sched_priority().
+ * Instead of returning an error code, it returns the scheduling priority
+ * and asserts in case of an error.
+ *
+ * Return: The scheduling priority for the given VF and GT.
+ *         Asserts in case of failure.
+ */
+enum xe_sriov_sched_priority
+xe_sriov_get_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num)
+{
+	enum xe_sriov_sched_priority priority;
+
+	igt_fail_on(__xe_sriov_get_sched_priority(pf, vf_num, gt_num, &priority));
+
+	return priority;
+}
+
+/**
+ * __xe_sriov_set_sched_priority - Set the scheduling priority for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Scheduling priority to set (enum xe_sriov_sched_priority)
+ *
+ * Sets the scheduling priority for the given PF device @pf, VF number @vf_num on GT @gt_num.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,
+				  enum xe_sriov_sched_priority value)
+{
+	return __xe_sriov_pf_debugfs_set_u32(pf, vf_num, gt_num, "sched_priority", value);
+}
+
+/**
+ * xe_sriov_set_sched_priority - Set the scheduling priority for a given VF
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Scheduling priority to set (enum xe_sriov_sched_priority)
+ *
+ * A throwing version of __xe_sriov_set_sched_priority().
+ * Instead of returning an error code, it asserts in case of an error.
+ */
+void xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,
+				 enum xe_sriov_sched_priority value)
+{
+	igt_fail_on(__xe_sriov_set_sched_priority(pf, vf_num, gt_num, value));
+}
diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
index b4300ec2e..b22f96d88 100644
--- a/lib/xe/xe_sriov_provisioning.h
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -55,6 +55,26 @@ enum xe_sriov_shared_res {
 	for ((res) = 0; (res) < XE_SRIOV_SHARED_RES_NUM; (res)++) \
 		for_if(xe_sriov_is_shared_res_provisionable((pf), (res), (gt)))
 
+/**
+ * enum xe_sriov_sched_priority - SR-IOV scheduling priorities
+ * @XE_SRIOV_SCHED_PRIORITY_LOW: Schedule VF only if it has active work and
+ *                               VF-State is VF_STATE_RUNNING. This is the
+ *                               default value.
+ * @XE_SRIOV_SCHED_PRIORITY_NORMAL: Schedule VF always, irrespective of whether
+ *                                  it has work or not, as long as VF-State is
+ *                                  not VF_STATE_DISABLED. Once scheduled, VF
+ *                                  will run for its entire execution quantum.
+ * @XE_SRIOV_SCHED_PRIORITY_HIGH: Schedule VF in the next time-slice after the
+ *                                current active time-slice completes. VF is
+ *                                scheduled only if it has work and VF-State is
+ *                                VF_STATE_RUNNING.
+ */
+enum xe_sriov_sched_priority {
+	XE_SRIOV_SCHED_PRIORITY_LOW,
+	XE_SRIOV_SCHED_PRIORITY_NORMAL,
+	XE_SRIOV_SCHED_PRIORITY_HIGH
+};
+
 /**
  * struct xe_sriov_provisioned_range - Provisioned range for a Virtual Function (VF)
  * @vf_id: The ID of the VF
@@ -89,5 +109,38 @@ int __xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
 void xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
 				     unsigned int vf_num, unsigned int gt_num,
 				     uint64_t value);
+int __xe_sriov_get_exec_quantum_ms(int pf, unsigned int vf_num,
+				   unsigned int gt_num, uint32_t *value);
+uint32_t xe_sriov_get_exec_quantum_ms(int pf, unsigned int vf_num,
+				      unsigned int gt_num);
+int __xe_sriov_set_exec_quantum_ms(int pf, unsigned int vf_num,
+				   unsigned int gt_num, uint32_t value);
+void xe_sriov_set_exec_quantum_ms(int pf, unsigned int vf_num,
+				  unsigned int gt_num, uint32_t value);
+int __xe_sriov_get_preempt_timeout_us(int pf, unsigned int vf_num,
+				      unsigned int gt_num, uint32_t *value);
+uint32_t xe_sriov_get_preempt_timeout_us(int pf, unsigned int vf_num,
+					 unsigned int gt_num);
+int __xe_sriov_set_preempt_timeout_us(int pf, unsigned int vf_num,
+				      unsigned int gt_num, uint32_t value);
+void xe_sriov_set_preempt_timeout_us(int pf, unsigned int vf_num,
+				     unsigned int gt_num, uint32_t value);
+int __xe_sriov_get_engine_reset(int pf, unsigned int gt_num, bool *value);
+bool xe_sriov_get_engine_reset(int pf, unsigned int gt_num);
+int __xe_sriov_set_engine_reset(int pf, unsigned int gt_num, bool value);
+void xe_sriov_set_engine_reset(int pf, unsigned int gt_num, bool value);
+int __xe_sriov_get_sched_if_idle(int pf, unsigned int gt_num, bool *value);
+bool xe_sriov_get_sched_if_idle(int pf, unsigned int gt_num);
+int __xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value);
+void xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value);
+int __xe_sriov_get_sched_priority(int pf, unsigned int vf_num,
+				  unsigned int gt_num,
+				  enum xe_sriov_sched_priority *value);
+enum xe_sriov_sched_priority xe_sriov_get_sched_priority(int pf, unsigned int vf_num,
+							 unsigned int gt_num);
+int __xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,
+				  enum xe_sriov_sched_priority value);
+void xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,
+				 enum xe_sriov_sched_priority value);
 
 #endif /* __XE_SRIOV_PROVISIONING_H__ */
-- 
2.31.1

