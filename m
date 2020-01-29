Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAC46E19C
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 03:26:37 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
Date: Wed, 29 Jan 2020 08:56:05 +0530
Message-Id: <20200129032605.9007-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH V8] i915/gem_exec_nop:Adjusted test to utilize all
 available engines
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

Added __for_each_physical_engine to utilize all available engines.
Moved single, signal, preempt, poll and headless test cases
from static to dynamic group.

Cc: Dec Katarzyna <katarzyna.dec@intel.com>
Cc: Kempczynski Zbigniew <zbigniew.kempczynski@intel.com>
Cc: Tahvanainen Jari <jari.tahvanainen@intel.com>
Cc: Ursulin Tvrtko <tvrtko.ursulin@intel.com>
Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
V1 -> V2

Addressed Tvrtko review comments
1) removed gem_require_ring
2) replaced gem_can_store_dword with gem_class_can_store_dword
3) Fixed WhiteSpace issues.
---
V2 -> V3

Added back missing code. i.e. MIN_PRIO
---
V3 -> V4

1) Added gem_context_set_all_engines , that was deleted accidentally
2) Removed gem_require_ring from fence_signal
3) Passing NULL in fence_signal to run test for all engines.
---
V4 -> V5

Used gem_context_clone_with_engines for creating contexts
---
V5 -> V6

Added missing code to check context support. gem_context_clone_with_engines
 checks this by calling gem_context_create having igt_assert_eq for
__gem_context_create.
---
V6 -> V7

Minor correction related to check context support.
---
V7 -> V8

Used gem_require_contexts to check requirement of Context support.
gem_require_contexts has igt_require(gem_has_contexts(fd)) which
would skip test when condition is not met.
---
 tests/i915/gem_exec_nop.c | 173 +++++++++++++++++++++-----------------
 1 file changed, 96 insertions(+), 77 deletions(-)

diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
index 9a2efd32..ed9568e5 100644
--- a/tests/i915/gem_exec_nop.c
+++ b/tests/i915/gem_exec_nop.c
@@ -66,8 +66,9 @@ static double elapsed(const struct timespec *start, const struct timespec *end)
 		(end->tv_nsec - start->tv_nsec)*1e-9);
 }
 
