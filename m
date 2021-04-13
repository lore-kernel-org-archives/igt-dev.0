Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7A66E25A
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 03:55:26 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id y32so10980017pga.11
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 20:55:26 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Apr 2021 22:53:39 -0500
Message-Id: <20210413035350.261794-64-jason@jlekstrand.net>
In-Reply-To: <20210413035350.261794-1-jason@jlekstrand.net>
References: <20210413035350.261794-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 63/74] tests/i915/gem_exec_balancer: Don't
 reset engines on a context
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

Instead of resetting the set of engines to break implicit dependencies,
just use a new context.  This does drop a theoretical bit of test
coverage in the bonded chain tests because we can't drop the timeline
easily.  However, those tests also use the FENCE_SUBMIT pattern in a way
that the set of engines is swapped out between the first and second half
of the bonded pair.  That seems pretty sketchy.
---
 tests/i915/gem_exec_balancer.c | 163 +++++++++++++++++----------------
 1 file changed, 86 insertions(+), 77 deletions(-)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 44c9b05d..9fc5fe6d 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -27,6 +27,7 @@
 #include <sys/signal.h>
 
 #include "i915/gem.h"
+#include "i915/gem_vm.h"
 #include "igt.h"
 #include "igt_gt.h"
 #include "igt_perf.h"
@@ -122,6 +123,21 @@ static bool has_perf_engines(int i915)
 	return i915_perf_type_id(i915);
 }
 
+static int __set_vm(int i915, uint32_t ctx, uint32_t vm)
+{
+	struct drm_i915_gem_context_param p = {
+		.ctx_id = ctx,
+		.param = I915_CONTEXT_PARAM_VM,
+		.value = vm
+	};
+	return __gem_context_set_param(i915, &p);
+}
+
+static void set_vm(int i915, uint32_t ctx, uint32_t vm)
+{
+	igt_assert_eq(__set_vm(i915, ctx, vm), 0);
+}
+
 static int __set_engines(int i915, uint32_t ctx,
 			 const struct i915_engine_class_instance *ci,
 			 unsigned int count)
