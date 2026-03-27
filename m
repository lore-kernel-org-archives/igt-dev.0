Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C1410BA438
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 14:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB7A10ED9A;
	Fri, 27 Mar 2026 14:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ABoc54dN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE0210ECA6
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 14:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774620404; x=1806156404;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=epqb3NKflKUMGXLBoyX8tuJcSIeBnhJnK1h44ZeQqVg=;
 b=ABoc54dNAjfhJWlFmZ9ddBbN+c+AmydIlW1g45+ADFZ6FBFQfiMmN17H
 vcVddxLLbkgkL9lsUjkSMEipa0cq5P4yWhlTBlye5vM73HyO4QDrrsKxh
 eZZGlthoGVDhapbCv++mx76BxoBF5xGjwzNfYpHju1RvSA4z569m2roEW
 pvcWzfT1khPfypMkJmPDkc6u+IqTuvJLzxlge92i8hdKroStBxXl88ux6
 8Q0Fdxx0kRowVmCUpBsiyd4xx8ulQYzUWpA4Q0Q9li2xd1NdKmnnUyySn
 FFSailV88Fn89RBKiQ/xS/m1LmWqm76Jeif4oYefDcPhcG3XCSWrFFiOY w==;
X-CSE-ConnectionGUID: Q7DUBzEpTVqKLTuxMzTlPQ==
X-CSE-MsgGUID: wl8KovCLSAqIrLeeQX2vmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="98309528"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="98309528"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 07:06:43 -0700
X-CSE-ConnectionGUID: DKlWigjlT9qI8U54nsselQ==
X-CSE-MsgGUID: R/+KtDyuTAqhNrJLfXBeJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="263267929"
Received: from lvasutx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.16.239])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 07:06:42 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 2/4] tests/intel/xe_sriov_vfio: Add dynamic
 bind-unbind-vfs subtest
Date: Fri, 27 Mar 2026 15:06:25 +0100
Message-ID: <20260327140627.64574-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327140627.64574-1-marcin.bernatowicz@linux.intel.com>
References: <20260327140627.64574-1-marcin.bernatowicz@linux.intel.com>
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

For each supported numvfs-N configuration, enable N VFs and
bind/unbind each VF to xe-vfio-pci through driver_override.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
v2:
- Split assert_bound_driver_is into two helpers (Lukasz)
- Remove unnecessary unbind before bind (Lukasz)
---
 tests/intel/xe_sriov_vfio.c | 139 ++++++++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/tests/intel/xe_sriov_vfio.c b/tests/intel/xe_sriov_vfio.c
index ef92fb233..fa9026741 100644
--- a/tests/intel/xe_sriov_vfio.c
+++ b/tests/intel/xe_sriov_vfio.c
@@ -3,8 +3,11 @@
  * Copyright(c) 2026 Intel Corporation. All rights reserved.
  */
 
+#include "drmtest.h"
 #include "igt_core.h"
 #include "igt_kmod.h"
+#include "igt_pci.h"
+#include "igt_sriov_device.h"
 
 /**
  * TEST: xe_sriov_vfio
@@ -16,14 +19,135 @@
  *
  * SUBTEST: load-unload-xe-vfio-pci
  * Description: Attempt to load xe_vfio_pci module and then unload it.
+ *
+ * SUBTEST: bind-unbind-vfs
+ * Description: Enable VFs and bind/unbind each one to xe-vfio-pci via driver_override.
  */
 
 IGT_TEST_DESCRIPTION("Xe SR-IOV VFIO tests (xe-vfio-pci)");
 
+#define DRIVER_OVERRIDE_TIMEOUT_MS 200
+
 static const char *XE_VFIO_PCI_MOD = "xe_vfio_pci";
+static const char *XE_VFIO_PCI_DRV = "xe-vfio-pci";
 
+static int pf_fd = -1;
+static bool autoprobe;
 static bool xe_vfio_loaded_initially;
 
