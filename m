Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FED6E461
 for <igt-dev@lists.freedesktop.org>; Fri, 21 May 2021 19:06:52 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id d16so15586090pfn.12
 for <igt-dev@lists.freedesktop.org>; Fri, 21 May 2021 12:06:52 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 21 May 2021 14:06:41 -0500
Message-Id: <20210521190641.623110-3-jason@jlekstrand.net>
In-Reply-To: <20210521190641.623110-1-jason@jlekstrand.net>
References: <20210521190641.623110-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/dmabuf: Add tests for sync_file
 import
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

---
 tests/dmabuf_sync_file.c | 132 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/tests/dmabuf_sync_file.c b/tests/dmabuf_sync_file.c
index e7350905..cb4edea1 100644
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
 
 static bool has_dmabuf_sync_file(int fd)
 {
@@ -71,6 +73,37 @@ static int dmabuf_export_sync_file(int dmabuf, uint32_t flags)
 	return arg.fd;
 }
 
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
@@ -211,6 +244,87 @@ static void test_export_wait_after_attach(int fd)
 	gem_close(fd, bo.handle);
 }
 
+static void test_import_existing_shared(int fd, int shared_count)
+{
+	struct vgem_bo bo;
+	int i, dmabuf, timeline;
+	uint32_t fences[32];
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
@@ -229,4 +343,22 @@ igt_main
 	igt_subtest_f("export-wait-after-attach")
 		test_export_wait_after_attach(fd);
 
+	igt_subtest_group {
+		igt_require_sw_sync();
+
+		igt_subtest_f("import-basic")
+			test_import_existing_shared(fd, 0);
+
+		igt_subtest_f("import-existing-shared-1")
+			test_import_existing_shared(fd, 1);
+
+		igt_subtest_f("import-existing-shared-5")
+			test_import_existing_shared(fd, 5);
+
+		igt_subtest_f("import-existing-shared-32")
+			test_import_existing_shared(fd, 32);
+
+		igt_subtest_f("import-existing-exclusive")
+			test_import_existing_exclusive(fd);
+	}
 }
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
