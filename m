Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C34D6E566
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Aug 2021 07:47:29 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 13 Aug 2021 09:47:02 +0200
Message-Id: <20210813074703.18778-9-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210813074703.18778-1-zbigniew.kempczynski@intel.com>
References: <20210813074703.18778-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 8/9] tests/gem_exec_schedule: Adopt to use
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

Alter tests to cover reloc and no-reloc (softpin) modes.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_schedule.c | 463 +++++++++++++++++++++++++--------
 1 file changed, 359 insertions(+), 104 deletions(-)

diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index e5fb45982..a63e89197 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -91,9 +91,11 @@ void __sync_read_u32_count(int fd, uint32_t handle, uint32_t *dst, uint64_t size
 	gem_read(fd, handle, 0, dst, size);
 }
 
-static uint32_t __store_dword(int fd, const intel_ctx_t *ctx, unsigned ring,
-			      uint32_t target, uint32_t offset, uint32_t value,
-			      uint32_t cork, int fence, unsigned write_domain)
+static uint32_t __store_dword(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
+			      unsigned ring, uint32_t target, uint64_t target_offset,
+			      uint32_t offset, uint32_t value,
+			      uint32_t cork, uint64_t cork_offset,
+			      int fence, unsigned write_domain)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 obj[3];
@@ -117,12 +119,23 @@ static uint32_t __store_dword(int fd, const intel_ctx_t *ctx, unsigned ring,
 
 	memset(obj, 0, sizeof(obj));
 	obj[0].handle = cork;
-	obj[0].offset = cork << 20;
 	obj[1].handle = target;
-	obj[1].offset = target << 20;
 	obj[2].handle = gem_create(fd, 4096);
-	obj[2].offset = 256 << 10;
-	obj[2].offset += (random() % 128) << 12;
+	if (ahnd) {
+		obj[0].offset = cork_offset;
+		obj[0].flags |= EXEC_OBJECT_PINNED;
+		obj[1].offset = target_offset;
+		obj[1].flags |= EXEC_OBJECT_PINNED;
+		if (write_domain)
+			obj[1].flags |= EXEC_OBJECT_WRITE;
+		obj[2].offset = get_offset(ahnd, obj[2].handle, 4096, 0);
+		obj[2].flags |= EXEC_OBJECT_PINNED;
+	} else {
+		obj[0].offset = cork << 20;
+		obj[1].offset = target << 20;
+		obj[2].offset = 256 << 10;
+		obj[2].offset += (random() % 128) << 12;
+	}
 
 	memset(&reloc, 0, sizeof(reloc));
 	reloc.target_handle = obj[1].handle;
@@ -132,13 +145,13 @@ static uint32_t __store_dword(int fd, const intel_ctx_t *ctx, unsigned ring,
 	reloc.read_domains = I915_GEM_DOMAIN_INSTRUCTION;
 	reloc.write_domain = write_domain;
 	obj[2].relocs_ptr = to_user_pointer(&reloc);
-	obj[2].relocation_count = 1;
+	obj[2].relocation_count = !ahnd ? 1 : 0;
 
 	i = 0;
 	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
 	if (gen >= 8) {
 		batch[++i] = reloc.presumed_offset + reloc.delta;
-		batch[++i] = 0;
+		batch[++i] = (reloc.presumed_offset + reloc.delta) >> 32;
 	} else if (gen >= 4) {
 		batch[++i] = 0;
 		batch[++i] = reloc.presumed_offset + reloc.delta;
@@ -155,31 +168,38 @@ static uint32_t __store_dword(int fd, const intel_ctx_t *ctx, unsigned ring,
 	return obj[2].handle;
 }
 
-static void store_dword(int fd, const intel_ctx_t *ctx, unsigned ring,
-			uint32_t target, uint32_t offset, uint32_t value,
+static void store_dword(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
+			unsigned ring,
+			uint32_t target, uint64_t target_offset,
+			uint32_t offset, uint32_t value,
 			unsigned write_domain)
 {
-	gem_close(fd, __store_dword(fd, ctx, ring,
-				    target, offset, value,
-				    0, -1, write_domain));
+	gem_close(fd, __store_dword(fd, ahnd, ctx, ring,
+				    target, target_offset, offset, value,
+				    0, 0, -1, write_domain));
 }
 
-static void store_dword_plug(int fd, const intel_ctx_t *ctx, unsigned ring,
-			     uint32_t target, uint32_t offset, uint32_t value,
-			     uint32_t cork, unsigned write_domain)
+static void store_dword_plug(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
+			     unsigned ring,
+			     uint32_t target, uint64_t target_offset,
+			     uint32_t offset, uint32_t value,
+			     uint32_t cork, uint64_t cork_offset,
+			     unsigned write_domain)
 {
-	gem_close(fd, __store_dword(fd, ctx, ring,
-				    target, offset, value,
-				    cork, -1, write_domain));
+	gem_close(fd, __store_dword(fd, ahnd, ctx, ring,
+				    target, target_offset, offset, value,
+				    cork, cork_offset, -1, write_domain));
 }
 
-static void store_dword_fenced(int fd, const intel_ctx_t *ctx, unsigned ring,
-			       uint32_t target, uint32_t offset, uint32_t value,
+static void store_dword_fenced(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
+			       unsigned ring,
+			       uint32_t target, uint64_t target_offset,
+			       uint32_t offset, uint32_t value,
 			       int fence, unsigned write_domain)
 {
-	gem_close(fd, __store_dword(fd, ctx, ring,
-				    target, offset, value,
-				    0, fence, write_domain));
+	gem_close(fd, __store_dword(fd, ahnd, ctx, ring,
+				    target, target_offset, offset, value,
+				    0, 0, fence, write_domain));
 }
 
 static const intel_ctx_t *
@@ -210,15 +230,21 @@ static void unplug_show_queue(int fd, struct igt_cork *c,
 
 	for (int n = 0; n < max; n++) {
 		const intel_ctx_t *ctx = create_highest_priority(fd, cfg);
-		spin[n] = __igt_spin_new(fd, .ctx = ctx, .engine = engine);
+		uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
+
+		spin[n] = __igt_spin_new(fd, .ahnd = ahnd, .ctx = ctx,
+					 .engine = engine);
 		intel_ctx_destroy(fd, ctx);
 	}
 
 	igt_cork_unplug(c); /* batches will now be queued on the engine */
 	igt_debugfs_dump(fd, "i915_engine_info");
 
-	for (int n = 0; n < max; n++)
+	for (int n = 0; n < max; n++) {
+		uint64_t ahnd = spin[n]->ahnd;
 		igt_spin_free(fd, spin[n]);
+		put_ahnd(ahnd);
+	}
 
 }
 
@@ -228,20 +254,26 @@ static void fifo(int fd, const intel_ctx_t *ctx, unsigned ring)
 	uint32_t scratch;
 	uint32_t result;
 	int fence;
+	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id), scratch_offset;
 
 	scratch = gem_create(fd, 4096);
+	scratch_offset = get_offset(ahnd, scratch, 4096, 0);
 
 	fence = igt_cork_plug(&cork, fd);
 
 	/* Same priority, same timeline, final result will be the second eb */
-	store_dword_fenced(fd, ctx, ring, scratch, 0, 1, fence, 0);
-	store_dword_fenced(fd, ctx, ring, scratch, 0, 2, fence, 0);
+	store_dword_fenced(fd, ahnd, ctx, ring, scratch, scratch_offset,
+			   0, 1, fence, 0);
+	store_dword_fenced(fd, ahnd, ctx, ring, scratch, scratch_offset,
+			   0, 2, fence, 0);
 
 	unplug_show_queue(fd, &cork, &ctx->cfg, ring);
 	close(fence);
 
 	result =  __sync_read_u32(fd, scratch, 0);
 	gem_close(fd, scratch);
+	put_offset(ahnd, scratch);
+	put_ahnd(ahnd);
 
 	igt_assert_eq_u32(result, 2);
 }
@@ -260,6 +292,7 @@ static void implicit_rw(int i915, const intel_ctx_t *ctx, unsigned int ring,
 	uint32_t scratch;
 	uint32_t result;
 	int fence;
+	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id), scratch_offset;
 
 	count = 0;
 	for_each_ctx_engine(i915, ctx, e) {
@@ -274,11 +307,12 @@ static void implicit_rw(int i915, const intel_ctx_t *ctx, unsigned int ring,
 	igt_require(count);
 
 	scratch = gem_create(i915, 4096);
+	scratch_offset = get_offset(ahnd, scratch, 4096, 0);
 	fence = igt_cork_plug(&cork, i915);
 
 	if (dir & WRITE_READ)
-		store_dword_fenced(i915, ctx,
-				   ring, scratch, 0, ~ring,
+		store_dword_fenced(i915, ahnd, ctx,
+				   ring, scratch, scratch_offset, 0, ~ring,
 				   fence, I915_GEM_DOMAIN_RENDER);
 
 	for_each_ctx_engine(i915, ctx, e) {
@@ -288,14 +322,14 @@ static void implicit_rw(int i915, const intel_ctx_t *ctx, unsigned int ring,
 		if (!gem_class_can_store_dword(i915, e->class))
 			continue;
 
-		store_dword_fenced(i915, ctx,
-				   e->flags, scratch, 0, e->flags,
+		store_dword_fenced(i915, ahnd, ctx,
+				   e->flags, scratch, scratch_offset, 0, e->flags,
 				   fence, 0);
 	}
 
 	if (dir & READ_WRITE)
-		store_dword_fenced(i915, ctx,
-				   ring, scratch, 0, ring,
+		store_dword_fenced(i915, ahnd, ctx,
+				   ring, scratch, scratch_offset, 0, ring,
 				   fence, I915_GEM_DOMAIN_RENDER);
 
 	unplug_show_queue(i915, &cork, &ctx->cfg, ring);
@@ -303,6 +337,8 @@ static void implicit_rw(int i915, const intel_ctx_t *ctx, unsigned int ring,
 
 	result =  __sync_read_u32(i915, scratch, 0);
 	gem_close(i915, scratch);
+	put_offset(ahnd, scratch);
+	put_ahnd(ahnd);
 
 	if (dir & WRITE_READ)
 		igt_assert_neq_u32(result, ~ring);
@@ -319,8 +355,10 @@ static void independent(int fd, const intel_ctx_t *ctx, unsigned int engine,
 	uint32_t scratch, batch;
 	uint32_t *ptr;
 	int fence;
+	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id), scratch_offset;
 
 	scratch = gem_create(fd, 4096);
+	scratch_offset = get_offset(ahnd, scratch, 4096, 0);
 	ptr = gem_mmap__device_coherent(fd, scratch, 0, 4096, PROT_READ);
 	igt_assert_eq(ptr[0], 0);
 
@@ -336,6 +374,7 @@ static void independent(int fd, const intel_ctx_t *ctx, unsigned int engine,
 
 		if (spin == NULL) {
 			spin = __igt_spin_new(fd,
+					      .ahnd = ahnd,
 					      .ctx = ctx,
 					      .engine = e->flags,
 					      .flags = flags);
@@ -348,12 +387,15 @@ static void independent(int fd, const intel_ctx_t *ctx, unsigned int engine,
 			gem_execbuf(fd, &eb);
 		}
 
-		store_dword_fenced(fd, ctx, e->flags, scratch, 0, e->flags, fence, 0);
+		store_dword_fenced(fd, ahnd, ctx, e->flags,
+				   scratch, scratch_offset,
+				   0, e->flags, fence, 0);
 	}
 	igt_require(spin);
 
 	/* Same priority, but different timeline (as different engine) */
-	batch = __store_dword(fd, ctx, engine, scratch, 0, engine, 0, fence, 0);
+	batch = __store_dword(fd, ahnd, ctx, engine, scratch, scratch_offset,
+			      0, engine, 0, 0, fence, 0);
 
 	unplug_show_queue(fd, &cork, &ctx->cfg, engine);
 	close(fence);
@@ -369,6 +411,8 @@ static void independent(int fd, const intel_ctx_t *ctx, unsigned int engine,
 
 	igt_spin_free(fd, spin);
 	gem_quiescent_gpu(fd);
+	put_offset(ahnd, scratch);
+	put_ahnd(ahnd);
 
 	/* And we expect the others to have overwritten us, order unspecified */
 	igt_assert(!gem_bo_busy(fd, scratch));
@@ -388,6 +432,7 @@ static void smoketest(int fd, const intel_ctx_cfg_t *cfg,
 	unsigned engine;
 	uint32_t scratch;
 	uint32_t result[2 * ncpus];
+	uint64_t scratch_offset;
 
 	nengine = 0;
 	if (ring == ALL_ENGINES) {
@@ -400,13 +445,19 @@ static void smoketest(int fd, const intel_ctx_cfg_t *cfg,
 	igt_require(nengine);
 
 	scratch = gem_create(fd, 4096);
+
 	igt_fork(child, ncpus) {
 		unsigned long count = 0;
 		const intel_ctx_t *ctx;
+		uint64_t ahnd;
+
+		intel_allocator_init();
 
 		hars_petruska_f54_1_random_perturb(child);
 
 		ctx = intel_ctx_create(fd, cfg);
+		ahnd = get_reloc_ahnd(fd, ctx->id);
+		scratch_offset = get_offset(ahnd, scratch, 4096, 0);
 		igt_until_timeout(timeout) {
 			int prio;
 
@@ -414,15 +465,18 @@ static void smoketest(int fd, const intel_ctx_cfg_t *cfg,
 			gem_context_set_priority(fd, ctx->id, prio);
 
 			engine = engines[hars_petruska_f54_1_random_unsafe_max(nengine)];
-			store_dword(fd, ctx, engine, scratch,
-				    8*child + 0, ~child,
-				    0);
+			store_dword(fd, ahnd, ctx, engine,
+				    scratch, scratch_offset,
+				    8*child + 0, ~child, 0);
 			for (unsigned int step = 0; step < 8; step++)
-				store_dword(fd, ctx, engine, scratch,
+				store_dword(fd, ahnd, ctx, engine,
+					    scratch, scratch_offset,
 					    8*child + 4, count++,
 					    0);
 		}
 		intel_ctx_destroy(fd, ctx);
+		put_offset(ahnd, scratch);
+		put_ahnd(ahnd);
 	}
 	igt_waitchildren();
 
@@ -644,12 +698,15 @@ static void lateslice(int i915, const intel_ctx_cfg_t *cfg,
 {
 	const intel_ctx_t *ctx;
 	igt_spin_t *spin[3];
+	uint64_t ahnd[3];
 
 	igt_require(gem_scheduler_has_timeslicing(i915));
 	igt_require(intel_gen(intel_get_drm_devid(i915)) >= 8);
 
 	ctx = intel_ctx_create(i915, cfg);
-	spin[0] = igt_spin_new(i915, .ctx = ctx, .engine = engine,
+	ahnd[0] = get_reloc_ahnd(i915, ctx->id);
+	spin[0] = igt_spin_new(i915, .ahnd = ahnd[0], .ctx = ctx,
+			       .engine = engine,
 			       .flags = (IGT_SPIN_POLL_RUN |
 					 IGT_SPIN_FENCE_OUT |
 					 flags));
@@ -658,7 +715,9 @@ static void lateslice(int i915, const intel_ctx_cfg_t *cfg,
 	igt_spin_busywait_until_started(spin[0]);
 
 	ctx = intel_ctx_create(i915, cfg);
-	spin[1] = igt_spin_new(i915, .ctx = ctx, .engine = engine,
+	ahnd[1] = get_reloc_ahnd(i915, ctx->id);
+	spin[1] = igt_spin_new(i915, .ahnd = ahnd[1], .ctx = ctx,
+			       .engine = engine,
 			       .fence = spin[0]->out_fence,
 			       .flags = (IGT_SPIN_POLL_RUN |
 					 IGT_SPIN_FENCE_IN |
@@ -675,7 +734,9 @@ static void lateslice(int i915, const intel_ctx_cfg_t *cfg,
 	 */
 
 	ctx = intel_ctx_create(i915, cfg);
-	spin[2] = igt_spin_new(i915, .ctx = ctx, .engine = engine,
+	ahnd[2] = get_reloc_ahnd(i915, ctx->id);
+	spin[2] = igt_spin_new(i915, .ahnd = ahnd[2], .ctx = ctx,
+			       .engine = engine,
 			       .flags = IGT_SPIN_POLL_RUN | flags);
 	intel_ctx_destroy(i915, ctx);
 
@@ -696,6 +757,9 @@ static void lateslice(int i915, const intel_ctx_cfg_t *cfg,
 
 	igt_assert(gem_bo_busy(i915, spin[1]->handle));
 	igt_spin_free(i915, spin[1]);
+
+	for (int i = 0; i < ARRAY_SIZE(ahnd); i++)
+		put_ahnd(ahnd[i]);
 }
 
 static void cancel_spinner(int i915,
@@ -742,6 +806,7 @@ static void submit_slice(int i915, const intel_ctx_cfg_t *cfg,
 		.num_engines = 1,
 	};
 	const intel_ctx_t *ctx;
+	uint64_t ahnd0 = get_reloc_ahnd(i915, 0);
 
 	/*
 	 * When using a submit fence, we do not want to block concurrent work,
@@ -755,13 +820,14 @@ static void submit_slice(int i915, const intel_ctx_cfg_t *cfg,
 		igt_spin_t *bg, *spin;
 		int timeline = -1;
 		int fence = -1;
+		uint64_t ahndN;
 
 		if (!gem_class_can_store_dword(i915, cancel->class))
 			continue;
 
 		igt_debug("Testing cancellation from %s\n", e->name);
 
-		bg = igt_spin_new(i915, .engine = e->flags);
+		bg = igt_spin_new(i915, .ahnd = ahnd0, .engine = e->flags);
 
 		if (flags & LATE_SUBMIT) {
 			timeline = sw_sync_timeline_create();
@@ -771,7 +837,8 @@ static void submit_slice(int i915, const intel_ctx_cfg_t *cfg,
 		engine_cfg.engines[0].engine_class = e->class;
 		engine_cfg.engines[0].engine_instance = e->instance;
 		ctx = intel_ctx_create(i915, &engine_cfg);
-		spin = igt_spin_new(i915, .ctx = ctx,
+		ahndN = get_reloc_ahnd(i915, ctx->id);
+		spin = igt_spin_new(i915, .ahnd = ahndN, .ctx = ctx,
 				    .fence = fence,
 				    .flags =
 				    IGT_SPIN_POLL_RUN |
@@ -800,7 +867,10 @@ static void submit_slice(int i915, const intel_ctx_cfg_t *cfg,
 		igt_spin_free(i915, bg);
 
 		intel_ctx_destroy(i915, ctx);
+		put_ahnd(ahndN);
 	}
+
+	put_ahnd(ahnd0);
 }
 
 static uint32_t __batch_create(int i915, uint32_t offset)
@@ -829,6 +899,7 @@ static void semaphore_userlock(int i915, const intel_ctx_t *ctx,
 	igt_spin_t *spin = NULL;
 	uint32_t scratch;
 	const intel_ctx_t *tmp_ctx;
+	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
 
 	igt_require(gem_scheduler_has_timeslicing(i915));
 
@@ -843,6 +914,7 @@ static void semaphore_userlock(int i915, const intel_ctx_t *ctx,
 	for_each_ctx_engine(i915, ctx, e) {
 		if (!spin) {
 			spin = igt_spin_new(i915,
+					    .ahnd = ahnd,
 					    .ctx = ctx,
 					    .dependency = scratch,
 					    .engine = e->flags,
@@ -885,6 +957,7 @@ static void semaphore_userlock(int i915, const intel_ctx_t *ctx,
 	gem_close(i915, obj.handle);
 
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 }
 
 static void semaphore_codependency(int i915, const intel_ctx_t *ctx,
@@ -894,6 +967,7 @@ static void semaphore_codependency(int i915, const intel_ctx_t *ctx,
 	struct {
 		igt_spin_t *xcs, *rcs;
 	} task[2];
+	uint64_t ahnd;
 	int i;
 
 	/*
@@ -919,9 +993,11 @@ static void semaphore_codependency(int i915, const intel_ctx_t *ctx,
 			continue;
 
 		tmp_ctx = intel_ctx_create(i915, &ctx->cfg);
+		ahnd = get_simple_l2h_ahnd(i915, tmp_ctx->id);
 
 		task[i].xcs =
 			__igt_spin_new(i915,
+				       .ahnd = ahnd,
 				       .ctx = tmp_ctx,
 				       .engine = e->flags,
 				       .flags = IGT_SPIN_POLL_RUN | flags);
@@ -930,6 +1006,7 @@ static void semaphore_codependency(int i915, const intel_ctx_t *ctx,
 		/* Common rcs tasks will be queued in FIFO */
 		task[i].rcs =
 			__igt_spin_new(i915,
+				       .ahnd = ahnd,
 				       .ctx = tmp_ctx,
 				       .engine = 0,
 				       .dependency = task[i].xcs->handle);
@@ -952,8 +1029,10 @@ static void semaphore_codependency(int i915, const intel_ctx_t *ctx,
 	}
 
 	for (i = 0; i < ARRAY_SIZE(task); i++) {
+		ahnd = task[i].rcs->ahnd;
 		igt_spin_free(i915, task[i].xcs);
 		igt_spin_free(i915, task[i].rcs);
+		put_ahnd(ahnd);
 	}
 }
 
@@ -964,6 +1043,7 @@ static void semaphore_resolve(int i915, const intel_ctx_cfg_t *cfg,
 	const uint32_t SEMAPHORE_ADDR = 64 << 10;
 	uint32_t semaphore, *sema;
 	const intel_ctx_t *outer, *inner;
+	uint64_t ahnd = get_reloc_ahnd(i915, 0);
 
 	/*
 	 * Userspace may submit batches that wait upon unresolved
@@ -994,7 +1074,8 @@ static void semaphore_resolve(int i915, const intel_ctx_cfg_t *cfg,
 		if (!gem_class_can_store_dword(i915, e->class))
 			continue;
 
-		spin = __igt_spin_new(i915, .engine = e->flags, .flags = flags);
+		spin = __igt_spin_new(i915, .ahnd = ahnd,
+				      .engine = e->flags, .flags = flags);
 		igt_spin_end(spin); /* we just want its address for later */
 		gem_sync(i915, spin->handle);
 		igt_spin_reset(spin);
@@ -1086,6 +1167,7 @@ static void semaphore_resolve(int i915, const intel_ctx_cfg_t *cfg,
 
 	intel_ctx_destroy(i915, inner);
 	intel_ctx_destroy(i915, outer);
+	put_ahnd(ahnd);
 }
 
 static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
@@ -1094,10 +1176,12 @@ static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
 	const struct intel_execution_engine2 *outer, *inner;
 	const intel_ctx_t *ctx;
+	uint64_t ahnd;
 
 	igt_require(gen >= 6); /* MI_STORE_DWORD_IMM convenience */
 
 	ctx = intel_ctx_create(i915, cfg);
+	ahnd = get_reloc_ahnd(i915, ctx->id);
 
 	for_each_ctx_engine(i915, ctx, outer) {
 	for_each_ctx_engine(i915, ctx, inner) {
@@ -1110,10 +1194,10 @@ static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
 		    !gem_class_can_store_dword(i915, inner->class))
 			continue;
 
-		chain = __igt_spin_new(i915, .ctx = ctx,
+		chain = __igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 				       .engine = outer->flags, .flags = flags);
 
-		spin = __igt_spin_new(i915, .ctx = ctx,
+		spin = __igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 				      .engine = inner->flags, .flags = flags);
 		igt_spin_end(spin); /* we just want its address for later */
 		gem_sync(i915, spin->handle);
@@ -1172,6 +1256,7 @@ static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
 	}
 
 	intel_ctx_destroy(i915, ctx);
+	put_ahnd(ahnd);
 }
 
 static void
@@ -1197,6 +1282,7 @@ noreorder(int i915, const intel_ctx_cfg_t *cfg,
 	igt_spin_t *spin;
 	int fence = -1;
 	uint64_t addr;
+	uint64_t ahnd[2];
 
 	if (flags & CORKED)
 		fence = igt_cork_plug(&cork, i915);
@@ -1205,8 +1291,9 @@ noreorder(int i915, const intel_ctx_cfg_t *cfg,
 		vm_cfg.vm = gem_vm_create(i915);
 
 	ctx = intel_ctx_create(i915, &vm_cfg);
+	ahnd[0] = get_reloc_ahnd(i915, ctx->id);
 
-	spin = igt_spin_new(i915, .ctx = ctx,
+	spin = igt_spin_new(i915, .ahnd = ahnd[0], .ctx = ctx,
 			    .engine = engine,
 			    .fence = fence,
 			    .flags = IGT_SPIN_FENCE_OUT | IGT_SPIN_FENCE_IN);
@@ -1281,7 +1368,9 @@ noreorder(int i915, const intel_ctx_cfg_t *cfg,
 	 * Without timeslices, fallback to waiting a second.
 	 */
 	ctx = intel_ctx_create(i915, &vm_cfg);
+	ahnd[1] = get_reloc_ahnd(i915, ctx->id);
 	slice = igt_spin_new(i915,
+			    .ahnd = ahnd[1],
 			    .ctx = ctx,
 			    .engine = engine,
 			    .flags = IGT_SPIN_POLL_RUN);
@@ -1299,6 +1388,8 @@ noreorder(int i915, const intel_ctx_cfg_t *cfg,
 	igt_assert_eq(sync_fence_status(spin->out_fence), 0);
 	igt_spin_free(i915, spin);
 	gem_quiescent_gpu(i915);
+	put_ahnd(ahnd[0]);
+	put_ahnd(ahnd[1]);
 }
 
 static void reorder(int fd, const intel_ctx_cfg_t *cfg,
@@ -1310,6 +1401,14 @@ static void reorder(int fd, const intel_ctx_cfg_t *cfg,
 	uint32_t result;
 	const intel_ctx_t *ctx[2];
 	int fence;
+	uint64_t ahnd, scratch_offset;
+
+	/*
+	 * We use reloc ahnd for default context because we're interested
+	 * acquiring distinct offsets only. This saves us typing - otherwise
+	 * we should get scratch_offset for each context separately.
+	 */
+	ahnd = get_reloc_ahnd(fd, 0);
 
 	ctx[LO] = intel_ctx_create(fd, cfg);
 	gem_context_set_priority(fd, ctx[LO]->id, MIN_PRIO);
@@ -1318,19 +1417,25 @@ static void reorder(int fd, const intel_ctx_cfg_t *cfg,
 	gem_context_set_priority(fd, ctx[HI]->id, flags & EQUAL ? MIN_PRIO : 0);
 
 	scratch = gem_create(fd, 4096);
+	scratch_offset = get_offset(ahnd, scratch, 4096, 0);
+
 	fence = igt_cork_plug(&cork, fd);
 
 	/* We expect the high priority context to be executed first, and
 	 * so the final result will be value from the low priority context.
 	 */
-	store_dword_fenced(fd, ctx[LO], ring, scratch, 0, ctx[LO]->id, fence, 0);
-	store_dword_fenced(fd, ctx[HI], ring, scratch, 0, ctx[HI]->id, fence, 0);
+	store_dword_fenced(fd, ahnd, ctx[LO], ring, scratch, scratch_offset,
+			   0, ctx[LO]->id, fence, 0);
+	store_dword_fenced(fd, ahnd, ctx[HI], ring, scratch, scratch_offset,
+			   0, ctx[HI]->id, fence, 0);
 
 	unplug_show_queue(fd, &cork, cfg, ring);
 	close(fence);
 
 	result =  __sync_read_u32(fd, scratch, 0);
 	gem_close(fd, scratch);
+	put_offset(ahnd, scratch);
+	put_ahnd(ahnd);
 
 	if (flags & EQUAL) /* equal priority, result will be fifo */
 		igt_assert_eq_u32(result, ctx[HI]->id);
@@ -1348,6 +1453,7 @@ static void promotion(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 	uint32_t result_read, dep_read;
 	const intel_ctx_t *ctx[3];
 	int fence;
+	uint64_t ahnd = get_reloc_ahnd(fd, 0), result_offset, dep_offset;
 
 	ctx[LO] = intel_ctx_create(fd, cfg);
 	gem_context_set_priority(fd, ctx[LO]->id, MIN_PRIO);
@@ -1359,7 +1465,9 @@ static void promotion(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 	gem_context_set_priority(fd, ctx[NOISE]->id, MIN_PRIO/2);
 
 	result = gem_create(fd, 4096);
+	result_offset = get_offset(ahnd, result, 4096, 0);
 	dep = gem_create(fd, 4096);
+	dep_offset = get_offset(ahnd, dep, 4096, 0);
 
 	fence = igt_cork_plug(&cork, fd);
 
@@ -1368,14 +1476,19 @@ static void promotion(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 	 * fifo would be NOISE, LO, HI.
 	 * strict priority would be  HI, NOISE, LO
 	 */
-	store_dword_fenced(fd, ctx[NOISE], ring, result, 0, ctx[NOISE]->id, fence, 0);
-	store_dword_fenced(fd, ctx[LO], ring, result, 0, ctx[LO]->id, fence, 0);
+	store_dword_fenced(fd, ahnd, ctx[NOISE], ring, result, result_offset,
+			   0, ctx[NOISE]->id, fence, 0);
+	store_dword_fenced(fd, ahnd, ctx[LO], ring, result, result_offset,
+			   0, ctx[LO]->id, fence, 0);
 
 	/* link LO <-> HI via a dependency on another buffer */
-	store_dword(fd, ctx[LO], ring, dep, 0, ctx[LO]->id, I915_GEM_DOMAIN_INSTRUCTION);
-	store_dword(fd, ctx[HI], ring, dep, 0, ctx[HI]->id, 0);
+	store_dword(fd, ahnd, ctx[LO], ring, dep, dep_offset,
+		    0, ctx[LO]->id, I915_GEM_DOMAIN_INSTRUCTION);
+	store_dword(fd, ahnd, ctx[HI], ring, dep, dep_offset,
+		    0, ctx[HI]->id, 0);
 
-	store_dword(fd, ctx[HI], ring, result, 0, ctx[HI]->id, 0);
+	store_dword(fd, ahnd, ctx[HI], ring, result, result_offset,
+		    0, ctx[HI]->id, 0);
 
 	unplug_show_queue(fd, &cork, cfg, ring);
 	close(fence);
@@ -1385,6 +1498,9 @@ static void promotion(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 
 	result_read = __sync_read_u32(fd, result, 0);
 	gem_close(fd, result);
+	put_offset(ahnd, result);
+	put_offset(ahnd, dep);
+	put_ahnd(ahnd);
 
 	igt_assert_eq_u32(dep_read, ctx[HI]->id);
 	igt_assert_eq_u32(result_read, ctx[NOISE]->id);
@@ -1413,32 +1529,42 @@ static void preempt(int fd, const intel_ctx_cfg_t *cfg,
 	igt_spin_t *spin[MAX_ELSP_QLEN];
 	const intel_ctx_t *ctx[2];
 	igt_hang_t hang;
+	uint64_t ahnd = get_reloc_ahnd(fd, 0);
+	uint64_t ahnd_lo_arr[MAX_ELSP_QLEN], ahnd_lo;
+	uint64_t result_offset = get_offset(ahnd, result, 4096, 0);
 
 	/* Set a fast timeout to speed the test up (if available) */
 	set_preempt_timeout(fd, e, 150);
 
 	ctx[LO] = intel_ctx_create(fd, cfg);
 	gem_context_set_priority(fd, ctx[LO]->id, MIN_PRIO);
+	ahnd_lo = get_reloc_ahnd(fd, ctx[LO]->id);
 
 	ctx[HI] = intel_ctx_create(fd, cfg);
 	gem_context_set_priority(fd, ctx[HI]->id, MAX_PRIO);
 
 	if (flags & HANG_LP)
-		hang = igt_hang_ctx(fd, ctx[LO]->id, e->flags, 0);
+		hang = igt_hang_ctx_with_ahnd(fd, ahnd_lo, ctx[LO]->id, e->flags, 0);
 
 	for (int n = 0; n < ARRAY_SIZE(spin); n++) {
+		uint64_t currahnd = ahnd_lo;
+
 		if (flags & NEW_CTX) {
 			intel_ctx_destroy(fd, ctx[LO]);
 			ctx[LO] = intel_ctx_create(fd, cfg);
 			gem_context_set_priority(fd, ctx[LO]->id, MIN_PRIO);
+			ahnd_lo_arr[n] = get_reloc_ahnd(fd, ctx[LO]->id);
+			currahnd = ahnd_lo_arr[n];
 		}
 		spin[n] = __igt_spin_new(fd,
+					 .ahnd = currahnd,
 					 .ctx = ctx[LO],
 					 .engine = e->flags,
 					 .flags = flags & USERPTR ? IGT_SPIN_USERPTR : 0);
 		igt_debug("spin[%d].handle=%d\n", n, spin[n]->handle);
 
-		store_dword(fd, ctx[HI], e->flags, result, 0, n + 1, I915_GEM_DOMAIN_RENDER);
+		store_dword(fd, ahnd, ctx[HI], e->flags, result, result_offset,
+			    0, n + 1, I915_GEM_DOMAIN_RENDER);
 
 		result_read = __sync_read_u32(fd, result, 0);
 		igt_assert_eq_u32(result_read, n + 1);
@@ -1453,6 +1579,13 @@ static void preempt(int fd, const intel_ctx_cfg_t *cfg,
 
 	intel_ctx_destroy(fd, ctx[LO]);
 	intel_ctx_destroy(fd, ctx[HI]);
+	put_ahnd(ahnd);
+	put_ahnd(ahnd_lo);
+
+	if (flags & NEW_CTX) {
+		for (int n = 0; n < ARRAY_SIZE(spin); n++)
+			put_ahnd(ahnd_lo_arr[n]);
+	}
 
 	gem_close(fd, result);
 }
@@ -1460,7 +1593,7 @@ static void preempt(int fd, const intel_ctx_cfg_t *cfg,
 #define CHAIN 0x1
 #define CONTEXTS 0x2
 
-static igt_spin_t *__noise(int fd, const intel_ctx_t *ctx,
+static igt_spin_t *__noise(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
 			   int prio, igt_spin_t *spin)
 {
 	const struct intel_execution_engine2 *e;
@@ -1470,6 +1603,7 @@ static igt_spin_t *__noise(int fd, const intel_ctx_t *ctx,
 	for_each_ctx_engine(fd, ctx, e) {
 		if (spin == NULL) {
 			spin = __igt_spin_new(fd,
+					      .ahnd = ahnd,
 					      .ctx = ctx,
 					      .engine = e->flags);
 		} else {
@@ -1487,6 +1621,7 @@ static igt_spin_t *__noise(int fd, const intel_ctx_t *ctx,
 }
 
 static void __preempt_other(int fd,
+			    uint64_t *ahnd,
 			    const intel_ctx_t **ctx,
 			    unsigned int target, unsigned int primary,
 			    unsigned flags)
@@ -1495,24 +1630,27 @@ static void __preempt_other(int fd,
 	uint32_t result = gem_create(fd, 4096);
 	uint32_t result_read[4096 / sizeof(uint32_t)];
 	unsigned int n, i;
+	uint64_t result_offset_lo = get_offset(ahnd[LO], result, 4096, 0);
+	uint64_t result_offset_hi = get_offset(ahnd[HI], result, 4096, 0);
 
 	n = 0;
-	store_dword(fd, ctx[LO], primary,
-		    result, (n + 1)*sizeof(uint32_t), n + 1,
+	store_dword(fd, ahnd[LO], ctx[LO], primary,
+		    result, result_offset_lo, (n + 1)*sizeof(uint32_t), n + 1,
 		    I915_GEM_DOMAIN_RENDER);
 	n++;
 
 	if (flags & CHAIN) {
 		for_each_ctx_engine(fd, ctx[LO], e) {
-			store_dword(fd, ctx[LO], e->flags,
-				    result, (n + 1)*sizeof(uint32_t), n + 1,
+			store_dword(fd, ahnd[LO], ctx[LO], e->flags,
+				    result, result_offset_lo,
+				     (n + 1)*sizeof(uint32_t), n + 1,
 				    I915_GEM_DOMAIN_RENDER);
 			n++;
 		}
 	}
 
-	store_dword(fd, ctx[HI], target,
-		    result, (n + 1)*sizeof(uint32_t), n + 1,
+	store_dword(fd, ahnd[HI], ctx[HI], target,
+		    result, result_offset_hi, (n + 1)*sizeof(uint32_t), n + 1,
 		    I915_GEM_DOMAIN_RENDER);
 
 	igt_debugfs_dump(fd, "i915_engine_info");
@@ -1525,6 +1663,8 @@ static void __preempt_other(int fd,
 		igt_assert_eq_u32(result_read[i], i);
 
 	gem_close(fd, result);
+	put_offset(ahnd[LO], result);
+	put_offset(ahnd[HI], result);
 }
 
 static void preempt_other(int fd, const intel_ctx_cfg_t *cfg,
@@ -1533,6 +1673,7 @@ static void preempt_other(int fd, const intel_ctx_cfg_t *cfg,
 	const struct intel_execution_engine2 *e;
 	igt_spin_t *spin = NULL;
 	const intel_ctx_t *ctx[3];
+	uint64_t ahnd[3];
 
 	/* On each engine, insert
 	 * [NOISE] spinner,
@@ -1546,16 +1687,19 @@ static void preempt_other(int fd, const intel_ctx_cfg_t *cfg,
 
 	ctx[LO] = intel_ctx_create(fd, cfg);
 	gem_context_set_priority(fd, ctx[LO]->id, MIN_PRIO);
+	ahnd[LO] = get_reloc_ahnd(fd, ctx[LO]->id);
 
 	ctx[NOISE] = intel_ctx_create(fd, cfg);
-	spin = __noise(fd, ctx[NOISE], 0, NULL);
+	ahnd[NOISE] = get_reloc_ahnd(fd, ctx[NOISE]->id);
+	spin = __noise(fd, ahnd[NOISE], ctx[NOISE], 0, NULL);
 
 	ctx[HI] = intel_ctx_create(fd, cfg);
 	gem_context_set_priority(fd, ctx[HI]->id, MAX_PRIO);
+	ahnd[HI] = get_reloc_ahnd(fd, ctx[HI]->id);
 
 	for_each_ctx_cfg_engine(fd, cfg, e) {
 		igt_debug("Primary engine: %s\n", e->name);
-		__preempt_other(fd, ctx, ring, e->flags, flags);
+		__preempt_other(fd, ahnd, ctx, ring, e->flags, flags);
 
 	}
 
@@ -1565,6 +1709,9 @@ static void preempt_other(int fd, const intel_ctx_cfg_t *cfg,
 	intel_ctx_destroy(fd, ctx[LO]);
 	intel_ctx_destroy(fd, ctx[NOISE]);
 	intel_ctx_destroy(fd, ctx[HI]);
+	put_ahnd(ahnd[LO]);
+	put_ahnd(ahnd[NOISE]);
+	put_ahnd(ahnd[HI]);
 }
 
 static void __preempt_queue(int fd, const intel_ctx_cfg_t *cfg,
@@ -1574,12 +1721,18 @@ static void __preempt_queue(int fd, const intel_ctx_cfg_t *cfg,
 	const struct intel_execution_engine2 *e;
 	uint32_t result = gem_create(fd, 4096);
 	uint32_t result_read[4096 / sizeof(uint32_t)];
+	uint64_t result_offset;
 	igt_spin_t *above = NULL, *below = NULL;
 	const intel_ctx_t *ctx[3] = {
 		intel_ctx_create(fd, cfg),
 		intel_ctx_create(fd, cfg),
 		intel_ctx_create(fd, cfg),
 	};
+	uint64_t ahnd[3] = {
+		get_reloc_ahnd(fd, ctx[0]->id),
+		get_reloc_ahnd(fd, ctx[1]->id),
+		get_reloc_ahnd(fd, ctx[2]->id),
+	};
 	int prio = MAX_PRIO;
 	unsigned int n, i;
 
@@ -1588,7 +1741,7 @@ static void __preempt_queue(int fd, const intel_ctx_cfg_t *cfg,
 			intel_ctx_destroy(fd, ctx[NOISE]);
 			ctx[NOISE] = intel_ctx_create(fd, cfg);
 		}
-		above = __noise(fd, ctx[NOISE], prio--, above);
+		above = __noise(fd, ahnd[NOISE], ctx[NOISE], prio--, above);
 	}
 
 	gem_context_set_priority(fd, ctx[HI]->id, prio--);
@@ -1598,28 +1751,31 @@ static void __preempt_queue(int fd, const intel_ctx_cfg_t *cfg,
 			intel_ctx_destroy(fd, ctx[NOISE]);
 			ctx[NOISE] = intel_ctx_create(fd, cfg);
 		}
-		below = __noise(fd, ctx[NOISE], prio--, below);
+		below = __noise(fd, ahnd[NOISE], ctx[NOISE], prio--, below);
 	}
 
 	gem_context_set_priority(fd, ctx[LO]->id, prio--);
 
 	n = 0;
-	store_dword(fd, ctx[LO], primary,
-		    result, (n + 1)*sizeof(uint32_t), n + 1,
+	result_offset = get_offset(ahnd[LO], result, 4096, 0);
+	store_dword(fd, ahnd[LO], ctx[LO], primary,
+		    result, result_offset, (n + 1)*sizeof(uint32_t), n + 1,
 		    I915_GEM_DOMAIN_RENDER);
 	n++;
 
 	if (flags & CHAIN) {
 		for_each_ctx_engine(fd, ctx[LO], e) {
-			store_dword(fd, ctx[LO], e->flags,
-				    result, (n + 1)*sizeof(uint32_t), n + 1,
+			store_dword(fd, ahnd[LO], ctx[LO], e->flags,
+				    result, result_offset,
+				     (n + 1)*sizeof(uint32_t), n + 1,
 				    I915_GEM_DOMAIN_RENDER);
 			n++;
 		}
 	}
 
-	store_dword(fd, ctx[HI], target,
-		    result, (n + 1)*sizeof(uint32_t), n + 1,
+	result_offset = get_offset(ahnd[HI], result, 4096, 0);
+	store_dword(fd, ahnd[HI], ctx[HI], target,
+		    result, result_offset, (n + 1)*sizeof(uint32_t), n + 1,
 		    I915_GEM_DOMAIN_RENDER);
 
 	igt_debugfs_dump(fd, "i915_engine_info");
@@ -1647,6 +1803,11 @@ static void __preempt_queue(int fd, const intel_ctx_cfg_t *cfg,
 	intel_ctx_destroy(fd, ctx[HI]);
 
 	gem_close(fd, result);
+	put_offset(ahnd[LO], result);
+	put_offset(ahnd[HI], result);
+	put_ahnd(ahnd[LO]);
+	put_ahnd(ahnd[NOISE]);
+	put_ahnd(ahnd[HI]);
 }
 
 static void preempt_queue(int fd, const intel_ctx_cfg_t *cfg,
@@ -1679,6 +1840,7 @@ static void preempt_engines(int i915,
 	IGT_LIST_HEAD(plist);
 	igt_spin_t *spin, *sn;
 	const intel_ctx_t *ctx;
+	uint64_t ahnd;
 
 	/*
 	 * A quick test that each engine within a context is an independent
@@ -1694,12 +1856,14 @@ static void preempt_engines(int i915,
 		igt_list_add(&pnode[n].link, &plist);
 	}
 	ctx = intel_ctx_create(i915, &cfg);
+	ahnd = get_reloc_ahnd(i915, ctx->id);
 
 	for (int n = -(GEM_MAX_ENGINES - 1); n < GEM_MAX_ENGINES; n++) {
 		unsigned int engine = n & I915_EXEC_RING_MASK;
 
 		gem_context_set_priority(i915, ctx->id, n);
-		spin = igt_spin_new(i915, .ctx = ctx, .engine = engine);
+		spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
+				   .engine = engine);
 
 		igt_list_move_tail(&spin->link, &pnode[engine].spinners);
 		igt_list_move(&pnode[engine].link, &plist);
@@ -1713,6 +1877,7 @@ static void preempt_engines(int i915,
 		}
 	}
 	intel_ctx_destroy(i915, ctx);
+	put_ahnd(ahnd);
 }
 
 static void preempt_self(int fd, const intel_ctx_cfg_t *cfg,
@@ -1724,6 +1889,7 @@ static void preempt_self(int fd, const intel_ctx_cfg_t *cfg,
 	igt_spin_t *spin[MAX_ELSP_QLEN];
 	unsigned int n, i;
 	const intel_ctx_t *ctx[3];
+	uint64_t ahnd[3], result_offset;
 
 	/* On each engine, insert
 	 * [NOISE] spinner,
@@ -1735,21 +1901,26 @@ static void preempt_self(int fd, const intel_ctx_cfg_t *cfg,
 
 	ctx[NOISE] = intel_ctx_create(fd, cfg);
 	ctx[HI] = intel_ctx_create(fd, cfg);
+	ahnd[NOISE] = get_reloc_ahnd(fd, ctx[NOISE]->id);
+	ahnd[HI] = get_reloc_ahnd(fd, ctx[HI]->id);
+	result_offset = get_offset(ahnd[HI], result, 4096, 0);
 
 	n = 0;
 	gem_context_set_priority(fd, ctx[HI]->id, MIN_PRIO);
 	for_each_ctx_cfg_engine(fd, cfg, e) {
 		spin[n] = __igt_spin_new(fd,
+					 .ahnd = ahnd[NOISE],
 					 .ctx = ctx[NOISE],
 					 .engine = e->flags);
-		store_dword(fd, ctx[HI], e->flags,
-			    result, (n + 1)*sizeof(uint32_t), n + 1,
+		store_dword(fd, ahnd[HI], ctx[HI], e->flags,
+			    result, result_offset,
+			     (n + 1)*sizeof(uint32_t), n + 1,
 			    I915_GEM_DOMAIN_RENDER);
 		n++;
 	}
 	gem_context_set_priority(fd, ctx[HI]->id, MAX_PRIO);
-	store_dword(fd, ctx[HI], ring,
-		    result, (n + 1)*sizeof(uint32_t), n + 1,
+	store_dword(fd, ahnd[HI], ctx[HI], ring,
+		    result, result_offset, (n + 1)*sizeof(uint32_t), n + 1,
 		    I915_GEM_DOMAIN_RENDER);
 
 	gem_set_domain(fd, result, I915_GEM_DOMAIN_GTT, 0);
@@ -1769,6 +1940,9 @@ static void preempt_self(int fd, const intel_ctx_cfg_t *cfg,
 	intel_ctx_destroy(fd, ctx[HI]);
 
 	gem_close(fd, result);
+	put_offset(ahnd[HI], result);
+	put_ahnd(ahnd[NOISE]);
+	put_ahnd(ahnd[HI]);
 }
 
 static void preemptive_hang(int fd, const intel_ctx_cfg_t *cfg,
@@ -1777,25 +1951,29 @@ static void preemptive_hang(int fd, const intel_ctx_cfg_t *cfg,
 	igt_spin_t *spin[MAX_ELSP_QLEN];
 	igt_hang_t hang;
 	const intel_ctx_t *ctx[2];
+	uint64_t ahnd_hi, ahnd_lo;
 
 	/* Set a fast timeout to speed the test up (if available) */
 	set_preempt_timeout(fd, e, 150);
 
 	ctx[HI] = intel_ctx_create(fd, cfg);
 	gem_context_set_priority(fd, ctx[HI]->id, MAX_PRIO);
+	ahnd_hi = get_reloc_ahnd(fd, ctx[HI]->id);
 
 	for (int n = 0; n < ARRAY_SIZE(spin); n++) {
 		ctx[LO] = intel_ctx_create(fd, cfg);
 		gem_context_set_priority(fd, ctx[LO]->id, MIN_PRIO);
+		ahnd_lo = get_reloc_ahnd(fd, ctx[LO]->id);
 
 		spin[n] = __igt_spin_new(fd,
+					 .ahnd = ahnd_lo,
 					 .ctx = ctx[LO],
 					 .engine = e->flags);
 
 		intel_ctx_destroy(fd, ctx[LO]);
 	}
 
-	hang = igt_hang_ctx(fd, ctx[HI]->id, e->flags, 0);
+	hang = igt_hang_ctx_with_ahnd(fd, ahnd_hi, ctx[HI]->id, e->flags, 0);
 	igt_post_hang_ring(fd, hang);
 
 	for (int n = 0; n < ARRAY_SIZE(spin); n++) {
@@ -1803,11 +1981,14 @@ static void preemptive_hang(int fd, const intel_ctx_cfg_t *cfg,
 		 * This is subject to change as the scheduler evolve. The test should
 		 * be updated to reflect such changes.
 		 */
+		ahnd_lo = spin[n]->ahnd;
 		igt_assert(gem_bo_busy(fd, spin[n]->handle));
 		igt_spin_free(fd, spin[n]);
+		put_ahnd(ahnd_lo);
 	}
 
 	intel_ctx_destroy(fd, ctx[HI]);
+	put_ahnd(ahnd_hi);
 }
 
 static void deep(int fd, const intel_ctx_cfg_t *cfg,
@@ -1823,6 +2004,8 @@ static void deep(int fd, const intel_ctx_cfg_t *cfg,
 	uint32_t result, dep[XS];
 	uint32_t read_buf[size / sizeof(uint32_t)];
 	uint32_t expected = 0;
+	uint64_t ahnd = get_reloc_ahnd(fd, 0);
+	uint64_t result_offset, dep_offset[XS], plug_offset;
 	const intel_ctx_t **ctx;
 	int dep_nreq;
 	int n;
@@ -1838,6 +2021,7 @@ static void deep(int fd, const intel_ctx_cfg_t *cfg,
 	igt_info("Using %d requests (prio range %d)\n", nreq, max_req);
 
 	result = gem_create(fd, size);
+	result_offset = get_offset(ahnd, result, size, 0);
 	for (int m = 0; m < XS; m ++)
 		dep[m] = gem_create(fd, size);
 
@@ -1848,10 +2032,23 @@ static void deep(int fd, const intel_ctx_cfg_t *cfg,
 		const uint32_t bbe = MI_BATCH_BUFFER_END;
 
 		memset(obj, 0, sizeof(obj));
-		for (n = 0; n < XS; n++)
+		for (n = 0; n < XS; n++) {
 			obj[n].handle = dep[n];
+			if (ahnd) {
+				obj[n].offset = get_offset(ahnd, obj[n].handle,
+							   size, 0);
+				dep_offset[n] = obj[n].offset;
+				obj[n].flags |= EXEC_OBJECT_PINNED;
+			}
+		}
 		obj[XS].handle = result;
+		obj[XS].offset = result_offset;
 		obj[XS+1].handle = gem_create(fd, 4096);
+		obj[XS+1].offset = get_offset(ahnd, obj[XS+1].handle, 4096, 0);
+		if (ahnd) {
+			obj[XS].flags |= EXEC_OBJECT_PINNED;
+			obj[XS+1].flags |= EXEC_OBJECT_PINNED;
+		}
 		gem_write(fd, obj[XS+1].handle, 0, &bbe, sizeof(bbe));
 
 		memset(&execbuf, 0, sizeof(execbuf));
@@ -1867,6 +2064,7 @@ static void deep(int fd, const intel_ctx_cfg_t *cfg,
 	}
 
 	plug = igt_cork_plug(&cork, fd);
+	plug_offset = get_offset(ahnd, plug, 4096, 0);
 
 	/* Create a deep dependency chain, with a few branches */
 	for (n = 0; n < nreq && igt_seconds_elapsed(&tv) < 2; n++) {
@@ -1874,7 +2072,10 @@ static void deep(int fd, const intel_ctx_cfg_t *cfg,
 		gem_context_set_priority(fd, context->id, MAX_PRIO - nreq + n);
 
 		for (int m = 0; m < XS; m++)
-			store_dword_plug(fd, context, ring, dep[m], 4*n, context->id, plug, I915_GEM_DOMAIN_INSTRUCTION);
+			store_dword_plug(fd, ahnd, context, ring,
+					 dep[m], dep_offset[m], 4*n,
+					 context->id, plug, plug_offset,
+					 I915_GEM_DOMAIN_INSTRUCTION);
 	}
 	igt_info("First deptree: %d requests [%.3fs]\n",
 		 n * XS, 1e-9*igt_nsec_elapsed(&tv));
@@ -1886,8 +2087,10 @@ static void deep(int fd, const intel_ctx_cfg_t *cfg,
 
 		expected = context->id;
 		for (int m = 0; m < XS; m++) {
-			store_dword_plug(fd, context, ring, result, 4*n, expected, dep[m], 0);
-			store_dword(fd, context, ring, result, 4*m, expected, I915_GEM_DOMAIN_INSTRUCTION);
+			store_dword_plug(fd, ahnd, context, ring, result, result_offset,
+					 4*n, expected, dep[m], dep_offset[m], 0);
+			store_dword(fd, ahnd, context, ring, result, result_offset,
+				    4*m, expected, I915_GEM_DOMAIN_INSTRUCTION);
 		}
 	}
 	igt_info("Second deptree: %d requests [%.3fs]\n",
@@ -1912,8 +2115,13 @@ static void deep(int fd, const intel_ctx_cfg_t *cfg,
 	gem_close(fd, result);
 
 	/* No reordering due to PI on all contexts because of the common dep */
-	for (int m = 0; m < XS; m++)
+	for (int m = 0; m < XS; m++) {
+		put_offset(ahnd, dep[m]);
 		igt_assert_eq_u32(read_buf[m], expected);
+	}
+	put_offset(ahnd, result);
+	put_offset(ahnd, plug);
+	put_ahnd(ahnd);
 
 	free(ctx);
 #undef XS
@@ -1941,12 +2149,14 @@ static void wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 	const intel_ctx_t **ctx;
 	unsigned int count;
 	int fence;
+	uint64_t ahnd = get_reloc_ahnd(fd, 0), result_offset;
 
 	ctx = malloc(sizeof(*ctx)*MAX_CONTEXTS);
 	for (int n = 0; n < MAX_CONTEXTS; n++)
 		ctx[n] = intel_ctx_create(fd, cfg);
 
 	result = gem_create(fd, 4*MAX_CONTEXTS);
+	result_offset = get_offset(ahnd, result, 4 * MAX_CONTEXTS, 0);
 
 	fence = igt_cork_plug(&cork, fd);
 
@@ -1955,7 +2165,8 @@ static void wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 	     igt_seconds_elapsed(&tv) < 5 && count < ring_size;
 	     count++) {
 		for (int n = 0; n < MAX_CONTEXTS; n++) {
-			store_dword_fenced(fd, ctx[n], ring, result, 4*n, ctx[n]->id,
+			store_dword_fenced(fd, ahnd, ctx[n], ring,
+					   result, result_offset, 4*n, ctx[n]->id,
 					   fence, I915_GEM_DOMAIN_INSTRUCTION);
 		}
 	}
@@ -1974,6 +2185,8 @@ static void wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 
 	gem_close(fd, result);
 	free(ctx);
+	put_offset(ahnd, result);
+	put_ahnd(ahnd);
 }
 
 static void reorder_wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
@@ -1989,8 +2202,11 @@ static void reorder_wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 	IGT_CORK_FENCE(cork);
 	uint32_t *expected;
 	int fence;
+	uint64_t ahnd = get_reloc_ahnd(fd, 0), result_offset;
+	unsigned int sz = ALIGN(ring_size * 64, 4096);
 
 	result = gem_create(fd, 4096);
+	result_offset = get_offset(ahnd, result, 4096, 0);
 	target = gem_create(fd, 4096);
 	fence = igt_cork_plug(&cork, fd);
 
@@ -1999,11 +2215,13 @@ static void reorder_wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 
 	memset(obj, 0, sizeof(obj));
 	obj[0].handle = result;
+	obj[0].offset = result_offset;
 	obj[1].relocs_ptr = to_user_pointer(&reloc);
-	obj[1].relocation_count = 1;
+	obj[1].relocation_count = !ahnd ? 1 : 0;
 
 	memset(&reloc, 0, sizeof(reloc));
 	reloc.target_handle = result;
+	reloc.presumed_offset = obj[0].offset;
 	reloc.read_domains = I915_GEM_DOMAIN_INSTRUCTION;
 	reloc.write_domain = 0; /* lies */
 
@@ -2017,8 +2235,12 @@ static void reorder_wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 	execbuf.flags |= I915_EXEC_FENCE_IN;
 	execbuf.rsvd2 = fence;
 
+	if (ahnd) {
+		obj[0].flags |= EXEC_OBJECT_PINNED;
+		obj[1].flags |= EXEC_OBJECT_PINNED;
+	}
+
 	for (int n = 0, x = 1; n < ARRAY_SIZE(priorities); n++, x++) {
-		unsigned int sz = ALIGN(ring_size * 64, 4096);
 		uint32_t *batch;
 		const intel_ctx_t *tmp_ctx;
 
@@ -2027,6 +2249,9 @@ static void reorder_wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 		execbuf.rsvd1 = tmp_ctx->id;
 
 		obj[1].handle = gem_create(fd, sz);
+		if (ahnd)
+			obj[1].offset = get_offset(ahnd, obj[1].handle, sz, 0);
+
 		batch = gem_mmap__device_coherent(fd, obj[1].handle, 0, sz, PROT_WRITE);
 		gem_set_domain(fd, obj[1].handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 
@@ -2064,6 +2289,7 @@ static void reorder_wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 
 		munmap(batch, sz);
 		gem_close(fd, obj[1].handle);
+		put_offset(ahnd, obj[1].handle);
 		intel_ctx_destroy(fd, tmp_ctx);
 	}
 
@@ -2078,6 +2304,8 @@ static void reorder_wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 
 	gem_close(fd, result);
 	gem_close(fd, target);
+	put_offset(ahnd, result);
+	put_ahnd(ahnd);
 }
 
 static void bind_to_cpu(int cpu)
@@ -2419,9 +2647,9 @@ static void *iova_thread(struct ufd_thread *t, int prio)
 	ctx = intel_ctx_create(t->i915, t->cfg);
 	gem_context_set_priority(t->i915, ctx->id, prio);
 
-	store_dword_plug(t->i915, ctx, t->engine,
-			 t->scratch, 0, prio,
-			 t->batch, 0 /* no write hazard! */);
+	store_dword_plug(t->i915, 0, ctx, t->engine,
+			 t->scratch, 0, 0, prio,
+			 t->batch, 0, 0 /* no write hazard! */);
 
 	pthread_mutex_lock(&t->mutex);
 	if (!--t->count)
@@ -2455,6 +2683,7 @@ static void test_pi_iova(int i915, const intel_ctx_cfg_t *cfg,
 	pthread_t hi, lo;
 	char poison[4096];
 	int ufd;
+	uint64_t ahnd = get_reloc_ahnd(i915, 0);
 
 	/*
 	 * In this scenario, we have a pair of contending contexts that
@@ -2521,7 +2750,7 @@ static void test_pi_iova(int i915, const intel_ctx_cfg_t *cfg,
 	 * the local tasklet will not run until after all signals have been
 	 * delivered... but another tasklet might).
 	 */
-	spin = igt_spin_new(i915, .engine = engine);
+	spin = igt_spin_new(i915, .ahnd = ahnd, .engine = engine);
 	for (int i = 0; i < MAX_ELSP_QLEN; i++) {
 		const intel_ctx_t *ctx = create_highest_priority(i915, cfg);
 		spin->execbuf.rsvd1 = ctx->id;
@@ -2554,6 +2783,7 @@ static void test_pi_iova(int i915, const intel_ctx_cfg_t *cfg,
 	pthread_mutex_unlock(&t.mutex);
 	igt_debugfs_dump(i915, "i915_engine_info");
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 
 	pthread_join(hi, NULL);
 	pthread_join(lo, NULL);
@@ -2574,6 +2804,7 @@ static void measure_semaphore_power(int i915, const intel_ctx_t *ctx)
 {
 	const struct intel_execution_engine2 *signaler, *e;
 	struct rapl gpu, pkg;
+	uint64_t ahnd = get_simple_l2h_ahnd(i915, ctx->id);
 
 	igt_require(gpu_power_open(&gpu) == 0);
 	pkg_power_open(&pkg);
@@ -2584,12 +2815,14 @@ static void measure_semaphore_power(int i915, const intel_ctx_t *ctx)
 		} s_spin[2], s_sema[2];
 		double baseline, total;
 		int64_t jiffie = 1;
-		igt_spin_t *spin;
+		igt_spin_t *spin, *sema[GEM_MAX_ENGINES] = {};
+		int i;
 
 		if (!gem_class_can_store_dword(i915, signaler->class))
 			continue;
 
 		spin = __igt_spin_new(i915,
+				      .ahnd = ahnd,
 				      .ctx = ctx,
 				      .engine = signaler->flags,
 				      .flags = IGT_SPIN_POLL_RUN);
@@ -2603,19 +2836,23 @@ static void measure_semaphore_power(int i915, const intel_ctx_t *ctx)
 		rapl_read(&pkg, &s_spin[1].pkg);
 
 		/* Add a waiter to each engine */
+		i = 0;
 		for_each_ctx_engine(i915, ctx, e) {
-			igt_spin_t *sema;
-
-			if (e->flags == signaler->flags)
+			if (e->flags == signaler->flags) {
+				i++;
 				continue;
+			}
 
-			sema = __igt_spin_new(i915,
-					      .ctx = ctx,
-					      .engine = e->flags,
-					      .dependency = spin->handle);
-
-			igt_spin_free(i915, sema);
+			sema[i] = __igt_spin_new(i915,
+						 .ahnd = ahnd,
+						 .ctx = ctx,
+						 .engine = e->flags,
+						 .dependency = spin->handle);
+			i++;
 		}
+		for (i = 0; i < GEM_MAX_ENGINES; i++)
+			if (sema[i])
+				igt_spin_free(i915, sema[i]);
 		usleep(10); /* just give the tasklets a chance to run */
 
 		rapl_read(&pkg, &s_sema[0].pkg);
@@ -2646,6 +2883,7 @@ static void measure_semaphore_power(int i915, const intel_ctx_t *ctx)
 
 	rapl_close(&gpu);
 	rapl_close(&pkg);
+	put_ahnd(ahnd);
 }
 
 static int read_timestamp_frequency(int i915)
@@ -2703,9 +2941,16 @@ static uint32_t read_ctx_timestamp(int i915, const intel_ctx_t *ctx,
 #define RUNTIME (base + 0x3a8)
 	uint32_t *map, *cs;
 	uint32_t ts;
+	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
 
 	igt_require(base);
 
+	if (ahnd) {
+		obj.offset = get_offset(ahnd, obj.handle, 4096, 0);
+		obj.flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		obj.relocation_count = 0;
+	}
+
 	cs = map = gem_mmap__device_coherent(i915, obj.handle,
 					     0, 4096, PROT_WRITE);
 
@@ -2741,11 +2986,14 @@ static void fairslice(int i915, const intel_ctx_cfg_t *cfg,
 	double threshold;
 	const intel_ctx_t *ctx[3];
 	uint32_t ts[3];
+	uint64_t ahnd;
 
 	for (int i = 0; i < ARRAY_SIZE(ctx); i++) {
 		ctx[i] = intel_ctx_create(i915, cfg);
 		if (spin == NULL) {
+			ahnd = get_reloc_ahnd(i915, ctx[i]->id);
 			spin = __igt_spin_new(i915,
+					      .ahnd = ahnd,
 					      .ctx = ctx[i],
 					      .engine = e->flags,
 					      .flags = flags);
@@ -2770,6 +3018,7 @@ static void fairslice(int i915, const intel_ctx_cfg_t *cfg,
 	for (int i = 0; i < ARRAY_SIZE(ctx); i++)
 		intel_ctx_destroy(i915, ctx[i]);
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 
 	/*
 	 * If we imagine that the timeslices are randomly distributed to
@@ -2879,6 +3128,9 @@ igt_main
 			test_each_engine("u-fairslice", fd, ctx, e)
 				fairslice(fd, &ctx->cfg, e, IGT_SPIN_USERPTR, 2);
 
+			igt_fixture {
+				intel_allocator_multiprocess_start();
+			}
 			igt_subtest("fairslice-all")  {
 				for_each_ctx_engine(fd, ctx, e) {
 					igt_fork(child, 1)
@@ -2895,6 +3147,9 @@ igt_main
 				}
 				igt_waitchildren();
 			}
+			igt_fixture {
+				intel_allocator_multiprocess_stop();
+			}
 		}
 
 		test_each_engine("submit-early-slice", fd, ctx, e)
-- 
2.26.0
