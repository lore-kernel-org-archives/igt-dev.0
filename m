Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Fri, 26 Nov 2021 15:10:46 +0000
Message-Id: <20211126151046.496270-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_balancer: Make sure
 some tests are run to declare success
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

I accidentally noticed a bunch of tests need two engines of the same class
to do anything meanigful but they report success even if they can't run.

Half way through making them skip instead, I realised it was possibly a
design choice to avoid flip-flopping on the CI (shards). Sigh. It is still
very unfortunate to have tests declaring success when they did not
actually do anything due machine requirements not being met. How much of a
a hostage to CI reporting limitations should the IGT suite be? Discuss.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tests/i915/gem_exec_balancer.c | 90 ++++++++++++++++++++++++++++++++--
 1 file changed, 85 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index cc07a5a992c7..a13d4cdc930e 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -747,6 +747,8 @@ static void __bonded_chain_inv(int i915,
 
 static void bonded_chain(int i915)
 {
+	unsigned int tested = 0;
+
 	/*
 	 * Given batches A, B and B', where B and B' are a bonded pair, with
 	 * B' depending on B with a submit fence and B depending on A as
@@ -759,11 +761,14 @@ static void bonded_chain(int i915)
 
 		siblings = list_engines(i915, 1u << class, &count);
 		if (count > 1) {
+			tested++;
 			__bonded_chain(i915, siblings, count);
 			__bonded_chain_inv(i915, siblings, count);
 		}
 		free(siblings);
 	}
+
+	igt_require(tested > 0);
 }
 
 static void __bonded_sema(int i915,
@@ -849,6 +854,8 @@ static void __bonded_sema(int i915,
 
 static void bonded_semaphore(int i915)
 {
+	unsigned int tested = 0;
+
 	/*
 	 * Given batches A, B and B', where B and B' are a bonded pair, with
 	 * B' depending on B with a submit fence and B depending on A as
@@ -863,10 +870,14 @@ static void bonded_semaphore(int i915)
 		unsigned int count;
 
 		siblings = list_engines(i915, 1u << class, &count);
-		if (count > 1)
+		if (count > 1) {
+			tested++;
 			__bonded_sema(i915, siblings, count);
+		}
 		free(siblings);
 	}
+
+	igt_require(tested > 0);
 }
 
 static void __bonded_pair(int i915,
@@ -1278,6 +1289,7 @@ bonded_runner(int i915,
 		B_HOSTILE | B_FENCE,
 		B_HOSTILE | B_DELAY,
 	};
+	unsigned int tested = 0;
 	unsigned long *cycles;
 
 	/*
@@ -1295,6 +1307,7 @@ bonded_runner(int i915,
 
 		siblings = list_engines(i915, 1u << class, &count);
 		if (count > 1) {
+			tested++;
 			igt_info("Class %u, 1 thread\n", class);
 			for (int i = 0; i < ARRAY_SIZE(phases); i++) {
 				cycles[0] = 0;
@@ -1342,6 +1355,8 @@ bonded_runner(int i915,
 	}
 
 	munmap(cycles, 4096);
+
+	igt_require(tested > 0);
 }
 
 static void __bonded_nohang(int i915, const intel_ctx_t *ctx,
@@ -1414,6 +1429,7 @@ static void __bonded_nohang(int i915, const intel_ctx_t *ctx,
 
 static void bonded_nohang(int i915, unsigned int flags)
 {
+	unsigned int tested = 0;
 	const intel_ctx_t *ctx;
 
 	/*
@@ -1430,12 +1446,16 @@ static void bonded_nohang(int i915, unsigned int flags)
 		unsigned int count;
 
 		siblings = list_engines(i915, 1u << class, &count);
-		if (count > 1)
+		if (count > 1) {
+			tested++;
 			__bonded_nohang(i915, ctx, siblings, count, flags);
+		}
 		free(siblings);
 	}
 
 	intel_ctx_destroy(i915, ctx);
+
+	igt_require(tested > 0);
 }
 
 static void indices(int i915)
@@ -1741,6 +1761,8 @@ static void __sliced(int i915, uint64_t ahnd,
 
 static void sliced(int i915)
 {
+	unsigned int tested = 0;
+
 	/*
 	 * Let's investigate what happens when the virtual request is
 	 * timesliced away.
@@ -1771,6 +1793,8 @@ static void sliced(int i915)
 			continue;
 		}
 
+		tested++;
+
 		igt_fork(child, count) {
 			const intel_ctx_t *ctx;
 			uint64_t ahnd;
@@ -1793,6 +1817,8 @@ static void sliced(int i915)
 	}
 
 	gem_quiescent_gpu(i915);
+
+	igt_require(tested > 0);
 }
 
 static void __hog(int i915, const intel_ctx_t *ctx, unsigned int count)
@@ -1830,6 +1856,8 @@ static void __hog(int i915, const intel_ctx_t *ctx, unsigned int count)
 
 static void hog(int i915)
 {
+	unsigned int tested = 0;
+
 	/*
 	 * Suppose there we are, happily using an engine, minding our
 	 * own business, when all of a sudden a very important process
@@ -1854,6 +1882,8 @@ static void hog(int i915)
 			continue;
 		}
 
+		tested++;
+
 		ctx = ctx_create_balanced(i915, ci, count);
 
 		__hog(i915, ctx, count);
@@ -1865,6 +1895,8 @@ static void hog(int i915)
 	}
 
 	gem_quiescent_gpu(i915);
+
+	igt_require(tested > 0);
 }
 
 static uint32_t sema_create(int i915, uint64_t addr, uint32_t **x)
@@ -1969,6 +2001,7 @@ static void __waits(int i915, int timeout,
 
 static void waits(int i915, int timeout)
 {
+	unsigned int tested = 0;
 	bool nonblock;
 
 	nonblock = fcntl(i915, F_GETFL) & O_NONBLOCK;
@@ -1983,8 +2016,10 @@ static void waits(int i915, int timeout)
 		if (!ci)
 			continue;
 
-		if (count > 1)
+		if (count > 1) {
+			tested++;
 			__waits(i915, timeout, ci, count);
+		}
 
 		free(ci);
 	}
@@ -1993,6 +2028,8 @@ static void waits(int i915, int timeout)
 		fcntl(i915, F_SETFL, fcntl(i915, F_GETFL) & ~O_NONBLOCK);
 
 	gem_quiescent_gpu(i915);
+
+	igt_require(tested > 0);
 }
 
 static void nop(int i915)
@@ -2120,6 +2157,7 @@ static void sequential(int i915)
 	struct drm_i915_gem_exec_object2 batch = {
 		.handle = batch_create(i915),
 	};
+	unsigned int tested = 0;
 
 	for (int class = 0; class < 32; class++) {
 		struct i915_engine_class_instance *ci;
@@ -2138,6 +2176,8 @@ static void sequential(int i915)
 		if (!ci || count < 2)
 			goto next;
 
+		tested++;
+
 		ctx = malloc(sizeof(*ctx) * count);
 		for (int n = 0; n < count; n++)
 			ctx[n] = ctx_create_balanced(i915, ci, count);
@@ -2173,6 +2213,8 @@ next:
 
 	gem_close(i915, batch.handle);
 	gem_quiescent_gpu(i915);
+
+	igt_require(tested > 0);
 }
 
 static void ping(int i915, const intel_ctx_t *ctx, unsigned int engine)
@@ -2196,6 +2238,7 @@ static void semaphore(int i915)
 	uint32_t scratch;
 	igt_spin_t *spin[3];
 	uint64_t ahnd0 = get_simple_l2h_ahnd(i915, 0);
+	unsigned int tested = 0;
 
 	/*
 	 * If we are using HW semaphores to launch serialised requests
@@ -2218,6 +2261,8 @@ static void semaphore(int i915)
 		if (count < ARRAY_SIZE(block))
 			continue;
 
+		tested++;
+
 		/* Ensure that we completely occupy all engines in this group */
 		count = ARRAY_SIZE(block);
 
@@ -2249,6 +2294,8 @@ static void semaphore(int i915)
 	put_ahnd(ahnd0);
 
 	gem_quiescent_gpu(i915);
+
+	igt_require(tested > 0);
 }
 
 static void set_unbannable(int i915, uint32_t ctx)
@@ -2266,6 +2313,7 @@ static void hangme(int i915)
 	struct drm_i915_gem_exec_object2 batch = {
 		.handle = batch_create(i915),
 	};
+	unsigned int tested = 0;
 
 	/*
 	 * Fill the available engines with hanging virtual engines and verify
@@ -2291,6 +2339,8 @@ static void hangme(int i915)
 			continue;
 		}
 
+		tested++;
+
 		client = malloc(sizeof(*client) * count);
 		igt_assert(client);
 
@@ -2368,6 +2418,8 @@ static void hangme(int i915)
 
 	gem_close(i915, batch.handle);
 	gem_quiescent_gpu(i915);
+
+	igt_require(tested > 0);
 }
 
 static void smoketest(int i915, int timeout)
@@ -2402,8 +2454,8 @@ static void smoketest(int i915, int timeout)
 
 		free(ci);
 	}
-	if (!nctx) /* suppress the fluctuating status of shard-icl */
-		return;
+
+	igt_require(nctx);
 
 	igt_debug("Created %d virtual engines (one per context)\n", nctx);
 	ctx = realloc(ctx, sizeof(*ctx) * nctx * 4);
@@ -2602,6 +2654,8 @@ static void __fairslice(int i915,
 
 static void fairslice(int i915)
 {
+	unsigned int tested = 0;
+
 	/* Relative CS mmio */
 	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 11);
 
@@ -2615,9 +2669,12 @@ static void fairslice(int i915)
 			continue;
 		}
 
+		tested++;
 		__fairslice(i915, ci, count, 2);
 		free(ci);
 	}
