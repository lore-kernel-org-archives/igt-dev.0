Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A643A10E506
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Oct 2023 14:41:57 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 19 Oct 2023 15:41:00 +0100
Message-ID: <20231019144106.560624-10-matthew.auld@intel.com>
In-Reply-To: <20231019144106.560624-1-matthew.auld@intel.com>
References: <20231019144106.560624-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 09/15] lib/intel_buf: support pat_index
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

Some users need to able select their own pat_index. Some display tests
use igt_draw which in turn uses intel_batchbuffer and intel_buf.  We
also have a couple more display tests directly using these interfaces
directly. Idea is to select wt/uc for anything display related, but also
allow any test to select a pat_index for a given intel_buf.

v2: (Zbigniew):
  - Add some macro helpers for decoding pat_index and range in rsvd1 (Zbigniew):
  - Rather use uc than wt. On xe2+ wt uses compression so CPU access
    might not work as expected, so for now just use uc.
v3:
  - Drop pat_index from reserve_if_not_allocated.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_draw.c            |  7 ++++-
 lib/igt_fb.c              |  3 ++-
 lib/intel_batchbuffer.c   | 54 ++++++++++++++++++++++++++++++---------
 lib/intel_bufops.c        | 29 ++++++++++++++-------
 lib/intel_bufops.h        |  9 +++++--
 tests/intel/kms_big_fb.c  |  4 ++-
 tests/intel/kms_dirtyfb.c |  7 +++--
 tests/intel/kms_psr.c     |  4 ++-
 tests/intel/xe_intel_bb.c |  3 ++-
 9 files changed, 90 insertions(+), 30 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 1cf9d87c9..efd3a2436 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -31,6 +31,7 @@
 #include "intel_batchbuffer.h"
 #include "intel_chipset.h"
 #include "intel_mocs.h"
+#include "intel_pat.h"
 #include "igt_core.h"
 #include "igt_fb.h"
 #include "ioctl_wrappers.h"
@@ -75,6 +76,7 @@ struct buf_data {
 	uint32_t size;
 	uint32_t stride;
 	int bpp;
+	uint8_t pat_index;
 };
 
 struct rect {
@@ -658,7 +660,8 @@ static struct intel_buf *create_buf(int fd, struct buf_ops *bops,
 				    width, height, from->bpp, 0,
 				    tiling, 0,
 				    size, 0,
-				    region);
+				    region,
+				    from->pat_index);
 
 	/* Make sure we close handle on destroy path */
 	intel_buf_set_ownership(buf, true);
@@ -791,6 +794,7 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
 	igt_skip_on(!rendercopy);
 
 	/* We create a temporary buffer and copy from it using rendercopy. */
+	tmp.pat_index = buf->pat_index;
 	tmp.size = rect->w * rect->h * pixel_size;
 	if (is_i915_device(fd))
 		tmp.handle = gem_create(fd, tmp.size);
@@ -858,6 +862,7 @@ void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
 		.size = buf_size,
 		.stride = buf_stride,
 		.bpp = bpp,
+		.pat_index = intel_get_pat_idx_uc(fd),
 	};
 	struct rect rect = {
 		.x = rect_x,
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index e8f46534e..531496e7b 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2637,7 +2637,8 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 				    igt_fb_mod_to_tiling(fb->modifier),
 				    compression, fb->size,
 				    fb->strides[0],
-				    region);
+				    region,
+				    intel_get_pat_idx_uc(fd));
 	intel_buf_set_name(buf, name);
 
 	/* Make sure we close handle on destroy path */
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index df82ef5f5..ef3e3154a 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -38,6 +38,7 @@
 #include "intel_batchbuffer.h"
 #include "intel_bufops.h"
 #include "intel_chipset.h"
+#include "intel_pat.h"
 #include "media_fill.h"
 #include "media_spin.h"
 #include "sw_sync.h"
@@ -825,15 +826,18 @@ static void __reallocate_objects(struct intel_bb *ibb)
 static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
 					     uint32_t handle,
 					     uint64_t size,
-					     uint32_t alignment)
+					     uint32_t alignment,
+					     uint8_t pat_index)
 {
 	uint64_t offset;
 
 	if (ibb->enforce_relocs)
 		return 0;
 
-	offset = intel_allocator_alloc(ibb->allocator_handle,
-				       handle, size, alignment);
+	offset = __intel_allocator_alloc(ibb->allocator_handle, handle,
+					 size, alignment, pat_index,
+					 ALLOC_STRATEGY_NONE);
+	igt_assert(offset != ALLOC_INVALID_ADDRESS);
 
 	return offset;
 }
@@ -1280,6 +1284,10 @@ void intel_bb_destroy(struct intel_bb *ibb)
 	free(ibb);
 }
 
