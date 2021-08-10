Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47AC989E01
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 05:27:29 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 10 Aug 2021 07:26:11 +0200
Message-Id: <20210810052711.7866-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
References: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 05/65] lib/intel_batchbuffer: Add
 allocator support in blitter fast copy
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

For newer gens kernel will reject relocations by returning -EINVAL
so we should support allocator and acquire offsets for blit.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_fb.c            | 17 ++++++++++++-
 lib/intel_batchbuffer.c | 55 ++++++++++++++++++++++++++++++-----------
 lib/intel_batchbuffer.h |  6 ++++-
 3 files changed, 62 insertions(+), 16 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 1e602dcfa..2d1b5c0af 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2433,6 +2433,8 @@ static void blitcopy(const struct igt_fb *dst_fb,
 		     const struct igt_fb *src_fb)
 {
 	uint32_t src_tiling, dst_tiling;
+	uint32_t ctx = 0;
+	uint64_t ahnd = 0;
 
 	igt_assert_eq(dst_fb->fd, src_fb->fd);
 	igt_assert_eq(dst_fb->num_planes, src_fb->num_planes);
@@ -2440,6 +2442,12 @@ static void blitcopy(const struct igt_fb *dst_fb,
 	src_tiling = igt_fb_mod_to_tiling(src_fb->modifier);
 	dst_tiling = igt_fb_mod_to_tiling(dst_fb->modifier);
 
+	if (!gem_has_relocations(dst_fb->fd)) {
+		igt_require(gem_has_contexts(dst_fb->fd));
+		ctx = gem_context_create(dst_fb->fd);
+		ahnd = get_reloc_ahnd(dst_fb->fd, ctx);
+	}
+
 	for (int i = 0; i < dst_fb->num_planes; i++) {
 		igt_assert_eq(dst_fb->plane_bpp[i], src_fb->plane_bpp[i]);
 		igt_assert_eq(dst_fb->plane_width[i], src_fb->plane_width[i]);
@@ -2451,11 +2459,13 @@ static void blitcopy(const struct igt_fb *dst_fb,
 		 */
 		if (fast_blit_ok(src_fb) && fast_blit_ok(dst_fb)) {
 			igt_blitter_fast_copy__raw(dst_fb->fd,
+						   ahnd, ctx,
 						   src_fb->gem_handle,
 						   src_fb->offsets[i],
 						   src_fb->strides[i],
 						   src_tiling,
 						   0, 0, /* src_x, src_y */
+						   src_fb->size,
 						   dst_fb->plane_width[i],
 						   dst_fb->plane_height[i],
 						   dst_fb->plane_bpp[i],
@@ -2463,7 +2473,8 @@ static void blitcopy(const struct igt_fb *dst_fb,
 						   dst_fb->offsets[i],
 						   dst_fb->strides[i],
 						   dst_tiling,
-						   0, 0 /* dst_x, dst_y */);
+						   0, 0 /* dst_x, dst_y */,
+						   dst_fb->size);
 		} else {
 			igt_blitter_src_copy(dst_fb->fd,
 					     src_fb->gem_handle,
@@ -2481,6 +2492,10 @@ static void blitcopy(const struct igt_fb *dst_fb,
 					     0, 0 /* dst_x, dst_y */);
 		}
 	}
+
+	if (ctx)
+		gem_context_destroy(dst_fb->fd, ctx);
+	put_ahnd(ahnd);
 }
 
 static void free_linear_mapping(struct fb_blit_upload *blit)
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 3747019a5..d9cc4d89c 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -706,12 +706,13 @@ fill_object(struct drm_i915_gem_exec_object2 *obj,
 
 static void exec_blit(int fd,
 		      struct drm_i915_gem_exec_object2 *objs, uint32_t count,
-		      unsigned int gen)
+		      unsigned int gen, uint32_t ctx)
 {
 	struct drm_i915_gem_execbuffer2 exec = {
 		.buffers_ptr = to_user_pointer(objs),
 		.buffer_count = count,
 		.flags = gen >= 6 ? I915_EXEC_BLT : 0,
+		.rsvd1 = ctx,
 	};
 
 	gem_execbuf(fd, &exec);
@@ -896,7 +897,7 @@ void igt_blitter_src_copy(int fd,
 	objs[0].flags |= EXEC_OBJECT_NEEDS_FENCE;
 	objs[1].flags |= EXEC_OBJECT_NEEDS_FENCE;
 
-	exec_blit(fd, objs, 3, gen);
+	exec_blit(fd, objs, 3, gen, 0);
 
 	gem_close(fd, batch_handle);
 }
@@ -904,12 +905,15 @@ void igt_blitter_src_copy(int fd,
 /**
  * igt_blitter_fast_copy__raw:
  * @fd: file descriptor of the i915 driver
+ * @ahnd: handle to an allocator
+ * @ctx: context within which execute copy blit
  * @src_handle: GEM handle of the source buffer
  * @src_delta: offset into the source GEM bo, in bytes
  * @src_stride: Stride (in bytes) of the source buffer
  * @src_tiling: Tiling mode of the source buffer
  * @src_x: X coordinate of the source region to copy
  * @src_y: Y coordinate of the source region to copy
+ * @src_size: size of the src bo required for allocator and softpin
  * @width: Width of the region to copy
  * @height: Height of the region to copy
  * @bpp: source and destination bits per pixel
@@ -919,16 +923,20 @@ void igt_blitter_src_copy(int fd,
  * @dst_tiling: Tiling mode of the destination buffer
  * @dst_x: X coordinate of destination
  * @dst_y: Y coordinate of destination
+ * @dst_size: size of the dst bo required for allocator and softpin
  *
  * Like igt_blitter_fast_copy(), but talking to the kernel directly.
  */
 void igt_blitter_fast_copy__raw(int fd,
+				uint64_t ahnd,
+				uint32_t ctx,
 				/* src */
 				uint32_t src_handle,
 				unsigned int src_delta,
 				unsigned int src_stride,
 				unsigned int src_tiling,
 				unsigned int src_x, unsigned src_y,
+				uint64_t src_size,
 
 				/* size */
 				unsigned int width, unsigned int height,
@@ -941,7 +949,8 @@ void igt_blitter_fast_copy__raw(int fd,
 				unsigned dst_delta,
 				unsigned int dst_stride,
 				unsigned int dst_tiling,
-				unsigned int dst_x, unsigned dst_y)
+				unsigned int dst_x, unsigned dst_y,
+				uint64_t dst_size)
 {
 	uint32_t batch[12];
 	struct drm_i915_gem_exec_object2 objs[3];
@@ -949,8 +958,20 @@ void igt_blitter_fast_copy__raw(int fd,
 	uint32_t batch_handle;
 	uint32_t dword0, dword1;
 	uint32_t src_pitch, dst_pitch;
+	uint64_t batch_offset, src_offset, dst_offset;
 	int i = 0;
 
+	batch_handle = gem_create(fd, 4096);
+	if (ahnd) {
+		src_offset = get_offset(ahnd, src_handle, src_size, 0);
+		dst_offset = get_offset(ahnd, dst_handle, dst_size, 0);
+		batch_offset = get_offset(ahnd, batch_handle, 4096, 0);
+	} else {
+		src_offset = 16 << 20;
+		dst_offset = ALIGN(src_offset + src_size, 1 << 20);
+		batch_offset = ALIGN(dst_offset + dst_size, 1 << 20);
+	}
+
 	src_pitch = fast_copy_pitch(src_stride, src_tiling);
 	dst_pitch = fast_copy_pitch(dst_stride, dst_tiling);
 	dword0 = fast_copy_dword0(src_tiling, dst_tiling);
@@ -967,30 +988,36 @@ void igt_blitter_fast_copy__raw(int fd,
 	batch[i++] = dword1 | dst_pitch;
 	batch[i++] = (dst_y << 16) | dst_x; /* dst x1,y1 */
 	batch[i++] = ((dst_y + height) << 16) | (dst_x + width); /* dst x2,y2 */
-	batch[i++] = dst_delta; /* dst address lower bits */
-	batch[i++] = 0;	/* dst address upper bits */
+	batch[i++] = dst_offset + dst_delta; /* dst address lower bits */
+	batch[i++] = (dst_offset + dst_delta) >> 32; /* dst address upper bits */
 	batch[i++] = (src_y << 16) | src_x; /* src x1,y1 */
 	batch[i++] = src_pitch;
-	batch[i++] = src_delta; /* src address lower bits */
-	batch[i++] = 0;	/* src address upper bits */
+	batch[i++] = src_offset + src_delta; /* src address lower bits */
+	batch[i++] = (src_offset + src_delta) >> 32; /* src address upper bits */
 	batch[i++] = MI_BATCH_BUFFER_END;
 	batch[i++] = MI_NOOP;
 
 	igt_assert(i == ARRAY_SIZE(batch));
 
-	batch_handle = gem_create(fd, 4096);
 	gem_write(fd, batch_handle, 0, batch, sizeof(batch));
 
-	fill_relocation(&relocs[0], dst_handle, -1, dst_delta, 4,
+	fill_relocation(&relocs[0], dst_handle, dst_offset, dst_delta, 4,
 			I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER);
-	fill_relocation(&relocs[1], src_handle, -1, src_delta, 8,
+	fill_relocation(&relocs[1], src_handle, src_offset, src_delta, 8,
 			I915_GEM_DOMAIN_RENDER, 0);
 
-	fill_object(&objs[0], dst_handle, 0, NULL, 0);
-	fill_object(&objs[1], src_handle, 0, NULL, 0);
-	fill_object(&objs[2], batch_handle, 0, relocs, 2);
+	fill_object(&objs[0], dst_handle, dst_offset, NULL, 0);
+	objs[0].flags |= EXEC_OBJECT_WRITE;
+	fill_object(&objs[1], src_handle, src_offset, NULL, 0);
+	fill_object(&objs[2], batch_handle, batch_offset, relocs, !ahnd ? 2 : 0);
+
+	if (ahnd) {
+		objs[0].flags |= EXEC_OBJECT_PINNED;
+		objs[1].flags |= EXEC_OBJECT_PINNED;
+		objs[2].flags |= EXEC_OBJECT_PINNED;
+	}
 
-	exec_blit(fd, objs, 3, intel_gen(intel_get_drm_devid(fd)));
+	exec_blit(fd, objs, 3, intel_gen(intel_get_drm_devid(fd)), ctx);
 
 	gem_close(fd, batch_handle);
 }
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index bd417e998..74c21c40e 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -300,12 +300,15 @@ void igt_blitter_fast_copy(struct intel_batchbuffer *batch,
 			   unsigned dst_x, unsigned dst_y);
 
 void igt_blitter_fast_copy__raw(int fd,
+				uint64_t ahnd,
+				uint32_t ctx,
 				/* src */
 				uint32_t src_handle,
 				unsigned int src_delta,
 				unsigned int src_stride,
 				unsigned int src_tiling,
 				unsigned int src_x, unsigned src_y,
+				uint64_t src_size,
 
 				/* size */
 				unsigned int width, unsigned int height,
@@ -318,7 +321,8 @@ void igt_blitter_fast_copy__raw(int fd,
 				unsigned int dst_delta,
 				unsigned int dst_stride,
 				unsigned int dst_tiling,
-				unsigned int dst_x, unsigned dst_y);
+				unsigned int dst_x, unsigned dst_y,
+				uint64_t dst_size);
 
 /**
  * igt_render_copyfunc_t:
-- 
2.26.0
