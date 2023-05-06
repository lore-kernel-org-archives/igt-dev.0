Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C4310E14E
 for <igt-dev@lists.freedesktop.org>; Sat,  6 May 2023 00:55:39 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri,  5 May 2023 17:55:15 -0700
Message-Id: <20230506005528.1890922-3-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230506005528.1890922-1-umesh.nerlige.ramappa@intel.com>
References: <20230506005528.1890922-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 02/15] perf_pmu: Two new rc6 subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

1.
Keep one tile awake and check rc6 counters on all tiles.

2.
Keep all tiles awake and check rc6 counters on all.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/i915/perf_pmu.c | 149 +++++++++++++++++++++++++++++++-----------
 1 file changed, 111 insertions(+), 38 deletions(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 97ad09d76..8fb54aa03 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -173,6 +173,8 @@ static unsigned int measured_usleep(unsigned int usec)
 #define FLAG_LONG (16)
 #define FLAG_HANG (32)
 #define TEST_S3 (64)
+#define TEST_OTHER (128)
+#define TEST_ALL   (256)
 
 static igt_spin_t *__spin_poll(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
 			       const struct intel_execution_engine2 *e)
@@ -1676,20 +1678,23 @@ test_frequency_idle(int gem_fd)
 		     "Actual frequency should be 0 while parked!\n");
 }
 
-static bool wait_for_rc6(int fd, int timeout)
+static bool wait_for_rc6(int fd, int timeout, unsigned int pmus, unsigned int idx)
 {
 	struct timespec tv = {};
+	uint64_t val[pmus];
 	uint64_t start, now;
 
 	/* First wait for roughly an RC6 Evaluation Interval */
 	usleep(160 * 1000);
 
 	/* Then poll for RC6 to start ticking */
-	now = pmu_read_single(fd);
+	pmu_read_multi(fd, pmus, val);
+	now = val[idx];
 	do {
 		start = now;
 		usleep(5000);
-		now = pmu_read_single(fd);
+		pmu_read_multi(fd, pmus, val);
+		now = val[idx];
 		if (now - start > 1e6)
 			return true;
 	} while (igt_seconds_elapsed(&tv) <= timeout);
@@ -1716,16 +1721,38 @@ static int open_forcewake_handle(int fd, unsigned int gt)
 }
 
 static void
-test_rc6(int gem_fd, unsigned int gt, unsigned int flags)
+test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
 {
 	int64_t duration_ns = 2e9;
-	uint64_t idle, busy, prev, ts[2];
+	uint64_t idle[16], busy[16], prev[16], ts[2];
+	int fd[num_gt], fw[num_gt], gt_, pmus = 0, test_idx = -1;
 	unsigned long slept;
-	int fd, fw;
+
+	igt_require(!(flags & TEST_OTHER) ||
+		    ((flags & TEST_OTHER) && num_gt > 1));
+
+	igt_require(!(flags & TEST_ALL) ||
+		    ((flags & TEST_ALL) && num_gt > 1));
 
 	gem_quiescent_gpu(gem_fd);
 
-	fd = open_pmu(gem_fd, __I915_PMU_RC6_RESIDENCY(gt));
+	fd[0] = -1;
+	for (gt_ = 0; gt_ < num_gt; gt_++) {
+		if (gt_ != gt && !(flags & TEST_OTHER))
+			continue;
+
+		if (gt_ == gt) {
+			igt_assert(test_idx == -1);
+			test_idx = pmus;
+		}
+
+		fd[pmus] = perf_i915_open_group(gem_fd,
+						__I915_PMU_RC6_RESIDENCY(gt_),
+						fd[0]);
+		igt_skip_on(fd[pmus] < 0 && errno == ENODEV);
+		pmus++;
+	}
+	igt_assert(test_idx >= 0);
 
 	if (flags & TEST_RUNTIME_PM) {
 		drmModeRes *res;
@@ -1746,21 +1773,26 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int flags)
 		 * drifted to far in advance of real RC6.
 		 */
 		if (flags & FLAG_LONG) {
-			pmu_read_single(fd);
+			pmu_read_multi(fd[0], pmus, idle);
 			sleep(5);
-			pmu_read_single(fd);
+			pmu_read_multi(fd[0], pmus, idle);
 		}
 	}
 
