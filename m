Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B340BC55175
	for <igt-dev@archiver.kernel.org>; Mon,  3 Aug 2026 09:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6EF10E58F;
	Mon,  3 Aug 2026 09:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AoKa8sHx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9827C10E58F
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Aug 2026 09:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785751149; x=1817287149;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sp3sVSvdCG3akQRpO/qq2TRmVnadBSUSXzwaz041Rz4=;
 b=AoKa8sHx6SRVrwcgjUFZ6EXYXPl5fMk4v3jhsyALoFfMX8W9QAycs1Zq
 DWEi2kgqlCjTUCVy4YsFFPd3YCDv04kV4zFMNiFWjXj5n+bbL/AE1a25P
 IpqFHPbJ1rpBwOm+hdMeaKF4PAN3HBJJNXj8xvNOjIRhWeRpxKPafgHOC
 Ua3ovMVGW23FAwl+l0Hrm0o8vWyOcxf7O+9QxCWPS/pCNG3APimuh0hip
 IWaJezFGg9+V38Hy7g/R2HYsWwaEyqvtKKmofR6UqX18XUrUDX+hQqokW
 XGMWopA9zIgaJFRmOAtP3gG65ifJ/gbSWJUiTKNiuMA2vi9E6myOYX0vM w==;
X-CSE-ConnectionGUID: I5TC9IWRSVm95Fy08w/j8w==
X-CSE-MsgGUID: ILvhJIrhQyukszXy/JOabg==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="103683580"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="103683580"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 02:59:09 -0700
X-CSE-ConnectionGUID: bm6OVCsFQpy1FFAeBaTaMw==
X-CSE-MsgGUID: ITAxEyRUQlO2uoFSwwyBsg==
X-ExtLoop1: 1
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 02:59:05 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, matthew.d.roper@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] tests/intel/xe_configfs: reuse pre-existing configfs group
Date: Mon,  3 Aug 2026 15:19:55 +0530
Message-ID: <20260803094954.3087948-2-sk.anirban@intel.com>
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

Handle a pre-existing configfs group by opening and reusing it, retain
it across cleanup, and validate the fd so the test fails early with a
clear message on any error.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_configfs.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 450c0a119..32e1f9e2d 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -26,6 +26,13 @@
 static char bus_addr[NAME_MAX];
 static struct pci_device *pci_dev;
 
+/*
+ * Set when the device's configfs group already existed before the test
+ * started. In that case we must not remove it during cleanup, so we leave
+ * the pre-existing configuration untouched.
+ */
+static bool configfs_group_preexisting;
+
 static bool check_registers(const uint32_t reg[], const uint32_t val[],
 			    size_t max)
 {
@@ -60,7 +67,7 @@ static void restore(int sig)
 
 	/* Drop all custom configfs settings from subtests */
 	configfs_fd = igt_configfs_open("xe");
-	if (configfs_fd >= 0)
+	if (configfs_fd >= 0 && !configfs_group_preexisting)
 		igt_fs_remove_dir(configfs_fd, bus_addr);
 	close(configfs_fd);
 
@@ -70,10 +77,19 @@ static void restore(int sig)
 
 static void set_survivability_mode(int configfs_device_fd, bool value)
 {
+	int ret;
+
 	igt_audio_driver_unload(NULL);
-	igt_kmod_unbind("xe", bus_addr);
+
+	ret = igt_kmod_unbind("xe", bus_addr);
+	igt_assert_f(!ret, "Failed to unbind xe from %s: %s\n",
+		     bus_addr, strerror(-ret));
+
 	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode", value);
-	igt_kmod_bind("xe", bus_addr);
+
+	ret = igt_kmod_bind("xe", bus_addr);
+	igt_assert_f(!ret, "Failed to bind xe to %s: %s\n",
+		     bus_addr, strerror(-ret));
 }
 
 /**
@@ -93,6 +109,9 @@ static void test_survivability_mode(int configfs_device_fd)
 
 	fd = open(path, O_RDONLY);
 	igt_assert_f(fd >= 0, "Survivability mode not set\n");
+
+	set_survivability_mode(configfs_device_fd, false);
+
 	close(fd);
 }
 
@@ -363,7 +382,15 @@ static int create_device_configfs_group(int configfs_fd)
 	int configfs_device_fd;
 
 	configfs_device_fd = igt_fs_create_dir(configfs_fd, bus_addr, mode);
-	igt_assert(configfs_device_fd);
+	if (configfs_device_fd == -EEXIST) {
+		configfs_group_preexisting = true;
+		configfs_device_fd = openat(configfs_fd, bus_addr, O_DIRECTORY);
+		if (configfs_device_fd < 0)
+			configfs_device_fd = -errno;
+	}
+	igt_assert_f(configfs_device_fd >= 0,
+		     "Failed to create/open configfs group for %s: %s\n",
+		     bus_addr, strerror(-configfs_device_fd));
 
 	return configfs_device_fd;
 }
@@ -371,7 +398,9 @@ static int create_device_configfs_group(int configfs_fd)
 static void close_configfs_group(int configfs_fd, int configfs_device_fd)
 {
 	close(configfs_device_fd);
-	igt_fs_remove_dir(configfs_fd, bus_addr);
+
+	if (!configfs_group_preexisting)
+		igt_fs_remove_dir(configfs_fd, bus_addr);
 }
 
 int igt_main()
-- 
2.43.0

