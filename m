Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D06D10775E6
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 16:15:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E374A10E45A;
	Wed, 18 Mar 2026 16:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="USu2kcOt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA65E10E179
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 16:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773850503; x=1805386503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ohu98m1jxu5r78PXyJUOkL+TcnDCzs6y38INBMEq5CA=;
 b=USu2kcOtygR2SnfNvQAZ2KTQjkXXjOqmkmekqEyTO/Yusy8SN+o5FnGv
 FAcSO5JoaHcxbv+RbMgUctbwN4ohs3FWNyUNylDJpn+TPvrq4D7yhdtyC
 LF8Lu69okwu0J50tuBM4wTvkIiGlRuXWYb6VfC7xcbB54c5PSu1peOHMO
 /NuJzSiMTy2exHpOEF6DU491nof+Nv0Xk/5UQEowryzKhiPML9MqJGux8
 K17RRn5wC9PnFCyhflqW7wOppt5wUTqMDPKcUvBZowb8Bc8kmFU6nJXH9
 6KnIqC9oDaVpSwwhbFuIij2YpOzocBR3mWpjpXytuvwvYNiToJIcrXvpd A==;
X-CSE-ConnectionGUID: kfC0t2w2Rp6lxhIRx86NaQ==
X-CSE-MsgGUID: Nr3632YnRzyYSdqT2HGHgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74798218"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="74798218"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 09:15:03 -0700
X-CSE-ConnectionGUID: LjZSVpLpTyCsYydPog4Znw==
X-CSE-MsgGUID: lHhfVioaTI2fc8KWnwJOEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="218228813"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.180.135])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 09:15:01 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 kamil.konieczny@linux.intel.com, lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 1/4] tests/intel/xe_sriov_vfio: Add module load/unload
 subtests
Date: Wed, 18 Mar 2026 17:14:44 +0100
Message-ID: <20260318161447.961840-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318161447.961840-1-marcin.bernatowicz@linux.intel.com>
References: <20260318161447.961840-1-marcin.bernatowicz@linux.intel.com>
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

Introduce subtests that verify xe_vfio_pci can be loaded and unloaded,
while reporting already-loaded or already-unloaded initial state as
success. The unload path still skips when xe-vfio-pci has bound devices,
to avoid attempting removal while the driver is in use.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_vfio.c | 88 +++++++++++++++++++++++++++++++++++++
 tests/meson.build           |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 tests/intel/xe_sriov_vfio.c

diff --git a/tests/intel/xe_sriov_vfio.c b/tests/intel/xe_sriov_vfio.c
new file mode 100644
index 000000000..2fe0137e1
--- /dev/null
+++ b/tests/intel/xe_sriov_vfio.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2026 Intel Corporation. All rights reserved.
+ */
+
+#include <ctype.h>
+#include <dirent.h>
+
+#include "igt_core.h"
+#include "igt_kmod.h"
+
+/**
+ * TEST: xe_sriov_vfio
+ * Category: Core
+ * Mega feature: SR-IOV
+ * Sub-category: SR-IOV VFIO
+ * Functionality: VFIO module
+ * Description: Verify basic xe-vfio-pci module operations.
+ *
+ * SUBTEST: load-xe-vfio-pci
+ * Description: Attempt to load xe_vfio_pci module.
+ *
+ * SUBTEST: unload-xe-vfio-pci
+ * Description: Attempt to unload xe_vfio_pci module (skips if busy).
+ */
+
+IGT_TEST_DESCRIPTION("Xe SR-IOV VFIO tests (xe-vfio-pci)");
+
+static const char *XE_VFIO_PCI_MOD = "xe_vfio_pci";
+static const char *XE_VFIO_PCI_DRV = "xe-vfio-pci";
+
+static bool pci_driver_has_any_bound_devices(const char *driver)
+{
+	char path[PATH_MAX];
+	DIR *dir;
+	struct dirent *de;
+
+	snprintf(path, sizeof(path), "/sys/bus/pci/drivers/%s", driver);
+	dir = opendir(path);
+	if (!dir)
+		return false;
+
+	while ((de = readdir(dir))) {
+		if (de->d_type != DT_LNK)
+			continue;
+		if (!isdigit(de->d_name[0]))
+			continue;
+
+		closedir(dir);
+		return true;
+	}
+
+	closedir(dir);
+	return false;
+}
+
+int igt_main()
+{
+	igt_describe("Attempt to load xe_vfio_pci module.");
+	igt_subtest("load-xe-vfio-pci") {
+		int ret;
+
+		if (igt_kmod_is_loaded(XE_VFIO_PCI_MOD))
+			igt_info("%s already loaded\n", XE_VFIO_PCI_MOD);
+
+		ret = igt_kmod_load(XE_VFIO_PCI_MOD, NULL);
+		igt_assert_f(ret == 0, "Failed to load %s (%d)\n", XE_VFIO_PCI_MOD, ret);
+		igt_assert(igt_kmod_is_loaded(XE_VFIO_PCI_MOD));
+	}
+
+	igt_describe("Attempt to unload xe_vfio_pci module (skips if busy).");
+	igt_subtest("unload-xe-vfio-pci") {
+		int ret;
+
+		if (!igt_kmod_is_loaded(XE_VFIO_PCI_MOD)) {
+			igt_info("%s already unloaded\n", XE_VFIO_PCI_MOD);
+			igt_success();
+		}
+
+		if (pci_driver_has_any_bound_devices(XE_VFIO_PCI_DRV))
+			igt_skip("%s has bound devices; not attempting unload\n", XE_VFIO_PCI_DRV);
+
+		ret = igt_kmod_unload(XE_VFIO_PCI_MOD);
+		igt_assert_f(ret == 0, "Failed to unload %s (%d)\n", XE_VFIO_PCI_MOD, ret);
+		igt_assert_f(!igt_kmod_is_loaded(XE_VFIO_PCI_MOD), "%s still loaded\n",
+			     XE_VFIO_PCI_MOD);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index cecb4a8ae..26d9345ec 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -337,6 +337,7 @@ intel_xe_progs = [
 	'xe_sriov_admin',
 	'xe_sriov_auto_provisioning',
 	'xe_sriov_flr',
+	'xe_sriov_vfio',
 	'xe_sriov_scheduling',
         'xe_survivability',
 	'xe_sriov_vram',
-- 
2.43.0

