Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38588CA0FED
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 19:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D8910E9C0;
	Wed, 10 Sep 2025 19:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AiiRL5eE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1815F10E9C0
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 19:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757532088; x=1789068088;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VMdPHIgMvx+sOPU/PH93JLvzy4KogLfaGLAgrkRMlPM=;
 b=AiiRL5eEjyMKHPvF+AlXi0dnzQIviyzPz0iHqDUdwZvmz6N3MImIedWS
 jiRnh7gMDX8OL163zhId23YeyAGcpBsTJt5hsg+o6nGzMgRgm+ei0Himo
 h9YbKkQFhfXF9AZlaCfLcci78o9AESoKPN3/LJwlND6UxoZuydo23xF4D
 ZJzVGpOdVRkbbpAJd9cwH1LWDIP7fWLfjVd7NVQywjmXxPqDA41M877mb
 lMK6pBJEFsFOuoBqEtOAZMLra/YRnrd4KnvjvzGgR3v1r8Ku1Y4Lptu7N
 T85ykcm1hf6wQim9EG4OexdkuFJ5Oxd+SXpmxX9B/74YNWirWl11IHgw9 Q==;
X-CSE-ConnectionGUID: uZlb5NLfTxqYflgUTLX/kA==
X-CSE-MsgGUID: FtV7RbglRk6pvNB8xgDlKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="63489603"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="63489603"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 12:21:28 -0700
X-CSE-ConnectionGUID: lHk/7JmWSr6x9eeEA/poZw==
X-CSE-MsgGUID: ltgE6S9FT06QqUx5gO+iWA==
X-ExtLoop1: 1
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 12:21:25 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v3,
 1/3] tests/intel/xe_survivability: Add new xe_survivability test for
 i2c adapter
Date: Thu, 11 Sep 2025 00:50:27 +0530
Message-ID: <20250910192031.1908588-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910192031.1908588-5-sk.anirban@intel.com>
References: <20250910192031.1908588-5-sk.anirban@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=a
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

