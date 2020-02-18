Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4DE6E9B8
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 08:39:52 +0000 (UTC)
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Date: Tue, 18 Feb 2020 13:52:40 +0530
Message-Id: <20200218082240.21853-2-krishnaiah.bommu@intel.com>
In-Reply-To: <20200218082240.21853-1-krishnaiah.bommu@intel.com>
References: <20200218082240.21853-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 1/1] lib/i915/gem_ring : set the engine
 to default context
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Copy the existing engine map from default context to
newly created  default context

v2: addressed review comments

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/i915/gem_ring.c              | 8 ++++++--
 lib/i915/gem_ring.h              | 2 +-
 tests/i915/gem_busy.c            | 2 +-
 tests/i915/gem_ctx_persistence.c | 2 +-
 tests/i915/gem_eio.c             | 6 +++---
 tests/i915/gem_exec_await.c      | 2 +-
 tests/i915/gem_exec_fence.c      | 2 +-
 tests/i915/gem_exec_latency.c    | 2 +-
 tests/i915/gem_exec_schedule.c   | 6 +++---
 tests/i915/gem_ringfill.c        | 2 +-
 tests/perf_pmu.c                 | 2 +-
 11 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/lib/i915/gem_ring.c b/lib/i915/gem_ring.c
index 99f4741c..14abfb16 100644
--- a/lib/i915/gem_ring.c
+++ b/lib/i915/gem_ring.c
@@ -143,11 +143,15 @@ __gem_measure_ring_inflight(int fd, unsigned int engine, enum measure_ring_flags
  * Number of batches that fit in the ring
  */
 unsigned int
-gem_measure_ring_inflight(int fd, unsigned int engine, enum measure_ring_flags flags)
+gem_measure_ring_inflight(int sfd, unsigned int engine, enum measure_ring_flags flags, bool copy_engine_map)
 {
 	unsigned int min = ~0u;
+	int fd;
 
-	fd = gem_reopen_driver(fd);
+	fd = gem_reopen_driver(sfd);
+
+	if (copy_engine_map)
+		gem_context_copy_engines(sfd, 0, fd, 0);
 
 	/* When available, disable execbuf throttling */
 	fcntl(fd, F_SETFD, fcntl(fd, F_GETFD) | O_NONBLOCK);
diff --git a/lib/i915/gem_ring.h b/lib/i915/gem_ring.h
index c69adce0..94b68865 100644
--- a/lib/i915/gem_ring.h
+++ b/lib/i915/gem_ring.h
@@ -31,6 +31,6 @@ enum measure_ring_flags {
 };
 
 unsigned int
-gem_measure_ring_inflight(int fd, unsigned int engine, enum measure_ring_flags flags);
+gem_measure_ring_inflight(int fd, unsigned int engine, enum measure_ring_flags flags, bool copy_engine_map);
 
 #endif /* GEM_RING_H */
diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
index 2f1b04e3..2efa84b1 100644
--- a/tests/i915/gem_busy.c
+++ b/tests/i915/gem_busy.c
@@ -309,7 +309,7 @@ static void xchg_u32(void *array, unsigned i, unsigned j)
 static void close_race(int fd)
 {
 	const unsigned int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
-	const unsigned int nhandles = gem_measure_ring_inflight(fd, ALL_ENGINES, 0) / 2;
+	const unsigned int nhandles = gem_measure_ring_inflight(fd, ALL_ENGINES, 0, false) / 2;
 	unsigned int engines[16], nengine;
 	unsigned long *control;
 	uint32_t *handles;
diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index feb8fbd0..e2481635 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -436,7 +436,7 @@ static void test_nonpersistent_file(int i915)
 
 static void test_nonpersistent_queued(int i915, unsigned int engine)
 {
-	const int count = gem_measure_ring_inflight(i915, engine, 0);
+	const int count = gem_measure_ring_inflight(i915, engine, 0, true);
 	igt_spin_t *spin;
 	int fence = -1;
 	uint32_t ctx;
diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index 0fe51efe..6a0cfdd5 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -449,7 +449,7 @@ static void test_inflight(int fd, unsigned int wait)
 	igt_require_gem(fd);
 	igt_require(gem_has_exec_fence(fd));
 
-	max = gem_measure_ring_inflight(fd, -1, 0);
+	max = gem_measure_ring_inflight(fd, -1, 0, false);
 	igt_require(max > 1);
 	max = min(max - 1, ARRAY_SIZE(fence));
 	igt_debug("Using %d inflight batches\n", max);
@@ -512,7 +512,7 @@ static void test_inflight_suspend(int fd)
 	igt_spin_t *hang;
 	int max;
 
-	max = gem_measure_ring_inflight(fd, -1, 0);
+	max = gem_measure_ring_inflight(fd, -1, 0, false);
 	igt_require(max > 1);
 	max = min(max - 1, ARRAY_SIZE(fence));
 	igt_debug("Using %d inflight batches\n", max);
@@ -766,7 +766,7 @@ static void reset_stress(int fd, uint32_t ctx0,
 	igt_stats_t stats;
 	int max;
 
-	max = gem_measure_ring_inflight(fd, engine, 0);
+	max = gem_measure_ring_inflight(fd, engine, 0, false);
 	max = max / 2 - 1; /* assume !execlists and a shared ring */
 	igt_require(max > 0);
 	igt_debug("Using %d inflight batches for %s\n", max, name);
diff --git a/tests/i915/gem_exec_await.c b/tests/i915/gem_exec_await.c
index 7817b483..1c1aeae1 100644
--- a/tests/i915/gem_exec_await.c
+++ b/tests/i915/gem_exec_await.c
@@ -241,7 +241,7 @@ igt_main
 		igt_require_gem(device);
 		gem_submission_print_method(device);
 
-		ring_size = gem_measure_ring_inflight(device, ALL_ENGINES, 0) - 10;
+		ring_size = gem_measure_ring_inflight(device, ALL_ENGINES, 0, false) - 10;
 		if (!gem_has_execlists(device))
 			ring_size /= 2;
 		igt_info("Ring size: %d batches\n", ring_size);
diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index 36488ea7..b0eca26a 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -1525,7 +1525,7 @@ igt_main
 		long ring_size = 0;
 
 		igt_fixture {
-			ring_size = gem_measure_ring_inflight(i915, ALL_ENGINES, 0) - 1;
+			ring_size = gem_measure_ring_inflight(i915, ALL_ENGINES, 0, false) - 1;
 			igt_info("Ring size: %ld batches\n", ring_size);
 			igt_require(ring_size);
 
diff --git a/tests/i915/gem_exec_latency.c b/tests/i915/gem_exec_latency.c
index 3d99182a..f16d603b 100644
--- a/tests/i915/gem_exec_latency.c
+++ b/tests/i915/gem_exec_latency.c
@@ -661,7 +661,7 @@ igt_main
 
 		gem_submission_print_method(device);
 
-		ring_size = gem_measure_ring_inflight(device, ALL_ENGINES, 0);
+		ring_size = gem_measure_ring_inflight(device, ALL_ENGINES, 0, false);
 		igt_info("Ring size: %d batches\n", ring_size);
 		igt_require(ring_size > 8);
 		ring_size -= 8; /* leave some spare */
diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index a2098586..1dbd77e6 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -1170,7 +1170,7 @@ static void deep(int fd, unsigned ring)
 		ctx[n] = gem_context_create(fd);
 	}
 
-	nreq = gem_measure_ring_inflight(fd, ring, 0) / (4 * XS) * MAX_CONTEXTS;
+	nreq = gem_measure_ring_inflight(fd, ring, 0, false) / (4 * XS) * MAX_CONTEXTS;
 	if (nreq > max_req)
 		nreq = max_req;
 	igt_info("Using %d requests (prio range %d)\n", nreq, max_req);
@@ -1316,7 +1316,7 @@ static int __execbuf(int fd, struct drm_i915_gem_execbuffer2 *execbuf)
 static void wide(int fd, unsigned ring)
 {
 	struct timespec tv = {};
-	unsigned int ring_size = gem_measure_ring_inflight(fd, ring, MEASURE_RING_NEW_CTX);
+	unsigned int ring_size = gem_measure_ring_inflight(fd, ring, MEASURE_RING_NEW_CTX, false);
 
 	IGT_CORK_FENCE(cork);
 	uint32_t result;
@@ -1366,7 +1366,7 @@ static void reorder_wide(int fd, unsigned ring)
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct timespec tv = {};
-	unsigned int ring_size = gem_measure_ring_inflight(fd, ring, MEASURE_RING_NEW_CTX);
+	unsigned int ring_size = gem_measure_ring_inflight(fd, ring, MEASURE_RING_NEW_CTX, false);
 	IGT_CORK_FENCE(cork);
 	uint32_t result, target;
 	uint32_t result_read[1024];
diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
index 4c73f4d9..fe4d6561 100644
--- a/tests/i915/gem_ringfill.c
+++ b/tests/i915/gem_ringfill.c
@@ -272,7 +272,7 @@ igt_main
 			master = true;
 		}
 
-		ring_size = gem_measure_ring_inflight(fd, ALL_ENGINES, 0);
+		ring_size = gem_measure_ring_inflight(fd, ALL_ENGINES, 0, false);
 		igt_info("Ring size: %d batches\n", ring_size);
 		igt_require(ring_size);
 	}
diff --git a/tests/perf_pmu.c b/tests/perf_pmu.c
index fe383867..75615701 100644
--- a/tests/perf_pmu.c
+++ b/tests/perf_pmu.c
@@ -1281,7 +1281,7 @@ static void cpu_hotplug(int gem_fd)
 
 static int target_num_interrupts(int i915)
 {
-	return min(gem_measure_ring_inflight(i915, I915_EXEC_DEFAULT, 0), 30);
+	return min(gem_measure_ring_inflight(i915, I915_EXEC_DEFAULT, 0, false), 30);
 }
 
 static void
-- 
2.25.0.4.g0ad7144999

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
