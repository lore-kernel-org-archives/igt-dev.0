Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B4AC369C2
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 09:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11E410E552;
	Tue, 22 Apr 2025 09:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bEkStCb0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93FF10E552
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 09:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745314435; x=1776850435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dOCT0NFsxZGlcHUVfnCAZPHuUkz7P19/10Tw7A2oxqA=;
 b=bEkStCb0Tmlkwd09j4Yb2d5k3zFS5ca0kDjVCgkaf/CoIVdLMKhexQr/
 tOzwcqKNuM9/1sEwH4CXJe0PA0F1ZgQhw1j0qC4eqotKD2FLlMMqknQv3
 UtVyzdKgy/BgnJjnXjdC4AhGMcedN9xA3tmDpUlsRrs4MHXdT7RYHRl2W
 KvyPRJbKWmIXHxH+BU2qvNQc5uPKbFqwq3Xzc+tg6mpgmthUv+fGQ3XRQ
 Qkam6Yaai4xjK4buKk87FiH1xHKC3N6DbhHszhQX3TUIaw2FQoJ3Eme47
 Pw0wv486QPfRS2LKOln3SsxVdw/sKQSEiBcOI4bRuefJrclkwM0sRIWd/ g==;
X-CSE-ConnectionGUID: WfD1bTMmSE6DUvGBeUF1ag==
X-CSE-MsgGUID: 43e20GaqRlSWi8LR4V+CXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="58232872"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="58232872"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 02:33:55 -0700
X-CSE-ConnectionGUID: SCKdxGUMRJWV32y3Egvn8A==
X-CSE-MsgGUID: r52cdrfsRH2VRImp5TW1eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="131874878"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.239.27])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 02:33:51 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 aravind.iddamsetty@linux.intel.com, louis.chauvet@bootlin.com
Subject: [PATCH i-g-t 5/5] tests/intel/xe_configfs: Add test to validate
 survivability mode
Date: Tue, 22 Apr 2025 15:26:01 +0530
Message-ID: <20250422095602.55041-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250422095602.55041-1-riana.tauro@intel.com>
References: <20250422095602.55041-1-riana.tauro@intel.com>
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
 tests/intel/xe_configfs.c | 112 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 tests/intel/xe_configfs.c

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
new file mode 100644
index 000000000..414af4a86
--- /dev/null
+++ b/tests/intel/xe_configfs.c
@@ -0,0 +1,112 @@
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
+static uint32_t dev_id;
+
+static void restore(int sig)
+{
+	/* Restore after survivability mode */
+	igt_kmod_unbind("xe", bus_addr);
+	igt_kmod_bind("xe", bus_addr);
+}
+
+static void set_survivability_mode(int dir_fd, bool value)
+{
+	igt_kmod_unbind("xe", bus_addr);
+	igt_sysfs_set_boolean(dir_fd, "survivability_mode", value);
+	igt_kmod_bind("xe", bus_addr);
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
+	dir_fd = igt_fs_create_dir(configfs_fd, bus_addr, 0755);
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
+		igt_fs_remove_dir(configfs_fd, bus_addr);
+		close(dir_fd);
+		close(configfs_fd);
+		close(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 8cb3fc4d2..e0e9ed299 100644
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