-static double nop_on_ring(int fd, uint32_t handle, unsigned ring_id,
-			  int timeout, unsigned long *out)
+static double nop_on_ring(int fd, uint32_t handle,
+			  const struct intel_execution_engine2 *e, int timeout,
+			  unsigned long *out)
 {
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj;
@@ -80,11 +81,11 @@ static double nop_on_ring(int fd, uint32_t handle, unsigned ring_id,
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(&obj);
 	execbuf.buffer_count = 1;
-	execbuf.flags = ring_id;
+	execbuf.flags = e->flags;
 	execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
 	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
 	if (__gem_execbuf(fd, &execbuf)) {
-		execbuf.flags = ring_id;
+		execbuf.flags = e->flags;
 		gem_execbuf(fd, &execbuf);
 	}
 	intel_detect_and_clear_missed_interrupts(fd);
@@ -104,7 +105,8 @@ static double nop_on_ring(int fd, uint32_t handle, unsigned ring_id,
 	return elapsed(&start, &now);
 }
 
-static void poll_ring(int fd, unsigned engine, const char *name, int timeout)
+static void poll_ring(int fd, const struct intel_execution_engine2 *e,
+		      int timeout)
 {
 	const int gen = intel_gen(intel_get_drm_devid(fd));
 	const uint32_t MI_ARB_CHK = 0x5 << 23;
@@ -121,9 +123,8 @@ static void poll_ring(int fd, unsigned engine, const char *name, int timeout)
 	if (gen == 4 || gen == 5)
 		flags |= I915_EXEC_SECURE;
 
-	gem_require_ring(fd, engine);
-	igt_require(gem_can_store_dword(fd, engine));
-	igt_require(gem_engine_has_mutable_submission(fd, engine));
+	igt_require(gem_class_can_store_dword(fd, e->class));
+	igt_require(gem_class_has_mutable_submission(fd, e->class));
 
 	memset(&obj, 0, sizeof(obj));
 	obj.handle = gem_create(fd, 4096);
@@ -187,7 +188,7 @@ static void poll_ring(int fd, unsigned engine, const char *name, int timeout)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(&obj);
 	execbuf.buffer_count = 1;
-	execbuf.flags = engine | flags;
+	execbuf.flags = e->flags | flags;
 
 	cycles = 0;
 	do {
@@ -209,7 +210,7 @@ static void poll_ring(int fd, unsigned engine, const char *name, int timeout)
 	gem_sync(fd, obj.handle);
 
 	igt_info("%s completed %ld cycles: %.3f us\n",
-		 name, cycles, elapsed*1e-3/cycles);
+		 e->name, cycles, elapsed*1e-3/cycles);
 
 	munmap(batch, 4096);
 	gem_close(fd, obj.handle);
@@ -218,6 +219,7 @@ static void poll_ring(int fd, unsigned engine, const char *name, int timeout)
 static void poll_sequential(int fd, const char *name, int timeout)
 {
 	const int gen = intel_gen(intel_get_drm_devid(fd));
+	const struct intel_execution_engine2 *e;
 	const uint32_t MI_ARB_CHK = 0x5 << 23;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj[2];
@@ -234,13 +236,14 @@ static void poll_sequential(int fd, const char *name, int timeout)
 		flags |= I915_EXEC_SECURE;
 
 	nengine = 0;
-	for_each_physical_engine(e, fd) {
-		if (!gem_can_store_dword(fd, eb_ring(e)) ||
-		    !gem_engine_has_mutable_submission(fd, eb_ring(e)))
+	__for_each_physical_engine(fd, e) {
+		if (!gem_class_can_store_dword(fd, e->class) ||
+		    !gem_class_has_mutable_submission(fd, e->class))
 			continue;
 
-		engines[nengine++] = eb_ring(e);
+		engines[nengine++] = e->flags;
 	}
+
 	igt_require(nengine);
 
 	memset(obj, 0, sizeof(obj));
@@ -344,21 +347,20 @@ static void poll_sequential(int fd, const char *name, int timeout)
 }
 
 static void single(int fd, uint32_t handle,
-		   unsigned ring_id, const char *ring_name)
+		   const struct intel_execution_engine2 *e)
 {
 	double time;
 	unsigned long count;
 
-	gem_require_ring(fd, ring_id);
-
-	time = nop_on_ring(fd, handle, ring_id, 20, &count);
+	time = nop_on_ring(fd, handle, e, 20, &count);
 	igt_info("%s: %'lu cycles: %.3fus\n",
-		 ring_name, count, time*1e6 / count);
+		  e->name, count, time*1e6 / count);
 }
 
 static double
-stable_nop_on_ring(int fd, uint32_t handle, unsigned int engine,
-		   int timeout, int reps)
+stable_nop_on_ring(int fd, uint32_t handle,
+		   const struct intel_execution_engine2 *e, int timeout,
+		   int reps)
 {
 	igt_stats_t s;
 	double n;
@@ -372,7 +374,7 @@ stable_nop_on_ring(int fd, uint32_t handle, unsigned int engine,
 		unsigned long count;
 		double time;
 
-		time = nop_on_ring(fd, handle, engine, timeout, &count);
+		time = nop_on_ring(fd, handle, e, timeout, &count);
 		igt_stats_push_float(&s, time / count);
 	}
 
@@ -388,7 +390,8 @@ stable_nop_on_ring(int fd, uint32_t handle, unsigned int engine,
                      "'%s' != '%s' (%f not within %f%% tolerance of %f)\n",\
                      #x, #ref, x, tolerance * 100.0, ref)
 
-static void headless(int fd, uint32_t handle)
+static void headless(int fd, uint32_t handle,
+		     const struct intel_execution_engine2 *e)
 {
 	unsigned int nr_connected = 0;
 	drmModeConnector *connector;
@@ -411,7 +414,7 @@ static void headless(int fd, uint32_t handle)
 	kmstest_set_vt_graphics_mode();
 
 	/* benchmark nops */
-	n_display = stable_nop_on_ring(fd, handle, I915_EXEC_DEFAULT, 1, 5);
+	n_display = stable_nop_on_ring(fd, handle, e, 1, 5);
 	igt_info("With one display connected: %.2fus\n",
 		 n_display * 1e6);
 
@@ -419,7 +422,7 @@ static void headless(int fd, uint32_t handle)
 	kmstest_unset_all_crtcs(fd, res);
 
 	/* benchmark nops again */
-	n_headless = stable_nop_on_ring(fd, handle, I915_EXEC_DEFAULT, 1, 5);
+	n_headless = stable_nop_on_ring(fd, handle, e, 1, 5);
 	igt_info("Without a display connected (headless): %.2fus\n",
 		 n_headless * 1e6);
 
@@ -429,6 +432,7 @@ static void headless(int fd, uint32_t handle)
 
 static void parallel(int fd, uint32_t handle, int timeout)
 {
+	const struct intel_execution_engine2 *e;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj;
 	unsigned engines[16];
@@ -439,12 +443,11 @@ static void parallel(int fd, uint32_t handle, int timeout)
 
 	sum = 0;
 	nengine = 0;
-	for_each_physical_engine(e, fd) {
-		engines[nengine] = eb_ring(e);
-		names[nengine] = e->name;
-		nengine++;
+	__for_each_physical_engine(fd, e) {
+		engines[nengine] = e->flags;
+		names[nengine++] = e->name;
 
-		time = nop_on_ring(fd, handle, eb_ring(e), 1, &count) / count;
+		time = nop_on_ring(fd, handle, e, 1, &count) / count;
 		sum += time;
 		igt_debug("%s: %.3fus\n", e->name, 1e6*time);
 	}
@@ -490,6 +493,7 @@ static void parallel(int fd, uint32_t handle, int timeout)
 
 static void series(int fd, uint32_t handle, int timeout)
 {
+	const struct intel_execution_engine2 *e;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj;
 	struct timespec start, now, sync;
@@ -500,8 +504,8 @@ static void series(int fd, uint32_t handle, int timeout)
 	const char *name;
 
 	nengine = 0;
-	for_each_physical_engine(e, fd) {
-		time = nop_on_ring(fd, handle, eb_ring(e), 1, &count) / count;
+	__for_each_physical_engine(fd, e) {
+		time = nop_on_ring(fd, handle, e, 1, &count) / count;
 		if (time > max) {
 			name = e->name;
 			max = time;
@@ -509,7 +513,7 @@ static void series(int fd, uint32_t handle, int timeout)
 		if (time < min)
 			min = time;
 		sum += time;
-		engines[nengine++] = eb_ring(e);
+		engines[nengine++] = e->flags;
 	}
 	igt_require(nengine);
 	igt_info("Maximum execution latency on %s, %.3fus, min %.3fus, total %.3fus per cycle, average %.3fus\n",
@@ -580,6 +584,7 @@ static void xchg(void *array, unsigned i, unsigned j)
 static void sequential(int fd, uint32_t handle, unsigned flags, int timeout)
 {
 	const int ncpus = flags & FORKED ? sysconf(_SC_NPROCESSORS_ONLN) : 1;
+	const struct intel_execution_engine2 *e;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj[2];
 	unsigned engines[16];
@@ -595,14 +600,14 @@ static void sequential(int fd, uint32_t handle, unsigned flags, int timeout)
 
 	nengine = 0;
 	sum = 0;
-	for_each_physical_engine(e, fd) {
+	__for_each_physical_engine(fd, e) {
 		unsigned long count;
 
-		time = nop_on_ring(fd, handle, eb_ring(e), 1, &count) / count;
+		time = nop_on_ring(fd, handle, e, 1, &count) / count;
 		sum += time;
 		igt_debug("%s: %.3fus\n", e->name, 1e6*time);
 
-		engines[nengine++] = eb_ring(e);
+		engines[nengine++] = e->flags;
 	}
 	igt_require(nengine);
 	igt_info("Total (individual) execution latency %.3fus per cycle\n",
@@ -621,10 +626,8 @@ static void sequential(int fd, uint32_t handle, unsigned flags, int timeout)
 	igt_require(__gem_execbuf(fd, &execbuf) == 0);
 
 	if (flags & CONTEXT) {
-		uint32_t id;
-
-		igt_require(__gem_context_create(fd, &id) == 0);
-		execbuf.rsvd1 = id;
+		gem_require_contexts(fd);
+		execbuf.rsvd1 = gem_context_clone_with_engines(fd, 0);
 	}
 
 	for (n = 0; n < nengine; n++) {
@@ -642,8 +645,10 @@ static void sequential(int fd, uint32_t handle, unsigned flags, int timeout)
 		obj[0].handle = gem_create(fd, 4096);
 		gem_execbuf(fd, &execbuf);
 
-		if (flags & CONTEXT)
-			execbuf.rsvd1 = gem_context_create(fd);
+		if (flags & CONTEXT) {
+			gem_require_contexts(fd);
+			execbuf.rsvd1 = gem_context_clone_with_engines(fd, 0);
+		}
 
 		hars_petruska_f54_1_random_perturb(child);
 
@@ -710,12 +715,13 @@ static bool fence_wait(int fence)
 }
 
 static void fence_signal(int fd, uint32_t handle,
-			 unsigned ring_id, const char *ring_name,
-			 int timeout)
+			 const struct intel_execution_engine2 *ring_id,
+			 const char *ring_name, int timeout)
 {
 #define NFENCES 512
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj;
+	struct intel_execution_engine2 *__e;
 	struct timespec start, now;
 	unsigned engines[16];
 	unsigned nengine;
@@ -725,12 +731,11 @@ static void fence_signal(int fd, uint32_t handle,
 	igt_require(gem_has_exec_fence(fd));
 
 	nengine = 0;
-	if (ring_id == ALL_ENGINES) {
-		for_each_physical_engine(e, fd)
-			engines[nengine++] = eb_ring(e);
+	if (!ring_id) {
+		__for_each_physical_engine(fd, __e)
+			engines[nengine++] = __e->flags;
 	} else {
-		gem_require_ring(fd, ring_id);
-		engines[nengine++] = ring_id;
+		engines[nengine++] = ring_id->flags;
 	}
 	igt_require(nengine);
 
@@ -787,7 +792,7 @@ static void fence_signal(int fd, uint32_t handle,
 }
 
 static void preempt(int fd, uint32_t handle,
-		   unsigned ring_id, const char *ring_name)
+		    const struct intel_execution_engine2 *e)
 {
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj;
@@ -795,12 +800,10 @@ static void preempt(int fd, uint32_t handle,
 	unsigned long count;
 	uint32_t ctx[2];
 
-	gem_require_ring(fd, ring_id);
-
-	ctx[0] = gem_context_create(fd);
+	ctx[0] = gem_context_clone_with_engines(fd, 0);
 	gem_context_set_priority(fd, ctx[0], MIN_PRIO);
 
-	ctx[1] = gem_context_create(fd);
+	ctx[1] = gem_context_clone_with_engines(fd, 0);
 	gem_context_set_priority(fd, ctx[1], MAX_PRIO);
 
 	memset(&obj, 0, sizeof(obj));
@@ -809,11 +812,11 @@ static void preempt(int fd, uint32_t handle,
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(&obj);
 	execbuf.buffer_count = 1;
-	execbuf.flags = ring_id;
+	execbuf.flags = e->flags;
 	execbuf.flags |= LOCAL_I915_EXEC_HANDLE_LUT;
 	execbuf.flags |= LOCAL_I915_EXEC_NO_RELOC;
 	if (__gem_execbuf(fd, &execbuf)) {
-		execbuf.flags = ring_id;
+		execbuf.flags = e->flags;
 		gem_execbuf(fd, &execbuf);
 	}
 	execbuf.rsvd1 = ctx[1];
@@ -825,7 +828,7 @@ static void preempt(int fd, uint32_t handle,
 		igt_spin_t *spin =
 			__igt_spin_new(fd,
 				       .ctx = ctx[0],
-				       .engine = ring_id);
+				       .engine = e->flags);
 
 		for (int loop = 0; loop < 1024; loop++)
 			gem_execbuf(fd, &execbuf);
@@ -841,12 +844,12 @@ static void preempt(int fd, uint32_t handle,
 	gem_context_destroy(fd, ctx[0]);
 
 	igt_info("%s: %'lu cycles: %.3fus\n",
-		 ring_name, count, elapsed(&start, &now)*1e6 / count);
+		 e->name, count, elapsed(&start, &now)*1e6 / count);
 }
 
 igt_main
 {
-	const struct intel_execution_engine *e;
+	const struct intel_execution_engine2 *e;
 	uint32_t handle = 0;
 	int device = -1;
 
@@ -873,15 +876,24 @@ igt_main
 	igt_subtest("basic-sequential")
 		sequential(device, handle, 0, 2);
 
-	for (e = intel_execution_engines; e->name; e++) {
-		igt_subtest_f("%s", e->name)
-			single(device, handle, eb_ring(e), e->name);
-		igt_subtest_f("signal-%s", e->name)
-			fence_signal(device, handle, eb_ring(e), e->name, 2);
+	igt_subtest_with_dynamic("single") {
+		__for_each_physical_engine(device, e) {
+			igt_dynamic_f("%s", e->name)
+				single(device, handle, e);
+		}
+	}
+
+	igt_subtest_with_dynamic("signal") {
+		__for_each_physical_engine(device, e) {
+			igt_dynamic_f("%s", e->name)
+				fence_signal(device, handle, e,
+					     e->name, 2);
+		}
 	}
 
 	igt_subtest("signal-all")
-		fence_signal(device, handle, ALL_ENGINES, "all", 20);
+		/* NULL value means all engines */
+		fence_signal(device, handle, NULL, "all", 20);
 
 	igt_subtest("series")
 		series(device, handle, 20);
@@ -907,10 +919,11 @@ igt_main
 			igt_require(gem_scheduler_has_ctx_priority(device));
 			igt_require(gem_scheduler_has_preemption(device));
 		}
-
-		for (e = intel_execution_engines; e->name; e++) {
-			igt_subtest_f("preempt-%s", e->name)
-				preempt(device, handle, eb_ring(e), e->name);
+		igt_subtest_with_dynamic("preempt") {
+			__for_each_physical_engine(device, e) {
+				igt_dynamic_f("%s", e->name)
+					preempt(device, handle, e);
+			}
 		}
 	}
 
@@ -919,19 +932,25 @@ igt_main
 			igt_device_set_master(device);
 		}
 
-		for (e = intel_execution_engines; e->name; e++) {
-			/* Requires master for STORE_DWORD on gen4/5 */
-			igt_subtest_f("poll-%s", e->name)
-				poll_ring(device, eb_ring(e), e->name, 20);
+		igt_subtest_with_dynamic("poll") {
+			__for_each_physical_engine(device, e) {
+				/* Requires master for STORE_DWORD on gen4/5 */
+				igt_dynamic_f("%s", e->name)
+					poll_ring(device, e, 20);
+			}
+		}
+
+		igt_subtest_with_dynamic("headless") {
+			__for_each_physical_engine(device, e) {
+				igt_dynamic_f("%s", e->name)
+				/* Requires master for changing display modes */
+					headless(device, handle, e);
+			}
 		}
 
 		igt_subtest("poll-sequential")
 			poll_sequential(device, "Sequential", 20);
 
-		igt_subtest("headless") {
-			/* Requires master for changing display modes */
-			headless(device, handle);
-		}
 	}
 
 	igt_fixture {
-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
