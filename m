Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5DD10EBD3
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 20:04:14 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 27 Apr 2023 22:02:57 +0200
Message-Id: <20230427200307.240349-7-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230427200307.240349-1-zbigniew.kempczynski@intel.com>
References: <20230427200307.240349-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 06/16] lib/intel_bufops: Add Xe support
 in bufops
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
v5: add intel_buf_create_full() for future lib/igt_fb changes
    regarding region
v6: - fix igt_assert_f()
    - add buf_ops_get_driver() helper
v7: - alphabetical includes (Kamil)
    - assert if region is not valid for xe before bo create (Kamil)
    - ensure bops pointer is valid on public call (Christoph)
---
 lib/intel_bufops.c | 123 +++++++++++++++++++++++++++++++++++++++++----
 lib/intel_bufops.h |  24 ++++++++-
 2 files changed, 136 insertions(+), 11 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index cdc7a1698b..46fd981f09 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -29,6 +29,8 @@
 #include "igt.h"
 #include "igt_x86.h"
 #include "intel_bufops.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
 
 /**
  * SECTION:intel_bufops
@@ -106,6 +108,7 @@ typedef void (*bo_copy)(struct buf_ops *, struct intel_buf *, uint32_t *);
 
 struct buf_ops {
 	int fd;
+	enum intel_driver driver;
 	int gen_start;
 	int gen_end;
 	unsigned int intel_gen;
@@ -488,6 +491,9 @@ static void *mmap_write(int fd, struct intel_buf *buf)
 {
 	void *map = NULL;
 
+	if (buf->bops->driver == INTEL_DRIVER_XE)
+		return xe_bo_map(fd, buf->handle, buf->surface[0].size);
+
 	if (gem_has_lmem(fd)) {
 		/*
 		 * set/get_caching and set_domain are no longer supported on
@@ -530,6 +536,9 @@ static void *mmap_read(int fd, struct intel_buf *buf)
 {
 	void *map = NULL;
 
+	if (buf->bops->driver == INTEL_DRIVER_XE)
+		return xe_bo_map(fd, buf->handle, buf->surface[0].size);
+
 	if (gem_has_lmem(fd)) {
 		/*
 		 * set/get_caching and set_domain are no longer supported on
@@ -809,7 +818,7 @@ static void __intel_buf_init(struct buf_ops *bops,
 			     int width, int height, int bpp, int alignment,
 			     uint32_t req_tiling, uint32_t compression,
 			     uint64_t bo_size, int bo_stride,
-			     uint32_t region)
+			     uint64_t region)
 {
 	uint32_t tiling = req_tiling;
 	uint64_t size;
@@ -899,9 +908,20 @@ static void __intel_buf_init(struct buf_ops *bops,
 	buf->size = size;
 	buf->handle = handle;
 
-	if (!handle)
-		if (__gem_create_in_memory_regions(bops->fd, &buf->handle, &size, region))
-			igt_assert_eq(__gem_create(bops->fd, &size, &buf->handle), 0);
+	if (bops->driver == INTEL_DRIVER_XE)
+		igt_assert_f(region != -1, "Xe requires region awareness, "
+					   "use api which passes valid region\n");
+	buf->region = region;
+
+	if (!handle) {
+		if (bops->driver == INTEL_DRIVER_I915) {
+			if (__gem_create_in_memory_regions(bops->fd, &buf->handle, &size, region))
+				igt_assert_eq(__gem_create(bops->fd, &size, &buf->handle), 0);
+		} else {
+			size = ALIGN(size, xe_get_default_alignment(bops->fd));
+			buf->handle = xe_bo_create_flags(bops->fd, 0, size, region);
+		}
+	}
 
 	/* Store gem bo size */
 	buf->bo_size = size;
@@ -930,8 +950,12 @@ void intel_buf_init(struct buf_ops *bops,
 		    int width, int height, int bpp, int alignment,
 		    uint32_t tiling, uint32_t compression)
 {
+	uint64_t region;
+
+	region = bops->driver == INTEL_DRIVER_I915 ? I915_SYSTEM_MEMORY :
+						     system_memory(bops->fd);
 	__intel_buf_init(bops, 0, buf, width, height, bpp, alignment,
-			 tiling, compression, 0, 0, I915_SYSTEM_MEMORY);
+			 tiling, compression, 0, 0, region);
 
 	intel_buf_set_ownership(buf, true);
 }
