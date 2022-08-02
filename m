Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1A88A970
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Aug 2022 21:01:07 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 n8-20020a4ad628000000b00435bf6e372dso2709078oon.13
 for <igt-dev@lists.freedesktop.org>; Tue, 02 Aug 2022 14:01:07 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: igt-dev@lists.freedesktop.org
Date: Tue,  2 Aug 2022 16:01:03 -0500
Message-Id: <20220802210103.396731-1-jason.ekstrand@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] Add a test for importing array sync_files
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jason Ekstrand <jason.ekstrand@collabora.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

As of 68129f431faa ("dma-buf: warn about containers in dma_resv object")
in the kernel, dma_resv_add_shared_fence will warn if you attempt to add
a container fence.  This test tries to trigger this warning by adding a
bunch of fences to a dma-buf, exporting a sync_file (which should
contain an array fence) and then importing that sync_file into a new
dma-buf.

Signed-off-by: Jason Ekstrand <jason.ekstrand@collabora.com>
---
 tests/dmabuf_sync_file.c | 48 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tests/dmabuf_sync_file.c b/tests/dmabuf_sync_file.c
index 2179a76d..d3d149ac 100644
--- a/tests/dmabuf_sync_file.c
+++ b/tests/dmabuf_sync_file.c
@@ -461,6 +461,48 @@ static void test_import_multiple(int fd, bool write)
 	igt_assert(!sync_file_busy(write_sync_file));
 }
 
+static void test_import_one_sync_file_multiple_fences(int fd)
+{
+	struct vgem_bo bo;
+	int i, dmabuf, sync_file;
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
+	for (i = 0; i < ARRAY_SIZE(fences); i++)
+		fences[i] = vgem_fence_attach(fd, &bo, 0);
+
+	sync_file = dmabuf_export_sync_file(dmabuf, DMA_BUF_SYNC_WRITE);
+
+	close(dmabuf);
+	gem_close(fd, bo.handle);
+
+	vgem_create(fd, &bo);
+
+	dmabuf = prime_handle_to_fd(fd, bo.handle);
+
+	dmabuf_import_sync_file(dmabuf, DMA_BUF_SYNC_WRITE, sync_file);
+
+	for (i = 0; i < ARRAY_SIZE(fences); i++) {
+		igt_assert(dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+		vgem_fence_signal(fd, fences[i]);
+	}
+
+	igt_assert(!dmabuf_busy(dmabuf, DMA_BUF_SYNC_WRITE));
+
+	close(sync_file);
+	close(dmabuf);
+	gem_close(fd, bo.handle);
+}
+
 igt_main
 {
 	int fd;
@@ -505,4 +547,10 @@ igt_main
 		     "operations.");
 	igt_subtest("import-multiple-read-write")
 		test_import_multiple(fd, true);
+
+	igt_describe("Test importing a sync file containing multiple fences. "
+		     "The core dma_resv code will warn if we try to add "
+		     "container fences directly.");
+	igt_subtest("import-sync-file-multiple-fences")
+		test_import_one_sync_file_multiple_fences(fd);
 }
-- 
2.37.1
