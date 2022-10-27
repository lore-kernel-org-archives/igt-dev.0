Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C20010E6D3
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Oct 2022 19:42:35 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Oct 2022 01:11:35 +0530
Message-Id: <20221027194135.3758000-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/gem_linear_blits: gem_linear_blits
 and prime_vgem tests extended for MTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: cq.tang@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Arjun Melkaveri <arjun.melkaveri@intel.com> 

gem_linear_blits and prime_vgem tests were crashing on MTL(simulation).
Extended this tests to use new copy command i.e. XY_FAST_COPY_BLT.

Cc: CQ Tang <cq.tang@intel.com>
Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
Acked-by: priyanka dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_linear_blits.c | 62 +++++++++++++++++++++++------------
 tests/prime_vgem.c            | 58 +++++++++++++++++---------------
 2 files changed, 73 insertions(+), 47 deletions(-)

diff --git a/tests/i915/gem_linear_blits.c b/tests/i915/gem_linear_blits.c
index d02751be..3b3dfb7b 100644
--- a/tests/i915/gem_linear_blits.c
+++ b/tests/i915/gem_linear_blits.c
@@ -67,6 +67,7 @@ static void copy(int fd, uint64_t ahnd, uint32_t dst, uint32_t src,
 	struct drm_i915_gem_relocation_entry reloc[2];
 	struct drm_i915_gem_exec_object2 obj[3];
 	struct drm_i915_gem_execbuffer2 exec;
+	static uint32_t devid;
 	int i = 0;
 
 	memset(obj, 0, sizeof(obj));
@@ -83,29 +84,48 @@ static void copy(int fd, uint64_t ahnd, uint32_t dst, uint32_t src,
 	obj[2].offset = CANONICAL(obj[2].offset);
 	obj[2].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 
-	batch[i++] = XY_SRC_COPY_BLT_CMD |
+	 if (intel_graphics_ver(devid) >= IP_VER(12, 60)) {
+                batch[i++] = XY_FAST_COPY_BLT;
+                batch[i] = XY_FAST_COPY_COLOR_DEPTH_32 | WIDTH*4;
+                if (intel_graphics_ver(devid) >= IP_VER(20, 0))
+                        batch[i] |= XY_FAST_COPY_SRC_TILING_Yf |
+                                XY_FAST_COPY_DST_TILING_Yf;
+                i++;
+                batch[i++] = 0;/* dst x1,y1 */
+                batch[i++] = (HEIGHT << 16) | WIDTH;/* dst x2,y2 */
+                batch[i++] = obj[0].offset;       /* dst address lower bits */
+                batch[i++] = obj[0].offset >> 32; /* dst address upper bits */
+                batch[i++] = 0;/* src x1,y1 */
+                batch[i++] = WIDTH*4;/* src pitch */
+                batch[i++] = obj[1].offset;       /* src address lower bits */
+                batch[i++] = obj[1].offset >> 32; /* src address upper bits */
+                batch[i++] = MI_BATCH_BUFFER_END;
+                batch[i++] = MI_NOOP;
+        } else {
+		batch[i++] = XY_SRC_COPY_BLT_CMD |
 		  XY_SRC_COPY_BLT_WRITE_ALPHA |
 		  XY_SRC_COPY_BLT_WRITE_RGB;
-	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
-		batch[i - 1] |= 8;
-	else
-		batch[i - 1] |= 6;
-
-	batch[i++] = (3 << 24) | /* 32 bits */
-		  (0xcc << 16) | /* copy ROP */
-		  WIDTH*4;
-	batch[i++] = 0; /* dst x1,y1 */
-	batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
-	batch[i++] = obj[0].offset;
-	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
-		batch[i++] = obj[0].offset >> 32;
-	batch[i++] = 0; /* src x1,y1 */
-	batch[i++] = WIDTH*4;
-	batch[i++] = obj[1].offset;
-	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
-		batch[i++] = obj[1].offset >> 32;
-	batch[i++] = MI_BATCH_BUFFER_END;
-	batch[i++] = MI_NOOP;
+		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+			batch[i - 1] |= 8;
+		else
+			batch[i - 1] |= 6;
+
+		batch[i++] = (3 << 24) | /* 32 bits */
+		  	(0xcc << 16) | /* copy ROP */
+		  	WIDTH*4;
+		batch[i++] = 0; /* dst x1,y1 */
+		batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
+		batch[i++] = obj[0].offset;
+		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+			batch[i++] = obj[0].offset >> 32;
+		batch[i++] = 0; /* src x1,y1 */
+		batch[i++] = WIDTH*4;
+		batch[i++] = obj[1].offset;
+		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+			batch[i++] = obj[1].offset >> 32;
+		batch[i++] = MI_BATCH_BUFFER_END;
+		batch[i++] = MI_NOOP;
+	}
 
 	gem_write(fd, obj[2].handle, 0, batch, i * sizeof(batch[0]));
 
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 95c8e4fe..b73ea6ee 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -33,6 +33,12 @@
 
 IGT_TEST_DESCRIPTION("Basic check of polling for prime/vgem fences.");
 
+static uint32_t devid;
+
+#define blitter_copy(expr...) (intel_graphics_ver(devid) >= IP_VER(12, 60) ? \
+                               (igt_blitter_fast_copy__raw(expr)) : \
+                              (igt_blitter_src_copy(expr)))
+
 static void test_read(int vgem, int i915)
 {
 	struct vgem_bo scratch;
@@ -225,11 +231,11 @@ static void test_fence_blt(int i915, int vgem)
 		write(master[1], &child, sizeof(child));
 		read(slave[0], &child, sizeof(child));
 
-		igt_blitter_src_copy(i915, ahnd, 0, prime, 0, scratch.pitch,
-				     I915_TILING_NONE, 0, 0, scratch.size,
-				     scratch.width, scratch.height, scratch.bpp,
-				     native, 0, scratch.pitch,
-				     I915_TILING_NONE, 0, 0, scratch.size);
+		 blitter_copy(i915, ahnd, 0, prime, 0, scratch.pitch,
+                             I915_TILING_NONE, 0, 0, scratch.size,
+                             scratch.width, scratch.height, scratch.bpp,
+                             native, 0, scratch.pitch,
+                             I915_TILING_NONE, 0, 0, scratch.size);
 		gem_sync(i915, native);
 
 		for (i = 0; i < scratch.height; i++)
@@ -398,11 +404,11 @@ static void test_blt(int vgem, int i915)
 		ptr[scratch.pitch * i / sizeof(*ptr)] = i;
 	munmap(ptr, scratch.size);
 
-	igt_blitter_src_copy(i915, ahnd, 0, native, 0, scratch.pitch,
-			     I915_TILING_NONE, 0, 0, scratch.size,
-			     scratch.width, scratch.height, scratch.bpp,
-			     prime, 0, scratch.pitch, I915_TILING_NONE, 0, 0,
-			     scratch.size);
+	blitter_copy(i915, ahnd, 0, native, 0, scratch.pitch,
+                     I915_TILING_NONE, 0, 0, scratch.size,
+                     scratch.width, scratch.height, scratch.bpp,
+                     prime, 0, scratch.pitch, I915_TILING_NONE, 0, 0,
+                     scratch.size);
 	prime_sync_start(dmabuf, true);
 	prime_sync_end(dmabuf, true);
 	close(dmabuf);
@@ -414,11 +420,11 @@ static void test_blt(int vgem, int i915)
 	}
 	munmap(ptr, scratch.size);
 
-	igt_blitter_src_copy(i915, ahnd, 0, prime, 0, scratch.pitch,
-			     I915_TILING_NONE, 0, 0, scratch.size,
-			     scratch.width, scratch.height, scratch.bpp,
-			     native, 0, scratch.pitch, I915_TILING_NONE, 0, 0,
-			     scratch.size);
+	blitter_copy(i915, ahnd, 0, prime, 0, scratch.pitch,
+                     I915_TILING_NONE, 0, 0, scratch.size,
+                     scratch.width, scratch.height, scratch.bpp,
+                     native, 0, scratch.pitch, I915_TILING_NONE, 0, 0,
+                     scratch.size);
 	gem_sync(i915, native);
 
 	ptr = gem_mmap__device_coherent(i915, native, 0, scratch.size, PROT_READ);
@@ -536,24 +542,24 @@ static void test_blt_interleaved(int vgem, int i915)
 	foreign = vgem_mmap(vgem, &scratch, PROT_WRITE);
 	local = gem_mmap__device_coherent(i915, native, 0, scratch.size, PROT_WRITE);
 
-	for (i = 0; i < scratch.height; i++) {
+	for (i = 0; i < SLOW_QUICK(scratch.height, 64); i++) {
 		local[scratch.pitch * i / sizeof(*local)] = i;
-		igt_blitter_src_copy(i915, ahnd, 0, native, 0, scratch.pitch,
-				     I915_TILING_NONE, 0, i, scratch.size,
-				     scratch.width, 1,
-				     scratch.bpp, prime, 0, scratch.pitch,
-				     I915_TILING_NONE, 0, i, scratch.size);
+		blitter_copy(i915, ahnd, 0, native, 0, scratch.pitch,
+                             I915_TILING_NONE, 0, i, scratch.size,
+                             scratch.width, 1,
+                             scratch.bpp, prime, 0, scratch.pitch,
+                             I915_TILING_NONE, 0, i, scratch.size);
 		prime_sync_start(dmabuf, true);
 		igt_assert_eq_u32(foreign[scratch.pitch * i / sizeof(*foreign)],
 				  i);
 		prime_sync_end(dmabuf, true);
 
 		foreign[scratch.pitch * i / sizeof(*foreign)] = ~i;
-		igt_blitter_src_copy(i915, ahnd, 0, prime, 0, scratch.pitch,
-				     I915_TILING_NONE, 0, i, scratch.size,
-				     scratch.width, 1,
-				     scratch.bpp, native, 0, scratch.pitch,
-				     I915_TILING_NONE, 0, i, scratch.size);
+		blitter_copy(i915, ahnd, 0, prime, 0, scratch.pitch,
+                             I915_TILING_NONE, 0, i, scratch.size,
+                             scratch.width, 1,
+                             scratch.bpp, native, 0, scratch.pitch,
+                             I915_TILING_NONE, 0, i, scratch.size);		
 		gem_sync(i915, native);
 		igt_assert_eq_u32(local[scratch.pitch * i / sizeof(*local)],
 				  ~i);
-- 
2.25.1
