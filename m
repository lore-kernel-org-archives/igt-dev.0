Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF2B10E436
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 13:08:23 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  9 Aug 2023 18:38:02 +0530
Message-Id: <20230809130802.1182409-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] test/perf_pmu: Dump drpc on C6 failure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Dump drpc debugfs on RC6/MC6 failure, it will be useful to
debug any C6 failure issue by using drpc debugfs debug info.

v2:
- Fixes few nit. [Riana]

Co-developed-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/i915/perf_pmu.c | 61 +++++++++++++++++++++++++++++--------------
 1 file changed, 42 insertions(+), 19 deletions(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 58f4a82a20..c6e6a8b776 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -256,6 +256,18 @@ IGT_TEST_DESCRIPTION("Test the i915 pmu perf interface");
 const double tolerance = 0.05f;
 const unsigned long batch_duration_ns = 500e6;
 
+char *drpc;
+const char *no_debug_data = "\0";
+
+static char *get_drpc(int i915, int gt_id)
+{
+	int gt_dir;
+
+	gt_dir = igt_debugfs_gt_dir(i915, gt_id);
+	igt_assert(gt_dir != -1);
+	return igt_sysfs_get(gt_dir, "drpc");
+}
+
 static int open_pmu(int i915, uint64_t config)
 {
 	int fd;
@@ -336,17 +348,19 @@ static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
 	return buf[1];
 }
 
-#define __assert_within_epsilon(x, ref, tol_up, tol_down) \
+#define __assert_within_epsilon(x, ref, tol_up, tol_down, debug_data) \
 	igt_assert_f((double)(x) <= (1.0 + (tol_up)) * (double)(ref) && \
 		     (double)(x) >= (1.0 - (tol_down)) * (double)(ref), \
-		     "'%s' != '%s' (%f not within +%.1f%%/-%.1f%% tolerance of %f)\n",\
+		     "'%s' != '%s' (%f not within +%.1f%%/-%.1f%% tolerance of %f)\n%s\n",\
 		     #x, #ref, (double)(x), \
 		     (tol_up) * 100.0, (tol_down) * 100.0, \
-		     (double)(ref))
+		     (double)(ref), debug_data)
 
 #define assert_within_epsilon(x, ref, tolerance) \
-	__assert_within_epsilon(x, ref, tolerance, tolerance)
+	__assert_within_epsilon(x, ref, tolerance, tolerance, no_debug_data)
 
+#define assert_within_epsilon_debug(x, ref, tolerance, debug_data) \
+	__assert_within_epsilon(x, ref, tolerance, tolerance, debug_data)
 /*
  * Helper for cases where we assert on time spent sleeping (directly or
  * indirectly), so make it more robust by ensuring the system sleep time
@@ -1822,7 +1836,7 @@ test_frequency(int gem_fd, unsigned int gt)
 	 * On thermally throttled devices we cannot be sure maximum frequency
 	 * can be reached so use larger tolerance downards.
 	 */
-	__assert_within_epsilon(max[0], max_freq, tolerance, 0.15f);
+	__assert_within_epsilon(max[0], max_freq, tolerance, 0.15f, no_debug_data);
 }
 
 static void
@@ -1967,7 +1981,8 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
 		}
 	}
 
-	igt_require(wait_for_rc6(fd[0], 1, pmus, test_idx));
+	igt_require_f(wait_for_rc6(fd[0], 1, pmus, test_idx),
+		      "failed to enter c6 \n%s\n", drpc = get_drpc(gem_fd, test_idx));
 
 	/* While idle check full RC6. */
 	ts[0] = pmu_read_multi(fd[0], pmus, prev);
@@ -1977,9 +1992,11 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
 	for (gt_ = 0; gt_ < pmus; gt_++) {
 		igt_debug("gt%u: idle rc6=%"PRIu64", slept=%lu, perf=%"PRIu64"\n",
 			  gt_, idle[gt_] - prev[gt_], slept, ts[1] - ts[0]);
-		assert_within_epsilon(idle[gt_] - prev[gt_],
-				      ts[1] - ts[0],
-				      tolerance);
+		drpc = get_drpc(gem_fd, gt_);
+		assert_within_epsilon_debug(idle[gt_] - prev[gt_],
+					    ts[1] - ts[0],
+					    tolerance, drpc);
+		free(drpc);
 	}
 
 	if (flags & TEST_S3) {
@@ -2005,7 +2022,8 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
 		}
 	}
 
-	igt_assert(wait_for_rc6(fd[0], 5, pmus, test_idx));
+	igt_require_f(wait_for_rc6(fd[0], 5, pmus, test_idx),
+		      "failed to enter c6 \n%s\n", drpc = get_drpc(gem_fd, test_idx));
 
 	ts[0] = pmu_read_multi(fd[0], pmus, prev);
 	slept = measured_usleep(duration_ns / 1000);
@@ -2014,9 +2032,11 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
 	for (gt_ = 0; gt_ < pmus; gt_++) {
 		igt_debug("gt%u: idle rc6=%"PRIu64", slept=%lu, perf=%"PRIu64"\n",
 			  gt_, idle[gt_] - prev[gt_], slept, ts[1] - ts[0]);
-		assert_within_epsilon(idle[gt_] - prev[gt_],
-				      ts[1] - ts[0],
-				      tolerance);
+		drpc = get_drpc(gem_fd, gt_);
+		assert_within_epsilon_debug(idle[gt_] - prev[gt_],
+					    ts[1] - ts[0],
+					    tolerance, drpc);
+		free(drpc);
 	}
 
 	/* Wake up device and check no RC6. */
@@ -2048,14 +2068,16 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
 	for (gt_ = 0; gt_ < pmus; gt_++) {
 		igt_debug("gt%u: busy rc6=%"PRIu64", slept=%lu, perf=%"PRIu64"\n",
 			  gt_, busy[gt_] - prev[gt_], slept, ts[1] - ts[0]);
+		drpc = get_drpc(gem_fd, gt_);
 		if (gt_ == test_idx || (flags & TEST_ALL))
-			assert_within_epsilon(busy[gt_] - prev[gt_],
-					      0.0,
-					      tolerance);
+			assert_within_epsilon_debug(busy[gt_] - prev[gt_],
+						    0.0,
+						    tolerance, drpc);
 		else
-			assert_within_epsilon(busy[gt_] - prev[gt_],
-					      ts[1] - ts[0],
-					      tolerance);
+			assert_within_epsilon_debug(busy[gt_] - prev[gt_],
+						    ts[1] - ts[0],
+						    tolerance, drpc);
+		free(drpc);
 	}
 }
 
@@ -2720,6 +2742,7 @@ igt_main
 	igt_fixture {
 		intel_ctx_destroy(fd, ctx);
 		drm_close_driver(fd);
+		free(drpc);
 	}
 
 	igt_subtest("module-unload") {
-- 
2.25.1
