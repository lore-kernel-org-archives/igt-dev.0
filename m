Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45B910E5CE
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Dec 2022 13:03:32 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Dec 2022 14:03:12 +0100
Message-Id: <20221201130312.69093-5-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221201130312.69093-1-zbigniew.kempczynski@intel.com>
References: <20221201130312.69093-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/4] tests/gem_ctx_shared: Remove necessity
 of passing offset to function call
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Previously reloc allocator wasn't stateful for allocations thus alloc()
had to be done in single place. Now this limitation is removed so
dependent function can call allocator alloc() function again without
worrying about offset change.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_ctx_shared.c | 45 ++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 26 deletions(-)

diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
index d6b56b72ab..3b155ac214 100644
--- a/tests/i915/gem_ctx_shared.c
+++ b/tests/i915/gem_ctx_shared.c
@@ -512,9 +512,9 @@ static void exec_single_timeline(int i915, const intel_ctx_cfg_t *cfg,
 }
 
 static void store_dword(int i915, uint64_t ahnd, const intel_ctx_t *ctx,
-			unsigned ring, uint32_t target, uint64_t target_offset,
+			unsigned ring, uint32_t target, uint64_t target_size,
 			uint32_t offset, uint32_t value,
-			uint32_t cork, uint64_t cork_offset,
+			uint32_t cork, uint64_t cork_size,
 			unsigned write_domain)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
