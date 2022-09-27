Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB6D10E0C7
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 09:17:42 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Sep 2022 11:17:25 +0200
Message-Id: <20220927091727.36470-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220927091727.36470-1-zbigniew.kempczynski@intel.com>
References: <20220927091727.36470-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/prime_mmap: Use batch sizes
 appropriate for regions
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

Stop using gem_get_batch_size() as it returns hardcoded values which
makes confusion regarding minimum object size in different regions.

Use real object size instead which is more suitable.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/prime_mmap.c | 59 ++++++++++++++++++++++------------------------
 1 file changed, 28 insertions(+), 31 deletions(-)

diff --git a/tests/prime_mmap.c b/tests/prime_mmap.c
index d53185ff10..bc19f68c98 100644
--- a/tests/prime_mmap.c
+++ b/tests/prime_mmap.c
@@ -81,13 +81,13 @@ fill_bo_cpu(char *ptr, size_t size)
 }
 
 static void
-test_correct(uint32_t region, int size)
+test_correct(uint32_t region, uint64_t size)
 {
 	int dma_buf_fd;
 	char *ptr1, *ptr2;
 	uint32_t handle;
 
-	handle = gem_create_in_memory_regions(fd, size, region);
+	igt_assert(__gem_create_in_memory_regions(fd, &handle, &size, region) == 0);
 	fill_bo(handle, size);
 
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
@@ -110,13 +110,13 @@ test_correct(uint32_t region, int size)
 }
 
 static void
