Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4304210E11A
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Dec 2022 12:48:31 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Date: Thu,  1 Dec 2022 18:16:44 +0530
Message-Id: <20221201124644.660870-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/prime_mmap_coherency: Adding blitter
 copy support for gen12+ platforms
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

From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>

It appears that the intel_copy_bo() functions use of the blitter
copy is NOT compatible with PVC, ATS,MTL or DG2.
Mirroring the update to prime_vgem, enables this test to function
again using igt_blitter_src_copy or igt_blitter_fast_copy__raw.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: vikas srivastava <vikas.srivastava@intel.com>
---
 tests/prime_mmap_coherency.c | 162 ++++++++++++++++++++---------------
 1 file changed, 93 insertions(+), 69 deletions(-)

diff --git a/tests/prime_mmap_coherency.c b/tests/prime_mmap_coherency.c
index b22fb35c1..3ef08e275 100644
--- a/tests/prime_mmap_coherency.c
+++ b/tests/prime_mmap_coherency.c
@@ -31,14 +31,19 @@
 
 #include "i915/gem.h"
 #include "igt.h"
+#include "intel_batchbuffer.h"
 
 IGT_TEST_DESCRIPTION("Test dma-buf mmap on !llc platforms mostly and provoke"
 		" coherency bugs so we know for sure where we need the sync ioctls.");
+#define blitter_copy(expr...)	(intel_graphics_ver(devid) >= IP_VER(12, 60) ? \
+				(igt_blitter_fast_copy__raw(expr)) : \
+				(igt_blitter_src_copy(expr)))
 
 int fd;
-static struct buf_ops *bops;
-static struct intel_bb *batch;
+static drm_intel_bufmgr *bufmgr;
+struct intel_batchbuffer *batch;
 static int width = 1024, height = 1024;
