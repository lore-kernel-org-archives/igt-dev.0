Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E737F6EAD9
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 19:13:39 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id p2so2101655pgh.4
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 12:13:39 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 15 Apr 2021 14:11:42 -0500
Message-Id: <20210415191145.2137858-72-jason@jlekstrand.net>
In-Reply-To: <20210415191145.2137858-1-jason@jlekstrand.net>
References: <20210415191145.2137858-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 71/74] lib/i915/gem_context: Delete all the
 context clone/copy stuff
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

---
 lib/i915/gem_context.c | 149 -----------------------------------------
 lib/i915/gem_context.h |  16 -----
 2 files changed, 165 deletions(-)

diff --git a/lib/i915/gem_context.c b/lib/i915/gem_context.c
index 49ed7120..b4bf7ef6 100644
--- a/lib/i915/gem_context.c
+++ b/lib/i915/gem_context.c
@@ -391,125 +391,6 @@ bool gem_context_has_persistence(int i915)
 	return __gem_context_get_param(i915, &param) == 0;
 }
 
-int
-__gem_context_clone(int i915,
-		    uint32_t src, unsigned int share,
-		    unsigned int flags,
-		    uint32_t *out)
-{
-	struct drm_i915_gem_context_create_ext_clone clone = {
-		{ .name = I915_CONTEXT_CREATE_EXT_CLONE },
-		.clone_id = src,
-		.flags = share,
-	};
-	struct drm_i915_gem_context_create_ext arg = {
-		.flags = flags | I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
-		.extensions = to_user_pointer(&clone),
-	};
-	int err;
-
-	err = create_ext_ioctl(i915, &arg);
-	if (err)
-		return err;
-
-	*out = arg.ctx_id;
-	return 0;
-}
-
-static bool __gem_context_has(int i915, uint32_t share, unsigned int flags)
-{
-	uint32_t ctx = 0;
-
-	__gem_context_clone(i915, 0, share, flags, &ctx);
-	if (ctx)
-		gem_context_destroy(i915, ctx);
-
-	errno = 0;
-	return ctx;
-}
-
-bool gem_contexts_has_shared_gtt(int i915)
-{
-	return __gem_context_has(i915, I915_CONTEXT_CLONE_VM, 0);
-}
-
-bool gem_has_queues(int i915)
-{
-	return __gem_context_has(i915,
-				 I915_CONTEXT_CLONE_VM,
-				 I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE);
-}
-
-uint32_t gem_context_clone(int i915,
-			   uint32_t src, unsigned int share,
-			   unsigned int flags)
-{
-	uint32_t ctx;
-
-	igt_assert_eq(__gem_context_clone(i915, src, share, flags, &ctx), 0);
-
-	return ctx;
-}
-
-bool gem_has_context_clone(int i915)
-{
-	struct drm_i915_gem_context_create_ext_clone ext = {
-		{ .name = I915_CONTEXT_CREATE_EXT_CLONE },
-		.clone_id = -1,
-	};
-	struct drm_i915_gem_context_create_ext create = {
-		.flags = I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
-		.extensions = to_user_pointer(&ext),
-	};
-
-	return create_ext_ioctl(i915, &create) == -ENOENT;
-}
-
-/**
- * gem_context_clone_with_engines:
- * @i915: open i915 drm file descriptor
- * @src: i915 context id
- *
- * Special purpose wrapper to create a new context by cloning engines from @src.
- *
- * In can be called regardless of whether the kernel supports context cloning.
- *
- * Intended purpose is to use for creating contexts against which work will be
- * submitted and the engine index came from external source, derived from a
- * default context potentially configured with an engine map.
- */
-uint32_t gem_context_clone_with_engines(int i915, uint32_t src)
-{
-	if (!gem_has_context_clone(i915))
-		return gem_context_create(i915);
-	else
-		return gem_context_clone(i915, src, I915_CONTEXT_CLONE_ENGINES,
-					 0);
-}
-
-uint32_t gem_queue_create(int i915)
-{
-	return gem_context_clone(i915, 0,
-				 I915_CONTEXT_CLONE_VM |
-				 I915_CONTEXT_CLONE_ENGINES,
-				 I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE);
-}
-
-/**
- * gem_queue_clone_with_engines:
- * @i915: open i915 drm file descriptor
- * @src: i915 context id
- *
- * See gem_context_clone_with_engines.
- */
-uint32_t gem_queue_clone_with_engines(int i915, uint32_t src)
-{
-	return gem_context_clone(i915, src,
-				 I915_CONTEXT_CLONE_ENGINES |
-				 I915_CONTEXT_CLONE_VM,
-				 I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE);
-}
-
 bool gem_context_has_engine(int fd, uint32_t ctx, uint64_t engine)
 {
 	struct drm_i915_gem_exec_object2 exec = {};
@@ -535,36 +416,6 @@ bool gem_context_has_engine(int fd, uint32_t ctx, uint64_t engine)
 	return __gem_execbuf(fd, &execbuf) == -ENOENT;
 }
 
