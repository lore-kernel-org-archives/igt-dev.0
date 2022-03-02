Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930BE10F165
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Mar 2022 08:07:05 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  2 Mar 2022 09:06:29 +0100
Message-Id: <20220302080629.11562-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220302080629.11562-1-zbigniew.kempczynski@intel.com>
References: <20220302080629.11562-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/prime_mmap_coherency.c: Use
 intel_bb and intel_buf to remove libdrm dependency
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>

Using intel_bb and intel_buf to remove libdrm dependency.

v2: addressing review comments (Kamil)

Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/prime_mmap_coherency.c | 128 +++++++++++++++++++++--------------
 1 file changed, 78 insertions(+), 50 deletions(-)

diff --git a/tests/prime_mmap_coherency.c b/tests/prime_mmap_coherency.c
index 2a0749577..0238d9117 100644
--- a/tests/prime_mmap_coherency.c
+++ b/tests/prime_mmap_coherency.c
@@ -36,8 +36,8 @@ IGT_TEST_DESCRIPTION("Test dma-buf mmap on !llc platforms mostly and provoke"
 		" coherency bugs so we know for sure where we need the sync ioctls.");
 
 int fd;
-static drm_intel_bufmgr *bufmgr;
-struct intel_batchbuffer *batch;
+static struct buf_ops *bops;
+static struct intel_bb *batch;
 static int width = 1024, height = 1024;
 
 /*
@@ -49,29 +49,34 @@ static int width = 1024, height = 1024;
  */
 static int test_read_flush(void)
 {
-	drm_intel_bo *bo_1;
-	drm_intel_bo *bo_2;
+	struct intel_buf *buffer_1;
+	struct intel_buf *buffer_2;
 	uint32_t *ptr_cpu;
 	uint32_t *ptr_gtt;
 	int dma_buf_fd, i;
 	int stale = 0;
 
-	bo_1 = drm_intel_bo_alloc(bufmgr, "BO 1", width * height * 4, 4096);
+
+	buffer_1 = intel_buf_create(bops, width, height, 32, 4096,
+				    I915_TILING_NONE, I915_COMPRESSION_NONE);
 
 	/* STEP #1: put the BO 1 in GTT domain. We use the blitter to copy and fill
 	 * zeros to BO 1, so commands will be submitted and likely to place BO 1 in
 	 * the GTT domain. */
-	bo_2 = drm_intel_bo_alloc(bufmgr, "BO 2", width * height * 4, 4096);
-	intel_copy_bo(batch, bo_1, bo_2, width * height);
-	drm_intel_bo_unreference(bo_2);
 
+	buffer_2 = intel_buf_create(bops, width, height, 32, 4096,
+				    I915_TILING_NONE, I915_COMPRESSION_NONE);
+	intel_bb_copy_intel_buf(batch, buffer_2, buffer_1, width * height * 4);
+	intel_buf_destroy(buffer_2);
 	/* STEP #2: read BO 1 using the dma-buf CPU mmap. This dirties the CPU caches. */
-	dma_buf_fd = prime_handle_to_fd_for_mmap(fd, bo_1->handle);
+	dma_buf_fd = prime_handle_to_fd_for_mmap(fd, buffer_1->handle);
 
 	/* STEP #3: write 0x11 into BO 1. */
-	bo_2 = drm_intel_bo_alloc(bufmgr, "BO 2", width * height * 4, 4096);
-	ptr_gtt = gem_mmap__device_coherent(fd, bo_2->handle, 0, width * height, PROT_READ | PROT_WRITE);
-	gem_set_domain(fd, bo_2->handle,
+	buffer_2 = intel_buf_create(bops, width, height, 32, 4096,
+				    I915_TILING_NONE, I915_COMPRESSION_NONE);
+	ptr_gtt = gem_mmap__device_coherent(fd, buffer_2->handle, 0,
+					    width * height, PROT_READ | PROT_WRITE);
+	gem_set_domain(fd, buffer_2->handle,
 		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	memset(ptr_gtt, 0xc5, width * height);
 	munmap(ptr_gtt, width * height);
@@ -85,8 +90,8 @@ static int test_read_flush(void)
 		igt_assert_eq(ptr_cpu[i], 0);
 	prime_sync_end(dma_buf_fd, false);
 
-	intel_copy_bo(batch, bo_1, bo_2, width * height);
-	drm_intel_bo_unreference(bo_2);
+	intel_bb_copy_intel_buf(batch, buffer_2, buffer_1, width * height);
+	intel_buf_destroy(buffer_2);
 
 	/* STEP #4: read again using the CPU mmap. Doing #1 before #3 makes sure we
 	 * don't do a full CPU cache flush in step #3 again. That makes sure all the
@@ -99,7 +104,7 @@ static int test_read_flush(void)
 			stale++;
 	prime_sync_end(dma_buf_fd, false);
 
-	drm_intel_bo_unreference(bo_1);
+	intel_buf_destroy(buffer_1);
 	munmap(ptr_cpu, width * height);
 
 	close(dma_buf_fd);
@@ -116,24 +121,26 @@ static int test_read_flush(void)
  */
 static int test_write_flush(void)
 {
-	drm_intel_bo *bo_1;
-	drm_intel_bo *bo_2;
+	struct intel_buf *buffer_1;
+	struct intel_buf *buffer_2;
 	uint32_t *ptr_cpu;
 	uint32_t *ptr2_cpu;
 	int dma_buf_fd, dma_buf2_fd, i;
 	int stale = 0;
 
-	bo_1 = drm_intel_bo_alloc(bufmgr, "BO 1", width * height * 4, 4096);
+	buffer_1 = intel_buf_create(bops, width, height, 32, 4096,
+				    I915_TILING_NONE, I915_COMPRESSION_NONE);
 
 	/* STEP #1: Put the BO 1 in GTT domain. We use the blitter to copy and fill
 	 * zeros to BO 1, so commands will be submitted and likely to place BO 1 in
 	 * the GTT domain. */
-	bo_2 = drm_intel_bo_alloc(bufmgr, "BO 2", width * height * 4, 4096);
-	intel_copy_bo(batch, bo_1, bo_2, width * height);
-	drm_intel_bo_unreference(bo_2);
+	buffer_2 = intel_buf_create(bops, width, height, 32, 4096,
+				    I915_TILING_NONE, I915_COMPRESSION_NONE);
+	intel_bb_copy_intel_buf(batch, buffer_2, buffer_1, width * height * 4);
+	intel_buf_destroy(buffer_2);
 
 	/* STEP #2: Write '1's into BO 1 using the dma-buf CPU mmap. */
-	dma_buf_fd = prime_handle_to_fd_for_mmap(fd, bo_1->handle);
+	dma_buf_fd = prime_handle_to_fd_for_mmap(fd, buffer_1->handle);
 	igt_skip_on(errno == EINVAL);
 
 	ptr_cpu = mmap(NULL, width * height, PROT_READ | PROT_WRITE,
@@ -147,13 +154,14 @@ static int test_write_flush(void)
 	prime_sync_end(dma_buf_fd, true);
 
 	/* STEP #3: Copy BO 1 into BO 2, using blitter. */
-	bo_2 = drm_intel_bo_alloc(bufmgr, "BO 2", width * height * 4, 4096);
-	intel_copy_bo(batch, bo_2, bo_1, width * height);
+	buffer_2 = intel_buf_create(bops, width, height, 32, 4096,
+				    I915_TILING_NONE, I915_COMPRESSION_NONE);
+	intel_bb_copy_intel_buf(batch, buffer_1, buffer_2, width * height * 4);
 
 	/* STEP #4: compare BO 2 against written BO 1. In !llc hardware, there
 	 * should be some cache lines that didn't get flushed out and are still 0,
 	 * requiring cache flush before the write in step 2. */
-	dma_buf2_fd = prime_handle_to_fd_for_mmap(fd, bo_2->handle);
+	dma_buf2_fd = prime_handle_to_fd_for_mmap(fd, buffer_2->handle);
 	igt_skip_on(errno == EINVAL);
 
 	ptr2_cpu = mmap(NULL, width * height, PROT_READ | PROT_WRITE,
@@ -168,8 +176,8 @@ static int test_write_flush(void)
 
 	prime_sync_end(dma_buf2_fd, false);
 
-	drm_intel_bo_unreference(bo_1);
-	drm_intel_bo_unreference(bo_2);
+	intel_buf_destroy(buffer_1);
+	intel_buf_destroy(buffer_2);
 	munmap(ptr_cpu, width * height);
 
 	close(dma_buf2_fd);
@@ -180,33 +188,32 @@ static int test_write_flush(void)
 
 static void blit_and_cmp(void)
 {
-	drm_intel_bo *bo_1;
-	drm_intel_bo *bo_2;
+	struct intel_buf *buffer_1;
+	struct intel_buf *buffer_2;
 	uint32_t *ptr_cpu;
 	uint32_t *ptr2_cpu;
 	int dma_buf_fd, dma_buf2_fd, i;
 	int local_fd;
-	drm_intel_bufmgr *local_bufmgr;
-	struct intel_batchbuffer *local_batch;
-
+	struct buf_ops *local_bops;
+	struct intel_bb *local_batch;
 	/* recreate process local variables */
 	local_fd = drm_open_driver(DRIVER_INTEL);
-	local_bufmgr = drm_intel_bufmgr_gem_init(local_fd, 4096);
-	igt_assert(local_bufmgr);
+	local_bops = buf_ops_create(local_fd);
 
-	local_batch = intel_batchbuffer_alloc(local_bufmgr, intel_get_drm_devid(local_fd));
-	igt_assert(local_batch);
+	local_batch = intel_bb_create(local_fd, 4096);
 
-	bo_1 = drm_intel_bo_alloc(local_bufmgr, "BO 1", width * height * 4, 4096);
-	dma_buf_fd = prime_handle_to_fd_for_mmap(local_fd, bo_1->handle);
+	buffer_1 = intel_buf_create(local_bops, width, height, 32, 4096,
+				    I915_TILING_NONE, I915_COMPRESSION_NONE);
+	dma_buf_fd = prime_handle_to_fd_for_mmap(local_fd, buffer_1->handle);
 	igt_skip_on(errno == EINVAL);
 
 	ptr_cpu = mmap(NULL, width * height, PROT_READ | PROT_WRITE,
 		       MAP_SHARED, dma_buf_fd, 0);
 	igt_assert(ptr_cpu != MAP_FAILED);
 
-	bo_2 = drm_intel_bo_alloc(local_bufmgr, "BO 2", width * height * 4, 4096);
-	dma_buf2_fd = prime_handle_to_fd_for_mmap(local_fd, bo_2->handle);
+	buffer_2 = intel_buf_create(local_bops, width, height, 32, 4096,
+				    I915_TILING_NONE, I915_COMPRESSION_NONE);
+	dma_buf2_fd = prime_handle_to_fd_for_mmap(local_fd, buffer_2->handle);
 
 	ptr2_cpu = mmap(NULL, width * height, PROT_READ | PROT_WRITE,
 			MAP_SHARED, dma_buf2_fd, 0);
@@ -222,7 +229,7 @@ static void blit_and_cmp(void)
 	prime_sync_end(dma_buf2_fd, true);
 
 	/* Copy BO 1 into BO 2, using blitter. */
-	intel_copy_bo(local_batch, bo_2, bo_1, width * height);
+	intel_bb_copy_intel_buf(local_batch, buffer_1, buffer_2, width * height * 4);
 	usleep(0); /* let someone else claim the mutex */
 
 	/* Compare BOs. If prime_sync_* were executed properly, the caches
@@ -232,16 +239,16 @@ static void blit_and_cmp(void)
 		igt_fail_on_f(ptr2_cpu[i] != 0x11111111, "Found 0x%08x at offset 0x%08x\n", ptr2_cpu[i], i);
 	prime_sync_end(dma_buf2_fd, false);
 
-	drm_intel_bo_unreference(bo_1);
-	drm_intel_bo_unreference(bo_2);
+	intel_buf_destroy(buffer_1);
+	intel_buf_destroy(buffer_2);
 	munmap(ptr_cpu, width * height);
 	munmap(ptr2_cpu, width * height);
 
 	close(dma_buf_fd);
 	close(dma_buf2_fd);
 
-	intel_batchbuffer_free(local_batch);
-	drm_intel_bufmgr_destroy(local_bufmgr);
+	intel_bb_destroy(local_batch);
+	buf_ops_destroy(local_bops);
 	close(local_fd);
 }
 
@@ -274,49 +281,70 @@ static void test_ioctl_errors(void)
 			break;
 		}
 
-		igt_fork(child, num_children)
+		igt_fork(child, num_children) {
+			intel_allocator_init();
 			igt_while_interruptible(true) blit_and_cmp();
+		}
 		igt_waitchildren();
 	}
 }
 
 igt_main
 {
+	struct igt_collection *set, *dma_buf_set;
+	struct drm_i915_query_memory_regions *query_info;
+
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 
-		bufmgr = drm_intel_bufmgr_gem_init(fd, 4096);
-		batch = intel_batchbuffer_alloc(bufmgr, intel_get_drm_devid(fd));
+		query_info = gem_get_query_memory_regions(fd);
+		igt_assert(query_info);
+
+		set = get_memory_region_set(query_info, I915_SYSTEM_MEMORY,
+					    I915_DEVICE_MEMORY);
+
+		dma_buf_set = get_dma_buf_mmap_supported_set(fd, set);
+		igt_require_f(dma_buf_set, "No dma-buf region supported\n");
+
+		igt_collection_destroy(set);
+		igt_collection_destroy(dma_buf_set);
+
+		bops = buf_ops_create(fd);
 	}
 
 	/* Cache coherency and the eviction are pretty much unpredictable, so
 	 * reproducing boils down to trial and error to hit different scenarios.
 	 * TODO: We may want to improve tests a bit by picking random subranges. */
 	igt_subtest("read") {
+		batch = intel_bb_create(fd, 4096);
 		igt_until_timeout(5) {
 			int stale = test_read_flush();
 			igt_fail_on_f(stale,
 				      "num of stale cache lines %d\n", stale);
 		}
+		intel_bb_destroy(batch);
 	}
 
 	igt_subtest("write") {
+		batch = intel_bb_create(fd, 4096);
 		igt_until_timeout(5) {
 			int stale = test_write_flush();
 			igt_fail_on_f(stale,
 				      "num of stale cache lines %d\n", stale);
 		}
+		intel_bb_destroy(batch);
 	}
 
 	igt_subtest("ioctl-errors") {
+		batch = intel_bb_create(fd, 4096);
 		igt_info("exercising concurrent blit to get ioctl errors\n");
 		test_ioctl_errors();
+		intel_bb_destroy(batch);
 	}
 
 	igt_fixture {
-		intel_batchbuffer_free(batch);
-		drm_intel_bufmgr_destroy(bufmgr);
+		buf_ops_destroy(bops);
 
 		close(fd);
 	}
-- 
2.32.0
