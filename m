Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45967CA0FF2
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 12:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBD210E844;
	Wed,  3 Sep 2025 12:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GfcT3cGO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D91E10E844
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 12:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756903527; x=1788439527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NXmbTih+a9xcSzhLR4hRsH2crp92L4P9IlxhXDfeCII=;
 b=GfcT3cGOPvOM1uLWojbrjGCxShXYikGhcOHxqp4KhiUpcu5hUkMV6eJJ
 AnrZUYYQBWElCRev76Y8emFnPT1W2R8UCCLz3NHycAPkG/Rrxsb7BKlvA
 ta/DKtIhGrXtzRvr+yMPSrcy23gnDvg7YMxKr5x5AfGd5YuayTy+oFcIo
 TfHSBnuxNdgw/CoozwqtRrg/l352Y4qTCIygVDRoFJduVFxqaS18Q2LZV
 ZWULNuEJqYC1pt7EucKJq3Bs+OcgYDa47SZxSvOd8cdzojvtg35uM2AKM
 uy/cFnWrqOZiZGXct6G3VUWOQbxxII+xtjkr9lmCWpBu3jNxayedJrYzv A==;
X-CSE-ConnectionGUID: 7Ut6ePWaSYCyXO4Yn0BuTQ==
X-CSE-MsgGUID: 5z3I4SLgTnGs7J+0eFjiFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="63032312"
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; d="scan'208";a="63032312"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 05:45:25 -0700
X-CSE-ConnectionGUID: bcVr9UKLTWC9yrCNrDsd9w==
X-CSE-MsgGUID: QkEFoDGhQxqvaMtK/V67Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; d="scan'208";a="171143694"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 05:45:23 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, kamil.konieczny@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH 2/2] tests/intel/xe_wedged: Add new test csc-wedged
Date: Wed,  3 Sep 2025 18:14:54 +0530
Message-ID: <20250903124455.3616608-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903124455.3616608-4-sk.anirban@intel.com>
References: <20250903124455.3616608-4-sk.anirban@intel.com>
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

v3: Update commit message (Riana)
    Modify the uevents interrupt handling (Riana)

Related kernel patch series:
https://patchwork.freedesktop.org/series/149756/

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_wedged.c | 79 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index 7fc7ca9eb..750796414 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -12,6 +12,7 @@
  * Test category: functionality test
  */
 
+#include <libudev.h>
 #include <limits.h>
 #include <dirent.h>
 
@@ -46,6 +47,50 @@ static void force_wedged(int fd)
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
+	const char *dev_path;
+	const char *wedged;
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
+		dev_path = udev_device_get_property_value(device, "DEVPATH");
+		wedged = udev_device_get_property_value(device, "WEDGED");
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
@@ -208,6 +253,10 @@ simple_hang(int fd, struct drm_xe_sync *sync)
  * SUBTEST: basic-wedged-read
  * Description: Read wedged_mode debugfs
  */
+/**
+ * SUBTEST: csc-wedged
+ * Description: Force Xe device wedged after injecting a failure in CSC
+ */
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