+
+	igt_require(tested > 0);
 }
 
 static int wait_for_status(int fence, int timeout)
@@ -2662,6 +2719,8 @@ static void __persistence(int i915,
 
 static void persistence(int i915)
 {
+	unsigned int tested = 0;
+
 	for (int class = 0; class < 32; class++) {
 		struct i915_engine_class_instance *ci;
 		unsigned int count = 0;
@@ -2672,9 +2731,12 @@ static void persistence(int i915)
 			continue;
 		}
 
+		tested++;
 		__persistence(i915, ci, count, false);
 		free(ci);
 	}
+
+	igt_require(tested > 0);
 }
 
 static bool set_heartbeat(int i915, const char *name, unsigned int value)
@@ -2698,6 +2760,7 @@ static bool set_heartbeat(int i915, const char *name, unsigned int value)
 static void noheartbeat(int i915)
 {
 	const struct intel_execution_engine2 *e;
+	unsigned int tested = 0;
 
 	/*
 	 * Check that non-persistent contexts are also cleaned up if we
@@ -2718,11 +2781,13 @@ static void noheartbeat(int i915)
 			continue;
 		}
 
+		tested++;
 		__persistence(i915, ci, count, true);
 		free(ci);
 	}
 
 	igt_require_gem(i915); /* restore default parameters */
+	igt_require(tested > 0);
 }
 
 static bool enable_hangcheck(int dir, bool state)
