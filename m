Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504506E51D
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Aug 2021 04:50:01 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 19 Aug 2021 06:49:39 +0200
Message-Id: <20210819044941.7699-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210819044941.7699-1-zbigniew.kempczynski@intel.com>
References: <20210819044941.7699-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/gem_ctx_shared: Adopt to use
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

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_ctx_shared.c | 164 ++++++++++++++++++++++++++++--------
 1 file changed, 130 insertions(+), 34 deletions(-)

diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
index 4441e6eb7..ea1b5dd1b 100644
--- a/tests/i915/gem_ctx_shared.c
+++ b/tests/i915/gem_ctx_shared.c
@@ -157,6 +157,7 @@ static void disjoint_timelines(int i915, const intel_ctx_cfg_t *cfg)
 	const intel_ctx_t *ctx[2];
 	igt_spin_t *spin[2];
 	uint32_t plug;
+	uint64_t ahnd;
 
 	igt_require(gem_has_execlists(i915));
 
@@ -169,11 +170,13 @@ static void disjoint_timelines(int i915, const intel_ctx_cfg_t *cfg)
 	vm_cfg.vm = gem_vm_create(i915);
 	ctx[0] = intel_ctx_create(i915, &vm_cfg);
 	ctx[1] = intel_ctx_create(i915, &vm_cfg);
+	/* Context id is not important, we share vm */
+	ahnd = get_reloc_ahnd(i915, 0);
 
 	plug = igt_cork_plug(&cork, i915);
 
-	spin[0] = __igt_spin_new(i915, .ctx = ctx[0], .dependency = plug);
-	spin[1] = __igt_spin_new(i915, .ctx = ctx[1]);
+	spin[0] = __igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx[0], .dependency = plug);
+	spin[1] = __igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx[1]);
 
 	/* Wait for the second spinner, will hang if stuck behind the first */
 	igt_spin_end(spin[1]);
@@ -183,6 +186,7 @@ static void disjoint_timelines(int i915, const intel_ctx_cfg_t *cfg)
 
 	igt_spin_free(i915, spin[1]);
 	igt_spin_free(i915, spin[0]);
+	put_ahnd(ahnd);
 
 	intel_ctx_destroy(i915, ctx[0]);
 	intel_ctx_destroy(i915, ctx[1]);
@@ -391,11 +395,12 @@ static void single_timeline(int i915, const intel_ctx_cfg_t *cfg)
 	intel_ctx_cfg_t st_cfg;
 	const intel_ctx_t *ctx;
 	igt_spin_t *spin;
+	uint64_t ahnd = get_reloc_ahnd(i915, 0);
 	int n;
 
 	igt_require(gem_context_has_single_timeline(i915));
 
-	spin = igt_spin_new(i915);
+	spin = igt_spin_new(i915, .ahnd = ahnd);
 
 	/*
 	 * For a "single timeline" context, each ring is on the common
@@ -429,6 +434,7 @@ static void single_timeline(int i915, const intel_ctx_cfg_t *cfg)
 		igt_assert(!strcmp(rings[0].obj_name, rings[i].obj_name));
 	}
 	intel_ctx_destroy(i915, ctx);
+	put_ahnd(ahnd);
 }
 
 static void exec_single_timeline(int i915, const intel_ctx_cfg_t *cfg,
@@ -438,19 +444,22 @@ static void exec_single_timeline(int i915, const intel_ctx_cfg_t *cfg,
 	igt_spin_t *spin;
 	intel_ctx_cfg_t st_cfg;
 	const intel_ctx_t *ctx;
+	uint64_t ahnd;
 
 	/*
 	 * On an ordinary context, a blockage on one engine doesn't prevent
 	 * execution on an other.
 	 */
 	ctx = intel_ctx_create(i915, cfg);
