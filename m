Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A746E2C0
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 03:55:34 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id i4so7773634pjk.1
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 20:55:34 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Apr 2021 22:53:45 -0500
Message-Id: <20210413035350.261794-70-jason@jlekstrand.net>
In-Reply-To: <20210413035350.261794-1-jason@jlekstrand.net>
References: <20210413035350.261794-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 69/74] tests/i915/gem_ctx_engines: Drop the
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
---
 tests/i915/gem_ctx_engines.c | 79 ------------------------------------
 1 file changed, 79 deletions(-)

diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index 94ccd28f..c353eae7 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -173,82 +173,6 @@ out:
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
@@ -720,9 +644,6 @@ igt_main
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