+#define SZ_4K	0x1000
+#define XE_OBJ_SIZE(rsvd1) ((rsvd1) & ~(SZ_4K-1))
+#define XE_OBJ_PAT_IDX(rsvd1) ((rsvd1) & (SZ_4K-1))
+
 static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct intel_bb *ibb,
 						   uint32_t op, uint32_t flags,
 						   uint32_t region)
@@ -1302,11 +1310,14 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct intel_bb *ibb,
 		ops->flags = flags;
 		ops->obj_offset = 0;
 		ops->addr = objects[i]->offset;
-		ops->range = objects[i]->rsvd1;
+		ops->range = XE_OBJ_SIZE(objects[i]->rsvd1);
 		ops->region = region;
+		if (set_obj)
+			ops->pat_index = XE_OBJ_PAT_IDX(objects[i]->rsvd1);
 
-		igt_debug("  [%d]: handle: %u, offset: %llx, size: %llx\n",
-			  i, ops->obj, (long long)ops->addr, (long long)ops->range);
+		igt_debug("  [%d]: handle: %u, offset: %llx, size: %llx pat_index: %u\n",
+			  i, ops->obj, (long long)ops->addr, (long long)ops->range,
+			  ops->pat_index);
 	}
 
 	return bind_ops;
@@ -1412,7 +1423,8 @@ void intel_bb_reset(struct intel_bb *ibb, bool purge_objects_cache)
 		ibb->batch_offset = __intel_bb_get_offset(ibb,
 							  ibb->handle,
 							  ibb->size,
-							  ibb->alignment);
+							  ibb->alignment,
+							  DEFAULT_PAT_INDEX);
 
 	intel_bb_add_object(ibb, ibb->handle, ibb->size,
 			    ibb->batch_offset,
@@ -1648,7 +1660,8 @@ static void __remove_from_objects(struct intel_bb *ibb,
  */
 static struct drm_i915_gem_exec_object2 *
 __intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
-		      uint64_t offset, uint64_t alignment, bool write)
+		      uint64_t offset, uint64_t alignment, uint8_t pat_index,
+		      bool write)
 {
 	struct drm_i915_gem_exec_object2 *object;
 
@@ -1664,6 +1677,9 @@ __intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
 	object = __add_to_cache(ibb, handle);
 	__add_to_objects(ibb, object);
 
+	if (pat_index == DEFAULT_PAT_INDEX)
+		pat_index = intel_get_pat_idx_wb(ibb->fd);
+
 	/*
 	 * If object->offset == INVALID_ADDRESS we added freshly object to the
 	 * cache. In that case we have two choices:
@@ -1673,7 +1689,7 @@ __intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
 	if (INVALID_ADDR(object->offset)) {
 		if (INVALID_ADDR(offset)) {
 			offset = __intel_bb_get_offset(ibb, handle, size,
-						       alignment);
+						       alignment, pat_index);
 		} else {
 			offset = offset & (ibb->gtt_size - 1);
 
@@ -1724,6 +1740,18 @@ __intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
 	if (ibb->driver == INTEL_DRIVER_XE) {
 		object->alignment = alignment;
 		object->rsvd1 = size;
+		igt_assert(!XE_OBJ_PAT_IDX(object->rsvd1));
+
+		if (pat_index == DEFAULT_PAT_INDEX)
+			pat_index = intel_get_pat_idx_wb(ibb->fd);
+
+		/*
+		 * XXX: For now encode the pat_index in the first few bits of
+		 * rsvd1. intel_batchbuffer should really stop using the i915
+		 * drm_i915_gem_exec_object2 to encode VMA placement
+		 * information on xe...
+		 */
+		object->rsvd1 |= pat_index;
 	}
 
 	return object;
@@ -1736,7 +1764,7 @@ intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
 	struct drm_i915_gem_exec_object2 *obj = NULL;
 
 	obj = __intel_bb_add_object(ibb, handle, size, offset,
-				    alignment, write);
+				    alignment, DEFAULT_PAT_INDEX, write);
 	igt_assert(obj);
 
 	return obj;
@@ -1798,8 +1826,10 @@ __intel_bb_add_intel_buf(struct intel_bb *ibb, struct intel_buf *buf,
 		}
 	}
 
