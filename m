Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0C96EB03
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Mar 2021 22:32:44 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id h20so3600826plr.4
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Mar 2021 15:32:44 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 19 Mar 2021 17:32:27 -0500
Message-Id: <20210319223233.2982842-3-jason@jlekstrand.net>
In-Reply-To: <20210319223233.2982842-1-jason@jlekstrand.net>
References: <20210319223233.2982842-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/8] tests/i915/gem_exec_balancer: Drop the
 ringsize subtest
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

I915_CONTEXT_PARAM_RINGSIZE is being removed from upstream i915 because
it's never been used by any userspace other than IGT.
---
 tests/i915/gem_exec_balancer.c | 54 ----------------------------------
 1 file changed, 54 deletions(-)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 01db0e11..9feb20fb 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -2578,57 +2578,6 @@ static unsigned int measure_inflight(int i915, uint32_t ctx, int timeout)
 	return count;
 }
 
-static void __resize(int i915, uint32_t ctx)
-{
-	struct drm_i915_gem_context_param p = {
-		.ctx_id = ctx,
-		.param = I915_CONTEXT_PARAM_RINGSIZE,
-	};
-	unsigned int prev[2] = {};
-	uint64_t elapsed;
-
-	elapsed = 0;
-	gem_quiescent_gpu(i915);
-	for (p.value = 1 << 12; p.value <= 128 << 12; p.value <<= 1) {
-		struct timespec tv = {};
-		unsigned int count;
-
-		gem_context_set_param(i915, &p);
-
-		igt_nsec_elapsed(&tv);
-		count = measure_inflight(i915, ctx, 1 + 4 * ceil(elapsed*1e-9));
-		elapsed = igt_nsec_elapsed(&tv);
-
-		igt_info("%6llx -> %'6d\n", p.value, count);
-		igt_assert(count > 3 * (prev[1] - prev[0]) / 4 + prev[1]);
-
-		prev[0] = prev[1];
-		prev[1] = count;
-	}
-	gem_quiescent_gpu(i915);
-}
-
-static void ringsz(int i915)
-{
-	for (int class = 0; class < 32; class++) {
-		struct i915_engine_class_instance *ci;
-		unsigned int count;
-		uint32_t ctx;
-
-		ci = list_engines(i915, 1u << class, &count);
-		if (!ci || count < 2)
-			goto next;
-
-		ctx = load_balancer_create(i915, ci, count);
-		__resize(i915, ctx);
-		gem_context_destroy(i915, ctx);
-next:
-		free(ci);
-	}
-
-	gem_quiescent_gpu(i915);
-}
-
 static void ping(int i915, uint32_t ctx, unsigned int engine)
 {
 	struct drm_i915_gem_exec_object2 obj = {
@@ -3304,9 +3253,6 @@ igt_main
 	igt_subtest("fairslice")
 		fairslice(i915);
 
-	igt_subtest("ringsize")
-		ringsz(i915);
-
 	igt_subtest("nop")
 		nop(i915);
 
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
