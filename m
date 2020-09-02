Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2D56E072
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2020 03:40:37 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Tue,  1 Sep 2020 20:40:21 -0400
Message-Id: <20200902004022.20546-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/ioctl_wrappers: Keep IGT working
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
and not support them in future products. This means IGT must be
modified to handle the absence of pread/write ioctls. This patch does
this as follows:

* __gem_read, gem_read, __gem_write and gem_write calls which are
  wrappers around the pread/pwrite ioctls have been renamed to
  __gem_pread, gem_pread, __gem_pwrite and gem_pwrite. These will now
  only be used where the pread/pwrite ioctls must absolutely be used,
  such as tests which test these ioctls or must otherwise only use the
  pread/pwrite ioctl's.

* The new gem_read and gem_write function calls are now treated as
  general purpose calls to read/write to a gem object. They now try
  doing the read/write using the pread/pwrite ioctls first but when
  these ioctls are unavailable they fall back to doing the read/write
  using a combination of mmap and memcpy.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/ioctl_wrappers.c           | 165 +++++++++++++++++++++++++++++++--
 lib/ioctl_wrappers.h           |   9 +-
 tests/i915/gem_madvise.c       |   3 +-
 tests/i915/gem_userptr_blits.c |   4 +-
 tests/i915/gen9_exec_parse.c   |   6 +-
 tests/prime_vgem.c             |  14 +--
 6 files changed, 181 insertions(+), 20 deletions(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 3781286d8..3076b1187 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -55,6 +55,7 @@
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
 #include "config.h"
+#include "i915/gem_mman.h"
 
 #ifdef HAVE_VALGRIND
 #include <valgrind/valgrind.h>
@@ -323,7 +324,7 @@ void gem_close(int fd, uint32_t handle)
 	do_ioctl(fd, DRM_IOCTL_GEM_CLOSE, &close_bo);
 }
 
-int __gem_write(int fd, uint32_t handle, uint64_t offset, const void *buf, uint64_t length)
+int __gem_pwrite(int fd, uint32_t handle, uint64_t offset, const void *buf, uint64_t length)
 {
 	struct drm_i915_gem_pwrite gem_pwrite;
 	int err;
@@ -341,7 +342,7 @@ int __gem_write(int fd, uint32_t handle, uint64_t offset, const void *buf, uint6
 }
 
 /**
- * gem_write:
+ * gem_pwrite:
  * @fd: open i915 drm file descriptor
  * @handle: gem buffer object handle
  * @offset: offset within the buffer of the subrange
@@ -351,12 +352,29 @@ int __gem_write(int fd, uint32_t handle, uint64_t offset, const void *buf, uint6
  * This wraps the PWRITE ioctl, which is to upload a linear data to a subrange
  * of a gem buffer object.
  */
-void gem_write(int fd, uint32_t handle, uint64_t offset, const void *buf, uint64_t length)
+void gem_pwrite(int fd, uint32_t handle, uint64_t offset, const void *buf, uint64_t length)
 {
-	igt_assert_eq(__gem_write(fd, handle, offset, buf, length), 0);
+	igt_assert_eq(__gem_pwrite(fd, handle, offset, buf, length), 0);
 }
 
-int __gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length)
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
+	ret = __gem_pwrite(fd, handle, 0, &buf, sizeof(buf));
+	gem_close(fd, handle);
+
+	return ret != EOPNOTSUPP;
+}
+
+int __gem_pread(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length)
 {
 	struct drm_i915_gem_pread gem_pread;
 	int err;
@@ -373,7 +391,7 @@ int __gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t len
 	return err;
 }
 /**
- * gem_read:
+ * gem_pread:
  * @fd: open i915 drm file descriptor
  * @handle: gem buffer object handle
  * @offset: offset within the buffer of the subrange
@@ -383,9 +401,142 @@ int __gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t len
  * This wraps the PREAD ioctl, which is to download a linear data to a subrange
  * of a gem buffer object.
  */
