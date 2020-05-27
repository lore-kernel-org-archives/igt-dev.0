Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 27 May 2020 14:14:09 +0100
Message-Id: <20200527131409.699882-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_balancer: Randomise bonded
 submission
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
Cc: intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Randomly submit a paired spinner and its cancellation as a bonded
(submit fence) pair. Apply congestion to the engine with more bonded
pairs to see if the execution order fails. If we prevent a cancellation
from running, then the spinner will remain spinning forever.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tests/i915/gem_exec_balancer.c | 108 +++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 80ae82416..98715d726 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -1154,6 +1154,111 @@ static void bonded_semaphore(int i915)
 	gem_context_destroy(i915, ctx);
 }
 
+static void __bonded_dual(int i915,
+			  const struct i915_engine_class_instance *siblings,
+			  unsigned int count)
+{
+	struct drm_i915_gem_exec_object2 batch = {};
+	struct drm_i915_gem_execbuffer2 execbuf = {
+		.buffers_ptr = to_user_pointer(&batch),
+		.buffer_count = 1,
+	};
+	unsigned long cycles = 0;
+	uint32_t A, B;
+
+	A = gem_context_create(i915);
+	set_load_balancer(i915, A, siblings, count, NULL);
+
+	B = gem_context_create(i915);
+	set_load_balancer(i915, B, siblings, count, NULL);
+
+	igt_until_timeout(5) {
+		unsigned int master = rand() % count + 1;
+		int timeline, fence;
+		igt_spin_t *a, *b;
+
+		timeline = sw_sync_timeline_create();
+		fence = sw_sync_timeline_create_fence(timeline, 1);
+
+		a = igt_spin_new(i915, A,
+				 .engine = master,
+				 .fence = fence,
+				 .flags = (IGT_SPIN_FENCE_IN |
+					   IGT_SPIN_POLL_RUN |
+					   IGT_SPIN_NO_PREEMPTION |
+					   IGT_SPIN_FENCE_OUT));
+		b = igt_spin_new(i915, B,
+				 .engine = master,
+				 .fence = fence,
+				 .flags = (IGT_SPIN_FENCE_IN |
+					   IGT_SPIN_POLL_RUN |
+					   IGT_SPIN_NO_PREEMPTION |
+					   IGT_SPIN_FENCE_OUT));
+
+		close(fence);
+
+		if (rand() % 1)
+			igt_swap(a, b);
+
+		batch.handle = create_semaphore_to_spinner(i915, a);
+		execbuf.rsvd1 = a->execbuf.rsvd1;
+		execbuf.rsvd2 = a->out_fence;
+		do {
+			execbuf.flags = rand() % count + 1;
+		} while (execbuf.flags == master);
+		execbuf.flags |= I915_EXEC_FENCE_SUBMIT;
+		gem_execbuf(i915, &execbuf);
+		gem_close(i915, batch.handle);
+
+		batch.handle = create_semaphore_to_spinner(i915, b);
+		execbuf.rsvd1 = b->execbuf.rsvd1;
+		execbuf.rsvd2 = b->out_fence;
+		do {
+			execbuf.flags = rand() % count + 1;
+		} while (execbuf.flags == master);
+		execbuf.flags |= I915_EXEC_FENCE_SUBMIT;
+		gem_execbuf(i915, &execbuf);
+		gem_close(i915, batch.handle);
+
+		close(timeline);
+
+		gem_sync(i915, a->handle);
+		gem_sync(i915, b->handle);
+
+		igt_spin_free(i915, a);
+		igt_spin_free(i915, b);
+		cycles++;
+	}
+
+	igt_info("%lu cycles\n", cycles);
+
+	gem_context_destroy(i915, A);
+	gem_context_destroy(i915, B);
+}
+
+static void bonded_dual(int i915)
+{
+	/*
+	 * The purpose of bonded submission is to execute one or more requests
+	 * concurrently. However, the very nature of that requires coordinated
+	 * submission across multiple engines.
+	 */
+	igt_require(gem_scheduler_has_preemption(i915));
+
+	for (int class = 1; class < 32; class++) {
+		struct i915_engine_class_instance *siblings;
+		unsigned int count;
+
+		siblings = list_engines(i915, 1u << class, &count);
+		if (count > 1) {
+			igt_fork(child, count + 1)
+				__bonded_dual(i915, siblings, count);
+			igt_waitchildren();
+		}
+		free(siblings);
+	}
+}
+
 static void __bonded_nohang(int i915, uint32_t ctx,
 			    const struct i915_engine_class_instance *siblings,
 			    unsigned int count,
@@ -2284,6 +2389,9 @@ igt_main
 	igt_subtest("bonded-semaphore")
 		bonded_semaphore(i915);
 
+	igt_subtest("bonded-dual")
+		bonded_dual(i915);
+
 	igt_fixture {
 		igt_stop_hang_detector();
 	}
-- 
2.27.0.rc0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