+	ahnd = get_reloc_ahnd(i915, ctx->id);
 	spin = NULL;
 	for_each_ctx_cfg_engine(i915, cfg, e) {
 		if (e->flags == engine)
 			continue;
 
 		if (spin == NULL) {
-			spin = __igt_spin_new(i915, .ctx = ctx, .engine = e->flags);
+			spin = __igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
+					      .engine = e->flags);
 		} else {
 			struct drm_i915_gem_execbuffer2 execbuf = {
 				.buffers_ptr = spin->execbuf.buffers_ptr,
@@ -465,6 +474,7 @@ static void exec_single_timeline(int i915, const intel_ctx_cfg_t *cfg,
 	igt_assert_eq(nop_sync(i915, ctx, engine, NSEC_PER_SEC), 0);
 	igt_spin_free(i915, spin);
 	intel_ctx_destroy(i915, ctx);
+	put_ahnd(ahnd);
 
 	/*
 	 * But if we create a context with just a single shared timeline,
@@ -474,13 +484,15 @@ static void exec_single_timeline(int i915, const intel_ctx_cfg_t *cfg,
 	st_cfg = *cfg;
 	st_cfg.flags |= I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE;
 	ctx = intel_ctx_create(i915, &st_cfg);
+	ahnd = get_reloc_ahnd(i915, ctx->id);
 	spin = NULL;
 	for_each_ctx_cfg_engine(i915, &st_cfg, e) {
 		if (e->flags == engine)
 			continue;
 
 		if (spin == NULL) {
-			spin = __igt_spin_new(i915, .ctx = ctx, .engine = e->flags);
+			spin = __igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
+					      .engine = e->flags);
 		} else {
 			struct drm_i915_gem_execbuffer2 execbuf = {
 				.buffers_ptr = spin->execbuf.buffers_ptr,
@@ -495,11 +507,14 @@ static void exec_single_timeline(int i915, const intel_ctx_cfg_t *cfg,
 	igt_assert_eq(nop_sync(i915, ctx, engine, NSEC_PER_SEC), -ETIME);
 	igt_spin_free(i915, spin);
 	intel_ctx_destroy(i915, ctx);
+	put_ahnd(ahnd);
 }
 
-static void store_dword(int i915, const intel_ctx_t *ctx, unsigned ring,
-			uint32_t target, uint32_t offset, uint32_t value,
-			uint32_t cork, unsigned write_domain)
+static void store_dword(int i915, uint64_t ahnd, const intel_ctx_t *ctx,
+			unsigned ring, uint32_t target, uint64_t target_offset,
+			uint32_t offset, uint32_t value,
+			uint32_t cork, uint64_t cork_offset,
+			unsigned write_domain)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
 	struct drm_i915_gem_exec_object2 obj[3];
@@ -518,12 +533,24 @@ static void store_dword(int i915, const intel_ctx_t *ctx, unsigned ring,
 
 	memset(obj, 0, sizeof(obj));
 	obj[0].handle = cork;
-	obj[0].offset = cork << 20;
 	obj[1].handle = target;
-	obj[1].offset = target << 20;
 	obj[2].handle = gem_create(i915, 4096);
-	obj[2].offset = 256 << 10;
-	obj[2].offset += (random() % 128) << 12;
+	if (ahnd) {
+		obj[0].offset = cork_offset;
+		obj[0].flags |= EXEC_OBJECT_PINNED;
+		obj[1].offset = target_offset;
+		obj[1].flags |= EXEC_OBJECT_PINNED;
+		if (write_domain)
+			obj[1].flags |= EXEC_OBJECT_WRITE;
+		obj[2].offset = get_offset(ahnd, obj[2].handle, 4096, 0x0);
+		obj[2].flags |= EXEC_OBJECT_PINNED;
+		execbuf.flags |= I915_EXEC_NO_RELOC;
+	} else {
+		obj[0].offset = cork << 20;
+		obj[1].offset = target << 20;
+		obj[2].offset = 256 << 10;
+		obj[2].offset += (random() % 128) << 12;
+	}
 
 	memset(&reloc, 0, sizeof(reloc));
 	reloc.target_handle = obj[1].handle;
@@ -533,7 +560,7 @@ static void store_dword(int i915, const intel_ctx_t *ctx, unsigned ring,
 	reloc.read_domains = I915_GEM_DOMAIN_INSTRUCTION;
 	reloc.write_domain = write_domain;
 	obj[2].relocs_ptr = to_user_pointer(&reloc);
-	obj[2].relocation_count = 1;
+	obj[2].relocation_count = !ahnd ? 1 : 0;
 
 	i = 0;
 	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
@@ -570,25 +597,42 @@ create_highest_priority(int i915, const intel_ctx_cfg_t *cfg)
 	return ctx;
 }
 
-static void unplug_show_queue(int i915, struct igt_cork *c,
+static void unplug_show_queue(int i915, struct igt_cork *c, uint64_t ahnd,
 			      const intel_ctx_cfg_t *cfg, unsigned int engine)
 {
 	igt_spin_t *spin[MAX_ELSP_QLEN];
 
 	for (int n = 0; n < ARRAY_SIZE(spin); n++) {
 		const intel_ctx_t *ctx = create_highest_priority(i915, cfg);
-		spin[n] = __igt_spin_new(i915, .ctx = ctx, .engine = engine);
+
+		/*
+		 * When we're using same vm we should use allocator handle
+		 * passed by the caller. This is the case where cfg->vm
+		 * is not NULL.
+		 *
+		 * For cases where context use its own vm we need separate
+		 * ahnd for it.
+		 */
+		if (!cfg->vm)
+			ahnd = get_reloc_ahnd(i915, ctx->id);
+		spin[n] = __igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
+					 .engine = engine);
 		intel_ctx_destroy(i915, ctx);
 	}
 
 	igt_cork_unplug(c); /* batches will now be queued on the engine */
 	igt_debugfs_dump(i915, "i915_engine_info");
 
-	for (int n = 0; n < ARRAY_SIZE(spin); n++)
+	for (int n = 0; n < ARRAY_SIZE(spin); n++) {
+		ahnd = spin[n]->ahnd;
 		igt_spin_free(i915, spin[n]);
+		if (!cfg->vm)
+			put_ahnd(ahnd);
+	}
 }
 
 static uint32_t store_timestamp(int i915,
+				uint64_t ahnd,
 				const intel_ctx_t *ctx,
 				unsigned ring,
 				unsigned mmio_base,
@@ -599,8 +643,10 @@ static uint32_t store_timestamp(int i915,
 	uint32_t handle = gem_create(i915, 4096);
 	struct drm_i915_gem_exec_object2 obj = {
 		.handle = handle,
-		.relocation_count = 1,
-		.offset = (32 << 20) + (handle << 16),
+		.relocation_count = !ahnd ? 1 : 0,
+		.offset = !ahnd ? (32 << 20) + (handle << 16) :
+				  get_offset(ahnd, handle, 4096, 0),
+		.flags = !ahnd ? 0 : EXEC_OBJECT_PINNED,
 	};
 	struct drm_i915_gem_relocation_entry reloc = {
 		.target_handle = obj.handle,
@@ -612,7 +658,7 @@ static uint32_t store_timestamp(int i915,
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
-		.flags = ring | I915_EXEC_FENCE_IN,
+		.flags = ring | I915_EXEC_FENCE_IN | (!!ahnd * I915_EXEC_NO_RELOC),
 		.rsvd1 = ctx->id,
 		.rsvd2 = fence
 	};
@@ -652,6 +698,7 @@ static void independent(int i915, const intel_ctx_cfg_t *cfg,
 	unsigned int mmio_base;
 	IGT_CORK_FENCE(cork);
 	int fence;
+	uint64_t ahnd = get_reloc_ahnd(i915, 0); /* same vm */
 
 	mmio_base = gem_engine_mmio_base(i915, e->name);
 	igt_require_f(mmio_base, "mmio base not known\n");
@@ -662,7 +709,8 @@ static void independent(int i915, const intel_ctx_cfg_t *cfg,
 
 	for (int n = 0; n < ARRAY_SIZE(spin); n++) {
 		const intel_ctx_t *ctx = create_highest_priority(i915, &q_cfg);
-		spin[n] = __igt_spin_new(i915, .ctx = ctx, .engine = e->flags);
+		spin[n] = __igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
+					 .engine = e->flags);
 		intel_ctx_destroy(i915, ctx);
 	}
 
@@ -670,7 +718,7 @@ static void independent(int i915, const intel_ctx_cfg_t *cfg,
 	for (int i = 0; i < ARRAY_SIZE(priorities); i++) {
 		const intel_ctx_t *ctx = create_highest_priority(i915, &q_cfg);
 		gem_context_set_priority(i915, ctx->id, priorities[i]);
-		handle[i] = store_timestamp(i915, ctx,
+		handle[i] = store_timestamp(i915, ahnd, ctx,
 					    e->flags, mmio_base,
 					    fence, TIMESTAMP);
 		intel_ctx_destroy(i915, ctx);
@@ -691,6 +739,7 @@ static void independent(int i915, const intel_ctx_cfg_t *cfg,
 		gem_set_domain(i915, handle[i], /* no write hazard lies! */
 			       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 		gem_close(i915, handle[i]);
+		put_offset(ahnd, handle[i]);
 
 		handle[i] = ptr[TIMESTAMP];
 		munmap(ptr, 4096);
@@ -698,6 +747,7 @@ static void independent(int i915, const intel_ctx_cfg_t *cfg,
 		igt_debug("ctx[%d] .prio=%d, timestamp=%u\n",
 			  i, priorities[i], handle[i]);
 	}
+	put_ahnd(ahnd);
 
 	igt_assert((int32_t)(handle[HI] - handle[LO]) < 0);
 
@@ -714,6 +764,7 @@ static void reorder(int i915, const intel_ctx_cfg_t *cfg,
 	intel_ctx_cfg_t q_cfg;
 	const intel_ctx_t *ctx[2];
 	uint32_t plug;
+	uint64_t ahnd = get_reloc_ahnd(i915, 0), scratch_offset, plug_offset;
 
 	q_cfg = *cfg;
 	q_cfg.vm = gem_vm_create(i915);
@@ -726,15 +777,19 @@ static void reorder(int i915, const intel_ctx_cfg_t *cfg,
 	gem_context_set_priority(i915, ctx[HI]->id, flags & EQUAL ? MIN_PRIO : 0);
 
 	scratch = gem_create(i915, 4096);
+	scratch_offset = get_offset(ahnd, scratch, 4096, 0);
 	plug = igt_cork_plug(&cork, i915);
+	plug_offset = get_offset(ahnd, plug, 4096, 0);
 
 	/* We expect the high priority context to be executed first, and
 	 * so the final result will be value from the low priority context.
 	 */
-	store_dword(i915, ctx[LO], ring, scratch, 0, ctx[LO]->id, plug, 0);
-	store_dword(i915, ctx[HI], ring, scratch, 0, ctx[HI]->id, plug, 0);
+	store_dword(i915, ahnd, ctx[LO], ring, scratch, scratch_offset,
+		    0, ctx[LO]->id, plug, plug_offset, 0);
+	store_dword(i915, ahnd, ctx[HI], ring, scratch, scratch_offset,
+		    0, ctx[HI]->id, plug, plug_offset, 0);
 
-	unplug_show_queue(i915, &cork, &q_cfg, ring);
+	unplug_show_queue(i915, &cork, ahnd, &q_cfg, ring);
 	gem_close(i915, plug);
 
 	ptr = gem_mmap__device_coherent(i915, scratch, 0, 4096, PROT_READ);
@@ -750,6 +805,9 @@ static void reorder(int i915, const intel_ctx_cfg_t *cfg,
 
 	intel_ctx_destroy(i915, ctx[LO]);
 	intel_ctx_destroy(i915, ctx[HI]);
+	put_offset(ahnd, scratch);
+	put_offset(ahnd, plug);
+	put_ahnd(ahnd);
 
 	gem_vm_destroy(i915, q_cfg.vm);
 }
@@ -762,6 +820,8 @@ static void promotion(int i915, const intel_ctx_cfg_t *cfg, unsigned ring)
 	intel_ctx_cfg_t q_cfg;
 	const intel_ctx_t *ctx[3];
 	uint32_t plug;
+	uint64_t ahnd = get_reloc_ahnd(i915, 0);
+	uint64_t result_offset, dep_offset, plug_offset;
 
 	q_cfg = *cfg;
 	q_cfg.vm = gem_vm_create(i915);
@@ -777,25 +837,33 @@ static void promotion(int i915, const intel_ctx_cfg_t *cfg, unsigned ring)
 	gem_context_set_priority(i915, ctx[NOISE]->id, MIN_PRIO/2);
 
 	result = gem_create(i915, 4096);
+	result_offset = get_offset(ahnd, result, 4096, 0);
 	dep = gem_create(i915, 4096);
+	dep_offset = get_offset(ahnd, dep, 4096, 0);
 
 	plug = igt_cork_plug(&cork, i915);
+	plug_offset = get_offset(ahnd, plug, 4096, 0);
 
 	/* Expect that HI promotes LO, so the order will be LO, HI, NOISE.
 	 *
 	 * fifo would be NOISE, LO, HI.
 	 * strict priority would be  HI, NOISE, LO
 	 */
-	store_dword(i915, ctx[NOISE], ring, result, 0, ctx[NOISE]->id, plug, 0);
-	store_dword(i915, ctx[LO], ring, result, 0, ctx[LO]->id, plug, 0);
+	store_dword(i915, ahnd, ctx[NOISE], ring, result, result_offset,
+		    0, ctx[NOISE]->id, plug, plug_offset, 0);
+	store_dword(i915, ahnd, ctx[LO], ring, result, result_offset,
+		    0, ctx[LO]->id, plug, plug_offset, 0);
 
 	/* link LO <-> HI via a dependency on another buffer */
-	store_dword(i915, ctx[LO], ring, dep, 0, ctx[LO]->id, 0, I915_GEM_DOMAIN_INSTRUCTION);
-	store_dword(i915, ctx[HI], ring, dep, 0, ctx[HI]->id, 0, 0);
+	store_dword(i915, ahnd, ctx[LO], ring, dep, dep_offset,
+		    0, ctx[LO]->id, 0, 0, I915_GEM_DOMAIN_INSTRUCTION);
+	store_dword(i915, ahnd, ctx[HI], ring, dep, dep_offset,
+		    0, ctx[HI]->id, 0, 0, 0);
 
-	store_dword(i915, ctx[HI], ring, result, 0, ctx[HI]->id, 0, 0);
+	store_dword(i915, ahnd, ctx[HI], ring, result, result_offset,
+		    0, ctx[HI]->id, 0, 0, 0);
 
-	unplug_show_queue(i915, &cork, &q_cfg, ring);
+	unplug_show_queue(i915, &cork, ahnd, &q_cfg, ring);
 	gem_close(i915, plug);
 
 	ptr = gem_mmap__device_coherent(i915, dep, 0, 4096, PROT_READ);
@@ -817,6 +885,10 @@ static void promotion(int i915, const intel_ctx_cfg_t *cfg, unsigned ring)
 	intel_ctx_destroy(i915, ctx[NOISE]);
 	intel_ctx_destroy(i915, ctx[LO]);
 	intel_ctx_destroy(i915, ctx[HI]);
+	put_offset(ahnd, result);
+	put_offset(ahnd, dep);
+	put_offset(ahnd, plug);
+	put_ahnd(ahnd);
 
 	gem_vm_destroy(i915, q_cfg.vm);
 }
@@ -831,6 +903,8 @@ static void smoketest(int i915, const intel_ctx_cfg_t *cfg,
 	unsigned engine;
 	uint32_t scratch;
 	uint32_t *ptr;
+	uint64_t ahnd = get_reloc_ahnd(i915, 0); /* same vm */
+	uint64_t scratch_offset;
 
 	q_cfg = *cfg;
 	q_cfg.vm = gem_vm_create(i915);
@@ -848,9 +922,11 @@ static void smoketest(int i915, const intel_ctx_cfg_t *cfg,
 	igt_require(nengine);
 
 	scratch = gem_create(i915, 4096);
+	scratch_offset = get_offset(ahnd, scratch, 4096, 0);
 	igt_fork(child, ncpus) {
 		unsigned long count = 0;
 		const intel_ctx_t *ctx;
+		ahnd = get_reloc_ahnd(i915, 0); /* ahnd to same vm */
 
 		hars_petruska_f54_1_random_perturb(child);
 
@@ -862,15 +938,18 @@ static void smoketest(int i915, const intel_ctx_cfg_t *cfg,
 			gem_context_set_priority(i915, ctx->id, prio);
 
 			engine = engines[hars_petruska_f54_1_random_unsafe_max(nengine)];
-			store_dword(i915, ctx, engine, scratch,
+			store_dword(i915, ahnd, ctx, engine,
+				    scratch, scratch_offset,
 				    8*child + 0, ~child,
-				    0, 0);
+				    0, 0, 0);
 			for (unsigned int step = 0; step < 8; step++)
-				store_dword(i915, ctx, engine, scratch,
+				store_dword(i915, ahnd, ctx, engine,
+					    scratch, scratch_offset,
 					    8*child + 4, count++,
-					    0, 0);
+					    0, 0, 0);
 		}
 		intel_ctx_destroy(i915, ctx);
+		put_ahnd(ahnd);
 	}
 	igt_waitchildren();
 
@@ -878,6 +957,8 @@ static void smoketest(int i915, const intel_ctx_cfg_t *cfg,
 	gem_set_domain(i915, scratch, /* no write hazard lies! */
 			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 	gem_close(i915, scratch);
+	put_offset(ahnd, scratch);
+	put_ahnd(ahnd);
 
 	for (unsigned n = 0; n < ncpus; n++) {
 		igt_assert_eq_u32(ptr[2*n], ~n);
@@ -974,6 +1055,16 @@ igt_main
 				for_each_queue(e, i915, &cfg)
 					promotion(i915, &cfg, e->flags);
 			}
+		}
+
+		igt_subtest_group {
+			igt_fixture {
+				igt_require(gem_scheduler_enabled(i915));
+				igt_require(gem_scheduler_has_ctx_priority(i915));
+				igt_require(gem_has_vm(i915));
+				igt_require(gem_context_has_single_timeline(i915));
+				intel_allocator_multiprocess_start();
+			}
 
 			igt_subtest_with_dynamic("Q-smoketest") {
 				for_each_queue(e, i915, &cfg)
@@ -982,8 +1073,13 @@ igt_main
 
 			igt_subtest("Q-smoketest-all")
 				smoketest(i915, &cfg, -1, 30);
+
+			igt_fixture {
+				intel_allocator_multiprocess_stop();
+			}
 		}
 
+
 		igt_subtest("exhaust-shared-gtt")
 			exhaust_shared_gtt(i915, 0);
 
-- 
2.26.0
