Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F02B10E190
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Sep 2023 09:28:27 +0000 (UTC)
From: Marius Vlad <marius.vlad@collabora.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Sep 2023 12:28:17 +0300
Message-Id: <20230901092819.16924-3-marius.vlad@collabora.com>
In-Reply-To: <20230901092819.16924-1-marius.vlad@collabora.com>
References: <20230901092819.16924-1-marius.vlad@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/5] lib/confifs: Add helpers for
 mounting/unmounting configfs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tzimmermann@suse.de, yixie@chromium.org, seanpaul@chromium.org,
 daniel@ffwll.ch, brpol@chromium.org, igormtorrente@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Jim Shargo <jshargo@chromium.org>

This change supports the subsequent testing of ConfigFS-based VKMS
features, which require their own mounting.

With this change, we also make is_mountpoint public renamaning to
igt_is_mountpoint and we make use of it.

Signed-off-by: Jim Shargo <jshargo@chromium.org>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---
 lib/igt.h          |   2 +-
 lib/igt_aux.c      |  25 +++++++++++
 lib/igt_aux.h      |   2 +
 lib/igt_configfs.c | 105 +++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_configfs.h |  36 ++++++++++++++++
 lib/igt_debugfs.c  |  29 +------------
 lib/meson.build    |   1 +
 7 files changed, 172 insertions(+), 28 deletions(-)
 create mode 100644 lib/igt_configfs.c
 create mode 100644 lib/igt_configfs.h

diff --git a/lib/igt.h b/lib/igt.h
index 73b6f7727..6108d9615 100644
--- a/lib/igt.h
+++ b/lib/igt.h
@@ -28,7 +28,7 @@
 #include "i915_3d.h"
 #include "igt_aux.h"
 #include "igt_core.h"
-#include "igt_core.h"
+#include "igt_configfs.h"
 #include "igt_debugfs.h"
 #include "igt_draw.h"
 #include "igt_dummyload.h"
diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 18edc5ef9..8b38b5a3e 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -2035,6 +2035,31 @@ bool igt_allow_unlimited_files(void)
 	return setrlimit(RLIMIT_NOFILE, &rlim) == 0;
 }
 
