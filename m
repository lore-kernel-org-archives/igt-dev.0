Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C8F6E17E
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 14:44:47 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id s18so2481979pgg.8
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jul 2021 07:44:47 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  7 Jul 2021 09:43:16 -0500
Message-Id: <20210707144337.180693-29-jason@jlekstrand.net>
In-Reply-To: <20210707144337.180693-1-jason@jlekstrand.net>
References: <20210707144337.180693-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 28/81] tests/i915/gem_ctx_shared: Convert to
 intel_ctx_t (v2)
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

v2 (Jason Ekstrand):
 - Rework the Q- tests to share a VM and set SINGLE_TIMELINE

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_ctx_shared.c | 303 +++++++++++++++++++++---------------
 1 file changed, 174 insertions(+), 129 deletions(-)

diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
index aedf389c6..97a8dd771 100644
--- a/tests/i915/gem_ctx_shared.c
+++ b/tests/i915/gem_ctx_shared.c
@@ -40,6 +40,7 @@
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "i915/gem_engine_topology.h"
+#include "i915/gem_vm.h"
 #include "igt.h"
 #include "igt_rand.h"
 #include "igt_vgem.h"
@@ -109,11 +110,13 @@ static void create_shared_gtt(int i915, unsigned int flags)
 	gem_close(i915, obj.handle);
 }
 
-static void disjoint_timelines(int i915)
+static void disjoint_timelines(int i915, const intel_ctx_cfg_t *cfg)
 {
 	IGT_CORK_HANDLE(cork);
+	intel_ctx_cfg_t vm_cfg;
+	const intel_ctx_t *ctx[2];
 	igt_spin_t *spin[2];
-	uint32_t plug, child;
+	uint32_t plug;
 
 	igt_require(gem_has_execlists(i915));
 
@@ -122,11 +125,15 @@ static void disjoint_timelines(int i915)
 	 * distinct timelines. A request queued to one context should be
 	 * independent of any shared contexts.
 	 */
-	child = gem_context_clone(i915, 0, I915_CONTEXT_CLONE_VM, 0);
+	vm_cfg = *cfg;
+	vm_cfg.vm = gem_vm_create(i915);
+	ctx[0] = intel_ctx_create(i915, &vm_cfg);
+	ctx[1] = intel_ctx_create(i915, &vm_cfg);
+
 	plug = igt_cork_plug(&cork, i915);
 
-	spin[0] = __igt_spin_new(i915, .ctx_id = 0, .dependency = plug);
-	spin[1] = __igt_spin_new(i915, .ctx_id = child);
+	spin[0] = __igt_spin_new(i915, .ctx = ctx[0], .dependency = plug);
+	spin[1] = __igt_spin_new(i915, .ctx = ctx[1]);
 
 	/* Wait for the second spinner, will hang if stuck behind the first */
 	igt_spin_end(spin[1]);
@@ -136,6 +143,10 @@ static void disjoint_timelines(int i915)
 
 	igt_spin_free(i915, spin[1]);
 	igt_spin_free(i915, spin[0]);
+
+	intel_ctx_destroy(i915, ctx[0]);
+	intel_ctx_destroy(i915, ctx[1]);
+	gem_vm_destroy(i915, vm_cfg.vm);
 }
 
 static void exhaust_shared_gtt(int i915, unsigned int flags)
@@ -185,7 +196,8 @@ static void exhaust_shared_gtt(int i915, unsigned int flags)
 	igt_waitchildren();
 }
 
-static void exec_shared_gtt(int i915, unsigned int ring)
+static void exec_shared_gtt(int i915, const intel_ctx_cfg_t *cfg,
+			    unsigned int ring)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
@@ -195,14 +207,18 @@ static void exec_shared_gtt(int i915, unsigned int ring)
 		.buffer_count = 1,
 		.flags = ring,
 	};
-	uint32_t clone;
+	intel_ctx_cfg_t vm_cfg;
+	const intel_ctx_t *ctx[2];
 	uint32_t scratch, *s;
 	uint32_t batch, cs[16];
 	uint64_t offset;
 	int timeline;
 	int i;
 
