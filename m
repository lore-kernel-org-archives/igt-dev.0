Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89ABE6E170
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 14:45:25 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 b14-20020a17090a7aceb029017261c7d206so3845907pjl.5
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jul 2021 07:45:25 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  7 Jul 2021 09:43:37 -0500
Message-Id: <20210707144337.180693-50-jason@jlekstrand.net>
In-Reply-To: <20210707144337.180693-1-jason@jlekstrand.net>
References: <20210707144337.180693-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 49/81] tests/i915/gem_exec_balancer: Don't
 reset engines on a context (v2)
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
just use a new context.  Everything interesting gets swapped out when we
set CONTEXT_PARAM_ENGINES so this is equivalent as long as
SINGLE_TIMELINE isn't used.  If SINGLE_TIMELINE is used then the
timeline is associated with the context and that gets lost when we set
CONTEXT_PARAM_ENGINES.  The only test where this flag is used is the
bonded tests but those wait for the GPU to idle between iterations so
replacing the timeline is a no-op.

v2 (Jason Ekstrand):
 - Improve comments and commit message

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_balancer.c | 172 ++++++++++++++++++---------------
 1 file changed, 94 insertions(+), 78 deletions(-)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 2452fe93e..13b1495de 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -28,6 +28,7 @@
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
+#include "i915/gem_vm.h"
 #include "igt.h"
 #include "igt_gt.h"
 #include "igt_perf.h"
