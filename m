Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94A9C54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 10:10:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877AA10E552;
	Wed, 29 Jul 2026 10:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nyDfYpmh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971C910E392
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 10:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785319774; x=1816855774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fE5hlhgedvk1OmA3hZ/vtNs9HlmHlHN8thCqib2CwjY=;
 b=nyDfYpmhwidoHm7x6YggW2H0dCfNBqA7mVQYnFqf7GJy2UVAvsB633sU
 52czWU9gEYC6IFTsScaxboCFRWipDcUFh0Kx+FlRr64anh+iSBI1UO2Kg
 FCaSOZG4QMRrZvCBqL5eGvLyoD+BxbmrY00xmdnBbyB5LmS9OaX4aslRy
 wcbpcWyxQhe3uPGxU6elNViWVrf5yObdObU7QtHLVmj3RM8Gm+C2AK28Q
 jEFfa5Rc6VDnVpUYzDt7bzyoG1eNxau9PTQjRqrpKiBsYaRV7ooUshxjq
 tc48zPvFUbTG3Zuncdmeprw/lWeFc7OMF67hyyVXOeeOuUz/BIW0qX8Wh A==;
X-CSE-ConnectionGUID: s/61U0KyQii/kVVaXgXP3Q==
X-CSE-MsgGUID: Mbm0whphQ9el/0SV8kex1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89739899"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="89739899"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 03:09:34 -0700
X-CSE-ConnectionGUID: ZUrfbqN6QGKM/mR/jDU6vg==
X-CSE-MsgGUID: 00ukeg1zQWGZNFby0OmMow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="265005359"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 03:09:33 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com,
	janusz.krzysztofik@intel.com
Subject: [PATCH 2/2] tests/sriov_basic: Validate PF unbind with VFs enabled
Date: Wed, 29 Jul 2026 12:09:18 +0200
Message-ID: <20260729100918.842807-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729100918.842807-1-lukasz.laguna@intel.com>
References: <20260729100918.842807-1-lukasz.laguna@intel.com>
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
 tests/sriov_basic.c | 94 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
index 1e563cee9..4ce5397e6 100644
--- a/tests/sriov_basic.c
+++ b/tests/sriov_basic.c
@@ -3,8 +3,13 @@
  * Copyright(c) 2023 Intel Corporation. All rights reserved.
  */
 
+#include <dirent.h>
+
 #include "drmtest.h"
 #include "igt_core.h"
+#include "igt_device.h"
+#include "igt_device_scan.h"
+#include "igt_pci.h"
 #include "igt_sriov_device.h"
 
 IGT_TEST_DESCRIPTION("Basic tests for enabling SR-IOV Virtual Functions");
@@ -118,6 +123,67 @@ static void bind_unbind_vf(int pf_fd, unsigned int vf_num)
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
+static void pf_unbind_with_vfs_enabled(int *pf_fd, unsigned int num_vfs, bool vf_probe)
+{
+	char pci_slot[NAME_MAX];
+
+	vf_probe ? igt_sriov_enable_driver_autoprobe(*pf_fd) :
+		   igt_sriov_disable_driver_autoprobe(*pf_fd);
+	igt_sriov_enable_vfs(*pf_fd, num_vfs);
+
+	igt_device_get_pci_slot_name(*pf_fd, pci_slot);
+	igt_assert_eq(count_pci_virtfn_entries(pci_slot), num_vfs);
+	igt_assert(!drm_close_driver(*pf_fd));
+	*pf_fd = -1;
+	igt_assert(!igt_pci_device_unbind(pci_slot));
+	igt_assert(!igt_pci_get_bound_driver_name(pci_slot, NULL, 0));
+	igt_assert_eq(count_pci_virtfn_entries(pci_slot), 0);
+}
+
+static void restore_pf_after_unbind(int *pf_fd, const char *pci_slot, const char *driver)
+{
+	int ret;
+
+	ret = igt_pci_get_bound_driver_name(pci_slot, NULL, 0);
+	if (!ret)
+		igt_assert(!igt_pci_driver_bind(driver, pci_slot));
+	else
+		igt_assert_eq(ret, 1);
+
+	if (*pf_fd < 0)
+		*pf_fd = drm_open_driver(DRIVER_ANY);
+}
+
 int igt_main()
 {
 	int pf_fd;
@@ -210,7 +276,35 @@ int igt_main()
 		}
 	}
 
+	igt_subtest_group() {
+		char pci_slot[NAME_MAX];
+		char driver[NAME_MAX];
+
+		igt_fixture() {
+			igt_device_set_filter_from_fd(pf_fd);
+			igt_device_get_pci_slot_name(pf_fd, pci_slot);
+			igt_assert(igt_pci_get_bound_driver_name(pci_slot, driver, sizeof(driver)));
+		}
+
+		igt_describe("Test unbinds the PF driver when all VFs are enabled");
+		igt_subtest("pf-unbind-with-vfs-enabled-numvfs-all") {
+			for_max_sriov_num_vfs(pf_fd, num_vfs) {
+				pf_unbind_with_vfs_enabled(&pf_fd, num_vfs, false);
+			}
+		}
+
+		igt_describe("Test unbinds the PF driver when one VF is enabled and probed");
+		igt_subtest("pf-unbind-with-vf-probed") {
+			pf_unbind_with_vfs_enabled(&pf_fd, 1, true);
+		}
+
+		igt_fixture() {
+			restore_pf_after_unbind(&pf_fd, pci_slot, driver);
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

