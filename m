Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0B56EA61
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2019 19:39:17 +0000 (UTC)
From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Date: Wed, 18 Dec 2019 11:39:07 -0800
Message-Id: <20191218193915.1375365-3-vanshidhar.r.konda@intel.com>
In-Reply-To: <20191218193915.1375365-1-vanshidhar.r.konda@intel.com>
References: <20191218193915.1375365-1-vanshidhar.r.konda@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 02/10] lib/intel_batchbuffer: Add blitter copy
 using XY_SRC_COPY_BLT
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

Add a method that uses the XY_SRC_COPY_BLT instruction for copying
buffers using the blitter engine.

v2: Use uint32_t for parameters; fix stride for Gen2/3

Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
---
 lib/intel_batchbuffer.c | 183 ++++++++++++++++++++++++++++++++++++++++
 lib/intel_batchbuffer.h |  21 +++++
 2 files changed, 204 insertions(+)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 51aae4dc..bc44b44f 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -46,6 +46,12 @@
 
 #include <i915_drm.h>
 
+#define MI_FLUSH_DW (0x26 << 23)
+
+#define BCS_SWCTRL 0x22200
+#define BCS_SRC_Y (1 << 0)
+#define BCS_DST_Y (1 << 1)
+
 /**
  * SECTION:intel_batchbuffer
  * @short_description: Batchbuffer and blitter support
@@ -661,6 +667,183 @@ static void exec_blit(int fd,
 	gem_execbuf(fd, &exec);
 }
 
+static uint32_t src_copy_dword0(uint32_t src_tiling, uint32_t dst_tiling,
+				uint32_t bpp, uint32_t device_gen)
+{
+	uint32_t dword0 = 0;
+
+	dword0 |= XY_SRC_COPY_BLT_CMD;
+	if (bpp == 32)
+		dword0 |= XY_SRC_COPY_BLT_WRITE_RGB |
+			XY_SRC_COPY_BLT_WRITE_ALPHA;
+
+	if (device_gen >= 4 && src_tiling)
+		dword0 |= XY_SRC_COPY_BLT_SRC_TILED;
+	if (device_gen >= 4 && dst_tiling)
+		dword0 |= XY_SRC_COPY_BLT_DST_TILED;
+
+	return dword0;
+}
+
+static uint32_t src_copy_dword1(uint32_t dst_pitch, uint32_t bpp)
+{
+	uint32_t dword1 = 0;
+
+	switch (bpp) {
+	case 8:
+		break;
+	case 16:
+		dword1 |= (1 << 24); /* Only support 565 color */
+		break;
+	case 32:
+		dword1 |= (3 << 24);
+		break;
+	default:
+		igt_assert(0);
+	}
+
+	dword1 |= 0xcc << 16;
+	dword1 |= dst_pitch;
+
+	return dword1;
+}
+/**
+ * igt_blitter_src_copy__raw:
+ * @fd: file descriptor of the i915 driver
+ * @src_handle: GEM handle of the source buffer
+ * @src_delta: offset into the source GEM bo, in bytes
+ * @src_stride: Stride (in bytes) of the source buffer
+ * @src_tiling: Tiling mode of the source buffer
+ * @src_x: X coordinate of the source region to copy
+ * @src_y: Y coordinate of the source region to copy
+ * @width: Width of the region to copy
+ * @height: Height of the region to copy
+ * @bpp: source and destination bits per pixel
+ * @dst_handle: GEM handle of the destination buffer
+ * @dst_delta: offset into the destination GEM bo, in bytes
+ * @dst_stride: Stride (in bytes) of the destination buffer
+ * @dst_tiling: Tiling mode of the destination buffer
+ * @dst_x: X coordinate of destination
+ * @dst_y: Y coordinate of destination
+ *
+ */
+void igt_blitter_src_copy__raw(int fd,
+				/* src */
+				uint32_t src_handle,
+				uint32_t src_delta,
+				uint32_t src_stride,
+				uint32_t src_tiling,
+				uint32_t src_x, uint32_t src_y,
+
+				/* size */
+				uint32_t width, uint32_t height,
+
+				/* bpp */
+				uint32_t bpp,
+
+				/* dst */
+				uint32_t dst_handle,
+				uint32_t dst_delta,
+				uint32_t dst_stride,
+				uint32_t dst_tiling,
+				uint32_t dst_x, uint32_t dst_y)
+{
+	uint32_t batch[32];
+	struct drm_i915_gem_exec_object2 objs[3];
+	struct drm_i915_gem_relocation_entry relocs[2];
+	uint32_t batch_handle;
+	uint32_t src_pitch, dst_pitch;
+	uint32_t dst_reloc_offset, src_reloc_offset;
+	int i = 0;
+	uint32_t gen = intel_gen(intel_get_drm_devid(fd));
+	const bool has_64b_reloc = gen >= 8;
+
+	memset(batch, 0, sizeof(batch));
+
+	igt_assert((src_tiling == I915_TILING_NONE) ||
+		   (src_tiling == I915_TILING_X) ||
+		   (src_tiling == I915_TILING_Y));
+	igt_assert((dst_tiling == I915_TILING_NONE) ||
+		   (dst_tiling == I915_TILING_X) ||
+		   (dst_tiling == I915_TILING_Y));
+
+	src_pitch = (gen >= 4 && src_tiling) ? src_stride / 4 : src_stride;
+	dst_pitch = (gen >= 4 && dst_tiling) ? dst_stride / 4 : dst_stride;
+
+	CHECK_RANGE(src_x); CHECK_RANGE(src_y);
+	CHECK_RANGE(dst_x); CHECK_RANGE(dst_y);
+	CHECK_RANGE(width); CHECK_RANGE(height);
+	CHECK_RANGE(src_x + width); CHECK_RANGE(src_y + height);
+	CHECK_RANGE(dst_x + width); CHECK_RANGE(dst_y + height);
+	CHECK_RANGE(src_pitch); CHECK_RANGE(dst_pitch);
+
+	if ((src_tiling | dst_tiling) >= I915_TILING_Y) {
+		unsigned int mask;
+
+		batch[i++] = MI_LOAD_REGISTER_IMM;
+		batch[i++] = BCS_SWCTRL;
+
+		mask = (BCS_SRC_Y | BCS_DST_Y) << 16;
+		if (src_tiling == I915_TILING_Y)
+			mask |= BCS_SRC_Y;
+		if (dst_tiling == I915_TILING_Y)
+			mask |= BCS_DST_Y;
+		batch[i++] = mask;
+	}
+
+	batch[i] = src_copy_dword0(src_tiling, dst_tiling, bpp, gen);
+	batch[i++] |= 6 + 2 * has_64b_reloc;
+	batch[i++] = src_copy_dword1(dst_pitch, bpp);
+	batch[i++] = (dst_y << 16) | dst_x; /* dst x1,y1 */
+	batch[i++] = ((dst_y + height) << 16) | (dst_x + width); /* dst x2,y2 */
+	dst_reloc_offset = i;
+	batch[i++] = dst_delta; /* dst address lower bits */
+	batch[i++] = 0;	/* dst address upper bits */
+	batch[i++] = (src_y << 16) | src_x; /* src x1,y1 */
+	batch[i++] = src_pitch;
+	src_reloc_offset = i;
+	batch[i++] = src_delta; /* src address lower bits */
+	batch[i++] = 0;	/* src address upper bits */
+
+	if ((src_tiling | dst_tiling) >= I915_TILING_Y) {
+		igt_assert(gen >= 6);
+		batch[i++] = MI_FLUSH_DW | 2;
+		batch[i++] = 0;
+		batch[i++] = 0;
+		batch[i++] = 0;
+
+		batch[i++] = MI_LOAD_REGISTER_IMM;
+		batch[i++] = BCS_SWCTRL;
+		batch[i++] = (BCS_SRC_Y | BCS_DST_Y) << 16;
+	}
+
+	batch[i++] = MI_BATCH_BUFFER_END;
+	batch[i++] = MI_NOOP;
+
+	igt_assert(i <= ARRAY_SIZE(batch));
+
+	batch_handle = gem_create(fd, 4096);
+	gem_write(fd, batch_handle, 0, batch, sizeof(batch));
+
+	fill_relocation(&relocs[0], dst_handle, dst_delta, dst_reloc_offset,
+			I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER);
+	fill_relocation(&relocs[1], src_handle, src_delta, src_reloc_offset,
+			I915_GEM_DOMAIN_RENDER, 0);
+
+	fill_object(&objs[0], dst_handle, NULL, 0);
+	fill_object(&objs[1], src_handle, NULL, 0);
+	fill_object(&objs[2], batch_handle, relocs, 2);
+
+	if (dst_tiling)
+		objs[0].flags |= EXEC_OBJECT_NEEDS_FENCE;
+	if (src_tiling)
+		objs[1].flags |= EXEC_OBJECT_NEEDS_FENCE;
+
+	exec_blit(fd, objs, 3, ARRAY_SIZE(batch));
+
+	gem_close(fd, batch_handle);
+}
+
 /**
  * igt_blitter_fast_copy__raw:
  * @fd: file descriptor of the i915 driver
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 37e3affe..a0a22030 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -252,6 +252,27 @@ struct igt_buf {
 unsigned igt_buf_width(const struct igt_buf *buf);
 unsigned igt_buf_height(const struct igt_buf *buf);
 
+void igt_blitter_src_copy__raw(int fd,
+				/* src */
+				uint32_t src_handle,
+				uint32_t src_delta,
+				uint32_t src_stride,
+				uint32_t src_tiling,
+				uint32_t src_x, uint32_t src_y,
+
+				/* size */
+				uint32_t width, uint32_t height,
+
+				/* bpp */
+				uint32_t bpp,
+
+				/* dst */
+				uint32_t dst_handle,
+				uint32_t dst_delta,
+				uint32_t dst_stride,
+				uint32_t dst_tiling,
+				uint32_t dst_x, uint32_t dst_y);
+
 void igt_blitter_fast_copy(struct intel_batchbuffer *batch,
 			   const struct igt_buf *src, unsigned src_delta,
 			   unsigned src_x, unsigned src_y,
-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
