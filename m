Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAE910E472
 for <igt-dev@lists.freedesktop.org>; Wed, 25 May 2022 16:12:44 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-f1d5464c48so26588866fac.6
 for <igt-dev@lists.freedesktop.org>; Wed, 25 May 2022 09:12:44 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 May 2022 11:12:37 -0500
Message-Id: <20220525161237.2213204-3-jason.ekstrand@collabora.com>
In-Reply-To: <20220525161237.2213204-1-jason.ekstrand@collabora.com>
References: <20220525161237.2213204-1-jason.ekstrand@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/2] tests/dmabuf: Add tests for sync_file import
 (v5)
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jason Ekstrand <jason.ekstrand@intel.com>,
 Jason Ekstrand <jason.ekstrand@collabora.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Jason Ekstrand <jason@jlekstrand.net>

v2 (Jason Ekstrand):
 - Put the skip for igt_rwquire_sw_sync() in the subtests

v3 (Jason Ekstrand):
 - Use a separate igt_require(has_dmabuf_import_sync_file())
 - Tag as RFC because the kernel patches are RFC

v4 (Jason Ekstrand):
 - Rework the tests with the new semantics; import no longer tries to
   guarantee writes finish after reads.

v5 (Kamil Konieczny):
 - Add igt_describe() for each subtest

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Signed-off-by: Jason Ekstrand <jason.ekstrand@intel.com>
Signed-off-by: Jason Ekstrand <jason.ekstrand@collabora.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 tests/dmabuf_sync_file.c | 192 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 192 insertions(+)

diff --git a/tests/dmabuf_sync_file.c b/tests/dmabuf_sync_file.c
index 9b7e0855..27e15f7a 100644
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
@@ -71,6 +73,55 @@ static int dmabuf_export_sync_file(int dmabuf, uint32_t flags)
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
+static void dmabuf_import_sync_file(int dmabuf, uint32_t flags, int sync_fd)
+{
+	struct igt_dma_buf_sync_file arg;
+
+	arg.flags = flags;
+	arg.fd = sync_fd;
+	do_ioctl(dmabuf, IGT_DMA_BUF_IOCTL_IMPORT_SYNC_FILE, &arg);
+}
+
+static void
+dmabuf_import_timeline_fence(int dmabuf, uint32_t flags,
+			     int timeline, uint32_t seqno)
+{
+	int fence;
+
+	fence = sw_sync_timeline_create_fence(timeline, seqno);
+	dmabuf_import_sync_file(dmabuf, flags, fence);
+	close(fence);
+}
+
 static bool dmabuf_busy(int dmabuf, uint32_t flags)
 {
 	struct pollfd pfd = { .fd = dmabuf };
@@ -305,6 +356,132 @@ static void test_export_wait_after_attach(int fd)
 	gem_close(fd, bo.handle);
 }
 
+static void test_import_basic(int fd)
+{
+	struct vgem_bo bo;
+	int dmabuf, timeline;
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
+	timeline = sw_sync_timeline_create();
+
+	dmabuf_import_timeline_fence(dmabuf, DMA_BUF_SYNC_READ, timeline, 1);
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_RW));
+	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_RW));
+
+	sw_sync_timeline_inc(timeline, 1);
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_RW));
+	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_RW));
+
+	dmabuf_import_timeline_fence(dmabuf, DMA_BUF_SYNC_WRITE, timeline, 2);
+	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_RW));
+	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_RW));
+
+	sw_sync_timeline_inc(timeline, 1);
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_RW));
+	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_RW));
+
+	dmabuf_import_timeline_fence(dmabuf, DMA_BUF_SYNC_RW, timeline, 3);
+	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+	igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_RW));
+	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+	igt_assert(dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_RW));
+
+	sw_sync_timeline_inc(timeline, 1);
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_RW));
+	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+	igt_assert(!dmabuf_sync_file_busy(dmabuf, DMA_BUF_SYNC_RW));
+}
+
+static void test_import_multiple(int fd, bool write)
+{
+	struct vgem_bo bo;
+	int i, dmabuf, read_sync_file, write_sync_file;
+	int write_timeline = -1, read_timelines[32];
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
+	for (i = 0; i < ARRAY_SIZE(read_timelines); i++) {
+		read_timelines[i] = sw_sync_timeline_create();
+		dmabuf_import_timeline_fence(dmabuf, DMA_BUF_SYNC_READ,
+					     read_timelines[i], 1);
+	}
+
+	if (write) {
+		write_timeline = sw_sync_timeline_create();
+		dmabuf_import_timeline_fence(dmabuf, DMA_BUF_SYNC_WRITE,
+					     write_timeline, 1);
+	}
+
+	read_sync_file = dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_READ);
+	write_sync_file = dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_WRITE);
+
+	for (i = ARRAY_SIZE(read_timelines) - 1; i >= 0; i--) {
+		igt_assert_eq(dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ), write);
+		igt_assert_eq(sync_file_busy(read_sync_file), write);
+		igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+		igt_assert(sync_file_busy(write_sync_file));
+
+		sw_sync_timeline_inc(read_timelines[i], 1);
+	}
+
+	igt_assert_eq(dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ), write);
+	igt_assert_eq(sync_file_busy(read_sync_file), write);
+	igt_assert_eq(dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE), write);
+	igt_assert_eq(sync_file_busy(write_sync_file), write);
+
+	if (write)
+		sw_sync_timeline_inc(write_timeline, 1);
+
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_READ));
+	igt_assert(!sync_file_busy(read_sync_file));
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+	igt_assert(!sync_file_busy(write_sync_file));
+}
+
 igt_main
 {
 	int fd;
@@ -334,4 +511,19 @@ igt_main
 	igt_subtest("export-wait-after-attach")
 		test_export_wait_after_attach(fd);
 
+	igt_describe("Sanity test for importing a sync_file into a dma-buf.");
+	igt_subtest("import-basic")
+		test_import_basic(fd);
+
+	igt_describe("Test importing multiple read-only fences into a dma-buf. "
+		     "They should all block any write operations but not other "
+		     "read operations.");
+	igt_subtest("import-multiple-read-only")
+		test_import_multiple(fd, false);
+
+	igt_describe("Test importing multiple read-write fences into a "
+		     "dma-buf. They should all block any read or write "
+		     "operations.");
+	igt_subtest("import-multiple-read-write")
+		test_import_multiple(fd, true);
 }
-- 
2.36.1
