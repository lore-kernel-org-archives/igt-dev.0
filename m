Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520E110E320
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Oct 2022 05:35:43 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 17 Oct 2022 11:05:17 +0530
Message-Id: <20221017053524.2538178-2-riana.tauro@intel.com>
In-Reply-To: <20221017053524.2538178-1-riana.tauro@intel.com>
References: <20221017053524.2538178-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/8] lib/igt_hwmon: Introduce library
 igt_hwmon
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

igt_hwmon exposes methods to open hwmon directories identified by name

v2: Add license(Petri)

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_hwmon.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_hwmon.h | 13 +++++++++
 lib/meson.build |  1 +
 3 files changed, 88 insertions(+)
 create mode 100644 lib/igt_hwmon.c
 create mode 100644 lib/igt_hwmon.h

diff --git a/lib/igt_hwmon.c b/lib/igt_hwmon.c
new file mode 100644
index 00000000..309019d6
--- /dev/null
+++ b/lib/igt_hwmon.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+#include <sys/stat.h>
+#include <sys/sysmacros.h>
+#include <dirent.h>
+#include <fcntl.h>
+#include <inttypes.h>
+#include <unistd.h>
+
+#include "drmtest.h"
+#include "igt_core.h"
+#include "igt_hwmon.h"
+#include "igt_sysfs.h"
+
+static char *igt_hwmon_path(int device, char *path, const char *name)
+{
+	char buf[80];
+	int path_offset;
+	struct dirent *entry;
+	struct stat st;
+	DIR *dir;
+
+	if (igt_debug_on(device < 0))
+		return NULL;
+
+	if (igt_debug_on(fstat(device, &st)) || igt_debug_on(!S_ISCHR(st.st_mode)))
+		return NULL;
+
+	path_offset = snprintf(path, PATH_MAX, "/sys/dev/char/%d:%d/device/hwmon",
+			       major(st.st_rdev), minor(st.st_rdev));
+
+	dir = opendir(path);
+	if (!dir)
+		return NULL;
+
+	while ((entry = readdir(dir))) {
+		if (entry->d_name[0] == '.')
+			continue;
+
+		snprintf(path + path_offset, PATH_MAX - path_offset, "/%s/name", entry->d_name);
+		igt_sysfs_scanf(dirfd(dir), path, "%s", buf);
+
+		if (strncmp(buf, name, strlen(name)) == 0) {
+			snprintf(path + path_offset, PATH_MAX - path_offset, "/%s", entry->d_name);
+			closedir(dir);
+			return path;
+		}
+	}
+
+	closedir(dir);
+	return NULL;
+}
+
+/**
+ * igt_hwmon_open:
+ * @device: fd of the device
+ *
+ * Opens the hwmon directory corresponding to device
+ *
+ * Returns:
+ * The directory fd, or -1 on failure.
+ */
+int igt_hwmon_open(int device)
+{
+	char path[PATH_MAX];
+
+	if (!is_i915_device(device) || !igt_hwmon_path(device, path, "i915"))
+		return -1;
+
+	return open(path, O_RDONLY);
+}
+
diff --git a/lib/igt_hwmon.h b/lib/igt_hwmon.h
new file mode 100644
index 00000000..e50c0938
--- /dev/null
+++ b/lib/igt_hwmon.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef IGT_HWMON_H
+#define IGT_HWMON_H
+
+#include <stdbool.h>
+
+int igt_hwmon_open(int device);
+
+#endif /* IGT_HWMON_H */
diff --git a/lib/meson.build b/lib/meson.build
index c665bd25..b1b8e80c 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -24,6 +24,7 @@ lib_sources = [
 	'igt_aux.c',
 	'igt_gt.c',
 	'igt_halffloat.c',
+	'igt_hwmon.c',
 	'igt_io.c',
 	'igt_matrix.c',
 	'igt_os.c',
-- 
2.25.1
