Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9147F10E516
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Nov 2022 21:55:01 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Nov 2022 13:54:57 -0800
Message-Id: <20221108215457.2494061-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/perf_pmu: Try to repro GL #6806
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

CI ONLY, PLEASE DON'T REVIEW

Try to repro GL #6806 and see what is really happening there since it could
not be reproduced locally. Also see if the
https://patchwork.freedesktop.org/series/110574/ will fix the issue.

v2: Introduce a 100 ms delay after setting freq
v3: Also print RP1/RPe freq (Vinay)

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6806
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf_pmu.c                 | 21 +++++++++++++++------
 tests/intel-ci/fast-feedback.testlist |  1 +
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index f363db2ba13..3bc00064878 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -1543,10 +1543,13 @@ test_interrupts_sync(int gem_fd)
 	igt_assert_lte(target, busy);
 }
 
+/* Wait for GuC SLPC freq changes to take effect */
+#define wait_freq_set()		usleep(100000)
+
 static void
 test_frequency(int gem_fd)
 {
-	uint32_t min_freq, max_freq, boost_freq;
+	uint32_t min_freq, max_freq, boost_freq, min_req, max_req;
 	uint64_t val[2], start[2], slept;
 	double min[2], max[2];
 	igt_spin_t *spin;
@@ -1572,10 +1575,11 @@ test_frequency(int gem_fd)
 	 * Set GPU to min frequency and read PMU counters.
 	 */
 	igt_require(igt_sysfs_set_u32(sysfs, "gt_min_freq_mhz", min_freq));
-	igt_require(igt_sysfs_get_u32(sysfs, "gt_min_freq_mhz") == min_freq);
 	igt_require(igt_sysfs_set_u32(sysfs, "gt_max_freq_mhz", min_freq));
-	igt_require(igt_sysfs_get_u32(sysfs, "gt_max_freq_mhz") == min_freq);
 	igt_require(igt_sysfs_set_u32(sysfs, "gt_boost_freq_mhz", min_freq));
+	wait_freq_set();
+	igt_require(igt_sysfs_get_u32(sysfs, "gt_min_freq_mhz") == min_freq);
+	igt_require(igt_sysfs_get_u32(sysfs, "gt_max_freq_mhz") == min_freq);
 	igt_require(igt_sysfs_get_u32(sysfs, "gt_boost_freq_mhz") == min_freq);
 
 	gem_quiescent_gpu(gem_fd); /* Idle to be sure the change takes effect */
@@ -1587,6 +1591,7 @@ test_frequency(int gem_fd)
 
 	min[0] = 1e9*(val[0] - start[0]) / slept;
 	min[1] = 1e9*(val[1] - start[1]) / slept;
+	min_req = igt_sysfs_get_u32(sysfs, "gt_cur_freq_mhz");
 
 	igt_spin_free(gem_fd, spin);
 	gem_quiescent_gpu(gem_fd); /* Don't leak busy bo into the next phase */
@@ -1597,11 +1602,11 @@ test_frequency(int gem_fd)
 	 * Set GPU to max frequency and read PMU counters.
 	 */
 	igt_require(igt_sysfs_set_u32(sysfs, "gt_max_freq_mhz", max_freq));
-	igt_require(igt_sysfs_get_u32(sysfs, "gt_max_freq_mhz") == max_freq);
 	igt_require(igt_sysfs_set_u32(sysfs, "gt_boost_freq_mhz", boost_freq));
-	igt_require(igt_sysfs_get_u32(sysfs, "gt_boost_freq_mhz") == boost_freq);
-
 	igt_require(igt_sysfs_set_u32(sysfs, "gt_min_freq_mhz", max_freq));
+	wait_freq_set();
+	igt_require(igt_sysfs_get_u32(sysfs, "gt_max_freq_mhz") == max_freq);
+	igt_require(igt_sysfs_get_u32(sysfs, "gt_boost_freq_mhz") == boost_freq);
 	igt_require(igt_sysfs_get_u32(sysfs, "gt_min_freq_mhz") == max_freq);
 
 	gem_quiescent_gpu(gem_fd);
@@ -1613,6 +1618,7 @@ test_frequency(int gem_fd)
 
 	max[0] = 1e9*(val[0] - start[0]) / slept;
 	max[1] = 1e9*(val[1] - start[1]) / slept;
+	max_req = igt_sysfs_get_u32(sysfs, "gt_cur_freq_mhz");
 
 	igt_spin_free(gem_fd, spin);
 	gem_quiescent_gpu(gem_fd);
@@ -1621,6 +1627,7 @@ test_frequency(int gem_fd)
 	 * Restore min/max.
 	 */
 	igt_sysfs_set_u32(sysfs, "gt_min_freq_mhz", min_freq);
+	wait_freq_set();
 	if (igt_sysfs_get_u32(sysfs, "gt_min_freq_mhz") != min_freq)
 		igt_warn("Unable to restore min frequency to saved value [%u MHz], now %u MHz\n",
 			 min_freq, igt_sysfs_get_u32(sysfs, "gt_min_freq_mhz"));
@@ -1632,6 +1639,8 @@ test_frequency(int gem_fd)
 		 min[0], min[1]);
 	igt_info("Max frequency: requested %.1f, actual %.1f\n",
 		 max[0], max[1]);
+	igt_info("Sysfs requested: min %d, max %d\n", min_req, max_req);
+	igt_info("RP1/Rpe freq: %d\n", igt_sysfs_get_u32(sysfs, "gt_RP1_freq_mhz"));
 
 	assert_within_epsilon(min[0], min_freq, tolerance);
 	/*
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index f57f8ff3be1..a2bb37fb4ae 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -128,6 +128,7 @@ igt@i915_pm_backlight@basic-brightness
 igt@i915_pm_rpm@basic-pci-d3-state
 igt@i915_pm_rpm@basic-rte
 igt@i915_pm_rps@basic-api
+igt@perf_pmu@frequency
 igt@prime_self_import@basic-llseek-bad
 igt@prime_self_import@basic-llseek-size
 igt@prime_self_import@basic-with_fd_dup
-- 
2.38.0
