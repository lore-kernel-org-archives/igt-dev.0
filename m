Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCB56E8E4
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jul 2021 15:36:32 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 59-20020a9d0ac10000b0290462f0ab0800so6202066otq.11
 for <igt-dev@lists.freedesktop.org>; Thu, 08 Jul 2021 08:36:32 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu,  8 Jul 2021 10:36:29 -0500
Message-Id: <20210708153629.489175-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/exec_balancer: Drop the
 bonded-slice test
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

This explicitly tests that you can use a submit fence to make something
run on a virtual engine in parallel with a physical engine, assuming
that i915 will magically sort things out so that they don't land on the
same engine.  We're removing this magic from i915 so this test is no
longer valid.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_exec_balancer.c | 113 ---------------------------------
 1 file changed, 113 deletions(-)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index a0b17489f..070f392b1 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -573,116 +573,6 @@ static uint32_t create_semaphore_to_spinner(int i915, igt_spin_t *spin)
 	return handle;
 }
 
-static void bonded_slice(int i915)
-{
-	int *stop;
-
-	/*
-	 * Mix and match bonded/parallel execution of multiple requests in
-	 * the presence of background load and timeslicing [preemption].
-	 */
-
-	igt_require(gem_scheduler_has_semaphores(i915));
-
-	stop = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
-	igt_assert(stop != MAP_FAILED);
-
-	for (int class = 0; class < 32; class++) {
-		struct i915_engine_class_instance *siblings;
-		struct drm_i915_gem_exec_object2 obj[3] = {};
-		struct drm_i915_gem_execbuffer2 eb = {};
-		unsigned int count;
-		const intel_ctx_t *ctx;
-		igt_spin_t *spin;
-
-		siblings = list_engines(i915, 1u << class, &count);
-		if (!siblings)
-			continue;
-
-		if (count < 2) {
-			free(siblings);
-			continue;
-		}
-
-		/*
-		 * A: semaphore wait on spinner on a real engine; cancel spinner
-		 * B: unpreemptable spinner on virtual engine
-		 *
-		 * A waits for running ack from B, if scheduled on the same
-		 * engine -> hang.
-		 *
-		 * C+: background load across engines to trigger timeslicing
-		 *
-		 * XXX add explicit bonding options for A->B
-		 */
-
-		ctx = ctx_create_balanced(i915, siblings, count);
-
-		spin = __igt_spin_new(i915,
-				      .ctx = ctx,
-				      .flags = (IGT_SPIN_NO_PREEMPTION |
-						IGT_SPIN_POLL_RUN));
-		igt_spin_end(spin); /* we just want its address for later */
-		gem_sync(i915, spin->handle);
-		igt_spin_reset(spin);
-
-		/* igt_spin_t poll and batch obj must be laid out as we expect */
-		igt_assert_eq(IGT_SPIN_BATCH, 1);
-		obj[0] = spin->obj[0];
-		obj[1] = spin->obj[1];
-		obj[2].handle = create_semaphore_to_spinner(i915, spin);
-
-		eb.buffers_ptr = to_user_pointer(obj);
-		eb.rsvd1 = ctx->id;
-
-		*stop = 0;
-		igt_fork(child, count + 1) { /* C: arbitrary background load */
-			igt_list_del(&spin->link);
-
-			ctx = ctx_create_balanced(i915, siblings, count);
-
-			while (!READ_ONCE(*stop)) {
-				spin = igt_spin_new(i915,
-						    .ctx = ctx,
-						    .engine = (1 + rand() % count),
-						    .flags = IGT_SPIN_POLL_RUN);
-				igt_spin_busywait_until_started(spin);
-				usleep(50000);
-				igt_spin_free(i915, spin);
-			}
-
-			intel_ctx_destroy(i915, ctx);
-		}
-
-		igt_until_timeout(5) {
-			igt_spin_reset(spin); /* indirectly cancelled by A */
-
-			/* A: Submit the semaphore wait on a real engine */
-			eb.buffer_count = 3;
-			eb.flags = (1 + rand() % count) | I915_EXEC_FENCE_OUT;
-			gem_execbuf_wr(i915, &eb);
-
-			/* B: Submit the spinner (in parallel) on virtual [0] */
-			eb.buffer_count = 2;
-			eb.flags = 0 | I915_EXEC_FENCE_SUBMIT;
-			eb.rsvd2 >>= 32;
-			gem_execbuf(i915, &eb);
-			close(eb.rsvd2);
-
-			gem_sync(i915, obj[0].handle);
-		}
-
-		*stop = 1;
-		igt_waitchildren();
-
-		gem_close(i915, obj[2].handle);
-		igt_spin_free(i915, spin);
-		intel_ctx_destroy(i915, ctx);
-	}
-
-	munmap(stop, 4096);
-}
-
 static void __bonded_chain(int i915,
 			   const struct i915_engine_class_instance *siblings,
 			   unsigned int count)
@@ -2906,9 +2796,6 @@ igt_main
 	igt_subtest("smoke")
 		smoketest(i915, 20);
 
-	igt_subtest("bonded-slice")
-		bonded_slice(i915);
-
 	igt_subtest("bonded-chain")
 		bonded_chain(i915);
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
