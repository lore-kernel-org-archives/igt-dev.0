Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue,  4 Feb 2020 12:41:13 +0100
Message-Id: <20200204114113.22436-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3] tests/prime_vgem: Examine blitter access
 path
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
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On future hardware with missing GGTT BAR we won't be able to exercise
dma-buf access via that path.  An alternative to basic-gtt subtest for
testing dma-buf access is required, as well as basic-fence-mmap and
coherency-gtt subtest alternatives for testing WC coherency.

Access to the dma sg list feature exposed by dma-buf can be tested
through blitter.  Unfortunately we don't have any equivalently simple
tests that use blitter.  Provide them.

XY_SRC_COPY_BLT method implemented by igt_blitter_src_copy() IGT
library helper has been chosen.

v2: As fast copy is not supported on platforms older than Gen 9,
    use XY_SRC_COPY instead (Chris),
  - add subtest descriptions.
v3: Don't calculate the pitch, use scratch.pitch returned by
    vgem_create() (Chris),
  - replace constants with values from respective fields of scratch
    (Chris),
  - use _u32 variant of igt_assert_eq() for better readability of
    possible error messages (Chris),
  - sleep a bit to emphasize that the only thing stopping the blitter
    is the fence (Chris),
  - use prime_sync_start/end() as the recommended practice for
    inter-device sync, not gem_sync() (Chris),
  - update the name of used XY_SRC_COPY_BLT helper to match the name of
    its library version just merged.

Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
Hi Chris,

I hope I've understood and addressed your comments correctly so your
R-b still applies.

Thanks,
Janusz

 tests/prime_vgem.c | 187 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 187 insertions(+)

diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 3bdb23007..96c527287 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -28,6 +28,8 @@
 #include <sys/poll.h>
 #include <time.h>
 
+#include "intel_batchbuffer.h"	/* igt_blitter_src_copy() */
+
 IGT_TEST_DESCRIPTION("Basic check of polling for prime/vgem fences.");
 
 static void test_read(int vgem, int i915)
@@ -181,6 +183,79 @@ static void test_fence_mmap(int i915, int vgem)
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
+		for (i = 0; i < scratch.height; i++)
+			igt_assert_eq_u32(ptr[scratch.pitch * i / sizeof(*ptr)],
+					  0);
+
+		write(master[1], &child, sizeof(child));
+		read(slave[0], &child, sizeof(child));
+
+		igt_blitter_src_copy(i915, prime, 0, scratch.pitch,
+				     I915_TILING_NONE, 0, 0, scratch.width,
+				     scratch.height, scratch.bpp, native, 0,
+				     scratch.pitch, I915_TILING_NONE, 0, 0);
+		gem_sync(i915, native);
+
+		for (i = 0; i < scratch.height; i++)
+			igt_assert_eq_u32(ptr[scratch.pitch * i / sizeof(*ptr)],
+					  i);
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
+	/* Emphasize that the only thing stopping the blitter is the fence */
+	usleep(50*1000);
+
+	ptr = vgem_mmap(vgem, &scratch, PROT_WRITE);
+	for (i = 0; i < scratch.height; i++)
+		ptr[scratch.pitch * i / sizeof(*ptr)] = i;
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
@@ -249,6 +324,57 @@ static void test_gtt(int vgem, int i915)
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
+
+	native = gem_create(i915, scratch.size);
+
+	ptr = gem_mmap__wc(i915, native, 0, scratch.size, PROT_WRITE);
+	for (i = 0; i < scratch.height; i++)
+		ptr[scratch.pitch * i / sizeof(*ptr)] = i;
+	munmap(ptr, scratch.size);
+
+	igt_blitter_src_copy(i915, native, 0, scratch.pitch, I915_TILING_NONE,
+			     0, 0, scratch.width, scratch.height, scratch.bpp,
+			     prime, 0, scratch.pitch, I915_TILING_NONE, 0, 0);
+	prime_sync_start(dmabuf, true);
+	prime_sync_end(dmabuf, true);
+	close(dmabuf);
+
+	ptr = vgem_mmap(vgem, &scratch, PROT_READ | PROT_WRITE);
+	for (i = 0; i < scratch.height; i++) {
+		igt_assert_eq_u32(ptr[scratch.pitch * i / sizeof(*ptr)], i);
+		ptr[scratch.pitch * i / sizeof(*ptr)] = ~i;
+	}
+	munmap(ptr, scratch.size);
+
+	igt_blitter_src_copy(i915, prime, 0, scratch.pitch, I915_TILING_NONE,
+			     0, 0, scratch.width, scratch.height, scratch.bpp,
+			     native, 0, scratch.pitch, I915_TILING_NONE, 0, 0);
+	gem_sync(i915, native);
+
+	ptr = gem_mmap__wc(i915, native, 0, scratch.size, PROT_READ);
+	for (i = 0; i < scratch.height; i++)
+		igt_assert_eq_u32(ptr[scratch.pitch * i / sizeof(*ptr)], ~i);
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
@@ -332,6 +458,56 @@ static void test_gtt_interleaved(int vgem, int i915)
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
+
+	native = gem_create(i915, scratch.size);
+
+	foreign = vgem_mmap(vgem, &scratch, PROT_WRITE);
+	local = gem_mmap__wc(i915, native, 0, scratch.size, PROT_WRITE);
+
+	for (i = 0; i < scratch.height; i++) {
+		local[scratch.pitch * i / sizeof(*local)] = i;
+		igt_blitter_src_copy(i915, native, 0, scratch.pitch,
+				     I915_TILING_NONE, 0, i, scratch.width, 1,
+				     scratch.bpp, prime, 0, scratch.pitch,
+				     I915_TILING_NONE, 0, i);
+		prime_sync_start(dmabuf, true);
+		prime_sync_end(dmabuf, true);
+		igt_assert_eq_u32(foreign[scratch.pitch * i / sizeof(*foreign)],
+				  i);
+
+		foreign[scratch.pitch * i / sizeof(*foreign)] = ~i;
+		igt_blitter_src_copy(i915, prime, 0, scratch.pitch,
+				     I915_TILING_NONE, 0, i, scratch.width, 1,
+				     scratch.bpp, native, 0, scratch.pitch,
+				     I915_TILING_NONE, 0, i);
+		gem_sync(i915, native);
+		igt_assert_eq_u32(local[scratch.pitch * i / sizeof(*local)],
+				  ~i);
+	}
+	close(dmabuf);
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
@@ -849,12 +1025,20 @@ igt_main
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
@@ -904,6 +1088,9 @@ igt_main
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
