Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3106E03C
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2020 02:44:04 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Sun,  6 Sep 2020 19:43:40 -0400
Message-Id: <20200906234340.931-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/ioctl_wrappers: Keep IGT working
 without pread/pwrite ioctls
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

The general direction at this time is to phase out pread/write ioctls
and not support them in future products. This means IGT must handle
the absence of these ioctls. This patch does this by modifying
gem_read() and gem_write() to do the read/write using the pread/pwrite
ioctls first but when these ioctls are unavailable fall back to doing
the read/write using a combination of mmap and memcpy.

Callers who must absolutely use the pread/pwrite ioctls (such as tests
which test these ioctls or must otherwise only use the pread/pwrite
ioctls) must use gem_require_pread_pwrite() to skip when these ioctls
are not available.

v1: Removed __gem_pread, gem_pread, __gem_pwrite and gem_pwrite
    introduced previously since they don't appear necessary
v2: Fix CI failures in gem_advise and gen9_exec_parse by introducing
    gem_require_pread_pwrite
v3: Skip mmap for 0 length read/write's

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/ioctl_wrappers.c                        | 139 +++++++++++++++++++-
 lib/ioctl_wrappers.h                        |   3 +
 tests/i915/gem_madvise.c                    |   2 +
 tests/i915/gem_partial_pwrite_pread.c       |   1 +
 tests/i915/gem_pread.c                      |   1 +
 tests/i915/gem_pread_after_blit.c           |   1 +
 tests/i915/gem_pwrite.c                     |   1 +
 tests/i915/gem_pwrite_snooped.c             |   1 +
 tests/i915/gem_readwrite.c                  |   1 +
 tests/i915/gem_set_tiling_vs_pwrite.c       |   1 +
 tests/i915/gem_tiled_partial_pwrite_pread.c |   1 +
 tests/i915/gem_tiled_pread_basic.c          |   1 +
 tests/i915/gem_tiled_pread_pwrite.c         |   1 +
 tests/i915/gem_userptr_blits.c              |   2 +
 tests/i915/gen9_exec_parse.c                |   4 +-
 15 files changed, 153 insertions(+), 7 deletions(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 3781286d8..12451d1d5 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -55,6 +55,7 @@
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
 #include "config.h"
+#include "i915/gem_mman.h"
 
 #ifdef HAVE_VALGRIND
 #include <valgrind/valgrind.h>
@@ -323,6 +324,74 @@ void gem_close(int fd, uint32_t handle)
 	do_ioctl(fd, DRM_IOCTL_GEM_CLOSE, &close_bo);
 }
 
