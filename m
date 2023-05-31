Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B66610E4CA
 for <igt-dev@lists.freedesktop.org>; Wed, 31 May 2023 13:51:19 +0000 (UTC)
From: Anna Karas <anna.karas@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 31 May 2023 15:49:50 +0200
Message-Id: <20230531134950.483688-1-anna.karas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe: Add xe_module_error test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Port i915_module_error test to XE. This test checks if we can access
debugfs/sysfs after a module load error, in this case a guc load error,
for capturing the requisite debug info.

Signed-off-by: Anna Karas <anna.karas@intel.com>
---
 tests/meson.build          |   1 +
 tests/xe/xe_module_error.c | 145 +++++++++++++++++++++++++++++++++++++
 2 files changed, 146 insertions(+)
 create mode 100644 tests/xe/xe_module_error.c

diff --git a/tests/meson.build b/tests/meson.build
index f71be1db..533c96e8 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -261,6 +261,7 @@ xe_progs = [
 	'xe_intel_bb',
 	'xe_mmap',
 	'xe_mmio',
+        'xe_module_error',
 	'xe_module_load',
 	'xe_noexec_ping_pong',
 	'xe_pm',
diff --git a/tests/xe/xe_module_error.c b/tests/xe/xe_module_error.c
new file mode 100644
index 00000000..a17d85ca
--- /dev/null
+++ b/tests/xe/xe_module_error.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <dirent.h>
+
+#include "igt.h"
+#include "igt_kmod.h"
+#include "igt_debugfs.h"
+#include "igt_sysfs.h"
+#include "xe_drm.h"
+
+#include "xe/xe_spin.h"
+
+/**
+ * TEST: Check if we can access sysfs/debugfs after a module load error
+ * Category: Software building block
+ * Sub-category: debugfs
+ * Test category: functionality test
+ * Run type: BAT
+ */
+
+/**
+ * SUBTEST: sysfs
+ * Description: Read all entries from sysfs path
+ * Run type: FULL
+ */
+
+/**
+ * SUBTEST: debugfs
+ * Description: Read all entries from debugfs path
+ * Run type: FULL
+ */
+static void read_sysfs_entries(int path, int indent)
+{
+	char tabs[] = "\t\t\t\t\t\t\t\t";
+	struct dirent *dirent;
+	DIR *dir;
+
+	igt_assert(indent < sizeof(tabs) - 1);
+	tabs[indent] = '\0';
+
+	dir = fdopendir(path);
+	if (!dir)
+		return;
+
+	while ((dirent = readdir(dir))) {
+		if (!strcmp(dirent->d_name, ".") ||
+		    !strcmp(dirent->d_name, ".."))
+			continue;
+
+		if (dirent->d_type == DT_DIR) {
+			int sub;
+
+			sub = openat(path, dirent->d_name, O_RDONLY | O_DIRECTORY);
+			if (sub < 0)
+				continue;
+
+			igt_kmsg(KMSG_DEBUG "Reading directory \"%s\"\n", dirent->d_name);
+			igt_debug("%sEntering subdir %s\n", tabs, dirent->d_name);
+			read_sysfs_entries(sub, indent + 1);
+			close(sub);
+		} else if (dirent->d_type == DT_REG) {
+			char buf[512];
+			int sub;
+			ssize_t ret;
+
+			igt_kmsg(KMSG_DEBUG "Reading file \"%s\"\n", dirent->d_name);
+			igt_debug("%sReading file \"%s\"\n", tabs, dirent->d_name);
+			igt_set_timeout(igt_run_in_simulation() ? 30 : 5,
+					"reading sysfs entry");
+
+			sub = openat(path, dirent->d_name, O_RDONLY | O_NONBLOCK);
+			if (sub == -1) {
+				igt_debug("%sCould not open file \"%s\" with error: %m\n",
+					  tabs, dirent->d_name);
+				continue;
+			}
+
+			do {
+				ret = read(sub, buf, sizeof(buf));
+			} while (ret == sizeof(buf));
+
+			if (ret == -1)
+				igt_debug("%sCould not read file \"%s\" with error: %m\n",
+					  tabs, dirent->d_name);
+
+			igt_reset_timeout();
+			close(sub);
+		}
+	}
+
+	closedir(dir);
+}
+
+static void abort_if_loaded(const char *module_name)
+{
+	int err;
+
+	err = igt_kmod_unload(module_name, 0);
+	if (err == 0 || err == -ENOENT) /* -ENOENT == unloaded already */
+		return;
+
+	igt_abort_on_f(err,
+		       "Failed to unload '%s' err:%d, leaving dangerous modparams intact!\n",
+		       module_name, err);
+}
+
+static void unload(int sig)
+{
+	igt_xe_driver_unload();
+	abort_if_loaded("xe");
+}
+
+igt_main
+{
+	int fd;
+
+	igt_fixture {
+		igt_xe_driver_unload();
+		igt_xe_driver_load("guc_firmware_path=/dev/null inject_probe_failure=-1 force_probe=*");
+		igt_install_exit_handler(unload);
+
+		fd = drm_open_driver(DRIVER_XE);
+		xe_device_get(fd);
+	}
+
+	igt_subtest("sysfs") {
+		igt_fork(child, 1)
+			read_sysfs_entries(igt_sysfs_open(fd), 0);
+		igt_waitchildren();
+	}
+
+	igt_subtest("debugfs") {
+		igt_fork(child, 1)
+			read_sysfs_entries(igt_debugfs_dir(fd), 0);
+		igt_waitchildren();
+	}
+
+	igt_fixture {
+		xe_device_put(fd);
+		close(fd);
+	}
+}
-- 
2.25.1
