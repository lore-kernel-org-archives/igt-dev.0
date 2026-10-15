Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6F2CCA464
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 19:11:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EAB11244E;
	Thu, 15 Oct 2026 19:11:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A0C112460
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 19:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792091457; x=1823627457;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=02266IIkPSf58s4QS565HCgvuLiLYP0RuGLEIfap9g4=;
 b=Q4829c74MFOAndxteGi/7R7pe7GESGI7qkoXXL4eKeRCCodJP5YNQmnG
 5MR3N3UMuGnT7bhUIenZnHXoxQ/cFQX+Neky8H4Qye1WiOgEfyOQ2ScZ+
 VWnthirSFqkD+iNMvJD9MCz9GMqi+oS0yHl8GT5HL6a9+wLtWb2D55vmg
 mBKB8dM1DbCjAY2E3j6el6bfCXVqdT1kjI9oYp1xvWWyynPTYQFf1r2qT
 ZohxCbwwdfzqq4hCj7tktYzNUpA2LjrXwOOPkmQM5ESH2xoukfHCL+WPK
 Z3z29jayNjdccNhsPQi1uLq9e7dvRSP4wYQ8V6oUtn5WwegsW9Q5mu7xS g==;
X-CSE-ConnectionGUID: IXSoOhVxSsCKO1vMaJJU6g==
X-CSE-MsgGUID: kLl63DglTrSwHLajKMe8UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="883678"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="883678"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:10:57 -0700
X-CSE-ConnectionGUID: PJCZQKJgR+qNpWSAgd8TiA==
X-CSE-MsgGUID: n7o7GrJWQkKJH0iqxlZZYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2117217"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 12:10:54 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v3] tests/intel/xe_wedged: Add cold-reset wedge test
Date: Fri, 16 Oct 2026 00:27:26 +0530
Message-ID: <20261015185725.258996-2-sk.anirban@intel.com>
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

Inject cold-reset at probe, validate the WEDGED=cold-reset
notification, and verify the device is functional after driver
recovery/rebinding.

v2: Fix restore flow (Mallesh)
    Cosmetic changes (Mallesh)
v3: Fix verbose and dmesg regex

Tested-by: Sk Anirban <sk.anirban@intel.com>
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 tests/intel/xe_wedged.c | 115 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index 8c3c8bd36..07e383966 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -14,6 +14,8 @@
 
 #include <limits.h>
 #include <dirent.h>
+#include <libudev.h>
+#include <poll.h>
 
 #include "igt.h"
 #include "igt_device.h"
@@ -28,6 +30,25 @@
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
 
