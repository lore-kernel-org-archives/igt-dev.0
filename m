Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17F7E77188
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jan 2025 15:10:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F19410E384;
	Tue, 14 Jan 2025 15:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CDJuykIr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E2910E384
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2025 15:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736867432; x=1768403432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X/TwzHpeUp6cWOvuYGed1ludF3FcsG9M7b7wBEI2vNk=;
 b=CDJuykIru6MzQmLJv8gpsO/uGtg3eX2XOM7Ao3RLRjjH257KR5dGwxH7
 9ATspiIg/YgTysdBTVXGfEFjN/j2Zx7kDY4817xf4Hmoulby8yktTUoCb
 M1yRuCTEWSO5PWTbipzgs4F3rALpQPNcTDPh2GC0gAOOPvmYli5mlcZur
 yNMj578OJJn9lHLPw2XLWMH8GUg6aCTAoZQqKfcLpWr1OpRQaBnZRkDtq
 qyrrJtX/z8e1MfeUuyqPld0WhpQFEs+StkhvXzt5BvT5Vvi0cRw7JLXUt
 bcbYchMeb1Gcu6N3Hy8JHm9Et6MwCbYhvg9JWevoX9hyXYeVBU6R8m49S A==;
X-CSE-ConnectionGUID: f6NvV6/nRDqiFfdR7RFnWA==
X-CSE-MsgGUID: DlAT4s0kS/O4rDmhyrOcSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37323269"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="37323269"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 07:10:31 -0800
X-CSE-ConnectionGUID: 3UdXoYEwT/+piW9Rop6SBg==
X-CSE-MsgGUID: GNx2M7SRROScNm4cdHARvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="104661479"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.1.29])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 07:10:21 -0800
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
Subject: [PATCH v2 i-g-t 3/7] lib/xe/xe_sriov_provisioning: Add accessors for
 quota/spare attributes
Date: Tue, 14 Jan 2025 16:08:44 +0100
Message-Id: <20250114150848.332708-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250114150848.332708-1-marcin.bernatowicz@linux.intel.com>
References: <20250114150848.332708-1-marcin.bernatowicz@linux.intel.com>
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

Introduce functions to get and set SR-IOV provisioning quota and spare
attributes. These functions provide access to shared resource attributes
such as GGTT, LMEM, contexts, and doorbells for both PF and VF contexts.

Add returning and asserting variants to allow flexible error handling
based on usage scenarios.

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
 lib/xe/xe_sriov_provisioning.c | 124 +++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_provisioning.h |  14 ++++
 2 files changed, 138 insertions(+)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index 67ae9cf54..536121931 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -9,6 +9,7 @@
 #include "intel_chipset.h"
 #include "linux_scaffold.h"
 #include "xe/xe_mmio.h"
