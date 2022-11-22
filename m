Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E05E10E3E4
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Nov 2022 14:00:27 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 22 Nov 2022 15:00:06 +0100
Message-Id: <20221122140007.71246-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221122140007.71246-1-zbigniew.kempczynski@intel.com>
References: <20221122140007.71246-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] benchmarks/intel_upload_blit_*: Remove
 libdrm in upload blits
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

Few benchmarks still used libdrm so let's rewrite them to be libdrm
free. I tried to mimic the libdrm behavior as much as possible but
according how libdrm caches handles/mappings there may be some
differences in performance execution.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 benchmarks/intel_upload_blit_large.c     | 131 ++++++++++++---------
 benchmarks/intel_upload_blit_large_gtt.c | 130 ++++++++++++---------
 benchmarks/intel_upload_blit_large_map.c | 132 ++++++++++++---------
 benchmarks/intel_upload_blit_small.c     | 139 ++++++++++++++---------
 4 files changed, 311 insertions(+), 221 deletions(-)

diff --git a/benchmarks/intel_upload_blit_large.c b/benchmarks/intel_upload_blit_large.c
index 12bbae3d06..af52d7a4e5 100644
--- a/benchmarks/intel_upload_blit_large.c
+++ b/benchmarks/intel_upload_blit_large.c
@@ -45,6 +45,7 @@
  */
 
 #include "igt.h"
+#include "i915/gem_create.h"
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
@@ -72,74 +73,99 @@ get_time_in_secs(void)
 }
 
 static void
