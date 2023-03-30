Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBD410EC9A
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Mar 2023 00:37:02 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Mar 2023 17:36:51 -0700
Message-Id: <20230330003656.1294873-3-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230330003656.1294873-1-umesh.nerlige.ramappa@intel.com>
References: <20230330003656.1294873-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/7] tests/i915/perf_pmu: Support multi-tile
 in rc6 subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, arjun.melkaveri@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Teach test how to wake up a particular tile and make it iterate all of
them using dynamic subtests.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 include/drm-uapi/i915_drm.h | 18 +++++++++++++++-
 tests/i915/perf_pmu.c       | 41 ++++++++++++++++++++++++++-----------
 2 files changed, 46 insertions(+), 13 deletions(-)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index a0876ee4..3b5e3b51 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -280,7 +280,17 @@ enum drm_i915_pmu_engine_sample {
 #define I915_PMU_ENGINE_SEMA(class, instance) \
 	__I915_PMU_ENGINE(class, instance, I915_SAMPLE_SEMA)
 
-#define __I915_PMU_OTHER(x) (__I915_PMU_ENGINE(0xff, 0xff, 0xf) + 1 + (x))
+/*
+ * Top 8 bits of every non-engine counter are GT id.
+ * FIXME: __I915_PMU_GT_SHIFT will be changed to 56
+ */
+#define __I915_PMU_GT_SHIFT (60)
+
+#define ___I915_PMU_OTHER(gt, x) \
+	(((__u64)__I915_PMU_ENGINE(0xff, 0xff, 0xf) + 1 + (x)) | \
+	((__u64)(gt) << __I915_PMU_GT_SHIFT))
+
+#define __I915_PMU_OTHER(x) ___I915_PMU_OTHER(0, x)
 
 #define I915_PMU_ACTUAL_FREQUENCY	__I915_PMU_OTHER(0)
 #define I915_PMU_REQUESTED_FREQUENCY	__I915_PMU_OTHER(1)
@@ -290,6 +300,12 @@ enum drm_i915_pmu_engine_sample {
 
 #define I915_PMU_LAST /* Deprecated - do not use */ I915_PMU_RC6_RESIDENCY
 
+#define __I915_PMU_ACTUAL_FREQUENCY(gt)		___I915_PMU_OTHER(gt, 0)
+#define __I915_PMU_REQUESTED_FREQUENCY(gt)	___I915_PMU_OTHER(gt, 1)
+#define __I915_PMU_INTERRUPTS(gt)		___I915_PMU_OTHER(gt, 2)
+#define __I915_PMU_RC6_RESIDENCY(gt)		___I915_PMU_OTHER(gt, 3)
+#define __I915_PMU_SOFTWARE_GT_AWAKE_TIME(gt)	___I915_PMU_OTHER(gt, 4)
+
 /* Each region is a minimum of 16k, and there are at most 255 of them.
  */
 #define I915_NR_TEX_REGIONS 255	/* table size 2k - maximum due to use
diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 197e7cd2..72f95b98 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -1707,8 +1707,16 @@ static bool wait_for_suspended(int gem_fd)
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
@@ -1717,7 +1725,7 @@ test_rc6(int gem_fd, unsigned int flags)
 
 	gem_quiescent_gpu(gem_fd);
 
-	fd = open_pmu(gem_fd, I915_PMU_RC6_RESIDENCY);
+	fd = open_pmu(gem_fd, __I915_PMU_RC6_RESIDENCY(gt));
 
 	if (flags & TEST_RUNTIME_PM) {
 		drmModeRes *res;
@@ -1784,8 +1792,8 @@ test_rc6(int gem_fd, unsigned int flags)
 	assert_within_epsilon(idle - prev, ts[1] - ts[0], tolerance);
 
 	/* Wake up device and check no RC6. */
-	fw = igt_open_forcewake_handle(gem_fd);
-	igt_assert(fw >= 0);
+	fw = open_forcewake_handle(gem_fd, gt);
+	igt_require(fw >= 0);
 	usleep(1e3); /* wait for the rc6 cycle counter to stop ticking */
 
 	prev = pmu_read_single(fd);
@@ -2173,12 +2181,17 @@ static void pmu_read(int i915)
 		for_each_if((e)->class == I915_ENGINE_CLASS_RENDER) \
 			igt_dynamic_f("%s", e->name)
 
+#define for_each_gt(i915, gtid, tmp) \
+	for ((gtid) = 0; \
+	     ((tmp) = igt_sysfs_gt_open((i915), (gtid))) != -1; \
+	     close(tmp), (gtid)++)
+
 igt_main
 {
 	const struct intel_execution_engine2 *e;
 	unsigned int num_engines = 0;
 	const intel_ctx_t *ctx = NULL;
-	int fd = -1;
+	int gt, tmp, fd = -1;
 
 	/**
 	 * All PMU should be accompanied by a test.
@@ -2395,17 +2408,21 @@ igt_main
 	/**
 	 * Test RC6 residency reporting.
 	 */
-	igt_subtest("rc6")
-		test_rc6(fd, 0);
+	igt_subtest_with_dynamic("rc6") {
+		for_each_gt(fd, gt, tmp) {
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