-	obj = intel_bb_add_object(ibb, buf->handle, intel_buf_bo_size(buf),
-				  buf->addr.offset, alignment, write);
+	obj = __intel_bb_add_object(ibb, buf->handle, intel_buf_bo_size(buf),
+				    buf->addr.offset, alignment, buf->pat_index,
+				    write);
+	igt_assert(obj);
 	buf->addr.offset = obj->offset;
 
 	if (igt_list_empty(&buf->link)) {
diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 2c91adb88..fbee4748e 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -29,6 +29,7 @@
 #include "igt.h"
 #include "igt_x86.h"
 #include "intel_bufops.h"
+#include "intel_pat.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
@@ -818,7 +819,7 @@ static void __intel_buf_init(struct buf_ops *bops,
 			     int width, int height, int bpp, int alignment,
 			     uint32_t req_tiling, uint32_t compression,
 			     uint64_t bo_size, int bo_stride,
-			     uint64_t region)
+			     uint64_t region, uint8_t pat_index)
 {
 	uint32_t tiling = req_tiling;
 	uint64_t size;
@@ -839,6 +840,10 @@ static void __intel_buf_init(struct buf_ops *bops,
 	IGT_INIT_LIST_HEAD(&buf->link);
 	buf->mocs = INTEL_BUF_MOCS_DEFAULT;
 
+	if (pat_index == DEFAULT_PAT_INDEX)
+		pat_index = intel_get_pat_idx_wb(bops->fd);
+	buf->pat_index = pat_index;
+
 	if (compression) {
 		igt_require(bops->intel_gen >= 9);
 		igt_assert(req_tiling == I915_TILING_Y ||
@@ -957,7 +962,7 @@ void intel_buf_init(struct buf_ops *bops,
 	region = bops->driver == INTEL_DRIVER_I915 ? I915_SYSTEM_MEMORY :
 						     system_memory(bops->fd);
 	__intel_buf_init(bops, 0, buf, width, height, bpp, alignment,
-			 tiling, compression, 0, 0, region);
+			 tiling, compression, 0, 0, region, DEFAULT_PAT_INDEX);
 
 	intel_buf_set_ownership(buf, true);
 }
@@ -974,7 +979,7 @@ void intel_buf_init_in_region(struct buf_ops *bops,
 			      uint64_t region)
 {
 	__intel_buf_init(bops, 0, buf, width, height, bpp, alignment,
-			 tiling, compression, 0, 0, region);
+			 tiling, compression, 0, 0, region, DEFAULT_PAT_INDEX);
 
 	intel_buf_set_ownership(buf, true);
 }
@@ -1033,7 +1038,7 @@ void intel_buf_init_using_handle(struct buf_ops *bops,
 				 uint32_t req_tiling, uint32_t compression)
 {
 	__intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
-			 req_tiling, compression, 0, 0, -1);
+			 req_tiling, compression, 0, 0, -1, DEFAULT_PAT_INDEX);
 }
 
 /**
@@ -1050,6 +1055,7 @@ void intel_buf_init_using_handle(struct buf_ops *bops,
  * @size: real bo size
  * @stride: bo stride
  * @region: region
+ * @pat_index: pat_index to use for the binding (only used on xe)
  *
  * Function configures BO handle within intel_buf structure passed by the caller
  * (with all its metadata - width, height, ...). Useful if BO was created
@@ -1067,10 +1073,12 @@ void intel_buf_init_full(struct buf_ops *bops,
 			 uint32_t compression,
 			 uint64_t size,
 			 int stride,
-			 uint64_t region)
+			 uint64_t region,
+			 uint8_t pat_index)
 {
 	__intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
-			 req_tiling, compression, size, stride, region);
+			 req_tiling, compression, size, stride, region,
+			 pat_index);
 }
 
 /**
@@ -1149,7 +1157,8 @@ struct intel_buf *intel_buf_create_using_handle_and_size(struct buf_ops *bops,
 							 int stride)
 {
 	return intel_buf_create_full(bops, handle, width, height, bpp, alignment,
-				     req_tiling, compression, size, stride, -1);
+				     req_tiling, compression, size, stride, -1,
+				     DEFAULT_PAT_INDEX);
 }
 
 struct intel_buf *intel_buf_create_full(struct buf_ops *bops,
@@ -1160,7 +1169,8 @@ struct intel_buf *intel_buf_create_full(struct buf_ops *bops,
 					uint32_t compression,
 					uint64_t size,
 					int stride,
-					uint64_t region)
+					uint64_t region,
+					uint8_t pat_index)
 {
 	struct intel_buf *buf;
 
@@ -1170,7 +1180,8 @@ struct intel_buf *intel_buf_create_full(struct buf_ops *bops,
 	igt_assert(buf);
 
 	__intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
-			 req_tiling, compression, size, stride, region);
+			 req_tiling, compression, size, stride, region,
+			 pat_index);
 
 	return buf;
 }
diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index 4dfe4681c..b6048402b 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -63,6 +63,9 @@ struct intel_buf {
 	/* Content Protection*/
 	bool is_protected;
 