-do_render(drm_intel_bufmgr *bufmgr, struct intel_batchbuffer *batch,
-	  drm_intel_bo *dst_bo, int width, int height)
+do_render(int i915, uint32_t dst_handle)
 {
-	uint32_t data[width * height];
-	drm_intel_bo *src_bo;
-	int i;
+	struct drm_i915_gem_execbuffer2 exec = {};
+	struct drm_i915_gem_exec_object2 obj[3] = {};
+	struct drm_i915_gem_relocation_entry reloc[2];
 	static uint32_t seed = 1;
+	uint32_t data[OBJECT_WIDTH * OBJECT_HEIGHT];
+	uint64_t size = OBJECT_WIDTH * OBJECT_HEIGHT * 4, bb_size = 4096;
+	uint32_t src_handle, bb_handle, *bb;
+	uint32_t gen = intel_gen(intel_get_drm_devid(i915));
+	const bool has_64b_reloc = gen >= 8;
+	int i;
+
+	bb_handle = gem_create_from_pool(i915, &bb_size, REGION_SMEM);
+	src_handle = gem_create_from_pool(i915, &size, REGION_SMEM);
 
-	/* Generate some junk.  Real workloads would be doing a lot more
-	 * work to generate the junk.
-	 */
-	for (i = 0; i < width * height; i++) {
+	for (i = 0; i < OBJECT_WIDTH * OBJECT_HEIGHT; i++)
 		data[i] = seed++;
-	}
 
-	/* Upload the junk. */
-	src_bo = drm_intel_bo_alloc(bufmgr, "src", sizeof(data), 4096);
-	drm_intel_bo_subdata(src_bo, 0, sizeof(data), data);
+	gem_write(i915, src_handle, 0, data, sizeof(data));
 
 	/* Render the junk to the dst. */
-	BLIT_COPY_BATCH_START(0);
-	OUT_BATCH((3 << 24) | /* 32 bits */
+	bb = gem_mmap__device_coherent(i915, bb_handle, 0, bb_size, PROT_WRITE);
+	i = 0;
+	bb[i++] = XY_SRC_COPY_BLT_CMD |
+		  XY_SRC_COPY_BLT_WRITE_ALPHA |
+		  XY_SRC_COPY_BLT_WRITE_RGB |
+		  (6 + 2*(gen >= 8));
+	bb[i++] = (3 << 24) | /* 32 bits */
 		  (0xcc << 16) | /* copy ROP */
-		  (width * 4) /* dst pitch */);
-	OUT_BATCH(0); /* dst x1,y1 */
-	OUT_BATCH((height << 16) | width); /* dst x2,y2 */
-	OUT_RELOC(dst_bo, I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER, 0);
-	OUT_BATCH(0); /* src x1,y1 */
-	OUT_BATCH(width * 4); /* src pitch */
-	OUT_RELOC(src_bo, I915_GEM_DOMAIN_RENDER, 0, 0);
-	ADVANCE_BATCH();
-
-	intel_batchbuffer_flush(batch);
-
-	drm_intel_bo_unreference(src_bo);
+		  (OBJECT_WIDTH * 4) /* dst pitch */;
+	bb[i++] = 0; /* dst x1,y1 */
+	bb[i++] = (OBJECT_HEIGHT << 16) | OBJECT_WIDTH; /* dst x2,y2 */
+
+	obj[0].handle = dst_handle;
+	obj[0].offset = dst_handle * size;
+	reloc[0].target_handle = dst_handle;
+	reloc[0].presumed_offset = obj[0].offset;
+	reloc[0].offset = sizeof(uint32_t) * i;
+	reloc[0].read_domains = I915_GEM_DOMAIN_RENDER;
+	reloc[0].write_domain = I915_GEM_DOMAIN_RENDER;
+	bb[i++] = obj[0].offset;
+	if (has_64b_reloc)
+		bb[i++] = obj[0].offset >> 32;
+
+	bb[i++] = 0; /* src x1,y1 */
+	bb[i++] = OBJECT_WIDTH * 4; /* src pitch */
+
+	obj[1].handle = src_handle;
+	obj[1].offset = src_handle * size;
+	reloc[1].target_handle = src_handle;
+	reloc[1].presumed_offset = obj[1].offset;
+	reloc[1].offset = sizeof(uint32_t) * i;
+	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
+	reloc[1].write_domain = 0;
+	bb[i++] = obj[1].offset;
+	if (has_64b_reloc)
+		bb[i++] = obj[1].offset >> 32;
+
+	obj[2].handle = bb_handle;
+	obj[2].relocs_ptr = to_user_pointer(reloc);
+	obj[2].relocation_count = 2;
+
+	bb[i++] = MI_BATCH_BUFFER_END;
+	gem_munmap(bb, bb_size);
+
+	exec.buffers_ptr = to_user_pointer(obj);
+	exec.buffer_count = 3;
+	exec.flags = gen >= 6 ? I915_EXEC_BLT : 0 | I915_EXEC_NO_RELOC;
+
+	gem_execbuf(i915, &exec);
 }
 
 int main(int argc, char **argv)
 {
-	int fd;
-	int object_size = OBJECT_WIDTH * OBJECT_HEIGHT * 4;
 	double start_time, end_time;
-	drm_intel_bo *dst_bo;
-	drm_intel_bufmgr *bufmgr;
-	struct intel_batchbuffer *batch;
-	int i;
-
-	fd = drm_open_driver(DRIVER_INTEL);
+	uint32_t dst_handle;
+	int i915, i;
 
-	bufmgr = drm_intel_bufmgr_gem_init(fd, 4096);
-	drm_intel_bufmgr_gem_enable_reuse(bufmgr);
-
-	batch = intel_batchbuffer_alloc(bufmgr, intel_get_drm_devid(fd));
-
-	dst_bo = drm_intel_bo_alloc(bufmgr, "dst", object_size, 4096);
+	i915 = drm_open_driver(DRIVER_INTEL);
+	dst_handle = gem_create(i915, OBJECT_WIDTH * OBJECT_HEIGHT * 4);
 
 	/* Prep loop to get us warmed up. */
-	for (i = 0; i < 60; i++) {
-		do_render(bufmgr, batch, dst_bo, OBJECT_WIDTH, OBJECT_HEIGHT);
-	}
-	drm_intel_bo_wait_rendering(dst_bo);
+	for (i = 0; i < 60; i++)
+		do_render(i915, dst_handle);
+	gem_sync(i915, dst_handle);
 
 	/* Do the actual timing. */
 	start_time = get_time_in_secs();
-	for (i = 0; i < 200; i++) {
-		do_render(bufmgr, batch, dst_bo, OBJECT_WIDTH, OBJECT_HEIGHT);
-	}
-	drm_intel_bo_wait_rendering(dst_bo);
+	for (i = 0; i < 200; i++)
+		do_render(i915, dst_handle);
+	gem_sync(i915, dst_handle);
+
 	end_time = get_time_in_secs();
 
 	printf("%d iterations in %.03f secs: %.01f MB/sec\n", i,
@@ -147,10 +173,5 @@ int main(int argc, char **argv)
 	       (double)i * OBJECT_WIDTH * OBJECT_HEIGHT * 4 / 1024.0 / 1024.0 /
 	       (end_time - start_time));
 
-	intel_batchbuffer_free(batch);
-	drm_intel_bufmgr_destroy(bufmgr);
-
-	close(fd);
-
-	return 0;
+	close(i915);
 }