@@ -543,8 +559,6 @@ static void check_individual_engine(int i915,
 
 static void individual(int i915)
 {
-	uint32_t ctx;
-
 	/*
 	 * I915_CONTEXT_PARAM_ENGINE allows us to index into the user
 	 * supplied array from gem_execbuf(). Our check is to build the
@@ -553,8 +567,6 @@ static void individual(int i915)
 	 * was busy.
 	 */
 
-	ctx = gem_context_create(i915);
-
 	for (int class = 0; class < 32; class++) {
 		struct i915_engine_class_instance *ci;
 		unsigned int count;
@@ -564,17 +576,20 @@ static void individual(int i915)
 			continue;
 
 		for (int pass = 0; pass < count; pass++) { /* approx. count! */
+			uint32_t ctx;
+
 			igt_assert(sizeof(*ci) == sizeof(int));
 			igt_permute_array(ci, count, igt_exchange_int);
+			ctx = gem_context_create(i915);
 			set_load_balancer(i915, ctx, ci, count, NULL);
 			for (unsigned int n = 0; n < count; n++)
 				check_individual_engine(i915, ctx, ci, n);
+			gem_context_destroy(i915, ctx);
 		}
 
 		free(ci);
 	}
 
-	gem_context_destroy(i915, ctx);
 	gem_quiescent_gpu(i915);
 }
 
@@ -583,7 +598,7 @@ static void bonded(int i915, unsigned int flags)
 {
 	I915_DEFINE_CONTEXT_ENGINES_BOND(bonds[16], 1);
 	struct i915_engine_class_instance *master_engines;
-	uint32_t master;
+	uint32_t vm;
 
 	/*
 	 * I915_CONTEXT_PARAM_ENGINE provides an extension that allows us
@@ -591,7 +606,7 @@ static void bonded(int i915, unsigned int flags)
 	 * request submitted to another engine.
 	 */
 
-	master = gem_queue_create(i915);
+	vm = gem_vm_create(i915);
 
 	memset(bonds, 0, sizeof(bonds));
 	for (int n = 0; n < ARRAY_SIZE(bonds); n++) {
@@ -604,7 +619,7 @@ static void bonded(int i915, unsigned int flags)
 	for (int class = 0; class < 32; class++) {
 		struct i915_engine_class_instance *siblings;
 		unsigned int count, limit, *order;
-		uint32_t ctx;
+		uint32_t master, ctx;
 		int n;
 
 		siblings = list_engines(i915, 1u << class, &count);
@@ -617,6 +632,8 @@ static void bonded(int i915, unsigned int flags)
 		}
 
 		master_engines = list_engines(i915, ~(1u << class), &limit);
+		master = gem_context_create_ext(i915, I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE, 0);
+		set_vm(i915, master, vm);
 		set_engines(i915, master, master_engines, limit);
 
 		limit = min(count, limit);
@@ -626,9 +643,9 @@ static void bonded(int i915, unsigned int flags)
 			bonds[n].engines[0] = siblings[n];
 		}
 
-		ctx = gem_context_clone(i915,
-					master, I915_CONTEXT_CLONE_VM,
-					I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE);
+		ctx = gem_context_create_ext(i915, I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE, 0);
+		set_vm(i915, master, vm);
+		set_engines(i915, master, master_engines, limit);
 		set_load_balancer(i915, ctx, siblings, count, &bonds[limit - 1]);
 
 		order = malloc(sizeof(*order) * 8 * limit);
@@ -710,12 +727,11 @@ static void bonded(int i915, unsigned int flags)
 		}
 
 		free(order);
+		gem_context_destroy(i915, master);
 		gem_context_destroy(i915, ctx);
 		free(master_engines);
 		free(siblings);
 	}
-
-	gem_context_destroy(i915, master);
 }
 
 #define VIRTUAL_ENGINE (1u << 0)
