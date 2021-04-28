Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F466EC31
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Apr 2021 20:21:53 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 f11-20020a17090a638bb02901524d3a3d48so9637826pjj.3
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Apr 2021 13:21:53 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 28 Apr 2021 15:21:42 -0500
Message-Id: <20210428202143.1388452-4-jason@jlekstrand.net>
In-Reply-To: <20210428202143.1388452-1-jason@jlekstrand.net>
References: <20210428202143.1388452-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/4] tests/i915/gem_ctx_engines: Add more
 invalid SET_CONTEXT_PARAM cases
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
 tests/i915/gem_ctx_engines.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index e8d88aa4..f4ee990b 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -48,12 +48,14 @@
 static void invalid_engines(int i915)
 {
 	struct i915_context_param_engines stack = {}, *engines;
+	uint32_t ctx_id = gem_context_create(i915);
 	struct drm_i915_gem_context_param param = {
-		.ctx_id = gem_context_create(i915),
+		.ctx_id = ctx_id,
 		.param = I915_CONTEXT_PARAM_ENGINES,
 		.value = to_user_pointer(&stack),
 	};
 	uint32_t handle;
+	igt_spin_t *spin;
 	void *ptr;
 
 	param.size = 0;
@@ -68,6 +70,9 @@ static void invalid_engines(int i915)
 	param.size = sizeof(stack) + 1;
 	igt_assert_eq(__gem_context_set_param(i915, &param), -EINVAL);
 
+	param.size = sizeof(*engines) + (I915_EXEC_RING_MASK + 2) * sizeof(*engines->engines);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EINVAL);
+
 	param.size = 0;
 	igt_assert_eq(__gem_context_set_param(i915, &param), 0);
 
@@ -159,9 +164,20 @@ static void invalid_engines(int i915)
 
 	munmap(ptr + 4096, 4096);
 
+	/* Test that we can't set engines after we've done an execbuf */
+	spin = igt_spin_new(i915, .ctx_id = ctx_id);
+	igt_spin_free(i915, spin);
+	param.size = 0;
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EINVAL);
+
+	/* Test that we can't set engines on ctx0 */
+	param.ctx_id = 0;
+	param.size = 0;
+	igt_assert_eq(__gem_context_set_param(i915, &param), -ENOENT);
+
 out:
 	munmap(engines, 4096);
-	gem_context_destroy(i915, param.ctx_id);
+	gem_context_destroy(i915, ctx_id);
 }
 
 static uint32_t batch_create(int i915)
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