diff --git a/benchmarks/intel_upload_blit_large_gtt.c b/benchmarks/intel_upload_blit_large_gtt.c
index 0b704b57d4..1e991a6b24 100644
--- a/benchmarks/intel_upload_blit_large_gtt.c
+++ b/benchmarks/intel_upload_blit_large_gtt.c
@@ -45,6 +45,7 @@
  */
 
 #include "igt.h"
+#include "i915/gem_create.h"
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
@@ -69,74 +70,98 @@ get_time_in_secs(void)
 }
 
 static void
-do_render(drm_intel_bufmgr *bufmgr, struct intel_batchbuffer *batch,
-	  drm_intel_bo *dst_bo, int width, int height)
+do_render(int i915, uint32_t dst_handle)
 {
-	uint32_t *data;
-	drm_intel_bo *src_bo;
-	int i;
+	struct drm_i915_gem_execbuffer2 exec = {};
+	struct drm_i915_gem_exec_object2 obj[3] = {};
+	struct drm_i915_gem_relocation_entry reloc[2];
 	static uint32_t seed = 1;
+	uint64_t size = OBJECT_WIDTH * OBJECT_HEIGHT * 4, bb_size = 4096;
+	uint32_t *data, src_handle, bb_handle, *bb;
+	uint32_t gen = intel_gen(intel_get_drm_devid(i915));
+	const bool has_64b_reloc = gen >= 8;
+	int i;
 
-	src_bo = drm_intel_bo_alloc(bufmgr, "src", width * height * 4, 4096);
-
-	drm_intel_gem_bo_map_gtt(src_bo);
+	bb_handle = gem_create_from_pool(i915, &bb_size, REGION_SMEM);
+	src_handle = gem_create_from_pool(i915, &size, REGION_SMEM);
 
-	data = src_bo->virtual;
-	for (i = 0; i < width * height; i++) {
+	data = gem_mmap__gtt(i915, src_handle, size, PROT_WRITE);
+	for (i = 0; i < OBJECT_WIDTH * OBJECT_HEIGHT; i++)
 		data[i] = seed++;
-	}
-
-	drm_intel_gem_bo_unmap_gtt(src_bo);
+	gem_munmap(data, size);
 
 	/* Render the junk to the dst. */
-	BLIT_COPY_BATCH_START(0);
-	OUT_BATCH((3 << 24) | /* 32 bits */
+	bb = gem_mmap__device_coherent(i915, bb_handle, 0, bb_size, PROT_WRITE);
+	i = 0;
+	bb[i++] = XY_SRC_COPY_BLT_CMD |
+		  XY_SRC_COPY_BLT_WRITE_ALPHA |
+		  XY_SRC_COPY_BLT_WRITE_RGB |
+		  (6 + 2*(gen >= 8));
+	bb[i++] = (3 << 24) | /* 32 bits */
 		  (0xcc << 16) | /* copy ROP */
-		  (width * 4) /* dst pitch */);
-	OUT_BATCH(0); /* dst x1,y1 */
-	OUT_BATCH((height << 16) | width); /* dst x2,y2 */
-	OUT_RELOC(dst_bo, I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER, 0);
-	OUT_BATCH(0); /* src x1,y1 */
-	OUT_BATCH(width * 4); /* src pitch */
-	OUT_RELOC(src_bo, I915_GEM_DOMAIN_RENDER, 0, 0);
-	ADVANCE_BATCH();
-
-	intel_batchbuffer_flush(batch);
-
-	drm_intel_bo_unreference(src_bo);
+		  (OBJECT_WIDTH * 4) /* dst pitch */;
+	bb[i++] = 0; /* dst x1,y1 */
+	bb[i++] = (OBJECT_HEIGHT << 16) | OBJECT_WIDTH; /* dst x2,y2 */
+
+	obj[0].handle = dst_handle;
+	obj[0].offset = dst_handle * size;
+	reloc[0].target_handle = dst_handle;
+	reloc[0].presumed_offset = obj[0].offset;
+	reloc[0].offset = sizeof(uint32_t) * i;
+	reloc[0].read_domains = I915_GEM_DOMAIN_RENDER;
+	reloc[0].write_domain = I915_GEM_DOMAIN_RENDER;
+	bb[i++] = obj[0].offset;
+	if (has_64b_reloc)
+		bb[i++] = obj[0].offset >> 32;
+
+	bb[i++] = 0; /* src x1,y1 */
+	bb[i++] = OBJECT_WIDTH * 4; /* src pitch */
+
+	obj[1].handle = src_handle;
+	obj[1].offset = src_handle * size;
+	reloc[1].target_handle = src_handle;
+	reloc[1].presumed_offset = obj[1].offset;
+	reloc[1].offset = sizeof(uint32_t) * i;
+	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
+	reloc[1].write_domain = 0;
+	bb[i++] = obj[1].offset;
+	if (has_64b_reloc)
+		bb[i++] = obj[1].offset >> 32;
+
+	obj[2].handle = bb_handle;
+	obj[2].relocs_ptr = to_user_pointer(reloc);
+	obj[2].relocation_count = 2;
+
+	bb[i++] = MI_BATCH_BUFFER_END;
+	gem_munmap(bb, bb_size);
+
+	exec.buffers_ptr = to_user_pointer(obj);
+	exec.buffer_count = 3;
+	exec.flags = gen >= 6 ? I915_EXEC_BLT : 0 | I915_EXEC_NO_RELOC;
+
+	gem_execbuf(i915, &exec);
 }
 
 int main(int argc, char **argv)
 {
-	int fd;
-	int object_size = OBJECT_WIDTH * OBJECT_HEIGHT * 4;
 	double start_time, end_time;
-	drm_intel_bo *dst_bo;
-	drm_intel_bufmgr *bufmgr;
-	struct intel_batchbuffer *batch;
-	int i;
-
-	fd = drm_open_driver(DRIVER_INTEL);
+	uint32_t dst_handle;
+	int i915, i;
 
-	bufmgr = drm_intel_bufmgr_gem_init(fd, 4096);
-	drm_intel_bufmgr_gem_enable_reuse(bufmgr);
-
-	batch = intel_batchbuffer_alloc(bufmgr, intel_get_drm_devid(fd));
-
-	dst_bo = drm_intel_bo_alloc(bufmgr, "dst", object_size, 4096);
+	i915 = drm_open_driver(DRIVER_INTEL);
+	dst_handle = gem_create(i915, OBJECT_WIDTH * OBJECT_HEIGHT * 4);
 
 	/* Prep loop to get us warmed up. */
-	for (i = 0; i < 60; i++) {
-		do_render(bufmgr, batch, dst_bo, OBJECT_WIDTH, OBJECT_HEIGHT);
-	}
-	drm_intel_bo_wait_rendering(dst_bo);
+	for (i = 0; i < 60; i++)
+		do_render(i915, dst_handle);
+	gem_sync(i915, dst_handle);
 
 	/* Do the actual timing. */
 	start_time = get_time_in_secs();
-	for (i = 0; i < 200; i++) {
-		do_render(bufmgr, batch, dst_bo, OBJECT_WIDTH, OBJECT_HEIGHT);
-	}
-	drm_intel_bo_wait_rendering(dst_bo);
+	for (i = 0; i < 200; i++)
+		do_render(i915, dst_handle);
+	gem_sync(i915, dst_handle);
+
 	end_time = get_time_in_secs();
 
 	printf("%d iterations in %.03f secs: %.01f MB/sec\n", i,
@@ -144,10 +169,5 @@ int main(int argc, char **argv)
 	       (double)i * OBJECT_WIDTH * OBJECT_HEIGHT * 4 / 1024.0 / 1024.0 /
 	       (end_time - start_time));
 
-	intel_batchbuffer_free(batch);
-	drm_intel_bufmgr_destroy(bufmgr);
-
-	close(fd);
-
-	return 0;
+	close(i915);
 }
