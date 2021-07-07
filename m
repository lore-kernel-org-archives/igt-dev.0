Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9526E17A
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 14:46:52 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 h1-20020a17090a3d01b0290172d33bb8bcso3885497pjc.0
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jul 2021 07:46:52 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  7 Jul 2021 09:46:13 -0500
Message-Id: <20210707144643.181001-2-jason@jlekstrand.net>
In-Reply-To: <20210707144337.180693-1-jason@jlekstrand.net>
References: <20210707144337.180693-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 51/81] tests/i915/gem_exec_balancer: Drop
 bonded tests
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

Support for combining bonding and balancing is being removed from i915
because it's not used by media.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_balancer.c | 330 ---------------------------------
 1 file changed, 330 deletions(-)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 6ef8433aa..e6f742310 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -124,21 +124,6 @@ static bool has_perf_engines(int i915)
 	return i915_perf_type_id(i915);
 }
 
-static int __set_vm(int i915, uint32_t ctx, uint32_t vm)
-{
-	struct drm_i915_gem_context_param p = {
-		.ctx_id = ctx,
-		.param = I915_CONTEXT_PARAM_VM,
-		.value = vm
-	};
-	return __gem_context_set_param(i915, &p);
-}
-
-static void set_vm(int i915, uint32_t ctx, uint32_t vm)
-{
-	igt_assert_eq(__set_vm(i915, ctx, vm), 0);
-}
-
 static int __set_engines(int i915, uint32_t ctx,
 			 const struct i915_engine_class_instance *ci,
 			 unsigned int count)
@@ -485,31 +470,6 @@ static double measure_min_load(int pmu, unsigned int num, int period_us)
 	return min / (double)d_t;
 }
 
-static void measure_all_load(int pmu, double *v, unsigned int num, int period_us)
-{
-	uint64_t data[2 + num];
-	uint64_t d_t, d_v[num];
-
-	kick_kthreads();
-
-	igt_assert_eq(read(pmu, data, sizeof(data)), sizeof(data));
-	for (unsigned int n = 0; n < num; n++)
-		d_v[n] = -data[2 + n];
-	d_t = -data[1];
-
-	usleep(period_us);
-
-	igt_assert_eq(read(pmu, data, sizeof(data)), sizeof(data));
-
-	d_t += data[1];
-	for (unsigned int n = 0; n < num; n++) {
-		d_v[n] += data[2 + n];
-		igt_debug("engine[%d]: %.1f%%\n",
-			  n, d_v[n] / (double)d_t * 100);
-		v[n] = d_v[n] / (double)d_t;
-	}
-}
-
 static int
 add_pmu(int i915, int pmu, const struct i915_engine_class_instance *ci)
 {
@@ -594,147 +554,6 @@ static void individual(int i915)
 	gem_quiescent_gpu(i915);
 }
 
