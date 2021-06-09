Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A0E6EA25
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 17:39:45 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so1863217pjz.3
 for <igt-dev@lists.freedesktop.org>; Wed, 09 Jun 2021 10:39:45 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  9 Jun 2021 12:38:43 -0500
Message-Id: <20210609173903.249112-24-jason@jlekstrand.net>
In-Reply-To: <20210609173632.248880-1-jason@jlekstrand.net>
References: <20210609173632.248880-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 73/93] tests/i915/gem_ctx_engines: Use
 better engine iteration
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_ctx_engines.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index ac03206c..531495c3 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -444,7 +444,7 @@ static void execute_allforone(int i915)
 
 	i = 0;
 	memset(&engines, 0, sizeof(engines));
-	__for_each_physical_engine(i915, e) {
+	for_each_physical_engine(i915, e) {
 		engine_class(&engines, i) = e->class;
 		engine_instance(&engines, i) = e->instance;
 		i++;
@@ -453,7 +453,7 @@ static void execute_allforone(int i915)
 	gem_context_set_param(i915, &param);
 
 	i = 0;
-	__for_each_physical_engine(i915, e) {
+	for_each_physical_engine(i915, e) {
 		struct drm_i915_gem_busy busy = {};
 		igt_spin_t *spin;
 
@@ -490,7 +490,8 @@ static bool has_cs_timestamp(const struct intel_execution_engine2 *e, int gen)
 	return e->class == I915_ENGINE_CLASS_RENDER;
 }
 
-static void independent(int i915, const struct intel_execution_engine2 *e)
+static void independent(int i915, const intel_ctx_t *base_ctx,
+			const struct intel_execution_engine2 *e)
 {
 #define RCS_TIMESTAMP (mmio_base + 0x358)
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
@@ -498,7 +499,6 @@ static void independent(int i915, const struct intel_execution_engine2 *e)
 	const int has_64bit_reloc = gen >= 8;
 	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, I915_EXEC_RING_MASK + 1);
 	struct drm_i915_gem_context_param param = {
-		.ctx_id = gem_context_clone_with_engines(i915, 0),
 		.param = I915_CONTEXT_PARAM_ENGINES,
 		.value = to_user_pointer(&engines),
 		.size = sizeof(engines),
@@ -518,7 +518,7 @@ static void independent(int i915, const struct intel_execution_engine2 *e)
 		struct drm_i915_gem_execbuffer2 execbuf = {
 			.buffers_ptr = to_user_pointer(&results),
 			.buffer_count = 1,
-			.rsvd1 = param.ctx_id,
+			.rsvd1 = base_ctx->id,
 			.flags = e->flags,
 		};
 		gem_write(i915, results.handle, 0, &bbe, sizeof(bbe));
@@ -531,6 +531,7 @@ static void independent(int i915, const struct intel_execution_engine2 *e)
 		engine_class(&engines, i) = e->class;
 		engine_instance(&engines, i) = e->instance;
 	}
+	param.ctx_id = gem_context_create(i915);
 	gem_context_set_param(i915, &param);
 
 	gem_set_caching(i915, results.handle, I915_CACHING_CACHED);
@@ -590,19 +591,20 @@ static void independent(int i915, const struct intel_execution_engine2 *e)
 	gem_context_destroy(i915, param.ctx_id);
 }
 
-static void independent_all(int i915)
+static void independent_all(int i915, const intel_ctx_t *ctx)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
 	const struct intel_execution_engine2 *e;
 	igt_spin_t *spin = NULL;
 
-	__for_each_physical_engine(i915, e) {
+	for_each_ctx_engine(i915, ctx, e) {
 		if (spin) {
 			spin->execbuf.flags &= ~63;
 			spin->execbuf.flags |= e->flags;
 			gem_execbuf(i915, &spin->execbuf);
 		} else {
-			spin = igt_spin_new(i915, .engine = e->flags,
+			spin = igt_spin_new(i915, .ctx = ctx,
+					    .engine = e->flags,
 					    .flags = (IGT_SPIN_NO_PREEMPTION |
 						      IGT_SPIN_POLL_RUN));
 		}
@@ -610,7 +612,7 @@ static void independent_all(int i915)
 	igt_require(spin);
 	igt_spin_busywait_until_started(spin);
 
-	__for_each_physical_engine(i915, e) {
+	for_each_ctx_engine(i915, ctx, e) {
 		if (!gem_engine_mmio_base(i915, e->name))
 			continue;
 
@@ -618,7 +620,7 @@ static void independent_all(int i915)
 			continue;
 
 		igt_fork(child, 1)
-			independent(i915, e);
+			independent(i915, ctx, e);
 	}
 	sched_yield();
 	igt_spin_free(i915, spin);
@@ -727,14 +729,18 @@ igt_main
 		execute_allforone(i915);
 
 	igt_subtest_with_dynamic("independent") {
+		const intel_ctx_t *ctx;
+
 		igt_require(gem_scheduler_enabled(i915));
 		igt_require(intel_gen(intel_get_drm_devid(i915) >= 6));
-		__for_each_physical_engine(i915, e) {
+
+		ctx = intel_ctx_create_all_physical(i915);
+		for_each_ctx_engine(i915, ctx, e) {
 			igt_dynamic_f("%s", e->name)
-				independent(i915, e);
+				independent(i915, ctx, e);
 		}
 		igt_dynamic("all")
-			independent_all(i915);
+			independent_all(i915, ctx);
 	}
 
 	igt_subtest("libapi")
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
