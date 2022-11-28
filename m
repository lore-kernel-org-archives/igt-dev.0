Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE44288DE5
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Nov 2022 16:16:05 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 28 Nov 2022 17:15:37 +0100
Message-Id: <20221128161537.67096-5-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221128161537.67096-1-zbigniew.kempczynski@intel.com>
References: <20221128161537.67096-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 4/4] lib/intel_batchbuffer: Get rid of
 libdrm batchbuffer
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

As few remnants were rewritten (prime_udl, prime_nv_*, benchmarks)
we can finally remove libdrm code in intel_batchbuffer.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_batchbuffer.c | 574 +---------------------------------------
 lib/intel_batchbuffer.h | 248 -----------------
 2 files changed, 2 insertions(+), 820 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 19a1fbe4db..f046a96336 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -66,16 +66,6 @@
  * @title: Batch Buffer
  * @include: igt.h
  *
- * This library provides some basic support for batchbuffers and using the
- * blitter engine based upon libdrm. A new batchbuffer is allocated with
- * intel_batchbuffer_alloc() and for simple blitter commands submitted with
- * intel_batchbuffer_flush().
- *
- * It also provides some convenient macros to easily emit commands into
- * batchbuffers. All those macros presume that a pointer to a #intel_batchbuffer
- * structure called batch is in scope. The basic macros are #BEGIN_BATCH,
- * #OUT_BATCH, #OUT_RELOC and #ADVANCE_BATCH.
- *
  * Note that this library's header pulls in the [i-g-t core](igt-gpu-tools-i-g-t-core.html)
  * library as a dependency.
  */
@@ -84,515 +74,13 @@ static bool intel_bb_do_tracking;
 static IGT_LIST_HEAD(intel_bb_list);
 static pthread_mutex_t intel_bb_list_lock = PTHREAD_MUTEX_INITIALIZER;
 
-/**
- * intel_batchbuffer_align:
- * @batch: batchbuffer object
- * @align: value in bytes to which we want to align
- *
- * Aligns the current in-batch offset to the given value.
- *
- * Returns: Batchbuffer offset aligned to the given value.
- */
-uint32_t
-intel_batchbuffer_align(struct intel_batchbuffer *batch, uint32_t align)
-{
-	uint32_t offset = batch->ptr - batch->buffer;
-
-	offset = ALIGN(offset, align);
-	batch->ptr = batch->buffer + offset;
-	return offset;
-}
-
-/**
- * intel_batchbuffer_subdata_alloc:
- * @batch: batchbuffer object
- * @size: amount of bytes need to allocate
- * @align: value in bytes to which we want to align
- *
- * Verify if sufficient @size within @batch is available to deny overflow.
- * Then allocate @size bytes within @batch.
- *
- * Returns: Offset within @batch between allocated subdata and base of @batch.
- */
-void *
-intel_batchbuffer_subdata_alloc(struct intel_batchbuffer *batch, uint32_t size,
-				uint32_t align)
-{
-	uint32_t offset = intel_batchbuffer_align(batch, align);
-
-	igt_assert(size <= intel_batchbuffer_space(batch));
-
-	batch->ptr += size;
-	return memset(batch->buffer + offset, 0, size);
-}
-
-/**
- * intel_batchbuffer_subdata_offset:
- * @batch: batchbuffer object
- * @ptr: pointer to given data
- *
- * Returns: Offset within @batch between @ptr and base of @batch.
- */
-uint32_t
-intel_batchbuffer_subdata_offset(struct intel_batchbuffer *batch, void *ptr)
-{
-	return (uint8_t *)ptr - batch->buffer;
-}
-
-/**
- * intel_batchbuffer_reset:
- * @batch: batchbuffer object
- *
- * Resets @batch by allocating a new gem buffer object as backing storage.
- */
-void
-intel_batchbuffer_reset(struct intel_batchbuffer *batch)
-{
-	if (batch->bo != NULL) {
-		drm_intel_bo_unreference(batch->bo);
-		batch->bo = NULL;
-	}
-
-	batch->bo = drm_intel_bo_alloc(batch->bufmgr, "batchbuffer",
-				       BATCH_SZ, 4096);
-
-	memset(batch->buffer, 0, sizeof(batch->buffer));
-	batch->ctx = NULL;
-
-	batch->ptr = batch->buffer;
-	batch->end = NULL;
-}
-
-/**
- * intel_batchbuffer_alloc:
- * @bufmgr: libdrm buffer manager
- * @devid: pci device id of the drm device
- *
- * Allocates a new batchbuffer object. @devid must be supplied since libdrm
- * doesn't expose it directly.
- *
- * Returns: The allocated and initialized batchbuffer object.
- */
-struct intel_batchbuffer *
-intel_batchbuffer_alloc(drm_intel_bufmgr *bufmgr, uint32_t devid)
-{
-	struct intel_batchbuffer *batch = calloc(sizeof(*batch), 1);
-
-	batch->bufmgr = bufmgr;
-	batch->devid = devid;
-	batch->gen = intel_gen(devid);
-	intel_batchbuffer_reset(batch);
-
-	return batch;
-}
-
-/**
- * intel_batchbuffer_free:
- * @batch: batchbuffer object
- *
- * Releases all resource of the batchbuffer object @batch.
- */
-void
-intel_batchbuffer_free(struct intel_batchbuffer *batch)
-{
-	drm_intel_bo_unreference(batch->bo);
-	batch->bo = NULL;
-	free(batch);
-}
-
 #define CMD_POLY_STIPPLE_OFFSET       0x7906
 
