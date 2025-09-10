Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C1ECAC58D
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 19:21:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC98A10E9C3;
	Wed, 10 Sep 2025 19:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XGnOJsGK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5A910E9C3
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 19:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757532091; x=1789068091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=106JfMhVWMzStxBRErFSUV81+7jNSFfr5Xjtl7eusN8=;
 b=XGnOJsGKN9vt5OeauzTOB7X7QdNFc84lvFdIBerEzkdqqPe9LvGKx+nE
 0vg9zCgqsZ1HI03BS4IXfdtabqQ6OvaztI3Q27hu2SpyLwEgLGaXX/r7A
 19zcYai49aZo1wjXW1uL9scMlC5HFQMSHB7/EWeVBBpCQdwcgl0xZwxuh
 FDgQTccFYBwPP9Za2nKr6i0MqSiQqbvl2KbuV/3u18jGqoU7TxRmq2afM
 Y5FT+RKBB0LC8EcKND1ljGINuiskvLBj+7iDb70bVmTiJ15vPvQDA2sLb
 NgPm4dntjcrx2g8ONTRKNw08nxpSzRxohy1APfMA5/WNKUh2vRxsSHKsW g==;
X-CSE-ConnectionGUID: fW0bVw1MQKyWkA41NK9AqQ==
X-CSE-MsgGUID: 4Oe3NIrdSLmMhyTUweH3Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="63489607"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="63489607"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 12:21:30 -0700
X-CSE-ConnectionGUID: mSOwJ4u4TJ+BCWpr8icLEQ==
X-CSE-MsgGUID: BURv3rW5RRqVrAPwMy6nYw==
X-ExtLoop1: 1
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 12:21:28 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v4,
 2/3] tests/intel/xe_survivability: Add new test runtime survivability
Date: Thu, 11 Sep 2025 00:50:28 +0530
Message-ID: <20250910192031.1908588-7-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910192031.1908588-5-sk.anirban@intel.com>
References: <20250910192031.1908588-5-sk.anirban@intel.com>
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

Related kernel patch series:
https://patchwork.freedesktop.org/series/149756/

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_survivability.c | 123 +++++++++++++++++++++++++++++++--
 1 file changed, 119 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
index 6fb13b391..0fbdcfdcf 100644
--- a/tests/intel/xe_survivability.c
+++ b/tests/intel/xe_survivability.c
@@ -4,6 +4,7 @@
  */
 #include <dirent.h>
 #include <fcntl.h>
+#include <libudev.h>
 #include <limits.h>
 
 #include "igt.h"
@@ -12,7 +13,11 @@
 #include "igt_fs.h"
 #include "igt_kmod.h"
 #include "igt_sysfs.h"
+#include "intel_allocator.h"
+#include "xe/xe_gt.h"
+#include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_spin.h"
 
 /**
  * TEST: Comprehensive run-time survivability mode testing
@@ -22,10 +27,69 @@
  * Functionality: survivability mode
  * Description: validate runtime survivability mode functionality
  * Test category: functionality test
+ *
+ * SUBTEST: i2c-functionality
+ * Description: Validate i2c adapter functionality in survivability mode
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
@@ -70,10 +134,6 @@ static void set_survivability_mode(int configfs_device_fd, bool value)
 	igt_kmod_bind("xe", bus_addr);
 }
 
-/**
- * SUBTEST: i2c-functionality
- * Description: Validate i2c adapter functionality in survivability mode
- */
 static void test_i2c_functionality(int configfs_device_fd, struct pci_device *pci_xe)
 {
 	int i2c_adapter_before = 1, i2c_adapter_after;
@@ -122,10 +182,34 @@ static void set_bus_addr(int fd)
 		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
 }
 
+static void test_spinner_after_recovery(int fd)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	unsigned int exec_queue;
+	igt_spin_t *spin;
+	uint64_t ahnd;
+	uint32_t vm;
+
+	xe_for_each_engine(fd, hwe) {
+		vm = xe_vm_create(fd, 0, 0);
+		exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
+		ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+
+		spin = igt_spin_new(fd, .ahnd = ahnd, .engine = exec_queue, .vm = vm);
+
+		igt_spin_free(fd, spin);
+		xe_exec_queue_destroy(fd, exec_queue);
+		xe_vm_destroy(fd, vm);
+
+		put_ahnd(ahnd);
+	}
+}
+
 igt_main
 {
 	int fd, configfs_fd, configfs_device_fd;
 	struct pci_device *pci_xe;
+	char pci_slot[NAME_MAX];
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
@@ -134,6 +218,7 @@ igt_main
 		configfs_fd = igt_configfs_open("xe");
 		igt_require(configfs_fd != -1);
 		configfs_device_fd = create_device_configfs_group(configfs_fd);
+		igt_device_get_pci_slot_name(fd, pci_slot);
 		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
 	}
 
@@ -143,10 +228,40 @@ igt_main
 		test_i2c_functionality(configfs_device_fd, pci_xe);
 	}
 
+	igt_subtest("runtime-survivability") {
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
 		drm_close_driver(fd);
+		igt_kmod_rebind("xe", pci_slot);
 	}
 }
-- 
2.43.0