-	igt_require(wait_for_rc6(fd, 1));
+	igt_require(wait_for_rc6(fd[0], 1, pmus, test_idx));
 
 	/* While idle check full RC6. */
-	prev = __pmu_read_single(fd, &ts[0]);
+	ts[0] = pmu_read_multi(fd[0], pmus, prev);
 	slept = measured_usleep(duration_ns / 1000);
-	idle = __pmu_read_single(fd, &ts[1]);
-
-	igt_debug("slept=%lu perf=%"PRIu64"\n", slept, ts[1] - ts[0]);
-	assert_within_epsilon(idle - prev, ts[1] - ts[0], tolerance);
+	ts[1] = pmu_read_multi(fd[0], pmus, idle);
+
+	for (gt_ = 0; gt_ < pmus; gt_++) {
+		igt_debug("gt%u: idle rc6=%"PRIu64", slept=%lu, perf=%"PRIu64"\n",
+			  gt_, idle[gt_] - prev[gt_], slept, ts[1] - ts[0]);
+		assert_within_epsilon(idle[gt_] - prev[gt_],
+				      ts[1] - ts[0],
+				      tolerance);
+	}
 
 	if (flags & TEST_S3) {
 		/*
@@ -1773,40 +1805,70 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int flags)
 		 * However, in practice it appears we are not entering rc6
 		 * immediately after resume... A bug?
 		 */
-		prev = __pmu_read_single(fd, &ts[0]);
+		ts[0] = pmu_read_multi(fd[0], pmus, prev);
 		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
 					      SUSPEND_TEST_NONE);
-		idle = __pmu_read_single(fd, &ts[1]);
-		igt_debug("suspend=%"PRIu64", rc6=%"PRIu64"\n",
-			  ts[1] - ts[0], idle -prev);
-		//assert_within_epsilon(idle - prev, ts[1] - ts[0], tolerance);
+		ts[1] = pmu_read_multi(fd[0], pmus, idle);
+		for (gt_ = 0; gt_ < pmus; gt_++) {
+			igt_debug("gt%u: rc6=%"PRIu64", suspend=%"PRIu64"\n",
+				  gt_, idle[gt_] - prev[gt_], ts[1] - ts[0]);
+			// assert_within_epsilon(idle[gt_] - prev[gt_],
+			//		      ts[1] - ts[0], tolerance);
+		}
 	}
 
-	igt_assert(wait_for_rc6(fd, 5));
+	igt_assert(wait_for_rc6(fd[0], 5, pmus, test_idx));
 
-	prev = __pmu_read_single(fd, &ts[0]);
+	ts[0] = pmu_read_multi(fd[0], pmus, prev);
 	slept = measured_usleep(duration_ns / 1000);
-	idle = __pmu_read_single(fd, &ts[1]);
-
-	igt_debug("slept=%lu perf=%"PRIu64"\n", slept, ts[1] - ts[0]);
-	assert_within_epsilon(idle - prev, ts[1] - ts[0], tolerance);
+	ts[1] = pmu_read_multi(fd[0], pmus, idle);
+
+	for (gt_ = 0; gt_ < pmus; gt_++) {
+		igt_debug("gt%u: idle rc6=%"PRIu64", slept=%lu, perf=%"PRIu64"\n",
+			  gt_, idle[gt_] - prev[gt_], slept, ts[1] - ts[0]);
+		assert_within_epsilon(idle[gt_] - prev[gt_],
+				      ts[1] - ts[0],
+				      tolerance);
+	}
 
 	/* Wake up device and check no RC6. */
