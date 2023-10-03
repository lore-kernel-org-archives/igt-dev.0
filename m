Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA0410E23C
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Oct 2023 07:35:17 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, karolina.stolarek@intel.com,
 zbigniew.kempczynski@intel.com, sai.gowtham.ch@intel.com
Date: Tue,  3 Oct 2023 13:03:43 +0530
Message-Id: <20231003073344.20470-2-sai.gowtham.ch@intel.com>
In-Reply-To: <20231003073344.20470-1-sai.gowtham.ch@intel.com>
References: <20231003073344.20470-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/intel_blt: Add wrappers to prepare
 batch buffers and submit exec
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Adding wrapper for mem-set and mem-copy instructions to prepare
batch buffers and submit exec, (blt_mem_copy, blt_mem_set,
emit_blt_mem_copy, emit,blt_set_mem)

Cc: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 lib/intel_blt.c | 195 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/intel_blt.h |  39 ++++++++++
 lib/intel_reg.h |   4 +
 3 files changed, 238 insertions(+)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index b55fa9b52..cea97c9f3 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -13,12 +13,14 @@
 #include "igt.h"
 #include "igt_syncobj.h"
 #include "intel_blt.h"
+#include "intel_mocs.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
 
 #define BITRANGE(start, end) (end - start + 1)
 #define GET_CMDS_INFO(__fd) intel_get_cmds_info(intel_get_drm_devid(__fd))
+#define MEM_COPY_MOCS_SHIFT                     25
 
 /* Blitter tiling definitions sanity checks */
 static_assert(T_LINEAR == I915_TILING_NONE, "Linear definitions have to match");
@@ -778,6 +780,14 @@ void blt_copy_init(int fd, struct blt_copy_data *blt)
 	blt->driver = get_intel_driver(fd);
 }
 
