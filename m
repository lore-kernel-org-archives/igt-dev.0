Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD5CC0219B
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 16:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3C810E708;
	Tue, 11 Feb 2025 16:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hCKpS5GI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E621910E708
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 16:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739291373; x=1770827373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wqc8aIGDJMHzoAGnvqBG8cCsS4NAVsoxx75uFx1tZX8=;
 b=hCKpS5GIbNqPOz96hifsNHw0uZb432OF3RVsK+3kbbOu3H+81xjTVMEd
 dR40ctVZoRPMDCsR0lNZwneJQ88eX/nXzg5loMsRxftbrr1PmtQdUZekD
 ktwjN6STTAqRz+4LyHwQRNZSq/Swr8Z3PpizODy2JmmZHoK7y64BQdjVg
 S+Au2wLDKMe7cAqtRhf291bNli8OJ6OMWtKRK+U5M0AosU11naj8JDV4n
 AeJuXxCV3brYDMfIBw+gK4QlNB1Hq6u/YvA5XOx/OPHKvM4dsHlf20zl3
 +nWi4STVi+b1r7mOGnsiD4HXi7U5zWXE0vOPW2wsjdj8w/gc+9H2Uhllc Q==;
X-CSE-ConnectionGUID: PxP9UsMyRs6TnE1K0bn9EA==
X-CSE-MsgGUID: NiM/Gh5WQkOGQwZIbRTHyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39113942"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="39113942"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 08:29:33 -0800
X-CSE-ConnectionGUID: ef2eZiL6SNWWyFl7t2DQGA==
X-CSE-MsgGUID: r5cteBwORLqMK1lxrHvW6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116643055"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 08:29:31 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, lukasz.laguna@intel.com,
 satyanarayana.k.v.p@intel.com, michal.wajdeczko@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com
Subject: [PATCH i-g-t v3 2/4] lib/xe/xe_sriov_provisioning: Add helper to get
 VF's provisioned quota
Date: Tue, 11 Feb 2025 17:29:17 +0100
Message-Id: <20250211162919.15076-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250211162919.15076-1-lukasz.laguna@intel.com>
References: <20250211162919.15076-1-lukasz.laguna@intel.com>
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

Add helper allowing to get VF's provisioned quota based on provisioned
ranges exposed in debugfs.

v2:
 - release allocated struct (Marcin)

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 lib/xe/xe_sriov_provisioning.c | 59 ++++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_provisioning.h |  6 ++++
 2 files changed, 65 insertions(+)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index 22035ffd8..f7d8c63d1 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -6,6 +6,8 @@
 #include <errno.h>
 
 #include "igt_core.h"
+#include "igt_debugfs.h"
+#include "igt_sriov_device.h"
 #include "intel_chipset.h"
 #include "linux_scaffold.h"
 #include "xe/xe_mmio.h"
@@ -296,3 +298,60 @@ bool xe_sriov_is_shared_res_provisionable(int pf, enum xe_sriov_shared_res res,
 
 	return true;
 }
+
+/**
+ * __xe_sriov_pf_get_provisioned_quota - Get VF's provisioned quota.
+ * @pf: PF device file descriptor
+ * @res: Shared resource type (see enum xe_sriov_shared_res)
+ * @vf_num: VF number (1-based)
+ * @gt_num: GT number
+ * @value: Pointer to store the read value
+ *
+ * Gets VF's provisioning value for the specified shared resource @res,
+ * VF number @vf_num and GT number @gt_num.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __xe_sriov_pf_get_provisioned_quota(int pf, enum xe_sriov_shared_res res,
+					unsigned int vf_num, unsigned int gt_num,
+					uint64_t *value)
+{
+	struct xe_sriov_provisioned_range *ranges;
+	int ret;
+
+	ret = xe_sriov_pf_debugfs_read_check_ranges(pf, res, gt_num, &ranges,
+						    igt_sriov_get_enabled_vfs(pf));
+	if (igt_debug_on_f(ret, "%s: Failed ranges check on GT%u (%d)\n",
+			   xe_sriov_debugfs_provisioned_attr_name(res), gt_num, ret))
+		return ret;
+
+	*value = ranges[vf_num - 1].end - ranges[vf_num - 1].start + 1;
+
+	free(ranges);
+
+	return 0;
+}
+
+/**
+ * xe_sriov_pf_get_provisioned_quota - Get VF's provisioned quota.
+ * @pf: PF device file descriptor
+ * @res: Shared resource type (see enum xe_sriov_shared_res)
+ * @vf_num: VF number (1-based)
+ * @gt_num: GT number
+ *
+ * A throwing version of __xe_sriov_pf_get_provisioned_quota().
+ * Instead of returning an error code, it returns the quota value and asserts
+ * in case of an error.
+ *
+ * Return: The provisioned quota for the given shared resource.
+ *         Asserts in case of failure.
+ */
+uint64_t xe_sriov_pf_get_provisioned_quota(int pf, enum xe_sriov_shared_res res,
+					   unsigned int vf_num, unsigned int gt_num)
+{
+	uint64_t value;
+
+	igt_fail_on(__xe_sriov_pf_get_provisioned_quota(pf, res, vf_num, gt_num, &value));
+
+	return value;
+}
diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
index b4300ec2e..171e4f028 100644
--- a/lib/xe/xe_sriov_provisioning.h
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -90,4 +90,10 @@ void xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
 				     unsigned int vf_num, unsigned int gt_num,
 				     uint64_t value);
 
+int __xe_sriov_pf_get_provisioned_quota(int pf, enum xe_sriov_shared_res res,
+					unsigned int vf_num, unsigned int gt_num,
+					uint64_t *value);
+uint64_t xe_sriov_pf_get_provisioned_quota(int pf, enum xe_sriov_shared_res res,
+					   unsigned int vf_num, unsigned int gt_num);
+
 #endif /* __XE_SRIOV_PROVISIONING_H__ */
-- 
2.40.0

