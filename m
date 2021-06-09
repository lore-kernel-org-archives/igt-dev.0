Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB2D6EC7A
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:33:05 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 md2-20020a17090b23c2b029016de4440381so632249pjb.1
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:33:05 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:32:16 -0500
Message-Id: <20210609043259.102581-1-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 50/93] tests/i915/gem_watchdog: Convert to
 intel_ctx_t
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
 tests/i915/gem_watchdog.c | 169 +++++++++++---------------------------
 1 file changed, 46 insertions(+), 123 deletions(-)

diff --git a/tests/i915/gem_watchdog.c b/tests/i915/gem_watchdog.c
index 2443d5c5..24144dfe 100644
--- a/tests/i915/gem_watchdog.c
+++ b/tests/i915/gem_watchdog.c
@@ -31,36 +31,13 @@
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
+#include "i915/gem_vm.h"
 #include "igt.h"
 #include "igt_params.h"
 #include "sw_sync.h"
 
 #define EWATCHDOG EINTR
 
-static struct drm_i915_query_engine_info *__engines__;
-
-static int __i915_query(int fd, struct drm_i915_query *q)
-{
-	if (igt_ioctl(fd, DRM_IOCTL_I915_QUERY, q))
-		return -errno;
-	return 0;
-}
-
-static int
-__i915_query_items(int fd, struct drm_i915_query_item *items, uint32_t n_items)
-{
-	struct drm_i915_query q = {
-		.num_items = n_items,
-		.items_ptr = to_user_pointer(items),
-	};
-	return __i915_query(fd, &q);
-}
-
-#define i915_query_items(fd, items, n_items) do { \
-		igt_assert_eq(__i915_query_items(fd, items, n_items), 0); \
-		errno = 0; \
-	} while (0)
-
 static unsigned int default_timeout_wait_s;
 static const unsigned int watchdog_us = 500 * 1000;
 
@@ -128,56 +105,43 @@ static unsigned int spin_flags(void)
 	return IGT_SPIN_POLL_RUN | IGT_SPIN_FENCE_OUT;
 }
 