+static bool is_cache_coherent(int fd, uint32_t handle)
+{
+	return gem_get_caching(fd, handle) != I915_CACHING_NONE;
+}
+
+static void mmap_write(int fd, uint32_t handle, uint64_t offset,
+		       const void *buf, uint64_t length)
+{
+	void *map = NULL;
+
+	if (!length)
+		return;
+
+	if (is_cache_coherent(fd, handle)) {
+		/* offset arg for mmap functions must be 0 */
+		map = __gem_mmap__cpu_coherent(fd, handle, 0, offset + length,
+					       PROT_READ | PROT_WRITE);
+		if (map)
+			gem_set_domain(fd, handle,
+				       I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
+	}
+
+	if (!map) {
+		map = __gem_mmap_offset__wc(fd, handle, 0, offset + length,
+					    PROT_READ | PROT_WRITE);
+		if (!map)
+			map = gem_mmap__wc(fd, handle, 0, offset + length,
+					   PROT_READ | PROT_WRITE);
+		if (map)
+			gem_set_domain(fd, handle,
+				       I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
+	}
+
+	igt_assert(map);
+	memcpy(map + offset, buf, length);
+	munmap(map, offset + length);
+}
+
+static void mmap_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length)
+{
+	void *map = NULL;
+
+	if (!length)
+		return;
+
+	if (gem_has_llc(fd) || is_cache_coherent(fd, handle)) {
+		/* offset arg for mmap functions must be 0 */
+		map = __gem_mmap__cpu_coherent(fd, handle, 0,
+					       offset + length, PROT_READ);
+		if (map)
+			gem_set_domain(fd, handle, I915_GEM_DOMAIN_CPU, 0);
+	}
+
+	if (!map) {
+		map = __gem_mmap_offset__wc(fd, handle, 0, offset + length,
+					    PROT_READ);
+		if (!map)
+			map = gem_mmap__wc(fd, handle, 0, offset + length,
+					   PROT_READ);
+		if (map)
+			gem_set_domain(fd, handle, I915_GEM_DOMAIN_WC, 0);
+	}
+
+	igt_assert(map);
+	memcpy(buf, map + offset, length);
+	munmap(map, offset + length);
+}
+
 int __gem_write(int fd, uint32_t handle, uint64_t offset, const void *buf, uint64_t length)
 {
 	struct drm_i915_gem_pwrite gem_pwrite;
@@ -348,12 +417,18 @@ int __gem_write(int fd, uint32_t handle, uint64_t offset, const void *buf, uint6
  * @buf: pointer to the data to write into the buffer
  * @length: size of the subrange
  *
- * This wraps the PWRITE ioctl, which is to upload a linear data to a subrange
- * of a gem buffer object.
+ * Method to write to a gem object. Uses the PWRITE ioctl when it is
+ * available, else it uses mmap + memcpy to upload linear data to a
+ * subrange of a gem buffer object.
  */
 void gem_write(int fd, uint32_t handle, uint64_t offset, const void *buf, uint64_t length)
 {
-	igt_assert_eq(__gem_write(fd, handle, offset, buf, length), 0);
+	int ret = __gem_write(fd, handle, offset, buf, length);
+
+	igt_assert(ret == 0 || ret == EOPNOTSUPP);
+
+	if (ret == EOPNOTSUPP)
+		mmap_write(fd, handle, offset, buf, length);
 }
 
 int __gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length)
@@ -380,12 +455,64 @@ int __gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t len
  * @buf: pointer to the data to read into
  * @length: size of the subrange
  *
- * This wraps the PREAD ioctl, which is to download a linear data to a subrange
- * of a gem buffer object.
+ * Method to read from a gem object. Uses the PREAD ioctl when it is
+ * available, else it uses mmap + memcpy to download linear data from a
+ * subrange of a gem buffer object.
  */
 void gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length)
 {
-	igt_assert_eq(__gem_read(fd, handle, offset, buf, length), 0);
+	int ret = __gem_read(fd, handle, offset, buf, length);
+
+	igt_assert(ret == 0 || ret == EOPNOTSUPP);
+
+	if (ret == EOPNOTSUPP)
+		mmap_read(fd, handle, offset, buf, length);
+}
+
+/**
+ * gem_has_pwrite
+ * @fd: open i915 drm file descriptor
+ *
+ * Feature test macro to query whether pwrite ioctl is supported
+ */
+bool gem_has_pwrite(int fd)
+{
+	uint32_t handle = gem_create(fd, 4096);
+	int buf, ret;
+
+	ret = __gem_write(fd, handle, 0, &buf, sizeof(buf));
+	gem_close(fd, handle);
+
+	return ret != EOPNOTSUPP;
+}
+
+/**
+ * gem_has_pread
+ * @fd: open i915 drm file descriptor
+ *
+ * Feature test macro to query whether pread ioctl is supported
+ */
+bool gem_has_pread(int fd)
+{
+	uint32_t handle = gem_create(fd, 4096);
+	int buf, ret;
+
+	ret = __gem_read(fd, handle, 0, &buf, sizeof(buf));
+	gem_close(fd, handle);
+
+	return ret != EOPNOTSUPP;
+}
+
+/**
+ * gem_require_pread_pwrite
+ * @fd: open i915 drm file descriptor
+ *
+ * Feature test macro to query whether pread/pwrite ioctls are supported
+ * and skip if they are not
+ */
+void gem_require_pread_pwrite(int fd)
+{
+	igt_require(gem_has_pread(fd) && gem_has_pwrite(fd));
 }
 
 int __gem_set_domain(int fd, uint32_t handle, uint32_t read, uint32_t write)
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index 870ac8b7b..6ba551a71 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -71,6 +71,9 @@ int __gem_write(int fd, uint32_t handle, uint64_t offset, const void *buf, uint6
 void gem_write(int fd, uint32_t handle, uint64_t offset,  const void *buf, uint64_t length);
 int __gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length);
 void gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length);
