Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33B410E443
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Apr 2023 15:36:22 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 17 Apr 2023 17:35:57 +0200
Message-Id: <20230417153602.104298-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230417153602.104298-1-zbigniew.kempczynski@intel.com>
References: <20230417153602.104298-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 05/10] lib/intel_bufops: Add Xe support in
 bufops
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

Extend bufops to support Xe:
 - change region to 64bit region mask,
 - add initialization helper (full) which allows passing handle,
   size and region,
 - mapping functions (read + write) selects driver specific mapping

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/intel_bufops.c | 73 ++++++++++++++++++++++++++++++++++++++++++----
 lib/intel_bufops.h | 13 ++++++++-
 2 files changed, 80 insertions(+), 6 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index cdc7a1698b..3307f30ee3 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -26,6 +26,8 @@
 #include <cairo.h>
 
 #include "i915/gem_create.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
 #include "igt.h"
 #include "igt_x86.h"
 #include "intel_bufops.h"
@@ -488,6 +490,9 @@ static void *mmap_write(int fd, struct intel_buf *buf)
 {
 	void *map = NULL;
 
+	if (is_xe_device(fd))
+		return xe_bo_map(fd, buf->handle, buf->surface[0].size);
+
 	if (gem_has_lmem(fd)) {
 		/*
 		 * set/get_caching and set_domain are no longer supported on
@@ -530,6 +535,9 @@ static void *mmap_read(int fd, struct intel_buf *buf)
 {
 	void *map = NULL;
 
+	if (is_xe_device(fd))
+		return xe_bo_map(fd, buf->handle, buf->surface[0].size);
+
 	if (gem_has_lmem(fd)) {
 		/*
 		 * set/get_caching and set_domain are no longer supported on
@@ -809,7 +817,7 @@ static void __intel_buf_init(struct buf_ops *bops,
 			     int width, int height, int bpp, int alignment,
 			     uint32_t req_tiling, uint32_t compression,
 			     uint64_t bo_size, int bo_stride,
-			     uint32_t region)
+			     uint64_t region)
 {
 	uint32_t tiling = req_tiling;
 	uint64_t size;
@@ -899,9 +907,17 @@ static void __intel_buf_init(struct buf_ops *bops,
 	buf->size = size;
 	buf->handle = handle;
 
-	if (!handle)
-		if (__gem_create_in_memory_regions(bops->fd, &buf->handle, &size, region))
-			igt_assert_eq(__gem_create(bops->fd, &size, &buf->handle), 0);
+	if (!handle) {
+		if (is_i915_device(bops->fd)) {
+			if (__gem_create_in_memory_regions(bops->fd, &buf->handle, &size, region))
+				igt_assert_eq(__gem_create(bops->fd, &size, &buf->handle), 0);
+		} else {
+			region = vram_if_possible(bops->fd, 0);
+			size = ALIGN(size, xe_get_default_alignment(bops->fd));
+			buf->handle = xe_bo_create_flags(bops->fd, 0, size, region);
+		}
+	}
+	buf->region = region;
 
 	/* Store gem bo size */
 	buf->bo_size = size;
@@ -945,7 +961,7 @@ void intel_buf_init_in_region(struct buf_ops *bops,
 			      struct intel_buf *buf,
 			      int width, int height, int bpp, int alignment,
 			      uint32_t tiling, uint32_t compression,
-			      uint32_t region)
+			      uint64_t region)
 {
 	__intel_buf_init(bops, 0, buf, width, height, bpp, alignment,
 			 tiling, compression, 0, 0, region);
@@ -1010,6 +1026,41 @@ void intel_buf_init_using_handle(struct buf_ops *bops,
 			 req_tiling, compression, 0, 0, -1);
 }
 
+/**
+ * intel_buf_init_full
+ * @bops: pointer to buf_ops
+ * @handle: BO handle created by the caller
+ * @buf: pointer to intel_buf structure to be filled
+ * @width: surface width
+ * @height: surface height
+ * @bpp: bits-per-pixel (8 / 16 / 32 / 64)
+ * @alignment: alignment of the stride for linear surfaces
+ * @req_tiling: surface tiling
+ * @compression: surface compression type
+ * @size: size
+ * @region: region
+ *
+ * Function configures BO handle within intel_buf structure passed by the caller
+ * (with all its metadata - width, height, ...). Useful if BO was created
+ * outside. Allows passing real size which caller is aware of.
+ *
+ * Note: intel_buf_close() can be used because intel_buf is aware it is not
+ * buffer owner so it won't close it underneath.
+ */
+void intel_buf_init_full(struct buf_ops *bops,
+			 uint32_t handle,
+			 struct intel_buf *buf,
+			 int width, int height,
+			 int bpp, int alignment,
+			 uint32_t req_tiling,
+			 uint32_t compression,
+			 uint64_t size,
+			 uint64_t region)
+{
+	__intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
+			 req_tiling, compression, size, 0, region);
+}
+
 /**
  * intel_buf_create
  * @bops: pointer to buf_ops
@@ -1423,6 +1474,18 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
 	igt_debug("generation: %d, supported tiles: 0x%02x\n",
 		  bops->intel_gen, bops->supported_tiles);
 
+	/* No tiling support in XE. */
+	if (is_xe_device(fd)) {
+		bops->supported_hw_tiles = TILE_NONE;
+
+		bops->linear_to_x = copy_linear_to_x;
+		bops->x_to_linear = copy_x_to_linear;
+		bops->linear_to_y = copy_linear_to_y;
+		bops->y_to_linear = copy_y_to_linear;
+
+		return bops;
+	}
+
 	/*
 	 * Warning!
 	 *
diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index 25b4307399..0b6e025ca3 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -43,6 +43,7 @@ struct intel_buf {
 	} addr;
 
 	uint64_t bo_size;
+	uint64_t region;
 
 	/* Tracking */
 	struct intel_bb *ibb;
@@ -135,7 +136,7 @@ void intel_buf_init_in_region(struct buf_ops *bops,
 			      struct intel_buf *buf,
 			      int width, int height, int bpp, int alignment,
 			      uint32_t tiling, uint32_t compression,
-			      uint32_t region);
+			      uint64_t region);
 void intel_buf_close(struct buf_ops *bops, struct intel_buf *buf);
 
 void intel_buf_init_using_handle(struct buf_ops *bops,
@@ -143,6 +144,15 @@ void intel_buf_init_using_handle(struct buf_ops *bops,
 				 struct intel_buf *buf,
 				 int width, int height, int bpp, int alignment,
 				 uint32_t req_tiling, uint32_t compression);
+void intel_buf_init_full(struct buf_ops *bops,
+			 uint32_t handle,
+			 struct intel_buf *buf,
+			 int width, int height,
+			 int bpp, int alignment,
+			 uint32_t req_tiling,
+			 uint32_t compression,
+			 uint64_t size,
+			 uint64_t region);
 
 struct intel_buf *intel_buf_create(struct buf_ops *bops,
 				   int width, int height,
@@ -164,6 +174,7 @@ struct intel_buf *intel_buf_create_using_handle_and_size(struct buf_ops *bops,
 							 uint32_t compression,
 							 uint64_t size,
 							 int stride);
+
 void intel_buf_destroy(struct intel_buf *buf);
 
 static inline void intel_buf_set_pxp(struct intel_buf *buf, bool new_pxp_state)
-- 
2.34.1
