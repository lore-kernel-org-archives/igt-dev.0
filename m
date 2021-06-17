Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DB56E29D
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 19:13:05 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id e33so5751461pgm.3
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jun 2021 12:13:05 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 17 Jun 2021 14:12:08 -0500
Message-Id: <20210617191256.577244-2-jason@jlekstrand.net>
In-Reply-To: <20210617191256.577244-1-jason@jlekstrand.net>
References: <20210617191256.577244-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 01/79] lib/i915/gem_submission_measure: Take
 an optional intel_ctx_cfg_t
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

If provided, the engine (or ALL_ENGINES) is relative to the given
context config.  This is intended to be transitional.  We'll get rid of
all the __for_each_physical_engine stuff later.
---
 lib/i915/gem_submission.c      | 39 ++++++++++++++++++++++++++++------
 lib/i915/gem_submission.h      |  5 ++++-
 tests/i915/gem_busy.c          |  2 +-
 tests/i915/gem_exec_await.c    |  2 +-
 tests/i915/gem_exec_fence.c    |  2 +-
 tests/i915/gem_exec_latency.c  |  2 +-
 tests/i915/gem_exec_schedule.c |  6 +++---
 tests/i915/perf_pmu.c          |  2 +-
 8 files changed, 44 insertions(+), 16 deletions(-)

diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
index bd4bbb3ef..7c305d6d6 100644
--- a/lib/i915/gem_submission.c
+++ b/lib/i915/gem_submission.c
@@ -306,7 +306,7 @@ static void alarm_handler(int sig)
 }
 
 static unsigned int
-__measure_ringsize(int i915, unsigned int engine)
+__measure_ringsize(int i915, uint32_t ctx_id, unsigned int engine)
 {
 	struct sigaction old_sa, sa = { .sa_handler = alarm_handler };
 	struct drm_i915_gem_exec_object2 obj[2];
@@ -323,6 +323,7 @@ __measure_ringsize(int i915, unsigned int engine)
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(&obj[1]);
 	execbuf.buffer_count = 1;
+	execbuf.rsvd1 = ctx_id;
 	execbuf.flags = engine;
 	gem_execbuf(i915, &execbuf);
 
@@ -372,8 +373,10 @@ __measure_ringsize(int i915, unsigned int engine)
 	return count / 2 - 2;
 }
 