+static void assert_xe_vfio_pci_is_bound(const char *pci_slot)
+{
+	char bound[64];
+	int ret;
+
+	ret = igt_pci_get_bound_driver_name(pci_slot, bound, sizeof(bound));
+	igt_assert_f(ret >= 0, "Failed to read bound driver for %s (%d)\n", pci_slot, ret);
+	igt_assert_f(ret > 0, "Expected %s to be bound to %s, but it is unbound\n",
+		     pci_slot, XE_VFIO_PCI_DRV);
+	igt_assert_f(!strcmp(bound, XE_VFIO_PCI_DRV),
+		     "Expected %s to be bound to %s, got %s\n",
+		     pci_slot, XE_VFIO_PCI_DRV, bound);
+}
+
+static void assert_driver_unbound(const char *pci_slot)
+{
+	char bound[64];
+	int ret;
+
+	ret = igt_pci_get_bound_driver_name(pci_slot, bound, sizeof(bound));
+	igt_assert_f(ret >= 0, "Failed to read bound driver for %s (%d)\n", pci_slot, ret);
+	igt_assert_f(ret == 0, "Expected %s to be unbound, but is bound to %s\n",
+		     pci_slot, bound);
+}
+
+static char *vf_pci_slot_alloc(unsigned int vf_id)
+{
+	char *slot = igt_sriov_get_vf_pci_slot_alloc(pf_fd, vf_id);
+
+	igt_assert_f(slot, "Failed to get VF%u PCI slot\n", vf_id);
+	return slot;
+}
+
+static void vf_bind_override(unsigned int vf_id, const char *driver)
+{
+	char *slot = vf_pci_slot_alloc(vf_id);
+	int ret;
+
+	ret = igt_pci_bind_driver_override(slot, driver, DRIVER_OVERRIDE_TIMEOUT_MS);
+	igt_assert_f(ret == 0, "bind %s (VF%u) to %s failed (%d)\n", slot, vf_id, driver, ret);
+	assert_xe_vfio_pci_is_bound(slot);
+
+	free(slot);
+}
+
+static void vf_unbind_override(unsigned int vf_id)
+{
+	char *slot = vf_pci_slot_alloc(vf_id);
+	int ret;
+
+	ret = igt_pci_unbind_driver_override(slot, DRIVER_OVERRIDE_TIMEOUT_MS);
+	igt_assert_f(ret == 0, "unbind %s (VF%u) failed (%d)\n", slot, vf_id, ret);
+	assert_driver_unbound(slot);
+
+	free(slot);
+}
+
+static void bind_unbind_vfs(unsigned int num_vfs)
+{
+	igt_sriov_disable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, num_vfs);
+
+	igt_require_f(!igt_pci_system_reinit(), "Failed to refresh PCI state\n");
+
+	igt_sriov_enable_driver_autoprobe(pf_fd);
+
+	for (unsigned int vf_id = 1; vf_id <= num_vfs; vf_id++) {
+		vf_bind_override(vf_id, XE_VFIO_PCI_DRV);
+		vf_unbind_override(vf_id);
+	}
+
+	igt_sriov_disable_vfs(pf_fd);
+}
+
+static void open_pf(void)
+{
+	int fd;
+
+	if (pf_fd >= 0)
+		return;
+
+	fd = drm_open_driver(DRIVER_XE);
+	igt_assert_fd(fd);
+
+	if (!igt_sriov_is_pf(fd)) {
+		drm_close_driver(fd);
+		igt_skip("Xe device is not an SR-IOV PF\n");
+	}
+
+	if (igt_sriov_get_enabled_vfs(fd) != 0) {
+		drm_close_driver(fd);
+		igt_skip("VFs must be disabled before running this test\n");
+	}
+
+	autoprobe = igt_sriov_is_driver_autoprobe_enabled(fd);
+	pf_fd = fd;
+}
+
+static void cleanup_pf(void)
+{
+	if (pf_fd < 0)
+		return;
+
+	igt_sriov_disable_vfs(pf_fd);
+	igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)\n");
+	autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
+		   igt_sriov_disable_driver_autoprobe(pf_fd);
+	igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
+		       "Failed to restore sriov_drivers_autoprobe value\n");
+	drm_close_driver(pf_fd);
+	pf_fd = -1;
+}
+
 static void restore_xe_vfio_module(void)
 {
 	bool loaded;
@@ -69,7 +193,22 @@ int igt_main()
 		igt_assert(igt_kmod_is_loaded(XE_VFIO_PCI_MOD) == false);
 	}
 
+	igt_describe("Enable VFs and bind/unbind each one to xe-vfio-pci via driver_override.");
+	igt_subtest_with_dynamic("bind-unbind-vfs") {
+		igt_skip_on_f(igt_kmod_load(XE_VFIO_PCI_MOD, NULL),
+			      "Failed to load %s\n", XE_VFIO_PCI_MOD);
+
+		open_pf();
+
+		for_each_sriov_num_vfs(pf_fd, num_vfs) {
+			igt_dynamic_f("numvfs-%u", num_vfs) {
+				bind_unbind_vfs(num_vfs);
+			}
+		}
+	}
+
 	igt_fixture() {
+		cleanup_pf();
 		restore_xe_vfio_module();
 	}
 }
-- 
2.43.0

