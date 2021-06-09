Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919086EC81
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:31:30 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so646891pjs.2
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:31:30 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:30:24 -0500
Message-Id: <20210609043035.102359-39-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 38/93] tests/i915/gem_ctx_exec: Convert to
 intel_ctx_t
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_ctx_exec.c | 51 ++++++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
index 6db2d598..fb18bb01 100644
--- a/tests/i915/gem_ctx_exec.c
+++ b/tests/i915/gem_ctx_exec.c
@@ -268,7 +268,7 @@ static void nohangcheck_hostile(int i915)
 	const struct intel_execution_engine2 *e;
 	igt_hang_t hang;
 	int fence = -1;
-	uint32_t ctx;
+	const intel_ctx_t *ctx;
 	int err = 0;
 	int dir;
 
@@ -282,12 +282,12 @@ static void nohangcheck_hostile(int i915)
 	dir = igt_params_open(i915);
 	igt_require(dir != -1);
 
-	ctx = gem_context_create(i915);
-	hang = igt_allow_hang(i915, ctx, 0);
+	ctx = intel_ctx_create_all_physical(i915);
+	hang = igt_allow_hang(i915, ctx->id, 0);
 
 	igt_require(__enable_hangcheck(dir, false));
 
-	____for_each_physical_engine(i915, ctx, e) {
+	for_each_ctx_engine(i915, ctx, e) {
 		igt_spin_t *spin;
 		int new;
 
@@ -295,7 +295,7 @@ static void nohangcheck_hostile(int i915)
 		gem_engine_property_printf(i915, e->name,
 					   "preempt_timeout_ms", "%d", 50);
 
-		spin = __igt_spin_new(i915, ctx,
+		spin = __igt_spin_new(i915, .ctx = ctx,
 				      .engine = e->flags,
 				      .flags = (IGT_SPIN_NO_PREEMPTION |
 						IGT_SPIN_FENCE_OUT));
@@ -316,7 +316,7 @@ static void nohangcheck_hostile(int i915)
 			fence = tmp;
 		}
 	}
-	gem_context_destroy(i915, ctx);
+	intel_ctx_destroy(i915, ctx);
 	igt_assert(fence != -1);
 
 	if (sync_fence_wait(fence, MSEC_PER_SEC)) { /* 640ms preempt-timeout */
@@ -341,30 +341,38 @@ static void nohangcheck_hostile(int i915)
 static void close_race(int i915)
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
-	uint32_t *contexts;
+	const intel_ctx_t *base_ctx;
+	const intel_ctx_t **ctx;
+	uint32_t *ctx_id;
 	igt_spin_t *spin;
 
 	/* Check we can execute a polling spinner */
-	igt_spin_free(i915, igt_spin_new(i915, .flags = IGT_SPIN_POLL_RUN));
+	base_ctx = intel_ctx_create(i915, NULL);
+	igt_spin_free(i915, igt_spin_new(i915, .ctx = base_ctx,
+					 .flags = IGT_SPIN_POLL_RUN));
 
-	contexts = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
-	igt_assert(contexts != MAP_FAILED);
+	ctx = calloc(ncpus, sizeof(*ctx));
+	ctx_id = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+	igt_assert(ctx_id != MAP_FAILED);
 
-	for (int child = 0; child < ncpus; child++)
-		contexts[child] = gem_context_create(i915);
+	for (int child = 0; child < ncpus; child++) {
+		ctx[child] = intel_ctx_create(i915, NULL);
+		ctx_id[child] = ctx[child]->id;
+	}
 
 	igt_fork(child, ncpus) {
-		spin = __igt_spin_new(i915, .flags = IGT_SPIN_POLL_RUN);
+		spin = __igt_spin_new(i915, .ctx = base_ctx,
+				      .flags = IGT_SPIN_POLL_RUN);
 		igt_spin_end(spin);
 		gem_sync(i915, spin->handle);
 
-		while (!READ_ONCE(contexts[ncpus])) {
+		while (!READ_ONCE(ctx_id[ncpus])) {
 			int64_t timeout = 1;
 
 			igt_spin_reset(spin);
 			igt_assert(!igt_spin_has_started(spin));
 
-			spin->execbuf.rsvd1 = READ_ONCE(contexts[child]);
+			spin->execbuf.rsvd1 = READ_ONCE(ctx_id[child]);
 			if (__gem_execbuf(i915, &spin->execbuf))
 				continue;
 
@@ -404,19 +412,22 @@ static void close_race(int i915)
 		 * and the kernel's context/request handling.
 		 */
 		for (int child = 0; child < ncpus; child++) {
-			gem_context_destroy(i915, contexts[child]);
-			contexts[child] = gem_context_create(i915);
+			intel_ctx_destroy(i915, ctx[child]);
+			ctx[child] = intel_ctx_create(i915, NULL);
+			ctx_id[child] = ctx[child]->id;
 		}
 		usleep(1000 + hars_petruska_f54_1_random_unsafe() % 2000);
 	}
 
-	contexts[ncpus] = 1;
+	ctx_id[ncpus] = 1;
 	igt_waitchildren();
 
+	intel_ctx_destroy(i915, base_ctx);
 	for (int child = 0; child < ncpus; child++)
-		gem_context_destroy(i915, contexts[child]);
+		intel_ctx_destroy(i915, ctx[child]);
 
-	munmap(contexts, 4096);
+	free(ctx);
+	munmap(ctx_id, 4096);
 }
 
 igt_main
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
