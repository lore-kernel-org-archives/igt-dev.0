Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFA2D6D237
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 20:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1358210EBD4;
	Wed, 27 Nov 2024 20:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VYXWcATf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E2410EBE5
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 20:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732737803; x=1764273803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d3Y8tdLje6RrhCPHKpXHhvgj0w1Yb0dsyytdRliZRl8=;
 b=VYXWcATfd4hNtFE0bowSeblQ3Td+84+ddHKrqmONym5r8sh0Dwjj3BUO
 bIRK1QWJoWudTI2p9ObbSFtul9+0cdf4eONZJlHR0XNwFA8wq5PMKuE1a
 uXk05nPBQM2J9v1D/E0hip7OMFElThfJXG94nmyPCTxMnit9sSo9yX1NB
 COl84/hMCxaO/H5EaH0KAB4W1XToElRIhVoN5YNEzatYmTGEYTf0a43Lr
 Yj61faUtR7hAHzSKsdU+9KSCob51N+RdTun7mmsm9QRiVxbBaC4ajXZBi
 V+kGG2lmUaOK76Zz9iOfKjgu1aFwvZJ2C8c1M5Hb91rpKp9f/UvYTQ202 A==;
X-CSE-ConnectionGUID: DsFOq9d7QV65j+9uFLjg1g==
X-CSE-MsgGUID: i2BNN074SsaDlnlhL/MKRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="44344242"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="44344242"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 12:03:23 -0800
X-CSE-ConnectionGUID: DgRH++6SRDmbBUcLcx2MIw==
X-CSE-MsgGUID: cBL6vh7tQ7eTzHiHqRRKxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="96484691"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.81.89])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 12:03:20 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 2/4] lib/xe/xe_sriov_provisioning: Add scheduling
 attributes accessors
Date: Wed, 27 Nov 2024 21:03:00 +0100
Message-Id: <20241127200302.1376594-3-marcin.bernatowicz@linux.intel.com>
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
 lib/xe/xe_sriov_provisioning.c | 369 +++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_provisioning.h |  53 +++++
 2 files changed, 422 insertions(+)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index 67ae9cf54..a1c94daf0 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -6,9 +6,12 @@
 #include <errno.h>
 
 #include "igt_core.h"
+#include "igt_sriov_device.h"
 #include "intel_chipset.h"
 #include "linux_scaffold.h"
+#include "xe/xe_query.h"
 #include "xe/xe_mmio.h"
+#include "xe/xe_sriov_debugfs.h"
 #include "xe/xe_sriov_provisioning.h"
 
 /**
@@ -150,3 +153,369 @@ int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio
 
 	return 0;
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
index aa2f08f52..8e85985b7 100644
--- a/lib/xe/xe_sriov_provisioning.h
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -27,6 +27,26 @@ enum xe_sriov_shared_res {
 	XE_SRIOV_SHARED_RES_LMEM,
 };
 
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
@@ -46,5 +66,38 @@ const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res);
 int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio *mmio,
 					       struct xe_sriov_provisioned_range **ranges,
 					       unsigned int *nr_ranges);
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

