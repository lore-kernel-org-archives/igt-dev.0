Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A972A6EACF
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Oct 2021 04:43:41 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Thu, 21 Oct 2021 10:05:06 +0530
Message-Id: <20211021043508.1158148-3-priyanka.dandamudi@intel.com>
In-Reply-To: <20211021043508.1158148-1-priyanka.dandamudi@intel.com>
References: <20211021043508.1158148-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] tests/gem_ctx_persistence: Update
 saturated_hostile for dependent engine resets
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, ashutosh.dixit@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The gem_ctx_persistence test in general has support for twiddling the
scheduling parameters via sysfs to tune timeouts. For some reason,
this was not being applied to the saturated_hostile test. The test was
also broken for platforms with dependent engine resets.

The test submits requests to all engines, kills one and expects the
rest to survive. However, the other engine requests were all marked as
not pre-emptible. On recent platforms, there is a reset dependency
across RCS and CCS engines. That is, if one of those engines is reset
then all engines must be reset. If a context executing on one of those
engines does not pre-empt first then it will be killed.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 tests/i915/gem_ctx_persistence.c | 55 ++++++++++++++++++++++++++++----
 1 file changed, 48 insertions(+), 7 deletions(-)

diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index fafd8bb2..d7b2488c 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -875,11 +875,14 @@ static void test_process_mixed(int pfd, const intel_ctx_cfg_t *cfg,
 	gem_quiescent_gpu(pfd);
 }
 
+#define SATURATED_NOPREMPT	(1 << 0)
+
 static void
-test_saturated_hostile(int i915, const intel_ctx_t *base_ctx,
-		       const struct intel_execution_engine2 *engine)
+test_saturated_hostile_all(int i915, const intel_ctx_t *base_ctx,
+			   unsigned int engine_flags, unsigned int test_flags)
 {
 	const struct intel_execution_engine2 *other;
+	unsigned int other_flags = 0;
 	igt_spin_t *spin;
 	const intel_ctx_t *ctx;
 	uint64_t ahnd = get_reloc_ahnd(i915, base_ctx->id);
@@ -887,6 +890,20 @@ test_saturated_hostile(int i915, const intel_ctx_t *base_ctx,
 
 	cleanup(i915);
 
+	if (test_flags & SATURATED_NOPREMPT) {
+		/*
+		 * Render and compute engines have a reset dependency. If one is
+		 * reset then all must be reset. Thus, if a hanging batch causes
+		 * a reset, any non-preemptible batches on the other engines
+		 * will be killed. So don't bother testing for the survival of
+		 * non-preemptible batches when compute engines are present.
+		 */
+		for_each_ctx_engine(i915, base_ctx, other)
+			igt_require(other->class != I915_ENGINE_CLASS_COMPUTE);
+
+		other_flags |= IGT_SPIN_NO_PREEMPTION;
+	}
+
 	/*
 	 * Check that if we have to remove a hostile request from a
 	 * non-persistent context, we do so without harming any other
@@ -900,13 +917,12 @@ test_saturated_hostile(int i915, const intel_ctx_t *base_ctx,
 	 */
 
 	for_each_ctx_engine(i915, base_ctx, other) {
-		if (other->flags == engine->flags)
+		if (other->flags == engine_flags)
 			continue;
 
 		spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = base_ctx,
 				   .engine = other->flags,
-				   .flags = (IGT_SPIN_NO_PREEMPTION |
-					     IGT_SPIN_FENCE_OUT));
+				   .flags = other_flags | IGT_SPIN_FENCE_OUT);
 
 		if (fence < 0) {
 			fence = spin->out_fence;
@@ -927,7 +943,7 @@ test_saturated_hostile(int i915, const intel_ctx_t *base_ctx,
 	ctx = ctx_create_persistence(i915, &base_ctx->cfg, false);
 	ahnd = get_reloc_ahnd(i915, ctx->id);
 	spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
-			    .engine = engine->flags,
+			    .engine = engine_flags,
 			    .flags = (IGT_SPIN_NO_PREEMPTION |
 				      IGT_SPIN_POLL_RUN |
 				      IGT_SPIN_FENCE_OUT));
@@ -944,6 +960,24 @@ test_saturated_hostile(int i915, const intel_ctx_t *base_ctx,
 	put_ahnd(ahnd);
 }
 
+static void
+test_saturated_hostile_nopreempt(int i915, const intel_ctx_cfg_t *cfg,
+				 unsigned int engine_flags)
+{
+	const intel_ctx_t *ctx = intel_ctx_create(i915, cfg);
+	test_saturated_hostile_all(i915, ctx, engine_flags, SATURATED_NOPREMPT);
+	intel_ctx_destroy(i915, ctx);
+}
+
+static void
+test_saturated_hostile(int i915, const intel_ctx_cfg_t *cfg,
+		       unsigned int engine_flags)
+{
+	const intel_ctx_t *ctx = intel_ctx_create(i915, cfg);
+	test_saturated_hostile_all(i915, ctx, engine_flags, 0);
+	intel_ctx_destroy(i915, ctx);
+}
+
 static void test_processes(int i915)
 {
 	struct {
@@ -1310,7 +1344,14 @@ igt_main
 		igt_subtest_with_dynamic_f("saturated-hostile") {
 			for_each_ctx_engine(i915, ctx, e) {
 				igt_dynamic_f("%s", e->name)
-					test_saturated_hostile(i915, ctx, e);
+					do_test(test_saturated_hostile, i915, &ctx->cfg, e->flags, e->name);
+			}
+		}
+
+		igt_subtest_with_dynamic_f("saturated-hostile-nopreempt") {
+			for_each_ctx_engine(i915, ctx, e) {
+				igt_dynamic_f("%s", e->name)
+					do_test(test_saturated_hostile_nopreempt, i915, &ctx->cfg, e->flags, e->name);
 			}
 		}
 
-- 
2.25.1
