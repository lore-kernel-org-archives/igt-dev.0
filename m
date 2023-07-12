Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0AD10E611
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 17:15:59 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Jul 2023 19:12:27 +0200
Message-Id: <20230712171231.290555-18-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230712171231.290555-1-zbigniew.kempczynski@intel.com>
References: <20230712171231.290555-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 17/21] lib/intel_blt: Extend blitter
 library to support xe driver
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

Use already written for i915 blitter library in xe development.
Add appropriate code paths which are unique for those drivers.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
v3: Extract common helpers for getting mapping and alignment (Karolina)
v4: Fix unwanted doc change (Karolina)
---
 lib/intel_blt.c | 233 ++++++++++++++++++++++++++++++------------------
 lib/intel_blt.h |   2 +-
 2 files changed, 149 insertions(+), 86 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 059cc53b9c..4657bb1aec 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -9,9 +9,13 @@
 #include <malloc.h>
 #include <cairo.h>
 #include "drm.h"
-#include "igt.h"
 #include "i915/gem_create.h"
+#include "igt.h"
+#include "igt_syncobj.h"
 #include "intel_blt.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_util.h"
 
 #define BITRANGE(start, end) (end - start + 1)
 #define GET_CMDS_INFO(__fd) intel_get_cmds_info(intel_get_drm_devid(__fd))
@@ -468,24 +472,40 @@ static int __special_mode(const struct blt_copy_data *blt)
 	return SM_NONE;
 }
 
-static int __memory_type(uint32_t region)
+static int __memory_type(int fd, enum intel_driver driver, uint32_t region)
 {
-	igt_assert_f(IS_DEVICE_MEMORY_REGION(region) ||
-		     IS_SYSTEM_MEMORY_REGION(region),
-		     "Invalid region: %x\n", region);
+	if (driver == INTEL_DRIVER_I915) {
+		igt_assert_f(IS_DEVICE_MEMORY_REGION(region) ||
+			     IS_SYSTEM_MEMORY_REGION(region),
+			     "Invalid region: %x\n", region);
+	} else {
+		igt_assert_f(XE_IS_VRAM_MEMORY_REGION(fd, region) ||
+			     XE_IS_SYSMEM_MEMORY_REGION(fd, region),
+			     "Invalid region: %x\n", region);
+	}
 
-	if (IS_DEVICE_MEMORY_REGION(region))
+	if (driver == INTEL_DRIVER_I915 && IS_DEVICE_MEMORY_REGION(region))
 		return TM_LOCAL_MEM;
+	else if (driver == INTEL_DRIVER_XE && XE_IS_VRAM_MEMORY_REGION(fd, region))
+		return TM_LOCAL_MEM;
+
 	return TM_SYSTEM_MEM;
 }
 
