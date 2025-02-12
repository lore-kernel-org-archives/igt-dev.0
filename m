Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F951C02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 18:48:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51ED10E967;
	Wed, 12 Feb 2025 18:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VgNIvVLY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681CD10E966
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 18:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739386092; x=1770922092;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sw17vGu8EDW21uq3e/TsAI+xRpL2netjL60y+w8OBDs=;
 b=VgNIvVLYcAbtSOTaznChmA2CFfo3BXdajFY4FiwOarfqt7uyM7LZcZHv
 pm6ich7TFTWghDM82U5y3Hbh3wZDGOklPXRoPX/5tQU7bCIj+EYjOEDcN
 wBrZ6v3sem7cxGcLzxLKh0aNl7rzyAvT7cO3RP55H22W1foeeg6IPsFHF
 dR66kLfqMQOeg8rjGGDjAk2C8gPFZWCVKoJ4LQzmhKj8X7xFGT8aGeMLd
 VeagbpYRJfQfdkAFXvBs/3wILZuc66BbYTEPT+0BFpUMdVng+euWlqrDv
 yrc3IruJ3r5tPIsLjxArB2HnsNsf099pwq90l9wsThGGWoPcBRNzchN0f w==;
X-CSE-ConnectionGUID: bwtJB2PxTaCK9mBpp3ukPA==
X-CSE-MsgGUID: BN+xZZaaRk6GJw8Sk4/Y6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40209776"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="40209776"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 10:48:12 -0800
X-CSE-ConnectionGUID: jmd4daTOTCaBAb06GvlLRA==
X-CSE-MsgGUID: J1/+Y4SiT1O5msQb+KKA6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117028629"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.17.221])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 10:48:09 -0800
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
Subject: [PATCH v2 i-g-t 1/5] lib/xe/xe_sriov_provisioning: Add scheduling
 attributes accessors
Date: Wed, 12 Feb 2025 19:47:53 +0100
Message-Id: <20250212184757.586071-2-marcin.bernatowicz@linux.intel.com>
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

Add helper functions to get and set SR-IOV provisioning scheduling
attributes. These functions provide an interface for accessing
provisioning attributes such as execution quantum, preemption timeout,
schedule if idle policy, schedule priority, and engine reset policy.

Include both returning and asserting versions to handle errors
appropriately.

v2:
- Remove debug message for consistency with the remaining code (Lukasz)
- Remove unnecessary cast when assigning priority to *value
- Use early return for the out-of-range check to improve readability

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
 lib/xe/xe_sriov_provisioning.c | 368 ++++++++++++++++++++++++++++++++-
 lib/xe/xe_sriov_provisioning.h |  54 ++++-
 2 files changed, 420 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index f7d8c63d1..4d6ad88ce 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -10,8 +10,8 @@
 #include "igt_sriov_device.h"
 #include "intel_chipset.h"
 #include "linux_scaffold.h"
-#include "xe/xe_mmio.h"
 #include "xe/xe_query.h"
+#include "xe/xe_mmio.h"
 #include "xe/xe_sriov_debugfs.h"
 #include "xe/xe_sriov_provisioning.h"
 
@@ -355,3 +355,369 @@ uint64_t xe_sriov_pf_get_provisioned_quota(int pf, enum xe_sriov_shared_res res,
 
 	return value;
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
+	if (ret)
+		return ret;
+
+	if (priority > XE_SRIOV_SCHED_PRIORITY_HIGH)
+		return -ERANGE;
+
+	*value = priority;
+
+	return 0;
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
index 171e4f028..9d0c2ed85 100644
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
@@ -89,11 +109,43 @@ int __xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
 void xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
 				     unsigned int vf_num, unsigned int gt_num,
 				     uint64_t value);
-
 int __xe_sriov_pf_get_provisioned_quota(int pf, enum xe_sriov_shared_res res,
 					unsigned int vf_num, unsigned int gt_num,
 					uint64_t *value);
 uint64_t xe_sriov_pf_get_provisioned_quota(int pf, enum xe_sriov_shared_res res,
 					   unsigned int vf_num, unsigned int gt_num);
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

