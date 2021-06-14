Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48AFE89F75
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 16:37:56 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso338992pjb.4
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 09:37:56 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 14 Jun 2021 11:36:45 -0500
Message-Id: <20210614163704.365989-31-jason@jlekstrand.net>
In-Reply-To: <20210614163704.365989-1-jason@jlekstrand.net>
References: <20210614163704.365989-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 30/77] tests/i915/gem_ctx_switch: Convert to
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
 tests/i915/gem_ctx_switch.c | 115 ++++++++++++++++++++----------------
 1 file changed, 64 insertions(+), 51 deletions(-)

diff --git a/tests/i915/gem_ctx_switch.c b/tests/i915/gem_ctx_switch.c
index 44c659f0b..e860e011c 100644
--- a/tests/i915/gem_ctx_switch.c
+++ b/tests/i915/gem_ctx_switch.c
@@ -43,6 +43,7 @@
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "i915/gem_ring.h"
+#include "i915/gem_vm.h"
 #include "igt.h"
 
 #define INTERRUPTIBLE 0x1
@@ -54,18 +55,18 @@ static double elapsed(const struct timespec *start, const struct timespec *end)
 		(end->tv_nsec - start->tv_nsec)*1e-9);
 }
 
-static int measure_qlen(int fd,
+static int measure_qlen(int fd, const intel_ctx_cfg_t *cfg,
 			struct drm_i915_gem_execbuffer2 *execbuf,
 			const struct intel_engine_data *engines,
 			int timeout)
 {
 	const struct drm_i915_gem_exec_object2 * const obj =
 		(struct drm_i915_gem_exec_object2 *)(uintptr_t)execbuf->buffers_ptr;
-	uint32_t ctx[64];
+	const intel_ctx_t *ctx[64];
 	int min = INT_MAX, max = 0;
 
 	for (int i = 0; i < ARRAY_SIZE(ctx); i++)
-		ctx[i] = gem_context_clone_with_engines(fd, 0);
+		ctx[i] = intel_ctx_create(fd, cfg);
 
 	for (unsigned int n = 0; n < engines->nengines; n++) {
 		uint64_t saved = execbuf->flags;
@@ -75,14 +76,14 @@ static int measure_qlen(int fd,
 		execbuf->flags |= engines->engines[n].flags;
 
 		for (int i = 0; i < ARRAY_SIZE(ctx); i++) {
-			execbuf->rsvd1 = ctx[i];
+			execbuf->rsvd1 = ctx[i]->id;
 			gem_execbuf(fd, execbuf);
 		}
 		gem_sync(fd, obj->handle);
 
 		igt_nsec_elapsed(&tv);
 		for (int i = 0; i < ARRAY_SIZE(ctx); i++) {
-			execbuf->rsvd1 = ctx[i];
+			execbuf->rsvd1 = ctx[i]->id;
 			gem_execbuf(fd, execbuf);
 		}
 		gem_sync(fd, obj->handle);
@@ -102,13 +103,14 @@ static int measure_qlen(int fd,
 	}
 
 	for (int i = 0; i < ARRAY_SIZE(ctx); i++)
-		gem_context_destroy(fd, ctx[i]);
+		intel_ctx_destroy(fd, ctx[i]);
 
 	igt_debug("Estimated qlen: {min:%d, max:%d}\n", min, max);
 	return min;
 }
 
 static void single(int fd, uint32_t handle,
+		   const intel_ctx_cfg_t *base_cfg,
 		   const struct intel_execution_engine2 *e2,
 		   unsigned flags,
 		   const int ncpus,
@@ -117,7 +119,8 @@ static void single(int fd, uint32_t handle,
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj;
 	struct drm_i915_gem_relocation_entry reloc;
-	uint32_t contexts[64];
+	intel_ctx_cfg_t cfg;
+	const intel_ctx_t *contexts[64];
 	struct {
 		double elapsed;
 		unsigned long count;
@@ -127,12 +130,12 @@ static void single(int fd, uint32_t handle,
 	shared = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(shared != MAP_FAILED);
 
-	for (n = 0; n < 64; n++) {
-		if (flags & QUEUE)
-			contexts[n] = gem_queue_clone_with_engines(fd, 0);
-		else
-			contexts[n] = gem_context_clone_with_engines(fd, 0);
-	}
+	cfg = *base_cfg;
+	if (flags & QUEUE)
+		cfg.vm = gem_vm_create(fd);
+
+	for (n = 0; n < 64; n++)
+		contexts[n] = intel_ctx_create(fd, &cfg);
 
 	memset(&obj, 0, sizeof(obj));
 	obj.handle = handle;
@@ -151,7 +154,7 @@ static void single(int fd, uint32_t handle,
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(&obj);
 	execbuf.buffer_count = 1;
-	execbuf.rsvd1 = contexts[0];
+	execbuf.rsvd1 = contexts[0]->id;
 	execbuf.flags = e2->flags;
 	execbuf.flags |= I915_EXEC_HANDLE_LUT;
 	execbuf.flags |= I915_EXEC_NO_RELOC;
@@ -169,7 +172,7 @@ static void single(int fd, uint32_t handle,
 
 		/* Warmup to bind all objects into each ctx before we begin */
 		for (int i = 0; i < ARRAY_SIZE(contexts); i++) {
-			execbuf.rsvd1 = contexts[i];
+			execbuf.rsvd1 = contexts[i]->id;
 			gem_execbuf(fd, &execbuf);
 		}
 		gem_sync(fd, handle);
@@ -178,7 +181,7 @@ static void single(int fd, uint32_t handle,
 		do {
 			igt_while_interruptible(flags & INTERRUPTIBLE) {
 				for (int loop = 0; loop < 64; loop++) {
-					execbuf.rsvd1 = contexts[loop % 64];
+					execbuf.rsvd1 = contexts[loop % 64]->id;
 					reloc.presumed_offset = -1;
 					gem_execbuf(fd, &execbuf);
 				}
@@ -215,28 +218,30 @@ static void single(int fd, uint32_t handle,
 	}
 
 	for (n = 0; n < 64; n++)
-		gem_context_destroy(fd, contexts[n]);
+		intel_ctx_destroy(fd, contexts[n]);
 
 	munmap(shared, 4096);
 }
 
-static void all(int fd, uint32_t handle, unsigned flags, int timeout)
+static void all(int fd, uint32_t handle, const intel_ctx_cfg_t *base_cfg,
+		unsigned flags, int timeout)
 {
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct intel_engine_data engines = { };
-	uint32_t contexts[65];
+	intel_ctx_cfg_t cfg;
+	const intel_ctx_t *contexts[65];
 	int n, qlen;
 
-	engines = intel_init_engine_list(fd, 0);
+	engines = intel_engine_list_for_ctx_cfg(fd, base_cfg);
 	igt_require(engines.nengines);
 
-	for (n = 0; n < ARRAY_SIZE(contexts); n++) {
-		if (flags & QUEUE)
-			contexts[n] = gem_queue_clone_with_engines(fd, 0);
-		else
-			contexts[n] = gem_context_clone_with_engines(fd, 0);
-	}
+	cfg = *base_cfg;
+	if (flags & QUEUE)
+		cfg.vm = gem_vm_create(fd);
+
+	for (n = 0; n < 64; n++)
+		contexts[n] = intel_ctx_create(fd, &cfg);
 
 	memset(obj, 0, sizeof(obj));
 	obj[1].handle = handle;
@@ -244,13 +249,13 @@ static void all(int fd, uint32_t handle, unsigned flags, int timeout)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(obj + 1);
 	execbuf.buffer_count = 1;
-	execbuf.rsvd1 = contexts[0];
+	execbuf.rsvd1 = contexts[0]->id;
 	execbuf.flags |= I915_EXEC_HANDLE_LUT;
 	execbuf.flags |= I915_EXEC_NO_RELOC;
 	igt_require(__gem_execbuf(fd, &execbuf) == 0);
 	gem_sync(fd, handle);
 
-	qlen = measure_qlen(fd, &execbuf, &engines, timeout);
+	qlen = measure_qlen(fd, base_cfg, &execbuf, &engines, timeout);
 	igt_info("Using timing depth of %d batches\n", qlen);
 
 	execbuf.buffers_ptr = to_user_pointer(obj);
@@ -267,7 +272,7 @@ static void all(int fd, uint32_t handle, unsigned flags, int timeout)
 				for (int loop = 0;
 				     loop < ARRAY_SIZE(contexts);
 				     loop++) {
-					execbuf.rsvd1 = contexts[loop];
+					execbuf.rsvd1 = contexts[loop]->id;
 					gem_execbuf(fd, &execbuf);
 				}
 				gem_sync(fd, obj[0].handle);
@@ -276,7 +281,7 @@ static void all(int fd, uint32_t handle, unsigned flags, int timeout)
 				do {
 					for (int loop = 0; loop < qlen; loop++) {
 						execbuf.rsvd1 =
-							contexts[loop % nctx];
+							contexts[loop % nctx]->id;
 						gem_execbuf(fd, &execbuf);
 					}
 					count += qlen;
@@ -300,7 +305,7 @@ static void all(int fd, uint32_t handle, unsigned flags, int timeout)
 	}
 
 	for (n = 0; n < ARRAY_SIZE(contexts); n++)
-		gem_context_destroy(fd, contexts[n]);
+		intel_ctx_destroy(fd, contexts[n]);
 }
 
 igt_main
@@ -308,6 +313,8 @@ igt_main
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	const struct intel_execution_engine2 *e2;
 	const struct intel_execution_ring *e;
+	const intel_ctx_cfg_t legacy_cfg = {};
+	intel_ctx_cfg_t engines_cfg;
 	static const struct {
 		const char *name;
 		unsigned int flags;
@@ -315,8 +322,8 @@ igt_main
 	} phases[] = {
 		{ "", 0, NULL },
 		{ "-interruptible", INTERRUPTIBLE, NULL },
-		{ "-queue", QUEUE, gem_has_queues },
-		{ "-queue-interruptible", QUEUE | INTERRUPTIBLE, gem_has_queues },
+		{ "-queue", QUEUE, gem_has_vm },
+		{ "-queue-interruptible", QUEUE | INTERRUPTIBLE, gem_has_vm },
 		{ }
 	};
 	uint32_t light = 0, heavy;
@@ -330,6 +337,8 @@ igt_main
 
 		gem_require_contexts(fd);
 
+		engines_cfg = intel_ctx_cfg_all_physical(fd);
+
 		light = gem_create(fd, 4096);
 		gem_write(fd, light, 0, &bbe, sizeof(bbe));
 
@@ -358,24 +367,26 @@ igt_main
 				}
 
 				igt_subtest_f("legacy-%s%s", e->name, p->name)
-					single(fd, light, e2, p->flags, 1, 2);
+					single(fd, light, &legacy_cfg, e2,
+					       p->flags, 1, 2);
 				igt_subtest_f("legacy-%s-heavy%s",
 					      e->name, p->name)
-					single(fd, heavy, e2, p->flags, 1, 2);
+					single(fd, heavy, &legacy_cfg, e2,
+					       p->flags, 1, 2);
 				igt_subtest_f("legacy-%s-forked%s",
 					      e->name, p->name)
-					single(fd, light, e2, p->flags, ncpus,
-					       20);
+					single(fd, light, &legacy_cfg, e2,
+					       p->flags, ncpus, 20);
 				igt_subtest_f("legacy-%s-forked-heavy%s",
 					      e->name, p->name)
-					single(fd, heavy, e2, p->flags, ncpus,
-					       20);
+					single(fd, heavy, &legacy_cfg, e2,
+					       p->flags, ncpus, 20);
 			}
 		}
 	}
 
 	/* Must come after legacy subtests. */
-	__for_each_physical_engine(fd, e2) {
+	for_each_ctx_cfg_engine(fd, &engines_cfg, e2) {
 		for (typeof(*phases) *p = phases; p->name; p++) {
 			igt_subtest_group {
 				igt_fixture {
@@ -384,33 +395,35 @@ igt_main
 				}
 
 				igt_subtest_f("%s%s", e2->name, p->name)
-					single(fd, light, e2, p->flags, 1, 2);
+					single(fd, light, &engines_cfg, e2,
+					       p->flags, 1, 2);
 				igt_subtest_f("%s-heavy%s", e2->name, p->name)
-					single(fd, heavy, e2, p->flags, 1, 2);
+					single(fd, heavy, &engines_cfg, e2,
+					       p->flags, 1, 2);
 				igt_subtest_f("%s-forked%s", e2->name, p->name)
-					single(fd, light, e2, p->flags, ncpus,
-					       20);
+					single(fd, light, &engines_cfg, e2,
+					       p->flags, ncpus, 20);
 				igt_subtest_f("%s-forked-heavy%s",
 					      e2->name, p->name)
-					single(fd, heavy, e2, p->flags, ncpus,
-					       20);
+					single(fd, heavy, &engines_cfg, e2,
+					       p->flags, ncpus, 20);
 			}
 		}
 	}
 
 	igt_subtest("all-light")
-		all(fd, light, 0, 2);
+		all(fd, light, &engines_cfg, 0, 2);
 	igt_subtest("all-heavy")
-		all(fd, heavy, 0, 2);
+		all(fd, heavy, &engines_cfg, 0, 2);
 
 	igt_subtest_group {
 		igt_fixture {
-			igt_require(gem_has_queues(fd));
+			gem_require_vm(fd);
 		}
 		igt_subtest("queue-light")
-			all(fd, light, QUEUE, 2);
+			all(fd, light, &engines_cfg, QUEUE, 2);
 		igt_subtest("queue-heavy")
-			all(fd, heavy, QUEUE, 2);
+			all(fd, heavy, &engines_cfg, QUEUE, 2);
 	}
 
 	igt_fixture {
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
