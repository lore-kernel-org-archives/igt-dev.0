Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D826E1AA
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 03:54:34 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id t22so7158607ply.1
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 20:54:34 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Apr 2021 22:53:03 -0500
Message-Id: <20210413035350.261794-28-jason@jlekstrand.net>
In-Reply-To: <20210413035350.261794-1-jason@jlekstrand.net>
References: <20210413035350.261794-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 27/74] tests/i915/gem_spin_batch: Convert to
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

---
 tests/i915/gem_spin_batch.c | 81 +++++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 35 deletions(-)

diff --git a/tests/i915/gem_spin_batch.c b/tests/i915/gem_spin_batch.c
index db0af018..cc92c37c 100644
--- a/tests/i915/gem_spin_batch.c
+++ b/tests/i915/gem_spin_batch.c
@@ -34,7 +34,7 @@
 		     "'%s' != '%s' (%lld not within %d%% tolerance of %lld)\n",\
 		     #x, #ref, (long long)x, tolerance, (long long)ref)
 
-static void spin(int fd,
+static void spin(int fd, const intel_ctx_t *ctx_id,
 		 unsigned int engine,
 		 unsigned int flags,
 		 unsigned int timeout_sec)
@@ -46,10 +46,12 @@ static void spin(int fd,
 	struct timespec itv = { };
 	uint64_t elapsed;
 
-	spin = __igt_spin_new(fd, .engine = engine, .flags = flags);
+	spin = __igt_spin_new(fd, .ctx = ctx_id, .engine = engine,
+			      .flags = flags);
 	while ((elapsed = igt_nsec_elapsed(&tv)) >> 30 < timeout_sec) {
 		igt_spin_t *next =
-			__igt_spin_new(fd, .engine = engine, .flags = flags);
+			__igt_spin_new(fd, .ctx = ctx_id, .engine = engine,
+				       .flags = flags);
 
 		igt_spin_set_timeout(spin,
 				     timeout_100ms - igt_nsec_elapsed(&itv));
@@ -75,21 +77,25 @@ static void spin(int fd,
 #define RESUBMIT_NEW_CTX     (1 << 0)
 #define RESUBMIT_ALL_ENGINES (1 << 1)
 
-static void spin_resubmit(int fd, unsigned int engine, unsigned int flags)
+static void spin_resubmit(int fd, const intel_ctx_t *ctx,
+			  unsigned int engine, unsigned int flags)
 {
+	const intel_ctx_t *new_ctx = NULL;
 	igt_spin_t *spin;
 
 	if (flags & RESUBMIT_NEW_CTX)
 		igt_require(gem_has_contexts(fd));
 
-	spin = __igt_spin_new(fd, .engine = engine);
-	if (flags & RESUBMIT_NEW_CTX)
-		spin->execbuf.rsvd1 = gem_context_clone_with_engines(fd, 0);
+	spin = __igt_spin_new(fd, .ctx = ctx, .engine = engine);
+	if (flags & RESUBMIT_NEW_CTX) {
+		new_ctx = intel_ctx_create(fd, &ctx->cfg);
+		spin->execbuf.rsvd1 = new_ctx->id;
+	}
 
 	if (flags & RESUBMIT_ALL_ENGINES) {
 		const struct intel_execution_engine2 *other;
 
-		for_each_context_engine(fd, spin->execbuf.rsvd1, other) {
+		for_each_ctx_engine(fd, ctx, other) {
 			spin->execbuf.flags &= ~0x3f;
 			spin->execbuf.flags |= other->flags;
 			gem_execbuf(fd, &spin->execbuf);
@@ -100,8 +106,8 @@ static void spin_resubmit(int fd, unsigned int engine, unsigned int flags)
 	igt_spin_end(spin);
 	gem_sync(fd, spin->handle);
 
-	if (spin->execbuf.rsvd1)
-		gem_context_destroy(fd, spin->execbuf.rsvd1);
+	if (flags & RESUBMIT_NEW_CTX)
+		intel_ctx_destroy(fd, new_ctx);
 
 	igt_spin_free(fd, spin);
 }
@@ -112,45 +118,44 @@ static void spin_exit_handler(int sig)
 }
 
 static void
-spin_on_all_engines(int fd, unsigned long flags, unsigned int timeout_sec)
+spin_on_all_engines(int fd, const intel_ctx_t *ctx,
+		    unsigned long flags, unsigned int timeout_sec)
 {
 	const struct intel_execution_engine2 *e2;
 
-	__for_each_physical_engine(fd, e2) {
+	for_each_ctx_engine(fd, ctx, e2) {
 		igt_fork(child, 1) {
 			igt_install_exit_handler(spin_exit_handler);
-			spin(fd, e2->flags, flags, timeout_sec);
+			spin(fd, ctx, e2->flags, flags, timeout_sec);
 		}
 	}
 
 	igt_waitchildren();
 }
 
-static void spin_all(int i915, unsigned int flags)
+static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
 #define PARALLEL_SPIN_NEW_CTX BIT(0)
 {
 	const struct intel_execution_engine2 *e;
+	intel_ctx_cfg_t cfg = ctx->cfg;
 	struct igt_spin *spin, *n;
 	IGT_LIST_HEAD(list);
 
-	__for_each_physical_engine(i915, e) {
-		uint32_t ctx;
-
+	for_each_ctx_cfg_engine(i915, &cfg, e) {
 		if (!gem_class_can_store_dword(i915, e->class))
 			continue;
 
-		ctx = 0;
 		if (flags & PARALLEL_SPIN_NEW_CTX)
-			ctx = gem_context_clone_with_engines(i915, 0);
+			ctx = intel_ctx_create(i915, &cfg);
 
 		/* Prevent preemption so only one is allowed on each engine */
 		spin = igt_spin_new(i915,
-				    .ctx_id = ctx,
+				    .ctx = ctx,
 				    .engine = e->flags,
 				    .flags = (IGT_SPIN_POLL_RUN |
 					      IGT_SPIN_NO_PREEMPTION));
-		if (ctx)
-			gem_context_destroy(i915, ctx);
+		if (flags & PARALLEL_SPIN_NEW_CTX)
+			intel_ctx_destroy(i915, ctx);
 
 		igt_spin_busywait_until_started(spin);
 		igt_list_move(&spin->link, &list);
@@ -187,11 +192,14 @@ igt_main
 {
 	const struct intel_execution_engine2 *e2;
 	const struct intel_execution_ring *e;
+	const intel_ctx_t *ctx = NULL;
 	int fd = -1;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
+		ctx = intel_ctx_create_all_physical(fd);
+
 		igt_fork_hang_detector(fd);
 	}
 
@@ -202,53 +210,56 @@ igt_main
 				igt_dynamic_f("%s", e->name)
 
 	test_each_legacy_ring("legacy")
-		spin(fd, eb_ring(e), 0, 3);
+		spin(fd, intel_ctx_0(fd), eb_ring(e), 0, 3);
 	test_each_legacy_ring("legacy-resubmit")
-		spin_resubmit(fd, eb_ring(e), 0);
+		spin_resubmit(fd, intel_ctx_0(fd), eb_ring(e), 0);
 	test_each_legacy_ring("legacy-resubmit-new")
-		spin_resubmit(fd, eb_ring(e), RESUBMIT_NEW_CTX);
+		spin_resubmit(fd, intel_ctx_0(fd), eb_ring(e), RESUBMIT_NEW_CTX);
 
 #undef test_each_legcy_ring
 
 	igt_subtest("spin-all")
-		spin_all(fd, 0);
+		spin_all(fd, ctx, 0);
 	igt_subtest("spin-all-new")
-		spin_all(fd, PARALLEL_SPIN_NEW_CTX);
+		spin_all(fd, ctx, PARALLEL_SPIN_NEW_CTX);
 
 #define test_each_engine(test) \
 	igt_subtest_with_dynamic(test) \
-		__for_each_physical_engine(fd, e2) \
+		for_each_ctx_engine(fd, ctx, e2) \
 			igt_dynamic_f("%s", e2->name)
 
 	test_each_engine("engines")
-		spin(fd, e2->flags, 0, 3);
+		spin(fd, ctx, e2->flags, 0, 3);
 
 	test_each_engine("resubmit")
-		spin_resubmit(fd, e2->flags, 0);
+		spin_resubmit(fd, ctx, e2->flags, 0);
 
 	test_each_engine("resubmit-new")
-		spin_resubmit(fd, e2->flags, RESUBMIT_NEW_CTX);
+		spin_resubmit(fd, ctx, e2->flags,
+			      RESUBMIT_NEW_CTX);
 
 	test_each_engine("resubmit-all")
-		spin_resubmit(fd, e2->flags, RESUBMIT_ALL_ENGINES);
+		spin_resubmit(fd, ctx, e2->flags,
+			      RESUBMIT_ALL_ENGINES);
 
 	test_each_engine("resubmit-new-all")
-		spin_resubmit(fd, e2->flags,
+		spin_resubmit(fd, ctx, e2->flags,
 			      RESUBMIT_NEW_CTX |
 			      RESUBMIT_ALL_ENGINES);
 
 #undef test_each_engine
 
 	igt_subtest("spin-each")
-		spin_on_all_engines(fd, 0, 3);
+		spin_on_all_engines(fd, ctx, 0, 3);
 
 	igt_subtest("user-each") {
 		igt_require(has_userptr(fd));
-		spin_on_all_engines(fd, IGT_SPIN_USERPTR, 3);
+		spin_on_all_engines(fd, ctx, IGT_SPIN_USERPTR, 3);
 	}
 
 	igt_fixture {
 		igt_stop_hang_detector();
+		intel_ctx_destroy(fd, ctx);
 		close(fd);
 	}
 }
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
