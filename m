Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4536EC7C
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:31:03 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id e1so460912plh.8
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:31:03 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:30:02 -0500
Message-Id: <20210609043035.102359-17-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 16/93] lib/dummyload: Rename
 igt_spin_factory::ctx to ctx_id
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
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 lib/igt_dummyload.c            |  6 +++---
 lib/igt_dummyload.h            |  4 ++--
 lib/igt_gt.c                   |  2 +-
 tests/i915/gem_ctx_engines.c   |  6 +++---
 tests/i915/gem_ctx_exec.c      |  2 +-
 tests/i915/gem_ctx_isolation.c | 18 +++++++++---------
 tests/i915/gem_ctx_shared.c    | 16 ++++++++--------
 tests/i915/gem_eio.c           |  2 +-
 tests/i915/gem_exec_balancer.c | 26 +++++++++++++-------------
 tests/i915/gem_exec_latency.c  |  2 +-
 tests/i915/gem_exec_nop.c      |  2 +-
 tests/i915/gem_exec_schedule.c | 26 +++++++++++++-------------
 tests/i915/gem_spin_batch.c    |  2 +-
 tests/i915/gem_sync.c          |  2 +-
 tests/i915/gem_vm_create.c     |  4 ++--
 tests/i915/gem_watchdog.c      |  2 +-
 tests/i915/gem_workarounds.c   |  2 +-
 tests/i915/perf_pmu.c          |  4 ++--
 18 files changed, 64 insertions(+), 64 deletions(-)

diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index 1a3abb5d..784714d6 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -127,7 +127,7 @@ emit_recursive_batch(igt_spin_t *spin,
 	if (opts->engine == ALL_ENGINES) {
 		struct intel_execution_engine2 *engine;
 
-		for_each_context_engine(fd, opts->ctx, engine) {
+		for_each_context_engine(fd, opts->ctx_id, engine) {
 			if (opts->flags & IGT_SPIN_POLL_RUN &&
 			    !gem_class_can_store_dword(fd, engine->class))
 				continue;
@@ -325,7 +325,7 @@ emit_recursive_batch(igt_spin_t *spin,
 
 	execbuf->buffers_ptr =
 	       	to_user_pointer(obj + (2 - execbuf->buffer_count));
-	execbuf->rsvd1 = opts->ctx;
+	execbuf->rsvd1 = opts->ctx_id;
 
 	if (opts->flags & IGT_SPIN_FENCE_OUT)
 		execbuf->flags |= I915_EXEC_FENCE_OUT;
@@ -423,7 +423,7 @@ igt_spin_factory(int fd, const struct igt_spin_factory *opts)
 		int class;
 
 		if (!gem_context_lookup_engine(fd, opts->engine,
-					       opts->ctx, &e)) {
+					       opts->ctx_id, &e)) {
 			class = e.class;
 		} else {
 			gem_require_ring(fd, opts->engine);
diff --git a/lib/igt_dummyload.h b/lib/igt_dummyload.h
index f3d7c128..ad1ce28c 100644
--- a/lib/igt_dummyload.h
+++ b/lib/igt_dummyload.h
@@ -61,7 +61,7 @@ typedef struct igt_spin {
 
 /**
  * igt_spin_factory_t:
- * @ctx: GEM context handle
+ * @ctx_id: GEM context handle
  * @dependency: GEM object to depend on
  * @engine: Flags describing the engine to execute on
  * @flags: Set of IGT_SPIN_* flags
@@ -70,7 +70,7 @@ typedef struct igt_spin {
  * A factory struct which contains creation parameters for an igt_spin_t.
  */
 typedef struct igt_spin_factory {
-	uint32_t ctx;
+	uint32_t ctx_id;
 	uint32_t dependency;
 	unsigned int engine;
 	unsigned int flags;
diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index b1415178..c049477d 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -298,7 +298,7 @@ igt_hang_t igt_hang_ctx(int fd, uint32_t ctx, int ring, unsigned flags)
 		context_set_ban(fd, ctx, 0);
 
 	spin = __igt_spin_new(fd,
-			      .ctx = ctx,
+			      .ctx_id = ctx,
 			      .engine = ring,
 			      .flags = IGT_SPIN_NO_PREEMPTION);
 
diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index 02658c4f..f03e3153 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -337,7 +337,7 @@ static void execute_one(int i915)
 	igt_spin_t *spin;
 
 	/* Prewarm the spinner */
-	spin = igt_spin_new(i915, .ctx = param.ctx_id,
+	spin = igt_spin_new(i915, .ctx_id = param.ctx_id,
 			    .flags = (IGT_SPIN_NO_PREEMPTION |
 				      IGT_SPIN_POLL_RUN));
 
@@ -440,7 +440,7 @@ static void execute_oneforall(int i915)
 			igt_spin_t *spin;
 
 			spin = __igt_spin_new(i915,
-					      .ctx = param.ctx_id,
+					      .ctx_id = param.ctx_id,
 					      .engine = i);
 
 			busy.handle = spin->handle;
@@ -481,7 +481,7 @@ static void execute_allforone(int i915)
 		igt_spin_t *spin;
 
 		spin = __igt_spin_new(i915,
-				      .ctx = param.ctx_id,
+				      .ctx_id = param.ctx_id,
 				      .engine = i++);
 
 		busy.handle = spin->handle;
diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
index 2e72bf71..a8616f95 100644
--- a/tests/i915/gem_ctx_exec.c
+++ b/tests/i915/gem_ctx_exec.c
@@ -185,7 +185,7 @@ static void norecovery(int i915)
 		igt_assert_eq(param.value, pass);
 
 		spin = __igt_spin_new(i915,
-				      .ctx = param.ctx_id,
+				      .ctx_id = param.ctx_id,
 				      .flags = IGT_SPIN_POLL_RUN);
 		igt_spin_busywait_until_started(spin);
 
diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
index 4277df34..ff5d3718 100644
--- a/tests/i915/gem_ctx_isolation.c
+++ b/tests/i915/gem_ctx_isolation.c
@@ -630,7 +630,7 @@ static void nonpriv(int fd,
 
 		tmpl_regs(fd, ctx, e, tmpl, values[v]);
 
-		spin = igt_spin_new(fd, .ctx = ctx, .engine = e->flags);
+		spin = igt_spin_new(fd, .ctx_id = ctx, .engine = e->flags);
 
 		igt_debug("%s[%d]: Setting all registers to 0x%08x\n",
 			  __func__, v, values[v]);
@@ -642,12 +642,12 @@ static void nonpriv(int fd,
 
 			/* Explicit sync to keep the switch between write/read */
 			syncpt = igt_spin_new(fd,
-					      .ctx = ctx,
+					      .ctx_id = ctx,
 					      .engine = e->flags,
 					      .flags = IGT_SPIN_FENCE_OUT);
 
 			dirt = igt_spin_new(fd,
-					    .ctx = sw,
+					    .ctx_id = sw,
 					    .engine = e->flags,
 					    .fence = syncpt->out_fence,
 					    .flags = (IGT_SPIN_FENCE_IN |
@@ -655,7 +655,7 @@ static void nonpriv(int fd,
 			igt_spin_free(fd, syncpt);
 
 			syncpt = igt_spin_new(fd,
-					      .ctx = ctx,
+					      .ctx_id = ctx,
 					      .engine = e->flags,
 					      .fence = dirt->out_fence,
 					      .flags = IGT_SPIN_FENCE_IN);
@@ -709,7 +709,7 @@ static void isolation(int fd,
 		ctx[0] = gem_context_clone_with_engines(fd, 0);
 		regs[0] = read_regs(fd, ctx[0], e, flags);
 
-		spin = igt_spin_new(fd, .ctx = ctx[0], .engine = e->flags);
+		spin = igt_spin_new(fd, .ctx_id = ctx[0], .engine = e->flags);
 
 		if (flags & DIRTY1) {
 			igt_debug("%s[%d]: Setting all registers of ctx 0 to 0x%08x\n",
@@ -777,7 +777,7 @@ static uint32_t create_reset_context(int i915)
 static void inject_reset_context(int fd, const struct intel_execution_engine2 *e)
 {
 	struct igt_spin_factory opts = {
-		.ctx = create_reset_context(fd),
+		.ctx_id = create_reset_context(fd),
 		.engine = e->flags,
 		.flags = IGT_SPIN_FAST,
 	};
@@ -802,7 +802,7 @@ static void inject_reset_context(int fd, const struct intel_execution_engine2 *e
 	igt_force_gpu_reset(fd);
 
 	igt_spin_free(fd, spin);
-	gem_context_destroy(fd, opts.ctx);
+	gem_context_destroy(fd, opts.ctx_id);
 }
 
 static void preservation(int fd,
@@ -826,7 +826,7 @@ static void preservation(int fd,
 	gem_quiescent_gpu(fd);
 
 	ctx[num_values] = gem_context_clone_with_engines(fd, 0);
-	spin = igt_spin_new(fd, .ctx = ctx[num_values], .engine = e->flags);
+	spin = igt_spin_new(fd, .ctx_id = ctx[num_values], .engine = e->flags);
 	regs[num_values][0] = read_regs(fd, ctx[num_values], e, flags);
 	for (int v = 0; v < num_values; v++) {
 		ctx[v] = gem_context_clone_with_engines(fd, 0);
@@ -866,7 +866,7 @@ static void preservation(int fd,
 		break;
 	}
 
-	spin = igt_spin_new(fd, .ctx = ctx[num_values], .engine = e->flags);
+	spin = igt_spin_new(fd, .ctx_id = ctx[num_values], .engine = e->flags);
 	for (int v = 0; v < num_values; v++)
 		regs[v][1] = read_regs(fd, ctx[v], e, flags);
 	regs[num_values][1] = read_regs(fd, ctx[num_values], e, flags);
diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
index c7e957c4..aedf389c 100644
--- a/tests/i915/gem_ctx_shared.c
+++ b/tests/i915/gem_ctx_shared.c
@@ -125,8 +125,8 @@ static void disjoint_timelines(int i915)
 	child = gem_context_clone(i915, 0, I915_CONTEXT_CLONE_VM, 0);
 	plug = igt_cork_plug(&cork, i915);
 
-	spin[0] = __igt_spin_new(i915, .ctx = 0, .dependency = plug);
-	spin[1] = __igt_spin_new(i915, .ctx = child);
+	spin[0] = __igt_spin_new(i915, .ctx_id = 0, .dependency = plug);
+	spin[1] = __igt_spin_new(i915, .ctx_id = child);
 
 	/* Wait for the second spinner, will hang if stuck behind the first */
 	igt_spin_end(spin[1]);
@@ -389,7 +389,7 @@ static void exec_single_timeline(int i915, unsigned int engine)
 			continue;
 
 		if (spin == NULL) {
-			spin = __igt_spin_new(i915, .ctx = ctx, .engine = e->flags);
+			spin = __igt_spin_new(i915, .ctx_id = ctx, .engine = e->flags);
 		} else {
 			struct drm_i915_gem_execbuffer2 execbuf = {
 				.buffers_ptr = spin->execbuf.buffers_ptr,
@@ -417,7 +417,7 @@ static void exec_single_timeline(int i915, unsigned int engine)
 			continue;
 
 		if (spin == NULL) {
-			spin = __igt_spin_new(i915, .ctx = ctx, .engine = e->flags);
+			spin = __igt_spin_new(i915, .ctx_id = ctx, .engine = e->flags);
 		} else {
 			struct drm_i915_gem_execbuffer2 execbuf = {
 				.buffers_ptr = spin->execbuf.buffers_ptr,
@@ -511,11 +511,11 @@ static void unplug_show_queue(int i915, struct igt_cork *c, unsigned int engine)
 
 	for (int n = 0; n < ARRAY_SIZE(spin); n++) {
 		const struct igt_spin_factory opts = {
-			.ctx = create_highest_priority(i915),
+			.ctx_id = create_highest_priority(i915),
 			.engine = engine,
 		};
 		spin[n] = __igt_spin_factory(i915, &opts);
-		gem_context_destroy(i915, opts.ctx);
+		gem_context_destroy(i915, opts.ctx_id);
 	}
 
 	igt_cork_unplug(c); /* batches will now be queued on the engine */
@@ -593,11 +593,11 @@ static void independent(int i915,
 
 	for (int n = 0; n < ARRAY_SIZE(spin); n++) {
 		const struct igt_spin_factory opts = {
-			.ctx = create_highest_priority(i915),
+			.ctx_id = create_highest_priority(i915),
 			.engine = e->flags,
 		};
 		spin[n] = __igt_spin_factory(i915, &opts);
-		gem_context_destroy(i915, opts.ctx);
+		gem_context_destroy(i915, opts.ctx_id);
 	}
 
 	fence = igt_cork_plug(&cork, i915);
diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index 25d109d6..5cb242a3 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -177,7 +177,7 @@ static int __gem_wait(int fd, uint32_t handle, int64_t timeout)
 static igt_spin_t * __spin_poll(int fd, uint32_t ctx, unsigned long flags)
 {
 	struct igt_spin_factory opts = {
-		.ctx = ctx,
+		.ctx_id = ctx,
 		.engine = flags,
 		.flags = IGT_SPIN_NO_PREEMPTION | IGT_SPIN_FENCE_OUT,
 	};
diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index bf99a1ee..286c11d5 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -531,7 +531,7 @@ static void check_individual_engine(int i915,
 			     I915_PMU_ENGINE_BUSY(ci[idx].engine_class,
 						  ci[idx].engine_instance));
 
-	spin = igt_spin_new(i915, .ctx = ctx, .engine = idx + 1);
+	spin = igt_spin_new(i915, .ctx_id = ctx, .engine = idx + 1);
 	load = measure_load(pmu, 10000);
 	igt_spin_free(i915, spin);
 
@@ -660,13 +660,13 @@ static void bonded(int i915, unsigned int flags)
 			plug = NULL;
 			if (flags & CORK) {
 				plug = __igt_spin_new(i915,
-						      .ctx = master,
+						      .ctx_id = master,
 						      .engine = bond,
 						      .dependency = igt_cork_plug(&cork, i915));
 			}
 
 			spin = __igt_spin_new(i915,
-					      .ctx = master,
+					      .ctx_id = master,
 					      .engine = bond,
 					      .flags = IGT_SPIN_FENCE_OUT);
 
@@ -807,7 +807,7 @@ static void bonded_slice(int i915)
 		set_load_balancer(i915, ctx, siblings, count, NULL);
 
 		spin = __igt_spin_new(i915,
-				      .ctx = ctx,
+				      .ctx_id = ctx,
 				      .flags = (IGT_SPIN_NO_PREEMPTION |
 						IGT_SPIN_POLL_RUN));
 		igt_spin_end(spin); /* we just want its address for later */
@@ -832,7 +832,7 @@ static void bonded_slice(int i915)
 
 			while (!READ_ONCE(*stop)) {
 				spin = igt_spin_new(i915,
-						    .ctx = ctx,
+						    .ctx_id = ctx,
 						    .engine = (1 + rand() % count),
 						    .flags = IGT_SPIN_POLL_RUN);
 				igt_spin_busywait_until_started(spin);
@@ -893,7 +893,7 @@ static void __bonded_chain(int i915, uint32_t ctx,
 		if (priorities[i] < 0)
 			gem_context_set_priority(i915, ctx, priorities[i]);
 		spin = igt_spin_new(i915,
-				    .ctx = ctx,
+				    .ctx_id = ctx,
 				    .engine = 1,
 				    .flags = (IGT_SPIN_POLL_RUN |
 					      IGT_SPIN_FENCE_OUT));
@@ -972,7 +972,7 @@ static void __bonded_chain_inv(int i915, uint32_t ctx,
 		if (priorities[i] < 0)
 			gem_context_set_priority(i915, ctx, priorities[i]);
 		spin = igt_spin_new(i915,
-				    .ctx = ctx,
+				    .ctx_id = ctx,
 				    .engine = 1,
 				    .flags = (IGT_SPIN_POLL_RUN |
 					      IGT_SPIN_FENCE_OUT));
@@ -1839,7 +1839,7 @@ static void __bonded_early(int i915, uint32_t ctx,
 
 	/* A: spin forever on engine 1 */
 	spin = igt_spin_new(i915,
-			    .ctx = ctx,
+			    .ctx_id = ctx,
 			    .engine = (flags & VIRTUAL_ENGINE) ? 0 : 1,
 			    .flags = IGT_SPIN_NO_PREEMPTION);
 
@@ -1954,10 +1954,10 @@ static void busy(int i915)
 		free(ci);
 
 		spin[0] = __igt_spin_new(i915,
-					 .ctx = ctx,
+					 .ctx_id = ctx,
 					 .flags = IGT_SPIN_POLL_RUN);
 		spin[1] = __igt_spin_new(i915,
-					 .ctx = ctx,
+					 .ctx_id = ctx,
 					 .dependency = scratch);
 
 		igt_spin_busywait_until_started(spin[0]);
@@ -2056,7 +2056,7 @@ static void full(int i915, unsigned int flags)
 			ctx = load_balancer_create(i915, ci, count);
 
 			if (spin == NULL) {
-				spin = __igt_spin_new(i915, .ctx = ctx);
+				spin = __igt_spin_new(i915, .ctx_id = ctx);
 			} else {
 				struct drm_i915_gem_execbuffer2 eb = {
 					.buffers_ptr = spin->execbuf.buffers_ptr,
@@ -2603,7 +2603,7 @@ static void semaphore(int i915)
 		for (int i = 0; i < count; i++) {
 			set_load_balancer(i915, block[i], ci, count, NULL);
 			spin[i] = __igt_spin_new(i915,
-						 .ctx = block[i],
+						 .ctx_id = block[i],
 						 .dependency = scratch);
 		}
 
@@ -2920,7 +2920,7 @@ static void __fairslice(int i915,
 	for (int i = 0; i < ARRAY_SIZE(ctx); i++) {
 		ctx[i] = load_balancer_create(i915, ci, count);
 		if (spin == NULL) {
-			spin = __igt_spin_new(i915, .ctx = ctx[i]);
+			spin = __igt_spin_new(i915, .ctx_id = ctx[i]);
 		} else {
 			struct drm_i915_gem_execbuffer2 eb = {
 				.buffer_count = 1,
diff --git a/tests/i915/gem_exec_latency.c b/tests/i915/gem_exec_latency.c
index 158faee5..d31e82bc 100644
--- a/tests/i915/gem_exec_latency.c
+++ b/tests/i915/gem_exec_latency.c
@@ -319,7 +319,7 @@ static void latency_from_ring(int fd,
 
 		if (flags & PREEMPT)
 			spin = __igt_spin_new(fd,
-					      .ctx = ctx[0],
+					      .ctx_id = ctx[0],
 					      .engine = e->flags);
 
 		if (flags & CORK) {
diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
index acdf6bde..e75ccb56 100644
--- a/tests/i915/gem_exec_nop.c
+++ b/tests/i915/gem_exec_nop.c
@@ -918,7 +918,7 @@ static void preempt(int fd, uint32_t handle,
 	intel_detect_and_clear_missed_interrupts(fd);
 
 	count = 0;
-	spin = __igt_spin_new(fd, .ctx = ctx[0], .engine = e->flags);
+	spin = __igt_spin_new(fd, .ctx_id = ctx[0], .engine = e->flags);
 	clock_gettime(CLOCK_MONOTONIC, &start);
 	do {
 		gem_execbuf(fd, &execbuf);
diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index e205f272..fe3b8d29 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -206,11 +206,11 @@ static void unplug_show_queue(int fd, struct igt_cork *c, unsigned int engine)
 
 	for (int n = 0; n < max; n++) {
 		const struct igt_spin_factory opts = {
-			.ctx = create_highest_priority(fd),
+			.ctx_id = create_highest_priority(fd),
 			.engine = engine,
 		};
 		spin[n] = __igt_spin_factory(fd, &opts);
-		gem_context_destroy(fd, opts.ctx);
+		gem_context_destroy(fd, opts.ctx_id);
 	}
 
 	igt_cork_unplug(c); /* batches will now be queued on the engine */
@@ -637,7 +637,7 @@ static void lateslice(int i915, unsigned int engine, unsigned long flags)
 	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
 
 	ctx = gem_context_create(i915);
-	spin[0] = igt_spin_new(i915, .ctx = ctx, .engine = engine,
+	spin[0] = igt_spin_new(i915, .ctx_id = ctx, .engine = engine,
 			       .flags = (IGT_SPIN_POLL_RUN |
 					 IGT_SPIN_FENCE_OUT |
 					 flags));
@@ -646,7 +646,7 @@ static void lateslice(int i915, unsigned int engine, unsigned long flags)
 	igt_spin_busywait_until_started(spin[0]);
 
 	ctx = gem_context_create(i915);
-	spin[1] = igt_spin_new(i915, .ctx = ctx, .engine = engine,
+	spin[1] = igt_spin_new(i915, .ctx_id = ctx, .engine = engine,
 			       .fence = spin[0]->out_fence,
 			       .flags = (IGT_SPIN_POLL_RUN |
 					 IGT_SPIN_FENCE_IN |
@@ -663,7 +663,7 @@ static void lateslice(int i915, unsigned int engine, unsigned long flags)
 	 */
 
 	ctx = gem_context_create(i915);
-	spin[2] = igt_spin_new(i915, .ctx = ctx, .engine = engine,
+	spin[2] = igt_spin_new(i915, .ctx_id = ctx, .engine = engine,
 			       .flags = IGT_SPIN_POLL_RUN | flags);
 	gem_context_destroy(i915, ctx);
 
@@ -762,7 +762,7 @@ static void submit_slice(int i915,
 		engines.engines[0].engine_class = e->class;
 		engines.engines[0].engine_instance = e->instance;
 		gem_context_set_param(i915, &param);
-		spin = igt_spin_new(i915, .ctx = param.ctx_id,
+		spin = igt_spin_new(i915, .ctx_id = param.ctx_id,
 				    .fence = fence,
 				    .flags =
 				    IGT_SPIN_POLL_RUN |
@@ -906,7 +906,7 @@ static void semaphore_codependency(int i915, unsigned long flags)
 
 		task[i].xcs =
 			__igt_spin_new(i915,
-				       .ctx = ctx,
+				       .ctx_id = ctx,
 				       .engine = e->flags,
 				       .flags = IGT_SPIN_POLL_RUN | flags);
 		igt_spin_busywait_until_started(task[i].xcs);
@@ -914,7 +914,7 @@ static void semaphore_codependency(int i915, unsigned long flags)
 		/* Common rcs tasks will be queued in FIFO */
 		task[i].rcs =
 			__igt_spin_new(i915,
-				       .ctx = ctx,
+				       .ctx_id = ctx,
 				       .engine = 0,
 				       .dependency = task[i].xcs->handle);
 
@@ -1400,7 +1400,7 @@ static void preempt(int fd, const struct intel_execution_engine2 *e, unsigned fl
 			gem_context_set_priority(fd, ctx[LO], MIN_PRIO);
 		}
 		spin[n] = __igt_spin_new(fd,
-					 .ctx = ctx[LO],
+					 .ctx_id = ctx[LO],
 					 .engine = e->flags,
 					 .flags = flags & USERPTR ? IGT_SPIN_USERPTR : 0);
 		igt_debug("spin[%d].handle=%d\n", n, spin[n]->handle);
@@ -1436,7 +1436,7 @@ static igt_spin_t *__noise(int fd, uint32_t ctx, int prio, igt_spin_t *spin)
 	__for_each_physical_engine(fd, e) {
 		if (spin == NULL) {
 			spin = __igt_spin_new(fd,
-					      .ctx = ctx,
+					      .ctx_id = ctx,
 					      .engine = e->flags);
 		} else {
 			struct drm_i915_gem_execbuffer2 eb = {
@@ -1715,7 +1715,7 @@ static void preempt_self(int fd, unsigned ring)
 	gem_context_set_priority(fd, ctx[HI], MIN_PRIO);
 	__for_each_physical_engine(fd, e) {
 		spin[n] = __igt_spin_new(fd,
-					 .ctx = ctx[NOISE],
+					 .ctx_id = ctx[NOISE],
 					 .engine = e->flags);
 		store_dword(fd, ctx[HI], e->flags,
 			    result, (n + 1)*sizeof(uint32_t), n + 1,
@@ -1763,7 +1763,7 @@ static void preemptive_hang(int fd, const struct intel_execution_engine2 *e)
 		gem_context_set_priority(fd, ctx[LO], MIN_PRIO);
 
 		spin[n] = __igt_spin_new(fd,
-					 .ctx = ctx[LO],
+					 .ctx_id = ctx[LO],
 					 .engine = e->flags);
 
 		gem_context_destroy(fd, ctx[LO]);
@@ -2748,7 +2748,7 @@ static void fairslice(int i915,
 		ctx[i] = gem_context_clone_with_engines(i915, 0);
 		if (spin == NULL) {
 			spin = __igt_spin_new(i915,
-					      .ctx = ctx[i],
+					      .ctx_id = ctx[i],
 					      .engine = e->flags,
 					      .flags = flags);
 		} else {
diff --git a/tests/i915/gem_spin_batch.c b/tests/i915/gem_spin_batch.c
index 2ed601a6..db0af018 100644
--- a/tests/i915/gem_spin_batch.c
+++ b/tests/i915/gem_spin_batch.c
@@ -145,7 +145,7 @@ static void spin_all(int i915, unsigned int flags)
 
 		/* Prevent preemption so only one is allowed on each engine */
 		spin = igt_spin_new(i915,
-				    .ctx = ctx,
+				    .ctx_id = ctx,
 				    .engine = e->flags,
 				    .flags = (IGT_SPIN_POLL_RUN |
 					      IGT_SPIN_NO_PREEMPTION));
diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
index e1b3ab7d..ae41b6bb 100644
--- a/tests/i915/gem_sync.c
+++ b/tests/i915/gem_sync.c
@@ -1110,7 +1110,7 @@ preempt(int fd, unsigned ring, int num_children, int timeout)
 		do {
 			igt_spin_t *spin =
 				__igt_spin_new(fd,
-					       .ctx = ctx[0],
+					       .ctx_id = ctx[0],
 					       .engine = execbuf.flags);
 
 			do {
diff --git a/tests/i915/gem_vm_create.c b/tests/i915/gem_vm_create.c
index 5f982d4d..70b43dc6 100644
--- a/tests/i915/gem_vm_create.c
+++ b/tests/i915/gem_vm_create.c
@@ -364,7 +364,7 @@ static void async_destroy(int i915)
 	int err;
 
 	spin[0] = igt_spin_new(i915,
-			       .ctx = arg.ctx_id,
+			       .ctx_id = arg.ctx_id,
 			       .flags = IGT_SPIN_POLL_RUN);
 	igt_spin_busywait_until_started(spin[0]);
 
@@ -373,7 +373,7 @@ static void async_destroy(int i915)
 		err = 0;
 	igt_assert_eq(err, 0);
 
-	spin[1] = __igt_spin_new(i915, .ctx = arg.ctx_id);
+	spin[1] = __igt_spin_new(i915, .ctx_id = arg.ctx_id);
 
 	igt_spin_end(spin[0]);
 	gem_sync(i915, spin[0]->handle);
diff --git a/tests/i915/gem_watchdog.c b/tests/i915/gem_watchdog.c
index 286002bd..2443d5c5 100644
--- a/tests/i915/gem_watchdog.c
+++ b/tests/i915/gem_watchdog.c
@@ -306,7 +306,7 @@ static void virtual(int i915)
 			set_load_balancer(i915, ctx[i], ci, count, NULL);
 
 			spin[i] = igt_spin_new(i915,
-					       .ctx = ctx[i],
+					       .ctx_id = ctx[i],
 					       .flags = spin_flags());
 			i++;
 		}
diff --git a/tests/i915/gem_workarounds.c b/tests/i915/gem_workarounds.c
index 8312e20a..9cdc2437 100644
--- a/tests/i915/gem_workarounds.c
+++ b/tests/i915/gem_workarounds.c
@@ -136,7 +136,7 @@ static int workaround_fail_count(int i915, uint32_t ctx)
 
 	gem_set_domain(i915, obj[0].handle, I915_GEM_DOMAIN_CPU, 0);
 
-	spin = igt_spin_new(i915, .ctx = ctx, .flags = IGT_SPIN_POLL_RUN);
+	spin = igt_spin_new(i915, .ctx_id = ctx, .flags = IGT_SPIN_POLL_RUN);
 	igt_spin_busywait_until_started(spin);
 
 	fw = igt_open_forcewake_handle(i915);
diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 172dd161..aa297bf1 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -176,7 +176,7 @@ static igt_spin_t * __spin_poll(int fd, uint32_t ctx,
 				const struct intel_execution_engine2 *e)
 {
 	struct igt_spin_factory opts = {
-		.ctx = ctx,
+		.ctx_id = ctx,
 		.engine = e->flags,
 	};
 
@@ -382,7 +382,7 @@ busy_double_start(int gem_fd, const struct intel_execution_engine2 *e)
 	spin[0] = __spin_sync(gem_fd, 0, e);
 	usleep(500e3);
 	spin[1] = __igt_spin_new(gem_fd,
-				 .ctx = ctx,
+				 .ctx_id = ctx,
 				 .engine = e->flags);
 
 	/*
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