-static void bonded(int i915, unsigned int flags)
-#define CORK 0x1
-{
-	I915_DEFINE_CONTEXT_ENGINES_BOND(bonds[16], 1);
-	struct i915_engine_class_instance *master_engines;
-	uint32_t vm;
-
-	/*
-	 * I915_CONTEXT_PARAM_ENGINE provides an extension that allows us
-	 * to specify which engine(s) to pair with a parallel (EXEC_SUBMIT)
-	 * request submitted to another engine.
-	 */
-
-	vm = gem_vm_create(i915);
-
-	memset(bonds, 0, sizeof(bonds));
-	for (int n = 0; n < ARRAY_SIZE(bonds); n++) {
-		bonds[n].base.name = I915_CONTEXT_ENGINES_EXT_BOND;
-		bonds[n].base.next_extension =
-			n ? to_user_pointer(&bonds[n - 1]) : 0;
-		bonds[n].num_bonds = 1;
-	}
-
-	for (int class = 0; class < 32; class++) {
-		struct i915_engine_class_instance *siblings;
-		unsigned int count, limit, *order;
-		uint32_t master, ctx;
-		int n;
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
-		master_engines = list_engines(i915, ~(1u << class), &limit);
-		master = gem_context_create_ext(i915, I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE, 0);
-		set_vm(i915, master, vm);
-		set_engines(i915, master, master_engines, limit);
-
-		limit = min(count, limit);
-		igt_assert(limit <= ARRAY_SIZE(bonds));
-		for (n = 0; n < limit; n++) {
-			bonds[n].master = master_engines[n];
-			bonds[n].engines[0] = siblings[n];
-		}
-
-		ctx = gem_context_create_ext(i915, I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE, 0);
-		set_vm(i915, ctx, vm);
-		set_engines(i915, ctx, master_engines, limit);
-		set_load_balancer(i915, ctx, siblings, count, &bonds[limit - 1]);
-
-		order = malloc(sizeof(*order) * 8 * limit);
-		igt_assert(order);
-		for (n = 0; n < limit; n++)
-			order[2 * limit - n - 1] = order[n] = n % limit;
-		memcpy(order + 2 * limit, order, 2 * limit * sizeof(*order));
-		memcpy(order + 4 * limit, order, 4 * limit * sizeof(*order));
-		igt_permute_array(order + 2 * limit, 6 * limit, igt_exchange_int);
-
-		for (n = 0; n < 8 * limit; n++) {
-			struct drm_i915_gem_execbuffer2 eb;
-			igt_spin_t *spin, *plug;
-			IGT_CORK_HANDLE(cork);
-			double v[limit];
-			int pmu[limit + 1];
-			int bond = order[n];
-
-			pmu[0] = -1;
-			for (int i = 0; i < limit; i++)
-				pmu[i] = add_pmu(i915, pmu[0], &siblings[i]);
-			pmu[limit] = add_pmu(i915,
-					     pmu[0], &master_engines[bond]);
-
-			igt_assert(siblings[bond].engine_class !=
-				   master_engines[bond].engine_class);
-
-			plug = NULL;
-			if (flags & CORK) {
-				plug = __igt_spin_new(i915,
-						      .ctx_id = master,
-						      .engine = bond,
-						      .dependency = igt_cork_plug(&cork, i915));
-			}
-
-			spin = __igt_spin_new(i915,
-					      .ctx_id = master,
-					      .engine = bond,
-					      .flags = IGT_SPIN_FENCE_OUT);
-
-			eb = spin->execbuf;
-			eb.rsvd1 = ctx;
-			eb.rsvd2 = spin->out_fence;
-			eb.flags = I915_EXEC_FENCE_SUBMIT;
-			gem_execbuf(i915, &eb);
-
-			if (plug) {
-				igt_cork_unplug(&cork);
-				igt_spin_free(i915, plug);
-			}
-
-			measure_all_load(pmu[0], v, limit + 1, 10000);
-			igt_spin_free(i915, spin);
-
-			igt_assert_f(v[bond] > 0.90,
-				     "engine %d (class:instance %s:%d) was found to be only %.1f%% busy\n",
-				     bond,
-				     class_to_str(siblings[bond].engine_class),
-				     siblings[bond].engine_instance,
-				     100 * v[bond]);
-			for (int other = 0; other < limit; other++) {
-				if (other == bond)
-					continue;
-
-				igt_assert_f(v[other] == 0,
-					     "engine %d (class:instance %s:%d) was not idle, and actually %.1f%% busy\n",
-					     other,
-					     class_to_str(siblings[other].engine_class),
-					     siblings[other].engine_instance,
-					     100 * v[other]);
-			}
-			igt_assert_f(v[limit] > 0.90,
-				     "master (class:instance %s:%d) was found to be only %.1f%% busy\n",
-				     class_to_str(master_engines[bond].engine_class),
-				     master_engines[bond].engine_instance,
-				     100 * v[limit]);
-
-			close(pmu[0]);
-		}
-
-		free(order);
-		gem_context_destroy(i915, master);
-		gem_context_destroy(i915, ctx);
-		free(master_engines);
-		free(siblings);
-	}
-}
-
 #define VIRTUAL_ENGINE (1u << 0)
 
 static unsigned int offset_in_page(void *addr)
@@ -1818,126 +1637,6 @@ static void indices(int i915)
 	gem_quiescent_gpu(i915);
 }
 
