Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08796EC67
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 21:49:45 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id s14so18939009pjl.5
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 14:49:45 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Apr 2021 16:47:51 -0500
Message-Id: <20210423214853.876911-28-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
References: <20210423214853.876911-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 27/89] tests/i915/sysfs_clients: Convert to
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
 tests/i915/sysfs_clients.c | 87 ++++++++++++++++++++------------------
 1 file changed, 46 insertions(+), 41 deletions(-)

diff --git a/tests/i915/sysfs_clients.c b/tests/i915/sysfs_clients.c
index 0b7066c0..5e8fcb56 100644
--- a/tests/i915/sysfs_clients.c
+++ b/tests/i915/sysfs_clients.c
@@ -18,12 +18,12 @@
 
 #include "drmtest.h"
 #include "i915/gem.h"
-#include "i915/gem_context.h"
 #include "i915/gem_engine_topology.h"
 #include "i915/gem_mman.h"
 #include "igt_aux.h"
 #include "igt_dummyload.h"
 #include "igt_sysfs.h"
+#include "intel_ctx.h"
 #include "ioctl_wrappers.h"
 
 #define __require_within_epsilon(x, ref, tol_up, tol_down) \
@@ -392,34 +392,26 @@ static uint64_t measured_usleep(unsigned int usec)
 	return igt_nsec_elapsed(&tv);
 }
 
-static int reopen_client(int i915)
-{
-	int clone;
-
-	clone = gem_reopen_driver(i915);
-	gem_context_copy_engines(i915, 0, clone, 0);
-	close(i915);
-
-	return clone;
-}
-
 static void
-busy_one(int i915, int clients, const struct intel_execution_engine2 *e)
+busy_one(int i915, int clients, const intel_ctx_cfg_t *cfg,
+	 const struct intel_execution_engine2 *e)
 {
 	int64_t active, idle, old, other[MAX_CLASS];
 	struct timespec tv;
+	const intel_ctx_t *ctx;
 	igt_spin_t *spin;
 	uint64_t delay;
 	int me;
 
 	/* Create a fresh client with 0 runtime */
-	i915 = reopen_client(i915);
+	i915 = gem_reopen_driver(i915);
 
 	me = find_me(clients, getpid());
 	igt_assert(me != -1);
 
+	ctx = intel_ctx_create(i915, cfg);
 	spin = igt_spin_new(i915,
-			    gem_context_clone_with_engines(i915, 0),
+			    .ctx = ctx,
 			    .engine = e->flags,
 			    .flags = IGT_SPIN_POLL_RUN);
 	igt_spin_busywait_until_started(spin);
@@ -471,7 +463,7 @@ busy_one(int i915, int clients, const struct intel_execution_engine2 *e)
 		igt_assert(idle >= active);
 	}
 
-	gem_context_destroy(i915, spin->execbuf.rsvd1);
+	intel_ctx_destroy(i915, ctx);
 
 	/* And finally after the executing context is no more */
 	old = read_runtime(me, e->class);
@@ -512,28 +504,29 @@ busy_one(int i915, int clients, const struct intel_execution_engine2 *e)
 	close(i915);
 }
 
