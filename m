Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97275D6D233
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 20:03:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2C610EBD4;
	Wed, 27 Nov 2024 20:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kSM5nczV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C09F10EBD4
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 20:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732737821; x=1764273821;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=po/Ail66qrgS/VSCr/Qt0V0JDsNdMSc5Hpv7Zl/G4vo=;
 b=kSM5nczVUpJgWnHztDCKbv2fvz05sVKxmNohAB5o370I/PljqDs92VyS
 Tzgjb9PMImJ8XhLEkT6jzXdHpXho03iJgtbGVwzk5SWqu2de8xRJ8ff2u
 1GCi9njn1u7HK6G85aJzpSDnMgMcE1Lz+7xG88D4BBdwZHPAcDvAVbJg3
 dU3TYfPMqOaQloBwdW6l4Jc4JGzLXCC2kzvbcSB7Du0tGtMiy5PT9YH1r
 cA1G97rbRxCGMK6pUo5LGMLdFKIegSF4VDBkwN6h8TWJeK2b00v5OT/um
 4r9h8Q/v6k8F1cWd784WBABsBFxVMwO1QcGB8oxSf4K+OqCvtneL/jdOx A==;
X-CSE-ConnectionGUID: bI0PD+HqQt6fS8qViqzE6Q==
X-CSE-MsgGUID: zdo00SrnS0CbWWpdY+4GHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="44344269"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="44344269"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 12:03:41 -0800
X-CSE-ConnectionGUID: Zm1JgY9zQeKjr3cVRpY2oA==
X-CSE-MsgGUID: sD25Skm5Qn6Ss5peKExLgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="96484726"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.81.89])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 12:03:32 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 4/4] lib/xe/xe_sriov_provisioning: Add accessors for
 quota/spare attributes
Date: Wed, 27 Nov 2024 21:03:02 +0100
Message-Id: <20241127200302.1376594-5-marcin.bernatowicz@linux.intel.com>
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

Introduce functions to get and set SR-IOV provisioning quota and spare
attributes. These functions provide access to shared resource attributes
such as GGTT, LMEM, contexts, and doorbells for both PF and VF contexts.

Add returning and asserting variants to allow flexible error handling
based on usage scenarios.

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
 lib/xe/xe_sriov_provisioning.c | 123 +++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_provisioning.h |  14 ++++
 2 files changed, 137 insertions(+)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index 0c5cd01fd..ce06c00de 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -561,3 +561,126 @@ void xe_sriov_require_default_scheduling_attributes(int pf)
 		}
 	}
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
index 4ddf3149f..30e769019 100644
--- a/lib/xe/xe_sriov_provisioning.h
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -100,5 +100,19 @@ int __xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_n
 void xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,
 				 enum xe_sriov_sched_priority value);
 void xe_sriov_require_default_scheduling_attributes(int pf);
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

