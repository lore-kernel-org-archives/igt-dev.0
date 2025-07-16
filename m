Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8512CC83F22
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 19:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4151510E107;
	Wed, 16 Jul 2025 19:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QjRqarmq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B2A10E107
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 19:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752692712; x=1784228712;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eWnTWIHEE04Ls0k+uukcTwOA8MGa2HZW8H9zfzyZLNY=;
 b=QjRqarmqjvWQPtq3cyuPY3g6g2hITnWormlRxbULzcYR1VQ3sD1llJ58
 9Hqzp8FaXwq5WtP7R1WQkE3o1HepuQYUm5CEtBPr8PgwLOlSvhSPt/T+C
 jFCpLbVPwJTxj3+N7MrO1JAaWpLs04Qx07YBhleJZi2mZkqUZbGw24u73
 UcnzjZj+A200Wxil3bw859sbVi9Ds04z+FzWoEO16ahv8Vvni9AWhze81
 PyMAd4oyLJZhPC5vIq/IeWxjoQVcJKQy5GHpadKUUShn4omK55rQrpC8t
 CVxtGNNIi0BeKQIUsvZufaddyg+Z2urN4Dx0ZEpBiZDiTTs28bJWqSJcJ Q==;
X-CSE-ConnectionGUID: 74rywN5VR2Gnt0PIQSN/Kg==
X-CSE-MsgGUID: ATVxgb6MQOqjQpW7mxwTXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65210617"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="65210617"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 12:05:11 -0700
X-CSE-ConnectionGUID: 4mEue3+ESTGhTpYRx3R1Ng==
X-CSE-MsgGUID: EYqBMoyqRg+eRLXva2YPAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="158133816"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 12:05:09 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, riana.tauro@intel.com, raag.jadav@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t,v3] tests/intel/xe_wedged: Add new test csc-wedged
Date: Thu, 17 Jul 2025 00:34:08 +0530
Message-ID: <20250716190407.3437793-2-sk.anirban@intel.com>
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

Inject a CSC error through uevent to cause the Xe device to enter a wedged
state. To return the device to a normal state, reload the driver, as
the wedged state can only be resolved by rebinding/reprobing the driver.

Check survivability mode to validate that CSC error injection correctly
triggers the survivability state transition.

Related kernel patch series:
https://patchwork.freedesktop.org/series/149756/

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_wedged.c | 79 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index 7fc7ca9eb..c06a167d1 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -14,6 +14,7 @@
 
 #include <limits.h>
 #include <dirent.h>
+#include <libudev.h>
 
 #include "igt.h"
 #include "igt_device.h"
@@ -46,6 +47,49 @@ static void force_wedged(int fd)
 	sleep(1);
 }
 
+static void force_wedged_csc_error(int fd)
+{
+	igt_debugfs_write(fd, "inject_csc_hw_error/probability", "100");
+	igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");
+
+	xe_force_gt_reset_sync(fd, 0);
+	sleep(1);
+}
+
+static char bus_addr[NAME_MAX];
+
+static int check_survivability_and_uevents(int fd, struct udev_monitor *mon)
+{
+	struct udev_device *device;
+	struct pci_device *pci_dev;
+	char path[PATH_MAX];
+	int dirfd;
+
+	pci_dev = igt_device_get_pci_device(fd);
+	snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
+		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
+	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
+	dirfd = open(path, O_RDONLY);
+
+	if (mon) {
+		device = udev_monitor_receive_device(mon);
+		const char *dev_path = udev_device_get_property_value(device, "DEVPATH");
+		const char *wedged = udev_device_get_property_value(device, "WEDGED");
+
+		igt_cleanup_uevents(mon);
+
+	igt_assert_f(wedged && !strcmp(wedged, "vendor-specific"),
+		     "Expected WEDGED property to be 'vendor-specific', got '%s'",
+		     wedged);
+
+	igt_assert_f(dev_path && strstr(dev_path, bus_addr),
+		     "Expected bus address '%s' to be part of DEVPATH '%s'",
+		     bus_addr, dev_path);
+	}
+
+	return dirfd;
+}
+
 static int simple_ioctl(int fd)
 {
 	int ret;
@@ -208,6 +252,11 @@ simple_hang(int fd, struct drm_xe_sync *sync)
  * SUBTEST: basic-wedged-read
  * Description: Read wedged_mode debugfs
  */
+/**
+ * SUBTEST: csc-wedged
+ * Description: Force Xe device wedged after injecting a failure in CSC
+ */
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -300,12 +349,42 @@ igt_main
 		igt_assert_f(str[0] != '\0', "Failed to read wedged_mode from debugfs!\n");
 	}
 
+	igt_subtest("csc-wedged") {
+		struct udev_monitor *mon;
+
+		igt_require(igt_debugfs_exists(fd, "inject_csc_hw_error/probability",
+					       O_RDWR));
+
+		igt_assert_f(check_survivability_and_uevents(fd, NULL) < 0,
+			     "survivability_mode sysfs available");
+		igt_debugfs_write(fd, "inject_csc_hw_error/verbose", "1");
+
+		ignore_wedged_in_dmesg();
+		mon = igt_watch_uevents();
+		force_wedged_csc_error(fd);
+
+		igt_assert_f(check_survivability_and_uevents(fd, mon) >= 0,
+			     "survivability_mode sysfs not available");
+
+		drm_close_driver(fd);
+		igt_kmod_rebind("xe", pci_slot);
+		fd = drm_open_driver(DRIVER_XE);
+		igt_assert_eq(simple_ioctl(fd), 0);
+		xe_for_each_engine(fd, hwe)
+			simple_exec(fd, hwe);
+	}
+
 	igt_fixture {
 		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
 			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
 			igt_debugfs_write(fd, "fail_gt_reset/times", "1");
 		}
 
+		if (igt_debugfs_exists(fd, "inject_csc_hw_error/probability", O_RDWR)) {
+			igt_debugfs_write(fd, "inject_csc_hw_error/probability", "0");
+			igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");
+		}
+
 		/* Tests might have failed, force a rebind before exiting */
 		drm_close_driver(fd);
 		igt_kmod_rebind("xe", pci_slot);
-- 
2.43.0

