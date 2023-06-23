Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1E210E6D1
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jun 2023 23:11:48 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-313df030ccaso342020f8f.1
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jun 2023 16:11:48 -0700 (PDT)
From: James Shargo <jshargo@chromium.org>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Fri, 23 Jun 2023 19:09:54 -0400
Message-ID: <20230623230954.115437-4-jshargo@chromium.org>
In-Reply-To: <20230623230954.115437-1-jshargo@chromium.org>
References: <20230623230954.115437-1-jshargo@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/vkms: Adds VKMS tests and library
 functions to support them
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

From: Jim Shargo <jshargo@chromium.org>

The library functions include useful tools for creating configfs-backed
devices.

The tests exercise some basic functionality of new ConfigFS
functionality, both positive and negative cases.

Signed-off-by: Jim Shargo <jshargo@chromium.org>
---
 lib/igt.h                  |   2 +
 lib/igt_configfs.c         | 105 +++++++++++
 lib/igt_configfs.h         |  35 ++++
 lib/igt_vkms.c             | 362 +++++++++++++++++++++++++++++++++++++
 lib/igt_vkms.h             |  58 ++++++
 lib/meson.build            |   2 +
 tests/meson.build          |  13 ++
 tests/vkms/vkms_configfs.c | 189 +++++++++++++++++++
 8 files changed, 766 insertions(+)
 create mode 100644 lib/igt_configfs.c
 create mode 100644 lib/igt_configfs.h
 create mode 100644 lib/igt_vkms.c
 create mode 100644 lib/igt_vkms.h
 create mode 100644 tests/vkms/vkms_configfs.c

diff --git a/lib/igt.h b/lib/igt.h
index 73b6f7727..4c5d16715 100644
--- a/lib/igt.h
+++ b/lib/igt.h
@@ -27,6 +27,7 @@
 #include "drmtest.h"
 #include "i915_3d.h"
 #include "igt_aux.h"
+#include "igt_configfs.h"
 #include "igt_core.h"
 #include "igt_core.h"
 #include "igt_debugfs.h"
@@ -41,6 +42,7 @@
 #include "igt_pm.h"
 #include "igt_stats.h"
 #include "igt_dsc.h"
+#include "igt_vkms.h"
 #ifdef HAVE_CHAMELIUM
 #include "igt_alsa.h"
 #include "igt_audio.h"