-unsigned int gem_submission_measure(int i915, unsigned int engine)
+unsigned int gem_submission_measure(int i915, const intel_ctx_cfg_t *cfg,
+				    unsigned int engine)
 {
+	const intel_ctx_t *ctx = NULL;
 	unsigned int size;
 	bool nonblock;
 
@@ -381,19 +384,41 @@ unsigned int gem_submission_measure(int i915, unsigned int engine)
 	if (!nonblock)
 		fcntl(i915, F_SETFL, fcntl(i915, F_GETFL) | O_NONBLOCK);
 
+	if (cfg) {
+		if (gem_has_contexts(i915))
+			ctx = intel_ctx_create(i915, cfg);
+		else
+			ctx = intel_ctx_0(i915);
+	}
+
 	if (engine == ALL_ENGINES) {
 		struct intel_execution_engine2 *e;
 
 		size = -1;
-		__for_each_physical_engine(i915, e) {
-			unsigned int this =  __measure_ringsize(i915, e->flags);
-			if (this < size)
-				size = this;
+		if (ctx) {
+			for_each_ctx_engine(i915, ctx, e) {
+				unsigned int this =  __measure_ringsize(i915, ctx->id, e->flags);
+				if (this < size)
+					size = this;
+			}
+		} else {
+			__for_each_physical_engine(i915, e) {
+				unsigned int this =  __measure_ringsize(i915, 0, e->flags);
+				if (this < size)
+					size = this;
+			}
 		}
 	} else {
-		size =  __measure_ringsize(i915, engine);
+		if (ctx)
+			size =  __measure_ringsize(i915, ctx->id, engine);
+		else
+			size =  __measure_ringsize(i915, 0, engine);
 	}
 
+	if (ctx)
+		intel_ctx_destroy(i915, ctx);
+
+
 	if (!nonblock)
 		fcntl(i915, F_SETFL, fcntl(i915, F_GETFL) & ~O_NONBLOCK);
 
diff --git a/lib/i915/gem_submission.h b/lib/i915/gem_submission.h
index 0faba6a3e..a5497a5e2 100644
--- a/lib/i915/gem_submission.h
+++ b/lib/i915/gem_submission.h
@@ -26,6 +26,8 @@
 
 #include <stdint.h>
 
+#include "intel_ctx.h"
+
 #define GEM_SUBMISSION_SEMAPHORES	(1 << 0)
 #define GEM_SUBMISSION_EXECLISTS	(1 << 1)
 #define GEM_SUBMISSION_GUC		(1 << 2)
@@ -46,7 +48,8 @@ static inline bool gem_has_cmdparser(int i915, uint32_t engine)
 bool gem_has_blitter(int i915);
 void gem_require_blitter(int i915);
 
-unsigned int gem_submission_measure(int i915, unsigned int engine);
+unsigned int gem_submission_measure(int i915, const intel_ctx_cfg_t *cfg,
+				    unsigned int engine);
 
 void gem_test_engine(int fd, unsigned int engine);
 bool gem_has_relocations(int fd);
diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
index dc481f3c5..7e2b220aa 100644
--- a/tests/i915/gem_busy.c
+++ b/tests/i915/gem_busy.c
@@ -232,7 +232,7 @@ static void xchg_u32(void *array, unsigned i, unsigned j)
 static void close_race(int fd)
 {
 	const unsigned int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
-	const unsigned int nhandles = gem_submission_measure(fd, ALL_ENGINES);
+	const unsigned int nhandles = gem_submission_measure(fd, NULL, ALL_ENGINES);
 	unsigned int engines[I915_EXEC_RING_MASK + 1], nengine;
 	const struct intel_execution_engine2 *e;
 	unsigned long *control;
diff --git a/tests/i915/gem_exec_await.c b/tests/i915/gem_exec_await.c
index 6db30695f..ba8325ce3 100644
--- a/tests/i915/gem_exec_await.c
+++ b/tests/i915/gem_exec_await.c
@@ -237,7 +237,7 @@ igt_main
 		igt_require_gem(device);
 		gem_submission_print_method(device);
 
-		ring_size = gem_submission_measure(device, ALL_ENGINES);
+		ring_size = gem_submission_measure(device, NULL, ALL_ENGINES);
 
 		igt_info("Ring size: %d batches\n", ring_size);
 		igt_require(ring_size > 0);
diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index c3a650d89..6c4d3035f 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -3103,7 +3103,7 @@ igt_main
 		long ring_size = 0;
 
 		igt_fixture {
-			ring_size = gem_submission_measure(i915, ALL_ENGINES);
+			ring_size = gem_submission_measure(i915, NULL, ALL_ENGINES);
 			igt_info("Ring size: %ld batches\n", ring_size);
 			igt_require(ring_size);
 
diff --git a/tests/i915/gem_exec_latency.c b/tests/i915/gem_exec_latency.c
index d31e82bc1..62bad6171 100644
--- a/tests/i915/gem_exec_latency.c
+++ b/tests/i915/gem_exec_latency.c
@@ -897,7 +897,7 @@ igt_main
 
 		gem_submission_print_method(device);
 
-		ring_size = gem_submission_measure(device, ALL_ENGINES);
+		ring_size = gem_submission_measure(device, NULL, ALL_ENGINES);
 		igt_info("Ring size: %d batches\n", ring_size);
 		igt_require(ring_size > 8);
 		ring_size -= 8; /* leave some spare */
diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index fe3b8d29b..64a693ba5 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -1805,7 +1805,7 @@ static void deep(int fd, unsigned ring)
 		ctx[n] = gem_context_clone_with_engines(fd, 0);
 	}
 
-	nreq = gem_submission_measure(fd, ring) / (3 * XS) * MAX_CONTEXTS;
+	nreq = gem_submission_measure(fd, NULL, ring) / (3 * XS) * MAX_CONTEXTS;
 	if (nreq > max_req)
 		nreq = max_req;
 	igt_info("Using %d requests (prio range %d)\n", nreq, max_req);
@@ -1950,7 +1950,7 @@ static int __execbuf(int fd, struct drm_i915_gem_execbuffer2 *execbuf)
 
 static void wide(int fd, unsigned ring)
 {
-	const unsigned int ring_size = gem_submission_measure(fd, ring);
+	const unsigned int ring_size = gem_submission_measure(fd, NULL, ring);
 	struct timespec tv = {};
 	IGT_CORK_FENCE(cork);
 	uint32_t result;
@@ -1995,7 +1995,7 @@ static void wide(int fd, unsigned ring)
 
 static void reorder_wide(int fd, unsigned ring)
 {
-	const unsigned int ring_size = gem_submission_measure(fd, ring);
+	const unsigned int ring_size = gem_submission_measure(fd, NULL, ring);
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	const int priorities[] = { MIN_PRIO, MAX_PRIO };
 	struct drm_i915_gem_relocation_entry reloc;
diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index aa297bf19..f92f73919 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -1341,7 +1341,7 @@ static void cpu_hotplug(int gem_fd)
 
 static int target_num_interrupts(int i915)
 {
-	return min(gem_submission_measure(i915, I915_EXEC_DEFAULT), 30);
+	return min(gem_submission_measure(i915, NULL, I915_EXEC_DEFAULT), 30);
 }
 
 static void
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
