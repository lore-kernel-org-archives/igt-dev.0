Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 082586E10C
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Oct 2021 11:03:50 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Thu, 14 Oct 2021 16:39:22 +0530
Message-Id: <20211014110922.1121963-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t,
 v2] tests/prime_mmap: Add support for local memory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: zbigniew.kempczynski@intel.com, arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Andrzej Turko <andrzej.turko@linux.intel.com>

Add support for local memory region (Device memory)

v2:
  - Replace igt_skip_on() with igt_assert(), as with TTM
    backend this test will not be able to run on discrete
    currently.
  - Fix minor line wrap changes.

Signed-off-by: Andrzej Turko <andrzej.turko@linux.intel.com>
Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/prime_mmap.c | 254 +++++++++++++++++++++++++++------------------
 1 file changed, 154 insertions(+), 100 deletions(-)

diff --git a/tests/prime_mmap.c b/tests/prime_mmap.c
index a4e4b4b6..adbfaa22 100644
--- a/tests/prime_mmap.c
+++ b/tests/prime_mmap.c
@@ -42,11 +42,14 @@
 
 #include "drm.h"
 #include "drmtest.h"
+#include "igt.h"
+#include "igt_collection.h"
 #include "i915_drm.h"
 #include "i915/gem_create.h"
 #include "i915/gem_mman.h"
 #include "igt_debugfs.h"
 #include "ioctl_wrappers.h"
+#include "i915/intel_memory_region.h"
 
 #define BO_SIZE (16*1024)
 
@@ -68,119 +71,123 @@ fill_bo(uint32_t handle, size_t size)
 }
 
 static void
-fill_bo_cpu(char *ptr)
+fill_bo_cpu(char *ptr, size_t size)
 {
-	memcpy(ptr, pattern, sizeof(pattern));
+	off_t i;
+	for (i = 0; i < size; i += sizeof(pattern))
+	{
+		memcpy(ptr + i, pattern, sizeof(pattern));
+	}
 }
 
 static void
