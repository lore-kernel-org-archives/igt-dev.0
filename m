Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC677E9D40F
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 16:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767AE10E6C0;
	Wed,  4 Feb 2026 16:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZC1KAQvZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD16510E6C0
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 16:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770222784; x=1801758784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gSAlYbzOo4cTYZYaqZomczOSz1ctn9PN1tNnplgWZ9w=;
 b=ZC1KAQvZaDQkBdjB+Rw+yMa8g5qdTbENpJTMSon4GXErW817LvuiK6K8
 ehQkAGLE1LGIUeO46SelaUj763fNyZzoVMbkfrb2WIAgVfHicQBfGu/ai
 fy2QWFTAMDYRmzyqR8dKji+05vleRc8/+VOZATXXOfsI77muya+qmQrNL
 MbH2kIMGEX60e0BTpaV930Jhmf/uZ/IYEgNp5/LJDofgAChNB96WtKxec
 66MrsSc11THZsVCcH9v22BoQA5PXYzDVAonMxEjRFsMeF+fS0uV4WxCjp
 EC/O0bQKUUiRUb5Qoyzix7l1pJqSJcSnehMPr7w4CwoWHTxzDrAZNnmLe Q==;
X-CSE-ConnectionGUID: iU6FBo1WSqyTC0PGVSqulg==
X-CSE-MsgGUID: ZrW4D7OKSuWh2cJ7pUYptA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="58987912"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="58987912"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:33:03 -0800
X-CSE-ConnectionGUID: NxVFAoi/TfS24bGi8kblXg==
X-CSE-MsgGUID: 39geuys8TMSpN8eHfNUIcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="210215420"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.79])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:33:02 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 i-g-t 7/7] tests/intel/xe_sriov_flr: Skip xe-vfio-pci
 load/bind when IOMMU is off
Date: Wed,  4 Feb 2026 17:32:10 +0100
Message-ID: <20260204163217.121305-8-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
References: <20260204163217.121305-1-marcin.bernatowicz@linux.intel.com>
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

When the IOMMU is disabled VFs typically lack an iommu_group, and
xe-vfio-pci binding may fail. Skip load/bind in that case.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 tests/intel/xe_sriov_flr.c | 43 +++++++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index b73727787..3fc84bbf9 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -13,6 +13,7 @@
 #include "igt_kmod.h"
 #include "igt_pci.h"
 #include "igt_sriov_device.h"
+#include "igt_sysfs.h"
 #include "intel_chipset.h"
 #include "intel_vram.h"
 #include "linux_scaffold.h"
@@ -325,6 +326,44 @@ static void vf_unbind_driver_override(int pf_fd, unsigned int vf_id)
 	free(slot);
 }
 
+static bool vf_has_iommu_group(int pf_fd, unsigned int vf_id)
+{
+	int sysfs;
+	bool present;
+
+	sysfs = igt_sriov_device_sysfs_open(pf_fd, vf_id);
+	if (sysfs < 0)
+		return false;
+
+	present = igt_sysfs_has_attr(sysfs, "iommu_group");
+	close(sysfs);
+
+	return present;
+}
+
+static bool vfs_have_iommu_groups(int pf_fd, int num_vfs)
+{
+	for (int vf_id = 1; vf_id <= num_vfs; vf_id++)
+		if (!vf_has_iommu_group(pf_fd, vf_id))
+			return false;
+
+	return true;
+}
+
+static bool try_load_xe_vfio_pci(int pf_fd, int num_vfs)
+{
+	if (!g_use_xe_vfio_pci)
+		return false;
+
+	if (!vfs_have_iommu_groups(pf_fd, num_vfs)) {
+		igt_info("Disabling xe-vfio-pci binding: missing VF IOMMU group(s) (IOMMU off?)\n");
+		g_use_xe_vfio_pci = false;
+		return false;
+	}
+
+	return igt_kmod_load("xe_vfio_pci", NULL) >= 0;
+}
+
 /**
  * flr_exec_strategy - Function pointer for FLR execution strategy
  * @pf_fd: File descriptor for the Physical Function (PF).
@@ -386,9 +425,7 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
 	if (igt_warn_on(igt_pci_system_reinit()))
 		goto disable_vfs;
 
-	xe_vfio_loaded = false;
-	if (g_use_xe_vfio_pci)
-		xe_vfio_loaded = igt_kmod_load("xe_vfio_pci", NULL) >= 0;
+	xe_vfio_loaded = try_load_xe_vfio_pci(pf_fd, num_vfs);
 	if (xe_vfio_loaded) {
 		vf_bound = calloc(num_vfs + 1, sizeof(*vf_bound));
 		igt_assert(vf_bound);
-- 
2.43.0

