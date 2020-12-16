Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 16 Dec 2020 16:54:57 +0000
Message-Id: <20201216165457.1361781-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/perf_pmu: Replace init/read-other with
 a plea
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

We cannot assume we know how many PMU there are exactly, so pick -1ULL
to represent all invalid metrics. Similarly, we have to rely on explicit
testing for each PMU to prove their existence and correct functioning.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tests/i915/perf_pmu.c | 56 ++++++++++++-------------------------------
 1 file changed, 15 insertions(+), 41 deletions(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index e2f975a1a..db375341c 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -1165,38 +1165,12 @@ do { \
 	igt_assert_eq(errno, EINVAL);
 }
 
-static void init_other(int i915, unsigned int i, bool valid)
+static void open_invalid(int i915)
 {
 	int fd;
 
-	fd = perf_i915_open(i915, __I915_PMU_OTHER(i));
-	igt_require(!(fd < 0 && errno == ENODEV));
-	if (valid) {
-		igt_assert(fd >= 0);
-	} else {
-		igt_assert(fd < 0);
-		return;
-	}
-
-	close(fd);
-}
-
-static void read_other(int i915, unsigned int i, bool valid)
-{
-	int fd;
-
-	fd = perf_i915_open(i915, __I915_PMU_OTHER(i));
-	igt_require(!(fd < 0 && errno == ENODEV));
-	if (valid) {
-		igt_assert(fd >= 0);
-	} else {
-		igt_assert(fd < 0);
-		return;
-	}
-
-	(void)pmu_read_single(fd);
-
-	close(fd);
+	fd = perf_i915_open(i915, -1ULL);
+	igt_assert(fd < 0);
 }
 
 static bool cpu0_hotplug_support(void)
@@ -2058,6 +2032,12 @@ igt_main
 	unsigned int num_engines = 0;
 	int fd = -1;
 
+	/**
+	 * All PMU should be accompanied by a test.
+	 *
+	 * Including all the I915_PMU_OTHER(x).
+	 */
+
 	igt_fixture {
 		fd = __drm_open_driver(DRIVER_INTEL);
 
@@ -2075,6 +2055,12 @@ igt_main
 	igt_subtest("invalid-init")
 		invalid_init(fd);
 
+	/**
+	 * Double check the invalid metric does fail.
+	 */
+	igt_subtest("invalid-open")
+		open_invalid(fd);
+
 	igt_subtest_with_dynamic("faulting-read") {
 		for_each_mmap_offset_type(fd, t) {
 			igt_dynamic_f("%s", t->name)
@@ -2228,18 +2214,6 @@ igt_main
 		all_busy_check_all(fd, num_engines,
 				   TEST_BUSY | TEST_TRAILING_IDLE);
 
-	/**
-	 * Test that non-engine counters can be initialized and read. Apart
-	 * from the invalid metric which should fail.
-	 */
-	for (unsigned int i = 0; i < num_other_metrics + 1; i++) {
-		igt_subtest_f("other-init-%u", i)
-			init_other(fd, i, i < num_other_metrics);
-
-		igt_subtest_f("other-read-%u", i)
-			read_other(fd, i, i < num_other_metrics);
-	}
-
 	/**
 	 * Test counters are not affected by CPU offline/online events.
 	 */
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
