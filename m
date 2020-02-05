Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A8889350
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Feb 2020 12:39:57 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
Date: Wed,  5 Feb 2020 18:09:27 +0530
Message-Id: <20200205123927.2865-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH V2] [PATCH i-g-t] gem_ctx_create:Adjusted test to
 use __for_each_physical_engine to utilize all available engines
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
To: arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Changes :-
1) Added __for_each_physical_engine for subtest engines.
2) Moved test cases from static to dynamic.
3) used gem_context_clone_with_engines for creating contexts.
4) Passing NULL in active test to run test for all engines.

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Ursulin Tvrtko <tvrtko.ursulin@intel.com>
Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>

--
V1 -> V2
Modified files, active , maximum. with below change.

Added gem_reopen_driver and gem_context_copy_engines
to transfer the engine map from parent fd default
context.
---
 tests/i915/gem_ctx_create.c | 102 ++++++++++++++++++++++++++----------
 1 file changed, 75 insertions(+), 27 deletions(-)

diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
index d9a820e2..2c44a3e3 100644
--- a/tests/i915/gem_ctx_create.c
+++ b/tests/i915/gem_ctx_create.c
@@ -100,11 +100,18 @@ static void files(int core, int timeout, const int ncpus)
 	igt_fork(child, ncpus) {
 		struct timespec start, end;
 		unsigned count = 0;
+		int fd;
 
 		clock_gettime(CLOCK_MONOTONIC, &start);
 		do {
 			do {
-				int fd = drm_open_driver(DRIVER_INTEL);
+				fd = gem_reopen_driver(core);
+				/*
+				 * Ensure the gpu is idle by launching
+				 * a nop execbuf  and stalling for it.
+				 */
+				gem_quiescent_gpu(fd);
+				gem_context_copy_engines(core, 0, fd, 0);
 				obj.handle = gem_open(fd, name);
 				execbuf.flags &= ~ENGINE_FLAGS;
 				execbuf.flags |= ppgtt_engines[count % ppgtt_nengine];
@@ -124,22 +131,22 @@ static void files(int core, int timeout, const int ncpus)
 	gem_close(core, batch);
 }
 
-static void active(int fd, unsigned engine, int timeout, int ncpus)
+static void active(int fd, const struct intel_execution_engine2 *e,
+		   int timeout, int ncpus)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj;
 	unsigned int nengine, engines[16];
 	unsigned *shared;
-
-	if (engine == ALL_ENGINES) {
+	/* When e is NULL, test would run for all engines */
+	if (!e) {
 		igt_require(all_nengine);
 		nengine = all_nengine;
 		memcpy(engines, all_engines, sizeof(engines[0])*nengine);
 	} else {
-		gem_require_ring(fd, engine);
 		nengine = 1;
-		engines[0] = engine;
+		engines[0] = e->flags;
 	}
 
 	shared = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
@@ -156,8 +163,17 @@ static void active(int fd, unsigned engine, int timeout, int ncpus)
 	if (ncpus < 0) {
 		igt_fork(child, ppgtt_nengine) {
 			unsigned long count = 0;
+			int i915;
+
+			i915 = gem_reopen_driver(fd);
+			/*
+			 * Ensure the gpu is idle by launching
+			 * a nop execbuf and stalling for it
+			 */
+			gem_quiescent_gpu(i915);
+			gem_context_copy_engines(fd, 0, i915, 0);
 
-			if (ppgtt_engines[child] == engine)
+			if (ppgtt_engines[child] == e->flags)
 				continue;
 
 			execbuf.flags = ppgtt_engines[child];
@@ -179,11 +195,22 @@ static void active(int fd, unsigned engine, int timeout, int ncpus)
 	igt_fork(child, ncpus) {
 		struct timespec start, end;
 		unsigned count = 0;
+		int i915;
+		uint32_t ctx;
+
+		i915 = gem_reopen_driver(fd);
+		/*
+		 * Ensure the gpu is idle by launching
+		 * a nop execbuf and stalling for it.
+		 */
+		gem_quiescent_gpu(i915);
+		ctx = gem_context_create(i915);
+		gem_context_copy_engines(fd, 0, i915, ctx);
 
 		clock_gettime(CLOCK_MONOTONIC, &start);
 		do {
 			do {
-				execbuf.rsvd1 = gem_context_create(fd);
+				execbuf.rsvd1 = ctx;
 				for (unsigned n = 0; n < nengine; n++) {
 					execbuf.flags = engines[n];
 					gem_execbuf(fd, &execbuf);
@@ -276,7 +303,9 @@ static void maximum(int fd, int ncpus, unsigned mode)
 
 		err = -ENOMEM;
 		if (avail_mem > (count + 1) * ctx_size)
-			err = __gem_context_create(fd, &ctx_id);
+			err =  __gem_context_clone(fd, 0,
+						   I915_CONTEXT_CLONE_ENGINES,
+						   0, &ctx_id);
 		if (err) {
 			igt_info("Created %lu contexts, before failing with '%s' [%d]\n",
 				 count, strerror(-err), -err);
@@ -297,9 +326,18 @@ static void maximum(int fd, int ncpus, unsigned mode)
 
 	igt_fork(child, ncpus) {
 		struct timespec start, end;
+		int i915;
+
+		i915 = gem_reopen_driver(fd);
+		/*
+		 * Ensure the gpu is idle by launching
+		 * a nop execbuf and stalling for it.
+		 */
+		gem_quiescent_gpu(i915);
+		gem_context_copy_engines(fd, 0, i915, 0);
 
 		hars_petruska_f54_1_random_perturb(child);
-		obj[0].handle = gem_create(fd, 4096);
+		obj[0].handle = gem_create(i915, 4096);
 
 		clock_gettime(CLOCK_MONOTONIC, &start);
 		for (int repeat = 0; repeat < 3; repeat++) {
@@ -310,13 +348,13 @@ static void maximum(int fd, int ncpus, unsigned mode)
 				execbuf.rsvd1 = contexts[i];
 				for (unsigned long j = 0; j < all_nengine; j++) {
 					execbuf.flags = all_engines[j];
-					gem_execbuf(fd, &execbuf);
+					gem_execbuf(i915, &execbuf);
 				}
 			}
 		}
-		gem_sync(fd, obj[0].handle);
+		gem_sync(i915, obj[0].handle);
 		clock_gettime(CLOCK_MONOTONIC, &end);
-		gem_close(fd, obj[0].handle);
+		gem_close(i915, obj[0].handle);
 
 		igt_info("[%d] Context execution: %.3f us\n", child,
 			 elapsed(&start, &end) / (3 * count * all_nengine) * 1e6);
@@ -370,6 +408,7 @@ static void basic_ext_param(int i915)
 
 		gem_context_destroy(i915, create.ctx_id);
 
+
 		/* Having demonstrated a valid setup, check a few invalids */
 		ext.param.ctx_id = 1;
 		igt_assert_eq(create_ext_ioctl(i915, &create), -EINVAL);
@@ -524,6 +563,7 @@ igt_main
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	struct drm_i915_gem_context_create create;
+	const struct intel_execution_engine2 *e;
 	int fd = -1;
 
 	igt_fixture {
@@ -531,8 +571,8 @@ igt_main
 		igt_require_gem(fd);
 		gem_require_contexts(fd);
 
-		for_each_physical_engine(e, fd)
-			all_engines[all_nengine++] = eb_ring(e);
+		__for_each_physical_engine(fd, e)
+			all_engines[all_nengine++] = e->flags;
 		igt_require(all_nengine);
 
 		if (gem_uses_full_ppgtt(fd)) {
@@ -572,20 +612,28 @@ igt_main
 	igt_subtest("forked-files")
 		files(fd, 20, ncpus);
 
+	/* NULL value means all engines */
 	igt_subtest("active-all")
-		active(fd, ALL_ENGINES, 20, 1);
+		active(fd, NULL, 20, 1);
 	igt_subtest("forked-active-all")
-		active(fd, ALL_ENGINES, 20, ncpus);
-
-	for (const struct intel_execution_engine *e = intel_execution_engines;
-	     e->name; e++) {
-		igt_subtest_f("active-%s", e->name)
-			active(fd, eb_ring(e), 20, 1);
-		igt_subtest_f("forked-active-%s", e->name)
-			active(fd, eb_ring(e), 20, ncpus);
-		if (e->exec_id) {
-			igt_subtest_f("hog-%s", e->name)
-				active(fd, eb_ring(e), 20, -1);
+		active(fd, NULL, 20, ncpus);
+
+	igt_subtest_with_dynamic("active") {
+		__for_each_physical_engine(fd, e) {
+			igt_dynamic_f("%s", e->name)
+				active(fd, e, 20, 1);
+		}
+	}
+	igt_subtest_with_dynamic("forked-active") {
+		__for_each_physical_engine(fd, e) {
+			igt_dynamic_f("%s", e->name)
+				active(fd, e, 20, ncpus);
+		}
+	}
+	igt_subtest_with_dynamic("hog") {
+		__for_each_physical_engine(fd, e) {
+			igt_dynamic_f("%s", e->name)
+				active(fd, e, 20, -1);
 		}
 	}
 
-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