+bool gem_has_pwrite(int fd);
+bool gem_has_pread(int fd);
+void gem_require_pread_pwrite(int fd);
 int __gem_set_domain(int fd, uint32_t handle, uint32_t read, uint32_t write);
 void gem_set_domain(int fd, uint32_t handle, uint32_t read, uint32_t write);
 int gem_wait(int fd, uint32_t handle, int64_t *timeout_ns);
diff --git a/tests/i915/gem_madvise.c b/tests/i915/gem_madvise.c
index 54c9befff..92e1c5192 100644
--- a/tests/i915/gem_madvise.c
+++ b/tests/i915/gem_madvise.c
@@ -154,6 +154,7 @@ dontneed_before_pwrite(void)
 	uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint32_t handle;
 
+	gem_require_pread_pwrite(fd);
 	handle = gem_create(fd, OBJECT_SIZE);
 	gem_madvise(fd, handle, I915_MADV_DONTNEED);
 
@@ -170,6 +171,7 @@ dontneed_before_exec(void)
 	struct drm_i915_gem_exec_object2 exec;
 	uint32_t buf[] = { MI_BATCH_BUFFER_END, 0 };
 
+	gem_require_pread_pwrite(fd);
 	memset(&execbuf, 0, sizeof(execbuf));
 	memset(&exec, 0, sizeof(exec));
 
diff --git a/tests/i915/gem_partial_pwrite_pread.c b/tests/i915/gem_partial_pwrite_pread.c
index b4bae9b6d..136a53558 100644
--- a/tests/i915/gem_partial_pwrite_pread.c
+++ b/tests/i915/gem_partial_pwrite_pread.c
@@ -284,6 +284,7 @@ igt_main
 		data.drm_fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(data.drm_fd);
 		gem_require_blitter(data.drm_fd);