+void gem_pread(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length)
+{
+	igt_assert_eq(__gem_pread(fd, handle, offset, buf, length), 0);
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
+	ret = __gem_pread(fd, handle, 0, &buf, sizeof(buf));
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
+}
+
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
+/**
+ * gem_write:
+ * @fd: open i915 drm file descriptor
+ * @handle: gem buffer object handle
+ * @offset: offset within the buffer of the subrange
+ * @buf: pointer to the data to write into the buffer
+ * @length: size of the subrange
+ *
+ * General purpose method to write to a gem object. Uses the pwrite ioctl
+ * when it is available, else it uses mmap + memcpy for the write.
+ */
+void gem_write(int fd, uint32_t handle, uint64_t offset, const void *buf, uint64_t length)
+{
+	int ret = __gem_pwrite(fd, handle, offset, buf, length);
+
+	igt_assert(ret == 0 || ret == EOPNOTSUPP);
+
+	if (ret == EOPNOTSUPP)
+		mmap_write(fd, handle, offset, buf, length);
+}
+
+static void mmap_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length)
+{
+	void *map = NULL;
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
+/**
+ * gem_read:
+ * @fd: open i915 drm file descriptor
+ * @handle: gem buffer object handle
+ * @offset: offset within the buffer of the subrange
+ * @buf: pointer to the data to read into
+ * @length: size of the subrange
+ *
+ * General purpose method to read from a gem object. Uses the pread ioctl
+ * when it is available, else it uses mmap + memcpy for the read.
+ */
 void gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length)
 {
-	igt_assert_eq(__gem_read(fd, handle, offset, buf, length), 0);
+	int ret = __gem_pread(fd, handle, offset, buf, length);
+
+	igt_assert(ret == 0 || ret == EOPNOTSUPP);
+
+	if (ret == EOPNOTSUPP)
+		mmap_read(fd, handle, offset, buf, length);
 }
 
 int __gem_set_domain(int fd, uint32_t handle, uint32_t read, uint32_t write)
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index 870ac8b7b..d6f8027b7 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -67,9 +67,14 @@ uint32_t gem_get_caching(int fd, uint32_t handle);
 uint32_t gem_flink(int fd, uint32_t handle);
 uint32_t gem_open(int fd, uint32_t name);
 void gem_close(int fd, uint32_t handle);
-int __gem_write(int fd, uint32_t handle, uint64_t offset, const void *buf, uint64_t length);
+int __gem_pwrite(int fd, uint32_t handle, uint64_t offset, const void *buf, uint64_t length);
+bool gem_has_pwrite(int fd);
+void gem_pwrite(int fd, uint32_t handle, uint64_t offset,  const void *buf, uint64_t length);
+int __gem_pread(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length);
+void gem_pread(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length);
+bool gem_has_pread(int fd);
+void gem_require_pread_pwrite(int fd);
 void gem_write(int fd, uint32_t handle, uint64_t offset,  const void *buf, uint64_t length);
-int __gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length);
 void gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length);
 int __gem_set_domain(int fd, uint32_t handle, uint32_t read, uint32_t write);
 void gem_set_domain(int fd, uint32_t handle, uint32_t read, uint32_t write);
diff --git a/tests/i915/gem_madvise.c b/tests/i915/gem_madvise.c
index 54c9befff..c6a4de6a2 100644
--- a/tests/i915/gem_madvise.c
+++ b/tests/i915/gem_madvise.c
@@ -154,10 +154,11 @@ dontneed_before_pwrite(void)
 	uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint32_t handle;
 
+	gem_require_pread_pwrite(fd);
 	handle = gem_create(fd, OBJECT_SIZE);
 	gem_madvise(fd, handle, I915_MADV_DONTNEED);
 
-	igt_assert_eq(__gem_write(fd, handle, 0, &bbe, sizeof(bbe)), -EFAULT);
+	igt_assert_eq(__gem_pwrite(fd, handle, 0, &bbe, sizeof(bbe)), -EFAULT);
 
 	close(fd);
 }
diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 268423dcd..72b594229 100644
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
@@ -1429,7 +1431,7 @@ static void test_readonly_pwrite(int i915)
 		char data[4096];
 
 		memset(data, page, sizeof(data));
