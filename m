Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EEA10E039
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jul 2023 22:33:31 +0000 (UTC)
Message-ID: <2aafc4e6-0ba7-5d78-4adb-0a0368f74792@nvidia.com>
Date: Mon, 24 Jul 2023 15:33:25 -0700
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
From: Erik Kurzinger <ekurzinger@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] tests/syncobj_sync_file: new test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Simon Ser <contact@emersion.fr>, Austin Shafer <ashafer@nvidia.com>,
 James Jones <jajones@nvidia.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This test suite exercises the new DRM_IOCTL_IMPORT/EXPORT_SYNC_FILE
ioctl introduced in [1].

[1] https://lore.kernel.org/dri-devel/5e687ad8-78ad-0350-6052-a698b278cc8c@nvidia.com/

Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
---
 include/drm-uapi/drm.h    |  11 ++
 lib/igt_syncobj.c         |  24 ++++
 lib/igt_syncobj.h         |   2 +
 tests/meson.build         |   1 +
 tests/syncobj_sync_file.c | 256 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 294 insertions(+)
 create mode 100644 tests/syncobj_sync_file.c

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index 5e54c3aa4..389dc138a 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -878,6 +878,12 @@ struct drm_syncobj_transfer {
 	__u32 pad;
 };
 
+struct drm_syncobj_sync_file {
+	__u32 handle;
+	__u32 fd;
+	__u64 point;
+};
+
 #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL (1 << 0)
 #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT (1 << 1)
 #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE (1 << 2) /* wait for time point to become available */
