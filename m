Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B74ED46BEB
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 18:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E554210E751;
	Wed, 28 Jan 2026 18:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ymz98fOU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D92010E751
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 18:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769623736; x=1801159736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ImK2agT1/KSr8tPCeUd7Z1rpfsP4m77B3iNgxEXKXtY=;
 b=Ymz98fOU11b7lYW/IiJQtX5M8RTCzfBQw4Ew6UjUVuV7vuz2DDIHSEkE
 pVXC4gi6F4b/cOPHQz68aC18WB/awd2d7W7BXw12gSsNOkdXXaSqC5MCW
 ISoTxL7HRVkKOvk1FndJVQsnwbxITXgf1BL7nU8OrHvVmbQnsbjMbzolF
 G8RdfyUJ4gVCF2Zr7il40ekJuARNWb4I6qj26g6Soy2NzqeZOZwr2o4cn
 NPoZdS+nU23qC0Eya789fqXBYtl5d8hiBvkOspP1sDPx0rITLdC9nkSB8
 Sz1ePQx7+Yxr9qte4GkN12PqVJB8gcAlAsBCffyKwU4ZgXsYOgfkDOZo0 Q==;
X-CSE-ConnectionGUID: o//uzKUQS0K3WV/Av3E2Qg==
X-CSE-MsgGUID: 5ZDVadIxT/yUnlrJoq9xwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70819884"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70819884"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 10:08:56 -0800
X-CSE-ConnectionGUID: qYUVet9QRm+nb9dgpBFHDw==
X-CSE-MsgGUID: luhWp/hrQT+LcMXZojs8IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="231282822"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.71])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 10:08:54 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.wajdeczko@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v3 i-g-t 04/10] lib/xe/xe_sriov_provisioning: Add sched
 priority mask to string helper
Date: Wed, 28 Jan 2026 19:08:10 +0100
Message-ID: <20260128180819.1373376-5-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128180819.1373376-1-marcin.bernatowicz@linux.intel.com>
References: <20260128180819.1373376-1-marcin.bernatowicz@linux.intel.com>
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
- Make xe_sriov_sched_priority_mask_to_string() return error code
  instead of NULL.
- Add doc for xe_sriov_sched_priority_mask_to_string() and define it first

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/xe/xe_sriov_provisioning.c | 47 ++++++++++++++++++++++++++++++++++
 lib/xe/xe_sriov_provisioning.h | 13 ++++++++++
 2 files changed, 60 insertions(+)

diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
index c2a1db4bc..f8dda09fb 100644
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
@@ -657,6 +659,51 @@ int xe_sriov_sched_priority_from_string(const char *s,
 	return -EINVAL;
 }
 
+/**
+ * xe_sriov_sched_priority_choice_to_mask - Map parsed sysfs choice to mask + selection
+ * @choice: Parsed choice (tokens + selected index)
+ * @mask: Output bitmask of known priorities present in @choice
+ * @selected_idx: Output selected priority index in the known-name table, or -1
+ *
+ * Converts an &struct igt_sysfs_choice representing the sched_priority sysfs
+ * attribute into a bitmask and an optional selected index.
+ *
+ * The bit positions in @mask correspond to &enum xe_sriov_sched_priority values
+ * (LOW/NORMAL/HIGH). Unknown tokens in @choice are ignored (best-effort), so
+ * tests can tolerate kernels that add extra choices.
+ *
+ * Return: 0 on success, -EINVAL on invalid arguments.
+ */
+int xe_sriov_sched_priority_choice_to_mask(const struct igt_sysfs_choice *choice,
+					   unsigned int *mask, int *selected_idx)
+{
+	return igt_sysfs_choice_to_mask(choice, xe_sriov_sched_priority_str,
+					ARRAY_SIZE(xe_sriov_sched_priority_str),
+					mask, selected_idx);
+}
+
+/**
+ * xe_sriov_sched_priority_mask_to_string - Format priority mask as text
+ * @buf: Output buffer.
+ * @buf_sz: Size of @buf.
+ * @mask: Priority bitmask.
+ * @selected_idx: Index to highlight with brackets, or <0 for none.
+ *
+ * Converts @mask to a space-separated string of priority names. If @selected_idx
+ * is >= 0 and present in @mask, that priority is wrapped in brackets, e.g.
+ * "low [normal] high". An empty @mask results in an empty string.
+ *
+ * Return: 0 on success, -EINVAL on invalid args, -E2BIG if @buf_sz is too small.
+ */
+int xe_sriov_sched_priority_mask_to_string(char *buf, size_t buf_sz,
+					   unsigned int mask, int selected_idx)
+{
+	return igt_sysfs_choice_format_mask(buf, buf_sz,
+					 xe_sriov_sched_priority_str,
+					 ARRAY_SIZE(xe_sriov_sched_priority_str),
+					 mask, selected_idx);
+}
+
 /**
  * __xe_sriov_get_sched_priority - Get the scheduling priority for a given VF
  * @pf: PF device file descriptor
diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
index c9b321d58..6661b33cc 100644
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
+int xe_sriov_sched_priority_choice_to_mask(const struct igt_sysfs_choice *choice,
+					   unsigned int *mask, int *selected_idx);
+int xe_sriov_sched_priority_mask_to_string(char *buf, size_t buf_sz,
+					   unsigned int mask, int selected_idx);
 int __xe_sriov_get_sched_priority(int pf, unsigned int vf_num,
 				  unsigned int gt_num,
 				  enum xe_sriov_sched_priority *value);
-- 
2.43.0

