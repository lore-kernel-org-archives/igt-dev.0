Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C05610F600
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jun 2022 10:10:20 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Jun 2022 15:36:06 +0530
Message-Id: <20220621100606.2037879-3-riana.tauro@intel.com>
In-Reply-To: <20220621100606.2037879-1-riana.tauro@intel.com>
References: <20220621100606.2037879-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915/pm_rc6_residency: Modify
 rc6_fence to use intel_ctx_t from igt_fixture
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

Modify rc6_fence test to use intel_ctx_t from igt_fixture

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/i915/i915_pm_rc6_residency.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_residency.c
index 560b635f..043370cc 100644
--- a/tests/i915/i915_pm_rc6_residency.c
+++ b/tests/i915/i915_pm_rc6_residency.c
@@ -450,13 +450,12 @@ static void rc6_idle(int i915, uint64_t flags)
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
@@ -486,7 +485,6 @@ static void rc6_fence(int i915)
 	assert_within_epsilon(rc6, ts[1] - ts[0], 5);
 
 	/* Submit but delay execution, we should be idle and conserving power */
-	ctx = intel_ctx_create_all_physical(i915);
 	ahnd = get_reloc_ahnd(i915, ctx->id);
 	for_each_ctx_engine(i915, ctx, e) {
 		igt_spin_t *spin;
@@ -525,7 +523,6 @@ static void rc6_fence(int i915)
 		assert_within_epsilon(rc6, ts[1] - ts[0], tolerance);
 		gem_quiescent_gpu(i915);
 	}
-	intel_ctx_destroy(i915, ctx);
 	put_ahnd(ahnd);
 
 	rapl_close(&rapl);
@@ -560,7 +557,7 @@ igt_main
 		igt_require_gem(i915);
 		gem_quiescent_gpu(i915);
 
-		rc6_fence(i915);
+		rc6_fence(i915, ctx);
 	}
 
 	igt_subtest_group {
-- 
2.25.1
