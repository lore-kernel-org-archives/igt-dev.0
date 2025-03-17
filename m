Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D8EC282EC
	for <igt-dev@archiver.kernel.org>; Mon, 17 Mar 2025 17:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F0F10E2F6;
	Mon, 17 Mar 2025 17:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DL6BBuqH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B51310E2F6
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Mar 2025 17:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742233852; x=1773769852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0ISeNuA4gse5nyFeMBe1g8QJb5RuBZWfL3RQOn33WyI=;
 b=DL6BBuqHLSAGWH5CzkN/4DZp3kqd3EEWgoFo69VNB9I0QIIzfP2whwbj
 fU3AoMAAegXQYEXoYAnrtMwsmc2s3S/EIQw4WgBLmdhBmIdC2RrOjx38L
 hE04gOb1ce2HxHYxrr9sKlOv1To31s2GDmMarPZoW17U/r0PY3qvEWZ7t
 ivtBiIDbTTYkU4FQdOaEnqVCDiMum5lNgf921k99yT6pKkqPp6KRp8XU4
 BZEI+JPfskGnRZ02UgAsOxiDYflMhKvA2KQSQ6BrDF89HRGFgTns5yRL2
 dFu+6m8GmmrukR4WnGeEQFMMwpbn3DLev5lGqs5NS8ncDz5uGpuZfvhEz w==;
X-CSE-ConnectionGUID: g3MjsecoROeZ5nntl9zcfQ==
X-CSE-MsgGUID: r1m5ut9PQsyryhcDVnu0Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="60878801"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="60878801"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 10:50:52 -0700
X-CSE-ConnectionGUID: vReA9zYsRZW4KhZH2gulRQ==
X-CSE-MsgGUID: KjR2hy8fTIuTFCD4x3v/hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="121959343"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 10:50:50 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t v3 1/2] lib/igt_pm: Introduce helper to check for PM
 capability
Date: Mon, 17 Mar 2025 17:41:33 +0000
Message-Id: <20250317174134.991555-2-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250317174134.991555-1-jakub1.kolakowski@intel.com>
References: <20250317174134.991555-1-jakub1.kolakowski@intel.com>
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

Introduce igt_has_pci_pm_capability(), a helper function to check
whether a PCI device supports the PCI Power Management (PM) capability.
With this helper one can make sure the capability is present on device
under test before proceeding with any actions related to PM.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 lib/igt_pm.c | 19 ++++++++++++++++++-
 lib/igt_pm.h |  1 +
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 1a5d9c42b..7f9cbd69a 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -40,10 +40,11 @@
 #include <dirent.h>
 
 #include "drmtest.h"
+#include "igt_aux.h"
 #include "igt_device_scan.h"
 #include "igt_kms.h"
+#include "igt_pci.h"
 #include "igt_pm.h"
-#include "igt_aux.h"
 #include "igt_sysfs.h"
 
 /**
@@ -81,6 +82,7 @@ enum {
 #define MAX_POLICY_STRLEN	strlen(MAX_PERFORMANCE_STR)
 /* Root Port bus can have max 32 dev and each dev can have max 8 func */
 #define MAX_PCI_DEVICES		256
+#define PCI_PM_CAP_ID 0x01
 int8_t *__sata_pm_policies;
 int __scsi_host_cnt;
 
@@ -1470,3 +1472,18 @@ void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val)
 	igt_require(igt_sysfs_has_attr(gtfd, "slpc_ignore_eff_freq"));
 	igt_sysfs_set_u32(gtfd, "slpc_ignore_eff_freq", val);
 }
+
+/**
+ * igt_has_pci_pm_capability:
+ * @pci_dev: PCI device struct
+ *
+ * Returns: true if the device has PCI Power Management capability, false otherwise.
+ */
+bool igt_has_pci_pm_capability(struct pci_device *pci_dev)
+{
+	int offset;
+
+	offset = find_pci_cap_offset(pci_dev, PCI_PM_CAP_ID);
+
+	return (offset > 0);
+}
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 6b428f53e..c73972f2a 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -97,5 +97,6 @@ uint64_t igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
 uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
+bool igt_has_pci_pm_capability(struct pci_device *pci_dev);
 
 #endif /* IGT_PM_H */
-- 
2.34.1

