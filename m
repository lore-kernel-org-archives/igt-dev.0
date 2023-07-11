Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Intel-gfx@lists.freedesktop.org
Date: Tue, 11 Jul 2023 17:02:14 +0100
Message-Id: <20230711160214.463134-2-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230711160214.463134-1-tvrtko.ursulin@linux.intel.com>
References: <20230711160214.463134-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915_pm_rps: Exercise sysfs
 thresholds
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Exercise a bunch of up and down rps thresholds to verify hardware
is happy with them all.

To limit the overall runtime relies on probability and number of runs
to approach complete coverage.

v2:
 * Common sync spinner code now in library.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/i915/i915_pm_rps.c | 194 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
index 7044fcd81c56..8c370b35c85b 100644
--- a/tests/i915/i915_pm_rps.c
+++ b/tests/i915/i915_pm_rps.c
@@ -39,8 +39,10 @@
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
+#include "igt_aux.h"
 #include "igt_dummyload.h"
 #include "igt_perf.h"
+#include "igt_rand.h"
 #include "igt_sysfs.h"
 /**
  * TEST: i915 pm rps
@@ -81,6 +83,22 @@
  * SUBTEST: waitboost
  * Feature: pm_rps
  * Run type: FULL
+ *
+ * SUBTEST: thresholds
+ * Feature: pm_rps
+ * Run type: FULL
+ *
+ * SUBTEST: thresholds-idle
+ * Feature: pm_rps
+ * Run type: FULL
+ *
+ * SUBTEST: thresholds-idle-park
+ * Feature: pm_rps
+ * Run type: FULL
+ *
+ * SUBTEST: thresholds-park
+ * Feature: pm_rps
+ * Run type: FULL
  */
 
 IGT_TEST_DESCRIPTION("Render P-States tests - verify GPU frequency changes");
@@ -920,6 +938,146 @@ static void pm_rps_exit_handler(int sig)
 	drm_close_driver(drm_fd);
 }
 
