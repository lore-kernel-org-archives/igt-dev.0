Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139FDCCF9EA
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 08:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10D810E5B5;
	Tue, 28 Oct 2025 08:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LAhE9Kgx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5131810E5B5
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 08:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761640407; x=1793176407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b6DSoxyUk4Ar6LRRslkIPphKLfidJ5ytHyrGnhFvT+Q=;
 b=LAhE9KgxiMc6YFqsiwfW9ULU2hLcj/EZNvUJegX2lhguI3Si3SeAN0i1
 PGn+dQC0BkKLaeRweOrxkOuStntSfjN99JvZlS1iL2xtGhcFDocJpHZla
 TYtMvKO8y1lIEiZFgHsSB0qj2jVjYlFTzw10KbUrVzH49m4+qnvHxjS6Z
 cyERZpbss6J/fIEbY300qXTh85dxdfB2LDuRVM5pgAnwvXebDd4+zCJEu
 ZsDTPiONtwu46T1jn6koho9x0GbicjtFH7+RJAPfT7S/lSUMx73IrZdjm
 ybT+Fjy0t3WOIJ+d1PpRvp2pK/5SdNsPJ1Bqxu3o+hhSpAz9/jdWraiik Q==;
X-CSE-ConnectionGUID: rad06yG+TUiKQOeXO5APwQ==
X-CSE-MsgGUID: 1VKh0hF9RyaLqx6Lt9NqkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89203677"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="89203677"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:33:27 -0700
X-CSE-ConnectionGUID: 4DHC/i1hR9K8FnFBUAZmeQ==
X-CSE-MsgGUID: a+VfOmIGQWW1gCQtg8N+8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="216165153"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:33:24 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v7,
 1/3] tests/intel/xe_survivability: Add new xe_survivability test for
 i2c adapter
Date: Tue, 28 Oct 2025 13:58:56 +0530
Message-ID: <20251028082856.3197023-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028082856.3197023-5-sk.anirban@intel.com>
References: <20251028082856.3197023-5-sk.anirban@intel.com>
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

Add i2c adapter presence check in survivability mode to ensure
the Add-In Management Controller (AMC) can receive firmware updates
when the device is in survivability mode.

v2: Create new file for test (Riana)
v3: Update subject, description, nitpick (Kamil)
    Use drm_close_driver() (Kamil)
v4: Update test details (Riana)
    Align with xe_configfs (Riana)
    Create separate function for sysfs (Riana)
v5: Remove duplicate close(fd) (Riana)
    Modify fixture (Riana)
    Move assert to function (Riana)
v6: Move VF check (Riana)
v7: Clear survivability mode (Riana)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_survivability.c | 157 +++++++++++++++++++++++++++++++++
 tests/meson.build              |   1 +
 2 files changed, 158 insertions(+)
 create mode 100644 tests/intel/xe_survivability.c

diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
new file mode 100644
index 000000000..b20192958
--- /dev/null
+++ b/tests/intel/xe_survivability.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#include <dirent.h>
+#include <fcntl.h>
+#include <limits.h>
+
+#include "igt.h"
+#include "igt_configfs.h"
+#include "igt_device.h"
+#include "igt_fs.h"
+#include "igt_kmod.h"
+#include "igt_sriov_device.h"
+#include "igt_sysfs.h"
+#include "xe/xe_query.h"
+
+/**
+ * TEST: Comprehensive survivability mode testing
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: Telemetry
+ * Functionality: survivability mode
+ * Description: Validate survivability mode functionality
+ * Test category: Functional tests
+ *
+ * SUBTEST: i2c-functionality
+ * Description: Validate i2c adapter functionality in survivability mode
+ */
+
+static char bus_addr[NAME_MAX];
+
+static bool check_survivability_mode_sysfs(void)
+{
+	char path[PATH_MAX];
+	int fd;
+
+	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
+	fd = open(path, O_RDONLY);
+	igt_assert_f(fd >= 0, "Survivability mode not set\n");
+	close(fd);
+	return true;
+}
+
+static int find_i2c_adapter(struct pci_device *pci_xe)
+{
+	char device_path[PATH_MAX];
+	struct dirent *dirent;
+	int i2c_adapter = -1;
+	DIR *device_dir;
+	int ret;
+
+	igt_require(igt_kmod_load("i2c-dev", NULL) == 0);
+
+	snprintf(device_path, sizeof(device_path), "/sys/bus/pci/devices/%s/%s.%hu", bus_addr,
+		 "i2c_designware", (pci_xe->bus << 8) | (pci_xe->dev));
+	device_dir = opendir(device_path);
+
+	if (!device_dir)
+		return -1;
+
+	while ((dirent = readdir(device_dir))) {
+		if (strncmp(dirent->d_name, "i2c-", 4) == 0) {
+			ret = sscanf(dirent->d_name, "i2c-%d", &i2c_adapter);
+			igt_assert_f(ret == 1, "Failed to parse i2c adapter number");
+			closedir(device_dir);
+			return i2c_adapter;
+		}
+	}
+
+	closedir(device_dir);
+	return i2c_adapter;
+}
+
+static void restore(int sig)
+{
+	int configfs_fd;
+
+	igt_kmod_unbind("xe", bus_addr);
+
+	configfs_fd = igt_configfs_open("xe");
+	if (configfs_fd >= 0)
+		igt_fs_remove_dir(configfs_fd, bus_addr);
+	close(configfs_fd);
+
+	igt_kmod_bind("xe", bus_addr);
+}
+
+static void set_survivability_mode(int configfs_device_fd, bool value)
+{
+	igt_kmod_unbind("xe", bus_addr);
+	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode", value);
+	igt_kmod_bind("xe", bus_addr);
+}
+
+static void test_i2c_functionality(int configfs_device_fd, struct pci_device *pci_xe)
+{
+	if (find_i2c_adapter(pci_xe) >= 0) {
+		/* Enable survivability mode */
+		set_survivability_mode(configfs_device_fd, true);
+
+		/* check presence of survivability mode sysfs */
+		check_survivability_mode_sysfs();
+
+		/* Check i2c adapter after survivability mode */
+		igt_assert_f(find_i2c_adapter(pci_xe) >= 0,
+			     "i2c not initialized\n");
+
+		set_survivability_mode(configfs_device_fd, false);
+	}
+}
+
+static int create_device_configfs_group(int configfs_fd)
+{
+	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
+	int configfs_device_fd;
+
+	configfs_device_fd = igt_fs_create_dir(configfs_fd, bus_addr, mode);
+	igt_assert(configfs_device_fd);
+
+	return configfs_device_fd;
+}
+
+igt_main
+{
+	int fd, configfs_fd, configfs_device_fd;
+	struct pci_device *pci_xe;
+	bool vf_device;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
+		vf_device = intel_is_vf_device(fd);
+		igt_require_f(!vf_device, "survivability mode not supported in VF\n");
+		pci_xe = igt_device_get_pci_device(fd);
+		igt_device_get_pci_slot_name(fd, bus_addr);
+		configfs_fd = igt_configfs_open("xe");
+		igt_require(configfs_fd != -1);
+		configfs_device_fd = create_device_configfs_group(configfs_fd);
+		igt_install_exit_handler(restore);
+	}
+
+	igt_describe("Validate i2c adapter functionality in survivability mode");
+	igt_subtest("i2c-functionality") {
+		test_i2c_functionality(configfs_device_fd, pci_xe);
+		drm_close_driver(fd);
+		igt_kmod_rebind("xe", bus_addr);
+		fd = drm_open_driver(DRIVER_XE);
+	}
+
+	igt_fixture {
+		igt_fs_remove_dir(configfs_fd, bus_addr);
+		close(configfs_device_fd);
+		close(configfs_fd);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 73edd3e71..31487f62e 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -329,6 +329,7 @@ intel_xe_progs = [
 	'xe_sriov_auto_provisioning',
 	'xe_sriov_flr',
 	'xe_sriov_scheduling',
+        'xe_survivability',
 	'xe_sriov_vram',
 	'xe_sysfs_defaults',
 	'xe_sysfs_preempt_timeout',
-- 
2.43.0

