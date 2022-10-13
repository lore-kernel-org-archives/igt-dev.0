Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C8710E273
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Oct 2022 15:14:05 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Oct 2022 08:13:53 -0700
Message-Id: <20221013151400.2086268-2-ashutosh.dixit@intel.com>
In-Reply-To: <20221013151400.2086268-1-ashutosh.dixit@intel.com>
References: <20221013151400.2086268-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/8] lib/igt_hwmon: Introduce library
 igt_hwmon
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Riana Tauro <riana.tauro@intel.com>

igt_hwmon exposes methods to open hwmon directories identified by name

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_hwmon.c | 73 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_hwmon.h | 12 ++++++++
 lib/meson.build |  1 +
 3 files changed, 86 insertions(+)
 create mode 100644 lib/igt_hwmon.c
 create mode 100644 lib/igt_hwmon.h

diff --git a/lib/igt_hwmon.c b/lib/igt_hwmon.c
new file mode 100644
index 0000000000..1e4dab1bb2
--- /dev/null
+++ b/lib/igt_hwmon.c
@@ -0,0 +1,73 @@
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
index 0000000000..aa418fdcb0
--- /dev/null
+++ b/lib/igt_hwmon.h
@@ -0,0 +1,12 @@
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
index c665bd2507..b1b8e80cbf 100644
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
2.38.0
