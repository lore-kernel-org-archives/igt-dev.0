Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB8411A4D0
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Jul 2022 04:13:40 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 26 Jul 2022 06:13:25 +0200
Message-Id: <20220726041325.12948-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220726041325.12948-1-zbigniew.kempczynski@intel.com>
References: <20220726041325.12948-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 2/2] tests/i915/perf_pmu: Avoid unordered
 sampling with SEMA_WAIT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Broadwell/Braswell, we sometimes see that the MI_SEMAPHORE_WAIT
samples from memory before the MI_STORE_DWORD_IMM was written: unordered
reads. This causes the semaphore to complete too early, and the test
asserts as the batch is completed before the measurement is begun.

We can use more MI_STORE_DWORD_IMM before the MI_SEMAPHORE_WAIT to
ensure the MI pipelined is flushed and the write to memory is visible
before our first read by the semaphore-wait. However, we can also just
change our MI_SEMAPHORE_WAIT operation to not break if it sees the
initial 0 by waiting for the value to change to 2. (Now the value starts
at 0, is set to 1 by the batch to indicate it has started and the caller
should start its sampling, and then set by 2 by the caller as it
finishes sampling the semaphore busyness.)

Closes: https://gitlab.freedesktop.org/drm/intel/issues/2383
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---

v5: Rework, change semaphore wait value
---
 tests/i915/perf_pmu.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 39e9fc5fef..e2b13540e7 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -685,7 +685,7 @@ no_sema(int gem_fd, const intel_ctx_t *ctx,
 #define MI_SEMAPHORE_WAIT	MI_INSTR(0x1c, 2) /* GEN8+ */
 #define   MI_SEMAPHORE_POLL		(1<<15)
 #define   MI_SEMAPHORE_SAD_GTE_SDD	(1<<12)
-#define   MI_SEMAPHORE_SAD_NEQ_SDD      (5 << 12)
+#define   MI_SEMAPHORE_SAD_EQ_SDD       (4 << 12)
 
 static void
 sema_wait(int gem_fd, const intel_ctx_t *ctx,
@@ -812,9 +812,9 @@ create_sema(int gem_fd, uint64_t ahnd,
 		0,
 		1,
 
-		/* Wait until the semaphore value is set to 0 [by caller] */
-		MI_SEMAPHORE_WAIT | MI_SEMAPHORE_POLL | MI_SEMAPHORE_SAD_NEQ_SDD,
-		1,
+		/* Wait until the semaphore value is set to 2 [by caller] */
+		MI_SEMAPHORE_WAIT | MI_SEMAPHORE_POLL | MI_SEMAPHORE_SAD_EQ_SDD,
+		2,
 		0,
 		0,
 
@@ -872,26 +872,37 @@ __sema_busy(int gem_fd, uint64_t ahnd, int pmu, const intel_ctx_t *ctx,
 	};
 	igt_spin_t *spin;
 	uint32_t *map;
+	struct timespec tv = {};
+	int timeout = 3;
 
 	/* Time spent being busy includes time waiting on semaphores */
 	igt_assert(busy_pct >= sema_pct);
 
 	gem_quiescent_gpu(gem_fd);
 
-	map = gem_mmap__device_coherent(gem_fd, obj.handle, 0, 4096, PROT_WRITE);
+	map = gem_mmap__device_coherent(gem_fd, obj.handle, 0, 4096, PROT_READ | PROT_WRITE);
 	gem_execbuf(gem_fd, &eb);
 	spin = igt_spin_new(gem_fd, .ahnd = ahnd, .ctx = ctx, .engine = e->flags);
 
-	/* Wait until the batch is executed and the semaphore is busy-waiting */
-	while (!READ_ONCE(*map) && gem_bo_busy(gem_fd, obj.handle))
+	/*
+	 * Wait until the batch is executed and the semaphore is busy-waiting.
+	 * Also stop on timeout.
+	 */
+	igt_nsec_elapsed(&tv);
+	while (READ_ONCE(*map) != 1 && gem_bo_busy(gem_fd, obj.handle) &&
+	       igt_seconds_elapsed(&tv) < timeout)
 		;
+	igt_debug("bo_busy = %d, *map = %u, timeout: [%u/%u]\n",
+		  gem_bo_busy(gem_fd, obj.handle), *map,
+		  igt_seconds_elapsed(&tv), timeout);
+	igt_assert(*map == 1);
 	igt_assert(gem_bo_busy(gem_fd, obj.handle));
 	gem_close(gem_fd, obj.handle);
 
 	total = pmu_read_multi(pmu, 2, start);
 
 	sema = measured_usleep(batch_duration_ns * sema_pct / 100 / 1000);
-	*map = 0; __sync_synchronize();
+	*map = 2; __sync_synchronize();
 	busy = measured_usleep(batch_duration_ns * (busy_pct - sema_pct) / 100 / 1000);
 	igt_spin_end(spin);
 	measured_usleep(batch_duration_ns * (100 - busy_pct) / 100 / 1000);
-- 
2.34.1