+		gem_require_pread_pwrite(data.drm_fd);
 
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		data.bops = buf_ops_create(data.drm_fd);
diff --git a/tests/i915/gem_pread.c b/tests/i915/gem_pread.c
index 6d12b8e9f..db1eacedc 100644
--- a/tests/i915/gem_pread.c
+++ b/tests/i915/gem_pread.c
@@ -149,6 +149,7 @@ igt_main_args("s:", NULL, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
+		gem_require_pread_pwrite(fd);
 
 		dst = gem_create(fd, object_size);
 		src = malloc(object_size);
diff --git a/tests/i915/gem_pread_after_blit.c b/tests/i915/gem_pread_after_blit.c
index 81454c930..5c99d0887 100644
--- a/tests/i915/gem_pread_after_blit.c
+++ b/tests/i915/gem_pread_after_blit.c
@@ -212,6 +212,7 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
+		gem_require_pread_pwrite(fd);
 
 		bufmgr = drm_intel_bufmgr_gem_init(fd, 4096);
 		drm_intel_bufmgr_gem_enable_reuse(bufmgr);
diff --git a/tests/i915/gem_pwrite.c b/tests/i915/gem_pwrite.c
index e491263fd..eea51f978 100644
--- a/tests/i915/gem_pwrite.c
+++ b/tests/i915/gem_pwrite.c
@@ -317,6 +317,7 @@ igt_main_args("s:", NULL, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
+		gem_require_pread_pwrite(fd);
 
 		dst = gem_create(fd, object_size);
 		src = malloc(object_size);
diff --git a/tests/i915/gem_pwrite_snooped.c b/tests/i915/gem_pwrite_snooped.c
index 4a3395241..a2eca6afc 100644
--- a/tests/i915/gem_pwrite_snooped.c
+++ b/tests/i915/gem_pwrite_snooped.c
@@ -132,6 +132,7 @@ igt_simple_main
 	fd = drm_open_driver(DRIVER_INTEL);
 	igt_require_gem(fd);
 	gem_require_blitter(fd);
+	gem_require_pread_pwrite(fd);
 
 	devid = intel_get_drm_devid(fd);
 	bufmgr = drm_intel_bufmgr_gem_init(fd, 4096);
diff --git a/tests/i915/gem_readwrite.c b/tests/i915/gem_readwrite.c
index 6b2977c1c..ca31741c6 100644
--- a/tests/i915/gem_readwrite.c
+++ b/tests/i915/gem_readwrite.c
@@ -83,6 +83,7 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
+		gem_require_pread_pwrite(fd);
 
 		handle = gem_create(fd, OBJECT_SIZE);
 	}
diff --git a/tests/i915/gem_set_tiling_vs_pwrite.c b/tests/i915/gem_set_tiling_vs_pwrite.c
index 302ea24b6..8f38c9b9b 100644
--- a/tests/i915/gem_set_tiling_vs_pwrite.c
+++ b/tests/i915/gem_set_tiling_vs_pwrite.c
@@ -55,6 +55,7 @@ igt_simple_main
 
 	fd = drm_open_driver(DRIVER_INTEL);
 	igt_require(gem_available_fences(fd) > 0);
+	gem_require_pread_pwrite(fd);
 
 	for (int i = 0; i < OBJECT_SIZE/4; i++)
 		data[i] = i;
diff --git a/tests/i915/gem_tiled_partial_pwrite_pread.c b/tests/i915/gem_tiled_partial_pwrite_pread.c
index 7de5358b2..0c4545990 100644
--- a/tests/i915/gem_tiled_partial_pwrite_pread.c
+++ b/tests/i915/gem_tiled_partial_pwrite_pread.c
@@ -270,6 +270,7 @@ igt_main
 		igt_require_gem(fd);
 		gem_require_mappable_ggtt(fd);
 		gem_require_blitter(fd);
+		gem_require_pread_pwrite(fd);
 
 		bufmgr = drm_intel_bufmgr_gem_init(fd, 4096);
 		//drm_intel_bufmgr_gem_enable_reuse(bufmgr);
diff --git a/tests/i915/gem_tiled_pread_basic.c b/tests/i915/gem_tiled_pread_basic.c
index 7cb644104..f8f73c03a 100644
--- a/tests/i915/gem_tiled_pread_basic.c
+++ b/tests/i915/gem_tiled_pread_basic.c
@@ -127,6 +127,7 @@ igt_simple_main
 	igt_require(gem_available_fences(fd) > 0);
 	handle = create_bo(fd);
 	igt_require(gem_get_tiling(fd, handle, &tiling, &swizzle));
+	gem_require_pread_pwrite(fd);
 
 	devid = intel_get_drm_devid(fd);
 
diff --git a/tests/i915/gem_tiled_pread_pwrite.c b/tests/i915/gem_tiled_pread_pwrite.c
index f58048faa..28490840f 100644
--- a/tests/i915/gem_tiled_pread_pwrite.c
+++ b/tests/i915/gem_tiled_pread_pwrite.c
@@ -114,6 +114,7 @@ igt_simple_main
 	
 	fd = drm_open_driver(DRIVER_INTEL);
 	igt_require(gem_available_fences(fd) > 0);
+	gem_require_pread_pwrite(fd);
 
 	count = gem_available_fences(fd) + 1;
 	intel_require_memory(2 * count, sizeof(linear), CHECK_RAM);
diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 268423dcd..0ccfdbd9c 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -890,6 +890,7 @@ static int test_forbidden_ops(int fd)
 	uint32_t handle;
 	void *ptr;
 
+	gem_require_pread_pwrite(fd);
 	igt_assert(posix_memalign(&ptr, PAGE_SIZE, PAGE_SIZE) == 0);
 	gem_userptr(fd, ptr, PAGE_SIZE, 0, userptr_flags, &handle);
 
@@ -1416,6 +1417,7 @@ static void test_readonly_pwrite(int i915)
 	 */
 
 	igt_require(igt_setup_clflush());
+	gem_require_pread_pwrite(i915);
 
 	sz = 16 << 12;
 	pages = mmap(NULL, sz, PROT_WRITE, MAP_ANON | MAP_PRIVATE, -1, 0);
diff --git a/tests/i915/gen9_exec_parse.c b/tests/i915/gen9_exec_parse.c
index 8cd82f568..eddc0f871 100644
--- a/tests/i915/gen9_exec_parse.c
+++ b/tests/i915/gen9_exec_parse.c
@@ -1029,8 +1029,10 @@ igt_main
 			   -EINVAL);
 	}
 
-	igt_subtest("batch-invalid-length")
+	igt_subtest("batch-invalid-length") {
+		gem_require_pread_pwrite(i915);
 		test_invalid_length(i915, handle);
+	}
 
 	igt_subtest("basic-rejected")
 		test_rejected(i915, handle, false);
-- 
2.27.0.112.g101b3204f3

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
