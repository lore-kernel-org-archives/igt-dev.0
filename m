Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC4DC282EC
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 11:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FC210E9DA;
	Fri, 14 Mar 2025 11:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ci0j5AH0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60FD10E9DA
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 11:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741952227; x=1773488227;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CMjk/1C+gRom/dX1TW9tlPHHm3brAD6DfWEBAGQFUkA=;
 b=ci0j5AH0E4u0U2sUkd4KBKEPRjrv7vDRt535SuXTkuivo9EY/soh3HQv
 H+m9zyBqpf2peGrSefyTccYE4oMgrFvbnVWK15jW9TKrnKC+GUBCuA9Tc
 Mccke6oAUeYIUcO9NAHs80eAh9WuCVYelr07kc5kcL1btGLXtyn6EVM/p
 NWyGgBCMrbDCtoZptpNeo62u1todmQgEMLeB4/s2twNSip7Wousq6LLvG
 X15QF6k5NeEW8StrNIfONVmu99IUvMwn1VZ4KCMPFCTjEFNY9YFlV/qdf
 2VY+KYFoHTSQne//8A7C8EfP0y+GCNMNRdbkLJTq5uVA7CgB1KUAteIQS w==;
X-CSE-ConnectionGUID: V//DdC/qT4+UFfKV8iC5hw==
X-CSE-MsgGUID: STOhnK5eRHGf/L8lO7qDzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="60497496"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="60497496"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 04:37:07 -0700
X-CSE-ConnectionGUID: QY07yeNrTMyuV3EN90Du5A==
X-CSE-MsgGUID: h6fcSjkaTkaijChSrsN22Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="126293480"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 04:37:05 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t v2 1/2] lib/igt_pm: Introduce helper to check for PM
 capability
Date: Fri, 14 Mar 2025 11:27:31 +0000
Message-Id: <20250314112732.795523-2-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314112732.795523-1-jakub1.kolakowski@intel.com>
References: <20250314112732.795523-1-jakub1.kolakowski@intel.com>
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
 lib/igt_pm.c | 18 ++++++++++++++++++
 lib/igt_pm.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 1a5d9c42b..dd37f20f6 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -45,6 +45,7 @@
 #include "igt_pm.h"
 #include "igt_aux.h"
 #include "igt_sysfs.h"
+#include "igt_pci.h"
 
 /**
  * SECTION:igt_pm
@@ -81,6 +82,7 @@ enum {
 #define MAX_POLICY_STRLEN	strlen(MAX_PERFORMANCE_STR)
 /* Root Port bus can have max 32 dev and each dev can have max 8 func */
 #define MAX_PCI_DEVICES		256
+#define PCI_PM_CAP_ID 0x01
 int8_t *__sata_pm_policies;
 int __scsi_host_cnt;
 
@@ -1470,3 +1472,19 @@ void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val)
 	igt_require(igt_sysfs_has_attr(gtfd, "slpc_ignore_eff_freq"));
 	igt_sysfs_set_u32(gtfd, "slpc_ignore_eff_freq", val);
 }
+
+
+/**
+ * igt_has_pci_pm_capability:
+ * @dev: pci device
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
\ No newline at end of file
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

