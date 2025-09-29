Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831D8CAC5B0
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 17:54:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BDB10E47B;
	Mon, 29 Sep 2025 17:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OOlCHj60";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6146210E477
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 17:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759168496; x=1790704496;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FQQCDYd/WkGy+EpItXaXhZNDlrE25GYW6P+swHluPgs=;
 b=OOlCHj60K+Q0XWV2ICBwCyDUXbo0moUnnlw1rotIeZcsbcAomZt4Rj2s
 m5Zu5EI327i4dLgI8qSVt1gxQ3SS4zsNzKOTppWCXpnMoHFdKAazQFP0d
 04SmoaBfHQYPf+nyLK7aJn7QQeXwt2vTWnpTqrvpkNySfQw6GKqQ3ePU4
 bftqrYliovC9FgHSx9GH/huNS6BKnG+jEnowCSyI7bBlCYpJRUyu9he3f
 co8fU8zlq8g3g7Wu+TwYF/pKvDhmfoSE/kLo1cgbVN1xOgAJsl8sbMhEA
 aiN9+SXAobQCN8W3dz/8+/CYUxU6OQcWSjREo0e9ebia7AHv3733+4hrM g==;
X-CSE-ConnectionGUID: DO/HLklgQdGZpAvifImvjw==
X-CSE-MsgGUID: QGsvq4PLTpSX5bQiR1HMxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61330332"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61330332"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 10:54:56 -0700
X-CSE-ConnectionGUID: SviJTHo7QT+Q6jahhn6P4w==
X-CSE-MsgGUID: 4IlFquSNTaiJ6mlq9vx5rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="177868372"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 10:54:53 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v5,
 2/3] tests/intel/xe_survivability: Add new test runtime survivability
Date: Mon, 29 Sep 2025 23:22:30 +0530
Message-ID: <20250929175230.753899-7-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250929175230.753899-5-sk.anirban@intel.com>
References: <20250929175230.753899-5-sk.anirban@intel.com>
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
v4: Move test to xe_survivability (Riana)
v5: Use separate function for sysfs (Riana)
    Cosmetic changes (Riana)
    Use basic spinner (Riana)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_survivability.c | 93 ++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
index 3ce62657e..dab70e3d8 100644
--- a/tests/intel/xe_survivability.c
+++ b/tests/intel/xe_survivability.c
@@ -4,6 +4,7 @@
  */
 #include <dirent.h>
 #include <fcntl.h>
+#include <libudev.h>
 #include <limits.h>
 
 #include "igt.h"
@@ -11,8 +12,13 @@
 #include "igt_device.h"
 #include "igt_fs.h"
 #include "igt_kmod.h"
+#include "igt_sriov_device.h"
 #include "igt_sysfs.h"
+#include "intel_allocator.h"
+#include "xe/xe_gt.h"
+#include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_spin.h"
 
 /**
  * TEST: Comprehensive survivability mode testing
@@ -25,10 +31,24 @@
  *
  * SUBTEST: i2c-functionality
  * Description: Validate i2c adapter functionality in survivability mode
+ *
+ * SUBTEST: runtime-survivability
+ * Description: Force Xe device wedged after injecting a failure in CSC
+ * to test runtime survivability mode
  */
 
 static char bus_addr[NAME_MAX];
 
+static void ignore_wedged_in_dmesg(void)
+{
+	/* this is needed for igt_runner so it will ignore it */
+	igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged"
+				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
+				    "|GT[0-9A-Fa-f]*: Failed to submit"
+				    "|Modules linked in:"
+				    "|__pfx___drm_");
+}
+
 static bool check_survivability_mode_sysfs(void)
 {
 	char path[PATH_MAX];
@@ -41,6 +61,36 @@ static bool check_survivability_mode_sysfs(void)
 	return true;
 }
 
+static void check_survivability_and_uevents(int fd, struct udev_monitor *mon)
+{
+	struct udev_device *device;
+	const char *dev_path;
+	const char *wedged;
+
+	check_survivability_mode_sysfs();
+	device = udev_monitor_receive_device(mon);
+	dev_path = udev_device_get_property_value(device, "DEVPATH");
+	wedged = udev_device_get_property_value(device, "WEDGED");
+	igt_cleanup_uevents(mon);
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
+static void force_wedged_csc_error(int fd)
+{
+	igt_debugfs_write(fd, "inject_csc_hw_error/probability", "100");
+	igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");
+
+	xe_force_gt_reset_sync(fd, 0);
+	sleep(1);
+}
+
 static int find_i2c_adapter(struct pci_device *pci_xe)
 {
 	char device_path[PATH_MAX];
@@ -125,18 +175,35 @@ static void set_bus_addr(int fd)
 		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
 }
 
+static void test_spinner_after_recovery(int fd)
+{
+	uint64_t ahnd;
+	igt_spin_t *spin;
+
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+	spin = igt_spin_new(fd, .ahnd = ahnd);
+
+	igt_spin_free(fd, spin);
+	put_ahnd(ahnd);
+}
+
 igt_main
 {
 	int fd, configfs_fd, configfs_device_fd;
 	struct pci_device *pci_xe;
+	char pci_slot[NAME_MAX];
+	bool vf_device;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
+		vf_device = intel_is_vf_device(fd);
+		igt_require_f(!vf_device, "survivability mode not supported in VF\n");
 		pci_xe = igt_device_get_pci_device(fd);
 		set_bus_addr(fd);
 		configfs_fd = igt_configfs_open("xe");
 		igt_require(configfs_fd != -1);
+		igt_device_get_pci_slot_name(fd, pci_slot);
 		configfs_device_fd = create_device_configfs_group(configfs_fd);
 		igt_install_exit_handler(restore);
 	}
@@ -146,7 +213,33 @@ igt_main
 		test_i2c_functionality(configfs_device_fd, pci_xe);
 	}
 
+	igt_subtest("runtime-survivability") {
+		struct udev_monitor *mon;
+
+		igt_require(igt_debugfs_exists(fd, "inject_csc_hw_error/probability",
+					       O_RDWR));
+
+		igt_debugfs_write(fd, "inject_csc_hw_error/verbose", "1");
+
+		ignore_wedged_in_dmesg();
+		mon = igt_watch_uevents();
+		force_wedged_csc_error(fd);
+
+		check_survivability_and_uevents(fd, mon);
+
+		drm_close_driver(fd);
+		igt_kmod_rebind("xe", pci_slot);
+		fd = drm_open_driver(DRIVER_XE);
+
+		test_spinner_after_recovery(fd);
+	}
+
 	igt_fixture {
+		if (igt_debugfs_exists(fd, "inject_csc_hw_error/probability", O_RDWR)) {
+			igt_debugfs_write(fd, "inject_csc_hw_error/probability", "0");
+			igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");
+		}
+
 		igt_fs_remove_dir(configfs_fd, bus_addr);
 		close(configfs_device_fd);
 		close(configfs_fd);
-- 
2.43.0

