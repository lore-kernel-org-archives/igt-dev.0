Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138656E55E
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Aug 2021 07:47:21 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 13 Aug 2021 09:46:57 +0200
Message-Id: <20210813074703.18778-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210813074703.18778-1-zbigniew.kempczynski@intel.com>
References: <20210813074703.18778-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/9] tests/gem_exec_balancer: Adopt to use
 allocator
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

For newer gens we're not able to rely on relocations. Adopt to use
offsets acquired from the allocator.

v2: use load instead of ctx in bonded test (Ashutosh)

v3: fixing bonded-chain and sliced subtest (Zbigniew)

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_balancer.c | 132 +++++++++++++++++++++++++--------
 1 file changed, 101 insertions(+), 31 deletions(-)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 2f98950bb..bfbfcb3b4 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -482,14 +482,16 @@ static void check_individual_engine(int i915,
 	igt_spin_t *spin;
 	double load;
 	int pmu;
+	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
 
 	pmu = perf_i915_open(i915,
 			     I915_PMU_ENGINE_BUSY(ci[idx].engine_class,
 						  ci[idx].engine_instance));
 
-	spin = igt_spin_new(i915, .ctx = ctx, .engine = idx + 1);
+	spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx, .engine = idx + 1);
 	load = measure_load(pmu, 10000);
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 
 	close(pmu);
 
