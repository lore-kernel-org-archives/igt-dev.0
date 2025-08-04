Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2D8C87FCF
	for <igt-dev@archiver.kernel.org>; Mon,  4 Aug 2025 19:26:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9826B10E386;
	Mon,  4 Aug 2025 19:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZvS+iCzb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555D410E386
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Aug 2025 19:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754335614; x=1785871614;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Nyuq6p833BvUyojXSnzTeMpRHEvWIGtPWORs2rMKMP8=;
 b=ZvS+iCzb+BvuN89aqwmbs6r2WpGR4N3h8VR0pDgsZ3V7bAUPUHf9l8d2
 ugFEeN1h9peqQiK0gYZcDLeNb8RVDH0LbgT6jb/Swwe2AhtBo3aV64Nub
 UOCJSWpkxSEInrvw5hSJLcLIPyX3gj2VPlxK2jYXK17IG+ZpKebaEESrL
 RXQIkp1L4QaaUeq3ftfqbPQxxYRzgdKUo+pJXVNiRPIQKCOTDnO2zqyhe
 4tmHt+xDFElnPKCvJ3QrvQbsfGKYLF1nmaJ63BvwTz+srJDWmku6qUwWw
 iaaNTCXyYAlcO2260QR8Khso3n8M0aX2Fl0G1n32Cwx35Z6N06o9a4APd Q==;
X-CSE-ConnectionGUID: 8tag/lFoRJWzJbUuOIkKWA==
X-CSE-MsgGUID: BCL2fDyzTHKOU7/e5yg5Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="82068315"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="82068315"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 12:26:53 -0700
X-CSE-ConnectionGUID: 46uMbVwqRFu/arDSXOHisw==
X-CSE-MsgGUID: vMadLHJhTdqZocsZXC/XLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="169636632"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 12:26:51 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, riana.tauro@intel.com, raag.jadav@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] tests/intel/xe_configfs: Add i2c adapter check in
 survivability mode
Date: Tue,  5 Aug 2025 00:54:23 +0530
Message-ID: <20250804192424.3727427-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add i2c adapter presence check in survivability mode to ensure
the Add-In Management Controller (AMC) can receive firmware updates
when the device is in survivability mode.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_configfs.c | 50 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 5c65cd01d..a3af84b6a 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -2,7 +2,9 @@
 /*
  * Copyright © 2025 Intel Corporation
  */
+#include <dirent.h>
 #include <limits.h>
+#include <fcntl.h>
 
 #include "igt.h"
 #include "igt_configfs.h"
@@ -24,6 +26,34 @@
 
 static char bus_addr[NAME_MAX];
 
+static int find_i2c_adapter(struct pci_device *pci_xe)
+{
+	char device_path[PATH_MAX];
+	struct dirent *dirent;
+	int i2c_adapter = -1;
+	DIR *device_dir;
+
+	igt_require(igt_kmod_load("i2c-dev", NULL) == 0);
+
+	snprintf(device_path, sizeof(device_path), "/sys/bus/pci/devices/%s/%s.%hu", bus_addr,
+		 "i2c_designware", (pci_xe->bus << 8) | (pci_xe->dev));
+	device_dir = opendir(device_path);
+
+	if (!device_dir)
+		return -1;
+
+	while ((dirent = readdir(device_dir))) {
+		if (strncmp(dirent->d_name, "i2c-", 4) == 0) {
+			sscanf(dirent->d_name, "i2c-%d", &i2c_adapter);
+			closedir(device_dir);
+			return i2c_adapter;
+		}
+	}
+
+	closedir(device_dir);
+	return i2c_adapter;
+}
+
 static void restore(int sig)
 {
 	/* Restore after survivability mode */
@@ -42,10 +72,12 @@ static void set_survivability_mode(int configfs_device_fd, bool value)
  * SUBTEST: survivability-mode
  * Description: Validate survivability mode by setting configfs
  */
-static void test_survivability_mode(int configfs_device_fd)
+static void test_survivability_mode(int configfs_device_fd, struct pci_device *pci_xe)
 {
 	char path[PATH_MAX];
-	int fd;
+	int file_fd, i2c_adapter;
+
+	i2c_adapter = find_i2c_adapter(pci_xe);
 
 	/* Enable survivability mode */
 	set_survivability_mode(configfs_device_fd, true);
@@ -53,9 +85,13 @@ static void test_survivability_mode(int configfs_device_fd)
 	/* check presence of survivability mode sysfs */
 	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
 
-	fd = open(path, O_RDONLY);
-	igt_assert_f(fd >= 0, "Survivability mode not set\n");
-	close(fd);
+	file_fd = open(path, O_RDONLY);
+	igt_assert_f(file_fd >= 0, "Survivability mode not set\n");
+
+	if (i2c_adapter >= 0)
+		igt_assert_f(find_i2c_adapter(pci_xe) >= 0, "Failed to find i2c adapter in survivability mode\n");
+
+	close(file_fd);
 }
 
 /**
@@ -120,9 +156,11 @@ static int create_device_configfs_group(int configfs_fd, int fd)
 igt_main
 {
 	int fd, configfs_fd, configfs_device_fd;
+	struct pci_device *pci_xe;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		pci_xe = igt_device_get_pci_device(fd);
 		configfs_fd = igt_configfs_open("xe");
 		igt_require(configfs_fd != -1);
 		configfs_device_fd = create_device_configfs_group(configfs_fd, fd);
@@ -132,7 +170,7 @@ igt_main
 	igt_subtest("survivability-mode") {
 		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
 		igt_install_exit_handler(restore);
-		test_survivability_mode(configfs_device_fd);
+		test_survivability_mode(configfs_device_fd, pci_xe);
 	}
 
 	igt_describe("Validate engines_allowed with invalid options");
-- 
2.43.0

