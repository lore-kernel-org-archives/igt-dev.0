Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 20 Aug 2020 14:36:00 +0100
Message-Id: <20200820133600.8259-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_capture: Check the capture
 runs in isolation
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Capturing the error state for one context should not impede progress of
other contexts across the system. That is we reset the engine, remove
the context from the execution queue, then capture it. Once the hanging
request has been removed, we can execute any other context instead.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 tests/i915/gem_exec_capture.c | 66 +++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index 1a53d2fb7..186bed7e2 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -195,6 +195,7 @@ static struct offset {
 	      unsigned int size, int count,
 	      unsigned int flags)
 #define INCREMENTAL 0x1
+#define ASYNC 0x2
 {
 	const int gen = intel_gen(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 *obj;
@@ -303,9 +304,11 @@ static struct offset {
 		igt_assert(gem_bo_busy(fd, obj[0].handle));
 	munmap(seqno, 4096);
 
-	igt_force_gpu_reset(fd);
+	if (!(flags & ASYNC)) {
+		igt_force_gpu_reset(fd);
+		gem_sync(fd, obj[count + 1].handle);
+	}
 
-	gem_sync(fd, obj[count + 1].handle);
 	gem_close(fd, obj[count + 1].handle);
 	for (i = 0; i < count; i++) {
 		offsets[i].addr = obj[i + 1].offset;
@@ -491,6 +494,62 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
 	free(offsets);
 }
 
+static void prioinv(int fd, int dir, unsigned ring)
+{
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	struct drm_i915_gem_exec_object2 obj = {
+		.handle = gem_create(fd, 4096),
+	};
+	struct drm_i915_gem_execbuffer2 execbuf = {
+		.buffers_ptr = to_user_pointer(&obj),
+		.buffer_count = 1,
+		.flags = ring,
+	};
+	int64_t timeout = NSEC_PER_SEC; /* 1s, feeling generous, blame debug */
+	uint64_t ram, gtt, size = 4 << 20;
+	unsigned long count;
+	int link[2], dummy;
+
+	igt_require(gem_scheduler_enabled(fd));
+	igt_require(igt_params_set(fd, "reset", "%u", -1)); /* engine resets! */
+	igt_require(gem_gpu_reset_type(fd) > 1);
+
+	gtt = gem_aperture_size(fd) / size;
+	ram = (intel_get_avail_ram_mb() << 20) / size;
+	igt_debug("Available objects in GTT:%"PRIu64", RAM:%"PRIu64"\n",
+		  gtt, ram);
+
+	count = min(gtt, ram) / 4;
+	igt_require(count > 1);
+
+	intel_require_memory(count, size, CHECK_RAM);
+
+	gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
+	gem_execbuf(fd, &execbuf);
+	gem_sync(fd, obj.handle);
+
+	igt_assert(pipe(link) == 0);
+	igt_fork(child, 1) {
+		fd = gem_reopen_driver(fd);
+		igt_debug("Submitting large hang + capture\n");
+		free(__captureN(fd, dir, ring, size, count, ASYNC));
+		write(link[1], &fd, sizeof(fd)); /* wake the parent up */
+		igt_force_gpu_reset(fd);
+	}
+	read(link[0], &dummy, sizeof(dummy));
+
+	igt_debug("Submitting nop\n");
+	gem_execbuf(fd, &execbuf);
+	igt_assert_eq(gem_wait(fd, obj.handle, &timeout), 0);
+	gem_close(fd, obj.handle);
+
+	igt_waitchildren();
+	close(link[0]);
+	close(link[1]);
+
+	gem_quiescent_gpu(fd);
+}
+
 static void userptr(int fd, int dir)
 {
 	uint32_t handle;
@@ -588,6 +647,9 @@ igt_main
 		userptr(fd, dir);
 	}
 
+	test_each_engine("pi", fd, e)
+		prioinv(fd, dir, e->flags);
+
 	igt_fixture {
 		close(dir);
 		igt_disallow_hang(fd, hang);
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