+static char pci_slot[NAME_MAX];
+
+static void cold_reset_restore(int sig)
+{
+	char path[PATH_MAX];
+	int dir;
+
+	snprintf(path, sizeof(path), "/sys/kernel/debug/dri/%s", pci_slot);
+	dir = open(path, O_RDONLY);
+	if (dir >= 0) {
+		igt_sysfs_write(dir, "wedge_cold_reset/probability", "0", 1);
+		igt_sysfs_write(dir, "wedge_cold_reset/times", "1", 1);
+		igt_debugfs_write(dir, "wedge_cold_reset/verbose", "2");
+		close(dir);
+	}
+
+	igt_kmod_rebind("xe", pci_slot);
+}
+
 static void ignore_wedged_in_dmesg(void)
 {
 	/*
@@ -51,7 +72,13 @@ static void ignore_wedged_in_dmesg(void)
 				    "|EngineInstance: [0-9]+"
 				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
 				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error \\[[0-9]+\\]:"
-				    "class=[a-z]+, logical_mask: 0x[0-9A-Fa-f]+, guc_id=[0-9]+");
+				    "class=[a-z]+, logical_mask: 0x[0-9A-Fa-f]+, guc_id=[0-9]+"
+				    "|cold-reset wedge injected"
+					"|GT[0-9A-Fa-f]*: Invalid gsc header in proxy reply"
+				    "|device wedged, needs recovery"
+				    "|IOCTLs and executions are now blocked"
+				    "|SIGID=[0-9]+ .*GT: reset failed"
+				    "|SIGID=102");
 }
 
 static void force_wedged(int fd)
@@ -63,6 +90,60 @@ static void force_wedged(int fd)
 	sleep(1);
 }
 
+static void wait_for_wedged_uevent(struct udev_monitor *mon)
+{
+	struct udev_device *dev;
+	const char *prop_val;
+	const char *dev_path;
+	struct pollfd poll_fd = {
+		.fd = udev_monitor_get_fd(mon),
+		.events = POLLIN
+	};
+	bool event_received = false;
+	int timeout_secs = 30;
+
+	igt_until_timeout(timeout_secs) {
+		if (poll(&poll_fd, 1, 1000) <= 0)
+			continue;
+
+		dev = udev_monitor_receive_device(mon);
+		if (!dev)
+			continue;
+
+		prop_val = udev_device_get_property_value(dev, "WEDGED");
+		dev_path = udev_device_get_property_value(dev, "DEVPATH");
+
+		if (prop_val && !strcmp(prop_val, "cold-reset")) {
+			event_received = true;
+			igt_assert_f(dev_path && strstr(dev_path, pci_slot),
+				     "Expected bus address '%s' to be part of DEVPATH '%s'",
+				     pci_slot, dev_path);
+			udev_device_unref(dev);
+			break;
+		}
+
+		udev_device_unref(dev);
+	}
+
+	igt_cleanup_uevents(mon);
+
+	igt_assert_f(event_received,
+		     "Timeout waiting for cold-reset-wedged event after %d seconds",
+		     timeout_secs);
+}
+
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
 static int simple_ioctl(int fd)
 {
 	int ret;
@@ -225,11 +306,14 @@ simple_hang(int fd, struct drm_xe_sync *sync)
  * SUBTEST: basic-wedged-read
  * Description: Read wedged_mode debugfs
  */
+/**
+ * SUBTEST: cold-reset-wedged
+ * Description: Inject a cold reset wedge and validate cold-reset uevent
+ */
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
 	int fd;
-	char pci_slot[NAME_MAX];
 
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
@@ -326,12 +410,39 @@ int igt_main()
 		igt_assert_f(str[0] != '\0', "Failed to read wedged_mode from debugfs!\n");
 	}
 
+	igt_subtest_f("cold-reset-wedged") {
+		struct udev_monitor *mon;
+
+		igt_require(igt_debugfs_exists(fd, "wedge_cold_reset/probability",
+					       O_RDWR));
+		igt_install_exit_handler(cold_reset_restore);
+
+		igt_debugfs_write(fd, "wedge_cold_reset/verbose", "1");
+		igt_debugfs_write(fd, "wedge_cold_reset/probability", "100");
+		igt_debugfs_write(fd, "wedge_cold_reset/times", "1");
+
+		ignore_wedged_in_dmesg();
+		mon = igt_watch_uevents();
+
+		drm_close_driver(fd);
+		igt_kmod_rebind("xe", pci_slot);
+		wait_for_wedged_uevent(mon);
+		igt_kmod_rebind("xe", pci_slot);
+		fd = drm_open_driver(DRIVER_XE);
+		test_spinner_after_recovery(fd);
+	}
+
 	igt_fixture() {
 		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
 			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
 			igt_debugfs_write(fd, "fail_gt_reset/times", "1");
 		}
 
+		if (igt_debugfs_exists(fd, "wedge_cold_reset/probability", O_RDWR)) {
+			igt_debugfs_write(fd, "wedge_cold_reset/probability", "0");
+			igt_debugfs_write(fd, "wedge_cold_reset/times", "1");
+		}
+
 		/* Tests might have failed, force a rebind before exiting */
 		drm_close_driver(fd);
 		igt_kmod_rebind("xe", pci_slot);
-- 
2.43.0

