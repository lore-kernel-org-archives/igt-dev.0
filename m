Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri,  8 May 2020 15:56:31 +0200
Message-Id: <20200508135631.8099-3-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200508135631.8099-1-janusz.krzysztofik@linux.intel.com>
References: <20200508135631.8099-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/gem_exec_nop: Remove submission
 batching
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
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Execbuf requests are now submitted by subtests in batches of 1024
repetitions.  That may be too many under some circumstances (e.g.,
intensive logging output) and subtests may take far more time than
expected.

The reason standing behind that batching was unacceptable microsecond
imprecision of gettime when gem_exec_nop was a benchmark rather than a
test and time measurement was looking for a precision of ~100 ns.
Since that measurement is now mostly informative and not a pass/fail
metric, we can be more tolerant and accept overhead of gettime after
each submission.

Remove the batching from the body of subtests which don't require
submicrosecond precision and measure time after each execbuf request
submission (or a group of one submission per engine).  Since there is
one subtest - "headless" - which still requires more precise time
measurement, don't remove the batching from nop_on_ring() helper but
let its users request non-batched submission mode instead.  To make
this even more flexible, change semantics of the helper argument used
so far for returning the count of submissions completed within the
requested time frame and use it also for passing desired batch size
(number of iterations), then update its users to initialize that
argument according to their individual requirements.

Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/i915/gem_exec_nop.c | 120 +++++++++++++++++++-------------------
 1 file changed, 59 insertions(+), 61 deletions(-)

diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
index c17d672c3..10639765b 100644
--- a/tests/i915/gem_exec_nop.c
+++ b/tests/i915/gem_exec_nop.c
@@ -71,12 +71,14 @@ static double elapsed(const struct timespec *start, const struct timespec *end)
 
 static double nop_on_ring(int fd, uint32_t handle,
 			  const struct intel_execution_engine2 *e, int timeout,
-			  unsigned long *out)
+			  unsigned long *count)
 {
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj;
 	struct timespec start, now;
-	unsigned long count;
+	unsigned long total;
+
+	igt_assert(*count);
 
 	memset(&obj, 0, sizeof(obj));
 	obj.handle = handle;
@@ -93,18 +95,18 @@ static double nop_on_ring(int fd, uint32_t handle,
 	}
 	intel_detect_and_clear_missed_interrupts(fd);
 
-	count = 0;
+	total = 0;
 	clock_gettime(CLOCK_MONOTONIC, &start);
 	do {
-		for (int loop = 0; loop < 1024; loop++)
+		for (int loop = 0; loop < *count; loop++)
 			gem_execbuf(fd, &execbuf);
 
-		count += 1024;
+		total += *count;
 		clock_gettime(CLOCK_MONOTONIC, &now);
 	} while (elapsed(&start, &now) < timeout);
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
 
-	*out = count;
+	*count = total;
 	return elapsed(&start, &now);
 }
 