-	clone = gem_context_clone(i915, 0, I915_CONTEXT_CLONE_VM, 0);
+	vm_cfg = *cfg;
+	vm_cfg.vm = gem_vm_create(i915);
+	ctx[0] = intel_ctx_create(i915, &vm_cfg);
+	ctx[1] = intel_ctx_create(i915, &vm_cfg);
 
 	/* Find a hole big enough for both objects later */
 	scratch = gem_create(i915, 16384);
@@ -210,9 +226,9 @@ static void exec_shared_gtt(int i915, unsigned int ring)
 	obj.handle = scratch;
 	gem_execbuf(i915, &execbuf);
 	obj.flags |= EXEC_OBJECT_PINNED; /* reuse this address */
-	execbuf.rsvd1 = clone; /* and bind the second context image */
+	execbuf.rsvd1 = ctx[1]->id; /* and bind the second context image */
 	gem_execbuf(i915, &execbuf);
-	execbuf.rsvd1 = 0;
+	execbuf.rsvd1 = ctx[0]->id;
 	gem_close(i915, scratch);
 
 	timeline = sw_sync_timeline_create();
@@ -256,7 +272,7 @@ static void exec_shared_gtt(int i915, unsigned int ring)
 
 	obj.handle = batch;
 	obj.offset += 8192; /* make sure we don't cause an eviction! */
-	execbuf.rsvd1 = clone;
+	execbuf.rsvd1 = ctx[1]->id;
 	if (gen > 3 && gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
 	gem_execbuf(i915, &execbuf);
@@ -288,10 +304,13 @@ static void exec_shared_gtt(int i915, unsigned int ring)
 	munmap(s, 4096);
 	gem_close(i915, scratch);
 
-	gem_context_destroy(i915, clone);
+	intel_ctx_destroy(i915, ctx[0]);
+	intel_ctx_destroy(i915, ctx[1]);
+	gem_vm_destroy(i915, vm_cfg.vm);
 }
 
-static int nop_sync(int i915, uint32_t ctx, unsigned int ring, int64_t timeout)
+static int nop_sync(int i915, const intel_ctx_t *ctx, unsigned int ring,
+		    int64_t timeout)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_exec_object2 obj = {
@@ -301,7 +320,7 @@ static int nop_sync(int i915, uint32_t ctx, unsigned int ring, int64_t timeout)
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
 		.flags = ring,
-		.rsvd1 = ctx,
+		.rsvd1 = ctx->id,
 	};
 	int err;
 
@@ -313,30 +332,19 @@ static int nop_sync(int i915, uint32_t ctx, unsigned int ring, int64_t timeout)
 	return err;
 }
 
