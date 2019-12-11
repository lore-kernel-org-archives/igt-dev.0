Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7AD6EA32
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:44 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:15 -0800
Message-Id: <20191211005235.67897-10-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 09/29] igt: replace mmap64() with mmap()
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

mmap64 is the variant syscall with 64-bit off_t. On 64-bit
platforms mmap == mmap64. On 32-bit platforms mmap == mmap64 when
_FILE_OFFSET_BITS=64, which we get with AC_SYS_LARGEFILE in
autoconf and by default with meson. Other platforms don't
necessarily have an mmap64 syscall or function.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 lib/i915/gem_mman.c          |  2 +-
 lib/igt_vgem.c               |  2 +-
 tests/i915/gem_mmap_gtt.c    | 22 +++++++++++-----------
 tests/i915/gem_mmap_offset.c | 18 +++++++++---------
 4 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
index 6256627b..056f9382 100644
--- a/lib/i915/gem_mman.c
+++ b/lib/i915/gem_mman.c
@@ -62,7 +62,7 @@ void *__gem_mmap__gtt(int fd, uint32_t handle, uint64_t size, unsigned prot)
 	if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &mmap_arg))
 		return NULL;
 
-	ptr = mmap64(0, size, prot, MAP_SHARED, fd, mmap_arg.offset);
+	ptr = mmap(0, size, prot, MAP_SHARED, fd, mmap_arg.offset);
 	if (ptr == MAP_FAILED)
 		ptr = NULL;
 	else
diff --git a/lib/igt_vgem.c b/lib/igt_vgem.c
index 7f933b23..468383c7 100644
--- a/lib/igt_vgem.c
+++ b/lib/igt_vgem.c
@@ -76,7 +76,7 @@ void *__vgem_mmap(int fd, struct vgem_bo *bo, unsigned prot)
 	if (drmIoctl(fd, DRM_IOCTL_MODE_MAP_DUMB, &arg))
 		return NULL;
 
-	ptr = mmap64(0, bo->size, prot, MAP_SHARED, fd, arg.offset);
+	ptr = mmap(0, bo->size, prot, MAP_SHARED, fd, arg.offset);
 	if (ptr == MAP_FAILED)
 		return NULL;
 
diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
index af87ebc3..cd6ab489 100644
--- a/tests/i915/gem_mmap_gtt.c
+++ b/tests/i915/gem_mmap_gtt.c
@@ -103,11 +103,11 @@ test_access(int fd)
 	mmap_arg.handle = handle;
 	do_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &mmap_arg);
 
-	igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
+	igt_assert(mmap(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
 			  MAP_SHARED, fd, mmap_arg.offset));
 
 	/* Check that the same offset on the other fd doesn't work. */
-	igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
+	igt_assert(mmap(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
 			  MAP_SHARED, fd2, mmap_arg.offset) == MAP_FAILED);
 	igt_assert(errno == EACCES);
 
@@ -118,7 +118,7 @@ test_access(int fd)
 
 	/* Recheck that it works after flink. */
 	/* Check that the same offset on the other fd doesn't work. */
-	igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
+	igt_assert(mmap(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
 			  MAP_SHARED, fd2, mmap_arg.offset));
 }
 