diff --git a/benchmarks/intel_upload_blit_large_map.c b/benchmarks/intel_upload_blit_large_map.c
index ae05434f26..6d3cd748cf 100644
--- a/benchmarks/intel_upload_blit_large_map.c
+++ b/benchmarks/intel_upload_blit_large_map.c
@@ -48,6 +48,7 @@
  */
 
 #include "igt.h"
+#include "i915/gem_create.h"
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
@@ -72,74 +73,99 @@ get_time_in_secs(void)
 }
 
 static void
-do_render(drm_intel_bufmgr *bufmgr, struct intel_batchbuffer *batch,
-	  drm_intel_bo *dst_bo, int width, int height)
+do_render(int i915, uint32_t dst_handle)
 {
-	uint32_t *data;
-	drm_intel_bo *src_bo;
-	int i;
+	struct drm_i915_gem_execbuffer2 exec = {};
+	struct drm_i915_gem_exec_object2 obj[3] = {};
+	struct drm_i915_gem_relocation_entry reloc[2];
 	static uint32_t seed = 1;
+	uint64_t size = OBJECT_WIDTH * OBJECT_HEIGHT * 4, bb_size = 4096;
+	uint32_t *data, src_handle, bb_handle, *bb;
+	uint32_t gen = intel_gen(intel_get_drm_devid(i915));
+	const bool has_64b_reloc = gen >= 8;
+	int i;
 
-	src_bo = drm_intel_bo_alloc(bufmgr, "src", width * height * 4, 4096);
-
-	drm_intel_bo_map(src_bo, 1);
+	bb_handle = gem_create_from_pool(i915, &bb_size, REGION_SMEM);
+	src_handle = gem_create_from_pool(i915, &size, REGION_SMEM);
 
-	data = src_bo->virtual;
-	for (i = 0; i < width * height; i++) {
+	data = gem_mmap__cpu(i915, src_handle, 0, size, PROT_WRITE);
+	for (i = 0; i < OBJECT_WIDTH * OBJECT_HEIGHT; i++)
 		data[i] = seed++;
-	}
-
-	drm_intel_bo_unmap(src_bo);
+	gem_set_domain(i915, src_handle, I915_GEM_DOMAIN_CPU, 0);
+	gem_munmap(data, size);
 
 	/* Render the junk to the dst. */
-	BLIT_COPY_BATCH_START(0);
-	OUT_BATCH((3 << 24) | /* 32 bits */
+	bb = gem_mmap__device_coherent(i915, bb_handle, 0, bb_size, PROT_WRITE);
+	i = 0;
+	bb[i++] = XY_SRC_COPY_BLT_CMD |
+		  XY_SRC_COPY_BLT_WRITE_ALPHA |
+		  XY_SRC_COPY_BLT_WRITE_RGB |
+		  (6 + 2*(gen >= 8));
+	bb[i++] = (3 << 24) | /* 32 bits */
 		  (0xcc << 16) | /* copy ROP */
-		  (width * 4) /* dst pitch */);
-	OUT_BATCH(0); /* dst x1,y1 */
-	OUT_BATCH((height << 16) | width); /* dst x2,y2 */
-	OUT_RELOC(dst_bo, I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER, 0);
-	OUT_BATCH(0); /* src x1,y1 */
-	OUT_BATCH(width * 4); /* src pitch */
-	OUT_RELOC(src_bo, I915_GEM_DOMAIN_RENDER, 0, 0);
-	ADVANCE_BATCH();
-
-	intel_batchbuffer_flush(batch);
-
-	drm_intel_bo_unreference(src_bo);
+		  (OBJECT_WIDTH * 4) /* dst pitch */;
+	bb[i++] = 0; /* dst x1,y1 */
+	bb[i++] = (OBJECT_HEIGHT << 16) | OBJECT_WIDTH; /* dst x2,y2 */
+
+	obj[0].handle = dst_handle;
+	obj[0].offset = dst_handle * size;
+	reloc[0].target_handle = dst_handle;
+	reloc[0].presumed_offset = obj[0].offset;
+	reloc[0].offset = sizeof(uint32_t) * i;
+	reloc[0].read_domains = I915_GEM_DOMAIN_RENDER;
+	reloc[0].write_domain = I915_GEM_DOMAIN_RENDER;
+	bb[i++] = obj[0].offset;
+	if (has_64b_reloc)
+		bb[i++] = obj[0].offset >> 32;
+
+	bb[i++] = 0; /* src x1,y1 */
+	bb[i++] = OBJECT_WIDTH * 4; /* src pitch */
+
+	obj[1].handle = src_handle;
+	obj[1].offset = src_handle * size;
+	reloc[1].target_handle = src_handle;
+	reloc[1].presumed_offset = obj[1].offset;
+	reloc[1].offset = sizeof(uint32_t) * i;
+	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
+	reloc[1].write_domain = 0;
+	bb[i++] = obj[1].offset;
+	if (has_64b_reloc)
+		bb[i++] = obj[1].offset >> 32;
+
+	obj[2].handle = bb_handle;
+	obj[2].relocs_ptr = to_user_pointer(reloc);
+	obj[2].relocation_count = 2;
+
+	bb[i++] = MI_BATCH_BUFFER_END;
+	gem_munmap(bb, bb_size);
+
+	exec.buffers_ptr = to_user_pointer(obj);
+	exec.buffer_count = 3;
+	exec.flags = gen >= 6 ? I915_EXEC_BLT : 0 | I915_EXEC_NO_RELOC;
+
+	gem_execbuf(i915, &exec);
 }
 
 int main(int argc, char **argv)
 {
-	int fd;
-	int object_size = OBJECT_WIDTH * OBJECT_HEIGHT * 4;
 	double start_time, end_time;
-	drm_intel_bo *dst_bo;
-	drm_intel_bufmgr *bufmgr;
-	struct intel_batchbuffer *batch;
-	int i;
-
-	fd = drm_open_driver(DRIVER_INTEL);
+	uint32_t dst_handle;
+	int i915, i;
 
-	bufmgr = drm_intel_bufmgr_gem_init(fd, 4096);
-	drm_intel_bufmgr_gem_enable_reuse(bufmgr);
-
-	batch = intel_batchbuffer_alloc(bufmgr, intel_get_drm_devid(fd));
-
-	dst_bo = drm_intel_bo_alloc(bufmgr, "dst", object_size, 4096);
+	i915 = drm_open_driver(DRIVER_INTEL);
+	dst_handle = gem_create(i915, OBJECT_WIDTH * OBJECT_HEIGHT * 4);
 
 	/* Prep loop to get us warmed up. */
-	for (i = 0; i < 60; i++) {
-		do_render(bufmgr, batch, dst_bo, OBJECT_WIDTH, OBJECT_HEIGHT);
-	}
-	drm_intel_bo_wait_rendering(dst_bo);
+	for (i = 0; i < 60; i++)
+		do_render(i915, dst_handle);
+	gem_sync(i915, dst_handle);
 
 	/* Do the actual timing. */
 	start_time = get_time_in_secs();
-	for (i = 0; i < 200; i++) {
-		do_render(bufmgr, batch, dst_bo, OBJECT_WIDTH, OBJECT_HEIGHT);
-	}
-	drm_intel_bo_wait_rendering(dst_bo);
+	for (i = 0; i < 200; i++)
+		do_render(i915, dst_handle);
+	gem_sync(i915, dst_handle);
+
 	end_time = get_time_in_secs();
 
 	printf("%d iterations in %.03f secs: %.01f MB/sec\n", i,
@@ -147,10 +173,6 @@ int main(int argc, char **argv)
 	       (double)i * OBJECT_WIDTH * OBJECT_HEIGHT * 4 / 1024.0 / 1024.0 /
 	       (end_time - start_time));
 
-	intel_batchbuffer_free(batch);
-	drm_intel_bufmgr_destroy(bufmgr);
-
-	close(fd);
-
-	return 0;
+	close(i915);
 }