-static void __bonded_early(int i915,
-			   const struct i915_engine_class_instance *siblings,
-			   unsigned int count,
-			   unsigned int flags)
-{
-	I915_DEFINE_CONTEXT_ENGINES_BOND(bonds[count], 1);
-	uint32_t handle = batch_create(i915);
-	struct drm_i915_gem_exec_object2 batch = {
-		.handle = handle,
-	};
-	struct drm_i915_gem_execbuffer2 execbuf = {
-		.buffers_ptr = to_user_pointer(&batch),
-		.buffer_count = 1,
-	};
-	uint32_t vm, ctx;
-	igt_spin_t *spin;
-
-	memset(bonds, 0, sizeof(bonds));
-	for (int n = 0; n < ARRAY_SIZE(bonds); n++) {
-		bonds[n].base.name = I915_CONTEXT_ENGINES_EXT_BOND;
-		bonds[n].base.next_extension =
-			n ? to_user_pointer(&bonds[n - 1]) : 0;
-
-		bonds[n].master = siblings[n];
-		bonds[n].num_bonds = 1;
-		bonds[n].engines[0] = siblings[(n + 1) % count];
-	}
-
-	/* We share a VM so that the spin cancel will work without a reloc */
-	vm = gem_vm_create(i915);
-
-	ctx = gem_context_create(i915);
-	set_vm(i915, ctx, vm);
-	set_load_balancer(i915, ctx, siblings, count,
-			  flags & VIRTUAL_ENGINE ? &bonds : NULL);
-
-	/* A: spin forever on engine 1 */
-	spin = igt_spin_new(i915,
-			    .ctx_id = ctx,
-			    .engine = (flags & VIRTUAL_ENGINE) ? 0 : 1,
-			    .flags = IGT_SPIN_NO_PREEMPTION);
-
-	/* B: runs after A on engine 1 */
-	execbuf.rsvd1 = ctx;
-	execbuf.flags = I915_EXEC_FENCE_OUT;
-	execbuf.flags |= spin->execbuf.flags & 63;
-	gem_execbuf_wr(i915, &execbuf);
-
-	/* B': run in parallel with B on engine 2, i.e. not before A! */
-	execbuf.flags = I915_EXEC_FENCE_SUBMIT | I915_EXEC_FENCE_OUT;
-	if(!(flags & VIRTUAL_ENGINE))
-		execbuf.flags |= 2;
-	execbuf.rsvd2 >>= 32;
-	gem_execbuf_wr(i915, &execbuf);
-
-	/* C: prevent anything running on engine 2 after B' */
-	spin->execbuf.flags = execbuf.flags & 63;
-	gem_execbuf(i915, &spin->execbuf);
-
-	igt_debugfs_dump(i915, "i915_engine_info");
-
-	/* D: cancel the spinner from engine 2 (new context) */
-	gem_context_destroy(i915, ctx);
-	ctx = gem_context_create(i915);
-	set_vm(i915, ctx, vm);
-	set_load_balancer(i915, ctx, siblings, count,
-			  flags & VIRTUAL_ENGINE ? &bonds : NULL);
-	batch.handle = create_semaphore_to_spinner(i915, spin);
-	execbuf.rsvd1 = ctx;
-	execbuf.flags = 0;
-	if(!(flags & VIRTUAL_ENGINE))
-		execbuf.flags |= 2;
-	gem_execbuf(i915, &execbuf);
-	gem_close(i915, batch.handle);
-
-	/* If C runs before D, we never cancel the spinner and so hang */
-	gem_sync(i915, handle);
-
-	/* Check the bonded pair completed successfully */
-	igt_assert_eq(sync_fence_status(execbuf.rsvd2 & 0xffffffff), 1);
-	igt_assert_eq(sync_fence_status(execbuf.rsvd2 >> 32), 1);
-
-	close(execbuf.rsvd2);
-	close(execbuf.rsvd2 >> 32);
-
-	gem_context_destroy(i915, ctx);
-	gem_close(i915, handle);
-	igt_spin_free(i915, spin);
-}
-
-static void bonded_early(int i915)
-{
-	/*
-	 * Our goal is to start the bonded payloads at roughly the same time.
-	 * We do not want to start the secondary batch too early as it will
-	 * do nothing but hog the GPU until the first has a chance to execute.
-	 * So if we were to arbitrary delay the first by running it after a
-	 * spinner...
-	 *
-	 * By using a pair of spinners, we can create a bonded hog that when
-	 * set in motion will fully utilize both engines [if the scheduling is
-	 * incorrect]. We then use a third party submitted after the bonded
-	 * pair to cancel the spinner from the GPU -- if it is unable to run,
-	 * the spinner is never cancelled, and the bonded pair will cause a GPU
-	 * hang.
-	 */
-
-	for (int class = 0; class < 32; class++) {
-		struct i915_engine_class_instance *siblings;
-		unsigned int count;
-
-		siblings = list_engines(i915, 1u << class, &count);
-		if (count > 1) {
-			__bonded_early(i915, siblings, count, 0);
-			__bonded_early(i915, siblings, count, VIRTUAL_ENGINE);
-		}
-		free(siblings);
-	}
-}
-
 static void busy(int i915)
 {
 	uint32_t scratch = gem_create(i915, 4096);
@@ -3178,22 +2877,6 @@ static bool has_load_balancer(int i915)
 	return err == 0;
 }
 
-static bool has_bonding(int i915)
-{
-	I915_DEFINE_CONTEXT_ENGINES_BOND(bonds, 0) = {
-		.base.name = I915_CONTEXT_ENGINES_EXT_BOND,
-	};
-	struct i915_engine_class_instance ci = {};
-	uint32_t ctx;
-	int err;
-
-	ctx = gem_context_create(i915);
-	err = __set_load_balancer(i915, ctx, &ci, 1, &bonds);
-	gem_context_destroy(i915, ctx);
-
-	return err == 0;
-}
-
 igt_main
 {
 	int i915 = -1;
@@ -3265,19 +2948,6 @@ igt_main
 	igt_subtest("smoke")
 		smoketest(i915, 20);
 
-	igt_subtest_group {
-		igt_fixture igt_require(has_bonding(i915));
-
-		igt_subtest("bonded-imm")
-			bonded(i915, 0);
-
-		igt_subtest("bonded-cork")
-			bonded(i915, CORK);
-
-		igt_subtest("bonded-early")
-			bonded_early(i915);
-	}
-
 	igt_subtest("bonded-slice")
 		bonded_slice(i915);
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
