Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707FC10E123
 for <igt-dev@lists.freedesktop.org>; Fri, 19 May 2023 15:46:55 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 19 May 2023 08:46:36 -0700
Message-Id: <20230519154650.3751855-3-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230519154650.3751855-1-umesh.nerlige.ramappa@intel.com>
References: <20230519154650.3751855-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 02/16] perf_pmu: Support multi-tile in
 rc6 subtest
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

Teach test how to wake up a particular tile and make it iterate all of
them using dynamic subtests.

v2: Finalize SHIFT to 60. Drop FIXME from i915_drm.h
v3: (Ashutosh)
- Use i915_for_each_gt
- Move uapi to i915_drm_local.h

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/i915_drm_local.h | 15 +++++++++++++++
 tests/i915/perf_pmu.c     | 34 +++++++++++++++++++++++-----------
 2 files changed, 38 insertions(+), 11 deletions(-)

diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
index af0176500..bb2ebef38 100644
--- a/lib/i915/i915_drm_local.h
+++ b/lib/i915/i915_drm_local.h
@@ -26,6 +26,21 @@ extern "C" {
 #define DRM_I915_PERF_PROP_OA_ENGINE_CLASS	9
 #define DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE	10
 
+/*
+ * Top 4 bits of every non-engine counter are GT id.
+ */
+#define __I915_PMU_GT_SHIFT (60)
+
+#define ___I915_PMU_OTHER(gt, x) \
+	(((__u64)__I915_PMU_ENGINE(0xff, 0xff, 0xf) + 1 + (x)) | \
+	((__u64)(gt) << __I915_PMU_GT_SHIFT))
+
+#define __I915_PMU_ACTUAL_FREQUENCY(gt)		___I915_PMU_OTHER(gt, 0)
+#define __I915_PMU_REQUESTED_FREQUENCY(gt)	___I915_PMU_OTHER(gt, 1)
+#define __I915_PMU_INTERRUPTS(gt)		___I915_PMU_OTHER(gt, 2)
+#define __I915_PMU_RC6_RESIDENCY(gt)		___I915_PMU_OTHER(gt, 3)
+#define __I915_PMU_SOFTWARE_GT_AWAKE_TIME(gt)	___I915_PMU_OTHER(gt, 4)
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index bedadbe92..3c46614a7 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -1845,8 +1845,16 @@ static bool wait_for_suspended(int gem_fd)
 	return suspended;
 }
 
+static int open_forcewake_handle(int fd, unsigned int gt)
+{
+	if (getenv("IGT_NO_FORCEWAKE"))
+		return -1;
+
+	return igt_debugfs_gt_open(fd, gt, "forcewake_user", O_WRONLY);
+}
+
 static void
-test_rc6(int gem_fd, unsigned int flags)
+test_rc6(int gem_fd, unsigned int gt, unsigned int flags)
 {
 	int64_t duration_ns = 2e9;
 	uint64_t idle, busy, prev, ts[2];
@@ -1855,7 +1863,7 @@ test_rc6(int gem_fd, unsigned int flags)
 
 	gem_quiescent_gpu(gem_fd);
 
-	fd = open_pmu(gem_fd, I915_PMU_RC6_RESIDENCY);
+	fd = open_pmu(gem_fd, __I915_PMU_RC6_RESIDENCY(gt));
 
 	if (flags & TEST_RUNTIME_PM) {
 		drmModeRes *res;
@@ -1922,7 +1930,7 @@ test_rc6(int gem_fd, unsigned int flags)
 	assert_within_epsilon(idle - prev, ts[1] - ts[0], tolerance);
 
 	/* Wake up device and check no RC6. */
-	fw = igt_open_forcewake_handle(gem_fd);
+	fw = open_forcewake_handle(gem_fd, gt);
 	igt_assert(fw >= 0);
 	usleep(1e3); /* wait for the rc6 cycle counter to stop ticking */
 
@@ -2317,7 +2325,7 @@ igt_main
 	const struct intel_execution_engine2 *e;
 	unsigned int num_engines = 0;
 	const intel_ctx_t *ctx = NULL;
-	int fd = -1;
+	int gt, tmp, fd = -1;
 
 	/**
 	 * All PMU should be accompanied by a test.
@@ -2534,17 +2542,21 @@ igt_main
 	/**
 	 * Test RC6 residency reporting.
 	 */
-	igt_subtest("rc6")
-		test_rc6(fd, 0);
+	igt_subtest_with_dynamic("rc6") {
+		i915_for_each_gt(fd, tmp, gt) {
+			igt_dynamic_f("gt%u", gt)
+				test_rc6(fd, gt, 0);
 
-	igt_subtest("rc6-runtime-pm")
-		test_rc6(fd, TEST_RUNTIME_PM);
+			igt_dynamic_f("runtime-pm-gt%u", gt)
+				test_rc6(fd, gt, TEST_RUNTIME_PM);
 
-	igt_subtest("rc6-runtime-pm-long")
-		test_rc6(fd, TEST_RUNTIME_PM | FLAG_LONG);
+			igt_dynamic_f("runtime-pm-long-gt%u", gt)
+				test_rc6(fd, gt, TEST_RUNTIME_PM | FLAG_LONG);
+		}
+	}
 
 	igt_subtest("rc6-suspend")
-		test_rc6(fd, TEST_S3);
+		test_rc6(fd, 0, TEST_S3);
 
 	/**
 	 * Test GT wakeref tracking (similar to RC0, opposite of RC6)
-- 
2.36.1
