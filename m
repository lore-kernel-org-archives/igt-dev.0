Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A251A6EC6E
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 21:49:05 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id a12so34913725pfc.7
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 14:49:05 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Apr 2021 16:47:26 -0500
Message-Id: <20210423214853.876911-3-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
References: <20210423214853.876911-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 02/89] tests/i915/gem_exec_balancer: Drop
 the ringsize subtest
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 tests/i915/gem_exec_balancer.c | 81 ----------------------------------
 1 file changed, 81 deletions(-)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 01db0e11..bfd65b29 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -2551,84 +2551,6 @@ next:
 	gem_quiescent_gpu(i915);
 }
 
-static void sighandler(int sig)
-{
-}
-
-static unsigned int measure_inflight(int i915, uint32_t ctx, int timeout)
-{
-	igt_spin_t *spin = igt_spin_new(i915, ctx);
-	unsigned int count;
-	int err;
-
-	fcntl(i915, F_SETFL, fcntl(i915, F_GETFL) | O_NONBLOCK);
-	signal(SIGALRM, sighandler);
-	alarm(timeout);
-
-	for (count = 1; (err = __execbuf(i915, &spin->execbuf)) == 0; count++)
-		;
-	igt_assert_eq(err, -EWOULDBLOCK);
-
-	alarm(0);
-	signal(SIGALRM, SIG_DFL);
-	fcntl(i915, F_SETFL, fcntl(i915, F_GETFL) & ~O_NONBLOCK);
-
-	igt_spin_free(i915, spin);
-
-	return count;
-}
-
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
@@ -3304,9 +3226,6 @@ igt_main
 	igt_subtest("fairslice")
 		fairslice(i915);
 
-	igt_subtest("ringsize")
-		ringsz(i915);
-
 	igt_subtest("nop")
 		nop(i915);
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