@@ -1090,8 +1096,13 @@ extern "C" {
 #define DRM_IOCTL_SYNCOBJ_TRANSFER	DRM_IOWR(0xCC, struct drm_syncobj_transfer)
 #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_syncobj_timeline_array)
 
+
+
 #define DRM_IOCTL_MODE_GETFB2		DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
 
+#define DRM_IOCTL_SYNCOBJ_IMPORT_SYNC_FILE	DRM_IOWR(0xD0, struct drm_syncobj_sync_file)
+#define DRM_IOCTL_SYNCOBJ_EXPORT_SYNC_FILE	DRM_IOWR(0xD1, struct drm_syncobj_sync_file)
+
 /*
  * Device specific ioctls should only be in their respective headers
  * The device specific ioctl range is from 0x40 to 0x9f.
diff --git a/lib/igt_syncobj.c b/lib/igt_syncobj.c
index a24ed10b7..ef0e297e3 100644
--- a/lib/igt_syncobj.c
+++ b/lib/igt_syncobj.c
@@ -163,6 +163,18 @@ syncobj_fd_to_handle(int fd, int syncobj_fd, uint32_t flags)
 	return args.handle;
 }
 
+int
+__syncobj_import_sync_file(int fd, struct drm_syncobj_sync_file *args)
+{
+	int err = 0;
+	if (igt_ioctl(fd, DRM_IOCTL_SYNCOBJ_IMPORT_SYNC_FILE, args)) {
+		err = -errno;
+		igt_assume(err);
+		errno = 0;
+	}
+	return err;
+}
+
 /**
  * syncobj_import_sync_file:
  * @fd: The DRM file descriptor
@@ -181,6 +193,18 @@ syncobj_import_sync_file(int fd, uint32_t handle, int sync_file)
 	igt_assert_eq(__syncobj_fd_to_handle(fd, &args), 0);
 }
 
+int
+__syncobj_export_sync_file(int fd, struct drm_syncobj_sync_file *args)
+{
+	int err = 0;
+	if (igt_ioctl(fd, DRM_IOCTL_SYNCOBJ_EXPORT_SYNC_FILE, args)) {
+		err = -errno;
+		igt_assume(err);
+		errno = 0;
+	}
+	return err;
+}
+
 int
 __syncobj_wait(int fd, struct drm_syncobj_wait *args)
 {
diff --git a/lib/igt_syncobj.h b/lib/igt_syncobj.h
index e6725671d..01f5f062b 100644
--- a/lib/igt_syncobj.h
+++ b/lib/igt_syncobj.h
@@ -34,7 +34,9 @@ int __syncobj_handle_to_fd(int fd, struct drm_syncobj_handle *args);
 int __syncobj_fd_to_handle(int fd, struct drm_syncobj_handle *args);
 int syncobj_handle_to_fd(int fd, uint32_t handle, uint32_t flags);
 uint32_t syncobj_fd_to_handle(int fd, int syncobj_fd, uint32_t flags);
+int __syncobj_import_sync_file(int fd, struct drm_syncobj_sync_file *args);
 void syncobj_import_sync_file(int fd, uint32_t handle, int sync_file);
+int __syncobj_export_sync_file(int fd, struct drm_syncobj_sync_file *args);
 int __syncobj_wait(int fd, struct drm_syncobj_wait *args);
 int syncobj_wait_err(int fd, uint32_t *handles, uint32_t count,
 		     uint64_t abs_timeout_nsec, uint32_t flags);
diff --git a/tests/meson.build b/tests/meson.build
index 944a0941f..1712c31ca 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -80,6 +80,7 @@ test_progs = [
 	'syncobj_basic',
 	'syncobj_wait',
 	'syncobj_timeline',
+	'syncobj_sync_file',
 	'sw_sync',
 	'template',
 	'testdisplay',
diff --git a/tests/syncobj_sync_file.c b/tests/syncobj_sync_file.c
new file mode 100644
index 000000000..6cbcc9dcd
--- /dev/null
+++ b/tests/syncobj_sync_file.c
@@ -0,0 +1,256 @@
+/*
+ * Copyright © 2023 NVIDIA
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
+#include "igt.h"
+#include "igt_syncobj.h"
+#include "sw_sync.h"
+#include <unistd.h>
+#include <sys/ioctl.h>
+#include "drm.h"
+
+/**
+ * TEST: syncobj sync file
+ * Category: Infrastructure
+ * Description: Tests for DRM syncobj sync file import and export
+ * Feature: synchronization
+ * Functionality: semaphore
+ * Run type: FULL
+ * Sub-category: DRM
+ * Test category: GEM_Legacy
+ *
+ * SUBTEST: binary-import-export
+ * Description: Verifies importing and exporting sync files with a binary syncobj.
+ *
+ * SUBTEST: timeline-import-export
+ * Description: Verifies importing and exporting sync files with a timeline syncobj.
+ *
+ * SUBTEST: invalid-handle-import
+ * Description: Verifies that importing a sync file to an invalid syncobj fails.
+ *
+ * SUBTEST: invalid-handle-export
+ * Description: Verifies that exporting a sync file from an invalid syncobj fails.
+ *
+ * SUBTEST: invalid-fd-import
+ * Description: Verifies that importing an invalid sync file fails.
+ *
+ * SUBTEST: unsubmitted-export
+ * Description: Verifies that exporting a sync file for an unsubmitted point fails.
+ *
+ */
+
+IGT_TEST_DESCRIPTION("Tests for DRM syncobj sync file import and export");
+
+const char *test_binary_import_export_desc =
+	"Verifies importing and exporting a sync file with a binary syncobj.";
+static void
+test_binary_import_export(int fd)
+{
+	struct drm_syncobj_sync_file args = { 0 };
+	int timeline = sw_sync_timeline_create();
+
+	args.handle = syncobj_create(fd, 0);
+	args.fd = sw_sync_timeline_create_fence(timeline, 1);
+	args.point = 0;
+	igt_assert_eq(__syncobj_import_sync_file(fd, &args), 0);
+	close(args.fd);
+	args.fd = -1;
+	igt_assert_eq(__syncobj_export_sync_file(fd, &args), 0);
+
+	igt_assert(!syncobj_wait(fd, &args.handle, 1, 0, 0, NULL));
+	igt_assert_eq(sync_fence_status(args.fd), 0);
+
+	sw_sync_timeline_inc(timeline, 1);
+	igt_assert(syncobj_wait(fd, &args.handle, 1, 0, 0, NULL));
+	igt_assert_eq(sync_fence_status(args.fd), 1);
+
+	close(args.fd);
+	close(timeline);
+	syncobj_destroy(fd, args.handle);
+}
+
+const char *test_timeline_import_export_desc =
+	"Verifies importing and exporting sync files with a timeline syncobj.";
+static void
+test_timeline_import_export(int fd)
+{
+	struct drm_syncobj_sync_file args = { 0 };
+	int timeline = sw_sync_timeline_create();
+	int fence1, fence2;
+	uint64_t point1 = 1, point2 = 2;
+
+	args.handle = syncobj_create(fd, 0);
+	args.fd = sw_sync_timeline_create_fence(timeline, 1);
+	args.point = 1;
+	igt_assert_eq(__syncobj_import_sync_file(fd, &args), 0);
+	close(args.fd);
+	args.fd = -1;
+	igt_assert_eq(__syncobj_export_sync_file(fd, &args), 0);
+	fence1 = args.fd;
+
+	args.fd = sw_sync_timeline_create_fence(timeline, 2);
+	args.point = 2;
+	igt_assert_eq(__syncobj_import_sync_file(fd, &args), 0);
+	close(args.fd);
+	args.fd = -1;
+	igt_assert_eq(__syncobj_export_sync_file(fd, &args), 0);
+	fence2 = args.fd;
+
+	igt_assert(!syncobj_timeline_wait(fd, &args.handle, &point1, 1, 0, 0, NULL));
+	igt_assert_eq(sync_fence_status(fence1), 0);
+	igt_assert(!syncobj_timeline_wait(fd, &args.handle, &point2, 1, 0, 0, NULL));
+	igt_assert_eq(sync_fence_status(fence2), 0);
+
+	sw_sync_timeline_inc(timeline, 1);
+	igt_assert(syncobj_timeline_wait(fd, &args.handle, &point1, 1, 0, 0, NULL));
+	igt_assert_eq(sync_fence_status(fence1), 1);
+	igt_assert(!syncobj_timeline_wait(fd, &args.handle, &point2, 1, 0, 0, NULL));
+	igt_assert_eq(sync_fence_status(fence2), 0);
+
+	sw_sync_timeline_inc(timeline, 1);
+	igt_assert(syncobj_timeline_wait(fd, &args.handle, &point1, 1, 0, 0, NULL));
+	igt_assert_eq(sync_fence_status(fence1), 1);
+	igt_assert(syncobj_timeline_wait(fd, &args.handle, &point2, 1, 0, 0, NULL));
+	igt_assert_eq(sync_fence_status(fence2), 1);
+
+	close(fence1);
+	close(fence2);
+	close(timeline);
+	syncobj_destroy(fd, args.handle);
+}
+
+const char *test_invalid_handle_import_desc =
+	"Verifies that importing a sync file to an invalid syncobj fails.";
+static void
+test_invalid_handle_import(int fd)
+{
+	struct drm_syncobj_sync_file args = { 0 };
+	int timeline = sw_sync_timeline_create();
+
+	args.handle = 0;
+	args.point = 0;
+	args.fd = sw_sync_timeline_create_fence(timeline, 1);
+	igt_assert_eq(__syncobj_import_sync_file(fd, &args), -EINVAL);
+
+	close(args.fd);
+	close(timeline);
+}
+
+const char *test_invalid_handle_export_desc =
+	"Verifies that exporting a sync file from an invalid syncobj fails.";
+static void
+test_invalid_handle_export(int fd)
+{
+	struct drm_syncobj_sync_file args = { 0 };
+
+	args.handle = 0;
+	args.point = 0;
+	args.fd = -1;
+	igt_assert_eq(__syncobj_export_sync_file(fd, &args), -EINVAL);
+}
+
+const char *test_invalid_fd_import_desc =
+	"Verifies that importing an invalid sync file fails.";
+static void
+test_invalid_fd_import(int fd)
+{
+	struct drm_syncobj_sync_file args = { 0 };
+
+	args.handle = syncobj_create(fd, 0);
+	args.point = 0;
+	args.fd = -1;
+	igt_assert_eq(__syncobj_import_sync_file(fd, &args), -EINVAL);
+
+	syncobj_destroy(fd, args.handle);
+}
+
+const char *test_unsubmitted_export_desc =
+	"Verifies that exporting a sync file for an unsubmitted point fails.";
+static void
+test_unsubmitted_export(int fd)
+{
+	struct drm_syncobj_sync_file args = { 0 };
+
+	args.handle = syncobj_create(fd, 0);
+	args.point = 0;
+	args.fd = -1;
+	igt_assert_eq(__syncobj_export_sync_file(fd, &args), -EINVAL);
+
+	syncobj_destroy(fd, args.handle);
+}
+
+static bool has_syncobj_timeline(int fd)
+{
+	uint64_t value;
+	return drmGetCap(fd, DRM_CAP_SYNCOBJ_TIMELINE,
+			 &value) == 0 && value;
+}
+
+static bool has_syncobj_sync_file_import_export(int fd)
+{
+	struct drm_syncobj_sync_file args = { 0 };
+	args.handle = 0xffffffff;
+	/* if sync file import/export is supported this will fail with ENOENT,
+	 * otherwise it will fail with EINVAL */
+	return __syncobj_export_sync_file(fd, &args) == -ENOENT;
+}
+
+igt_main
+{
+	int fd = -1;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_ANY);
+		igt_require(has_syncobj_timeline(fd));
+		igt_require(has_syncobj_sync_file_import_export(fd));
+		igt_require_sw_sync();
+	}
+
+	igt_describe(test_binary_import_export_desc);
+	igt_subtest("binary-import-export")
+		test_binary_import_export(fd);
+
+	igt_describe(test_timeline_import_export_desc);
+	igt_subtest("timeline-import-export")
+		test_timeline_import_export(fd);
+
+	igt_describe(test_invalid_handle_import_desc);
+	igt_subtest("invalid-handle-import")
+		test_invalid_handle_import(fd);
+
+	igt_describe(test_invalid_handle_export_desc);
+	igt_subtest("invalid-handle-export")
+		test_invalid_handle_export(fd);
+
+	igt_describe(test_invalid_fd_import_desc);
+	igt_subtest("invalid-fd-import")
+		test_invalid_fd_import(fd);
+
+	igt_describe(test_unsubmitted_export_desc);
+	igt_subtest("unsubmitted-export")
+		test_unsubmitted_export(fd);
+
+	igt_fixture {
+		drm_close_driver(fd);
+	}
+
+}
-- 
2.41.0

