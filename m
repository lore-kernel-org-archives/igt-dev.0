Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ABBA6E17A
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 14:47:43 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 62so2516807pgf.1
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jul 2021 07:47:43 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  7 Jul 2021 09:46:42 -0500
Message-Id: <20210707144643.181001-31-jason@jlekstrand.net>
In-Reply-To: <20210707144337.180693-1-jason@jlekstrand.net>
References: <20210707144337.180693-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 80/81] tests/i915/gem_exec_balancer: Fix
 invalid-balancer for the set-once rule
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

Upstream i915 is going to start only allowing CONTEXT_PARAM_ENGINES to
be set once on any given context.  This means we need to create a new
context for every setparam in the test.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_balancer.c | 56 ++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 85f94d795..28fc2d33a 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -165,6 +165,19 @@ static uint32_t batch_create(int i915)
 	return __batch_create(i915, 0);
 }
 
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
 static void invalid_balancer(int i915)
 {
 	I915_DEFINE_CONTEXT_ENGINES_LOAD_BALANCE(balancer, 64);
@@ -192,7 +205,6 @@ static void invalid_balancer(int i915)
 
 		igt_assert_lte(count, 64);
 
-		p.ctx_id = gem_context_create(i915);
 		p.size = (sizeof(struct i915_context_param_engines) +
 			  (count + 1) * sizeof(*engines.engines));
 
@@ -200,13 +212,13 @@ static void invalid_balancer(int i915)
 		engines.engines[0].engine_class = I915_ENGINE_CLASS_INVALID;
 		engines.engines[0].engine_instance = I915_ENGINE_CLASS_INVALID_NONE;
 		memcpy(engines.engines + 1, ci, count * sizeof(*ci));
-		gem_context_set_param(i915, &p);
+		igt_assert_eq(__set_param_fresh_context(i915, p), 0);
 
 		engines.extensions = -1ull;
-		igt_assert_eq(__gem_context_set_param(i915, &p), -EFAULT);
+		igt_assert_eq(__set_param_fresh_context(i915, p), -EFAULT);
 
 		engines.extensions = 1ull;
-		igt_assert_eq(__gem_context_set_param(i915, &p), -EFAULT);
+		igt_assert_eq(__set_param_fresh_context(i915, p), -EFAULT);
 
 		memset(&balancer, 0, sizeof(balancer));
 		balancer.base.name = I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE;
@@ -214,25 +226,25 @@ static void invalid_balancer(int i915)
 		memcpy(balancer.engines, ci, count * sizeof(*ci));
 
 		engines.extensions = to_user_pointer(&balancer);
-		gem_context_set_param(i915, &p);
+		igt_assert_eq(__set_param_fresh_context(i915, p), 0);
 
 		balancer.engine_index = 1;
-		igt_assert_eq(__gem_context_set_param(i915, &p), -EEXIST);
+		igt_assert_eq(__set_param_fresh_context(i915, p), -EEXIST);
 
 		balancer.engine_index = count;
-		igt_assert_eq(__gem_context_set_param(i915, &p), -EEXIST);
+		igt_assert_eq(__set_param_fresh_context(i915, p), -EEXIST);
 
 		balancer.engine_index = count + 1;
-		igt_assert_eq(__gem_context_set_param(i915, &p), -EINVAL);
+		igt_assert_eq(__set_param_fresh_context(i915, p), -EINVAL);
 
 		balancer.engine_index = 0;
-		gem_context_set_param(i915, &p);
+		igt_assert_eq(__set_param_fresh_context(i915, p), 0);
 
 		balancer.base.next_extension = to_user_pointer(&balancer);
-		igt_assert_eq(__gem_context_set_param(i915, &p), -EEXIST);
+		igt_assert_eq(__set_param_fresh_context(i915, p), -EEXIST);
 
 		balancer.base.next_extension = -1ull;
-		igt_assert_eq(__gem_context_set_param(i915, &p), -EFAULT);
+		igt_assert_eq(__set_param_fresh_context(i915, p), -EFAULT);
 
 		handle = gem_create(i915, 4096 * 3);
 		ptr = gem_mmap__device_coherent(i915, handle, 0, 4096 * 3,
@@ -247,44 +259,42 @@ static void invalid_balancer(int i915)
 		memcpy(engines.engines + 2, ci, count * sizeof(ci));
 		p.size = (sizeof(struct i915_context_param_engines) +
 			  (count + 2) * sizeof(*engines.engines));
-		gem_context_set_param(i915, &p);
+		igt_assert_eq(__set_param_fresh_context(i915, p), 0);
 
 		balancer.base.next_extension = 0;
 		balancer.engine_index = 1;
 		engines.extensions = to_user_pointer(&balancer);
-		gem_context_set_param(i915, &p);
+		igt_assert_eq(__set_param_fresh_context(i915, p), 0);
 
 		memcpy(ptr + 4096 - 8, &balancer, sizeof(balancer));
 		memcpy(ptr + 8192 - 8, &balancer, sizeof(balancer));
 		balancer.engine_index = 0;
 
 		engines.extensions = to_user_pointer(ptr) + 4096 - 8;
-		gem_context_set_param(i915, &p);
+		igt_assert_eq(__set_param_fresh_context(i915, p), 0);
 
 		balancer.base.next_extension = engines.extensions;
 		engines.extensions = to_user_pointer(&balancer);
-		gem_context_set_param(i915, &p);
+		igt_assert_eq(__set_param_fresh_context(i915, p), 0);
 
 		munmap(ptr, 4096);
-		igt_assert_eq(__gem_context_set_param(i915, &p), -EFAULT);
+		igt_assert_eq(__set_param_fresh_context(i915, p), -EFAULT);
 		engines.extensions = to_user_pointer(ptr) + 4096 - 8;
-		igt_assert_eq(__gem_context_set_param(i915, &p), -EFAULT);
+		igt_assert_eq(__set_param_fresh_context(i915, p), -EFAULT);
 
 		engines.extensions = to_user_pointer(ptr) + 8192 - 8;
-		gem_context_set_param(i915, &p);
+		igt_assert_eq(__set_param_fresh_context(i915, p), 0);
 
 		balancer.base.next_extension = engines.extensions;
 		engines.extensions = to_user_pointer(&balancer);
-		gem_context_set_param(i915, &p);
+		igt_assert_eq(__set_param_fresh_context(i915, p), 0);
 
 		munmap(ptr + 8192, 4096);
-		igt_assert_eq(__gem_context_set_param(i915, &p), -EFAULT);
+		igt_assert_eq(__set_param_fresh_context(i915, p), -EFAULT);
 		engines.extensions = to_user_pointer(ptr) + 8192 - 8;
-		igt_assert_eq(__gem_context_set_param(i915, &p), -EFAULT);
+		igt_assert_eq(__set_param_fresh_context(i915, p), -EFAULT);
 
 		munmap(ptr + 4096, 4096);
-
-		gem_context_destroy(i915, p.ctx_id);
 		free(ci);
 	}
 }
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
