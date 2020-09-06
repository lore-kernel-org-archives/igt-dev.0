Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C26C89FDB
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2020 02:37:13 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Sun,  6 Sep 2020 19:36:49 -0400
Message-Id: <20200906233649.30745-1-ashutosh.dixit@intel.com>
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

v11: Simplified patch to use previous __gem_read/__gem_write
v12: Fix CI failures in gem_madvise and gen9_exec_parse
v13: Skip mmap for 0 length read/write's

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/ioctl_wrappers.c     | 107 +++++++++++++++++++++++++++++++++++++--
 lib/ioctl_wrappers.h     |   4 +-
 tests/i915/gem_madvise.c |   2 +-
 tests/prime_vgem.c       |   8 +--
 4 files changed, 112 insertions(+), 9 deletions(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 3781286d8..4c660ca3a 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -55,6 +55,7 @@
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
 #include "config.h"
+#include "i915/gem_mman.h"
 
 #ifdef HAVE_VALGRIND
 #include <valgrind/valgrind.h>
@@ -341,7 +342,7 @@ int __gem_write(int fd, uint32_t handle, uint64_t offset, const void *buf, uint6
 }
 
 /**
- * gem_write:
+ * gem_pwrite:
  * @fd: open i915 drm file descriptor
  * @handle: gem buffer object handle
  * @offset: offset within the buffer of the subrange
@@ -351,7 +352,7 @@ int __gem_write(int fd, uint32_t handle, uint64_t offset, const void *buf, uint6
  * This wraps the PWRITE ioctl, which is to upload a linear data to a subrange
  * of a gem buffer object.
  */
-void gem_write(int fd, uint32_t handle, uint64_t offset, const void *buf, uint64_t length)
+void gem_pwrite(int fd, uint32_t handle, uint64_t offset, const void *buf, uint64_t length)
 {
 	igt_assert_eq(__gem_write(fd, handle, offset, buf, length), 0);
 }
@@ -372,6 +373,106 @@ int __gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t len
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
+	igt_assert_eq(__gem_read(fd, handle, offset, buf, length), 0);
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
 /**
  * gem_read:
  * @fd: open i915 drm file descriptor
@@ -385,7 +486,7 @@ int __gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t len
  */
 void gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length)
 {
-	igt_assert_eq(__gem_read(fd, handle, offset, buf, length), 0);
+	mmap_read(fd, handle, offset, buf, length);
 }
 
 int __gem_set_domain(int fd, uint32_t handle, uint32_t read, uint32_t write)
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index 870ac8b7b..143a397ea 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -68,8 +68,10 @@ uint32_t gem_flink(int fd, uint32_t handle);
 uint32_t gem_open(int fd, uint32_t name);
 void gem_close(int fd, uint32_t handle);
 int __gem_write(int fd, uint32_t handle, uint64_t offset, const void *buf, uint64_t length);
-void gem_write(int fd, uint32_t handle, uint64_t offset,  const void *buf, uint64_t length);
+void gem_pwrite(int fd, uint32_t handle, uint64_t offset,  const void *buf, uint64_t length);
 int __gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length);
+void gem_pread(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length);
+void gem_write(int fd, uint32_t handle, uint64_t offset,  const void *buf, uint64_t length);
 void gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length);
 int __gem_set_domain(int fd, uint32_t handle, uint32_t read, uint32_t write);
 void gem_set_domain(int fd, uint32_t handle, uint32_t read, uint32_t write);
diff --git a/tests/i915/gem_madvise.c b/tests/i915/gem_madvise.c
index 54c9befff..f26d5a79c 100644
--- a/tests/i915/gem_madvise.c
+++ b/tests/i915/gem_madvise.c
@@ -174,7 +174,7 @@ dontneed_before_exec(void)
 	memset(&exec, 0, sizeof(exec));
 
 	exec.handle = gem_create(fd, OBJECT_SIZE);
-	gem_write(fd, exec.handle, 0, buf, sizeof(buf));
+	gem_pwrite(fd, exec.handle, 0, buf, sizeof(buf));
 	gem_madvise(fd, exec.handle, I915_MADV_DONTNEED);
 
 	execbuf.buffers_ptr = to_user_pointer(&exec);
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 38e2026aa..3f3b5f602 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -59,7 +59,7 @@ static void test_read(int vgem, int i915)
 
 	for (i = 0; i < 1024; i++) {
 		uint32_t tmp;
-		gem_read(i915, handle, 4096*i, &tmp, sizeof(tmp));
+		gem_pread(i915, handle, 4096*i, &tmp, sizeof(tmp));
 		igt_assert_eq(tmp, i);
 	}
 	gem_close(i915, handle);
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
@@ -279,7 +279,7 @@ static void test_write(int vgem, int i915)
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
