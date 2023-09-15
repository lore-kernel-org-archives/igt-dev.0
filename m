Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B655A10E0FC
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Sep 2023 05:17:32 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 karolina.stolarek@intel.com, sai.gowtham.ch@intel.com
Date: Fri, 15 Sep 2023 10:46:16 +0530
Message-Id: <20230915051617.9361-4-sai.gowtham.ch@intel.com>
In-Reply-To: <20230915051617.9361-1-sai.gowtham.ch@intel.com>
References: <20230915051617.9361-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] lib/intel_blt: Add wrappers to prepare
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

This commit has couple of changes in it:
1. Adding wrapper for mem-set and mem-copy instructions to
   prepare batch buffers and submit exec, (blt_mem_copy, blt_set_mem,
   emit_blt_mem_copy, emit,blt_set_mem).

2. Add check to see if blt commands are supported by the platforms.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 lib/intel_blt.c | 210 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/intel_blt.h |  20 +++++
 2 files changed, 230 insertions(+)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 429511920..88ad7cae8 100644
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
@@ -289,6 +291,38 @@ bool blt_has_block_copy(int fd)
 	return blt_supports_command(cmds_info, XY_BLOCK_COPY);
 }
 
+/**
+ * blt_has_mem_copy
+ * @fd: drm fd
+ *
+ * Check if mem copy is supported by @fd device
+ *
+ * Returns:
+ * true if it does, false otherwise.
+ */
+bool blt_has_mem_copy(int fd)
+{
+	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(fd);
+
+	return blt_supports_command(cmds_info, MEM_COPY);
+}
+
+/**
+ * blt_has_mem_set
+ * @fd: drm fd
+ *
+ * Check if mem set is supported by @fd device
+ *
+ * Returns:
+ * true if it does, false otherwise.
+ */
+bool blt_has_mem_set(int fd)
+{
+	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(fd);
+
+	return blt_supports_command(cmds_info, MEM_SET);
+}
+
 /**
  * blt_has_fast_copy
  * @fd: drm fd
@@ -1380,6 +1414,182 @@ int blt_fast_copy(int fd,
 	return ret;
 }
 
+void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_copy_data *blt, uint32_t col_size)
+{
+	uint64_t dst_offset, src_offset, alignment;
+	int i;
+	uint8_t src_mocs = intel_get_uc_mocs(fd);
+	uint8_t dst_mocs = src_mocs;
+	uint32_t size;
+	struct {
+		uint32_t batch[12];
+		uint32_t data;
+	} *data;
+
+	alignment = xe_get_default_alignment(fd);
+	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment);
+	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment);
+	size = blt->src.size;
+
+	data = xe_bo_map(fd, blt->bb.handle, blt->bb.size);
+
+	i = 0;
+	data->batch[i++] = MEM_COPY_CMD;
+	data->batch[i++] = size - 1;
+	data->batch[i++] = col_size - 1;
+	data->batch[i++] = 0;
+	data->batch[i++] = 0;
+	data->batch[i++] = src_offset;
+	data->batch[i++] = src_offset << 32;
+	data->batch[i++] = dst_offset;
+	data->batch[i++] = dst_offset << 32;
+	data->batch[i++] = src_mocs << MEM_COPY_MOCS_SHIFT | dst_mocs;
+	data->batch[i++] = MI_BATCH_BUFFER_END;
+	data->batch[i++] = MI_NOOP;
+
+	igt_assert(i <= ARRAY_SIZE(data->batch));
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
+		 const struct blt_copy_data *blt,
+		 uint32_t col_size)
+{
+	struct drm_i915_gem_execbuffer2 execbuf = {};
+	struct drm_i915_gem_exec_object2 obj[3] = {};
+	uint64_t dst_offset, src_offset, bb_offset, alignment;
+	int ret;
+
+	alignment = get_default_alignment(fd, blt->driver);
+	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment);
+	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment);
+	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
+
+	emit_blt_mem_copy(fd, ahnd, blt, col_size);
+
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
+			       EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
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
+	return ret;
+}
+
+void emit_blt_set_mem(int fd, uint64_t ahnd, const struct blt_copy_data *blt,
+		      uint32_t fill_data, uint32_t height)
+{
+	uint64_t dst_offset, alignment;
+	int b;
+	uint8_t dst_mocs = intel_get_uc_mocs(fd);
+	uint32_t size;
+	struct {
+		uint32_t batch[12];
+		uint32_t data;
+	} *data;
+
+	alignment = xe_get_default_alignment(fd);
+	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment);
+	size = blt->dst.size;
+
+	data = xe_bo_map(fd, blt->dst.handle, blt->dst.size);
+
+	b = 0;
+	data->batch[b++] = MEM_SET_CMD;
+	data->batch[b++] = size - 1;
+	data->batch[b++] = height;
+	data->batch[b++] = 0;
+	data->batch[b++] = dst_offset;
+	data->batch[b++] = dst_offset << 32;
+	data->batch[b++] = (fill_data << 24) | dst_mocs;
+	data->batch[b++] = MI_BATCH_BUFFER_END;
+	data->batch[b++] = MI_NOOP;
+
+	igt_assert(b <= ARRAY_SIZE(data->batch));
+}
+
+/**
+ * blt_set_mem:
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
+int blt_set_mem(int fd, const intel_ctx_t *ctx,
+		const struct intel_execution_engine2 *e,
+		uint64_t ahnd,
+		const struct blt_copy_data *blt,
+		uint32_t height,
+		uint32_t fill_data)
+{
+	struct drm_i915_gem_execbuffer2 execbuf = {};
+	struct drm_i915_gem_exec_object2 obj[2] = {};
+	uint64_t dst_offset, bb_offset, alignment;
+	int ret;
+
+	alignment = get_default_alignment(fd, blt->driver);
+	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment);
+	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
+
+	emit_blt_set_mem(fd, ahnd, blt, fill_data, height);
+
+	if (blt->driver == INTEL_DRIVER_XE) {
+		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
+	} else {
+		obj[0].offset = CANONICAL(dst_offset);
+		obj[1].offset = CANONICAL(bb_offset);
+		obj[0].handle = blt->dst.handle;
+		obj[1].handle = blt->bb.handle;
+		obj[0].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE |
+			       EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		obj[1].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		execbuf.buffer_count = 2;
+		execbuf.buffers_ptr = to_user_pointer(obj);
+		execbuf.rsvd1 = ctx ? ctx->id : 0;
+		execbuf.flags = e ? e->flags : I915_EXEC_BLT;
+		ret = __gem_execbuf(fd, &execbuf);
+		put_offset(ahnd, blt->dst.handle);
+		put_offset(ahnd, blt->bb.handle);
+	}
+	return ret;
+}
+
 void blt_set_geom(struct blt_copy_object *obj, uint32_t pitch,
 		  int16_t x1, int16_t y1, int16_t x2, int16_t y2,
 		  uint16_t x_offset, uint16_t y_offset)
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index b8b3d724d..79edee0d5 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -175,6 +175,8 @@ bool blt_cmd_has_property(const struct intel_cmds_info *cmds_info,
 			  uint32_t prop);
 
 bool blt_has_block_copy(int fd);
+bool blt_has_mem_copy(int fd);
+bool blt_has_mem_set(int fd);
 bool blt_has_fast_copy(int fd);
 bool blt_has_xy_src_copy(int fd);
 bool blt_has_xy_color(int fd);
@@ -229,6 +231,24 @@ int blt_fast_copy(int fd,
 		  uint64_t ahnd,
 		  const struct blt_copy_data *blt);
 
+void emit_blt_mem_copy(int fd, uint64_t ahnd,
+		       const struct blt_copy_data *blt,
+		       uint32_t col_size);
+
+int blt_mem_copy(int fd, const intel_ctx_t *ctx,
+		const struct intel_execution_engine2 *e,
+		 uint64_t ahnd,
+		 const struct blt_copy_data *blt,
+		 uint32_t col_size);
+
+void emit_blt_set_mem(int fd, uint64_t ahnd, const struct blt_copy_data *blt,
+		      uint32_t fill_data, uint32_t height);
+
+int blt_set_mem(int fd, const intel_ctx_t *ctx,
+		const struct intel_execution_engine2 *e, uint64_t ahnd,
+		const struct blt_copy_data *blt, uint32_t height,
+		uint32_t fill_data);
+
 void blt_set_geom(struct blt_copy_object *obj, uint32_t pitch,
 		  int16_t x1, int16_t y1, int16_t x2, int16_t y2,
 		  uint16_t x_offset, uint16_t y_offset);
-- 
2.39.1
