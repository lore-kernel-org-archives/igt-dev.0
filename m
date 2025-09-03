Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373B6CA0FF2
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 12:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4FF010E800;
	Wed,  3 Sep 2025 12:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W/h/KBhN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8678E10E800
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 12:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756903522; x=1788439522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VMdPHIgMvx+sOPU/PH93JLvzy4KogLfaGLAgrkRMlPM=;
 b=W/h/KBhN9Vchd5lyjbMwbNMxi/v9I/WSlaTU+uDfn8L0QfWmtKpnK5T2
 x0htp6QbfUnf8vTkbvXbx7rxDyUaqU0A/cV0Ca24UIGlg/Oe6rO6QNJ4u
 TH3XkNl5WbNRdOpO9xtbneg972Z2RN62WOaFFBF3AaSlCYQZVBe95M26P
 9v0zExn2t2zDwdGSamIimT8HJUQFocS/zPgDNPy/FMTLdlSKV38CFaxJ0
 zyeIr/2h4AL5B3ODyASVPrd0520z5lr1abrbqEC0LEzuZo45agCWAnYzF
 bIzrdzJzSJr34lud8Eg7AisN5v+oaNqvCvm1xWUflYLQkPsR/c/Im+xVa A==;
X-CSE-ConnectionGUID: ydvZFFWCSNmu51x5rIoFSQ==
X-CSE-MsgGUID: P4bFVoy5QRqtPypU9TTLPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="63032305"
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; d="scan'208";a="63032305"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 05:45:22 -0700
X-CSE-ConnectionGUID: V0y5ImZIQ+qRhutShAl0eA==
X-CSE-MsgGUID: qcEOr3KVS82mvE+KznPQJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; d="scan'208";a="171143680"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 05:45:20 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, kamil.konieczny@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 1/2] tests/intel/xe_survivability: Add new xe_survivability
 test for i2c adapter
Date: Wed,  3 Sep 2025 18:14:53 +0530
Message-ID: <20250903124455.3616608-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903124455.3616608-4-sk.anirban@intel.com>
References: <20250903124455.3616608-4-sk.anirban@intel.com>
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

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_survivability.c | 152 +++++++++++++++++++++++++++++++++
 tests/meson.build              |   1 +
 2 files changed, 153 insertions(+)
 create mode 100644 tests/intel/xe_survivability.c

diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
new file mode 100644
index 000000000..6fb13b391
--- /dev/null
+++ b/tests/intel/xe_survivability.c
@@ -0,0 +1,152 @@
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
+#include "igt_sysfs.h"
+#include "xe/xe_query.h"
+
+/**
+ * TEST: Comprehensive run-time survivability mode testing
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: survivability
+ * Functionality: survivability mode
+ * Description: validate runtime survivability mode functionality
+ * Test category: functionality test
+ */
+
+static char bus_addr[NAME_MAX];
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
+	/* Restore after survivability mode */
+	igt_kmod_unbind("xe", bus_addr);
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
+/**
+ * SUBTEST: i2c-functionality
+ * Description: Validate i2c adapter functionality in survivability mode
+ */
+static void test_i2c_functionality(int configfs_device_fd, struct pci_device *pci_xe)
+{
+	int i2c_adapter_before = 1, i2c_adapter_after;
+	char path[PATH_MAX];
+	int fd;
+
+	/* Check i2c adapter before survivability mode */
+	i2c_adapter_before = find_i2c_adapter(pci_xe);
+
+	/* Enable survivability mode */
+	set_survivability_mode(configfs_device_fd, true);
+
+	/* check presence of survivability mode sysfs */
+	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
+
+	fd = open(path, O_RDONLY);
+	igt_assert_f(fd >= 0, "Survivability mode not set\n");
+	close(fd);
+
+	/* Check i2c adapter after survivability mode */
+	i2c_adapter_after = find_i2c_adapter(pci_xe);
+	if (i2c_adapter_before >= 0) {
+		igt_assert_f(i2c_adapter_after >= 0,
+			     "i2c adapter disappeared in survivability mode (was %d)",
+			     i2c_adapter_before);
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
+static void set_bus_addr(int fd)
+{
+	struct pci_device *pci_dev;
+
+	pci_dev = igt_device_get_pci_device(fd);
+	snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
+		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
+}
+
+igt_main
+{
+	int fd, configfs_fd, configfs_device_fd;
+	struct pci_device *pci_xe;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		pci_xe = igt_device_get_pci_device(fd);
+		set_bus_addr(fd);
+		configfs_fd = igt_configfs_open("xe");
+		igt_require(configfs_fd != -1);
+		configfs_device_fd = create_device_configfs_group(configfs_fd);
+		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
+	}
+
+	igt_describe("Validate i2c adapter functionality in survivability mode");
+	igt_subtest("i2c-functionality") {
+		igt_install_exit_handler(restore);
+		test_i2c_functionality(configfs_device_fd, pci_xe);
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
index 5c01c64e9..8f264d8e8 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -329,6 +329,7 @@ intel_xe_progs = [
 	'xe_sriov_auto_provisioning',
 	'xe_sriov_flr',
 	'xe_sriov_scheduling',
+	'xe_survivability',
 	'xe_sysfs_defaults',
 	'xe_sysfs_preempt_timeout',
 	'xe_sysfs_scheduler',
-- 
2.43.0