-		igt_assert_eq(__gem_write(i915, handle, page << 12, data, sizeof(data)), -EINVAL);
+		igt_assert_eq(__gem_pwrite(i915, handle, page << 12, data, sizeof(data)), -EINVAL);
 	}
 
 	gem_close(i915, handle);
diff --git a/tests/i915/gen9_exec_parse.c b/tests/i915/gen9_exec_parse.c
index 8cd82f568..ecadb78b5 100644
--- a/tests/i915/gen9_exec_parse.c
+++ b/tests/i915/gen9_exec_parse.c
@@ -670,7 +670,7 @@ static void test_invalid_length(const int i915, const uint32_t handle)
 		   lri_ok, 4096,
 		   0);
 
-	igt_assert_eq(__gem_write(i915, handle, 0, noops, 4097), -EINVAL);
+	igt_assert_eq(__gem_pwrite(i915, handle, 0, noops, 4097), -EINVAL);
 }
 
 struct reg {
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
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 38e2026aa..b56eb8091 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -48,7 +48,7 @@ static void test_read(int vgem, int i915)
 	handle = prime_fd_to_handle(i915, dmabuf);
 	close(dmabuf);
 
-	igt_skip_on_f(__gem_read(i915, handle, 0, &i, sizeof(i)),
+	igt_skip_on_f(__gem_pread(i915, handle, 0, &i, sizeof(i)),
 		      "PREAD from dma-buf not supported on this hardware\n");
 
 	ptr = vgem_mmap(vgem, &scratch, PROT_WRITE);
@@ -59,7 +59,7 @@ static void test_read(int vgem, int i915)
 
 	for (i = 0; i < 1024; i++) {
 		uint32_t tmp;
-		gem_read(i915, handle, 4096*i, &tmp, sizeof(tmp));
+		gem_pread(i915, handle, 4096*i, &tmp, sizeof(tmp));
 		igt_assert_eq(tmp, i);
 	}
 	gem_close(i915, handle);
@@ -86,7 +86,7 @@ static void test_fence_read(int i915, int vgem)
 	handle = prime_fd_to_handle(i915, dmabuf);
 	close(dmabuf);
 
-	igt_skip_on_f(__gem_read(i915, handle, 0, &i, sizeof(i)),
+	igt_skip_on_f(__gem_pread(i915, handle, 0, &i, sizeof(i)),
 		      "PREAD from dma-buf not supported on this hardware\n");
 
 	igt_fork(child, 1) {
@@ -94,14 +94,14 @@ static void test_fence_read(int i915, int vgem)
 		close(slave[1]);
 		for (i = 0; i < 1024; i++) {
 			uint32_t tmp;
-			gem_read(i915, handle, 4096*i, &tmp, sizeof(tmp));
+			gem_pread(i915, handle, 4096*i, &tmp, sizeof(tmp));
 			igt_assert_eq(tmp, 0);
 		}
 		write(master[1], &child, sizeof(child));
 		read(slave[0], &child, sizeof(child));
 		for (i = 0; i < 1024; i++) {
 			uint32_t tmp;
-			gem_read(i915, handle, 4096*i, &tmp, sizeof(tmp));
+			gem_pread(i915, handle, 4096*i, &tmp, sizeof(tmp));
 			igt_assert_eq(tmp, i);
 		}
 		gem_close(i915, handle);
@@ -272,14 +272,14 @@ static void test_write(int vgem, int i915)
 	handle = prime_fd_to_handle(i915, dmabuf);
 	close(dmabuf);
 
-	igt_skip_on_f(__gem_write(i915, handle, 0, &i, sizeof(i)),
+	igt_skip_on_f(__gem_pwrite(i915, handle, 0, &i, sizeof(i)),
 		      "PWRITE to dma-buf not supported on this hardware\n");
 
 	ptr = vgem_mmap(vgem, &scratch, PROT_READ);
 	gem_close(vgem, scratch.handle);
 
 	for (i = 0; i < 1024; i++)
-		gem_write(i915, handle, 4096*i, &i, sizeof(i));
+		gem_pwrite(i915, handle, 4096*i, &i, sizeof(i));
 	gem_close(i915, handle);
 
 	for (i = 0; i < 1024; i++)
-- 
2.27.0.112.g101b3204f3

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