+#include "xe/xe_sriov_debugfs.h"
 #include "xe/xe_sriov_provisioning.h"
 
 /**
@@ -150,3 +151,126 @@ int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio
 
 	return 0;
 }
+
+/**
+ * xe_sriov_shared_res_attr_name - Retrieve the attribute name for a shared resource
+ * @res: Shared resource type (see enum xe_sriov_shared_res)
+ * @vf_num: VF number (1-based) or 0 for PF
+ *
+ * Returns the attribute name corresponding to the specified
+ * shared resource type and VF number. For VF (vf_num > 0), the "quota"
+ * attribute name is returned (e.g., "contexts_quota"). For PF (vf_num == 0),
+ * the "spare" attribute name is returned (e.g., "contexts_spare").
+ *
+ * Return:
+ * The attribute name as a string if the resource type is valid.
+ * NULL if the resource type is invalid.
+ */
+const char *xe_sriov_shared_res_attr_name(enum xe_sriov_shared_res res,
+					  unsigned int vf_num)
+{
+	switch (res) {
+	case XE_SRIOV_SHARED_RES_CONTEXTS:
+		return vf_num ? "contexts_quota" : "contexts_spare";
+	case XE_SRIOV_SHARED_RES_DOORBELLS:
+		return vf_num ? "doorbells_quota" : "doorbells_spare";
+	case XE_SRIOV_SHARED_RES_GGTT:
+		return vf_num ? "ggtt_quota" : "ggtt_spare";
+	case XE_SRIOV_SHARED_RES_LMEM:
+		return vf_num ? "lmem_quota" : "lmem_spare";
+	}
+
+	return NULL;
+}
+
+/**
+ * __xe_sriov_pf_get_shared_res_attr - Read shared resource attribute
+ * @pf: PF device file descriptor
+ * @res: Shared resource type (see enum xe_sriov_shared_res)
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Pointer to store the read attribute value
+ *
+ * Reads the specified shared resource attribute for the given PF device @pf,
+ * VF number @vf_num, and GT @gt_num. The attribute depends on @vf_num:
+ * - For VF (vf_num > 0), reads the "quota" attribute.
+ * - For PF (vf_num == 0), reads the "spare" attribute.
+ *
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_pf_get_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+				      unsigned int vf_num, unsigned int gt_num,
+				      uint64_t *value)
+{
+	return __xe_sriov_pf_debugfs_get_u64(pf, vf_num, gt_num,
+					     xe_sriov_shared_res_attr_name(res, vf_num),
+					     value);
+}
+
+/**
+ * xe_sriov_pf_get_shared_res_attr - Read shared resource attribute
+ * @pf: PF device file descriptor
+ * @res: Shared resource type (see enum xe_sriov_shared_res)
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ *
+ * A throwing version of __xe_sriov_pf_get_shared_res_attr().
+ * Instead of returning an error code, it returns the quota value and asserts
+ * in case of an error.
+ *
+ * Return: The value for the given shared resource attribute.
+ *         Asserts in case of failure.
+ */
+uint64_t xe_sriov_pf_get_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+					 unsigned int vf_num,
+					 unsigned int gt_num)
+{
+	uint64_t value;
+
+	igt_fail_on(__xe_sriov_pf_get_shared_res_attr(pf, res, vf_num, gt_num, &value));
+
+	return value;
+}
+
+/**
+ * __xe_sriov_pf_set_shared_res_attr - Set a shared resource attribute
+ * @pf: PF device file descriptor
+ * @res: Shared resource type (see enum xe_sriov_shared_res)
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Value to set for the shared resource attribute
+ *
+ * Sets the specified shared resource attribute for the given PF device @pf,
+ * VF number @vf_num, and GT @gt_num. The attribute depends on @vf_num:
+ * - For VF (vf_num > 0), reads the "quota" attribute.
+ * - For PF (vf_num == 0), reads the "spare" attribute.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+				      unsigned int vf_num, unsigned int gt_num,
+				      uint64_t value)
+{
+	return __xe_sriov_pf_debugfs_set_u64(pf, vf_num, gt_num,
+					     xe_sriov_shared_res_attr_name(res, vf_num),
+					     value);
+}
+
+/**
+ * xe_sriov_pf_set_shared_res_attr - Set the shared resource attribute value
+ * @pf: PF device file descriptor
+ * @res: Shared resource type (see enum xe_sriov_shared_res)
+ * @vf_num: VF number (1-based) or 0 for PF
+ * @gt_num: GT number
+ * @value: Value to set
+ *
+ * A throwing version of __xe_sriov_pf_set_shared_res_attr().
+ * Instead of returning an error code, it asserts in case of an error.
+ */
+void xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+				     unsigned int vf_num, unsigned int gt_num,
+				     uint64_t value)
+{
+	igt_fail_on(__xe_sriov_pf_set_shared_res_attr(pf, res, vf_num, gt_num, value));
+}
diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
index aa2f08f52..168b50394 100644
--- a/lib/xe/xe_sriov_provisioning.h
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -46,5 +46,19 @@ const char *xe_sriov_shared_res_to_string(enum xe_sriov_shared_res res);
 int xe_sriov_find_ggtt_provisioned_pte_offsets(int pf_fd, int gt, struct xe_mmio *mmio,
 					       struct xe_sriov_provisioned_range **ranges,
 					       unsigned int *nr_ranges);
+const char *xe_sriov_shared_res_attr_name(enum xe_sriov_shared_res res,
+					  unsigned int vf_num);
+int __xe_sriov_pf_get_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+				      unsigned int vf_num, unsigned int gt_num,
+				      uint64_t *value);
+uint64_t xe_sriov_pf_get_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+					 unsigned int vf_num,
+					 unsigned int gt_num);
+int __xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+				      unsigned int vf_num, unsigned int gt_num,
+				      uint64_t value);
+void xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
+				     unsigned int vf_num, unsigned int gt_num,
+				     uint64_t value);
 
 #endif /* __XE_SRIOV_PROVISIONING_H__ */
-- 
2.31.1

