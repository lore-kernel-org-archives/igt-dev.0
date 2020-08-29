Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDF56E193
 for <igt-dev@lists.freedesktop.org>; Sat, 29 Aug 2020 05:09:12 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri, 28 Aug 2020 22:09:11 -0700
Message-Id: <20200829050911.21877-1-ashutosh.dixit@intel.com>
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

Trial patch to replace PREAD/PWRITE ioctls with mmap + memcpy in
gem_read/write. For CI only. Please don't review.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/ioctl_wrappers.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 3781286d8..77752e8db 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -55,6 +55,7 @@
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
 #include "config.h"
+#include "i915/gem_mman.h"
 
 #ifdef HAVE_VALGRIND
 #include <valgrind/valgrind.h>
@@ -353,7 +354,11 @@ int __gem_write(int fd, uint32_t handle, uint64_t offset, const void *buf, uint6
  */
 void gem_write(int fd, uint32_t handle, uint64_t offset, const void *buf, uint64_t length)
 {
-	igt_assert_eq(__gem_write(fd, handle, offset, buf, length), 0);
+	/* offset arg of gem_mmap__device_coherent must be 0 */
+	void *ptr = gem_mmap__device_coherent(fd, handle, 0, offset + length, PROT_WRITE);
+
+	memcpy(ptr + offset, buf, length);
+	munmap(ptr, offset + length);
 }
 
 int __gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length)
@@ -385,7 +390,11 @@ int __gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t len
  */
 void gem_read(int fd, uint32_t handle, uint64_t offset, void *buf, uint64_t length)
 {
-	igt_assert_eq(__gem_read(fd, handle, offset, buf, length), 0);
+	/* offset arg of gem_mmap__device_coherent must be 0 */
+	void *ptr = gem_mmap__device_coherent(fd, handle, 0, offset + length, PROT_READ);
+
+	memcpy(buf, ptr + offset, length);
+	munmap(ptr, offset + length);
 }
 
 int __gem_set_domain(int fd, uint32_t handle, uint32_t read, uint32_t write)
-- 
2.26.2.108.g048abe1751

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
