Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE2A89E65
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 05:28:23 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 10 Aug 2021 07:27:07 +0200
Message-Id: <20210810052711.7866-62-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
References: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 61/65] WIP: tests/gem_ctx_shared: Convert
 to use no-reloc
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

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_ctx_shared.c | 111 ++++++++++++++++++++++++++++--------
 1 file changed, 87 insertions(+), 24 deletions(-)

diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
index 4441e6eb7..9bfa5115c 100644
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
@@ -495,11 +507,12 @@ static void exec_single_timeline(int i915, const intel_ctx_cfg_t *cfg,
 	igt_assert_eq(nop_sync(i915, ctx, engine, NSEC_PER_SEC), -ETIME);
 	igt_spin_free(i915, spin);
 	intel_ctx_destroy(i915, ctx);
+	put_ahnd(ahnd);
 }
 
-static void store_dword(int i915, const intel_ctx_t *ctx, unsigned ring,
-			uint32_t target, uint32_t offset, uint32_t value,
-			uint32_t cork, unsigned write_domain)
+static void store_dword(int i915, uint64_t ahnd, const intel_ctx_t *ctx,
+			unsigned ring, uint32_t target, uint32_t offset,
+		        uint32_t value, uint32_t cork, unsigned write_domain)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
 	struct drm_i915_gem_exec_object2 obj[3];
