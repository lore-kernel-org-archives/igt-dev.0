Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C098A89F6F
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 16:38:10 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id c12so10956865pfl.3
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 09:38:10 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 14 Jun 2021 11:36:56 -0500
Message-Id: <20210614163704.365989-42-jason@jlekstrand.net>
In-Reply-To: <20210614163704.365989-1-jason@jlekstrand.net>
References: <20210614163704.365989-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 41/77] tests/i915/gem_ctx_persistence: Drop
 the engine replace subtests
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

We're going to start disallowing non-trivial uses of setparam for
engines precisely to make races like this impossible.  It'll also make
these test cases invalid.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_ctx_persistence.c | 210 -------------------------------
 1 file changed, 210 deletions(-)

diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index 91c301769..59077cc01 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -1085,191 +1085,6 @@ static void many_contexts(int i915)
 	gem_quiescent_gpu(i915);
 }
 
-static void replace_engines(int i915, const struct intel_execution_engine2 *e)
-{
-	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, 1) = {
-		.engines = {{ e->class, e->instance }}
-	};
-	struct drm_i915_gem_context_param param = {
-		.ctx_id = gem_context_create(i915),
-		.param = I915_CONTEXT_PARAM_ENGINES,
-		.value = to_user_pointer(&engines),
-		.size = sizeof(engines),
-	};
-	igt_spin_t *spin[2];
-	int64_t timeout;
-
-	/*
-	 * Suppose the user tries to hide a hanging batch by replacing
-	 * the set of engines on the context so that it's not visible
-	 * at the time of closure? Then we must act when they replace
-	 * the engines!
-	 */
-
-	gem_context_set_persistence(i915, param.ctx_id, false);
-
-	gem_context_set_param(i915, &param);
-	spin[0] = igt_spin_new(i915, param.ctx_id);
-
-	gem_context_set_param(i915, &param);
-	spin[1] = igt_spin_new(i915, param.ctx_id);
-
-	gem_context_destroy(i915, param.ctx_id);
-
-	timeout = reset_timeout_ms * NSEC_PER_MSEC;
-	igt_assert_eq(gem_wait(i915, spin[1]->handle, &timeout), 0);
-
-	timeout = reset_timeout_ms * NSEC_PER_MSEC;
-	igt_assert_eq(gem_wait(i915, spin[0]->handle, &timeout), 0);
-
-	igt_spin_free(i915, spin[1]);
-	igt_spin_free(i915, spin[0]);
-	gem_quiescent_gpu(i915);
-}
-
-static void race_set_engines(int i915, int in, int out)
-{
-	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, 1) = {
-		.engines = {}
-	};
-	struct drm_i915_gem_context_param param = {
-		.param = I915_CONTEXT_PARAM_ENGINES,
-		.value = to_user_pointer(&engines),
-		.size = sizeof(engines),
-	};
-	igt_spin_t *spin;
-
-	spin = igt_spin_new(i915);
-	igt_spin_end(spin);
-
-	while (read(in, &param.ctx_id, sizeof(param.ctx_id)) > 0) {
-		if (!param.ctx_id)
-			break;
-
-		__gem_context_set_param(i915, &param);
-
-		spin->execbuf.rsvd1 = param.ctx_id;
-		__gem_execbuf(i915, &spin->execbuf);
-
-		write(out, &param.ctx_id, sizeof(param.ctx_id));
-	}
-
-	igt_spin_free(i915, spin);
-}
-
-static void close_replace_race(int i915)
-{
-	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
-	int fence = -1;
-	int out[2], in[2];
-
-	cleanup(i915);
-
-	/*
-	 * If we time the submission of a hanging batch to one set of engines
-	 * and then simultaneously replace the engines in one thread, and
-	 * close the context in another, it might be possible for the kernel
-	 * to lose track of the old engines believing that the non-persisten
-	 * context is already closed and the hanging requests cancelled.
-	 *
-	 * Our challenge is try and expose any such race condition.
-	 */
-
-	igt_assert(pipe(out) == 0);
-	igt_assert(pipe(in) == 0);
-	igt_fork(child, ncpus) {
-		close(out[1]);
-		close(in[0]);
-		race_set_engines(i915, out[0], in[1]);
-	}
-	for (int i = 0; i < ncpus; i++)
-		close(out[0]);
-
-	igt_until_timeout(5) {
-		igt_spin_t *spin;
-		uint32_t ctx;
-
-		ctx = gem_context_clone_with_engines(i915, 0);
-		gem_context_set_persistence(i915, ctx, false);
-
-		spin = igt_spin_new(i915, ctx, .flags = IGT_SPIN_FENCE_OUT);
-		for (int i = 0; i < ncpus; i++)
-			write(out[1], &ctx, sizeof(ctx));
-
-		gem_context_destroy(i915, ctx);
-		for (int i = 0; i < ncpus; i++)
-			read(in[0], &ctx, sizeof(ctx));
-
-		if (fence < 0) {
-			fence = spin->out_fence;
-		} else {
-			int tmp;
-
-			tmp = sync_fence_merge(fence, spin->out_fence);
-			close(fence);
-			close(spin->out_fence);
-
-			fence = tmp;
-		}
-		spin->out_fence = -1;
-	}
-	close(in[0]);
-
-	for (int i = 0; i < ncpus; i++) {
-		uint32_t end = 0;
-
-		write(out[1], &end, sizeof(end));
-	}
-	close(out[1]);
-
-	if (sync_fence_wait(fence, MSEC_PER_SEC / 2)) {
-		igt_debugfs_dump(i915, "i915_engine_info");
-		igt_assert(sync_fence_wait(fence, MSEC_PER_SEC / 2) == 0);
-	}
-	close(fence);
-
-	igt_waitchildren();
-	gem_quiescent_gpu(i915);
-}
-
-static void replace_engines_hostile(int i915,
-				    const struct intel_execution_engine2 *e)
-{
-	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, 1) = {
-		.engines = {{ e->class, e->instance }}
-	};
-	struct drm_i915_gem_context_param param = {
-		.ctx_id = gem_context_create(i915),
-		.param = I915_CONTEXT_PARAM_ENGINES,
-		.value = to_user_pointer(&engines),
-		.size = sizeof(engines),
-	};
-	int64_t timeout = reset_timeout_ms * NSEC_PER_MSEC;
-	igt_spin_t *spin;
-
-	/*
-	 * Suppose the user tries to hide a hanging batch by replacing
-	 * the set of engines on the context so that it's not visible
-	 * at the time of closure? Then we must act when they replace
-	 * the engines!
-	 */
-
-	gem_context_set_persistence(i915, param.ctx_id, false);
-
-	gem_context_set_param(i915, &param);
-	spin = igt_spin_new(i915, param.ctx_id,
-			    .flags = IGT_SPIN_NO_PREEMPTION);
-
-	param.size = 8;
-	gem_context_set_param(i915, &param);
-	gem_context_destroy(i915, param.ctx_id);
-
-	igt_assert_eq(gem_wait(i915, spin->handle, &timeout), 0);
-
-	igt_spin_free(i915, spin);
-	gem_quiescent_gpu(i915);
-}
-
 static void do_test(void (*test)(int i915, unsigned int engine),
 		    int i915, unsigned int engine,
 		    const char *name)
@@ -1422,31 +1237,6 @@ igt_main
 			smoketest(i915);
 	}
 
-	/* Check interactions with set-engines */
-	igt_subtest_group {
-		const struct intel_execution_engine2 *e;
-
-		igt_fixture
-			gem_require_contexts(i915);
-
-		igt_subtest_with_dynamic("replace") {
-			__for_each_physical_engine(i915, e) {
-				igt_dynamic_f("%s", e->name)
-					replace_engines(i915, e);
-			}
-		}
-
-		igt_subtest_with_dynamic("replace-hostile") {
-			__for_each_physical_engine(i915, e) {
-				igt_dynamic_f("%s", e->name)
-					replace_engines_hostile(i915, e);
-			}
-		}
-
-		igt_subtest("close-replace-race")
-			close_replace_race(i915);
-	}
-
 	igt_fixture {
 		close(i915);
 	}
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
