Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu,  9 Jan 2020 15:01:25 +0100
Message-Id: <20200109140125.18483-3-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200109140125.18483-1-janusz.krzysztofik@linux.intel.com>
References: <20200109140125.18483-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/prime_vgem: Examine blitter
 access path
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On future hardware with missing GGTT BAR we won't be able to exercise
dma-buf access via that path.  An alternative to basic-gtt subtest for
testing dma-buf access is required, as well as basic-fence-mmap and
coherency-gtt subtest alternatives for testing WC coherency.

Access to the dma sg list feature exposed by dma-buf can be tested
through blitter.  Unfortunately we don't have any equivalently simple
tests that use blitter.  Provide them.

Blitter XY_SRC_COPY method implemented by igt_blitter_src_copy__raw()
IGT library function has been chosen.

v2: As fast copy is not supported on platforms older than Gen 9,
    use XY_SRC_COPY instead (Chris),
  - add subtest descriptions.

Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/prime_vgem.c | 192 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 192 insertions(+)

diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 69ae8c9b..9ceee47a 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -23,6 +23,7 @@
 
 #include "igt.h"
 #include "igt_vgem.h"
+#include "intel_batchbuffer.h"
 
 #include <sys/ioctl.h>
 #include <sys/poll.h>
@@ -171,6 +172,77 @@ static void test_fence_mmap(int i915, int vgem)
 	close(slave[1]);
 }
 
+static void test_fence_blt(int i915, int vgem)
+{
+	struct vgem_bo scratch;
+	uint32_t prime;
+	uint32_t *ptr;
+	uint32_t fence;
+	int dmabuf, i;
+	int master[2], slave[2];
+
+	igt_assert(pipe(master) == 0);
+	igt_assert(pipe(slave) == 0);
+
+	scratch.width = 1024;
+	scratch.height = 1024;
+	scratch.bpp = 32;
+	vgem_create(vgem, &scratch);
+
+	dmabuf = prime_handle_to_fd(vgem, scratch.handle);
+	prime = prime_fd_to_handle(i915, dmabuf);
+	close(dmabuf);
+
+	igt_fork(child, 1) {
+		uint32_t native;
+
+		close(master[0]);
+		close(slave[1]);
+
+		native = gem_create(i915, scratch.size);
+
+		ptr = gem_mmap__wc(i915, native, 0, scratch.size, PROT_READ);
+		for (i = 0; i < 1024; i++)
+			igt_assert_eq(ptr[1024 * i], 0);
+
+		write(master[1], &child, sizeof(child));
+		read(slave[0], &child, sizeof(child));
+
+		igt_blitter_src_copy__raw(i915, prime, 0,
+					  scratch.width * scratch.bpp / 8,
+					  I915_TILING_NONE, 0, 0,
+					  scratch.width, scratch.height,
+					  scratch.bpp, native, 0,
+					  scratch.width * scratch.bpp / 8,
+					  I915_TILING_NONE, 0, 0);
+		gem_sync(i915, native);
+
+		for (i = 0; i < 1024; i++)
+			igt_assert_eq(ptr[1024 * i], i);
+
+		munmap(ptr, scratch.size);
+		gem_close(i915, native);
+		gem_close(i915, prime);
+	}
+
+	close(master[1]);
+	close(slave[0]);
+	read(master[0], &i, sizeof(i));
+	fence = vgem_fence_attach(vgem, &scratch, VGEM_FENCE_WRITE);
+	write(slave[1], &i, sizeof(i));
+
+	ptr = vgem_mmap(vgem, &scratch, PROT_WRITE);
+	for (i = 0; i < 1024; i++)
+		ptr[1024 * i] = i;
+	munmap(ptr, scratch.size);
+	vgem_fence_signal(vgem, fence);
+	gem_close(vgem, scratch.handle);
+
+	igt_waitchildren();
+	close(master[0]);
+	close(slave[1]);
+}
+
 static void test_write(int vgem, int i915)
 {
 	struct vgem_bo scratch;
@@ -236,6 +308,62 @@ static void test_gtt(int vgem, int i915)
 	gem_close(vgem, scratch.handle);
 }
 
