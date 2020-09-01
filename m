Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2C189B99
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2020 04:58:50 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Mon, 31 Aug 2020 21:58:36 -0400
Message-Id: <20200901015836.18127-1-ashutosh.dixit@intel.com>
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

Trial patch to replace PREAD/PWRITE ioctls with mmap + memcpy in
gem_read/write.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/ioctl_wrappers.c | 46 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 3781286d8..0b90f4c1a 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -55,6 +55,7 @@
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
 #include "config.h"
+#include "i915/gem_mman.h"
 
 #ifdef HAVE_VALGRIND
 #include <valgrind/valgrind.h>
@@ -340,6 +341,11 @@ int __gem_write(int fd, uint32_t handle, uint64_t offset, const void *buf, uint6
 	return err;
 }
 
+static bool is_cache_coherent(int fd, uint32_t handle)
+{
+	return gem_get_caching(fd, handle) != I915_CACHING_NONE;
+}
+
 /**
  * gem_write:
  * @fd: open i915 drm file descriptor
@@ -353,7 +359,26 @@ int __gem_write(int fd, uint32_t handle, uint64_t offset, const void *buf, uint6
  */
 void gem_write(int fd, uint32_t handle, uint64_t offset, const void *buf, uint64_t length)
 {
-	igt_assert_eq(__gem_write(fd, handle, offset, buf, length), 0);
+	void *map = NULL;
+
+	if (is_cache_coherent(fd, handle)) {
+		map = __gem_mmap__cpu_coherent(fd, handle, 0, offset + length,
+					     PROT_READ | PROT_WRITE);
+		if (map)
+			gem_set_domain(fd, handle,
+				       I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
+	}
+
+	if (!map) {
+		map = __gem_mmap__device_coherent(fd, handle, 0, offset + length,
+					    PROT_READ | PROT_WRITE);
+		if (map)
+			gem_set_domain(fd, handle,
+				       I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
+	}
+
+	memcpy(map + offset, buf, length);
+	munmap(map, offset + length);
 }
 
 int __gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length)
@@ -385,7 +410,24 @@ int __gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t len
  */
 void gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length)
 {
-	igt_assert_eq(__gem_read(fd, handle, offset, buf, length), 0);
+	void *map = NULL;
+
+	if (gem_has_llc(fd) || is_cache_coherent(fd, handle)) {
+		map = __gem_mmap__cpu_coherent(fd, handle, 0,
+					       offset + length, PROT_READ);
+		if (map)
+			gem_set_domain(fd, handle, I915_GEM_DOMAIN_CPU, 0);
+	}
+
+	if (!map) {
+		map = __gem_mmap__device_coherent(fd, handle, 0, offset + length,
+						  PROT_READ);
+		if (map)
+			gem_set_domain(fd, handle, I915_GEM_DOMAIN_WC, 0);
+	}
+
+	memcpy(buf, map + offset, length);
+	munmap(map, offset + length);
 }
 
 int __gem_set_domain(int fd, uint32_t handle, uint32_t read, uint32_t write)
-- 
2.27.0.112.g101b3204f3

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
