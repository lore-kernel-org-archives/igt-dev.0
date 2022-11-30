Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D6D10E417
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Nov 2022 07:08:20 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 30 Nov 2022 08:08:00 +0100
Message-Id: <0650acb98ad1ddf5f9ea43329a968d93427a4d41.1669791691.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1669791691.git.karolina.stolarek@intel.com>
References: <cover.1669791691.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/intel_batchbuffer: Use correct
 engine id in exec_blit()
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

exec_blit() assumes fixed id of the blitter engine. This is
not correct as the userspace contexts might have engines
stored in a different order.

Make exec_blit accept context configuration that describes
the engine layout, and use it to find the proper engine id.
Update signatures of igt_blitter_src_copy() and
igt_blitter_fast_copy__raw() to reflect that change. Correct
function calls in the tests. Move find_engine() definition
higher up, so it can be used in exec_blit().

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/igt_fb.c            |  4 +--
 lib/intel_batchbuffer.c | 54 +++++++++++++++++++++++++----------------
 lib/intel_batchbuffer.h |  2 ++
 tests/kms_prime.c       |  6 +++--
 tests/prime_vgem.c      | 14 +++++------
 5 files changed, 48 insertions(+), 32 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 780283a0..ed462313 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2710,7 +2710,7 @@ static void blitcopy(const struct igt_fb *dst_fb,
 		 */
 		if (fast_blit_ok(src_fb) && fast_blit_ok(dst_fb)) {
 			igt_blitter_fast_copy__raw(dst_fb->fd,
-						   ahnd, ctx,
+						   ahnd, ctx, NULL,
 						   src_fb->gem_handle,
 						   src_fb->offsets[i],
 						   src_fb->strides[i],
@@ -2728,7 +2728,7 @@ static void blitcopy(const struct igt_fb *dst_fb,
 						   dst_fb->size);
 		} else {
 			igt_blitter_src_copy(dst_fb->fd,
-					     ahnd, ctx,
+					     ahnd, ctx, NULL,
 					     src_fb->gem_handle,
 					     src_fb->offsets[i],
 					     src_fb->strides[i],
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 00a263f2..5c76fdb1 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -712,14 +712,37 @@ fill_object(struct drm_i915_gem_exec_object2 *obj,
 	obj->relocs_ptr = to_user_pointer(relocs);
 }
 
+static uint32_t find_engine(const intel_ctx_cfg_t *cfg, unsigned int class)
+{
+	unsigned int i;
+	uint32_t engine_id = -1;
+
+	for (i = 0; i < cfg->num_engines; i++) {
+		if (cfg->engines[i].engine_class == class)
+			engine_id = i;
+	}
+
+	igt_assert_f(engine_id != -1, "Requested engine not found!\n");
+
+	return engine_id;
+}
+
 static void exec_blit(int fd,
-		      struct drm_i915_gem_exec_object2 *objs, uint32_t count,
-		      unsigned int gen, uint32_t ctx)
+		      struct drm_i915_gem_exec_object2 *objs,
+		      uint32_t count, unsigned int gen,
+		      uint32_t ctx, const intel_ctx_cfg_t *cfg)
 {
-	struct drm_i915_gem_execbuffer2 exec = {
+	struct drm_i915_gem_execbuffer2 exec;
+	uint32_t devid = intel_get_drm_devid(fd);
+	uint32_t blt_id = HAS_BLT_RING(devid) ? I915_EXEC_BLT : I915_EXEC_DEFAULT;
+
+	if (cfg)
+		blt_id = find_engine(cfg, I915_ENGINE_CLASS_COPY);
+
+	exec = (struct drm_i915_gem_execbuffer2) {
 		.buffers_ptr = to_user_pointer(objs),
 		.buffer_count = count,
-		.flags = gen >= 6 ? I915_EXEC_BLT : 0 | I915_EXEC_NO_RELOC,
+		.flags = blt_id | I915_EXEC_NO_RELOC,
 		.rsvd1 = ctx,
 	};
 
@@ -772,6 +795,7 @@ static uint32_t src_copy_dword1(uint32_t dst_pitch, uint32_t bpp)
  * @fd: file descriptor of the i915 driver
  * @ahnd: handle to an allocator
  * @ctx: context within which execute copy blit
+ * @cfg: intel_ctx configuration, NULL for default context or legacy mode
  * @src_handle: GEM handle of the source buffer
  * @src_delta: offset into the source GEM bo, in bytes
  * @src_stride: Stride (in bytes) of the source buffer
@@ -795,6 +819,7 @@ static uint32_t src_copy_dword1(uint32_t dst_pitch, uint32_t bpp)
 void igt_blitter_src_copy(int fd,
 			  uint64_t ahnd,
 			  uint32_t ctx,
+			  const intel_ctx_cfg_t *cfg,
 			  /* src */
 			  uint32_t src_handle,
 			  uint32_t src_delta,
@@ -932,7 +957,7 @@ void igt_blitter_src_copy(int fd,
 		objs[2].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 	}
 
-	exec_blit(fd, objs, 3, gen, ctx);
+	exec_blit(fd, objs, 3, gen, ctx, cfg);
 
 	gem_close(fd, batch_handle);
 }
@@ -942,6 +967,7 @@ void igt_blitter_src_copy(int fd,
  * @fd: file descriptor of the i915 driver
  * @ahnd: handle to an allocator
  * @ctx: context within which execute copy blit
+ * @cfg: intel_ctx configuration, NULL for default context or legacy mode
  * @src_handle: GEM handle of the source buffer
  * @src_delta: offset into the source GEM bo, in bytes
  * @src_stride: Stride (in bytes) of the source buffer
@@ -965,6 +991,7 @@ void igt_blitter_src_copy(int fd,
 void igt_blitter_fast_copy__raw(int fd,
 				uint64_t ahnd,
 				uint32_t ctx,
+				const intel_ctx_cfg_t *cfg,
 				/* src */
 				uint32_t src_handle,
 				unsigned int src_delta,
@@ -1052,7 +1079,7 @@ void igt_blitter_fast_copy__raw(int fd,
 		objs[2].flags |= EXEC_OBJECT_PINNED;
 	}
 
-	exec_blit(fd, objs, 3, intel_gen(intel_get_drm_devid(fd)), ctx);
+	exec_blit(fd, objs, 3, intel_gen(intel_get_drm_devid(fd)), ctx, cfg);
 
 	gem_close(fd, batch_handle);
 }
@@ -1500,21 +1527,6 @@ static bool has_ctx_cfg(struct intel_bb *ibb)
 	return ibb->cfg && ibb->cfg->num_engines > 0;
 }
 
-static uint32_t find_engine(const intel_ctx_cfg_t *cfg, unsigned int class)
-{
-	unsigned int i;
-	uint32_t engine_id = -1;
-
-	for (i = 0; i < cfg->num_engines; i++) {
-		if (cfg->engines[i].engine_class == class)
-			engine_id = i;
-	}
-
-	igt_assert_f(engine_id != -1, "Requested engine not found!\n");
-
-	return engine_id;
-}
-
 /**
  * intel_bb_create:
  * @i915: drm fd
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 2c19c39b..2418cb56 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -274,6 +274,7 @@ unsigned int igt_buf_intel_ccs_height(unsigned int gen,
 void igt_blitter_src_copy(int fd,
 			  uint64_t ahnd,
 			  uint32_t ctx,
+			  const intel_ctx_cfg_t *cfg,
 			  /* src */
 			  uint32_t src_handle,
 			  uint32_t src_delta,
@@ -307,6 +308,7 @@ void igt_blitter_fast_copy(struct intel_batchbuffer *batch,
 void igt_blitter_fast_copy__raw(int fd,
 				uint64_t ahnd,
 				uint32_t ctx,
+				const intel_ctx_cfg_t *cfg,
 				/* src */
 				uint32_t src_handle,
 				unsigned int src_delta,
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 097c2f2a..ad199915 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -165,8 +165,10 @@ static void import_fb(int importer_fd, struct igt_fb *fb,
 								       fb->drm_format, fb->modifier, pitch, &fb_size, NULL, NULL);
 			igt_assert(fb->gem_handle > 0);
 
-			igt_blitter_src_copy(importer_fd, ahnd, 0, temp_buf_handle, 0, pitch, fb->modifier, 0, 0, fb_size,
-					     fb->width, fb->height, 32, fb->gem_handle, 0, pitch, fb->modifier, 0, 0, fb_size);
+			igt_blitter_src_copy(importer_fd, ahnd, 0, NULL, temp_buf_handle,
+					     0, pitch, fb->modifier, 0, 0, fb_size, fb->width,
+					     fb->height, 32, fb->gem_handle, 0, pitch, fb->modifier,
+					     0, 0, fb_size);
 
 			gem_sync(importer_fd, fb->gem_handle);
 			gem_close(importer_fd, temp_buf_handle);
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index be3f3ac7..f876e748 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -225,7 +225,7 @@ static void test_fence_blt(int i915, int vgem)
 		write(master[1], &child, sizeof(child));
 		read(slave[0], &child, sizeof(child));
 
-		igt_blitter_src_copy(i915, ahnd, 0, prime, 0, scratch.pitch,
+		igt_blitter_src_copy(i915, ahnd, 0, NULL, prime, 0, scratch.pitch,
 				     I915_TILING_NONE, 0, 0, scratch.size,
 				     scratch.width, scratch.height, scratch.bpp,
 				     native, 0, scratch.pitch,
@@ -398,7 +398,7 @@ static void test_blt(int vgem, int i915)
 		ptr[scratch.pitch * i / sizeof(*ptr)] = i;
 	munmap(ptr, scratch.size);
 
-	igt_blitter_src_copy(i915, ahnd, 0, native, 0, scratch.pitch,
+	igt_blitter_src_copy(i915, ahnd, 0, NULL, native, 0, scratch.pitch,
 			     I915_TILING_NONE, 0, 0, scratch.size,
 			     scratch.width, scratch.height, scratch.bpp,
 			     prime, 0, scratch.pitch, I915_TILING_NONE, 0, 0,
@@ -414,7 +414,7 @@ static void test_blt(int vgem, int i915)
 	}
 	munmap(ptr, scratch.size);
 
-	igt_blitter_src_copy(i915, ahnd, 0, prime, 0, scratch.pitch,
+	igt_blitter_src_copy(i915, ahnd, 0, NULL, prime, 0, scratch.pitch,
 			     I915_TILING_NONE, 0, 0, scratch.size,
 			     scratch.width, scratch.height, scratch.bpp,
 			     native, 0, scratch.pitch, I915_TILING_NONE, 0, 0,
@@ -538,9 +538,9 @@ static void test_blt_interleaved(int vgem, int i915)
 
 	for (i = 0; i < SLOW_QUICK(scratch.height, 64); i++) {
 		local[scratch.pitch * i / sizeof(*local)] = i;
-		igt_blitter_src_copy(i915, ahnd, 0, native, 0, scratch.pitch,
-				     I915_TILING_NONE, 0, i, scratch.size,
-				     scratch.width, 1,
+		igt_blitter_src_copy(i915, ahnd, 0, NULL, native, 0,
+				     scratch.pitch, I915_TILING_NONE, 0, i,
+				     scratch.size, scratch.width, 1,
 				     scratch.bpp, prime, 0, scratch.pitch,
 				     I915_TILING_NONE, 0, i, scratch.size);
 		prime_sync_start(dmabuf, true);
@@ -549,7 +549,7 @@ static void test_blt_interleaved(int vgem, int i915)
 		prime_sync_end(dmabuf, true);
 
 		foreign[scratch.pitch * i / sizeof(*foreign)] = ~i;
-		igt_blitter_src_copy(i915, ahnd, 0, prime, 0, scratch.pitch,
+		igt_blitter_src_copy(i915, ahnd, 0, NULL, prime, 0, scratch.pitch,
 				     I915_TILING_NONE, 0, i, scratch.size,
 				     scratch.width, 1,
 				     scratch.bpp, native, 0, scratch.pitch,
-- 
2.25.1
