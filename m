Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538A010E6A1
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Apr 2023 06:54:39 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 25 Apr 2023 12:19:18 +0530
Message-Id: <20230425064953.2121947-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20230425064953.2121947-1-bhanuprakash.modem@intel.com>
References: <20230425064953.2121947-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 05/40] lib/intel_bufops: Add Xe support in
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

From: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Extend bufops to support Xe:
 - change region to 64bit region mask,
 - add initialization helper (full) which allows passing handle,
   size and region,
 - mapping functions (read + write) selects driver specific mapping

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 lib/intel_bufops.c | 108 ++++++++++++++++++++++++++++++++++++++++-----
 lib/intel_bufops.h |  23 +++++++++-
 2 files changed, 120 insertions(+), 11 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index cdc7a1698..dc8552f91 100644
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
@@ -899,9 +908,18 @@ static void __intel_buf_init(struct buf_ops *bops,
 	buf->size = size;
 	buf->handle = handle;
 
-	if (!handle)
-		if (__gem_create_in_memory_regions(bops->fd, &buf->handle, &size, region))
-			igt_assert_eq(__gem_create(bops->fd, &size, &buf->handle), 0);
+	if (!handle) {
+		if (bops->driver == INTEL_DRIVER_I915) {
+			if (__gem_create_in_memory_regions(bops->fd, &buf->handle, &size, region))
+				igt_assert_eq(__gem_create(bops->fd, &size, &buf->handle), 0);
+		} else {
+			size = ALIGN(size, xe_get_default_alignment(bops->fd));
+			buf->handle = xe_bo_create_flags(bops->fd, 0, size, region);
+		}
+	}
+	buf->region = region;
+	igt_assert_f(bops->driver == INTEL_DRIVER_XE && region != -1,
+		     "Xe requires region awareness, use api which passes valid region\n");
 
 	/* Store gem bo size */
 	buf->bo_size = size;
@@ -930,8 +948,12 @@ void intel_buf_init(struct buf_ops *bops,
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
@@ -945,7 +967,7 @@ void intel_buf_init_in_region(struct buf_ops *bops,
 			      struct intel_buf *buf,
 			      int width, int height, int bpp, int alignment,
 			      uint32_t tiling, uint32_t compression,
-			      uint32_t region)
+			      uint64_t region)
 {
 	__intel_buf_init(bops, 0, buf, width, height, bpp, alignment,
 			 tiling, compression, 0, 0, region);
@@ -1010,6 +1032,43 @@ void intel_buf_init_using_handle(struct buf_ops *bops,
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
@@ -1084,6 +1143,20 @@ struct intel_buf *intel_buf_create_using_handle_and_size(struct buf_ops *bops,
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
 
@@ -1093,12 +1166,11 @@ struct intel_buf *intel_buf_create_using_handle_and_size(struct buf_ops *bops,
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
@@ -1420,8 +1492,24 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
 
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
diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index 25b430739..f45cd7d24 100644
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
@@ -143,6 +144,16 @@ void intel_buf_init_using_handle(struct buf_ops *bops,
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
@@ -164,6 +175,16 @@ struct intel_buf *intel_buf_create_using_handle_and_size(struct buf_ops *bops,
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
2.40.0
