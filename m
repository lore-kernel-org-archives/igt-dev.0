Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034356E953
 for <igt-dev@lists.freedesktop.org>; Mon, 24 May 2021 20:52:34 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id v13so15228461ple.9
 for <igt-dev@lists.freedesktop.org>; Mon, 24 May 2021 13:52:33 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 24 May 2021 15:52:25 -0500
Message-Id: <20210524205225.872316-3-jason@jlekstrand.net>
In-Reply-To: <20210524205225.872316-1-jason@jlekstrand.net>
References: <20210524205225.872316-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] RFC: tests/dmabuf: Add tests for
 sync_file import (v3)
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

v2 (Jason Ekstrand):
 - Put the skip for igt_rwquire_sw_sync() in the subtests

v3 (Jason Ekstrand):
 - Use a separate igt_require(has_dmabuf_import_sync_file())
 - Tag as RFC because the kernel patches are RFC

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/dmabuf_sync_file.c | 163 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/tests/dmabuf_sync_file.c b/tests/dmabuf_sync_file.c
index afac5535..fe476885 100644
--- a/tests/dmabuf_sync_file.c
+++ b/tests/dmabuf_sync_file.c
@@ -23,6 +23,7 @@
 
 #include "igt.h"
 #include "igt_vgem.h"
+#include "sw_sync.h"
 
 #include <linux/dma-buf.h>
 #include <sys/poll.h>
@@ -35,6 +36,7 @@ struct igt_dma_buf_sync_file {
 };
 
 #define IGT_DMA_BUF_IOCTL_EXPORT_SYNC_FILE _IOWR(DMA_BUF_BASE, 2, struct igt_dma_buf_sync_file)
+#define IGT_DMA_BUF_IOCTL_IMPORT_SYNC_FILE _IOW(DMA_BUF_BASE, 3, struct igt_dma_buf_sync_file)
 
 static bool has_dmabuf_export_sync_file(int fd)
 {
@@ -71,6 +73,66 @@ static int dmabuf_export_sync_file(int dmabuf, uint32_t flags)
 	return arg.fd;
 }
 
+static bool has_dmabuf_import_sync_file(int fd)
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
+	igt_assert(ret == 0 || errno == ENOTTY);
+
+	return ret == 0;
+}
+
+static void dmabuf_import_sync_file(int dmabuf, int sync_fd)
+{
+	struct igt_dma_buf_sync_file arg;
+
+	arg.flags = DMA_BUF_SYNC_RW;
+	arg.fd = sync_fd;
+	do_ioctl(dmabuf, IGT_DMA_BUF_IOCTL_IMPORT_SYNC_FILE, &arg);
+}
+
+static void
+dmabuf_import_timeline_fence(int dmabuf, int timeline, uint32_t seqno)
+{
+	int fence;
+
+	fence = sw_sync_timeline_create_fence(timeline, seqno);
+	dmabuf_import_sync_file(dmabuf, fence);
+	close(fence);
+}
+
+static bool dmabuf_busy(int dmabuf, uint32_t flags)
+{
+	struct pollfd pfd = { .fd = dmabuf };
+
+	if (flags & DMA_BUF_SYNC_READ)
+		pfd.events |= POLLIN;
+	if (flags & DMA_BUF_SYNC_WRITE)
+		pfd.events |= POLLOUT;
+
+	return poll(&pfd, 1, 0) == 0;
+}
+
 static bool sync_file_busy(int sync_file)
 {
 	struct pollfd pfd = { .fd = sync_file, .events = POLLIN };
@@ -271,6 +333,93 @@ static void test_export_wait_after_attach(int fd)
 	gem_close(fd, bo.handle);
 }
 
+static void test_import_existing_shared(int fd, int shared_count)
+{
+	struct vgem_bo bo;
+	int i, dmabuf, timeline;
+	uint32_t fences[32];
+
+	igt_require_sw_sync();
+	igt_require(has_dmabuf_import_sync_file(fd));
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
+
+	igt_assert(shared_count <= ARRAY_SIZE(fences));
+	for (i = 0; i < shared_count; i++)
+		fences[i] = vgem_fence_attach(fd, &bo, 0);
+
+	timeline = sw_sync_timeline_create();
+	dmabuf_import_timeline_fence(dmabuf, timeline, 1);
+
+	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+
+	sw_sync_timeline_inc(timeline, 1);
+
+	for (i = shared_count - 1; i >= 0; i--) {
+		igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ));
+		igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+
+		vgem_fence_signal(fd, fences[i]);
+	}
+
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+
+	close(dmabuf);
+	gem_close(fd, bo.handle);
+}
+
+static void test_import_existing_exclusive(int fd)
+{
+	struct vgem_bo bo;
+	int dmabuf, timeline;
+	uint32_t fence;
+
+	igt_require_sw_sync();
+	igt_require(has_dmabuf_import_sync_file(fd));
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
+
+	fence = vgem_fence_attach(fd, &bo, VGEM_FENCE_WRITE);
+
+	timeline = sw_sync_timeline_create();
+	dmabuf_import_timeline_fence(dmabuf, timeline, 1);
+
+	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+
+	sw_sync_timeline_inc(timeline, 1);
+
+	/* Still busy because we should have absorbed all the old fences */
+	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+
+	vgem_fence_signal(fd, fence);
+
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+
+	close(dmabuf);
+	gem_close(fd, bo.handle);
+}
+
 igt_main
 {
 	int fd;
@@ -291,4 +440,18 @@ igt_main
 	igt_subtest_f("export-wait-after-attach")
 		test_export_wait_after_attach(fd);
 
+	igt_subtest_f("import-basic")
+		test_import_existing_shared(fd, 0);
+
+	igt_subtest_f("import-existing-shared-1")
+		test_import_existing_shared(fd, 1);
+
+	igt_subtest_f("import-existing-shared-5")
+		test_import_existing_shared(fd, 5);
+
+	igt_subtest_f("import-existing-shared-32")
+		test_import_existing_shared(fd, 32);
+
+	igt_subtest_f("import-existing-exclusive")
+		test_import_existing_exclusive(fd);
 }
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
