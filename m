Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE69C28B2F
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 17:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128BB10E648;
	Tue, 11 Mar 2025 17:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="POja1PFL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707EF10E648
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 17:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741713129; x=1773249129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ELNyBXEONYXkBIvH7gWbD1waGd5SkZyOWQ1S8/HfpxY=;
 b=POja1PFLpq14TxWUjJB8dQatDlntj9Q7JRSpDkE8DHB0ucWlfwZOvun0
 XPbgMM5ZSURe95IoGFBguZvwvRqqQeetL2Q9V/Rg5GpM573SN1YivkQ71
 Bj4UIyxtD9HMz15L6H0U78kVJT57yBGlp55/b4AnhY/DaCMNx/0xZZ2M8
 D3jm7BmKjsS4nfR9DSqkv07rD8blW3br5JsLD9EGmssYoRLioqtBARMRv
 wfld16y14aGrhNAGhquflrdRxFggdr1UaJXGcHKOB9SZBeI6qS9F4W9FE
 9qWg/ORS4A/fd5nH5jp09+CzJwLsu2EPNIR9nt2FknGEFaP+t/F+dd+ks A==;
X-CSE-ConnectionGUID: tW9iiWYwTJuchm4mSz2BVA==
X-CSE-MsgGUID: SFanAIrOQwWQia9yWtCusw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="60312207"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="60312207"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 10:12:08 -0700
X-CSE-ConnectionGUID: eslvlNDBR/GljT9EunuE+Q==
X-CSE-MsgGUID: Fq0dlCMDTfSjYtmc23XBkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120325701"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 10:12:07 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_pm: Introduce helper to check for PM
 capability
Date: Tue, 11 Mar 2025 17:01:43 +0000
Message-Id: <20250311170144.602535-2-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311170144.602535-1-jakub1.kolakowski@intel.com>
References: <20250311170144.602535-1-jakub1.kolakowski@intel.com>
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

Add power management capability checking helper. With this helper one
can make sure the capability is present on device under test before
proceeding with any actions related to PM. This is mainly aimed to check
for availability of D-states but overall it checks for the PCI
capability in general.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 lib/igt_pm.c | 20 ++++++++++++++++++++
 lib/igt_pm.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 1a5d9c42b..21e3137ab 100644
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
 
@@ -1470,3 +1472,21 @@ void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val)
 	igt_require(igt_sysfs_has_attr(gtfd, "slpc_ignore_eff_freq"));
 	igt_sysfs_set_u32(gtfd, "slpc_ignore_eff_freq", val);
 }
+
+
+/**
+ * igt_is_pm_supported:
+ * @dev: pci device
+ *
+ * Returns: True if power management capability is present, otherwise false
+ */
+bool igt_is_pm_supported(struct pci_device *pci_dev)
+{
+	int offset;
+
+	offset = find_pci_cap_offset(pci_dev, PCI_PM_CAP_ID);
+	if (offset > 0)
+		return true;
+
+	return false;
+}
\ No newline at end of file
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 6b428f53e..befb61f3c 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -97,5 +97,6 @@ uint64_t igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
 uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
+bool igt_is_pm_supported(struct pci_device *pci_dev);
 
 #endif /* IGT_PM_H */
-- 
2.34.1

