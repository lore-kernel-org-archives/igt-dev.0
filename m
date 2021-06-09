Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CCC6EA17
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 17:37:13 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id d16so18936708pfn.12
 for <igt-dev@lists.freedesktop.org>; Wed, 09 Jun 2021 10:37:13 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  9 Jun 2021 12:36:05 -0500
Message-Id: <20210609173632.248880-23-jason@jlekstrand.net>
In-Reply-To: <20210609173632.248880-1-jason@jlekstrand.net>
References: <20210609173632.248880-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 22/93] tests/i915/gem_exec_nop: Convert to
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
 tests/i915/gem_exec_nop.c | 156 ++++++++++++++++++++++----------------
 1 file changed, 92 insertions(+), 64 deletions(-)

diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
index e75ccb56..0d9f2d2c 100644
--- a/tests/i915/gem_exec_nop.c
+++ b/tests/i915/gem_exec_nop.c
@@ -46,6 +46,7 @@
 #include "igt_device.h"
 #include "igt_rand.h"
 #include "igt_sysfs.h"
+#include "intel_ctx.h"
 
 
 #define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
@@ -63,7 +64,7 @@ static double elapsed(const struct timespec *start, const struct timespec *end)
 		(end->tv_nsec - start->tv_nsec)*1e-9);
 }
 
