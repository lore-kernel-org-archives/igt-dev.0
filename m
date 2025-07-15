Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD0FC83F2D
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 20:27:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F2D10E054;
	Tue, 15 Jul 2025 20:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N9lYqSxG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CA010E054
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 20:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752611268; x=1784147268;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hNVC+azWs4G6eeURAw2cMrjUP8dl0G4ELUmaRAcLGSI=;
 b=N9lYqSxGe5Vn/DhsaGlBmOgiRfrtWyU4tYfc3hGpc+ILwkhXEdRisp3u
 t0E/WWHdBlkDio7IHO8SYdSdakvDiTzR1ZEkFaBxYDupnJlSJYAaP+N0K
 TUzHL1hFDlmxNtik2RumO39tn8jMy49ROdcgO+KmG+u/t4yFYwzXwfsg1
 z5lrGQHdCEfL4Fh2JP/+/akEvT/VCTmi0CtLX/aOfpreXQFkiselJ3qQ0
 O8cBIKSpDwwagRtq/VzJzCf4XhLp+05qjmPaOy75ig6EI7UP4lkwlT1pj
 er7grfTUyLF6TakQxG3t+RrzcxxibA32kdl5NN4oD44579kwgtvN9rGrl Q==;
X-CSE-ConnectionGUID: Jh03i0wSR6C4S6NCwteOLA==
X-CSE-MsgGUID: kdXl4d6lTXWjnX8gQewdPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="66200594"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="66200594"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 13:27:47 -0700
X-CSE-ConnectionGUID: 0jnq6/dHT9iy6yE1t+uZaA==
X-CSE-MsgGUID: CWrO5KSaSie22JVxFmgdUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="162959413"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.223.213])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 13:27:46 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v2] test/intel/xe_pmt: Add testing for BMG crashlog
Date: Tue, 15 Jul 2025 16:27:33 -0400
Message-ID: <20250715202735.158394-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
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

The BMG devices has the PMT crashlog feature. If the devices present
is a BMG, test PMT api.

NOTE: the testing order is not flexible and must be done in
the currently specified order.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
v2:
 - because of the inflexible ordering, remove the subtest and just have
   one test with several steps.
 tests/intel/xe_pmt.c | 543 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 2 files changed, 544 insertions(+)
 create mode 100644 tests/intel/xe_pmt.c

diff --git a/tests/intel/xe_pmt.c b/tests/intel/xe_pmt.c
new file mode 100644
index 000000000..c2594730b
--- /dev/null
+++ b/tests/intel/xe_pmt.c
@@ -0,0 +1,543 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/**
+ * TEST: Verify Platform Monitoring Technology (PMT) files operations
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: uapi
+ * Functionality: sysfs
+ * Description: Verify that the available PMT files (crashlog and telemetry)
+ *   are created, are accessable, and respond as per design.
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
+ * directories. If DVSEC entries are not contiguos the structure will be different,
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
+ * SUBTEST: pmt-directories
+ * Description: PMT directory structure:
+ * device/intel_vsec.crashlog.x/intel_pmt/crashlog<a,b>
+ * device/intel_vsec.telemetry.x/intel_pmt/telemetry<c,d>
+ * If this is done for a different platform, this could be
+ * different.
+ *
+ */
+static void test_pmt_directories(int dev_fd)
+{
+	struct dirent *ent;
+	int index;
+	DIR *dir;
+
+        igt_assert(device_sysfs_path(dev_fd, dev_path));
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
+	char file_path[PATH_MAX];
+
+	sprintf(file_path, "%s/%s", path, file);
+
+	*fd = open(file_path, flags);
+	igt_assert_f(*fd > -1, "failed to open %s\n", file_path);
+
+	/* TODO: match flags to file attributes */
+}
+
+/*
+ * SUBTEST: pmt-telemetry-files
+ * Description: validate the expected telemetry file(s)
+ * Test category: functionality test
+ *
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
+ * SUBTEST: pmt-crashlog-files
+ * Description: validate the expected crashlog files
+ * Test category: functionality test
+ *
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
+ * SUBTEST: pmt-crashlog-enable
+ * Description: Set enable enable/disable bit and verify usage
+ * Test category: functionality test
+ *
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
+ * SUBTEST: pmt-crashlog-clear
+ * Description:
+ *   Test the clear crashlog bit. After setting the crashlog data buffer should be
+ *   set to 0xdeadbeef.
+ *   "0" (DISABLE_MSG) is written to the trigger file to set the clear bit.  BMG does
+ *   writing to the clear file, but once the bit is set it cannot be cleared with a
+ *   reboot.  "0" to trigger is the "standard" usage, so test it.
+ *
+ * Test category: functionality test
+ *
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
+		/* wa punit issue for first crashlog (NOTE: this is fixed)*/
+		if (i == 0)
+			val = (int *) &buf[32];
+		else
+			val = (int *)buf;
+
+		igt_assert_f(*val == 0xdeadbeef, "0x%x: invalid clear data value: : 0x%x", guid, *val);
+	}
+
+}
+
+/*
+ * SUBTEST: pmt-crashlog-consumed
+ * Description:
+ *   After a crashlog has been "consumed" (read), setting this bit can be done.
+ *   Verify that it is set correctly.
+ * Test category: functionality test
+ *
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
+ * SUBTEST: pmt-crashlog-error
+ * Description:
+ *    The error bit is set when a crashlog fails in HW.  It is read only so only
+ *    need to verify that it is "0".
+ * Test category: functionality test
+ *
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
+ * SUBTEST: pmt-crashlog-rearm
+ * Description:
+ *    The rearm bit is set at cold boot.  It cannot be reset unless are real crashlog
+ *    occurs (i.e. setting trigger will not change its value).  Verify that it is "1".
+ * Test category: functionality test
+ *
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
+ * SUBTEST: pmt-crashlog-trigger
+ * Description:
+ *    Set the manual trigger bit and make sure the data is not 0xdeadbeef
+ * Test category: functionality test
+ *
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
+ * SUBTEST: pmt-bmg-tests
+ * Description:
+ *   Because of how the Crashlog Instances behave, these tests are ordered. Do not use them
+ *   individually unless you understand the underlying HW behavior.  Because of this behavior,
+ *   all of the test will be done in order in one step.
+ *   NOTE
+ *     o Testing MUST be done after a cold reset
+ *     o Once crashlog is triggered the device behavior is undefined and requires a cold reset.
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
+igt_main
+{
+	const struct {
+		const char *name;
+		void (*func)(int);
+	} funcs[] = {
+		{ "pmt-bmg-tests", test_pmt_bmg },
+		{ }
+	}, *f;
+	int dev_fd;
+
+	igt_fixture {
+		uint16_t dev_id;
+
+		dev_fd = drm_open_driver(DRIVER_XE);
+		dev_id = intel_get_drm_devid(dev_fd);
+		igt_require_f(IS_BATTLEMAGE(dev_id), "PMT currently suppot only for BMG GPU\n");
+	}
+
+	for (f = funcs; f->name; f++) {
+		igt_subtest_f("%s", f->name)
+			f->func(dev_fd);
+	}
+
+	igt_fixture
+		drm_close_driver(dev_fd);
+}
diff --git a/tests/meson.build b/tests/meson.build
index 881b204a5..4854f75f0 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -315,6 +315,7 @@ intel_xe_progs = [
 	'xe_peer2peer',
 	'xe_pm',
 	'xe_pm_residency',
+	'xe_pmt',
 	'xe_pmu',
 	'xe_prime_self_import',
 	'xe_pxp',
-- 
2.50.0