@@ -589,12 +591,15 @@ static void __bonded_chain(int i915,
 
 	for (int i = 0; i < ARRAY_SIZE(priorities); i++) {
 		const intel_ctx_t *ctx;
+		uint64_t ahnd;
 		/* A: spin forever on engine 1 */
 
 		ctx = ctx_create_balanced(i915, siblings, count);
 		if (priorities[i] < 0)
 			gem_context_set_priority(i915, ctx->id, priorities[i]);
+		ahnd = get_reloc_ahnd(i915, ctx->id);
 		spin = igt_spin_new(i915,
+				    .ahnd = ahnd,
 				    .ctx = ctx,
 				    .engine = 1,
 				    .flags = (IGT_SPIN_POLL_RUN |
@@ -644,6 +649,7 @@ static void __bonded_chain(int i915,
 		igt_spin_free(i915, spin);
 		intel_ctx_destroy(i915, ctx);
 		gem_sync(i915, batch.handle);
+		put_ahnd(ahnd);
 
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 & 0xffffffff), 1);
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 >> 32), 1);
@@ -671,12 +677,15 @@ static void __bonded_chain_inv(int i915,
 
 	for (int i = 0; i < ARRAY_SIZE(priorities); i++) {
 		const intel_ctx_t *ctx;
+		uint64_t ahnd;
 
 		/* A: spin forever on engine 1 */
 		ctx = ctx_create_balanced(i915, siblings, count);
 		if (priorities[i] < 0)
 			gem_context_set_priority(i915, ctx->id, priorities[i]);
+		ahnd = get_reloc_ahnd(i915, ctx->id);
 		spin = igt_spin_new(i915,
+				    .ahnd = ahnd,
 				    .ctx = ctx,
 				    .engine = 1,
 				    .flags = (IGT_SPIN_POLL_RUN |
@@ -719,6 +728,7 @@ static void __bonded_chain_inv(int i915,
 		igt_spin_free(i915, spin);
 		gem_sync(i915, batch.handle);
 		intel_ctx_destroy(i915, ctx);
+		put_ahnd(ahnd);
 
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 & 0xffffffff), 1);
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 >> 32), 1);
@@ -766,10 +776,12 @@ static void __bonded_sema(int i915,
 	igt_spin_t *spin;
 
 	for (int i = 0; i < ARRAY_SIZE(priorities); i++) {
-		const intel_ctx_t *ctx;
+		const intel_ctx_t *ctx = intel_ctx_0(i915);
+		uint64_t ahnd = get_reloc_ahnd(i915, 0);
 
 		/* A: spin forever on seperate render engine */
-		spin = igt_spin_new(i915, .ctx = intel_ctx_0(i915),
+		spin = igt_spin_new(i915, .ahnd = ahnd,
+				    .ctx = intel_ctx_0(i915),
 				    .flags = (IGT_SPIN_POLL_RUN |
 					      IGT_SPIN_FENCE_OUT));
 		igt_spin_busywait_until_started(spin);
@@ -818,6 +830,7 @@ static void __bonded_sema(int i915,
 		igt_spin_free(i915, spin);
 		gem_sync(i915, batch.handle);
 		intel_ctx_destroy(i915, ctx);
+		put_ahnd(ahnd);
 
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 & 0xffffffff), 1);
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 >> 32), 1);
@@ -871,6 +884,7 @@ static void __bonded_pair(int i915,
 	igt_spin_t *a;
 	int timeline;
 	const intel_ctx_t *A;
+	uint64_t ahnd;
 
 	srandom(getpid());
 
@@ -879,7 +893,8 @@ static void __bonded_pair(int i915,
 		spinner |= IGT_SPIN_NO_PREEMPTION;
 
 	A = ctx_create_balanced(i915, siblings, count);
-	a = igt_spin_new(i915, .ctx = A, .flags = spinner);
+	ahnd = get_reloc_ahnd(i915, A->id);
+	a = igt_spin_new(i915, .ahnd = ahnd, .ctx = A, .flags = spinner);
 	igt_spin_end(a);
 	gem_sync(i915, a->handle);
 
@@ -933,6 +948,7 @@ static void __bonded_pair(int i915,
 	close(timeline);
 	igt_spin_free(i915, a);
 	intel_ctx_destroy(i915, A);
+	put_ahnd(ahnd);
 
 	*out = cycles;
 }
@@ -953,6 +969,7 @@ static void __bonded_dual(int i915,
 	igt_spin_t *a, *b;
 	int timeline;
 	const intel_ctx_t *A, *B;
+	uint64_t ahnd_A, ahnd_B;
 
 	srandom(getpid());
 
@@ -961,12 +978,14 @@ static void __bonded_dual(int i915,
 		spinner |= IGT_SPIN_NO_PREEMPTION;
 
 	A = ctx_create_balanced(i915, siblings, count);
-	a = igt_spin_new(i915, .ctx = A, .flags = spinner);
+	ahnd_A = get_reloc_ahnd(i915, A->id);
+	a = igt_spin_new(i915, .ahnd = ahnd_A, .ctx = A, .flags = spinner);
 	igt_spin_end(a);
 	gem_sync(i915, a->handle);
 
 	B = ctx_create_balanced(i915, siblings, count);
-	b = igt_spin_new(i915, .ctx = B, .flags = spinner);
+	ahnd_B = get_reloc_ahnd(i915, B->id);
+	b = igt_spin_new(i915, .ahnd = ahnd_B, .ctx = B, .flags = spinner);
 	igt_spin_end(b);
 	gem_sync(i915, b->handle);
 
@@ -1047,6 +1066,8 @@ static void __bonded_dual(int i915,
 
 	intel_ctx_destroy(i915, A);
 	intel_ctx_destroy(i915, B);
+	put_ahnd(ahnd_A);
+	put_ahnd(ahnd_B);
 
 	*out = cycles;
 }
@@ -1334,11 +1355,13 @@ static void __bonded_nohang(int i915, const intel_ctx_t *ctx,
 	};
 	igt_spin_t *time, *spin;
 	const intel_ctx_t *load;
+	uint64_t ahnd0 = get_reloc_ahnd(i915, 0), ahnd;
 
 	load = ctx_create_balanced(i915, siblings, count);
 	gem_context_set_priority(i915, load->id, 1023);
+	ahnd = get_reloc_ahnd(i915, load->id);
 
-	spin = igt_spin_new(i915, .ctx = load, .engine = 1);
+	spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = load, .engine = 1);
 
 	/* Master on engine 1, stuck behind a spinner */
 	execbuf.flags = 1 | I915_EXEC_FENCE_OUT;
@@ -1352,13 +1375,15 @@ static void __bonded_nohang(int i915, const intel_ctx_t *ctx,
 	igt_debugfs_dump(i915, "i915_engine_info");
 
 	/* The master will remain blocked until the spinner is reset */
-	time = igt_spin_new(i915, .flags = IGT_SPIN_NO_PREEMPTION); /* rcs0 */
+	time = igt_spin_new(i915, .ahnd = ahnd0,
+			    .flags = IGT_SPIN_NO_PREEMPTION); /* rcs0 */
 	while (gem_bo_busy(i915, time->handle)) {
 		igt_spin_t *next;
 
 		if (flags & NOHANG) {
 			/* Keep replacing spin, so that it doesn't hang */
-			next = igt_spin_new(i915, .ctx = load, .engine = 1);
+			next = igt_spin_new(i915, .ahnd = ahnd, .ctx = load,
+					    .engine = 1);
 			igt_spin_free(i915, spin);
 			spin = next;
 		}
@@ -1368,6 +1393,8 @@ static void __bonded_nohang(int i915, const intel_ctx_t *ctx,
 	}
 	igt_spin_free(i915, time);
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
+	put_ahnd(ahnd0);
 
 	/* Check the bonded pair completed and were not declared hung */
 	igt_assert_eq(sync_fence_status(execbuf.rsvd2 & 0xffffffff), 1);
@@ -1520,6 +1547,7 @@ static void busy(int i915)
 		unsigned int count;
 		igt_spin_t *spin[2];
 		const intel_ctx_t *ctx;
+		uint64_t ahnd;
 
 		ci = list_engines(i915, 1u << class, &count);
 		if (!ci)
@@ -1527,11 +1555,14 @@ static void busy(int i915)
 
 		ctx = ctx_create_balanced(i915, ci, count);
 		free(ci);
+		ahnd = get_simple_l2h_ahnd(i915, ctx->id);
 
 		spin[0] = __igt_spin_new(i915,
+					 .ahnd = ahnd,
 					 .ctx = ctx,
 					 .flags = IGT_SPIN_POLL_RUN);
 		spin[1] = __igt_spin_new(i915,
+					 .ahnd = ahnd,
 					 .ctx = ctx,
 					 .dependency = scratch);
 
@@ -1557,6 +1588,7 @@ static void busy(int i915)
 		igt_spin_free(i915, spin[0]);
 
 		intel_ctx_destroy(i915, ctx);
+		put_ahnd(ahnd);
 	}
 
 	gem_close(i915, scratch);
@@ -1596,6 +1628,7 @@ static void full(int i915, unsigned int flags)
 		double load;
 		int fence = -1;
 		int *pmu;
+		uint64_t ahnd;
 
 		ci = list_engines(i915, 1u << class, &count);
 		if (!ci)
@@ -1631,7 +1664,9 @@ static void full(int i915, unsigned int flags)
 			ctx = ctx_create_balanced(i915, ci, count);
 
 			if (spin == NULL) {
-				spin = __igt_spin_new(i915, .ctx = ctx);
+				ahnd = get_reloc_ahnd(i915, ctx->id);
+				spin = __igt_spin_new(i915, .ahnd = ahnd,
+						      .ctx = ctx);
 			} else {
 				struct drm_i915_gem_execbuffer2 eb = {
 					.buffers_ptr = spin->execbuf.buffers_ptr,
@@ -1653,6 +1688,7 @@ static void full(int i915, unsigned int flags)
 
 		load = measure_min_load(pmu[0], count, 10000);
 		igt_spin_free(i915, spin);
+		put_ahnd(ahnd);
 
 		close(pmu[0]);
 		free(pmu);
@@ -1669,18 +1705,18 @@ static void full(int i915, unsigned int flags)
 	gem_quiescent_gpu(i915);
 }
 
-static void __sliced(int i915,
+static void __sliced(int i915, uint64_t ahnd,
 		     const intel_ctx_t *ctx, unsigned int count,
 		     unsigned int flags)
 {
 	igt_spin_t *load[count];
 	igt_spin_t *virtual;
 
-	virtual = igt_spin_new(i915, .ctx = ctx, .engine = 0,
+	virtual = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx, .engine = 0,
 			       .flags = (IGT_SPIN_FENCE_OUT |
 					 IGT_SPIN_POLL_RUN));
 	for (int i = 0; i < count; i++)
-		load[i] = __igt_spin_new(i915, .ctx = ctx,
+		load[i] = __igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 					 .engine = i + 1,
 					 .fence = virtual->out_fence,
 					 .flags = flags);
@@ -1732,16 +1768,19 @@ static void sliced(int i915)
 
 		igt_fork(child, count) {
 			const intel_ctx_t *ctx;
+			uint64_t ahnd;
 
 			ctx = ctx_create_balanced(i915, ci, count);
+			ahnd = get_reloc_ahnd(i915, ctx->id);
 
 			/* Independent load */
-			__sliced(i915, ctx, count, 0);
+			__sliced(i915, ahnd, ctx, count, 0);
 
 			/* Dependent load */
-			__sliced(i915, ctx, count, IGT_SPIN_FENCE_IN);
+			__sliced(i915, ahnd, ctx, count, IGT_SPIN_FENCE_IN);
 
 			intel_ctx_destroy(i915, ctx);
+			put_ahnd(ahnd);
 		}
 		igt_waitchildren();
 
@@ -1756,14 +1795,15 @@ static void __hog(int i915, const intel_ctx_t *ctx, unsigned int count)
 	int64_t timeout = 50 * 1000 * 1000; /* 50ms */
 	igt_spin_t *virtual;
 	igt_spin_t *hog;
+	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
 
-	virtual = igt_spin_new(i915, .ctx = ctx, .engine = 0);
+	virtual = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx, .engine = 0);
 	for (int i = 0; i < count; i++)
 		gem_execbuf(i915, &virtual->execbuf);
 	usleep(50 * 1000); /* 50ms, long enough to spread across all engines */
 
 	gem_context_set_priority(i915, ctx->id, 1023);
-	hog = __igt_spin_new(i915, .ctx = ctx,
+	hog = __igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 			     .engine = 1 + (random() % count),
 			     .flags = (IGT_SPIN_POLL_RUN |
 				       IGT_SPIN_NO_PREEMPTION));
@@ -1780,6 +1820,7 @@ static void __hog(int i915, const intel_ctx_t *ctx, unsigned int count)
 
 	igt_spin_free(i915, hog);
 	igt_spin_free(i915, virtual);
+	put_ahnd(ahnd);
 }
 
 static void hog(int i915)
@@ -2149,6 +2190,7 @@ static void semaphore(int i915)
 {
 	uint32_t scratch;
 	igt_spin_t *spin[3];
+	uint64_t ahnd0 = get_simple_l2h_ahnd(i915, 0);
 
 	/*
 	 * If we are using HW semaphores to launch serialised requests
@@ -2158,7 +2200,7 @@ static void semaphore(int i915)
 	igt_require(gem_scheduler_has_preemption(i915));
 
 	scratch = gem_create(i915, 4096);
-	spin[2] = igt_spin_new(i915, .dependency = scratch);
+	spin[2] = igt_spin_new(i915, .ahnd = ahnd0, .dependency = scratch);
 	for (int class = 1; class < 32; class++) {
 		struct i915_engine_class_instance *ci;
 		unsigned int count;
@@ -2177,6 +2219,7 @@ static void semaphore(int i915)
 		for (int i = 0; i < count; i++) {
 			block[i] = ctx_create_balanced(i915, ci, count);
 			spin[i] = __igt_spin_new(i915,
+						 .ahnd = ahnd0,
 						 .ctx = block[i],
 						 .dependency = scratch);
 		}
@@ -2198,6 +2241,7 @@ static void semaphore(int i915)
 	}
 	igt_spin_free(i915, spin[2]);
 	gem_close(i915, scratch);
+	put_ahnd(ahnd0);
 
 	gem_quiescent_gpu(i915);
 }
@@ -2250,9 +2294,11 @@ static void hangme(int i915)
 			const intel_ctx_t *ctx;
 			struct client *c = &client[i];
 			unsigned int flags;
+			uint64_t ahnd;
 
 			ctx = ctx_create_balanced(i915, ci, count);
 			set_unbannable(i915, ctx->id);
+			ahnd = get_reloc_ahnd(i915, ctx->id);
 
 			flags = IGT_SPIN_FENCE_IN |
 				IGT_SPIN_FENCE_OUT |
@@ -2260,7 +2306,9 @@ static void hangme(int i915)
 			if (!gem_engine_has_cmdparser(i915, &ctx->cfg, 0))
 				flags |= IGT_SPIN_INVALID_CS;
 			for (int j = 0; j < ARRAY_SIZE(c->spin); j++)  {
-				c->spin[j] = __igt_spin_new(i915, .ctx = ctx,
+				c->spin[j] = __igt_spin_new(i915,
+							    .ahnd = ahnd,
+							    .ctx = ctx,
 							    .fence = fence,
 							    .flags = flags);
 				flags = IGT_SPIN_FENCE_OUT;
@@ -2288,6 +2336,7 @@ static void hangme(int i915)
 		for (int i = 0; i < count; i++) {
 			struct client *c = &client[i];
 			int64_t timeout;
+			uint64_t ahnd;
 
 			igt_debug("Waiting for client[%d].spin[%d]\n", i, 0);
 			timeout = NSEC_PER_SEC / 2;
@@ -2304,8 +2353,10 @@ static void hangme(int i915)
 			igt_assert_eq(sync_fence_status(c->spin[1]->out_fence),
 				      -EIO);
 
+			ahnd = c->spin[0]->ahnd;
 			igt_spin_free(i915, c->spin[0]);
 			igt_spin_free(i915, c->spin[1]);
+			put_ahnd(ahnd);
 		}
 		free(client);
 	}
@@ -2398,12 +2449,14 @@ static void smoketest(int i915, int timeout)
 
 static uint32_t read_ctx_timestamp(int i915, const intel_ctx_t *ctx)
 {
+	bool has_relocs = gem_has_relocations(i915);
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_exec_object2 obj = {
 		.handle = gem_create(i915, 4096),
 		.offset = 32 << 20,
 		.relocs_ptr = to_user_pointer(&reloc),
-		.relocation_count = 1,
+		.relocation_count = has_relocs,
+		.flags = has_relocs ? 0 : EXEC_OBJECT_PINNED,
 	};
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&obj),
@@ -2483,6 +2536,7 @@ static void __fairslice(int i915,
 	const intel_ctx_t *ctx[count + 1];
 	uint32_t ts[count + 1];
 	double threshold;
+	uint64_t ahnd = get_reloc_ahnd(i915, 0); /* ctx id is not important */
 
 	igt_debug("Launching %zd spinners on %s\n",
 		  ARRAY_SIZE(ctx), class_to_str(ci->engine_class));
@@ -2491,7 +2545,7 @@ static void __fairslice(int i915,
 	for (int i = 0; i < ARRAY_SIZE(ctx); i++) {
 		ctx[i] = ctx_create_balanced(i915, ci, count);
 		if (spin == NULL) {
-			spin = __igt_spin_new(i915, .ctx = ctx[i]);
+			spin = __igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx[i]);
 		} else {
 			struct drm_i915_gem_execbuffer2 eb = {
 				.buffer_count = 1,
@@ -2514,6 +2568,7 @@ static void __fairslice(int i915,
 	for (int i = 0; i < ARRAY_SIZE(ctx); i++)
 		intel_ctx_destroy(i915, ctx[i]);
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 
 	/*
 	 * If we imagine that the timeslices are randomly distributed to
@@ -2578,6 +2633,7 @@ static void __persistence(int i915,
 {
 	igt_spin_t *spin;
 	const intel_ctx_t *ctx;
+	uint64_t ahnd;
 
 	/*
 	 * A nonpersistent context is terminated immediately upon closure,
@@ -2587,14 +2643,16 @@ static void __persistence(int i915,
 	ctx = ctx_create_balanced(i915, ci, count);
 	if (!persistent)
 		gem_context_set_persistence(i915, ctx->id, persistent);
+	ahnd = get_reloc_ahnd(i915, ctx->id);
 
-	spin = igt_spin_new(i915, .ctx = ctx,
+	spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 			    .flags = IGT_SPIN_FENCE_OUT | IGT_SPIN_POLL_RUN);
 	igt_spin_busywait_until_started(spin);
 	intel_ctx_destroy(i915, ctx);
 
 	igt_assert_eq(wait_for_status(spin->out_fence, 500), -EIO);
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 }
 
 static void persistence(int i915)
@@ -2784,9 +2842,6 @@ igt_main
 	igt_subtest("semaphore")
 		semaphore(i915);
 
-	igt_subtest("sliced")
-		sliced(i915);
-
 	igt_subtest("hog")
 		hog(i915);
 
@@ -2802,12 +2857,27 @@ igt_main
 	igt_subtest("bonded-semaphore")
 		bonded_semaphore(i915);
 
-	igt_subtest("bonded-pair")
-		bonded_runner(i915, __bonded_pair);
-	igt_subtest("bonded-dual")
-		bonded_runner(i915, __bonded_dual);
-	igt_subtest("bonded-sync")
-		bonded_runner(i915, __bonded_sync);
+	igt_subtest_group {
+		igt_fixture {
+			intel_allocator_multiprocess_start();
+		}
+
+		igt_subtest("sliced")
+			sliced(i915);
+
+		igt_subtest("bonded-pair")
+			bonded_runner(i915, __bonded_pair);
+
+		igt_subtest("bonded-dual")
+			bonded_runner(i915, __bonded_dual);
+
+		igt_subtest("bonded-sync")
+			bonded_runner(i915, __bonded_sync);
+
+		igt_fixture {
+			intel_allocator_multiprocess_stop();
+		}
+	}
 
 	igt_fixture {
 		igt_stop_hang_detector();
-- 
2.26.0