-static double nop_on_ring(int fd, uint32_t handle,
+static double nop_on_ring(int fd, uint32_t handle, const intel_ctx_t *ctx,
 			  const struct intel_execution_engine2 *e,
 			  int timeout_ms,
 			  unsigned long *out)
@@ -82,6 +83,7 @@ static double nop_on_ring(int fd, uint32_t handle,
 	execbuf.flags = e->flags;
 	execbuf.flags |= I915_EXEC_HANDLE_LUT;
 	execbuf.flags |= I915_EXEC_NO_RELOC;
+	execbuf.rsvd1 = ctx->id;
 	if (__gem_execbuf(fd, &execbuf)) {
 		execbuf.flags = e->flags;
 		gem_execbuf(fd, &execbuf);
@@ -102,7 +104,8 @@ static double nop_on_ring(int fd, uint32_t handle,
 	return elapsed(&start, &now);
 }
 
-static void poll_ring(int fd, const struct intel_execution_engine2 *e,
+static void poll_ring(int fd, const intel_ctx_t *ctx,
+		      const struct intel_execution_engine2 *e,
 		      int timeout)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
@@ -186,6 +189,7 @@ static void poll_ring(int fd, const struct intel_execution_engine2 *e,
 	execbuf.buffers_ptr = to_user_pointer(&obj);
 	execbuf.buffer_count = 1;
 	execbuf.flags = e->flags | flags;
+	execbuf.rsvd1 = ctx->id;
 
 	cycles = 0;
 	do {
@@ -213,7 +217,8 @@ static void poll_ring(int fd, const struct intel_execution_engine2 *e,
 	gem_close(fd, obj.handle);
 }
 
-static void poll_sequential(int fd, const char *name, int timeout)
+static void poll_sequential(int fd, const intel_ctx_t *ctx,
+			    const char *name, int timeout)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	const struct intel_execution_engine2 *e;
@@ -233,7 +238,7 @@ static void poll_sequential(int fd, const char *name, int timeout)
 		flags |= I915_EXEC_SECURE;
 
 	nengine = 0;
-	__for_each_physical_engine(fd, e) {
+	for_each_ctx_engine(fd, ctx, e) {
 		if (!gem_class_can_store_dword(fd, e->class) ||
 		    !gem_class_has_mutable_submission(fd, e->class))
 			continue;
@@ -313,6 +318,7 @@ static void poll_sequential(int fd, const char *name, int timeout)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(obj);
 	execbuf.buffer_count = ARRAY_SIZE(obj);
+	execbuf.rsvd1 = ctx->id;
 
 	cycles = 0;
 	do {
@@ -343,19 +349,19 @@ static void poll_sequential(int fd, const char *name, int timeout)
 	gem_close(fd, obj[0].handle);
 }
 
-static void single(int fd, uint32_t handle,
+static void single(int fd, uint32_t handle, const intel_ctx_t *ctx,
 		   const struct intel_execution_engine2 *e)
 {
 	double time;
 	unsigned long count;
 
-	time = nop_on_ring(fd, handle, e, 20000, &count);
+	time = nop_on_ring(fd, handle, ctx, e, 20000, &count);
 	igt_info("%s: %'lu cycles: %.3fus\n",
 		  e->name, count, time*1e6 / count);
 }
 
 static double
-stable_nop_on_ring(int fd, uint32_t handle,
+stable_nop_on_ring(int fd, uint32_t handle, const intel_ctx_t *ctx,
 		   const struct intel_execution_engine2 *e,
 		   int timeout_ms,
 		   int reps)
@@ -372,7 +378,7 @@ stable_nop_on_ring(int fd, uint32_t handle,
 		unsigned long count;
 		double time;
 
-		time = nop_on_ring(fd, handle, e, timeout_ms, &count);
+		time = nop_on_ring(fd, handle, ctx, e, timeout_ms, &count);
 		igt_stats_push_float(&s, time / count);
 	}
 
@@ -388,7 +394,7 @@ stable_nop_on_ring(int fd, uint32_t handle,
                      "'%s' != '%s' (%f not within %f%% tolerance of %f)\n",\
                      #x, #ref, x, tolerance * 100.0, ref)
 
-static void headless(int fd, uint32_t handle,
+static void headless(int fd, uint32_t handle, const intel_ctx_t *ctx,
 		     const struct intel_execution_engine2 *e)
 {
 	unsigned int nr_connected = 0;
@@ -412,11 +418,11 @@ static void headless(int fd, uint32_t handle,
 	/* set graphics mode to prevent blanking */
 	kmstest_set_vt_graphics_mode();
 
-	nop_on_ring(fd, handle, e, 10, &count);
+	nop_on_ring(fd, handle, ctx, e, 10, &count);
 	igt_require_f(count > 100, "submillisecond precision required\n");
 
 	/* benchmark nops */
-	n_display = stable_nop_on_ring(fd, handle, e, 500, 5);
+	n_display = stable_nop_on_ring(fd, handle, ctx, e, 500, 5);
 	igt_info("With one display connected: %.2fus\n",
 		 n_display * 1e6);
 
@@ -424,7 +430,7 @@ static void headless(int fd, uint32_t handle,
 	kmstest_unset_all_crtcs(fd, res);
 
 	/* benchmark nops again */
-	n_headless = stable_nop_on_ring(fd, handle, e, 500, 5);
+	n_headless = stable_nop_on_ring(fd, handle, ctx, e, 500, 5);
 	igt_info("Without a display connected (headless): %.2fus\n",
 		 n_headless * 1e6);
 
@@ -432,7 +438,8 @@ static void headless(int fd, uint32_t handle,
 	assert_within_epsilon(n_headless, n_display, 0.1f);
 }
 
-static void parallel(int fd, uint32_t handle, int timeout)
+static void parallel(int fd, uint32_t handle,
+		     const intel_ctx_t *ctx, int timeout)
 {
 	const struct intel_execution_engine2 *e;
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -446,11 +453,11 @@ static void parallel(int fd, uint32_t handle, int timeout)
 	sum = 0;
 	nengine = 0;
 
-	__for_each_physical_engine(fd, e) {
+	for_each_ctx_engine(fd, ctx, e) {
 		engines[nengine] = e->flags;
 		names[nengine++] = strdup(e->name);
 
-		time = nop_on_ring(fd, handle, e, 250, &count) / count;
+		time = nop_on_ring(fd, handle, ctx, e, 250, &count) / count;
 		sum += time;
 		igt_debug("%s: %.3fus\n", e->name, 1e6*time);
 	}
@@ -465,6 +472,7 @@ static void parallel(int fd, uint32_t handle, int timeout)
 	execbuf.buffer_count = 1;
 	execbuf.flags |= I915_EXEC_HANDLE_LUT;
 	execbuf.flags |= I915_EXEC_NO_RELOC;
+	execbuf.rsvd1 = ctx->id;
 	if (__gem_execbuf(fd, &execbuf)) {
 		execbuf.flags = 0;
 		gem_execbuf(fd, &execbuf);
@@ -495,7 +503,8 @@ static void parallel(int fd, uint32_t handle, int timeout)
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
 }
 
-static void independent(int fd, uint32_t handle, int timeout)
+static void independent(int fd, uint32_t handle,
+			const intel_ctx_t *ctx, int timeout)
 {
 	const struct intel_execution_engine2 *e;
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -508,11 +517,11 @@ static void independent(int fd, uint32_t handle, int timeout)
 
 	sum = 0;
 	nengine = 0;
-	__for_each_physical_engine(fd, e) {
+	for_each_ctx_engine(fd, ctx, e) {
 		engines[nengine] = e->flags;
 		names[nengine++] = strdup(e->name);
 
-		time = nop_on_ring(fd, handle, e, 250, &count) / count;
+		time = nop_on_ring(fd, handle, ctx, e, 250, &count) / count;
 		sum += time;
 		igt_debug("%s: %.3fus\n", e->name, 1e6*time);
 	}
@@ -527,6 +536,7 @@ static void independent(int fd, uint32_t handle, int timeout)
 	execbuf.buffer_count = 1;
 	execbuf.flags |= I915_EXEC_HANDLE_LUT;
 	execbuf.flags |= I915_EXEC_NO_RELOC;
+	execbuf.rsvd1 = ctx->id;
 	if (__gem_execbuf(fd, &execbuf)) {
 		execbuf.flags = 0;
 		gem_execbuf(fd, &execbuf);
@@ -563,7 +573,7 @@ static void independent(int fd, uint32_t handle, int timeout)
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
 }
 
-static void multiple(int fd,
+static void multiple(int fd, const intel_ctx_t *ctx,
 		     const struct intel_execution_engine2 *e,
 		     int timeout)
 {
@@ -582,6 +592,7 @@ static void multiple(int fd,
 	execbuf.flags = e->flags;
 	execbuf.flags |= I915_EXEC_HANDLE_LUT;
 	execbuf.flags |= I915_EXEC_NO_RELOC;
+	execbuf.rsvd1 = ctx->id;
 	if (__gem_execbuf(fd, &execbuf)) {
 		execbuf.flags = e->flags;
 		gem_execbuf(fd, &execbuf);
@@ -593,9 +604,11 @@ static void multiple(int fd,
 		unsigned long count;
 		double time;
 		int i915;
+		const intel_ctx_t *child_ctx;
 
 		i915 = gem_reopen_driver(fd);
-		gem_context_copy_engines(fd, 0, i915, 0);
+		child_ctx = intel_ctx_create(i915, &ctx->cfg);
+		execbuf.rsvd1 = child_ctx->id;
 
 		obj.handle = gem_create(i915, 4096);
 		gem_write(i915, obj.handle, 0, &bbe, sizeof(bbe));
@@ -610,6 +623,7 @@ static void multiple(int fd,
 		} while (elapsed(&start, &now) < timeout);
 		time = elapsed(&start, &now) / count;
 		igt_info("%d: %ld cycles, %.3fus\n", child, count, 1e6*time);
+		intel_ctx_destroy(i915, child_ctx);
 	}
 
 	igt_waitchildren();
@@ -618,7 +632,8 @@ static void multiple(int fd,
 	gem_close(fd, obj.handle);
 }
 
-static void series(int fd, uint32_t handle, int timeout)
+static void series(int fd, uint32_t handle,
+		   const intel_ctx_t *ctx, int timeout)
 {
 	const struct intel_execution_engine2 *e;
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -631,8 +646,8 @@ static void series(int fd, uint32_t handle, int timeout)
 	const char *name;
 
 	nengine = 0;
-	__for_each_physical_engine(fd, e) {
-		time = nop_on_ring(fd, handle, e, 250, &count) / count;
+	for_each_ctx_engine(fd, ctx, e) {
+		time = nop_on_ring(fd, handle, ctx, e, 250, &count) / count;
 		if (time > max) {
 			name = e->name;
 			max = time;
@@ -654,6 +669,7 @@ static void series(int fd, uint32_t handle, int timeout)
 	execbuf.buffer_count = 1;
 	execbuf.flags |= I915_EXEC_HANDLE_LUT;
 	execbuf.flags |= I915_EXEC_NO_RELOC;
+	execbuf.rsvd1 = ctx->id;
 	if (__gem_execbuf(fd, &execbuf)) {
 		execbuf.flags = 0;
 		gem_execbuf(fd, &execbuf);
@@ -689,9 +705,11 @@ static void xchg(void *array, unsigned i, unsigned j)
 	u[j] = tmp;
 }
 
-static void sequential(int fd, uint32_t handle, unsigned flags, int timeout)
+static void sequential(int fd, uint32_t handle,
+		       const intel_ctx_t *ctx, unsigned flags, int timeout)
 {
 	const int ncpus = flags & FORKED ? sysconf(_SC_NPROCESSORS_ONLN) : 1;
+	const intel_ctx_t *tmp_ctx = NULL, *child_ctx = NULL;
 	const struct intel_execution_engine2 *e;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj[2];
@@ -708,10 +726,10 @@ static void sequential(int fd, uint32_t handle, unsigned flags, int timeout)
 
 	nengine = 0;
 	sum = 0;
-	__for_each_physical_engine(fd, e) {
+	for_each_ctx_engine(fd, ctx, e) {
 		unsigned long count;
 
-		time = nop_on_ring(fd, handle, e, 250, &count) / count;
+		time = nop_on_ring(fd, handle, ctx, e, 250, &count) / count;
 		sum += time;
 		igt_debug("%s: %.3fus\n", e->name, 1e6*time);
 
@@ -735,7 +753,8 @@ static void sequential(int fd, uint32_t handle, unsigned flags, int timeout)
 
 	if (flags & CONTEXT) {
 		gem_require_contexts(fd);
-		execbuf.rsvd1 = gem_context_clone_with_engines(fd, 0);
+		tmp_ctx = intel_ctx_create(fd, &ctx->cfg);
+		execbuf.rsvd1 = tmp_ctx->id;
 	}
 
 	for (n = 0; n < nengine; n++) {
@@ -755,7 +774,8 @@ static void sequential(int fd, uint32_t handle, unsigned flags, int timeout)
 
 		if (flags & CONTEXT) {
 			gem_require_contexts(fd);
-			execbuf.rsvd1 = gem_context_clone_with_engines(fd, 0);
+			child_ctx = intel_ctx_create(fd, &ctx->cfg);
+			execbuf.rsvd1 = child_ctx->id;
 		}
 
 		hars_petruska_f54_1_random_perturb(child);
@@ -778,7 +798,7 @@ static void sequential(int fd, uint32_t handle, unsigned flags, int timeout)
 		results[child] = elapsed(&start, &now) / count;
 
 		if (flags & CONTEXT)
-			gem_context_destroy(fd, execbuf.rsvd1);
+			intel_ctx_destroy(fd, child_ctx);
 
 		gem_close(fd, obj[0].handle);
 	}
@@ -794,7 +814,7 @@ static void sequential(int fd, uint32_t handle, unsigned flags, int timeout)
 		 nengine, ncpus, 1e6*results[ncpus], 1e6*sum*ncpus);
 
 	if (flags & CONTEXT)
-		gem_context_destroy(fd, execbuf.rsvd1);
+		intel_ctx_destroy(fd, tmp_ctx);
 
 	gem_close(fd, obj[0].handle);
 	munmap(results, 4096);
@@ -811,6 +831,7 @@ static bool fence_wait(int fence)
 }
 
 static void fence_signal(int fd, uint32_t handle,
+			 const intel_ctx_t *ctx,
 			 const struct intel_execution_engine2 *ring_id,
 			 const char *ring_name, int timeout)
 {
@@ -828,7 +849,7 @@ static void fence_signal(int fd, uint32_t handle,
 
 	nengine = 0;
 	if (!ring_id) {
-		__for_each_physical_engine(fd, __e)
+		for_each_ctx_engine(fd, ctx, __e)
 			engines[nengine++] = __e->flags;
 	} else {
 		engines[nengine++] = ring_id->flags;
@@ -846,6 +867,7 @@ static void fence_signal(int fd, uint32_t handle,
 	execbuf.buffers_ptr = to_user_pointer(&obj);
 	execbuf.buffer_count = 1;
 	execbuf.flags = I915_EXEC_FENCE_OUT;
+	execbuf.rsvd1 = ctx->id;
 
 	n = 0;
 	count = 0;
@@ -886,20 +908,21 @@ static void fence_signal(int fd, uint32_t handle,
 }
 
 static void preempt(int fd, uint32_t handle,
+		    const intel_ctx_t *ctx,
 		    const struct intel_execution_engine2 *e)
 {
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj;
 	struct timespec start, now;
 	unsigned long count;
-	uint32_t ctx[2];
+	const intel_ctx_t *tmp_ctx[2];
 	igt_spin_t *spin;
 
-	ctx[0] = gem_context_clone_with_engines(fd, 0);
-	gem_context_set_priority(fd, ctx[0], MIN_PRIO);
+	tmp_ctx[0] = intel_ctx_create(fd, &ctx->cfg);
+	gem_context_set_priority(fd, tmp_ctx[0]->id, MIN_PRIO);
 
-	ctx[1] = gem_context_clone_with_engines(fd, 0);
-	gem_context_set_priority(fd, ctx[1], MAX_PRIO);
+	tmp_ctx[1] = intel_ctx_create(fd, &ctx->cfg);
+	gem_context_set_priority(fd, tmp_ctx[1]->id, MAX_PRIO);
 
 	memset(&obj, 0, sizeof(obj));
 	obj.handle = handle;
@@ -910,15 +933,16 @@ static void preempt(int fd, uint32_t handle,
 	execbuf.flags = e->flags;
 	execbuf.flags |= I915_EXEC_HANDLE_LUT;
 	execbuf.flags |= I915_EXEC_NO_RELOC;
+	execbuf.rsvd1 = ctx->id;
 	if (__gem_execbuf(fd, &execbuf)) {
 		execbuf.flags = e->flags;
 		gem_execbuf(fd, &execbuf);
 	}
-	execbuf.rsvd1 = ctx[1];
+	execbuf.rsvd1 = tmp_ctx[1]->id;
 	intel_detect_and_clear_missed_interrupts(fd);
 
 	count = 0;
-	spin = __igt_spin_new(fd, .ctx_id = ctx[0], .engine = e->flags);
+	spin = __igt_spin_new(fd, .ctx = tmp_ctx[0], .engine = e->flags);
 	clock_gettime(CLOCK_MONOTONIC, &start);
 	do {
 		gem_execbuf(fd, &execbuf);
@@ -928,8 +952,8 @@ static void preempt(int fd, uint32_t handle,
 	igt_spin_free(fd, spin);
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
 
-	gem_context_destroy(fd, ctx[1]);
-	gem_context_destroy(fd, ctx[0]);
+	intel_ctx_destroy(fd, tmp_ctx[1]);
+	intel_ctx_destroy(fd, tmp_ctx[0]);
 
 	igt_info("%s: %'lu cycles: %.3fus\n",
 		 e->name, count, elapsed(&start, &now)*1e6 / count);
@@ -938,6 +962,7 @@ static void preempt(int fd, uint32_t handle,
 igt_main
 {
 	const struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx = NULL;
 	uint32_t handle = 0;
 	int device = -1;
 
@@ -949,6 +974,8 @@ igt_main
 		gem_submission_print_method(device);
 		gem_scheduler_print_capability(device);
 
+		ctx = intel_ctx_create_all_physical(device);
+
 		handle = gem_create(device, 4096);
 		gem_write(device, handle, 0, &bbe, sizeof(bbe));
 
@@ -956,57 +983,57 @@ igt_main
 	}
 
 	igt_subtest("basic-series")
-		series(device, handle, 2);
+		series(device, handle, ctx, 2);
 
 	igt_subtest("basic-parallel")
-		parallel(device, handle, 2);
+		parallel(device, handle, ctx, 2);
 
 	igt_subtest("basic-sequential")
-		sequential(device, handle, 0, 2);
+		sequential(device, handle, ctx, 0, 2);
 
 	igt_subtest_with_dynamic("single") {
-		__for_each_physical_engine(device, e) {
+		for_each_ctx_engine(device, ctx, e) {
 			igt_dynamic_f("%s", e->name)
-				single(device, handle, e);
+				single(device, handle, ctx, e);
 		}
 	}
 
 	igt_subtest_with_dynamic("signal") {
-		__for_each_physical_engine(device, e) {
+		for_each_ctx_engine(device, ctx, e) {
 			igt_dynamic_f("%s", e->name)
-				fence_signal(device, handle, e,
-					     e->name, 2);
+				fence_signal(device, handle, ctx,
+					     e, e->name, 2);
 		}
 	}
 
 	igt_subtest("signal-all")
 		/* NULL value means all engines */
-		fence_signal(device, handle, NULL, "all", 20);
+		fence_signal(device, handle, ctx, NULL, "all", 20);
 
 	igt_subtest("series")
-		series(device, handle, 20);
+		series(device, handle, ctx, 20);
 
 	igt_subtest("parallel")
-		parallel(device, handle, 20);
+		parallel(device, handle, ctx, 20);
 
 	igt_subtest("independent")
-		independent(device, handle, 20);
+		independent(device, handle, ctx, 20);
 
 	igt_subtest_with_dynamic("multiple") {
-		__for_each_physical_engine(device, e) {
+		for_each_ctx_engine(device, ctx, e) {
 			igt_dynamic_f("%s", e->name)
-				multiple(device, e, 20);
+				multiple(device, ctx, e, 20);
 		}
 	}
 
 	igt_subtest("sequential")
-		sequential(device, handle, 0, 20);
+		sequential(device, handle, ctx, 0, 20);
 
 	igt_subtest("forked-sequential")
-		sequential(device, handle, FORKED, 20);
+		sequential(device, handle, ctx, FORKED, 20);
 
 	igt_subtest("context-sequential")
-		sequential(device, handle, FORKED | CONTEXT, 20);
+		sequential(device, handle, ctx, FORKED | CONTEXT, 20);
 
 	igt_subtest_group {
 		igt_fixture {
@@ -1015,9 +1042,9 @@ igt_main
 			igt_require(gem_scheduler_has_preemption(device));
 		}
 		igt_subtest_with_dynamic("preempt") {
-			__for_each_physical_engine(device, e) {
+			for_each_ctx_engine(device, ctx, e) {
 				igt_dynamic_f("%s", e->name)
-					preempt(device, handle, e);
+					preempt(device, handle, ctx, e);
 			}
 		}
 	}
@@ -1028,29 +1055,30 @@ igt_main
 		}
 
 		igt_subtest_with_dynamic("poll") {
-			__for_each_physical_engine(device, e) {
+			for_each_ctx_engine(device, ctx, e) {
 				/* Requires master for STORE_DWORD on gen4/5 */
 				igt_dynamic_f("%s", e->name)
-					poll_ring(device, e, 20);
+					poll_ring(device, ctx, e, 20);
 			}
 		}
 
 		igt_subtest_with_dynamic("headless") {
-			__for_each_physical_engine(device, e) {
+			for_each_ctx_engine(device, ctx, e) {
 				igt_dynamic_f("%s", e->name)
 				/* Requires master for changing display modes */
-					headless(device, handle, e);
+					headless(device, handle, ctx, e);
 			}
 		}
 
 		igt_subtest("poll-sequential")
-			poll_sequential(device, "Sequential", 20);
+			poll_sequential(device, ctx, "Sequential", 20);
 
 	}
 
 	igt_fixture {
 		igt_stop_hang_detector();
 		gem_close(device, handle);
+		intel_ctx_destroy(device, ctx);
 		close(device);
 	}
 }
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
