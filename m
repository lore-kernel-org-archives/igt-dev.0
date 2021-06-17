Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3180A6E97E
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 19:15:28 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id h12so5817173pfe.2
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 12:15:28 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 17 Jun 2021 14:14:50 -0500
Message-Id: <20210617191516.577394-4-jason@jlekstrand.net>
In-Reply-To: <20210617191256.577244-1-jason@jlekstrand.net>
References: <20210617191256.577244-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 53/79] tests/i915/gem_exec_balancer: Convert
 to intel_ctx_t
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
 tests/i915/gem_exec_balancer.c | 451 ++++++++++++++-------------------
 1 file changed, 192 insertions(+), 259 deletions(-)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 2f198e89c..4b4cfdea0 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -54,12 +54,6 @@ static size_t sizeof_load_balance(int count)
 			engines[count]);
 }
 
-static size_t sizeof_param_engines(int count)
-{
-	return offsetof(struct i915_context_param_engines,
-			engines[count]);
-}
-
 #define alloca0(sz) ({ size_t sz__ = (sz); memset(alloca(sz__), 0, sz__); })
 
 static bool has_class_instance(int i915, uint16_t class, uint16_t instance)
@@ -124,83 +118,35 @@ static bool has_perf_engines(int i915)
 	return i915_perf_type_id(i915);
 }
 
-static int __set_engines(int i915, uint32_t ctx,
-			 const struct i915_engine_class_instance *ci,
-			 unsigned int count)
-{
-	struct i915_context_param_engines *engines =
-		alloca0(sizeof_param_engines(count));
-	struct drm_i915_gem_context_param p = {
-		.ctx_id = ctx,
-		.param = I915_CONTEXT_PARAM_ENGINES,
-		.size = sizeof_param_engines(count),
-		.value = to_user_pointer(engines)
-	};
-
-	engines->extensions = 0;
-	memcpy(engines->engines, ci, count * sizeof(*ci));
-
-	return __gem_context_set_param(i915, &p);
-}
-
-static void set_engines(int i915, uint32_t ctx,
-			const struct i915_engine_class_instance *ci,
-			unsigned int count)
-{
-	igt_assert_eq(__set_engines(i915, ctx, ci, count), 0);
-}
-
-static int __set_load_balancer(int i915, uint32_t ctx,
-			       const struct i915_engine_class_instance *ci,
-			       unsigned int count,
-			       void *ext)
+static intel_ctx_cfg_t
+ctx_cfg_for_engines(const struct i915_engine_class_instance *ci,
+		    unsigned int count)
 {
-	struct i915_context_engines_load_balance *balancer =
-		alloca0(sizeof_load_balance(count));
-	struct i915_context_param_engines *engines =
-		alloca0(sizeof_param_engines(count + 1));
-	struct drm_i915_gem_context_param p = {
-		.ctx_id = ctx,
-		.param = I915_CONTEXT_PARAM_ENGINES,
-		.size = sizeof_param_engines(count + 1),
-		.value = to_user_pointer(engines)
-	};
-
-	balancer->base.name = I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE;
-	balancer->base.next_extension = to_user_pointer(ext);
-
-	igt_assert(count);
-	balancer->num_siblings = count;
-	memcpy(balancer->engines, ci, count * sizeof(*ci));
+	intel_ctx_cfg_t cfg = { };
+	unsigned int i;
 
-	engines->extensions = to_user_pointer(balancer);
-	engines->engines[0].engine_class =
-		I915_ENGINE_CLASS_INVALID;
-	engines->engines[0].engine_instance =
-		I915_ENGINE_CLASS_INVALID_NONE;
-	memcpy(engines->engines + 1, ci, count * sizeof(*ci));
+	for (i = 0; i < count; i++)
+		cfg.engines[i] = ci[i];
+	cfg.num_engines = count;
 
-	return __gem_context_set_param(i915, &p);
+	return cfg;
 }
 
-static void set_load_balancer(int i915, uint32_t ctx,
-			      const struct i915_engine_class_instance *ci,
-			      unsigned int count,
-			      void *ext)
+static const intel_ctx_t *
+ctx_create_engines(int i915, const struct i915_engine_class_instance *ci,
+		   unsigned int count)
 {
-	igt_assert_eq(__set_load_balancer(i915, ctx, ci, count, ext), 0);
+	intel_ctx_cfg_t cfg = ctx_cfg_for_engines(ci, count);
+	return intel_ctx_create(i915, &cfg);
 }
 
-static uint32_t load_balancer_create(int i915,
-				     const struct i915_engine_class_instance *ci,
-				     unsigned int count)
+static const intel_ctx_t *
+ctx_create_balanced(int i915, const struct i915_engine_class_instance *ci,
+		    unsigned int count)
 {
-	uint32_t ctx;
-
-	ctx = gem_context_create(i915);
-	set_load_balancer(i915, ctx, ci, count, NULL);
-
-	return ctx;
+	intel_ctx_cfg_t cfg = ctx_cfg_for_engines(ci, count);
+	cfg.load_balance = true;
+	return intel_ctx_create(i915, &cfg);
 }
 
 static uint32_t __batch_create(int i915, uint32_t offset)
