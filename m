Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4732D44C41
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 13:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A62110E757;
	Thu, 15 Jan 2026 13:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iDzCs51m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FE910E757
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 13:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768483118; x=1800019118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ug1WO2GMEo+/pAQMWFtQgN07pMAVqUNbGQawSJ2MMF0=;
 b=iDzCs51mFmtJONwL0GqTynR5uHztgzu7MurUnM3o6npwo4M7jZtc68Oi
 9h6/OHxoRyXoc8Qs757OziFu+CBiAtpdViPO73f9cPO7i6G1FY1XcaALq
 gc08LfmJlpsOIuf6cwXXCbxuKzV63m0LYLIGN5enuut3jEVwwSuM3e0bY
 uKjXp/XQuKnyIkXN3u5MGr2XEQ762QZByXYmSaxLJle+2Cnv1oDpJXYa1
 Qje6il0BDiwDxawuop3akdHas1xT6ojfRTA+e7Aq4fipJbWBT5+673rot
 gqa4U7ACLw1eo1Zx2f9dKACd+TFD/YEClWDJdaC9CNYgamuqU2Z4XDQEE g==;
X-CSE-ConnectionGUID: L1qDUPCNR0Kf1KRrB9Zcuw==
X-CSE-MsgGUID: HeHNEiN2QHGIAh0gYxx+uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80509808"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="80509808"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 05:18:38 -0800
X-CSE-ConnectionGUID: tUT2fHvhQau/F2eoUzzb/g==
X-CSE-MsgGUID: D9y/n1A8QwS18EGd/YvAdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="205364151"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.180.143])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 05:18:36 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com, michal.winiarski@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 3/4] tests/intel/xe_sriov_flr: Attach VFs to xe-vfio-pci
 before initiating FLR
Date: Thu, 15 Jan 2026 14:18:08 +0100
Message-ID: <20260115131812.256678-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260115131812.256678-1-marcin.bernatowicz@linux.intel.com>
References: <20260115131812.256678-1-marcin.bernatowicz@linux.intel.com>
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

Attach all VFs to the xe-vfio-pci driver before running the FLR scenario.
This allows the test to rely on xe-vfio-pci’s FLR wait handling, which is
triggered when writing to the VF reset sysfs attribute.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Suggested-by: Michał Winiarski <michal.winiarski@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_flr.c | 45 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 12989d0f5..5efe98a86 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -9,6 +9,8 @@
 #include "drmtest.h"
 #include "igt_core.h"
 #include "igt_device.h"
+#include "igt_kmod.h"
+#include "igt_pci.h"
 #include "igt_sriov_device.h"
 #include "intel_chipset.h"
 #include "intel_vram.h"
@@ -276,6 +278,36 @@ static void subchecks_report_results(struct subcheck *checks, int num_checks)
 	igt_skip_on(skips == num_checks);
 }
 
+static void vf_bind_driver_override(int pf_fd, unsigned int vf_id,
+				    const char *driver)
+{
+	char *slot = igt_sriov_get_vf_pci_slot_alloc(pf_fd, vf_id);
+	int ret;
+
+	igt_assert(slot);
+	igt_assert(driver);
+
+	ret = igt_pci_bind_driver_override(slot, driver);
+	igt_warn_on_f(ret < 0, "bind %s (VF%u) to %s ret=%d\n",
+		      slot, vf_id, driver, ret);
+
+	free(slot);
+}
+
+static void vf_unbind_driver_override(int pf_fd, unsigned int vf_id)
+{
+	char *slot = igt_sriov_get_vf_pci_slot_alloc(pf_fd, vf_id);
+	int ret;
+
+	igt_assert(slot);
+
+	ret = igt_pci_unbind_driver_override(slot);
+	igt_warn_on_f(ret < 0, "unbind %s (VF%u) driver_override ret=%d\n",
+		      slot, vf_id, ret);
+
+	free(slot);
+}
+
 /**
  * flr_exec_strategy - Function pointer for FLR execution strategy
  * @pf_fd: File descriptor for the Physical Function (PF).
@@ -325,6 +357,7 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
 {
 	const int wait_flr_ms = 200;
 	int i, vf_id, flr_vf_id = -1;
+	bool xe_vfio_loaded;
 
 	igt_sriov_disable_driver_autoprobe(pf_fd);
 	igt_sriov_enable_vfs(pf_fd, num_vfs);
@@ -335,6 +368,13 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
 	if (igt_warn_on(igt_pci_system_reinit()))
 		goto disable_vfs;
 
+	xe_vfio_loaded = igt_kmod_load("xe_vfio_pci", NULL) >= 0;
+	if (xe_vfio_loaded) {
+		igt_sriov_enable_driver_autoprobe(pf_fd);
+		for (vf_id = 1; vf_id <= num_vfs; vf_id++)
+			vf_bind_driver_override(pf_fd, vf_id, "xe-vfio-pci");
+	}
+
 	init_mmio(pf_fd, num_vfs);
 
 	for (i = 0; i < num_checks; ++i)
@@ -357,6 +397,11 @@ cleanup:
 
 	cleanup_mmio();
 
+	if (xe_vfio_loaded) {
+		for (vf_id = 1; vf_id <= num_vfs; vf_id++)
+			vf_unbind_driver_override(pf_fd, vf_id);
+	}
+
 disable_vfs:
 	igt_sriov_disable_vfs(pf_fd);
 
-- 
2.43.0

