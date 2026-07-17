Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67B6C4451C
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 13:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6692010E0B7;
	Fri, 17 Jul 2026 13:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ejyKweLG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D7A10E0B7
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 13:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784295865; x=1815831865;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YpEYVjGaS7gy8fp/f2okcvfWaqNYdFlKJtkOZalcRrM=;
 b=ejyKweLGifb0JoAHgfjOcWNR1pNBtAB184pADf+WT/dg9PcwCA9Bqs30
 6pwYePknStYO7qCAAAHbXQjpFEW+M6W8CIwdaaIHRaJcMYQaiTI5/klyB
 2h1VfySkTwYPM+3CYgwxCbf8E3Zuirb/Z9T/nbPuYUYav9yj/QqWT2lrP
 sHKICXzaoPwo6W1k3k62NNtWpbWuje81xzozrdTcYxarzhMB3+bwFj1pN
 KWqaAH6PIbXZSfHve8v2I8N8aHVC2WeXRzOTdUaHipH5UAPD5Pi2fz8oF
 PVafCZ/nT7qceYCcBVWAIMPHJvf7P6OqqziSQ3GoCuLJu0larSHJ0vx/M Q==;
X-CSE-ConnectionGUID: pRaTKKMeSjaNIA4ZWiP7rw==
X-CSE-MsgGUID: 3Qn6QnwnSimPH3X+2O/XTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="85009124"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="85009124"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 06:44:25 -0700
X-CSE-ConnectionGUID: JLVlhe1PTemqUYwgwmagzQ==
X-CSE-MsgGUID: /IFvkQWkQ9ea3DB1cPch6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="253380688"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 06:44:23 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, satyanarayana.k.v.p@intel.com,
 michal.wajdeczko@intel.com, jakub1.kolakowski@intel.com,
 adam.miszczak@linux.intel.com
Subject: [PATCH] tests/sriov_basic: Validate PF unbind with VFs enabled
Date: Fri, 17 Jul 2026 15:44:06 +0200
Message-ID: <20260717134406.2627519-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add new subtests covering PF driver unbind with VFs enabled in two
scenarios:
- with all VFs enabled,
- with one VF enabled and probed.

The tests verify that PF ends up unbound and VFs are disabled.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/sriov_basic.c | 82 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
index 1e563cee9..1c5bb878e 100644
--- a/tests/sriov_basic.c
+++ b/tests/sriov_basic.c
@@ -3,8 +3,13 @@
  * Copyright(c) 2023 Intel Corporation. All rights reserved.
  */
 
+#include <limits.h>
+#include <dirent.h>
+
 #include "drmtest.h"
 #include "igt_core.h"
+#include "igt_device.h"
+#include "igt_pci.h"
 #include "igt_sriov_device.h"
 
 IGT_TEST_DESCRIPTION("Basic tests for enabling SR-IOV Virtual Functions");
@@ -118,6 +123,51 @@ static void bind_unbind_vf(int pf_fd, unsigned int vf_num)
 	igt_sriov_disable_vfs(pf_fd);
 }
 
+static unsigned int count_pci_virtfn_entries(const char *pci_slot)
+{
+	char path[PATH_MAX];
+	unsigned int count = 0;
+	struct dirent *de;
+	DIR *dir;
+
+	snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s", pci_slot);
+	dir = opendir(path);
+	igt_assert_f(dir, "Failed to open %s\n", path);
+
+	while ((de = readdir(dir))) {
+		if (!strncmp(de->d_name, "virtfn", strlen("virtfn")))
+			count++;
+	}
+
+	closedir(dir);
+
+	return count;
+}
+
+/**
+ * SUBTEST: pf-unbind-with-vfs-enabled-numvfs-all
+ * Description:
+ *   Verify the PF driver unbind when all VFs are enabled.
+ *
+ * SUBTEST: pf-unbind-with-vf-probed
+ * Description:
+ *   Verify the PF driver unbind when one VF is enabled and probed.
+ */
+static void pf_unbind_with_vfs_enabled(int pf_fd, unsigned int num_vfs, bool vf_probe)
+{
+	char pci_slot[NAME_MAX];
+
+	vf_probe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
+		   igt_sriov_disable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, num_vfs);
+
+	igt_device_get_pci_slot_name(pf_fd, pci_slot);
+	igt_assert_eq(count_pci_virtfn_entries(pci_slot), num_vfs);
+	igt_assert(!igt_pci_device_unbind(pci_slot));
+	igt_assert(!igt_pci_get_bound_driver_name(pci_slot, NULL, 0));
+	igt_assert_eq(count_pci_virtfn_entries(pci_slot), 0);
+}
+
 int igt_main()
 {
 	int pf_fd;
@@ -210,7 +260,39 @@ int igt_main()
 		}
 	}
 
+	igt_subtest_group() {
+		char pci_slot[NAME_MAX];
+		char driver[NAME_MAX];
+
+		igt_fixture() {
+			igt_device_get_pci_slot_name(pf_fd, pci_slot);
+			igt_assert(igt_pci_get_bound_driver_name(pci_slot, driver, sizeof(driver)));
+		}
+
+		igt_describe("Test unbinds the PF driver when all VFs are enabled");
+		igt_subtest("pf-unbind-with-vfs-enabled-numvfs-all") {
+			for_max_sriov_num_vfs(pf_fd, num_vfs) {
+				pf_unbind_with_vfs_enabled(pf_fd, num_vfs, false);
+			}
+		}
+
+		igt_describe("Test unbinds the PF driver when one VF is enabled and probed");
+		igt_subtest("pf-unbind-with-vf-probed") {
+			pf_unbind_with_vfs_enabled(pf_fd, 1, true);
+		}
+
+		igt_fixture() {
+			if (!igt_pci_get_bound_driver_name(pci_slot, NULL, 0)) {
+				close(pf_fd);
+				pf_fd = -1;
+				igt_assert(!igt_pci_driver_bind(driver, pci_slot));
+				pf_fd = drm_open_driver(DRIVER_ANY);
+			}
+		}
+	}
+
 	igt_fixture() {
+		igt_abort_on_f(pf_fd < 0, "Device is not accessible\n");
 		igt_sriov_disable_vfs(pf_fd);
 		/* abort to avoid execution of next tests with enabled VFs */
 		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
-- 
2.43.0