+
diff --git a/benchmarks/intel_upload_blit_small.c b/benchmarks/intel_upload_blit_small.c
index 7e3346eb74..525d68e36a 100644
--- a/benchmarks/intel_upload_blit_small.c
+++ b/benchmarks/intel_upload_blit_small.c
@@ -41,6 +41,7 @@
  */
 
 #include "igt.h"
+#include "i915/gem_create.h"
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
@@ -66,21 +67,27 @@ get_time_in_secs(void)
 }
 
 static void
-do_render(drm_intel_bufmgr *bufmgr, struct intel_batchbuffer *batch,
-	  drm_intel_bo *dst_bo, int width, int height)
+do_render(int i915, uint32_t dst_handle)
 {
-	uint32_t data[64];
-	drm_intel_bo *src_bo;
-	int i;
+	struct drm_i915_gem_execbuffer2 exec = {};
+	struct drm_i915_gem_exec_object2 obj[3] = {};
+	struct drm_i915_gem_relocation_entry reloc[2];
 	static uint32_t seed = 1;
+	uint32_t data[OBJECT_WIDTH * OBJECT_HEIGHT];
+	uint64_t size = OBJECT_WIDTH * OBJECT_HEIGHT * 4, bb_size = 4096;
+	uint32_t src_handle, bb_handle, *bb;
+	uint32_t gen = intel_gen(intel_get_drm_devid(i915));
+	const bool has_64b_reloc = gen >= 8;
+	int i;
 
-	src_bo = drm_intel_bo_alloc(bufmgr, "src", width * height * 4, 4096);
+	bb_handle = gem_create_from_pool(i915, &bb_size, REGION_SMEM);
+	src_handle = gem_create_from_pool(i915, &size, REGION_SMEM);
 
 	/* Upload some junk.  Real workloads would be doing a lot more
 	 * work to generate the junk.
 	 */
-	for (i = 0; i < width * height;) {
-		int size, j;
+	for (i = 0; i < OBJECT_WIDTH * OBJECT_HEIGHT; i++) {
+		int subsize, j;
 
 		/* Choose a size from 1 to 64 dwords to upload.
 		 * Normal workloads have a distribution of sizes with a
@@ -88,68 +95,92 @@ do_render(drm_intel_bufmgr *bufmgr, struct intel_batchbuffer *batch,
 		 * pile of vertices, most likely), but I'm trying to get at
 		 * the cost of the small uploads here.
 		 */
-		size = random() % 64 + 1;
-		if (i + size > width * height)
-			size = width * height - i;
+		subsize = random() % 64 + 1;
+		if (i + subsize > OBJECT_WIDTH * OBJECT_HEIGHT)
+			subsize = OBJECT_WIDTH * OBJECT_HEIGHT - i;
 
-		for (j = 0; j < size; j++)
+		for (j = 0; j < subsize; j++)
 			data[j] = seed++;
 
 		/* Upload the junk. */
-		drm_intel_bo_subdata(src_bo, i * 4, size * 4, data);
+		//drm_intel_bo_subdata(src_bo, i * 4, size * 4, data);
+		gem_write(i915, src_handle, i * 4, data, subsize * 4);
 
-		i += size;
+		i += subsize;
 	}
 
 	/* Render the junk to the dst. */
-	BLIT_COPY_BATCH_START(0);
-	OUT_BATCH((3 << 24) | /* 32 bits */
+	bb = gem_mmap__device_coherent(i915, bb_handle, 0, bb_size, PROT_WRITE);
+	i = 0;
+	bb[i++] = XY_SRC_COPY_BLT_CMD |
+		  XY_SRC_COPY_BLT_WRITE_ALPHA |
+		  XY_SRC_COPY_BLT_WRITE_RGB |
+		  (6 + 2*(gen >= 8));
+	bb[i++] = (3 << 24) | /* 32 bits */
 		  (0xcc << 16) | /* copy ROP */
-		  (width * 4) /* dst pitch */);
-	OUT_BATCH(0); /* dst x1,y1 */
-	OUT_BATCH((height << 16) | width); /* dst x2,y2 */
-	OUT_RELOC(dst_bo, I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER, 0);
-	OUT_BATCH(0); /* src x1,y1 */
-	OUT_BATCH(width * 4); /* src pitch */
-	OUT_RELOC(src_bo, I915_GEM_DOMAIN_RENDER, 0, 0);
-	ADVANCE_BATCH();
-
-	intel_batchbuffer_flush(batch);
-
-	drm_intel_bo_unreference(src_bo);
+		  (OBJECT_WIDTH * 4) /* dst pitch */;
+	bb[i++] = 0; /* dst x1,y1 */
+	bb[i++] = (OBJECT_HEIGHT << 16) | OBJECT_WIDTH; /* dst x2,y2 */
+
+	obj[0].handle = dst_handle;
+	obj[0].offset = dst_handle * size;
+	reloc[0].target_handle = dst_handle;
+	reloc[0].presumed_offset = obj[0].offset;
+	reloc[0].offset = sizeof(uint32_t) * i;
+	reloc[0].read_domains = I915_GEM_DOMAIN_RENDER;
+	reloc[0].write_domain = I915_GEM_DOMAIN_RENDER;
+	bb[i++] = obj[0].offset;
+	if (has_64b_reloc)
+		bb[i++] = obj[0].offset >> 32;
+
+	bb[i++] = 0; /* src x1,y1 */
+	bb[i++] = OBJECT_WIDTH * 4; /* src pitch */
+
+	obj[1].handle = src_handle;
+	obj[1].offset = src_handle * size;
+	reloc[1].target_handle = src_handle;
+	reloc[1].presumed_offset = obj[1].offset;
+	reloc[1].offset = sizeof(uint32_t) * i;
+	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
+	reloc[1].write_domain = 0;
+	bb[i++] = obj[1].offset;
+	if (has_64b_reloc)
+		bb[i++] = obj[1].offset >> 32;
+
+	obj[2].handle = bb_handle;
+	obj[2].relocs_ptr = to_user_pointer(reloc);
+	obj[2].relocation_count = 2;
+
+	bb[i++] = MI_BATCH_BUFFER_END;
+	gem_munmap(bb, bb_size);
+
+	exec.buffers_ptr = to_user_pointer(obj);
+	exec.buffer_count = 3;
+	exec.flags = gen >= 6 ? I915_EXEC_BLT : 0 | I915_EXEC_NO_RELOC;
+
+	gem_execbuf(i915, &exec);
 }
 
 int main(int argc, char **argv)
 {
-	int fd;
-	int object_size = OBJECT_WIDTH * OBJECT_HEIGHT * 4;
 	double start_time, end_time;
-	drm_intel_bo *dst_bo;
-	drm_intel_bufmgr *bufmgr;
-	struct intel_batchbuffer *batch;
-	int i;
-
-	fd = drm_open_driver(DRIVER_INTEL);
-
-	bufmgr = drm_intel_bufmgr_gem_init(fd, 4096);
-	drm_intel_bufmgr_gem_enable_reuse(bufmgr);
-
-	batch = intel_batchbuffer_alloc(bufmgr, intel_get_drm_devid(fd));
+	uint32_t dst_handle;
+	int i915, i;
 
-	dst_bo = drm_intel_bo_alloc(bufmgr, "dst", object_size, 4096);
+	i915 = drm_open_driver(DRIVER_INTEL);
+	dst_handle = gem_create(i915, OBJECT_WIDTH * OBJECT_HEIGHT * 4);
 
 	/* Prep loop to get us warmed up. */
-	for (i = 0; i < 20; i++) {
-		do_render(bufmgr, batch, dst_bo, OBJECT_WIDTH, OBJECT_HEIGHT);
-	}
-	drm_intel_bo_wait_rendering(dst_bo);
+	for (i = 0; i < 60; i++)
+		do_render(i915, dst_handle);
+	gem_sync(i915, dst_handle);
 
 	/* Do the actual timing. */
 	start_time = get_time_in_secs();
-	for (i = 0; i < 1000; i++) {
-		do_render(bufmgr, batch, dst_bo, OBJECT_WIDTH, OBJECT_HEIGHT);
-	}
-	drm_intel_bo_wait_rendering(dst_bo);
+	for (i = 0; i < 1000; i++)
+		do_render(i915, dst_handle);
+	gem_sync(i915, dst_handle);
+
 	end_time = get_time_in_secs();
 
 	printf("%d iterations in %.03f secs: %.01f MB/sec\n", i,
@@ -157,10 +188,6 @@ int main(int argc, char **argv)
 	       (double)i * OBJECT_WIDTH * OBJECT_HEIGHT * 4 / 1024.0 / 1024.0 /
 	       (end_time - start_time));
 
-	intel_batchbuffer_free(batch);
-	drm_intel_bufmgr_destroy(bufmgr);
-
-	close(fd);
-
-	return 0;
+	close(i915);
 }
+
-- 
2.34.1