-static void physical(int i915)
+static void physical(int i915, const intel_ctx_t *ctx)
 {
 	const unsigned int wait_us = default_timeout_wait_s * USEC_PER_SEC;
-	unsigned int num_engines = __engines__->num_engines, i, count;
+	unsigned int num_engines, i, count;
 	const struct intel_execution_engine2 *e;
-	unsigned int expect = num_engines;
-	igt_spin_t *spin[num_engines];
+	igt_spin_t *spin[GEM_MAX_ENGINES];
 
 	i = 0;
-	__for_each_physical_engine(i915, e) {
-		spin[i] = igt_spin_new(i915,
+	for_each_ctx_engine(i915, ctx, e) {
+		spin[i] = igt_spin_new(i915, .ctx = ctx,
 				       .engine = e->flags,
 				       .flags = spin_flags());
 		i++;
 	}
+	num_engines = i;
 
-	count = wait_timeout(i915, spin, num_engines, wait_us, expect);
+	count = wait_timeout(i915, spin, num_engines, wait_us, num_engines);
 
 	for (i = 0; i < num_engines; i++)
 		igt_spin_free(i915, spin[i]);
 
-	igt_assert_eq(count, expect);
+	igt_assert_eq(count, num_engines);
 }
 
 static struct i915_engine_class_instance *
-list_engines(unsigned int class, unsigned int *out)
+list_engines(const intel_ctx_cfg_t *cfg,
+	     unsigned int class, unsigned int *out)
 {
 	struct i915_engine_class_instance *ci;
-	unsigned int count = 0, size = 64, i;
+	unsigned int count = 0, i;
 
-	ci = malloc(size * sizeof(*ci));
+	ci = malloc(cfg->num_engines * sizeof(*ci));
 	igt_assert(ci);
 
-	for (i = 0; i < __engines__->num_engines; i++) {
-		struct drm_i915_engine_info *engine =
-			(struct drm_i915_engine_info *)&__engines__->engines[i];
-
-		if (class != engine->engine.engine_class)
-			continue;
-
-		if (count == size) {
-			size *= 2;
-			ci = realloc(ci, size * sizeof(*ci));
-			igt_assert(ci);
-		}
-
-		ci[count++] = (struct i915_engine_class_instance){
-			.engine_class = class,
-			.engine_instance = engine->engine.engine_instance,
-		};
+	for (i = 0; i < cfg->num_engines; i++) {
+		if (class == cfg->engines[i].engine_class)
+			ci[count++] = cfg->engines[i];
 	}
 
 	if (!count) {
@@ -244,49 +208,27 @@ static void set_load_balancer(int i915, uint32_t ctx,
 	igt_assert_eq(__set_load_balancer(i915, ctx, ci, count, ext), 0);
 }
 
-static void ctx_set_vm(int i915, uint32_t ctx, uint32_t vm)
-{
-	struct drm_i915_gem_context_param arg = {
-		.param = I915_CONTEXT_PARAM_VM,
-		.ctx_id = ctx,
-		.value = vm,
-	};
-
-	gem_context_set_param(i915, &arg);
-}
-
-static uint32_t ctx_get_vm(int i915, uint32_t ctx)
-{
-        struct drm_i915_gem_context_param arg;
-
-        memset(&arg, 0, sizeof(arg));
-        arg.param = I915_CONTEXT_PARAM_VM;
-        arg.ctx_id = ctx;
-        gem_context_get_param(i915, &arg);
-        igt_assert(arg.value);
-
-        return arg.value;
-}
-
-static void virtual(int i915)
+static void virtual(int i915, const intel_ctx_cfg_t *base_cfg)
 {
 	const unsigned int wait_us = default_timeout_wait_s * USEC_PER_SEC;
-	unsigned int num_engines = __engines__->num_engines, i, count;
+	unsigned int num_engines = base_cfg->num_engines, i, count;
 	igt_spin_t *spin[num_engines];
 	unsigned int expect = num_engines;
-	uint32_t ctx[num_engines];
-	uint32_t vm;
+	intel_ctx_cfg_t cfg = *base_cfg;
+	const intel_ctx_t *ctx[num_engines];
 
 	igt_require(gem_has_execlists(i915));
 
 	igt_debug("%u virtual engines\n", num_engines);
 	igt_require(num_engines);
 
+	cfg.vm = gem_vm_create(i915);
+
 	i = 0;
 	for (int class = 0; class < 32; class++) {
 		struct i915_engine_class_instance *ci;
 
-		ci = list_engines(class, &count);
+		ci = list_engines(base_cfg, class, &count);
 		if (!ci)
 			continue;
 
@@ -296,17 +238,12 @@ static void virtual(int i915)
 
 			igt_assert(i < num_engines);
 
-			ctx[i] = gem_context_create(i915);
+			ctx[i] = intel_ctx_create(i915, &cfg);
 
-			if (!i)
-				vm = ctx_get_vm(i915, ctx[i]);
-			else
-				ctx_set_vm(i915, ctx[i], vm);
-
-			set_load_balancer(i915, ctx[i], ci, count, NULL);
+			set_load_balancer(i915, ctx[i]->id, ci, count, NULL);
 
 			spin[i] = igt_spin_new(i915,
-					       .ctx_id = ctx[i],
+					       .ctx = ctx[i],
 					       .flags = spin_flags());
 			i++;
 		}
@@ -317,8 +254,8 @@ static void virtual(int i915)
 	count = wait_timeout(i915, spin, num_engines, wait_us, expect);
 
 	for (i = 0; i < num_engines && spin[i]; i++) {
-		gem_context_destroy(i915, ctx[i]);
 		igt_spin_free(i915, spin[i]);
+		intel_ctx_destroy(i915, ctx[i]);
 	}
 
 	igt_assert_eq(count, expect);
@@ -499,17 +436,6 @@ delay_create(int i915, uint32_t ctx,
 	return obj;
 }
 
-static uint32_t vm_clone(int i915)
-{
-	uint32_t ctx = 0;
-	__gem_context_clone(i915, 0,
-			    I915_CONTEXT_CLONE_VM |
-			    I915_CONTEXT_CLONE_ENGINES,
-			    I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE,
-			    &ctx);
-	return ctx;
-}
-
 static int __execbuf(int i915, struct drm_i915_gem_execbuffer2 *execbuf)
 {
 	int err;
@@ -526,6 +452,7 @@ static int __execbuf(int i915, struct drm_i915_gem_execbuffer2 *execbuf)
 
 static uint32_t
 far_delay(int i915, unsigned long delay, unsigned int target,
+	  const intel_ctx_t *ctx,
 	  const struct intel_execution_engine2 *e, int *fence)
 {
 	struct drm_i915_gem_exec_object2 obj = delay_create(i915, 0, e, delay);
@@ -540,6 +467,7 @@ far_delay(int i915, unsigned long delay, unsigned int target,
 		.buffer_count = 2,
 		.flags = e->flags,
 	};
+	intel_ctx_cfg_t cfg = ctx->cfg;
 	uint32_t handle = gem_create(i915, 4096);
 	unsigned long count, submit;
 
@@ -552,23 +480,27 @@ far_delay(int i915, unsigned long delay, unsigned int target,
 	submit *= NSEC_PER_SEC;
 	submit /= 2 * delay;
 
+	if (gem_has_vm(i915))
+		cfg.vm = gem_vm_create(i915);
+
 	/*
 	 * Submit a few long chains of individually short pieces of work
 	 * against a shared object.
 	 */
 	for (count = 0; count < submit;) {
-		execbuf.rsvd1 = vm_clone(i915);
+		const intel_ctx_t *tmp_ctx = intel_ctx_create(i915, &cfg);
+		execbuf.rsvd1 = tmp_ctx->id;
 		if (!execbuf.rsvd1)
 			break;
 
 		batch[1] = obj;
 		while (__execbuf(i915, &execbuf) == 0)
 			count++;
-		gem_context_destroy(i915, execbuf.rsvd1);
+		intel_ctx_destroy(i915, tmp_ctx);
 	}
 
 	execbuf.flags |= I915_EXEC_FENCE_OUT;
-	execbuf.rsvd1 = 0;
+	execbuf.rsvd1 = ctx->id;
 	batch[1] = batch[0];
 	batch[1].flags &= ~EXEC_OBJECT_WRITE;
 	batch[0].handle = handle;
@@ -584,11 +516,12 @@ far_delay(int i915, unsigned long delay, unsigned int target,
 }
 
 static void
-far_fence(int i915, int timeout, const struct intel_execution_engine2 *e)
+far_fence(int i915, int timeout, const intel_ctx_t *ctx,
+	  const struct intel_execution_engine2 *e)
 {
 	int fence = -1;
 	uint32_t handle =
-		far_delay(i915, NSEC_PER_SEC / 250, timeout, e, &fence);
+		far_delay(i915, NSEC_PER_SEC / 250, timeout, ctx, e, &fence);
 
 	gem_close(i915, handle);
 
@@ -627,10 +560,10 @@ far_fence(int i915, int timeout, const struct intel_execution_engine2 *e)
 igt_main
 {
 	const struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx;
 	int i915 = -1;
 
 	igt_fixture {
-		struct drm_i915_query_item item;
 		char *tmp;
 
 		i915 = drm_open_driver_master(DRIVER_INTEL);
@@ -652,32 +585,22 @@ igt_main
 		}
 
 		i915 = gem_reopen_driver(i915); /* Apply modparam. */
-
-		__engines__ = malloc(4096);
-		igt_assert(__engines__);
-		memset(__engines__, 0, 4096);
-		memset(&item, 0, sizeof(item));
-		item.query_id = DRM_I915_QUERY_ENGINE_INFO;
-		item.data_ptr = to_user_pointer(__engines__);
-		item.length = 4096;
-		i915_query_items(i915, &item, 1);
-		igt_assert(item.length >= 0);
-		igt_assert(item.length <= 4096);
-		igt_assert(__engines__->num_engines > 0);
+		ctx = intel_ctx_create_all_physical(i915);
 	}
 
 	igt_subtest_group {
 		igt_subtest("default-physical")
-			physical(i915);
+			physical(i915, ctx);
 
 		igt_subtest("default-virtual")
-			virtual(i915);
+			virtual(i915, &ctx->cfg);
 	}
 
 	igt_subtest_with_dynamic("far-fence") {
-		__for_each_physical_engine(i915, e) {
+		for_each_ctx_engine(i915, ctx, e) {
 			igt_dynamic_f("%s", e->name)
-				far_fence(i915, default_timeout_wait_s * 3, e);
+				far_fence(i915, default_timeout_wait_s * 3,
+					  ctx, e);
 		}
 	}
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
