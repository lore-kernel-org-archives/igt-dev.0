Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E3CCFD37F
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 10:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5DD10E39F;
	Tue, 25 Nov 2025 10:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hORC+vw3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0AC10E39F
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 10:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764066221; x=1795602221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zEnekOGQVPhxs3g4FDLd1vsW/H8iOjt/N6m/RsPKiD4=;
 b=hORC+vw3fXd272qz/zu1Y78hx4kKnq2FB2a/z+iNpkVXgzit4EzbPYDI
 azq1vB+ZN+cZRh3RxftSesAy9sZCyO1pf4DSBicJ8FH4p07gXHJfvunoP
 BITl3dx85TvuMeSF4CQDRx0LtR/dIQydAPEuegDzoFEFz+0bwEJRlNG4c
 WcfXNMej7xDSf+wEbPdXREmFHvAdy3p6SxWXNchjKlQN2hmwLed1yUWPk
 4Gv+pIhAliDEyx1jFecrRNxX3thUsjiW9BUhaKpZU3stxpcftlvqnz031
 +2z/5/DbItpMKffojj4CcVizC/gxfEvp1XqqSt170ZuIvxhxZNC7SuAcH Q==;
X-CSE-ConnectionGUID: pwb6e5znQcCTbOJyEyOqVg==
X-CSE-MsgGUID: ZkrBYv2CSOWaph94etNVoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="91565933"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="91565933"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:23:40 -0800
X-CSE-ConnectionGUID: wXomLIIhSYiykgh80Q7DxQ==
X-CSE-MsgGUID: VBh45LWxTsSmFF8jDIjh/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="191860270"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.102])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 02:23:38 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t v2 04/10] lib/xe/xe_sriov_provisioning: Add sched
 priority mask to string helper
Date: Tue, 25 Nov 2025 11:23:03 +0100
Message-ID: <20251125102312.43142-5-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
References: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
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

Introduce xe_sriov_sched_priority_mask_to_string() to format a
scheduling priority bitmask as a space-separated list of priority names.
Introduce xe_sriov_sched_priority_choice_to_mask() to convert an
igt_sysfs_choice into a bitmask and a selected priority index.

Both helpers are thin wrappers around the generic igt_sysfs_choice
functions.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2:
 - Use BIT() macro for sched priority masks and drop static asserts
   (Michal).
 - Converted both helpers to thin wrappers around newly introduced
   generic igt_sysfs_choice helpers (Michal),
   avoiding the need to export the static array of priority names.
---
---
 lib/xe/xe_sriov_provisioning.c | 32 ++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_provisioning.h | 13 +++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index c2a1db4bc..929863059 100644
--- a/lib/xe/xe_sriov_provisioning.c
+++ b/lib/xe/xe_sriov_provisioning.c
@@ -9,6 +9,8 @@
 #include "igt_core.h"
 #include "igt_debugfs.h"
 #include "igt_sriov_device.h"
+#include "igt_sysfs.h"
+#include "igt_sysfs_choice.h"
 #include "intel_chipset.h"
 #include "linux_scaffold.h"
 #include "xe/xe_query.h"
@@ -657,6 +659,36 @@ int xe_sriov_sched_priority_from_string(const char *s,
 	return -EINVAL;
 }
 
+/**
+ * xe_sriov_sched_priority_mask_to_string - Format priority mask as text
+ * @mask: Priority bitmask.
+ * @selected_idx: Index to highlight with brackets, or <0 for none.
+ * @buf: Output buffer.
+ * @buf_sz: Size of @buf.
+ *
+ * Converts @mask to a space-separated string of priority names. If @selected_idx
+ * is >= 0 and present in @mask, that priority is wrapped in brackets, e.g.
+ * "low [normal] high". An empty @mask results in an empty string.
+ *
+ * Returns: @buf.
+ */
+const char *xe_sriov_sched_priority_mask_to_string(unsigned int mask, int selected_idx,
+						   char *buf, size_t buf_sz)
+{
+	return igt_sysfs_choice_format_mask(buf, buf_sz,
+					    xe_sriov_sched_priority_str,
+					    ARRAY_SIZE(xe_sriov_sched_priority_str),
+					    mask, selected_idx);
+}
+
+int xe_sriov_sched_priority_choice_to_mask(const struct igt_sysfs_choice *choice,
+					   unsigned int *mask, int *selected_idx)
+{
+	return igt_sysfs_choice_to_mask(choice, xe_sriov_sched_priority_str,
+					ARRAY_SIZE(xe_sriov_sched_priority_str),
+					mask, selected_idx);
+}
+
 /**
  * __xe_sriov_get_sched_priority - Get the scheduling priority for a given VF
  * @pf: PF device file descriptor
diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
index c9b321d58..c4a11e4c0 100644
--- a/lib/xe/xe_sriov_provisioning.h
+++ b/lib/xe/xe_sriov_provisioning.h
@@ -9,6 +9,7 @@
 #include <stdint.h>
 
 struct xe_mmio;
+struct igt_sysfs_choice;
 
 /**
  * enum xe_sriov_shared_res - Shared resource types
@@ -75,6 +76,14 @@ enum xe_sriov_sched_priority {
 	XE_SRIOV_SCHED_PRIORITY_HIGH
 };
 
+#define XE_SRIOV_SCHED_PRIORITY_MASK_LOW    BIT(XE_SRIOV_SCHED_PRIORITY_LOW)
+#define XE_SRIOV_SCHED_PRIORITY_MASK_NORMAL BIT(XE_SRIOV_SCHED_PRIORITY_NORMAL)
+#define XE_SRIOV_SCHED_PRIORITY_MASK_HIGH   BIT(XE_SRIOV_SCHED_PRIORITY_HIGH)
+#define XE_SRIOV_SCHED_PRIORITY_MASK_ALL \
+	(XE_SRIOV_SCHED_PRIORITY_MASK_LOW | \
+	 XE_SRIOV_SCHED_PRIORITY_MASK_NORMAL | \
+	 XE_SRIOV_SCHED_PRIORITY_MASK_HIGH)
+
 /**
  * struct xe_sriov_provisioned_range - Provisioned range for a Virtual Function (VF)
  * @vf_id: The ID of the VF
@@ -138,6 +147,10 @@ int __xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value);
 void xe_sriov_set_sched_if_idle(int pf, unsigned int gt_num, bool value);
 const char *xe_sriov_sched_priority_to_string(enum xe_sriov_sched_priority value);
 int xe_sriov_sched_priority_from_string(const char *s, enum xe_sriov_sched_priority *value);
+const char *xe_sriov_sched_priority_mask_to_string(unsigned int mask, int selected_idx,
+						   char *buf, size_t buf_sz);
+int xe_sriov_sched_priority_choice_to_mask(const struct igt_sysfs_choice *choice,
+					   unsigned int *mask, int *selected_idx);
 int __xe_sriov_get_sched_priority(int pf, unsigned int vf_num,
 				  unsigned int gt_num,
 				  enum xe_sriov_sched_priority *value);
-- 
2.43.0

