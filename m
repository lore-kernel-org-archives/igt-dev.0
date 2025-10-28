Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BECCCF9E0
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 08:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAA810E5BC;
	Tue, 28 Oct 2025 08:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KyXCmOtK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C28810E5BC
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 08:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761640411; x=1793176411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D/ckta3JmtXFy6y3AHeGDskBH5wUVfCVA9mGvRpFiYA=;
 b=KyXCmOtK2HJt+kgdMkftiI8//21JrxAmyE9LN/4Lp9T17qGk5aRqTf7e
 FpvinE24wwhLtGydspNX3+BegBea9dTX1+OWwQRIEHkzz9rPp7YOrkNnv
 XI5DSCPf8YYYWeoTL/0JxlTxTqYhHq5I06Nm/L2dDULk+76DyBeWAZywU
 jorbb5/6GKP7RDgJidWjKrfGx8R/PbpWEFpabMWknuhswcvgK8pyDuqhn
 GO+bt8IGs63LD7qHCL7GY5NjQMK6WvWsSFdp3t3BCK4mznxJv6g4Q25VW
 fvFk+owhwJiIqrsO5mzFvise3NWG7/PcP41fhC2iVpfv6EcbzCsYf7XkM Q==;
X-CSE-ConnectionGUID: +vL2VtV2QRaHDVDXmsEHng==
X-CSE-MsgGUID: yeUNY1RTTUy/xG0I++jzSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89203682"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="89203682"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:33:30 -0700
X-CSE-ConnectionGUID: whqDD1EORtCbgXlexQlw2Q==
X-CSE-MsgGUID: MD0a9WaPSEy8AtSsvHG/ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="216165165"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:33:27 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v7,
 2/3] tests/intel/xe_survivability: Add new test runtime survivability
Date: Tue, 28 Oct 2025 13:58:57 +0530
Message-ID: <20251028082856.3197023-7-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028082856.3197023-5-sk.anirban@intel.com>
References: <20251028082856.3197023-5-sk.anirban@intel.com>
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

Inject CSC error using debugfs to test vendor-specific device wedged
state and runtime survivability mode.
To return the device to a normal state, reload the driver, as
the wedged state can only be resolved by rebinding/reprobing the driver.

v3: Update commit message (Riana)
    Modify the uevents interrupt handling (Riana)
v4: Move test to xe_survivability (Riana)
v5: Use separate function for sysfs (Riana)
    Cosmetic changes (Riana)
    Use basic spinner (Riana)
v6: Move VF check (Riana)
    Modify commit message (Riana)
    Add test description (Riana)
v7: Modify igt fixture (Riana)
    Update the uevent_intercept function (Riana)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist |   2 +
 tests/intel/xe_survivability.c           | 104 +++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 017e3ba2a..5f27baafb 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -185,6 +185,8 @@ igt@xe_sysfs_scheduler@timeslice_duration_us-invalid
 igt@xe_sysfs_scheduler@timeslice_duration_us-min-max
 igt@xe_sysfs_scheduler@job_timeout_ms-invalid
 igt@xe_sysfs_scheduler@job_timeout_ms-min-max
+igt@xe_survivability@i2c-functionality
+igt@xe_survivability@runtime-survivability
 #igt@xe_vm@bind-once
 #igt@xe_vm@scratch
 igt@xe_vm@shared-pte-page
diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
index b20192958..70f6bff70 100644
--- a/tests/intel/xe_survivability.c
+++ b/tests/intel/xe_survivability.c
@@ -4,6 +4,7 @@
  */
 #include <dirent.h>
 #include <fcntl.h>
+#include <libudev.h>
 #include <limits.h>
 
 #include "igt.h"
@@ -13,7 +14,11 @@
 #include "igt_kmod.h"
 #include "igt_sriov_device.h"
 #include "igt_sysfs.h"
+#include "intel_allocator.h"
+#include "xe/xe_gt.h"
+#include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_spin.h"
 
 /**
  * TEST: Comprehensive survivability mode testing
@@ -26,10 +31,24 @@
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
@@ -42,6 +61,54 @@ static bool check_survivability_mode_sysfs(void)
 	return true;
 }
 
+static void check_survivability_and_uevents(int fd, struct udev_monitor *mon)
+{
+	struct udev_device *dev;
+	const char *prop_val;
+	const char *dev_path;
+	struct pollfd poll_fd = {
+		.fd = udev_monitor_get_fd(mon),
+		.events = POLLIN
+	};
+	bool event_received = false;
+	int timeout_secs = 10;
+
+	check_survivability_mode_sysfs();
+
+	while (!event_received && poll(&poll_fd, 1, timeout_secs * 1000)) {
+		dev = udev_monitor_receive_device(mon);
+		if (!dev)
+			continue;
+
+		prop_val = udev_device_get_property_value(dev, "WEDGED");
+		dev_path = udev_device_get_property_value(dev, "DEVPATH");
+
+		if (prop_val && !strcmp(prop_val, "vendor-specific")) {
+			event_received = true;
+			igt_assert_f(dev_path && strstr(dev_path, bus_addr),
+				     "Expected bus address '%s' to be part of DEVPATH '%s'",
+				     bus_addr, dev_path);
+		}
+
+		udev_device_unref(dev);
+	}
+
+	igt_cleanup_uevents(mon);
+
+	igt_assert_f(event_received,
+		     "Timeout waiting for vendor-specific wedged event after %d seconds",
+		     timeout_secs);
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
@@ -121,6 +188,18 @@ static int create_device_configfs_group(int configfs_fd)
 	return configfs_device_fd;
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
@@ -148,6 +227,31 @@ igt_main
 		fd = drm_open_driver(DRIVER_XE);
 	}
 
+	igt_describe("Inject CSC error to test device wedge and runtime survivability");
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
+		igt_kmod_rebind("xe", bus_addr);
+		fd = drm_open_driver(DRIVER_XE);
+
+		test_spinner_after_recovery(fd);
+
+		igt_debugfs_write(fd, "inject_csc_hw_error/probability", "0");
+		igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");
+	}
+
 	igt_fixture {
 		igt_fs_remove_dir(configfs_fd, bus_addr);
 		close(configfs_device_fd);
-- 
2.43.0