-test_correct(void)
+test_correct(uint32_t region, int size)
 {
 	int dma_buf_fd;
 	char *ptr1, *ptr2;
 	uint32_t handle;
 
-	handle = gem_create(fd, BO_SIZE);
-	fill_bo(handle, BO_SIZE);
+	handle = gem_create_in_memory_regions(fd, size, region);
+	fill_bo(handle, size);
 
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
 	igt_assert(errno == 0);
 
 	/* Check correctness vs GEM_MMAP */
-	ptr1 = gem_mmap__device_coherent(fd, handle, 0, BO_SIZE, PROT_READ);
-	ptr2 = mmap(NULL, BO_SIZE, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
+	ptr1 = gem_mmap__device_coherent(fd, handle, 0, size, PROT_READ);
+	ptr2 = mmap(NULL, size, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
 	igt_assert(ptr1 != MAP_FAILED);
 	igt_assert(ptr2 != MAP_FAILED);
-	igt_assert(memcmp(ptr1, ptr2, BO_SIZE) == 0);
+	igt_assert(memcmp(ptr1, ptr2, size) == 0);
 
 	/* Check pattern correctness */
 	igt_assert(memcmp(ptr2, pattern, sizeof(pattern)) == 0);
 
-	munmap(ptr1, BO_SIZE);
-	munmap(ptr2, BO_SIZE);
+	munmap(ptr1, size);
+	munmap(ptr2, size);
 	close(dma_buf_fd);
 	gem_close(fd, handle);
 }
 
 static void
-test_map_unmap(void)
+test_map_unmap(uint32_t region, int size)
 {
 	int dma_buf_fd;
 	char *ptr;
 	uint32_t handle;
 
-	handle = gem_create(fd, BO_SIZE);
-	fill_bo(handle, BO_SIZE);
+	handle = gem_create_in_memory_regions(fd, size, region);
+	fill_bo(handle, size);
 
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
 	igt_assert(errno == 0);
 
-	ptr = mmap(NULL, BO_SIZE, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
+	ptr = mmap(NULL, size, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
 	igt_assert(ptr != MAP_FAILED);
 	igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
 
 	/* Unmap and remap */
-	munmap(ptr, BO_SIZE);
-	ptr = mmap(NULL, BO_SIZE, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
+	munmap(ptr, size);
+	ptr = mmap(NULL, size, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
 	igt_assert(ptr != MAP_FAILED);
 	igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
 
-	munmap(ptr, BO_SIZE);
+	munmap(ptr, size);
 	close(dma_buf_fd);
 	gem_close(fd, handle);
 }
 
 /* prime and then unprime and then prime again the same handle */
 static void
-test_reprime(void)
+test_reprime(uint32_t region, int size)
 {
 	int dma_buf_fd;
 	char *ptr;
 	uint32_t handle;
 
-	handle = gem_create(fd, BO_SIZE);
-	fill_bo(handle, BO_SIZE);
+	handle = gem_create_in_memory_regions(fd, size, region);
+	fill_bo(handle, size);
 
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
 	igt_assert(errno == 0);
 
-	ptr = mmap(NULL, BO_SIZE, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
+	ptr = mmap(NULL, size, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
 	igt_assert(ptr != MAP_FAILED);
 	igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
 
 	close (dma_buf_fd);
 	igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
-	munmap(ptr, BO_SIZE);
+	munmap(ptr, size);
 
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
-	ptr = mmap(NULL, BO_SIZE, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
+	ptr = mmap(NULL, size, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
 	igt_assert(ptr != MAP_FAILED);
 	igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
 
-	munmap(ptr, BO_SIZE);
+	munmap(ptr, size);
 	close(dma_buf_fd);
 	gem_close(fd, handle);
 }
 
 /* map from another process */
 static void
-test_forked(void)
+test_forked(uint32_t region, int size)
 {
 	int dma_buf_fd;
 	char *ptr;
 	uint32_t handle;
 
-	handle = gem_create(fd, BO_SIZE);
-	fill_bo(handle, BO_SIZE);
+	handle = gem_create_in_memory_regions(fd, size, region);
+	fill_bo(handle, size);
 
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
 	igt_assert(errno == 0);
 
 	igt_fork(childno, 1) {
-		ptr = mmap(NULL, BO_SIZE, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
+		ptr = mmap(NULL, size, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
 		igt_assert(ptr != MAP_FAILED);
 		igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
-		munmap(ptr, BO_SIZE);
+		munmap(ptr, size);
 		close(dma_buf_fd);
 	}
 	close(dma_buf_fd);
@@ -190,13 +197,13 @@ test_forked(void)
 
 /* test simple CPU write */
 static void
-test_correct_cpu_write(void)
+test_correct_cpu_write(uint32_t region, int size)
 {
 	int dma_buf_fd;
 	char *ptr;
 	uint32_t handle;
 
-	handle = gem_create(fd, BO_SIZE);
+	handle = gem_create_in_memory_regions(fd, size, region);
 
 	dma_buf_fd = prime_handle_to_fd_for_mmap(fd, handle);
 
@@ -204,29 +211,29 @@ test_correct_cpu_write(void)
 	igt_skip_on(errno == EINVAL);
 
 	/* Check correctness of map using write protection (PROT_WRITE) */
-	ptr = mmap(NULL, BO_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, dma_buf_fd, 0);
+	ptr = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, dma_buf_fd, 0);
 	igt_assert(ptr != MAP_FAILED);
 
 	/* Fill bo using CPU */
-	fill_bo_cpu(ptr);
+	fill_bo_cpu(ptr, BO_SIZE);
 
 	/* Check pattern correctness */
 	igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
 
-	munmap(ptr, BO_SIZE);
+	munmap(ptr, size);
 	close(dma_buf_fd);
 	gem_close(fd, handle);
 }
 
 /* map from another process and then write using CPU */
 static void
-test_forked_cpu_write(void)
+test_forked_cpu_write(uint32_t region, int size)
 {
 	int dma_buf_fd;
 	char *ptr;
 	uint32_t handle;
 
-	handle = gem_create(fd, BO_SIZE);
+	handle = gem_create_in_memory_regions(fd, size, region);
 
 	dma_buf_fd = prime_handle_to_fd_for_mmap(fd, handle);
 
@@ -234,12 +241,12 @@ test_forked_cpu_write(void)
 	igt_skip_on(errno == EINVAL);
 
 	igt_fork(childno, 1) {
-		ptr = mmap(NULL, BO_SIZE, PROT_READ | PROT_WRITE , MAP_SHARED, dma_buf_fd, 0);
+		ptr = mmap(NULL, size, PROT_READ | PROT_WRITE , MAP_SHARED, dma_buf_fd, 0);
 		igt_assert(ptr != MAP_FAILED);
-		fill_bo_cpu(ptr);
+		fill_bo_cpu(ptr, BO_SIZE);
 
 		igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
-		munmap(ptr, BO_SIZE);
+		munmap(ptr, size);
 		close(dma_buf_fd);
 	}
 	close(dma_buf_fd);
@@ -248,45 +255,45 @@ test_forked_cpu_write(void)
 }
 
 static void
-test_refcounting(void)
+test_refcounting(uint32_t region, int size)
 {
 	int dma_buf_fd;
 	char *ptr;
 	uint32_t handle;
 
-	handle = gem_create(fd, BO_SIZE);
-	fill_bo(handle, BO_SIZE);
+	handle = gem_create_in_memory_regions(fd, size, region);
+	fill_bo(handle, size);
 
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
 	igt_assert(errno == 0);
 	/* Close gem object before mapping */
 	gem_close(fd, handle);
 
-	ptr = mmap(NULL, BO_SIZE, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
+	ptr = mmap(NULL, size, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
 	igt_assert(ptr != MAP_FAILED);
 	igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
-	munmap(ptr, BO_SIZE);
+	munmap(ptr, size);
 	close (dma_buf_fd);
 }
 
 /* dup before mmap */
 static void
-test_dup(void)
+test_dup(uint32_t region, int size)
 {
 	int dma_buf_fd;
 	char *ptr;
 	uint32_t handle;
 
-	handle = gem_create(fd, BO_SIZE);
-	fill_bo(handle, BO_SIZE);
+	handle = gem_create_in_memory_regions(fd, size, region);
+	fill_bo(handle, size);
 
 	dma_buf_fd = dup(prime_handle_to_fd(fd, handle));
 	igt_assert(errno == 0);
 
-	ptr = mmap(NULL, BO_SIZE, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
+	ptr = mmap(NULL, size, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
 	igt_assert(ptr != MAP_FAILED);
 	igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
-	munmap(ptr, BO_SIZE);
+	munmap(ptr, size);
 	gem_close(fd, handle);
 	close (dma_buf_fd);
 }
@@ -324,21 +331,21 @@ static bool has_userptr(void)
 
 /* test for mmap(dma_buf_export(userptr)) */
 static void
-test_userptr(void)
+test_userptr(uint32_t region, int size)
 {
 	int ret, dma_buf_fd;
 	void *ptr;
 	uint32_t handle;
 
-	igt_require(has_userptr());
-
 	/* create userptr bo */
-	ret = posix_memalign(&ptr, 4096, BO_SIZE);
+	ret = posix_memalign(&ptr, 4096, size);
 	igt_assert_eq(ret, 0);
 
-	/* we are not allowed to export unsynchronized userptr. Just create a normal
-	 * one */
-	gem_userptr(fd, (uint32_t *)ptr, BO_SIZE, 0, 0, &handle);
+	/*
+	 * we are not allowed to export unsynchronized userptr. Just create a
+	 * normal one
+	 */
+	gem_userptr(fd, (uint32_t *)ptr, size, 0, 0, &handle);
 
 	/* export userptr */
 	ret = prime_handle_to_fd_no_assert(handle, DRM_CLOEXEC, &dma_buf_fd);
@@ -352,7 +359,7 @@ test_userptr(void)
 
 	/* a userptr doesn't have the obj->base.filp, but can be exported via
 	 * dma-buf, so make sure it fails here */
-	ptr = mmap(NULL, BO_SIZE, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
+	ptr = mmap(NULL, size, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
 	igt_assert(ptr == MAP_FAILED && errno == ENODEV);
 free_userptr:
 	gem_close(fd, handle);
@@ -360,7 +367,7 @@ free_userptr:
 }
 
 static void
-test_errors(void)
+test_errors(uint32_t region, int size)
 {
 	int i, dma_buf_fd;
 	char *ptr;
@@ -369,48 +376,49 @@ test_errors(void)
 	                       DRM_RDWR - 1, DRM_RDWR + 1};
 
 	/* Test for invalid flags */
-	handle = gem_create(fd, BO_SIZE);
-	for (i = 0; i < sizeof(invalid_flags) / sizeof(invalid_flags[0]); i++) {
+	handle = gem_create_in_memory_regions(fd, size, region);
+	for (i = 0; i < ARRAY_SIZE(invalid_flags); i++) {
 		prime_handle_to_fd_no_assert(handle, invalid_flags[i], &dma_buf_fd);
 		igt_assert_eq(errno, EINVAL);
 		errno = 0;
 	}
+	gem_close(fd, handle);
 
 	/* Close gem object before priming */
-	handle = gem_create(fd, BO_SIZE);
-	fill_bo(handle, BO_SIZE);
+	handle = gem_create_in_memory_regions(fd, size, region);
+	fill_bo(handle, size);
 	gem_close(fd, handle);
 	prime_handle_to_fd_no_assert(handle, DRM_CLOEXEC, &dma_buf_fd);
 	igt_assert(dma_buf_fd == -1 && errno == ENOENT);
 	errno = 0;
 
 	/* close fd before mapping */
-	handle = gem_create(fd, BO_SIZE);
-	fill_bo(handle, BO_SIZE);
+	handle = gem_create_in_memory_regions(fd, size, region);
+	fill_bo(handle, size);
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
 	igt_assert(errno == 0);
 	close(dma_buf_fd);
-	ptr = mmap(NULL, BO_SIZE, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
+	ptr = mmap(NULL, size, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
 	igt_assert(ptr == MAP_FAILED && errno == EBADF);
 	errno = 0;
 	gem_close(fd, handle);
 
 	/* Map too big */
-	handle = gem_create(fd, BO_SIZE);
-	fill_bo(handle, BO_SIZE);
+	handle = gem_create_in_memory_regions(fd, size, region);
+	fill_bo(handle, size);
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
 	igt_assert(errno == 0);
-	ptr = mmap(NULL, BO_SIZE * 2, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
+	ptr = mmap(NULL, size * 2, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
 	igt_assert(ptr == MAP_FAILED && errno == EINVAL);
 	errno = 0;
 	close(dma_buf_fd);
 	gem_close(fd, handle);
 
 	/* Overlapping the end of the buffer */
-	handle = gem_create(fd, BO_SIZE);
+	handle = gem_create_in_memory_regions(fd, size, region);
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
 	igt_assert(errno == 0);
-	ptr = mmap(NULL, BO_SIZE, PROT_READ, MAP_SHARED, dma_buf_fd, BO_SIZE / 2);
+	ptr = mmap(NULL, size, PROT_READ, MAP_SHARED, dma_buf_fd, size / 2);
 	igt_assert(ptr == MAP_FAILED && errno == EINVAL);
 	errno = 0;
 	close(dma_buf_fd);
@@ -419,7 +427,7 @@ test_errors(void)
 
 /* Test for invalid flags on sync ioctl */
 static void
-test_invalid_sync_flags(void)
+test_invalid_sync_flags(uint32_t region, int size)
 {
 	int i, dma_buf_fd;
 	uint32_t handle;
@@ -429,7 +437,7 @@ test_invalid_sync_flags(void)
 	                       LOCAL_DMA_BUF_SYNC_RW + 1,
 	                       LOCAL_DMA_BUF_SYNC_VALID_FLAGS_MASK + 1};
 
-	handle = gem_create(fd, BO_SIZE);
+	handle = gem_create_in_memory_regions(fd, size, region);
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
 	for (i = 0; i < sizeof(invalid_flags) / sizeof(invalid_flags[0]); i++) {
 		memset(&sync, 0, sizeof(sync));
@@ -442,7 +450,7 @@ test_invalid_sync_flags(void)
 }
 
 static void
-test_aperture_limit(void)
+test_aperture_limit(uint32_t region, int size)
 {
 	int dma_buf_fd1, dma_buf_fd2;
 	char *ptr1, *ptr2;
@@ -452,23 +460,22 @@ test_aperture_limit(void)
 	uint64_t size2 = (gem_mappable_aperture_size(fd) * 3) / 8;
 
 	handle1 = gem_create(fd, size1);
-	fill_bo(handle1, BO_SIZE);
-
-	dma_buf_fd1 = prime_handle_to_fd(fd, handle1);
+	dma_buf_fd1 = prime_handle_to_fd_for_mmap(fd, handle1);
 	igt_assert(errno == 0);
-	ptr1 = mmap(NULL, size1, PROT_READ, MAP_SHARED, dma_buf_fd1, 0);
+	ptr1 = mmap(NULL, size1, PROT_READ | PROT_WRITE, MAP_SHARED, dma_buf_fd1, 0);
 	igt_assert(ptr1 != MAP_FAILED);
+	fill_bo_cpu(ptr1, size);
 	igt_assert(memcmp(ptr1, pattern, sizeof(pattern)) == 0);
 
 	handle2 = gem_create(fd, size1);
-	fill_bo(handle2, BO_SIZE);
-	dma_buf_fd2 = prime_handle_to_fd(fd, handle2);
+	dma_buf_fd2 = prime_handle_to_fd_for_mmap(fd, handle2);
 	igt_assert(errno == 0);
-	ptr2 = mmap(NULL, size2, PROT_READ, MAP_SHARED, dma_buf_fd2, 0);
+	ptr2 = mmap(NULL, size2, PROT_READ | PROT_WRITE, MAP_SHARED, dma_buf_fd2, 0);
 	igt_assert(ptr2 != MAP_FAILED);
+	fill_bo_cpu(ptr2, size);
 	igt_assert(memcmp(ptr2, pattern, sizeof(pattern)) == 0);
 
-	igt_assert(memcmp(ptr1, ptr2, BO_SIZE) == 0);
+	igt_assert(memcmp(ptr1, ptr2, size) == 0);
 
 	munmap(ptr1, size1);
 	munmap(ptr2, size2);
@@ -479,29 +486,55 @@ test_aperture_limit(void)
 }
 
 static int
-check_for_dma_buf_mmap(void)
+check_for_dma_buf_mmap(struct igt_collection *set)
 {
+	struct igt_collection *region;
+	uint32_t reg;
 	int dma_buf_fd;
 	char *ptr;
 	uint32_t handle;
 	int ret = 1;
 
-	handle = gem_create(fd, BO_SIZE);
-	dma_buf_fd = prime_handle_to_fd(fd, handle);
-	ptr = mmap(NULL, BO_SIZE, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
-	if (ptr != MAP_FAILED)
-		ret = 0;
-	munmap(ptr, BO_SIZE);
-	gem_close(fd, handle);
-	close(dma_buf_fd);
+	for_each_combination(region, 1, set) {
+		reg = igt_collection_get_value(region, 0);
+		handle = gem_create_in_memory_regions(fd, BO_SIZE, reg);
+
+		dma_buf_fd = prime_handle_to_fd(fd, handle);
+		ptr = mmap(NULL, BO_SIZE, PROT_READ, MAP_SHARED, dma_buf_fd, 0);
+		if (ptr != MAP_FAILED)
+			ret = 0;
+		munmap(ptr, BO_SIZE);
+		gem_close(fd, handle);
+		close(dma_buf_fd);
+	}
 	return ret;
 }
 
+#define SKIP_LMEM (1 << 0)
+#define SKIP_USERPTR (1 << 1)
+
+/*
+ * true skips the test
+ */
+static bool check_skip(uint32_t skip, uint32_t region)
+{
+	if ((skip & SKIP_LMEM) && IS_DEVICE_MEMORY_REGION(region))
+		return true;
+
+	if (skip & SKIP_USERPTR)
+		return !has_userptr();
+
+	return false;
+}
+
 igt_main
 {
+	struct igt_collection *set, *regions;
+	struct drm_i915_query_memory_regions *query_info;
 	struct {
 		const char *name;
-		void (*fn)(void);
+		void (*fn)(uint32_t, int);
+		uint32_t skip;
 	} tests[] = {
 		{ "test_correct", test_correct },
 		{ "test_map_unmap", test_map_unmap },
@@ -511,25 +544,46 @@ igt_main
 		{ "test_forked_cpu_write", test_forked_cpu_write },
 		{ "test_refcounting", test_refcounting },
 		{ "test_dup", test_dup },
-		{ "test_userptr", test_userptr },
+		{ "test_userptr", test_userptr, SKIP_LMEM | SKIP_USERPTR },
 		{ "test_errors", test_errors },
 		{ "test_invalid_sync_flags", test_invalid_sync_flags },
-		{ "test_aperture_limit", test_aperture_limit },
+		{ "test_aperture_limit", test_aperture_limit, SKIP_LMEM },
 	};
+	uint32_t region;
+	char *ext;
+	int size;
 	int i;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
-		igt_skip_on((check_for_dma_buf_mmap() != 0));
-		errno = 0;
-	}
 
+		query_info = gem_get_query_memory_regions(fd);
+		igt_assert(query_info);
 
-	for (i = 0; i < ARRAY_SIZE(tests); i++) {
-		igt_subtest(tests[i].name)
-			tests[i].fn();
+		set = get_memory_region_set(query_info, I915_SYSTEM_MEMORY,
+					    I915_DEVICE_MEMORY);
+		igt_assert(check_for_dma_buf_mmap(set) == 0);
+		errno = 0;
 	}
 
-	igt_fixture
+	for (i = 0; i < ARRAY_SIZE(tests); i++)
+		igt_subtest_with_dynamic(tests[i].name) {
+			for_each_combination(regions, 1, set) {
+				region = igt_collection_get_value(regions, 0);
+				size = gem_get_batch_size(fd, MEMORY_TYPE_FROM_REGION(region));
+				size = max(size, BO_SIZE);
+				if (check_skip(tests[i].skip, region))
+					continue;
+				ext = memregion_dynamic_subtest_name(regions);
+				igt_dynamic_f("%s-%s", tests[i].name, ext)
+					tests[i].fn(region, size);
+				free(ext);
+			}
+		}
+
+	igt_fixture {
+		free(query_info);
+		igt_collection_destroy(set);
 		close(fd);
+	}
 }
-- 
2.25.1
