Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BF96EB87
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 09:47:18 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 11:46:04 +0200
Message-Id: <20210806094649.21162-12-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
References: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 11/56] tests/gem_ctx_engines: Adopt to
 use allocator
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
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_ctx_engines.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index bfa83f7e5..003dd1713 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -69,6 +69,7 @@ static void invalid_engines(int i915)
 	uint32_t handle;
 	igt_spin_t *spin;
 	void *ptr;
+	uint64_t ahnd;
 
 	param.size = 0;
 	igt_assert_eq(__set_param_fresh_context(i915, param), -EINVAL);
@@ -180,8 +181,10 @@ static void invalid_engines(int i915)
 
 	/* Test that we can't set engines after we've done an execbuf */
 	param.ctx_id = gem_context_create(i915);
-	spin = igt_spin_new(i915, .ctx_id = param.ctx_id);
+	ahnd = get_reloc_ahnd(i915, param.ctx_id);
+	spin = igt_spin_new(i915, .ahnd = ahnd, .ctx_id = param.ctx_id);
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 	igt_assert_eq(__gem_context_set_param(i915, &param), -EINVAL);
 	gem_context_destroy(i915, param.ctx_id);
 
@@ -283,14 +286,18 @@ static void execute_one(int i915)
 		for (int i = -1; i <= I915_EXEC_RING_MASK; i++) {
 			intel_ctx_cfg_t cfg = {};
 			const intel_ctx_t *ctx;
+			uint64_t ahnd;
 			igt_spin_t *spin;
 
 			cfg.num_engines = 1;
 			cfg.engines[0].engine_class = e->class;
 			cfg.engines[0].engine_instance = e->instance;
 			ctx = intel_ctx_create(i915, &cfg);
+			ahnd = get_reloc_ahnd(i915, ctx->id);
 
-			spin = igt_spin_new(i915, .ctx = ctx,
+			spin = igt_spin_new(i915,
+					    .ahnd = ahnd,
+					    .ctx = ctx,
 					    .flags = (IGT_SPIN_NO_PREEMPTION |
 						      IGT_SPIN_POLL_RUN));
 
@@ -324,6 +331,7 @@ static void execute_one(int i915)
 				      i != -1 ? 1 << e->class : 0);
 
 			igt_spin_free(i915, spin);
+			put_ahnd(ahnd);
 
 			gem_sync(i915, obj.handle);
 			intel_ctx_destroy(i915, ctx);
@@ -344,9 +352,11 @@ static void execute_oneforall(int i915)
 		.size = sizeof(engines),
 	};
 	const struct intel_execution_engine2 *e;
+	uint64_t ahnd;
 
 	for_each_physical_engine(i915, e) {
 		param.ctx_id = gem_context_create(i915);
+		ahnd = get_reloc_ahnd(i915, param.ctx_id);
 
 		memset(&engines, 0, sizeof(engines));
 		for (int i = 0; i <= I915_EXEC_RING_MASK; i++) {
@@ -360,6 +370,7 @@ static void execute_oneforall(int i915)
 			igt_spin_t *spin;
 
 			spin = __igt_spin_new(i915,
+					      .ahnd = ahnd,
 					      .ctx_id = param.ctx_id,
 					      .engine = i);
 
@@ -371,6 +382,7 @@ static void execute_oneforall(int i915)
 		}
 
 		gem_context_destroy(i915, param.ctx_id);
+		put_ahnd(ahnd);
 	}
 }
 
@@ -384,6 +396,7 @@ static void execute_allforone(int i915)
 	};
 	const struct intel_execution_engine2 *e;
 	int i;
+	uint64_t ahnd = get_reloc_ahnd(i915, param.ctx_id);
 
 	i = 0;
 	memset(&engines, 0, sizeof(engines));
@@ -401,6 +414,7 @@ static void execute_allforone(int i915)
 		igt_spin_t *spin;
 
 		spin = __igt_spin_new(i915,
+				      .ahnd = ahnd,
 				      .ctx_id = param.ctx_id,
 				      .engine = i++);
 
@@ -412,6 +426,7 @@ static void execute_allforone(int i915)
 	}
 
 	gem_context_destroy(i915, param.ctx_id);
+	put_ahnd(ahnd);
 }
 
 static uint32_t read_result(int timeline, uint32_t *map, int idx)
@@ -539,6 +554,7 @@ static void independent_all(int i915, const intel_ctx_t *ctx)
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
 	const struct intel_execution_engine2 *e;
 	igt_spin_t *spin = NULL;
+	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
 
 	for_each_ctx_engine(i915, ctx, e) {
 		if (spin) {
@@ -546,7 +562,9 @@ static void independent_all(int i915, const intel_ctx_t *ctx)
 			spin->execbuf.flags |= e->flags;
 			gem_execbuf(i915, &spin->execbuf);
 		} else {
-			spin = igt_spin_new(i915, .ctx = ctx,
+			spin = igt_spin_new(i915,
+					    .ahnd = ahnd,
+					    .ctx = ctx,
 					    .engine = e->flags,
 					    .flags = (IGT_SPIN_NO_PREEMPTION |
 						      IGT_SPIN_POLL_RUN));
@@ -567,6 +585,7 @@ static void independent_all(int i915, const intel_ctx_t *ctx)
 	}
 	sched_yield();
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 	igt_waitchildren();
 }
 
-- 
2.26.0