-static void busy_all(int i915, int clients)
+static void busy_all(int i915, int clients, const intel_ctx_cfg_t *cfg)
 {
 	const struct intel_execution_engine2 *e;
 	int64_t active[MAX_CLASS];
 	int64_t idle[MAX_CLASS];
 	int64_t old[MAX_CLASS];
 	uint64_t classes = 0;
+	const intel_ctx_t *ctx;
 	igt_spin_t *spin;
 	int expect = 0;
 	int64_t delay;
 	int me;
 
 	/* Create a fresh client with 0 runtime */
-	i915 = reopen_client(i915);
+	i915 = gem_reopen_driver(i915);
 
 	me = find_me(clients, getpid());
 	igt_assert(me != -1);
 
-	spin = igt_spin_new(i915,
-			    gem_context_clone_with_engines(i915, 0),
+	ctx = intel_ctx_create(i915, cfg);
+	spin = igt_spin_new(i915, .ctx = ctx,
 			    .flags = IGT_SPIN_POLL_RUN);
-	__for_each_physical_engine(i915, e) {
+	for_each_ctx_engine(i915, ctx, e) {
 		if (!gem_class_can_store_dword(i915, e->class))
 			continue;
 
@@ -579,7 +572,7 @@ static void busy_all(int i915, int clients)
 		igt_assert(idle[i] >= active[i]);
 	}
 
-	gem_context_destroy(i915, spin->execbuf.rsvd1);
+	intel_ctx_destroy(i915, ctx);
 	igt_spin_free(i915, spin);
 
 	/* And finally after the executing context is no more */
@@ -596,17 +589,19 @@ static void busy_all(int i915, int clients)
 }
 
 static void
-split_child(int i915, int clients,
+split_child(int i915, int clients, const intel_ctx_cfg_t *cfg,
 	    const struct intel_execution_engine2 *e,
 	    int sv)
 {
 	int64_t runtime[2] = {};
+	const intel_ctx_t *ctx;
 	igt_spin_t *spin;
 	int go = 1;
 
-	i915 = reopen_client(i915);
+	i915 = gem_reopen_driver(i915);
 
-	spin = igt_spin_new(i915, .engine = e->flags);
+	ctx = intel_ctx_create(i915, cfg);
+	spin = igt_spin_new(i915, .ctx = ctx, .engine = e->flags);
 	igt_spin_end(spin);
 	gem_sync(i915, spin->handle);
 
@@ -626,12 +621,14 @@ split_child(int i915, int clients,
 	igt_spin_free(i915, spin);
 
 	runtime[0] = read_runtime(find_me(clients, getpid()), e->class);
+	intel_ctx_destroy(i915, ctx);
 	write(sv, runtime, sizeof(runtime));
 }
 
 static void
-__split(int i915, int clients, const struct intel_execution_engine2 *e, int f,
-	void (*fn)(int i915, int clients,
+__split(int i915, int clients, const intel_ctx_cfg_t *cfg,
+	const struct intel_execution_engine2 *e, int f,
+	void (*fn)(int i915, int clients, const intel_ctx_cfg_t *cfg,
 		   const struct intel_execution_engine2 *e,
 		   int sv))
 {
@@ -652,7 +649,7 @@ __split(int i915, int clients, const struct intel_execution_engine2 *e, int f,
 
 		igt_assert(socketpair(AF_UNIX, SOCK_DGRAM, 0, c->sv) == 0);
 		igt_fork(child, 1)
-			fn(i915, clients, e, c->sv[1]);
+			fn(i915, clients, cfg, e, c->sv[1]);
 
 		read(c->sv[0], &go, sizeof(go));
 	}
@@ -720,13 +717,14 @@ __split(int i915, int clients, const struct intel_execution_engine2 *e, int f,
 }
 
 static void
-split(int i915, int clients, const struct intel_execution_engine2 *e, int f)
+split(int i915, int clients, const intel_ctx_cfg_t *cfg,
+      const struct intel_execution_engine2 *e, int f)
 {
-	__split(i915, clients, e, f, split_child);
+	__split(i915, clients, cfg, e, f, split_child);
 }
 
 static void
-sema_child(int i915, int clients,
+sema_child(int i915, int clients, const intel_ctx_cfg_t *cfg,
 	   const struct intel_execution_engine2 *e,
 	   int sv)
 {
@@ -739,9 +737,12 @@ sema_child(int i915, int clients,
 		.buffer_count = 1,
 		.flags = e->flags,
 	};
+	const intel_ctx_t *ctx;
 	uint32_t *cs, *sema;
 
-	i915 = reopen_client(i915);
+	i915 = gem_reopen_driver(i915);
+	ctx = intel_ctx_create(i915, cfg);
+	execbuf.rsvd1 = ctx->id;
 
 	obj.handle = gem_create(i915, 4096);
 	obj.offset = obj.handle << 12;
@@ -771,6 +772,7 @@ sema_child(int i915, int clients,
 	*sema = 0;
 	gem_execbuf(i915, &execbuf);
 	gem_close(i915, obj.handle);
+	intel_ctx_destroy(i915, ctx);
 
 	write(sv, sema, sizeof(*sema));
 	read(sv, sema, sizeof(*sema));
@@ -794,9 +796,10 @@ sema_child(int i915, int clients,
 }
 
 static void
-sema(int i915, int clients, const struct intel_execution_engine2 *e, int f)
+sema(int i915, int clients, const intel_ctx_cfg_t *cfg,
+     const struct intel_execution_engine2 *e, int f)
 {
-	__split(i915, clients, e, f, sema_child);
+	__split(i915, clients, cfg, e, f, sema_child);
 }
 
 static int read_all(int clients, pid_t pid, int class, uint64_t *runtime)
@@ -944,21 +947,23 @@ static bool has_busy(int clients)
 static void test_busy(int i915, int clients)
 {
 	const struct intel_execution_engine2 *e;
+	intel_ctx_cfg_t cfg;
 	const int frac[] = { 10, 25, 50 };
 
 	igt_fixture {
 		igt_require(gem_has_contexts(i915));
 		igt_require(has_busy(clients));
+		cfg = intel_ctx_cfg_all_physical(i915);
 	}
 
 	igt_subtest_with_dynamic("busy") {
-		__for_each_physical_engine(i915, e) {
+		for_each_ctx_cfg_engine(i915, &cfg, e) {
 			if (!gem_class_can_store_dword(i915, e->class))
 				continue;
 			igt_dynamic_f("%s", e->name) {
 				gem_quiescent_gpu(i915);
 				igt_fork(child, 1)
-					busy_one(i915, clients, e);
+					busy_one(i915, clients, &cfg, e);
 				igt_waitchildren();
 				gem_quiescent_gpu(i915);
 			}
@@ -967,7 +972,7 @@ static void test_busy(int i915, int clients)
 		igt_dynamic("all") {
 			gem_quiescent_gpu(i915);
 			igt_fork(child, 1)
-				busy_all(i915, clients);
+				busy_all(i915, clients, &cfg);
 			igt_waitchildren();
 			gem_quiescent_gpu(i915);
 		}
@@ -975,10 +980,10 @@ static void test_busy(int i915, int clients)
 
 	for (int i = 0; i < ARRAY_SIZE(frac); i++) {
 		igt_subtest_with_dynamic_f("split-%d", frac[i]) {
-			__for_each_physical_engine(i915, e) {
+			for_each_ctx_cfg_engine(i915, &cfg, e) {
 				igt_dynamic_f("%s", e->name) {
 					gem_quiescent_gpu(i915);
-					split(i915, clients, e, frac[i]);
+					split(i915, clients, &cfg, e, frac[i]);
 					gem_quiescent_gpu(i915);
 				}
 			}
@@ -993,13 +998,13 @@ static void test_busy(int i915, int clients)
 
 		for (int i = 0; i < ARRAY_SIZE(frac); i++) {
 			igt_subtest_with_dynamic_f("sema-%d", frac[i]) {
-				__for_each_physical_engine(i915, e) {
+				for_each_ctx_cfg_engine(i915, &cfg, e) {
 					if (!gem_class_has_mutable_submission(i915, e->class))
 						continue;
 
 					igt_dynamic_f("%s", e->name) {
 						igt_drop_caches_set(i915, DROP_RESET_ACTIVE);
-						sema(i915, clients, e, frac[i]);
+						sema(i915, clients, &cfg, e, frac[i]);
 						gem_quiescent_gpu(i915);
 					}
 					igt_drop_caches_set(i915, DROP_RESET_ACTIVE);
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
