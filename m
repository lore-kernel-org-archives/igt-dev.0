Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1DD6E17F
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 14:47:06 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id p17so663844plf.12
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jul 2021 07:47:06 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  7 Jul 2021 09:46:21 -0500
Message-Id: <20210707144643.181001-10-jason@jlekstrand.net>
In-Reply-To: <20210707144337.180693-1-jason@jlekstrand.net>
References: <20210707144337.180693-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 59/81] tests/i915/gem_ctx_engines: Drop the
 idempotent subtest
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

This just tests the engines CONTEXT_GETPARAM which we're going to be
dropping from i915.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_ctx_engines.c | 79 ------------------------------------
 1 file changed, 79 deletions(-)

diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index 531495c39..ffed96592 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -174,82 +174,6 @@ out:
 	gem_context_destroy(i915, param.ctx_id);
 }
 
-static void idempotent(int i915)
-{
-	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, I915_EXEC_RING_MASK + 1);
-	I915_DEFINE_CONTEXT_PARAM_ENGINES(expected, I915_EXEC_RING_MASK + 1);
-	struct drm_i915_gem_context_param p = {
-		.ctx_id = gem_context_create(i915),
-		.param = I915_CONTEXT_PARAM_ENGINES,
-		.value = to_user_pointer(&engines),
-		.size = sizeof(engines),
-	};
-	const size_t base = sizeof(struct i915_context_param_engines);
-	const struct intel_execution_engine2 *e;
-	int idx;
-
-	/* What goes in, must come out. And what comes out, must go in */
-
-	gem_context_get_param(i915, &p);
-	igt_assert_eq(p.size, 0); /* atm default is to use legacy ring mask */
-
-	idx = 0;
-	memset(&engines, 0, sizeof(engines));
-	__for_each_physical_engine(i915, e) {
-		engines.engines[idx].engine_class = e->class;
-		engines.engines[idx].engine_instance = e->instance;
-		idx++;
-	}
-	idx *= sizeof(*engines.engines);
-	p.size = base + idx;
-	gem_context_set_param(i915, &p);
-
-	memcpy(&expected, &engines, sizeof(expected));
-
-	gem_context_get_param(i915, &p);
-	igt_assert_eq(p.size, base + idx);
-	igt_assert(!memcmp(&expected, &engines, idx));
-
-	p.size = base;
-	gem_context_set_param(i915, &p);
-	gem_context_get_param(i915, &p);
-	igt_assert_eq(p.size, base);
-
-	/* and it should not have overwritten the previous contents */
-	igt_assert(!memcmp(&expected, &engines, idx));
-
-	memset(&engines, 0, sizeof(engines));
-	engines.engines[0].engine_class = I915_ENGINE_CLASS_INVALID;
-	engines.engines[0].engine_instance = I915_ENGINE_CLASS_INVALID_NONE;
-	idx = sizeof(*engines.engines);
-	p.size = base + idx;
-	gem_context_set_param(i915, &p);
-
-	memcpy(&expected, &engines, sizeof(expected));
-
-	gem_context_get_param(i915, &p);
-	igt_assert_eq(p.size, base + idx);
-	igt_assert(!memcmp(&expected, &engines, idx));
-
-	p.size = sizeof(engines);
-	__for_each_physical_engine(i915, e) {
-		memset(&engines, 0, sizeof(engines));
-		for (int n = 0; n < I915_EXEC_RING_MASK + 1; n++) {
-			engine_class(&engines, n) = e->class;
-			engine_instance(&engines, n) = e->instance;
-		}
-		gem_context_set_param(i915, &p);
-
-		memcpy(&expected, &engines, sizeof(expected));
-
-		gem_context_get_param(i915, &p);
-		igt_assert_eq(p.size, sizeof(engines));
-		igt_assert(!memcmp(&expected, &engines, p.size));
-	}
-
-	gem_context_destroy(i915, p.ctx_id);
-}
-
 static uint32_t batch_create(int i915)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
@@ -713,9 +637,6 @@ igt_main
 	igt_subtest("invalid-engines")
 		invalid_engines(i915);
 
-	igt_subtest("idempotent")
-		idempotent(i915);
-
 	igt_subtest("none")
 		none(i915);
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
