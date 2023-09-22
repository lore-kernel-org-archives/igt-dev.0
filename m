Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A7710E19F
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 21:52:40 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 22 Sep 2023 14:52:33 -0700
Message-Id: <20230922215233.2438200-6-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230922215233.2438200-1-umesh.nerlige.ramappa@intel.com>
References: <20230922215233.2438200-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/5] i915/pmu: Add a new test to use
 total_active_ticks for busyness
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

Busyness percentage can be calculated using the total-active-ticks
counter as follows:

% busyness = ((delta of xxxx-busy-ticks) * 100) / delta total-active-ticks

Add a test to check busyness using this method.

Note that total-active-ticks is updated only every 100 ms, so
granularity of the busy-idle test is affected. To account for this, the
test duration is set to a larger value for the new busyness interface.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/perf_pmu.c | 77 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index 5999d1e22..80182dbfa 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -249,6 +249,16 @@
  * Description: Test the i915 pmu perf interface
  * Feature: i915 pmu perf interface, pmu
  * Test category: Perf
+ *
+ * SUBTEST: busy-ticks
+ * Description: Test the i915 v2 engine active busyness interface
+ * Feature: i915 pmu perf interface, pmu
+ * Test category: Perf
+ *
+ * SUBTEST: busy-idle-ticks
+ * Description: Test the i915 v2 engine idle busyness interface
+ * Feature: i915 pmu perf interface, pmu
+ * Test category: Perf
  */
 
 IGT_TEST_DESCRIPTION("Test the i915 pmu perf interface");
@@ -2547,6 +2557,63 @@ static void pmu_read(int i915)
 	close(pmu_fd);
 }
 
+static void
+single_ticks(int gem_fd, const intel_ctx_t *ctx,
+	     const struct intel_execution_engine2 *e, unsigned int flags)
+{
+	igt_spin_t *spin;
+	uint64_t before[2], after[2];
+	uint64_t busy_ticks, total_active_ticks;
+	int fd[2];
+	uint64_t ahnd = get_reloc_ahnd(gem_fd, ctx->id);
+	struct i915_engine_class_instance ci = {
+		e->class,
+		e->instance,
+	};
+	int gt = gem_engine_to_gt_map(gem_fd, &ci);
+	double busy_percent;
+	const unsigned long batch_long_duration_ns = 2000e6;
+
+	fd[0] = open_group(gem_fd, __I915_PMU_ENGINE_BUSY(e->class, e->instance), -1);
+	fd[1] = open_group(gem_fd, __I915_PMU_TOTAL_ACTIVE_TICKS(gt), fd[0]);
+
+	if (flags & TEST_BUSY) {
+		spin = igt_sync_spin(gem_fd, ahnd, ctx, e);
+	} else {
+		spin = NULL;
+		gem_quiescent_gpu(gem_fd);
+	}
+
+	pmu_read_multi(fd[0], 2, before);
+	measured_usleep(batch_long_duration_ns / 1000);
+	if (flags & TEST_TRAILING_IDLE)
+		end_spin(gem_fd, spin, flags);
+	pmu_read_multi(fd[0], 2, after);
+
+	end_spin(gem_fd, spin, FLAG_SYNC);
+
+	busy_ticks = after[0] - before[0];
+	total_active_ticks = after[1] - before[1];
+
+	igt_info("BUSY: after %ld, before %ld\n", after[0], before[0]);
+	igt_info("TOTAL: after %ld, before %ld\n", after[1], before[1]);
+	igt_info("BUSY: delta %ld\n", busy_ticks);
+	igt_info("TOTAL: delta %ld\n", total_active_ticks);
+
+	busy_percent = (double)(busy_ticks * 100) / (double)total_active_ticks;
+
+	igt_info("LOCAL: percent %f\n", busy_percent);
+
+	igt_assert(busy_percent >= 95);
+
+	igt_spin_free(gem_fd, spin);
+	close(fd[0]);
+	close(fd[1]);
+	put_ahnd(ahnd);
+
+	gem_quiescent_gpu(gem_fd);
+}
+
 #define test_each_engine(T, i915, ctx, e) \
 	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
 		igt_dynamic_f("%s", e->name)
@@ -2639,6 +2706,16 @@ igt_main
 	test_each_engine("busy-idle", fd, ctx, e)
 		single(fd, ctx, e, TEST_BUSY | TEST_TRAILING_IDLE);
 
+	igt_subtest_group {
+		igt_fixture igt_require(busy_ticks_only);
+
+		test_each_engine("busy-ticks", fd, ctx, e)
+			single_ticks(fd, ctx, e, TEST_BUSY);
+
+		test_each_engine("busy-idle-ticks", fd, ctx, e)
+			single_ticks(fd, ctx, e, TEST_BUSY | TEST_TRAILING_IDLE);
+	}
+
 	/**
 	 * Test that when one engine is loaded other report no
 	 * load.
-- 
2.38.1
