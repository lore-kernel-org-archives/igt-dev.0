Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D9B89932
 for <igt-dev@lists.freedesktop.org>; Sat,  4 Sep 2021 17:16:30 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
Date: Sat,  4 Sep 2021 22:39:32 +0530
Message-Id: <20210904170932.26321-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/i915/gem_ctx_persistence: modified
 test_saturated_hostile subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: arjun.melkaveri@intel.com, zbigniew.kempczynski@intel.com, ashutosh.dixit@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Applying saturated_hostile to support for twiddling the
scheduling parameters via sysfs to tune timeouts.

New Context is created in for_each_ctx_cfg_engine and
passed to get_reloc_ahnd.

v2 : Added DRM issue id.

Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/1551

Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_ctx_persistence.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index fafd8bb2..251c0037 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -876,13 +876,13 @@ static void test_process_mixed(int pfd, const intel_ctx_cfg_t *cfg,
 }
 
 static void
-test_saturated_hostile(int i915, const intel_ctx_t *base_ctx,
-		       const struct intel_execution_engine2 *engine)
+test_saturated_hostile(int i915, const intel_ctx_cfg_t *cfg,
+		       unsigned int engine_flags)
 {
 	const struct intel_execution_engine2 *other;
 	igt_spin_t *spin;
 	const intel_ctx_t *ctx;
-	uint64_t ahnd = get_reloc_ahnd(i915, base_ctx->id);
+	uint64_t ahnd;
 	int fence = -1;
 
 	cleanup(i915);
@@ -899,11 +899,13 @@ test_saturated_hostile(int i915, const intel_ctx_t *base_ctx,
 	 * reset other users whenever they chose.]
 	 */
 
-	for_each_ctx_engine(i915, base_ctx, other) {
-		if (other->flags == engine->flags)
+	for_each_ctx_cfg_engine(i915, cfg, other) {
+		if (other->flags == engine_flags)
 			continue;
 
-		spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = base_ctx,
+		ctx = intel_ctx_create(i915, cfg);
+		ahnd = get_reloc_ahnd(i915, ctx->id);
+		spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 				   .engine = other->flags,
 				   .flags = (IGT_SPIN_NO_PREEMPTION |
 					     IGT_SPIN_FENCE_OUT));
@@ -924,10 +926,10 @@ test_saturated_hostile(int i915, const intel_ctx_t *base_ctx,
 	put_ahnd(ahnd);
 	igt_require(fence != -1);
 
-	ctx = ctx_create_persistence(i915, &base_ctx->cfg, false);
+	ctx = ctx_create_persistence(i915, cfg, false);
 	ahnd = get_reloc_ahnd(i915, ctx->id);
 	spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
-			    .engine = engine->flags,
+			    .engine = engine_flags,
 			    .flags = (IGT_SPIN_NO_PREEMPTION |
 				      IGT_SPIN_POLL_RUN |
 				      IGT_SPIN_FENCE_OUT));
@@ -1310,7 +1312,8 @@ igt_main
 		igt_subtest_with_dynamic_f("saturated-hostile") {
 			for_each_ctx_engine(i915, ctx, e) {
 				igt_dynamic_f("%s", e->name)
-					test_saturated_hostile(i915, ctx, e);
+					do_test(test_saturated_hostile, i915,
+						&ctx->cfg, e->flags, e->name);
 			}
 		}
 
-- 
2.25.1
