Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE716E17E
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 14:47:09 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id y4so2331004pfi.9
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jul 2021 07:47:09 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  7 Jul 2021 09:46:23 -0500
Message-Id: <20210707144643.181001-12-jason@jlekstrand.net>
In-Reply-To: <20210707144337.180693-1-jason@jlekstrand.net>
References: <20210707144337.180693-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 61/81] tests/i915/gem_ctx_create: Convert
 benchmarks to intel_ctx_t
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
 tests/i915/gem_ctx_create.c | 93 +++++++++++++++++++++----------------
 1 file changed, 52 insertions(+), 41 deletions(-)

diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
index 37061ebc5..448466523 100644
--- a/tests/i915/gem_ctx_create.c
+++ b/tests/i915/gem_ctx_create.c
@@ -79,7 +79,8 @@ static double elapsed(const struct timespec *start,
 	return (end->tv_sec - start->tv_sec) + 1e-9*(end->tv_nsec - start->tv_nsec);
 }
 
-static void files(int core, int timeout, const int ncpus)
+static void files(int core, const intel_ctx_cfg_t *cfg,
+		  int timeout, const int ncpus)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -98,18 +99,22 @@ static void files(int core, int timeout, const int ncpus)
 	igt_fork(child, ncpus) {
 		struct timespec start, end;
 		unsigned count = 0;
+		const intel_ctx_t *ctx;
 		int fd;
 
 		clock_gettime(CLOCK_MONOTONIC, &start);
 		do {
 			fd = gem_reopen_driver(core);
-			gem_context_copy_engines(core, 0, fd, 0);
+
+			ctx = intel_ctx_create(fd, cfg);
+			execbuf.rsvd1 = ctx->id;
 
 			obj.handle = gem_open(fd, name);
 			execbuf.flags &= ~ENGINE_FLAGS;
 			execbuf.flags |= ppgtt_engines[count % ppgtt_nengine];
 			gem_execbuf(fd, &execbuf);
 
+			intel_ctx_destroy(fd, ctx);
 			close(fd);
 			count++;
 
@@ -126,7 +131,8 @@ static void files(int core, int timeout, const int ncpus)
 	gem_close(core, batch);
 }
 
-static void active(int fd, const struct intel_execution_engine2 *e,
+static void active(int fd, const intel_ctx_cfg_t *cfg,
+		   const struct intel_execution_engine2 *e,
 		   int timeout, int ncpus)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
@@ -158,19 +164,19 @@ static void active(int fd, const struct intel_execution_engine2 *e,
 	if (ncpus < 0) {
 		igt_fork(child, ppgtt_nengine) {
 			unsigned long count = 0;
-			int i915;
+			const intel_ctx_t *ctx;
 
-			i915 = gem_reopen_driver(fd);
 			/*
 			 * Ensure the gpu is idle by launching
 			 * a nop execbuf and stalling for it
 			 */
-			gem_quiescent_gpu(i915);
-			gem_context_copy_engines(fd, 0, i915, 0);
+			gem_quiescent_gpu(fd);
 
 			if (ppgtt_engines[child] == e->flags)
 				continue;
 
+			ctx = intel_ctx_create(fd, cfg);
+			execbuf.rsvd1 = ctx->id;
 			execbuf.flags = ppgtt_engines[child];
 
 			while (!READ_ONCE(*shared)) {
@@ -183,6 +189,7 @@ static void active(int fd, const struct intel_execution_engine2 *e,
 			}
 
 			igt_debug("hog[%d]: cycles=%lu\n", child, count);
+			intel_ctx_destroy(fd, ctx);
 		}
 		ncpus = -ncpus;
 	}
@@ -190,33 +197,27 @@ static void active(int fd, const struct intel_execution_engine2 *e,
 	igt_fork(child, ncpus) {
 		struct timespec start, end;
 		unsigned count = 0;
-		int i915;
-		uint32_t ctx;
 
-		i915 = gem_reopen_driver(fd);
 		/*
 		 * Ensure the gpu is idle by launching
 		 * a nop execbuf and stalling for it.
 		 */
-		gem_quiescent_gpu(i915);
-		ctx = gem_context_create(i915);
-		gem_context_copy_engines(fd, 0, i915, ctx);
+		gem_quiescent_gpu(fd);
 
 		clock_gettime(CLOCK_MONOTONIC, &start);
 		do {
-			execbuf.rsvd1 = gem_context_clone_with_engines(fd, ctx);
+			const intel_ctx_t *ctx = intel_ctx_create(fd, cfg);
+			execbuf.rsvd1 = ctx->id;
 			for (unsigned n = 0; n < nengine; n++) {
 				execbuf.flags = engines[n];
 				gem_execbuf(fd, &execbuf);
 			}
-			gem_context_destroy(fd, execbuf.rsvd1);
+			intel_ctx_destroy(fd, ctx);
 			count++;
 
 			clock_gettime(CLOCK_MONOTONIC, &end);
 		} while (elapsed(&start, &end) < timeout);
 
-		gem_context_destroy(fd, ctx);
-
 		gem_sync(fd, obj.handle);
 		clock_gettime(CLOCK_MONOTONIC, &end);
 		igt_info("[%d] Context creation + execution: %.3f us\n",
@@ -239,6 +240,15 @@ static void xchg_u32(void *array, unsigned i, unsigned j)
 	a[j] = tmp;
 }
 
+static void xchg_ptr(void *array, unsigned i, unsigned j)
+{
+	void **a = array, *tmp;
+
+	tmp = a[i];
+	a[i] = a[j];
+	a[j] = tmp;
+}
+
 static unsigned __context_size(int fd)
 {
 	switch (intel_gen(intel_get_drm_devid(fd))) {
@@ -277,16 +287,17 @@ static uint64_t total_avail_mem(unsigned mode)
 	return total << 20;
 }
 
-static void maximum(int fd, int ncpus, unsigned mode)
+static void maximum(int fd, const intel_ctx_cfg_t *cfg,
+		    int ncpus, unsigned mode)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj[2];
 	uint64_t avail_mem = total_avail_mem(mode);
 	unsigned ctx_size = context_size(fd);
-	uint32_t *contexts = NULL;
+	const intel_ctx_t **contexts = NULL;
 	unsigned long count = 0;
-	uint32_t ctx_id;
+	const intel_ctx_t *ctx;
 
 	do {
 		int err;
@@ -300,16 +311,14 @@ static void maximum(int fd, int ncpus, unsigned mode)
 
 		err = -ENOMEM;
 		if (avail_mem > (count + 1) * ctx_size)
-			err =  __gem_context_clone(fd, 0,
-						   I915_CONTEXT_CLONE_ENGINES,
-						   0, &ctx_id);
+			err = __intel_ctx_create(fd, cfg, &ctx);
 		if (err) {
 			igt_info("Created %lu contexts, before failing with '%s' [%d]\n",
 				 count, strerror(-err), -err);
 			break;
 		}
 
-		contexts[count++] = ctx_id;
+		contexts[count++] = ctx;
 	} while (1);
 	igt_require(count);
 
@@ -329,11 +338,11 @@ static void maximum(int fd, int ncpus, unsigned mode)
 
 		clock_gettime(CLOCK_MONOTONIC, &start);
 		for (int repeat = 0; repeat < 3; repeat++) {
-			igt_permute_array(contexts, count, xchg_u32);
+			igt_permute_array(contexts, count, xchg_ptr);
 			igt_permute_array(all_engines, all_nengine, xchg_u32);
 
 			for (unsigned long i = 0; i < count; i++) {
-				execbuf.rsvd1 = contexts[i];
+				execbuf.rsvd1 = contexts[i]->id;
 				for (unsigned long j = 0; j < all_nengine; j++) {
 					execbuf.flags = all_engines[j];
 					gem_execbuf(fd, &execbuf);
@@ -352,7 +361,7 @@ static void maximum(int fd, int ncpus, unsigned mode)
 	gem_close(fd, obj[1].handle);
 
 	for (unsigned long i = 0; i < count; i++)
-		gem_context_destroy(fd, contexts[i]);
+		intel_ctx_destroy(fd, contexts[i]);
 	free(contexts);
 }
 
@@ -552,6 +561,7 @@ igt_main
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	struct drm_i915_gem_context_create create;
 	const struct intel_execution_engine2 *e;
+	intel_ctx_cfg_t cfg;
 	int fd = -1;
 
 	igt_fixture {
@@ -559,7 +569,8 @@ igt_main
 		igt_require_gem(fd);
 		gem_require_contexts(fd);
 
-		__for_each_physical_engine(fd, e)
+		cfg = intel_ctx_cfg_all_physical(fd);
+		for_each_ctx_cfg_engine(fd, &cfg, e)
 			all_engines[all_nengine++] = e->flags;
 		igt_require(all_nengine);
 
@@ -589,39 +600,39 @@ igt_main
 		iris_pipeline(fd);
 
 	igt_subtest("maximum-mem")
-		maximum(fd, ncpus, CHECK_RAM);
+		maximum(fd, &cfg, ncpus, CHECK_RAM);
 	igt_subtest("maximum-swap")
-		maximum(fd, ncpus, CHECK_RAM | CHECK_SWAP);
+		maximum(fd, &cfg, ncpus, CHECK_RAM | CHECK_SWAP);
 
 	igt_subtest("basic-files")
-		files(fd, 2, 1);
+		files(fd, &cfg, 2, 1);
 	igt_subtest("files")
-		files(fd, 20, 1);
+		files(fd, &cfg, 20, 1);
 	igt_subtest("forked-files")
-		files(fd, 20, ncpus);
+		files(fd, &cfg, 20, ncpus);
 
 	/* NULL value means all engines */
 	igt_subtest("active-all")
-		active(fd, NULL, 20, 1);
+		active(fd, &cfg, NULL, 20, 1);
 	igt_subtest("forked-active-all")
-		active(fd, NULL, 20, ncpus);
+		active(fd, &cfg, NULL, 20, ncpus);
 
 	igt_subtest_with_dynamic("active") {
-		__for_each_physical_engine(fd, e) {
+		for_each_ctx_cfg_engine(fd, &cfg, e) {
 			igt_dynamic_f("%s", e->name)
-				active(fd, e, 20, 1);
+				active(fd, &cfg, e, 20, 1);
 		}
 	}
 	igt_subtest_with_dynamic("forked-active") {
-		__for_each_physical_engine(fd, e) {
+		for_each_ctx_cfg_engine(fd, &cfg, e) {
 			igt_dynamic_f("%s", e->name)
-				active(fd, e, 20, ncpus);
+				active(fd, &cfg, e, 20, ncpus);
 		}
 	}
 	igt_subtest_with_dynamic("hog") {
-		__for_each_physical_engine(fd, e) {
+		for_each_ctx_cfg_engine(fd, &cfg, e) {
 			igt_dynamic_f("%s", e->name)
-				active(fd, e, 20, -1);
+				active(fd, &cfg, e, 20, -1);
 		}
 	}
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
