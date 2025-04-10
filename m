Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C68C3601E
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 05:45:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E913C10E762;
	Thu, 10 Apr 2025 05:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hl8jAN0U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752E810E762
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 05:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744263943; x=1775799943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rr19fzli9LjtAiZxvojVCWvD8sxuBsy+gMpZVjBHDRA=;
 b=hl8jAN0UPSjp6GiAd1bHd5X22pIxCC6xv7bKyKyGD9+MQpwYjtRPUigJ
 EimR43191GHz/0fAjMrbzCasES+ipzVFEpEQKx/gVkA+3Q7yOEmOX496n
 ZwT3IY17ONZb2XSVH6KGqZ4nX010WyYsTX9rIHEBprUhKoj7EqRFq0MW2
 GvldpSfjFscbBu61FipYjvd4QS8rZb6skmrSGi5pDMZexoHC081xJBIYM
 eovWwFmRJcjVUVjKEXfYqF5DOnoWltwRudhNXGB8Z+AkE+KqPPS49SfC5
 m8iTuGzyMbfIY8Z/ArrtNtnWO5r3GWOjPFsJyO6dJchY7AZB+QxwT8BJL Q==;
X-CSE-ConnectionGUID: C9XzMOPBQQ+amDk2OAUyxQ==
X-CSE-MsgGUID: mrf74TGLQlGi/vpuKisrcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="44902880"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="44902880"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 22:45:43 -0700
X-CSE-ConnectionGUID: 2VjYEhbxR6mA0jTEul4Yow==
X-CSE-MsgGUID: omHCVxMqSX6V0JpFnRvahw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="133765977"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 22:45:41 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 katarzyna.piecielska@intel.com
Subject: [PATCH i-g-t 2/2] tests/intel/xe_configfs: Add test to validate
 survivability mode
Date: Thu, 10 Apr 2025 11:37:26 +0530
Message-ID: <20250410060727.1857299-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250410060727.1857299-1-riana.tauro@intel.com>
References: <20250410060727.1857299-1-riana.tauro@intel.com>
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

The test validates if survivability mode is enabled on supported
platforms when configured using configfs attribute.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_configfs.c | 138 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 2 files changed, 139 insertions(+)
 create mode 100644 tests/intel/xe_configfs.c

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
new file mode 100644
index 000000000..8954ed87c
--- /dev/null
+++ b/tests/intel/xe_configfs.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#include <limits.h>
+
+#include "igt.h"
+#include "igt_configfs.h"
+#include "igt_device.h"
+#include "igt_sysfs.h"
+
+/**
+ * TEST: Check configfs userspace API
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: uapi
+ * Functionality: configfs
+ * Description: validate configfs entries
+ * Test category: functionality test
+ */
+
+static char bus_addr[NAME_MAX];
+static uint32_t dev_id;
+
+static int driver_fd(void)
+{
+	int fd;
+
+	fd = open("/sys/bus/pci/drivers/xe", O_RDONLY);
+	igt_assert_f(fd >= 0, "Can't open path\n");
+
+	return fd;
+}
+
+static void driver_bind(void)
+{
+	int fd;
+
+	fd = driver_fd();
+	igt_sysfs_write(fd, "bind", bus_addr, sizeof(bus_addr));
+	close(fd);
+}
+
+static void driver_unbind(void)
+{
+	int fd;
+
+	fd = driver_fd();
+	igt_sysfs_write(fd, "unbind", bus_addr, sizeof(bus_addr));
+	close(fd);
+}
+
+static void restore(int sig)
+{
+	/* Restore after survivability mode */
+	driver_unbind();
+	driver_bind();
+}
+
+static void set_survivability_mode(int dir_fd, bool value)
+{
+	driver_unbind();
+	igt_sysfs_set_boolean(dir_fd, "survivability_mode", value);
+	driver_bind();
+}
+
+static void check_survivability_mode(void)
+{
+	char path[PATH_MAX], buf[4096];
+	int fd, len;
+
+	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s", bus_addr);
+	fd = open(path, O_RDONLY);
+	igt_assert_f(fd >= 0, "Cannot open %s\n", path);
+
+	len = igt_sysfs_read(fd, "survivability_mode", buf, sizeof(buf) - 1);
+	if (len > 0) {
+		buf[len] = '\0';
+		igt_info("Survivability Mode:\n%s", buf);
+	}
+	close(fd);
+
+	if (IS_BATTLEMAGE(dev_id))
+		igt_assert_f(len > 0, "Survivability mode not set\n");
+}
+
+/**
+ * SUBTEST: survivability-mode
+ * Description: Validate survivability mode by setting configfs
+ */
+static void test_survivability_mode(int dir_fd)
+{
+	/* Enable survivability mode */
+	set_survivability_mode(dir_fd, true);
+
+	check_survivability_mode();
+}
+
+static int create_device_configfs(int configfs_fd, int fd)
+{
+	int dir_fd;
+	struct pci_device *pci_dev;
+
+	pci_dev = igt_device_get_pci_device(fd);
+	snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
+		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
+
+	dir_fd = igt_configfs_create_directory(configfs_fd, bus_addr);
+	igt_assert(dir_fd);
+
+	return dir_fd;
+}
+
+igt_main
+{
+	int fd, configfs_fd, dir_fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		dev_id = intel_get_drm_devid(fd);
+		configfs_fd = igt_configfs_open("xe");
+		igt_require(configfs_fd != -1);
+		dir_fd = create_device_configfs(configfs_fd, fd);
+	}
+
+	igt_describe("Validate survivability mode");
+	igt_subtest("survivability-mode") {
+		igt_install_exit_handler(restore);
+		test_survivability_mode(dir_fd);
+	}
+
+	igt_fixture {
+		igt_configfs_remove_directory(configfs_fd, bus_addr);
+		close(dir_fd);
+		close(configfs_fd);
+		close(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 2a63d888f..74684ea35 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -279,6 +279,7 @@ intel_xe_progs = [
 	'xe_create',
 	'xe_compute',
 	'xe_compute_preempt',
+        'xe_configfs',
 	'xe_copy_basic',
 	'xe_dma_buf_sync',
 	'xe_debugfs',
-- 
2.47.1