@@ -945,7 +969,7 @@ void intel_buf_init_in_region(struct buf_ops *bops,
 			      struct intel_buf *buf,
 			      int width, int height, int bpp, int alignment,
 			      uint32_t tiling, uint32_t compression,
-			      uint32_t region)
+			      uint64_t region)
 {
 	__intel_buf_init(bops, 0, buf, width, height, bpp, alignment,
 			 tiling, compression, 0, 0, region);
@@ -1010,6 +1034,43 @@ void intel_buf_init_using_handle(struct buf_ops *bops,
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
+ * @size: real bo size
+ * @stride: bo stride
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
+			 int stride,
+			 uint64_t region)
+{
+	__intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
+			 req_tiling, compression, size, stride, region);
+}
+
 /**
  * intel_buf_create
  * @bops: pointer to buf_ops
@@ -1084,6 +1145,20 @@ struct intel_buf *intel_buf_create_using_handle_and_size(struct buf_ops *bops,
 							 uint32_t compression,
 							 uint64_t size,
 							 int stride)
+{
+	return intel_buf_create_full(bops, handle, width, height, bpp, alignment,
+				     req_tiling, compression, size, stride, -1);
+}
+
+struct intel_buf *intel_buf_create_full(struct buf_ops *bops,
+					uint32_t handle,
+					int width, int height,
+					int bpp, int alignment,
+					uint32_t req_tiling,
+					uint32_t compression,
+					uint64_t size,
+					int stride,
+					uint64_t region)
 {
 	struct intel_buf *buf;
 
@@ -1093,12 +1168,11 @@ struct intel_buf *intel_buf_create_using_handle_and_size(struct buf_ops *bops,
 	igt_assert(buf);
 
 	__intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
-			 req_tiling, compression, size, stride, -1);
+			 req_tiling, compression, size, stride, region);
 
 	return buf;
 }
 
-
 /**
  * intel_buf_destroy
  * @buf: intel_buf
@@ -1420,8 +1494,24 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
 
 	bops->fd = fd;
 	bops->intel_gen = generation;
-	igt_debug("generation: %d, supported tiles: 0x%02x\n",
-		  bops->intel_gen, bops->supported_tiles);
+	bops->driver = is_i915_device(fd) ? INTEL_DRIVER_I915 :
+					    is_xe_device(fd) ? INTEL_DRIVER_XE : 0;
+	igt_assert(bops->driver);
+	igt_debug("generation: %d, supported tiles: 0x%02x, driver: %s\n",
+		  bops->intel_gen, bops->supported_tiles,
+		  bops->driver == INTEL_DRIVER_I915 ? "i915" : "xe");
+
+	/* No tiling support in XE. */
+	if (bops->driver == INTEL_DRIVER_XE) {
+		bops->supported_hw_tiles = TILE_NONE;
+
+		bops->linear_to_x = copy_linear_to_x;
+		bops->x_to_linear = copy_x_to_linear;
+		bops->linear_to_y = copy_linear_to_y;
+		bops->y_to_linear = copy_y_to_linear;
+
+		return bops;
+	}
 
 	/*
 	 * Warning!
@@ -1569,6 +1659,19 @@ int buf_ops_get_fd(struct buf_ops *bops)
 	return bops->fd;
 }
 
+/**
+ * buf_ops_get_driver
+ * @bops: pointer to buf_ops
+ *
+ * Returns: intel driver enum value
+ */
+enum intel_driver buf_ops_get_driver(struct buf_ops *bops)
+{
+	igt_assert(bops);
+
+	return bops->driver;
+}
+
 /**
  * buf_ops_set_software_tiling
  * @bops: pointer to buf_ops
diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index 25b4307399..0037548a3b 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -43,6 +43,7 @@ struct intel_buf {
 	} addr;
 
 	uint64_t bo_size;
+	uint64_t region;
 
 	/* Tracking */
 	struct intel_bb *ibb;
@@ -109,6 +110,7 @@ struct buf_ops *buf_ops_create(int fd);
 struct buf_ops *buf_ops_create_with_selftest(int fd);
 void buf_ops_destroy(struct buf_ops *bops);
 int buf_ops_get_fd(struct buf_ops *bops);
+enum intel_driver buf_ops_get_driver(struct buf_ops *bops);
 
 bool buf_ops_set_software_tiling(struct buf_ops *bops,
 				 uint32_t tiling,
@@ -135,7 +137,7 @@ void intel_buf_init_in_region(struct buf_ops *bops,
 			      struct intel_buf *buf,
 			      int width, int height, int bpp, int alignment,
 			      uint32_t tiling, uint32_t compression,
-			      uint32_t region);
+			      uint64_t region);
 void intel_buf_close(struct buf_ops *bops, struct intel_buf *buf);
 
 void intel_buf_init_using_handle(struct buf_ops *bops,
@@ -143,6 +145,16 @@ void intel_buf_init_using_handle(struct buf_ops *bops,
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
+			 int stride,
+			 uint64_t region);
 
 struct intel_buf *intel_buf_create(struct buf_ops *bops,
 				   int width, int height,
@@ -164,6 +176,16 @@ struct intel_buf *intel_buf_create_using_handle_and_size(struct buf_ops *bops,
 							 uint32_t compression,
 							 uint64_t size,
 							 int stride);
+
+struct intel_buf *intel_buf_create_full(struct buf_ops *bops,
+					uint32_t handle,
+					int width, int height,
+					int bpp, int alignment,
+					uint32_t req_tiling,
+					uint32_t compression,
+					uint64_t size,
+					int stride,
+					uint64_t region);
 void intel_buf_destroy(struct intel_buf *buf);
 
 static inline void intel_buf_set_pxp(struct intel_buf *buf, bool new_pxp_state)
-- 
2.34.1
