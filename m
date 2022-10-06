Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246DD10E324
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Oct 2022 16:39:46 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id d196so1682679iof.11
 for <igt-dev@lists.freedesktop.org>; Thu, 06 Oct 2022 09:39:46 -0700 (PDT)
From: Jake Freeland <jake@technologyfriends.net>
To: igt-dev@lists.freedesktop.org
Date: Thu,  6 Oct 2022 11:39:34 -0500
Message-Id: <20221006163934.41332-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] Replace instances of mmap64() with mmap()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jake Freeland <jfree@freebsd.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The mmap64() function exists to point 32-bit architectures to an mmap
interface with the capability to address a 64-bit memory address space.
As 32-bit machines are replaced by 64-bit, there is no longer a need to
keep mmap64() around. This is especially apparent in operating systems
like FreeBSD that exclude the mmap64() function altogether. This patch
replaces all instances of mmap64() with mmap().

Signed-off-by: Jake Freeland <jfree@freebsd.org>
---
 lib/i915/gem_mman.c          |  4 ++--
 lib/igt_vgem.c               |  2 +-
 tests/i915/gem_mmap_gtt.c    | 22 +++++++++++-----------
 tests/i915/gem_mmap_offset.c | 12 ++++++------
 4 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
index aa9ac6f3..0b41ba70 100644
--- a/lib/i915/gem_mman.c
+++ b/lib/i915/gem_mman.c
@@ -118,7 +118,7 @@ void *__gem_mmap__gtt(int fd, uint32_t handle, uint64_t size, unsigned prot)
 	if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &mmap_arg))
 		return NULL;
 
-	ptr = mmap64(0, size, prot, MAP_SHARED, fd, mmap_arg.offset);
+	ptr = mmap(0, size, prot, MAP_SHARED, fd, mmap_arg.offset);
 	if (ptr == MAP_FAILED)
 		ptr = NULL;
 	else
@@ -331,7 +331,7 @@ void *__gem_mmap_offset(int fd, uint32_t handle, uint64_t offset, uint64_t size,
 	if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_OFFSET, &arg))
 		return NULL;
 
-	ptr = mmap64(0, size, prot, MAP_SHARED, fd, arg.offset + offset);
+	ptr = mmap(0, size, prot, MAP_SHARED, fd, arg.offset + offset);
 
 	if (ptr == MAP_FAILED)
 		ptr = NULL;
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
index e39b9047..d9c08711 100644
--- a/tests/i915/gem_mmap_gtt.c
+++ b/tests/i915/gem_mmap_gtt.c
@@ -113,11 +113,11 @@ test_access(int fd)
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
 
@@ -128,7 +128,7 @@ test_access(int fd)
 
 	/* Recheck that it works after flink. */
 	/* Check that the same offset on the other fd doesn't work. */
-	igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
+	igt_assert(mmap(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
 			  MAP_SHARED, fd2, mmap_arg.offset));
 }
 
@@ -159,11 +159,11 @@ test_short(int fd)
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
 
@@ -384,13 +384,13 @@ test_isolation(int i915)
 
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
 
@@ -400,7 +400,7 @@ test_close_race(int i915)
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	_Atomic uint32_t *handles;
 
-	handles = mmap64(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+	handles = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(handles != MAP_FAILED);
 
 	igt_fork(child, ncpus + 1) {
@@ -418,7 +418,7 @@ test_close_race(int i915)
 				  &mmap_arg) != -1) {
 				void *ptr;
 
-				ptr = mmap64(0, 4096,
+				ptr = mmap(0, 4096,
 					     PROT_WRITE, MAP_SHARED, i915,
 					     mmap_arg.offset);
 				if (ptr != MAP_FAILED) {
@@ -444,7 +444,7 @@ test_flink_race(int i915)
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	_Atomic uint32_t *handles;
 
-	handles = mmap64(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+	handles = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(handles != MAP_FAILED);
 
 	igt_fork(child, ncpus + 1) {
@@ -469,7 +469,7 @@ test_flink_race(int i915)
 				  &mmap_arg) != -1) {
 				void *ptr;
 
-				ptr = mmap64(0, 4096,
+				ptr = mmap(0, 4096,
 					     PROT_WRITE, MAP_SHARED, fd,
 					     mmap_arg.offset);
 				if (ptr != MAP_FAILED) {
diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
index 2b416edd..96607421 100644
--- a/tests/i915/gem_mmap_offset.c
+++ b/tests/i915/gem_mmap_offset.c
@@ -67,7 +67,7 @@ __mmap_offset(int i915, uint32_t handle, uint64_t offset, uint64_t size,
 	if (mmap_offset_ioctl(i915, &arg))
 		return NULL;
 
-	ptr = mmap64(0, size, prot, MAP_SHARED, i915, arg.offset + offset);
+	ptr = mmap(0, size, prot, MAP_SHARED, i915, arg.offset + offset);
 	if (ptr == MAP_FAILED)
 		ptr = NULL;
 	else
@@ -321,12 +321,12 @@ static void isolation(int i915)
 				 t->name, B, b, offset_b);
 
 			errno = 0;
-			ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, i915, offset_a);
+			ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, i915, offset_a);
 			igt_assert(ptr == MAP_FAILED);
 			igt_assert_eq(errno, EACCES);
 
 			errno = 0;
-			ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, i915, offset_b);
+			ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, i915, offset_b);
 			igt_assert(ptr == MAP_FAILED);
 			igt_assert_eq(errno, EACCES);
 
@@ -344,13 +344,13 @@ static void isolation(int i915)
 
 			close(B);
 
-			ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
+			ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
 			igt_assert(ptr != MAP_FAILED);
 			munmap(ptr, 4096);
 
 			close(A);
 
-			ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
+			ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
 			igt_assert(ptr == MAP_FAILED);
 		}
 	}
@@ -553,7 +553,7 @@ static void close_race(int i915, int timeout)
 	_Atomic uint32_t *handles;
 	size_t len = ALIGN((ncpus + 1) * sizeof(uint32_t), 4096);
 
-	handles = mmap64(0, len, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+	handles = mmap(0, len, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(handles != MAP_FAILED);
 
 	igt_fork(child, ncpus + 1) {
-- 
2.37.0 (Apple Git-136)
