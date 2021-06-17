Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57996E997
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 19:16:05 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 fy24-20020a17090b0218b029016c5a59021fso6708157pjb.0
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 12:16:05 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 17 Jun 2021 14:15:14 -0500
Message-Id: <20210617191516.577394-28-jason@jlekstrand.net>
In-Reply-To: <20210617191256.577244-1-jason@jlekstrand.net>
References: <20210617191256.577244-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 77/79] tests/i915/gem_ctx_engines: Fix the
 invalid subtest for the new rules
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

Since we no longer allow setting engines multiple times on one context,
we need to create a new context every time.  We've also got more invalid
cases that need testing.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_ctx_engines.c | 88 ++++++++++++++++++++++++------------
 1 file changed, 58 insertions(+), 30 deletions(-)

diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index bd622b0e5..bfa83f7e5 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -46,31 +46,44 @@
 #define engine_class(e, n) ((e)->engines[(n)].engine_class)
 #define engine_instance(e, n) ((e)->engines[(n)].engine_instance)
 
+static int
+__set_param_fresh_context(int i915, struct drm_i915_gem_context_param param)
+{
+	int err;
+
+	igt_assert_eq(param.ctx_id, 0);
+	param.ctx_id = gem_context_create(i915);
+	err = __gem_context_set_param(i915, &param);
+	gem_context_destroy(i915, param.ctx_id);
+
+	return err;
+}
+
 static void invalid_engines(int i915)
 {
 	struct i915_context_param_engines stack = {}, *engines;
 	struct drm_i915_gem_context_param param = {
-		.ctx_id = gem_context_create(i915),
 		.param = I915_CONTEXT_PARAM_ENGINES,
 		.value = to_user_pointer(&stack),
 	};
 	uint32_t handle;
+	igt_spin_t *spin;
 	void *ptr;
 
 	param.size = 0;
-	igt_assert_eq(__gem_context_set_param(i915, &param), 0);
+	igt_assert_eq(__set_param_fresh_context(i915, param), -EINVAL);
 
 	param.size = 1;
-	igt_assert_eq(__gem_context_set_param(i915, &param), -EINVAL);
+	igt_assert_eq(__set_param_fresh_context(i915, param), -EINVAL);
 
 	param.size = sizeof(stack) - 1;
-	igt_assert_eq(__gem_context_set_param(i915, &param), -EINVAL);
+	igt_assert_eq(__set_param_fresh_context(i915, param), -EINVAL);
 
 	param.size = sizeof(stack) + 1;
-	igt_assert_eq(__gem_context_set_param(i915, &param), -EINVAL);
+	igt_assert_eq(__set_param_fresh_context(i915, param), -EINVAL);
 
-	param.size = 0;
-	igt_assert_eq(__gem_context_set_param(i915, &param), 0);
+	param.size = sizeof(*engines) + (I915_EXEC_RING_MASK + 2) * sizeof(*engines->engines);
+	igt_assert_eq(__set_param_fresh_context(i915, param), -EINVAL);
 
 	/* Create a single page surrounded by inaccessible nothingness */
 	ptr = mmap(NULL, 3 * 4096, PROT_WRITE, MAP_ANON | MAP_PRIVATE, -1, 0);
@@ -84,57 +97,57 @@ static void invalid_engines(int i915)
 	param.value = to_user_pointer(engines);
 
 	engines->engines[0].engine_class = -1;
-	igt_assert_eq(__gem_context_set_param(i915, &param), -ENOENT);
+	igt_assert_eq(__set_param_fresh_context(i915, param), -ENOENT);
 
 	mprotect(engines, 4096, PROT_READ);
-	igt_assert_eq(__gem_context_set_param(i915, &param), -ENOENT);
+	igt_assert_eq(__set_param_fresh_context(i915, param), -ENOENT);
 
 	mprotect(engines, 4096, PROT_WRITE);
 	engines->engines[0].engine_class = 0;
-	if (__gem_context_set_param(i915, &param)) /* XXX needs RCS */
+	if (__set_param_fresh_context(i915, param)) /* XXX needs RCS */
 		goto out;
 
 	engines->extensions = to_user_pointer(ptr);
-	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
 
 	engines->extensions = 0;
-	igt_assert_eq(__gem_context_set_param(i915, &param), 0);
+	igt_assert_eq(__set_param_fresh_context(i915, param), 0);
 
 	param.value = to_user_pointer(engines - 1);
-	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
 
 	param.value = to_user_pointer(engines) - 1;
-	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
 
 	param.value = to_user_pointer(engines) - param.size +  1;
-	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
 
 	param.value = to_user_pointer(engines) + 4096;
-	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
 
 	param.value = to_user_pointer(engines) - param.size + 4096;
-	igt_assert_eq(__gem_context_set_param(i915, &param), 0);
+	igt_assert_eq(__set_param_fresh_context(i915, param), 0);
 
 	param.value = to_user_pointer(engines) - param.size + 4096 + 1;
-	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
 
 	param.value = to_user_pointer(engines) + 4096;
-	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
 
 	param.value = to_user_pointer(engines) + 4096 - 1;
-	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
 
 	param.value = to_user_pointer(engines) - 1;
-	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
 
 	param.value = to_user_pointer(engines - 1);
-	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
 
 	param.value = to_user_pointer(engines - 1) + 4096;
-	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
 
 	param.value = to_user_pointer(engines - 1) + 4096 - sizeof(*engines->engines) / 2;
-	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
 
 	handle = gem_create(i915, 4096 * 3);
 	ptr = gem_mmap__device_coherent(i915, handle, 0, 4096 * 3, PROT_READ);
@@ -144,25 +157,40 @@ static void invalid_engines(int i915)
 	munmap(ptr + 8192, 4096);
 
 	param.value = to_user_pointer(ptr + 4096);
-	igt_assert_eq(__gem_context_set_param(i915, &param), 0);
+	igt_assert_eq(__set_param_fresh_context(i915, param), 0);
 
 	param.value = to_user_pointer(ptr);
-	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
 
 	param.value = to_user_pointer(ptr) + 4095;
-	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
 
 	param.value = to_user_pointer(ptr) + 8192;
-	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
 
 	param.value = to_user_pointer(ptr) + 12287;
-	igt_assert_eq(__gem_context_set_param(i915, &param), -EFAULT);
+	igt_assert_eq(__set_param_fresh_context(i915, param), -EFAULT);
 
 	munmap(ptr + 4096, 4096);
 
+	/* Reset back to a known-good param struct */
+	param.size = sizeof(*engines) + sizeof(*engines->engines);
+	param.value = to_user_pointer(engines);
+	igt_assert_eq(__set_param_fresh_context(i915, param), 0);
+
+	/* Test that we can't set engines after we've done an execbuf */
+	param.ctx_id = gem_context_create(i915);
+	spin = igt_spin_new(i915, .ctx_id = param.ctx_id);
+	igt_spin_free(i915, spin);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EINVAL);
+	gem_context_destroy(i915, param.ctx_id);
+
+	/* Test that we can't set engines on ctx0 */
+	param.ctx_id = 0;
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EINVAL);
+
 out:
 	munmap(engines, 4096);
-	gem_context_destroy(i915, param.ctx_id);
 }
 
 static uint32_t batch_create(int i915)
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
