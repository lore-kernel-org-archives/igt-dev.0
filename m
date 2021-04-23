Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CD86EC85
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 21:50:37 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id d10so36060004pgf.12
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 14:50:37 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Apr 2021 16:48:23 -0500
Message-Id: <20210423214853.876911-60-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
References: <20210423214853.876911-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 59/89] tests/i915/gem_ctx_persistence:
 Convert to intel_ctx_t
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 lib/intel_ctx.c                  |  13 ++
 lib/intel_ctx.h                  |   2 +
 tests/i915/gem_ctx_persistence.c | 223 ++++++++++++++++---------------
 3 files changed, 133 insertions(+), 105 deletions(-)

diff --git a/lib/intel_ctx.c b/lib/intel_ctx.c
index 271bb812..f6b147e0 100644
--- a/lib/intel_ctx.c
+++ b/lib/intel_ctx.c
@@ -102,6 +102,7 @@ __context_create_cfg(int fd, const intel_ctx_cfg_t *cfg, uint32_t *ctx_id)
 	uint64_t ext_root = 0;
 	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, GEM_MAX_ENGINES);
 	struct drm_i915_gem_context_create_ext_setparam engines_param, vm_param;
+	struct drm_i915_gem_context_create_ext_setparam persist_param;
 	uint32_t i;
 
 	if (cfg->vm) {
@@ -117,6 +118,18 @@ __context_create_cfg(int fd, const intel_ctx_cfg_t *cfg, uint32_t *ctx_id)
 		add_user_ext(&ext_root, &vm_param.base);
 	}
 
+	if (cfg->nopersist) {
+		persist_param = (struct drm_i915_gem_context_create_ext_setparam) {
+			.base = {
+				.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
+			},
+			.param = {
+				.param = I915_CONTEXT_PARAM_PERSISTENCE,
+			},
+		};
+		add_user_ext(&ext_root, &persist_param.base);
+	}
+
 	if (cfg->num_engines) {
 		memset(&engines, 0, sizeof(engines));
 		for (i = 0; i < cfg->num_engines; i++)
diff --git a/lib/intel_ctx.h b/lib/intel_ctx.h
index 79bc1154..06a14302 100644
--- a/lib/intel_ctx.h
+++ b/lib/intel_ctx.h
@@ -34,6 +34,7 @@
  * intel_ctx_cfg_t:
  * @flags: Context create flags
  * @vm: VM to inherit or 0 for using a per-context VM
+ * @nopersist: set I915_CONTEXT_PARAM_PERSISTENCE to 0
  * @num_engines: Number of client-specified engines or 0 for legacy mode
  * @engines: Client-specified engines
  *
@@ -42,6 +43,7 @@
 typedef struct intel_ctx_cfg {
 	uint32_t flags;
 	uint32_t vm;
+	bool nopersist;
 	unsigned int num_engines;
 	struct i915_engine_class_instance engines[GEM_MAX_ENGINES];
 } intel_ctx_cfg_t;
diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index 59077cc0..142bac28 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -147,24 +147,32 @@ static void test_idempotent(int i915)
 	igt_assert_eq(p.value, expected);
 }
 
