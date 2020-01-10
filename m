Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767726E9CD
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2020 11:32:07 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Fri, 10 Jan 2020 13:31:44 +0200
Message-Id: <20200110113144.10893-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] perf_pmu: Use dynamic subtests
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
Cc: Petri Latvala <petri.latvala@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Instead of generating a subtest for each engine in a static list,
convert to dynamic subtests, with one dynamic subtest per actually
present physical engine.

In addition, convert comments to igt_describe calls and generally
refactor the lot to a series of simpler loops.

v2: Rebase to new macro names

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---

Tvrtko already acked this patch at least for the dynamic subtest
parts, but now that we're ready for landing these changes: Just to be
sure I'd also like an explicit ack for the other refactoring I've done
for this test, the simplification to arrays and such.


 tests/perf_pmu.c | 244 ++++++++++++++++++++---------------------------
 1 file changed, 105 insertions(+), 139 deletions(-)

diff --git a/tests/perf_pmu.c b/tests/perf_pmu.c
index e1bbf241..526c6d2e 100644
--- a/tests/perf_pmu.c
+++ b/tests/perf_pmu.c
@@ -271,7 +271,7 @@ static void end_spin(int fd, igt_spin_t *spin, unsigned int flags)
 }
 
 static void
-single(int gem_fd, const struct intel_execution_engine2 *e, unsigned int flags)
+single(int gem_fd, const struct intel_execution_engine2 *e, unsigned int num_engines, unsigned int flags)
 {
 	unsigned long slept;
 	igt_spin_t *spin;
@@ -607,7 +607,7 @@ all_busy_check_all(int gem_fd, const unsigned int num_engines,
 }
 
 static void
-no_sema(int gem_fd, const struct intel_execution_engine2 *e, unsigned int flags)
+no_sema(int gem_fd, const struct intel_execution_engine2 *e, unsigned int num_engines, unsigned int flags)
 {
 	igt_spin_t *spin;
 	uint64_t val[2][2];
@@ -647,7 +647,7 @@ no_sema(int gem_fd, const struct intel_execution_engine2 *e, unsigned int flags)
 
 static void
 sema_wait(int gem_fd, const struct intel_execution_engine2 *e,
-	  unsigned int flags)
+	  unsigned int num_engines, unsigned int flags)
 {
 	struct drm_i915_gem_relocation_entry reloc[2] = {};
 	struct drm_i915_gem_exec_object2 obj[2] = {};
@@ -810,6 +810,7 @@ __sema_busy(int gem_fd, int pmu,
 static void
 sema_busy(int gem_fd,
 	  const struct intel_execution_engine2 *e,
+	  unsigned int num_engines,
 	  unsigned int flags)
 {
 	const struct intel_execution_engine2 *signal;
@@ -1830,6 +1831,27 @@ igt_main
 	int fd = -1;
 	struct intel_execution_engine2 *e;
 	unsigned int i;
+	const unsigned int pct[] = { 2, 50, 98 };
+	struct {
+		void (*func)(int, const struct intel_execution_engine2 *, unsigned int, unsigned int);
+		const char *name;
+		unsigned int flags;
+		const char *desc;
+	} busyidle_tests[] = {
+		{ single, "idle", 0, "Test that engines show no load when idle." },
+		{ single, "busy", TEST_BUSY, "Test that a single engine reports load correctly." },
+		{ single, "busy-idle", TEST_BUSY | TEST_TRAILING_IDLE, "Test that a single engine reports load correctly." },
+		{ busy_check_all, "busy-check-all", TEST_BUSY, "Test that when one engine is loaded, others report no load." },
+		{ busy_check_all, "busy-idle-check-all", TEST_BUSY | TEST_TRAILING_IDLE, "Test that one one engine is loaded, others report no load." },
+		{ most_busy_check_all, "most-busy-check-all", TEST_BUSY, "Test that when all except one engine are loaded all loads are correctly reported." },
+		{ most_busy_check_all, "most-busy-idle-check-all", TEST_BUSY | TEST_TRAILING_IDLE, "Test that when all except one engine are loaded all loads are correctly reported." },
+		{ no_sema, "idle-no-semaphores", 0, "Test that semaphore counters report no activity on idle engines." },
+		{ no_sema, "busy-no-semaphores", TEST_BUSY, "Test that semaphore counters report no activity on busy engines." },
+		{ no_sema, "busy-idle-no-semaphores", TEST_BUSY | TEST_TRAILING_IDLE, "Test that semaphore counters report no activity on idle or busy engines." },
+		{ sema_wait, "semaphore-wait", TEST_BUSY, "Test that semaphore waits are correctly reported." },
+		{ sema_wait, "semaphore-wait-idle", TEST_BUSY | TEST_TRAILING_IDLE, "Test that semaphore waits are correctly reported." },
+		{ sema_busy, "semaphore-busy", 0, "Test that semaphore time and busy time difference is under a threshold." },
+	};
 
 	igt_fixture {
 		fd = drm_open_driver_master(DRIVER_INTEL);
@@ -1841,144 +1863,89 @@ igt_main
 			num_engines++;
 	}
 
-	/**
-	 * Test invalid access via perf API is rejected.
-	 */
+	igt_describe("Test that invalid access via perf API is rejected.");
 	igt_subtest("invalid-init")
 		invalid_init();
 
-	__for_each_physical_engine(fd, e) {
-		const unsigned int pct[] = { 2, 50, 98 };
-
-		/**
-		 * Test that a single engine metric can be initialized or it
-		 * is correctly rejected.
-		 */
-		igt_subtest_f("init-busy-%s", e->name)
-			init(fd, e, I915_SAMPLE_BUSY);
-
-		igt_subtest_f("init-wait-%s", e->name)
-			init(fd, e, I915_SAMPLE_WAIT);
-
-		igt_subtest_f("init-sema-%s", e->name)
-			init(fd, e, I915_SAMPLE_SEMA);
-
-		/**
-		 * Test that engines show no load when idle.
-		 */
-		igt_subtest_f("idle-%s", e->name)
-			single(fd, e, 0);
-
-		/**
-		 * Test that a single engine reports load correctly.
-		 */
-		igt_subtest_f("busy-%s", e->name)
-			single(fd, e, TEST_BUSY);
-		igt_subtest_f("busy-idle-%s", e->name)
-			single(fd, e, TEST_BUSY | TEST_TRAILING_IDLE);
-
-		/**
-		 * Test that when one engine is loaded other report no
-		 * load.
-		 */
-		igt_subtest_f("busy-check-all-%s", e->name)
-			busy_check_all(fd, e, num_engines, TEST_BUSY);
-		igt_subtest_f("busy-idle-check-all-%s", e->name)
-			busy_check_all(fd, e, num_engines,
-				       TEST_BUSY | TEST_TRAILING_IDLE);
-
-		/**
-		 * Test that when all except one engine are loaded all
-		 * loads are correctly reported.
-		 */
-		igt_subtest_f("most-busy-check-all-%s", e->name)
-			most_busy_check_all(fd, e, num_engines,
-					    TEST_BUSY);
-		igt_subtest_f("most-busy-idle-check-all-%s", e->name)
-			most_busy_check_all(fd, e, num_engines,
-					    TEST_BUSY |
-					    TEST_TRAILING_IDLE);
-
-		/**
-		 * Test that semphore counters report no activity on
-		 * idle or busy engines.
-		 */
-		igt_subtest_f("idle-no-semaphores-%s", e->name)
-			no_sema(fd, e, 0);
-
-		igt_subtest_f("busy-no-semaphores-%s", e->name)
-			no_sema(fd, e, TEST_BUSY);
-
-		igt_subtest_f("busy-idle-no-semaphores-%s", e->name)
-			no_sema(fd, e, TEST_BUSY | TEST_TRAILING_IDLE);
-
-		/**
-		 * Test that semaphore waits are correctly reported.
-		 */
-		igt_subtest_f("semaphore-wait-%s", e->name)
-			sema_wait(fd, e, TEST_BUSY);
-
-		igt_subtest_f("semaphore-wait-idle-%s", e->name)
-			sema_wait(fd, e,
-				  TEST_BUSY | TEST_TRAILING_IDLE);
+	igt_describe("Test that a single engine metric can be initialized "
+		     "or it is correctly rejected.");
+	igt_subtest_with_dynamic("init-busy")
+		__for_each_physical_engine(fd, e)
+			igt_dynamic_f("%s", e->name)
+				init(fd, e, I915_SAMPLE_BUSY);
 
-		igt_subtest_f("semaphore-busy-%s", e->name)
-			sema_busy(fd, e, 0);
+	igt_describe("Test that a single engine metric can be initialized "
+		     "or it is correctly rejected.");
+	igt_subtest_with_dynamic("init-wait")
+		__for_each_physical_engine(fd, e)
+			igt_dynamic_f("%s", e->name)
+				init(fd, e, I915_SAMPLE_WAIT);
 
-		/**
-		 * Check that two perf clients do not influence each
-		 * others observations.
-		 */
-		igt_subtest_f("multi-client-%s", e->name)
-			multi_client(fd, e);
+	igt_describe("Test that a single engine metric can be initialized "
+		     "or it is correctly rejected.");
+	igt_subtest_with_dynamic("init-sema")
+		__for_each_physical_engine(fd, e)
+			igt_dynamic_f("%s", e->name)
+				init(fd, e, I915_SAMPLE_SEMA);
+
+	for (i = 0; i < ARRAY_SIZE(busyidle_tests); i++) {
+		igt_describe(busyidle_tests[i].desc);
+		igt_subtest_with_dynamic(busyidle_tests[i].name)
+			__for_each_physical_engine(fd, e)
+				igt_dynamic_f("%s", e->name)
+					busyidle_tests[i].func(fd, e, num_engines, busyidle_tests[i].flags);
+	}
 
-		/**
-		 * Check that reported usage is correct when PMU is
-		 * enabled after the batch is running.
-		 */
-		igt_subtest_f("busy-start-%s", e->name)
-			busy_start(fd, e);
+	igt_describe("Check that two perf clients do not influence each other's observations.");
+	igt_subtest_with_dynamic("multi-client")
+		__for_each_physical_engine(fd, e)
+			igt_dynamic_f("%s", e->name)
+				multi_client(fd, e);
 
-		/**
-		 * Check that reported usage is correct when PMU is
-		 * enabled after two batches are running.
-		 */
-		igt_subtest_f("busy-double-start-%s", e->name) {
-			gem_require_contexts(fd);
-			busy_double_start(fd, e);
-		}
+	igt_describe("Check that reported usage is correct when PMU is enabled after the batch is running.");
+	igt_subtest_with_dynamic("busy-start")
+		__for_each_physical_engine(fd, e)
+			igt_dynamic_f("%s", e->name)
+				busy_start(fd, e);
 
-		/**
-		 * Check that the PMU can be safely enabled in face of
-		 * interrupt-heavy engine load.
-		 */
-		igt_subtest_f("enable-race-%s", e->name)
-			test_enable_race(fd, e);
+	igt_describe("Check that reported usage is correct when PMU is enabled after two batches are running.");
+	igt_subtest_with_dynamic("busy-double-start") {
+		gem_require_contexts(fd);
+		__for_each_physical_engine(fd, e)
+			igt_dynamic_f("%s", e->name)
+				busy_double_start(fd, e);
+	}
 
-		/**
-		 * Check engine busyness accuracy is as expected.
-		 */
-		for (i = 0; i < ARRAY_SIZE(pct); i++) {
-			igt_subtest_f("busy-accuracy-%u-%s",
-				      pct[i], e->name)
-				accuracy(fd, e, pct[i], 10);
-		}
+	igt_describe("Check that the PMU can be safely enabled in face of interrupt-heavy engine load.");
+	igt_subtest_with_dynamic("enable-race")
+		__for_each_physical_engine(fd, e)
+			igt_dynamic_f("%s", e->name)
+				test_enable_race(fd, e);
+
+	for (i = 0; i < ARRAY_SIZE(pct); i++) {
+		igt_describe("Check engine busyness accuracy is as expected.");
+		igt_subtest_with_dynamic_f("busy-accuracy-%u", pct[i])
+			__for_each_physical_engine(fd, e)
+				igt_dynamic_f("%s", e->name)
+					accuracy(fd, e, pct[i], 10);
+	}
 
-		igt_subtest_f("busy-hang-%s", e->name) {
-			igt_hang_t hang = igt_allow_hang(fd, 0, 0);
+	igt_subtest_with_dynamic("busy-hang")
+		__for_each_physical_engine(fd, e)
+			igt_dynamic_f("%s", e->name) {
+				igt_hang_t hang = igt_allow_hang(fd, 0, 0);
 
-			single(fd, e, TEST_BUSY | FLAG_HANG);
+				single(fd, e, 0, TEST_BUSY | FLAG_HANG);
 
-			igt_disallow_hang(fd, hang);
-		}
+				igt_disallow_hang(fd, hang);
+			}
 
-		/**
-		 * Test that event waits are correctly reported.
-		 */
-		if (e->class == I915_ENGINE_CLASS_RENDER)
-			igt_subtest_f("event-wait-%s", e->name)
-				event_wait(fd, e);
-	}
+	igt_describe("Test that event waits are correctly reported.");
+	igt_subtest_with_dynamic("event-wait")
+		__for_each_physical_engine(fd, e)
+			if (e->class == I915_ENGINE_CLASS_RENDER)
+				igt_dynamic_f("%s", e->name)
+					event_wait(fd, e);
 
 	/**
 	 * Test that when all engines are loaded all loads are
@@ -2037,9 +2004,7 @@ igt_main
 	igt_subtest("rc6-runtime-pm-long")
 		test_rc6(fd, TEST_RUNTIME_PM | FLAG_LONG);
 
-	/**
-	 * Check render nodes are counted.
-	 */
+	igt_describe("Check that render nodes are counted.");
 	igt_subtest_group {
 		int render_fd = -1;
 
@@ -2050,14 +2015,15 @@ igt_main
 			gem_quiescent_gpu(fd);
 		}
 
-		__for_each_physical_engine(render_fd, e) {
-			igt_subtest_f("render-node-busy-%s", e->name)
-				single(render_fd, e, TEST_BUSY);
-			igt_subtest_f("render-node-busy-idle-%s",
-				      e->name)
-				single(render_fd, e,
-				       TEST_BUSY | TEST_TRAILING_IDLE);
-		}
+		igt_subtest_with_dynamic("render-node-busy")
+			__for_each_physical_engine(render_fd, e)
+				igt_dynamic_f("%s", e->name)
+					single(render_fd, e, 0, TEST_BUSY);
+
+		igt_subtest_with_dynamic("render-node-busy-idle")
+			__for_each_physical_engine(render_fd, e)
+				igt_dynamic_f("%s", e->name)
+					single(render_fd, e, 0, TEST_BUSY | TEST_TRAILING_IDLE);
 
 		igt_fixture {
 			close(render_fd);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