@@ -123,6 +124,21 @@ static bool has_perf_engines(int i915)
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
@@ -544,8 +560,6 @@ static void check_individual_engine(int i915,
 
 static void individual(int i915)
 {
-	uint32_t ctx;
-
 	/*
 	 * I915_CONTEXT_PARAM_ENGINE allows us to index into the user
 	 * supplied array from gem_execbuf(). Our check is to build the
@@ -554,8 +568,6 @@ static void individual(int i915)
 	 * was busy.
 	 */
 
-	ctx = gem_context_create(i915);
-
 	for (int class = 0; class < 32; class++) {
 		struct i915_engine_class_instance *ci;
 		unsigned int count;
@@ -565,17 +577,20 @@ static void individual(int i915)
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
 
@@ -584,7 +599,7 @@ static void bonded(int i915, unsigned int flags)
 {
 	I915_DEFINE_CONTEXT_ENGINES_BOND(bonds[16], 1);
 	struct i915_engine_class_instance *master_engines;
-	uint32_t master;
+	uint32_t vm;
 
 	/*
 	 * I915_CONTEXT_PARAM_ENGINE provides an extension that allows us
@@ -592,7 +607,7 @@ static void bonded(int i915, unsigned int flags)
 	 * request submitted to another engine.
 	 */
 
-	master = gem_queue_create(i915);
+	vm = gem_vm_create(i915);
 
 	memset(bonds, 0, sizeof(bonds));
 	for (int n = 0; n < ARRAY_SIZE(bonds); n++) {
@@ -605,7 +620,7 @@ static void bonded(int i915, unsigned int flags)
 	for (int class = 0; class < 32; class++) {
 		struct i915_engine_class_instance *siblings;
 		unsigned int count, limit, *order;
-		uint32_t ctx;
+		uint32_t master, ctx;
 		int n;
 
 		siblings = list_engines(i915, 1u << class, &count);
@@ -618,6 +633,8 @@ static void bonded(int i915, unsigned int flags)
 		}
 
 		master_engines = list_engines(i915, ~(1u << class), &limit);
+		master = gem_context_create_ext(i915, I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE, 0);
+		set_vm(i915, master, vm);
 		set_engines(i915, master, master_engines, limit);
 
 		limit = min(count, limit);
@@ -627,9 +644,9 @@ static void bonded(int i915, unsigned int flags)
 			bonds[n].engines[0] = siblings[n];
 		}
 
-		ctx = gem_context_clone(i915,
-					master, I915_CONTEXT_CLONE_VM,
-					I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE);
+		ctx = gem_context_create_ext(i915, I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE, 0);
+		set_vm(i915, ctx, vm);
+		set_engines(i915, ctx, master_engines, limit);
 		set_load_balancer(i915, ctx, siblings, count, &bonds[limit - 1]);
 
 		order = malloc(sizeof(*order) * 8 * limit);
@@ -711,12 +728,11 @@ static void bonded(int i915, unsigned int flags)
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
@@ -761,7 +777,6 @@ static uint32_t create_semaphore_to_spinner(int i915, igt_spin_t *spin)
 
 static void bonded_slice(int i915)
 {
-	uint32_t ctx;
 	int *stop;
 
 	/*
@@ -774,13 +789,12 @@ static void bonded_slice(int i915)
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
@@ -804,6 +818,7 @@ static void bonded_slice(int i915)
 		 * XXX add explicit bonding options for A->B
 		 */
 
+		ctx = gem_context_create(i915); /* NB timeline per engine */
 		set_load_balancer(i915, ctx, siblings, count, NULL);
 
 		spin = __igt_spin_new(i915,
@@ -865,13 +880,13 @@ static void bonded_slice(int i915)
 
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
@@ -882,12 +897,14 @@ static void __bonded_chain(int i915, uint32_t ctx,
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
@@ -897,17 +914,20 @@ static void __bonded_chain(int i915, uint32_t ctx,
 				    .flags = (IGT_SPIN_POLL_RUN |
 					      IGT_SPIN_FENCE_OUT));
 		igt_spin_busywait_until_started(spin);
-		gem_context_set_priority(i915, ctx, 0);
 
 		/*
-		 * Note we replace the timelines between each execbuf, so
-		 * that any pair of requests on the same engine could be
-		 * re-ordered by the scheduler -- if the dependency tracking
-		 * is subpar.
+		 * Note we replace the contexts and their timelines between
+		 * each execbuf, so that any pair of requests on the same
+		 * engine could be re-ordered by the scheduler -- if the
+		 * dependency tracking is subpar.
 		 */
 
 		/* B: waits for A on engine 2 */
+		gem_context_destroy(i915, ctx);
+		ctx = gem_context_create(i915);
+		gem_context_set_priority(i915, ctx, 0);
 		set_load_balancer(i915, ctx, siblings, count, NULL);
+		execbuf.rsvd1 = ctx;
 		execbuf.rsvd2 = spin->out_fence;
 		execbuf.flags = I915_EXEC_FENCE_IN | I915_EXEC_FENCE_OUT;
 		execbuf.flags |= 2; /* opposite engine to spinner */
@@ -916,7 +936,6 @@ static void __bonded_chain(int i915, uint32_t ctx,
 		/* B': run in parallel with B on engine 1, i.e. not before A! */
 		if (priorities[i] > 0)
 			gem_context_set_priority(i915, ctx, priorities[i]);
-		set_load_balancer(i915, ctx, siblings, count, NULL);
 		execbuf.flags = I915_EXEC_FENCE_SUBMIT | I915_EXEC_FENCE_OUT;
 		execbuf.flags |= 1; /* same engine as spinner */
 		execbuf.rsvd2 >>= 32;
@@ -938,6 +957,7 @@ static void __bonded_chain(int i915, uint32_t ctx,
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 >> 32), 0);
 
 		igt_spin_free(i915, spin);
+		gem_context_destroy(i915, ctx);
 		gem_sync(i915, batch.handle);
 
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 & 0xffffffff), 1);
@@ -950,7 +970,7 @@ static void __bonded_chain(int i915, uint32_t ctx,
 	gem_close(i915, batch.handle);
 }
 
-static void __bonded_chain_inv(int i915, uint32_t ctx,
+static void __bonded_chain_inv(int i915,
 			       const struct i915_engine_class_instance *siblings,
 			       unsigned int count)
 {
@@ -961,12 +981,14 @@ static void __bonded_chain_inv(int i915, uint32_t ctx,
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
@@ -976,17 +998,13 @@ static void __bonded_chain_inv(int i915, uint32_t ctx,
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
@@ -995,7 +1013,6 @@ static void __bonded_chain_inv(int i915, uint32_t ctx,
 		/* B': run in parallel with B on engine 2, i.e. not before A! */
 		if (priorities[i] > 0)
 			gem_context_set_priority(i915, ctx, priorities[i]);
-		set_load_balancer(i915, ctx, siblings, count, NULL);
 		execbuf.flags = I915_EXEC_FENCE_SUBMIT | I915_EXEC_FENCE_OUT;
 		execbuf.flags |= 2; /* opposite engine to spinner */
 		execbuf.rsvd2 >>= 32;
@@ -1018,6 +1035,7 @@ static void __bonded_chain_inv(int i915, uint32_t ctx,
 
 		igt_spin_free(i915, spin);
 		gem_sync(i915, batch.handle);
+		gem_context_destroy(i915, ctx);
 
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 & 0xffffffff), 1);
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 >> 32), 1);
@@ -1031,32 +1049,26 @@ static void __bonded_chain_inv(int i915, uint32_t ctx,
 
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
@@ -1067,11 +1079,12 @@ static void __bonded_sema(int i915, uint32_t ctx,
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
@@ -1079,23 +1092,28 @@ static void __bonded_sema(int i915, uint32_t ctx,
 		igt_spin_busywait_until_started(spin);
 
 		/*
-		 * Note we replace the timelines between each execbuf, so
-		 * that any pair of requests on the same engine could be
-		 * re-ordered by the scheduler -- if the dependency tracking
-		 * is subpar.
+		 * Note we replace the contexts and their timelines between
+		 * each execbuf, so that any pair of requests on the same
+		 * engine could be re-ordered by the scheduler -- if the
+		 * dependency tracking is subpar.
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
@@ -1118,6 +1136,7 @@ static void __bonded_sema(int i915, uint32_t ctx,
 
 		igt_spin_free(i915, spin);
 		gem_sync(i915, batch.handle);
+		gem_context_destroy(i915, ctx);
 
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 & 0xffffffff), 1);
 		igt_assert_eq(sync_fence_status(execbuf.rsvd2 >> 32), 1);
@@ -1131,8 +1150,6 @@ static void __bonded_sema(int i915, uint32_t ctx,
 
 static void bonded_semaphore(int i915)
 {
-	uint32_t ctx;
-
 	/*
 	 * Given batches A, B and B', where B and B' are a bonded pair, with
 	 * B' depending on B with a submit fence and B depending on A as
@@ -1142,19 +1159,15 @@ static void bonded_semaphore(int i915)
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
@@ -1805,7 +1818,7 @@ static void indices(int i915)
 	gem_quiescent_gpu(i915);
 }
 
-static void __bonded_early(int i915, uint32_t ctx,
+static void __bonded_early(int i915,
 			   const struct i915_engine_class_instance *siblings,
 			   unsigned int count,
 			   unsigned int flags)
@@ -1818,8 +1831,8 @@ static void __bonded_early(int i915, uint32_t ctx,
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&batch),
 		.buffer_count = 1,
-		.rsvd1 = ctx,
 	};
+	uint32_t vm, ctx;
 	igt_spin_t *spin;
 
 	memset(bonds, 0, sizeof(bonds));
@@ -1833,6 +1846,11 @@ static void __bonded_early(int i915, uint32_t ctx,
 		bonds[n].engines[0] = siblings[(n + 1) % count];
 	}
 
+	/* We share a VM so that the spin cancel will work without a reloc */
+	vm = gem_vm_create(i915);
+
+	ctx = gem_context_create(i915);
+	set_vm(i915, ctx, vm);
 	set_load_balancer(i915, ctx, siblings, count,
 			  flags & VIRTUAL_ENGINE ? &bonds : NULL);
 
@@ -1843,6 +1861,7 @@ static void __bonded_early(int i915, uint32_t ctx,
 			    .flags = IGT_SPIN_NO_PREEMPTION);
 
 	/* B: runs after A on engine 1 */
+	execbuf.rsvd1 = ctx;
 	execbuf.flags = I915_EXEC_FENCE_OUT;
 	execbuf.flags |= spin->execbuf.flags & 63;
 	gem_execbuf_wr(i915, &execbuf);
@@ -1860,9 +1879,14 @@ static void __bonded_early(int i915, uint32_t ctx,
 
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
@@ -1879,14 +1903,13 @@ static void __bonded_early(int i915, uint32_t ctx,
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
@@ -1902,21 +1925,17 @@ static void bonded_early(int i915)
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
@@ -2571,7 +2590,7 @@ static void ping(int i915, uint32_t ctx, unsigned int engine)
 
 static void semaphore(int i915)
 {
-	uint32_t block[2], scratch;
+	uint32_t scratch;
 	igt_spin_t *spin[3];
 
 	/*
@@ -2581,15 +2600,12 @@ static void semaphore(int i915)
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
@@ -2602,6 +2618,7 @@ static void semaphore(int i915)
 		count = ARRAY_SIZE(block);
 
 		for (int i = 0; i < count; i++) {
+			block[i] = gem_context_create(i915);
 			set_load_balancer(i915, block[i], ci, count, NULL);
 			spin[i] = __igt_spin_new(i915,
 						 .ctx_id = block[i],
@@ -2617,17 +2634,16 @@ static void semaphore(int i915)
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
