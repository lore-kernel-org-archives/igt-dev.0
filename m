Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77A86E5B0
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 20:41:42 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id v3so9517684pgq.2
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 13:41:42 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 22 Mar 2021 15:41:23 -0500
Message-Id: <20210322204123.3331055-10-jason@jlekstrand.net>
In-Reply-To: <20210322204123.3331055-1-jason@jlekstrand.net>
References: <20210319223233.2982842-1-jason@jlekstrand.net>
 <20210322204123.3331055-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 9/9] lib/i915/gem_context: Implement VM and
 engine cloning manually (v2)
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

We're going to be deleting the CONTEXT_CLONE API since IGT is the only
userspace to ever use it.  There are only two bits of this API that IGT
uses in interesting ways so implement them as create params instead of
cloning.

v2 (Jason Ekstrand):
 - Fix our usage of the param struct for VM cloning
 - Handle the case of zero user engines properly
 - Assert that all cloned engines are physical, not virtual

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 lib/i915/gem_context.c         | 109 ++++++++++++++++++++++++++-------
 lib/i915/gem_context.h         |   7 ++-
 tests/i915/gem_ctx_shared.c    |  10 +--
 tests/i915/gem_exec_balancer.c |   2 +-
 tests/i915/gem_exec_schedule.c |   8 +--
 5 files changed, 103 insertions(+), 33 deletions(-)

diff --git a/lib/i915/gem_context.c b/lib/i915/gem_context.c
index 79411e10..ff018880 100644
--- a/lib/i915/gem_context.c
+++ b/lib/i915/gem_context.c
@@ -334,28 +334,96 @@ bool gem_context_has_persistence(int i915)
 	return __gem_context_get_param(i915, &param) == 0;
 }
 
+static void
+add_ctx_create_ext(struct drm_i915_gem_context_create_ext *ctx,
+		   struct i915_user_extension *ext)
+{
+	ext->next_extension = ctx->extensions;
+	ctx->extensions = to_user_pointer(ext);
+}
+
 int
 __gem_context_clone(int i915,
-		    uint32_t src, unsigned int share,
+		    uint32_t src, unsigned int clone,
 		    unsigned int flags,
 		    uint32_t *out)
 {
-	struct drm_i915_gem_context_create_ext_clone clone = {
-		{ .name = I915_CONTEXT_CREATE_EXT_CLONE },
-		.clone_id = src,
-		.flags = share,
-	};
-	struct drm_i915_gem_context_create_ext arg = {
+	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, I915_EXEC_RING_MASK + 1);
+	struct drm_i915_gem_context_create_ext_setparam engines_param, vm_param;
+	unsigned i, count;
+	int err;
+
+	struct drm_i915_gem_context_create_ext ctx_create = {
 		.flags = flags | I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
-		.extensions = to_user_pointer(&clone),
+		.extensions = 0,
 	};
-	int err;
 
-	err = create_ext_ioctl(i915, &arg);
+	if (clone & GEM_CONTEXT_CLONE_ENGINES) {
+		engines_param = (struct drm_i915_gem_context_create_ext_setparam) {
+			.base = {
+				.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
+			},
+			.param = {
+				.param = I915_CONTEXT_PARAM_ENGINES,
+				.size = sizeof(engines),
+				.value = to_user_pointer(&engines),
+			},
+		};
+
+		engines_param.param.ctx_id = src;
+		err = __gem_context_get_param(i915, &engines_param.param);
+		igt_assert_eq(err, 0);
+		if (err)
+			return err;
+
+		if (engines_param.param.size > 0) {
+			igt_assert(engines_param.param.size > sizeof(uint64_t));
+			count = (engines_param.param.size - sizeof(uint64_t)) /
+				sizeof(struct i915_engine_class_instance);
+
+			igt_debug("Cloning context with %u engines:\n", count);
+			for (i = 0; i < count; i++) {
+				igt_debug("    %d, %d\n",
+					  (int)(int16_t)engines.engines[i].engine_class,
+					  (int)(int16_t)engines.engines[i].engine_instance);
+				/* We can't clone virtual engines */
+				igt_assert((int16_t)engines.engines[i].engine_class >= 0);
+				igt_assert((int16_t)engines.engines[i].engine_instance >= 0);
+			}
+
+			engines_param.param.ctx_id = 0;
+			add_ctx_create_ext(&ctx_create, &engines_param.base);
+		}
+	}
+
+	if (clone & GEM_CONTEXT_CLONE_VM) {
+		vm_param = (struct drm_i915_gem_context_create_ext_setparam) {
+			.base = {
+				.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
+			},
+			.param = {
+				.param = I915_CONTEXT_PARAM_VM,
+			},
+		};
+
+		vm_param.param.ctx_id = src;
+		err = __gem_context_get_param(i915, &vm_param.param);
+		igt_assert_eq(err, 0);
+		if (err)
+			return err;
+
+		igt_debug("vm: %d\n", (int)vm_param.param.value);
+
+		vm_param.param.ctx_id = 0;
+		add_ctx_create_ext(&ctx_create, &vm_param.base);
+	}
+
+	err = create_ext_ioctl(i915, &ctx_create);
+	igt_assert_eq(err, 0);
 	if (err)
 		return err;
 
-	*out = arg.ctx_id;
+	*out = ctx_create.ctx_id;
 	return 0;
 }
 
