Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CCC10E279
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jun 2022 13:49:43 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Jun 2022 19:15:25 +0530
Message-Id: <20220621134526.2040218-2-riana.tauro@intel.com>
In-Reply-To: <20220621134526.2040218-1-riana.tauro@intel.com>
References: <20220621134526.2040218-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/2] tests/i915/pm_rc6_residency:
 Refactoring intel_ctx_t to igt_fixture
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

Refactor code to move intel_ctx_create_all_physical() and
intel_ctx_destroy() to igt_fixture to be used by rc6_fence and
other tests.

No functional changes

v2 : refactor code (Anshuman)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/i915/i915_pm_rc6_residency.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_residency.c
index cf9eae90..7c1ff32b 100644
--- a/tests/i915/i915_pm_rc6_residency.c
+++ b/tests/i915/i915_pm_rc6_residency.c
@@ -449,13 +449,12 @@ static void rc6_idle(int i915)
 	}
 }
 
-static void rc6_fence(int i915)
+static void rc6_fence(int i915, const intel_ctx_t *ctx)
 {
 	const int64_t duration_ns = SLEEP_DURATION * (int64_t)NSEC_PER_SEC;
 	const int tolerance = 20; /* Some RC6 is better than none! */
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
 	const struct intel_execution_engine2 *e;
-	const intel_ctx_t *ctx;
 	struct power_sample sample[2];
 	unsigned long slept;
 	uint64_t rc6, ts[2], ahnd;
@@ -485,7 +484,6 @@ static void rc6_fence(int i915)
 	assert_within_epsilon(rc6, ts[1] - ts[0], 5);
 
 	/* Submit but delay execution, we should be idle and conserving power */
-	ctx = intel_ctx_create_all_physical(i915);
 	ahnd = get_reloc_ahnd(i915, ctx->id);
 	for_each_ctx_engine(i915, ctx, e) {
 		igt_spin_t *spin;
@@ -524,7 +522,6 @@ static void rc6_fence(int i915)
 		assert_within_epsilon(rc6, ts[1] - ts[0], tolerance);
 		gem_quiescent_gpu(i915);
 	}
-	intel_ctx_destroy(i915, ctx);
 	put_ahnd(ahnd);
 
 	rapl_close(&rapl);
@@ -534,10 +531,12 @@ static void rc6_fence(int i915)
 igt_main
 {
 	int i915 = -1;
+	const intel_ctx_t *ctx;
 
 	/* Use drm_open_driver to verify device existence */
 	igt_fixture {
 		i915 = drm_open_driver(DRIVER_INTEL);
+		ctx = intel_ctx_create_all_physical(i915);
 	}
 
 	igt_subtest("rc6-idle") {
@@ -551,7 +550,7 @@ igt_main
 		igt_require_gem(i915);
 		gem_quiescent_gpu(i915);
 
-		rc6_fence(i915);
+		rc6_fence(i915, ctx);
 	}
 
 	igt_subtest_group {
@@ -592,7 +591,8 @@ igt_main
 			close(sysfs);
 	}
 
-	igt_fixture
+	igt_fixture {
+		intel_ctx_destroy(i915, ctx);
 		close(i915);
-
+	}
 }
-- 
2.25.1
