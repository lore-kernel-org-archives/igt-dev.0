Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831526E1BC
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 03:54:23 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id n38so10579631pfv.2
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 20:54:23 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Apr 2021 22:52:54 -0500
Message-Id: <20210413035350.261794-19-jason@jlekstrand.net>
In-Reply-To: <20210413035350.261794-1-jason@jlekstrand.net>
References: <20210413035350.261794-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 18/74] tests/i915/gem_exec_schedule: Convert
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

---
 tests/i915/gem_exec_schedule.c | 892 +++++++++++++++++----------------
 1 file changed, 471 insertions(+), 421 deletions(-)

diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index f84967c7..fdb719fb 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -35,11 +35,13 @@
 #include <unistd.h>
 
 #include "i915/gem.h"
+#include "i915/gem_vm.h"
 #include "igt.h"
 #include "igt_rand.h"
 #include "igt_rapl.h"
 #include "igt_sysfs.h"
 #include "igt_vgem.h"
+#include "intel_ctx.h"
 #include "sw_sync.h"
 
 #define LO 0
@@ -51,7 +53,6 @@
 
 #define MAX_CONTEXTS 1024
 #define MAX_ELSP_QLEN 16
-#define MAX_ENGINES (I915_EXEC_RING_MASK + 1)
 
 #define MI_SEMAPHORE_WAIT		(0x1c << 23)
 #define   MI_SEMAPHORE_POLL             (1 << 15)
@@ -89,7 +90,7 @@ void __sync_read_u32_count(int fd, uint32_t handle, uint32_t *dst, uint64_t size
 	gem_read(fd, handle, 0, dst, size);
 }
 