@@ -373,23 +441,22 @@ static bool __gem_context_has(int i915, uint32_t share, unsigned int flags)
 
 bool gem_contexts_has_shared_gtt(int i915)
 {
-	return __gem_context_has(i915, I915_CONTEXT_CLONE_VM, 0);
+	return __gem_context_has(i915, GEM_CONTEXT_CLONE_VM, 0);
 }
 
 bool gem_has_queues(int i915)
 {
-	return __gem_context_has(i915,
-				 I915_CONTEXT_CLONE_VM,
+	return __gem_context_has(i915, GEM_CONTEXT_CLONE_VM,
 				 I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE);
 }
 
 uint32_t gem_context_clone(int i915,
-			   uint32_t src, unsigned int share,
+			   uint32_t src, unsigned int clone,
 			   unsigned int flags)
 {
 	uint32_t ctx;
 
-	igt_assert_eq(__gem_context_clone(i915, src, share, flags, &ctx), 0);
+	igt_assert_eq(__gem_context_clone(i915, src, clone, flags, &ctx), 0);
 
 	return ctx;
 }
@@ -426,15 +493,15 @@ uint32_t gem_context_clone_with_engines(int i915, uint32_t src)
 	if (!gem_has_context_clone(i915))
 		return gem_context_create(i915);
 	else
-		return gem_context_clone(i915, src, I915_CONTEXT_CLONE_ENGINES,
+		return gem_context_clone(i915, src, GEM_CONTEXT_CLONE_ENGINES,
 					 0);
 }
 
 uint32_t gem_queue_create(int i915)
 {
 	return gem_context_clone(i915, 0,
-				 I915_CONTEXT_CLONE_VM |
-				 I915_CONTEXT_CLONE_ENGINES,
+				 GEM_CONTEXT_CLONE_VM |
+				 GEM_CONTEXT_CLONE_ENGINES,
 				 I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE);
 }
 
@@ -448,8 +515,8 @@ uint32_t gem_queue_create(int i915)
 uint32_t gem_queue_clone_with_engines(int i915, uint32_t src)
 {
 	return gem_context_clone(i915, src,
-				 I915_CONTEXT_CLONE_ENGINES |
-				 I915_CONTEXT_CLONE_VM,
+				 GEM_CONTEXT_CLONE_ENGINES |
+				 GEM_CONTEXT_CLONE_VM,
 				 I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE);
 }
 
diff --git a/lib/i915/gem_context.h b/lib/i915/gem_context.h
index c2c2b827..e583ce09 100644
--- a/lib/i915/gem_context.h
+++ b/lib/i915/gem_context.h
@@ -37,12 +37,15 @@ int __gem_context_destroy(int fd, uint32_t ctx_id);
 uint32_t gem_context_create_for_engine(int fd, unsigned int class, unsigned int inst);
 uint32_t gem_context_create_for_class(int i915, unsigned int class, unsigned int *count);
 
+#define GEM_CONTEXT_CLONE_ENGINES (1 << 4)
+#define GEM_CONTEXT_CLONE_VM (1 << 5)
+
 int __gem_context_clone(int i915,
-			uint32_t src, unsigned int share,
+			uint32_t src, unsigned int clone,
 			unsigned int flags,
 			uint32_t *out);
 uint32_t gem_context_clone(int i915,
-			   uint32_t src, unsigned int share,
+			   uint32_t src, unsigned int clone,
 			   unsigned int flags);
 uint32_t gem_context_clone_with_engines(int i915, uint32_t src);
 void gem_context_copy_engines(int src_fd, uint32_t src,
diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
index 6b21994d..21b07083 100644
--- a/tests/i915/gem_ctx_shared.c
+++ b/tests/i915/gem_ctx_shared.c
@@ -82,7 +82,7 @@ static void create_shared_gtt(int i915, unsigned int flags)
 	igt_until_timeout(2) {
 		parent = flags & DETACHED ? child : 0;
 		child = gem_context_clone(i915,
-					  parent, I915_CONTEXT_CLONE_VM,
+					  parent, GEM_CONTEXT_CLONE_VM,
 					  0);
 		execbuf.rsvd1 = child;
 		gem_execbuf(i915, &execbuf);
@@ -98,7 +98,7 @@ static void create_shared_gtt(int i915, unsigned int flags)
 		execbuf.rsvd1 = parent;
 		igt_assert_eq(__gem_execbuf(i915, &execbuf), -ENOENT);
 		igt_assert_eq(__gem_context_clone(i915,
-						  parent, I915_CONTEXT_CLONE_VM,
+						  parent, GEM_CONTEXT_CLONE_VM,
 						  0, &parent), -ENOENT);
 	}
 	if (flags & DETACHED)
@@ -121,7 +121,7 @@ static void disjoint_timelines(int i915)
 	 * distinct timelines. A request queued to one context should be
 	 * independent of any shared contexts.
 	 */
-	child = gem_context_clone(i915, 0, I915_CONTEXT_CLONE_VM, 0);
+	child = gem_context_clone(i915, 0, GEM_CONTEXT_CLONE_VM, 0);
 	plug = igt_cork_plug(&cork, i915);
 
 	spin[0] = __igt_spin_new(i915, .ctx = 0, .dependency = plug);
@@ -161,7 +161,7 @@ static void exhaust_shared_gtt(int i915, unsigned int flags)
 		for (;;) {
 			parent = child;
 			err = __gem_context_clone(i915,
-						  parent, I915_CONTEXT_CLONE_VM,
+						  parent, GEM_CONTEXT_CLONE_VM,
 						  0, &child);
 			if (err)
 				break;
@@ -201,7 +201,7 @@ static void exec_shared_gtt(int i915, unsigned int ring)
 	int timeline;
 	int i;
 
-	clone = gem_context_clone(i915, 0, I915_CONTEXT_CLONE_VM, 0);
+	clone = gem_context_clone(i915, 0, GEM_CONTEXT_CLONE_VM, 0);
 
 	/* Find a hole big enough for both objects later */
 	scratch = gem_create(i915, 16384);
diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 19948ecb..5c0f52a6 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -627,7 +627,7 @@ static void bonded(int i915, unsigned int flags)
 		}
 
 		ctx = gem_context_clone(i915,
-					master, I915_CONTEXT_CLONE_VM,
+					master, GEM_CONTEXT_CLONE_VM,
 					I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE);
 		set_load_balancer(i915, ctx, siblings, count, &bonds[limit - 1]);
 
diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index 9585059d..aedcdf33 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -1183,8 +1183,8 @@ noreorder(int i915, unsigned int engine, int prio, unsigned int flags)
 		fence = igt_cork_plug(&cork, i915);
 
 	ctx = gem_context_clone(i915, execbuf.rsvd1,
-			      I915_CONTEXT_CLONE_ENGINES |
-			      I915_CONTEXT_CLONE_VM,
+			      GEM_CONTEXT_CLONE_ENGINES |
+			      GEM_CONTEXT_CLONE_VM,
 			      0);
 	spin = igt_spin_new(i915, ctx,
 			    .engine = engine,
@@ -2428,9 +2428,9 @@ static void *iova_thread(struct ufd_thread *t, int prio)
 	unsigned int clone;
 	uint32_t ctx;
 
-	clone = I915_CONTEXT_CLONE_ENGINES;
+	clone = GEM_CONTEXT_CLONE_ENGINES;
 	if (t->flags & SHARED)
-		clone |= I915_CONTEXT_CLONE_VM;
+		clone |= GEM_CONTEXT_CLONE_VM;
 
 	ctx = gem_context_clone(t->i915, 0, clone, 0);
 	gem_context_set_priority(t->i915, ctx, prio);
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