-static unsigned int
-flush_on_ring_common(struct intel_batchbuffer *batch, int ring)
-{
-	unsigned int used = batch->ptr - batch->buffer;
-
-	if (used == 0)
-		return 0;
-
-	if (IS_GEN5(batch->devid)) {
-		/* emit gen5 w/a without batch space checks - we reserve that
-		 * already. */
-		*(uint32_t *) (batch->ptr) = CMD_POLY_STIPPLE_OFFSET << 16;
-		batch->ptr += 4;
-		*(uint32_t *) (batch->ptr) = 0;
-		batch->ptr += 4;
-	}
-
-	/* Round batchbuffer usage to 2 DWORDs. */
-	if ((used & 4) == 0) {
-		*(uint32_t *) (batch->ptr) = 0; /* noop */
-		batch->ptr += 4;
-	}
-
-	/* Mark the end of the buffer. */
-	*(uint32_t *)(batch->ptr) = MI_BATCH_BUFFER_END; /* noop */
-	batch->ptr += 4;
-	return batch->ptr - batch->buffer;
-}
-
-/**
- * intel_batchbuffer_flush_on_ring:
- * @batch: batchbuffer object
- * @ring: execbuf ring flag
- *
- * Submits the batch for execution on @ring.
- */
-void
-intel_batchbuffer_flush_on_ring(struct intel_batchbuffer *batch, int ring)
-{
-	unsigned int used = flush_on_ring_common(batch, ring);
-	drm_intel_context *ctx;
-
-	if (used == 0)
-		return;
-
-	do_or_die(drm_intel_bo_subdata(batch->bo, 0, used, batch->buffer));
-
-	batch->ptr = NULL;
-
-	/* XXX bad kernel API */
-	ctx = batch->ctx;
-	if (ring != I915_EXEC_RENDER)
-		ctx = NULL;
-	do_or_die(drm_intel_gem_bo_context_exec(batch->bo, ctx, used, ring));
-
-	intel_batchbuffer_reset(batch);
-}
-
-void
-intel_batchbuffer_set_context(struct intel_batchbuffer *batch,
-				     drm_intel_context *context)
-{
-	batch->ctx = context;
-}
-
-/**
- * intel_batchbuffer_flush_with_context:
- * @batch: batchbuffer object
- * @context: libdrm hardware context object
- *
- * Submits the batch for execution on the render engine with the supplied
- * hardware context.
- */
-void
-intel_batchbuffer_flush_with_context(struct intel_batchbuffer *batch,
-				     drm_intel_context *context)
-{
-	int ret;
-	unsigned int used = flush_on_ring_common(batch, I915_EXEC_RENDER);
-
-	if (used == 0)
-		return;
-
-	ret = drm_intel_bo_subdata(batch->bo, 0, used, batch->buffer);
-	igt_assert(ret == 0);
-
-	batch->ptr = NULL;
-
-	ret = drm_intel_gem_bo_context_exec(batch->bo, context, used,
-					    I915_EXEC_RENDER);
-	igt_assert(ret == 0);
-
-	intel_batchbuffer_reset(batch);
-}
-
-/**
- * intel_batchbuffer_flush:
- * @batch: batchbuffer object
- *
- * Submits the batch for execution on the blitter engine, selecting the right
- * ring depending upon the hardware platform.
- */
-void
-intel_batchbuffer_flush(struct intel_batchbuffer *batch)
-{
-	int ring = 0;
-	if (HAS_BLT_RING(batch->devid))
-		ring = I915_EXEC_BLT;
-	intel_batchbuffer_flush_on_ring(batch, ring);
-}
-
-
-/**
- * intel_batchbuffer_emit_reloc:
- * @batch: batchbuffer object
- * @buffer: relocation target libdrm buffer object
- * @delta: delta value to add to @buffer's gpu address
- * @read_domains: gem domain bits for the relocation
- * @write_domain: gem domain bit for the relocation
- * @fenced: whether this gpu access requires fences
- *
- * Emits both a libdrm relocation entry pointing at @buffer and the pre-computed
- * DWORD of @batch's presumed gpu address plus the supplied @delta into @batch.
- *
- * Note that @fenced is only relevant if @buffer is actually tiled.
- *
- * This is the only way buffers get added to the validate list.
- */
-void
-intel_batchbuffer_emit_reloc(struct intel_batchbuffer *batch,
-                             drm_intel_bo *buffer, uint64_t delta,
-			     uint32_t read_domains, uint32_t write_domain,
-			     int fenced)
-{
-	uint64_t offset;
-	int ret;
-
-	if (batch->ptr - batch->buffer > BATCH_SZ)
-		igt_info("bad relocation ptr %p map %p offset %d size %d\n",
-			 batch->ptr, batch->buffer,
-			 (int)(batch->ptr - batch->buffer), BATCH_SZ);
-
-	if (fenced)
-		ret = drm_intel_bo_emit_reloc_fence(batch->bo, batch->ptr - batch->buffer,
-						    buffer, delta,
-						    read_domains, write_domain);
-	else
-		ret = drm_intel_bo_emit_reloc(batch->bo, batch->ptr - batch->buffer,
-					      buffer, delta,
-					      read_domains, write_domain);
-
-	offset = buffer->offset64;
-	offset += delta;
-	intel_batchbuffer_emit_dword(batch, offset);
-	if (batch->gen >= 8)
-		intel_batchbuffer_emit_dword(batch, offset >> 32);
-	igt_assert(ret == 0);
-}
-
-/**
- * intel_batchbuffer_copy_data:
- * @batch: batchbuffer object
- * @data: pointer to the data to write into the batchbuffer
- * @bytes: number of bytes to write into the batchbuffer
- * @align: value in bytes to which we want to align
- *
- * This transfers the given @data into the batchbuffer. Note that the length
- * must be DWORD aligned, i.e. multiples of 32bits. The caller must
- * confirm that there is enough space in the batch for the data to be
- * copied.
- *
- * Returns: Offset of copied data.
- */
-uint32_t
-intel_batchbuffer_copy_data(struct intel_batchbuffer *batch,
-			    const void *data, unsigned int bytes,
-			    uint32_t align)
-{
-	uint32_t *subdata;
-
-	igt_assert((bytes & 3) == 0);
-	subdata = intel_batchbuffer_subdata_alloc(batch, bytes, align);
-	memcpy(subdata, data, bytes);
-
-	return intel_batchbuffer_subdata_offset(batch, subdata);
-}
-
-#define CHECK_RANGE(x)	do { \
+#define CHECK_RANGE(x) do { \
 	igt_assert_lte(0, (x)); \
 	igt_assert_lt((x), (1 << 15)); \
 } while (0)
 
