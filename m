Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753A0C3ABDA
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 06:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3C210E2F8;
	Tue, 20 May 2025 06:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SJtbqGRe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32CF10E3A9
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 06:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747722339; x=1779258339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RWfjjiUXaSfwBH8kRYMbn/budiYWGbUf4FiQ9J/kLyo=;
 b=SJtbqGRe+QfGYK6kbzLa9RhtgYBif451ZVheHNY5rQp4khr6ff6rn9FS
 q8O4IbgugCY8HpkSv9ZUtWWrMcQKsQ27ZNfQ12SUpmE5LSKtLQT75tQEx
 xEBusUn6JXHyvJqqU7sT5ITeUZKauMga3NlkXDXl3ZhBn62t1Y49A3PE6
 jyFxaroL4No5b/+N6Ig4BTsXJ4Yi7G7fhgSfSpFnYOJSsp3+AYZrbFzd4
 TgeC6/tcEZKjyWiYzRBMr3jFAgW1Jgj4JP+hFL9W3s7er+oa0Jq5p6lgM
 gYgTnQM/iltIbfkID64AbHoJgGE7OMrVPC17jLCKIVrWpnXIm6XKNG9O9 Q==;
X-CSE-ConnectionGUID: Atwo3RnOTLudeRBheGpLCw==
X-CSE-MsgGUID: by5hJ9uRSDa73C8hNloslw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="52272731"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="52272731"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 23:25:38 -0700
X-CSE-ConnectionGUID: Y2oRzbsdQua3y06bDjbZ3w==
X-CSE-MsgGUID: zr+4NSklTBO+aph9gySGAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="170609613"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 23:25:36 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 kamil.konieczny@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, louis.chauvet@bootlin.com
Subject: [PATCH i-g-t v4 5/5] tests/intel/xe_configfs: Add test to validate
 survivability mode
Date: Tue, 20 May 2025 12:19:10 +0530
Message-ID: <20250520064910.663022-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250520064910.663022-1-riana.tauro@intel.com>
References: <20250520064910.663022-1-riana.tauro@intel.com>
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

v2: make test platform specific
    check for presence of file for survivability mode
    use mode_t flags (Aravind)

v3: rename dir_fd to configfs_device_fd (Rodrigo)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 tests/intel/xe_configfs.c | 100 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 tests/intel/xe_configfs.c

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
new file mode 100644
index 000000000..e5701b7d1
--- /dev/null
+++ b/tests/intel/xe_configfs.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#include <limits.h>
+
+#include "igt.h"
+#include "igt_configfs.h"
+#include "igt_device.h"
+#include "igt_fs.h"
+#include "igt_kmod.h"
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
+ * SUBTEST: survivability-mode
+ * Description: Validate survivability mode by setting configfs
+ */
+static void test_survivability_mode(int configfs_device_fd)
+{
+	char path[PATH_MAX];
+	int fd;
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
+}
+
+static int create_device_configfs_group(int configfs_fd, int fd)
+{
+	int configfs_device_fd;
+	struct pci_device *pci_dev;
+	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
+
+	pci_dev = igt_device_get_pci_device(fd);
+	snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
+		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
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
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		configfs_fd = igt_configfs_open("xe");
+		igt_require(configfs_fd != -1);
+		configfs_device_fd = create_device_configfs_group(configfs_fd, fd);
+	}
+
+	igt_describe("Validate survivability mode");
+	igt_subtest("survivability-mode") {
+		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
+		igt_install_exit_handler(restore);
+		test_survivability_mode(configfs_device_fd);
+	}
+
+	igt_fixture {
+		igt_fs_remove_dir(configfs_fd, bus_addr);
+		close(configfs_device_fd);
+		close(configfs_fd);
+		close(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 20ddddb89..55bcf57ec 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -279,6 +279,7 @@ intel_xe_progs = [
 	'xe_compute',
 	'xe_compute_preempt',
 	'xe_copy_basic',
+	'xe_configfs',
 	'xe_dma_buf_sync',
 	'xe_drm_fdinfo',
 	'xe_eu_stall',
-- 
2.47.1

