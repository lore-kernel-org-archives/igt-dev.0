Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9593D89DDF
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2020 20:46:06 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Tue,  1 Sep 2020 13:45:51 -0400
Message-Id: <20200901174551.30273-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [CI i-g-t] lib/ioctl_wrappers: Handle PREAD/PWRITE ioctls
 not supported in gem_read/write
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

FOR CI ONLY. PLEASE DON'T REVIEW.

Trial patch to replace PREAD/PWRITE ioctls with mmap + memcpy in gem_read/write.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/ioctl_wrappers.c           | 107 +++++++++++++++++++++++++++++++--
 lib/ioctl_wrappers.h           |   6 +-
 tests/i915/gem_madvise.c       |   2 +-
 tests/i915/gem_userptr_blits.c |   2 +-
 tests/i915/gen9_exec_parse.c   |   2 +-
 tests/prime_vgem.c             |   6 +-
 6 files changed, 111 insertions(+), 14 deletions(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 3781286d8..4d58c6e4f 100644
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
@@ -351,12 +352,12 @@ int __gem_write(int fd, uint32_t handle, uint64_t offset, const void *buf, uint6
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
+int __gem_pread(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length)
 {
 	struct drm_i915_gem_pread gem_pread;
 	int err;
@@ -372,6 +373,100 @@ int __gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t len
 		err = -errno;
 	return err;
 }
+/**
+ * gem_pread:
+ * @fd: open i915 drm file descriptor
+ * @handle: gem buffer object handle
+ * @offset: offset within the buffer of the subrange
+ * @buf: pointer to the data to read into
+ * @length: size of the subrange
+ *
+ * This wraps the PREAD ioctl, which is to download a linear data to a subrange
+ * of a gem buffer object.
+ */
+void gem_pread(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length)
+{
+	igt_assert_eq(__gem_pread(fd, handle, offset, buf, length), 0);
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
+ * This wraps the PWRITE ioctl, which is to upload a linear data to a subrange
+ * of a gem buffer object.
+ */
+void gem_write(int fd, uint32_t handle, uint64_t offset, const void *buf, uint64_t length)
+{
+	mmap_write(fd, handle, offset, buf, length);
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
 /**
  * gem_read:
  * @fd: open i915 drm file descriptor
@@ -385,7 +480,7 @@ int __gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t len
  */
 void gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length)
 {
-	igt_assert_eq(__gem_read(fd, handle, offset, buf, length), 0);
+	mmap_read(fd, handle, offset, buf, length);
 }
 
 int __gem_set_domain(int fd, uint32_t handle, uint32_t read, uint32_t write)
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index 870ac8b7b..5f83b0827 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -67,9 +67,11 @@ uint32_t gem_get_caching(int fd, uint32_t handle);
 uint32_t gem_flink(int fd, uint32_t handle);
 uint32_t gem_open(int fd, uint32_t name);
 void gem_close(int fd, uint32_t handle);
-int __gem_write(int fd, uint32_t handle, uint64_t offset, const void *buf, uint64_t length);
+int __gem_pwrite(int fd, uint32_t handle, uint64_t offset, const void *buf, uint64_t length);
+void gem_pwrite(int fd, uint32_t handle, uint64_t offset,  const void *buf, uint64_t length);
+int __gem_pread(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length);
+void gem_pread(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length);
 void gem_write(int fd, uint32_t handle, uint64_t offset,  const void *buf, uint64_t length);
-int __gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length);
 void gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length);
 int __gem_set_domain(int fd, uint32_t handle, uint32_t read, uint32_t write);
 void gem_set_domain(int fd, uint32_t handle, uint32_t read, uint32_t write);
diff --git a/tests/i915/gem_madvise.c b/tests/i915/gem_madvise.c
index 54c9befff..c88e74c7c 100644
--- a/tests/i915/gem_madvise.c
+++ b/tests/i915/gem_madvise.c
@@ -157,7 +157,7 @@ dontneed_before_pwrite(void)
 	handle = gem_create(fd, OBJECT_SIZE);
 	gem_madvise(fd, handle, I915_MADV_DONTNEED);
 
-	igt_assert_eq(__gem_write(fd, handle, 0, &bbe, sizeof(bbe)), -EFAULT);
+	igt_assert_eq(__gem_pwrite(fd, handle, 0, &bbe, sizeof(bbe)), -EFAULT);
 
 	close(fd);
 }
diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 268423dcd..9de8b76a9 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -1429,7 +1429,7 @@ static void test_readonly_pwrite(int i915)
 		char data[4096];
 
 		memset(data, page, sizeof(data));
-		igt_assert_eq(__gem_write(i915, handle, page << 12, data, sizeof(data)), -EINVAL);
+		igt_assert_eq(__gem_pwrite(i915, handle, page << 12, data, sizeof(data)), -EINVAL);
 	}
 
 	gem_close(i915, handle);
diff --git a/tests/i915/gen9_exec_parse.c b/tests/i915/gen9_exec_parse.c
index 8cd82f568..15a843481 100644
--- a/tests/i915/gen9_exec_parse.c
+++ b/tests/i915/gen9_exec_parse.c
@@ -670,7 +670,7 @@ static void test_invalid_length(const int i915, const uint32_t handle)
 		   lri_ok, 4096,
 		   0);
 
-	igt_assert_eq(__gem_write(i915, handle, 0, noops, 4097), -EINVAL);
+	igt_assert_eq(__gem_pwrite(i915, handle, 0, noops, 4097), -EINVAL);
 }
 
 struct reg {
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 38e2026aa..ee9d866db 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -48,7 +48,7 @@ static void test_read(int vgem, int i915)
 	handle = prime_fd_to_handle(i915, dmabuf);
 	close(dmabuf);
 
-	igt_skip_on_f(__gem_read(i915, handle, 0, &i, sizeof(i)),
+	igt_skip_on_f(__gem_pread(i915, handle, 0, &i, sizeof(i)),
 		      "PREAD from dma-buf not supported on this hardware\n");
 
 	ptr = vgem_mmap(vgem, &scratch, PROT_WRITE);
@@ -86,7 +86,7 @@ static void test_fence_read(int i915, int vgem)
 	handle = prime_fd_to_handle(i915, dmabuf);
 	close(dmabuf);
 
-	igt_skip_on_f(__gem_read(i915, handle, 0, &i, sizeof(i)),
+	igt_skip_on_f(__gem_pread(i915, handle, 0, &i, sizeof(i)),
 		      "PREAD from dma-buf not supported on this hardware\n");
 
 	igt_fork(child, 1) {
@@ -272,7 +272,7 @@ static void test_write(int vgem, int i915)
 	handle = prime_fd_to_handle(i915, dmabuf);
 	close(dmabuf);
 
-	igt_skip_on_f(__gem_write(i915, handle, 0, &i, sizeof(i)),
+	igt_skip_on_f(__gem_pwrite(i915, handle, 0, &i, sizeof(i)),
 		      "PWRITE to dma-buf not supported on this hardware\n");
 
 	ptr = vgem_mmap(vgem, &scratch, PROT_READ);
-- 
2.27.0.112.g101b3204f3

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