+void blt_mem_init(int fd, struct blt_mem_data *mem)
+{
+	memset(mem, 0, sizeof(*mem));
+
+	mem->fd = fd;
+	mem->driver = get_intel_driver(fd);
+}
+
 /**
  * emit_blt_block_copy:
  * @fd: drm fd
@@ -1412,6 +1422,174 @@ int blt_fast_copy(int fd,
 	return ret;
 }
 
+static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *mem, uint32_t col_size)
+{
+	uint64_t dst_offset, src_offset, alignment;
+	int i;
+	uint8_t src_mocs = intel_get_uc_mocs(fd);
+	uint8_t dst_mocs = src_mocs;
+	uint32_t *batch;
+
+	alignment = get_default_alignment(fd, mem->driver);
+	src_offset = get_offset(ahnd, mem->src.handle, mem->src.size, alignment);
+	dst_offset = get_offset(ahnd, mem->dst.handle, mem->dst.size, alignment);
+
+	batch = bo_map(fd, mem->bb.handle, mem->bb.size, mem->driver);
+
+	i = 0;
+	batch[i++] = MEM_COPY_CMD | (1 << 19);
+	batch[i++] = mem->src.width - 1;
+	batch[i++] = mem->src.height - 1;
+	batch[i++] = mem->src.pitch - 1;
+	batch[i++] = mem->dst.pitch - 1;
+	batch[i++] = src_offset;
+	batch[i++] = src_offset << 32;
+	batch[i++] = dst_offset;
+	batch[i++] = dst_offset << 32;
+	batch[i++] = src_mocs << MEM_COPY_MOCS_SHIFT | dst_mocs;
+	batch[i++] = MI_BATCH_BUFFER_END;
+	batch[i++] = MI_NOOP;
+
+	munmap(batch, mem->bb.size);
+}
+
+/**
+ * blt_mem_copy:
+ * @fd: drm fd
+ * @ctx: intel_ctx_t context
+ * @e: blitter engine for @ctx
+ * @ahnd: allocator handle
+ * @blt: blitter data for mem-copy.
+ *
+ * Function does mem blit between @src and @dst described in @blt object.
+ *
+ * Returns:
+ * execbuffer status.
+ */
+int blt_mem_copy(int fd, const intel_ctx_t *ctx,
+		 const struct intel_execution_engine2 *e,
+		 uint64_t ahnd,
+		 const struct blt_mem_data *mem,
+		 uint32_t col_size)
+{
+	struct drm_i915_gem_execbuffer2 execbuf = {};
+	struct drm_i915_gem_exec_object2 obj[3] = {};
+	uint64_t dst_offset, src_offset, bb_offset, alignment;
+	int ret;
+
+	alignment = get_default_alignment(fd, mem->driver);
+	src_offset = get_offset(ahnd, mem->src.handle, mem->src.size, alignment);
+	dst_offset = get_offset(ahnd, mem->dst.handle, mem->dst.size, alignment);
+	bb_offset = get_offset(ahnd, mem->bb.handle, mem->bb.size, alignment);
+
+	emit_blt_mem_copy(fd, ahnd, mem, col_size);
+
+	if (mem->driver == INTEL_DRIVER_XE) {
+		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
+	} else {
+		obj[0].offset = CANONICAL(dst_offset);
+		obj[1].offset = CANONICAL(src_offset);
+		obj[2].offset = CANONICAL(bb_offset);
+		obj[0].handle = mem->dst.handle;
+		obj[1].handle = mem->src.handle;
+		obj[2].handle = mem->bb.handle;
+		obj[0].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE |
+			EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		obj[1].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		obj[2].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		execbuf.buffer_count = 3;
+		execbuf.buffers_ptr = to_user_pointer(obj);
+		execbuf.rsvd1 = ctx ? ctx->id : 0;
+		execbuf.flags = e ? e->flags : I915_EXEC_BLT;
+		ret = __gem_execbuf(fd, &execbuf);
+		put_offset(ahnd, mem->dst.handle);
+		put_offset(ahnd, mem->src.handle);
+		put_offset(ahnd, mem->bb.handle);
+	}
+
+	return ret;
+}
+
+static void emit_blt_mem_set(int fd, uint64_t ahnd, const struct blt_mem_data *mem,
+			     uint8_t fill_data)
+{
+	uint64_t dst_offset, alignment;
+	int b;
+	uint32_t *batch;
+	uint32_t value;
+
+	alignment = get_default_alignment(fd, mem->driver);
+	dst_offset = get_offset(ahnd, mem->dst.handle, mem->dst.size, alignment);
+
+	batch = bo_map(fd, mem->bb.handle, mem->bb.size, mem->driver);
+	value = (uint32_t)fill_data << 24;
+
+	b = 0;
+	batch[b++] = MEM_SET_CMD;
+	batch[b++] = mem->dst.width - 1;
+	batch[b++] = mem->dst.height;
+	batch[b++] = mem->dst.pitch;
+	batch[b++] = dst_offset;
+	batch[b++] = dst_offset << 32;
+	batch[b++] = value | mem->dst.mocs;
+	batch[b++] = MI_BATCH_BUFFER_END;
+	batch[b++] = MI_NOOP;
+
+	munmap(batch, mem->bb.size);
+}
+
+/**
+ * blt_mem_set:
+ * @fd: drm fd
+ * @ctx: intel_ctx_t context
+ * @e: blitter engine for @ctx
+ * @ahnd: allocator handle
+ * @blt: blitter data for mem-set.
+ *
+ * Function does mem set blit in described @blt object.
+ *
+ * Returns:
+ * execbuffer status.
+ */
+int blt_mem_set(int fd, const intel_ctx_t *ctx,
+		const struct intel_execution_engine2 *e,
+		uint64_t ahnd,
+		const struct blt_mem_data *mem,
+		uint8_t fill_data)
+{
+	struct drm_i915_gem_execbuffer2 execbuf = {};
+	struct drm_i915_gem_exec_object2 obj[2] = {};
+	uint64_t dst_offset, bb_offset, alignment;
+	int ret;
+
+	alignment = get_default_alignment(fd, mem->driver);
+	dst_offset = get_offset(ahnd, mem->dst.handle, mem->dst.size, alignment);
+	bb_offset = get_offset(ahnd, mem->bb.handle, mem->bb.size, alignment);
+
+	emit_blt_mem_set(fd, ahnd, mem, fill_data);
+
+	if (mem->driver == INTEL_DRIVER_XE) {
+		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
+	} else {
+		obj[0].offset = CANONICAL(dst_offset);
+		obj[1].offset = CANONICAL(bb_offset);
+		obj[0].handle = mem->dst.handle;
+		obj[1].handle = mem->bb.handle;
+		obj[0].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE |
+			       EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		obj[1].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		execbuf.buffer_count = 2;
+		execbuf.buffers_ptr = to_user_pointer(obj);
+		execbuf.rsvd1 = ctx ? ctx->id : 0;
+		execbuf.flags = e ? e->flags : I915_EXEC_BLT;
+		ret = __gem_execbuf(fd, &execbuf);
+		put_offset(ahnd, mem->dst.handle);
+		put_offset(ahnd, mem->bb.handle);
+	}
+
+	return ret;
+}
+
 void blt_set_geom(struct blt_copy_object *obj, uint32_t pitch,
 		  int16_t x1, int16_t y1, int16_t x2, int16_t y2,
 		  uint16_t x_offset, uint16_t y_offset)
