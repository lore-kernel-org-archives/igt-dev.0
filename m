Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BF0C531CB
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jul 2026 09:58:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4827E10F054;
	Thu, 23 Jul 2026 09:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e5oTbWgJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C282410F054
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2026 09:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784800638; x=1816336638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r/E3WnWHRH0foAH9jt6Qri71hj633xTAhQK3OyqAxuw=;
 b=e5oTbWgJSZcBwi/EKZbt3eD5iJZ51iPAak0Tbe8YULpuXtvIipMo/5li
 rwUVxHfxrjl3TT8Y5DuCV/EDdBy+6QIGzQgsx0Z3aoIE95bQzU0FUG6VM
 cxKK4XDFNdTNVizSrm94xT/vT0bEfZgoPMRuwg6i4fMmSP/ohqPQtNLOD
 btFThfEyPZVWurQe+N/G8u6bxHkGGf+3+C2VRfwrv8qbVZEyeTe4wVH0h
 Sg5jxUxBMEKnK4sd/mC4RJ771tRC8lWgq+HthrXQMBptylelilVRRaoCb
 WDOpIu6ubxGbL/ASElbAzb/ZFs55g0tGsViKgIKQI2MQKgSow9EEx77L2 g==;
X-CSE-ConnectionGUID: YSrThz+lTbqnAjUzesIoqQ==
X-CSE-MsgGUID: VVoY3jSpSjOZgyq1SBK/Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96826194"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="96826194"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 02:57:18 -0700
X-CSE-ConnectionGUID: kLFV0w58SbeyFDPcQ3Plgg==
X-CSE-MsgGUID: tVlYM7r9SUOVVvruV4VpfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="254016178"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 02:57:17 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com,
	janusz.krzysztofik@intel.com
Subject: [PATCH 2/2] tests/sriov_basic: Validate PF unbind with VFs enabled
Date: Thu, 23 Jul 2026 11:57:01 +0200
Message-ID: <20260723095701.528790-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723095701.528790-1-lukasz.laguna@intel.com>
References: <20260723095701.528790-1-lukasz.laguna@intel.com>
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
v2:
 - close PF fd before unbind (Marcin),
 - ensure to reopen the same device (Marcin).
---
 tests/sriov_basic.c | 93 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/tests/sriov_basic.c b/tests/sriov_basic.c
index 1e563cee9..510fd02c0 100644
--- a/tests/sriov_basic.c
+++ b/tests/sriov_basic.c
@@ -3,8 +3,12 @@
  * Copyright(c) 2023 Intel Corporation. All rights reserved.
  */
 
+#include <dirent.h>
+
 #include "drmtest.h"
 #include "igt_core.h"
+#include "igt_device.h"
+#include "igt_pci.h"
 #include "igt_sriov_device.h"
 
 IGT_TEST_DESCRIPTION("Basic tests for enabling SR-IOV Virtual Functions");
@@ -118,6 +122,67 @@ static void bind_unbind_vf(int pf_fd, unsigned int vf_num)
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
@@ -210,7 +275,35 @@ int igt_main()
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

