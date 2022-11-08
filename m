Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3AC10E4F5
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Nov 2022 19:06:07 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Nov 2022 11:06:03 -0800
Message-Id: <20221108190603.2174441-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/perf_pmu: Compare against requested
 freq in frequency subtest
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

In igt@perf_pmu@frequency subtest, compare the requested freq reported by
PMU not against the set freq but against the requested freq reported in
sysfs. If requested freq differs from the set freq (even when min == max
freq) for whatever reason, the sysfs requested freq should be closer to the
PMU measured requested freq which should minimize sporadic failures.

v2: Introduce a 100 ms delay after setting freq

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6806
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/perf_pmu.c                 | 23 +++++++++++++++--------
 tests/intel-ci/fast-feedback.testlist |  1 +
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index f363db2ba13..02f6ae989b1 100644
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
@@ -1633,12 +1640,12 @@ test_frequency(int gem_fd)
 	igt_info("Max frequency: requested %.1f, actual %.1f\n",
 		 max[0], max[1]);
 
-	assert_within_epsilon(min[0], min_freq, tolerance);
+	assert_within_epsilon(min[0], min_req, tolerance);
 	/*
 	 * On thermally throttled devices we cannot be sure maximum frequency
 	 * can be reached so use larger tolerance downards.
 	 */
-	__assert_within_epsilon(max[0], max_freq, tolerance, 0.15f);
+	__assert_within_epsilon(max[0], max_req, tolerance, 0.15f);
 }
 
 static void
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index f57f8ff3be1..57cc4cf0a88 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -129,6 +129,7 @@ igt@i915_pm_rpm@basic-pci-d3-state
 igt@i915_pm_rpm@basic-rte
 igt@i915_pm_rps@basic-api
 igt@prime_self_import@basic-llseek-bad
+igt@perf_pmu@frequency
 igt@prime_self_import@basic-llseek-size
 igt@prime_self_import@basic-with_fd_dup
 igt@prime_self_import@basic-with_one_bo
-- 
2.38.0