-/**
- * gem_context_copy_engines:
- * @src_fd: open i915 drm file descriptor where @src context belongs to
- * @src: source engine map context id
- * @dst_fd: open i915 drm file descriptor where @dst context belongs to
- * @dst: destination engine map context id
- *
- * Special purpose helper for copying engine map from one context to another.
- *
- * In can be called regardless of whether the kernel supports context engine
- * maps and is a no-op if not supported.
- */
-void
-gem_context_copy_engines(int src_fd, uint32_t src, int dst_fd, uint32_t dst)
-{
-	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, I915_EXEC_RING_MASK + 1);
-	struct drm_i915_gem_context_param param = {
-		.param = I915_CONTEXT_PARAM_ENGINES,
-		.ctx_id = src,
-		.size = sizeof(engines),
-		.value = to_user_pointer(&engines),
-	};
-
-	if (__gem_context_get_param(src_fd, &param))
-		return;
-
-	param.ctx_id = dst;
-	gem_context_set_param(dst_fd, &param);
-}
-
 uint32_t gem_context_create_for_engine(int i915, unsigned int class, unsigned int inst)
 {
 	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, 1) = {
diff --git a/lib/i915/gem_context.h b/lib/i915/gem_context.h
index 91bb9e7f..1ba405ca 100644
--- a/lib/i915/gem_context.h
+++ b/lib/i915/gem_context.h
@@ -40,20 +40,6 @@ int __gem_context_destroy(int fd, uint32_t ctx_id);
 uint32_t gem_context_create_for_engine(int fd, unsigned int class, unsigned int inst);
 uint32_t gem_context_create_for_class(int i915, unsigned int class, unsigned int *count);
 
-int __gem_context_clone(int i915,
-			uint32_t src, unsigned int share,
-			unsigned int flags,
-			uint32_t *out);
-uint32_t gem_context_clone(int i915,
-			   uint32_t src, unsigned int share,
-			   unsigned int flags);
-uint32_t gem_context_clone_with_engines(int i915, uint32_t src);
-void gem_context_copy_engines(int src_fd, uint32_t src,
-			      int dst_fd, uint32_t dst);
-
-uint32_t gem_queue_create(int i915);
-uint32_t gem_queue_clone_with_engines(int i915, uint32_t src);
-
 bool gem_contexts_has_shared_gtt(int i915);
 bool gem_has_queues(int i915);
 
@@ -62,8 +48,6 @@ void gem_require_contexts(int fd);
 void gem_context_require_bannable(int fd);
 void gem_context_require_param(int fd, uint64_t param);
 
-bool gem_has_context_clone(int i915);
-
 void gem_context_get_param(int fd, struct drm_i915_gem_context_param *p);
 void gem_context_set_param(int fd, struct drm_i915_gem_context_param *p);
 int __gem_context_set_param(int fd, struct drm_i915_gem_context_param *p);
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
