Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3FD10ECB5
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 17:04:52 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-edf3b6b0f2so7417206fac.9
 for <igt-dev@lists.freedesktop.org>; Fri, 06 May 2022 10:04:52 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 May 2022 12:04:46 -0500
Message-Id: <20220506170447.1437849-2-jason.ekstrand@collabora.com>
In-Reply-To: <20220506170447.1437849-1-jason.ekstrand@collabora.com>
References: <20220506170447.1437849-1-jason.ekstrand@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] tests/dmabuf: Add tests for sync_file export
 (v4)
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

From: Jason Ekstrand <jason@jlekstrand.net>

v2 (Jason Ekstrand):
 - Rename subtests to have "export" in the name

v3 (Jason Ekstrand):
 - Add an export-before-signal subtest

v4 (Jason Ekstrand):
 - Test both via sync_file and via poll to ensure the semantics match
   properly.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 tests/dmabuf_sync_file.c | 328 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 2 files changed, 329 insertions(+)
 create mode 100644 tests/dmabuf_sync_file.c

diff --git a/tests/dmabuf_sync_file.c b/tests/dmabuf_sync_file.c
new file mode 100644
index 00000000..7fed60f8
--- /dev/null
+++ b/tests/dmabuf_sync_file.c
@@ -0,0 +1,328 @@
+/*
+ * Copyright © 2021 Intel Corporation
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
+#include "igt_vgem.h"
+
+#include <linux/dma-buf.h>
+#include <sys/poll.h>
+
+IGT_TEST_DESCRIPTION("Tests for sync_file export from dma-buf");
+
+struct igt_dma_buf_sync_file {
+	__u32 flags;
+	__s32 fd;
+};
+
+#define IGT_DMA_BUF_IOCTL_EXPORT_SYNC_FILE _IOWR(DMA_BUF_BASE, 2, struct igt_dma_buf_sync_file)
+
+static bool has_dmabuf_export_sync_file(int fd)
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
+	igt_assert(ret == 0 || errno == ENOTTY);
+
+	return ret == 0;
+}
+
+static int dmabuf_export_sync_file(int dmabuf, uint32_t flags)
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
+static bool dmabuf_busy(int dmabuf, uint32_t flags)
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
+static bool sync_file_busy(int sync_file)
+{
+	struct pollfd pfd = { .fd = sync_file, .events = POLLIN };
+	return poll(&pfd, 1, 0) == 0;
+}
+
+static bool dmabuf_sync_file_busy(int dmabuf, uint32_t flags)
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
+
+static void test_export_basic(int fd)
+{
+	struct vgem_bo bo;
+	int dmabuf;
+	uint32_t fence;
+
+	igt_require(has_dmabuf_export_sync_file(fd));
+
+	bo.width = 1;
+	bo.height = 1;
+	bo.bpp = 32;
+	vgem_create(fd, &bo);
+
+	dmabuf = prime_handle_to_fd(fd, bo.handle);
+
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+
+	fence = vgem_fence_attach(fd, &bo, 0);
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_RW));
+	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_RW));
+
+	vgem_fence_signal(fd, fence);
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_RW));
+	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_RW));
+
+	fence = vgem_fence_attach(fd, &bo, VGEM_FENCE_WRITE);
+	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_RW));
+	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_RW));
+
+	vgem_fence_signal(fd, fence);
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_RW));
+	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_RW));
+
+	close(dmabuf);
+	gem_close(fd, bo.handle);
+}
+
+static void test_export_before_signal(int fd)
+{
+	struct vgem_bo bo;
+	int dmabuf, read_fd, write_fd;
+	uint32_t fence;
+
+	igt_require(has_dmabuf_export_sync_file(fd));
+
+	bo.width = 1;
+	bo.height = 1;
+	bo.bpp = 32;
+	vgem_create(fd, &bo);
+
+	dmabuf = prime_handle_to_fd(fd, bo.handle);
+
+	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+
+	fence = vgem_fence_attach(fd, &bo, 0);
+
+	read_fd = dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_READ);
+	write_fd = dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_WRITE);
+
+	igt_assert(!sync_file_busy(read_fd));
+	igt_assert(sync_file_busy(write_fd));
+
+	vgem_fence_signal(fd, fence);
+
+	igt_assert(!sync_file_busy(read_fd));
+	igt_assert(!sync_file_busy(write_fd));
+
+	close(read_fd);
+	close(write_fd);
+
+	fence = vgem_fence_attach(fd, &bo, VGEM_FENCE_WRITE);
+
+	read_fd = dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_READ);
+	write_fd = dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_WRITE);
+
+	igt_assert(sync_file_busy(read_fd));
+	igt_assert(sync_file_busy(write_fd));
+
+	vgem_fence_signal(fd, fence);
+
+	igt_assert(!sync_file_busy(read_fd));
+	igt_assert(!sync_file_busy(write_fd));
+
+	close(read_fd);
+	close(write_fd);
+
+	close(dmabuf);
+	gem_close(fd, bo.handle);
+}
+
+static void test_export_multiwait(int fd)
+{
+	struct vgem_bo bo;
+	int dmabuf, sync_file;
+	uint32_t fence1, fence2, fence3;
+
+	igt_require(has_dmabuf_export_sync_file(fd));
+
+	bo.width = 1;
+	bo.height = 1;
+	bo.bpp = 32;
+	vgem_create(fd, &bo);
+
+	dmabuf = prime_handle_to_fd(fd, bo.handle);
+
+	fence1 = vgem_fence_attach(fd, &bo, 0);
+	fence2 = vgem_fence_attach(fd, &bo, 0);
+
+	sync_file = dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_WRITE);
+
+	fence3 = vgem_fence_attach(fd, &bo, 0);
+
+	igt_assert(sync_file_busy(sync_file));
+
+	vgem_fence_signal(fd, fence1);
+
+	igt_assert(sync_file_busy(sync_file));
+
+	vgem_fence_signal(fd, fence2);
+
+	igt_assert(!sync_file_busy(sync_file));
+
+	vgem_fence_signal(fd, fence3);
+
+	close(sync_file);
+	close(dmabuf);
+	gem_close(fd, bo.handle);
+}
+
+static void test_export_wait_after_attach(int fd)
+{
+	struct vgem_bo bo;
+	int dmabuf, read_sync_file, write_sync_file;
+	uint32_t fence1, fence2;
+
+	igt_require(has_dmabuf_export_sync_file(fd));
+
+	bo.width = 1;
+	bo.height = 1;
+	bo.bpp = 32;
+	vgem_create(fd, &bo);
+
+	dmabuf = prime_handle_to_fd(fd, bo.handle);
+
+	read_sync_file = dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_READ);
+	write_sync_file = dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_WRITE);
+
+	fence1 = vgem_fence_attach(fd, &bo, VGEM_FENCE_WRITE);
+
+	igt_assert(!sync_file_busy(read_sync_file));
+	igt_assert(!sync_file_busy(write_sync_file));
+	close(read_sync_file);
+	close(write_sync_file);
+
+	/* These wait on fence1 */
+	read_sync_file = dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_READ);
+	write_sync_file = dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_WRITE);
+
+	igt_assert(sync_file_busy(read_sync_file));
+	igt_assert(sync_file_busy(write_sync_file));
+
+	vgem_fence_signal(fd, fence1);
+	fence2 = vgem_fence_attach(fd, &bo, VGEM_FENCE_WRITE);
+
+	/* fence1 has signaled */
+	igt_assert(!sync_file_busy(read_sync_file));
+	igt_assert(!sync_file_busy(write_sync_file));
+
+	/* fence2 has not */
+	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+
+	vgem_fence_signal(fd, fence2);
+	close(read_sync_file);
+	close(write_sync_file);
+
+	close(dmabuf);
+	gem_close(fd, bo.handle);
+}
+
+igt_main
+{
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_VGEM);
+	}
+
+	igt_subtest_f("export-basic")
+		test_export_basic(fd);
+
+	igt_subtest_f("export-before-signal")
+		test_export_before_signal(fd);
+
+	igt_subtest_f("export-multiwait")
+		test_export_multiwait(fd);
+
+	igt_subtest_f("export-wait-after-attach")
+		test_export_wait_after_attach(fd);
+
+}
diff --git a/tests/meson.build b/tests/meson.build
index fb0f1e37..b548dc3b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -7,6 +7,7 @@ test_progs = [
 	'core_setmaster_vs_auth',
 	'debugfs_test',
 	'dmabuf',
+	'dmabuf_sync_file',
 	'device_reset',
 	'drm_buddy',
 	'drm_import_export',
-- 
2.36.0