diff --git a/lib/igt_configfs.c b/lib/igt_configfs.c
new file mode 100644
index 000000000..874948482
--- /dev/null
+++ b/lib/igt_configfs.c
@@ -0,0 +1,105 @@
+/*
+ * Copyright 2023 Google LLC.
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
+ * @include: igt.h
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
+	static char vkms_path[CONFIGFS_VKMS_DIR_SIZE] = { 0 };
+	const char *path = igt_configfs_mount();
+
+	if (!path)
+		return NULL;
+
+	if (strcmp(vkms_path, "") == 0) {
+		strncpy(vkms_path, path, CONFIGFS_VKMS_DIR_SIZE - 1);
+		strncat(vkms_path, "/vkms", CONFIGFS_VKMS_DIR_SIZE - 1);
+	}
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
index 000000000..0f1fd5faa
--- /dev/null
+++ b/lib/igt_configfs.h
@@ -0,0 +1,35 @@
+/*
+ * Copyright 2023 Google LLC.
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
diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
new file mode 100644
index 000000000..552c637cf
--- /dev/null
+++ b/lib/igt_vkms.c
@@ -0,0 +1,362 @@
+/*
+ * Copyright 2023 Google LLC.
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
+#include "igt_vkms.h"
+
+#include <dirent.h>
+#include <fcntl.h>
+#include <ftw.h>
+#include <libgen.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+#include "drmtest.h"
+#include "igt_configfs.h"
+#include "igt_core.h"
+
+static void __create_device_from_directory(igt_vkms_t *device, const char *name)
+{
+	const char *vkms_root = igt_configfs_vkms_mount();
+	memset(device, 0, sizeof(*device));
+
+	strncpy(device->name, name, ARRAY_SIZE(device->name) - 1);
+	snprintf(device->device_dir, ARRAY_SIZE(device->device_dir) - 1, "%s/%s",
+		 vkms_root, name);
+}
+
+void igt_vkms_destroy_all_devices(void)
+{
+	const char *vkms_root = igt_configfs_vkms_mount();
+	igt_vkms_t device = { 0 };
+	DIR *dir;
+	struct dirent *ent;
+	int ret = 0;
+
+	if (!vkms_root) {
+		igt_warn("Unable to find VKMS configfs directory.\n");
+		return;
+	}
+
+	dir = opendir(vkms_root);
+	if (!dir) {
+		igt_warn(
+			"Unable to open VKMS configfs directory '%s'. Got errno=%d (%s)\n",
+			vkms_root, errno, strerror(errno));
+		return;
+	}
+
+	while ((ent = readdir(dir)) != NULL) {
+		if (strcmp(ent->d_name, ".") == 0 ||
+		    strcmp(ent->d_name, "..") == 0)
+			continue;
+
+		__create_device_from_directory(&device, ent->d_name);
+		igt_vkms_device_destroy(&device);
+		if (ret)
+			igt_warn("Unable to reset device '%s/%s'\n", vkms_root,
+				 ent->d_name);
+	}
+
+	closedir(dir);
+}
+
+void igt_vkms_device_create(igt_vkms_t *device, const char *name)
+{
+	const char *vkms_root = igt_configfs_vkms_mount();
+	DIR *dir;
+	int ret;
+
+	igt_assert_f(vkms_root, "Unable to find VKMS root '%s'.\n", name);
+
+	dir = opendir(vkms_root);
+	igt_assert_f(
+		dir,
+		"VKMS configfs directory not available at '%s'. Got errno=%d (%s)\n",
+		vkms_root, errno, strerror(errno));
+	if (dir)
+		closedir(dir);
+
+	igt_assert_f(strlen(name) > (ARRAY_SIZE(device->name) - 1),
+		     "Name '%s' is too long for a VKMS device.\n", name);
+	igt_assert_f(strlen(vkms_root) + strlen(name) >
+			     (ARRAY_SIZE(device->device_dir) - 1),
+		     "Desired path is too long when creating '%s/vkms/%s'.\n",
+		     vkms_root, name);
+
+	memset(device, 0, sizeof(*device));
+	strncpy(device->name, name, ARRAY_SIZE(device->name) - 1);
+	snprintf(device->device_dir, ARRAY_SIZE(device->device_dir), "%s/%s", vkms_root,
+		 name);
+
+	igt_debug("mkdir'ing VKMS device at '%s'\n", device->device_dir);
+
+	ret = mkdir(device->device_dir, 0777);
+	igt_assert_f(ret != 0,
+		     "Unable to mkdir device directory '%s'. Got errno=%d (%s)\n",
+		     device->device_dir, errno, strerror(errno));
+	memset(device, 0, sizeof(*device));
+}
+
+static int __igt_vkms_unlink_symlinks(const char *fpath, const struct stat *sb,
+				      int typeflag, struct FTW *ftwbuf)
+{
+	if (typeflag != FTW_SL)
+		return 0;
+
+	if (unlink(fpath)) {
+		igt_warn(
+			"Unable to unlink vkms object: '%s'. Got errno=%d (%s)\n",
+			fpath, errno, strerror(errno));
+		return -1;
+	}
+	return 0;
+}
+
+static int __igt_vkms_delete_objects(const char *fpath, const struct stat *sb,
+				     int typeflag, struct FTW *ftwbuf)
+{
+	char *dirbase, path_buf[VKMS_CARD_OBJECT_DIR_SIZE] = { 0 };
+
+	strncpy(path_buf, fpath, VKMS_CARD_OBJECT_DIR_SIZE - 1);
+	dirbase = basename(dirname(path_buf));
+
+	if (strcmp(dirbase, "planes") != 0 &&
+	    strcmp(dirbase, "encoders") != 0 &&
+	    strcmp(dirbase, "connectors") != 0 &&
+	    strcmp(dirbase, "crtcs") != 0) {
+		return 0;
+	}
+
+	if (rmdir(fpath)) {
+		igt_warn(
+			"Unable to rmdir vkms object: '%s'. Got errno=%d (%s)\n",
+			fpath, errno, strerror(errno));
+		return -1;
+	}
+
+	return 0;
+}
+
+void igt_vkms_device_destroy(igt_vkms_t *device)
+{
+	int ret = 0;
+
+	/*
+	 * Some notes on device destruction:
+	 *   - FTW_PHYS keeps us from following symlinks
+	 *   - FTW_DEPTH does a DFS of the tree, which lets us delete bottom-up.
+	 */
+
+	ret = nftw(device->device_dir, &__igt_vkms_unlink_symlinks,
+		   /* nopenfd= */ 16, FTW_PHYS | FTW_DEPTH);
+	igt_assert_f(ret != 0,
+		     "Unable to remove symlinks for device directory '%s'\n",
+		     device->device_dir);
+
+	ret = nftw(device->device_dir, &__igt_vkms_delete_objects,
+		   /* nopenfd= */ 16, FTW_PHYS | FTW_DEPTH);
+	igt_assert_f(ret != 0,
+		     "Unable to remove objects for device directory '%s'\n",
+		     device->device_dir);
+
+	ret = rmdir(device->device_dir);
+	igt_assert_f(ret != 0,
+		     "Unable to rmdir device directory '%s'. Got errno=%d (%s)\n",
+		     device->device_dir, errno, strerror(errno));
+
+	memset(device, 0, sizeof(*device));
+}
+
+void igt_vkms_device_add_plane(igt_vkms_t *device, const char *name, int type)
+{
+	char path[VKMS_CARD_OBJECT_DIR_SIZE] = { 0 }, writebuf[2] = { 0 };
+	int fd, ret;
+
+	snprintf(path, VKMS_CARD_OBJECT_DIR_SIZE - 1, "%s/planes/%s",
+		 device->device_dir, name);
+
+	ret = mkdir(path, 0777);
+	igt_assert_f(ret != 0,
+		     "Failed to mkdir VKMS plane '%s'. Got errno=%d (%s)\n",
+		     path, errno, strerror(errno));
+
+	strcat(path, "/type");
+	fd = open(path, O_WRONLY);
+	igt_assert_f(
+		fd > 0,
+		"Failed to open plane type for writing '%s'. Got errno=%d (%s)\n",
+		path, errno, strerror(errno));
+
+	snprintf(writebuf, 2, "%d", type);
+	write(fd, writebuf, 1);
+	close(fd);
+}
+
+void igt_vkms_device_add_connector(igt_vkms_t *device, const char *name)
+{
+	char path[VKMS_CARD_OBJECT_DIR_SIZE] = { 0 };
+	int ret;
+
+	sprintf(path, "%s/connectors/%s", device->device_dir, name);
+
+	ret = mkdir(path, 0777);
+	igt_assert_f(ret != 0,
+		     "Failed to mkdir VKMS plane '%s'. Got errno=%d (%s)\n",
+		     path, errno, strerror(errno));
+}
+
+void igt_vkms_device_add_encoder(igt_vkms_t *device, const char *name)
+{
+	char path[VKMS_CARD_OBJECT_DIR_SIZE] = { 0 };
+	int ret;
+
+	sprintf(path, "%s/encoders/%s", device->device_dir, name);
+
+	ret = mkdir(path, 0777);
+	igt_assert_f(ret != 0,
+		     "Failed to mkdir VKMS encoder '%s'. Got errno=%d (%s)\n",
+		     path, errno, strerror(errno));
+}
+
+void igt_vkms_device_add_crtc(igt_vkms_t *device, const char *name)
+{
+	char path[VKMS_CARD_OBJECT_DIR_SIZE] = { 0 };
+	int ret;
+
+	sprintf(path, "%s/crtcs/%s", device->device_dir, name);
+
+	ret = mkdir(path, 0777);
+	igt_assert_f(ret != 0,
+		     "Failed to mkdir VKMS crtc '%s'. Got errno=%d (%s)\n",
+		     path, errno, strerror(errno));
+}
+
+void igt_vkms_device_permit_plane_crtc(igt_vkms_t *device, const char *plane_name,
+				     const char *crtc_name)
+{
+	char plane_crtcs_path[VKMS_CARD_OBJECT_DIR_SIZE] = { 0 };
+	char crtc_path[VKMS_CARD_OBJECT_DIR_SIZE] = { 0 };
+	int ret;
+
+	snprintf(plane_crtcs_path, VKMS_CARD_OBJECT_DIR_SIZE - 1,
+		 "%s/planes/%s/possible_crtcs/%s", device->device_dir, plane_name,
+		 crtc_name);
+	snprintf(crtc_path, VKMS_CARD_OBJECT_DIR_SIZE - 1, "%s/crtcs/%s",
+		 device->device_dir, crtc_name);
+
+	ret = symlink(crtc_path, plane_crtcs_path);
+	igt_assert_f(
+		ret != 0,
+		"Failed to symlink VKMS crtc '%s' to plane '%s'. Got errno=%d (%s)\n",
+		crtc_name, plane_name, errno, strerror(errno));
+}
+
+void igt_vkms_device_permit_encoder_crtc(igt_vkms_t *device,
+				       const char *encoder_name,
+				       const char *crtc_name)
+{
+	char encoder_crtcs_path[VKMS_CARD_OBJECT_DIR_SIZE] = { 0 };
+	char crtc_path[VKMS_CARD_OBJECT_DIR_SIZE] = { 0 };
+	int ret;
+
+	snprintf(encoder_crtcs_path, VKMS_CARD_OBJECT_DIR_SIZE - 1,
+		 "%s/encoders/%s/possible_crtcs/%s", device->device_dir,
+		 encoder_name, crtc_name);
+	snprintf(crtc_path, VKMS_CARD_OBJECT_DIR_SIZE - 1, "%s/crtcs/%s",
+		 device->device_dir, crtc_name);
+
+	ret = symlink(crtc_path, encoder_crtcs_path);
+	igt_assert_f(
+		ret != 0,
+		"Failed to symlink VKMS crtc '%s' to encoder '%s'. Got errno=%d (%s)\n",
+		crtc_name, encoder_name, errno, strerror(errno));
+}
+
+void igt_vkms_device_permit_connector_encoder(igt_vkms_t *device,
+					    const char *connector_name,
+					    const char *encoder_name)
+{
+	char connector_encoders_path[VKMS_CARD_OBJECT_DIR_SIZE] = { 0 };
+	char encoder_path[VKMS_CARD_OBJECT_DIR_SIZE] = { 0 };
+	int ret;
+
+	snprintf(connector_encoders_path, VKMS_CARD_OBJECT_DIR_SIZE - 1,
+		 "%s/connectors/%s/possible_encoders/%s", device->device_dir,
+		 connector_name, encoder_name);
+	snprintf(encoder_path, VKMS_CARD_OBJECT_DIR_SIZE - 1, "%s/encoders/%s",
+		 device->device_dir, encoder_name);
+
+	ret = symlink(encoder_path, connector_encoders_path);
+	igt_assert_f(
+		ret != 0,
+		"Failed to symlink VKMS encoder '%s' to connector '%s'. Got "
+		"errno=%d (%s)\n",
+		encoder_name, connector_name, errno, strerror(errno));
+}
+
+void igt_vkms_enable(igt_vkms_t *device)
+{
+	char enabled_file[VKMS_CARD_OBJECT_DIR_SIZE] = { 0 };
+	int fd, ret;
+
+	snprintf(enabled_file, VKMS_CARD_OBJECT_DIR_SIZE - 1,
+		 "%s/enabled", device->device_dir);
+
+	fd = open(enabled_file, O_WRONLY);
+	igt_assert_f(fd > 0, "Unable to open '%s'\n",
+		     enabled_file);
+
+	ret = write(fd, "1", 1);
+	igt_assert_f(
+		ret >= 0,
+		"Unable to write '%s'. Got errno=%d (%s)\n",
+		enabled_file, errno, strerror(errno));
+
+	ret = close(fd);
+	igt_assert_eq(ret, 0);
+}
+
+int igt_vkms_is_enabled(igt_vkms_t *device)
+{
+	char registration_file[VKMS_CARD_OBJECT_DIR_SIZE] = { 0 },
+	     is_enabled[2] = { 0 };
+	int fd, ret = 0;
+
+	snprintf(registration_file, VKMS_CARD_OBJECT_DIR_SIZE - 1,
+		 "%s/enabled", device->device_dir);
+
+	fd = open(registration_file, O_RDONLY);
+	igt_assert_f(fd > 0, "Unable to open '%s'\n",
+		     registration_file);
+
+	ret = read(fd, is_enabled, ARRAY_SIZE(is_enabled));
+	igt_assert_eq(0, close(fd));
+	if (ret < 0) {
+		return false;
+	}
+
+	return strcmp("1", is_enabled) == 0;
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
new file mode 100644
index 000000000..d0473a16a
--- /dev/null
+++ b/lib/igt_vkms.h
@@ -0,0 +1,58 @@
+/*
+ * Copyright 2023 Google LLC.
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
+#ifndef __IGT_VKMS_H__
+#define __IGT_VKMS_H__
+
+#define VKMS_CARD_DIR_SIZE 128
+#define VKMS_CARD_OBJECT_DIR_SIZE (VKMS_CARD_DIR_SIZE + 128)
+
+void igt_vkms_destroy_all_devices(void);
+
+typedef struct igt_vkms {
+	char name[64];
+	char device_dir[VKMS_CARD_DIR_SIZE];
+} igt_vkms_t;
+
+void igt_vkms_device_create(igt_vkms_t *device, const char *name);
+void igt_vkms_device_destroy(igt_vkms_t *device);
+
+void igt_vkms_device_add_plane(igt_vkms_t *device, const char *name, int type);
+void igt_vkms_device_add_connector(igt_vkms_t *device, const char *name);
+void igt_vkms_device_add_encoder(igt_vkms_t *device, const char *name);
+void igt_vkms_device_add_crtc(igt_vkms_t *device, const char *name);
+
+void igt_vkms_device_permit_plane_crtc(igt_vkms_t *device, const char *plane_name,
+				     const char *crtc_name);
+void igt_vkms_device_permit_encoder_crtc(igt_vkms_t *device,
+				       const char *encoder_name,
+				       const char *crtc_name);
+void igt_vkms_device_permit_connector_encoder(igt_vkms_t *device,
+					    const char *connector_name,
+					    const char *encoder_name);
+
+void igt_vkms_enable(igt_vkms_t *device);
+int igt_vkms_is_enabled(igt_vkms_t *device);
+
+#endif /* __IGT_VKMS_H__ */
diff --git a/lib/meson.build b/lib/meson.build
index 8e9977083..c6bd908ca 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -18,6 +18,7 @@ lib_sources = [
 	'i915/i915_crc.c',
 	'igt_collection.c',
 	'igt_color_encoding.c',
+	'igt_configfs.c',
 	'igt_crc.c',
 	'igt_debugfs.c',
 	'igt_device.c',
@@ -47,6 +48,7 @@ lib_sources = [
 	'igt_types.c',
 	'igt_vec.c',
 	'igt_vgem.c',
+	'igt_vkms.c',
 	'igt_x86.c',
 	'instdone.c',
 	'intel_allocator.c',
diff --git a/tests/meson.build b/tests/meson.build
index 61dcc0769..7c2b59df9 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -285,6 +285,10 @@ chamelium_progs = [
 	'kms_chamelium_hpd',
 ]
 
+vkms_progs = [
+  'vkms_configfs',
+]
+
 test_deps = [ igt_deps ]
 
 if libdrm_nouveau.found()
@@ -355,6 +359,15 @@ if chamelium.found()
 	test_deps += chamelium
 endif
 
+foreach prog : vkms_progs
+	test_executables += executable(prog, join_paths('vkms', prog + '.c'),
+				       dependencies : test_deps,
+				       install_dir : libexecdir,
+				       install_rpath : libexecdir_rpathdir,
+				       install : true)
+	test_list += prog
+endforeach
+
 test_executables += executable('drm_fdinfo',
 	   join_paths('i915', 'drm_fdinfo.c'),
 	   dependencies : test_deps + [ lib_igt_drm_fdinfo ],
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
new file mode 100644
index 000000000..39af6dd07
--- /dev/null
+++ b/tests/vkms/vkms_configfs.c
@@ -0,0 +1,189 @@
+/*
+ * Copyright 2023 Google LLC.
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
+ */
+
+#include <string.h>
+#include <xf86drmMode.h>
+
+#include "drmtest.h"
+#include "igt.h"
+#include "igt_configfs.h"
+#include "igt_core.h"
+#include "igt_vkms.h"
+
+IGT_TEST_DESCRIPTION("Basic tests for VKMS, including configfs support");
+
+static void vkms_crtc_no_primary_test(igt_vkms_t *device)
+{
+	igt_vkms_device_add_plane(device, "primary", DRM_PLANE_TYPE_PRIMARY);
+	igt_vkms_device_add_crtc(device, "crtc");
+	igt_vkms_device_add_encoder(device, "encoder");
+	igt_vkms_device_add_connector(device, "connector");
+
+	igt_vkms_device_permit_plane_crtc(device, "primary", "crtc");
+	igt_vkms_device_permit_connector_encoder(device, "connector", "encoder");
+	igt_vkms_device_permit_encoder_crtc(device, "encoder", "crtc");
+
+	igt_vkms_enable(device);
+	igt_assert(!igt_vkms_is_enabled(device));
+}
+
+static void vkms_basic_test(igt_vkms_t *device)
+{
+	igt_warn("Path: %s\n", device->device_dir);
+
+	igt_vkms_device_add_plane(device, "primary", DRM_PLANE_TYPE_PRIMARY);
+	igt_vkms_device_add_crtc(device, "crtc");
+	igt_vkms_device_add_encoder(device, "encoder");
+	igt_vkms_device_add_connector(device, "connector");
+
+	igt_vkms_device_permit_plane_crtc(device, "primary", "crtc");
+	igt_vkms_device_permit_connector_encoder(device, "connector", "encoder");
+	igt_vkms_device_permit_encoder_crtc(device, "encoder", "crtc");
+
+	igt_vkms_enable(device);
+	igt_assert(igt_vkms_is_enabled(device));
+}
+
+static void vkms_multiple_overlays_test(igt_vkms_t *device)
+{
+	igt_vkms_device_add_plane(device, "primary", DRM_PLANE_TYPE_PRIMARY);
+	igt_vkms_device_add_plane(device, "cursor", DRM_PLANE_TYPE_CURSOR);
+	igt_vkms_device_add_plane(device, "overlay0", DRM_PLANE_TYPE_OVERLAY);
+	igt_vkms_device_add_plane(device, "overlay1", DRM_PLANE_TYPE_OVERLAY);
+	igt_vkms_device_add_plane(device, "overlay2", DRM_PLANE_TYPE_OVERLAY);
+	igt_vkms_device_add_plane(device, "overlay3", DRM_PLANE_TYPE_OVERLAY);
+	igt_vkms_device_add_crtc(device, "crtc");
+	igt_vkms_device_add_encoder(device, "encoder");
+	igt_vkms_device_add_connector(device, "connector");
+
+	igt_vkms_device_permit_plane_crtc(device, "primary", "crtc");
+	igt_vkms_device_permit_plane_crtc(device, "cursor", "crtc");
+	igt_vkms_device_permit_plane_crtc(device, "overlay0", "crtc");
+	igt_vkms_device_permit_plane_crtc(device, "overlay1", "crtc");
+	igt_vkms_device_permit_plane_crtc(device, "overlay2", "crtc");
+	igt_vkms_device_permit_plane_crtc(device, "overlay3", "crtc");
+	igt_vkms_device_permit_connector_encoder(device, "connector", "encoder");
+	igt_vkms_device_permit_encoder_crtc(device, "encoder", "crtc");
+
+	igt_vkms_enable(device);
+	igt_assert(igt_vkms_is_enabled(device));
+}
+
+static void vkms_multiple_displays_test(igt_vkms_t *device)
+{
+	igt_vkms_device_add_plane(device, "primary0", DRM_PLANE_TYPE_PRIMARY);
+	igt_vkms_device_add_plane(device, "primary1", DRM_PLANE_TYPE_PRIMARY);
+	igt_vkms_device_add_plane(device, "cursor0", DRM_PLANE_TYPE_CURSOR);
+	igt_vkms_device_add_plane(device, "cursor1", DRM_PLANE_TYPE_CURSOR);
+	igt_vkms_device_add_plane(device, "overlay0", DRM_PLANE_TYPE_OVERLAY);
+	igt_vkms_device_add_plane(device, "overlay1", DRM_PLANE_TYPE_OVERLAY);
+	igt_vkms_device_add_plane(device, "overlay2", DRM_PLANE_TYPE_OVERLAY);
+	igt_vkms_device_add_plane(device, "overlay3", DRM_PLANE_TYPE_OVERLAY);
+	igt_vkms_device_add_crtc(device, "crtc0");
+	igt_vkms_device_add_crtc(device, "crtc1");
+	igt_vkms_device_add_encoder(device, "encoder0");
+	igt_vkms_device_add_encoder(device, "encoder1");
+	igt_vkms_device_add_connector(device, "connector0");
+	igt_vkms_device_add_connector(device, "connector1");
+
+	igt_vkms_device_permit_plane_crtc(device, "primary0", "crtc0");
+	igt_vkms_device_permit_plane_crtc(device, "cursor0", "crtc0");
+	igt_vkms_device_permit_plane_crtc(device, "overlay0", "crtc0");
+	igt_vkms_device_permit_plane_crtc(device, "overlay1", "crtc0");
+	igt_vkms_device_permit_plane_crtc(device, "overlay2", "crtc0");
+	igt_vkms_device_permit_plane_crtc(device, "overlay3", "crtc0");
+	igt_vkms_device_permit_connector_encoder(device, "connector0", "encoder0");
+	igt_vkms_device_permit_encoder_crtc(device, "encoder0", "crtc0");
+
+	igt_vkms_device_permit_plane_crtc(device, "primary1", "crtc1");
+	igt_vkms_device_permit_plane_crtc(device, "cursor1", "crtc1");
+	igt_vkms_device_permit_plane_crtc(device, "overlay0", "crtc1");
+	igt_vkms_device_permit_plane_crtc(device, "overlay1", "crtc1");
+	igt_vkms_device_permit_plane_crtc(device, "overlay2", "crtc1");
+	igt_vkms_device_permit_plane_crtc(device, "overlay3", "crtc1");
+	igt_vkms_device_permit_connector_encoder(device, "connector1", "encoder1");
+	igt_vkms_device_permit_encoder_crtc(device, "encoder1", "crtc1");
+
+	igt_vkms_enable(device);
+	igt_assert(igt_vkms_is_enabled(device));
+}
+
+igt_main
+{
+	igt_vkms_t device = { 0 };
+
+	igt_require_vkms();
+
+	// By clearing out all existing devices, we don't end up with
+	// confusing name collision errors.
+	igt_fixture
+	{
+		igt_vkms_destroy_all_devices();
+	}
+
+	igt_describe("Registering an empty device fails");
+	igt_subtest("empty")
+	{
+		igt_vkms_device_create(&device, "empty-device");
+		igt_vkms_enable(&device);
+		igt_vkms_device_destroy(&device);
+	}
+
+	igt_describe("Registering a CRTC with no primary fails");
+	igt_subtest("no_primary")
+	{
+		igt_vkms_device_create(&device, "no-primary");
+		vkms_crtc_no_primary_test(&device);
+		igt_vkms_device_destroy(&device);
+	}
+
+	igt_describe("Can create a minimal device.");
+	igt_subtest("basic_device")
+	{
+		igt_vkms_device_create(&device, "basic-device");
+		vkms_basic_test(&device);
+		igt_vkms_device_destroy(&device);
+	}
+
+	igt_describe("Can create a device with multiple overlays");
+	igt_subtest("multiple_overlays_device")
+	{
+		igt_vkms_device_create(&device, "multiple-overlays-device");
+		vkms_multiple_overlays_test(&device);
+		igt_vkms_device_destroy(&device);
+	}
+
+	igt_describe("Can create a device with multiple displays");
+	igt_subtest("multiple_displays_device")
+	{
+		igt_vkms_device_create(&device, "multiple-displays-device");
+		vkms_multiple_displays_test(&device);
+		igt_vkms_device_destroy(&device);
+	}
+
+	igt_fixture
+	{
+		if (strcmp(device.name, "") != 0)
+			igt_vkms_device_destroy(&device);
+	}
+}
-- 
2.41.0.162.gfafddb0af9-goog
