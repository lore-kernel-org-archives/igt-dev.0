Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E153C10E7B4
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Sep 2023 12:11:42 +0000 (UTC)
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Sep 2023 17:51:56 +0530
Message-Id: <20230901122156.361769-2-sujaritha.sundaresan@intel.com>
In-Reply-To: <20230901122156.361769-1-sujaritha.sundaresan@intel.com>
References: <20230901122156.361769-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 1/1] tests/i915: Add multi-gt support for rc6_idle
 and rc6_fence tests
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

Adding multi-gt support for rc6_residency subtests rc6_idle and
rc6_fence.

v2: Fix review comments (Riana)

v3: Fix ctx destroy call (Riana)

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/i915/i915_pm_rc6_residency.c | 32 +++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_residency.c
index b266680ac..36da4fa1d 100644
--- a/tests/i915/i915_pm_rc6_residency.c
+++ b/tests/i915/i915_pm_rc6_residency.c
@@ -376,7 +376,7 @@ static void kill_children(int sig)
 	signal(sig, old);
 }
 
-static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags)
+static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags, unsigned int gt)
 {
 	const int64_t duration_ns = SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
 	const int tolerance = 20; /* Some RC6 is better than none! */
@@ -397,7 +397,7 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags)
 	struct igt_power gpu;
 	int fd;
 
-	fd = open_pmu(i915, I915_PMU_RC6_RESIDENCY);
+	fd = open_pmu(i915, __I915_PMU_RC6_RESIDENCY(gt));
 	igt_drop_caches_set(i915, DROP_IDLE);
 	igt_require(__pmu_wait_for_rc6(fd));
 	igt_power_open(i915, &gpu, "gpu");
@@ -471,12 +471,13 @@ static void rc6_idle(int i915, uint32_t ctx_id, uint64_t flags)
 	}
 }
 
-static void rc6_fence(int i915, const intel_ctx_t *ctx)
+static void rc6_fence(int i915, unsigned int gt)
 {
 	const int64_t duration_ns = SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
 	const int tolerance = 20; /* Some RC6 is better than none! */
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
 	const struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx;
 	struct power_sample sample[2];
 	unsigned long slept;
 	uint64_t rc6, ts[2], ahnd;
@@ -485,7 +486,7 @@ static void rc6_fence(int i915, const intel_ctx_t *ctx)
 
 	igt_require_sw_sync();
 
-	fd = open_pmu(i915, I915_PMU_RC6_RESIDENCY);
+	fd = open_pmu(i915, __I915_PMU_RC6_RESIDENCY(gt));
 	igt_drop_caches_set(i915, DROP_IDLE);
 	igt_require(__pmu_wait_for_rc6(fd));
 	igt_power_open(i915, &gpu, "gpu");
@@ -509,6 +510,7 @@ static void rc6_fence(int i915, const intel_ctx_t *ctx)
 	assert_within_epsilon(rc6, ts[1] - ts[0], 5);
 
 	/* Submit but delay execution, we should be idle and conserving power */
+	ctx = intel_ctx_create_for_gt(i915, gt);
 	ahnd = get_reloc_ahnd(i915, ctx->id);
 	for_each_ctx_engine(i915, ctx, e) {
 		igt_spin_t *spin;
@@ -550,6 +552,7 @@ static void rc6_fence(int i915, const intel_ctx_t *ctx)
 		gem_quiescent_gpu(i915);
 	}
 	put_ahnd(ahnd);
+	intel_ctx_destroy(i915, ctx);
 
 	igt_power_close(&gpu);
 	close(fd);
@@ -558,12 +561,12 @@ static void rc6_fence(int i915, const intel_ctx_t *ctx)
 igt_main
 {
 	int i915 = -1;
+	unsigned int dir, gt;
 	const intel_ctx_t *ctx;
 
 	/* Use drm_open_driver to verify device existence */
 	igt_fixture {
 		i915 = drm_open_driver(DRIVER_INTEL);
-		ctx = intel_ctx_create_all_physical(i915);
 	}
 
 	igt_subtest_with_dynamic("rc6-idle") {
@@ -572,19 +575,25 @@ igt_main
 		igt_require_gem(i915);
 		gem_quiescent_gpu(i915);
 
-		for_each_ctx_engine(i915, ctx, e) {
-			if (e->instance == 0) {
-				igt_dynamic_f("%s", e->name)
-					rc6_idle(i915, ctx->id, e->flags);
+		i915_for_each_gt(i915, dir, gt) {
+			ctx = intel_ctx_create_for_gt(i915, gt);
+			for_each_ctx_engine(i915, ctx, e) {
+				if (e->instance == 0) {
+					igt_dynamic_f("gt%u-%s", gt, e->name)
+						rc6_idle(i915, ctx->id, e->flags, gt);
+				}
 			}
+			intel_ctx_destroy(i915, ctx);
 		}
 	}
 
-	igt_subtest("rc6-fence") {
+	igt_subtest_with_dynamic("rc6-fence") {
 		igt_require_gem(i915);
 		gem_quiescent_gpu(i915);
 
-		rc6_fence(i915, ctx);
+		i915_for_each_gt(i915, dir, gt)
+			igt_dynamic_f("gt%u", gt)
+				rc6_fence(i915, gt);
 	}
 
 	igt_subtest_group {
@@ -626,7 +635,6 @@ igt_main
 	}
 
 	igt_fixture {
-		intel_ctx_destroy(i915, ctx);
 		drm_close_driver(i915);
 	}
 }
-- 
2.25.1
