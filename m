Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171186EB9B
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 13:42:09 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 15:40:55 +0200
Message-Id: <20210806134145.24634-7-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
References: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 06/56] lib/intel_batchbuffer: Add
 allocator support in blitter src copy
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
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Adjust igt_fb library + prime_vgem test as they are blitter src copy
users.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_fb.c            |   5 +-
 lib/intel_batchbuffer.c |  53 +++++++++++++-----
 lib/intel_batchbuffer.h |   6 +-
 tests/prime_vgem.c      | 120 +++++++++++++++++++++++++++++-----------
 4 files changed, 138 insertions(+), 46 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 1bb32cd8a..c7dcadcf6 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2461,11 +2461,13 @@ static void blitcopy(const struct igt_fb *dst_fb,
 						   dst_fb->size);
 		} else {
 			igt_blitter_src_copy(dst_fb->fd,
+					     ahnd, ctx,
 					     src_fb->gem_handle,
 					     src_fb->offsets[i],
 					     src_fb->strides[i],
 					     src_tiling,
 					     0, 0, /* src_x, src_y */
+					     src_fb->size,
 					     dst_fb->plane_width[i],
 					     dst_fb->plane_height[i],
 					     dst_fb->plane_bpp[i],
@@ -2473,7 +2475,8 @@ static void blitcopy(const struct igt_fb *dst_fb,
 					     dst_fb->offsets[i],
 					     dst_fb->strides[i],
 					     dst_tiling,
-					     0, 0 /* dst_x, dst_y */);
+					     0, 0 /* dst_x, dst_y */,
+					     dst_fb->size);
 		}
 	}
 
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index d9cc4d89c..008dc78ef 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -762,12 +762,15 @@ static uint32_t src_copy_dword1(uint32_t dst_pitch, uint32_t bpp)
 /**
  * igt_blitter_src_copy:
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
@@ -777,16 +780,20 @@ static uint32_t src_copy_dword1(uint32_t dst_pitch, uint32_t bpp)
  * @dst_tiling: Tiling mode of the destination buffer
  * @dst_x: X coordinate of destination
  * @dst_y: Y coordinate of destination
+ * @dst_size: size of the dst bo required for allocator and softpin
  *
  * Copy @src into @dst using the XY_SRC blit command.
  */
 void igt_blitter_src_copy(int fd,
+			  uint64_t ahnd,
+			  uint32_t ctx,
 			  /* src */
 			  uint32_t src_handle,
 			  uint32_t src_delta,
 			  uint32_t src_stride,
 			  uint32_t src_tiling,
 			  uint32_t src_x, uint32_t src_y,
+			  uint64_t src_size,
 
 			  /* size */
 			  uint32_t width, uint32_t height,
@@ -799,7 +806,8 @@ void igt_blitter_src_copy(int fd,
 			  uint32_t dst_delta,
 			  uint32_t dst_stride,
 			  uint32_t dst_tiling,
-			  uint32_t dst_x, uint32_t dst_y)
+			  uint32_t dst_x, uint32_t dst_y,
+			  uint64_t dst_size)
 {
 	uint32_t batch[32];
 	struct drm_i915_gem_exec_object2 objs[3];
@@ -808,9 +816,21 @@ void igt_blitter_src_copy(int fd,
 	uint32_t src_pitch, dst_pitch;
 	uint32_t dst_reloc_offset, src_reloc_offset;
 	uint32_t gen = intel_gen(intel_get_drm_devid(fd));
+	uint64_t batch_offset, src_offset, dst_offset;
 	const bool has_64b_reloc = gen >= 8;
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
 	memset(batch, 0, sizeof(batch));
 
 	igt_assert((src_tiling == I915_TILING_NONE) ||
@@ -855,15 +875,15 @@ void igt_blitter_src_copy(int fd,
 	batch[i++] = (dst_y << 16) | dst_x; /* dst x1,y1 */
 	batch[i++] = ((dst_y + height) << 16) | (dst_x + width); /* dst x2,y2 */
 	dst_reloc_offset = i;
-	batch[i++] = dst_delta; /* dst address lower bits */
+	batch[i++] = dst_offset + dst_delta; /* dst address lower bits */
 	if (has_64b_reloc)
-		batch[i++] = 0;	/* dst address upper bits */
+		batch[i++] = (dst_offset + dst_delta) >> 32; /* dst address upper bits */
 	batch[i++] = (src_y << 16) | src_x; /* src x1,y1 */
 	batch[i++] = src_pitch;
 	src_reloc_offset = i;
-	batch[i++] = src_delta; /* src address lower bits */
+	batch[i++] = src_offset + src_delta; /* src address lower bits */
 	if (has_64b_reloc)
-		batch[i++] = 0;	/* src address upper bits */
+		batch[i++] = (src_offset + src_delta) >> 32; /* src address upper bits */
 
 	if ((src_tiling | dst_tiling) >= I915_TILING_Y) {
 		igt_assert(gen >= 6);
@@ -882,22 +902,29 @@ void igt_blitter_src_copy(int fd,
 
 	igt_assert(i <= ARRAY_SIZE(batch));
 
-	batch_handle = gem_create(fd, 4096);
 	gem_write(fd, batch_handle, 0, batch, sizeof(batch));
 
-	fill_relocation(&relocs[0], dst_handle, -1, dst_delta, dst_reloc_offset,
+	fill_relocation(&relocs[0], dst_handle, dst_offset,
+			dst_delta, dst_reloc_offset,
 			I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER);
-	fill_relocation(&relocs[1], src_handle, -1, src_delta, src_reloc_offset,
+	fill_relocation(&relocs[1], src_handle, src_offset,
+			src_delta, src_reloc_offset,
 			I915_GEM_DOMAIN_RENDER, 0);
 
-	fill_object(&objs[0], dst_handle, 0, NULL, 0);
-	fill_object(&objs[1], src_handle, 0, NULL, 0);
-	fill_object(&objs[2], batch_handle, 0, relocs, 2);
+	fill_object(&objs[0], dst_handle, dst_offset, NULL, 0);
+	fill_object(&objs[1], src_handle, src_offset, NULL, 0);
+	fill_object(&objs[2], batch_handle, batch_offset, relocs, !ahnd ? 2 : 0);
 
-	objs[0].flags |= EXEC_OBJECT_NEEDS_FENCE;
+	objs[0].flags |= EXEC_OBJECT_NEEDS_FENCE | EXEC_OBJECT_WRITE;
 	objs[1].flags |= EXEC_OBJECT_NEEDS_FENCE;
 
-	exec_blit(fd, objs, 3, gen, 0);
+	if (ahnd) {
+		objs[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		objs[1].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		objs[2].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+	}
+
+	exec_blit(fd, objs, 3, gen, ctx);
 
 	gem_close(fd, batch_handle);
 }
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 74c21c40e..c1974fe73 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -271,12 +271,15 @@ unsigned int igt_buf_intel_ccs_height(unsigned int gen,
 				      const struct igt_buf *buf);
 
 void igt_blitter_src_copy(int fd,
+			  uint64_t ahnd,
+			  uint32_t ctx,
 			  /* src */
 			  uint32_t src_handle,
 			  uint32_t src_delta,
 			  uint32_t src_stride,
 			  uint32_t src_tiling,
 			  uint32_t src_x, uint32_t src_y,
+			  uint64_t src_size,
 
 			  /* size */
 			  uint32_t width, uint32_t height,
@@ -289,7 +292,8 @@ void igt_blitter_src_copy(int fd,
 			  uint32_t dst_delta,
 			  uint32_t dst_stride,
 			  uint32_t dst_tiling,
-			  uint32_t dst_x, uint32_t dst_y);
+			  uint32_t dst_x, uint32_t dst_y,
+			  uint64_t dst_size);
 
 void igt_blitter_fast_copy(struct intel_batchbuffer *batch,
 			   const struct igt_buf *src, unsigned src_delta,
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 25c5f42f5..b837f2bfa 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -207,10 +207,14 @@ static void test_fence_blt(int i915, int vgem)
 
 	igt_fork(child, 1) {
 		uint32_t native;
+		uint64_t ahnd;
 
 		close(master[0]);
 		close(slave[1]);
 
+		intel_allocator_init();
+		ahnd = get_reloc_ahnd(i915, 0);
+
 		native = gem_create(i915, scratch.size);
 
 		ptr = gem_mmap__wc(i915, native, 0, scratch.size, PROT_READ);
@@ -221,10 +225,11 @@ static void test_fence_blt(int i915, int vgem)
 		write(master[1], &child, sizeof(child));
 		read(slave[0], &child, sizeof(child));
 
-		igt_blitter_src_copy(i915, prime, 0, scratch.pitch,
-				     I915_TILING_NONE, 0, 0, scratch.width,
-				     scratch.height, scratch.bpp, native, 0,
-				     scratch.pitch, I915_TILING_NONE, 0, 0);
+		igt_blitter_src_copy(i915, ahnd, 0, prime, 0, scratch.pitch,
+				     I915_TILING_NONE, 0, 0, scratch.size,
+				     scratch.width, scratch.height, scratch.bpp,
+				     native, 0, scratch.pitch,
+				     I915_TILING_NONE, 0, 0, scratch.size);
 		gem_sync(i915, native);
 
 		for (i = 0; i < scratch.height; i++)
@@ -234,6 +239,7 @@ static void test_fence_blt(int i915, int vgem)
 		munmap(ptr, scratch.size);
 		gem_close(i915, native);
 		gem_close(i915, prime);
+		put_ahnd(ahnd);
 	}
 
 	close(master[1]);
@@ -375,6 +381,7 @@ static void test_blt(int vgem, int i915)
 	uint32_t prime, native;
 	uint32_t *ptr;
 	int dmabuf, i;
+	uint64_t ahnd = get_reloc_ahnd(i915, 0);
 
 	scratch.width = 1024;
 	scratch.height = 1024;
@@ -391,9 +398,11 @@ static void test_blt(int vgem, int i915)
 		ptr[scratch.pitch * i / sizeof(*ptr)] = i;
 	munmap(ptr, scratch.size);
 
-	igt_blitter_src_copy(i915, native, 0, scratch.pitch, I915_TILING_NONE,
-			     0, 0, scratch.width, scratch.height, scratch.bpp,
-			     prime, 0, scratch.pitch, I915_TILING_NONE, 0, 0);
+	igt_blitter_src_copy(i915, ahnd, 0, native, 0, scratch.pitch,
+			     I915_TILING_NONE, 0, 0, scratch.size,
+			     scratch.width, scratch.height, scratch.bpp,
+			     prime, 0, scratch.pitch, I915_TILING_NONE, 0, 0,
+			     scratch.size);
 	prime_sync_start(dmabuf, true);
 	prime_sync_end(dmabuf, true);
 	close(dmabuf);
@@ -405,9 +414,11 @@ static void test_blt(int vgem, int i915)
 	}
 	munmap(ptr, scratch.size);
 
-	igt_blitter_src_copy(i915, prime, 0, scratch.pitch, I915_TILING_NONE,
-			     0, 0, scratch.width, scratch.height, scratch.bpp,
-			     native, 0, scratch.pitch, I915_TILING_NONE, 0, 0);
+	igt_blitter_src_copy(i915, ahnd, 0, prime, 0, scratch.pitch,
+			     I915_TILING_NONE, 0, 0, scratch.size,
+			     scratch.width, scratch.height, scratch.bpp,
+			     native, 0, scratch.pitch, I915_TILING_NONE, 0, 0,
+			     scratch.size);
 	gem_sync(i915, native);
 
 	ptr = gem_mmap__wc(i915, native, 0, scratch.size, PROT_READ);
@@ -418,6 +429,7 @@ static void test_blt(int vgem, int i915)
 	gem_close(i915, native);
 	gem_close(i915, prime);
 	gem_close(vgem, scratch.handle);
+	put_ahnd(ahnd);
 }
 
 static void test_shrink(int vgem, int i915)
@@ -509,6 +521,7 @@ static void test_blt_interleaved(int vgem, int i915)
 	uint32_t prime, native;
 	uint32_t *foreign, *local;
 	int dmabuf, i;
+	uint64_t ahnd = get_reloc_ahnd(i915, 0);
 
 	scratch.width = 1024;
 	scratch.height = 1024;
@@ -525,20 +538,22 @@ static void test_blt_interleaved(int vgem, int i915)
 
 	for (i = 0; i < scratch.height; i++) {
 		local[scratch.pitch * i / sizeof(*local)] = i;
-		igt_blitter_src_copy(i915, native, 0, scratch.pitch,
-				     I915_TILING_NONE, 0, i, scratch.width, 1,
+		igt_blitter_src_copy(i915, ahnd, 0, native, 0, scratch.pitch,
+				     I915_TILING_NONE, 0, i, scratch.size,
+				     scratch.width, 1,
 				     scratch.bpp, prime, 0, scratch.pitch,
-				     I915_TILING_NONE, 0, i);
+				     I915_TILING_NONE, 0, i, scratch.size);
 		prime_sync_start(dmabuf, true);
 		igt_assert_eq_u32(foreign[scratch.pitch * i / sizeof(*foreign)],
 				  i);
 		prime_sync_end(dmabuf, true);
 
 		foreign[scratch.pitch * i / sizeof(*foreign)] = ~i;
-		igt_blitter_src_copy(i915, prime, 0, scratch.pitch,
-				     I915_TILING_NONE, 0, i, scratch.width, 1,
+		igt_blitter_src_copy(i915, ahnd, 0, prime, 0, scratch.pitch,
+				     I915_TILING_NONE, 0, i, scratch.size,
+				     scratch.width, 1,
 				     scratch.bpp, native, 0, scratch.pitch,
-				     I915_TILING_NONE, 0, i);
+				     I915_TILING_NONE, 0, i, scratch.size);
 		gem_sync(i915, native);
 		igt_assert_eq_u32(local[scratch.pitch * i / sizeof(*local)],
 				  ~i);
@@ -551,6 +566,7 @@ static void test_blt_interleaved(int vgem, int i915)
 	gem_close(i915, native);
 	gem_close(i915, prime);
 	gem_close(vgem, scratch.handle);
+	put_ahnd(ahnd);
 }
 
 static bool prime_busy(int fd, bool excl)
@@ -559,7 +575,8 @@ static bool prime_busy(int fd, bool excl)
 	return poll(&pfd, 1, 0) == 0;
 }
 
-static void work(int i915, int dmabuf, const intel_ctx_t *ctx, unsigned ring)
+static void work(int i915, uint64_t ahnd, uint64_t scratch_offset, int dmabuf,
+		 const intel_ctx_t *ctx, unsigned ring)
 {
 	const int SCRATCH = 0;
 	const int BATCH = 1;
@@ -584,10 +601,17 @@ static void work(int i915, int dmabuf, const intel_ctx_t *ctx, unsigned ring)
 	obj[SCRATCH].handle = prime_fd_to_handle(i915, dmabuf);
 
 	obj[BATCH].handle = gem_create(i915, size);
+	obj[BATCH].offset = get_offset(ahnd, obj[BATCH].handle, size, 0);
 	obj[BATCH].relocs_ptr = (uintptr_t)store;
-	obj[BATCH].relocation_count = ARRAY_SIZE(store);
+	obj[BATCH].relocation_count = !ahnd ? ARRAY_SIZE(store) : 0;
 	memset(store, 0, sizeof(store));
 
+	if (ahnd) {
+		obj[SCRATCH].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+		obj[SCRATCH].offset = scratch_offset;
+		obj[BATCH].flags = EXEC_OBJECT_PINNED;
+	}
+
 	batch = gem_mmap__wc(i915, obj[BATCH].handle, 0, size, PROT_WRITE);
 	gem_set_domain(i915, obj[BATCH].handle,
 		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
@@ -602,8 +626,8 @@ static void work(int i915, int dmabuf, const intel_ctx_t *ctx, unsigned ring)
 		store[count].write_domain = I915_GEM_DOMAIN_INSTRUCTION;
 		batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
 		if (gen >= 8) {
-			batch[++i] = 0;
-			batch[++i] = 0;
+			batch[++i] = scratch_offset + store[count].delta;
+			batch[++i] = (scratch_offset + store[count].delta) >> 32;
 		} else if (gen >= 4) {
 			batch[++i] = 0;
 			batch[++i] = 0;
@@ -626,8 +650,8 @@ static void work(int i915, int dmabuf, const intel_ctx_t *ctx, unsigned ring)
 	batch[i] = MI_BATCH_BUFFER_START;
 	if (gen >= 8) {
 		batch[i] |= 1 << 8 | 1;
-		batch[++i] = 0;
-		batch[++i] = 0;
+		batch[++i] = obj[BATCH].offset;
+		batch[++i] = obj[BATCH].offset >> 32;
 	} else if (gen >= 6) {
 		batch[i] |= 1 << 8;
 		batch[++i] = 0;
@@ -662,14 +686,18 @@ static void test_busy(int i915, int vgem, const intel_ctx_t *ctx, unsigned ring)
 	uint32_t *ptr;
 	int dmabuf;
 	int i;
+	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id), scratch_offset;
 
 	scratch.width = 1024;
 	scratch.height = 1;
 	scratch.bpp = 32;
 	vgem_create(vgem, &scratch);
+	scratch_offset = get_offset(ahnd, scratch.handle, scratch.size, 0);
 	dmabuf = prime_handle_to_fd(vgem, scratch.handle);
 
-	work(i915, dmabuf, ctx, ring);
+	work(i915, ahnd, scratch_offset, dmabuf, ctx, ring);
+
+	put_ahnd(ahnd);
 
 	/* Calling busy in a loop should be enough to flush the rendering */
 	memset(&tv, 0, sizeof(tv));
@@ -691,14 +719,18 @@ static void test_wait(int i915, int vgem, const intel_ctx_t *ctx, unsigned ring)
 	struct pollfd pfd;
 	uint32_t *ptr;
 	int i;
+	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id), scratch_offset;
 
 	scratch.width = 1024;
 	scratch.height = 1;
 	scratch.bpp = 32;
 	vgem_create(vgem, &scratch);
+	scratch_offset = get_offset(ahnd, scratch.handle, scratch.size, 0);
 	pfd.fd = prime_handle_to_fd(vgem, scratch.handle);
 
-	work(i915, pfd.fd, ctx, ring);
+	work(i915, ahnd, scratch_offset, pfd.fd, ctx, ring);
+
+	put_ahnd(ahnd);
 
 	pfd.events = POLLIN;
 	igt_assert_eq(poll(&pfd, 1, 10000), 1);
@@ -718,18 +750,22 @@ static void test_sync(int i915, int vgem, const intel_ctx_t *ctx, unsigned ring)
 	uint32_t *ptr;
 	int dmabuf;
 	int i;
+	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id), scratch_offset;
 
 	scratch.width = 1024;
 	scratch.height = 1;
 	scratch.bpp = 32;
 	vgem_create(vgem, &scratch);
+	scratch_offset = get_offset(ahnd, scratch.handle, scratch.size, 0);
 	dmabuf = prime_handle_to_fd(vgem, scratch.handle);
 
 	ptr = mmap(NULL, scratch.size, PROT_READ, MAP_SHARED, dmabuf, 0);
 	igt_assert(ptr != MAP_FAILED);
 	gem_close(vgem, scratch.handle);
 
-	work(i915, dmabuf, ctx, ring);
+	work(i915, ahnd, scratch_offset, dmabuf, ctx, ring);
+
+	put_ahnd(ahnd);
 
 	prime_sync_start(dmabuf, false);
 	for (i = 0; i < 1024; i++)
@@ -746,12 +782,13 @@ static void test_fence_wait(int i915, int vgem, const intel_ctx_t *ctx, unsigned
 	uint32_t fence;
 	uint32_t *ptr;
 	int dmabuf;
+	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id), scratch_offset;
 
 	scratch.width = 1024;
 	scratch.height = 1;
 	scratch.bpp = 32;
 	vgem_create(vgem, &scratch);
-
+	scratch_offset = get_offset(ahnd, scratch.handle, scratch.size, 0);
 	dmabuf = prime_handle_to_fd(vgem, scratch.handle);
 	fence = vgem_fence_attach(vgem, &scratch, VGEM_FENCE_WRITE);
 	igt_assert(prime_busy(dmabuf, false));
@@ -760,10 +797,14 @@ static void test_fence_wait(int i915, int vgem, const intel_ctx_t *ctx, unsigned
 	ptr = mmap(NULL, scratch.size, PROT_READ, MAP_SHARED, dmabuf, 0);
 	igt_assert(ptr != MAP_FAILED);
 
-	igt_fork(child, 1)
-		work(i915, dmabuf, ctx, ring);
+	igt_fork(child, 1) {
+		ahnd = get_reloc_ahnd(i915, ctx->id);
+		work(i915, ahnd, scratch_offset, dmabuf, ctx, ring);
+		put_ahnd(ahnd);
+	}
 
 	sleep(1);
+	put_ahnd(ahnd);
 
 	/* Check for invalidly completing the task early */
 	for (int i = 0; i < 1024; i++)
@@ -789,11 +830,13 @@ static void test_fence_hang(int i915, int vgem, unsigned flags)
 	uint32_t *ptr;
 	int dmabuf;
 	int i;
+	uint64_t ahnd = get_reloc_ahnd(i915, 0), scratch_offset;
 
 	scratch.width = 1024;
 	scratch.height = 1;
 	scratch.bpp = 32;
 	vgem_create(vgem, &scratch);
+	scratch_offset = get_offset(ahnd, scratch.handle, scratch.size, 0);
 	dmabuf = prime_handle_to_fd(vgem, scratch.handle);
 	vgem_fence_attach(vgem, &scratch, flags | WIP_VGEM_FENCE_NOTIMEOUT);
 
@@ -801,7 +844,9 @@ static void test_fence_hang(int i915, int vgem, unsigned flags)
 	igt_assert(ptr != MAP_FAILED);
 	gem_close(vgem, scratch.handle);
 
-	work(i915, dmabuf, intel_ctx_0(i915), 0);
+	work(i915, ahnd, scratch_offset, dmabuf, intel_ctx_0(i915), 0);
+
+	put_ahnd(ahnd);
 
 	/* The work should have been cancelled */
 
@@ -1146,8 +1191,6 @@ igt_main
 		igt_subtest("basic-fence-blt")
 			test_fence_blt(i915, vgem);
 
-		test_each_engine("fence-wait", vgem, i915, test_fence_wait);
-
 		igt_subtest("basic-fence-flip")
 			test_flip(i915, vgem, 0);
 
@@ -1166,6 +1209,21 @@ igt_main
 		}
 	}
 
+	/* Fence testing, requires multiprocess allocator */
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(vgem_has_fences(vgem));
+			intel_allocator_multiprocess_start();
+		}
+
+		test_each_engine("fence-wait", vgem, i915, test_fence_wait);
+
+		igt_fixture {
+			intel_allocator_multiprocess_stop();
+		}
+	}
+
+
 	igt_fixture {
 		close(i915);
 		close(vgem);
-- 
2.26.0
