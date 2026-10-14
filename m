Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83B7CC6B1D
	for <igt-dev@archiver.kernel.org>; Wed, 14 Oct 2026 16:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA6F112028;
	Wed, 14 Oct 2026 16:07:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2B810FEE1
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Oct 2026 16:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791993929; x=1823529929;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bIEiUflCN5qCAgTx4+YblkfzbjJF8EcWmU4Xa1LK5YM=;
 b=UjnHRGwsMzyIx75pk2eY7RcTG6HaEosh2W6uaZb/MyKjeHRUTuzhAwtL
 QM371YkPpnZxvRNgfClP+99lSeOSH2xkLfug8Htr5CkTtaQ/yudsN3c3x
 fNegzIaDJx4nhOpbks5q3K7HRXIAQyAX8RQkTht6L88P8Vzjrk8kaYbaU
 UP6goHzv3b0w6iJEnEvM/C8QMlZx+WOFus8jlkpwWhFvt6vTsV+xnjwnN
 LeVpUQPeHvOGfk4Z622Uf+3ZUDox9sN7gxG4Dj4gAWVPVD9kiHV0B0Ymw
 RoDm+6gaQWr5YwCkHeX/w6FzQ8Tz+7gpqlVL6SrDqJ2OFD6SZYWdnjMJd g==;
X-CSE-ConnectionGUID: rXy1OMX9T8Sad/KjxzyLRw==
X-CSE-MsgGUID: TuYKgCYiQ92qA5d6IZWxZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="733462"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="733462"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 09:05:24 -0700
X-CSE-ConnectionGUID: FnYgyuMCThSOwGJVg8SoVQ==
X-CSE-MsgGUID: 2e/XE2CAQIiTKus+LY+g8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1427995"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 09:05:24 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: igt-dev@lists.freedesktop.org, frank.scarbrough@intel.com,
 david.e.box@linux.intel.com
Subject: [PATCH i-g-t 1/2] test/intel/xe_pmt: Add testing for BMG PMT features
Date: Wed, 14 Oct 2026 09:05:16 -0700
Message-ID: <20261014160516.3542311-5-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014160516.3542311-4-michael.j.ruhl@intel.com>
References: <20261014160516.3542311-4-michael.j.ruhl@intel.com>
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

Battlemage (BMG) devices have the Platform Monitoring
Technology (PMT) telemetry and crashlog features. If the
device present is a BMG, test the PMT API.

NOTE: the testing order is not flexible and must be done in
the currently specified order.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 tests/intel/xe_pmt.c | 514 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 2 files changed, 515 insertions(+)
 create mode 100644 tests/intel/xe_pmt.c