@@ -353,7 +355,7 @@ static void single(int fd, uint32_t handle,
 		   const struct intel_execution_engine2 *e)
 {
 	double time;
-	unsigned long count;
+	unsigned long count = 1;
 
 	time = nop_on_ring(fd, handle, e, 20, &count);
 	igt_info("%s: %'lu cycles: %.3fus\n",
@@ -374,7 +376,7 @@ stable_nop_on_ring(int fd, uint32_t handle,
 	s.is_float = true;
 
 	while (reps--) {
-		unsigned long count;
+		unsigned long count = 1024;
 		double time;
 
 		time = nop_on_ring(fd, handle, e, timeout, &count);
@@ -451,6 +453,7 @@ static void parallel(int fd, uint32_t handle, int timeout)
 		engines[nengine] = e->flags;
 		names[nengine++] = strdup(e->name);
 
+		count = 1;
 		time = nop_on_ring(fd, handle, e, 1, &count) / count;
 		sum += time;
 		igt_debug("%s: %.3fus\n", e->name, 1e6*time);
@@ -481,9 +484,8 @@ static void parallel(int fd, uint32_t handle, int timeout)
 		count = 0;
 		clock_gettime(CLOCK_MONOTONIC, &start);
 		do {
-			for (int loop = 0; loop < 1024; loop++)
-				gem_execbuf(fd, &execbuf);
-			count += 1024;
+			gem_execbuf(fd, &execbuf);
+			count++;
 			clock_gettime(CLOCK_MONOTONIC, &now);
 		} while (elapsed(&start, &now) < timeout);
 		time = elapsed(&start, &now) / count;
@@ -513,6 +515,7 @@ static void independent(int fd, uint32_t handle, int timeout)
 		engines[nengine] = e->flags;
 		names[nengine++] = strdup(e->name);
 
+		count = 1;
 		time = nop_on_ring(fd, handle, e, 1, &count) / count;
 		sum += time;
 		igt_debug("%s: %.3fus\n", e->name, 1e6*time);
@@ -633,6 +636,7 @@ static void series(int fd, uint32_t handle, int timeout)
 
 	nengine = 0;
 	__for_each_physical_engine(fd, e) {
+		count = 1;
 		time = nop_on_ring(fd, handle, e, 1, &count) / count;
 		if (time > max) {
 			name = e->name;
@@ -664,14 +668,12 @@ static void series(int fd, uint32_t handle, int timeout)
 	count = 0;
 	clock_gettime(CLOCK_MONOTONIC, &start);
 	do {
-		for (int loop = 0; loop < 1024; loop++) {
-			for (int n = 0; n < nengine; n++) {
-				execbuf.flags &= ~ENGINE_FLAGS;
-				execbuf.flags |= engines[n];
-				gem_execbuf(fd, &execbuf);
-			}
+		for (int n = 0; n < nengine; n++) {
+			execbuf.flags &= ~ENGINE_FLAGS;
+			execbuf.flags |= engines[n];
+			gem_execbuf(fd, &execbuf);
 		}
-		count += nengine * 1024;
+		count += nengine;
 		clock_gettime(CLOCK_MONOTONIC, &now);
 	} while (elapsed(&start, &now) < timeout); /* Hang detection ~120s */
 	gem_sync(fd, handle);
@@ -712,7 +714,7 @@ static void sequential(int fd, uint32_t handle, unsigned flags, int timeout)
 	nengine = 0;
 	sum = 0;
 	__for_each_physical_engine(fd, e) {
-		unsigned long count;
+		unsigned long count = 1;
 
 		time = nop_on_ring(fd, handle, e, 1, &count) / count;
 		sum += time;
@@ -765,27 +767,31 @@ static void sequential(int fd, uint32_t handle, unsigned flags, int timeout)
 
 		count = 0;
 		clock_gettime(CLOCK_MONOTONIC, &start);
-		do {
+		if (flags & CHAINED) {
 			igt_permute_array(engines, nengine, xchg);
-			if (flags & CHAINED) {
+			for (n = 0; n < nengine; n++) {
+				execbuf.flags &= ~ENGINE_FLAGS;
+				execbuf.flags |= engines[n];
+				do {
+					gem_execbuf(fd, &execbuf);
+					count++;
+					clock_gettime(CLOCK_MONOTONIC,
+							      &now);
+				} while (elapsed(&start, &now) <
+						timeout * (n + 1) / nengine);
+			}
+		} else {
+			do {
+				igt_permute_array(engines, nengine, xchg);
 				for (n = 0; n < nengine; n++) {
 					execbuf.flags &= ~ENGINE_FLAGS;
 					execbuf.flags |= engines[n];
-					for (int loop = 0; loop < 1024; loop++)
-						gem_execbuf(fd, &execbuf);
+					gem_execbuf(fd, &execbuf);
 				}
-			} else {
-				for (int loop = 0; loop < 1024; loop++) {
-					for (n = 0; n < nengine; n++) {
-						execbuf.flags &= ~ENGINE_FLAGS;
-						execbuf.flags |= engines[n];
-						gem_execbuf(fd, &execbuf);
-					}
-				}
-			}
-			count += 1024;
-			clock_gettime(CLOCK_MONOTONIC, &now);
-		} while (elapsed(&start, &now) < timeout); /* Hang detection ~120s */
+				count++;
+				clock_gettime(CLOCK_MONOTONIC, &now);
+			} while (elapsed(&start, &now) < timeout);
+		}
 
 		gem_sync(fd, obj[0].handle);
 		clock_gettime(CLOCK_MONOTONIC, &now);
@@ -869,26 +875,24 @@ static void fence_signal(int fd, uint32_t handle,
 	intel_detect_and_clear_missed_interrupts(fd);
 	clock_gettime(CLOCK_MONOTONIC, &start);
 	do {
-		for (int loop = 0; loop < 1024; loop++) {
-			for (int e = 0; e < nengine; e++) {
-				if (fences[n] != -1) {
-					igt_assert(fence_wait(fences[n]));
-					close(fences[n]);
-				}
+		for (int e = 0; e < nengine; e++) {
+			if (fences[n] != -1) {
+				igt_assert(fence_wait(fences[n]));
+				close(fences[n]);
+			}
 
-				execbuf.flags &= ~ENGINE_FLAGS;
-				execbuf.flags |= engines[e];
-				gem_execbuf_wr(fd, &execbuf);
+			execbuf.flags &= ~ENGINE_FLAGS;
+			execbuf.flags |= engines[e];
+			gem_execbuf_wr(fd, &execbuf);
 
-				/* Enable signaling by doing a poll() */
-				fences[n] = execbuf.rsvd2 >> 32;
-				signal += fence_enable_signaling(fences[n]);
+			/* Enable signaling by doing a poll() */
+			fences[n] = execbuf.rsvd2 >> 32;
+			signal += fence_enable_signaling(fences[n]);
 
-				n = (n + 1) % NFENCES;
-			}
+			n = (n + 1) % NFENCES;
 		}
 
-		count += 1024 * nengine;
+		count += nengine;
 		clock_gettime(CLOCK_MONOTONIC, &now);
 	} while (elapsed(&start, &now) < timeout);
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
@@ -910,6 +914,7 @@ static void preempt(int fd, uint32_t handle,
 	struct timespec start, now;
 	unsigned long count;
 	uint32_t ctx[2];
+	igt_spin_t *spin;
 
 	ctx[0] = gem_context_clone_with_engines(fd, 0);
 	gem_context_set_priority(fd, ctx[0], MIN_PRIO);
@@ -934,21 +939,14 @@ static void preempt(int fd, uint32_t handle,
 	intel_detect_and_clear_missed_interrupts(fd);
 
 	count = 0;
+	spin = __igt_spin_new(fd, .ctx = ctx[0], .engine = e->flags);
 	clock_gettime(CLOCK_MONOTONIC, &start);
 	do {
-		igt_spin_t *spin =
-			__igt_spin_new(fd,
-				       .ctx = ctx[0],
-				       .engine = e->flags);
-
-		for (int loop = 0; loop < 1024; loop++)
-			gem_execbuf(fd, &execbuf);
-
-		igt_spin_free(fd, spin);
-
-		count += 1024;
+		gem_execbuf(fd, &execbuf);
+		count++;
 		clock_gettime(CLOCK_MONOTONIC, &now);
 	} while (elapsed(&start, &now) < 20);
+	igt_spin_free(fd, spin);
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
 
 	gem_context_destroy(fd, ctx[1]);
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