@@ -537,9 +537,9 @@ static void store_dword(int i915, uint64_t ahnd, const intel_ctx_t *ctx,
 	obj[1].handle = target;
 	obj[2].handle = gem_create(i915, 4096);
 	if (ahnd) {
-		obj[0].offset = cork_offset;
+		obj[0].offset = get_offset(ahnd, cork, cork_size, 0);
 		obj[0].flags |= EXEC_OBJECT_PINNED;
-		obj[1].offset = target_offset;
+		obj[1].offset = get_offset(ahnd, target, target_size, 0);
 		obj[1].flags |= EXEC_OBJECT_PINNED;
 		if (write_domain)
 			obj[1].flags |= EXEC_OBJECT_WRITE;
@@ -768,7 +768,7 @@ static void reorder(int i915, const intel_ctx_cfg_t *cfg,
 	intel_ctx_cfg_t q_cfg;
 	const intel_ctx_t *ctx[2];
 	uint32_t plug;
-	uint64_t ahnd = get_reloc_ahnd(i915, 0), scratch_offset, plug_offset;
+	uint64_t ahnd = get_reloc_ahnd(i915, 0);
 
 	q_cfg = *cfg;
 	q_cfg.vm = gem_vm_create(i915);
@@ -781,17 +781,15 @@ static void reorder(int i915, const intel_ctx_cfg_t *cfg,
 	gem_context_set_priority(i915, ctx[HI]->id, flags & EQUAL ? MIN_PRIO : 0);
 
 	scratch = gem_create(i915, 4096);
-	scratch_offset = get_offset(ahnd, scratch, 4096, 0);
 	plug = igt_cork_plug(&cork, i915);
-	plug_offset = get_offset(ahnd, plug, 4096, 0);
 
 	/* We expect the high priority context to be executed first, and
 	 * so the final result will be value from the low priority context.
 	 */
-	store_dword(i915, ahnd, ctx[LO], ring, scratch, scratch_offset,
-		    0, ctx[LO]->id, plug, plug_offset, 0);
-	store_dword(i915, ahnd, ctx[HI], ring, scratch, scratch_offset,
-		    0, ctx[HI]->id, plug, plug_offset, 0);
+	store_dword(i915, ahnd, ctx[LO], ring, scratch, 4096,
+		    0, ctx[LO]->id, plug, 4096, 0);
+	store_dword(i915, ahnd, ctx[HI], ring, scratch, 4096,
+		    0, ctx[HI]->id, plug, 4096, 0);
 
 	unplug_show_queue(i915, &cork, ahnd, &q_cfg, ring);
 	gem_close(i915, plug);
@@ -825,7 +823,6 @@ static void promotion(int i915, const intel_ctx_cfg_t *cfg, unsigned ring)
 	const intel_ctx_t *ctx[3];
 	uint32_t plug;
 	uint64_t ahnd = get_reloc_ahnd(i915, 0);
-	uint64_t result_offset, dep_offset, plug_offset;
 
 	q_cfg = *cfg;
 	q_cfg.vm = gem_vm_create(i915);
@@ -841,30 +838,27 @@ static void promotion(int i915, const intel_ctx_cfg_t *cfg, unsigned ring)
 	gem_context_set_priority(i915, ctx[NOISE]->id, 0);
 
 	result = gem_create(i915, 4096);
-	result_offset = get_offset(ahnd, result, 4096, 0);
 	dep = gem_create(i915, 4096);
-	dep_offset = get_offset(ahnd, dep, 4096, 0);
 
 	plug = igt_cork_plug(&cork, i915);
-	plug_offset = get_offset(ahnd, plug, 4096, 0);
 
 	/* Expect that HI promotes LO, so the order will be LO, HI, NOISE.
 	 *
 	 * fifo would be NOISE, LO, HI.
 	 * strict priority would be  HI, NOISE, LO
 	 */
-	store_dword(i915, ahnd, ctx[NOISE], ring, result, result_offset,
-		    0, ctx[NOISE]->id, plug, plug_offset, 0);
-	store_dword(i915, ahnd, ctx[LO], ring, result, result_offset,
-		    0, ctx[LO]->id, plug, plug_offset, 0);
+	store_dword(i915, ahnd, ctx[NOISE], ring, result, 4096,
+		    0, ctx[NOISE]->id, plug, 4096, 0);
+	store_dword(i915, ahnd, ctx[LO], ring, result, 4096,
+		    0, ctx[LO]->id, plug, 4096, 0);
 
 	/* link LO <-> HI via a dependency on another buffer */
-	store_dword(i915, ahnd, ctx[LO], ring, dep, dep_offset,
+	store_dword(i915, ahnd, ctx[LO], ring, dep, 4096,
 		    0, ctx[LO]->id, 0, 0, I915_GEM_DOMAIN_INSTRUCTION);
-	store_dword(i915, ahnd, ctx[HI], ring, dep, dep_offset,
+	store_dword(i915, ahnd, ctx[HI], ring, dep, 4096,
 		    0, ctx[HI]->id, 0, 0, 0);
 
-	store_dword(i915, ahnd, ctx[HI], ring, result, result_offset,
+	store_dword(i915, ahnd, ctx[HI], ring, result, 4096,
 		    0, ctx[HI]->id, 0, 0, 0);
 
 	unplug_show_queue(i915, &cork, ahnd, &q_cfg, ring);
@@ -908,7 +902,6 @@ static void smoketest(int i915, const intel_ctx_cfg_t *cfg,
 	uint32_t scratch;
 	uint32_t *ptr;
 	uint64_t ahnd = get_reloc_ahnd(i915, 0); /* same vm */
-	uint64_t scratch_offset;
 
 	q_cfg = *cfg;
 	q_cfg.vm = gem_vm_create(i915);
@@ -926,7 +919,7 @@ static void smoketest(int i915, const intel_ctx_cfg_t *cfg,
 	igt_require(nengine);
 
 	scratch = gem_create(i915, 4096);
-	scratch_offset = get_offset(ahnd, scratch, 4096, 0);
+
 	igt_fork(child, ncpus) {
 		unsigned long count = 0;
 		const intel_ctx_t *ctx;
@@ -943,12 +936,12 @@ static void smoketest(int i915, const intel_ctx_cfg_t *cfg,
 
 			engine = engines[hars_petruska_f54_1_random_unsafe_max(nengine)];
 			store_dword(i915, ahnd, ctx, engine,
-				    scratch, scratch_offset,
+				    scratch, 4096,
 				    8*child + 0, ~child,
 				    0, 0, 0);
 			for (unsigned int step = 0; step < 8; step++)
 				store_dword(i915, ahnd, ctx, engine,
-					    scratch, scratch_offset,
+					    scratch, 4096,
 					    8*child + 4, count++,
 					    0, 0, 0);
 		}
-- 
2.34.1
