Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  7 Dec 2022 16:52:47 +0000
Message-Id: <20221207165248.226867-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/2] lib/dmabuf_sync_file: move common
 stuff into lib
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

So we can use this across different tests.

v2
  - Add docs for everything (Petri)
  - Add missing copyright and fix headers slightly (Kamil)
v3:
  - Just return true/false, for the has() family of functions, instead
    of tripping up an assert() (Kamil)

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
 lib/dmabuf_sync_file.c                        | 208 ++++++++++++++++++
 lib/dmabuf_sync_file.h                        |  26 +++
 lib/meson.build                               |   1 +
 tests/dmabuf_sync_file.c                      | 133 +----------
 5 files changed, 240 insertions(+), 129 deletions(-)
 create mode 100644 lib/dmabuf_sync_file.c
 create mode 100644 lib/dmabuf_sync_file.h

diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
index 1ce842f4..102c8a89 100644
--- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
+++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
@@ -15,6 +15,7 @@
 
   <chapter>
     <title>API Reference</title>
+    <xi:include href="xml/dmabuf_sync_file.xml"/>
     <xi:include href="xml/drmtest.xml"/>
     <xi:include href="xml/igt_alsa.xml"/>
     <xi:include href="xml/igt_audio.xml"/>
diff --git a/lib/dmabuf_sync_file.c b/lib/dmabuf_sync_file.c
new file mode 100644
index 00000000..7803ec67
--- /dev/null
+++ b/lib/dmabuf_sync_file.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include "igt.h"
+#include "igt_vgem.h"
+#include "sw_sync.h"
+
+#include "dmabuf_sync_file.h"
+
+/**
+ * SECTION: dmabuf_sync_file
+ * @short_description: DMABUF importing/exporting fencing support library
+ * @title: DMABUF Sync File
+ * @include: dmabuf_sync_file.h
+ */
+
+struct igt_dma_buf_sync_file {
+	__u32 flags;
+	__s32 fd;
+};
+
+#define IGT_DMA_BUF_IOCTL_EXPORT_SYNC_FILE _IOWR(DMA_BUF_BASE, 2, struct igt_dma_buf_sync_file)
+#define IGT_DMA_BUF_IOCTL_IMPORT_SYNC_FILE _IOW(DMA_BUF_BASE, 3, struct igt_dma_buf_sync_file)
+
+/**
+ * has_dmabuf_export_sync_file:
+ * @fd: The open drm fd
+ *
+ * Check if the kernel supports exporting a sync file from dmabuf.
+ */
+bool has_dmabuf_export_sync_file(int fd)
+{
+	struct vgem_bo bo;
+	int dmabuf, ret;
+	struct igt_dma_buf_sync_file arg;
+
+	bo.width = 1;
+	bo.height = 1;
+	bo.bpp = 32;
+	vgem_create(fd, &bo);
+
+	dmabuf = prime_handle_to_fd(fd, bo.handle);
+	gem_close(fd, bo.handle);
+
+	arg.flags = DMA_BUF_SYNC_WRITE;
+	arg.fd = -1;
+
+	ret = igt_ioctl(dmabuf, IGT_DMA_BUF_IOCTL_EXPORT_SYNC_FILE, &arg);
+	close(dmabuf);
+
+	return (ret == 0 || errno == ENOTTY);
+}
+
+/**
+ * dmabuf_export_sync_file:
+ * @dmabuf: The dmabuf fd
+ * @flags: The flags to control the behaviour
+ *
+ * Take a snapshot of the current dma-resv fences in the dmabuf, and export as a
+ * syncfile. The @flags should at least specify either DMA_BUF_SYNC_WRITE or
+ * DMA_BUF_SYNC_READ, depending on if we care about the read or write fences.
+ */
+int dmabuf_export_sync_file(int dmabuf, uint32_t flags)
+{
+	struct igt_dma_buf_sync_file arg;
+
+	arg.flags = flags;
+	arg.fd = -1;
+	do_ioctl(dmabuf, IGT_DMA_BUF_IOCTL_EXPORT_SYNC_FILE, &arg);
+
+	return arg.fd;
+}
+
+/**
+ * has_dmabuf_import_sync_file:
+ * @fd: The open drm fd
+ *
+ * Check if the kernel supports importing a sync file into a dmabuf.
+ */
+bool has_dmabuf_import_sync_file(int fd)
+{
+	struct vgem_bo bo;
+	int dmabuf, timeline, fence, ret;
+	struct igt_dma_buf_sync_file arg;
+
+	bo.width = 1;
+	bo.height = 1;
+	bo.bpp = 32;
+	vgem_create(fd, &bo);
+
+	dmabuf = prime_handle_to_fd(fd, bo.handle);
+	gem_close(fd, bo.handle);
+
+	timeline = sw_sync_timeline_create();
+	fence = sw_sync_timeline_create_fence(timeline, 1);
+	sw_sync_timeline_inc(timeline, 1);
+
+	arg.flags = DMA_BUF_SYNC_RW;
+	arg.fd = fence;
+
+	ret = igt_ioctl(dmabuf, IGT_DMA_BUF_IOCTL_IMPORT_SYNC_FILE, &arg);
+	close(dmabuf);
+	close(fence);
+	return (ret == 0 || errno == ENOTTY);
+}
+
+/**
+ * dmabuf_import_sync_file:
+ * @dmabuf: The dmabuf fd
+ * @flags: The flags to control the behaviour
+ * @sync_fd: The sync file (i.e our fence) to import
+ *
+ * Import the sync file @sync_fd, into the dmabuf. The @flags should at least
+ * specify DMA_BUF_SYNC_WRITE or DMA_BUF_SYNC_READ, depending on if we are
+ * importing the @sync_fd as a read or write fence.
+ */
+void dmabuf_import_sync_file(int dmabuf, uint32_t flags, int sync_fd)
+{
+	struct igt_dma_buf_sync_file arg;
+
+	arg.flags = flags;
+	arg.fd = sync_fd;
+	do_ioctl(dmabuf, IGT_DMA_BUF_IOCTL_IMPORT_SYNC_FILE, &arg);
+}
+
+/**
+ * dmabuf_import_timeline_fence:
+ * @dmabuf: The dmabuf fd
+ * @flags: The flags to control the behaviour
+ * @timeline: The sync file timeline where the new fence is created
+ * @seqno: The sequence number to use for the fence
+ *
+ * Create a new fence as part of @timeline, and import as a sync file into the
+ * dmabuf.  The @flags should at least specify DMA_BUF_SYNC_WRITE or
+ * DMA_BUF_SYNC_READ, depending on if we are importing the new fence as a read
+ * or write fence.
+ */
+void dmabuf_import_timeline_fence(int dmabuf, uint32_t flags,
+				  int timeline, uint32_t seqno)
+{
+	int fence;
+
+	fence = sw_sync_timeline_create_fence(timeline, seqno);
+	dmabuf_import_sync_file(dmabuf, flags, fence);
+	close(fence);
+}
+
+/**
+ * dmabuf_busy:
+ * @dmabuf: The dmabuf fd
+ * @flags: The flags to control the behaviour
+ *
+ * Check if the fences in the dmabuf are still busy. The @flags should at least
+ * specify DMA_BUF_SYNC_WRITE or DMA_BUF_SYNC_READ, depending on if we are
+ * checking if the read or read fences have all signalled. Or DMA_BUF_SYNC_RW if
+ * we care about both.
+ */
+bool dmabuf_busy(int dmabuf, uint32_t flags)
+{
+	struct pollfd pfd = { .fd = dmabuf };
+
+	/* If DMA_BUF_SYNC_WRITE is set, we don't want to set POLLIN or
+	 * else poll() may return a non-zero value if there are only read
+	 * fences because POLLIN is ready even if POLLOUT isn't.
+	 */
+	if (flags & DMA_BUF_SYNC_WRITE)
+		pfd.events |= POLLOUT;
+	else if (flags & DMA_BUF_SYNC_READ)
+		pfd.events |= POLLIN;
+
+	return poll(&pfd, 1, 0) == 0;
+}
+
+/**
+ * sync_file_busy:
+ * @sync_file: The sync file to check
+ *
+ * Check if the @sync_file is still busy or not.
+ */
+bool sync_file_busy(int sync_file)
+{
+	struct pollfd pfd = { .fd = sync_file, .events = POLLIN };
+	return poll(&pfd, 1, 0) == 0;
+}
+
+/**
+ * dmabuf_sync_file_busy:
+ * @dmabuf: The dmabuf fd
+ * @flags: The flags to control the behaviour
+ *
+ * Export the current fences in @dmabuf as a sync file and check if still busy.
+ * The @flags should at least contain DMA_BUF_SYNC_WRITE or DMA_BUF_SYNC_READ,
+ * to specify which fences are to be exported from the @dmabuf and checked if
+ * busy. Or DMA_BUF_SYNC_RW if we care about both.
+ */
+bool dmabuf_sync_file_busy(int dmabuf, uint32_t flags)
+{
+	int sync_file;
+	bool busy;
+
+	sync_file = dmabuf_export_sync_file(dmabuf, flags);
+	busy = sync_file_busy(sync_file);
+	close(sync_file);
+
+	return busy;
+}
diff --git a/lib/dmabuf_sync_file.h b/lib/dmabuf_sync_file.h
new file mode 100644
index 00000000..d642ff30
--- /dev/null
+++ b/lib/dmabuf_sync_file.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef DMABUF_SYNC_FILE_H
+#define DMABUF_SYNC_FILE_H
+
+#ifdef __linux__
+#include <linux/dma-buf.h>
+#endif
+#include <sys/poll.h>
+#include <stdbool.h>
+#include <stdint.h>
+
+bool has_dmabuf_export_sync_file(int fd);
+bool has_dmabuf_import_sync_file(int fd);
+int dmabuf_export_sync_file(int dmabuf, uint32_t flags);
+void dmabuf_import_sync_file(int dmabuf, uint32_t flags, int sync_fd);
+void dmabuf_import_timeline_fence(int dmabuf, uint32_t flags,
+			     int timeline, uint32_t seqno);
+bool dmabuf_busy(int dmabuf, uint32_t flags);
+bool sync_file_busy(int sync_file);
+bool dmabuf_sync_file_busy(int dmabuf, uint32_t flags);
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index 2c6ebce7..19d9f4f2 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -1,5 +1,6 @@
 lib_sources = [
 	'drmtest.c',
+	'dmabuf_sync_file.c',
 	'huc_copy.c',
 	'i915/gem.c',
 	'i915/gem_context.c',
diff --git a/tests/dmabuf_sync_file.c b/tests/dmabuf_sync_file.c
index 2179a76d..25bb6ad7 100644
--- a/tests/dmabuf_sync_file.c
+++ b/tests/dmabuf_sync_file.c
@@ -1,140 +1,15 @@
 // SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
 
 #include "igt.h"
 #include "igt_vgem.h"
 #include "sw_sync.h"
-
-#include <linux/dma-buf.h>
-#include <sys/poll.h>
+#include "dmabuf_sync_file.h"
 
 IGT_TEST_DESCRIPTION("Tests for sync_file support in dma-buf");
 
-struct igt_dma_buf_sync_file {
-	__u32 flags;
-	__s32 fd;
-};
-
-#define IGT_DMA_BUF_IOCTL_EXPORT_SYNC_FILE _IOWR(DMA_BUF_BASE, 2, struct igt_dma_buf_sync_file)
-#define IGT_DMA_BUF_IOCTL_IMPORT_SYNC_FILE _IOW(DMA_BUF_BASE, 3, struct igt_dma_buf_sync_file)
-
-static bool has_dmabuf_export_sync_file(int fd)
-{
-	struct vgem_bo bo;
-	int dmabuf, ret;
-	struct igt_dma_buf_sync_file arg;
-
-	bo.width = 1;
-	bo.height = 1;
-	bo.bpp = 32;
-	vgem_create(fd, &bo);
-
-	dmabuf = prime_handle_to_fd(fd, bo.handle);
-	gem_close(fd, bo.handle);
-
-	arg.flags = DMA_BUF_SYNC_WRITE;
-	arg.fd = -1;
-
-	ret = igt_ioctl(dmabuf, IGT_DMA_BUF_IOCTL_EXPORT_SYNC_FILE, &arg);
-	close(dmabuf);
-	igt_assert(ret == 0 || errno == ENOTTY);
-
-	return ret == 0;
-}
-
-static int dmabuf_export_sync_file(int dmabuf, uint32_t flags)
-{
-	struct igt_dma_buf_sync_file arg;
-
-	arg.flags = flags;
-	arg.fd = -1;
-	do_ioctl(dmabuf, IGT_DMA_BUF_IOCTL_EXPORT_SYNC_FILE, &arg);
-
-	return arg.fd;
-}
-
-static bool has_dmabuf_import_sync_file(int fd)
-{
-	struct vgem_bo bo;
-	int dmabuf, timeline, fence, ret;
-	struct igt_dma_buf_sync_file arg;
-
-	bo.width = 1;
-	bo.height = 1;
-	bo.bpp = 32;
-	vgem_create(fd, &bo);
-
-	dmabuf = prime_handle_to_fd(fd, bo.handle);
-	gem_close(fd, bo.handle);
-
-	timeline = sw_sync_timeline_create();
-	fence = sw_sync_timeline_create_fence(timeline, 1);
-	sw_sync_timeline_inc(timeline, 1);
-
-	arg.flags = DMA_BUF_SYNC_RW;
-	arg.fd = fence;
-
-	ret = igt_ioctl(dmabuf, IGT_DMA_BUF_IOCTL_IMPORT_SYNC_FILE, &arg);
-	close(dmabuf);
-	close(fence);
-	igt_assert(ret == 0 || errno == ENOTTY);
-
-	return ret == 0;
-}
-
-static void dmabuf_import_sync_file(int dmabuf, uint32_t flags, int sync_fd)
-{
-	struct igt_dma_buf_sync_file arg;
-
-	arg.flags = flags;
-	arg.fd = sync_fd;
-	do_ioctl(dmabuf, IGT_DMA_BUF_IOCTL_IMPORT_SYNC_FILE, &arg);
-}
-
-static void
-dmabuf_import_timeline_fence(int dmabuf, uint32_t flags,
-			     int timeline, uint32_t seqno)
-{
-	int fence;
-
-	fence = sw_sync_timeline_create_fence(timeline, seqno);
-	dmabuf_import_sync_file(dmabuf, flags, fence);
-	close(fence);
-}
-
-static bool dmabuf_busy(int dmabuf, uint32_t flags)
-{
-	struct pollfd pfd = { .fd = dmabuf };
-
-	/* If DMA_BUF_SYNC_WRITE is set, we don't want to set POLLIN or
-	 * else poll() may return a non-zero value if there are only read
-	 * fences because POLLIN is ready even if POLLOUT isn't.
-	 */
-	if (flags & DMA_BUF_SYNC_WRITE)
-		pfd.events |= POLLOUT;
-	else if (flags & DMA_BUF_SYNC_READ)
-		pfd.events |= POLLIN;
-
-	return poll(&pfd, 1, 0) == 0;
-}
-
-static bool sync_file_busy(int sync_file)
-{
-	struct pollfd pfd = { .fd = sync_file, .events = POLLIN };
-	return poll(&pfd, 1, 0) == 0;
-}
-
-static bool dmabuf_sync_file_busy(int dmabuf, uint32_t flags)
-{
-	int sync_file;
-	bool busy;
-
-	sync_file = dmabuf_export_sync_file(dmabuf, flags);
-	busy = sync_file_busy(sync_file);
-	close(sync_file);
-
-	return busy;
-}
-
 static void test_export_basic(int fd)
 {
 	struct vgem_bo bo;
-- 
2.38.1