-test_map_unmap(uint32_t region, int size)
+test_map_unmap(uint32_t region, uint64_t size)
 {
 	int dma_buf_fd;
 	char *ptr;
 	uint32_t handle;
 
-	handle = gem_create_in_memory_regions(fd, size, region);
+	igt_assert(__gem_create_in_memory_regions(fd, &handle, &size, region) == 0);
 	fill_bo(handle, size);
 
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
@@ -139,13 +139,13 @@ test_map_unmap(uint32_t region, int size)
 
 /* prime and then unprime and then prime again the same handle */
 static void
-test_reprime(uint32_t region, int size)
+test_reprime(uint32_t region, uint64_t size)
 {
 	int dma_buf_fd;
 	char *ptr;
 	uint32_t handle;
 
-	handle = gem_create_in_memory_regions(fd, size, region);
+	igt_assert(__gem_create_in_memory_regions(fd, &handle, &size, region) == 0);
 	fill_bo(handle, size);
 
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
@@ -171,13 +171,13 @@ test_reprime(uint32_t region, int size)
 
 /* map from another process */
 static void
-test_forked(uint32_t region, int size)
+test_forked(uint32_t region, uint64_t size)
 {
 	int dma_buf_fd;
 	char *ptr;
 	uint32_t handle;
 
-	handle = gem_create_in_memory_regions(fd, size, region);
+	igt_assert(__gem_create_in_memory_regions(fd, &handle, &size, region) == 0);
 	fill_bo(handle, size);
 
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
@@ -197,13 +197,13 @@ test_forked(uint32_t region, int size)
 
 /* test simple CPU write */
 static void
-test_correct_cpu_write(uint32_t region, int size)
+test_correct_cpu_write(uint32_t region, uint64_t size)
 {
 	int dma_buf_fd;
 	char *ptr;
 	uint32_t handle;
 
-	handle = gem_create_in_memory_regions(fd, size, region);
+	igt_assert(__gem_create_in_memory_regions(fd, &handle, &size, region) == 0);
 
 	dma_buf_fd = prime_handle_to_fd_for_mmap(fd, handle);
 
@@ -227,13 +227,13 @@ test_correct_cpu_write(uint32_t region, int size)
 
 /* map from another process and then write using CPU */
 static void
-test_forked_cpu_write(uint32_t region, int size)
+test_forked_cpu_write(uint32_t region, uint64_t size)
 {
 	int dma_buf_fd;
 	char *ptr;
 	uint32_t handle;
 
-	handle = gem_create_in_memory_regions(fd, size, region);
+	igt_assert(__gem_create_in_memory_regions(fd, &handle, &size, region) == 0);
 
 	dma_buf_fd = prime_handle_to_fd_for_mmap(fd, handle);
 
@@ -255,13 +255,13 @@ test_forked_cpu_write(uint32_t region, int size)
 }
 
 static void
-test_refcounting(uint32_t region, int size)
+test_refcounting(uint32_t region, uint64_t size)
 {
 	int dma_buf_fd;
 	char *ptr;
 	uint32_t handle;
 
-	handle = gem_create_in_memory_regions(fd, size, region);
+	igt_assert(__gem_create_in_memory_regions(fd, &handle, &size, region) == 0);
 	fill_bo(handle, size);
 
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
@@ -278,13 +278,13 @@ test_refcounting(uint32_t region, int size)
 
 /* dup before mmap */
 static void
-test_dup(uint32_t region, int size)
+test_dup(uint32_t region, uint64_t size)
 {
 	int dma_buf_fd;
 	char *ptr;
 	uint32_t handle;
 
-	handle = gem_create_in_memory_regions(fd, size, region);
+	igt_assert(__gem_create_in_memory_regions(fd, &handle, &size, region) == 0);
 	fill_bo(handle, size);
 
 	dma_buf_fd = dup(prime_handle_to_fd(fd, handle));
@@ -331,7 +331,7 @@ static bool has_userptr(void)
 
 /* test for mmap(dma_buf_export(userptr)) */
 static void
-test_userptr(uint32_t region, int size)
+test_userptr(uint32_t region, uint64_t size)
 {
 	int ret, dma_buf_fd;
 	void *ptr;
@@ -365,7 +365,7 @@ free_userptr:
 }
 
 static void
-test_errors(uint32_t region, int size)
+test_errors(uint32_t region, uint64_t size)
 {
 	int i, dma_buf_fd;
 	char *ptr;
@@ -374,7 +374,7 @@ test_errors(uint32_t region, int size)
 	                       DRM_RDWR - 1, DRM_RDWR + 1};
 
 	/* Test for invalid flags */
-	handle = gem_create_in_memory_regions(fd, size, region);
+	igt_assert(__gem_create_in_memory_regions(fd, &handle, &size, region) == 0);
 	for (i = 0; i < ARRAY_SIZE(invalid_flags); i++) {
 		prime_handle_to_fd_no_assert(handle, invalid_flags[i], &dma_buf_fd);
 		igt_assert_eq(errno, EINVAL);
@@ -383,7 +383,7 @@ test_errors(uint32_t region, int size)
 	gem_close(fd, handle);
 
 	/* Close gem object before priming */
-	handle = gem_create_in_memory_regions(fd, size, region);
+	igt_assert(__gem_create_in_memory_regions(fd, &handle, &size, region) == 0);
 	fill_bo(handle, size);
 	gem_close(fd, handle);
 	prime_handle_to_fd_no_assert(handle, DRM_CLOEXEC, &dma_buf_fd);
@@ -391,7 +391,7 @@ test_errors(uint32_t region, int size)
 	errno = 0;
 
 	/* close fd before mapping */
-	handle = gem_create_in_memory_regions(fd, size, region);
+	igt_assert(__gem_create_in_memory_regions(fd, &handle, &size, region) == 0);
 	fill_bo(handle, size);
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
 	igt_assert(errno == 0);
@@ -402,7 +402,7 @@ test_errors(uint32_t region, int size)
 	gem_close(fd, handle);
 
 	/* Map too big */
-	handle = gem_create_in_memory_regions(fd, size, region);
+	igt_assert(__gem_create_in_memory_regions(fd, &handle, &size, region) == 0);
 	fill_bo(handle, size);
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
 	igt_assert(errno == 0);
@@ -413,7 +413,7 @@ test_errors(uint32_t region, int size)
 	gem_close(fd, handle);
 
 	/* Overlapping the end of the buffer */
-	handle = gem_create_in_memory_regions(fd, size, region);
+	igt_assert(__gem_create_in_memory_regions(fd, &handle, &size, region) == 0);
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
 	igt_assert(errno == 0);
 	ptr = mmap(NULL, size, PROT_READ, MAP_SHARED, dma_buf_fd, size / 2);
@@ -425,7 +425,7 @@ test_errors(uint32_t region, int size)
 
 /* Test for invalid flags on sync ioctl */
 static void
-test_invalid_sync_flags(uint32_t region, int size)
+test_invalid_sync_flags(uint32_t region, uint64_t size)
 {
 	int i, dma_buf_fd;
 	uint32_t handle;
@@ -435,7 +435,7 @@ test_invalid_sync_flags(uint32_t region, int size)
 	                       LOCAL_DMA_BUF_SYNC_RW + 1,
 	                       LOCAL_DMA_BUF_SYNC_VALID_FLAGS_MASK + 1};
 
-	handle = gem_create_in_memory_regions(fd, size, region);
+	igt_assert(__gem_create_in_memory_regions(fd, &handle, &size, region) == 0);
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
 	for (i = 0; i < sizeof(invalid_flags) / sizeof(invalid_flags[0]); i++) {
 		memset(&sync, 0, sizeof(sync));
@@ -448,7 +448,7 @@ test_invalid_sync_flags(uint32_t region, int size)
 }
 
 static void
-test_aperture_limit(uint32_t region, int size)
+test_aperture_limit(uint32_t region, uint64_t size)
 {
 	int dma_buf_fd1, dma_buf_fd2;
 	char *ptr1, *ptr2;
@@ -506,7 +506,7 @@ igt_main
 	struct drm_i915_query_memory_regions *query_info;
 	struct {
 		const char *name;
-		void (*fn)(uint32_t, int);
+		void (*fn)(uint32_t, uint64_t);
 		uint32_t skip;
 	} tests[] = {
 		{ "test_correct", test_correct },
@@ -524,7 +524,6 @@ igt_main
 	};
 	uint32_t region;
 	char *ext;
-	int size;
 	int i;
 
 	igt_fixture {
@@ -545,13 +544,11 @@ igt_main
 		igt_subtest_with_dynamic(tests[i].name) {
 			for_each_combination(regions, 1, dma_buf_set) {
 				region = igt_collection_get_value(regions, 0);
-				size = gem_get_batch_size(fd, MEMORY_TYPE_FROM_REGION(region));
-				size = max(size, BO_SIZE);
 				if (check_skip(tests[i].skip, region))
 					continue;
 				ext = memregion_dynamic_subtest_name(regions);
 				igt_dynamic_f("%s-%s", tests[i].name, ext)
-					tests[i].fn(region, size);
+					tests[i].fn(region, BO_SIZE);
 				free(ext);
 			}
 		}
-- 
2.34.1
