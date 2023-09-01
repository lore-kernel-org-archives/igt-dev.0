Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8354110E710
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Sep 2023 09:28:28 +0000 (UTC)
From: Marius Vlad <marius.vlad@collabora.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Sep 2023 12:28:18 +0300
Message-Id: <20230901092819.16924-4-marius.vlad@collabora.com>
In-Reply-To: <20230901092819.16924-1-marius.vlad@collabora.com>
References: <20230901092819.16924-1-marius.vlad@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/5] tests/vkms: Add a small library for
 VKMS testing
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

And with it, this adds a basic test that makes use of it,
creating a device and with it a pipeline.

One should create a vkms device, add pipeline elements, like encoders,
crtc, and connectors, compose the pipeline by attaching each element
using the _attach_ functions, set the connector as connected and
finally, enable the vkms device.

This works in-tandem with the vkms driver which requires to enable the
device and set the connector as connected.

Signed-off-by: Jim Shargo <jshargo@chromium.org>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---
 lib/igt.h                  |   1 +
 lib/igt_vkms.c             | 532 +++++++++++++++++++++++++++++++++++++
 lib/igt_vkms.h             |  66 +++++
 lib/meson.build            |   1 +
 tests/meson.build          |  13 +
 tests/vkms/vkms_configfs.c |  83 ++++++
 6 files changed, 696 insertions(+)
 create mode 100644 lib/igt_vkms.c
 create mode 100644 lib/igt_vkms.h
 create mode 100644 tests/vkms/vkms_configfs.c

diff --git a/lib/igt.h b/lib/igt.h
index 6108d9615..d3771c1f1 100644
--- a/lib/igt.h
+++ b/lib/igt.h
@@ -41,6 +41,7 @@
 #include "igt_pm.h"
 #include "igt_stats.h"
 #include "igt_dsc.h"
+#include "igt_vkms.h"
 #ifdef HAVE_CHAMELIUM
 #include "igt_alsa.h"
 #include "igt_audio.h"
diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
new file mode 100644
index 000000000..7ae8dde55
--- /dev/null
+++ b/lib/igt_vkms.c
@@ -0,0 +1,532 @@
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
+/**
+ * SECTION:igt_vkms
+ * @short_description: Library with creating and dynamically configure a vkms device
+ * @title: vkms
+ * @include: igt_vkms.h
+ *
+ * This library contains helpers for creating a vkms device and configuring it
+ * dynamically.
+ *
+ * One should create a vkms device, add pipeline elements, like encoders, crtc,
+ * and connectors, compose the pipeline by attaching each element using the
+ * _attach_ functions, set the connector as connected and finally, enable the
+ * vkms device.
+ */
+
+
+static void create_device_from_directory(igt_vkms_t *device, const char *name)
+{
+	const char *vkms_root = igt_configfs_vkms_mount();
+	memset(device, 0, sizeof(*device));
+
+	snprintf(device->name, sizeof(device->name), "%s", name);
+	snprintf(device->device_dir, sizeof(device->device_dir), "%s/%s", vkms_root, name);
+}
+
+/**
+ * igt_vkms_destroy_all_devices:
+ *
+ * Iterates over all directories found in the ConfigFS mountpoint and calls
+ * igt_vkms_device_destroy, which cleans up any previous directories,
+ * symlinks and objects.
+ */
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
+		igt_warn("Unable to open VKMS configfs directory '%s'. "
+			 "Got errno=%d (%s)\n", vkms_root, errno, strerror(errno));
+		return;
+	}
+
+	while ((ent = readdir(dir)) != NULL) {
+		if (strcmp(ent->d_name, ".") == 0 ||
+		    strcmp(ent->d_name, "..") == 0)
+			continue;
+
+		create_device_from_directory(&device, ent->d_name);
+		igt_vkms_device_destroy(&device);
+		if (ret)
+			igt_warn("Unable to reset device '%s/%s'\n", vkms_root,
+				 ent->d_name);
+	}
+
+	closedir(dir);
+}
+
+/**
+ * igt_vkms_device_create:
+ * @device: a statically allocated object that denotes a vkms device
+ * @name: a string that signifies the vkms device to be created
+ *
+ * This creates a directory in the ConfigFS root mountpoint directory, where
+ * the entire pipeline will be configured.
+ */
+void igt_vkms_device_create(igt_vkms_t *device, const char *name)
+{
+	const char *vkms_root = igt_configfs_vkms_mount();
+	DIR *dir;
+	int ret;
+
+	igt_assert_f(vkms_root, "Unable to find VKMS root '%s'.\n", name);
+
+	dir = opendir(vkms_root);
+	igt_assert_f(dir, "VKMS configfs directory not available at '%s'. "
+		     "Got errno=%d (%s)\n", vkms_root, errno, strerror(errno));
+	if (dir)
+		closedir(dir);
+
+	create_device_from_directory(device, name);
+
+	igt_debug("mkdir'ing VKMS device at '%s'\n", device->device_dir);
+
+	ret = mkdir(device->device_dir, 0777);
+	igt_assert_f(ret == 0,
+		     "Unable to mkdir device directory '%s'. Got errno=%d (%s)\n",
+		     device->device_dir, errno, strerror(errno));
+}
+
+static int igt_vkms_unlink_symlinks(const char *fpath, const struct stat *sb,
+				      int typeflag, struct FTW *ftwbuf)
+{
+	if (typeflag != FTW_SL)
+		return 0;
+
+	if (unlink(fpath)) {
+		igt_warn("Unable to unlink vkms object: '%s'. "
+	                 "Got errno=%d (%s)\n", fpath, errno, strerror(errno));
+		return -1;
+	}
+
+	return 0;
+}
+
+static int igt_vkms_delete_objects(const char *fpath, const struct stat *sb,
+				     int typeflag, struct FTW *ftwbuf)
+{
+	char *dirbase;
+	char path_buf[VKMS_CARD_OBJECT_DIR_SIZE];
+
+	memset(path_buf, 0x0, sizeof(path_buf));
+	snprintf(path_buf, sizeof(path_buf), "%s", fpath);
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
+		igt_warn("Unable to rmdir vkms object: '%s'. Got errno=%d (%s)\n",
+			 fpath, errno, strerror(errno));
+		return -1;
+	}
+
+	return 0;
+}
+
+/**
+ * igt_vkms_device_destroy:
+ * @device: the vkms device in question
+ *
+ * Removes any possible symlinks, objects and directories, and clears the
+ * device for later usage.
+ *
+ * Users can then create a new vkms device with igt_vkms_device_create().
+ */
+void igt_vkms_device_destroy(igt_vkms_t *device)
+{
+	int ret = 0;
+
+	igt_debug("Destroying device %s\n", device->device_dir);
+
+	/* Some notes on device destruction:
+	 *   - FTW_PHYS keeps us from following symlinks
+	 *   - FTW_DEPTH does a DFS of the tree, which lets us delete
+	 *   bottom-up.
+	 */
+	ret = nftw(device->device_dir, &igt_vkms_unlink_symlinks,
+		   /* nopenfd= */ 16, FTW_PHYS | FTW_DEPTH);
+	igt_assert_f(ret == 0,
+		     "Unable to remove symlinks for device directory '%s'\n",
+		     device->device_dir);
+
+	ret = nftw(device->device_dir, &igt_vkms_delete_objects,
+		   /* nopenfd= */ 16, FTW_PHYS | FTW_DEPTH);
+	igt_assert_f(ret == 0,
+		     "Unable to remove objects for device directory '%s'\n",
+		     device->device_dir);
+
+	ret = rmdir(device->device_dir);
+	igt_assert_f(ret == 0,
+		     "Unable to rmdir device directory '%s'. Got errno=%d (%s)\n",
+		     device->device_dir, errno, strerror(errno));
+
+	memset(device, 0, sizeof(*device));
+}
+
+/**
+ * igt_vkms_device_add_plane:
+ * @device: the device in question
+ * @name: the name of the plane, as a string
+ * @type: the type of the HW plane, as an integer, one of DRM_PLANE_TYPE_PRIMARY,
+ * DRM_PLANE_TYPE_OVERLAY or DRM_PLANE_TYPE_CURSOR.
+ *
+ * mkdirs and creates a plane using the provided name and the type.
+ */
+void igt_vkms_device_add_plane(igt_vkms_t *device, const char *name, int type)
+{
+	char path[VKMS_CARD_OBJECT_DIR_SIZE];
+	char writebuf[2];
+	int fd, ret;
+
+	memset(path, 0x0, sizeof(path));
+	snprintf(path, sizeof(path), "%s/planes/%s", device->device_dir, name);
+
+	ret = mkdir(path, 0777);
+	igt_assert_f(ret == 0,
+		     "Failed to mkdir VKMS plane '%s'. Got errno=%d (%s)\n",
+		     path, errno, strerror(errno));
+
+	strcat(path, "/type");
+	fd = open(path, O_WRONLY);
+	igt_assert_f(fd > 0,
+		     "Failed to open plane type for writing '%s'. Got errno=%d (%s)\n",
+		     path, errno, strerror(errno));
+
+	snprintf(writebuf, 2, "%d", type);
+	write(fd, writebuf, 1);
+	close(fd);
+}
+
+/**
+ * igt_vkms_device_add_connector:
+ * @device: the device in question
+ * @name: the name of the connector, as a string
+ *
+ * mkdirs and creates a connector using the provided name.
+ *
+ */
+void igt_vkms_device_add_connector(igt_vkms_t *device, const char *name)
+{
+	char path[VKMS_CARD_OBJECT_DIR_SIZE];
+	int ret;
+
+	memset(path, 0x0, sizeof(path));
+	snprintf(path, sizeof(path), "%s/connectors/%s", device->device_dir, name);
+
+	ret = mkdir(path, 0777);
+	igt_assert_f(ret == 0,
+		     "Failed to mkdir VKMS plane '%s'. Got errno=%d (%s)\n",
+		     path, errno, strerror(errno));
+}
+
+/**
+ * igt_vkms_device_add_encoder:
+ * @device: the device in question
+ * @name: the name of the encoder, as a string
+ *
+ * mkdirs and creates an encoder using the provided name.
+ */
+void igt_vkms_device_add_encoder(igt_vkms_t *device, const char *name)
+{
+	char path[VKMS_CARD_OBJECT_DIR_SIZE];
+	int ret;
+
+	memset(path, 0x0, sizeof(path));
+	snprintf(path, sizeof(path), "%s/encoders/%s", device->device_dir, name);
+
+	ret = mkdir(path, 0777);
+	igt_assert_f(ret == 0,
+		     "Failed to mkdir VKMS encoder '%s'. Got errno=%d (%s)\n",
+		     path, errno, strerror(errno));
+}
+
+/**
+ * igt_vkms_device_add_crtc:
+ * @device: the device in question
+ * @name: the name of the crtc, as a string
+ *
+ * mkdirs and creates a crtc using the provided name.
+ */
+void igt_vkms_device_add_crtc(igt_vkms_t *device, const char *name)
+{
+	char path[VKMS_CARD_OBJECT_DIR_SIZE];
+	int ret;
+
+	memset(path, 0x0, sizeof(path));
+	snprintf(path, sizeof(path), "%s/crtcs/%s", device->device_dir, name);
+
+	ret = mkdir(path, 0777);
+	igt_assert_f(ret == 0,
+		     "Failed to mkdir VKMS crtc '%s'. Got errno=%d (%s)\n",
+		     path, errno, strerror(errno));
+}
+
+/**
+ * igt_vkms_device_attach_plane_to_crtc:
+ * @device: the vkms device in question
+ * @plane_name: the plane name, as a string
+ * @crtc_name: the crtc name, as a string
+ *
+ * This function symlinks the crtc, as pointed by crtc_name to the planes
+ * possible_crtcs directory.
+ */
+void igt_vkms_device_attach_plane_to_crtc(igt_vkms_t *device, const char *plane_name,
+					  const char *crtc_name)
+{
+	char plane_crtcs_path[VKMS_CARD_OBJECT_DIR_SIZE];
+	char crtc_path[VKMS_CARD_OBJECT_DIR_SIZE];
+	int ret;
+
+	memset(crtc_path, 0x0, sizeof(crtc_path));
+	memset(plane_crtcs_path, 0x0, sizeof(plane_crtcs_path));
+
+	snprintf(plane_crtcs_path, sizeof(plane_crtcs_path),
+		 "%s/planes/%s/possible_crtcs/%s",
+		 device->device_dir, plane_name, crtc_name);
+	snprintf(crtc_path, sizeof(crtc_path), "%s/crtcs/%s",
+		 device->device_dir, crtc_name);
+
+	ret = symlink(crtc_path, plane_crtcs_path);
+	igt_assert_f(ret == 0,
+		"Failed to symlink VKMS crtc '%s' to plane '%s'. Got errno=%d (%s)\n",
+		crtc_name, plane_name, errno, strerror(errno));
+}
+
+/**
+ * igt_vkms_device_attach_crtc_to_encoder:
+ * @device: the vkms device in question
+ * @encoder_name: the encoder name, as a string
+ * @crtc_name: the crtc name, as a string
+ *
+ * This function symlinks the crtc, as pointed by crtc_name to the encoders
+ * possible_crtcs directory.
+ */
+void igt_vkms_device_attach_crtc_to_encoder(igt_vkms_t *device, const char *encoder_name,
+					    const char *crtc_name)
+{
+	char encoder_crtcs_path[VKMS_CARD_OBJECT_DIR_SIZE];
+	char crtc_path[VKMS_CARD_OBJECT_DIR_SIZE];
+	int ret;
+
+	memset(crtc_path, 0x0, sizeof(crtc_path));
+	memset(encoder_crtcs_path, 0x0, sizeof(encoder_crtcs_path));
+
+	snprintf(encoder_crtcs_path, sizeof(encoder_crtcs_path),
+		 "%s/encoders/%s/possible_crtcs/%s", device->device_dir,
+		 encoder_name, crtc_name);
+	snprintf(crtc_path, sizeof(crtc_path), "%s/crtcs/%s",
+		 device->device_dir, crtc_name);
+
+	ret = symlink(crtc_path, encoder_crtcs_path);
+	igt_assert_f(ret == 0,
+		"Failed to symlink VKMS crtc '%s' to encoder '%s'. Got errno=%d (%s)\n",
+		crtc_name, encoder_name, errno, strerror(errno));
+}
+
+/**
+ * igt_vkms_device_attach_encoder_to_connector:
+ * @device: the vkms device in question
+ * @connector_name: the connector name, as a string
+ * @encoder_name: the encoder name, as a string
+ *
+ * This function symlinks the encoder, pointed by encoder_name to the
+ * connectors possible_encoders directory.
+ */
+void igt_vkms_device_attach_encoder_to_connector(igt_vkms_t *device,
+						 const char *connector_name,
+						 const char *encoder_name)
+{
+	char connector_encoders_path[VKMS_CARD_OBJECT_DIR_SIZE];
+	char encoder_path[VKMS_CARD_OBJECT_DIR_SIZE];
+	int ret;
+
+	memset(encoder_path, 0x0, sizeof(encoder_path));
+	memset(connector_encoders_path, 0x0, sizeof(connector_encoders_path));
+
+	snprintf(connector_encoders_path, sizeof(connector_encoders_path),
+		 "%s/connectors/%s/possible_encoders/%s", device->device_dir,
+		 connector_name, encoder_name);
+	snprintf(encoder_path, sizeof(encoder_path), "%s/encoders/%s",
+		 device->device_dir, encoder_name);
+
+	ret = symlink(encoder_path, connector_encoders_path);
+	igt_assert_f(ret == 0,
+		    "Failed to symlink VKMS encoder '%s' to connector '%s'. "
+		     "Got errno=%d (%s)\n", encoder_name, connector_name,
+		     errno, strerror(errno));
+}
+
+/**
+ * igt_vkms_enable:
+ * @device: the vkms device in question
+ *
+ * This would enable the vkms device after setting up the pipeline. Use this
+ * function after you've set up the entire pipeline to probe and add the vkms
+ * device.
+ *
+ */
+void igt_vkms_enable(igt_vkms_t *device)
+{
+	char enabled_file[VKMS_CARD_OBJECT_DIR_SIZE];
+	int fd, ret;
+
+	memset(enabled_file, 0x0, sizeof(enabled_file));
+	snprintf(enabled_file, sizeof(enabled_file),
+		 "%s/enabled", device->device_dir);
+
+	fd = open(enabled_file, O_WRONLY);
+	igt_assert_f(fd > 0, "Unable to open '%s'\n", enabled_file);
+
+	ret = write(fd, "1", 1);
+	igt_assert_f(ret >= 0, "Unable to write '%s'. Got errno=%d (%s)\n",
+		     enabled_file, errno, strerror(errno));
+
+	ret = close(fd);
+	igt_assert_eq(ret, 0);
+}
+
+/**
+ * igt_vkms_connector_connect:
+ * @device: the vkms device in question
+ * @connector_name: the connector name, as a string
+ *
+ * By default the connector will be created as disconnected so you'd need to
+ * mark the connector as connected. This will generate connected hot-plug
+ * event.
+ *
+ * You can either call this before enabling the vkms device, or after.
+ */
+void igt_vkms_connector_connect(igt_vkms_t *device, const char *connector_name)
+{
+	char connector_path[VKMS_CARD_OBJECT_DIR_SIZE];
+	int fd, ret;
+
+	memset(connector_path, 0x0, sizeof(connector_path));
+	snprintf(connector_path, sizeof(connector_path),
+		 "%s/connectors/%s/connected", device->device_dir, connector_name);
+
+	fd = open(connector_path, O_WRONLY);
+	igt_assert_f(fd > 0, "Unable to open '%s'\n", connector_path);
+
+	ret = write(fd, "1", 1);
+	igt_assert_f(ret >= 0, "Unable to write '%s'. Got errno=%d (%s)\n",
+		     connector_path, errno, strerror(errno));
+
+	ret = close(fd);
+	igt_assert_eq(ret, 0);
+}
+
+/**
+ * igt_vkms_connector_disconnect:
+ * @device: the vkms device in question
+ * @connector_name: the connector name as a string
+ *
+ * Mark the connector, pointed by @connector_name as disconnected.
+ * This will generate a disconnected hot-plug event.
+ */
+void igt_vkms_connector_disconnect(igt_vkms_t *device, const char *connector_name)
+{
+	char connector_path[VKMS_CARD_OBJECT_DIR_SIZE];
+	int fd, ret;
+
+	memset(connector_path, 0x0, sizeof(connector_path));
+	snprintf(connector_path, sizeof(connector_path),
+		 "%s/connectors/%s/connected", device->device_dir, connector_name);
+
+	fd = open(connector_path, O_WRONLY);
+	igt_assert_f(fd > 0, "Unable to open '%s'\n", connector_path);
+
+	ret = write(fd, "1", 1);
+	igt_assert_f(ret >= 0, "Unable to write '%s'. Got errno=%d (%s)\n",
+		     connector_path, errno, strerror(errno));
+
+	ret = close(fd);
+	igt_assert_eq(ret, 0);
+}
+
+/**
+ * igt_vkms_is_enabled:
+ * @device:
+ *
+ * This checks out if the device has been indeed enabled by checking that
+ * underlying file has the value of '1'.
+ *
+ * Returns true if the device has been enabled, or false otherwise.
+ */
+bool igt_vkms_is_enabled(igt_vkms_t *device)
+{
+	char registration_file[VKMS_CARD_OBJECT_DIR_SIZE];
+	char is_enabled[2];
+	int fd, ret = 0;
+
+	memset(registration_file, 0x0, sizeof(registration_file));
+	snprintf(registration_file, sizeof(registration_file),
+		 "%s/enabled", device->device_dir);
+
+	fd = open(registration_file, O_RDONLY);
+	igt_assert_f(fd > 0, "Unable to open '%s'\n",
+		     registration_file);
+
+	ret = read(fd, is_enabled, sizeof(is_enabled));
+	igt_assert_eq(0, close(fd));
+	if (ret < 0) {
+		return false;
+	}
+
+	return strncmp("1", is_enabled, sizeof(char)) == 0;
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
new file mode 100644
index 000000000..174039ca0
--- /dev/null
+++ b/lib/igt_vkms.h
@@ -0,0 +1,66 @@
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
+#ifndef __IGT_VKMS_H__
+#define __IGT_VKMS_H__
+
+#include <stdbool.h>
+#include <limits.h>
+
+#define VKMS_CARD_NAME_SIZE		(PATH_MAX / 4)
+#define VKMS_CARD_DIR_SIZE 		(PATH_MAX / 2)
+#define VKMS_CARD_OBJECT_DIR_SIZE	PATH_MAX
+
+
+void igt_vkms_destroy_all_devices(void);
+
+typedef struct igt_vkms {
+	char name[VKMS_CARD_NAME_SIZE];
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
+void igt_vkms_device_attach_plane_to_crtc(igt_vkms_t *device, const char *plane_name,
+					  const char *crtc_name);
+void igt_vkms_device_attach_crtc_to_encoder(igt_vkms_t *device,
+					    const char *encoder_name,
+					    const char *crtc_name);
+void igt_vkms_device_attach_encoder_to_connector(igt_vkms_t *device,
+						 const char *connector_name,
+						 const char *encoder_name);
+
+void igt_vkms_enable(igt_vkms_t *device);
+void igt_vkms_connector_connect(igt_vkms_t *device, const char *connector_name);
+void igt_vkms_connector_disconnect(igt_vkms_t *device, const char *connector_name);
+bool igt_vkms_is_enabled(igt_vkms_t *device);
+
+#endif /* __IGT_VKMS_H__ */
diff --git a/lib/meson.build b/lib/meson.build
index d727529f0..600bbcc0c 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -20,6 +20,7 @@ lib_sources = [
 	'igt_color_encoding.c',
 	'igt_crc.c',
 	'igt_configfs.c',
+	'igt_vkms.c',
 	'igt_debugfs.c',
 	'igt_device.c',
 	'igt_device_scan.c',
diff --git a/tests/meson.build b/tests/meson.build
index c683e468d..db1545fe0 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -316,6 +316,10 @@ chamelium_progs = [
 	'kms_chamelium_hpd',
 ]
 
+vkms_progs = [
+  'vkms_configfs',
+]
+
 test_deps = [ igt_deps ]
 
 if libdrm_nouveau.found()
@@ -459,6 +463,15 @@ if chamelium.found()
 		     output : name + '.testlist')
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
 subdir('amdgpu')
 
 subdir('v3d')
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
new file mode 100644
index 000000000..974753318
--- /dev/null
+++ b/tests/vkms/vkms_configfs.c
@@ -0,0 +1,83 @@
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
+static void vkms_basic_test(igt_vkms_t *device)
+{
+	igt_warn("Path: %s\n", device->device_dir);
+
+	igt_vkms_device_add_plane(device, "primary", DRM_PLANE_TYPE_PRIMARY);
+	igt_vkms_device_add_crtc(device, "crtc");
+	igt_vkms_device_add_encoder(device, "encoder");
+	igt_vkms_device_add_connector(device, "connector");
+	igt_vkms_connector_connect(device, "connector");
+
+	igt_vkms_device_attach_plane_to_crtc(device, "primary", "crtc");
+	igt_vkms_device_attach_encoder_to_connector(device, "connector", "encoder");
+	igt_vkms_device_attach_crtc_to_encoder(device, "encoder", "crtc");
+
+	igt_vkms_enable(device);
+	igt_assert(igt_vkms_is_enabled(device));
+}
+
+
+igt_main
+{
+	igt_vkms_t device;
+
+	/* By clearing out all existing devices, we don't end up with confusing
+	 * name collision errors. */
+	igt_fixture
+	{
+		igt_require_vkms();
+		igt_vkms_destroy_all_devices();
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
+	igt_fixture
+	{
+		igt_require_vkms();
+		/* avoid potential dangling directories/objects if some of the
+		 * tests failed */
+		if (strcmp(device.name, ""))
+			igt_vkms_device_destroy(&device);
+	}
+}
-- 
2.40.1
