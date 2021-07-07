Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC046E182
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 14:47:03 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id y4so3930pgl.10
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jul 2021 07:47:03 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  7 Jul 2021 09:46:19 -0500
Message-Id: <20210707144643.181001-8-jason@jlekstrand.net>
In-Reply-To: <20210707144337.180693-1-jason@jlekstrand.net>
References: <20210707144337.180693-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 57/81] tests/i915/gem_ctx_engines: Rework
 execute-one*
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

Instead of switching out the set of engines constantly, create a new
context for every set of engines.  This means, among other things, that
there's no point in testing whether or not the context is in a "default"
because there's no more resetting it.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_ctx_engines.c | 79 +++++++++++++-----------------------
 1 file changed, 28 insertions(+), 51 deletions(-)

diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index f03e31532..ac03206ce 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -317,41 +317,19 @@ static void none(int i915)
 
 static void execute_one(int i915)
 {
-	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, I915_EXEC_RING_MASK + 1);
-	struct drm_i915_gem_context_param param = {
-		.ctx_id = gem_context_create(i915),
-		.param = I915_CONTEXT_PARAM_ENGINES,
-		.value = to_user_pointer(&engines),
-		/* .size to be filled in later */
-	};
 	struct drm_i915_gem_exec_object2 obj = {
 		.handle = gem_create(i915, 4096),
 	};
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&obj),
 		.buffer_count = 1,
-		.rsvd1 = param.ctx_id,
 	};
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	const struct intel_execution_engine2 *e;
-	igt_spin_t *spin;
-
-	/* Prewarm the spinner */
-	spin = igt_spin_new(i915, .ctx_id = param.ctx_id,
-			    .flags = (IGT_SPIN_NO_PREEMPTION |
-				      IGT_SPIN_POLL_RUN));
 
 	gem_write(i915, obj.handle, 0, &bbe, sizeof(bbe));
 
-	/* Unadulterated I915_EXEC_DEFAULT should work */
-	execbuf.flags = 0;
-	gem_execbuf(i915, &execbuf);
-	obj.flags |= EXEC_OBJECT_PINNED;
-
-	igt_spin_end(spin);
-	gem_sync(i915, obj.handle);
-
-	__for_each_physical_engine(i915, e) {
+	for_each_physical_engine(i915, e) {
 		struct drm_i915_gem_busy busy = { .handle = obj.handle };
 
 		if (!gem_class_can_store_dword(i915, e->class))
@@ -360,32 +338,38 @@ static void execute_one(int i915)
 		igt_debug("Testing [%s...]\n", e->name);
 
 		for (int i = -1; i <= I915_EXEC_RING_MASK; i++) {
-			memset(&engines, 0, sizeof(engines));
-			engine_class(&engines, 0) = e->class;
-			engine_instance(&engines, 0) = e->instance;
-			param.size = offsetof(typeof(engines), engines[1]);
-			gem_context_set_param(i915, &param);
-
-			gem_sync(i915, spin->handle);
-			igt_spin_reset(spin);
-			gem_execbuf(i915, &spin->execbuf);
+			intel_ctx_cfg_t cfg = {};
+			const intel_ctx_t *ctx;
+			igt_spin_t *spin;
+
+			cfg.num_engines = 1;
+			cfg.engines[0].engine_class = e->class;
+			cfg.engines[0].engine_instance = e->instance;
+			ctx = intel_ctx_create(i915, &cfg);
+
+			spin = igt_spin_new(i915, .ctx = ctx,
+					    .flags = (IGT_SPIN_NO_PREEMPTION |
+						      IGT_SPIN_POLL_RUN));
 
 			do_ioctl(i915, DRM_IOCTL_I915_GEM_BUSY, &busy);
 			igt_assert_eq(busy.busy, 0);
+			intel_ctx_destroy(i915, ctx);
 
+			/* Create a new context with a lot of engines */
 			igt_debug("Testing with map of %d engines\n", i + 1);
-			memset(&engines.engines, -1, sizeof(engines.engines));
+			memset(cfg.engines, -1, sizeof(cfg.engines));
 			if (i != -1) {
-				engine_class(&engines, i) = e->class;
-				engine_instance(&engines, i) = e->instance;
+				cfg.engines[i].engine_class = e->class;
+				cfg.engines[i].engine_instance = e->instance;
 			}
-			param.size = sizeof(uint64_t) + (i + 1) * sizeof(uint32_t);
-			gem_context_set_param(i915, &param);
+			cfg.num_engines = GEM_MAX_ENGINES;
+			ctx = intel_ctx_create(i915, &cfg);
 
 			igt_spin_busywait_until_started(spin);
 			for (int j = 0; j <= I915_EXEC_RING_MASK; j++) {
 				int expected = j == i ? 0 : -EINVAL;
 
+				execbuf.rsvd1 = ctx->id;
 				execbuf.flags = j;
 				igt_assert_f(__gem_execbuf(i915, &execbuf) == expected,
 					     "Failed to report the %s engine for slot %d (valid at %d)\n",
@@ -396,38 +380,31 @@ static void execute_one(int i915)
 			igt_assert_eq(batch_busy(busy.busy),
 				      i != -1 ? 1 << e->class : 0);
 
-			igt_spin_end(spin);
+			igt_spin_free(i915, spin);
 
 			gem_sync(i915, obj.handle);
+			intel_ctx_destroy(i915, ctx);
 			do_ioctl(i915, DRM_IOCTL_I915_GEM_BUSY, &busy);
 			igt_assert_eq(busy.busy, 0);
 		}
 	}
 
-	/* Restore the defaults and check I915_EXEC_DEFAULT works again. */
-	param.size = 0;
-	gem_context_set_param(i915, &param);
-	execbuf.flags = 0;
-	gem_execbuf(i915, &execbuf);
-
-	igt_spin_free(i915, spin);
-
 	gem_close(i915, obj.handle);
-	gem_context_destroy(i915, param.ctx_id);
 }
 
 static void execute_oneforall(int i915)
 {
 	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, I915_EXEC_RING_MASK + 1);
 	struct drm_i915_gem_context_param param = {
-		.ctx_id = gem_context_create(i915),
 		.param = I915_CONTEXT_PARAM_ENGINES,
 		.value = to_user_pointer(&engines),
 		.size = sizeof(engines),
 	};
 	const struct intel_execution_engine2 *e;
 
-	__for_each_physical_engine(i915, e) {
+	for_each_physical_engine(i915, e) {
+		param.ctx_id = gem_context_create(i915);
+
 		memset(&engines, 0, sizeof(engines));
 		for (int i = 0; i <= I915_EXEC_RING_MASK; i++) {
 			engine_class(&engines, i) = e->class;
@@ -449,9 +426,9 @@ static void execute_oneforall(int i915)
 
 			igt_spin_free(i915, spin);
 		}
-	}
 
-	gem_context_destroy(i915, param.ctx_id);
+		gem_context_destroy(i915, param.ctx_id);
+	}
 }
 
 static void execute_allforone(int i915)
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