@@ -2733,6 +2798,7 @@ static bool enable_hangcheck(int dir, bool state)
 static void nohangcheck(int i915)
 {
 	int params = igt_params_open(i915);
+	unsigned int tested = 0;
 
 	igt_require(enable_hangcheck(params, false));
 
@@ -2746,12 +2812,14 @@ static void nohangcheck(int i915)
 			continue;
 		}
 
+		tested++;
 		__persistence(i915, ci, count, true);
 		free(ci);
 	}
 
 	enable_hangcheck(params, true);
 	close(params);
+	igt_require(tested > 0);
 }
 
 static void check_bo(int i915, uint32_t handle, unsigned int expected,
@@ -2945,6 +3013,7 @@ static void parallel_thread(int i915, unsigned int flags,
 
 static void parallel(int i915, unsigned int flags)
 {
+	unsigned int tested = 0;
 	int class;
 
 	for (class = 0; class < 32; class++) {
@@ -2960,6 +3029,7 @@ static void parallel(int i915, unsigned int flags)
 			continue;
 		}
 
+		tested++;
 		logical_sort_siblings(i915, siblings, count);
 		bb_per_execbuf = count;
 
@@ -2968,10 +3038,13 @@ static void parallel(int i915, unsigned int flags)
 
 		free(siblings);
 	}
+
+	igt_require(tested > 0);
 }
 
 static void parallel_balancer(int i915, unsigned int flags)
 {
+	unsigned int tested = 0;
 	int class;
 
 	for (class = 0; class < 32; class++) {
@@ -2988,6 +3061,7 @@ static void parallel_balancer(int i915, unsigned int flags)
 			continue;
 		}
 
+		tested++;
 		logical_sort_siblings(i915, siblings, count);
 
 		for (bb_per_execbuf = 2; count / bb_per_execbuf > 1;
@@ -3003,6 +3077,8 @@ static void parallel_balancer(int i915, unsigned int flags)
 
 		free(siblings);
 	}
+
+	igt_require(tested > 0);
 }
 
 static bool fence_busy(int fence)
@@ -3049,6 +3125,7 @@ static unsigned int get_timeslice(int i915,
  */
 static void parallel_ordering(int i915, unsigned int flags)
 {
+	unsigned int tested = 0;
 	int class;
 
 	for (class = 0; class < 32; class++) {
@@ -3071,6 +3148,7 @@ static void parallel_ordering(int i915, unsigned int flags)
 			continue;
 		}
 
+		tested++;
 		logical_sort_siblings(i915, siblings, count);
 
 		memset(&cfg, 0, sizeof(cfg));
@@ -3153,6 +3231,8 @@ static void parallel_ordering(int i915, unsigned int flags)
 		free(siblings);
 		igt_spin_free(i915, spin);
 	}
+
+	igt_require(tested > 0);
 }
 
 static bool has_persistence(int i915)
-- 
2.32.0
