Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 11 Dec 2020 14:39:09 +0000
Message-Id: <20201211143909.2716931-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/perf_pmu: Verify RC6 measurements
 before/after suspend
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

RC6 should work before suspend, and continue to increment while idle
after suspend. Should.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tests/i915/perf_pmu.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index cb7273142..29119b236 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -170,6 +170,7 @@ static unsigned int measured_usleep(unsigned int usec)
 #define TEST_RUNTIME_PM (8)
 #define FLAG_LONG (16)
 #define FLAG_HANG (32)
+#define TEST_S3 (64)
 
 static igt_spin_t * __spin_poll(int fd, uint32_t ctx,
 				const struct intel_execution_engine2 *e)
@@ -1639,12 +1640,34 @@ test_rc6(int gem_fd, unsigned int flags)
 	igt_require(wait_for_rc6(fd));
 
 	/* While idle check full RC6. */
-	prev = __pmu_read_single(fd, &ts[0]);
-	slept = measured_usleep(duration_ns / 1000);
-	idle = __pmu_read_single(fd, &ts[1]);
-	igt_debug("slept=%lu perf=%"PRIu64"\n", slept, ts[1] - ts[0]);
+	for (int pass = 0; pass < 3; pass++) {
+		prev = __pmu_read_single(fd, &ts[0]);
+		slept = measured_usleep(duration_ns / 1000);
+		idle = __pmu_read_single(fd, &ts[1]);
+
+		igt_debug("slept=%lu perf=%"PRIu64"\n", slept, ts[1] - ts[0]);
+		assert_within_epsilon(idle - prev, ts[1] - ts[0], tolerance);
+	}
+
+	if (flags & TEST_S3) {
+		prev = __pmu_read_single(fd, &ts[0]);
+		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+					      SUSPEND_TEST_NONE);
+		idle = __pmu_read_single(fd, &ts[1]);
+		igt_debug("suspend=%"PRIu64"\n", ts[1] - ts[0]);
+		//assert_within_epsilon(idle - prev, ts[1] - ts[0], tolerance);
+	}
 
-	assert_within_epsilon(idle - prev, ts[1] - ts[0], tolerance);
+	igt_assert(wait_for_rc6(fd));
+
+	for (int pass = 0; pass < 3; pass++) {
+		prev = __pmu_read_single(fd, &ts[0]);
+		slept = measured_usleep(duration_ns / 1000);
+		idle = __pmu_read_single(fd, &ts[1]);
+
+		igt_debug("slept=%lu perf=%"PRIu64"\n", slept, ts[1] - ts[0]);
+		assert_within_epsilon(idle - prev, ts[1] - ts[0], tolerance);
+	}
 
 	/* Wake up device and check no RC6. */
 	fw = igt_open_forcewake_handle(gem_fd);
@@ -2245,6 +2268,9 @@ igt_main
 	igt_subtest("rc6-runtime-pm-long")
 		test_rc6(fd, TEST_RUNTIME_PM | FLAG_LONG);
 
+	igt_subtest("rc6-suspend")
+		test_rc6(fd, TEST_S3);
+
 	/**
 	 * Check render nodes are counted.
 	 */
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
