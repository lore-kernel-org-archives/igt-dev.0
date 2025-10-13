Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7F2CCD183
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 19:52:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C003110E153;
	Mon, 13 Oct 2025 19:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldf57gSt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8FA10E153
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 19:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760385153; x=1791921153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vToRhqSvZHA1U27raiDZdOQG4PcS03VzFJbBL6HEffo=;
 b=ldf57gStSNDQFJKSVhdSMec1LPz+y/ZRI4Mn/d9YYFzTGZ4zRVcmIba6
 Twb4mO3kse0uDCgYIkuZ2ae0/IhE8cqk3Ab5VjI/FYhBQw7gxYglGGA97
 JAZJVQxpfcVhcityLnHM37ET0ioMzKZtpXke7EIwbqM5DKiNLDGdH1coq
 JzDkvIV1tpgLetSIYLJo7I2TwF/MGSenB2ZeyuGPAgGJCujUS+v0AAd0L
 heNGj7oBOV7LDA91z77snRr29eP5SUIGMgznNQ7496Pl2L7va3W3to3Az
 uUP716HdNkp4R9ft2XPvEysjbWk876Cw83aArhjXO60tukgAWVWJyR3iV A==;
X-CSE-ConnectionGUID: BOTqOUewQfSn7mNmtfjHLA==
X-CSE-MsgGUID: RQ7W+qBwQz+TXmeTw289vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62633584"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="62633584"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 12:52:33 -0700
X-CSE-ConnectionGUID: Vm37VJZ0QzCmo42YOvFVUA==
X-CSE-MsgGUID: a7RtoNJSTQm1M/9bjOMLUA==
X-ExtLoop1: 1
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 12:52:30 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v6,
 2/3] tests/intel/xe_survivability: Add new test runtime survivability
Date: Tue, 14 Oct 2025 01:19:04 +0530
Message-ID: <20251013194910.1065392-7-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013194910.1065392-5-sk.anirban@intel.com>
References: <20251013194910.1065392-5-sk.anirban@intel.com>
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

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist |  2 +
 tests/intel/xe_survivability.c           | 88 ++++++++++++++++++++++++
 2 files changed, 90 insertions(+)

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
index e4418361d..05ae4a75c 100644
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
@@ -42,6 +61,36 @@ static bool check_survivability_mode_sysfs(void)
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
@@ -119,6 +168,18 @@ static int create_device_configfs_group(int configfs_fd)
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
@@ -145,7 +206,34 @@ igt_main
 		fd = drm_open_driver(DRIVER_XE);
 	}
 
+	igt_describe("Inject CSC error to test vendor-specific device wedged state & runtime survivability mode");
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