-	fw = open_forcewake_handle(gem_fd, gt);
-	igt_require(fw >= 0);
+	for (gt_ = 0; gt_ < num_gt; gt_++) {
+		if (gt_ != gt && !(flags & TEST_ALL))
+			continue;
+
+		fw[gt_] = open_forcewake_handle(gem_fd, gt_);
+		igt_require(fw[gt_] >= 0);
+	}
+
 	usleep(1e3); /* wait for the rc6 cycle counter to stop ticking */
 
-	prev = pmu_read_single(fd);
-	usleep(duration_ns / 1000);
-	busy = pmu_read_single(fd);
+	ts[0] = pmu_read_multi(fd[0], pmus, prev);
+	slept = measured_usleep(duration_ns / 1000);
+	ts[1] = pmu_read_multi(fd[0], pmus, busy);
 
-	close(fw);
-	close(fd);
+	for (gt_ = 0; gt_ < num_gt; gt_++) {
+		if (gt_ == gt || (flags & TEST_ALL))
+			close(fw[gt_]);
+	}
+
+	for (gt_ = 0; gt_ < pmus; gt_++)
+		close(fd[gt_]);
 
 	if (flags & TEST_RUNTIME_PM)
 		igt_restore_runtime_pm();
 
-	assert_within_epsilon(busy - prev, 0.0, tolerance);
+	for (gt_ = 0; gt_ < pmus; gt_++) {
+		igt_debug("gt%u: busy rc6=%"PRIu64", slept=%lu, perf=%"PRIu64"\n",
+			  gt_, busy[gt_] - prev[gt_], slept, ts[1] - ts[0]);
+		if (gt_ == test_idx || (flags & TEST_ALL))
+			assert_within_epsilon(busy[gt_] - prev[gt_],
+					      0.0,
+					      tolerance);
+		else
+			assert_within_epsilon(busy[gt_] - prev[gt_],
+					      ts[1] - ts[0],
+					      tolerance);
+	}
 }
 
 static void
@@ -2193,6 +2255,7 @@ igt_main
 	unsigned int num_engines = 0;
 	const intel_ctx_t *ctx = NULL;
 	int gt, tmp, fd = -1;
+	int num_gt = 0;
 
 	/**
 	 * All PMU should be accompanied by a test.
@@ -2211,6 +2274,9 @@ igt_main
 		for_each_ctx_engine(fd, ctx, e)
 			num_engines++;
 		igt_require(num_engines);
+
+		for_each_gt(fd, gt, tmp)
+			num_gt++;
 	}
 
 	igt_describe("Verify i915 pmu dir exists and read all events");
@@ -2412,18 +2478,25 @@ igt_main
 	igt_subtest_with_dynamic("rc6") {
 		for_each_gt(fd, gt, tmp) {
 			igt_dynamic_f("gt%u", gt)
-				test_rc6(fd, gt, 0);
+				test_rc6(fd, gt, num_gt, 0);
 
 			igt_dynamic_f("runtime-pm-gt%u", gt)
-				test_rc6(fd, gt, TEST_RUNTIME_PM);
+				test_rc6(fd, gt, num_gt, TEST_RUNTIME_PM);
 
 			igt_dynamic_f("runtime-pm-long-gt%u", gt)
-				test_rc6(fd, gt, TEST_RUNTIME_PM | FLAG_LONG);
+				test_rc6(fd, gt, num_gt,
+					 TEST_RUNTIME_PM | FLAG_LONG);
+
+			igt_dynamic_f("other-idle-gt%u", gt)
+				test_rc6(fd, gt, num_gt, TEST_OTHER);
 		}
 	}
 
 	igt_subtest("rc6-suspend")
-		test_rc6(fd, 0, TEST_S3);
+		test_rc6(fd, 0, num_gt, TEST_S3);
+
+	igt_subtest("rc6-all-gts")
+		test_rc6(fd, 0, num_gt, TEST_ALL | TEST_OTHER);
 
 	/**
 	 * Test GT wakeref tracking (similar to RC0, opposite of RC6)
-- 
2.34.1