@@ -760,7 +776,6 @@ static uint32_t create_semaphore_to_spinner(int i915, igt_spin_t *spin)
 
 static void bonded_slice(int i915)
 {
-	uint32_t ctx;
 	int *stop;
 
 	/*
@@ -773,13 +788,12 @@ static void bonded_slice(int i915)
 	stop = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(stop != MAP_FAILED);
 
-	ctx = gem_context_create(i915); /* NB timeline per engine */
-
 	for (int class = 0; class < 32; class++) {
 		struct i915_engine_class_instance *siblings;
 		struct drm_i915_gem_exec_object2 obj[3] = {};
 		struct drm_i915_gem_execbuffer2 eb = {};
 		unsigned int count;
+		uint32_t ctx;
 		igt_spin_t *spin;
 
 		siblings = list_engines(i915, 1u << class, &count);
@@ -803,6 +817,7 @@ static void bonded_slice(int i915)
 		 * XXX add explicit bonding options for A->B
 		 */
 
+		ctx = gem_context_create(i915); /* NB timeline per engine */
 		set_load_balancer(i915, ctx, siblings, count, NULL);
 
 		spin = __igt_spin_new(i915,
@@ -864,13 +879,13 @@ static void bonded_slice(int i915)
 
 		gem_close(i915, obj[2].handle);
 		igt_spin_free(i915, spin);
+		gem_context_destroy(i915, ctx);
 	}
 
-	gem_context_destroy(i915, ctx);
 	munmap(stop, 4096);
 }
 
-static void __bonded_chain(int i915, uint32_t ctx,
+static void __bonded_chain(int i915,
 			   const struct i915_engine_class_instance *siblings,
 			   unsigned int count)
 {
@@ -881,12 +896,14 @@ static void __bonded_chain(int i915, uint32_t ctx,
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&batch),
 		.buffer_count = 1,
-		.rsvd1 = ctx,
 	};
 	igt_spin_t *spin;
 
 	for (int i = 0; i < ARRAY_SIZE(priorities); i++) {
+		uint32_t ctx;
 		/* A: spin forever on engine 1 */
+
+		ctx = gem_context_create(i915);
 		set_load_balancer(i915, ctx, siblings, count, NULL);
 		if (priorities[i] < 0)
 			gem_context_set_priority(i915, ctx, priorities[i]);
@@ -896,17 +913,13 @@ static void __bonded_chain(int i915, uint32_t ctx,
 				    .flags = (IGT_SPIN_POLL_RUN |
 					      IGT_SPIN_FENCE_OUT));
 		igt_spin_busywait_until_started(spin);
-		gem_context_set_priority(i915, ctx, 0);
-
-		/*
-		 * Note we replace the timelines between each execbuf, so
-		 * that any pair of requests on the same engine could be
-		 * re-ordered by the scheduler -- if the dependency tracking
-		 * is subpar.
-		 */
 
 		/* B: waits for A on engine 2 */
+		gem_context_destroy(i915, ctx);
+		ctx = gem_context_create(i915);
+		gem_context_set_priority(i915, ctx, 0);
 		set_load_balancer(i915, ctx, siblings, count, NULL);
+		execbuf.rsvd1 = ctx;
 		execbuf.rsvd2 = spin->out_fence;
 		execbuf.flags = I915_EXEC_FENCE_IN | I915_EXEC_FENCE_OUT;
 		execbuf.flags |= 2; /* opposite engine to spinner */
@@ -915,7 +928,6 @@ static void __bonded_chain(int i915, uint32_t ctx,
 		/* B': run in parallel with B on engine 1, i.e. not before A! */
 		if (priorities[i] > 0)
 			gem_context_set_priority(i915, ctx, priorities[i]);
-		set_load_balancer(i915, ctx, siblings, count, NULL);
 		execbuf.flags = I915_EXEC_FENCE_SUBMIT | I915_EXEC_FENCE_OUT;
 		execbuf.flags |= 1; /* same engine as spinner */
 		execbuf.rsvd2 >>= 32;
@@ -937,6 +949,7 @@ static void __bonded_chain(int i915, uint32_t ctx,
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 >> 32), 0);
 
 		igt_spin_free(i915, spin);
+		gem_context_destroy(i915, ctx);
 		gem_sync(i915, batch.handle);
 
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 & 0xffffffff), 1);
@@ -949,7 +962,7 @@ static void __bonded_chain(int i915, uint32_t ctx,
 	gem_close(i915, batch.handle);
 }
 
-static void __bonded_chain_inv(int i915, uint32_t ctx,
+static void __bonded_chain_inv(int i915,
 			       const struct i915_engine_class_instance *siblings,
 			       unsigned int count)
 {
@@ -960,12 +973,14 @@ static void __bonded_chain_inv(int i915, uint32_t ctx,
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&batch),
 		.buffer_count = 1,
-		.rsvd1 = ctx,
 	};
 	igt_spin_t *spin;
 
 	for (int i = 0; i < ARRAY_SIZE(priorities); i++) {
+		uint32_t ctx;
+
 		/* A: spin forever on engine 1 */
+		ctx = gem_context_create(i915);
 		set_load_balancer(i915, ctx, siblings, count, NULL);
 		if (priorities[i] < 0)
 			gem_context_set_priority(i915, ctx, priorities[i]);
@@ -975,17 +990,13 @@ static void __bonded_chain_inv(int i915, uint32_t ctx,
 				    .flags = (IGT_SPIN_POLL_RUN |
 					      IGT_SPIN_FENCE_OUT));
 		igt_spin_busywait_until_started(spin);
-		gem_context_set_priority(i915, ctx, 0);
-
-		/*
-		 * Note we replace the timelines between each execbuf, so
-		 * that any pair of requests on the same engine could be
-		 * re-ordered by the scheduler -- if the dependency tracking
-		 * is subpar.
-		 */
 
 		/* B: waits for A on engine 1 */
+		gem_context_destroy(i915, ctx);
+		ctx = gem_context_create(i915);
+		gem_context_set_priority(i915, ctx, 0);
 		set_load_balancer(i915, ctx, siblings, count, NULL);
+		execbuf.rsvd1 = ctx;
 		execbuf.rsvd2 = spin->out_fence;
 		execbuf.flags = I915_EXEC_FENCE_IN | I915_EXEC_FENCE_OUT;
 		execbuf.flags |= 1; /* same engine as spinner */
@@ -994,7 +1005,6 @@ static void __bonded_chain_inv(int i915, uint32_t ctx,
 		/* B': run in parallel with B on engine 2, i.e. not before A! */
 		if (priorities[i] > 0)
 			gem_context_set_priority(i915, ctx, priorities[i]);
-		set_load_balancer(i915, ctx, siblings, count, NULL);
 		execbuf.flags = I915_EXEC_FENCE_SUBMIT | I915_EXEC_FENCE_OUT;
 		execbuf.flags |= 2; /* opposite engine to spinner */
 		execbuf.rsvd2 >>= 32;
@@ -1017,6 +1027,7 @@ static void __bonded_chain_inv(int i915, uint32_t ctx,
 
 		igt_spin_free(i915, spin);
 		gem_sync(i915, batch.handle);
+		gem_context_destroy(i915, ctx);
 
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 & 0xffffffff), 1);
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 >> 32), 1);
@@ -1030,32 +1041,26 @@ static void __bonded_chain_inv(int i915, uint32_t ctx,
 
 static void bonded_chain(int i915)
 {
-	uint32_t ctx;
-
 	/*
 	 * Given batches A, B and B', where B and B' are a bonded pair, with
 	 * B' depending on B with a submit fence and B depending on A as
 	 * an ordinary fence; prove B' cannot complete before A.
 	 */
 
-	ctx = gem_context_create(i915);
-
 	for (int class = 0; class < 32; class++) {
 		struct i915_engine_class_instance *siblings;
 		unsigned int count;
 
 		siblings = list_engines(i915, 1u << class, &count);
 		if (count > 1) {
-			__bonded_chain(i915, ctx, siblings, count);
-			__bonded_chain_inv(i915, ctx, siblings, count);
+			__bonded_chain(i915, siblings, count);
+			__bonded_chain_inv(i915, siblings, count);
 		}
 		free(siblings);
 	}
-
-	gem_context_destroy(i915, ctx);
 }
 
-static void __bonded_sema(int i915, uint32_t ctx,
+static void __bonded_sema(int i915,
 			  const struct i915_engine_class_instance *siblings,
 			  unsigned int count)
 {
@@ -1066,11 +1071,12 @@ static void __bonded_sema(int i915, uint32_t ctx,
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&batch),
 		.buffer_count = 1,
-		.rsvd1 = ctx,
 	};
 	igt_spin_t *spin;
 
 	for (int i = 0; i < ARRAY_SIZE(priorities); i++) {
+		uint32_t ctx;
+
 		/* A: spin forever on seperate render engine */
 		spin = igt_spin_new(i915,
 				    .flags = (IGT_SPIN_POLL_RUN |
@@ -1085,16 +1091,21 @@ static void __bonded_sema(int i915, uint32_t ctx,
 		 */
 
 		/* B: waits for A (using a semaphore) on engine 1 */
+		ctx = gem_context_create(i915);
 		set_load_balancer(i915, ctx, siblings, count, NULL);
+		execbuf.rsvd1 = ctx;
 		execbuf.rsvd2 = spin->out_fence;
 		execbuf.flags = I915_EXEC_FENCE_IN | I915_EXEC_FENCE_OUT;
 		execbuf.flags |= 1;
 		gem_execbuf_wr(i915, &execbuf);
 
 		/* B': run in parallel with B on engine 2 */
+		gem_context_destroy(i915, ctx);
+		ctx = gem_context_create(i915);
 		if (priorities[i] > 0)
 			gem_context_set_priority(i915, ctx, priorities[i]);
 		set_load_balancer(i915, ctx, siblings, count, NULL);
+		execbuf.rsvd1 = ctx;
 		execbuf.flags = I915_EXEC_FENCE_SUBMIT | I915_EXEC_FENCE_OUT;
 		execbuf.flags |= 2;
 		execbuf.rsvd2 >>= 32;
@@ -1117,6 +1128,7 @@ static void __bonded_sema(int i915, uint32_t ctx,
 
 		igt_spin_free(i915, spin);
 		gem_sync(i915, batch.handle);
+		gem_context_destroy(i915, ctx);
 
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 & 0xffffffff), 1);
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 >> 32), 1);
@@ -1130,8 +1142,6 @@ static void __bonded_sema(int i915, uint32_t ctx,
 
 static void bonded_semaphore(int i915)
 {
-	uint32_t ctx;
-
 	/*
 	 * Given batches A, B and B', where B and B' are a bonded pair, with
 	 * B' depending on B with a submit fence and B depending on A as
@@ -1141,19 +1151,15 @@ static void bonded_semaphore(int i915)
 	 */
 	igt_require(gem_scheduler_has_semaphores(i915));
 
-	ctx = gem_context_create(i915);
-
 	for (int class = 1; class < 32; class++) {
 		struct i915_engine_class_instance *siblings;
 		unsigned int count;
 
 		siblings = list_engines(i915, 1u << class, &count);
 		if (count > 1)
-			__bonded_sema(i915, ctx, siblings, count);
+			__bonded_sema(i915, siblings, count);
 		free(siblings);
 	}
-
-	gem_context_destroy(i915, ctx);
 }
 
 static void __bonded_pair(int i915,
@@ -1804,7 +1810,7 @@ static void indices(int i915)
 	gem_quiescent_gpu(i915);
 }
 
-static void __bonded_early(int i915, uint32_t ctx,
+static void __bonded_early(int i915,
 			   const struct i915_engine_class_instance *siblings,
 			   unsigned int count,
 			   unsigned int flags)
@@ -1817,8 +1823,8 @@ static void __bonded_early(int i915, uint32_t ctx,
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&batch),
 		.buffer_count = 1,
-		.rsvd1 = ctx,
 	};
+	uint32_t vm, ctx;
 	igt_spin_t *spin;
 
 	memset(bonds, 0, sizeof(bonds));
@@ -1832,6 +1838,11 @@ static void __bonded_early(int i915, uint32_t ctx,
 		bonds[n].engines[0] = siblings[(n + 1) % count];
 	}
 
+	/* We share a VM so that the spin cancel will work without a reloc */
+	vm = gem_vm_create(i915);
+
+	ctx = gem_context_create(i915);
+	set_vm(i915, ctx, vm);
 	set_load_balancer(i915, ctx, siblings, count,
 			  flags & VIRTUAL_ENGINE ? &bonds : NULL);
 
@@ -1842,6 +1853,7 @@ static void __bonded_early(int i915, uint32_t ctx,
 			    .flags = IGT_SPIN_NO_PREEMPTION);
 
 	/* B: runs after A on engine 1 */
+	execbuf.rsvd1 = ctx;
 	execbuf.flags = I915_EXEC_FENCE_OUT;
 	execbuf.flags |= spin->execbuf.flags & 63;
 	gem_execbuf_wr(i915, &execbuf);
@@ -1859,9 +1871,14 @@ static void __bonded_early(int i915, uint32_t ctx,
 
 	igt_debugfs_dump(i915, "i915_engine_info");
 
-	/* D: cancel the spinner from engine 2 (new timeline) */
-	set_load_balancer(i915, ctx, siblings, count, NULL);
+	/* D: cancel the spinner from engine 2 (new context) */
+	gem_context_destroy(i915, ctx);
+	ctx = gem_context_create(i915);
+	set_vm(i915, ctx, vm);
+	set_load_balancer(i915, ctx, siblings, count,
+			  flags & VIRTUAL_ENGINE ? &bonds : NULL);
 	batch.handle = create_semaphore_to_spinner(i915, spin);
+	execbuf.rsvd1 = ctx;
 	execbuf.flags = 0;
 	if(!(flags & VIRTUAL_ENGINE))
 		execbuf.flags |= 2;
@@ -1878,14 +1895,13 @@ static void __bonded_early(int i915, uint32_t ctx,
 	close(execbuf.rsvd2);
 	close(execbuf.rsvd2 >> 32);
 
+	gem_context_destroy(i915, ctx);
 	gem_close(i915, handle);
 	igt_spin_free(i915, spin);
 }
 
 static void bonded_early(int i915)
 {
-	uint32_t ctx;
-
 	/*
 	 * Our goal is to start the bonded payloads at roughly the same time.
 	 * We do not want to start the secondary batch too early as it will
@@ -1901,21 +1917,17 @@ static void bonded_early(int i915)
 	 * hang.
 	 */
 
-	ctx = gem_context_create(i915);
-
 	for (int class = 0; class < 32; class++) {
 		struct i915_engine_class_instance *siblings;
 		unsigned int count;
 
 		siblings = list_engines(i915, 1u << class, &count);
 		if (count > 1) {
-			__bonded_early(i915, ctx, siblings, count, 0);
-			__bonded_early(i915, ctx, siblings, count, VIRTUAL_ENGINE);
+			__bonded_early(i915, siblings, count, 0);
+			__bonded_early(i915, siblings, count, VIRTUAL_ENGINE);
 		}
 		free(siblings);
 	}
-
-	gem_context_destroy(i915, ctx);
 }
 
 static void busy(int i915)
@@ -2570,7 +2582,7 @@ static void ping(int i915, uint32_t ctx, unsigned int engine)
 
 static void semaphore(int i915)
 {
-	uint32_t block[2], scratch;
+	uint32_t scratch;
 	igt_spin_t *spin[3];
 
 	/*
@@ -2580,15 +2592,12 @@ static void semaphore(int i915)
 	 */
 	igt_require(gem_scheduler_has_preemption(i915));
 
-	block[0] = gem_context_create(i915);
-	block[1] = gem_context_create(i915);
-
 	scratch = gem_create(i915, 4096);
 	spin[2] = igt_spin_new(i915, .dependency = scratch);
 	for (int class = 1; class < 32; class++) {
 		struct i915_engine_class_instance *ci;
 		unsigned int count;
-		uint32_t vip;
+		uint32_t block[2], vip;
 
 		ci = list_engines(i915, 1u << class, &count);
 		if (!ci)
@@ -2601,6 +2610,7 @@ static void semaphore(int i915)
 		count = ARRAY_SIZE(block);
 
 		for (int i = 0; i < count; i++) {
+			block[i] = gem_context_create(i915);
 			set_load_balancer(i915, block[i], ci, count, NULL);
 			spin[i] = __igt_spin_new(i915,
 						 .ctx_id = block[i],
@@ -2616,17 +2626,16 @@ static void semaphore(int i915)
 		ping(i915, vip, 0);
 		gem_context_destroy(i915, vip);
 
-		for (int i = 0; i < count; i++)
+		for (int i = 0; i < count; i++) {
 			igt_spin_free(i915, spin[i]);
+			gem_context_destroy(i915, block[i]);
+		}
 
 		free(ci);
 	}
 	igt_spin_free(i915, spin[2]);
 	gem_close(i915, scratch);
 
-	gem_context_destroy(i915, block[1]);
-	gem_context_destroy(i915, block[0]);
-
 	gem_quiescent_gpu(i915);
 }
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
