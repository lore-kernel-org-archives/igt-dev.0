Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CBD6EC9D
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:34:06 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 d5-20020a17090ab305b02901675357c371so650809pjr.1
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:34:06 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:32:58 -0500
Message-Id: <20210609043259.102581-43-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 92/93] tests/i915/gem_ctx_engines: Add more
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
index 7957e07a..85e60d56 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -49,12 +49,14 @@
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
@@ -69,6 +71,9 @@ static void invalid_engines(int i915)
 	param.size = sizeof(stack) + 1;
 	igt_assert_eq(__gem_context_set_param(i915, &param), -EINVAL);
 
+	param.size = sizeof(*engines) + (I915_EXEC_RING_MASK + 2) * sizeof(*engines->engines);
+	igt_assert_eq(__gem_context_set_param(i915, &param), -EINVAL);
+
 	param.size = 0;
 	igt_assert_eq(__gem_context_set_param(i915, &param), 0);
 
@@ -160,9 +165,20 @@ static void invalid_engines(int i915)
 
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