@@ -149,11 +149,11 @@ test_short(int fd)
 	for (pages = 1; pages <= OBJECT_SIZE / PAGE_SIZE; pages <<= 1) {
 		uint8_t *r, *w;
 
-		w = mmap64(0, pages * PAGE_SIZE, PROT_READ | PROT_WRITE,
+		w = mmap(0, pages * PAGE_SIZE, PROT_READ | PROT_WRITE,
 			   MAP_SHARED, fd, mmap_arg.offset);
 		igt_assert(w != MAP_FAILED);
 
-		r = mmap64(0, pages * PAGE_SIZE, PROT_READ,
+		r = mmap(0, pages * PAGE_SIZE, PROT_READ,
 			   MAP_SHARED, fd, mmap_arg.offset);
 		igt_assert(r != MAP_FAILED);
 
@@ -371,13 +371,13 @@ test_isolation(int i915)
 
 	close(B);
 
-	ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
+	ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
 	igt_assert(ptr != MAP_FAILED);
 	munmap(ptr, 4096);
 
 	close(A);
 
-	ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
+	ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
 	igt_assert(ptr == MAP_FAILED);
 }
 
@@ -387,7 +387,7 @@ test_close_race(int i915)
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	_Atomic uint32_t *handles;
 
-	handles = mmap64(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+	handles = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(handles != MAP_FAILED);
 
 	igt_fork(child, ncpus + 1) {
@@ -405,7 +405,7 @@ test_close_race(int i915)
 				  &mmap_arg) != -1) {
 				void *ptr;
 
-				ptr = mmap64(0, 4096,
+				ptr = mmap(0, 4096,
 					     PROT_WRITE, MAP_SHARED, i915,
 					     mmap_arg.offset);
 				if (ptr != MAP_FAILED) {
@@ -431,7 +431,7 @@ test_flink_race(int i915)
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	_Atomic uint32_t *handles;
 
-	handles = mmap64(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+	handles = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(handles != MAP_FAILED);
 
 	igt_fork(child, ncpus + 1) {
@@ -456,7 +456,7 @@ test_flink_race(int i915)
 				  &mmap_arg) != -1) {
 				void *ptr;
 
-				ptr = mmap64(0, 4096,
+				ptr = mmap(0, 4096,
 					     PROT_WRITE, MAP_SHARED, fd,
 					     mmap_arg.offset);
 				if (ptr != MAP_FAILED) {
diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
index 95e1e3e6..277ffd83 100644
--- a/tests/i915/gem_mmap_offset.c
+++ b/tests/i915/gem_mmap_offset.c
@@ -76,7 +76,7 @@ __mmap_offset(int i915, uint32_t handle, uint64_t offset, uint64_t size,
 	if (mmap_offset_ioctl(i915, &arg))
 		return NULL;
 
-	ptr = mmap64(0, size, prot, MAP_SHARED, i915, arg.offset + offset);
+	ptr = mmap(0, size, prot, MAP_SHARED, i915, arg.offset + offset);
 	if (ptr == MAP_FAILED)
 		ptr = NULL;
 	else
@@ -224,34 +224,34 @@ static void isolation(int i915)
 			 t->name, B, b, offset_b);
 
 		errno = 0;
-		ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, i915, offset_a);
+		ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, i915, offset_a);
 		igt_assert(ptr == MAP_FAILED);
 		igt_assert_eq(errno, EACCES);
 
 		errno = 0;
-		ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, i915, offset_b);
+		ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, i915, offset_b);
 		igt_assert(ptr == MAP_FAILED);
 		igt_assert_eq(errno, EACCES);
 
 		errno = 0;
-		ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, B, offset_a);
+		ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, B, offset_a);
 		igt_assert(ptr == MAP_FAILED);
 		igt_assert_eq(errno, EACCES);
 
 		errno = 0;
-		ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_b);
+		ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_b);
 		igt_assert(ptr == MAP_FAILED);
 		igt_assert_eq(errno, EACCES);
 
 		close(B);
 
-		ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
+		ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
 		igt_assert(ptr != MAP_FAILED);
 		munmap(ptr, 4096);
 
 		close(A);
 
-		ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
+		ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
 		igt_assert(ptr == MAP_FAILED);
 	}
 }
@@ -286,7 +286,7 @@ static void close_race(int i915, int timeout)
 	_Atomic uint32_t *handles;
 	size_t len = ALIGN((ncpus + 1) * sizeof(uint32_t), 4096);
 
-	handles = mmap64(0, len, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+	handles = mmap(0, len, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(handles != MAP_FAILED);
 
 	igt_fork(child, ncpus + 1) {
@@ -305,7 +305,7 @@ static void close_race(int i915, int timeout)
 				  &mmap_arg) != -1) {
 				void *ptr;
 
-				ptr = mmap64(0, 4096,
+				ptr = mmap(0, 4096,
 					     PROT_WRITE, MAP_SHARED, i915,
 					     mmap_arg.offset);
 				if (ptr != MAP_FAILED) {
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