-static bool has_single_timeline(int i915)
-{
-	uint32_t ctx = 0;
-
-	__gem_context_clone(i915, 0, 0,
-			    I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE,
-			    &ctx);
-	if (ctx)
-		gem_context_destroy(i915, ctx);
-
-	return ctx != 0;
-}
-
-static void single_timeline(int i915)
+static void single_timeline(int i915, const intel_ctx_cfg_t *cfg)
 {
 	const struct intel_execution_engine2 *e;
 	struct sync_fence_info rings[64];
 	struct sync_file_info sync_file_info = {
 		.num_fences = 1,
 	};
+	intel_ctx_cfg_t st_cfg;
+	const intel_ctx_t *ctx;
 	igt_spin_t *spin;
 	int n;
 
-	igt_require(has_single_timeline(i915));
+	igt_require(gem_context_has_single_timeline(i915));
 
 	spin = igt_spin_new(i915);
 
@@ -347,11 +355,12 @@ static void single_timeline(int i915)
 	 * to, it reports the same timeline name and fence context. However,
 	 * the fence context is not reported through the sync_fence_info.
 	 */
-	spin->execbuf.rsvd1 =
-		gem_context_clone(i915, 0, 0,
-				  I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE);
+	st_cfg = *cfg;
+	st_cfg.flags |= I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE;
+	ctx = intel_ctx_create(i915, &st_cfg);
+	spin->execbuf.rsvd1 = ctx->id;
 	n = 0;
-	____for_each_physical_engine(i915, spin->execbuf.rsvd1, e) {
+	for_each_ctx_engine(i915, ctx, e) {
 		spin->execbuf.flags = e->flags | I915_EXEC_FENCE_OUT;
 
 		gem_execbuf_wr(i915, &spin->execbuf);
@@ -370,32 +379,35 @@ static void single_timeline(int i915)
 		igt_assert(!strcmp(rings[0].driver_name, rings[i].driver_name));
 		igt_assert(!strcmp(rings[0].obj_name, rings[i].obj_name));
 	}
+	intel_ctx_destroy(i915, ctx);
 }
 
-static void exec_single_timeline(int i915, unsigned int engine)
+static void exec_single_timeline(int i915, const intel_ctx_cfg_t *cfg,
+				 unsigned int engine)
 {
 	const struct intel_execution_engine2 *e;
 	igt_spin_t *spin;
-	uint32_t ctx;
+	intel_ctx_cfg_t st_cfg;
+	const intel_ctx_t *ctx;
 
 	/*
 	 * On an ordinary context, a blockage on one engine doesn't prevent
 	 * execution on an other.
 	 */
-	ctx = 0;
+	ctx = intel_ctx_create(i915, cfg);
 	spin = NULL;
-	__for_each_physical_engine(i915, e) {
+	for_each_ctx_cfg_engine(i915, cfg, e) {
 		if (e->flags == engine)
 			continue;
 
 		if (spin == NULL) {
-			spin = __igt_spin_new(i915, .ctx_id = ctx, .engine = e->flags);
+			spin = __igt_spin_new(i915, .ctx = ctx, .engine = e->flags);
 		} else {
 			struct drm_i915_gem_execbuffer2 execbuf = {
 				.buffers_ptr = spin->execbuf.buffers_ptr,
 				.buffer_count = spin->execbuf.buffer_count,
 				.flags = e->flags,
-				.rsvd1 = ctx,
+				.rsvd1 = ctx->id,
 			};
 			gem_execbuf(i915, &execbuf);
 		}
@@ -403,27 +415,29 @@ static void exec_single_timeline(int i915, unsigned int engine)
 	igt_require(spin);
 	igt_assert_eq(nop_sync(i915, ctx, engine, NSEC_PER_SEC), 0);
 	igt_spin_free(i915, spin);
+	intel_ctx_destroy(i915, ctx);
 
 	/*
 	 * But if we create a context with just a single shared timeline,
 	 * then it will block waiting for the earlier requests on the
 	 * other engines.
 	 */
-	ctx = gem_context_clone(i915, 0, 0,
-				I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE);
+	st_cfg = *cfg;
+	st_cfg.flags |= I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE;
+	ctx = intel_ctx_create(i915, &st_cfg);
 	spin = NULL;
-	__for_each_physical_engine(i915, e) {
+	for_each_ctx_cfg_engine(i915, &st_cfg, e) {
 		if (e->flags == engine)
 			continue;
 
 		if (spin == NULL) {
-			spin = __igt_spin_new(i915, .ctx_id = ctx, .engine = e->flags);
+			spin = __igt_spin_new(i915, .ctx = ctx, .engine = e->flags);
 		} else {
 			struct drm_i915_gem_execbuffer2 execbuf = {
 				.buffers_ptr = spin->execbuf.buffers_ptr,
 				.buffer_count = spin->execbuf.buffer_count,
 				.flags = e->flags,
-				.rsvd1 = ctx,
+				.rsvd1 = ctx->id,
 			};
 			gem_execbuf(i915, &execbuf);
 		}
@@ -431,9 +445,10 @@ static void exec_single_timeline(int i915, unsigned int engine)
 	igt_assert(spin);
 	igt_assert_eq(nop_sync(i915, ctx, engine, NSEC_PER_SEC), -ETIME);
 	igt_spin_free(i915, spin);
+	intel_ctx_destroy(i915, ctx);
 }
 
-static void store_dword(int i915, uint32_t ctx, unsigned ring,
+static void store_dword(int i915, const intel_ctx_t *ctx, unsigned ring,
 			uint32_t target, uint32_t offset, uint32_t value,
 			uint32_t cork, unsigned write_domain)
 {
@@ -450,7 +465,7 @@ static void store_dword(int i915, uint32_t ctx, unsigned ring,
 	execbuf.flags = ring;
 	if (gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
-	execbuf.rsvd1 = ctx;
+	execbuf.rsvd1 = ctx->id;
 
 	memset(obj, 0, sizeof(obj));
 	obj[0].handle = cork;
@@ -491,31 +506,30 @@ static void store_dword(int i915, uint32_t ctx, unsigned ring,
 	gem_close(i915, obj[2].handle);
 }
 
-static uint32_t create_highest_priority(int i915)
+static const intel_ctx_t *
+create_highest_priority(int i915, const intel_ctx_cfg_t *cfg)
 {
-	uint32_t ctx = gem_context_clone_with_engines(i915, 0);
+	const intel_ctx_t *ctx = intel_ctx_create(i915, cfg);
 
 	/*
 	 * If there is no priority support, all contexts will have equal
 	 * priority (and therefore the max user priority), so no context
 	 * can overtake us, and we effectively can form a plug.
 	 */
-	__gem_context_set_priority(i915, ctx, MAX_PRIO);
+	__gem_context_set_priority(i915, ctx->id, MAX_PRIO);
 
 	return ctx;
 }
 
-static void unplug_show_queue(int i915, struct igt_cork *c, unsigned int engine)
+static void unplug_show_queue(int i915, struct igt_cork *c,
+			      const intel_ctx_cfg_t *cfg, unsigned int engine)
 {
 	igt_spin_t *spin[MAX_ELSP_QLEN];
 
 	for (int n = 0; n < ARRAY_SIZE(spin); n++) {
-		const struct igt_spin_factory opts = {
-			.ctx_id = create_highest_priority(i915),
-			.engine = engine,
-		};
-		spin[n] = __igt_spin_factory(i915, &opts);
-		gem_context_destroy(i915, opts.ctx_id);
+		const intel_ctx_t *ctx = create_highest_priority(i915, cfg);
+		spin[n] = __igt_spin_new(i915, .ctx = ctx, .engine = engine);
+		intel_ctx_destroy(i915, ctx);
 	}
 
 	igt_cork_unplug(c); /* batches will now be queued on the engine */
@@ -526,7 +540,8 @@ static void unplug_show_queue(int i915, struct igt_cork *c, unsigned int engine)
 }
 
 static uint32_t store_timestamp(int i915,
-				uint32_t ctx, unsigned ring,
+				const intel_ctx_t *ctx,
+				unsigned ring,
 				unsigned mmio_base,
 				int fence,
 				int offset)
@@ -549,7 +564,7 @@ static uint32_t store_timestamp(int i915,
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
 		.flags = ring | I915_EXEC_FENCE_IN,
-		.rsvd1 = ctx,
+		.rsvd1 = ctx->id,
 		.rsvd2 = fence
 	};
 	uint32_t batch[] = {
@@ -577,13 +592,14 @@ static void kick_tasklets(void)
 	sched_yield();
 }
 
-static void independent(int i915,
+static void independent(int i915, const intel_ctx_cfg_t *cfg,
 			const struct intel_execution_engine2 *e,
 			unsigned flags)
 {
 	const int TIMESTAMP = 1023;
 	uint32_t handle[ARRAY_SIZE(priorities)];
 	igt_spin_t *spin[MAX_ELSP_QLEN];
+	intel_ctx_cfg_t q_cfg;
 	unsigned int mmio_base;
 	IGT_CORK_FENCE(cork);
 	int fence;
@@ -591,23 +607,24 @@ static void independent(int i915,
 	mmio_base = gem_engine_mmio_base(i915, e->name);
 	igt_require_f(mmio_base, "mmio base not known\n");
 
+	q_cfg = *cfg;
+	q_cfg.vm = gem_vm_create(i915);
+	q_cfg.flags |= I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE;
+
 	for (int n = 0; n < ARRAY_SIZE(spin); n++) {
-		const struct igt_spin_factory opts = {
-			.ctx_id = create_highest_priority(i915),
-			.engine = e->flags,
-		};
-		spin[n] = __igt_spin_factory(i915, &opts);
-		gem_context_destroy(i915, opts.ctx_id);
+		const intel_ctx_t *ctx = create_highest_priority(i915, &q_cfg);
+		spin[n] = __igt_spin_new(i915, .ctx = ctx, .engine = e->flags);
+		intel_ctx_destroy(i915, ctx);
 	}
 
 	fence = igt_cork_plug(&cork, i915);
 	for (int i = 0; i < ARRAY_SIZE(priorities); i++) {
-		uint32_t ctx = gem_queue_create(i915);
-		gem_context_set_priority(i915, ctx, priorities[i]);
+		const intel_ctx_t *ctx = create_highest_priority(i915, &q_cfg);
+		gem_context_set_priority(i915, ctx->id, priorities[i]);
 		handle[i] = store_timestamp(i915, ctx,
 					    e->flags, mmio_base,
 					    fence, TIMESTAMP);
-		gem_context_destroy(i915, ctx);
+		intel_ctx_destroy(i915, ctx);
 	}
 	close(fence);
 	kick_tasklets(); /* XXX try to hide cmdparser delays XXX */
@@ -634,22 +651,30 @@ static void independent(int i915,
 	}
 
 	igt_assert((int32_t)(handle[HI] - handle[LO]) < 0);
+
+	gem_vm_destroy(i915, q_cfg.vm);
 }
 
-static void reorder(int i915, unsigned ring, unsigned flags)
+static void reorder(int i915, const intel_ctx_cfg_t *cfg,
+		    unsigned ring, unsigned flags)
 #define EQUAL 1
 {
 	IGT_CORK_HANDLE(cork);
 	uint32_t scratch;
 	uint32_t *ptr;
-	uint32_t ctx[2];
+	intel_ctx_cfg_t q_cfg;
+	const intel_ctx_t *ctx[2];
 	uint32_t plug;
 
-	ctx[LO] = gem_queue_create(i915);
-	gem_context_set_priority(i915, ctx[LO], MIN_PRIO);
+	q_cfg = *cfg;
+	q_cfg.vm = gem_vm_create(i915);
+	q_cfg.flags |= I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE;
+
+	ctx[LO] = intel_ctx_create(i915, &q_cfg);
+	gem_context_set_priority(i915, ctx[LO]->id, MIN_PRIO);
 
-	ctx[HI] = gem_queue_create(i915);
-	gem_context_set_priority(i915, ctx[HI], flags & EQUAL ? MIN_PRIO : 0);
+	ctx[HI] = intel_ctx_create(i915, &q_cfg);
+	gem_context_set_priority(i915, ctx[HI]->id, flags & EQUAL ? MIN_PRIO : 0);
 
 	scratch = gem_create(i915, 4096);
 	plug = igt_cork_plug(&cork, i915);
@@ -657,43 +682,50 @@ static void reorder(int i915, unsigned ring, unsigned flags)
 	/* We expect the high priority context to be executed first, and
 	 * so the final result will be value from the low priority context.
 	 */
-	store_dword(i915, ctx[LO], ring, scratch, 0, ctx[LO], plug, 0);
-	store_dword(i915, ctx[HI], ring, scratch, 0, ctx[HI], plug, 0);
+	store_dword(i915, ctx[LO], ring, scratch, 0, ctx[LO]->id, plug, 0);
+	store_dword(i915, ctx[HI], ring, scratch, 0, ctx[HI]->id, plug, 0);
 
-	unplug_show_queue(i915, &cork, ring);
+	unplug_show_queue(i915, &cork, &q_cfg, ring);
 	gem_close(i915, plug);
 
-	gem_context_destroy(i915, ctx[LO]);
-	gem_context_destroy(i915, ctx[HI]);
-
 	ptr = gem_mmap__device_coherent(i915, scratch, 0, 4096, PROT_READ);
 	gem_set_domain(i915, scratch, /* no write hazard lies! */
 		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	gem_close(i915, scratch);
 
 	if (flags & EQUAL) /* equal priority, result will be fifo */
-		igt_assert_eq_u32(ptr[0], ctx[HI]);
+		igt_assert_eq_u32(ptr[0], ctx[HI]->id);
 	else
-		igt_assert_eq_u32(ptr[0], ctx[LO]);
+		igt_assert_eq_u32(ptr[0], ctx[LO]->id);
 	munmap(ptr, 4096);
+
+	intel_ctx_destroy(i915, ctx[LO]);
+	intel_ctx_destroy(i915, ctx[HI]);
+
+	gem_vm_destroy(i915, q_cfg.vm);
 }
 
-static void promotion(int i915, unsigned ring)
+static void promotion(int i915, const intel_ctx_cfg_t *cfg, unsigned ring)
 {
 	IGT_CORK_HANDLE(cork);
 	uint32_t result, dep;
 	uint32_t *ptr;
-	uint32_t ctx[3];
+	intel_ctx_cfg_t q_cfg;
+	const intel_ctx_t *ctx[3];
 	uint32_t plug;
 
-	ctx[LO] = gem_queue_create(i915);
-	gem_context_set_priority(i915, ctx[LO], MIN_PRIO);
+	q_cfg = *cfg;
+	q_cfg.vm = gem_vm_create(i915);
+	q_cfg.flags |= I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE;
+
+	ctx[LO] = intel_ctx_create(i915, &q_cfg);
+	gem_context_set_priority(i915, ctx[LO]->id, MIN_PRIO);
 
-	ctx[HI] = gem_queue_create(i915);
-	gem_context_set_priority(i915, ctx[HI], 0);
+	ctx[HI] = intel_ctx_create(i915, &q_cfg);
+	gem_context_set_priority(i915, ctx[HI]->id, 0);
 
-	ctx[NOISE] = gem_queue_create(i915);
-	gem_context_set_priority(i915, ctx[NOISE], MIN_PRIO/2);
+	ctx[NOISE] = intel_ctx_create(i915, &q_cfg);
+	gem_context_set_priority(i915, ctx[NOISE]->id, MIN_PRIO/2);
 
 	result = gem_create(i915, 4096);
 	dep = gem_create(i915, 4096);
@@ -705,28 +737,24 @@ static void promotion(int i915, unsigned ring)
 	 * fifo would be NOISE, LO, HI.
 	 * strict priority would be  HI, NOISE, LO
 	 */
-	store_dword(i915, ctx[NOISE], ring, result, 0, ctx[NOISE], plug, 0);
-	store_dword(i915, ctx[LO], ring, result, 0, ctx[LO], plug, 0);
+	store_dword(i915, ctx[NOISE], ring, result, 0, ctx[NOISE]->id, plug, 0);
+	store_dword(i915, ctx[LO], ring, result, 0, ctx[LO]->id, plug, 0);
 
 	/* link LO <-> HI via a dependency on another buffer */
-	store_dword(i915, ctx[LO], ring, dep, 0, ctx[LO], 0, I915_GEM_DOMAIN_INSTRUCTION);
-	store_dword(i915, ctx[HI], ring, dep, 0, ctx[HI], 0, 0);
+	store_dword(i915, ctx[LO], ring, dep, 0, ctx[LO]->id, 0, I915_GEM_DOMAIN_INSTRUCTION);
+	store_dword(i915, ctx[HI], ring, dep, 0, ctx[HI]->id, 0, 0);
 
-	store_dword(i915, ctx[HI], ring, result, 0, ctx[HI], 0, 0);
+	store_dword(i915, ctx[HI], ring, result, 0, ctx[HI]->id, 0, 0);
 
-	unplug_show_queue(i915, &cork, ring);
+	unplug_show_queue(i915, &cork, &q_cfg, ring);
 	gem_close(i915, plug);
 
-	gem_context_destroy(i915, ctx[NOISE]);
-	gem_context_destroy(i915, ctx[LO]);
-	gem_context_destroy(i915, ctx[HI]);
-
 	ptr = gem_mmap__device_coherent(i915, dep, 0, 4096, PROT_READ);
 	gem_set_domain(i915, dep, /* no write hazard lies! */
 			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	gem_close(i915, dep);
 
-	igt_assert_eq_u32(ptr[0], ctx[HI]);
+	igt_assert_eq_u32(ptr[0], ctx[HI]->id);
 	munmap(ptr, 4096);
 
 	ptr = gem_mmap__device_coherent(i915, result, 0, 4096, PROT_READ);
@@ -734,24 +762,36 @@ static void promotion(int i915, unsigned ring)
 			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	gem_close(i915, result);
 
-	igt_assert_eq_u32(ptr[0], ctx[NOISE]);
+	igt_assert_eq_u32(ptr[0], ctx[NOISE]->id);
 	munmap(ptr, 4096);
+
+	intel_ctx_destroy(i915, ctx[NOISE]);
+	intel_ctx_destroy(i915, ctx[LO]);
+	intel_ctx_destroy(i915, ctx[HI]);
+
+	gem_vm_destroy(i915, q_cfg.vm);
 }
 
-static void smoketest(int i915, unsigned ring, unsigned timeout)
+static void smoketest(int i915, const intel_ctx_cfg_t *cfg,
+		      unsigned ring, unsigned timeout)
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
+	intel_ctx_cfg_t q_cfg;
 	unsigned engines[I915_EXEC_RING_MASK + 1];
 	unsigned nengine;
 	unsigned engine;
 	uint32_t scratch;
 	uint32_t *ptr;
 
+	q_cfg = *cfg;
+	q_cfg.vm = gem_vm_create(i915);
+	q_cfg.flags |= I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE;
+
 	nengine = 0;
 	if (ring == -1) {
 		const struct intel_execution_engine2 *e;
 
-		__for_each_physical_engine(i915, e)
+		for_each_ctx_cfg_engine(i915, &q_cfg, e)
 			engines[nengine++] = e->flags;
 	} else {
 		engines[nengine++] = ring;
@@ -761,16 +801,16 @@ static void smoketest(int i915, unsigned ring, unsigned timeout)
 	scratch = gem_create(i915, 4096);
 	igt_fork(child, ncpus) {
 		unsigned long count = 0;
-		uint32_t ctx;
+		const intel_ctx_t *ctx;
 
 		hars_petruska_f54_1_random_perturb(child);
 
-		ctx = gem_queue_create(i915);
+		ctx = intel_ctx_create(i915, &q_cfg);
 		igt_until_timeout(timeout) {
 			int prio;
 
 			prio = hars_petruska_f54_1_random_unsafe_max(MAX_PRIO - MIN_PRIO) + MIN_PRIO;
-			gem_context_set_priority(i915, ctx, prio);
+			gem_context_set_priority(i915, ctx->id, prio);
 
 			engine = engines[hars_petruska_f54_1_random_unsafe_max(nengine)];
 			store_dword(i915, ctx, engine, scratch,
@@ -781,7 +821,7 @@ static void smoketest(int i915, unsigned ring, unsigned timeout)
 					    8*child + 4, count++,
 					    0, 0);
 		}
-		gem_context_destroy(i915, ctx);
+		intel_ctx_destroy(i915, ctx);
 	}
 	igt_waitchildren();
 
@@ -801,21 +841,25 @@ static void smoketest(int i915, unsigned ring, unsigned timeout)
 		igt_info("Child[%d] completed %u cycles\n",  n, ptr[2*n+1]);
 	}
 	munmap(ptr, 4096);
+
+	gem_vm_destroy(i915, q_cfg.vm);
 }
 
-#define for_each_queue(e, i915) \
-	__for_each_physical_engine(i915, e) \
+#define for_each_queue(e, i915, cfg) \
+	for_each_ctx_cfg_engine(i915, cfg, e) \
 		for_each_if(gem_class_can_store_dword(i915, (e)->class)) \
 			igt_dynamic_f("%s", e->name)
 
 igt_main
 {
 	const struct intel_execution_engine2 *e;
+	intel_ctx_cfg_t cfg;
 	int i915 = -1;
 
 	igt_fixture {
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
+		cfg = intel_ctx_cfg_all_physical(i915);
 	}
 
 	igt_subtest_group {
@@ -831,20 +875,20 @@ igt_main
 			create_shared_gtt(i915, DETACHED);
 
 		igt_subtest("disjoint-timelines")
-			disjoint_timelines(i915);
+			disjoint_timelines(i915, &cfg);
 
 		igt_subtest("single-timeline")
-			single_timeline(i915);
+			single_timeline(i915, &cfg);
 
 		igt_subtest_with_dynamic("exec-shared-gtt") {
-			for_each_queue(e, i915)
-				exec_shared_gtt(i915, e->flags);
+			for_each_queue(e, i915, &cfg)
+				exec_shared_gtt(i915, &cfg, e->flags);
 		}
 
 		igt_subtest_with_dynamic("exec-single-timeline") {
-			igt_require(has_single_timeline(i915));
-			for_each_queue(e, i915)
-				exec_single_timeline(i915, e->flags);
+			igt_require(gem_context_has_single_timeline(i915));
+			for_each_queue(e, i915, &cfg)
+				exec_single_timeline(i915, &cfg, e->flags);
 		}
 
 		/*
@@ -856,38 +900,39 @@ igt_main
 		 */
 		igt_subtest_group {
 			igt_fixture {
-				igt_require(gem_has_queues(i915));
 				igt_require(gem_scheduler_enabled(i915));
 				igt_require(gem_scheduler_has_ctx_priority(i915));
+				igt_require(gem_has_vm(i915));
+				igt_require(gem_context_has_single_timeline(i915));
 			}
 
 			igt_subtest_with_dynamic("Q-independent") {
-				for_each_queue(e, i915)
-					independent(i915, e, 0);
+				for_each_queue(e, i915, &cfg)
+					independent(i915, &cfg, e, 0);
 			}
 
 			igt_subtest_with_dynamic("Q-in-order") {
-				for_each_queue(e, i915)
-					reorder(i915, e->flags, EQUAL);
+				for_each_queue(e, i915, &cfg)
+					reorder(i915, &cfg, e->flags, EQUAL);
 			}
 
 			igt_subtest_with_dynamic("Q-out-order") {
-				for_each_queue(e, i915)
-					reorder(i915, e->flags, 0);
+				for_each_queue(e, i915, &cfg)
+					reorder(i915, &cfg, e->flags, 0);
 			}
 
 			igt_subtest_with_dynamic("Q-promotion") {
-				for_each_queue(e, i915)
-					promotion(i915, e->flags);
+				for_each_queue(e, i915, &cfg)
+					promotion(i915, &cfg, e->flags);
 			}
 
 			igt_subtest_with_dynamic("Q-smoketest") {
-				for_each_queue(e, i915)
-					smoketest(i915, e->flags, 5);
+				for_each_queue(e, i915, &cfg)
+					smoketest(i915, &cfg, e->flags, 5);
 			}
 
 			igt_subtest("Q-smoketest-all")
-				smoketest(i915, -1, 30);
+				smoketest(i915, &cfg, -1, 30);
 		}
 
 		igt_subtest("exhaust-shared-gtt")
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