@@ -533,7 +546,15 @@ static void store_dword(int i915, const intel_ctx_t *ctx, unsigned ring,
 	reloc.read_domains = I915_GEM_DOMAIN_INSTRUCTION;
 	reloc.write_domain = write_domain;
 	obj[2].relocs_ptr = to_user_pointer(&reloc);
-	obj[2].relocation_count = 1;
+	if (ahnd) {
+		obj[0].flags |= EXEC_OBJECT_PINNED;
+		obj[1].flags |= EXEC_OBJECT_PINNED;
+		if (write_domain)
+			obj[1].flags |= EXEC_OBJECT_WRITE;
+		obj[2].flags |= EXEC_OBJECT_PINNED;
+	} else {
+		obj[2].relocation_count = 1;
+	}
 
 	i = 0;
 	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
@@ -574,21 +595,28 @@ static void unplug_show_queue(int i915, struct igt_cork *c,
 			      const intel_ctx_cfg_t *cfg, unsigned int engine)
 {
 	igt_spin_t *spin[MAX_ELSP_QLEN];
+	uint64_t ahnd;
 
 	for (int n = 0; n < ARRAY_SIZE(spin); n++) {
 		const intel_ctx_t *ctx = create_highest_priority(i915, cfg);
-		spin[n] = __igt_spin_new(i915, .ctx = ctx, .engine = engine);
+		ahnd = get_reloc_ahnd(i915, ctx->id);
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
+		put_ahnd(ahnd);
+	}
 }
 
 static uint32_t store_timestamp(int i915,
+				uint64_t ahnd,
 				const intel_ctx_t *ctx,
 				unsigned ring,
 				unsigned mmio_base,
@@ -599,7 +627,7 @@ static uint32_t store_timestamp(int i915,
 	uint32_t handle = gem_create(i915, 4096);
 	struct drm_i915_gem_exec_object2 obj = {
 		.handle = handle,
-		.relocation_count = 1,
+		.relocation_count = !ahnd ? 1 : 0,
 		.offset = (32 << 20) + (handle << 16),
 	};
 	struct drm_i915_gem_relocation_entry reloc = {
@@ -652,6 +680,7 @@ static void independent(int i915, const intel_ctx_cfg_t *cfg,
 	unsigned int mmio_base;
 	IGT_CORK_FENCE(cork);
 	int fence;
+	uint64_t ahnd;
 
 	mmio_base = gem_engine_mmio_base(i915, e->name);
 	igt_require_f(mmio_base, "mmio base not known\n");
@@ -662,18 +691,22 @@ static void independent(int i915, const intel_ctx_cfg_t *cfg,
 
 	for (int n = 0; n < ARRAY_SIZE(spin); n++) {
 		const intel_ctx_t *ctx = create_highest_priority(i915, &q_cfg);
-		spin[n] = __igt_spin_new(i915, .ctx = ctx, .engine = e->flags);
+		ahnd = get_reloc_ahnd(i915, ctx->id);
+		spin[n] = __igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
+					 .engine = e->flags);
 		intel_ctx_destroy(i915, ctx);
 	}
 
 	fence = igt_cork_plug(&cork, i915);
 	for (int i = 0; i < ARRAY_SIZE(priorities); i++) {
 		const intel_ctx_t *ctx = create_highest_priority(i915, &q_cfg);
+		ahnd = get_reloc_ahnd(i915, ctx->id);
 		gem_context_set_priority(i915, ctx->id, priorities[i]);
-		handle[i] = store_timestamp(i915, ctx,
+		handle[i] = store_timestamp(i915, ahnd, ctx,
 					    e->flags, mmio_base,
 					    fence, TIMESTAMP);
 		intel_ctx_destroy(i915, ctx);
+		put_ahnd(ahnd);
 	}
 	close(fence);
 	kick_tasklets(); /* XXX try to hide cmdparser delays XXX */
@@ -681,8 +714,11 @@ static void independent(int i915, const intel_ctx_cfg_t *cfg,
 	igt_cork_unplug(&cork);
 	igt_debugfs_dump(i915, "i915_engine_info");
 
-	for (int n = 0; n < ARRAY_SIZE(spin); n++)
+	for (int n = 0; n < ARRAY_SIZE(spin); n++) {
+		ahnd = spin[n]->ahnd;
 		igt_spin_free(i915, spin[n]);
+		put_ahnd(ahnd);
+	}
 
 	for (int i = 0; i < ARRAY_SIZE(priorities); i++) {
 		uint32_t *ptr;
@@ -714,6 +750,7 @@ static void reorder(int i915, const intel_ctx_cfg_t *cfg,
 	intel_ctx_cfg_t q_cfg;
 	const intel_ctx_t *ctx[2];
 	uint32_t plug;
+	uint64_t ahnd = get_reloc_ahnd(i915, 0);
 
 	q_cfg = *cfg;
 	q_cfg.vm = gem_vm_create(i915);
@@ -731,8 +768,8 @@ static void reorder(int i915, const intel_ctx_cfg_t *cfg,
 	/* We expect the high priority context to be executed first, and
 	 * so the final result will be value from the low priority context.
 	 */
-	store_dword(i915, ctx[LO], ring, scratch, 0, ctx[LO]->id, plug, 0);
-	store_dword(i915, ctx[HI], ring, scratch, 0, ctx[HI]->id, plug, 0);
+	store_dword(i915, ahnd, ctx[LO], ring, scratch, 0, ctx[LO]->id, plug, 0);
+	store_dword(i915, ahnd, ctx[HI], ring, scratch, 0, ctx[HI]->id, plug, 0);
 
 	unplug_show_queue(i915, &cork, &q_cfg, ring);
 	gem_close(i915, plug);
@@ -750,6 +787,7 @@ static void reorder(int i915, const intel_ctx_cfg_t *cfg,
 
 	intel_ctx_destroy(i915, ctx[LO]);
 	intel_ctx_destroy(i915, ctx[HI]);
+	put_ahnd(ahnd);
 
 	gem_vm_destroy(i915, q_cfg.vm);
 }
@@ -762,6 +800,7 @@ static void promotion(int i915, const intel_ctx_cfg_t *cfg, unsigned ring)
 	intel_ctx_cfg_t q_cfg;
 	const intel_ctx_t *ctx[3];
 	uint32_t plug;
+	uint64_t ahnd[3];
 
 	q_cfg = *cfg;
 	q_cfg.vm = gem_vm_create(i915);
@@ -769,12 +808,15 @@ static void promotion(int i915, const intel_ctx_cfg_t *cfg, unsigned ring)
 
 	ctx[LO] = intel_ctx_create(i915, &q_cfg);
 	gem_context_set_priority(i915, ctx[LO]->id, MIN_PRIO);
+	ahnd[LO] = get_reloc_ahnd(i915, ctx[LO]->id);
 
 	ctx[HI] = intel_ctx_create(i915, &q_cfg);
 	gem_context_set_priority(i915, ctx[HI]->id, 0);
+	ahnd[HI] = get_reloc_ahnd(i915, ctx[HI]->id);
 
 	ctx[NOISE] = intel_ctx_create(i915, &q_cfg);
 	gem_context_set_priority(i915, ctx[NOISE]->id, MIN_PRIO/2);
+	ahnd[NOISE] = get_reloc_ahnd(i915, ctx[NOISE]->id);
 
 	result = gem_create(i915, 4096);
 	dep = gem_create(i915, 4096);
@@ -786,14 +828,14 @@ static void promotion(int i915, const intel_ctx_cfg_t *cfg, unsigned ring)
 	 * fifo would be NOISE, LO, HI.
 	 * strict priority would be  HI, NOISE, LO
 	 */
-	store_dword(i915, ctx[NOISE], ring, result, 0, ctx[NOISE]->id, plug, 0);
-	store_dword(i915, ctx[LO], ring, result, 0, ctx[LO]->id, plug, 0);
+	store_dword(i915, ahnd[NOISE], ctx[NOISE], ring, result, 0, ctx[NOISE]->id, plug, 0);
+	store_dword(i915, ahnd[LO], ctx[LO], ring, result, 0, ctx[LO]->id, plug, 0);
 
 	/* link LO <-> HI via a dependency on another buffer */
-	store_dword(i915, ctx[LO], ring, dep, 0, ctx[LO]->id, 0, I915_GEM_DOMAIN_INSTRUCTION);
-	store_dword(i915, ctx[HI], ring, dep, 0, ctx[HI]->id, 0, 0);
+	store_dword(i915, ahnd[LO], ctx[LO], ring, dep, 0, ctx[LO]->id, 0, I915_GEM_DOMAIN_INSTRUCTION);
+	store_dword(i915, ahnd[HI], ctx[HI], ring, dep, 0, ctx[HI]->id, 0, 0);
 
-	store_dword(i915, ctx[HI], ring, result, 0, ctx[HI]->id, 0, 0);
+	store_dword(i915, ahnd[HI], ctx[HI], ring, result, 0, ctx[HI]->id, 0, 0);
 
 	unplug_show_queue(i915, &cork, &q_cfg, ring);
 	gem_close(i915, plug);
@@ -817,6 +859,9 @@ static void promotion(int i915, const intel_ctx_cfg_t *cfg, unsigned ring)
 	intel_ctx_destroy(i915, ctx[NOISE]);
 	intel_ctx_destroy(i915, ctx[LO]);
 	intel_ctx_destroy(i915, ctx[HI]);
+	put_ahnd(ahnd[NOISE]);
+	put_ahnd(ahnd[LO]);
+	put_ahnd(ahnd[HI]);
 
 	gem_vm_destroy(i915, q_cfg.vm);
 }
@@ -831,6 +876,7 @@ static void smoketest(int i915, const intel_ctx_cfg_t *cfg,
 	unsigned engine;
 	uint32_t scratch;
 	uint32_t *ptr;
+	uint64_t ahnd;
 
 	q_cfg = *cfg;
 	q_cfg.vm = gem_vm_create(i915);
@@ -855,6 +901,7 @@ static void smoketest(int i915, const intel_ctx_cfg_t *cfg,
 		hars_petruska_f54_1_random_perturb(child);
 
 		ctx = intel_ctx_create(i915, &q_cfg);
+		ahnd = get_reloc_ahnd(i915, ctx->id);
 		igt_until_timeout(timeout) {
 			int prio;
 
@@ -862,15 +909,16 @@ static void smoketest(int i915, const intel_ctx_cfg_t *cfg,
 			gem_context_set_priority(i915, ctx->id, prio);
 
 			engine = engines[hars_petruska_f54_1_random_unsafe_max(nengine)];
-			store_dword(i915, ctx, engine, scratch,
+			store_dword(i915, ahnd, ctx, engine, scratch,
 				    8*child + 0, ~child,
 				    0, 0);
 			for (unsigned int step = 0; step < 8; step++)
-				store_dword(i915, ctx, engine, scratch,
+				store_dword(i915, ahnd, ctx, engine, scratch,
 					    8*child + 4, count++,
 					    0, 0);
 		}
 		intel_ctx_destroy(i915, ctx);
+		put_ahnd(ahnd);
 	}
 	igt_waitchildren();
 
@@ -974,6 +1022,16 @@ igt_main
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
@@ -982,8 +1040,13 @@ igt_main
 
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