-/**
- * intel_blt_copy:
- * @batch: batchbuffer object
- * @src_bo: source libdrm buffer object
- * @src_x1: source pixel x-coordination
- * @src_y1: source pixel y-coordination
- * @src_pitch: @src_bo's pitch in bytes
- * @dst_bo: destination libdrm buffer object
- * @dst_x1: destination pixel x-coordination
- * @dst_y1: destination pixel y-coordination
- * @dst_pitch: @dst_bo's pitch in bytes
- * @width: width of the copied rectangle
- * @height: height of the copied rectangle
- * @bpp: bits per pixel
- *
- * This emits a 2D copy operation using blitter commands into the supplied batch
- * buffer object.
- */
-void
-intel_blt_copy(struct intel_batchbuffer *batch,
-	       drm_intel_bo *src_bo, int src_x1, int src_y1, int src_pitch,
-	       drm_intel_bo *dst_bo, int dst_x1, int dst_y1, int dst_pitch,
-	       int width, int height, int bpp)
-{
-	const unsigned int gen = batch->gen;
-	uint32_t src_tiling, dst_tiling, swizzle;
-	uint32_t cmd_bits = 0;
-	uint32_t br13_bits;
-
-	igt_assert(bpp*(src_x1 + width) <= 8*src_pitch);
-	igt_assert(bpp*(dst_x1 + width) <= 8*dst_pitch);
-	igt_assert(src_pitch * (src_y1 + height) <= src_bo->size);
-	igt_assert(dst_pitch * (dst_y1 + height) <= dst_bo->size);
-
-	drm_intel_bo_get_tiling(src_bo, &src_tiling, &swizzle);
-	drm_intel_bo_get_tiling(dst_bo, &dst_tiling, &swizzle);
-
-	if (gen >= 4 && src_tiling != I915_TILING_NONE) {
-		src_pitch /= 4;
-		cmd_bits |= XY_SRC_COPY_BLT_SRC_TILED;
-	}
-
-	if (gen >= 4 && dst_tiling != I915_TILING_NONE) {
-		dst_pitch /= 4;
-		cmd_bits |= XY_SRC_COPY_BLT_DST_TILED;
-	}
-
-	CHECK_RANGE(src_x1); CHECK_RANGE(src_y1);
-	CHECK_RANGE(dst_x1); CHECK_RANGE(dst_y1);
-	CHECK_RANGE(width); CHECK_RANGE(height);
-	CHECK_RANGE(src_x1 + width); CHECK_RANGE(src_y1 + height);
-	CHECK_RANGE(dst_x1 + width); CHECK_RANGE(dst_y1 + height);
-	CHECK_RANGE(src_pitch); CHECK_RANGE(dst_pitch);
-
-	br13_bits = 0;
-	switch (bpp) {
-	case 8:
-		break;
-	case 16:		/* supporting only RGB565, not ARGB1555 */
-		br13_bits |= 1 << 24;
-		break;
-	case 32:
-		br13_bits |= 3 << 24;
-		cmd_bits |= XY_SRC_COPY_BLT_WRITE_ALPHA |
-			    XY_SRC_COPY_BLT_WRITE_RGB;
-		break;
-	default:
-		igt_fail(IGT_EXIT_FAILURE);
-	}
-
-	BLIT_COPY_BATCH_START(cmd_bits);
-	OUT_BATCH((br13_bits) |
-		  (0xcc << 16) | /* copy ROP */
-		  dst_pitch);
-	OUT_BATCH((dst_y1 << 16) | dst_x1); /* dst x1,y1 */
-	OUT_BATCH(((dst_y1 + height) << 16) | (dst_x1 + width)); /* dst x2,y2 */
-	OUT_RELOC_FENCED(dst_bo, I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER, 0);
-	OUT_BATCH((src_y1 << 16) | src_x1); /* src x1,y1 */
-	OUT_BATCH(src_pitch);
-	OUT_RELOC_FENCED(src_bo, I915_GEM_DOMAIN_RENDER, 0, 0);
-	ADVANCE_BATCH();
-
-#define CMD_POLY_STIPPLE_OFFSET       0x7906
-	if (gen == 5) {
-		BEGIN_BATCH(2, 0);
-		OUT_BATCH(CMD_POLY_STIPPLE_OFFSET << 16);
-		OUT_BATCH(0);
-		ADVANCE_BATCH();
-	}
-
-	if (gen >= 6 && src_bo == dst_bo) {
-		BEGIN_BATCH(3, 0);
-		OUT_BATCH(XY_SETUP_CLIP_BLT_CMD);
-		OUT_BATCH(0);
-		OUT_BATCH(0);
-		ADVANCE_BATCH();
-	}
-
-	intel_batchbuffer_flush(batch);
-}
-
-/**
- * intel_copy_bo:
- * @batch: batchbuffer object
- * @src_bo: source libdrm buffer object
- * @dst_bo: destination libdrm buffer object
- * @size: size of the copy range in bytes
- *
- * This emits a copy operation using blitter commands into the supplied batch
- * buffer object. A total of @size bytes from the start of @src_bo is copied
- * over to @dst_bo. Note that @size must be page-aligned.
- */
-void
-intel_copy_bo(struct intel_batchbuffer *batch,
-	      drm_intel_bo *dst_bo, drm_intel_bo *src_bo,
-	      long int size)
-{
-	igt_assert(size % 4096 == 0);
-
-	intel_blt_copy(batch,
-		       src_bo, 0, 0, 4096,
-		       dst_bo, 0, 0, 4096,
-		       4096/4, size/4096, 32);
-}
-
-/**
- * igt_buf_width:
- * @buf: the i-g-t buffer object
- *
- * Computes the width in 32-bit pixels of the given buffer.
- *
- * Returns:
- * The width of the buffer.
- */
-unsigned igt_buf_width(const struct igt_buf *buf)
-{
-	return buf->surface[0].stride/(buf->bpp / 8);
-}
-
-/**
- * igt_buf_height:
- * @buf: the i-g-t buffer object
- *
- * Computes the height in 32-bit pixels of the given buffer.
- *
- * Returns:
- * The height of the buffer.
- */
-unsigned igt_buf_height(const struct igt_buf *buf)
-{
-	return buf->surface[0].size/buf->surface[0].stride;
-}
-
-/**
- * igt_buf_intel_ccs_width:
- * @buf: the Intel i-g-t buffer object
- * @gen: device generation
- *
- * Computes the width of ccs buffer when considered as Intel surface data.
- *
- * Returns:
- * The width of the ccs buffer data.
- */
-unsigned int igt_buf_intel_ccs_width(unsigned int gen, const struct igt_buf *buf)
-{
-	/*
-	 * GEN12+: The CCS unit size is 64 bytes mapping 4 main surface
-	 * tiles. Thus the width of the CCS unit is 4*32=128 pixels on the
-	 * main surface.
-	 */
-	if (gen >= 12)
-		return DIV_ROUND_UP(igt_buf_width(buf), 128) * 64;
-
-	return DIV_ROUND_UP(igt_buf_width(buf), 1024) * 128;
-}
-
-/**
- * igt_buf_intel_ccs_height:
- * @buf: the i-g-t buffer object
- * @gen: device generation
- *
- * Computes the height of ccs buffer when considered as Intel surface data.
- *
- * Returns:
- * The height of the ccs buffer data.
- */
-unsigned int igt_buf_intel_ccs_height(unsigned int gen, const struct igt_buf *buf)
-{
-	/*
-	 * GEN12+: The CCS unit size is 64 bytes mapping 4 main surface
-	 * tiles. Thus the height of the CCS unit is 32 pixel rows on the main
-	 * surface.
-	 */
-	if (gen >= 12)
-		return DIV_ROUND_UP(igt_buf_height(buf), 32);
-
-	return DIV_ROUND_UP(igt_buf_height(buf), 512) * 32;
-}
-
 /*
  * pitches are in bytes if the surfaces are linear, number of dwords
  * otherwise
@@ -1057,65 +545,6 @@ void igt_blitter_fast_copy__raw(int fd,
 	gem_close(fd, batch_handle);
 }
 
-/**
- * igt_blitter_fast_copy:
- * @batch: batchbuffer object
- * @src: source i-g-t buffer object
- * @src_delta: offset into the source i-g-t bo
- * @src_x: source pixel x-coordination
- * @src_y: source pixel y-coordination
- * @width: width of the copied rectangle
- * @height: height of the copied rectangle
- * @dst: destination i-g-t buffer object
- * @dst_delta: offset into the destination i-g-t bo
- * @dst_x: destination pixel x-coordination
- * @dst_y: destination pixel y-coordination
- *
- * Copy @src into @dst using the gen9 fast copy blitter command.
- *
- * The source and destination surfaces cannot overlap.
- */
-void igt_blitter_fast_copy(struct intel_batchbuffer *batch,
-			   const struct igt_buf *src, unsigned src_delta,
-			   unsigned src_x, unsigned src_y,
-			   unsigned width, unsigned height,
-			   int bpp,
-			   const struct igt_buf *dst, unsigned dst_delta,
-			   unsigned dst_x, unsigned dst_y)
-{
-	uint32_t src_pitch, dst_pitch;
-	uint32_t dword0, dword1;
-
-	igt_assert(src->bpp == dst->bpp);
-
-	src_pitch = fast_copy_pitch(src->surface[0].stride, src->tiling);
-	dst_pitch = fast_copy_pitch(dst->surface[0].stride, src->tiling);
-	dword0 = fast_copy_dword0(src->tiling, dst->tiling);
-	dword1 = fast_copy_dword1(src->tiling, dst->tiling, dst->bpp);
-
-	CHECK_RANGE(src_x); CHECK_RANGE(src_y);
-	CHECK_RANGE(dst_x); CHECK_RANGE(dst_y);
-	CHECK_RANGE(width); CHECK_RANGE(height);
-	CHECK_RANGE(src_x + width); CHECK_RANGE(src_y + height);
-	CHECK_RANGE(dst_x + width); CHECK_RANGE(dst_y + height);
-	CHECK_RANGE(src_pitch); CHECK_RANGE(dst_pitch);
-
-	BEGIN_BATCH(10, 2);
-	OUT_BATCH(dword0);
-	OUT_BATCH(dword1 | dst_pitch);
-	OUT_BATCH((dst_y << 16) | dst_x); /* dst x1,y1 */
-	OUT_BATCH(((dst_y + height) << 16) | (dst_x + width)); /* dst x2,y2 */
-	OUT_RELOC(dst->bo, I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER, dst_delta);
-	OUT_BATCH(0);	/* dst address upper bits */
-	OUT_BATCH((src_y << 16) | src_x); /* src x1,y1 */
-	OUT_BATCH(src_pitch);
-	OUT_RELOC(src->bo, I915_GEM_DOMAIN_RENDER, 0, src_delta);
-	OUT_BATCH(0);	/* src address upper bits */
-	ADVANCE_BATCH();
-
-	intel_batchbuffer_flush(batch);
-}
-
 /**
  * igt_get_render_copyfunc:
  * @devid: pci device id
@@ -2130,6 +1559,7 @@ __intel_bb_add_intel_buf(struct intel_bb *ibb, struct intel_buf *buf,
 		}
 	}
 
+	igt_info("Adding offset handle: %u, %lx\n", buf->handle, buf->addr.offset);
 	obj = intel_bb_add_object(ibb, buf->handle, intel_buf_bo_size(buf),
 				  buf->addr.offset, alignment, write);
 	buf->addr.offset = obj->offset;
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 2c19c39b1f..d9370610cf 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -2,7 +2,6 @@
 #define INTEL_BATCHBUFFER_H
 
 #include <stdint.h>
-#include <intel_bufmgr.h>
 #include <i915_drm.h>
 
 #include "igt_core.h"
@@ -12,194 +11,6 @@
 #include "intel_allocator.h"
 
 #define BATCH_SZ 4096
-#define BATCH_RESERVED 16
-
-struct intel_batchbuffer {
-	drm_intel_bufmgr *bufmgr;
-	uint32_t devid;
-	unsigned int gen;
-
-	drm_intel_context *ctx;
-	drm_intel_bo *bo;
-
-	uint8_t buffer[BATCH_SZ];
-	uint8_t *ptr, *end;
-};
-
-struct intel_batchbuffer *intel_batchbuffer_alloc(drm_intel_bufmgr *bufmgr,
-						  uint32_t devid);
-
-void intel_batchbuffer_set_context(struct intel_batchbuffer *batch,
-				   drm_intel_context *ctx);
-
-
-void intel_batchbuffer_free(struct intel_batchbuffer *batch);
-
-
-void intel_batchbuffer_flush(struct intel_batchbuffer *batch);
-void intel_batchbuffer_flush_on_ring(struct intel_batchbuffer *batch, int ring);
-void intel_batchbuffer_flush_with_context(struct intel_batchbuffer *batch,
-					  drm_intel_context *context);
-
-void intel_batchbuffer_reset(struct intel_batchbuffer *batch);
-
-uint32_t intel_batchbuffer_copy_data(struct intel_batchbuffer *batch,
-				const void *data, unsigned int bytes,
-				uint32_t align);
-
-void intel_batchbuffer_emit_reloc(struct intel_batchbuffer *batch,
-				  drm_intel_bo *buffer,
-				  uint64_t delta,
-				  uint32_t read_domains,
-				  uint32_t write_domain,
-				  int fenced);
-
-uint32_t
-intel_batchbuffer_align(struct intel_batchbuffer *batch, uint32_t align);
-
-void *
-intel_batchbuffer_subdata_alloc(struct intel_batchbuffer *batch,
-				uint32_t size, uint32_t align);
-
-uint32_t
-intel_batchbuffer_subdata_offset(struct intel_batchbuffer *batch, void *ptr);
-
-/* Inline functions - might actually be better off with these
- * non-inlined.  Certainly better off switching all command packets to
- * be passed as structs rather than dwords, but that's a little bit of
- * work...
- */
-#pragma GCC diagnostic ignored "-Winline"
-static inline unsigned int
-intel_batchbuffer_space(struct intel_batchbuffer *batch)
-{
-	return (BATCH_SZ - BATCH_RESERVED) - (batch->ptr - batch->buffer);
-}
-
-
-static inline void
-intel_batchbuffer_emit_dword(struct intel_batchbuffer *batch, uint32_t dword)
-{
-	igt_assert(intel_batchbuffer_space(batch) >= 4);
-	*(uint32_t *) (batch->ptr) = dword;
-	batch->ptr += 4;
-}
-
-static inline void
-intel_batchbuffer_require_space(struct intel_batchbuffer *batch,
-                                unsigned int sz)
-{
-	igt_assert(sz < BATCH_SZ - BATCH_RESERVED);
-	if (intel_batchbuffer_space(batch) < sz)
-		intel_batchbuffer_flush(batch);
-}
-
-/**
- * BEGIN_BATCH:
- * @n: number of DWORDS to emit
- * @r: number of RELOCS to emit
- *
- * Prepares a batch to emit @n DWORDS, flushing it if there's not enough space
- * available.
- *
- * This macro needs a pointer to an #intel_batchbuffer structure called batch in
- * scope.
- */
-#define BEGIN_BATCH(n, r) do {						\
-	int __n = (n); \
-	igt_assert(batch->end == NULL); \
-	if (batch->gen >= 8) __n += r;	\
-	__n *= 4; \
-	intel_batchbuffer_require_space(batch, __n);			\
-	batch->end = batch->ptr + __n; \
-} while (0)
-
-/**
- * OUT_BATCH:
- * @d: DWORD to emit
- *
- * Emits @d into a batch.
- *
- * This macro needs a pointer to an #intel_batchbuffer structure called batch in
- * scope.
- */
-#define OUT_BATCH(d) intel_batchbuffer_emit_dword(batch, d)
-
-/**
- * OUT_RELOC_FENCED:
- * @buf: relocation target libdrm buffer object
- * @read_domains: gem domain bits for the relocation
- * @write_domain: gem domain bit for the relocation
- * @delta: delta value to add to @buffer's gpu address
- *
- * Emits a fenced relocation into a batch.
- *
- * This macro needs a pointer to an #intel_batchbuffer structure called batch in
- * scope.
- */
-#define OUT_RELOC_FENCED(buf, read_domains, write_domain, delta) do {		\
-	igt_assert((delta) >= 0);						\
-	intel_batchbuffer_emit_reloc(batch, buf, delta,			\
-				     read_domains, write_domain, 1);	\
-} while (0)
-
-/**
- * OUT_RELOC:
- * @buf: relocation target libdrm buffer object
- * @read_domains: gem domain bits for the relocation
- * @write_domain: gem domain bit for the relocation
- * @delta: delta value to add to @buffer's gpu address
- *
- * Emits a normal, unfenced relocation into a batch.
- *
- * This macro needs a pointer to an #intel_batchbuffer structure called batch in
- * scope.
- */
-#define OUT_RELOC(buf, read_domains, write_domain, delta) do {		\
-	igt_assert((delta) >= 0);						\
-	intel_batchbuffer_emit_reloc(batch, buf, delta,			\
-				     read_domains, write_domain, 0);	\
-} while (0)
-
-/**
- * ADVANCE_BATCH:
- *
- * Completes the batch command emission sequence started with #BEGIN_BATCH.
- *
- * This macro needs a pointer to an #intel_batchbuffer structure called batch in
- * scope.
- */
-#define ADVANCE_BATCH() do {						\
-	igt_assert(batch->ptr == batch->end); \
-	batch->end = NULL; \
-} while(0)
-
-#define BLIT_COPY_BATCH_START(flags) do { \
-	BEGIN_BATCH(8, 2); \
-	OUT_BATCH(XY_SRC_COPY_BLT_CMD | \
-		  XY_SRC_COPY_BLT_WRITE_ALPHA | \
-		  XY_SRC_COPY_BLT_WRITE_RGB | \
-		  (flags) | \
-		  (6 + 2*(batch->gen >= 8))); \
-} while(0)
-
-#define COLOR_BLIT_COPY_BATCH_START(flags) do { \
-	BEGIN_BATCH(6, 1); \
-	OUT_BATCH(XY_COLOR_BLT_CMD_NOLEN | \
-		  COLOR_BLT_WRITE_ALPHA | \
-		  XY_COLOR_BLT_WRITE_RGB | \
-		  (flags) | \
-		  (4 + (batch->gen >= 8))); \
-} while(0)
-
-void
-intel_blt_copy(struct intel_batchbuffer *batch,
-	      drm_intel_bo *src_bo, int src_x1, int src_y1, int src_pitch,
-	      drm_intel_bo *dst_bo, int dst_x1, int dst_y1, int dst_pitch,
-	      int width, int height, int bpp);
-void intel_copy_bo(struct intel_batchbuffer *batch,
-		   drm_intel_bo *dst_bo, drm_intel_bo *src_bo,
-		   long int size);
 
 /*
  * Yf/Ys/4 tiling
@@ -220,57 +31,6 @@ enum i915_compression {
 	I915_COMPRESSION_MEDIA,
 };
 
-/**
- * igt_buf:
- * @bo: underlying libdrm buffer object
- * @stride: stride of the buffer
- * @tiling: tiling mode bits
- * @compression: memory compression mode
- * @bpp: bits per pixel, 8, 16 or 32.
- * @data: pointer to the memory mapping of the buffer
- * @size: size of the buffer object
- *
- * This is a i-g-t buffer object wrapper structure which augments the baseline
- * libdrm buffer object with suitable data needed by the render/vebox copy and
- * the fill functions.
- */
-struct igt_buf {
-	drm_intel_bo *bo;
-	uint32_t tiling;
-	enum i915_compression compression;
-	uint32_t bpp;
-	uint32_t yuv_semiplanar_bpp;
-	uint32_t *data;
-	bool format_is_yuv:1;
-	bool format_is_yuv_semiplanar:1;
-	struct {
-		uint32_t offset;
-		uint32_t stride;
-		uint32_t size;
-	} surface[2];
-	struct {
-		uint32_t offset;
-		uint32_t stride;
-	} ccs[2];
-	struct {
-		uint32_t offset;
-	} cc;
-	/*< private >*/
-	unsigned num_tiles;
-};
-
-static inline bool igt_buf_compressed(const struct igt_buf *buf)
-{
-	return buf->compression != I915_COMPRESSION_NONE;
-}
-
-unsigned igt_buf_width(const struct igt_buf *buf);
-unsigned igt_buf_height(const struct igt_buf *buf);
-unsigned int igt_buf_intel_ccs_width(unsigned int gen,
-				     const struct igt_buf *buf);
-unsigned int igt_buf_intel_ccs_height(unsigned int gen,
-				      const struct igt_buf *buf);
-
 void igt_blitter_src_copy(int fd,
 			  uint64_t ahnd,
 			  uint32_t ctx,
@@ -296,14 +56,6 @@ void igt_blitter_src_copy(int fd,
 			  uint32_t dst_x, uint32_t dst_y,
 			  uint64_t dst_size);
 
-void igt_blitter_fast_copy(struct intel_batchbuffer *batch,
-			   const struct igt_buf *src, unsigned src_delta,
-			   unsigned src_x, unsigned src_y,
-			   unsigned width, unsigned height,
-			   int bpp,
-			   const struct igt_buf *dst, unsigned dst_delta,
-			   unsigned dst_x, unsigned dst_y);
-
 void igt_blitter_fast_copy__raw(int fd,
 				uint64_t ahnd,
 				uint32_t ctx,
-- 
2.34.1
