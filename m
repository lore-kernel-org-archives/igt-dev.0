Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CED6E0D4
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2020 11:10:34 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Date: Mon, 29 Jun 2020 13:10:03 +0200
Message-Id: <20200629111004.20325-4-dominik.grzegorzek@intel.com>
In-Reply-To: <20200629111004.20325-1-dominik.grzegorzek@intel.com>
References: <20200629111004.20325-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/4] i915/gem_caching: Remove libdrm
 dependency
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Thanks to intel_bb we are able to remove libdrm from gem_caching.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_caching.c | 174 +++++++++++++++++++++++----------------
 1 file changed, 105 insertions(+), 69 deletions(-)

diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c
index 0ffffa05..4a615bb8 100644
--- a/tests/i915/gem_caching.c
+++ b/tests/i915/gem_caching.c
@@ -39,7 +39,6 @@
 
 #include "i915/gem.h"
 #include "igt.h"
-#include "intel_bufmgr.h"
 
 IGT_TEST_DESCRIPTION("Test snoop consistency when touching partial"
 		     " cachelines.");
@@ -49,50 +48,81 @@ IGT_TEST_DESCRIPTION("Test snoop consistency when touching partial"
  *
  */
 
-static drm_intel_bufmgr *bufmgr;
-struct intel_batchbuffer *batch;
-
-drm_intel_bo *scratch_bo;
-drm_intel_bo *staging_bo;
 #define BO_SIZE (4*4096)
-uint32_t devid;
-int fd;
+#define PAGE_SIZE 4096
+
+typedef struct {
+	int fd;
+	uint32_t devid;
+	struct buf_ops *bops;
+} data_t;
+
+
+static void *__try_gtt_map_first(data_t *data, struct intel_buf *buf,
+				 int write_enable)
+{
+	uint8_t *ptr;
+	unsigned int prot = PROT_READ | (write_enable ? PROT_WRITE : 0);
+
+	ptr = __gem_mmap__gtt(data->fd, buf->handle, buf->size, prot);
+	if (!ptr) {
+		ptr = gem_mmap__device_coherent(data->fd, buf->handle,
+					  0, buf->size,  prot);
+	}
+	return ptr;
+}
 
 static void
-copy_bo(drm_intel_bo *src, drm_intel_bo *dst)
+copy_bo(struct intel_bb *ibb, struct intel_buf *src, struct intel_buf *dst)
 {
-	BLIT_COPY_BATCH_START(0);
-	OUT_BATCH((3 << 24) | /* 32 bits */
-		  (0xcc << 16) | /* copy ROP */
-		  4096);
-	OUT_BATCH(0 << 16 | 0);
-	OUT_BATCH((BO_SIZE/4096) << 16 | 1024);
-	OUT_RELOC_FENCED(dst, I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER, 0);
-	OUT_BATCH(0 << 16 | 0);
-	OUT_BATCH(4096);
-	OUT_RELOC_FENCED(src, I915_GEM_DOMAIN_RENDER, 0, 0);
-	ADVANCE_BATCH();
-
-	intel_batchbuffer_flush(batch);
+	bool has_64b_reloc;
+
+	has_64b_reloc = ibb->gen >= 8;
+
+	intel_bb_out(ibb,
+		     XY_SRC_COPY_BLT_CMD |
+		     XY_SRC_COPY_BLT_WRITE_ALPHA |
+		     XY_SRC_COPY_BLT_WRITE_RGB |
+		     (6 + 2 * has_64b_reloc));
+
+	intel_bb_out(ibb, (3 << 24) | /* 32 bits */
+		     (0xcc << 16) | /* copy ROP */
+		     4096);
+	intel_bb_out(ibb, 0 << 16 | 0);
+	intel_bb_out(ibb, (BO_SIZE/4096) << 16 | 1024);
+	intel_bb_emit_reloc_fenced(ibb, dst->handle,
+				   I915_GEM_DOMAIN_RENDER,
+				   I915_GEM_DOMAIN_RENDER,
+				   0, 0x0);
+	intel_bb_out(ibb, 0 << 16 | 0);
+	intel_bb_out(ibb, 4096);
+	intel_bb_emit_reloc_fenced(ibb, src->handle,
+				   I915_GEM_DOMAIN_RENDER,
+				   0, 0, 0x0);
+
+	intel_bb_out_flush(ibb);
+	intel_bb_exec(ibb, intel_bb_offset(ibb),
+		      ibb->gen >= 6 ? I915_EXEC_BLT : 0, true);
+	intel_bb_reset(ibb, false);
 }
 
 static void
-blt_bo_fill(drm_intel_bo *tmp_bo, drm_intel_bo *bo, uint8_t val)
+blt_bo_fill(data_t *data, struct intel_bb *ibb, struct intel_buf *tmp_bo,
+	    struct intel_buf *bo, uint8_t val)
 {
 	uint8_t *gtt_ptr;
 	int i;
 
-	do_or_die(drm_intel_gem_bo_map_gtt(tmp_bo));
-	gtt_ptr = tmp_bo->virtual;
+	gtt_ptr = __try_gtt_map_first(data, tmp_bo, 1);
 
 	for (i = 0; i < BO_SIZE; i++)
 		gtt_ptr[i] = val;
 
-	drm_intel_gem_bo_unmap_gtt(tmp_bo);
+	munmap(gtt_ptr, tmp_bo->size);
 
-	igt_drop_caches_set(fd, DROP_BOUND);
+	igt_drop_caches_set(data->fd, DROP_BOUND);
 
-	copy_bo(tmp_bo, bo);
+	copy_bo(ibb, tmp_bo, bo);
 }
 
 #define MAX_BLT_SIZE 128
@@ -102,6 +132,9 @@ blt_bo_fill(drm_intel_bo *tmp_bo, drm_intel_bo *bo, uint8_t val)
 #define TEST_BOTH (TEST_READ | TEST_WRITE)
 igt_main
 {
+	struct intel_buf *scratch_buf, *staging_buf;
+	struct intel_bb *ibb;
+	data_t data = {0, };
 	unsigned flags = TEST_BOTH;
 	int i, j;
 	uint8_t *cpu_ptr;
@@ -110,29 +143,30 @@ igt_main
 	igt_fixture {
 		srandom(0xdeadbeef);
 
-		fd = drm_open_driver(DRIVER_INTEL);
+		data.fd = drm_open_driver(DRIVER_INTEL);
 
-		igt_require_gem(fd);
-		gem_require_blitter(fd);
-		gem_require_caching(fd);
+		igt_require_gem(data.fd);
+		gem_require_blitter(data.fd);
+		gem_require_caching(data.fd);
 
-		devid = intel_get_drm_devid(fd);
-		if (IS_GEN2(devid)) /* chipset only handles cached -> uncached */
+		data.devid = intel_get_drm_devid(data.fd);
+		if (IS_GEN2(data.devid)) /* chipset only handles cached -> uncached */
 			flags &= ~TEST_READ;
-		if (IS_BROADWATER(devid) || IS_CRESTLINE(devid)) {
+		if (IS_BROADWATER(data.devid) || IS_CRESTLINE(data.devid)) {
 			/* chipset is completely fubar */
 			igt_info("coherency broken on i965g/gm\n");
 			flags = 0;
 		}
+		data.bops = buf_ops_create(data.fd);
+		ibb = intel_bb_create(data.fd, PAGE_SIZE);
 
-		bufmgr = drm_intel_bufmgr_gem_init(fd, 4096);
-		batch = intel_batchbuffer_alloc(bufmgr, devid);
+		scratch_buf = intel_buf_create(data.bops, BO_SIZE/4, 1,
+					       32, 0, I915_TILING_NONE, 0);
 
-		/* overallocate the buffers we're actually using because */
-		scratch_bo = drm_intel_bo_alloc(bufmgr, "scratch bo", BO_SIZE, 4096);
-		gem_set_caching(fd, scratch_bo->handle, 1);
+		gem_set_caching(data.fd, scratch_buf->handle, 1);
 
-		staging_bo = drm_intel_bo_alloc(bufmgr, "staging bo", BO_SIZE, 4096);
+		staging_buf = intel_buf_create(data.bops, BO_SIZE/4, 1,
+					       32, 0, I915_TILING_NONE, 0);
 	}
 
 	igt_subtest("reads") {
@@ -144,19 +178,19 @@ igt_main
 			uint8_t val0 = i;
 			int start, len;
 
-			blt_bo_fill(staging_bo, scratch_bo, i);
+			blt_bo_fill(&data, ibb, staging_buf, scratch_buf, i);
 
 			start = random() % BO_SIZE;
 			len = random() % (BO_SIZE-start) + 1;
 
-			drm_intel_bo_map(scratch_bo, false);
-			cpu_ptr = scratch_bo->virtual;
+			cpu_ptr = gem_mmap__cpu(data.fd, scratch_buf->handle,
+						0, scratch_buf->size, PROT_READ);
 			for (j = 0; j < len; j++) {
 				igt_assert_f(cpu_ptr[j] == val0,
 					     "mismatch at %i, got: %i, expected: %i\n",
 					     j, cpu_ptr[j], val0);
 			}
-			drm_intel_bo_unmap(scratch_bo);
+			munmap(cpu_ptr, scratch_buf->size);
 
 			igt_progress("partial reads test: ", i, ROUNDS);
 		}
@@ -171,20 +205,19 @@ igt_main
 			uint8_t val0 = i, val1;
 			int start, len;
 
-			blt_bo_fill(staging_bo, scratch_bo, val0);
+			blt_bo_fill(&data, ibb, staging_buf, scratch_buf, val0);
 
 			start = random() % BO_SIZE;
 			len = random() % (BO_SIZE-start) + 1;
 
 			val1 = val0 + 63;
-			drm_intel_bo_map(scratch_bo, true);
-			cpu_ptr = scratch_bo->virtual;
-			memset(cpu_ptr + start, val1, len);
-			drm_intel_bo_unmap(scratch_bo);
+			cpu_ptr = gem_mmap__cpu(data.fd, scratch_buf->handle,
+						0, scratch_buf->size, PROT_READ | PROT_WRITE);
 
-			copy_bo(scratch_bo, staging_bo);
-			do_or_die(drm_intel_gem_bo_map_gtt(staging_bo));
-			gtt_ptr = staging_bo->virtual;
+			memset(cpu_ptr + start, val1, len);
+			munmap(cpu_ptr, scratch_buf->size);
+			copy_bo(ibb, scratch_buf, staging_buf);
+			gtt_ptr = __try_gtt_map_first(&data, staging_buf, 0);
 
 			for (j = 0; j < start; j++) {
 				igt_assert_f(gtt_ptr[j] == val0,
@@ -201,7 +234,7 @@ igt_main
 					     "mismatch at %i, partial=[%d+%d] got: %i, expected: %i\n",
 					     j, start, len, gtt_ptr[j], val0);
 			}
-			drm_intel_gem_bo_unmap_gtt(staging_bo);
+			munmap(gtt_ptr, staging_buf->size);
 
 			igt_progress("partial writes test: ", i, ROUNDS);
 		}
@@ -216,38 +249,39 @@ igt_main
 			uint8_t val0 = i, val1, val2;
 			int start, len;
 
-			blt_bo_fill(staging_bo, scratch_bo, val0);
+			blt_bo_fill(&data, ibb, staging_buf, scratch_buf, val0);
 
 			/* partial read */
 			start = random() % BO_SIZE;
 			len = random() % (BO_SIZE-start) + 1;
 
-			do_or_die(drm_intel_bo_map(scratch_bo, false));
-			cpu_ptr = scratch_bo->virtual;
+			cpu_ptr = gem_mmap__cpu(data.fd, scratch_buf->handle,
+						0, scratch_buf->size, PROT_READ);
+
 			for (j = 0; j < len; j++) {
 				igt_assert_f(cpu_ptr[j] == val0,
 					     "mismatch in read at %i, got: %i, expected: %i\n",
 					     j, cpu_ptr[j], val0);
 			}
-			drm_intel_bo_unmap(scratch_bo);
+			munmap(cpu_ptr, scratch_buf->size);
 
 			/* Change contents through gtt to make the pread cachelines
 			 * stale. */
 			val1 = i + 17;
-			blt_bo_fill(staging_bo, scratch_bo, val1);
+			blt_bo_fill(&data, ibb, staging_buf, scratch_buf, val1);
 
 			/* partial write */
 			start = random() % BO_SIZE;
 			len = random() % (BO_SIZE-start) + 1;
 
 			val2 = i + 63;
-			do_or_die(drm_intel_bo_map(scratch_bo, false));
-			cpu_ptr = scratch_bo->virtual;
+			cpu_ptr = gem_mmap__cpu(data.fd, scratch_buf->handle,
+						0, scratch_buf->size, PROT_READ);
+
 			memset(cpu_ptr + start, val2, len);
 
-			copy_bo(scratch_bo, staging_bo);
-			do_or_die(drm_intel_gem_bo_map_gtt(staging_bo));
-			gtt_ptr = staging_bo->virtual;
+			copy_bo(ibb, scratch_buf, staging_buf);
+			gtt_ptr = __try_gtt_map_first(&data, staging_buf, 0);
 
 			for (j = 0; j < start; j++) {
 				igt_assert_f(gtt_ptr[j] == val1,
@@ -264,16 +298,18 @@ igt_main
 					     "mismatch at %i, partial=[%d+%d] got: %i, expected: %i\n",
 					     j, start, len, gtt_ptr[j], val1);
 			}
-			drm_intel_gem_bo_unmap_gtt(staging_bo);
-			drm_intel_bo_unmap(scratch_bo);
+			munmap(cpu_ptr, scratch_buf->handle);
+			munmap(gtt_ptr, staging_buf->handle);
 
 			igt_progress("partial read/writes test: ", i, ROUNDS);
 		}
 	}
 
 	igt_fixture {
-		drm_intel_bufmgr_destroy(bufmgr);
-
-		close(fd);
+		intel_bb_destroy(ibb);
+		intel_buf_destroy(scratch_buf);
+		intel_buf_destroy(staging_buf);
+		buf_ops_destroy(data.bops);
+		close(data.fd);
 	}
 }
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