@@ -495,7 +441,7 @@ static const char *class_to_str(int class)
 }
 
 static void check_individual_engine(int i915,
-				    uint32_t ctx,
+				    const intel_ctx_t *ctx,
 				    const struct i915_engine_class_instance *ci,
 				    int idx)
 {
@@ -507,7 +453,7 @@ static void check_individual_engine(int i915,
 			     I915_PMU_ENGINE_BUSY(ci[idx].engine_class,
 						  ci[idx].engine_instance));
 
-	spin = igt_spin_new(i915, .ctx_id = ctx, .engine = idx + 1);
+	spin = igt_spin_new(i915, .ctx = ctx, .engine = idx + 1);
 	load = measure_load(pmu, 10000);
 	igt_spin_free(i915, spin);
 
@@ -537,15 +483,14 @@ static void individual(int i915)
 			continue;
 
 		for (int pass = 0; pass < count; pass++) { /* approx. count! */
-			uint32_t ctx;
+			const intel_ctx_t *ctx;
 
 			igt_assert(sizeof(*ci) == sizeof(int));
 			igt_permute_array(ci, count, igt_exchange_int);
-			ctx = gem_context_create(i915);
-			set_load_balancer(i915, ctx, ci, count, NULL);
+			ctx = ctx_create_balanced(i915, ci, count);
 			for (unsigned int n = 0; n < count; n++)
 				check_individual_engine(i915, ctx, ci, n);
-			gem_context_destroy(i915, ctx);
+			intel_ctx_destroy(i915, ctx);
 		}
 
 		free(ci);
@@ -613,7 +558,7 @@ static void bonded_slice(int i915)
 		struct drm_i915_gem_exec_object2 obj[3] = {};
 		struct drm_i915_gem_execbuffer2 eb = {};
 		unsigned int count;
-		uint32_t ctx;
+		const intel_ctx_t *ctx;
 		igt_spin_t *spin;
 
 		siblings = list_engines(i915, 1u << class, &count);
@@ -637,11 +582,10 @@ static void bonded_slice(int i915)
 		 * XXX add explicit bonding options for A->B
 		 */
 
-		ctx = gem_context_create(i915); /* NB timeline per engine */
-		set_load_balancer(i915, ctx, siblings, count, NULL);
+		ctx = ctx_create_balanced(i915, siblings, count);
 
 		spin = __igt_spin_new(i915,
-				      .ctx_id = ctx,
+				      .ctx = ctx,
 				      .flags = (IGT_SPIN_NO_PREEMPTION |
 						IGT_SPIN_POLL_RUN));
 		igt_spin_end(spin); /* we just want its address for later */
@@ -655,17 +599,17 @@ static void bonded_slice(int i915)
 		obj[2].handle = create_semaphore_to_spinner(i915, spin);
 
 		eb.buffers_ptr = to_user_pointer(obj);
-		eb.rsvd1 = ctx;
+		eb.rsvd1 = ctx->id;
 
 		*stop = 0;
 		igt_fork(child, count + 1) { /* C: arbitrary background load */
 			igt_list_del(&spin->link);
 
-			ctx = load_balancer_create(i915, siblings, count);
+			ctx = ctx_create_balanced(i915, siblings, count);
 
 			while (!READ_ONCE(*stop)) {
 				spin = igt_spin_new(i915,
-						    .ctx_id = ctx,
+						    .ctx = ctx,
 						    .engine = (1 + rand() % count),
 						    .flags = IGT_SPIN_POLL_RUN);
 				igt_spin_busywait_until_started(spin);
@@ -673,7 +617,7 @@ static void bonded_slice(int i915)
 				igt_spin_free(i915, spin);
 			}
 
-			gem_context_destroy(i915, ctx);
+			intel_ctx_destroy(i915, ctx);
 		}
 
 		igt_until_timeout(5) {
@@ -699,7 +643,7 @@ static void bonded_slice(int i915)
 
 		gem_close(i915, obj[2].handle);
 		igt_spin_free(i915, spin);
-		gem_context_destroy(i915, ctx);
+		intel_ctx_destroy(i915, ctx);
 	}
 
 	munmap(stop, 4096);
@@ -720,26 +664,24 @@ static void __bonded_chain(int i915,
 	igt_spin_t *spin;
 
 	for (int i = 0; i < ARRAY_SIZE(priorities); i++) {
-		uint32_t ctx;
+		const intel_ctx_t *ctx;
 		/* A: spin forever on engine 1 */
 
-		ctx = gem_context_create(i915);
-		set_load_balancer(i915, ctx, siblings, count, NULL);
+		ctx = ctx_create_balanced(i915, siblings, count);
 		if (priorities[i] < 0)
-			gem_context_set_priority(i915, ctx, priorities[i]);
+			gem_context_set_priority(i915, ctx->id, priorities[i]);
 		spin = igt_spin_new(i915,
-				    .ctx_id = ctx,
+				    .ctx = ctx,
 				    .engine = 1,
 				    .flags = (IGT_SPIN_POLL_RUN |
 					      IGT_SPIN_FENCE_OUT));
 		igt_spin_busywait_until_started(spin);
 
 		/* B: waits for A on engine 2 */
-		gem_context_destroy(i915, ctx);
-		ctx = gem_context_create(i915);
-		gem_context_set_priority(i915, ctx, 0);
-		set_load_balancer(i915, ctx, siblings, count, NULL);
-		execbuf.rsvd1 = ctx;
+		intel_ctx_destroy(i915, ctx);
+		ctx = ctx_create_balanced(i915, siblings, count);
+		gem_context_set_priority(i915, ctx->id, 0);
+		execbuf.rsvd1 = ctx->id;
 		execbuf.rsvd2 = spin->out_fence;
 		execbuf.flags = I915_EXEC_FENCE_IN | I915_EXEC_FENCE_OUT;
 		execbuf.flags |= 2; /* opposite engine to spinner */
@@ -747,12 +689,12 @@ static void __bonded_chain(int i915,
 
 		/* B': run in parallel with B on engine 1, i.e. not before A! */
 		if (priorities[i] > 0)
-			gem_context_set_priority(i915, ctx, priorities[i]);
+			gem_context_set_priority(i915, ctx->id, priorities[i]);
 		execbuf.flags = I915_EXEC_FENCE_SUBMIT | I915_EXEC_FENCE_OUT;
 		execbuf.flags |= 1; /* same engine as spinner */
 		execbuf.rsvd2 >>= 32;
 		gem_execbuf_wr(i915, &execbuf);
-		gem_context_set_priority(i915, ctx, 0);
+		gem_context_set_priority(i915, ctx->id, 0);
 
 		/* Wait for any magic timeslicing or preemptions... */
 		igt_assert_eq(sync_fence_wait(execbuf.rsvd2 >> 32, 1000),
@@ -769,7 +711,7 @@ static void __bonded_chain(int i915,
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 >> 32), 0);
 
 		igt_spin_free(i915, spin);
-		gem_context_destroy(i915, ctx);
+		intel_ctx_destroy(i915, ctx);
 		gem_sync(i915, batch.handle);
 
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 & 0xffffffff), 1);
@@ -797,26 +739,24 @@ static void __bonded_chain_inv(int i915,
 	igt_spin_t *spin;
 
 	for (int i = 0; i < ARRAY_SIZE(priorities); i++) {
-		uint32_t ctx;
+		const intel_ctx_t *ctx;
 
 		/* A: spin forever on engine 1 */
-		ctx = gem_context_create(i915);
-		set_load_balancer(i915, ctx, siblings, count, NULL);
+		ctx = ctx_create_balanced(i915, siblings, count);
 		if (priorities[i] < 0)
-			gem_context_set_priority(i915, ctx, priorities[i]);
+			gem_context_set_priority(i915, ctx->id, priorities[i]);
 		spin = igt_spin_new(i915,
-				    .ctx_id = ctx,
+				    .ctx = ctx,
 				    .engine = 1,
 				    .flags = (IGT_SPIN_POLL_RUN |
 					      IGT_SPIN_FENCE_OUT));
 		igt_spin_busywait_until_started(spin);
 
 		/* B: waits for A on engine 1 */
-		gem_context_destroy(i915, ctx);
-		ctx = gem_context_create(i915);
-		gem_context_set_priority(i915, ctx, 0);
-		set_load_balancer(i915, ctx, siblings, count, NULL);
-		execbuf.rsvd1 = ctx;
+		intel_ctx_destroy(i915, ctx);
+		ctx = ctx_create_balanced(i915, siblings, count);
+		gem_context_set_priority(i915, ctx->id, 0);
+		execbuf.rsvd1 = ctx->id;
 		execbuf.rsvd2 = spin->out_fence;
 		execbuf.flags = I915_EXEC_FENCE_IN | I915_EXEC_FENCE_OUT;
 		execbuf.flags |= 1; /* same engine as spinner */
@@ -824,12 +764,12 @@ static void __bonded_chain_inv(int i915,
 
 		/* B': run in parallel with B on engine 2, i.e. not before A! */
 		if (priorities[i] > 0)
-			gem_context_set_priority(i915, ctx, priorities[i]);
+			gem_context_set_priority(i915, ctx->id, priorities[i]);
 		execbuf.flags = I915_EXEC_FENCE_SUBMIT | I915_EXEC_FENCE_OUT;
 		execbuf.flags |= 2; /* opposite engine to spinner */
 		execbuf.rsvd2 >>= 32;
 		gem_execbuf_wr(i915, &execbuf);
-		gem_context_set_priority(i915, ctx, 0);
+		gem_context_set_priority(i915, ctx->id, 0);
 
 		/* Wait for any magic timeslicing or preemptions... */
 		igt_assert_eq(sync_fence_wait(execbuf.rsvd2 >> 32, 1000),
@@ -847,7 +787,7 @@ static void __bonded_chain_inv(int i915,
 
 		igt_spin_free(i915, spin);
 		gem_sync(i915, batch.handle);
-		gem_context_destroy(i915, ctx);
+		intel_ctx_destroy(i915, ctx);
 
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 & 0xffffffff), 1);
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 >> 32), 1);
@@ -895,10 +835,10 @@ static void __bonded_sema(int i915,
 	igt_spin_t *spin;
 
 	for (int i = 0; i < ARRAY_SIZE(priorities); i++) {
-		uint32_t ctx;
+		const intel_ctx_t *ctx;
 
 		/* A: spin forever on seperate render engine */
-		spin = igt_spin_new(i915,
+		spin = igt_spin_new(i915, .ctx = intel_ctx_0(i915),
 				    .flags = (IGT_SPIN_POLL_RUN |
 					      IGT_SPIN_FENCE_OUT));
 		igt_spin_busywait_until_started(spin);
@@ -911,26 +851,24 @@ static void __bonded_sema(int i915,
 		 */
 
 		/* B: waits for A (using a semaphore) on engine 1 */
-		ctx = gem_context_create(i915);
-		set_load_balancer(i915, ctx, siblings, count, NULL);
-		execbuf.rsvd1 = ctx;
+		ctx = ctx_create_balanced(i915, siblings, count);
+		execbuf.rsvd1 = ctx->id;
 		execbuf.rsvd2 = spin->out_fence;
 		execbuf.flags = I915_EXEC_FENCE_IN | I915_EXEC_FENCE_OUT;
 		execbuf.flags |= 1;
 		gem_execbuf_wr(i915, &execbuf);
 
 		/* B': run in parallel with B on engine 2 */
-		gem_context_destroy(i915, ctx);
-		ctx = gem_context_create(i915);
+		intel_ctx_destroy(i915, ctx);
+		ctx = ctx_create_balanced(i915, siblings, count);
 		if (priorities[i] > 0)
-			gem_context_set_priority(i915, ctx, priorities[i]);
-		set_load_balancer(i915, ctx, siblings, count, NULL);
-		execbuf.rsvd1 = ctx;
+			gem_context_set_priority(i915, ctx->id, priorities[i]);
+		execbuf.rsvd1 = ctx->id;
 		execbuf.flags = I915_EXEC_FENCE_SUBMIT | I915_EXEC_FENCE_OUT;
 		execbuf.flags |= 2;
 		execbuf.rsvd2 >>= 32;
 		gem_execbuf_wr(i915, &execbuf);
-		gem_context_set_priority(i915, ctx, 0);
+		gem_context_set_priority(i915, ctx->id, 0);
 
 		/* Wait for any magic timeslicing or preemptions... */
 		igt_assert_eq(sync_fence_wait(execbuf.rsvd2 >> 32, 1000),
@@ -948,7 +886,7 @@ static void __bonded_sema(int i915,
 
 		igt_spin_free(i915, spin);
 		gem_sync(i915, batch.handle);
-		gem_context_destroy(i915, ctx);
+		intel_ctx_destroy(i915, ctx);
 
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 & 0xffffffff), 1);
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 >> 32), 1);
@@ -1001,7 +939,7 @@ static void __bonded_pair(int i915,
 	unsigned int spinner;
 	igt_spin_t *a;
 	int timeline;
-	uint32_t A;
+	const intel_ctx_t *A;
 
 	srandom(getpid());
 
@@ -1009,9 +947,8 @@ static void __bonded_pair(int i915,
 	if (flags & B_HOSTILE)
 		spinner |= IGT_SPIN_NO_PREEMPTION;
 
-	A = gem_context_create(i915);
-	set_load_balancer(i915, A, siblings, count, NULL);
-	a = igt_spin_new(i915, A, .flags = spinner);
+	A = ctx_create_balanced(i915, siblings, count);
+	a = igt_spin_new(i915, .ctx = A, .flags = spinner);
 	igt_spin_end(a);
 	gem_sync(i915, a->handle);
 
@@ -1064,7 +1001,7 @@ static void __bonded_pair(int i915,
 
 	close(timeline);
 	igt_spin_free(i915, a);
-	gem_context_destroy(i915, A);
+	intel_ctx_destroy(i915, A);
 
 	*out = cycles;
 }
@@ -1084,7 +1021,7 @@ static void __bonded_dual(int i915,
 	unsigned int spinner;
 	igt_spin_t *a, *b;
 	int timeline;
-	uint32_t A, B;
+	const intel_ctx_t *A, *B;
 
 	srandom(getpid());
 
@@ -1092,15 +1029,13 @@ static void __bonded_dual(int i915,
 	if (flags & B_HOSTILE)
 		spinner |= IGT_SPIN_NO_PREEMPTION;
 
-	A = gem_context_create(i915);
-	set_load_balancer(i915, A, siblings, count, NULL);
-	a = igt_spin_new(i915, A, .flags = spinner);
+	A = ctx_create_balanced(i915, siblings, count);
+	a = igt_spin_new(i915, .ctx = A, .flags = spinner);
 	igt_spin_end(a);
 	gem_sync(i915, a->handle);
 
-	B = gem_context_create(i915);
-	set_load_balancer(i915, B, siblings, count, NULL);
-	b = igt_spin_new(i915, B, .flags = spinner);
+	B = ctx_create_balanced(i915, siblings, count);
+	b = igt_spin_new(i915, .ctx = B, .flags = spinner);
 	igt_spin_end(b);
 	gem_sync(i915, b->handle);
 
@@ -1179,8 +1114,8 @@ static void __bonded_dual(int i915,
 	igt_spin_free(i915, a);
 	igt_spin_free(i915, b);
 
-	gem_context_destroy(i915, A);
-	gem_context_destroy(i915, B);
+	intel_ctx_destroy(i915, A);
+	intel_ctx_destroy(i915, B);
 
 	*out = cycles;
 }
@@ -1286,6 +1221,7 @@ static void __bonded_sync(int i915,
 			  unsigned long *out)
 {
 	const uint64_t A = 0 << 12, B = 1 << 12;
+	const intel_ctx_t *ctx = ctx_create_balanced(i915, siblings, count);
 	struct drm_i915_gem_exec_object2 obj[2] = { {
 		.handle = sync_to(i915, A, B),
 		.offset = A,
@@ -1298,7 +1234,7 @@ static void __bonded_sync(int i915,
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(obj),
 		.buffer_count = 2,
-		.rsvd1 = gem_context_create(i915),
+		.rsvd1 = ctx->id,
 	};
 
 	unsigned long cycles = 0;
@@ -1307,7 +1243,6 @@ static void __bonded_sync(int i915,
 	if (!(flags & B_HOSTILE)) /* always non-preemptible */
 		goto out;
 
-	set_load_balancer(i915, execbuf.rsvd1, siblings, count, NULL);
 	disable_preparser(i915, execbuf.rsvd1);
 
 	srandom(getpid());
@@ -1364,7 +1299,7 @@ out:
 	close(timeline);
 	gem_close(i915, obj[0].handle);
 	gem_close(i915, obj[1].handle);
-	gem_context_destroy(i915, execbuf.rsvd1);
+	intel_ctx_destroy(i915, ctx);
 
 	*out = cycles;
 }
@@ -1452,7 +1387,7 @@ bonded_runner(int i915,
 	munmap(cycles, 4096);
 }
 
-static void __bonded_nohang(int i915, uint32_t ctx,
+static void __bonded_nohang(int i915, const intel_ctx_t *ctx,
 			    const struct i915_engine_class_instance *siblings,
 			    unsigned int count,
 			    unsigned int flags)
@@ -1464,16 +1399,15 @@ static void __bonded_nohang(int i915, uint32_t ctx,
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&batch),
 		.buffer_count = 1,
-		.rsvd1 = ctx,
+		.rsvd1 = ctx->id,
 	};
 	igt_spin_t *time, *spin;
-	uint32_t load;
+	const intel_ctx_t *load;
 
-	load = gem_context_create(i915);
-	gem_context_set_priority(i915, load, 1023);
-	set_load_balancer(i915, load, siblings, count, NULL);
+	load = ctx_create_balanced(i915, siblings, count);
+	gem_context_set_priority(i915, load->id, 1023);
 
-	spin = igt_spin_new(i915, load, .engine = 1);
+	spin = igt_spin_new(i915, .ctx = load, .engine = 1);
 
 	/* Master on engine 1, stuck behind a spinner */
 	execbuf.flags = 1 | I915_EXEC_FENCE_OUT;
@@ -1493,7 +1427,7 @@ static void __bonded_nohang(int i915, uint32_t ctx,
 
 		if (flags & NOHANG) {
 			/* Keep replacing spin, so that it doesn't hang */
-			next = igt_spin_new(i915, load, .engine = 1);
+			next = igt_spin_new(i915, .ctx = load, .engine = 1);
 			igt_spin_free(i915, spin);
 			spin = next;
 		}
@@ -1511,13 +1445,13 @@ static void __bonded_nohang(int i915, uint32_t ctx,
 	close(execbuf.rsvd2);
 	close(execbuf.rsvd2 >> 32);
 
-	gem_context_destroy(i915, load);
+	intel_ctx_destroy(i915, load);
 	gem_close(i915, batch.handle);
 }
 
 static void bonded_nohang(int i915, unsigned int flags)
 {
-	uint32_t ctx;
+	const intel_ctx_t *ctx;
 
 	/*
 	 * We try and trick ourselves into declaring a bonded request as
@@ -1526,7 +1460,7 @@ static void bonded_nohang(int i915, unsigned int flags)
 
 	igt_require(gem_scheduler_has_semaphores(i915));
 
-	ctx = gem_context_create(i915);
+	ctx = intel_ctx_create(i915, NULL);
 
 	for (int class = 1; class < 32; class++) {
 		struct i915_engine_class_instance *siblings;
@@ -1538,7 +1472,7 @@ static void bonded_nohang(int i915, unsigned int flags)
 		free(siblings);
 	}
 
-	gem_context_destroy(i915, ctx);
+	intel_ctx_destroy(i915, ctx);
 }
 
 static void indices(int i915)
@@ -1654,20 +1588,20 @@ static void busy(int i915)
 		struct i915_engine_class_instance *ci;
 		unsigned int count;
 		igt_spin_t *spin[2];
-		uint32_t ctx;
+		const intel_ctx_t *ctx;
 
 		ci = list_engines(i915, 1u << class, &count);
 		if (!ci)
 			continue;
 
-		ctx = load_balancer_create(i915, ci, count);
+		ctx = ctx_create_balanced(i915, ci, count);
 		free(ci);
 
 		spin[0] = __igt_spin_new(i915,
-					 .ctx_id = ctx,
+					 .ctx = ctx,
 					 .flags = IGT_SPIN_POLL_RUN);
 		spin[1] = __igt_spin_new(i915,
-					 .ctx_id = ctx,
+					 .ctx = ctx,
 					 .dependency = scratch);
 
 		igt_spin_busywait_until_started(spin[0]);
@@ -1691,7 +1625,7 @@ static void busy(int i915)
 		igt_spin_free(i915, spin[1]);
 		igt_spin_free(i915, spin[0]);
 
-		gem_context_destroy(i915, ctx);
+		intel_ctx_destroy(i915, ctx);
 	}
 
 	gem_close(i915, scratch);
@@ -1744,7 +1678,7 @@ static void full(int i915, unsigned int flags)
 
 		pmu[0] = -1;
 		for (unsigned int n = 0; n < count; n++) {
-			uint32_t ctx;
+			const intel_ctx_t *ctx;
 
 			pmu[n] = add_pmu(i915, pmu[0], &ci[n]);
 
@@ -1763,22 +1697,22 @@ static void full(int i915, unsigned int flags)
 			 * otherwise they will just sit in the single queue
 			 * and not run concurrently.
 			 */
-			ctx = load_balancer_create(i915, ci, count);
+			ctx = ctx_create_balanced(i915, ci, count);
 
 			if (spin == NULL) {
-				spin = __igt_spin_new(i915, .ctx_id = ctx);
+				spin = __igt_spin_new(i915, .ctx = ctx);
 			} else {
 				struct drm_i915_gem_execbuffer2 eb = {
 					.buffers_ptr = spin->execbuf.buffers_ptr,
 					.buffer_count = spin->execbuf.buffer_count,
-					.rsvd1 = ctx,
+					.rsvd1 = ctx->id,
 					.rsvd2 = fence,
 					.flags = flags & LATE ? I915_EXEC_FENCE_IN : 0,
 				};
 				gem_execbuf(i915, &eb);
 			}
 
-			gem_context_destroy(i915, ctx);
+			intel_ctx_destroy(i915, ctx);
 		}
 
 		if (flags & LATE) {
@@ -1805,17 +1739,17 @@ static void full(int i915, unsigned int flags)
 }
 
 static void __sliced(int i915,
-		     uint32_t ctx, unsigned int count,
+		     const intel_ctx_t *ctx, unsigned int count,
 		     unsigned int flags)
 {
 	igt_spin_t *load[count];
 	igt_spin_t *virtual;
 
-	virtual = igt_spin_new(i915, ctx, .engine = 0,
+	virtual = igt_spin_new(i915, .ctx = ctx, .engine = 0,
 			       .flags = (IGT_SPIN_FENCE_OUT |
 					 IGT_SPIN_POLL_RUN));
 	for (int i = 0; i < count; i++)
-		load[i] = __igt_spin_new(i915, ctx,
+		load[i] = __igt_spin_new(i915, .ctx = ctx,
 					 .engine = i + 1,
 					 .fence = virtual->out_fence,
 					 .flags = flags);
@@ -1866,7 +1800,9 @@ static void sliced(int i915)
 		}
 
 		igt_fork(child, count) {
-			uint32_t ctx = load_balancer_create(i915, ci, count);
+			const intel_ctx_t *ctx;
+
+			ctx = ctx_create_balanced(i915, ci, count);
 
 			/* Independent load */
 			__sliced(i915, ctx, count, 0);
@@ -1874,7 +1810,7 @@ static void sliced(int i915)
 			/* Dependent load */
 			__sliced(i915, ctx, count, IGT_SPIN_FENCE_IN);
 
-			gem_context_destroy(i915, ctx);
+			intel_ctx_destroy(i915, ctx);
 		}
 		igt_waitchildren();
 
@@ -1884,23 +1820,23 @@ static void sliced(int i915)
 	gem_quiescent_gpu(i915);
 }
 
-static void __hog(int i915, uint32_t ctx, unsigned int count)
+static void __hog(int i915, const intel_ctx_t *ctx, unsigned int count)
 {
 	int64_t timeout = 50 * 1000 * 1000; /* 50ms */
 	igt_spin_t *virtual;
 	igt_spin_t *hog;
 
-	virtual = igt_spin_new(i915, ctx, .engine = 0);
+	virtual = igt_spin_new(i915, .ctx = ctx, .engine = 0);
 	for (int i = 0; i < count; i++)
 		gem_execbuf(i915, &virtual->execbuf);
 	usleep(50 * 1000); /* 50ms, long enough to spread across all engines */
 
-	gem_context_set_priority(i915, ctx, 1023);
-	hog = __igt_spin_new(i915, ctx,
+	gem_context_set_priority(i915, ctx->id, 1023);
+	hog = __igt_spin_new(i915, .ctx = ctx,
 			     .engine = 1 + (random() % count),
 			     .flags = (IGT_SPIN_POLL_RUN |
 				       IGT_SPIN_NO_PREEMPTION));
-	gem_context_set_priority(i915, ctx, 0);
+	gem_context_set_priority(i915, ctx->id, 0);
 
 	/* No matter which engine we choose, we'll have interrupted someone */
 	igt_spin_busywait_until_started(hog);
@@ -1930,7 +1866,7 @@ static void hog(int i915)
 	for (int class = 0; class < 32; class++) {
 		struct i915_engine_class_instance *ci;
 		unsigned int count;
-		uint32_t ctx;
+		const intel_ctx_t *ctx;
 
 		ci = list_engines(i915, 1u << class, &count);
 		if (!ci)
@@ -1941,11 +1877,11 @@ static void hog(int i915)
 			continue;
 		}
 
-		ctx = load_balancer_create(i915, ci, count);
+		ctx = ctx_create_balanced(i915, ci, count);
 
 		__hog(i915, ctx, count);
 
-		gem_context_destroy(i915, ctx);
+		intel_ctx_destroy(i915, ctx);
 		igt_waitchildren();
 
 		free(ci);
@@ -1993,6 +1929,7 @@ static int __execbuf(int i915, struct drm_i915_gem_execbuffer2 *execbuf)
 static uint32_t *sema(int i915, struct i915_engine_class_instance *ci,
 		      unsigned int count)
 {
+	const intel_ctx_t *ctx = ctx_create_balanced(i915, ci, count);
 	uint32_t *ctl;
 	struct drm_i915_gem_exec_object2 batch = {
 		.handle = sema_create(i915, 64 << 20, &ctl),
@@ -2002,7 +1939,7 @@ static uint32_t *sema(int i915, struct i915_engine_class_instance *ci,
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&batch),
 		.buffer_count = 1,
-		.rsvd1 = load_balancer_create(i915, ci, count),
+		.rsvd1 = ctx->id,
 	};
 
 	for (int n = 1; n <= 32; n++) {
@@ -2016,7 +1953,7 @@ static uint32_t *sema(int i915, struct i915_engine_class_instance *ci,
 		gem_wait(i915, batch.handle, &poll);
 	}
 
-	gem_context_destroy(i915, execbuf.rsvd1);
+	intel_ctx_destroy(i915, ctx);
 
 	igt_assert(gem_bo_busy(i915, batch.handle));
 	gem_close(i915, batch.handle);
@@ -2069,14 +2006,9 @@ static void waits(int i915, int timeout)
 		if (!ci)
 			continue;
 
-		if (count > 1) {
-			uint32_t ctx = load_balancer_create(i915, ci, count);
-
+		if (count > 1)
 			__waits(i915, timeout, ci, count);
 
-			gem_context_destroy(i915, ctx);
-		}
-
 		free(ci);
 	}
 
@@ -2095,20 +2027,20 @@ static void nop(int i915)
 	for (int class = 0; class < 32; class++) {
 		struct i915_engine_class_instance *ci;
 		unsigned int count;
-		uint32_t ctx;
+		const intel_ctx_t *ctx;
 
 		ci = list_engines(i915, 1u << class, &count);
 		if (!ci)
 			continue;
 
-		ctx = load_balancer_create(i915, ci, count);
+		ctx = ctx_create_balanced(i915, ci, count);
 
 		for (int n = 0; n < count; n++) {
 			struct drm_i915_gem_execbuffer2 execbuf = {
 				.buffers_ptr = to_user_pointer(&batch),
 				.buffer_count = 1,
 				.flags = n + 1,
-				.rsvd1 = ctx,
+				.rsvd1 = ctx->id,
 			};
 			struct timespec tv = {};
 			unsigned long nops;
@@ -2131,7 +2063,7 @@ static void nop(int i915)
 			struct drm_i915_gem_execbuffer2 execbuf = {
 				.buffers_ptr = to_user_pointer(&batch),
 				.buffer_count = 1,
-				.rsvd1 = ctx,
+				.rsvd1 = ctx->id,
 			};
 			struct timespec tv = {};
 			unsigned long nops;
@@ -2152,11 +2084,13 @@ static void nop(int i915)
 
 
 		igt_fork(child, count) {
+			const intel_ctx_t *child_ctx =
+				ctx_create_balanced(i915, ci, count);
 			struct drm_i915_gem_execbuffer2 execbuf = {
 				.buffers_ptr = to_user_pointer(&batch),
 				.buffer_count = 1,
 				.flags = child + 1,
-				.rsvd1 = load_balancer_create(i915, ci, count),
+				.rsvd1 = child_ctx->id,
 			};
 			struct timespec tv = {};
 			unsigned long nops;
@@ -2191,12 +2125,12 @@ static void nop(int i915)
 			igt_info("[%d] %s:* %.3fus\n",
 				 child, class_to_str(class), t);
 
-			gem_context_destroy(i915, execbuf.rsvd1);
+			intel_ctx_destroy(i915, child_ctx);
 		}
 
 		igt_waitchildren();
 
-		gem_context_destroy(i915, ctx);
+		intel_ctx_destroy(i915, ctx);
 		free(ci);
 	}
 
@@ -2221,7 +2155,7 @@ static void sequential(int i915)
 		unsigned int count;
 		unsigned long nops;
 		double t;
-		uint32_t *ctx;
+		const intel_ctx_t **ctx;
 
 		ci = list_engines(i915, 1u << class, &count);
 		if (!ci || count < 2)
@@ -2229,7 +2163,7 @@ static void sequential(int i915)
 
 		ctx = malloc(sizeof(*ctx) * count);
 		for (int n = 0; n < count; n++)
-			ctx[n] = load_balancer_create(i915, ci, count);
+			ctx[n] = ctx_create_balanced(i915, ci, count);
 
 		gem_execbuf_wr(i915, &execbuf);
 		execbuf.rsvd2 >>= 32;
@@ -2240,7 +2174,7 @@ static void sequential(int i915)
 		igt_nsec_elapsed(&tv);
 		do {
 			for (int n = 0; n < count; n++) {
-				execbuf.rsvd1 = ctx[n];
+				execbuf.rsvd1 = ctx[n]->id;
 				gem_execbuf_wr(i915, &execbuf);
 				close(execbuf.rsvd2);
 				execbuf.rsvd2 >>= 32;
@@ -2254,7 +2188,7 @@ static void sequential(int i915)
 
 		close(execbuf.rsvd2);
 		for (int n = 0; n < count; n++)
-			gem_context_destroy(i915, ctx[n]);
+			intel_ctx_destroy(i915, ctx[n]);
 		free(ctx);
 next:
 		free(ci);
@@ -2264,7 +2198,7 @@ next:
 	gem_quiescent_gpu(i915);
 }
 
-static void ping(int i915, uint32_t ctx, unsigned int engine)
+static void ping(int i915, const intel_ctx_t *ctx, unsigned int engine)
 {
 	struct drm_i915_gem_exec_object2 obj = {
 		.handle = batch_create(i915),
@@ -2273,7 +2207,7 @@ static void ping(int i915, uint32_t ctx, unsigned int engine)
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
 		.flags = engine,
-		.rsvd1 = ctx,
+		.rsvd1 = ctx->id,
 	};
 	gem_execbuf(i915, &execbuf);
 	gem_sync(i915, obj.handle);
@@ -2297,7 +2231,7 @@ static void semaphore(int i915)
 	for (int class = 1; class < 32; class++) {
 		struct i915_engine_class_instance *ci;
 		unsigned int count;
-		uint32_t block[2], vip;
+		const intel_ctx_t *block[2], *vip;
 
 		ci = list_engines(i915, 1u << class, &count);
 		if (!ci)
@@ -2310,10 +2244,9 @@ static void semaphore(int i915)
 		count = ARRAY_SIZE(block);
 
 		for (int i = 0; i < count; i++) {
-			block[i] = gem_context_create(i915);
-			set_load_balancer(i915, block[i], ci, count, NULL);
+			block[i] = ctx_create_balanced(i915, ci, count);
 			spin[i] = __igt_spin_new(i915,
-						 .ctx_id = block[i],
+						 .ctx = block[i],
 						 .dependency = scratch);
 		}
 
@@ -2321,14 +2254,13 @@ static void semaphore(int i915)
 		 * Either we haven't blocked both engines with semaphores,
 		 * or we let the vip through. If not, we hang.
 		 */
-		vip = gem_context_create(i915);
-		set_load_balancer(i915, vip, ci, count, NULL);
+		vip = ctx_create_balanced(i915, ci, count);
 		ping(i915, vip, 0);
-		gem_context_destroy(i915, vip);
+		intel_ctx_destroy(i915, vip);
 
 		for (int i = 0; i < count; i++) {
 			igt_spin_free(i915, spin[i]);
-			gem_context_destroy(i915, block[i]);
+			intel_ctx_destroy(i915, block[i]);
 		}
 
 		free(ci);
@@ -2367,7 +2299,7 @@ static void hangme(int i915)
 			igt_spin_t *spin[2];
 		} *client;
 		unsigned int count;
-		uint32_t bg;
+		const intel_ctx_t *bg;
 		int fence;
 
 		ci = list_engines(i915, 1u << class, &count);
@@ -2384,12 +2316,12 @@ static void hangme(int i915)
 
 		fence = igt_cork_plug(&cork, i915);
 		for (int i = 0; i < count; i++) {
-			uint32_t ctx = gem_context_create(i915);
+			const intel_ctx_t *ctx;
 			struct client *c = &client[i];
 			unsigned int flags;
 
-			set_unbannable(i915, ctx);
-			set_load_balancer(i915, ctx, ci, count, NULL);
+			ctx = ctx_create_balanced(i915, ci, count);
+			set_unbannable(i915, ctx->id);
 
 			flags = IGT_SPIN_FENCE_IN |
 				IGT_SPIN_FENCE_OUT |
@@ -2397,31 +2329,30 @@ static void hangme(int i915)
 			if (!gem_has_cmdparser(i915, ALL_ENGINES))
 				flags |= IGT_SPIN_INVALID_CS;
 			for (int j = 0; j < ARRAY_SIZE(c->spin); j++)  {
-				c->spin[j] = __igt_spin_new(i915, ctx,
+				c->spin[j] = __igt_spin_new(i915, .ctx = ctx,
 							    .fence = fence,
 							    .flags = flags);
 				flags = IGT_SPIN_FENCE_OUT;
 			}
 
-			gem_context_destroy(i915, ctx);
+			intel_ctx_destroy(i915, ctx);
 		}
 		close(fence);
 		igt_cork_unplug(&cork); /* queue all hangs en masse */
 
 		/* Apply some background context to speed up hang detection */
-		bg = gem_context_create(i915);
-		set_engines(i915, bg, ci, count);
-		gem_context_set_priority(i915, bg, 1023);
+		bg = ctx_create_engines(i915, ci, count);
+		gem_context_set_priority(i915, bg->id, 1023);
 		for (int i = 0; i < count; i++) {
 			struct drm_i915_gem_execbuffer2 execbuf = {
 				.buffers_ptr = to_user_pointer(&batch),
 				.buffer_count = 1,
 				.flags = i,
-				.rsvd1 = bg,
+				.rsvd1 = bg->id,
 			};
 			gem_execbuf(i915, &execbuf);
 		}
-		gem_context_destroy(i915, bg);
+		intel_ctx_destroy(i915, bg);
 
 		for (int i = 0; i < count; i++) {
 			struct client *c = &client[i];
@@ -2457,8 +2388,8 @@ static void smoketest(int i915, int timeout)
 	struct drm_i915_gem_exec_object2 batch[2] = {
 		{ .handle = __batch_create(i915, 16380) }
 	};
-	unsigned int ncontext = 0;
-	uint32_t *contexts = NULL;
+	unsigned int nctx = 0;
+	const intel_ctx_t **ctx = NULL;
 	uint32_t *handles = NULL;
 
 	igt_require_sw_sync();
@@ -2473,35 +2404,35 @@ static void smoketest(int i915, int timeout)
 			continue;
 		}
 
-		ncontext += 128;
-		contexts = realloc(contexts, sizeof(*contexts) * ncontext);
-		igt_assert(contexts);
+		nctx += 128;
+		ctx = realloc(ctx, sizeof(*ctx) * nctx);
+		igt_assert(ctx);
 
-		for (unsigned int n = ncontext - 128; n < ncontext; n++) {
-			contexts[n] = load_balancer_create(i915, ci, count);
-			igt_assert(contexts[n]);
+		for (unsigned int n = nctx - 128; n < nctx; n++) {
+			ctx[n] = ctx_create_balanced(i915, ci, count);
+			igt_assert(ctx[n]);
 		}
 
 		free(ci);
 	}
-	if (!ncontext) /* suppress the fluctuating status of shard-icl */
+	if (!nctx) /* suppress the fluctuating status of shard-icl */
 		return;
 
-	igt_debug("Created %d virtual engines (one per context)\n", ncontext);
-	contexts = realloc(contexts, sizeof(*contexts) * ncontext * 4);
-	igt_assert(contexts);
-	memcpy(contexts + ncontext, contexts, ncontext * sizeof(*contexts));
-	ncontext *= 2;
-	memcpy(contexts + ncontext, contexts, ncontext * sizeof(*contexts));
-	ncontext *= 2;
+	igt_debug("Created %d virtual engines (one per context)\n", nctx);
+	ctx = realloc(ctx, sizeof(*ctx) * nctx * 4);
+	igt_assert(ctx);
+	memcpy(ctx + nctx, ctx, nctx * sizeof(*ctx));
+	nctx *= 2;
+	memcpy(ctx + nctx, ctx, nctx * sizeof(*ctx));
+	nctx *= 2;
 
-	handles = malloc(sizeof(*handles) * ncontext);
+	handles = malloc(sizeof(*handles) * nctx);
 	igt_assert(handles);
-	for (unsigned int n = 0; n < ncontext; n++)
+	for (unsigned int n = 0; n < nctx; n++)
 		handles[n] = gem_create(i915, 4096);
 
 	igt_until_timeout(timeout) {
-		unsigned int count = 1 + (rand() % (ncontext - 1));
+		unsigned int count = 1 + (rand() % (nctx - 1));
 		IGT_CORK_FENCE(cork);
 		int fence = igt_cork_plug(&cork, i915);
 
@@ -2509,7 +2440,7 @@ static void smoketest(int i915, int timeout)
 			struct drm_i915_gem_execbuffer2 eb = {
 				.buffers_ptr = to_user_pointer(batch),
 				.buffer_count = ARRAY_SIZE(batch),
-				.rsvd1 = contexts[n],
+				.rsvd1 = ctx[n]->id,
 				.rsvd2 = fence,
 				.flags = I915_EXEC_BATCH_FIRST | I915_EXEC_FENCE_IN,
 			};
@@ -2525,16 +2456,16 @@ static void smoketest(int i915, int timeout)
 		close(fence);
 	}
 
-	for (unsigned int n = 0; n < ncontext; n++) {
+	for (unsigned int n = 0; n < nctx / 4; n++) {
 		gem_close(i915, handles[n]);
-		__gem_context_destroy(i915, contexts[n]);
+		intel_ctx_destroy(i915, ctx[n]);
 	}
 	free(handles);
-	free(contexts);
+	free(ctx);
 	gem_close(i915, batch[0].handle);
 }
 
-static uint32_t read_ctx_timestamp(int i915, uint32_t ctx)
+static uint32_t read_ctx_timestamp(int i915, const intel_ctx_t *ctx)
 {
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_exec_object2 obj = {
@@ -2546,7 +2477,7 @@ static uint32_t read_ctx_timestamp(int i915, uint32_t ctx)
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
-		.rsvd1 = ctx,
+		.rsvd1 = ctx->id,
 	};
 	uint32_t *map, *cs;
 	uint32_t ts;
@@ -2618,7 +2549,7 @@ static void __fairslice(int i915,
 {
 	const double timeslice_duration_ns = 1e6;
 	igt_spin_t *spin = NULL;
-	uint32_t ctx[count + 1];
+	const intel_ctx_t *ctx[count + 1];
 	uint32_t ts[count + 1];
 	double threshold;
 
@@ -2627,14 +2558,14 @@ static void __fairslice(int i915,
 	igt_assert(ARRAY_SIZE(ctx) >= 3);
 
 	for (int i = 0; i < ARRAY_SIZE(ctx); i++) {
-		ctx[i] = load_balancer_create(i915, ci, count);
+		ctx[i] = ctx_create_balanced(i915, ci, count);
 		if (spin == NULL) {
-			spin = __igt_spin_new(i915, .ctx_id = ctx[i]);
+			spin = __igt_spin_new(i915, .ctx = ctx[i]);
 		} else {
 			struct drm_i915_gem_execbuffer2 eb = {
 				.buffer_count = 1,
 				.buffers_ptr = to_user_pointer(&spin->obj[IGT_SPIN_BATCH]),
-				.rsvd1 = ctx[i],
+				.rsvd1 = ctx[i]->id,
 			};
 			gem_execbuf(i915, &eb);
 		}
@@ -2650,7 +2581,7 @@ static void __fairslice(int i915,
 		ts[i] = read_ctx_timestamp(i915, ctx[i]);
 
 	for (int i = 0; i < ARRAY_SIZE(ctx); i++)
-		gem_context_destroy(i915, ctx[i]);
+		intel_ctx_destroy(i915, ctx[i]);
 	igt_spin_free(i915, spin);
 
 	/*
@@ -2715,21 +2646,21 @@ static void __persistence(int i915,
 			  bool persistent)
 {
 	igt_spin_t *spin;
-	uint32_t ctx;
+	const intel_ctx_t *ctx;
 
 	/*
 	 * A nonpersistent context is terminated immediately upon closure,
 	 * any inflight request is cancelled.
 	 */
 
-	ctx = load_balancer_create(i915, ci, count);
+	ctx = ctx_create_balanced(i915, ci, count);
 	if (!persistent)
-		gem_context_set_persistence(i915, ctx, persistent);
+		gem_context_set_persistence(i915, ctx->id, persistent);
 
-	spin = igt_spin_new(i915, ctx,
+	spin = igt_spin_new(i915, .ctx = ctx,
 			    .flags = IGT_SPIN_FENCE_OUT | IGT_SPIN_POLL_RUN);
 	igt_spin_busywait_until_started(spin);
-	gem_context_destroy(i915, ctx);
+	intel_ctx_destroy(i915, ctx);
 
 	igt_assert_eq(wait_for_status(spin->out_fence, 500), -EIO);
 	igt_spin_free(i915, spin);
@@ -2859,13 +2790,15 @@ static bool has_context_engines(int i915)
 
 static bool has_load_balancer(int i915)
 {
-	struct i915_engine_class_instance ci = {};
-	uint32_t ctx;
+	const intel_ctx_cfg_t cfg = {
+		.load_balance = true,
+		.num_engines = 1,
+	};
+	const intel_ctx_t *ctx = NULL;
 	int err;
 
-	ctx = gem_context_create(i915);
-	err = __set_load_balancer(i915, ctx, &ci, 1, NULL);
-	gem_context_destroy(i915, ctx);
+	err = __intel_ctx_create(i915, &cfg, &ctx);
+	intel_ctx_destroy(i915, ctx);
 
 	return err == 0;
 }
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
