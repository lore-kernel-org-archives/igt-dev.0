Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BA16E170
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 14:47:20 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 mn20-20020a17090b1894b02901707fc074e8so3587079pjb.0
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jul 2021 07:47:20 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  7 Jul 2021 09:46:29 -0500
Message-Id: <20210707144643.181001-18-jason@jlekstrand.net>
In-Reply-To: <20210707144337.180693-1-jason@jlekstrand.net>
References: <20210707144337.180693-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 67/81] tests/i915/gem_ctx_engines: Delete
 the libapi subtest
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

It just tests enumeration APIs that we're about to delete.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_ctx_engines.c | 71 ------------------------------------
 1 file changed, 71 deletions(-)

diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index ffed96592..caa97774c 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -551,74 +551,6 @@ static void independent_all(int i915, const intel_ctx_t *ctx)
 	igt_waitchildren();
 }
 
-static void libapi(int i915)
-{
-	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, 64) = {};
-	struct drm_i915_gem_context_param p = {
-		.ctx_id = gem_context_create(i915),
-		.param = I915_CONTEXT_PARAM_ENGINES,
-		.value = to_user_pointer(&engines),
-	};
-	const struct intel_execution_engine2 *e;
-	unsigned int count, idx;
-
-	p.size = sizeof(struct i915_context_param_engines);
-	gem_context_set_param(i915, &p);
-
-	/* An empty context should be a short loop */
-	count = 0;
-	for_each_context_engine(i915, p.ctx_id, e)
-		count++;
-	igt_assert_eq(count, 0);
-
-	p.size += sizeof(struct i915_engine_class_instance);
-	engine_class(&engines, 0) = -1;
-	engine_instance(&engines, 0) = -1;
-	gem_context_set_param(i915, &p);
-
-	/* We report all engines from the context, even if invalid/unusable */
-	count = 0;
-	for_each_context_engine(i915, p.ctx_id, e) {
-		igt_assert_eq(e->class, engine_class(&engines, 0));
-		igt_assert_eq(e->instance, engine_instance(&engines, 0));
-		count++;
-	}
-	igt_assert_eq(count, 1);
-
-	/* Check that every known engine can be found from the context map */
-	idx = 0;
-	p.size = sizeof(struct i915_context_param_engines);
-	p.size += sizeof(struct i915_engine_class_instance);
-	for (engine_class(&engines, idx) = 0;
-	     engine_class(&engines, idx) < 16;
-	     engine_class(&engines, idx)++) {
-		for (engine_instance(&engines, idx) = 0;
-		     engine_instance(&engines, idx) < 16;
-		     engine_instance(&engines, idx)++) {
-			if (__gem_context_set_param(i915, &p))
-				break;
-
-			count = 0;
-			for_each_context_engine(i915, p.ctx_id, e) {
-				igt_assert_eq(e->class,
-					      engine_class(&engines, count));
-				igt_assert_eq(e->instance,
-					      engine_instance(&engines, count));
-				count++;
-			}
-			igt_assert_eq(count, idx + 1);
-
-			engines.engines[(idx + 1) % 64] = engines.engines[idx];
-			idx = (idx + 1) % 64;
-
-			p.size = sizeof(struct i915_context_param_engines);
-			p.size += (idx + 1) * sizeof(struct i915_engine_class_instance);
-		}
-	}
-
-	gem_context_destroy(i915, p.ctx_id);
-}
-
 igt_main
 {
 	const struct intel_execution_engine2 *e;
@@ -664,9 +596,6 @@ igt_main
 			independent_all(i915, ctx);
 	}
 
-	igt_subtest("libapi")
-		libapi(i915);
-
 	igt_fixture
 		igt_stop_hang_detector();
 }
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