+bool igt_is_mountpoint(const char *path)
+{
+	char buf[strlen(path) + 4];
+	struct stat st;
+	dev_t dev;
+
+	igt_assert_lt(snprintf(buf, sizeof(buf), "%s/.", path), sizeof(buf));
+	if (stat(buf, &st))
+		return false;
+
+	if (!S_ISDIR(st.st_mode))
+		return false;
+
+	dev = st.st_dev;
+
+	igt_assert_lt(snprintf(buf, sizeof(buf), "%s/..", path), sizeof(buf));
+	if (stat(buf, &st))
+		return false;
+
+	if (!S_ISDIR(st.st_mode))
+		return false;
+
+	return dev != st.st_dev;
+}
+
 /**
  * vfs_file_max: report maximum number of files
  *
diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index fb76b0313..298c610f2 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -311,6 +311,8 @@ double igt_stop_siglatency(struct igt_mean *result);
 
 bool igt_allow_unlimited_files(void);
 
+bool igt_is_mountpoint(const char *path);
+
 int igt_is_process_running(const char *comm);
 int igt_terminate_process(int sig, const char *comm);
 void igt_lsof(const char *dpath);
diff --git a/lib/igt_configfs.c b/lib/igt_configfs.c
new file mode 100644
index 000000000..89acab315
--- /dev/null
+++ b/lib/igt_configfs.c
@@ -0,0 +1,105 @@
+/*
+ * Copyright 2023 Google LLC.
+ * Copyright 2023 Collabora, Ltd.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ */
+
+#include "igt_configfs.h"
+
+#include <fcntl.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mount.h>
+
+#include "igt_aux.h"
+
+/**
+ * SECTION:igt_configfs
+ * @short_description: Support code for configfs features
+ * @title: configfs
+ * @include: igt_configfs.h
+ *
+ * Helper methods for managing configfs.
+ */
+
+static const char *__igt_configfs_mount(void)
+{
+	if (igt_is_mountpoint("/sys/kernel/config"))
+		return "/sys/kernel/config";
+
+	if (igt_is_mountpoint("/config"))
+		return "/config";
+
+	if (mount("config", "/sys/kernel/config", "configfs", 0, 0))
+		return NULL;
+
+	return "/sys/kernel/config";
+}
+
+/**
+ * igt_configfs_mount:
+ *
+ * This searches for configfs in typical locations and will try to mount at
+ * /sys/kernel/config if it can't be found.
+ *
+ * Returns:
+ * The path to the configfs mount point (e.g. /sys/kernel/debug)
+ */
+const char *igt_configfs_mount(void)
+{
+	static const char *path;
+
+	if (!path)
+		path = __igt_configfs_mount();
+
+	return path;
+}
+
+const char *igt_configfs_vkms_mount(void)
+{
+	static char vkms_path[CONFIGFS_VKMS_DIR_SIZE];
+	const char *path = igt_configfs_mount();
+
+	if (!path)
+		return NULL;
+
+	snprintf(vkms_path, sizeof(vkms_path), "%s/%s", path, "vkms");
+
+	igt_debug("VKMS path: %s\n", vkms_path);
+	return vkms_path;
+}
+
+/**
+ * igt_configfs_dir: Open and return the fd of configfs, or -1 on failure.
+ *
+ * Returns:
+ */
+int igt_configfs_dir(void)
+{
+	const char *path = igt_configfs_mount();
+
+	if (!path)
+		return -1;
+
+	igt_debug("Opening configfs directory '%s'\n", path);
+	return open(path, O_RDWR);
+}
diff --git a/lib/igt_configfs.h b/lib/igt_configfs.h
new file mode 100644
index 000000000..238007ab7
--- /dev/null
+++ b/lib/igt_configfs.h
@@ -0,0 +1,36 @@
+/*
+ * Copyright 2023 Google LLC.
+ * Copyright 2023 Collabora, Ltd.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ */
+
+#ifndef __IGT_CONFIGFS_H__
+#define __IGT_CONFIGFS_H__
+
+#define CONFIGFS_VKMS_DIR_SIZE 64
+
+const char *igt_configfs_mount(void);
+const char *igt_configfs_vkms_mount(void);
+
+int igt_configfs_dir(void);
+
+#endif /* __IGT_CONFIGFS_H__ */
diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index a7b54bae5..63fc6b9e7 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -67,37 +67,12 @@
  * General debugfs helpers
  */
 
-static bool is_mountpoint(const char *path)
-{
-	char buf[strlen(path) + 4];
-	struct stat st;
-	dev_t dev;
-
-	igt_assert_lt(snprintf(buf, sizeof(buf), "%s/.", path), sizeof(buf));
-	if (stat(buf, &st))
-		return false;
-
-	if (!S_ISDIR(st.st_mode))
-		return false;
-
-	dev = st.st_dev;
-
-	igt_assert_lt(snprintf(buf, sizeof(buf), "%s/..", path), sizeof(buf));
-	if (stat(buf, &st))
-		return false;
-
-	if (!S_ISDIR(st.st_mode))
-		return false;
-
-	return dev != st.st_dev;
-}
-
 static const char *__igt_debugfs_mount(void)
 {
-	if (is_mountpoint("/sys/kernel/debug"))
+	if (igt_is_mountpoint("/sys/kernel/debug"))
 		return "/sys/kernel/debug";
 
-	if (is_mountpoint("/debug"))
+	if (igt_is_mountpoint("/debug"))
 		return "/debug";
 
 	if (mount("debug", "/sys/kernel/debug", "debugfs", 0, 0))
diff --git a/lib/meson.build b/lib/meson.build
index 21ea9d5ac..d727529f0 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -19,6 +19,7 @@ lib_sources = [
 	'igt_collection.c',
 	'igt_color_encoding.c',
 	'igt_crc.c',
+	'igt_configfs.c',
 	'igt_debugfs.c',
 	'igt_device.c',
 	'igt_device_scan.c',
-- 
2.40.1
