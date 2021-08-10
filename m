Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6DD89DEA
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 05:28:25 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 10 Aug 2021 07:27:09 +0200
Message-Id: <20210810052711.7866-64-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
References: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 63/65] WIP: tests/gem_exec_schedule WIP:
 tests/gem_exec_schedule@deep - NOT WORKING WIP:
 tests/gem_exec_schedule@wide (ok) + reorder_wide (still to be fixed)
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
List-ID: <igt-dev@lists.freedesktop.org>

---
 tests/i915/gem_exec_schedule.c | 405 ++++++++++++++++++++++++++-------
 1 file changed, 324 insertions(+), 81 deletions(-)

diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index e5fb45982..f4ab1dabd 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -91,8 +91,9 @@ void __sync_read_u32_count(int fd, uint32_t handle, uint32_t *dst, uint64_t size
 	gem_read(fd, handle, 0, dst, size);
 }
 
-static uint32_t __store_dword(int fd, const intel_ctx_t *ctx, unsigned ring,
-			      uint32_t target, uint32_t offset, uint32_t value,
+static uint32_t __store_dword(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
+			      unsigned ring, uint32_t target, uint64_t target_offset,
+			      uint32_t offset, uint32_t value,
 			      uint32_t cork, int fence, unsigned write_domain)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
@@ -117,12 +118,26 @@ static uint32_t __store_dword(int fd, const intel_ctx_t *ctx, unsigned ring,
 
 	memset(obj, 0, sizeof(obj));
 	obj[0].handle = cork;
-	obj[0].offset = cork << 20;
 	obj[1].handle = target;
-	obj[1].offset = target << 20;
 	obj[2].handle = gem_create(fd, 4096);
-	obj[2].offset = 256 << 10;
-	obj[2].offset += (random() % 128) << 12;
+	if (ahnd) {
+		/* If cork handle == 0 skip getting the offset */
+		if (obj[0].handle) {
+			obj[0].offset = get_offset(ahnd, obj[0].handle, 4096, 0);
+			obj[0].flags |= EXEC_OBJECT_PINNED;
+		}
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
@@ -132,13 +147,13 @@ static uint32_t __store_dword(int fd, const intel_ctx_t *ctx, unsigned ring,
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
@@ -159,8 +174,19 @@ static void store_dword(int fd, const intel_ctx_t *ctx, unsigned ring,
 			uint32_t target, uint32_t offset, uint32_t value,
 			unsigned write_domain)
 {
-	gem_close(fd, __store_dword(fd, ctx, ring,
-				    target, offset, value,
+	gem_close(fd, __store_dword(fd, 0, ctx, ring,
+				    target, 123123, offset, value,
+				    0, -1, write_domain));
+}
+
+static void store_dword2(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
+			 unsigned ring,
+			 uint32_t target, uint64_t target_offset,
+			 uint32_t offset, uint32_t value,
+			 unsigned write_domain)
+{
+	gem_close(fd, __store_dword(fd, ahnd, ctx, ring,
+				    target, target_offset, offset, value,
 				    0, -1, write_domain));
 }
 
@@ -168,8 +194,19 @@ static void store_dword_plug(int fd, const intel_ctx_t *ctx, unsigned ring,
 			     uint32_t target, uint32_t offset, uint32_t value,
 			     uint32_t cork, unsigned write_domain)
 {
-	gem_close(fd, __store_dword(fd, ctx, ring,
-				    target, offset, value,
+	gem_close(fd, __store_dword(fd, 0, ctx, ring,
+				    target, 123123, offset, value,
+				    cork, -1, write_domain));
+}
+
+static void store_dword_plug2(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
+			      unsigned ring,
+			      uint32_t target, uint64_t target_offset,
+			      uint32_t offset, uint32_t value,
+			      uint32_t cork, unsigned write_domain)
+{
+	gem_close(fd, __store_dword(fd, ahnd, ctx, ring,
+				    target, target_offset, offset, value,
 				    cork, -1, write_domain));
 }
 
@@ -177,8 +214,19 @@ static void store_dword_fenced(int fd, const intel_ctx_t *ctx, unsigned ring,
 			       uint32_t target, uint32_t offset, uint32_t value,
 			       int fence, unsigned write_domain)
 {
-	gem_close(fd, __store_dword(fd, ctx, ring,
-				    target, offset, value,
+	gem_close(fd, __store_dword(fd, 0, ctx, ring,
+				    target, 123123, offset, value,
+				    0, fence, write_domain));
+}
+
+static void store_dword_fenced2(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
+				unsigned ring,
+				uint32_t target, uint64_t target_offset,
+				uint32_t offset, uint32_t value,
+				int fence, unsigned write_domain)
+{
+	gem_close(fd, __store_dword(fd, ahnd, ctx, ring,
+				    target, target_offset, offset, value,
 				    0, fence, write_domain));
 }
 
@@ -222,26 +270,62 @@ static void unplug_show_queue(int fd, struct igt_cork *c,
 
 }
 
+static void unplug_show_queue2(int fd, struct igt_cork *c,
+			      const intel_ctx_cfg_t *cfg,
+			      unsigned int engine)
+{
+	igt_spin_t *spin[MAX_ELSP_QLEN];
+	int max = MAX_ELSP_QLEN;
+
+	/* If no scheduler, all batches are emitted in submission order */
+	if (!gem_scheduler_enabled(fd))
+		max = 1;
+
+	for (int n = 0; n < max; n++) {
+		const intel_ctx_t *ctx = create_highest_priority(fd, cfg);
+		uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
+
+		spin[n] = __igt_spin_new(fd, .ahnd = ahnd, .ctx = ctx,
+					 .engine = engine);
+		intel_ctx_destroy(fd, ctx);
+	}
+
+	igt_cork_unplug(c); /* batches will now be queued on the engine */
+	igt_debugfs_dump(fd, "i915_engine_info");
+
+	for (int n = 0; n < max; n++) {
+		uint64_t ahnd = spin[n]->ahnd;
+		igt_spin_free(fd, spin[n]);
+		put_ahnd(ahnd);
+	}
+
+}
+
 static void fifo(int fd, const intel_ctx_t *ctx, unsigned ring)
 {
 	IGT_CORK_FENCE(cork);
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
+	store_dword_fenced2(fd, ahnd, ctx, ring, scratch, scratch_offset,
+			    0, 1, fence, 0);
+	store_dword_fenced2(fd, ahnd, ctx, ring, scratch, scratch_offset,
+			    0, 2, fence, 0);
 
-	unplug_show_queue(fd, &cork, &ctx->cfg, ring);
+	unplug_show_queue2(fd, &cork, &ctx->cfg, ring);
 	close(fence);
 
 	result =  __sync_read_u32(fd, scratch, 0);
 	gem_close(fd, scratch);
+	put_ahnd(ahnd);
 
 	igt_assert_eq_u32(result, 2);
 }
@@ -260,6 +344,7 @@ static void implicit_rw(int i915, const intel_ctx_t *ctx, unsigned int ring,
 	uint32_t scratch;
 	uint32_t result;
 	int fence;
+	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id), scratch_offset;
 
 	count = 0;
 	for_each_ctx_engine(i915, ctx, e) {
@@ -274,11 +359,12 @@ static void implicit_rw(int i915, const intel_ctx_t *ctx, unsigned int ring,
 	igt_require(count);
 
 	scratch = gem_create(i915, 4096);
+	scratch_offset = get_offset(ahnd, scratch, 4096, 0);
 	fence = igt_cork_plug(&cork, i915);
 
 	if (dir & WRITE_READ)
-		store_dword_fenced(i915, ctx,
-				   ring, scratch, 0, ~ring,
+		store_dword_fenced2(i915, ahnd, ctx,
+				   ring, scratch, scratch_offset, 0, ~ring,
 				   fence, I915_GEM_DOMAIN_RENDER);
 
 	for_each_ctx_engine(i915, ctx, e) {
@@ -288,21 +374,22 @@ static void implicit_rw(int i915, const intel_ctx_t *ctx, unsigned int ring,
 		if (!gem_class_can_store_dword(i915, e->class))
 			continue;
 
-		store_dword_fenced(i915, ctx,
-				   e->flags, scratch, 0, e->flags,
+		store_dword_fenced2(i915, ahnd, ctx,
+				   e->flags, scratch, scratch_offset, 0, e->flags,
 				   fence, 0);
 	}
 
 	if (dir & READ_WRITE)
-		store_dword_fenced(i915, ctx,
-				   ring, scratch, 0, ring,
+		store_dword_fenced2(i915, ahnd, ctx,
+				   ring, scratch, scratch_offset, 0, ring,
 				   fence, I915_GEM_DOMAIN_RENDER);
 
-	unplug_show_queue(i915, &cork, &ctx->cfg, ring);
+	unplug_show_queue2(i915, &cork, &ctx->cfg, ring);
 	close(fence);
 
 	result =  __sync_read_u32(i915, scratch, 0);
 	gem_close(i915, scratch);
+	put_ahnd(ahnd);
 
 	if (dir & WRITE_READ)
 		igt_assert_neq_u32(result, ~ring);
@@ -319,8 +406,10 @@ static void independent(int fd, const intel_ctx_t *ctx, unsigned int engine,
 	uint32_t scratch, batch;
 	uint32_t *ptr;
 	int fence;
+	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id), scratch_offset;
 
 	scratch = gem_create(fd, 4096);
+	scratch_offset = get_offset(ahnd, scratch, 4096, 0);
 	ptr = gem_mmap__device_coherent(fd, scratch, 0, 4096, PROT_READ);
 	igt_assert_eq(ptr[0], 0);
 
@@ -336,6 +425,7 @@ static void independent(int fd, const intel_ctx_t *ctx, unsigned int engine,
 
 		if (spin == NULL) {
 			spin = __igt_spin_new(fd,
+					      .ahnd = ahnd,
 					      .ctx = ctx,
 					      .engine = e->flags,
 					      .flags = flags);
@@ -348,14 +438,17 @@ static void independent(int fd, const intel_ctx_t *ctx, unsigned int engine,
 			gem_execbuf(fd, &eb);
 		}
 
-		store_dword_fenced(fd, ctx, e->flags, scratch, 0, e->flags, fence, 0);
+		store_dword_fenced2(fd, ahnd, ctx, e->flags,
+				    scratch, scratch_offset,
+				    0, e->flags, fence, 0);
 	}
 	igt_require(spin);
 
 	/* Same priority, but different timeline (as different engine) */
-	batch = __store_dword(fd, ctx, engine, scratch, 0, engine, 0, fence, 0);
+	batch = __store_dword(fd, ahnd, ctx, engine, scratch, scratch_offset,
+			      0, engine, 0, fence, 0);
 
-	unplug_show_queue(fd, &cork, &ctx->cfg, engine);
+	unplug_show_queue2(fd, &cork, &ctx->cfg, engine);
 	close(fence);
 
 	gem_sync(fd, batch);
@@ -369,6 +462,7 @@ static void independent(int fd, const intel_ctx_t *ctx, unsigned int engine,
 
 	igt_spin_free(fd, spin);
 	gem_quiescent_gpu(fd);
+	put_ahnd(ahnd);
 
 	/* And we expect the others to have overwritten us, order unspecified */
 	igt_assert(!gem_bo_busy(fd, scratch));
@@ -388,6 +482,7 @@ static void smoketest(int fd, const intel_ctx_cfg_t *cfg,
 	unsigned engine;
 	uint32_t scratch;
 	uint32_t result[2 * ncpus];
+	uint64_t ahnd, scratch_offset;
 
 	nengine = 0;
 	if (ring == ALL_ENGINES) {
@@ -400,6 +495,8 @@ static void smoketest(int fd, const intel_ctx_cfg_t *cfg,
 	igt_require(nengine);
 
 	scratch = gem_create(fd, 4096);
+	scratch_offset = get_offset(ahnd, scratch, 4096, 0);
+
 	igt_fork(child, ncpus) {
 		unsigned long count = 0;
 		const intel_ctx_t *ctx;
@@ -407,6 +504,8 @@ static void smoketest(int fd, const intel_ctx_cfg_t *cfg,
 		hars_petruska_f54_1_random_perturb(child);
 
 		ctx = intel_ctx_create(fd, cfg);
+		ahnd = get_reloc_ahnd(fd, ctx->id);
+		scratch_offset = get_offset(ahnd, scratch, 4096, 0);
 		igt_until_timeout(timeout) {
 			int prio;
 
@@ -414,20 +513,23 @@ static void smoketest(int fd, const intel_ctx_cfg_t *cfg,
 			gem_context_set_priority(fd, ctx->id, prio);
 
 			engine = engines[hars_petruska_f54_1_random_unsafe_max(nengine)];
-			store_dword(fd, ctx, engine, scratch,
-				    8*child + 0, ~child,
-				    0);
+			store_dword2(fd, ahnd, ctx, engine,
+				     scratch, scratch_offset,
+				     8*child + 0, ~child, 0);
 			for (unsigned int step = 0; step < 8; step++)
-				store_dword(fd, ctx, engine, scratch,
-					    8*child + 4, count++,
-					    0);
+				store_dword2(fd, ahnd, ctx, engine,
+					     scratch, scratch_offset,
+					     8*child + 4, count++,
+					     0);
 		}
 		intel_ctx_destroy(fd, ctx);
+		put_ahnd(ahnd);
 	}
 	igt_waitchildren();
 
 	__sync_read_u32_count(fd, scratch, result, sizeof(result));
 	gem_close(fd, scratch);
+	put_ahnd(ahnd);
 
 	for (unsigned n = 0; n < ncpus; n++) {
 		igt_assert_eq_u32(result[2 * n], ~n);
@@ -644,12 +746,15 @@ static void lateslice(int i915, const intel_ctx_cfg_t *cfg,
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
@@ -658,7 +763,9 @@ static void lateslice(int i915, const intel_ctx_cfg_t *cfg,
 	igt_spin_busywait_until_started(spin[0]);
 
 	ctx = intel_ctx_create(i915, cfg);
-	spin[1] = igt_spin_new(i915, .ctx = ctx, .engine = engine,
+	ahnd[1] = get_reloc_ahnd(i915, ctx->id);
+	spin[1] = igt_spin_new(i915, .ahnd = ahnd[1], .ctx = ctx,
+			       .engine = engine,
 			       .fence = spin[0]->out_fence,
 			       .flags = (IGT_SPIN_POLL_RUN |
 					 IGT_SPIN_FENCE_IN |
@@ -675,7 +782,9 @@ static void lateslice(int i915, const intel_ctx_cfg_t *cfg,
 	 */
 
 	ctx = intel_ctx_create(i915, cfg);
-	spin[2] = igt_spin_new(i915, .ctx = ctx, .engine = engine,
+	ahnd[2] = get_reloc_ahnd(i915, ctx->id);
+	spin[2] = igt_spin_new(i915, .ahnd = ahnd[2], .ctx = ctx,
+			       .engine = engine,
 			       .flags = IGT_SPIN_POLL_RUN | flags);
 	intel_ctx_destroy(i915, ctx);
 
@@ -696,6 +805,9 @@ static void lateslice(int i915, const intel_ctx_cfg_t *cfg,
 
 	igt_assert(gem_bo_busy(i915, spin[1]->handle));
 	igt_spin_free(i915, spin[1]);
+
+	for (int i = 0; i < ARRAY_SIZE(ahnd); i++)
+		put_ahnd(ahnd[i]);
 }
 
 static void cancel_spinner(int i915,
@@ -742,6 +854,7 @@ static void submit_slice(int i915, const intel_ctx_cfg_t *cfg,
 		.num_engines = 1,
 	};
 	const intel_ctx_t *ctx;
+	uint64_t ahnd0 = get_reloc_ahnd(i915, 0);
 
 	/*
 	 * When using a submit fence, we do not want to block concurrent work,
@@ -755,13 +868,14 @@ static void submit_slice(int i915, const intel_ctx_cfg_t *cfg,
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
@@ -771,7 +885,8 @@ static void submit_slice(int i915, const intel_ctx_cfg_t *cfg,
 		engine_cfg.engines[0].engine_class = e->class;
 		engine_cfg.engines[0].engine_instance = e->instance;
 		ctx = intel_ctx_create(i915, &engine_cfg);
-		spin = igt_spin_new(i915, .ctx = ctx,
+		ahndN = get_reloc_ahnd(i915, ctx->id);
+		spin = igt_spin_new(i915, .ahnd = ahndN, .ctx = ctx,
 				    .fence = fence,
 				    .flags =
 				    IGT_SPIN_POLL_RUN |
@@ -800,7 +915,10 @@ static void submit_slice(int i915, const intel_ctx_cfg_t *cfg,
 		igt_spin_free(i915, bg);
 
 		intel_ctx_destroy(i915, ctx);
+		put_ahnd(ahndN);
 	}
+
+	put_ahnd(ahnd0);
 }
 
 static uint32_t __batch_create(int i915, uint32_t offset)
@@ -829,6 +947,7 @@ static void semaphore_userlock(int i915, const intel_ctx_t *ctx,
 	igt_spin_t *spin = NULL;
 	uint32_t scratch;
 	const intel_ctx_t *tmp_ctx;
+	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
 
 	igt_require(gem_scheduler_has_timeslicing(i915));
 
@@ -843,6 +962,7 @@ static void semaphore_userlock(int i915, const intel_ctx_t *ctx,
 	for_each_ctx_engine(i915, ctx, e) {
 		if (!spin) {
 			spin = igt_spin_new(i915,
+					    .ahnd = ahnd,
 					    .ctx = ctx,
 					    .dependency = scratch,
 					    .engine = e->flags,
@@ -885,6 +1005,7 @@ static void semaphore_userlock(int i915, const intel_ctx_t *ctx,
 	gem_close(i915, obj.handle);
 
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 }
 
 static void semaphore_codependency(int i915, const intel_ctx_t *ctx,
@@ -894,6 +1015,7 @@ static void semaphore_codependency(int i915, const intel_ctx_t *ctx,
 	struct {
 		igt_spin_t *xcs, *rcs;
 	} task[2];
+	uint64_t ahnd;
 	int i;
 
 	/*
@@ -919,9 +1041,11 @@ static void semaphore_codependency(int i915, const intel_ctx_t *ctx,
 			continue;
 
 		tmp_ctx = intel_ctx_create(i915, &ctx->cfg);
+		ahnd = get_simple_l2h_ahnd(i915, tmp_ctx->id);
 
 		task[i].xcs =
 			__igt_spin_new(i915,
+				       .ahnd = ahnd,
 				       .ctx = tmp_ctx,
 				       .engine = e->flags,
 				       .flags = IGT_SPIN_POLL_RUN | flags);
@@ -930,6 +1054,7 @@ static void semaphore_codependency(int i915, const intel_ctx_t *ctx,
 		/* Common rcs tasks will be queued in FIFO */
 		task[i].rcs =
 			__igt_spin_new(i915,
+				       .ahnd = ahnd,
 				       .ctx = tmp_ctx,
 				       .engine = 0,
 				       .dependency = task[i].xcs->handle);
@@ -952,8 +1077,10 @@ static void semaphore_codependency(int i915, const intel_ctx_t *ctx,
 	}
 
 	for (i = 0; i < ARRAY_SIZE(task); i++) {
+		ahnd = task[i].rcs->ahnd;
 		igt_spin_free(i915, task[i].xcs);
 		igt_spin_free(i915, task[i].rcs);
+		put_ahnd(ahnd);
 	}
 }
 
@@ -964,6 +1091,7 @@ static void semaphore_resolve(int i915, const intel_ctx_cfg_t *cfg,
 	const uint32_t SEMAPHORE_ADDR = 64 << 10;
 	uint32_t semaphore, *sema;
 	const intel_ctx_t *outer, *inner;
+	uint64_t ahnd = get_reloc_ahnd(i915, 0);
 
 	/*
 	 * Userspace may submit batches that wait upon unresolved
@@ -994,7 +1122,8 @@ static void semaphore_resolve(int i915, const intel_ctx_cfg_t *cfg,
 		if (!gem_class_can_store_dword(i915, e->class))
 			continue;
 
-		spin = __igt_spin_new(i915, .engine = e->flags, .flags = flags);
+		spin = __igt_spin_new(i915, .ahnd = ahnd,
+				      .engine = e->flags, .flags = flags);
 		igt_spin_end(spin); /* we just want its address for later */
 		gem_sync(i915, spin->handle);
 		igt_spin_reset(spin);
@@ -1086,6 +1215,7 @@ static void semaphore_resolve(int i915, const intel_ctx_cfg_t *cfg,
 
 	intel_ctx_destroy(i915, inner);
 	intel_ctx_destroy(i915, outer);
+	put_ahnd(ahnd);
 }
 
 static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
@@ -1094,10 +1224,12 @@ static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
 	const struct intel_execution_engine2 *outer, *inner;
 	const intel_ctx_t *ctx;
+	uint64_t ahnd;
 
 	igt_require(gen >= 6); /* MI_STORE_DWORD_IMM convenience */
 
 	ctx = intel_ctx_create(i915, cfg);
+	ahnd = get_reloc_ahnd(i915, ctx->id);
 
 	for_each_ctx_engine(i915, ctx, outer) {
 	for_each_ctx_engine(i915, ctx, inner) {
@@ -1110,10 +1242,10 @@ static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
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
@@ -1172,6 +1304,7 @@ static void semaphore_noskip(int i915, const intel_ctx_cfg_t *cfg,
 	}
 
 	intel_ctx_destroy(i915, ctx);
+	put_ahnd(ahnd);
 }
 
 static void
@@ -1197,6 +1330,7 @@ noreorder(int i915, const intel_ctx_cfg_t *cfg,
 	igt_spin_t *spin;
 	int fence = -1;
 	uint64_t addr;
+	uint64_t ahnd[2];
 
 	if (flags & CORKED)
 		fence = igt_cork_plug(&cork, i915);
@@ -1205,8 +1339,9 @@ noreorder(int i915, const intel_ctx_cfg_t *cfg,
 		vm_cfg.vm = gem_vm_create(i915);
 
 	ctx = intel_ctx_create(i915, &vm_cfg);
+	ahnd[0] = get_reloc_ahnd(i915, ctx->id);
 
-	spin = igt_spin_new(i915, .ctx = ctx,
+	spin = igt_spin_new(i915, .ahnd = ahnd[0], .ctx = ctx,
 			    .engine = engine,
 			    .fence = fence,
 			    .flags = IGT_SPIN_FENCE_OUT | IGT_SPIN_FENCE_IN);
@@ -1281,7 +1416,9 @@ noreorder(int i915, const intel_ctx_cfg_t *cfg,
 	 * Without timeslices, fallback to waiting a second.
 	 */
 	ctx = intel_ctx_create(i915, &vm_cfg);
+	ahnd[1] = get_reloc_ahnd(i915, ctx->id);
 	slice = igt_spin_new(i915,
+			    .ahnd = ahnd[1],
 			    .ctx = ctx,
 			    .engine = engine,
 			    .flags = IGT_SPIN_POLL_RUN);
@@ -1310,6 +1447,7 @@ static void reorder(int fd, const intel_ctx_cfg_t *cfg,
 	uint32_t result;
 	const intel_ctx_t *ctx[2];
 	int fence;
+	uint64_t ahnd = get_reloc_ahnd(fd, 0), scratch_offset;
 
 	ctx[LO] = intel_ctx_create(fd, cfg);
 	gem_context_set_priority(fd, ctx[LO]->id, MIN_PRIO);
@@ -1318,19 +1456,23 @@ static void reorder(int fd, const intel_ctx_cfg_t *cfg,
 	gem_context_set_priority(fd, ctx[HI]->id, flags & EQUAL ? MIN_PRIO : 0);
 
 	scratch = gem_create(fd, 4096);
+	scratch_offset = get_offset(ahnd, scratch, 4096, 0);
 	fence = igt_cork_plug(&cork, fd);
 
 	/* We expect the high priority context to be executed first, and
 	 * so the final result will be value from the low priority context.
 	 */
-	store_dword_fenced(fd, ctx[LO], ring, scratch, 0, ctx[LO]->id, fence, 0);
-	store_dword_fenced(fd, ctx[HI], ring, scratch, 0, ctx[HI]->id, fence, 0);
+	store_dword_fenced2(fd, ahnd, ctx[LO], ring, scratch, scratch_offset,
+			    0, ctx[LO]->id, fence, 0);
+	store_dword_fenced2(fd, ahnd, ctx[HI], ring, scratch, scratch_offset,
+			    0, ctx[HI]->id, fence, 0);
 
-	unplug_show_queue(fd, &cork, cfg, ring);
+	unplug_show_queue2(fd, &cork, cfg, ring);
 	close(fence);
 
 	result =  __sync_read_u32(fd, scratch, 0);
 	gem_close(fd, scratch);
+	put_ahnd(ahnd);
 
 	if (flags & EQUAL) /* equal priority, result will be fifo */
 		igt_assert_eq_u32(result, ctx[HI]->id);
@@ -1348,6 +1490,7 @@ static void promotion(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 	uint32_t result_read, dep_read;
 	const intel_ctx_t *ctx[3];
 	int fence;
+	uint64_t ahnd = get_reloc_ahnd(fd, 0), result_offset, dep_offset;
 
 	ctx[LO] = intel_ctx_create(fd, cfg);
 	gem_context_set_priority(fd, ctx[LO]->id, MIN_PRIO);
@@ -1359,7 +1502,10 @@ static void promotion(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 	gem_context_set_priority(fd, ctx[NOISE]->id, MIN_PRIO/2);
 
 	result = gem_create(fd, 4096);
+	result_offset = get_offset(ahnd, result, 4096, 0);
+	get_offset(ahnd, 1000, 4096, 0);
 	dep = gem_create(fd, 4096);
+	dep_offset = get_offset(ahnd, dep, 4096, 0);
 
 	fence = igt_cork_plug(&cork, fd);
 
@@ -1368,16 +1514,21 @@ static void promotion(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 	 * fifo would be NOISE, LO, HI.
 	 * strict priority would be  HI, NOISE, LO
 	 */
-	store_dword_fenced(fd, ctx[NOISE], ring, result, 0, ctx[NOISE]->id, fence, 0);
-	store_dword_fenced(fd, ctx[LO], ring, result, 0, ctx[LO]->id, fence, 0);
+	store_dword_fenced2(fd, ahnd, ctx[NOISE], ring, result, result_offset,
+			    0, ctx[NOISE]->id, fence, 0);
+	store_dword_fenced2(fd, ahnd, ctx[LO], ring, result, result_offset,
+			    0, ctx[LO]->id, fence, 0);
 
 	/* link LO <-> HI via a dependency on another buffer */
-	store_dword(fd, ctx[LO], ring, dep, 0, ctx[LO]->id, I915_GEM_DOMAIN_INSTRUCTION);
-	store_dword(fd, ctx[HI], ring, dep, 0, ctx[HI]->id, 0);
+	store_dword2(fd, ahnd, ctx[LO], ring, dep, dep_offset,
+		     0, ctx[LO]->id, I915_GEM_DOMAIN_INSTRUCTION);
+	store_dword2(fd, ahnd, ctx[HI], ring, dep, dep_offset,
+		     0, ctx[HI]->id, 0);
 
-	store_dword(fd, ctx[HI], ring, result, 0, ctx[HI]->id, 0);
+	store_dword2(fd, ahnd, ctx[HI], ring, result, result_offset,
+		     0, ctx[HI]->id, 0);
 
-	unplug_show_queue(fd, &cork, cfg, ring);
+	unplug_show_queue2(fd, &cork, cfg, ring);
 	close(fence);
 
 	dep_read = __sync_read_u32(fd, dep, 0);
@@ -1385,6 +1536,7 @@ static void promotion(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 
 	result_read = __sync_read_u32(fd, result, 0);
 	gem_close(fd, result);
+	put_ahnd(ahnd);
 
 	igt_assert_eq_u32(dep_read, ctx[HI]->id);
 	igt_assert_eq_u32(result_read, ctx[NOISE]->id);
@@ -1413,32 +1565,42 @@ static void preempt(int fd, const intel_ctx_cfg_t *cfg,
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
+		hang = igt_hang_ctx_with_ahnd(fd, ahnd, ctx[LO]->id, e->flags, 0);
 
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
+		store_dword2(fd, ahnd, ctx[HI], e->flags, result, result_offset,
+			     0, n + 1, I915_GEM_DOMAIN_RENDER);
 
 		result_read = __sync_read_u32(fd, result, 0);
 		igt_assert_eq_u32(result_read, n + 1);
@@ -1453,6 +1615,13 @@ static void preempt(int fd, const intel_ctx_cfg_t *cfg,
 
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
@@ -1460,7 +1629,7 @@ static void preempt(int fd, const intel_ctx_cfg_t *cfg,
 #define CHAIN 0x1
 #define CONTEXTS 0x2
 
-static igt_spin_t *__noise(int fd, const intel_ctx_t *ctx,
+static igt_spin_t *__noise(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
 			   int prio, igt_spin_t *spin)
 {
 	const struct intel_execution_engine2 *e;
@@ -1470,6 +1639,7 @@ static igt_spin_t *__noise(int fd, const intel_ctx_t *ctx,
 	for_each_ctx_engine(fd, ctx, e) {
 		if (spin == NULL) {
 			spin = __igt_spin_new(fd,
+					      .ahnd = ahnd,
 					      .ctx = ctx,
 					      .engine = e->flags);
 		} else {
@@ -1487,6 +1657,7 @@ static igt_spin_t *__noise(int fd, const intel_ctx_t *ctx,
 }
 
 static void __preempt_other(int fd,
+			    uint64_t *ahnd,
 			    const intel_ctx_t **ctx,
 			    unsigned int target, unsigned int primary,
 			    unsigned flags)
@@ -1495,24 +1666,27 @@ static void __preempt_other(int fd,
 	uint32_t result = gem_create(fd, 4096);
 	uint32_t result_read[4096 / sizeof(uint32_t)];
 	unsigned int n, i;
+	uint64_t result_offset_lo = get_offset(ahnd[LO], result, 4096, 0);
+	uint64_t result_offset_hi = get_offset(ahnd[HI], result, 4096, 0);
 
 	n = 0;
-	store_dword(fd, ctx[LO], primary,
-		    result, (n + 1)*sizeof(uint32_t), n + 1,
+	store_dword2(fd, ahnd[LO], ctx[LO], primary,
+		    result, result_offset_lo, (n + 1)*sizeof(uint32_t), n + 1,
 		    I915_GEM_DOMAIN_RENDER);
 	n++;
 
 	if (flags & CHAIN) {
 		for_each_ctx_engine(fd, ctx[LO], e) {
-			store_dword(fd, ctx[LO], e->flags,
-				    result, (n + 1)*sizeof(uint32_t), n + 1,
+			store_dword2(fd, ahnd[LO], ctx[LO], e->flags,
+				    result, result_offset_lo,
+				     (n + 1)*sizeof(uint32_t), n + 1,
 				    I915_GEM_DOMAIN_RENDER);
 			n++;
 		}
 	}
 
-	store_dword(fd, ctx[HI], target,
-		    result, (n + 1)*sizeof(uint32_t), n + 1,
+	store_dword2(fd, ahnd[HI], ctx[HI], target,
+		    result, result_offset_hi, (n + 1)*sizeof(uint32_t), n + 1,
 		    I915_GEM_DOMAIN_RENDER);
 
 	igt_debugfs_dump(fd, "i915_engine_info");
@@ -1533,6 +1707,7 @@ static void preempt_other(int fd, const intel_ctx_cfg_t *cfg,
 	const struct intel_execution_engine2 *e;
 	igt_spin_t *spin = NULL;
 	const intel_ctx_t *ctx[3];
+	uint64_t ahnd[3];
 
 	/* On each engine, insert
 	 * [NOISE] spinner,
@@ -1546,16 +1721,19 @@ static void preempt_other(int fd, const intel_ctx_cfg_t *cfg,
 
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
 
@@ -1565,6 +1743,9 @@ static void preempt_other(int fd, const intel_ctx_cfg_t *cfg,
 	intel_ctx_destroy(fd, ctx[LO]);
 	intel_ctx_destroy(fd, ctx[NOISE]);
 	intel_ctx_destroy(fd, ctx[HI]);
+	put_ahnd(ahnd[LO]);
+	put_ahnd(ahnd[NOISE]);
+	put_ahnd(ahnd[HI]);
 }
 
 static void __preempt_queue(int fd, const intel_ctx_cfg_t *cfg,
@@ -1574,12 +1755,18 @@ static void __preempt_queue(int fd, const intel_ctx_cfg_t *cfg,
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
 
@@ -1588,7 +1775,7 @@ static void __preempt_queue(int fd, const intel_ctx_cfg_t *cfg,
 			intel_ctx_destroy(fd, ctx[NOISE]);
 			ctx[NOISE] = intel_ctx_create(fd, cfg);
 		}
-		above = __noise(fd, ctx[NOISE], prio--, above);
+		above = __noise(fd, ahnd[NOISE], ctx[NOISE], prio--, above);
 	}
 
 	gem_context_set_priority(fd, ctx[HI]->id, prio--);
@@ -1598,28 +1785,31 @@ static void __preempt_queue(int fd, const intel_ctx_cfg_t *cfg,
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
+	store_dword2(fd, ahnd[LO], ctx[LO], primary,
+		    result, result_offset, (n + 1)*sizeof(uint32_t), n + 1,
 		    I915_GEM_DOMAIN_RENDER);
 	n++;
 
 	if (flags & CHAIN) {
 		for_each_ctx_engine(fd, ctx[LO], e) {
-			store_dword(fd, ctx[LO], e->flags,
-				    result, (n + 1)*sizeof(uint32_t), n + 1,
+			store_dword2(fd, ahnd[LO], ctx[LO], e->flags,
+				    result, result_offset,
+				     (n + 1)*sizeof(uint32_t), n + 1,
 				    I915_GEM_DOMAIN_RENDER);
 			n++;
 		}
 	}
 
-	store_dword(fd, ctx[HI], target,
-		    result, (n + 1)*sizeof(uint32_t), n + 1,
+	result_offset = get_offset(ahnd[HI], result, 4096, 0);
+	store_dword2(fd, ahnd[HI], ctx[HI], target,
+		    result, result_offset, (n + 1)*sizeof(uint32_t), n + 1,
 		    I915_GEM_DOMAIN_RENDER);
 
 	igt_debugfs_dump(fd, "i915_engine_info");
@@ -1645,6 +1835,9 @@ static void __preempt_queue(int fd, const intel_ctx_cfg_t *cfg,
 	intel_ctx_destroy(fd, ctx[LO]);
 	intel_ctx_destroy(fd, ctx[NOISE]);
 	intel_ctx_destroy(fd, ctx[HI]);
+	put_ahnd(ahnd[LO]);
+	put_ahnd(ahnd[NOISE]);
+	put_ahnd(ahnd[HI]);
 
 	gem_close(fd, result);
 }
@@ -1679,6 +1872,7 @@ static void preempt_engines(int i915,
 	IGT_LIST_HEAD(plist);
 	igt_spin_t *spin, *sn;
 	const intel_ctx_t *ctx;
+	uint64_t ahnd;
 
 	/*
 	 * A quick test that each engine within a context is an independent
@@ -1694,12 +1888,14 @@ static void preempt_engines(int i915,
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
@@ -1713,6 +1909,7 @@ static void preempt_engines(int i915,
 		}
 	}
 	intel_ctx_destroy(i915, ctx);
+	put_ahnd(ahnd);
 }
 
 static void preempt_self(int fd, const intel_ctx_cfg_t *cfg,
@@ -1724,6 +1921,7 @@ static void preempt_self(int fd, const intel_ctx_cfg_t *cfg,
 	igt_spin_t *spin[MAX_ELSP_QLEN];
 	unsigned int n, i;
 	const intel_ctx_t *ctx[3];
+	uint64_t ahnd[3], result_offset;
 
 	/* On each engine, insert
 	 * [NOISE] spinner,
@@ -1735,21 +1933,26 @@ static void preempt_self(int fd, const intel_ctx_cfg_t *cfg,
 
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
+		store_dword2(fd, ahnd[HI], ctx[HI], e->flags,
+			    result, result_offset,
+			     (n + 1)*sizeof(uint32_t), n + 1,
 			    I915_GEM_DOMAIN_RENDER);
 		n++;
 	}
 	gem_context_set_priority(fd, ctx[HI]->id, MAX_PRIO);
-	store_dword(fd, ctx[HI], ring,
-		    result, (n + 1)*sizeof(uint32_t), n + 1,
+	store_dword2(fd, ahnd[HI], ctx[HI], ring,
+		    result, result_offset, (n + 1)*sizeof(uint32_t), n + 1,
 		    I915_GEM_DOMAIN_RENDER);
 
 	gem_set_domain(fd, result, I915_GEM_DOMAIN_GTT, 0);
@@ -1767,6 +1970,8 @@ static void preempt_self(int fd, const intel_ctx_cfg_t *cfg,
 
 	intel_ctx_destroy(fd, ctx[NOISE]);
 	intel_ctx_destroy(fd, ctx[HI]);
+	put_ahnd(ahnd[NOISE]);
+	put_ahnd(ahnd[HI]);
 
 	gem_close(fd, result);
 }
@@ -1777,25 +1982,29 @@ static void preemptive_hang(int fd, const intel_ctx_cfg_t *cfg,
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
@@ -1803,11 +2012,14 @@ static void preemptive_hang(int fd, const intel_ctx_cfg_t *cfg,
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
@@ -1941,12 +2153,14 @@ static void wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
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
 
@@ -1955,14 +2169,15 @@ static void wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 	     igt_seconds_elapsed(&tv) < 5 && count < ring_size;
 	     count++) {
 		for (int n = 0; n < MAX_CONTEXTS; n++) {
-			store_dword_fenced(fd, ctx[n], ring, result, 4*n, ctx[n]->id,
+			store_dword_fenced2(fd, ahnd, ctx[n], ring,
+					    result, result_offset, 4*n, ctx[n]->id,
 					   fence, I915_GEM_DOMAIN_INSTRUCTION);
 		}
 	}
 	igt_info("Submitted %d requests over %d contexts in %.1fms\n",
 		 count, MAX_CONTEXTS, igt_nsec_elapsed(&tv) * 1e-6);
 
-	unplug_show_queue(fd, &cork, cfg, ring);
+	unplug_show_queue2(fd, &cork, cfg, ring);
 	close(fence);
 
 	__sync_read_u32_count(fd, result, result_read, sizeof(result_read));
@@ -1974,6 +2189,7 @@ static void wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 
 	gem_close(fd, result);
 	free(ctx);
+	put_ahnd(ahnd);
 }
 
 static void reorder_wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
@@ -1989,8 +2205,11 @@ static void reorder_wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 	IGT_CORK_FENCE(cork);
 	uint32_t *expected;
 	int fence;
+	uint64_t ahnd = get_reloc_ahnd(fd, 0), result_offset;
+	unsigned int sz = ALIGN(ring_size * 64, 4096);
 
 	result = gem_create(fd, 4096);
+	result_offset = get_offset(ahnd, result, 4096, 0);
 	target = gem_create(fd, 4096);
 	fence = igt_cork_plug(&cork, fd);
 
@@ -2017,8 +2236,14 @@ static void reorder_wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 	execbuf.flags |= I915_EXEC_FENCE_IN;
 	execbuf.rsvd2 = fence;
 
+	if (ahnd) {
+		obj[0].flags |= EXEC_OBJECT_PINNED;
+		obj[0].offset = result_offset;
+		obj[1].flags |= EXEC_OBJECT_PINNED;
+		obj[1].relocation_count = 0;
+	}
+
 	for (int n = 0, x = 1; n < ARRAY_SIZE(priorities); n++, x++) {
-		unsigned int sz = ALIGN(ring_size * 64, 4096);
 		uint32_t *batch;
 		const intel_ctx_t *tmp_ctx;
 
@@ -2027,6 +2252,11 @@ static void reorder_wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 		execbuf.rsvd1 = tmp_ctx->id;
 
 		obj[1].handle = gem_create(fd, sz);
+		if (ahnd) {
+			obj[1].offset = get_offset(ahnd, obj[1].handle, sz, 0);
+			reloc.presumed_offset = obj[1].offset;
+		}
+
 		batch = gem_mmap__device_coherent(fd, obj[1].handle, 0, sz, PROT_WRITE);
 		gem_set_domain(fd, obj[1].handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 
@@ -2067,7 +2297,7 @@ static void reorder_wide(int fd, const intel_ctx_cfg_t *cfg, unsigned ring)
 		intel_ctx_destroy(fd, tmp_ctx);
 	}
 
-	unplug_show_queue(fd, &cork, cfg, ring);
+	unplug_show_queue2(fd, &cork, cfg, ring);
 	close(fence);
 
 	__sync_read_u32_count(fd, result, result_read, sizeof(result_read));
@@ -2455,6 +2685,7 @@ static void test_pi_iova(int i915, const intel_ctx_cfg_t *cfg,
 	pthread_t hi, lo;
 	char poison[4096];
 	int ufd;
+	uint64_t ahnd = get_reloc_ahnd(i915, 0);
 
 	/*
 	 * In this scenario, we have a pair of contending contexts that
@@ -2521,7 +2752,7 @@ static void test_pi_iova(int i915, const intel_ctx_cfg_t *cfg,
 	 * the local tasklet will not run until after all signals have been
 	 * delivered... but another tasklet might).
 	 */
-	spin = igt_spin_new(i915, .engine = engine);
+	spin = igt_spin_new(i915, .ahnd = ahnd, .engine = engine);
 	for (int i = 0; i < MAX_ELSP_QLEN; i++) {
 		const intel_ctx_t *ctx = create_highest_priority(i915, cfg);
 		spin->execbuf.rsvd1 = ctx->id;
@@ -2554,6 +2785,7 @@ static void test_pi_iova(int i915, const intel_ctx_cfg_t *cfg,
 	pthread_mutex_unlock(&t.mutex);
 	igt_debugfs_dump(i915, "i915_engine_info");
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 
 	pthread_join(hi, NULL);
 	pthread_join(lo, NULL);
@@ -2703,9 +2935,16 @@ static uint32_t read_ctx_timestamp(int i915, const intel_ctx_t *ctx,
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
 
@@ -2741,11 +2980,14 @@ static void fairslice(int i915, const intel_ctx_cfg_t *cfg,
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
@@ -2770,6 +3012,7 @@ static void fairslice(int i915, const intel_ctx_cfg_t *cfg,
 	for (int i = 0; i < ARRAY_SIZE(ctx); i++)
 		intel_ctx_destroy(i915, ctx[i]);
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 
 	/*
 	 * If we imagine that the timeslices are randomly distributed to
-- 
2.26.0