diff --git a/tests/intel/xe_pmt.c b/tests/intel/xe_pmt.c
new file mode 100644
index 000000000..35b285d8b
--- /dev/null
+++ b/tests/intel/xe_pmt.c
@@ -0,0 +1,514 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <unistd.h>
+#include <dirent.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <string.h>
+
+#include "igt.h"
+#include "igt_sysfs.h"
+#include "linux_scaffold.h"
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+/**
+ * TEST: Verify Platform Monitoring Technology (PMT) files operations
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: uapi
+ * Functionality: sysfs
+ * Description: Verify that the available PMT files (crashlog and telemetry)
+ *   are created, are accessable, and respond as per design.
+ *
+ * SUBTEST: pmt-bmg-all
+ * Description:
+ *   Exercise the BMG PMT feature
+ *
+ */
+
+IGT_TEST_DESCRIPTION("Verify Platform Monitoring Technology (PMT) files operations");
+
+/* base directory names */
+#define VSEC_CRASHLOG_DIR "intel_vsec.crashlog."
+#define VSEC_TELEMETRY_DIR "intel_vsec.telemetry."
+#define CRASHLOG_DIR "crashlog"
+#define TELEMETRY_DIR "telem"
+
+/* itemize the available instances for the specific device */
+enum bmg_crashlog_instances {
+	bmg_crashlog_punit = 0,
+	bmg_crashlog_oobmsm,
+	bmg_crashlog_max
+};
+
+enum bmg_telemety_instances {
+	bmg_telemetry_punit = 0,
+	bmg_telemetry_oobmsm,
+	bmg_telemetry_max
+};
+
+static char dev_path[PATH_MAX];
+static char work_path[PATH_MAX * 2];
+
+/*
+ * In most case there should be a single instance of the crashlog and telemetry
+ * directories. If DVSEC entries are not contiguous the structure will be different,
+ * and the code will need to reflect the structure.
+ */
+static char crashlog_vsec_dir[32];
+static char telemetry_vsec_dir[32];
+
+/* This needs to be specific for each supported device */
+static char crashlog_dir[bmg_crashlog_max][32];
+static char telemetry_dir[bmg_telemetry_max][32];
+
+/* telemetry file names */
+static const char *telem = "telem";
+
+/* crashlog filenames and descriptors */
+static const char *clear = "clear";
+static const char *consumed = "consumed";
+static const char *crashlog = "crashlog";
+static const char *enable = "enable";
+static const char *error = "error";
+static const char *dev_guid = "guid";
+static const char *rearm = "rearm";
+static const char *trigger = "trigger";
+
+struct crashlog_v2_info {
+	int clear_fd;
+	int consumed_fd;
+	int crashlog_fd;
+	int enable_fd;
+	int error_fd;
+	int guid_fd;
+	int rearm_fd;
+	int trigger_fd;
+	u_int32_t guid;
+} bmg_info[bmg_crashlog_max];
+
+#define DEV_PATH_LEN 80
+
+/*
+ * device_sysfs_path:
+ * @fd: opened device file descriptor
+ * @path: buffer to store sysfs path to device directory
+ *
+ * Returns:
+ * On successfull path resolution sysfs path to device directory,
+ * NULL otherwise
+ */
+static char *device_sysfs_path(int fd, char *path)
+{
+        char sysfs[DEV_PATH_LEN];
+
+        if (!igt_sysfs_path(fd, sysfs, sizeof(sysfs)))
+                return NULL;
+
+        if (DEV_PATH_LEN <= (strlen(sysfs) + strlen("/device")))
+                return NULL;
+
+        strcat(sysfs, "/device");
+
+        return realpath(sysfs, path);
+}
+
+/*
+ * Verify the PMT directory structure
+ *
+ * BMG PMT directory structure:
+ *   device/intel_vsec.crashlog.x/intel_pmt/crashlog<a,b>
+ *   device/intel_vsec.telemetry.x/intel_pmt/telemetry<c,d>
+ *
+ * Note: different platforms could have a different pattern
+ */
+static void test_pmt_directories(int dev_fd)
+{
+	struct dirent *ent;
+	int index;
+	DIR *dir;
+
+	igt_assert(device_sysfs_path(dev_fd, dev_path));
+
+	/* verify top level PMT directories */
+	dir = opendir(dev_path);
+	igt_assert_f(dir, "no directories found\n");
+
+	while ((ent = readdir(dir)) != NULL) {
+		if (strncmp(VSEC_CRASHLOG_DIR, ent->d_name, sizeof(VSEC_CRASHLOG_DIR) - 1) == 0)
+			strcpy(crashlog_vsec_dir, ent->d_name);
+		if (strncmp(VSEC_TELEMETRY_DIR, ent->d_name, sizeof(VSEC_TELEMETRY_DIR) - 1) == 0)
+			strcpy(telemetry_vsec_dir, ent->d_name);
+	}
+
+	closedir(dir);
+
+	igt_assert_f(strlen(crashlog_vsec_dir), "missing crashlog directory\n");
+	igt_assert_f(strlen(telemetry_vsec_dir), "missing telemetry directory\n");
+
+	/* verify crashlog directory structure */
+	sprintf(work_path, "%s/%s/%s", dev_path, crashlog_vsec_dir, "intel_pmt");
+
+	dir = opendir(work_path);
+	igt_assert_f(dir, "no intel_pmt directories found\n");
+
+	index = 0;
+	/* find the crashlog<x> directory instances */
+	while ((ent = readdir(dir)) != NULL) {
+		if (strncmp(CRASHLOG_DIR, ent->d_name, sizeof(CRASHLOG_DIR) - 1) == 0) {
+			if (index < bmg_crashlog_max)
+				strcpy(crashlog_dir[index], ent->d_name);
+			index++;
+		}
+	}
+
+	closedir(dir);
+
+	igt_assert_f(index == bmg_crashlog_max, "too many crashlog entries %d\n", index);
+	for (int i = 0; i < ARRAY_SIZE(crashlog_dir); i++)
+		igt_assert_f(strlen(crashlog_dir[i]), "missing crashlog[%d] directory\n", i);
+
+	/* verify telemetry directory structure */
+	sprintf(work_path, "%s/%s/%s", dev_path, telemetry_vsec_dir, "intel_pmt");
+
+	dir = opendir(work_path);
+	igt_assert_f(dir, "no telemetry intel_pmt directories found\n");
+
+	index = 0;
+	while ((ent = readdir(dir)) != NULL) {
+		if (strncmp(TELEMETRY_DIR, ent->d_name, sizeof(TELEMETRY_DIR) - 1) == 0) {
+			if (index < bmg_telemetry_max)
+				strcpy(telemetry_dir[index], ent->d_name);
+			index++;
+		}
+	}
+
+	closedir(dir);
+
+	igt_assert_f(index == bmg_telemetry_max, "too many telemetry entries %d\n", index);
+	for (int i = 0; i < ARRAY_SIZE(telemetry_dir); i++)
+		igt_assert_f(strlen(telemetry_dir[i]), "missing telemetry[%d] directory\n", i);
+
+}
+
+static void find_pmt_file(const char *path, const char *file)
+{
+	struct dirent *ent;
+	bool found;
+	DIR *dir;
+
+	dir = opendir(path);
+	igt_assert_f(dir, "no intel_pmt directories found\n");
+
+	found = false;
+	while ((ent = readdir(dir)) != NULL)
+		if (strcmp(file, ent->d_name) == 0)
+			found = true;
+	closedir(dir);
+
+	igt_assert_f(found, "missing %s from %s\n", file, path);
+}
+
+static void open_pmt_file(const char *path, const char *file, int *fd, int flags)
+{
+	char file_path[PATH_MAX * 2 + 1];
+
+	sprintf(file_path, "%s/%s", path, file);
+
+	*fd = open(file_path, flags);
+	igt_assert_f(*fd > -1, "failed to open %s\n", file_path);
+}
+
+/*
+ * verify that the expected telemetry file(s) are in place
+ */
+static void test_pmt_telemetry_files(int dev_fd)
+{
+	int i;
+
+	for (i = 0; i < bmg_telemetry_max; i++) {
+		sprintf(work_path, "%s/%s/%s/%s", dev_path, telemetry_vsec_dir,
+			"intel_pmt", telemetry_dir[i]);
+		find_pmt_file(work_path, telem);
+	}
+}
+
+/*
+ * verify that the expected crashlog files are in place
+ */
+static void test_pmt_crashlog_files(int dev_fd)
+{
+	char buf[64] = {};
+	int ret;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
+		sprintf(work_path, "%s/%s/%s/%s", dev_path, crashlog_vsec_dir, "intel_pmt",
+			crashlog_dir[i]);
+
+		open_pmt_file(work_path, clear, &bmg_info[i].clear_fd, O_RDONLY);
+		open_pmt_file(work_path, consumed, &bmg_info[i].consumed_fd, O_RDWR);
+		open_pmt_file(work_path, crashlog, &bmg_info[i].crashlog_fd, O_RDONLY);
+		open_pmt_file(work_path, enable, &bmg_info[i].enable_fd, O_RDWR);
+		open_pmt_file(work_path, error, &bmg_info[i].error_fd, O_RDONLY);
+		open_pmt_file(work_path, dev_guid, &bmg_info[i].guid_fd, O_RDONLY);
+		open_pmt_file(work_path, rearm, &bmg_info[i].rearm_fd, O_RDWR);
+		open_pmt_file(work_path, trigger, &bmg_info[i].trigger_fd, O_RDWR);
+
+		ret = pread(bmg_info[i].guid_fd, buf, sizeof(buf), 0);
+		igt_assert_f(ret > 0, "failed to read guid for device %d\n", i);
+		bmg_info[i].guid = strtol(buf, NULL, 16);
+		igt_assert_f(bmg_info[i].guid > 0, "failed to set guid for device %d\n", i);
+	}
+}
+
+#define ENABLE_MSG "1\n"
+#define DISABLE_MSG "0\n"
+
+static bool send_msg(int fd, const char *msg, const char *file) {
+	size_t len = strlen(msg);
+	int ret;
+
+	errno = 0;
+	ret = pwrite(fd, msg, len, 0);
+	if (ret != len)
+		igt_info("%s failed: len: %ld vs %d  errno: %d\n", file, len, ret,
+			 errno);
+
+	return ret == len;
+}
+
+static bool verify_msg(int fd, const char *msg, const char *file) {
+	size_t len = strlen(msg);
+	char buf[32] = {};
+	int ret;
+
+	errno = 0;
+	ret = pread(fd, buf, sizeof(buf), 0);
+	if (ret != len)
+		igt_info("%s failed: len: %ld vs %d  errno: %d\n", file, len, ret, errno);
+
+	return ret == len && strcmp(buf, msg) == 0;
+}
+
+/*
+ * Set enable enable/disable bit and verify usage
+ */
+static void test_pmt_crashlog_enable(int dev_fd)
+{
+	u_int32_t guid;
+	int fd;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
+		fd = bmg_info[i].enable_fd;
+		guid = bmg_info[i].guid;
+
+		/* force enable so we are in a known state */
+		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: send enable\n", guid);
+		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), "0x%x: verify enable\n", guid);
+
+		/* disable */
+		igt_assert_f(send_msg(fd, DISABLE_MSG, enable), "0x%x: send disable\n", guid);
+		igt_assert_f(verify_msg(fd, DISABLE_MSG, enable), "0x%x: verify disable\n", guid);
+
+		/* re-enable so we can do more testing */
+		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: re-enable\n", guid);
+		igt_assert_f(verify_msg(fd, ENABLE_MSG, enable), "0x%x: verify re-enable\n", guid);
+	}
+
+}
+
+/*
+ * Test the clear crashlog bit. After setting the crashlog data buffer should be
+ * set to 0xdeadbeef.
+ * BMG supports writing "1" to the clear file, but writing "0" (DISABLE_MSG) to trigger
+ * file is the "standard" usage, so test that usage.
+ * This bit cannot be cleared by software (i.e. reboot required).
+ */
+static void test_pmt_crashlog_clear(int dev_fd)
+{
+	char buf[64] = {};
+	u_int32_t guid;
+	int crashlog_fd;
+	int trigger_fd;
+	int clear_fd;
+	int *val;
+	int len;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
+		clear_fd = bmg_info[i].clear_fd;
+		crashlog_fd = bmg_info[i].crashlog_fd;
+		trigger_fd = bmg_info[i].trigger_fd;
+		guid = bmg_info[i].guid;
+
+		/* make sure the bit is clear */
+		igt_assert_f(verify_msg(clear_fd, DISABLE_MSG, clear), "0x%x: verify clear\n", guid);
+
+		/* set the clear bit (0 -> trigger)*/
+		igt_assert_f(send_msg(trigger_fd, DISABLE_MSG, trigger), "0x%x: send enable\n", guid);
+
+		/* make sure the bit is set.  sleep() to allow HW to set the bit */
+		sleep(1);
+		igt_assert_f(verify_msg(clear_fd, ENABLE_MSG, clear), "0x%x: clear set\n", guid);
+
+		len = read(crashlog_fd, buf, sizeof(buf));
+		igt_assert_f(len == sizeof(buf), "0x%x: failed to read crashlog data\n", guid);
+
+		val = (int *)buf;
+		igt_assert_f(*val == 0xdeadbeef, "0x%x: invalid clear data value: : 0x%x", guid, *val);
+	}
+}
+
+/*
+ * After a crashlog has been "consumed" (read), setting this bit can be done.
+ * Verify that it is set correctly.
+ */
+static void test_pmt_crashlog_consumed(int dev_fd)
+{
+	uint32_t guid;
+	int fd;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
+		fd = bmg_info[i].consumed_fd;
+		guid = bmg_info[i].guid;
+
+		/* check, set, verify */
+		igt_assert_f(verify_msg(fd, DISABLE_MSG, consumed), "0x%x: consumed clear\n", guid);
+		igt_assert_f(send_msg(fd, ENABLE_MSG, consumed), "0x%x: set consumed\n", guid);
+		/* sleep(1) to allow HW to set the bit */
+		sleep(1);
+		igt_assert_f(verify_msg(fd, ENABLE_MSG, consumed), "0x%x: verify consumed\n", guid);
+	}
+}
+
+/*
+ * The error bit is set when a crashlog fails in HW.  It is read only so only
+ * need to verify that it is "0".
+ */
+static void test_pmt_crashlog_error(int dev_fd)
+{
+	uint32_t guid;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
+		guid = bmg_info[i].guid;
+		igt_assert_f(verify_msg(bmg_info[i].error_fd, DISABLE_MSG, error), "0x%x: error clear\n", guid);
+	}
+}
+
+/*
+ * The rearm bit is set at cold boot.  It cannot be reset unless are real crashlog
+ * occurs (i.e. setting trigger will not change its value).  Verify that it is "1".
+ */
+static void test_pmt_crashlog_rearm(int dev_fd)
+{
+	uint32_t guid;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
+		guid = bmg_info[i].guid;
+		igt_assert_f(verify_msg(bmg_info[i].rearm_fd, ENABLE_MSG, rearm), "0x%x: rearm set\n", guid);
+	}
+}
+
+/*
+ * Set the manual trigger bit and make sure the data is not 0xdeadbeef
+ */
+static void test_pmt_crashlog_trigger(int dev_fd)
+{
+	char buf[64] = {};
+	u_int32_t *val;
+	int crashlog_fd;
+	int trigger_fd;
+	u_int32_t guid;
+	int len;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(bmg_info); i++) {
+		crashlog_fd = bmg_info[i].crashlog_fd;
+		trigger_fd = bmg_info[i].trigger_fd;
+		guid = bmg_info[i].guid;
+
+		/* make sure the bit is clear */
+		igt_assert_f(verify_msg(trigger_fd, DISABLE_MSG, trigger), "0x%x: trigger clear\n",
+			     guid);
+		/* set the trigger bit (1 -> trigger)*/
+		igt_assert_f(send_msg(trigger_fd, ENABLE_MSG, trigger), "0x%x: set trigger\n", guid);
+
+		/* sleep to let the HW do its thing */
+		sleep(1);
+
+		/* make sure the bit is set */
+		igt_assert_f(verify_msg(trigger_fd, ENABLE_MSG, trigger), "0x%x: trigger not set\n",
+			     guid);
+
+		len = read(crashlog_fd, buf, sizeof(buf));
+		igt_assert_f(len == sizeof(buf), "0x%x: failed to read crashlog data\n", guid);
+
+		val = (u_int32_t *)buf;
+
+		igt_assert_f(*val != 0xdeadbeef, "0x%x: invalid trigger value: : 0x%x", guid, *val);
+	}
+}
+
+/**
+ * SUBTEST: pmt-bmg-all
+ * Description:
+ *   Because of how the Crashlog Instances behave, these tests are ordered. Do not use them
+ *   individually unless you understand the underlying HW behavior.  Because of this behavior,
+ *   all of the test will be done in order in one step.
+ *   NOTE:
+ *     o Testing MUST be done after a cold reset
+ *     o Once crashlog is triggered the device behavior is undefined and requires a cold reset
+ *
+ *  Test category: functionality test
+ */
+static void test_pmt_bmg(int fd)
+{
+	test_pmt_directories(fd);
+	test_pmt_telemetry_files(fd);
+	test_pmt_crashlog_files(fd);
+	test_pmt_crashlog_error(fd);
+	test_pmt_crashlog_enable(fd);
+	test_pmt_crashlog_rearm(fd);
+	test_pmt_crashlog_trigger(fd);
+	test_pmt_crashlog_consumed(fd);
+	test_pmt_crashlog_clear(fd);
+}
+
+int igt_main()
+{
+	const struct {
+		const char *name;
+		void (*func)(int);
+	} funcs[] = {
+		{ "pmt-bmg-all", test_pmt_bmg },
+		{ }
+	}, *f;
+	int dev_fd;
+
+	igt_fixture() {
+		uint16_t dev_id;
+
+		dev_fd = drm_open_driver(DRIVER_XE);
+		dev_id = intel_get_drm_devid(dev_fd);
+		igt_require_f(IS_BATTLEMAGE(dev_id), "PMT supported on BMG GPU\n");
+	}
+
+	igt_describe("PMT access and API testing");
+	for (f = funcs; f->name; f++) {
+		igt_subtest_f("%s", f->name)
+			f->func(dev_fd);
+	}
+
+	igt_fixture()
+		drm_close_driver(dev_fd);
+}
diff --git a/tests/meson.build b/tests/meson.build
index 519a9e727..ca6d64fba 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -331,6 +331,7 @@ intel_xe_progs = [
 	'xe_peer2peer',
 	'xe_pm',
 	'xe_pm_residency',
+	'xe_pmt',
 	'xe_pmu',
 	'xe_prefetch_fault',
 	'xe_prime_self_import',
-- 
2.43.0