+static void test_blt(int vgem, int i915)
+{
+	struct vgem_bo scratch;
+	uint32_t prime, native;
+	uint32_t *ptr;
+	int dmabuf, i;
+
+	scratch.width = 1024;
+	scratch.height = 1024;
+	scratch.bpp = 32;
+	vgem_create(vgem, &scratch);
+
+	dmabuf = prime_handle_to_fd(vgem, scratch.handle);
+	prime = prime_fd_to_handle(i915, dmabuf);
+	close(dmabuf);
+
+	native = gem_create(i915, scratch.size);
+
+	ptr = gem_mmap__wc(i915, native, 0, scratch.size, PROT_WRITE);
+	for (i = 0; i < 1024; i++)
+		ptr[1024 * i] = i;
+	munmap(ptr, scratch.size);
+
+	igt_blitter_src_copy__raw(i915,
+				  native, 0, scratch.width * scratch.bpp / 8,
+				  I915_TILING_NONE, 0, 0,
+				  scratch.width, scratch.height, scratch.bpp,
+				  prime, 0, scratch.width * scratch.bpp / 8,
+				  I915_TILING_NONE, 0, 0);
+	gem_sync(i915, prime);
+
+	ptr = vgem_mmap(vgem, &scratch, PROT_READ | PROT_WRITE);
+	for (i = 0; i < 1024; i++) {
+		igt_assert_eq(ptr[1024 * i], i);
+		ptr[1024 * i] = ~i;
+	}
+	munmap(ptr, scratch.size);
+
+	igt_blitter_src_copy__raw(i915,
+				  prime, 0, scratch.width * scratch.bpp / 8,
+				  I915_TILING_NONE, 0, 0,
+				  scratch.width, scratch.height, scratch.bpp,
+				  native, 0, scratch.width * scratch.bpp / 8,
+				  I915_TILING_NONE, 0, 0);
+	gem_sync(i915, native);
+
+	ptr = gem_mmap__wc(i915, native, 0, scratch.size, PROT_READ);
+	for (i = 0; i < 1024; i++)
+		igt_assert_eq(ptr[1024 * i], ~i);
+	munmap(ptr, scratch.size);
+
+	gem_close(i915, native);
+	gem_close(i915, prime);
+	gem_close(vgem, scratch.handle);
+}
+
 static void test_shrink(int vgem, int i915)
 {
 	struct vgem_bo scratch = {
@@ -319,6 +447,59 @@ static void test_gtt_interleaved(int vgem, int i915)
 	gem_close(vgem, scratch.handle);
 }
 
+static void test_blt_interleaved(int vgem, int i915)
+{
+	struct vgem_bo scratch;
+	uint32_t prime, native;
+	uint32_t *foreign, *local;
+	int dmabuf, i;
+
+	scratch.width = 1024;
+	scratch.height = 1024;
+	scratch.bpp = 32;
+	vgem_create(vgem, &scratch);
+
+	dmabuf = prime_handle_to_fd(vgem, scratch.handle);
+	prime = prime_fd_to_handle(i915, dmabuf);
+	close(dmabuf);
+
+	native = gem_create(i915, scratch.size);
+
+	foreign = vgem_mmap(vgem, &scratch, PROT_WRITE);
+	local = gem_mmap__wc(i915, native, 0, scratch.size, PROT_WRITE);
+
+	for (i = 0; i < 1024; i++) {
+		local[1024 * i] = i;
+		igt_blitter_src_copy__raw(i915, native, 0,
+					  scratch.width * scratch.bpp / 8,
+					  I915_TILING_NONE, 0, i,
+					  scratch.width, 1, scratch.bpp,
+					  prime, 0,
+					  scratch.width * scratch.bpp / 8,
+					  I915_TILING_NONE, 0, i);
+		gem_sync(i915, prime);
+		igt_assert_eq(foreign[1024 * i], i);
+
+		foreign[1024 * i] = ~i;
+		igt_blitter_src_copy__raw(i915, prime, 0,
+					  scratch.width * scratch.bpp / 8,
+					  I915_TILING_NONE, 0, i,
+					  scratch.width, 1, scratch.bpp,
+					  native, 0,
+					  scratch.width * scratch.bpp / 8,
+					  I915_TILING_NONE, 0, i);
+		gem_sync(i915, native);
+		igt_assert_eq(local[1024 * i], ~i);
+	}
+
+	munmap(local, scratch.size);
+	munmap(foreign, scratch.size);
+
+	gem_close(i915, native);
+	gem_close(i915, prime);
+	gem_close(vgem, scratch.handle);
+}
+
 static bool prime_busy(int fd, bool excl)
 {
 	struct pollfd pfd = { .fd = fd, .events = excl ? POLLOUT : POLLIN };
@@ -834,12 +1015,20 @@ igt_main
 	igt_subtest("basic-gtt")
 		test_gtt(vgem, i915);
 
+	igt_describe("Examine blitter access path");
+	igt_subtest("basic-blt")
+		test_blt(vgem, i915);
+
 	igt_subtest("shrink")
 		test_shrink(vgem, i915);
 
 	igt_subtest("coherency-gtt")
 		test_gtt_interleaved(vgem, i915);
 
+	igt_describe("Examine blitter access path WC coherency");
+	igt_subtest("coherency-blt")
+		test_blt_interleaved(vgem, i915);
+
 	for (e = intel_execution_engines; e->name; e++) {
 		igt_subtest_f("%ssync-%s",
 			      e->exec_id == 0 ? "basic-" : "",
@@ -886,6 +1075,9 @@ igt_main
 			test_fence_read(i915, vgem);
 		igt_subtest("basic-fence-mmap")
 			test_fence_mmap(i915, vgem);
+		igt_describe("Examine blitter access path fencing");
+		igt_subtest("basic-fence-blt")
+			test_fence_blt(i915, vgem);
 
 		for (e = intel_execution_engines; e->name; e++) {
 			igt_subtest_f("%sfence-wait-%s",
-- 
2.21.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
