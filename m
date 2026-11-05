Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA837606A329
	for <igt-dev@archiver.kernel.org>; Thu,  5 Nov 2026 12:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cLIX/fFm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4A01123DC;
	Thu,  5 Nov 2026 12:47:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F229A1123E2
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2026 12:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793882707; x=1825418707;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RBHg6ZF7+B4awx6wfA0V/SHByfA/+NpPvL+9d49IRBI=;
 b=cLIX/fFm5V3VSqfhVb2FI6bwEhg2QMABmHFJcoy9wZ3HmffrYzWoDtMU
 qhVBILKCwTz8cI7upaLbjtVziYkZYvm60PZoObVlb4P1RSC9hxxLm8ouh
 MgewiXCSennArSDfTncNGgeSKKrON8RBufI8xiyEtfzRUWttdi0+13GVI
 e9vtDKrw8kg/J6EQxIjypjP74M3PncHfPmc6jlk5SiFdUHdhaczoKvIy0
 VHjwwzo4czccSBzSzxd8juDyJs8Fq9uLDMmqsVdciYfTV7+yNXs16beDY
 rrAYP9q6rbMP80ndqPsl7kptHtfTt5Yi86bfaW1L2gQQNyV7QRQV4RDas w==;
X-CSE-ConnectionGUID: Dt2NERKfQqaJ1CMHHqyB7w==
X-CSE-MsgGUID: GteJ4csdQwmxoS0PE0oGCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2768227"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2768227"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 04:45:06 -0800
X-CSE-ConnectionGUID: wGMFX9IqRMGdizGqvilt0w==
X-CSE-MsgGUID: 6UTp2tgmSD+6WkrXClZKvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6885991"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 04:45:04 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v6 2/2] tests/intel/xe_wedged: Add cold-reset wedge test
Date: Thu,  5 Nov 2026 18:00:05 +0530
Message-ID: <20261105123002.1368655-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105123002.1368655-4-sk.anirban@intel.com>
References: <20261105123002.1368655-4-sk.anirban@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Inject cold-reset at probe, validate the WEDGED=cold-reset
notification, and verify the device is functional after driver
recovery/rebinding.

v2: Fix restore flow (Mallesh)
    Cosmetic changes (Mallesh)
v3: Fix verbose and dmesg regex
v4: Add code comment (Riana)
v5: Modify regex (Riana)
v6: Add platform check

Tested-by: Sk Anirban <sk.anirban@intel.com>
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 tests/intel/xe_wedged.c | 116 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 115 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index 2dcab029f..c67a4dda5 100644
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
@@ -59,6 +80,7 @@ static void ignore_wedged_in_dmesg(void)
 				    "|GT[0-9A-Fa-f]*: Invalid gsc header in proxy reply"
 				    "|SIGID=[0-9]+ .*GT: reset failed"
 				    "|SIGID=102"
+				    "|cold-reset wedge injected"
 				    "|SIGID=203");
 }
 
@@ -71,6 +93,60 @@ static void force_wedged(int fd)
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
@@ -233,11 +309,14 @@ simple_hang(int fd, struct drm_xe_sync *sync)
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
@@ -334,12 +413,47 @@ int igt_main()
 		igt_assert_f(str[0] != '\0', "Failed to read wedged_mode from debugfs!\n");
 	}
 
+	igt_subtest_f("cold-reset-wedged") {
+		struct udev_monitor *mon;
+
+		errno = 0;
+		igt_skip_on_f(!IS_CRESCENTISLAND(intel_get_drm_devid(fd)),
+			      "cold-reset-wedged is only supported on Crescent Island (CRI)\n");
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
+		/*
+		 * Rebind to restore device operation. The first wedge decrements
+		 * times to zero, disabling further fault injection even though
+		 * probability remains at 100.
+		 */
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