+	/* pat_index to use for mapping this buf. Only used in Xe. */
+	uint8_t pat_index;
+
 	/* For debugging purposes */
 	char name[INTEL_BUF_NAME_MAXSIZE + 1];
 };
@@ -161,7 +164,8 @@ void intel_buf_init_full(struct buf_ops *bops,
 			 uint32_t compression,
 			 uint64_t size,
 			 int stride,
-			 uint64_t region);
+			 uint64_t region,
+			 uint8_t pat_index);
 
 struct intel_buf *intel_buf_create(struct buf_ops *bops,
 				   int width, int height,
@@ -192,7 +196,8 @@ struct intel_buf *intel_buf_create_full(struct buf_ops *bops,
 					uint32_t compression,
 					uint64_t size,
 					int stride,
-					uint64_t region);
+					uint64_t region,
+					uint8_t pat_index);
 void intel_buf_destroy(struct intel_buf *buf);
 
 static inline void intel_buf_set_pxp(struct intel_buf *buf, bool new_pxp_state)
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 2c7b24fca..64a67e34a 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -34,6 +34,7 @@
 #include <string.h>
 
 #include "i915/gem_create.h"
+#include "intel_pat.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
@@ -88,7 +89,8 @@ static struct intel_buf *init_buf(data_t *data,
 	handle = gem_open(data->drm_fd, name);
 	buf = intel_buf_create_full(data->bops, handle, width, height,
 				    bpp, 0, tiling, 0, size, 0,
-				    region);
+				    region,
+				    intel_get_pat_idx_uc(data->drm_fd));
 
 	intel_buf_set_name(buf, buf_name);
 	intel_buf_set_ownership(buf, true);
diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index cc9529178..bf9f91505 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -10,6 +10,7 @@
 
 #include "i915/intel_drrs.h"
 #include "i915/intel_fbc.h"
+#include "intel_pat.h"
 
 #include "xe/xe_query.h"
 
@@ -246,14 +247,16 @@ static void run_test(data_t *data)
 				    0,
 				    igt_fb_mod_to_tiling(data->fbs[1].modifier),
 				    0, 0, 0, is_xe_device(data->drm_fd) ?
-				    system_memory(data->drm_fd) : 0);
+				    system_memory(data->drm_fd) : 0,
+				    intel_get_pat_idx_uc(data->drm_fd));
 	dst = intel_buf_create_full(data->bops, data->fbs[2].gem_handle,
 				    data->fbs[2].width,
 				    data->fbs[2].height,
 				    igt_drm_format_to_bpp(data->fbs[2].drm_format),
 				    0, igt_fb_mod_to_tiling(data->fbs[2].modifier),
 				    0, 0, 0, is_xe_device(data->drm_fd) ?
-				    system_memory(data->drm_fd) : 0);
+				    system_memory(data->drm_fd) : 0,
+				    intel_get_pat_idx_uc(data->drm_fd));
 	ibb = intel_bb_create(data->drm_fd, PAGE_SIZE);
 
 	spin = igt_spin_new(data->drm_fd, .ahnd = ibb->allocator_handle);
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index ffecc5222..4cc41e479 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -31,6 +31,7 @@
 #include "igt.h"
 #include "igt_sysfs.h"
 #include "igt_psr.h"
+#include "intel_pat.h"
 #include <errno.h>
 #include <stdbool.h>
 #include <stdio.h>
@@ -356,7 +357,8 @@ static struct intel_buf *create_buf_from_fb(data_t *data,
 	name = gem_flink(data->drm_fd, fb->gem_handle);
 	handle = gem_open(data->drm_fd, name);
 	buf = intel_buf_create_full(data->bops, handle, width, height,
-				    bpp, 0, tiling, 0, size, stride, region);
+				    bpp, 0, tiling, 0, size, stride, region,
+				    intel_get_pat_idx_uc(data->drm_fd));
 	intel_buf_set_ownership(buf, true);
 
 	return buf;
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index 26e4dcc85..e2accb743 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -19,6 +19,7 @@
 #include "igt.h"
 #include "igt_crc.h"
 #include "intel_bufops.h"
+#include "intel_pat.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
@@ -400,7 +401,7 @@ static void create_in_region(struct buf_ops *bops, uint64_t region)
 	intel_buf_init_full(bops, handle, &buf,
 			    width/4, height, 32, 0,
 			    I915_TILING_NONE, 0,
-			    size, 0, region);
+			    size, 0, region, DEFAULT_PAT_INDEX);
 	intel_buf_set_ownership(&buf, true);
 
 	intel_bb_add_intel_buf(ibb, &buf, false);
-- 
2.41.0
