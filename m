Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A741D6EAD5
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 19:13:33 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id w8so13239479pfn.9
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 12:13:33 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 15 Apr 2021 14:11:38 -0500
Message-Id: <20210415191145.2137858-68-jason@jlekstrand.net>
In-Reply-To: <20210415191145.2137858-1-jason@jlekstrand.net>
References: <20210415191145.2137858-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 67/74] tests/i915/gem_ctx_engines: Rework
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
---
 tests/i915/gem_ctx_engines.c | 53 +++++++++++++-----------------------
 1 file changed, 19 insertions(+), 34 deletions(-)

diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index 058b2cc2..be9671dd 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -318,7 +318,6 @@ static void execute_one(int i915)
 {
 	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, I915_EXEC_RING_MASK + 1);
 	struct drm_i915_gem_context_param param = {
-		.ctx_id = gem_context_create(i915),
 		.param = I915_CONTEXT_PARAM_ENGINES,
 		.value = to_user_pointer(&engines),
 		/* .size to be filled in later */
@@ -329,28 +328,13 @@ static void execute_one(int i915)
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
@@ -359,19 +343,26 @@ static void execute_one(int i915)
 		igt_debug("Testing [%s...]\n", e->name);
 
 		for (int i = -1; i <= I915_EXEC_RING_MASK; i++) {
+			igt_spin_t *spin;
+
 			memset(&engines, 0, sizeof(engines));
 			engine_class(&engines, 0) = e->class;
 			engine_instance(&engines, 0) = e->instance;
 			param.size = offsetof(typeof(engines), engines[1]);
+			param.ctx_id = gem_context_create(i915);
 			gem_context_set_param(i915, &param);
 
-			gem_sync(i915, spin->handle);
-			igt_spin_reset(spin);
-			gem_execbuf(i915, &spin->execbuf);
+			spin = igt_spin_new(i915, .ctx_id = param.ctx_id,
+					    .flags = (IGT_SPIN_NO_PREEMPTION |
+						      IGT_SPIN_POLL_RUN));
 
 			do_ioctl(i915, DRM_IOCTL_I915_GEM_BUSY, &busy);
 			igt_assert_eq(busy.busy, 0);
 
+			/* Create a new context with a lot of engines */
+			gem_context_destroy(i915, param.ctx_id);
+			param.ctx_id = gem_context_create(i915);
+
 			igt_debug("Testing with map of %d engines\n", i + 1);
 			memset(&engines.engines, -1, sizeof(engines.engines));
 			if (i != -1) {
@@ -385,6 +376,7 @@ static void execute_one(int i915)
 			for (int j = 0; j <= I915_EXEC_RING_MASK; j++) {
 				int expected = j == i ? 0 : -EINVAL;
 
+				execbuf.rsvd1 = param.ctx_id;
 				execbuf.flags = j;
 				igt_assert_f(__gem_execbuf(i915, &execbuf) == expected,
 					     "Failed to report the %s engine for slot %d (valid at %d)\n",
@@ -395,38 +387,31 @@ static void execute_one(int i915)
 			igt_assert_eq(batch_busy(busy.busy),
 				      i != -1 ? 1 << e->class : 0);
 
-			igt_spin_end(spin);
+			igt_spin_free(i915, spin);
 
 			gem_sync(i915, obj.handle);
+			gem_context_destroy(i915, param.ctx_id);
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
@@ -448,9 +433,9 @@ static void execute_oneforall(int i915)
 
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