+static uint32_t devid;
 
 /*
  * Exercises the need for read flush:
@@ -49,35 +54,37 @@ static int width = 1024, height = 1024;
  */
 static int test_read_flush(void)
 {
-	struct intel_buf *buffer_1;
-	struct intel_buf *buffer_2;
+	drm_intel_bo *bo_1;
+	drm_intel_bo *bo_2;
 	uint32_t *ptr_cpu;
 	uint32_t *ptr_gtt;
 	int dma_buf_fd, i;
 	int stale = 0;
+	uint64_t ahnd = get_reloc_ahnd(fd, 0);
 
-
-	buffer_1 = intel_buf_create(bops, width, height, 32, 4096,
-				    I915_TILING_NONE, I915_COMPRESSION_NONE);
+	bo_1 = drm_intel_bo_alloc(bufmgr, "BO 1", width * height * 4, 4096);
 
 	/* STEP #1: put the BO 1 in GTT domain. We use the blitter to copy and fill
 	 * zeros to BO 1, so commands will be submitted and likely to place BO 1 in
-	 * the GTT domain. */
+	 * the GTT domain.
+	 */
+	bo_2 = drm_intel_bo_alloc(bufmgr, "BO 2", width * height * 4, 4096);
+	blitter_copy(fd, ahnd, 0, bo_2->handle, 0, width * 4,
+		     I915_TILING_NONE, 0, 0, width * height * 4, width,
+		     height, 32, bo_1->handle, 0,
+		     width * 4, I915_TILING_NONE, 0, 0, width * height * 4);
+	drm_intel_bo_unreference(bo_2);
 
-	buffer_2 = intel_buf_create(bops, width, height, 32, 4096,
-				    I915_TILING_NONE, I915_COMPRESSION_NONE);
-	intel_bb_copy_intel_buf(batch, buffer_2, buffer_1, width * height * 4);
-	intel_buf_destroy(buffer_2);
 	/* STEP #2: read BO 1 using the dma-buf CPU mmap. This dirties the CPU caches. */
-	dma_buf_fd = prime_handle_to_fd_for_mmap(fd, buffer_1->handle);
+	dma_buf_fd = prime_handle_to_fd_for_mmap(fd, bo_1->handle);
 
 	/* STEP #3: write 0x11 into BO 1. */
-	buffer_2 = intel_buf_create(bops, width, height, 32, 4096,
-				    I915_TILING_NONE, I915_COMPRESSION_NONE);
-	ptr_gtt = gem_mmap__device_coherent(fd, buffer_2->handle, 0,
-					    width * height, PROT_READ | PROT_WRITE);
-	gem_set_domain(fd, buffer_2->handle,
+	bo_2 = drm_intel_bo_alloc(bufmgr, "BO 2", width * height * 4, 4096);
+	ptr_gtt = gem_mmap__device_coherent(fd, bo_2->handle,
+					    0, width * height, PROT_READ | PROT_WRITE);
+	gem_set_domain(fd, bo_2->handle,
 		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
+
 	memset(ptr_gtt, 0xc5, width * height);
 	munmap(ptr_gtt, width * height);
 
@@ -90,24 +97,29 @@ static int test_read_flush(void)
 		igt_assert_eq(ptr_cpu[i], 0);
 	prime_sync_end(dma_buf_fd, false);
 
-	intel_bb_copy_intel_buf(batch, buffer_2, buffer_1, width * height);
-	intel_buf_destroy(buffer_2);
+	blitter_copy(fd, ahnd, 0, bo_2->handle, 0, width * 4,
+		     I915_TILING_NONE, 0, 0, width * height * 4, width,
+		     height, 32, bo_1->handle, 0,
+		     width * 4, I915_TILING_NONE, 0, 0, width * height * 4);
+	drm_intel_bo_unreference(bo_2);
 
 	/* STEP #4: read again using the CPU mmap. Doing #1 before #3 makes sure we
 	 * don't do a full CPU cache flush in step #3 again. That makes sure all the
 	 * stale cachelines from step #2 survive (mostly, a few will be evicted)
 	 * until we try to read them again in step #4. This behavior could be fixed
-	 * by flush CPU read right before accessing the CPU pointer */
+	 * by flush CPU read right before accessing the CPU pointer.
+	 */
 	prime_sync_start(dma_buf_fd, false);
 	for (i = 0; i < (width * height) / 4; i++)
 		if (ptr_cpu[i] != 0xc5c5c5c5)
 			stale++;
 	prime_sync_end(dma_buf_fd, false);
 
-	intel_buf_destroy(buffer_1);
+	drm_intel_bo_unreference(bo_1);
 	munmap(ptr_cpu, width * height);
 
 	close(dma_buf_fd);
+	put_ahnd(ahnd);
 
 	return stale;
 }
@@ -121,26 +133,29 @@ static int test_read_flush(void)
  */
 static int test_write_flush(void)
 {
-	struct intel_buf *buffer_1;
-	struct intel_buf *buffer_2;
+	drm_intel_bo *bo_1;
+	drm_intel_bo *bo_2;
 	uint32_t *ptr_cpu;
 	uint32_t *ptr2_cpu;
 	int dma_buf_fd, dma_buf2_fd, i;
 	int stale = 0;
+	uint64_t ahnd = get_reloc_ahnd(fd, 0);
 
-	buffer_1 = intel_buf_create(bops, width, height, 32, 4096,
-				    I915_TILING_NONE, I915_COMPRESSION_NONE);
+	bo_1 = drm_intel_bo_alloc(bufmgr, "BO 1", width * height * 4, 4096);
 
 	/* STEP #1: Put the BO 1 in GTT domain. We use the blitter to copy and fill
 	 * zeros to BO 1, so commands will be submitted and likely to place BO 1 in
-	 * the GTT domain. */
-	buffer_2 = intel_buf_create(bops, width, height, 32, 4096,
-				    I915_TILING_NONE, I915_COMPRESSION_NONE);
-	intel_bb_copy_intel_buf(batch, buffer_2, buffer_1, width * height * 4);
-	intel_buf_destroy(buffer_2);
+	 * the GTT domain.
+	 */
+	bo_2 = drm_intel_bo_alloc(bufmgr, "BO 2", width * height * 4, 4096);
+	blitter_copy(fd, ahnd, 0, bo_1->handle, 0, width * 4,
+		     I915_TILING_NONE, 0, 0, width * height * 4, width,
+		     height, 32, bo_2->handle, 0,
+		     width * 4, I915_TILING_NONE, 0, 0, width * height * 4);
+	drm_intel_bo_unreference(bo_2);
 
 	/* STEP #2: Write '1's into BO 1 using the dma-buf CPU mmap. */
-	dma_buf_fd = prime_handle_to_fd_for_mmap(fd, buffer_1->handle);
+	dma_buf_fd = prime_handle_to_fd_for_mmap(fd, bo_1->handle);
 	igt_skip_on(errno == EINVAL);
 
 	ptr_cpu = mmap(NULL, width * height, PROT_READ | PROT_WRITE,
@@ -148,24 +163,28 @@ static int test_write_flush(void)
 	igt_assert(ptr_cpu != MAP_FAILED);
 
 	/* This is the main point of this test: !llc hw requires a cache write
-	 * flush right here (explained in step #4). */
+	 * flush right here (explained in step #4).
+	 */
 	prime_sync_start(dma_buf_fd, true);
 	memset(ptr_cpu, 0x11, width * height);
 	prime_sync_end(dma_buf_fd, true);
 
 	/* STEP #3: Copy BO 1 into BO 2, using blitter. */
-	buffer_2 = intel_buf_create(bops, width, height, 32, 4096,
-				    I915_TILING_NONE, I915_COMPRESSION_NONE);
-	intel_bb_copy_intel_buf(batch, buffer_1, buffer_2, width * height * 4);
+	bo_2 = drm_intel_bo_alloc(bufmgr, "BO 2", width * height * 4, 4096);
+	blitter_copy(fd, ahnd, 0, bo_1->handle, 0, width * 4,
+		     I915_TILING_NONE, 0, 0, width * height * 4, width,
+		     height, 32, bo_2->handle, 0,
+		     width * 4, I915_TILING_NONE, 0, 0, width * height * 4);
 
 	/* STEP #4: compare BO 2 against written BO 1. In !llc hardware, there
 	 * should be some cache lines that didn't get flushed out and are still 0,
-	 * requiring cache flush before the write in step 2. */
-	dma_buf2_fd = prime_handle_to_fd_for_mmap(fd, buffer_2->handle);
+	 * requiring cache flush before the write in step 2.
+	 */
+	dma_buf2_fd = prime_handle_to_fd_for_mmap(fd, bo_2->handle);
 	igt_skip_on(errno == EINVAL);
 
 	ptr2_cpu = mmap(NULL, width * height, PROT_READ | PROT_WRITE,
-		        MAP_SHARED, dma_buf2_fd, 0);
+			MAP_SHARED, dma_buf2_fd, 0);
 	igt_assert(ptr2_cpu != MAP_FAILED);
 
 	prime_sync_start(dma_buf2_fd, false);
@@ -176,44 +195,48 @@ static int test_write_flush(void)
 
 	prime_sync_end(dma_buf2_fd, false);
 
-	intel_buf_destroy(buffer_1);
-	intel_buf_destroy(buffer_2);
+	drm_intel_bo_unreference(bo_1);
+	drm_intel_bo_unreference(bo_2);
+
 	munmap(ptr_cpu, width * height);
 
 	close(dma_buf2_fd);
 	close(dma_buf_fd);
+	put_ahnd(ahnd);
 
 	return stale;
 }
 
 static void blit_and_cmp(void)
 {
-	struct intel_buf *buffer_1;
-	struct intel_buf *buffer_2;
+	drm_intel_bo *bo_1;
+	drm_intel_bo *bo_2;
 	uint32_t *ptr_cpu;
 	uint32_t *ptr2_cpu;
 	int dma_buf_fd, dma_buf2_fd, i;
 	int local_fd;
-	struct buf_ops *local_bops;
-	struct intel_bb *local_batch;
+	drm_intel_bufmgr *local_bufmgr;
+	struct intel_batchbuffer *local_batch;
+	uint64_t ahnd = get_reloc_ahnd(fd, 0);
+
 	/* recreate process local variables */
 	local_fd = drm_open_driver(DRIVER_INTEL);
-	local_bops = buf_ops_create(local_fd);
+	local_bufmgr = drm_intel_bufmgr_gem_init(local_fd, 4096);
+	igt_assert(local_bufmgr);
 
-	local_batch = intel_bb_create(local_fd, 4096);
+	local_batch = intel_batchbuffer_alloc(local_bufmgr, local_fd);
+	igt_assert(local_batch);
 
-	buffer_1 = intel_buf_create(local_bops, width, height, 32, 4096,
-				    I915_TILING_NONE, I915_COMPRESSION_NONE);
-	dma_buf_fd = prime_handle_to_fd_for_mmap(local_fd, buffer_1->handle);
+	bo_1 = drm_intel_bo_alloc(local_bufmgr, "BO 1", width * height * 4, 4096);
+	dma_buf_fd = prime_handle_to_fd_for_mmap(local_fd, bo_1->handle);
 	igt_skip_on(errno == EINVAL);
 
 	ptr_cpu = mmap(NULL, width * height, PROT_READ | PROT_WRITE,
 		       MAP_SHARED, dma_buf_fd, 0);
 	igt_assert(ptr_cpu != MAP_FAILED);
 
-	buffer_2 = intel_buf_create(local_bops, width, height, 32, 4096,
-				    I915_TILING_NONE, I915_COMPRESSION_NONE);
-	dma_buf2_fd = prime_handle_to_fd_for_mmap(local_fd, buffer_2->handle);
+	bo_2 = drm_intel_bo_alloc(local_bufmgr, "BO 2", width * height * 4, 4096);
+	dma_buf2_fd = prime_handle_to_fd_for_mmap(local_fd, bo_2->handle);
 
 	ptr2_cpu = mmap(NULL, width * height, PROT_READ | PROT_WRITE,
 			MAP_SHARED, dma_buf2_fd, 0);
@@ -229,7 +252,10 @@ static void blit_and_cmp(void)
 	prime_sync_end(dma_buf2_fd, true);
 
 	/* Copy BO 1 into BO 2, using blitter. */
-	intel_bb_copy_intel_buf(local_batch, buffer_1, buffer_2, width * height * 4);
+	blitter_copy(local_fd, ahnd, 0, bo_1->handle, 0, width * 4,
+		     I915_TILING_NONE, 0, 0, width * height * 4, width,
+		     height, 32, bo_2->handle, 0,
+		     width * 4, I915_TILING_NONE, 0, 0, width * height * 4);
 	usleep(0); /* let someone else claim the mutex */
 
 	/* Compare BOs. If prime_sync_* were executed properly, the caches
@@ -239,17 +265,19 @@ static void blit_and_cmp(void)
 		igt_fail_on_f(ptr2_cpu[i] != 0x11111111, "Found 0x%08x at offset 0x%08x\n", ptr2_cpu[i], i);
 	prime_sync_end(dma_buf2_fd, false);
 
-	intel_buf_destroy(buffer_1);
-	intel_buf_destroy(buffer_2);
+	drm_intel_bo_unreference(bo_1);
+	drm_intel_bo_unreference(bo_2);
+
 	munmap(ptr_cpu, width * height);
 	munmap(ptr2_cpu, width * height);
 
 	close(dma_buf_fd);
 	close(dma_buf2_fd);
 
-	intel_bb_destroy(local_batch);
-	buf_ops_destroy(local_bops);
+	intel_batchbuffer_free(local_batch);
+	drm_intel_bufmgr_destroy(local_bufmgr);
 	close(local_fd);
+	put_ahnd(ahnd);
 }
 
 /*
@@ -297,6 +325,9 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
+		bufmgr = drm_intel_bufmgr_gem_init(fd, 4096);
+		batch = intel_batchbuffer_alloc(bufmgr, fd);
+		devid = intel_get_drm_devid(fd);
 
 		query_info = gem_get_query_memory_regions(fd);
 		igt_assert(query_info);
@@ -309,43 +340,36 @@ igt_main
 
 		igt_collection_destroy(set);
 		igt_collection_destroy(dma_buf_set);
-
-		bops = buf_ops_create(fd);
 	}
 
 	/* Cache coherency and the eviction are pretty much unpredictable, so
 	 * reproducing boils down to trial and error to hit different scenarios.
-	 * TODO: We may want to improve tests a bit by picking random subranges. */
+	 * TODO: We may want to improve tests a bit by picking random subranges.
+	 */
 	igt_subtest("read") {
-		batch = intel_bb_create(fd, 4096);
 		igt_until_timeout(5) {
 			int stale = test_read_flush();
 			igt_fail_on_f(stale,
 				      "num of stale cache lines %d\n", stale);
 		}
-		intel_bb_destroy(batch);
 	}
 
 	igt_subtest("write") {
-		batch = intel_bb_create(fd, 4096);
 		igt_until_timeout(5) {
 			int stale = test_write_flush();
 			igt_fail_on_f(stale,
 				      "num of stale cache lines %d\n", stale);
 		}
-		intel_bb_destroy(batch);
 	}
 
 	igt_subtest("ioctl-errors") {
-		batch = intel_bb_create(fd, 4096);
 		igt_info("exercising concurrent blit to get ioctl errors\n");
 		test_ioctl_errors();
-		intel_bb_destroy(batch);
 	}
 
 	igt_fixture {
-		buf_ops_destroy(bops);
-
+		intel_batchbuffer_free(batch);
+		drm_intel_bufmgr_destroy(bufmgr);
 		close(fd);
 	}
 }
-- 
2.25.1
