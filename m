Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2586C02181
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jan 2025 08:10:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5006710E917;
	Fri, 24 Jan 2025 08:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h4sYzB73";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067EB10E917
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2025 08:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737706255; x=1769242255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=22p5ortkHOVXe9+sTxVFIGEUTesCaygSDh6Kbt/FaWM=;
 b=h4sYzB73+Ap9DctSFxSghP+kf76+Qin+NOL+PSxlMJB+21CkoBR2NKdG
 nZmd34SgWH8Rtv8NhsJ1MEBnbSZIW0Cg7+NUxAQU02KnTx9RPGhvsHUXa
 aYHJ4shM1Vgg3vmfQR2t8IUXeQdW+VCMeDLITUW8HPMNky80YhaoYEoaO
 hxD6fwO7BHyMMc4uKBwLOiACarNRNyDEIRlVFUkh/M2dghA5w11K4uBcJ
 VANV/zYiY3QG8GDwJt6GuZY87b1ydEWIBOwaBSgyRl2kcJJbs8FVZPBfG
 TBBREeYOUVY/dkge96mvQIeWh3bIrNxQjeRaNnyUla6k1FE+rFqW6H6cn g==;
X-CSE-ConnectionGUID: xKDwuOFkTqS0FOim59I/gQ==
X-CSE-MsgGUID: w4xs5/7fTUuOWM52J5A8MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="63587303"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="63587303"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 00:10:55 -0800
X-CSE-ConnectionGUID: SfhnzggeTPSBKnVEnVmy4A==
X-CSE-MsgGUID: ThVGYXgWSeq+ryy1EQJXBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112340324"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 00:10:53 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, lukasz.laguna@intel.com,
 satyanarayana.k.v.p@intel.com, michal.wajdeczko@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com
Subject: [PATCH i-g-t v1 2/4] lib/xe/xe_sriov_provisioning: Add helper to get
 VF's provisioned quota
Date: Fri, 24 Jan 2025 09:10:37 +0100
Message-Id: <20250124081039.31201-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250124081039.31201-1-lukasz.laguna@intel.com>
References: <20250124081039.31201-1-lukasz.laguna@intel.com>
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

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/xe/xe_sriov_provisioning.c | 56 ++++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_provisioning.h |  6 ++++
 2 files changed, 62 insertions(+)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index 5ba348131..aedf9bd91 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -8,6 +8,7 @@
 
 #include "igt_core.h"
 #include "igt_debugfs.h"
+#include "igt_sriov_device.h"
 #include "intel_chipset.h"
 #include "linux_scaffold.h"
 #include "xe/xe_mmio.h"
@@ -299,6 +300,61 @@ bool xe_sriov_is_shared_res_provisionable(int pf, enum xe_sriov_shared_res res,
 	return true;
 }
 
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
+
 /**
  * __xe_sriov_vf_get_shared_res_selfconfig - Read VF's configuration data.
  * @vf: VF device file descriptor
diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
index 1a05c2c59..0381b564c 100644
--- a/lib/xe/xe_sriov_provisioning.h
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -90,6 +90,12 @@ void xe_sriov_pf_set_shared_res_attr(int pf, enum xe_sriov_shared_res res,
 				     unsigned int vf_num, unsigned int gt_num,
 				     uint64_t value);
 
+int __xe_sriov_pf_get_provisioned_quota(int pf, enum xe_sriov_shared_res res,
+					unsigned int vf_num, unsigned int gt_num,
+					uint64_t *value);
+uint64_t xe_sriov_pf_get_provisioned_quota(int pf, enum xe_sriov_shared_res res,
+					   unsigned int vf_num, unsigned int gt_num);
+
 int __xe_sriov_vf_get_shared_res_selfconfig(int vf, enum xe_sriov_shared_res res,
 					    unsigned int gt_num, uint64_t *value);
 uint64_t xe_sriov_vf_get_shared_res_selfconfig(int vf, enum xe_sriov_shared_res res,
-- 
2.40.0

