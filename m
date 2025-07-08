Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635E9C83F0F
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 09:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1673010E336;
	Tue,  8 Jul 2025 09:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BUgWCAY8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87E810E336
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 09:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751966633; x=1783502633;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sfaTYYoCznUM9nUs4N9kl3NMWNVM9AxUr96bqwDH5Jk=;
 b=BUgWCAY8COu//ENS3j+e07cJoqud5RIEitMr4viiXIZGnOYky2Yn90Ia
 OEYGLS8XN+Hgp+nJewsn6rH9IVeqEX+bWm6ZliiUl8bm0+1zVZ/aFmAdu
 G+PdB3rJrs8wpmVFIqOXOucwavyW7vKK7yHaQ+g+qEcBunsxYWP4v858M
 3yuu7rMUMU2TXphN57oYmZcYBBeKPs8lf143+iubu59yM+GE8BSoWA9xD
 Ip9yldhbl41f3WrMmsk+VYWi9SrpEZXfTOQa0xMwaCnAe5eMOyzT0Ff9N
 lixNrIzeztJXMwy1/xTYW+h4K775qe8B7p/JPHluR9FPgP1nHTrqpHreg A==;
X-CSE-ConnectionGUID: 78oq/oRhTIChNKkLPhQO9A==
X-CSE-MsgGUID: KmykhvN5TjeMf2mSYVYVJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="41819812"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="41819812"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 02:23:52 -0700
X-CSE-ConnectionGUID: RU+2vl3HR0qm7Q6+HOeIJQ==
X-CSE-MsgGUID: xqUadoLaTKeYr3KP0OeGTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="155071353"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 02:23:50 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, riana.tauro@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t] tests/intel/xe_wedged: Add new test csc-wedged
Date: Tue,  8 Jul 2025 14:53:03 +0530
Message-ID: <20250708092302.2553111-2-sk.anirban@intel.com>
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

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_wedged.c | 85 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index 7fc7ca9eb..b29e9bcb5 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -14,6 +14,7 @@
 
 #include <limits.h>
 #include <dirent.h>
+#include <libudev.h>
 
 #include "igt.h"
 #include "igt_device.h"
@@ -46,6 +47,46 @@ static void force_wedged(int fd)
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
+static int check_survivability_mode(int fd)
+{
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
+	return dirfd;
+}
+
+static void intercept_udev_events(struct udev_device *device)
+{
+	const char *dev_path = udev_device_get_property_value(device, "DEVPATH");
+	const char *wedged = udev_device_get_property_value(device, "WEDGED");
+
+	igt_assert_f(wedged && !strcmp(wedged, "vendor-specific"),
+		     "Expected WEDGED property to be 'vendor-specific', got '%s'",
+		     wedged);
+
+	igt_assert_f(dev_path && strstr(dev_path, bus_addr),
+		     "Expected bus address '%s' to be part of DEVPATH '%s'",
+		     bus_addr, dev_path);
+}
+
 static int simple_ioctl(int fd)
 {
 	int ret;
@@ -208,6 +249,11 @@ simple_hang(int fd, struct drm_xe_sync *sync)
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
@@ -300,12 +346,51 @@ igt_main
 		igt_assert_f(str[0] != '\0', "Failed to read wedged_mode from debugfs!\n");
 	}
 
+	igt_subtest("csc-wedged") {
+		struct udev *udev = udev_new();
+		struct udev_monitor *monitor;
+		struct udev_device *device;
+
+		igt_require(igt_debugfs_exists(fd, "inject_csc_hw_error/probability",
+					       O_RDWR));
+
+		igt_assert_f(check_survivability_mode(fd) < 0,
+			     "survivability_mode sysfs available");
+
+		igt_debugfs_write(fd, "inject_csc_hw_error/verbose", "1");
+		igt_assert_eq(simple_ioctl(fd), 0);
+		ignore_wedged_in_dmesg();
+
+		monitor = udev_monitor_new_from_netlink(udev, "kernel");
+		udev_monitor_enable_receiving(monitor);
+
+		force_wedged_csc_error(fd);
+
+		device = udev_monitor_receive_device(monitor);
+		intercept_udev_events(device);
+
+		igt_assert_f(check_survivability_mode(fd) >= 0,
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