-static void test_persistence(int i915, unsigned int engine)
+static const intel_ctx_t *
+ctx_create_persistence(int i915, const intel_ctx_cfg_t *base_cfg, bool persist)
+{
+	intel_ctx_cfg_t cfg = *base_cfg;
+	cfg.nopersist = !persist;
+	return intel_ctx_create(i915, &cfg);
+}
+
+static void test_persistence(int i915, const intel_ctx_cfg_t *cfg,
+			     unsigned int engine)
 {
 	igt_spin_t *spin;
 	int64_t timeout;
-	uint32_t ctx;
+	const intel_ctx_t *ctx;
 
 	/*
 	 * Default behaviour are contexts remain alive until their last active
 	 * request is retired -- no early termination.
 	 */
 
-	ctx = gem_context_clone_with_engines(i915, 0);
-	gem_context_set_persistence(i915, ctx, true);
+	ctx = ctx_create_persistence(i915, cfg, true);
 
-	spin = igt_spin_new(i915, ctx,
+	spin = igt_spin_new(i915, .ctx = ctx,
 			    .engine = engine,
 			    .flags = IGT_SPIN_FENCE_OUT);
-	gem_context_destroy(i915, ctx);
+	intel_ctx_destroy(i915, ctx);
 
 	timeout = reset_timeout_ms * NSEC_PER_MSEC;
 	igt_assert_eq(gem_wait(i915, spin->handle, &timeout), -ETIME);
@@ -178,24 +186,24 @@ static void test_persistence(int i915, unsigned int engine)
 	igt_spin_free(i915, spin);
 }
 
-static void test_nonpersistent_cleanup(int i915, unsigned int engine)
+static void test_nonpersistent_cleanup(int i915, const intel_ctx_cfg_t *cfg,
+				       unsigned int engine)
 {
 	int64_t timeout = reset_timeout_ms * NSEC_PER_MSEC;
 	igt_spin_t *spin;
-	uint32_t ctx;
+	const intel_ctx_t *ctx;
 
 	/*
 	 * A nonpersistent context is terminated immediately upon closure,
 	 * any inflight request is cancelled.
 	 */
 
-	ctx = gem_context_clone_with_engines(i915, 0);
-	gem_context_set_persistence(i915, ctx, false);
+	ctx = ctx_create_persistence(i915, cfg, false);
 
-	spin = igt_spin_new(i915, ctx,
+	spin = igt_spin_new(i915, .ctx = ctx,
 			    .engine = engine,
 			    .flags = IGT_SPIN_FENCE_OUT);
-	gem_context_destroy(i915, ctx);
+	intel_ctx_destroy(i915, ctx);
 
 	igt_assert_eq(gem_wait(i915, spin->handle, &timeout), 0);
 	igt_assert_eq(sync_fence_status(spin->out_fence), -EIO);
@@ -203,7 +211,8 @@ static void test_nonpersistent_cleanup(int i915, unsigned int engine)
 	igt_spin_free(i915, spin);
 }
 
-static void test_nonpersistent_mixed(int i915, unsigned int engine)
+static void test_nonpersistent_mixed(int i915, const intel_ctx_cfg_t *cfg,
+				     unsigned int engine)
 {
 	int fence[3];
 
@@ -215,15 +224,14 @@ static void test_nonpersistent_mixed(int i915, unsigned int engine)
 
 	for (int i = 0; i < ARRAY_SIZE(fence); i++) {
 		igt_spin_t *spin;
-		uint32_t ctx;
+		const intel_ctx_t *ctx;
 
-		ctx = gem_context_clone_with_engines(i915, 0);
-		gem_context_set_persistence(i915, ctx, i & 1);
+		ctx = ctx_create_persistence(i915, cfg, i & 1);
 
-		spin = igt_spin_new(i915, ctx,
+		spin = igt_spin_new(i915, .ctx = ctx,
 				    .engine = engine,
 				    .flags = IGT_SPIN_FENCE_OUT);
-		gem_context_destroy(i915, ctx);
+		intel_ctx_destroy(i915, ctx);
 
 		fence[i] = spin->out_fence;
 	}
@@ -236,11 +244,12 @@ static void test_nonpersistent_mixed(int i915, unsigned int engine)
 	igt_assert_eq(sync_fence_wait(fence[1], 0), -ETIME);
 }
 
-static void test_nonpersistent_hostile(int i915, unsigned int engine)
+static void test_nonpersistent_hostile(int i915, const intel_ctx_cfg_t *cfg,
+				       unsigned int engine)
 {
 	int64_t timeout = reset_timeout_ms * NSEC_PER_MSEC;
 	igt_spin_t *spin;
-	uint32_t ctx;
+	const intel_ctx_t *ctx;
 
 	/*
 	 * If we cannot cleanly cancel the non-persistent context on closure,
@@ -248,24 +257,24 @@ static void test_nonpersistent_hostile(int i915, unsigned int engine)
 	 * the requests and cleanup the context.
 	 */
 
-	ctx = gem_context_clone_with_engines(i915, 0);
-	gem_context_set_persistence(i915, ctx, false);
+	ctx = ctx_create_persistence(i915, cfg, false);
 
-	spin = igt_spin_new(i915, ctx,
+	spin = igt_spin_new(i915, .ctx = ctx,
 			    .engine = engine,
 			    .flags = IGT_SPIN_NO_PREEMPTION);
-	gem_context_destroy(i915, ctx);
+	intel_ctx_destroy(i915, ctx);
 
 	igt_assert_eq(gem_wait(i915, spin->handle, &timeout), 0);
 
 	igt_spin_free(i915, spin);
 }
 
-static void test_nonpersistent_hostile_preempt(int i915, unsigned int engine)
+static void test_nonpersistent_hostile_preempt(int i915, const intel_ctx_cfg_t *cfg,
+					       unsigned int engine)
 {
 	int64_t timeout = reset_timeout_ms * NSEC_PER_MSEC;
 	igt_spin_t *spin[2];
-	uint32_t ctx;
+	const intel_ctx_t *ctx;
 
 	/*
 	 * Double plus ungood.
@@ -278,24 +287,22 @@ static void test_nonpersistent_hostile_preempt(int i915, unsigned int engine)
 
 	igt_require(gem_scheduler_has_preemption(i915));
 
-	ctx = gem_context_clone_with_engines(i915, 0);
-	gem_context_set_persistence(i915, ctx, true);
-	gem_context_set_priority(i915, ctx, 0);
-	spin[0] = igt_spin_new(i915, ctx,
+	ctx = ctx_create_persistence(i915, cfg, true);
+	gem_context_set_priority(i915, ctx->id, 0);
+	spin[0] = igt_spin_new(i915, .ctx = ctx,
 			       .engine = engine,
 			       .flags = (IGT_SPIN_NO_PREEMPTION |
 					 IGT_SPIN_POLL_RUN));
-	gem_context_destroy(i915, ctx);
+	intel_ctx_destroy(i915, ctx);
 
 	igt_spin_busywait_until_started(spin[0]);
 
-	ctx = gem_context_clone_with_engines(i915, 0);
-	gem_context_set_persistence(i915, ctx, false);
-	gem_context_set_priority(i915, ctx, 1); /* higher priority than 0 */
-	spin[1] = igt_spin_new(i915, ctx,
+	ctx = ctx_create_persistence(i915, cfg, false);
+	gem_context_set_priority(i915, ctx->id, 1); /* higher priority than 0 */
+	spin[1] = igt_spin_new(i915, .ctx = ctx,
 			       .engine = engine,
 			       .flags = IGT_SPIN_NO_PREEMPTION);
-	gem_context_destroy(i915, ctx);
+	intel_ctx_destroy(i915, ctx);
 
 	igt_assert_eq(gem_wait(i915, spin[1]->handle, &timeout), 0);
 
@@ -303,24 +310,24 @@ static void test_nonpersistent_hostile_preempt(int i915, unsigned int engine)
 	igt_spin_free(i915, spin[0]);
 }
 
-static void test_nonpersistent_hang(int i915, unsigned int engine)
+static void test_nonpersistent_hang(int i915, const intel_ctx_cfg_t *cfg,
+				    unsigned int engine)
 {
 	int64_t timeout = reset_timeout_ms * NSEC_PER_MSEC;
 	igt_spin_t *spin;
-	uint32_t ctx;
+	const intel_ctx_t *ctx;
 
 	/*
 	 * The user made a simple mistake and submitted an invalid batch,
 	 * but fortunately under a nonpersistent context. Do we detect it?
 	 */
 
-	ctx = gem_context_clone_with_engines(i915, 0);
-	gem_context_set_persistence(i915, ctx, false);
+	ctx = ctx_create_persistence(i915, cfg, false);
 
-	spin = igt_spin_new(i915, ctx,
+	spin = igt_spin_new(i915, .ctx = ctx,
 			    .engine = engine,
 			    .flags = IGT_SPIN_INVALID_CS);
-	gem_context_destroy(i915, ctx);
+	intel_ctx_destroy(i915, ctx);
 
 	igt_assert_eq(gem_wait(i915, spin->handle, &timeout), 0);
 
@@ -460,14 +467,16 @@ static void test_noheartbeat_many(int i915, int count, unsigned int flags)
 		igt_assert(set_heartbeat(i915, e->full_name, 500));
 
 		for (int n = 0; n < ARRAY_SIZE(spin); n++) {
-			uint32_t ctx;
+			const intel_ctx_t *ctx;
+
+			ctx = intel_ctx_create(i915, NULL);
 
-			ctx = gem_context_create(i915);
-			spin[n] = igt_spin_new(i915, ctx, .engine = eb_ring(e),
+			spin[n] = igt_spin_new(i915, .ctx = ctx,
+					       .engine = eb_ring(e),
 					       .flags = (IGT_SPIN_FENCE_OUT |
 							 IGT_SPIN_POLL_RUN |
 							 flags));
-			gem_context_destroy(i915, ctx);
+			intel_ctx_destroy(i915, ctx);
 		}
 		igt_spin_busywait_until_started(spin[0]);
 
@@ -504,7 +513,7 @@ static void test_noheartbeat_close(int i915, unsigned int flags)
 
 	for_each_physical_ring(e, i915) {
 		igt_spin_t *spin;
-		uint32_t ctx;
+		const intel_ctx_t *ctx;
 		int err;
 
 		if (!set_preempt_timeout(i915, e->full_name, 250))
@@ -513,15 +522,16 @@ static void test_noheartbeat_close(int i915, unsigned int flags)
 		if (!set_heartbeat(i915, e->full_name, 0))
 			continue;
 
-		ctx = gem_context_create(i915);
-		spin = igt_spin_new(i915, ctx, .engine = eb_ring(e),
+		ctx = intel_ctx_create(i915, NULL);
+		spin = igt_spin_new(i915, .ctx = ctx,
+				    .engine = eb_ring(e),
 				    .flags = (IGT_SPIN_FENCE_OUT |
 					      IGT_SPIN_POLL_RUN |
 					      flags));
 		igt_spin_busywait_until_started(spin);
 
 		igt_debug("Testing %s\n", e->full_name);
-		gem_context_destroy(i915, ctx);
+		intel_ctx_destroy(i915, ctx);
 		err = wait_for_status(spin->out_fence, reset_timeout_ms);
 
 		set_heartbeat(i915, e->full_name, 2500);
@@ -578,22 +588,22 @@ static void alarm_handler(int sig)
 {
 }
 
-static void test_nonpersistent_queued(int i915, unsigned int engine)
+static void test_nonpersistent_queued(int i915, const intel_ctx_cfg_t *cfg,
+				      unsigned int engine)
 {
 	struct sigaction old_sa, sa = { .sa_handler = alarm_handler };
 	struct itimerval itv;
 	igt_spin_t *spin;
 	int fence = -1;
-	uint32_t ctx;
+	const intel_ctx_t *ctx;
 
 	/*
 	 * Not only must the immediate batch be cancelled, but
 	 * all pending batches in the context.
 	 */
 
-	ctx = gem_context_clone_with_engines(i915, 0);
-	gem_context_set_persistence(i915, ctx, false);
-	spin = igt_spin_new(i915, ctx,
+	ctx = ctx_create_persistence(i915, cfg, false);
+	spin = igt_spin_new(i915, .ctx = ctx,
 			    .engine = engine,
 			    .flags = IGT_SPIN_FENCE_OUT);
 
@@ -621,7 +631,7 @@ static void test_nonpersistent_queued(int i915, unsigned int engine)
 	setitimer(ITIMER_REAL, &itv, NULL);
 	sigaction(SIGALRM, &old_sa, NULL);
 
-	gem_context_destroy(i915, ctx);
+	intel_ctx_destroy(i915, ctx);
 
 	igt_assert_eq(wait_for_status(spin->out_fence, reset_timeout_ms), -EIO);
 	igt_assert_eq(wait_for_status(fence, reset_timeout_ms), -EIO);
@@ -752,7 +762,8 @@ static void test_userptr(int i915)
 	gem_quiescent_gpu(i915);
 }
 
-static void test_process_mixed(int pfd, unsigned int engine)
+static void test_process_mixed(int pfd, const intel_ctx_cfg_t *cfg,
+			       unsigned int engine)
 {
 	int fence[2], sv[2];
 
@@ -772,13 +783,10 @@ static void test_process_mixed(int pfd, unsigned int engine)
 
 		for (int persists = 0; persists <= 1; persists++) {
 			igt_spin_t *spin;
-			uint32_t ctx;
-
-			ctx = gem_context_create(i915);
-			gem_context_copy_engines(pfd, 0, i915, ctx);
-			gem_context_set_persistence(i915, ctx, persists);
+			const intel_ctx_t *ctx;
 
-			spin = igt_spin_new(i915, ctx,
+			ctx = ctx_create_persistence(i915, cfg, persists);
+			spin = igt_spin_new(i915, .ctx = ctx,
 					    .engine = engine,
 					    .flags = IGT_SPIN_FENCE_OUT);
 
@@ -810,11 +818,12 @@ static void test_process_mixed(int pfd, unsigned int engine)
 }
 
 static void
-test_saturated_hostile(int i915, const struct intel_execution_engine2 *engine)
+test_saturated_hostile(int i915, const intel_ctx_t *base_ctx,
+		       const struct intel_execution_engine2 *engine)
 {
 	const struct intel_execution_engine2 *other;
 	igt_spin_t *spin;
-	uint32_t ctx;
+	const intel_ctx_t *ctx;
 	int fence = -1;
 
 	cleanup(i915);
@@ -831,11 +840,11 @@ test_saturated_hostile(int i915, const struct intel_execution_engine2 *engine)
 	 * reset other users whenever they chose.]
 	 */
 
-	__for_each_physical_engine(i915, other) {
+	for_each_ctx_engine(i915, base_ctx, other) {
 		if (other->flags == engine->flags)
 			continue;
 
-		spin = igt_spin_new(i915,
+		spin = igt_spin_new(i915, .ctx = base_ctx,
 				   .engine = other->flags,
 				   .flags = (IGT_SPIN_NO_PREEMPTION |
 					     IGT_SPIN_FENCE_OUT));
@@ -855,15 +864,14 @@ test_saturated_hostile(int i915, const struct intel_execution_engine2 *engine)
 	}
 	igt_require(fence != -1);
 
-	ctx = gem_context_clone_with_engines(i915, 0);
-	gem_context_set_persistence(i915, ctx, false);
-	spin = igt_spin_new(i915, ctx,
+	ctx = ctx_create_persistence(i915, &base_ctx->cfg, false);
+	spin = igt_spin_new(i915, .ctx = ctx,
 			    .engine = engine->flags,
 			    .flags = (IGT_SPIN_NO_PREEMPTION |
 				      IGT_SPIN_POLL_RUN |
 				      IGT_SPIN_FENCE_OUT));
 	igt_spin_busywait_until_started(spin);
-	gem_context_destroy(i915, ctx);
+	intel_ctx_destroy(i915, ctx);
 
 	/* Hostile request requires a GPU reset to terminate */
 	igt_assert_eq(wait_for_status(spin->out_fence, reset_timeout_ms), -EIO);
@@ -950,7 +958,7 @@ static void test_processes(int i915)
 	gem_quiescent_gpu(i915);
 }
 
-static void __smoker(int i915,
+static void __smoker(int i915, const intel_ctx_cfg_t *cfg,
 		     unsigned int engine,
 		     unsigned int timeout,
 		     int expected)
@@ -958,11 +966,12 @@ static void __smoker(int i915,
 	igt_spin_t *spin;
 	int fence = -1;
 	int fd, extra;
+	const intel_ctx_t *ctx;
 
 	fd = gem_reopen_driver(i915);
-	gem_context_copy_engines(i915, 0, fd, 0);
-	gem_context_set_persistence(fd, 0, expected > 0);
-	spin = igt_spin_new(fd, .engine = engine, .flags = IGT_SPIN_FENCE_OUT);
+	ctx = ctx_create_persistence(fd, cfg, expected > 0);
+	spin = igt_spin_new(fd, .ctx = ctx, .engine = engine,
+			    .flags = IGT_SPIN_FENCE_OUT);
 
 	extra = rand() % 8;
 	while (extra--) {
@@ -974,6 +983,8 @@ static void __smoker(int i915,
 		fence = spin->execbuf.rsvd2 >> 32;
 	}
 
+	intel_ctx_destroy(fd, ctx);
+
 	close(fd);
 	flush_delayed_fput(i915);
 
@@ -990,18 +1001,18 @@ static void __smoker(int i915,
 	igt_spin_free(fd, spin);
 }
 
-static void smoker(int i915,
+static void smoker(int i915, const intel_ctx_cfg_t *cfg,
 		   unsigned int engine,
 		   unsigned int timeout,
 		   unsigned int *ctl)
 {
 	while (!READ_ONCE(*ctl)) {
-		__smoker(i915, engine, timeout, -EIO);
-		__smoker(i915, engine, timeout, 1);
+		__smoker(i915, cfg, engine, timeout, -EIO);
+		__smoker(i915, cfg, engine, timeout, 1);
 	}
 }
 
-static void smoketest(int i915)
+static void smoketest(int i915, const intel_ctx_cfg_t *cfg)
 {
 	const int SMOKE_LOAD_FACTOR = 4;
 	const struct intel_execution_engine2 *e;
@@ -1021,9 +1032,9 @@ static void smoketest(int i915)
 		*ctl = 0;
 
 		igt_debug("Applying load factor: %d\n", i);
-		__for_each_physical_engine(i915, e) {
+		for_each_ctx_cfg_engine(i915, cfg, e) {
 			igt_fork(child, i)
-				smoker(i915,
+				smoker(i915, cfg,
 				       e->flags,
 				       i * reset_timeout_ms,
 				       ctl);
@@ -1038,7 +1049,7 @@ static void smoketest(int i915)
 	gem_quiescent_gpu(i915);
 }
 
-static void many_contexts(int i915)
+static void many_contexts(int i915, const intel_ctx_cfg_t *cfg)
 {
 	const struct intel_execution_engine2 *e;
 	int64_t timeout = NSEC_PER_SEC;
@@ -1059,17 +1070,16 @@ static void many_contexts(int i915)
 	igt_spin_reset(spin);
 
 	igt_until_timeout(30) {
-		__for_each_physical_engine(i915, e) {
-			uint32_t ctx;
+		for_each_ctx_cfg_engine(i915, cfg, e) {
+			const intel_ctx_t *ctx;
 
-			ctx = gem_context_clone_with_engines(i915, 0);
-			gem_context_set_persistence(i915, ctx, false);
+			ctx = ctx_create_persistence(i915, cfg, false);
 
-			spin->execbuf.rsvd1 = ctx;
+			spin->execbuf.rsvd1 = ctx->id;
 			spin->execbuf.flags &= ~63;
 			spin->execbuf.flags |= e->flags;
 			gem_execbuf(i915, &spin->execbuf);
-			gem_context_destroy(i915, ctx);
+			intel_ctx_destroy(i915, ctx);
 		}
 	}
 	igt_debugfs_dump(i915, "i915_engine_info");
@@ -1085,9 +1095,10 @@ static void many_contexts(int i915)
 	gem_quiescent_gpu(i915);
 }
 
-static void do_test(void (*test)(int i915, unsigned int engine),
-		    int i915, unsigned int engine,
-		    const char *name)
+static void do_test(void (*test)(int i915, const intel_ctx_cfg_t *cfg,
+				 unsigned int engine),
+		    int i915, const intel_ctx_cfg_t *cfg,
+		    unsigned int engine, const char *name)
 {
 #define ATTR "preempt_timeout_ms"
 	int timeout = -1;
@@ -1101,7 +1112,7 @@ static void do_test(void (*test)(int i915, unsigned int engine),
 		reset_timeout_ms = 200;
 	}
 
-	test(i915, engine);
+	test(i915, cfg, engine);
 
 	if (timeout != -1) {
 		gem_engine_property_printf(i915, name, ATTR, "%d", timeout);
@@ -1122,7 +1133,8 @@ igt_main
 {
 	struct {
 		const char *name;
-		void (*func)(int fd, unsigned int engine);
+		void (*func)(int fd, const intel_ctx_cfg_t *cfg,
+			     unsigned int engine);
 	} *test, tests[] = {
 		{ "persistence", test_persistence },
 		{ "cleanup", test_nonpersistent_cleanup },
@@ -1134,6 +1146,7 @@ igt_main
 		{ "hang", test_nonpersistent_hang },
 		{ NULL, NULL },
 	};
+	const intel_ctx_t *ctx;
 
 	igt_fixture {
 		i915 = drm_open_driver(DRIVER_INTEL);
@@ -1145,6 +1158,8 @@ igt_main
 		enable_hangcheck(i915);
 		igt_install_exit_handler(exit_handler);
 
+		ctx = intel_ctx_create_all_physical(i915);
+
 		igt_require(has_persistence(i915));
 		igt_allow_hang(i915, 0, 0);
 	}
@@ -1189,18 +1204,16 @@ igt_main
 		for (test = tests; test->name; test++) {
 			igt_subtest_with_dynamic_f("legacy-engines-%s",
 						   test->name) {
+				const intel_ctx_cfg_t empty_cfg = {};
 				for_each_physical_ring(e, i915) {
 					igt_dynamic_f("%s", e->name) {
-						do_test(test->func,
-							i915, eb_ring(e),
+						do_test(test->func, i915,
+							&empty_cfg, eb_ring(e),
 							e->full_name);
 					}
 				}
 			}
 		}
-
-		/* Assert things are under control. */
-		igt_assert(!gem_context_has_engine_map(i915, 0));
 	}
 
 	/* New way of selecting engines. */
@@ -1213,10 +1226,10 @@ igt_main
 
 		for (test = tests; test->name; test++) {
 			igt_subtest_with_dynamic_f("engines-%s", test->name) {
-				__for_each_physical_engine(i915, e) {
+				for_each_ctx_engine(i915, ctx, e) {
 					igt_dynamic_f("%s", e->name) {
-						do_test(test->func,
-							i915, e->flags,
+						do_test(test->func, i915,
+							&ctx->cfg, e->flags,
 							e->name);
 					}
 				}
@@ -1224,17 +1237,17 @@ igt_main
 		}
 
 		igt_subtest_with_dynamic_f("saturated-hostile") {
-			__for_each_physical_engine(i915, e) {
+			for_each_ctx_engine(i915, ctx, e) {
 				igt_dynamic_f("%s", e->name)
-					test_saturated_hostile(i915, e);
+					test_saturated_hostile(i915, ctx, e);
 			}
 		}
 
 		igt_subtest("many-contexts")
-			many_contexts(i915);
+			many_contexts(i915, &ctx->cfg);
 
 		igt_subtest("smoketest")
-			smoketest(i915);
+			smoketest(i915, &ctx->cfg);
 	}
 
 	igt_fixture {
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
