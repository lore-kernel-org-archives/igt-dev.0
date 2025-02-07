Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E41C0219B
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 09:40:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B2E10EA8B;
	Fri,  7 Feb 2025 09:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LM7W6ujf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434F210EA8B
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 09:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738921246; x=1770457246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wqc8aIGDJMHzoAGnvqBG8cCsS4NAVsoxx75uFx1tZX8=;
 b=LM7W6ujfSof6uGEYu5YTNENoteSEAnq9WbDruaiVAOYQiZB4TJr+YgxZ
 hK1QHzucUHE8A8nNjy85ZQm+LDZjiwsZ747tp1SJeG73E39jjaxgQccqx
 MVf107Q/Ug4eTRX28g+JZpjk5CxciGC6aXcWK4UmCC3tL7/2NhclVu6Vh
 HqsYJLW38JWn66OQJB4tms5d71RIMxO3URtc3/QXQ/VAJg6RQSN1zH9I6
 r1pEWa4r3ZzkY0pkCMj+M5FXxPA7Wy3+EL80JMKKf43IQSlaLFLfp50uy
 U5aDN2k9jrJ2QpHslP9p0OYTSxaJcH9nGYO9fTidhscMK6ePbp3dDZU1R w==;
X-CSE-ConnectionGUID: m8gHfaDJQ6OmLQ0D3BUiPw==
X-CSE-MsgGUID: uKGKnKNNS5Wh+Vocg7lA3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64913953"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="64913953"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 01:40:46 -0800
X-CSE-ConnectionGUID: MIYv9h0QSMyu/Sf3k68hag==
X-CSE-MsgGUID: 8YyLATwOTwisIMUNM+z/jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111328506"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 01:40:44 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, lukasz.laguna@intel.com,
 satyanarayana.k.v.p@intel.com, michal.wajdeczko@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com
Subject: [PATCH i-g-t v2 2/4] lib/xe/xe_sriov_provisioning: Add helper to get
 VF's provisioned quota
Date: Fri,  7 Feb 2025 10:40:29 +0100
Message-Id: <20250207094031.15942-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250207094031.15942-1-lukasz.laguna@intel.com>
References: <20250207094031.15942-1-lukasz.laguna@intel.com>
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