-static enum blt_aux_mode __aux_mode(const struct blt_copy_object *obj)
+static enum blt_aux_mode __aux_mode(int fd,
+				    enum intel_driver driver,
+				    const struct blt_copy_object *obj)
 {
-	if (obj->compression == COMPRESSION_ENABLED) {
+	if (driver == INTEL_DRIVER_I915 && obj->compression == COMPRESSION_ENABLED) {
 		igt_assert_f(IS_DEVICE_MEMORY_REGION(obj->region),
 			     "XY_BLOCK_COPY_BLT supports compression "
 			     "on device memory only\n");
 		return AM_AUX_CCS_E;
+	} else if (driver == INTEL_DRIVER_XE && obj->compression == COMPRESSION_ENABLED) {
+		igt_assert_f(XE_IS_VRAM_MEMORY_REGION(fd, obj->region),
+			     "XY_BLOCK_COPY_BLT supports compression "
+			     "on device memory only\n");
+		return AM_AUX_CCS_E;
 	}
 
 	return AM_AUX_NONE;
@@ -508,9 +528,9 @@ static void fill_data(struct gen12_block_copy_data *data,
 	data->dw00.length = extended_command ? 20 : 10;
 
 	if (__special_mode(blt) == SM_FULL_RESOLVE)
-		data->dw01.dst_aux_mode = __aux_mode(&blt->src);
+		data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
 	else
-		data->dw01.dst_aux_mode = __aux_mode(&blt->dst);
+		data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->dst);
 	data->dw01.dst_pitch = blt->dst.pitch - 1;
 
 	data->dw01.dst_mocs = blt->dst.mocs;
@@ -531,13 +551,13 @@ static void fill_data(struct gen12_block_copy_data *data,
 
 	data->dw06.dst_x_offset = blt->dst.x_offset;
 	data->dw06.dst_y_offset = blt->dst.y_offset;
-	data->dw06.dst_target_memory = __memory_type(blt->dst.region);
+	data->dw06.dst_target_memory = __memory_type(blt->fd, blt->driver, blt->dst.region);
 
 	data->dw07.src_x1 = blt->src.x1;
 	data->dw07.src_y1 = blt->src.y1;
 
 	data->dw08.src_pitch = blt->src.pitch - 1;
-	data->dw08.src_aux_mode = __aux_mode(&blt->src);
+	data->dw08.src_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
 	data->dw08.src_mocs = blt->src.mocs;
 	data->dw08.src_compression = blt->src.compression;
 	data->dw08.src_tiling = __block_tiling(blt->src.tiling);
@@ -550,7 +570,7 @@ static void fill_data(struct gen12_block_copy_data *data,
 
 	data->dw11.src_x_offset = blt->src.x_offset;
 	data->dw11.src_y_offset = blt->src.y_offset;
-	data->dw11.src_target_memory = __memory_type(blt->src.region);
+	data->dw11.src_target_memory = __memory_type(blt->fd, blt->driver, blt->src.region);
 }
 
 static void fill_data_ext(struct gen12_block_copy_data_ext *dext,
@@ -692,6 +712,24 @@ static void dump_bb_ext(struct gen12_block_copy_data_ext *data)
 		 data->dw21.src_array_index);
 }
 
+static uint64_t get_default_alignment(int fd, enum intel_driver driver)
+{
+	if (driver == INTEL_DRIVER_XE)
+		return xe_get_default_alignment(fd);
+
+	return gem_detect_safe_alignment(fd);
+}
+
+static void *bo_map(int fd, uint32_t handle, uint64_t size,
+		    enum intel_driver driver)
+{
+	if (driver == INTEL_DRIVER_XE)
+		return xe_bo_map(fd, handle, size);
+
+	return gem_mmap__device_coherent(fd, handle, 0, size,
+					 PROT_READ | PROT_WRITE);
+}
+
 /**
  * blt_copy_init:
  * @fd: drm fd
@@ -739,7 +777,7 @@ uint64_t emit_blt_block_copy(int fd,
 	igt_assert_f(ahnd, "block-copy supports softpin only\n");
 	igt_assert_f(blt, "block-copy requires data to do blit\n");
 
-	alignment = gem_detect_safe_alignment(fd);
+	alignment = get_default_alignment(fd, blt->driver);
 	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment)
 		     + blt->src.plane_offset;
 	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment)
@@ -748,8 +786,7 @@ uint64_t emit_blt_block_copy(int fd,
 
 	fill_data(&data, blt, src_offset, dst_offset, ext);
 
-	bb = gem_mmap__device_coherent(fd, blt->bb.handle, 0, blt->bb.size,
-				       PROT_READ | PROT_WRITE);
+	bb = bo_map(fd, blt->bb.handle, blt->bb.size, blt->driver);
 
 	igt_assert(bb_pos + sizeof(data) < blt->bb.size);
 	memcpy(bb + bb_pos, &data, sizeof(data));
@@ -812,29 +849,35 @@ int blt_block_copy(int fd,
 
 	igt_assert_f(ahnd, "block-copy supports softpin only\n");
 	igt_assert_f(blt, "block-copy requires data to do blit\n");
+	igt_assert_neq(blt->driver, 0);
 
-	alignment = gem_detect_safe_alignment(fd);
+	alignment = get_default_alignment(fd, blt->driver);
 	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment);
 	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment);
 	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
 
 	emit_blt_block_copy(fd, ahnd, blt, ext, 0, true);
 
-	obj[0].offset = CANONICAL(dst_offset);
-	obj[1].offset = CANONICAL(src_offset);
-	obj[2].offset = CANONICAL(bb_offset);
-	obj[0].handle = blt->dst.handle;
-	obj[1].handle = blt->src.handle;
-	obj[2].handle = blt->bb.handle;
-	obj[0].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE |
-		       EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
-	obj[1].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
-	obj[2].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
-	execbuf.buffer_count = 3;
-	execbuf.buffers_ptr = to_user_pointer(obj);
-	execbuf.rsvd1 = ctx ? ctx->id : 0;
-	execbuf.flags = e ? e->flags : I915_EXEC_BLT;
-	ret = __gem_execbuf(fd, &execbuf);
+	if (blt->driver == INTEL_DRIVER_XE) {
+		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
+	} else {
+		obj[0].offset = CANONICAL(dst_offset);
+		obj[1].offset = CANONICAL(src_offset);
+		obj[2].offset = CANONICAL(bb_offset);
+		obj[0].handle = blt->dst.handle;
+		obj[1].handle = blt->src.handle;
+		obj[2].handle = blt->bb.handle;
+		obj[0].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE |
+				EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		obj[1].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		obj[2].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		execbuf.buffer_count = 3;
+		execbuf.buffers_ptr = to_user_pointer(obj);
+		execbuf.rsvd1 = ctx ? ctx->id : 0;
+		execbuf.flags = e ? e->flags : I915_EXEC_BLT;
+
+		ret = __gem_execbuf(fd, &execbuf);
+	}
 
 	return ret;
 }
@@ -950,7 +993,7 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 	igt_assert_f(ahnd, "ctrl-surf-copy supports softpin only\n");
 	igt_assert_f(surf, "ctrl-surf-copy requires data to do ctrl-surf-copy blit\n");
 
-	alignment = max_t(uint64_t, gem_detect_safe_alignment(fd), 1ull << 16);
+	alignment = max_t(uint64_t, get_default_alignment(fd, surf->driver), 1ull << 16);
 
 	data.dw00.client = 0x2;
 	data.dw00.opcode = 0x48;
@@ -973,8 +1016,7 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 	data.dw04.dst_address_hi = dst_offset >> 32;
 	data.dw04.dst_mocs = surf->dst.mocs;
 
-	bb = gem_mmap__device_coherent(fd, surf->bb.handle, 0, surf->bb.size,
-				       PROT_READ | PROT_WRITE);
+	bb = bo_map(fd, surf->bb.handle, surf->bb.size, surf->driver);
 
 	igt_assert(bb_pos + sizeof(data) < surf->bb.size);
 	memcpy(bb + bb_pos, &data, sizeof(data));
@@ -1026,32 +1068,37 @@ int blt_ctrl_surf_copy(int fd,
 
 	igt_assert_f(ahnd, "ctrl-surf-copy supports softpin only\n");
 	igt_assert_f(surf, "ctrl-surf-copy requires data to do ctrl-surf-copy blit\n");
+	igt_assert_neq(surf->driver, 0);
 
-	alignment = max_t(uint64_t, gem_detect_safe_alignment(fd), 1ull << 16);
+	alignment = max_t(uint64_t, get_default_alignment(fd, surf->driver), 1ull << 16);
 	src_offset = get_offset(ahnd, surf->src.handle, surf->src.size, alignment);
 	dst_offset = get_offset(ahnd, surf->dst.handle, surf->dst.size, alignment);
 	bb_offset = get_offset(ahnd, surf->bb.handle, surf->bb.size, alignment);
 
 	emit_blt_ctrl_surf_copy(fd, ahnd, surf, 0, true);
 
-	obj[0].offset = CANONICAL(dst_offset);
-	obj[1].offset = CANONICAL(src_offset);
-	obj[2].offset = CANONICAL(bb_offset);
-	obj[0].handle = surf->dst.handle;
-	obj[1].handle = surf->src.handle;
-	obj[2].handle = surf->bb.handle;
-	obj[0].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE |
-		       EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
-	obj[1].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
-	obj[2].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
-	execbuf.buffer_count = 3;
-	execbuf.buffers_ptr = to_user_pointer(obj);
-	execbuf.flags = e ? e->flags : I915_EXEC_BLT;
-	execbuf.rsvd1 = ctx ? ctx->id : 0;
-	gem_execbuf(fd, &execbuf);
-	put_offset(ahnd, surf->dst.handle);
-	put_offset(ahnd, surf->src.handle);
-	put_offset(ahnd, surf->bb.handle);
+	if (surf->driver == INTEL_DRIVER_XE) {
+		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
+	} else {
+		obj[0].offset = CANONICAL(dst_offset);
+		obj[1].offset = CANONICAL(src_offset);
+		obj[2].offset = CANONICAL(bb_offset);
+		obj[0].handle = surf->dst.handle;
+		obj[1].handle = surf->src.handle;
+		obj[2].handle = surf->bb.handle;
+		obj[0].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE |
+				EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		obj[1].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		obj[2].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		execbuf.buffer_count = 3;
+		execbuf.buffers_ptr = to_user_pointer(obj);
+		execbuf.flags = e ? e->flags : I915_EXEC_BLT;
+		execbuf.rsvd1 = ctx ? ctx->id : 0;
+		gem_execbuf(fd, &execbuf);
+		put_offset(ahnd, surf->dst.handle);
+		put_offset(ahnd, surf->src.handle);
+		put_offset(ahnd, surf->bb.handle);
+	}
 
 	return 0;
 }
@@ -1208,7 +1255,7 @@ uint64_t emit_blt_fast_copy(int fd,
 	uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint32_t *bb;
 
-	alignment = gem_detect_safe_alignment(fd);
+	alignment = get_default_alignment(fd, blt->driver);
 
 	data.dw00.client = 0x2;
 	data.dw00.opcode = 0x42;
@@ -1218,8 +1265,8 @@ uint64_t emit_blt_fast_copy(int fd,
 
 	data.dw01.dst_pitch = blt->dst.pitch;
 	data.dw01.color_depth = __fast_color_depth(blt->color_depth);
-	data.dw01.dst_memory = __memory_type(blt->dst.region);
-	data.dw01.src_memory = __memory_type(blt->src.region);
+	data.dw01.dst_memory = __memory_type(blt->fd, blt->driver, blt->dst.region);
+	data.dw01.src_memory = __memory_type(blt->fd, blt->driver, blt->src.region);
 	data.dw01.dst_type_y = __new_tile_y_type(blt->dst.tiling) ? 1 : 0;
 	data.dw01.src_type_y = __new_tile_y_type(blt->src.tiling) ? 1 : 0;
 
@@ -1246,8 +1293,7 @@ uint64_t emit_blt_fast_copy(int fd,
 	data.dw08.src_address_lo = src_offset;
 	data.dw09.src_address_hi = src_offset >> 32;
 
-	bb = gem_mmap__device_coherent(fd, blt->bb.handle, 0, blt->bb.size,
-				       PROT_READ | PROT_WRITE);
+	bb = bo_map(fd, blt->bb.handle, blt->bb.size, blt->driver);
 
 	igt_assert(bb_pos + sizeof(data) < blt->bb.size);
 	memcpy(bb + bb_pos, &data, sizeof(data));
@@ -1297,32 +1343,39 @@ int blt_fast_copy(int fd,
 	uint64_t dst_offset, src_offset, bb_offset, alignment;
 	int ret;
 
-	alignment = gem_detect_safe_alignment(fd);
+	igt_assert_f(ahnd, "fast-copy supports softpin only\n");
+	igt_assert_f(blt, "fast-copy requires data to do fast-copy blit\n");
+	igt_assert_neq(blt->driver, 0);
 
+	alignment = get_default_alignment(fd, blt->driver);
 	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment);
 	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment);
 	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
 
 	emit_blt_fast_copy(fd, ahnd, blt, 0, true);
 
-	obj[0].offset = CANONICAL(dst_offset);
-	obj[1].offset = CANONICAL(src_offset);
-	obj[2].offset = CANONICAL(bb_offset);
-	obj[0].handle = blt->dst.handle;
-	obj[1].handle = blt->src.handle;
-	obj[2].handle = blt->bb.handle;
-	obj[0].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE |
-		       EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
-	obj[1].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
-	obj[2].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
-	execbuf.buffer_count = 3;
-	execbuf.buffers_ptr = to_user_pointer(obj);
-	execbuf.rsvd1 = ctx ? ctx->id : 0;
-	execbuf.flags = e ? e->flags : I915_EXEC_BLT;
-	ret = __gem_execbuf(fd, &execbuf);
-	put_offset(ahnd, blt->dst.handle);
-	put_offset(ahnd, blt->src.handle);
-	put_offset(ahnd, blt->bb.handle);
+	if (blt->driver == INTEL_DRIVER_XE) {
+		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
+	} else {
+		obj[0].offset = CANONICAL(dst_offset);
+		obj[1].offset = CANONICAL(src_offset);
+		obj[2].offset = CANONICAL(bb_offset);
+		obj[0].handle = blt->dst.handle;
+		obj[1].handle = blt->src.handle;
+		obj[2].handle = blt->bb.handle;
+		obj[0].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE |
+				EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		obj[1].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		obj[2].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		execbuf.buffer_count = 3;
+		execbuf.buffers_ptr = to_user_pointer(obj);
+		execbuf.rsvd1 = ctx ? ctx->id : 0;
+		execbuf.flags = e ? e->flags : I915_EXEC_BLT;
+		ret = __gem_execbuf(fd, &execbuf);
+		put_offset(ahnd, blt->dst.handle);
+		put_offset(ahnd, blt->src.handle);
+		put_offset(ahnd, blt->bb.handle);
+	}
 
 	return ret;
 }
@@ -1366,16 +1419,21 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
 	obj = calloc(1, sizeof(*obj));
 
 	obj->size = size;
-	igt_assert(__gem_create_in_memory_regions(blt->fd, &handle,
-						  &size, region) == 0);
+
+	if (blt->driver == INTEL_DRIVER_XE) {
+		size = ALIGN(size, xe_get_default_alignment(blt->fd));
+		handle = xe_bo_create_flags(blt->fd, 0, size, region);
+	} else {
+		igt_assert(__gem_create_in_memory_regions(blt->fd, &handle,
+							  &size, region) == 0);
+	}
 
 	blt_set_object(obj, handle, size, region, mocs, tiling,
 		       compression, compression_type);
 	blt_set_geom(obj, stride, 0, 0, width, height, 0, 0);
 
 	if (create_mapping)
-		obj->ptr = gem_mmap__device_coherent(blt->fd, handle, 0, size,
-						     PROT_READ | PROT_WRITE);
+		obj->ptr = bo_map(blt->fd, handle, size, blt->driver);
 
 	return obj;
 }
@@ -1529,14 +1587,19 @@ void blt_surface_to_png(int fd, uint32_t run_id, const char *fileid,
 	int format;
 	int stride = obj->tiling ? obj->pitch * 4 : obj->pitch;
 	char filename[FILENAME_MAX];
+	bool is_xe = is_xe_device(fd);
 
 	snprintf(filename, FILENAME_MAX-1, "%d-%s-%s-%ux%u-%s.png",
 		 run_id, fileid, blt_tiling_name(obj->tiling), width, height,
 		 obj->compression ? "compressed" : "uncompressed");
 
-	if (!map)
-		map = gem_mmap__device_coherent(fd, obj->handle, 0,
-						obj->size, PROT_READ);
+	if (!map) {
+		if (is_xe)
+			map = xe_bo_map(fd, obj->handle, obj->size);
+		else
+			map = gem_mmap__device_coherent(fd, obj->handle, 0,
+							obj->size, PROT_READ);
+	}
 	format = CAIRO_FORMAT_RGB24;
 	surface = cairo_image_surface_create_for_data(map,
 						      format, width, height,
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index 307405e6e8..b8b3d724d5 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -8,7 +8,7 @@
 
 /**
  * SECTION:intel_blt
- * @short_description: i915 blitter library
+ * @short_description: i915/xe blitter library
  * @title: Blitter library
  * @include: intel_blt.h
  *
-- 
2.34.1