-static uint32_t __store_dword(int fd, uint32_t ctx, unsigned ring,
+static uint32_t __store_dword(int fd, const intel_ctx_t *ctx, unsigned ring,
 			      uint32_t target, uint32_t offset, uint32_t value,
 			      uint32_t cork, int fence, unsigned write_domain)
 {
@@ -106,7 +107,7 @@ static uint32_t __store_dword(int fd, uint32_t ctx, unsigned ring,
 	execbuf.flags = ring;
 	if (gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
-	execbuf.rsvd1 = ctx;
+	execbuf.rsvd1 = ctx->id;
 
 	if (fence != -1) {
 		execbuf.flags |= I915_EXEC_FENCE_IN;
@@ -153,7 +154,7 @@ static uint32_t __store_dword(int fd, uint32_t ctx, unsigned ring,
 	return obj[2].handle;
 }
 
-static void store_dword(int fd, uint32_t ctx, unsigned ring,
+static void store_dword(int fd, const intel_ctx_t *ctx, unsigned ring,
 			uint32_t target, uint32_t offset, uint32_t value,
 			unsigned write_domain)
 {
@@ -162,7 +163,7 @@ static void store_dword(int fd, uint32_t ctx, unsigned ring,
 				    0, -1, write_domain));
 }
 
-static void store_dword_plug(int fd, uint32_t ctx, unsigned ring,
+static void store_dword_plug(int fd, const intel_ctx_t *ctx, unsigned ring,
 			     uint32_t target, uint32_t offset, uint32_t value,
 			     uint32_t cork, unsigned write_domain)
 {
@@ -171,7 +172,7 @@ static void store_dword_plug(int fd, uint32_t ctx, unsigned ring,
 				    cork, -1, write_domain));
 }
 
-static void store_dword_fenced(int fd, uint32_t ctx, unsigned ring,
+static void store_dword_fenced(int fd, const intel_ctx_t *ctx, unsigned ring,
 			       uint32_t target, uint32_t offset, uint32_t value,
 			       int fence, unsigned write_domain)
 {
@@ -180,21 +181,24 @@ static void store_dword_fenced(int fd, uint32_t ctx, unsigned ring,
 				    0, fence, write_domain));
 }
 
-static uint32_t create_highest_priority(int fd)
+static const intel_ctx_t *
+create_highest_priority(int fd, const intel_ctx_cfg_t *cfg)
 {
-	uint32_t ctx = gem_context_clone_with_engines(fd, 0);
+	const intel_ctx_t *ctx = intel_ctx_create(fd, cfg);
 
 	/*
 	 * If there is no priority support, all contexts will have equal
 	 * priority (and therefore the max user priority), so no context
 	 * can overtake us, and we effectively can form a plug.
 	 */
-	__gem_context_set_priority(fd, ctx, MAX_PRIO);
+	__gem_context_set_priority(fd, ctx->id, MAX_PRIO);
 
 	return ctx;
 }
 
-static void unplug_show_queue(int fd, struct igt_cork *c, unsigned int engine)
+static void unplug_show_queue(int fd, struct igt_cork *c,
+			      const intel_ctx_cfg_t *cfg,
+			      unsigned int engine)
 {
 	igt_spin_t *spin[MAX_ELSP_QLEN];
 	int max = MAX_ELSP_QLEN;
@@ -204,12 +208,9 @@ static void unplug_show_queue(int fd, struct igt_cork *c, unsigned int engine)
 		max = 1;
 
 	for (int n = 0; n < max; n++) {
-		const struct igt_spin_factory opts = {
-			.ctx_id = create_highest_priority(fd),
-			.engine = engine,
-		};
-		spin[n] = __igt_spin_factory(fd, &opts);
-		gem_context_destroy(fd, opts.ctx_id);
+		const intel_ctx_t *ctx = create_highest_priority(fd, cfg);
+		spin[n] = __igt_spin_new(fd, .ctx = ctx, .engine = engine);
+		intel_ctx_destroy(fd, ctx);
 	}
 
 	igt_cork_unplug(c); /* batches will now be queued on the engine */
@@ -220,7 +221,7 @@ static void unplug_show_queue(int fd, struct igt_cork *c, unsigned int engine)
 
 }
 
-static void fifo(int fd, unsigned ring)
+static void fifo(int fd, const intel_ctx_t *ctx, unsigned ring)
 {
 	IGT_CORK_FENCE(cork);
 	uint32_t scratch;
@@ -232,10 +233,10 @@ static void fifo(int fd, unsigned ring)
 	fence = igt_cork_plug(&cork, fd);
 
 	/* Same priority, same timeline, final result will be the second eb */
-	store_dword_fenced(fd, 0, ring, scratch, 0, 1, fence, 0);
-	store_dword_fenced(fd, 0, ring, scratch, 0, 2, fence, 0);
+	store_dword_fenced(fd, ctx, ring, scratch, 0, 1, fence, 0);
+	store_dword_fenced(fd, ctx, ring, scratch, 0, 2, fence, 0);
 
-	unplug_show_queue(fd, &cork, ring);
+	unplug_show_queue(fd, &cork, &ctx->cfg, ring);
 	close(fence);
 
 	result =  __sync_read_u32(fd, scratch, 0);
@@ -249,7 +250,8 @@ enum implicit_dir {
 	WRITE_READ = 0x2,
 };
 
-static void implicit_rw(int i915, unsigned ring, enum implicit_dir dir)
+static void implicit_rw(int i915, const intel_ctx_t *ctx, unsigned int ring,
+			enum implicit_dir dir)
 {
 	const struct intel_execution_engine2 *e;
 	IGT_CORK_FENCE(cork);
@@ -259,7 +261,7 @@ static void implicit_rw(int i915, unsigned ring, enum implicit_dir dir)
 	int fence;
 
 	count = 0;
-	__for_each_physical_engine(i915, e) {
+	for_each_ctx_engine(i915, ctx, e) {
 		if (e->flags == ring)
 			continue;
 
@@ -274,28 +276,28 @@ static void implicit_rw(int i915, unsigned ring, enum implicit_dir dir)
 	fence = igt_cork_plug(&cork, i915);
 
 	if (dir & WRITE_READ)
-		store_dword_fenced(i915, 0,
+		store_dword_fenced(i915, ctx,
 				   ring, scratch, 0, ~ring,
 				   fence, I915_GEM_DOMAIN_RENDER);
 
-	__for_each_physical_engine(i915, e) {
+	for_each_ctx_engine(i915, ctx, e) {
 		if (e->flags == ring)
 			continue;
 
 		if (!gem_class_can_store_dword(i915, e->class))
 			continue;
 
-		store_dword_fenced(i915, 0,
+		store_dword_fenced(i915, ctx,
 				   e->flags, scratch, 0, e->flags,
 				   fence, 0);
 	}
 
 	if (dir & READ_WRITE)
-		store_dword_fenced(i915, 0,
+		store_dword_fenced(i915, ctx,
 				   ring, scratch, 0, ring,
 				   fence, I915_GEM_DOMAIN_RENDER);
 
-	unplug_show_queue(i915, &cork, ring);
+	unplug_show_queue(i915, &cork, &ctx->cfg, ring);
 	close(fence);
 
 	result =  __sync_read_u32(i915, scratch, 0);
@@ -307,7 +309,8 @@ static void implicit_rw(int i915, unsigned ring, enum implicit_dir dir)
 		igt_assert_eq_u32(result, ring);
 }
 
-static void independent(int fd, unsigned int engine, unsigned long flags)
+static void independent(int fd, const intel_ctx_t *ctx, unsigned int engine,
+			unsigned long flags)
 {
 	const struct intel_execution_engine2 *e;
 	IGT_CORK_FENCE(cork);
@@ -323,7 +326,7 @@ static void independent(int fd, unsigned int engine, unsigned long flags)
 	fence = igt_cork_plug(&cork, fd);
 
 	/* Check that we can submit to engine while all others are blocked */
-	__for_each_physical_engine(fd, e) {
+	for_each_ctx_engine(fd, ctx, e) {
 		if (e->flags == engine)
 			continue;
 
@@ -332,6 +335,7 @@ static void independent(int fd, unsigned int engine, unsigned long flags)
 
 		if (spin == NULL) {
 			spin = __igt_spin_new(fd,
+					      .ctx = ctx,
 					      .engine = e->flags,
 					      .flags = flags);
 		} else {
@@ -343,14 +347,14 @@ static void independent(int fd, unsigned int engine, unsigned long flags)
 			gem_execbuf(fd, &eb);
 		}
 
-		store_dword_fenced(fd, 0, e->flags, scratch, 0, e->flags, fence, 0);
+		store_dword_fenced(fd, ctx, e->flags, scratch, 0, e->flags, fence, 0);
 	}
 	igt_require(spin);
 
 	/* Same priority, but different timeline (as different engine) */
-	batch = __store_dword(fd, 0, engine, scratch, 0, engine, 0, fence, 0);
+	batch = __store_dword(fd, ctx, engine, scratch, 0, engine, 0, fence, 0);
 
-	unplug_show_queue(fd, &cork, engine);
+	unplug_show_queue(fd, &cork, &ctx->cfg, engine);
 	close(fence);
 
 	gem_sync(fd, batch);
@@ -373,11 +377,12 @@ static void independent(int fd, unsigned int engine, unsigned long flags)
 	gem_close(fd, scratch);
 }
 
-static void smoketest(int fd, unsigned ring, unsigned timeout)
+static void smoketest(int fd, const intel_ctx_cfg_t *cfg,
+		      unsigned ring, unsigned timeout)
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	const struct intel_execution_engine2 *e;
-	unsigned engines[MAX_ENGINES];
+	unsigned engines[GEM_MAX_ENGINES];
 	unsigned nengine;
 	unsigned engine;
 	uint32_t scratch;
@@ -385,7 +390,7 @@ static void smoketest(int fd, unsigned ring, unsigned timeout)
 
 	nengine = 0;
 	if (ring == ALL_ENGINES) {
-		__for_each_physical_engine(fd, e)
+		for_each_ctx_cfg_engine(fd, cfg, e)
 			if (gem_class_can_store_dword(fd, e->class))
 				engines[nengine++] = e->flags;
 	} else {
@@ -396,16 +401,16 @@ static void smoketest(int fd, unsigned ring, unsigned timeout)
 	scratch = gem_create(fd, 4096);
 	igt_fork(child, ncpus) {
 		unsigned long count = 0;
-		uint32_t ctx;
+		const intel_ctx_t *ctx;
 
 		hars_petruska_f54_1_random_perturb(child);
 
-		ctx = gem_context_clone_with_engines(fd, 0);
+		ctx = intel_ctx_create(fd, cfg);
 		igt_until_timeout(timeout) {
 			int prio;
 
 			prio = hars_petruska_f54_1_random_unsafe_max(MAX_PRIO - MIN_PRIO) + MIN_PRIO;
-			gem_context_set_priority(fd, ctx, prio);
+			gem_context_set_priority(fd, ctx->id, prio);
 
 			engine = engines[hars_petruska_f54_1_random_unsafe_max(nengine)];
 			store_dword(fd, ctx, engine, scratch,
@@ -416,7 +421,7 @@ static void smoketest(int fd, unsigned ring, unsigned timeout)
 					    8*child + 4, count++,
 					    0);
 		}
-		gem_context_destroy(fd, ctx);
+		intel_ctx_destroy(fd, ctx);
 	}
 	igt_waitchildren();
 
@@ -483,7 +488,8 @@ static uint32_t timeslicing_batches(int i915, uint32_t *offset)
         return handle;
 }
 
-static void timeslice(int i915, unsigned int engine)
+static void timeslice(int i915, const intel_ctx_cfg_t *cfg,
+		      unsigned int engine)
 {
 	unsigned int offset = 24 << 20;
 	struct drm_i915_gem_exec_object2 obj = {
@@ -494,6 +500,7 @@ static void timeslice(int i915, unsigned int engine)
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
 	};
+	const intel_ctx_t *ctx;
 	uint32_t *result;
 	int out;
 
@@ -517,12 +524,13 @@ static void timeslice(int i915, unsigned int engine)
 
 	/* No coupling between requests; free to timeslice */
 
-	execbuf.rsvd1 = gem_context_clone_with_engines(i915, 0);
+	ctx = intel_ctx_create(i915, cfg);
+	execbuf.rsvd1 = ctx->id;
 	execbuf.rsvd2 >>= 32;
 	execbuf.flags = engine | I915_EXEC_FENCE_OUT;
 	execbuf.batch_start_offset = offset;
 	gem_execbuf_wr(i915, &execbuf);
-	gem_context_destroy(i915, execbuf.rsvd1);
+	intel_ctx_destroy(i915, ctx);
 
 	gem_sync(i915, obj.handle);
 	gem_close(i915, obj.handle);
@@ -576,7 +584,8 @@ static uint32_t timesliceN_batches(int i915, uint32_t offset, int count)
         return handle;
 }
 
-static void timesliceN(int i915, unsigned int engine, int count)
+static void timesliceN(int i915, const intel_ctx_cfg_t *cfg,
+		       unsigned int engine, int count)
 {
 	const unsigned int sz = ALIGN((count + 1) * 1024, 4096);
 	unsigned int offset = 24 << 20;
@@ -592,6 +601,7 @@ static void timesliceN(int i915, unsigned int engine, int count)
 	};
 	uint32_t *result =
 		gem_mmap__device_coherent(i915, obj.handle, 0, sz, PROT_READ);
+	const intel_ctx_t *ctx;
 	int fence[count];
 
 	/*
@@ -608,10 +618,11 @@ static void timesliceN(int i915, unsigned int engine, int count)
 	/* No coupling between requests; free to timeslice */
 
 	for (int i = 0; i < count; i++) {
-		execbuf.rsvd1 = gem_context_clone_with_engines(i915, 0);
+		ctx = intel_ctx_create(i915, cfg);
+		execbuf.rsvd1 = ctx->id;
 		execbuf.batch_start_offset = (i + 1) * 1024;;
 		gem_execbuf_wr(i915, &execbuf);
-		gem_context_destroy(i915, execbuf.rsvd1);
+		intel_ctx_destroy(i915, ctx);
 
 		fence[i] = execbuf.rsvd2 >> 32;
 	}
@@ -629,31 +640,32 @@ static void timesliceN(int i915, unsigned int engine, int count)
 	munmap(result, sz);
 }
 
-static void lateslice(int i915, unsigned int engine, unsigned long flags)
+static void lateslice(int i915, const intel_ctx_cfg_t *cfg,
+		      unsigned int engine, unsigned long flags)
 {
+	const intel_ctx_t *ctx;
 	igt_spin_t *spin[3];
-	uint32_t ctx;
 
 	igt_require(gem_scheduler_has_semaphores(i915));
 	igt_require(gem_scheduler_has_preemption(i915));
 	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
 
-	ctx = gem_context_create(i915);
-	spin[0] = igt_spin_new(i915, .ctx_id = ctx, .engine = engine,
+	ctx = intel_ctx_create(i915, cfg);
+	spin[0] = igt_spin_new(i915, .ctx = ctx, .engine = engine,
 			       .flags = (IGT_SPIN_POLL_RUN |
 					 IGT_SPIN_FENCE_OUT |
 					 flags));
-	gem_context_destroy(i915, ctx);
+	intel_ctx_destroy(i915, ctx);
 
 	igt_spin_busywait_until_started(spin[0]);
 
-	ctx = gem_context_create(i915);
-	spin[1] = igt_spin_new(i915, .ctx_id = ctx, .engine = engine,
+	ctx = intel_ctx_create(i915, cfg);
+	spin[1] = igt_spin_new(i915, .ctx = ctx, .engine = engine,
 			       .fence = spin[0]->out_fence,
 			       .flags = (IGT_SPIN_POLL_RUN |
 					 IGT_SPIN_FENCE_IN |
 					 flags));
-	gem_context_destroy(i915, ctx);
+	intel_ctx_destroy(i915, ctx);
 
 	usleep(5000); /* give some time for the new spinner to be scheduled */
 
@@ -664,10 +676,10 @@ static void lateslice(int i915, unsigned int engine, unsigned long flags)
 	 * third spinner we then expect timeslicing to be real enabled.
 	 */
 
-	ctx = gem_context_create(i915);
-	spin[2] = igt_spin_new(i915, .ctx_id = ctx, .engine = engine,
+	ctx = intel_ctx_create(i915, cfg);
+	spin[2] = igt_spin_new(i915, .ctx = ctx, .engine = engine,
 			       .flags = IGT_SPIN_POLL_RUN | flags);
-	gem_context_destroy(i915, ctx);
+	intel_ctx_destroy(i915, ctx);
 
 	igt_spin_busywait_until_started(spin[2]);
 
@@ -689,7 +701,7 @@ static void lateslice(int i915, unsigned int engine, unsigned long flags)
 }
 
 static void cancel_spinner(int i915,
-			   uint32_t ctx, unsigned int engine,
+			   const intel_ctx_t *ctx, unsigned int engine,
 			   igt_spin_t *spin)
 {
 	struct drm_i915_gem_exec_object2 obj = {
@@ -699,7 +711,7 @@ static void cancel_spinner(int i915,
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
 		.flags = engine | I915_EXEC_FENCE_SUBMIT,
-		.rsvd1 = ctx, /* same vm */
+		.rsvd1 = ctx->id, /* same vm */
 		.rsvd2 = spin->out_fence,
 	};
 	uint32_t *map, *cs;
@@ -720,21 +732,18 @@ static void cancel_spinner(int i915,
 	gem_close(i915, obj.handle);
 }
 
-static void submit_slice(int i915,
+static void submit_slice(int i915, const intel_ctx_cfg_t *cfg,
 			 const struct intel_execution_engine2 *e,
 			 unsigned int flags)
 #define EARLY_SUBMIT 0x1
 #define LATE_SUBMIT 0x2
 #define USERPTR 0x4
 {
-	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines , 1) = {};
 	const struct intel_execution_engine2 *cancel;
-	struct drm_i915_gem_context_param param = {
-		.ctx_id = gem_context_create(i915),
-		.param = I915_CONTEXT_PARAM_ENGINES,
-		.value = to_user_pointer(&engines),
-		.size = sizeof(engines),
+	intel_ctx_cfg_t engine_cfg = {
+		.num_engines = 1,
 	};
+	const intel_ctx_t *ctx;
 
 	/*
 	 * When using a submit fence, we do not want to block concurrent work,
@@ -745,7 +754,7 @@ static void submit_slice(int i915,
 	igt_require(gem_scheduler_has_preemption(i915));
 	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
 
-	__for_each_physical_engine(i915, cancel) {
+	for_each_ctx_cfg_engine(i915, cfg, cancel) {
 		igt_spin_t *bg, *spin;
 		int timeline = -1;
 		int fence = -1;
@@ -762,10 +771,10 @@ static void submit_slice(int i915,
 			fence = sw_sync_timeline_create_fence(timeline, 1);
 		}
 
-		engines.engines[0].engine_class = e->class;
-		engines.engines[0].engine_instance = e->instance;
-		gem_context_set_param(i915, &param);
-		spin = igt_spin_new(i915, .ctx_id = param.ctx_id,
+		engine_cfg.engines[0].engine_class = e->class;
+		engine_cfg.engines[0].engine_instance = e->instance;
+		ctx = intel_ctx_create(i915, &engine_cfg);
+		spin = igt_spin_new(i915, .ctx = ctx,
 				    .fence = fence,
 				    .flags =
 				    IGT_SPIN_POLL_RUN |
@@ -778,10 +787,13 @@ static void submit_slice(int i915,
 		if (flags & EARLY_SUBMIT)
 			igt_spin_busywait_until_started(spin);
 
-		engines.engines[0].engine_class = cancel->class;
-		engines.engines[0].engine_instance = cancel->instance;
-		gem_context_set_param(i915, &param);
-		cancel_spinner(i915, param.ctx_id, 0, spin);
+		intel_ctx_destroy(i915, ctx);
+
+		engine_cfg.engines[0].engine_class = cancel->class;
+		engine_cfg.engines[0].engine_instance = cancel->instance;
+		ctx = intel_ctx_create(i915, &engine_cfg);
+
+		cancel_spinner(i915, ctx, 0, spin);
 
 		if (timeline != -1)
 			close(timeline);
@@ -789,9 +801,9 @@ static void submit_slice(int i915,
 		gem_sync(i915, spin->handle);
 		igt_spin_free(i915, spin);
 		igt_spin_free(i915, bg);
-	}
 
-	gem_context_destroy(i915, param.ctx_id);
+		intel_ctx_destroy(i915, ctx);
+	}
 }
 
 static uint32_t __batch_create(int i915, uint32_t offset)
@@ -810,7 +822,8 @@ static uint32_t batch_create(int i915)
 	return __batch_create(i915, 0);
 }
 
-static void semaphore_userlock(int i915, unsigned long flags)
+static void semaphore_userlock(int i915, const intel_ctx_t *ctx,
+			       unsigned long flags)
 {
 	const struct intel_execution_engine2 *e;
 	struct drm_i915_gem_exec_object2 obj = {
@@ -818,6 +831,7 @@ static void semaphore_userlock(int i915, unsigned long flags)
 	};
 	igt_spin_t *spin = NULL;
 	uint32_t scratch;
+	const intel_ctx_t *tmp_ctx;
 
 	igt_require(gem_scheduler_has_semaphores(i915));
 
@@ -829,9 +843,10 @@ static void semaphore_userlock(int i915, unsigned long flags)
 	 */
 
 	scratch = gem_create(i915, 4096);
-	__for_each_physical_engine(i915, e) {
+	for_each_ctx_engine(i915, ctx, e) {
 		if (!spin) {
 			spin = igt_spin_new(i915,
+					    .ctx = ctx,
 					    .dependency = scratch,
 					    .engine = e->flags,
 					    .flags = flags);
@@ -854,13 +869,13 @@ static void semaphore_userlock(int i915, unsigned long flags)
 	 * on a HW semaphore) but it should not prevent any real work from
 	 * taking precedence.
 	 */
-	scratch = gem_context_clone_with_engines(i915, 0);
-	__for_each_physical_engine(i915, e) {
+	tmp_ctx = intel_ctx_create(i915, &ctx->cfg);
+	for_each_ctx_engine(i915, ctx, e) {
 		struct drm_i915_gem_execbuffer2 execbuf = {
 			.buffers_ptr = to_user_pointer(&obj),
 			.buffer_count = 1,
 			.flags = e->flags,
-			.rsvd1 = scratch,
+			.rsvd1 = tmp_ctx->id,
 		};
 
 		if (e->flags == (spin->execbuf.flags & I915_EXEC_RING_MASK))
@@ -868,14 +883,15 @@ static void semaphore_userlock(int i915, unsigned long flags)
 
 		gem_execbuf(i915, &execbuf);
 	}
-	gem_context_destroy(i915, scratch);
+	intel_ctx_destroy(i915, tmp_ctx);
 	gem_sync(i915, obj.handle); /* to hang unless we can preempt */
 	gem_close(i915, obj.handle);
 
 	igt_spin_free(i915, spin);
 }
 
-static void semaphore_codependency(int i915, unsigned long flags)
+static void semaphore_codependency(int i915, const intel_ctx_t *ctx,
+				   unsigned long flags)
 {
 	const struct intel_execution_engine2 *e;
 	struct {
@@ -894,8 +910,8 @@ static void semaphore_codependency(int i915, unsigned long flags)
 	 */
 
 	i = 0;
-	__for_each_physical_engine(i915, e) {
-		uint32_t ctx;
+	for_each_ctx_engine(i915, ctx, e) {
+		const intel_ctx_t *tmp_ctx;
 
 		if (!e->flags) {
 			igt_require(gem_class_can_store_dword(i915, e->class));
@@ -905,11 +921,11 @@ static void semaphore_codependency(int i915, unsigned long flags)
 		if (!gem_class_can_store_dword(i915, e->class))
 			continue;
 
-		ctx = gem_context_clone_with_engines(i915, 0);
+		tmp_ctx = intel_ctx_create(i915, &ctx->cfg);
 
 		task[i].xcs =
 			__igt_spin_new(i915,
-				       .ctx_id = ctx,
+				       .ctx = tmp_ctx,
 				       .engine = e->flags,
 				       .flags = IGT_SPIN_POLL_RUN | flags);
 		igt_spin_busywait_until_started(task[i].xcs);
@@ -917,11 +933,11 @@ static void semaphore_codependency(int i915, unsigned long flags)
 		/* Common rcs tasks will be queued in FIFO */
 		task[i].rcs =
 			__igt_spin_new(i915,
-				       .ctx_id = ctx,
+				       .ctx = tmp_ctx,
 				       .engine = 0,
 				       .dependency = task[i].xcs->handle);
 
-		gem_context_destroy(i915, ctx);
+		intel_ctx_destroy(i915, tmp_ctx);
 
 		if (++i == ARRAY_SIZE(task))
 			break;
@@ -944,11 +960,13 @@ static void semaphore_codependency(int i915, unsigned long flags)
 	}
 }
 
-static void semaphore_resolve(int i915, unsigned long flags)
+static void semaphore_resolve(int i915, const intel_ctx_cfg_t *cfg,
+			      unsigned long flags)
 {
 	const struct intel_execution_engine2 *e;
 	const uint32_t SEMAPHORE_ADDR = 64 << 10;
-	uint32_t semaphore, outer, inner, *sema;
+	uint32_t semaphore, *sema;
+	const intel_ctx_t *outer, *inner;
 
 	/*
 	 * Userspace may submit batches that wait upon unresolved
@@ -962,13 +980,13 @@ static void semaphore_resolve(int i915, unsigned long flags)
 	igt_require(gem_scheduler_has_preemption(i915));
 	igt_require(intel_get_drm_devid(i915) >= 8); /* for MI_SEMAPHORE_WAIT */
 
-	outer = gem_context_clone_with_engines(i915, 0);
-	inner = gem_context_clone_with_engines(i915, 0);
+	outer = intel_ctx_create(i915, cfg);
+	inner = intel_ctx_create(i915, cfg);
 
 	semaphore = gem_create(i915, 4096);
 	sema = gem_mmap__wc(i915, semaphore, 0, 4096, PROT_WRITE);
 
-	__for_each_physical_engine(i915, e) {
+	for_each_ctx_cfg_engine(i915, cfg, e) {
 		struct drm_i915_gem_exec_object2 obj[3];
 		struct drm_i915_gem_execbuffer2 eb;
 		uint32_t handle, cancel;
@@ -1023,7 +1041,7 @@ static void semaphore_resolve(int i915, unsigned long flags)
 		obj[2].handle = handle;
 		eb.buffer_count = 3;
 		eb.buffers_ptr = to_user_pointer(obj);
-		eb.rsvd1 = outer;
+		eb.rsvd1 = outer->id;
 		gem_execbuf(i915, &eb);
 
 		/* Then add the GPU hang intermediatory */
@@ -1054,7 +1072,7 @@ static void semaphore_resolve(int i915, unsigned long flags)
 		obj[0].flags = EXEC_OBJECT_PINNED;
 		obj[1].handle = cancel;
 		eb.buffer_count = 2;
-		eb.rsvd1 = inner;
+		eb.rsvd1 = inner->id;
 		gem_execbuf(i915, &eb);
 		gem_wait(i915, cancel, &poke); /* match sync's WAIT_PRIORITY */
 		gem_close(i915, cancel);
@@ -1069,22 +1087,23 @@ static void semaphore_resolve(int i915, unsigned long flags)
 	munmap(sema, 4096);
 	gem_close(i915, semaphore);
 
-	gem_context_destroy(i915, inner);
-	gem_context_destroy(i915, outer);
+	intel_ctx_destroy(i915, inner);
+	intel_ctx_destroy(i915, outer);
 }
 
-static void semaphore_noskip(int i915, unsigned long flags)
+static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
+			     unsigned long flags)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
 	const struct intel_execution_engine2 *outer, *inner;
-	uint32_t ctx;
+	const intel_ctx_t *ctx;
 
 	igt_require(gen >= 6); /* MI_STORE_DWORD_IMM convenience */
 
-	ctx = gem_context_clone_with_engines(i915, 0);
+	ctx = intel_ctx_create(i915, cfg);
 
-	__for_each_physical_engine(i915, outer) {
-	__for_each_physical_engine(i915, inner) {
+	for_each_ctx_engine(i915, ctx, outer) {
+	for_each_ctx_engine(i915, ctx, inner) {
 		struct drm_i915_gem_exec_object2 obj[3];
 		struct drm_i915_gem_execbuffer2 eb;
 		uint32_t handle, *cs, *map;
@@ -1094,9 +1113,11 @@ static void semaphore_noskip(int i915, unsigned long flags)
 		    !gem_class_can_store_dword(i915, inner->class))
 			continue;
 
-		chain = __igt_spin_new(i915, .engine = outer->flags, .flags = flags);
+		chain = __igt_spin_new(i915, .ctx = ctx,
+				       .engine = outer->flags, .flags = flags);
 
-		spin = __igt_spin_new(i915, .engine = inner->flags, .flags = flags);
+		spin = __igt_spin_new(i915, .ctx = ctx,
+				      .engine = inner->flags, .flags = flags);
 		igt_spin_end(spin); /* we just want its address for later */
 		gem_sync(i915, spin->handle);
 		igt_spin_reset(spin);
@@ -1129,7 +1150,7 @@ static void semaphore_noskip(int i915, unsigned long flags)
 		memset(&eb, 0, sizeof(eb));
 		eb.buffer_count = 3;
 		eb.buffers_ptr = to_user_pointer(obj);
-		eb.rsvd1 = ctx;
+		eb.rsvd1 = ctx->id;
 		eb.flags = inner->flags;
 		gem_execbuf(i915, &eb);
 
@@ -1153,11 +1174,12 @@ static void semaphore_noskip(int i915, unsigned long flags)
 	}
 	}
 
-	gem_context_destroy(i915, ctx);
+	intel_ctx_destroy(i915, ctx);
 }
 
 static void
-noreorder(int i915, unsigned int engine, int prio, unsigned int flags)
+noreorder(int i915, const intel_ctx_cfg_t *cfg,
+	  unsigned int engine, int prio, unsigned int flags)
 #define CORKED 0x1
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
@@ -1169,24 +1191,24 @@ noreorder(int i915, unsigned int engine, int prio, unsigned int flags)
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
 		.flags = engine,
-		.rsvd1 = gem_context_clone_with_engines(i915, 0),
 	};
+	intel_ctx_cfg_t vm_cfg = *cfg;
+	const intel_ctx_t *ctx;
 	IGT_CORK_FENCE(cork);
 	uint32_t *map, *cs;
 	igt_spin_t *slice;
 	igt_spin_t *spin;
 	int fence = -1;
 	uint64_t addr;
-	uint32_t ctx;
 
 	if (flags & CORKED)
 		fence = igt_cork_plug(&cork, i915);
 
-	ctx = gem_context_clone(i915, execbuf.rsvd1,
-			      I915_CONTEXT_CLONE_ENGINES |
-			      I915_CONTEXT_CLONE_VM,
-			      0);
-	spin = igt_spin_new(i915, ctx,
+	vm_cfg.vm = gem_vm_create(i915);
+
+	ctx = intel_ctx_create(i915, &vm_cfg);
+
+	spin = igt_spin_new(i915, .ctx = ctx,
 			    .engine = engine,
 			    .fence = fence,
 			    .flags = IGT_SPIN_FENCE_OUT | IGT_SPIN_FENCE_IN);
@@ -1195,7 +1217,7 @@ noreorder(int i915, unsigned int engine, int prio, unsigned int flags)
 	/* Loop around the engines, creating a chain of fences */
 	spin->execbuf.rsvd2 = (uint64_t)dup(spin->out_fence) << 32;
 	spin->execbuf.rsvd2 |= 0xffffffff;
-	__for_each_physical_engine(i915, e) {
+	for_each_ctx_engine(i915, ctx, e) {
 		if (e->flags == engine)
 			continue;
 
@@ -1208,7 +1230,7 @@ noreorder(int i915, unsigned int engine, int prio, unsigned int flags)
 	}
 	close(spin->execbuf.rsvd2);
 	spin->execbuf.rsvd2 >>= 32;
-	gem_context_destroy(i915, ctx);
+	intel_ctx_destroy(i915, ctx);
 
 	/*
 	 * Wait upon the fence chain, and try to terminate the spinner.
@@ -1241,11 +1263,13 @@ noreorder(int i915, unsigned int engine, int prio, unsigned int flags)
 	execbuf.rsvd2 = spin->execbuf.rsvd2;
 	execbuf.flags |= I915_EXEC_FENCE_IN;
 
-	gem_context_set_priority(i915, execbuf.rsvd1, prio);
+	ctx = intel_ctx_create(i915, &vm_cfg);
+	gem_context_set_priority(i915, ctx->id, prio);
+	execbuf.rsvd1 = ctx->id;
 
 	gem_execbuf(i915, &execbuf);
 	gem_close(i915, obj.handle);
-	gem_context_destroy(i915, execbuf.rsvd1);
+	intel_ctx_destroy(i915, ctx);
 	if (cork.fd != -1)
 		igt_cork_unplug(&cork);
 
@@ -1258,7 +1282,9 @@ noreorder(int i915, unsigned int engine, int prio, unsigned int flags)
 	 *
 	 * Without timeslices, fallback to waiting a second.
 	 */
+	ctx = intel_ctx_create(i915, &vm_cfg);
 	slice = igt_spin_new(i915,
+			    .ctx = ctx,
 			    .engine = engine,
 			    .flags = IGT_SPIN_POLL_RUN);
 	igt_until_timeout(1) {
@@ -1266,6 +1292,7 @@ noreorder(int i915, unsigned int engine, int prio, unsigned int flags)
 			break;
 	}
 	igt_spin_free(i915, slice);
+	intel_ctx_destroy(i915, ctx);
 
 	/* Check the store did not run before the spinner */
 	igt_assert_eq(sync_fence_status(spin->out_fence), 0);
@@ -1273,20 +1300,21 @@ noreorder(int i915, unsigned int engine, int prio, unsigned int flags)
 	gem_quiescent_gpu(i915);
 }
 
-static void reorder(int fd, unsigned ring, unsigned flags)
+static void reorder(int fd, const intel_ctx_cfg_t *cfg,
+		    unsigned ring, unsigned flags)
 #define EQUAL 1
 {
 	IGT_CORK_FENCE(cork);
 	uint32_t scratch;
 	uint32_t result;
-	uint32_t ctx[2];
+	const intel_ctx_t *ctx[2];
 	int fence;
 
-	ctx[LO] = gem_context_clone_with_engines(fd, 0);
-	gem_context_set_priority(fd, ctx[LO], MIN_PRIO);
+	ctx[LO] = intel_ctx_create(fd, cfg);
+	gem_context_set_priority(fd, ctx[LO]->id, MIN_PRIO);
 
-	ctx[HI] = gem_context_clone_with_engines(fd, 0);
-	gem_context_set_priority(fd, ctx[HI], flags & EQUAL ? MIN_PRIO : 0);
+	ctx[HI] = intel_ctx_create(fd, cfg);
+	gem_context_set_priority(fd, ctx[HI]->id, flags & EQUAL ? MIN_PRIO : 0);
 
 	scratch = gem_create(fd, 4096);
 	fence = igt_cork_plug(&cork, fd);
@@ -1294,40 +1322,40 @@ static void reorder(int fd, unsigned ring, unsigned flags)
 	/* We expect the high priority context to be executed first, and
 	 * so the final result will be value from the low priority context.
 	 */
-	store_dword_fenced(fd, ctx[LO], ring, scratch, 0, ctx[LO], fence, 0);
-	store_dword_fenced(fd, ctx[HI], ring, scratch, 0, ctx[HI], fence, 0);
+	store_dword_fenced(fd, ctx[LO], ring, scratch, 0, ctx[LO]->id, fence, 0);
+	store_dword_fenced(fd, ctx[HI], ring, scratch, 0, ctx[HI]->id, fence, 0);
 
-	unplug_show_queue(fd, &cork, ring);
+	unplug_show_queue(fd, &cork, cfg, ring);
 	close(fence);
 
-	gem_context_destroy(fd, ctx[LO]);
-	gem_context_destroy(fd, ctx[HI]);
-
 	result =  __sync_read_u32(fd, scratch, 0);
 	gem_close(fd, scratch);
 
 	if (flags & EQUAL) /* equal priority, result will be fifo */
-		igt_assert_eq_u32(result, ctx[HI]);
+		igt_assert_eq_u32(result, ctx[HI]->id);
 	else
-		igt_assert_eq_u32(result, ctx[LO]);
+		igt_assert_eq_u32(result, ctx[LO]->id);
+
+	intel_ctx_destroy(fd, ctx[LO]);
+	intel_ctx_destroy(fd, ctx[HI]);
 }
 
-static void promotion(int fd, unsigned ring)
+static void promotion(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 {
 	IGT_CORK_FENCE(cork);
 	uint32_t result, dep;
 	uint32_t result_read, dep_read;
-	uint32_t ctx[3];
+	const intel_ctx_t *ctx[3];
 	int fence;
 
-	ctx[LO] = gem_context_clone_with_engines(fd, 0);
-	gem_context_set_priority(fd, ctx[LO], MIN_PRIO);
+	ctx[LO] = intel_ctx_create(fd, cfg);
+	gem_context_set_priority(fd, ctx[LO]->id, MIN_PRIO);
 
-	ctx[HI] = gem_context_clone_with_engines(fd, 0);
-	gem_context_set_priority(fd, ctx[HI], 0);
+	ctx[HI] = intel_ctx_create(fd, cfg);
+	gem_context_set_priority(fd, ctx[HI]->id, 0);
 
-	ctx[NOISE] = gem_context_clone_with_engines(fd, 0);
-	gem_context_set_priority(fd, ctx[NOISE], MIN_PRIO/2);
+	ctx[NOISE] = intel_ctx_create(fd, cfg);
+	gem_context_set_priority(fd, ctx[NOISE]->id, MIN_PRIO/2);
 
 	result = gem_create(fd, 4096);
 	dep = gem_create(fd, 4096);
@@ -1339,30 +1367,30 @@ static void promotion(int fd, unsigned ring)
 	 * fifo would be NOISE, LO, HI.
 	 * strict priority would be  HI, NOISE, LO
 	 */
-	store_dword_fenced(fd, ctx[NOISE], ring, result, 0, ctx[NOISE], fence, 0);
-	store_dword_fenced(fd, ctx[LO], ring, result, 0, ctx[LO], fence, 0);
+	store_dword_fenced(fd, ctx[NOISE], ring, result, 0, ctx[NOISE]->id, fence, 0);
+	store_dword_fenced(fd, ctx[LO], ring, result, 0, ctx[LO]->id, fence, 0);
 
 	/* link LO <-> HI via a dependency on another buffer */
-	store_dword(fd, ctx[LO], ring, dep, 0, ctx[LO], I915_GEM_DOMAIN_INSTRUCTION);
-	store_dword(fd, ctx[HI], ring, dep, 0, ctx[HI], 0);
+	store_dword(fd, ctx[LO], ring, dep, 0, ctx[LO]->id, I915_GEM_DOMAIN_INSTRUCTION);
+	store_dword(fd, ctx[HI], ring, dep, 0, ctx[HI]->id, 0);
 
-	store_dword(fd, ctx[HI], ring, result, 0, ctx[HI], 0);
+	store_dword(fd, ctx[HI], ring, result, 0, ctx[HI]->id, 0);
 
-	unplug_show_queue(fd, &cork, ring);
+	unplug_show_queue(fd, &cork, cfg, ring);
 	close(fence);
 
-	gem_context_destroy(fd, ctx[NOISE]);
-	gem_context_destroy(fd, ctx[LO]);
-	gem_context_destroy(fd, ctx[HI]);
-
 	dep_read = __sync_read_u32(fd, dep, 0);
 	gem_close(fd, dep);
 
 	result_read = __sync_read_u32(fd, result, 0);
 	gem_close(fd, result);
 
-	igt_assert_eq_u32(dep_read, ctx[HI]);
-	igt_assert_eq_u32(result_read, ctx[NOISE]);
+	igt_assert_eq_u32(dep_read, ctx[HI]->id);
+	igt_assert_eq_u32(result_read, ctx[NOISE]->id);
+
+	intel_ctx_destroy(fd, ctx[NOISE]);
+	intel_ctx_destroy(fd, ctx[LO]);
+	intel_ctx_destroy(fd, ctx[HI]);
 }
 
 static bool set_preempt_timeout(int i915,
@@ -1376,34 +1404,35 @@ static bool set_preempt_timeout(int i915,
 
 #define NEW_CTX (0x1 << 0)
 #define HANG_LP (0x1 << 1)
-static void preempt(int fd, const struct intel_execution_engine2 *e, unsigned flags)
+static void preempt(int fd, const intel_ctx_cfg_t *cfg,
+		    const struct intel_execution_engine2 *e, unsigned flags)
 {
 	uint32_t result = gem_create(fd, 4096);
 	uint32_t result_read;
 	igt_spin_t *spin[MAX_ELSP_QLEN];
-	uint32_t ctx[2];
+	const intel_ctx_t *ctx[2];
 	igt_hang_t hang;
 
 	/* Set a fast timeout to speed the test up (if available) */
 	set_preempt_timeout(fd, e, 150);
 
-	ctx[LO] = gem_context_clone_with_engines(fd, 0);
-	gem_context_set_priority(fd, ctx[LO], MIN_PRIO);
+	ctx[LO] = intel_ctx_create(fd, cfg);
+	gem_context_set_priority(fd, ctx[LO]->id, MIN_PRIO);
 
-	ctx[HI] = gem_context_clone_with_engines(fd, 0);
-	gem_context_set_priority(fd, ctx[HI], MAX_PRIO);
+	ctx[HI] = intel_ctx_create(fd, cfg);
+	gem_context_set_priority(fd, ctx[HI]->id, MAX_PRIO);
 
 	if (flags & HANG_LP)
-		hang = igt_hang_ctx(fd, ctx[LO], e->flags, 0);
+		hang = igt_hang_ctx(fd, ctx[LO]->id, e->flags, 0);
 
 	for (int n = 0; n < ARRAY_SIZE(spin); n++) {
 		if (flags & NEW_CTX) {
-			gem_context_destroy(fd, ctx[LO]);
-			ctx[LO] = gem_context_clone_with_engines(fd, 0);
-			gem_context_set_priority(fd, ctx[LO], MIN_PRIO);
+			intel_ctx_destroy(fd, ctx[LO]);
+			ctx[LO] = intel_ctx_create(fd, cfg);
+			gem_context_set_priority(fd, ctx[LO]->id, MIN_PRIO);
 		}
 		spin[n] = __igt_spin_new(fd,
-					 .ctx_id = ctx[LO],
+					 .ctx = ctx[LO],
 					 .engine = e->flags,
 					 .flags = flags & USERPTR ? IGT_SPIN_USERPTR : 0);
 		igt_debug("spin[%d].handle=%d\n", n, spin[n]->handle);
@@ -1421,8 +1450,8 @@ static void preempt(int fd, const struct intel_execution_engine2 *e, unsigned fl
 	if (flags & HANG_LP)
 		igt_post_hang_ring(fd, hang);
 
-	gem_context_destroy(fd, ctx[LO]);
-	gem_context_destroy(fd, ctx[HI]);
+	intel_ctx_destroy(fd, ctx[LO]);
+	intel_ctx_destroy(fd, ctx[HI]);
 
 	gem_close(fd, result);
 }
@@ -1430,22 +1459,23 @@ static void preempt(int fd, const struct intel_execution_engine2 *e, unsigned fl
 #define CHAIN 0x1
 #define CONTEXTS 0x2
 
-static igt_spin_t *__noise(int fd, uint32_t ctx, int prio, igt_spin_t *spin)
+static igt_spin_t *__noise(int fd, const intel_ctx_t *ctx,
+			   int prio, igt_spin_t *spin)
 {
 	const struct intel_execution_engine2 *e;
 
-	gem_context_set_priority(fd, ctx, prio);
+	gem_context_set_priority(fd, ctx->id, prio);
 
-	__for_each_physical_engine(fd, e) {
+	for_each_ctx_engine(fd, ctx, e) {
 		if (spin == NULL) {
 			spin = __igt_spin_new(fd,
-					      .ctx_id = ctx,
+					      .ctx = ctx,
 					      .engine = e->flags);
 		} else {
 			struct drm_i915_gem_execbuffer2 eb = {
 				.buffer_count = 1,
 				.buffers_ptr = to_user_pointer(&spin->obj[IGT_SPIN_BATCH]),
-				.rsvd1 = ctx,
+				.rsvd1 = ctx->id,
 				.flags = e->flags,
 			};
 			gem_execbuf(fd, &eb);
@@ -1456,7 +1486,7 @@ static igt_spin_t *__noise(int fd, uint32_t ctx, int prio, igt_spin_t *spin)
 }
 
 static void __preempt_other(int fd,
-			    uint32_t *ctx,
+			    const intel_ctx_t **ctx,
 			    unsigned int target, unsigned int primary,
 			    unsigned flags)
 {
@@ -1472,7 +1502,7 @@ static void __preempt_other(int fd,
 	n++;
 
 	if (flags & CHAIN) {
-		__for_each_physical_engine(fd, e) {
+		for_each_ctx_engine(fd, ctx[LO], e) {
 			store_dword(fd, ctx[LO], e->flags,
 				    result, (n + 1)*sizeof(uint32_t), n + 1,
 				    I915_GEM_DOMAIN_RENDER);
@@ -1496,11 +1526,12 @@ static void __preempt_other(int fd,
 	gem_close(fd, result);
 }
 
-static void preempt_other(int fd, unsigned ring, unsigned int flags)
+static void preempt_other(int fd, const intel_ctx_cfg_t *cfg,
+			  unsigned ring, unsigned int flags)
 {
 	const struct intel_execution_engine2 *e;
 	igt_spin_t *spin = NULL;
-	uint32_t ctx[3];
+	const intel_ctx_t *ctx[3];
 
 	/* On each engine, insert
 	 * [NOISE] spinner,
@@ -1512,16 +1543,16 @@ static void preempt_other(int fd, unsigned ring, unsigned int flags)
 	 * can cross engines.
 	 */
 
-	ctx[LO] = gem_context_clone_with_engines(fd, 0);
-	gem_context_set_priority(fd, ctx[LO], MIN_PRIO);
+	ctx[LO] = intel_ctx_create(fd, cfg);
+	gem_context_set_priority(fd, ctx[LO]->id, MIN_PRIO);
 
-	ctx[NOISE] = gem_context_clone_with_engines(fd, 0);
+	ctx[NOISE] = intel_ctx_create(fd, cfg);
 	spin = __noise(fd, ctx[NOISE], 0, NULL);
 
-	ctx[HI] = gem_context_clone_with_engines(fd, 0);
-	gem_context_set_priority(fd, ctx[HI], MAX_PRIO);
+	ctx[HI] = intel_ctx_create(fd, cfg);
+	gem_context_set_priority(fd, ctx[HI]->id, MAX_PRIO);
 
-	__for_each_physical_engine(fd, e) {
+	for_each_ctx_cfg_engine(fd, cfg, e) {
 		igt_debug("Primary engine: %s\n", e->name);
 		__preempt_other(fd, ctx, ring, e->flags, flags);
 
@@ -1530,12 +1561,12 @@ static void preempt_other(int fd, unsigned ring, unsigned int flags)
 	igt_assert(gem_bo_busy(fd, spin->handle));
 	igt_spin_free(fd, spin);
 
-	gem_context_destroy(fd, ctx[LO]);
-	gem_context_destroy(fd, ctx[NOISE]);
-	gem_context_destroy(fd, ctx[HI]);
+	intel_ctx_destroy(fd, ctx[LO]);
+	intel_ctx_destroy(fd, ctx[NOISE]);
+	intel_ctx_destroy(fd, ctx[HI]);
 }
 
-static void __preempt_queue(int fd,
+static void __preempt_queue(int fd, const intel_ctx_cfg_t *cfg,
 			    unsigned target, unsigned primary,
 			    unsigned depth, unsigned flags)
 {
@@ -1543,33 +1574,33 @@ static void __preempt_queue(int fd,
 	uint32_t result = gem_create(fd, 4096);
 	uint32_t result_read[4096 / sizeof(uint32_t)];
 	igt_spin_t *above = NULL, *below = NULL;
-	uint32_t ctx[3] = {
-		gem_context_clone_with_engines(fd, 0),
-		gem_context_clone_with_engines(fd, 0),
-		gem_context_clone_with_engines(fd, 0),
+	const intel_ctx_t *ctx[3] = {
+		intel_ctx_create(fd, cfg),
+		intel_ctx_create(fd, cfg),
+		intel_ctx_create(fd, cfg),
 	};
 	int prio = MAX_PRIO;
 	unsigned int n, i;
 
 	for (n = 0; n < depth; n++) {
 		if (flags & CONTEXTS) {
-			gem_context_destroy(fd, ctx[NOISE]);
-			ctx[NOISE] = gem_context_clone_with_engines(fd, 0);
+			intel_ctx_destroy(fd, ctx[NOISE]);
+			ctx[NOISE] = intel_ctx_create(fd, cfg);
 		}
 		above = __noise(fd, ctx[NOISE], prio--, above);
 	}
 
-	gem_context_set_priority(fd, ctx[HI], prio--);
+	gem_context_set_priority(fd, ctx[HI]->id, prio--);
 
 	for (; n < MAX_ELSP_QLEN; n++) {
 		if (flags & CONTEXTS) {
-			gem_context_destroy(fd, ctx[NOISE]);
-			ctx[NOISE] = gem_context_clone_with_engines(fd, 0);
+			intel_ctx_destroy(fd, ctx[NOISE]);
+			ctx[NOISE] = intel_ctx_create(fd, cfg);
 		}
 		below = __noise(fd, ctx[NOISE], prio--, below);
 	}
 
-	gem_context_set_priority(fd, ctx[LO], prio--);
+	gem_context_set_priority(fd, ctx[LO]->id, prio--);
 
 	n = 0;
 	store_dword(fd, ctx[LO], primary,
@@ -1578,7 +1609,7 @@ static void __preempt_queue(int fd,
 	n++;
 
 	if (flags & CHAIN) {
-		__for_each_physical_engine(fd, e) {
+		for_each_ctx_engine(fd, ctx[LO], e) {
 			store_dword(fd, ctx[LO], e->flags,
 				    result, (n + 1)*sizeof(uint32_t), n + 1,
 				    I915_GEM_DOMAIN_RENDER);
@@ -1610,25 +1641,26 @@ static void __preempt_queue(int fd,
 		igt_spin_free(fd, below);
 	}
 
-	gem_context_destroy(fd, ctx[LO]);
-	gem_context_destroy(fd, ctx[NOISE]);
-	gem_context_destroy(fd, ctx[HI]);
+	intel_ctx_destroy(fd, ctx[LO]);
+	intel_ctx_destroy(fd, ctx[NOISE]);
+	intel_ctx_destroy(fd, ctx[HI]);
 
 	gem_close(fd, result);
 }
 
-static void preempt_queue(int fd, unsigned ring, unsigned int flags)
+static void preempt_queue(int fd, const intel_ctx_cfg_t *cfg,
+			  unsigned ring, unsigned int flags)
 {
 	const struct intel_execution_engine2 *e;
 
 	for (unsigned depth = 1; depth <= MAX_ELSP_QLEN; depth *= 4)
-		__preempt_queue(fd, ring, ring, depth, flags);
+		__preempt_queue(fd, cfg, ring, ring, depth, flags);
 
-	__for_each_physical_engine(fd, e) {
+	for_each_ctx_cfg_engine(fd, cfg, e) {
 		if (ring == e->flags)
 			continue;
 
-		__preempt_queue(fd, ring, e->flags, MAX_ELSP_QLEN, flags);
+		__preempt_queue(fd, cfg, ring, e->flags, MAX_ELSP_QLEN, flags);
 	}
 }
 
@@ -1645,19 +1677,16 @@ static void preempt_engines(int i915,
 			    const struct intel_execution_engine2 *e,
 			    unsigned int flags)
 {
-	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines , I915_EXEC_RING_MASK + 1);
-	struct drm_i915_gem_context_param param = {
-		.ctx_id = gem_context_create(i915),
-		.param = I915_CONTEXT_PARAM_ENGINES,
-		.value = to_user_pointer(&engines),
-		.size = sizeof(engines),
-	};
 	struct pnode {
 		struct igt_list_head spinners;
 		struct igt_list_head link;
-	} pnode[I915_EXEC_RING_MASK + 1], *p;
+	} pnode[GEM_MAX_ENGINES], *p;
+	struct intel_ctx_cfg cfg = {
+		.num_engines = GEM_MAX_ENGINES,
+	};
 	IGT_LIST_HEAD(plist);
 	igt_spin_t *spin, *sn;
+	const intel_ctx_t *ctx;
 
 	/*
 	 * A quick test that each engine within a context is an independent
@@ -1666,19 +1695,19 @@ static void preempt_engines(int i915,
 
 	igt_require(has_context_engines(i915));
 
-	for (int n = 0; n <= I915_EXEC_RING_MASK; n++) {
-		engines.engines[n].engine_class = e->class;
-		engines.engines[n].engine_instance = e->instance;
+	for (int n = 0; n < GEM_MAX_ENGINES; n++) {
+		cfg.engines[n].engine_class = e->class;
+		cfg.engines[n].engine_instance = e->instance;
 		IGT_INIT_LIST_HEAD(&pnode[n].spinners);
 		igt_list_add(&pnode[n].link, &plist);
 	}
-	gem_context_set_param(i915, &param);
+	ctx = intel_ctx_create(i915, &cfg);
 
-	for (int n = -I915_EXEC_RING_MASK; n <= I915_EXEC_RING_MASK; n++) {
+	for (int n = -(GEM_MAX_ENGINES - 1); n < GEM_MAX_ENGINES; n++) {
 		unsigned int engine = n & I915_EXEC_RING_MASK;
 
-		gem_context_set_priority(i915, param.ctx_id, n);
-		spin = igt_spin_new(i915, param.ctx_id, .engine = engine);
+		gem_context_set_priority(i915, ctx->id, n);
+		spin = igt_spin_new(i915, .ctx = ctx, .engine = engine);
 
 		igt_list_move_tail(&spin->link, &pnode[engine].spinners);
 		igt_list_move(&pnode[engine].link, &plist);
@@ -1691,17 +1720,18 @@ static void preempt_engines(int i915,
 			igt_spin_free(i915, spin);
 		}
 	}
-	gem_context_destroy(i915, param.ctx_id);
+	intel_ctx_destroy(i915, ctx);
 }
 
-static void preempt_self(int fd, unsigned ring)
+static void preempt_self(int fd, const intel_ctx_cfg_t *cfg,
+			 unsigned ring)
 {
 	const struct intel_execution_engine2 *e;
 	uint32_t result = gem_create(fd, 4096);
 	uint32_t result_read[4096 / sizeof(uint32_t)];
 	igt_spin_t *spin[MAX_ELSP_QLEN];
 	unsigned int n, i;
-	uint32_t ctx[3];
+	const intel_ctx_t *ctx[3];
 
 	/* On each engine, insert
 	 * [NOISE] spinner,
@@ -1711,21 +1741,21 @@ static void preempt_self(int fd, unsigned ring)
 	 * preempt its own lower priority task on any engine.
 	 */
 
-	ctx[NOISE] = gem_context_clone_with_engines(fd, 0);
-	ctx[HI] = gem_context_clone_with_engines(fd, 0);
+	ctx[NOISE] = intel_ctx_create(fd, cfg);
+	ctx[HI] = intel_ctx_create(fd, cfg);
 
 	n = 0;
-	gem_context_set_priority(fd, ctx[HI], MIN_PRIO);
-	__for_each_physical_engine(fd, e) {
+	gem_context_set_priority(fd, ctx[HI]->id, MIN_PRIO);
+	for_each_ctx_cfg_engine(fd, cfg, e) {
 		spin[n] = __igt_spin_new(fd,
-					 .ctx_id = ctx[NOISE],
+					 .ctx = ctx[NOISE],
 					 .engine = e->flags);
 		store_dword(fd, ctx[HI], e->flags,
 			    result, (n + 1)*sizeof(uint32_t), n + 1,
 			    I915_GEM_DOMAIN_RENDER);
 		n++;
 	}
-	gem_context_set_priority(fd, ctx[HI], MAX_PRIO);
+	gem_context_set_priority(fd, ctx[HI]->id, MAX_PRIO);
 	store_dword(fd, ctx[HI], ring,
 		    result, (n + 1)*sizeof(uint32_t), n + 1,
 		    I915_GEM_DOMAIN_RENDER);
@@ -1743,36 +1773,37 @@ static void preempt_self(int fd, unsigned ring)
 	for (i = 0; i <= n; i++)
 		igt_assert_eq_u32(result_read[i], i);
 
-	gem_context_destroy(fd, ctx[NOISE]);
-	gem_context_destroy(fd, ctx[HI]);
+	intel_ctx_destroy(fd, ctx[NOISE]);
+	intel_ctx_destroy(fd, ctx[HI]);
 
 	gem_close(fd, result);
 }
 
-static void preemptive_hang(int fd, const struct intel_execution_engine2 *e)
+static void preemptive_hang(int fd, const intel_ctx_cfg_t *cfg,
+			    const struct intel_execution_engine2 *e)
 {
 	igt_spin_t *spin[MAX_ELSP_QLEN];
 	igt_hang_t hang;
-	uint32_t ctx[2];
+	const intel_ctx_t *ctx[2];
 
 	/* Set a fast timeout to speed the test up (if available) */
 	set_preempt_timeout(fd, e, 150);
 
-	ctx[HI] = gem_context_clone_with_engines(fd, 0);
-	gem_context_set_priority(fd, ctx[HI], MAX_PRIO);
+	ctx[HI] = intel_ctx_create(fd, cfg);
+	gem_context_set_priority(fd, ctx[HI]->id, MAX_PRIO);
 
 	for (int n = 0; n < ARRAY_SIZE(spin); n++) {
-		ctx[LO] = gem_context_clone_with_engines(fd, 0);
-		gem_context_set_priority(fd, ctx[LO], MIN_PRIO);
+		ctx[LO] = intel_ctx_create(fd, cfg);
+		gem_context_set_priority(fd, ctx[LO]->id, MIN_PRIO);
 
 		spin[n] = __igt_spin_new(fd,
-					 .ctx_id = ctx[LO],
+					 .ctx = ctx[LO],
 					 .engine = e->flags);
 
-		gem_context_destroy(fd, ctx[LO]);
+		intel_ctx_destroy(fd, ctx[LO]);
 	}
 
-	hang = igt_hang_ctx(fd, ctx[HI], e->flags, 0);
+	hang = igt_hang_ctx(fd, ctx[HI]->id, e->flags, 0);
 	igt_post_hang_ring(fd, hang);
 
 	for (int n = 0; n < ARRAY_SIZE(spin); n++) {
@@ -1784,10 +1815,11 @@ static void preemptive_hang(int fd, const struct intel_execution_engine2 *e)
 		igt_spin_free(fd, spin[n]);
 	}
 
-	gem_context_destroy(fd, ctx[HI]);
+	intel_ctx_destroy(fd, ctx[HI]);
 }
 
-static void deep(int fd, unsigned ring)
+static void deep(int fd, const intel_ctx_cfg_t *cfg,
+		 unsigned ring)
 {
 #define XS 8
 	const unsigned int max_req = MAX_PRIO - MIN_PRIO;
@@ -1799,13 +1831,13 @@ static void deep(int fd, unsigned ring)
 	uint32_t result, dep[XS];
 	uint32_t read_buf[size / sizeof(uint32_t)];
 	uint32_t expected = 0;
-	uint32_t *ctx;
+	const intel_ctx_t **ctx;
 	int dep_nreq;
 	int n;
 
 	ctx = malloc(sizeof(*ctx) * MAX_CONTEXTS);
 	for (n = 0; n < MAX_CONTEXTS; n++) {
-		ctx[n] = gem_context_clone_with_engines(fd, 0);
+		ctx[n] = intel_ctx_create(fd, cfg);
 	}
 
 	nreq = gem_submission_measure(fd, ring) / (3 * XS) * MAX_CONTEXTS;
@@ -1835,7 +1867,7 @@ static void deep(int fd, unsigned ring)
 		execbuf.buffer_count = XS + 2;
 		execbuf.flags = ring;
 		for (n = 0; n < MAX_CONTEXTS; n++) {
-			execbuf.rsvd1 = ctx[n];
+			execbuf.rsvd1 = ctx[n]->id;
 			gem_execbuf(fd, &execbuf);
 		}
 		gem_close(fd, obj[XS+1].handle);
@@ -1853,7 +1885,7 @@ static void deep(int fd, unsigned ring)
 			.buffers_ptr = to_user_pointer(obj),
 			.buffer_count = 3,
 			.flags = ring | (gen < 6 ? I915_EXEC_SECURE : 0),
-			.rsvd1 = ctx[n % MAX_CONTEXTS],
+			.rsvd1 = ctx[n % MAX_CONTEXTS]->id,
 		};
 		uint32_t batch[16];
 		int i;
@@ -1901,33 +1933,33 @@ static void deep(int fd, unsigned ring)
 	dep_nreq = n;
 
 	for (n = 0; n < nreq && igt_seconds_elapsed(&tv) < 4; n++) {
-		uint32_t context = ctx[n % MAX_CONTEXTS];
-		gem_context_set_priority(fd, context, MAX_PRIO - nreq + n);
+		const intel_ctx_t *context = ctx[n % MAX_CONTEXTS];
+		gem_context_set_priority(fd, context->id, MAX_PRIO - nreq + n);
 
+		expected = context->id;
 		for (int m = 0; m < XS; m++) {
-			store_dword_plug(fd, context, ring, result, 4*n, context, dep[m], 0);
-			store_dword(fd, context, ring, result, 4*m, context, I915_GEM_DOMAIN_INSTRUCTION);
+			store_dword_plug(fd, context, ring, result, 4*n, expected, dep[m], 0);
+			store_dword(fd, context, ring, result, 4*m, expected, I915_GEM_DOMAIN_INSTRUCTION);
 		}
-		expected = context;
 	}
 	igt_info("Second deptree: %d requests [%.3fs]\n",
 		 n * XS, 1e-9*igt_nsec_elapsed(&tv));
 
-	unplug_show_queue(fd, &cork, ring);
+	unplug_show_queue(fd, &cork, cfg, ring);
 	gem_close(fd, plug);
 	igt_require(expected); /* too slow */
 
-	for (n = 0; n < MAX_CONTEXTS; n++)
-		gem_context_destroy(fd, ctx[n]);
-
 	for (int m = 0; m < XS; m++) {
 		__sync_read_u32_count(fd, dep[m], read_buf, sizeof(read_buf));
 		gem_close(fd, dep[m]);
 
 		for (n = 0; n < dep_nreq; n++)
-			igt_assert_eq_u32(read_buf[n], ctx[n % MAX_CONTEXTS]);
+			igt_assert_eq_u32(read_buf[n], ctx[n % MAX_CONTEXTS]->id);
 	}
 
+	for (n = 0; n < MAX_CONTEXTS; n++)
+		intel_ctx_destroy(fd, ctx[n]);
+
 	__sync_read_u32_count(fd, result, read_buf, sizeof(read_buf));
 	gem_close(fd, result);
 
@@ -1951,20 +1983,20 @@ static int __execbuf(int fd, struct drm_i915_gem_execbuffer2 *execbuf)
 	return err;
 }
 
-static void wide(int fd, unsigned ring)
+static void wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 {
 	const unsigned int ring_size = gem_submission_measure(fd, ring);
 	struct timespec tv = {};
 	IGT_CORK_FENCE(cork);
 	uint32_t result;
 	uint32_t result_read[MAX_CONTEXTS];
-	uint32_t *ctx;
+	const intel_ctx_t **ctx;
 	unsigned int count;
 	int fence;
 
 	ctx = malloc(sizeof(*ctx)*MAX_CONTEXTS);
 	for (int n = 0; n < MAX_CONTEXTS; n++)
-		ctx[n] = gem_context_clone_with_engines(fd, 0);
+		ctx[n] = intel_ctx_create(fd, cfg);
 
 	result = gem_create(fd, 4*MAX_CONTEXTS);
 
@@ -1975,28 +2007,28 @@ static void wide(int fd, unsigned ring)
 	     igt_seconds_elapsed(&tv) < 5 && count < ring_size;
 	     count++) {
 		for (int n = 0; n < MAX_CONTEXTS; n++) {
-			store_dword_fenced(fd, ctx[n], ring, result, 4*n, ctx[n],
+			store_dword_fenced(fd, ctx[n], ring, result, 4*n, ctx[n]->id,
 					   fence, I915_GEM_DOMAIN_INSTRUCTION);
 		}
 	}
 	igt_info("Submitted %d requests over %d contexts in %.1fms\n",
 		 count, MAX_CONTEXTS, igt_nsec_elapsed(&tv) * 1e-6);
 
-	unplug_show_queue(fd, &cork, ring);
+	unplug_show_queue(fd, &cork, cfg, ring);
 	close(fence);
 
+	__sync_read_u32_count(fd, result, result_read, sizeof(result_read));
 	for (int n = 0; n < MAX_CONTEXTS; n++)
-		gem_context_destroy(fd, ctx[n]);
+		igt_assert_eq_u32(result_read[n], ctx[n]->id);
 
-	__sync_read_u32_count(fd, result, result_read, sizeof(result_read));
 	for (int n = 0; n < MAX_CONTEXTS; n++)
-		igt_assert_eq_u32(result_read[n], ctx[n]);
+		intel_ctx_destroy(fd, ctx[n]);
 
 	gem_close(fd, result);
 	free(ctx);
 }
 
-static void reorder_wide(int fd, unsigned ring)
+static void reorder_wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 {
 	const unsigned int ring_size = gem_submission_measure(fd, ring);
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
@@ -2040,9 +2072,11 @@ static void reorder_wide(int fd, unsigned ring)
 	for (int n = 0, x = 1; n < ARRAY_SIZE(priorities); n++, x++) {
 		unsigned int sz = ALIGN(ring_size * 64, 4096);
 		uint32_t *batch;
+		const intel_ctx_t *tmp_ctx;
 
-		execbuf.rsvd1 = gem_context_clone_with_engines(fd, 0);
-		gem_context_set_priority(fd, execbuf.rsvd1, priorities[n]);
+		tmp_ctx = intel_ctx_create(fd, cfg);
+		gem_context_set_priority(fd, tmp_ctx->id, priorities[n]);
+		execbuf.rsvd1 = tmp_ctx->id;
 
 		obj[1].handle = gem_create(fd, sz);
 		batch = gem_mmap__device_coherent(fd, obj[1].handle, 0, sz, PROT_WRITE);
@@ -2082,10 +2116,10 @@ static void reorder_wide(int fd, unsigned ring)
 
 		munmap(batch, sz);
 		gem_close(fd, obj[1].handle);
-		gem_context_destroy(fd, execbuf.rsvd1);
+		intel_ctx_destroy(fd, tmp_ctx);
 	}
 
-	unplug_show_queue(fd, &cork, ring);
+	unplug_show_queue(fd, &cork, cfg, ring);
 	close(fence);
 
 	__sync_read_u32_count(fd, result, result_read, sizeof(result_read));
@@ -2111,17 +2145,18 @@ static void bind_to_cpu(int cpu)
 	igt_assert(sched_setaffinity(getpid(), sizeof(cpu_set_t), &allowed) == 0);
 }
 
-static void test_pi_ringfull(int fd, unsigned int engine, unsigned int flags)
+static void test_pi_ringfull(int fd, const intel_ctx_cfg_t *cfg,
+			     unsigned int engine, unsigned int flags)
 #define SHARED BIT(0)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct sigaction sa = { .sa_handler = alarm_handler };
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj[2];
+	const intel_ctx_t *ctx, *vip;
 	unsigned int last, count;
 	struct itimerval itv;
 	IGT_CORK_HANDLE(c);
-	uint32_t vip;
 	bool *result;
 
 	/*
@@ -2153,17 +2188,18 @@ static void test_pi_ringfull(int fd, unsigned int engine, unsigned int flags)
 
 	execbuf.buffers_ptr = to_user_pointer(&obj[1]);
 	execbuf.buffer_count = 1;
-	execbuf.flags = engine;
 
 	/* Warm up both (hi/lo) contexts */
-	execbuf.rsvd1 = gem_context_clone_with_engines(fd, 0);
-	gem_context_set_priority(fd, execbuf.rsvd1, MAX_PRIO);
+	ctx = intel_ctx_create(fd, cfg);
+	gem_context_set_priority(fd, ctx->id, MAX_PRIO);
+	execbuf.rsvd1 = ctx->id;
 	gem_execbuf(fd, &execbuf);
 	gem_sync(fd, obj[1].handle);
-	vip = execbuf.rsvd1;
+	vip = ctx;
 
-	execbuf.rsvd1 = gem_context_clone_with_engines(fd, 0);
-	gem_context_set_priority(fd, execbuf.rsvd1, MIN_PRIO);
+	ctx = intel_ctx_create(fd, cfg);
+	gem_context_set_priority(fd, ctx->id, MIN_PRIO);
+	execbuf.rsvd1 = ctx->id;
 	gem_execbuf(fd, &execbuf);
 	gem_sync(fd, obj[1].handle);
 
@@ -2213,7 +2249,7 @@ static void test_pi_ringfull(int fd, unsigned int engine, unsigned int flags)
 			gem_write(fd, obj[1].handle, 0, &bbe, sizeof(bbe));
 		}
 
-		result[0] = vip != execbuf.rsvd1;
+		result[0] = vip->id != execbuf.rsvd1;
 
 		igt_debug("Waking parent\n");
 		kill(getppid(), SIGALRM);
@@ -2230,7 +2266,7 @@ static void test_pi_ringfull(int fd, unsigned int engine, unsigned int flags)
 		 * able to add ourselves to *our* ring without interruption.
 		 */
 		igt_debug("HP child executing\n");
-		execbuf.rsvd1 = vip;
+		execbuf.rsvd1 = vip->id;
 		err = __execbuf(fd, &execbuf);
 		igt_debug("HP execbuf returned %d\n", err);
 
@@ -2261,8 +2297,8 @@ static void test_pi_ringfull(int fd, unsigned int engine, unsigned int flags)
 	igt_cork_unplug(&c);
 	igt_waitchildren();
 
-	gem_context_destroy(fd, execbuf.rsvd1);
-	gem_context_destroy(fd, vip);
+	intel_ctx_destroy(fd, ctx);
+	intel_ctx_destroy(fd, vip);
 	gem_close(fd, obj[1].handle);
 	gem_close(fd, obj[0].handle);
 	munmap(result, 4096);
@@ -2277,8 +2313,8 @@ struct ufd_thread {
 	uint32_t batch;
 	uint32_t scratch;
 	uint32_t *page;
+	const intel_ctx_cfg_t *cfg;
 	unsigned int engine;
-	unsigned int flags;
 	int i915;
 
 	pthread_mutex_t mutex;
@@ -2301,11 +2337,12 @@ static void *ufd_thread(void *arg)
 		{ .handle = create_userptr(t->i915, t->page) },
 		{ .handle = t->batch },
 	};
+	const intel_ctx_t *ctx = intel_ctx_create(t->i915, t->cfg);
 	struct drm_i915_gem_execbuffer2 eb = {
 		.buffers_ptr = to_user_pointer(obj),
 		.buffer_count = ARRAY_SIZE(obj),
 		.flags = t->engine,
-		.rsvd1 = gem_context_clone_with_engines(t->i915, 0),
+		.rsvd1 = ctx->id,
 	};
 	gem_context_set_priority(t->i915, eb.rsvd1, MIN_PRIO);
 
@@ -2314,13 +2351,15 @@ static void *ufd_thread(void *arg)
 	gem_sync(t->i915, obj[0].handle);
 	gem_close(t->i915, obj[0].handle);
 
-	gem_context_destroy(t->i915, eb.rsvd1);
+	intel_ctx_destroy(t->i915, ctx);
 
 	t->i915 = -1;
 	return NULL;
 }
 
-static void test_pi_userfault(int i915, unsigned int engine)
+static void test_pi_userfault(int i915,
+			      const intel_ctx_cfg_t *cfg,
+			      unsigned int engine)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct uffdio_api api = { .api = UFFD_API };
@@ -2353,6 +2392,7 @@ static void test_pi_userfault(int i915, unsigned int engine)
 		      "userfaultfd API v%lld:%lld\n", UFFD_API, api.api);
 
 	t.i915 = i915;
+	t.cfg = cfg;
 	t.engine = engine;
 
 	t.page = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, 0, 0);
@@ -2383,11 +2423,12 @@ static void test_pi_userfault(int i915, unsigned int engine)
 			.handle = gem_create(i915, 4096),
 		};
 		struct pollfd pfd;
+		const intel_ctx_t *ctx = intel_ctx_create(i915, cfg);
 		struct drm_i915_gem_execbuffer2 eb = {
 			.buffers_ptr = to_user_pointer(&obj),
 			.buffer_count = 1,
 			.flags = engine | I915_EXEC_FENCE_OUT,
-			.rsvd1 = gem_context_clone_with_engines(i915, 0),
+			.rsvd1 = ctx->id,
 		};
 		gem_context_set_priority(i915, eb.rsvd1, MAX_PRIO);
 		gem_write(i915, obj.handle, 0, &bbe, sizeof(bbe));
@@ -2401,7 +2442,7 @@ static void test_pi_userfault(int i915, unsigned int engine)
 		igt_assert_eq(sync_fence_status(pfd.fd), 1);
 		close(pfd.fd);
 
-		gem_context_destroy(i915, eb.rsvd1);
+		intel_ctx_destroy(i915, ctx);
 	}
 
 	/* Confirm the low priority context is still waiting */
@@ -2425,15 +2466,10 @@ static void test_pi_userfault(int i915, unsigned int engine)
 
 static void *iova_thread(struct ufd_thread *t, int prio)
 {
-	unsigned int clone;
-	uint32_t ctx;
-
-	clone = I915_CONTEXT_CLONE_ENGINES;
-	if (t->flags & SHARED)
-		clone |= I915_CONTEXT_CLONE_VM;
+	const intel_ctx_t *ctx;
 
-	ctx = gem_context_clone(t->i915, 0, clone, 0);
-	gem_context_set_priority(t->i915, ctx, prio);
+	ctx = intel_ctx_create(t->i915, t->cfg);
+	gem_context_set_priority(t->i915, ctx->id, prio);
 
 	store_dword_plug(t->i915, ctx, t->engine,
 			 t->scratch, 0, prio,
@@ -2444,7 +2480,7 @@ static void *iova_thread(struct ufd_thread *t, int prio)
 		pthread_cond_signal(&t->cond);
 	pthread_mutex_unlock(&t->mutex);
 
-	gem_context_destroy(t->i915, ctx);
+	intel_ctx_destroy(t->i915, ctx);
 	return NULL;
 }
 
@@ -2458,8 +2494,10 @@ static void *iova_high(void *arg)
 	return iova_thread(arg, MAX_PRIO);
 }
 
-static void test_pi_iova(int i915, unsigned int engine, unsigned int flags)
+static void test_pi_iova(int i915, const intel_ctx_cfg_t *cfg,
+			 unsigned int engine, unsigned int flags)
 {
+	intel_ctx_cfg_t ufd_cfg = *cfg;
 	struct uffdio_api api = { .api = UFFD_API };
 	struct uffdio_register reg;
 	struct uffdio_copy copy;
@@ -2493,9 +2531,12 @@ static void test_pi_iova(int i915, unsigned int engine, unsigned int flags)
 	igt_require_f(ioctl(ufd, UFFDIO_API, &api) == 0 && api.api == UFFD_API,
 		      "userfaultfd API v%lld:%lld\n", UFFD_API, api.api);
 
+	if (flags & SHARED)
+		ufd_cfg.vm = gem_vm_create(i915);
+
 	t.i915 = i915;
+	t.cfg = &ufd_cfg;
 	t.engine = engine;
-	t.flags = flags;
 
 	t.count = 2;
 	pthread_cond_init(&t.cond, NULL);
@@ -2534,9 +2575,10 @@ static void test_pi_iova(int i915, unsigned int engine, unsigned int flags)
 	 */
 	spin = igt_spin_new(i915, .engine = engine);
 	for (int i = 0; i < MAX_ELSP_QLEN; i++) {
-		spin->execbuf.rsvd1 = create_highest_priority(i915);
+		const intel_ctx_t *ctx = create_highest_priority(i915, cfg);
+		spin->execbuf.rsvd1 = ctx->id;
 		gem_execbuf(i915, &spin->execbuf);
-		gem_context_destroy(i915, spin->execbuf.rsvd1);
+		intel_ctx_destroy(i915, ctx);
 	}
 
 	/* Kick off the submission threads */
@@ -2573,10 +2615,14 @@ static void test_pi_iova(int i915, unsigned int engine, unsigned int flags)
 	gem_close(i915, t.scratch);
 
 	munmap(t.page, 4096);
+
+	if (flags & SHARED)
+		gem_vm_destroy(i915, ufd_cfg.vm);
+
 	close(ufd);
 }
 
-static void measure_semaphore_power(int i915)
+static void measure_semaphore_power(int i915, const intel_ctx_t *ctx)
 {
 	const struct intel_execution_engine2 *signaler, *e;
 	struct rapl gpu, pkg;
@@ -2584,7 +2630,7 @@ static void measure_semaphore_power(int i915)
 	igt_require(gpu_power_open(&gpu) == 0);
 	pkg_power_open(&pkg);
 
-	__for_each_physical_engine(i915, signaler) {
+	for_each_ctx_engine(i915, ctx, signaler) {
 		struct {
 			struct power_sample pkg, gpu;
 		} s_spin[2], s_sema[2];
@@ -2596,6 +2642,7 @@ static void measure_semaphore_power(int i915)
 			continue;
 
 		spin = __igt_spin_new(i915,
+				      .ctx = ctx,
 				      .engine = signaler->flags,
 				      .flags = IGT_SPIN_POLL_RUN);
 		gem_wait(i915, spin->handle, &jiffie); /* waitboost */
@@ -2608,13 +2655,14 @@ static void measure_semaphore_power(int i915)
 		rapl_read(&pkg, &s_spin[1].pkg);
 
 		/* Add a waiter to each engine */
-		__for_each_physical_engine(i915, e) {
+		for_each_ctx_engine(i915, ctx, e) {
 			igt_spin_t *sema;
 
 			if (e->flags == signaler->flags)
 				continue;
 
 			sema = __igt_spin_new(i915,
+					      .ctx = ctx,
 					      .engine = e->flags,
 					      .dependency = spin->handle);
 
@@ -2686,8 +2734,7 @@ static int cmp_u32(const void *A, const void *B)
 		return 0;
 }
 
-static uint32_t read_ctx_timestamp(int i915,
-				   uint32_t ctx,
+static uint32_t read_ctx_timestamp(int i915, const intel_ctx_t *ctx,
 				   const struct intel_execution_engine2 *e)
 {
 	const int use_64b = intel_gen(intel_get_drm_devid(i915)) >= 8;
@@ -2703,7 +2750,7 @@ static uint32_t read_ctx_timestamp(int i915,
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
 		.flags = e->flags,
-		.rsvd1 = ctx,
+		.rsvd1 = ctx->id,
 	};
 #define RUNTIME (base + 0x3a8)
 	uint32_t *map, *cs;
@@ -2736,7 +2783,7 @@ static uint32_t read_ctx_timestamp(int i915,
 	return ts;
 }
 
-static void fairslice(int i915,
+static void fairslice(int i915, const intel_ctx_cfg_t *cfg,
 		      const struct intel_execution_engine2 *e,
 		      unsigned long flags,
 		      int duration)
@@ -2744,14 +2791,14 @@ static void fairslice(int i915,
 	const double timeslice_duration_ns = 1e6;
 	igt_spin_t *spin = NULL;
 	double threshold;
-	uint32_t ctx[3];
+	const intel_ctx_t *ctx[3];
 	uint32_t ts[3];
 
 	for (int i = 0; i < ARRAY_SIZE(ctx); i++) {
-		ctx[i] = gem_context_clone_with_engines(i915, 0);
+		ctx[i] = intel_ctx_create(i915, cfg);
 		if (spin == NULL) {
 			spin = __igt_spin_new(i915,
-					      .ctx_id = ctx[i],
+					      .ctx = ctx[i],
 					      .engine = e->flags,
 					      .flags = flags);
 		} else {
@@ -2759,7 +2806,7 @@ static void fairslice(int i915,
 				.buffer_count = 1,
 				.buffers_ptr = to_user_pointer(&spin->obj[IGT_SPIN_BATCH]),
 				.flags = e->flags,
-				.rsvd1 = ctx[i],
+				.rsvd1 = ctx[i]->id,
 			};
 			gem_execbuf(i915, &eb);
 		}
@@ -2773,7 +2820,7 @@ static void fairslice(int i915,
 		ts[i] = read_ctx_timestamp(i915, ctx[i], e);
 
 	for (int i = 0; i < ARRAY_SIZE(ctx); i++)
-		gem_context_destroy(i915, ctx[i]);
+		intel_ctx_destroy(i915, ctx[i]);
 	igt_spin_free(i915, spin);
 
 	/*
@@ -2800,18 +2847,19 @@ static void fairslice(int i915,
 		     1e-6 * threshold * 2);
 }
 
-#define test_each_engine(T, i915, e) \
-	igt_subtest_with_dynamic(T) __for_each_physical_engine(i915, e) \
+#define test_each_engine(T, i915, ctx, e) \
+	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
 		igt_dynamic_f("%s", e->name)
 
-#define test_each_engine_store(T, i915, e) \
-	igt_subtest_with_dynamic(T) __for_each_physical_engine(i915, e) \
+#define test_each_engine_store(T, i915, ctx, e) \
+	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
 		for_each_if(gem_class_can_store_dword(fd, e->class)) \
 		igt_dynamic_f("%s", e->name)
 
 igt_main
 {
 	int fd = -1;
+	const intel_ctx_t *ctx = NULL;
 
 	igt_fixture {
 		igt_require_sw_sync();
@@ -2823,6 +2871,7 @@ igt_main
 		igt_require_gem(fd);
 		gem_require_mmap_wc(fd);
 		gem_require_contexts(fd);
+		ctx = intel_ctx_create_all_physical(fd);
 
 		igt_fork_hang_detector(fd);
 	}
@@ -2830,22 +2879,22 @@ igt_main
 	igt_subtest_group {
 		const struct intel_execution_engine2 *e;
 
-		test_each_engine_store("fifo", fd, e)
-			fifo(fd, e->flags);
+		test_each_engine_store("fifo", fd, ctx, e)
+			fifo(fd, ctx, e->flags);
 
-		test_each_engine_store("implicit-read-write", fd, e)
-			implicit_rw(fd, e->flags, READ_WRITE);
+		test_each_engine_store("implicit-read-write", fd, ctx, e)
+			implicit_rw(fd, ctx, e->flags, READ_WRITE);
 
-		test_each_engine_store("implicit-write-read", fd, e)
-			implicit_rw(fd, e->flags, WRITE_READ);
+		test_each_engine_store("implicit-write-read", fd, ctx, e)
+			implicit_rw(fd, ctx, e->flags, WRITE_READ);
 
-		test_each_engine_store("implicit-boths", fd, e)
-			implicit_rw(fd, e->flags, READ_WRITE | WRITE_READ);
+		test_each_engine_store("implicit-boths", fd, ctx, e)
+			implicit_rw(fd, ctx, e->flags, READ_WRITE | WRITE_READ);
 
-		test_each_engine_store("independent", fd, e)
-			independent(fd, e->flags, 0);
-		test_each_engine_store("u-independent", fd, e)
-			independent(fd, e->flags, IGT_SPIN_USERPTR);
+		test_each_engine_store("independent", fd, ctx, e)
+			independent(fd, ctx, e->flags, 0);
+		test_each_engine_store("u-independent", fd, ctx, e)
+			independent(fd, ctx, e->flags, IGT_SPIN_USERPTR);
 	}
 
 	igt_subtest_group {
@@ -2856,19 +2905,19 @@ igt_main
 			igt_require(gem_scheduler_has_ctx_priority(fd));
 		}
 
-		test_each_engine("timeslicing", fd, e)
-			timeslice(fd, e->flags);
+		test_each_engine("timeslicing", fd, ctx, e)
+			timeslice(fd, &ctx->cfg, e->flags);
 
-		test_each_engine("thriceslice", fd, e)
-			timesliceN(fd, e->flags, 3);
+		test_each_engine("thriceslice", fd, ctx, e)
+			timesliceN(fd, &ctx->cfg, e->flags, 3);
 
-		test_each_engine("manyslice", fd, e)
-			timesliceN(fd, e->flags, 67);
+		test_each_engine("manyslice", fd, ctx, e)
+			timesliceN(fd, &ctx->cfg, e->flags, 67);
 
-		test_each_engine("lateslice", fd, e)
-			lateslice(fd, e->flags, 0);
-		test_each_engine("u-lateslice", fd, e)
-			lateslice(fd, e->flags, IGT_SPIN_USERPTR);
+		test_each_engine("lateslice", fd, ctx, e)
+			lateslice(fd, &ctx->cfg, e->flags, 0);
+		test_each_engine("u-lateslice", fd, ctx, e)
+			lateslice(fd, &ctx->cfg, e->flags, IGT_SPIN_USERPTR);
 
 		igt_subtest_group {
 			igt_fixture {
@@ -2877,23 +2926,23 @@ igt_main
 				igt_require(intel_gen(intel_get_drm_devid(fd)) >= 8);
 			}
 
-			test_each_engine("fairslice", fd, e)
-				fairslice(fd, e, 0, 2);
+			test_each_engine("fairslice", fd, ctx, e)
+				fairslice(fd, &ctx->cfg, e, 0, 2);
 
-			test_each_engine("u-fairslice", fd, e)
-				fairslice(fd, e, IGT_SPIN_USERPTR, 2);
+			test_each_engine("u-fairslice", fd, ctx, e)
+				fairslice(fd, &ctx->cfg, e, IGT_SPIN_USERPTR, 2);
 
 			igt_subtest("fairslice-all")  {
-				__for_each_physical_engine(fd, e) {
+				for_each_ctx_engine(fd, ctx, e) {
 					igt_fork(child, 1)
-						fairslice(fd, e, 0, 2);
+						fairslice(fd, &ctx->cfg, e, 0, 2);
 				}
 				igt_waitchildren();
 			}
 			igt_subtest("u-fairslice-all")  {
-				__for_each_physical_engine(fd, e) {
+				for_each_ctx_engine(fd, ctx, e) {
 					igt_fork(child, 1)
-						fairslice(fd, e,
+						fairslice(fd, &ctx->cfg, e,
 							  IGT_SPIN_USERPTR,
 							  2);
 				}
@@ -2901,84 +2950,84 @@ igt_main
 			}
 		}
 
-		test_each_engine("submit-early-slice", fd, e)
-			submit_slice(fd, e, EARLY_SUBMIT);
-		test_each_engine("u-submit-early-slice", fd, e)
-			submit_slice(fd, e, EARLY_SUBMIT | USERPTR);
-		test_each_engine("submit-golden-slice", fd, e)
-			submit_slice(fd, e, 0);
-		test_each_engine("u-submit-golden-slice", fd, e)
-			submit_slice(fd, e, USERPTR);
-		test_each_engine("submit-late-slice", fd, e)
-			submit_slice(fd, e, LATE_SUBMIT);
-		test_each_engine("u-submit-late-slice", fd, e)
-			submit_slice(fd, e, LATE_SUBMIT | USERPTR);
+		test_each_engine("submit-early-slice", fd, ctx, e)
+			submit_slice(fd, &ctx->cfg, e, EARLY_SUBMIT);
+		test_each_engine("u-submit-early-slice", fd, ctx, e)
+			submit_slice(fd, &ctx->cfg, e, EARLY_SUBMIT | USERPTR);
+		test_each_engine("submit-golden-slice", fd, ctx, e)
+			submit_slice(fd, &ctx->cfg, e, 0);
+		test_each_engine("u-submit-golden-slice", fd, ctx, e)
+			submit_slice(fd, &ctx->cfg, e, USERPTR);
+		test_each_engine("submit-late-slice", fd, ctx, e)
+			submit_slice(fd, &ctx->cfg, e, LATE_SUBMIT);
+		test_each_engine("u-submit-late-slice", fd, ctx, e)
+			submit_slice(fd, &ctx->cfg, e, LATE_SUBMIT | USERPTR);
 
 		igt_subtest("semaphore-user")
-			semaphore_userlock(fd, 0);
+			semaphore_userlock(fd, ctx, 0);
 		igt_subtest("semaphore-codependency")
-			semaphore_codependency(fd, 0);
+			semaphore_codependency(fd, ctx, 0);
 		igt_subtest("semaphore-resolve")
-			semaphore_resolve(fd, 0);
+			semaphore_resolve(fd, &ctx->cfg, 0);
 		igt_subtest("semaphore-noskip")
-			semaphore_noskip(fd, 0);
+			semaphore_noskip(fd, &ctx->cfg, 0);
 
 		igt_subtest("u-semaphore-user")
-			semaphore_userlock(fd, IGT_SPIN_USERPTR);
+			semaphore_userlock(fd, ctx, IGT_SPIN_USERPTR);
 		igt_subtest("u-semaphore-codependency")
-			semaphore_codependency(fd, IGT_SPIN_USERPTR);
+			semaphore_codependency(fd, ctx, IGT_SPIN_USERPTR);
 		igt_subtest("u-semaphore-resolve")
-			semaphore_resolve(fd, IGT_SPIN_USERPTR);
+			semaphore_resolve(fd, &ctx->cfg, IGT_SPIN_USERPTR);
 		igt_subtest("u-semaphore-noskip")
-			semaphore_noskip(fd, IGT_SPIN_USERPTR);
+			semaphore_noskip(fd, &ctx->cfg, IGT_SPIN_USERPTR);
 
 		igt_subtest("smoketest-all")
-			smoketest(fd, ALL_ENGINES, 30);
+			smoketest(fd, &ctx->cfg, ALL_ENGINES, 30);
 
-		test_each_engine_store("in-order", fd, e)
-			reorder(fd, e->flags, EQUAL);
+		test_each_engine_store("in-order", fd, ctx, e)
+			reorder(fd, &ctx->cfg, e->flags, EQUAL);
 
-		test_each_engine_store("out-order", fd, e)
-			reorder(fd, e->flags, 0);
+		test_each_engine_store("out-order", fd, ctx, e)
+			reorder(fd, &ctx->cfg, e->flags, 0);
 
-		test_each_engine_store("promotion", fd, e)
-			promotion(fd, e->flags);
+		test_each_engine_store("promotion", fd, ctx, e)
+			promotion(fd, &ctx->cfg, e->flags);
 
 		igt_subtest_group {
 			igt_fixture {
 				igt_require(gem_scheduler_has_preemption(fd));
 			}
 
-			test_each_engine_store("preempt", fd, e)
-				preempt(fd, e, 0);
+			test_each_engine_store("preempt", fd, ctx, e)
+				preempt(fd, &ctx->cfg, e, 0);
 
-			test_each_engine_store("preempt-contexts", fd, e)
-				preempt(fd, e, NEW_CTX);
+			test_each_engine_store("preempt-contexts", fd, ctx, e)
+				preempt(fd, &ctx->cfg, e, NEW_CTX);
 
-			test_each_engine_store("preempt-user", fd, e)
-				preempt(fd, e, USERPTR);
+			test_each_engine_store("preempt-user", fd, ctx, e)
+				preempt(fd, &ctx->cfg, e, USERPTR);
 
-			test_each_engine_store("preempt-self", fd, e)
-				preempt_self(fd, e->flags);
+			test_each_engine_store("preempt-self", fd, ctx, e)
+				preempt_self(fd, &ctx->cfg, e->flags);
 
-			test_each_engine_store("preempt-other", fd, e)
-				preempt_other(fd, e->flags, 0);
+			test_each_engine_store("preempt-other", fd, ctx, e)
+				preempt_other(fd, &ctx->cfg, e->flags, 0);
 
-			test_each_engine_store("preempt-other-chain", fd, e)
-				preempt_other(fd, e->flags, CHAIN);
+			test_each_engine_store("preempt-other-chain", fd, ctx, e)
+				preempt_other(fd, &ctx->cfg, e->flags, CHAIN);
 
-			test_each_engine_store("preempt-queue", fd, e)
-				preempt_queue(fd, e->flags, 0);
+			test_each_engine_store("preempt-queue", fd, ctx, e)
+				preempt_queue(fd, &ctx->cfg, e->flags, 0);
 
-			test_each_engine_store("preempt-queue-chain", fd, e)
-				preempt_queue(fd, e->flags, CHAIN);
-			test_each_engine_store("preempt-queue-contexts", fd, e)
-				preempt_queue(fd, e->flags, CONTEXTS);
+			test_each_engine_store("preempt-queue-chain", fd, ctx, e)
+				preempt_queue(fd, &ctx->cfg, e->flags, CHAIN);
+			test_each_engine_store("preempt-queue-contexts", fd, ctx, e)
+				preempt_queue(fd, &ctx->cfg, e->flags, CONTEXTS);
 
-			test_each_engine_store("preempt-queue-contexts-chain", fd, e)
-				preempt_queue(fd, e->flags, CONTEXTS | CHAIN);
+			test_each_engine_store("preempt-queue-contexts-chain", fd, ctx, e)
+				preempt_queue(fd, &ctx->cfg, e->flags, CONTEXTS | CHAIN);
 
-			test_each_engine_store("preempt-engines", fd, e)
+			test_each_engine_store("preempt-engines", fd, ctx, e)
 				preempt_engines(fd, e, 0);
 
 			igt_subtest_group {
@@ -2989,11 +3038,11 @@ igt_main
 					hang = igt_allow_hang(fd, 0, 0);
 				}
 
-				test_each_engine_store("preempt-hang", fd, e)
-					preempt(fd, e, NEW_CTX | HANG_LP);
+				test_each_engine_store("preempt-hang", fd, ctx, e)
+					preempt(fd, &ctx->cfg, e, NEW_CTX | HANG_LP);
 
-				test_each_engine_store("preemptive-hang", fd, e)
-					preemptive_hang(fd, e);
+				test_each_engine_store("preemptive-hang", fd, ctx, e)
+					preemptive_hang(fd, &ctx->cfg, e);
 
 				igt_fixture {
 					igt_disallow_hang(fd, hang);
@@ -3002,30 +3051,30 @@ igt_main
 			}
 		}
 
-		test_each_engine_store("noreorder", fd, e)
-			noreorder(fd, e->flags, 0, 0);
+		test_each_engine_store("noreorder", fd, ctx, e)
+			noreorder(fd, &ctx->cfg, e->flags, 0, 0);
 
-		test_each_engine_store("noreorder-priority", fd, e) {
+		test_each_engine_store("noreorder-priority", fd, ctx, e) {
 			igt_require(gem_scheduler_enabled(fd));
-			noreorder(fd, e->flags, MAX_PRIO, 0);
+			noreorder(fd, &ctx->cfg, e->flags, MAX_PRIO, 0);
 		}
 
-		test_each_engine_store("noreorder-corked", fd, e) {
+		test_each_engine_store("noreorder-corked", fd, ctx, e) {
 			igt_require(gem_scheduler_enabled(fd));
-			noreorder(fd, e->flags, MAX_PRIO, CORKED);
+			noreorder(fd, &ctx->cfg, e->flags, MAX_PRIO, CORKED);
 		}
 
-		test_each_engine_store("deep", fd, e)
-			deep(fd, e->flags);
+		test_each_engine_store("deep", fd, ctx, e)
+			deep(fd, &ctx->cfg, e->flags);
 
-		test_each_engine_store("wide", fd, e)
-			wide(fd, e->flags);
+		test_each_engine_store("wide", fd, ctx, e)
+			wide(fd, &ctx->cfg, e->flags);
 
-		test_each_engine_store("reorder-wide", fd, e)
-			reorder_wide(fd, e->flags);
+		test_each_engine_store("reorder-wide", fd, ctx, e)
+			reorder_wide(fd, &ctx->cfg, e->flags);
 
-		test_each_engine_store("smoketest", fd, e)
-			smoketest(fd, e->flags, 5);
+		test_each_engine_store("smoketest", fd, ctx, e)
+			smoketest(fd, &ctx->cfg, e->flags, 5);
 	}
 
 	igt_subtest_group {
@@ -3037,20 +3086,20 @@ igt_main
 			igt_require(gem_scheduler_has_preemption(fd));
 		}
 
-		test_each_engine("pi-ringfull", fd, e)
-			test_pi_ringfull(fd, e->flags, 0);
+		test_each_engine("pi-ringfull", fd, ctx, e)
+			test_pi_ringfull(fd, &ctx->cfg, e->flags, 0);
 
-		test_each_engine("pi-common", fd, e)
-			test_pi_ringfull(fd, e->flags, SHARED);
+		test_each_engine("pi-common", fd, ctx, e)
+			test_pi_ringfull(fd, &ctx->cfg, e->flags, SHARED);
 
-		test_each_engine("pi-userfault", fd, e)
-			test_pi_userfault(fd, e->flags);
+		test_each_engine("pi-userfault", fd, ctx, e)
+			test_pi_userfault(fd, &ctx->cfg, e->flags);
 
-		test_each_engine("pi-distinct-iova", fd, e)
-			test_pi_iova(fd, e->flags, 0);
+		test_each_engine("pi-distinct-iova", fd, ctx, e)
+			test_pi_iova(fd, &ctx->cfg, e->flags, 0);
 
-		test_each_engine("pi-shared-iova", fd, e)
-			test_pi_iova(fd, e->flags, SHARED);
+		test_each_engine("pi-shared-iova", fd, ctx, e)
+			test_pi_iova(fd, &ctx->cfg, e->flags, SHARED);
 	}
 
 	igt_subtest_group {
@@ -3060,11 +3109,12 @@ igt_main
 		}
 
 		igt_subtest("semaphore-power")
-			measure_semaphore_power(fd);
+			measure_semaphore_power(fd, ctx);
 	}
 
 	igt_fixture {
 		igt_stop_hang_detector();
+		intel_ctx_destroy(fd, ctx);
 		close(fd);
 	}
 }
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