@@ -1494,6 +1672,23 @@ void blt_set_object(struct blt_copy_object *obj,
 	obj->compression_type = compression_type;
 }
 
+void blt_set_mem_object(struct blt_mem_object *obj,
+			uint32_t handle, uint64_t size, uint32_t pitch,
+			uint32_t width, uint32_t height, uint32_t region,
+			uint8_t mocs, enum blt_memop_type type,
+			enum blt_compression compression)
+{
+	obj->handle = handle;
+	obj->region = region;
+	obj->size = size;
+	obj->mocs = mocs;
+	obj->type = type;
+	obj->compression = compression;
+	obj->width = width;
+	obj->height = height;
+	obj->pitch = pitch;
+}
+
 void blt_set_object_ext(struct blt_block_copy_object_ext *obj,
 			uint8_t compression_format,
 			uint16_t surface_width, uint16_t surface_height,
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index d9c8883c7..d4038e9ef 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -93,6 +93,19 @@ struct blt_copy_object {
 	uint32_t plane_offset;
 };
 
+struct blt_mem_object {
+	uint32_t handle;
+	uint32_t region;
+	uint64_t size;
+	uint8_t mocs;
+	enum blt_memop_type type;
+	enum blt_compression compression;
+	uint32_t width;
+	uint32_t height;
+	uint32_t pitch;
+	uint32_t *ptr;
+};
+
 struct blt_copy_batch {
 	uint32_t handle;
 	uint32_t region;
@@ -112,6 +125,14 @@ struct blt_copy_data {
 	bool print_bb;
 };
 
+struct blt_mem_data {
+	int fd;
+	enum intel_driver driver;
+	struct blt_mem_object src;
+	struct blt_mem_object dst;
+	struct blt_copy_batch bb;
+};
+
 enum blt_surface_type {
 	SURFACE_TYPE_1D,
 	SURFACE_TYPE_2D,
@@ -190,6 +211,7 @@ bool blt_uses_extended_block_copy(int fd);
 const char *blt_tiling_name(enum blt_tiling_type tiling);
 
 void blt_copy_init(int fd, struct blt_copy_data *blt);
+void blt_mem_init(int fd, struct blt_mem_data *mem);
 
 uint64_t emit_blt_block_copy(int fd,
 			     uint64_t ahnd,
@@ -231,6 +253,16 @@ int blt_fast_copy(int fd,
 		  uint64_t ahnd,
 		  const struct blt_copy_data *blt);
 
+int blt_mem_copy(int fd, const intel_ctx_t *ctx,
+			 const struct intel_execution_engine2 *e,
+			 uint64_t ahnd,
+			 const struct blt_mem_data *mem,
+			 uint32_t col_size);
+
+int blt_mem_set(int fd, const intel_ctx_t *ctx,
+			const struct intel_execution_engine2 *e, uint64_t ahnd,
+			const struct blt_mem_data *mem, uint8_t fill_data);
+
 void blt_set_geom(struct blt_copy_object *obj, uint32_t pitch,
 		  int16_t x1, int16_t y1, int16_t x2, int16_t y2,
 		  uint16_t x_offset, uint16_t y_offset);
@@ -250,6 +282,13 @@ void blt_set_object(struct blt_copy_object *obj,
 		    uint8_t mocs, enum blt_tiling_type tiling,
 		    enum blt_compression compression,
 		    enum blt_compression_type compression_type);
+
+void blt_set_mem_object(struct blt_mem_object *obj,
+			uint32_t handle, uint64_t size, uint32_t pitch,
+			uint32_t width, uint32_t height, uint32_t region,
+			uint8_t mocs, enum blt_memop_type type,
+			enum blt_compression compression);
+
 void blt_set_object_ext(struct blt_block_copy_object_ext *obj,
 			uint8_t compression_format,
 			uint16_t surface_width, uint16_t surface_height,
diff --git a/lib/intel_reg.h b/lib/intel_reg.h
index 3bf3676dc..eb65da911 100644
--- a/lib/intel_reg.h
+++ b/lib/intel_reg.h
@@ -2586,6 +2586,10 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #define   XY_FAST_COPY_COLOR_DEPTH_64			(4  << 24)
 #define   XY_FAST_COPY_COLOR_DEPTH_128			(5  << 24)
 
+/* RAW memory commands */
+#define MEM_COPY_CMD                    ((0x2 << 29)|(0x5a << 22)|0x8)
+#define MEM_SET_CMD                     ((0x2 << 29)|(0x5b << 22)|0x5)
+
 #define CTXT_NO_RESTORE			(1)
 #define CTXT_PALETTE_SAVE_DISABLE	(1<<3)
 #define CTXT_PALETTE_RESTORE_DISABLE	(1<<2)
-- 
2.39.1