+static struct i915_engine_class_instance
+find_dword_engine(int i915, const unsigned int gt)
+{
+	struct i915_engine_class_instance *engines, ci = { -1, -1 };
+	unsigned int i, count;
+
+	engines = gem_list_engines(i915, 1u << gt, ~0u, &count);
+	igt_assert(engines);
+
+	for (i = 0; i < count; i++) {
+		if (!gem_class_can_store_dword(i915, engines[i].engine_class))
+			continue;
+
+		ci = engines[i];
+		break;
+	}
+
+	free(engines);
+
+	return ci;
+}
+
+static igt_spin_t *spin_sync_gt(int i915, uint64_t ahnd, unsigned int gt,
+				const intel_ctx_t **ctx)
+{
+	struct i915_engine_class_instance ci = { -1, -1 };
+	struct intel_execution_engine2 e = { };
+
+	ci = find_dword_engine(i915, gt);
+
+	igt_require(ci.engine_class != (uint16_t)I915_ENGINE_CLASS_INVALID);
+
+	if (gem_has_contexts(i915)) {
+		e.class = ci.engine_class;
+		e.instance = ci.engine_instance;
+		e.flags = 0;
+		*ctx = intel_ctx_create_for_engine(i915, e.class, e.instance);
+	} else {
+		igt_require(gt == 0); /* Impossible anyway. */
+		e.class = gem_execbuf_flags_to_engine_class(I915_EXEC_DEFAULT);
+		e.instance = 0;
+		e.flags = I915_EXEC_DEFAULT;
+		*ctx = intel_ctx_0(i915);
+	}
+
+	igt_debug("Using engine %u:%u\n", e.class, e.instance);
+
+	return __igt_sync_spin(i915, ahnd, *ctx, &e);
+}
+
+#define TEST_IDLE 0x1
+#define TEST_PARK 0x2
+static void test_thresholds(int i915, unsigned int gt, unsigned int flags)
+{
+	uint64_t ahnd = get_reloc_ahnd(i915, 0);
+	const unsigned int points = 10;
+	unsigned int def_up, def_down;
+	igt_spin_t *spin = NULL;
+	const intel_ctx_t *ctx;
+	unsigned int *ta, *tb;
+	unsigned int i;
+	int sysfs;
+
+	sysfs = igt_sysfs_gt_open(i915, gt);
+	igt_require(sysfs >= 0);
+
+	/* Feature test */
+	def_up = igt_sysfs_get_u32(sysfs, "rps_up_threshold_pct");
+	def_down = igt_sysfs_get_u32(sysfs, "rps_down_threshold_pct");
+	igt_require(def_up && def_down);
+
+	/* Check invalid percentages are rejected */
+	igt_assert_eq(igt_sysfs_set_u32(sysfs, "rps_up_threshold_pct", 101), false);
+	igt_assert_eq(igt_sysfs_set_u32(sysfs, "rps_down_threshold_pct", 101), false);
+
+	/*
+	 * Invent some random up-down thresholds, but always include 0 and 100
+	 * just to have some wild edge cases.
+	 */
+	ta = calloc(points, sizeof(unsigned int));
+	tb = calloc(points, sizeof(unsigned int));
+	igt_require(ta && tb);
+
+	ta[0] = tb[0] = 0;
+	ta[1] = tb[1] = 100;
+	hars_petruska_f54_1_random_seed(time(NULL));
+	for (i = 2; i < points; i++) {
+		ta[i] = hars_petruska_f54_1_random_unsafe_max(100);
+		tb[i] = hars_petruska_f54_1_random_unsafe_max(100);
+	}
+	igt_permute_array(ta, points, igt_exchange_int);
+	igt_permute_array(tb, points, igt_exchange_int);
+
+	/* Exercise the thresholds with a GPU load to trigger park/unpark etc */
+	for (i = 0; i < points; i++) {
+		igt_info("Testing thresholds up %u%% and down %u%%...\n", ta[i], tb[i]);
+		igt_assert_eq(igt_sysfs_set_u32(sysfs, "rps_up_threshold_pct", ta[i]), true);
+		igt_assert_eq(igt_sysfs_set_u32(sysfs, "rps_down_threshold_pct", tb[i]), true);
+
+		if (flags & TEST_IDLE) {
+			gem_quiescent_gpu(i915);
+		} else if (spin) {
+			intel_ctx_destroy(i915, ctx);
+			igt_spin_free(i915, spin);
+			spin = NULL;
+			if (flags & TEST_PARK) {
+				gem_quiescent_gpu(i915);
+				usleep(500000);
+			}
+		}
+		spin = spin_sync_gt(i915, ahnd, gt, &ctx);
+		usleep(1000000);
+		if (flags & TEST_IDLE) {
+			intel_ctx_destroy(i915, ctx);
+			igt_spin_free(i915, spin);
+			if (flags & TEST_PARK) {
+				gem_quiescent_gpu(i915);
+				usleep(500000);
+			}
+			spin = NULL;
+		}
+	}
+
+	if (spin) {
+		intel_ctx_destroy(i915, ctx);
+		igt_spin_free(i915, spin);
+	}
+
+	gem_quiescent_gpu(i915);
+
+	/* Restore defaults */
+	igt_assert_eq(igt_sysfs_set_u32(sysfs, "rps_up_threshold_pct", def_up), true);
+	igt_assert_eq(igt_sysfs_set_u32(sysfs, "rps_down_threshold_pct", def_down), true);
+
+	free(ta);
+	free(tb);
+	close(sysfs);
+	put_ahnd(ahnd);
+}
+
 igt_main
 {
 	igt_fixture {
@@ -1000,6 +1158,42 @@ igt_main
 		igt_disallow_hang(drm_fd, hang);
 	}
 
+	igt_subtest_with_dynamic("thresholds-idle") {
+		int tmp, gt;
+
+		i915_for_each_gt(drm_fd, tmp, gt) {
+			igt_dynamic_f("gt%u", gt)
+				test_thresholds(drm_fd, gt, TEST_IDLE);
+		}
+	}
+
+	igt_subtest_with_dynamic("thresholds") {
+		int tmp, gt;
+
+		i915_for_each_gt(drm_fd, tmp, gt) {
+			igt_dynamic_f("gt%u", gt)
+				test_thresholds(drm_fd, gt, 0);
+		}
+	}
+
+	igt_subtest_with_dynamic("thresholds-park") {
+		int tmp, gt;
+
+		i915_for_each_gt(drm_fd, tmp, gt) {
+			igt_dynamic_f("gt%u", gt)
+				test_thresholds(drm_fd, gt, TEST_PARK);
+		}
+	}
+
+	igt_subtest_with_dynamic("thresholds-idle-park") {
+		int tmp, gt;
+
+		i915_for_each_gt(drm_fd, tmp, gt) {
+			igt_dynamic_f("gt%u", gt)
+				test_thresholds(drm_fd, gt, TEST_IDLE | TEST_PARK);
+		}
+	}
+
 	igt_fixture
 		drm_close_driver(drm_fd);
 }
-- 
2.39.2
