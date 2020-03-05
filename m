Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu,  5 Mar 2020 11:15:22 +0000
Message-Id: <20200305111522.2674305-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_balancer: Exercise
 bonded-payload synchronisation
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
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Our goal with bonded submission is to submit the pair of user batches to
the HW at roughly the same time, and trying to avoid any bubbles. If we
submit the secondary batch too early, it will be running before the
first and stuck on the HW preventing others from utilising the GPU. At
worst, it may even appear unresponsive and trigger a GPU hang as it
waits for its master. If we submit the secondary too late, the reverse
situation may apply to the master as it has to wait to the secondaries.

This test tries to verify that using a submit-fence to create a bonded
pair does not prevent others from using the HW. By using a pair of
spinners, we can create a bonded hog that when set in motion will fully
utilize both engines [if the scheduling is incorrect]. We then use a
third party submitted after the bonded pair to cancel the spinner from
the GPU -- if it is unable to run, the spinner is never cancelled, and
the bonded pair will cause a GPU hang.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tests/i915/gem_exec_balancer.c | 91 ++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 69f0100ff..e1f9ce625 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -1240,6 +1240,94 @@ static void indices(int i915)
 	gem_quiescent_gpu(i915);
 }
 
+static void __bonded_early(int i915, uint32_t ctx,
+			   const struct i915_engine_class_instance *siblings,
+			   unsigned int count)
+{
+	uint32_t handle = batch_create(i915);
+	struct drm_i915_gem_exec_object2 batch = {
+		.handle = handle,
+	};
+	struct drm_i915_gem_execbuffer2 execbuf = {
+		.buffers_ptr = to_user_pointer(&batch),
+		.buffer_count = 1,
+		.rsvd1 = ctx,
+	};
+	igt_spin_t *spin;
+
+	/* A: spin forever on engine 1 */
+	set_load_balancer(i915, ctx, siblings, count, NULL);
+	spin = igt_spin_new(i915,
+			    .ctx = ctx,
+			    .engine = 1,
+			    .flags = IGT_SPIN_NO_PREEMPTION);
+
+	/* B: runs after A on engine 1 */
+	execbuf.flags = I915_EXEC_FENCE_OUT;
+	execbuf.flags |= 1;
+	gem_execbuf_wr(i915, &execbuf);
+
+	/* B': run in parallel with B on engine 2, i.e. not before A! */
+	set_load_balancer(i915, ctx, siblings, count, NULL);
+	execbuf.flags = I915_EXEC_FENCE_SUBMIT | I915_EXEC_FENCE_OUT;
+	execbuf.flags |= 2;
+	execbuf.rsvd2 >>= 32;
+	gem_execbuf_wr(i915, &execbuf);
+
+	/* C: prevent anything running on engine 2 after B' */
+	spin->execbuf.flags = 2;
+	gem_execbuf(i915, &spin->execbuf);
+
+	igt_debugfs_dump(i915, "i915_engine_info");
+
+	/* D: cancel the spinner from engine 2 (new timeline) */
+	set_load_balancer(i915, ctx, siblings, count, NULL);
+	batch.handle = create_semaphore_to_spinner(i915, spin);
+	execbuf.flags = 2;
+	gem_execbuf(i915, &execbuf);
+	gem_close(i915, batch.handle);
+
+	/* If C runs before D, we never cancel the spinner and so hang */
+	gem_sync(i915, handle);
+
+	/* Check the bonded pair completed successfully */
+	igt_assert_eq(sync_fence_status(execbuf.rsvd2 & 0xffffffff), 1);
+	igt_assert_eq(sync_fence_status(execbuf.rsvd2 >> 32), 1);
+
+	close(execbuf.rsvd2);
+	close(execbuf.rsvd2 >> 32);
+
+	gem_close(i915, handle);
+	igt_spin_free(i915, spin);
+}
+
+static void bonded_early(int i915)
+{
+	uint32_t ctx;
+
+	/*
+	 * Our goal is to start the bonded payloads at roughly the same time.
+	 * We do not want to start the secondary batch too early as it will
+	 * do nothing but hog the GPU until the first has a chance to execute.
+	 * So if we were to arbitrary delay the first by running it after a
+	 * spinner...
+	 */
+
+	ctx = gem_context_create(i915);
+
+	for (int class = 0; class < 32; class++) {
+		struct i915_engine_class_instance *siblings;
+		unsigned int count;
+
+		siblings = list_engines(i915, 1u << class, &count);
+		if (count > 1)
+			__bonded_early(i915, ctx, siblings, count);
+		free(siblings);
+	}
+
+	gem_context_destroy(i915, ctx);
+}
+
 static void busy(int i915)
 {
 	uint32_t scratch = gem_create(i915, 4096);
@@ -1891,6 +1979,9 @@ igt_main
 	igt_subtest("bonded-semaphore")
 		bonded_semaphore(i915);
 
+	igt_subtest("bonded-early")
+		bonded_early(i915);
+
 	igt_fixture {
 		igt_stop_hang_detector();
 	}
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
