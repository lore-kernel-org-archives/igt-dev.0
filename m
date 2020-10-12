Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284996E44B
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2020 12:39:06 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Mon, 12 Oct 2020 14:38:58 +0200
Message-Id: <20201012123900.485289-2-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20201012123900.485289-1-maarten.lankhorst@linux.intel.com>
References: <20201012123900.485289-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/gem_userptr_blits: Rework userptr
 tests to copy with changes
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
List-ID: <igt-dev@lists.freedesktop.org>

Userptr semantics are changed to no longer allow forked processes
to obtain pages, it will fail with -EFAULT. We also no longer
allow unsynchronized access, so has_userptr needs to check with the
notifier installed.

The only way to make forked tests work would be to do use a fork
without clone_vm set, which we have no igt infrastructure for,
and can't work like the current igt_fork().

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 tests/i915/gem_userptr_blits.c | 94 +++++++++++++++++++---------------
 1 file changed, 53 insertions(+), 41 deletions(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 268423dcd1ed..285a0b365a3f 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -71,7 +71,7 @@
 #define PAGE_SIZE 4096
 #endif
 
-static uint32_t userptr_flags = I915_USERPTR_UNSYNCHRONIZED;
+static uint32_t userptr_flags = 0;
 
 static bool *can_mmap;
 
@@ -504,14 +504,10 @@ static int has_userptr(int fd)
 {
 	uint32_t handle = 0;
 	void *ptr;
-	uint32_t oldflags;
 	int ret;
 
 	igt_assert(posix_memalign(&ptr, PAGE_SIZE, PAGE_SIZE) == 0);
-	oldflags = userptr_flags;
-	gem_userptr_test_unsynchronized();
 	ret = __gem_userptr(fd, ptr, PAGE_SIZE, 0, userptr_flags, &handle);
-	userptr_flags = oldflags;
 	if (ret != 0) {
 		free(ptr);
 		return 0;
@@ -703,10 +699,9 @@ static void test_forked_access(int fd)
 	void *ptr1 = NULL, *ptr2 = NULL;
 	int ret;
 
-	ret = posix_memalign(&ptr1, PAGE_SIZE, sizeof(linear));
-#ifdef MADV_DONTFORK
-	ret |= madvise(ptr1, sizeof(linear), MADV_DONTFORK);
-#endif
+	ptr1 = mmap(NULL, sizeof(linear), PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(ptr1 != MAP_FAILED);
+
 	gem_userptr(fd, ptr1, sizeof(linear), 0, userptr_flags, &handle1);
 	igt_assert(ptr1);
 	igt_assert(handle1);
@@ -722,8 +717,17 @@ static void test_forked_access(int fd)
 	memset(ptr1, 0x1, sizeof(linear));
 	memset(ptr2, 0x2, sizeof(linear));
 
-	igt_fork(child, 1)
-		igt_assert_eq(copy(fd, handle1, handle2), 0);
+	igt_fork(child, 1) {
+		ret = copy(fd, handle1, handle2);
+		if (ret) {
+			/*
+			 * userptr being exportable is a misfeature,
+			 * and has now been disallowed
+			 */
+			igt_assert_eq(ret, -EFAULT);
+			memset(ptr1, 0x2, sizeof(linear));
+		}
+	}
 	igt_waitchildren();
 
 	gem_userptr_sync(fd, handle1);
@@ -734,11 +738,7 @@ static void test_forked_access(int fd)
 
 	igt_assert(memcmp(ptr1, ptr2, sizeof(linear)) == 0);
 
-#ifdef MADV_DOFORK
-	ret = madvise(ptr1, sizeof(linear), MADV_DOFORK);
-	igt_assert_eq(ret, 0);
-#endif
-	free(ptr1);
+	munmap(ptr1, sizeof(linear));
 
 #ifdef MADV_DOFORK
 	ret = madvise(ptr2, sizeof(linear), MADV_DOFORK);
@@ -749,10 +749,8 @@ static void test_forked_access(int fd)
 
 #define MAP_FIXED_INVALIDATE_OVERLAP	(1<<0)
 #define MAP_FIXED_INVALIDATE_BUSY	(1<<1)
-#define MAP_FIXED_INVALIDATE_GET_PAGES	(1<<2)
 #define ALL_MAP_FIXED_INVALIDATE (MAP_FIXED_INVALIDATE_OVERLAP | \
-				  MAP_FIXED_INVALIDATE_BUSY | \
-				  MAP_FIXED_INVALIDATE_GET_PAGES)
+				  MAP_FIXED_INVALIDATE_BUSY)
 
 static int test_map_fixed_invalidate(int fd, uint32_t flags,
 				     const struct mmap_offset *t)
@@ -791,12 +789,6 @@ static int test_map_fixed_invalidate(int fd, uint32_t flags,
 			      "HW & kernel support for mmap_offset(%s)\n",
 			      t->name);
 
-		if (flags & MAP_FIXED_INVALIDATE_GET_PAGES)
-			igt_assert_eq(__gem_set_domain(fd, handle[0],
-						       I915_GEM_DOMAIN_GTT,
-						       I915_GEM_DOMAIN_GTT),
-				      0);
-
 		if (flags & MAP_FIXED_INVALIDATE_BUSY)
 			igt_assert_eq(copy(fd, handle[0], handle[num_handles-1]), 0);
 
@@ -810,17 +802,6 @@ static int test_map_fixed_invalidate(int fd, uint32_t flags,
 		gem_set_tiling(fd, mmap_offset.handle, I915_TILING_NONE, 0);
 		*map = 0xdead;
 
-		if (flags & MAP_FIXED_INVALIDATE_GET_PAGES) {
-			igt_assert_eq(__gem_set_domain(fd, handle[0],
-						       I915_GEM_DOMAIN_GTT,
-						       I915_GEM_DOMAIN_GTT),
-				      -EFAULT);
-
-			/* Errors are permanent, so we have to recreate */
-			gem_close(fd, handle[0]);
-			handle[0] = create_userptr(fd, 0, ptr + PAGE_SIZE/sizeof(*ptr));
-		}
-
 		gem_set_tiling(fd, mmap_offset.handle, I915_TILING_Y, 512 * 4);
 		*(uint32_t*)map = 0xbeef;
 
@@ -1080,7 +1061,7 @@ static int test_dmabuf(void)
 		close(fd1);
 		return 0;
 	} else {
-		igt_assert_eq(ret, 0);
+		igt_require(ret == 0);
 		igt_assert_lte(0, dma_buf_fd);
 	}
 
@@ -1615,12 +1596,45 @@ static int can_swap(void)
 	return 1;
 }
 
+static bool forked_userptr(int fd)
+{
+	uint32_t handle = 0;
+	int *ptr = NULL;
+	uint32_t ofs = sizeof(linear) / sizeof(*ptr);
+	int ret;
+
+	ptr = mmap(NULL, 2 * sizeof(linear), PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(ptr != MAP_FAILED);
+
+	ptr[ofs] = -1;
+
+	gem_userptr(fd, ptr, sizeof(linear), 0, userptr_flags, &handle);
+	igt_assert(handle);
+
+	igt_fork(child, 1)
+		ptr[ofs] = copy(fd, handle, handle);
+
+	igt_waitchildren();
+	ret = ptr[ofs];
+
+	gem_close(fd, handle);
+
+	munmap(ptr, 2 * sizeof(linear));
+
+	if (ret)
+		igt_assert_eq(ret, -EFAULT);
+
+	return !ret;
+}
+
 static void test_forking_evictions(int fd, int size, int count,
 			     unsigned flags)
 {
 	int trash_count;
 	int num_threads;
 
+	igt_require(forked_userptr(fd));
+
 	trash_count = intel_get_total_ram_mb() * 11 / 10;
 	/* Use the fact test will spawn a number of child
 	 * processes meaning swapping will be triggered system
@@ -2294,13 +2308,11 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 
 		for (unsigned flags = 0; flags < ALL_MAP_FIXED_INVALIDATE + 1; flags++) {
 			igt_describe("Try to anger lockdep with MMU notifier still active after MAP_FIXED remap");
-			igt_subtest_with_dynamic_f("map-fixed-invalidate%s%s%s",
+			igt_subtest_with_dynamic_f("map-fixed-invalidate%s%s",
 					flags & MAP_FIXED_INVALIDATE_OVERLAP ?
 							"-overlap" : "",
 					flags & MAP_FIXED_INVALIDATE_BUSY ?
-							"-busy" : "",
-					flags & MAP_FIXED_INVALIDATE_GET_PAGES ?
-							"-gup" : "") {
+							"-busy" : "") {
 				igt_require_f(gem_available_fences(fd),
 					      "HW & kernel support for tiling\n");
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
